DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_增加公司行为记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_AddCoAction;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_AddCoAction(
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
    declare v_busi_flag int;
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
    SET v_busi_flag = p_busi_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_deal_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* if @业务标志# = 《业务标志-公司行为红股红利》  then */
    if v_busi_flag = 2001027  then

       /* [获取表记录变量语句][清算证券_结算_公司行为表][{处理标志}][@处理标志#][{登记日期}=@登记日期# and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {本币币种}=@本币币种# and {业务标志}=《业务标志-公司行为红股红利》] */
       select deal_flag into v_deal_flag from db_clsecu.tb_clsest_co_action where reg_date=v_reg_date and exch_no=v_exch_no and stock_code_no=v_stock_code_no and crncy_type=v_crncy_type and busi_flag=2001027 limit 1;

       if FOUND_ROWS() = 0 then

            /* set @处理标志#=《处理标志-未处理》; */
            set v_deal_flag=2;

            /* [插入表记录][清算证券_结算_公司行为表][字段][字段变量][1]["公司行为表记录已存在！"] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_clsecu.tb_clsest_co_action(
                create_date, create_time, update_date, 
                update_time, update_times, exch_no, stock_code_no, 
                stock_type, asset_type, crncy_type, par_value, 
                divi_cacl_num, divi_amt, divi_qty, equity_trans_qty, 
                rights_issue_qty, placement_price, notice_date, reg_date, 
                ex_date, arrive_date, begin_trade_date, deal_flag, 
                busi_flag) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_exch_no, v_stock_code_no, 
                v_stock_type, v_asset_type, v_crncy_type, v_par_value, 
                v_divi_cacl_num, v_divi_amt, v_divi_qty, v_equity_trans_qty, 
                v_rights_issue_qty, v_placement_price, v_notice_date, v_reg_date, 
                v_ex_date, v_arrive_date, v_begin_trade_date, v_deal_flag, 
                v_busi_flag);
            if v_error_code = "1" then
                        
                SET v_error_code = "clsecuA.3.1.1";
                SET v_error_info =  CONCAT("公司行为表记录已存在！","#",v_mysql_message);
                leave label_pro;
            end if;

       else

            /* if @处理标志#=《处理标志-未处理》 then */
            if v_deal_flag=2 then

                /* [插入重复更新][清算证券_结算_公司行为表][字段][字段变量][{行为单位}=@行为单位#, {分红金额}=@分红金额#, {红股数量}=@红股数量#, {转赠数量}=@转赠数量#, {配股数量}=@配股数量#, {公告日期}=@公告日期#, {登记日期}=@登记日期#, {除权日期}=@除权日期#, {到账日期}=@到账日期#, {上市日期}=@上市日期#][2]["公司行为表记录已存在！"] */
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
                ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, divi_cacl_num=v_divi_cacl_num, divi_amt=v_divi_amt, divi_qty=v_divi_qty, equity_trans_qty=v_equity_trans_qty, rights_issue_qty=v_rights_issue_qty, notice_date=v_notice_date, reg_date=v_reg_date, ex_date=v_ex_date, arrive_date=v_arrive_date, begin_trade_date=v_begin_trade_date;
                if v_error_code = "1" then
                            
                    SET v_error_code = "clsecuA.3.1.2";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT("公司行为表记录已存在！","#",v_mysql_message);
                    else
                        SET v_error_info = "公司行为表记录已存在！";
                    end if;
                    leave label_pro;
                end if;

           end if;
       end if;

    /* elseif @业务标志# = 《业务标志-公司行为配股》  then */
    elseif v_busi_flag = 2001028  then
       #公司行为表-配股 ，处理标志每天更新为0

        /* [插入重复更新][清算证券_结算_公司行为表][字段][字段变量][{行为单位}=@行为单位#, {分红金额}=@分红金额#, {红股数量}=@红股数量#, {转赠数量}=@转赠数量#, {配股数量}=@配股数量#,{配股价格}=@配股价格#, {公告日期}=@公告日期#, {除权日期}=@除权日期#, {到账日期}=@到账日期#, {上市日期}=@上市日期#,{处理标志}=《处理标志-未处理》][2]["配股公司行为更新失败！"] */
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
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, divi_cacl_num=v_divi_cacl_num, divi_amt=v_divi_amt, divi_qty=v_divi_qty, equity_trans_qty=v_equity_trans_qty, rights_issue_qty=v_rights_issue_qty,placement_price=v_placement_price, notice_date=v_notice_date, ex_date=v_ex_date, arrive_date=v_arrive_date, begin_trade_date=v_begin_trade_date,deal_flag=2;
        if v_error_code = "1" then
                    
            SET v_error_code = "clsecuA.3.1.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("配股公司行为更新失败！","#",v_mysql_message);
            else
                SET v_error_info = "配股公司行为更新失败！";
            end if;
            leave label_pro;
        end if;

       #配股代码  不确定哪天拿到 上市日期，需要每天更新。

        /* [更新表记录][清算证券_结算_配股登记表][{上市日期}= @上市日期#][{市场编号}=@市场编号# and {证券代码编号}=@证券代码编号#][2]["配股登记表信息更新失败"] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_clsecu.tb_clsest_placement_register set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_trade_date= v_begin_trade_date where exch_no=v_exch_no and stock_code_no=v_stock_code_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "clsecuA.3.1.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("配股登记表信息更新失败","#",v_mysql_message);
            else
                SET v_error_info = "配股登记表信息更新失败";
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_修改公司行为记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_ModiCoAction;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_ModiCoAction(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_reg_date int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_crncy_type varchar(3),
    IN p_divi_cacl_num int,
    IN p_divi_amt decimal(18,4),
    IN p_divi_qty decimal(18,2),
    IN p_equity_trans_qty decimal(18,2),
    IN p_rights_issue_qty decimal(18,2),
    IN p_placement_price decimal(16,9),
    IN p_notice_date int,
    IN p_ex_date int,
    IN p_arrive_date int,
    IN p_begin_trade_date int,
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
    declare v_reg_date int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_crncy_type varchar(3);
    declare v_divi_cacl_num int;
    declare v_divi_amt decimal(18,4);
    declare v_divi_qty decimal(18,2);
    declare v_equity_trans_qty decimal(18,2);
    declare v_rights_issue_qty decimal(18,2);
    declare v_placement_price decimal(16,9);
    declare v_notice_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_busi_flag int;
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
    SET v_reg_date = p_reg_date;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_crncy_type = p_crncy_type;
    SET v_divi_cacl_num = p_divi_cacl_num;
    SET v_divi_amt = p_divi_amt;
    SET v_divi_qty = p_divi_qty;
    SET v_equity_trans_qty = p_equity_trans_qty;
    SET v_rights_issue_qty = p_rights_issue_qty;
    SET v_placement_price = p_placement_price;
    SET v_notice_date = p_notice_date;
    SET v_ex_date = p_ex_date;
    SET v_arrive_date = p_arrive_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_busi_flag = p_busi_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_结算_公司行为表][{行为单位}=@行为单位#, {分红金额}=@分红金额#, {红股数量}=@红股数量#, {转赠数量}=@转赠数量#, {配股数量}=@配股数量#, {配股价格}=@配股价格#, {公告日期}=@公告日期#, {除权日期}=@除权日期#, {到账日期}=@到账日期#, {上市日期}=@上市日期#][{登记日期}=@登记日期# and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {本币币种}=@本币币种# and {业务标志}=@业务标志#][2][@登记日期#,@证券代码编号#,@本币币种#,@业务标志#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_co_action set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, divi_cacl_num=v_divi_cacl_num, divi_amt=v_divi_amt, divi_qty=v_divi_qty, equity_trans_qty=v_equity_trans_qty, rights_issue_qty=v_rights_issue_qty, placement_price=v_placement_price, notice_date=v_notice_date, ex_date=v_ex_date, arrive_date=v_arrive_date, begin_trade_date=v_begin_trade_date where reg_date=v_reg_date and exch_no=v_exch_no and stock_code_no=v_stock_code_no and crncy_type=v_crncy_type and busi_flag=v_busi_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.2.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("登记日期=",v_reg_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type,",","业务标志=",v_busi_flag),"#",v_mysql_message);
        else
            SET v_error_info = concat("登记日期=",v_reg_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type,",","业务标志=",v_busi_flag);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_删除公司行为记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_DeleteCoAction;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_DeleteCoAction(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_reg_date int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_crncy_type varchar(3),
    IN p_busi_flag int,
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
    declare v_reg_date int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_crncy_type varchar(3);
    declare v_busi_flag int;
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
    SET v_reg_date = p_reg_date;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_crncy_type = p_crncy_type;
    SET v_busi_flag = p_busi_flag;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][清算证券_结算_公司行为表][(@登记日期#=0 or {登记日期}=@登记日期#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@本币币种#=" " or {本币币种}=@本币币种#) and (@业务标志#=" " or {业务标志}=@业务标志#) and (@记录序号#=0 or {记录序号}=@记录序号#)][3][@登记日期#,@证券代码编号#,@本币币种#,@业务标志#] */
    delete from db_clsecu.tb_clsest_co_action 
        where (v_reg_date=0 or reg_date=v_reg_date) and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_crncy_type=" " or crncy_type=v_crncy_type) and (v_busi_flag=" " or busi_flag=v_busi_flag) and (v_row_id=0 or row_id=v_row_id);
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.3.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("登记日期=",v_reg_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type,",","业务标志=",v_busi_flag),"#",v_mysql_message);
        else
            SET v_error_info = concat("登记日期=",v_reg_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type,",","业务标志=",v_busi_flag);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_查询公司行为记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_QueryCoAction;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_QueryCoAction(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_ex_date int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_crncy_type varchar(3),
    IN p_notice_date int,
    IN p_reg_date int,
    IN p_arrive_date int,
    IN p_begin_trade_date int,
    IN p_busi_flag int,
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
    declare v_ex_date int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_crncy_type varchar(3);
    declare v_notice_date int;
    declare v_reg_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_busi_flag int;
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
    SET v_ex_date = p_ex_date;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_crncy_type = p_crncy_type;
    SET v_notice_date = p_notice_date;
    SET v_reg_date = p_reg_date;
    SET v_arrive_date = p_arrive_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_busi_flag = p_busi_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_结算_公司行为表][字段][(@除权日期#=0 or {除权日期}=@除权日期#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@本币币种#=" " or {本币币种}=@本币币种#) and (@公告日期#=0 or {公告日期}=@公告日期#) and (@登记日期#=0 or {登记日期}=@登记日期#) and (@到账日期#=0 or {到账日期}=@到账日期#) and (@上市日期#=0 or {上市日期}=@上市日期#) and (@业务标志#=0 or {业务标志}=@业务标志#) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code_no, stock_type, asset_type, crncy_type, 
        par_value, divi_cacl_num, divi_amt, divi_qty, 
        equity_trans_qty, rights_issue_qty, placement_price, notice_date, 
        reg_date, ex_date, arrive_date, begin_trade_date, 
        deal_flag, busi_flag from db_clsecu.tb_clsest_co_action where (v_ex_date=0 or ex_date=v_ex_date) and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_crncy_type=" " or crncy_type=v_crncy_type) and (v_notice_date=0 or notice_date=v_notice_date) and (v_reg_date=0 or reg_date=v_reg_date) and (v_arrive_date=0 or arrive_date=v_arrive_date) and (v_begin_trade_date=0 or begin_trade_date=v_begin_trade_date) and (v_busi_flag=0 or busi_flag=v_busi_flag) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code_no, stock_type, asset_type, crncy_type, 
        par_value, divi_cacl_num, divi_amt, divi_qty, 
        equity_trans_qty, rights_issue_qty, placement_price, notice_date, 
        reg_date, ex_date, arrive_date, begin_trade_date, 
        deal_flag, busi_flag from db_clsecu.tb_clsest_co_action where (v_ex_date=0 or ex_date=v_ex_date) and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_crncy_type=" " or crncy_type=v_crncy_type) and (v_notice_date=0 or notice_date=v_notice_date) and (v_reg_date=0 or reg_date=v_reg_date) and (v_arrive_date=0 or arrive_date=v_arrive_date) and (v_begin_trade_date=0 or begin_trade_date=v_begin_trade_date) and (v_busi_flag=0 or busi_flag=v_busi_flag) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_获取公司行为记录更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_GetCoActionUpdate;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_GetCoActionUpdate(
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
    OUT p_reg_date int,
    OUT p_exch_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_par_value decimal(16,9),
    OUT p_divi_cacl_num int,
    OUT p_divi_amt decimal(18,4),
    OUT p_divi_qty decimal(18,2),
    OUT p_equity_trans_qty decimal(18,2),
    OUT p_rights_issue_qty decimal(18,2),
    OUT p_notice_date int,
    OUT p_ex_date int,
    OUT p_arrive_date int,
    OUT p_begin_trade_date int
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
    declare v_reg_date int;
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
    declare v_notice_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_placement_price decimal(16,9);
    declare v_deal_flag int;
    declare v_busi_flag int;
    declare v_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_par_value = 0;
    SET v_divi_cacl_num = 0;
    SET v_divi_amt = 0;
    SET v_divi_qty = 0;
    SET v_equity_trans_qty = 0;
    SET v_rights_issue_qty = 0;
    SET v_notice_date = date_format(curdate(),'%Y%m%d');
    SET v_ex_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_placement_price = 0;
    SET v_deal_flag = 0;
    SET v_busi_flag = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][清算证券_结算_公司行为表][字段][字段变量][{登记日期}<=@初始化日期# and {处理标志} <>《处理标志-已处理》 and {业务标志}=《业务标志-公司行为红股红利》 ][4][@登记日期#,@证券代码编号#,@本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code_no, stock_type, asset_type, crncy_type, 
        par_value, divi_cacl_num, divi_amt, divi_qty, 
        equity_trans_qty, rights_issue_qty, placement_price, notice_date, 
        reg_date, ex_date, arrive_date, begin_trade_date, 
        deal_flag, busi_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_exch_no, 
        v_stock_code_no, v_stock_type, v_asset_type, v_crncy_type, 
        v_par_value, v_divi_cacl_num, v_divi_amt, v_divi_qty, 
        v_equity_trans_qty, v_rights_issue_qty, v_placement_price, v_notice_date, 
        v_reg_date, v_ex_date, v_arrive_date, v_begin_trade_date, 
        v_deal_flag, v_busi_flag from db_clsecu.tb_clsest_co_action where reg_date<=v_init_date and deal_flag <>1 and busi_flag=2001027  limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.3.5.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("登记日期=",v_reg_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("登记日期=",v_reg_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][清算证券_结算_公司行为表][{处理标志}=《处理标志-已处理》][{记录序号}=@记录序号#][2][@登记日期#,@证券代码编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_co_action set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=1 where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.5.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("登记日期=",v_reg_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("登记日期=",v_reg_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_reg_date = v_reg_date;
    SET p_exch_no = v_exch_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_par_value = v_par_value;
    SET p_divi_cacl_num = v_divi_cacl_num;
    SET p_divi_amt = v_divi_amt;
    SET p_divi_qty = v_divi_qty;
    SET p_equity_trans_qty = v_equity_trans_qty;
    SET p_rights_issue_qty = v_rights_issue_qty;
    SET p_notice_date = v_notice_date;
    SET p_ex_date = v_ex_date;
    SET p_arrive_date = v_arrive_date;
    SET p_begin_trade_date = v_begin_trade_date;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_获取公司行为记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_GetCoAction;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_GetCoAction(
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
    OUT p_reg_date int,
    OUT p_exch_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_crncy_type varchar(3),
    OUT p_divi_cacl_num int,
    OUT p_divi_amt decimal(18,4),
    OUT p_divi_qty decimal(18,2),
    OUT p_equity_trans_qty decimal(18,2),
    OUT p_rights_issue_qty decimal(18,2),
    OUT p_notice_date int,
    OUT p_ex_date int,
    OUT p_arrive_date int,
    OUT p_begin_trade_date int
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
    declare v_reg_date int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_crncy_type varchar(3);
    declare v_divi_cacl_num int;
    declare v_divi_amt decimal(18,4);
    declare v_divi_qty decimal(18,2);
    declare v_equity_trans_qty decimal(18,2);
    declare v_rights_issue_qty decimal(18,2);
    declare v_notice_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_placement_price decimal(16,9);
    declare v_deal_flag int;
    declare v_busi_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_crncy_type = "CNY";
    SET v_divi_cacl_num = 0;
    SET v_divi_amt = 0;
    SET v_divi_qty = 0;
    SET v_equity_trans_qty = 0;
    SET v_rights_issue_qty = 0;
    SET v_notice_date = date_format(curdate(),'%Y%m%d');
    SET v_ex_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_asset_type = 0;
    SET v_par_value = 0;
    SET v_placement_price = 0;
    SET v_deal_flag = 0;
    SET v_busi_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][清算证券_结算_公司行为表][字段][字段变量][{记录序号}>@查询记录序号#][1][@登记日期#,@证券代码编号#,@本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code_no, stock_type, asset_type, crncy_type, 
        par_value, divi_cacl_num, divi_amt, divi_qty, 
        equity_trans_qty, rights_issue_qty, placement_price, notice_date, 
        reg_date, ex_date, arrive_date, begin_trade_date, 
        deal_flag, busi_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_exch_no, 
        v_stock_code_no, v_stock_type, v_asset_type, v_crncy_type, 
        v_par_value, v_divi_cacl_num, v_divi_amt, v_divi_qty, 
        v_equity_trans_qty, v_rights_issue_qty, v_placement_price, v_notice_date, 
        v_reg_date, v_ex_date, v_arrive_date, v_begin_trade_date, 
        v_deal_flag, v_busi_flag from db_clsecu.tb_clsest_co_action where row_id>v_query_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.3.6.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("登记日期=",v_reg_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("登记日期=",v_reg_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_reg_date = v_reg_date;
    SET p_exch_no = v_exch_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_crncy_type = v_crncy_type;
    SET p_divi_cacl_num = v_divi_cacl_num;
    SET p_divi_amt = v_divi_amt;
    SET p_divi_qty = v_divi_qty;
    SET p_equity_trans_qty = v_equity_trans_qty;
    SET p_rights_issue_qty = v_rights_issue_qty;
    SET p_notice_date = v_notice_date;
    SET p_ex_date = v_ex_date;
    SET p_arrive_date = v_arrive_date;
    SET p_begin_trade_date = v_begin_trade_date;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_增加机构税率记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_AddCoTaxRate;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_AddCoTaxRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_crncy_type varchar(3),
    IN p_divi_tax_rate decimal(18,12),
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
    declare v_crncy_type varchar(3);
    declare v_divi_tax_rate decimal(18,12);
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
    SET v_crncy_type = p_crncy_type;
    SET v_divi_tax_rate = p_divi_tax_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][清算证券_结算_机构税率表][字段][字段变量][1][@机构编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_co_tax_rate(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, crncy_type, 
        divi_tax_rate) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_crncy_type, 
        v_divi_tax_rate);
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.11.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_修改机构税率记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_ModiCoTaxRate;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_ModiCoTaxRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_crncy_type varchar(3),
    IN p_divi_tax_rate decimal(18,12),
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
    declare v_crncy_type varchar(3);
    declare v_divi_tax_rate decimal(18,12);
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
    SET v_co_no = p_co_no;
    SET v_crncy_type = p_crncy_type;
    SET v_divi_tax_rate = p_divi_tax_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_结算_机构税率表][{行为税率}=@行为税率#][{机构编号}=@机构编号# and {本币币种}=@本币币种#][2][@机构编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_co_tax_rate set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, divi_tax_rate=v_divi_tax_rate where co_no=v_co_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.12.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_删除机构税率记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_DeleteCoTaxRate;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_DeleteCoTaxRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    declare v_co_no int;
    declare v_crncy_type varchar(3);
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
    SET v_co_no = p_co_no;
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][清算证券_结算_机构税率表][(@机构编号#=0 or {机构编号}=@机构编号#) and (@本币币种#=" " or {本币币种}=@本币币种#) and (@记录序号#=0 or {记录序号}=@记录序号#)][1][@机构编号#,@本币币种#] */
    delete from db_clsecu.tb_clsest_co_tax_rate 
        where (v_co_no=0 or co_no=v_co_no) and (v_crncy_type=" " or crncy_type=v_crncy_type) and (v_row_id=0 or row_id=v_row_id);
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.13.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_查询机构税率记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_QueryCoTaxRate;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_QueryCoTaxRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_crncy_type varchar(3),
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
    declare v_crncy_type varchar(3);
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
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_结算_机构税率表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@本币币种#=" " or {本币币种}=@本币币种#) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        crncy_type, divi_tax_rate from db_clsecu.tb_clsest_co_tax_rate where (v_co_no=0 or co_no=v_co_no) and (v_crncy_type=" " or crncy_type=v_crncy_type) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        crncy_type, divi_tax_rate from db_clsecu.tb_clsest_co_tax_rate where (v_co_no=0 or co_no=v_co_no) and (v_crncy_type=" " or crncy_type=v_crncy_type) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_增加机构产品税率记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_AddCoProdTaxRate;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_AddCoProdTaxRate(
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
    IN p_divi_tax_rate decimal(18,12),
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
    declare v_divi_tax_rate decimal(18,12);
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
    SET v_crncy_type = p_crncy_type;
    SET v_divi_tax_rate = p_divi_tax_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][清算证券_结算_机构产品税率表][字段][字段变量][1][@产品编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_co_prod_tax_rate(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        crncy_type, divi_tax_rate) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_crncy_type, v_divi_tax_rate);
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.16.1";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_修改机构产品税率记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_ModiCoProdTaxRate;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_ModiCoProdTaxRate(
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
    IN p_divi_tax_rate decimal(18,12),
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
    declare v_divi_tax_rate decimal(18,12);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_crncy_type = p_crncy_type;
    SET v_divi_tax_rate = p_divi_tax_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_结算_机构产品税率表][{行为税率}=@行为税率#][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@本币币种#=" " or {本币币种}=@本币币种#)][2][@产品编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_co_prod_tax_rate set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, divi_tax_rate=v_divi_tax_rate where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_crncy_type=" " or crncy_type=v_crncy_type);
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.17.2";
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
use db_clsecu;;

# 原子_清算证券_结算_删除机构产品税率记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_DeleteCoProdTaxRate;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_DeleteCoProdTaxRate(
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_crncy_type varchar(3);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][清算证券_结算_机构产品税率表][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@本币币种#=" " or {本币币种}=@本币币种#) and (@记录序号#=0 or {记录序号}=@记录序号#)][3][@产品编号#,@本币币种#] */
    delete from db_clsecu.tb_clsest_co_prod_tax_rate 
        where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_crncy_type=" " or crncy_type=v_crncy_type) and (v_row_id=0 or row_id=v_row_id);
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.18.3";
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
use db_clsecu;;

# 原子_清算证券_结算_查询机构产品税率记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_QueryCoProdTaxRate;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_QueryCoProdTaxRate(
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
    declare v_crncy_type varchar(3);
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
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_结算_机构产品税率表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@本币币种#=" " or {本币币种}=@本币币种#) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, crncy_type, divi_tax_rate from db_clsecu.tb_clsest_co_prod_tax_rate where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_crncy_type=" " or crncy_type=v_crncy_type) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, crncy_type, divi_tax_rate from db_clsecu.tb_clsest_co_prod_tax_rate where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_crncy_type=" " or crncy_type=v_crncy_type) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_获取机构产品税率记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_GetCoProdTaxRate;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_GetCoProdTaxRate(
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
    OUT p_error_info varchar(255),
    OUT p_divi_tax_rate decimal(18,12)
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
    declare v_divi_tax_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_divi_tax_rate = 0;

    
    label_pro:BEGIN
    
    #获取扣税行为税率

    /* set @行为税率#=0; */
    set v_divi_tax_rate=0;

    /* [获取表记录变量语句][清算证券_结算_机构产品税率表][{行为税率}][@行为税率#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {本币币种}=@本币币种#] */
    select divi_tax_rate into v_divi_tax_rate from db_clsecu.tb_clsest_co_prod_tax_rate where co_no=v_co_no and pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;

    if FOUND_ROWS() = 0 then

        /* [获取表记录变量语句][清算证券_结算_机构税率表][{行为税率}][@行为税率#][{机构编号}=@机构编号# and {本币币种}=@本币币种#] */
        select divi_tax_rate into v_divi_tax_rate from db_clsecu.tb_clsest_co_tax_rate where co_no=v_co_no and crncy_type=v_crncy_type limit 1;

    end if;

    /* if isnull(@行为税率#) then */
    if isnull(v_divi_tax_rate) then

        /* set @行为税率#=0; */
        set v_divi_tax_rate=0;
    end if;
    #为避免行为税率设置错误，如超过1，则强制置为1

    /* if @行为税率#>1 then */
    if v_divi_tax_rate>1 then

        /* set @行为税率#=1; */
        set v_divi_tax_rate=1;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_divi_tax_rate = v_divi_tax_rate;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_转入新股中签记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_AddNewShares;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_AddNewShares(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_order_dir int,
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_match_status varchar(2);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_strike_date = p_strike_date;
    SET v_strike_no = p_strike_no;
    SET v_order_dir = p_order_dir;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_match_status = "0";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #先检查历史表是否已经存在，存在就不处理了

    /* [记录已存在][历史_清算证券_结算_新股中签表][@记录个数#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][1][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    select count(1) into v_record_count from db_clsecu_his.tb_clsest_new_shares_his where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "clsecuA.3.21.1";
        SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        leave label_pro;
    end if;

    #配对状态，'0'为未配对，'1'为已配对

    /* set @配对状态# = 《配对状态-未配对》; */
    set v_match_status = "2";

    /* [插入重复更新][清算证券_结算_新股中签表][字段][字段变量][{成交日期}=@成交日期#,{成交编号}=@成交编号#,{订单方向}=@订单方向#,{成交价格}=@成交价格#,{成交数量}=@成交数量#,{成交金额}=@成交金额#][1][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_new_shares (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, strike_date, 
        strike_no, order_dir, strike_price, strike_qty, 
        strike_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_type, v_strike_date, 
        v_strike_no, v_order_dir, v_strike_price, v_strike_qty, 
        v_strike_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, strike_date=v_strike_date,strike_no=v_strike_no,order_dir=v_order_dir,strike_price=v_strike_price,strike_qty=v_strike_qty,strike_amt=v_strike_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    #[插入表记录][清算证券_结算_新股中签表][字段][字段变量][1][@资产账户编号#,@股东代码编号#,@证券代码编号#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_修改新股中签记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_ModiNewShares;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_ModiNewShares(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_order_dir int,
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_no = p_strike_no;
    SET v_order_dir = p_order_dir;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_结算_新股中签表][{成交日期}=@成交日期#,{成交编号}=@成交编号#,{订单方向}=@订单方向#,{成交价格}=@成交价格#,{成交数量}=@成交数量#,{成交金额}=@成交金额#][{记录序号}=@记录序号# or {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][2][@记录序号#,@资产账户编号#,@股东代码编号#,@证券代码编号#]] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_new_shares set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_date=v_strike_date,strike_no=v_strike_no,order_dir=v_order_dir,strike_price=v_strike_price,strike_qty=v_strike_qty,strike_amt=v_strike_amt where row_id=v_row_id or asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_删除新股中签记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_DeleteNewShares;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_DeleteNewShares(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    SET v_row_id = p_row_id;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][清算证券_结算_新股中签表][{记录序号}=@记录序号# or {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][3][@记录序号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    delete from db_clsecu.tb_clsest_new_shares 
        where row_id=v_row_id or asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.23.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_查询新股中签记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_QueryNewShares;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_QueryNewShares(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_order_dir_str varchar(1024),
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir_str varchar(1024);
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code varchar(6);
    declare v_exch_group_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_no = p_strike_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code = " ";
    SET v_exch_group_no_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_结算_新股中签表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@成交日期#=0 or {成交日期}=@成交日期#) and (@成交编号#=0 or {成交编号}>@成交编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#) and (@证券代码#=0 or {证券代码编号}=@证券代码编号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt from db_clsecu.tb_clsest_new_shares where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_strike_date=0 or strike_date=v_strike_date) and (v_strike_no=0 or strike_no>v_strike_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code=0 or stock_code_no=v_stock_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt from db_clsecu.tb_clsest_new_shares where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_strike_date=0 or strike_date=v_strike_date) and (v_strike_no=0 or strike_no>v_strike_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code=0 or stock_code_no=v_stock_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_获取新股中签记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_GetNewShares;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_GetNewShares(
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
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_strike_date int,
    OUT p_strike_no varchar(64),
    OUT p_order_dir int,
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4)
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_no = " ";
    SET v_order_dir = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][清算证券_结算_新股中签表][字段][字段变量][{记录序号}=@查询记录序号#][1][@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_stock_type, 
        v_strike_date, v_strike_no, v_order_dir, v_strike_price, 
        v_strike_qty, v_strike_amt from db_clsecu.tb_clsest_new_shares where row_id=v_query_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.3.25.1";
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
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_strike_date = v_strike_date;
    SET p_strike_no = v_strike_no;
    SET p_order_dir = v_order_dir;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_查询历史新股中签记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_QueryNewShares_His;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_QueryNewShares_His(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_strike_no varchar(64),
    IN p_order_dir_str varchar(1024),
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_no varchar(64);
    declare v_order_dir_str varchar(1024);
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_strike_no = p_strike_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_清算证券_结算_新股中签表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and ({成交日期} between @开始日期# and @结束日期#) and (@成交编号#=0 or {成交编号}>@成交编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt from db_clsecu_his.tb_clsest_new_shares_his where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (strike_date between v_begin_date and v_end_date) and (v_strike_no=0 or strike_no>v_strike_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt from db_clsecu_his.tb_clsest_new_shares_his where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (strike_date between v_begin_date and v_end_date) and (v_strike_no=0 or strike_no>v_strike_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_转入可转债中签记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_AddConvertibleBondShares;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_AddConvertibleBondShares(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_order_dir int,
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_match_status varchar(2);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_strike_date = p_strike_date;
    SET v_strike_no = p_strike_no;
    SET v_order_dir = p_order_dir;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_match_status = "0";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #先检查历史表是否已经存在，存在就不处理了

    /* [记录已存在][历史_清算证券_结算_可转债中签表][@记录个数#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][1][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    select count(1) into v_record_count from db_clsecu_his.tb_clsest_convertible_bond_shares_his where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "clsecuA.3.27.1";
        SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        leave label_pro;
    end if;

    #配对状态，'0'为未配对，'1'为已配对

    /* set @配对状态# = 《配对状态-未配对》; */
    set v_match_status = "2";

    /* [插入表记录][清算证券_结算_可转债中签表][字段][字段变量][1][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_convertible_bond_shares(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, strike_date, 
        strike_no, order_dir, strike_price, strike_qty, 
        strike_amt) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_type, v_strike_date, 
        v_strike_no, v_order_dir, v_strike_price, v_strike_qty, 
        v_strike_amt);
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.27.1";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_修改可转债中签记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_ModiConvertibleBondShares;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_ModiConvertibleBondShares(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_order_dir int,
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_no = p_strike_no;
    SET v_order_dir = p_order_dir;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_结算_可转债中签表][{成交日期}=@成交日期#,{成交编号}=@成交编号#,{订单方向}=@订单方向#,{成交价格}=@成交价格#,{成交数量}=@成交数量#,{成交金额}=@成交金额#][{记录序号}=@记录序号# or {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][2][@记录序号#,@资产账户编号#,@股东代码编号#,@证券代码编号#]] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_convertible_bond_shares set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_date=v_strike_date,strike_no=v_strike_no,order_dir=v_order_dir,strike_price=v_strike_price,strike_qty=v_strike_qty,strike_amt=v_strike_amt where row_id=v_row_id or asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.28.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_删除可转债中签记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_DeleteConvertibleBondShares;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_DeleteConvertibleBondShares(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    SET v_row_id = p_row_id;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][清算证券_结算_可转债中签表][{记录序号}=@记录序号# or {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][3][@记录序号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    delete from db_clsecu.tb_clsest_convertible_bond_shares 
        where row_id=v_row_id or asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.29.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_获取可转债中签记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_GetConvertibleBondShares;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_GetConvertibleBondShares(
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
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_strike_date int,
    OUT p_strike_no varchar(64),
    OUT p_order_dir int,
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4)
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_no = " ";
    SET v_order_dir = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][清算证券_结算_可转债中签表][字段][字段变量][{记录序号}=@查询记录序号#][1][@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_stock_type, 
        v_strike_date, v_strike_no, v_order_dir, v_strike_price, 
        v_strike_qty, v_strike_amt from db_clsecu.tb_clsest_convertible_bond_shares where row_id=v_query_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.3.30.1";
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
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_strike_date = v_strike_date;
    SET p_strike_no = v_strike_no;
    SET p_order_dir = v_order_dir;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_查询可转债中签记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_QueryConvertibleBondShares;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_QueryConvertibleBondShares(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_order_dir_str varchar(1024),
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir_str varchar(1024);
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code varchar(6);
    declare v_exch_group_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_no = p_strike_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code = " ";
    SET v_exch_group_no_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_结算_可转债中签表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@成交日期#=0 or {成交日期}=@成交日期#) and (@成交编号#=0 or {成交编号}>@成交编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#) and (@证券代码#=0 or {证券代码编号}=@证券代码编号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt from db_clsecu.tb_clsest_convertible_bond_shares where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_strike_date=0 or strike_date=v_strike_date) and (v_strike_no=0 or strike_no>v_strike_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code=0 or stock_code_no=v_stock_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt from db_clsecu.tb_clsest_convertible_bond_shares where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_strike_date=0 or strike_date=v_strike_date) and (v_strike_no=0 or strike_no>v_strike_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code=0 or stock_code_no=v_stock_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_查询历史可转债中签记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_QueryConvertibleBondShares_His;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_QueryConvertibleBondShares_His(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_strike_no varchar(64),
    IN p_order_dir_str varchar(1024),
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_no varchar(64);
    declare v_order_dir_str varchar(1024);
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_strike_no = p_strike_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_清算证券_结算_可转债中签表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and ({成交日期} between @开始日期# and @结束日期#) and (@成交编号#=0 or {成交编号}>@成交编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt from db_clsecu_his.tb_clsest_convertible_bond_shares_his where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (strike_date between v_begin_date and v_end_date) and (v_strike_no=0 or strike_no>v_strike_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt from db_clsecu_his.tb_clsest_convertible_bond_shares_his where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (strike_date between v_begin_date and v_end_date) and (v_strike_no=0 or strike_no>v_strike_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_转入新股申购记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_AddNewReport;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_AddNewReport(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_order_dir int,
    IN p_nav_asset decimal(18,4),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_stock_type int,
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
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_order_dir int;
    declare v_nav_asset decimal(18,4);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_deal_flag int;
    declare v_dist_qty int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_dir = p_order_dir;
    SET v_nav_asset = p_nav_asset;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_deal_flag = 0;
    SET v_dist_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @处理标志# = 《处理标志-未处理》; */
    set v_deal_flag = 2;

    /* set @分配数量# = 0; */
    set v_dist_qty = 0;

    /* [插入表记录][清算证券_结算_新股申购表][字段][字段变量][1]["新股申购记录已存在！"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_new_report(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, crncy_type, 
        exch_crncy_type, exch_rate, exch_no, stock_acco_no, 
        stock_code_no, stock_type, dist_qty, nav_asset, 
        deal_flag, trade_code_no, target_code_no) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
        v_exch_crncy_type, v_exch_rate, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_type, v_dist_qty, v_nav_asset, 
        v_deal_flag, v_trade_code_no, v_target_code_no);
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.33.1";
        SET v_error_info =  CONCAT("新股申购记录已存在！","#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_查询新股申购记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_QueryNewReport;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_QueryNewReport(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_deal_flag int,
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_deal_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco varchar(16);
    declare v_stock_acco varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_deal_flag = p_deal_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco = " ";
    SET v_stock_acco = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_结算_新股申购表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户#编号) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@股东代码编号#=0 or {股东代码编号}=@股东代码#编号) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@处理标志#=0 or {处理标志}=@处理标志#) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, dist_qty, 
        nav_asset, deal_flag, trade_code_no, target_code_no from db_clsecu.tb_clsest_new_report where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco编号) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco编号) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_deal_flag=0 or deal_flag=v_deal_flag) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, dist_qty, 
        nav_asset, deal_flag, trade_code_no, target_code_no from db_clsecu.tb_clsest_new_report where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco编号) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco编号) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_deal_flag=0 or deal_flag=v_deal_flag) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_获取新股申购记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_GetNewReport;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_GetNewReport(
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
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_order_dir int,
    OUT p_nav_asset decimal(18,4),
    OUT p_trade_code_no int,
    OUT p_target_code_no int
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_order_dir int;
    declare v_nav_asset decimal(18,4);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_stock_type int;
    declare v_dist_qty int;
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_order_dir = 0;
    SET v_nav_asset = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_stock_type = 0;
    SET v_dist_qty = 0;
    SET v_deal_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][清算证券_结算_新股申购表][字段][字段变量][{记录序号}=@查询记录序号#][1]["获取新股申购记录错误！"] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, dist_qty, 
        nav_asset, deal_flag, trade_code_no, target_code_no into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_crncy_type, v_exch_crncy_type, v_exch_rate, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_type, v_dist_qty, 
        v_nav_asset, v_deal_flag, v_trade_code_no, v_target_code_no from db_clsecu.tb_clsest_new_report where row_id=v_query_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.3.35.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("获取新股申购记录错误！","#",v_mysql_message);
        else
            SET v_error_info = "获取新股申购记录错误！";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_order_dir = v_order_dir;
    SET p_nav_asset = v_nav_asset;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_查询新股申购中签记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_QueryNewReportShares;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_QueryNewReportShares(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_deal_flag int,
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_deal_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco varchar(16);
    declare v_stock_acco varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_deal_flag = p_deal_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco = " ";
    SET v_stock_acco = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_清算证券_结算_新股申购表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户#编号) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@股东代码编号#=0 or {股东代码编号}=@股东代码#编号) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@处理标志#=0 or {处理标志}=@处理标志#) and (@记录序号#=0 or {记录序号}>@记录序号#) and ({分配数量} > 0) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, dist_qty, 
        nav_asset, deal_flag, trade_code_no, target_code_no from db_clsecu_his.tb_clsest_new_report_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco编号) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco编号) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_deal_flag=0 or deal_flag=v_deal_flag) and (v_row_id=0 or row_id>v_row_id) and (dist_qty > 0) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, dist_qty, 
        nav_asset, deal_flag, trade_code_no, target_code_no from db_clsecu_his.tb_clsest_new_report_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco编号) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco编号) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_deal_flag=0 or deal_flag=v_deal_flag) and (v_row_id=0 or row_id>v_row_id) and (dist_qty > 0) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_增加回购记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_AddRepurchase;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_AddRepurchase(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_order_dir int,
    IN p_repo_qty decimal(18,2),
    IN p_repo_amt decimal(18,4),
    IN p_repo_rate decimal(18,12),
    IN p_repo_trade_date int,
    IN p_repo_order_id bigint,
    IN p_repo_strike_id bigint,
    IN p_intrst_days int,
    IN p_repo_cale_days int,
    IN p_repo_back_date int,
    IN p_repo_back_trade_date int,
    IN p_repo_back_amt decimal(18,4),
    IN p_repo_back_intrst decimal(18,4),
    IN p_repo_status varchar(2),
    IN p_busi_flag int,
    IN p_trade_code_no int,
    IN p_target_code_no int,
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
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_repo_qty decimal(18,2);
    declare v_repo_amt decimal(18,4);
    declare v_repo_rate decimal(18,12);
    declare v_repo_trade_date int;
    declare v_repo_order_id bigint;
    declare v_repo_strike_id bigint;
    declare v_intrst_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_repo_back_trade_date int;
    declare v_repo_back_amt decimal(18,4);
    declare v_repo_back_intrst decimal(18,4);
    declare v_repo_status varchar(2);
    declare v_busi_flag int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_strike_date = p_strike_date;
    SET v_strike_no = p_strike_no;
    SET v_order_dir = p_order_dir;
    SET v_repo_qty = p_repo_qty;
    SET v_repo_amt = p_repo_amt;
    SET v_repo_rate = p_repo_rate;
    SET v_repo_trade_date = p_repo_trade_date;
    SET v_repo_order_id = p_repo_order_id;
    SET v_repo_strike_id = p_repo_strike_id;
    SET v_intrst_days = p_intrst_days;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_repo_back_trade_date = p_repo_back_trade_date;
    SET v_repo_back_amt = p_repo_back_amt;
    SET v_repo_back_intrst = p_repo_back_intrst;
    SET v_repo_status = p_repo_status;
    SET v_busi_flag = p_busi_flag;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][清算证券_结算_回购表][字段][字段变量][1][@资产账户编号#,@市场编号#,@成交日期#,@成交编号#,@订单方向#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_repurchase(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, crncy_type, 
        exch_crncy_type, exch_rate, exch_no, stock_acco_no, 
        stock_code_no, stock_type, strike_date, strike_no, 
        order_dir, repo_qty, repo_amt, repo_rate, 
        repo_trade_date, repo_order_id, repo_strike_id, intrst_days, 
        repo_cale_days, repo_back_date, repo_back_trade_date, repo_back_amt, 
        repo_back_intrst, repo_status, busi_flag, trade_code_no, 
        target_code_no) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
        v_exch_crncy_type, v_exch_rate, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_type, v_strike_date, v_strike_no, 
        v_order_dir, v_repo_qty, v_repo_amt, v_repo_rate, 
        v_repo_trade_date, v_repo_order_id, v_repo_strike_id, v_intrst_days, 
        v_repo_cale_days, v_repo_back_date, v_repo_back_trade_date, v_repo_back_amt, 
        v_repo_back_intrst, v_repo_status, v_busi_flag, v_trade_code_no, 
        v_target_code_no);
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.41.1";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_查询回购记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_QueryRepurchase;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_QueryRepurchase(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_order_dir_str varchar(1024),
    IN p_repo_status_str varchar(64),
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_order_dir_str varchar(1024);
    declare v_repo_status_str varchar(64);
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_repo_status_str = p_repo_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_结算_回购表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@回购处理状态串#=" " or instr(@回购处理状态串#, concat(";",{回购处理状态},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, strike_date, 
        strike_no, order_dir, repo_qty, repo_amt, 
        repo_rate, repo_trade_date, repo_order_id, repo_strike_id, 
        intrst_days, repo_cale_days, repo_back_date, repo_back_trade_date, 
        repo_back_amt, repo_back_intrst, repo_status, busi_flag, 
        trade_code_no, target_code_no from db_clsecu.tb_clsest_repurchase where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_repo_status_str=" " or instr(v_repo_status_str, concat(";",repo_status,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, strike_date, 
        strike_no, order_dir, repo_qty, repo_amt, 
        repo_rate, repo_trade_date, repo_order_id, repo_strike_id, 
        intrst_days, repo_cale_days, repo_back_date, repo_back_trade_date, 
        repo_back_amt, repo_back_intrst, repo_status, busi_flag, 
        trade_code_no, target_code_no from db_clsecu.tb_clsest_repurchase where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_repo_status_str=" " or instr(v_repo_status_str, concat(";",repo_status,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_回购购回处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_RepurchaseReal;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_RepurchaseReal(
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_repo_qty decimal(18,2);
    declare v_repo_amt decimal(18,4);
    declare v_repo_rate decimal(18,12);
    declare v_repo_trade_date int;
    declare v_repo_order_id bigint;
    declare v_repo_strike_id bigint;
    declare v_intrst_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_repo_back_trade_date int;
    declare v_repo_back_amt decimal(18,4);
    declare v_repo_back_intrst decimal(18,4);
    declare v_repo_status varchar(2);
    declare v_busi_flag int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_undo_status varchar(2);
    declare v_entry_status varchar(2);
    declare v_entry_date int;
    declare v_deli_jour_no bigint;
    declare v_asset_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_no = " ";
    SET v_order_dir = 0;
    SET v_repo_qty = 0;
    SET v_repo_amt = 0;
    SET v_repo_rate = 0;
    SET v_repo_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_repo_order_id = 0;
    SET v_repo_strike_id = 0;
    SET v_intrst_days = 0;
    SET v_repo_cale_days = 0;
    SET v_repo_back_date = 0;
    SET v_repo_back_trade_date = 0;
    SET v_repo_back_amt = 0;
    SET v_repo_back_intrst = 0;
    SET v_repo_status = "0";
    SET v_busi_flag = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_impawn_ratio = 0;
    SET v_bond_accr_intrst = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_undo_status = "0";
    SET v_entry_status = "0";
    SET v_entry_date = date_format(curdate(),'%Y%m%d');
    SET v_deli_jour_no = 0;
    SET v_asset_type = 0;

    
    label_pro:BEGIN
    

    /* [声明游标][清算证券_结算_回购表][字段][{回购到期日期}<=@初始化日期# and {回购处理状态}=《回购处理状态-未处理》][cursor_secu_repurchase] */
    cursor_secu_repurchase:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_secu_repurchase CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, strike_date, 
        strike_no, order_dir, repo_qty, repo_amt, 
        repo_rate, repo_trade_date, repo_order_id, repo_strike_id, 
        intrst_days, repo_cale_days, repo_back_date, repo_back_trade_date, 
        repo_back_amt, repo_back_intrst, repo_status, busi_flag, 
        trade_code_no, target_code_no 
        from db_clsecu.tb_clsest_repurchase 
        where repo_back_date<=v_init_date and repo_status="2";
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_secu_repurchase][loop_secu_repurchase] */
    open cursor_secu_repurchase;
    loop_secu_repurchase: LOOP
    fetch cursor_secu_repurchase into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_crncy_type, v_exch_crncy_type, v_exch_rate, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_type, v_strike_date, 
        v_strike_no, v_order_dir, v_repo_qty, v_repo_amt, 
        v_repo_rate, v_repo_trade_date, v_repo_order_id, v_repo_strike_id, 
        v_intrst_days, v_repo_cale_days, v_repo_back_date, v_repo_back_trade_date, 
        v_repo_back_amt, v_repo_back_intrst, v_repo_status, v_busi_flag, 
        v_trade_code_no, v_target_code_no;
        IF v_cursor_done THEN
            LEAVE loop_secu_repurchase;
        END IF;

        #计算回购购回金额及利息

        /* set @回购购回金额#=@回购金额#; */
        set v_repo_back_amt=v_repo_amt;

        /* if @市场编号# = 《市场编号-上海证券交易所》 then */
        if v_exch_no = 1 then

            /* set @回购购回利息#=@回购金额#*@回购利率#*@计息天数#/36000; */
            set v_repo_back_intrst=v_repo_amt*v_repo_rate*v_intrst_days/36000;

        /* elseif @市场编号# = 《市场编号-深圳证券交易所》 then */
        elseif v_exch_no = 2 then

            /* set @回购购回利息#=@回购金额#*@回购利率#*@计息天数#/36500; */
            set v_repo_back_intrst=v_repo_amt*v_repo_rate*v_intrst_days/36500;
        end if;

        /* set @实际回购到期日期#=@初始化日期#; */
        set v_repo_back_trade_date=v_init_date;

        /* set @回购实际天数#=@实际回购到期日期#-@回购交易日期#; */
        set v_repo_cale_days=v_repo_back_trade_date-v_repo_trade_date;

        /* if @订单方向# = 《订单方向-融资回购》 then */
        if v_order_dir = 3 then
            #需要解冻标准券数量

            /* set @待入账数量# = @回购数量#; */
            set v_pre_entry_qty = v_repo_qty;

            /* set @待入账金额# = -@回购购回利息#; */
            set v_pre_entry_amt = -v_repo_back_intrst;

        /* elseif @订单方向# = 《订单方向-融券回购》 then */
        elseif v_order_dir = 4 then

            /* set @待入账数量# = - @回购数量#; */
            set v_pre_entry_qty = - v_repo_qty;

            /* set @待入账金额# = @回购金额# + @回购购回利息#; */
            set v_pre_entry_amt = v_repo_amt + v_repo_back_intrst;
        end if;
        #初始化待入账记录表的相关字段

        /* set @成交价格#=@回购利率#; */
        set v_strike_price=v_repo_rate;

        /* set @成交数量#=@回购数量#; */
        set v_strike_qty=v_repo_qty;

        /* set @成交金额#=@回购金额#; */
        set v_strike_amt=v_repo_amt;

        /* set @质押比例#=0; */
        set v_impawn_ratio=0;

        /* set @债券计提利息#=0; */
        set v_bond_accr_intrst=0;

        /* set @入账资金流水号#=0; */
        set v_entry_money_jour_no=0;

        /* set @入账交易组持仓流水号#=0; */
        set v_entry_exgp_posi_jour_no=0;

        /* set @入账资产账户持仓流水号#=0; */
        set v_entry_asac_posi_jour_no=0;

        /* set @回滚状态#=《回滚状态-未回滚》; */
        set v_undo_status="2";

        /* set @入账状态#=《入账状态-未入账》; */
        set v_entry_status="2";
        #对资金处理取2位小数

        /* set @待入账金额# = round(@待入账金额#, 2); */
        set v_pre_entry_amt = round(v_pre_entry_amt, 2);

        /* set @成交金额# = round(@成交金额#, 2); */
        set v_strike_amt = round(v_strike_amt, 2);

        /* set @回购购回利息# = round(@回购购回利息#, 2); */
        set v_repo_back_intrst = round(v_repo_back_intrst, 2);

        /* set @回购购回金额# = round(@回购购回金额#, 2); */
        set v_repo_back_amt = round(v_repo_back_amt, 2);
        #业务标志根据规则，购回的业务在原业务标志上加2，回购变成购回

        /* set @业务标志# = @业务标志# + 2; */
        set v_busi_flag = v_busi_flag + 2;

        /* set @回购处理状态#=《回购处理状态-已处理》; */
        set v_repo_status="1";

        /* [更新表记录][清算证券_结算_回购表][{回购实际天数}=@回购实际天数#,{回购到期日期}=@回购到期日期#,{实际回购到期日期}=@实际回购到期日期#,{回购购回金额}=@回购购回金额#,{回购购回利息}=@回购购回利息#,{回购处理状态}=@回购处理状态#][{资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {成交日期}=@成交日期# and {成交编号}=@成交编号# and {订单方向}=@订单方向#][2][@资产账户编号#,@市场编号#,@成交日期#,@成交编号#,@订单方向#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_clsecu.tb_clsest_repurchase set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, repo_cale_days=v_repo_cale_days,repo_back_date=v_repo_back_date,repo_back_trade_date=v_repo_back_trade_date,repo_back_amt=v_repo_back_amt,repo_back_intrst=v_repo_back_intrst,repo_status=v_repo_status where asset_acco_no=v_asset_acco_no and exch_no=v_exch_no and strike_date=v_strike_date and strike_no=v_strike_no and order_dir=v_order_dir;
        if v_error_code = "1" then
                    
            SET v_error_code = "clsecuA.3.47.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","订单方向=",v_order_dir);
            end if;
            close cursor_secu_repurchase;
            leave label_pro;
        end if;


        /* set @入账日期#=@初始化日期#; */
        set v_entry_date=v_init_date;

        /* set @对账流水号#=0; */
        set v_deli_jour_no=0;

        /* set @资产类型# =1; */
        set v_asset_type =1;

        /* [插入表记录][清算证券_结算_待入账记录表][字段][字段变量][2]["待入账记录已存在！"] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_clsecu.tb_clsest_preentry(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, crncy_type, 
            exch_crncy_type, exch_rate, exch_no, stock_acco_no, 
            stock_code_no, stock_type, asset_type, order_dir, 
            pre_entry_qty, pre_entry_amt, busi_flag, entry_status, 
            undo_status, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
            trade_code_no, target_code_no, intrst_days, bond_accr_intrst, 
            impawn_ratio, repo_back_date) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
            v_exch_crncy_type, v_exch_rate, v_exch_no, v_stock_acco_no, 
            v_stock_code_no, v_stock_type, v_asset_type, v_order_dir, 
            v_pre_entry_qty, v_pre_entry_amt, v_busi_flag, v_entry_status, 
            v_undo_status, v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, 
            v_trade_code_no, v_target_code_no, v_intrst_days, v_bond_accr_intrst, 
            v_impawn_ratio, v_repo_back_date);
        if v_error_code = "1" then
                    
            SET v_error_code = "clsecuA.3.47.2";
            SET v_error_info =  CONCAT("待入账记录已存在！","#",v_mysql_message);
            close cursor_secu_repurchase;
            leave label_pro;
        end if;


    /* [关闭游标][cursor_secu_repurchase] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_secu_repurchase;
    end cursor_secu_repurchase;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_计算结算资金持仓数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_SettleCapitalStockCacl;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_SettleCapitalStockCacl(
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
    IN p_divi_cacl_num int,
    IN p_par_value decimal(16,9),
    IN p_divi_amt decimal(18,4),
    IN p_divi_qty decimal(18,2),
    IN p_equity_trans_qty decimal(18,2),
    IN p_rights_issue_qty decimal(18,2),
    IN p_curr_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4)
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
    declare v_divi_cacl_num int;
    declare v_par_value decimal(16,9);
    declare v_divi_amt decimal(18,4);
    declare v_divi_qty decimal(18,2);
    declare v_equity_trans_qty decimal(18,2);
    declare v_rights_issue_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_tmp_divi_qty decimal(18,2);
    declare v_tmp_equity_trans_qty decimal(18,2);
    declare v_divi_tax_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_divi_cacl_num = p_divi_cacl_num;
    SET v_par_value = p_par_value;
    SET v_divi_amt = p_divi_amt;
    SET v_divi_qty = p_divi_qty;
    SET v_equity_trans_qty = p_equity_trans_qty;
    SET v_rights_issue_qty = p_rights_issue_qty;
    SET v_curr_qty = p_curr_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_tmp_divi_qty = 0;
    SET v_tmp_equity_trans_qty = 0;
    SET v_divi_tax_rate = 0;

    
    label_pro:BEGIN
    
    #计算需分配的金额和数量

    /* set @待入账金额#=@当前数量#/@行为单位#*@分红金额#; */
    set v_pre_entry_amt=v_curr_qty/v_divi_cacl_num*v_divi_amt;

    /* set @临时_红股数量#=@当前数量#/@行为单位#*@红股数量#; */
    set v_tmp_divi_qty=v_curr_qty/v_divi_cacl_num*v_divi_qty;

    /* set @临时_转赠数量#=@当前数量#/@行为单位#*@转赠数量#; */
    set v_tmp_equity_trans_qty=v_curr_qty/v_divi_cacl_num*v_equity_trans_qty;
    #先把待入账数量保存到临时变量中，后续红股入账时能从此读回来

    /* set @待入账数量#=@临时_红股数量# + @临时_转赠数量#; */
    set v_pre_entry_qty=v_tmp_divi_qty + v_tmp_equity_trans_qty;
    #获取扣税行为税率

    /* set @行为税率#=0; */
    set v_divi_tax_rate=0;

    /* [获取表记录变量语句][清算证券_结算_机构产品税率表][{行为税率}][@行为税率#][{产品编号}=@产品编号# and {本币币种}=@本币币种#] */
    select divi_tax_rate into v_divi_tax_rate from db_clsecu.tb_clsest_co_prod_tax_rate where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;

    if FOUND_ROWS() = 0 then

        /* [获取表记录变量语句][清算证券_结算_机构税率表][{行为税率}][@行为税率#][{机构编号}=@机构编号# and {本币币种}=@本币币种#] */
        select divi_tax_rate into v_divi_tax_rate from db_clsecu.tb_clsest_co_tax_rate where co_no=v_co_no and crncy_type=v_crncy_type limit 1;

    end if;

    /* if isnull(@行为税率#) then */
    if isnull(v_divi_tax_rate) then

        /* set @行为税率#=0; */
        set v_divi_tax_rate=0;
    end if;
    #为避免行为税率设置错误，如超过1，则强制置为1

    /* if @行为税率#>1 then */
    if v_divi_tax_rate>1 then

        /* set @行为税率#=1; */
        set v_divi_tax_rate=1;
    end if;
    #计算扣税后待入账金额，红股按票面面值计算价值

    /* set @待入账金额# = @待入账金额#*(1-@行为税率#)-@临时_红股数量#*@票面面值#*@行为税率#; */
    set v_pre_entry_amt = v_pre_entry_amt*(1-v_divi_tax_rate)-v_tmp_divi_qty*v_par_value*v_divi_tax_rate;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_资金记录处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_CapitalJourDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_CapitalJourDeal(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_impawn_ratio decimal(18,12),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_divi_qty decimal(18,2),
    IN p_pre_entry_amt decimal(18,4),
    IN p_reg_date int,
    IN p_ex_date int,
    IN p_arrive_date int,
    IN p_begin_trade_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_divi_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_reg_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_flag int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_trade_code_no int;
    declare v_undo_status varchar(2);
    declare v_entry_status varchar(2);
    declare v_intrst_pandl decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_divi_qty = p_divi_qty;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_reg_date = p_reg_date;
    SET v_ex_date = p_ex_date;
    SET v_arrive_date = p_arrive_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_flag = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_no = " ";
    SET v_order_dir = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_bond_accr_intrst = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_trade_code_no = 0;
    SET v_undo_status = "0";
    SET v_entry_status = "0";
    SET v_intrst_pandl = 0;
    SET v_pre_entry_qty = 0;
    SET v_act_record_flag = 0;
    SET v_acco_entry_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #红利的到期日期以除权日期为准，红股的到账日期保持不变

    /* set @到账日期# = @除权日期#; */
    set v_arrive_date = v_ex_date;
    #初始化证券结算表的相关字段

    /* set @成交日期#=@初始化日期#; */
    set v_strike_date=v_init_date;

    /* set @成交编号#=0; */
    set v_strike_no=0;

    /* set @订单方向#=0; */
    set v_order_dir=0;

    /* set @成交价格#=0; */
    set v_strike_price=0;

    /* set @成交数量#=0; */
    set v_strike_qty=0;

    /* set @成交金额#=0; */
    set v_strike_amt=0;

    /* set @债券计提利息#=0; */
    set v_bond_accr_intrst=0;

    /* set @入账资金流水号#=0; */
    set v_entry_money_jour_no=0;

    /* set @入账交易组持仓流水号#=0; */
    set v_entry_exgp_posi_jour_no=0;

    /* set @入账资产账户持仓流水号#=0; */
    set v_entry_asac_posi_jour_no=0;

    /* set @交易代码编号# = @证券代码编号#; */
    set v_trade_code_no = v_stock_code_no;

    /* set @回滚状态#=《回滚状态-未回滚》; */
    set v_undo_status="2";

    /* set @入账状态#=《入账状态-未入账》; */
    set v_entry_status="2";
    #红利入账

    /* if @证券类型#>20 and @证券类型#<50 then */
    if v_stock_type>20 and v_stock_type<50 then

        /* set @利息收益#=@待入账金额#; */
        set v_intrst_pandl=v_pre_entry_amt;

        /* if @红股数量# >= 0 then */
        if v_divi_qty >= 0 then

            /* set @业务标志#=《业务标志-债券付息》; */
            set v_busi_flag=2002010;
        else

            /* set @业务标志#=《业务标志-债券兑付》; */
            set v_busi_flag=2002009;
        end if;
    else

        /* set @业务标志#=《业务标志-红利登记》; */
        set v_busi_flag=2001013;
    end if;

    /* set @待入账数量#=0; */
    set v_pre_entry_qty=0;
    #对资金处理取2位小数

    /* set @待入账金额# = round(@待入账金额#, 2); */
    set v_pre_entry_amt = round(v_pre_entry_amt, 2);
    #提前待入账记录表的处理标志用于给账户系统获取数据使用

    /* set @账户登记标志#=《账户登记标志-未处理》; */
    set v_act_record_flag=2;

    /* set @账户入账标志#=《账户入账标志-未处理》; */
    set v_acco_entry_flag=2;

    /* [插入重复更新][清算证券_结算_提前待入账记录表][字段][字段变量][{待入账数量} = @待入账数量#, {待入账金额} = @待入账金额#][2]["提前待入账记录已存在！"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_before_preentry (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, crncy_type, 
        exch_crncy_type, exch_rate, exch_no, stock_acco_no, 
        stock_code_no, trade_code_no, target_code_no, stock_type, 
        asset_type, pre_entry_qty, pre_entry_amt, impawn_ratio, 
        bond_accr_intrst, busi_flag, act_record_flag, acco_entry_flag, 
        entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, entry_status, 
        reg_date, arrive_date, begin_trade_date) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
        v_exch_crncy_type, v_exch_rate, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_trade_code_no, v_target_code_no, v_stock_type, 
        v_asset_type, v_pre_entry_qty, v_pre_entry_amt, v_impawn_ratio, 
        v_bond_accr_intrst, v_busi_flag, v_act_record_flag, v_acco_entry_flag, 
        v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_entry_status, 
        v_reg_date, v_arrive_date, v_begin_trade_date) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_entry_qty = v_pre_entry_qty, pre_entry_amt = v_pre_entry_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.52.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("提前待入账记录已存在！","#",v_mysql_message);
        else
            SET v_error_info = "提前待入账记录已存在！";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_flag = v_busi_flag;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_持仓记录处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_PosiJourDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_PosiJourDeal(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_impawn_ratio decimal(18,12),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_pre_entry_qty decimal(18,2),
    IN p_reg_date int,
    IN p_ex_date int,
    IN p_arrive_date int,
    IN p_begin_trade_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_reg_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_flag int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_trade_code_no int;
    declare v_undo_status varchar(2);
    declare v_entry_status varchar(2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_reg_date = p_reg_date;
    SET v_ex_date = p_ex_date;
    SET v_arrive_date = p_arrive_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_flag = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_no = " ";
    SET v_order_dir = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_bond_accr_intrst = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_trade_code_no = 0;
    SET v_undo_status = "0";
    SET v_entry_status = "0";
    SET v_pre_entry_amt = 0;
    SET v_act_record_flag = 0;
    SET v_acco_entry_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #初始化证券结算表的相关字段

    /* set @成交日期#=@初始化日期#; */
    set v_strike_date=v_init_date;

    /* set @成交编号#=0; */
    set v_strike_no=0;

    /* set @订单方向#=0; */
    set v_order_dir=0;

    /* set @成交价格#=0; */
    set v_strike_price=0;

    /* set @成交数量#=0; */
    set v_strike_qty=0;

    /* set @成交金额#=0; */
    set v_strike_amt=0;

    /* set @债券计提利息#=0; */
    set v_bond_accr_intrst=0;

    /* set @入账资金流水号#=0; */
    set v_entry_money_jour_no=0;

    /* set @入账交易组持仓流水号#=0; */
    set v_entry_exgp_posi_jour_no=0;

    /* set @入账资产账户持仓流水号#=0; */
    set v_entry_asac_posi_jour_no=0;

    /* set @交易代码编号# = @证券代码编号#; */
    set v_trade_code_no = v_stock_code_no;

    /* set @回滚状态#=《回滚状态-未回滚》; */
    set v_undo_status="2";

    /* set @入账状态#=《入账状态-未入账》; */
    set v_entry_status="2";
    #红股入账

    /* if @证券类型#>20 and @证券类型#<50 then */
    if v_stock_type>20 and v_stock_type<50 then

        /* set @业务标志#=《业务标志-债券兑付》; */
        set v_busi_flag=2002009;
    else

        /* set @业务标志#=《业务标志-红股登记》; */
        set v_busi_flag=2001014;
    end if;

    /* set @待入账金额#=0; */
    set v_pre_entry_amt=0;
    #提前待入账记录表的处理标志用于给账户系统获取数据使用

    /* set @账户登记标志#=《账户登记标志-未处理》; */
    set v_act_record_flag=2;

    /* set @账户入账标志#=《账户入账标志-未处理》; */
    set v_acco_entry_flag=2;

    /* [插入重复更新][清算证券_结算_提前待入账记录表][字段][字段变量][{待入账数量} = @待入账数量#, {待入账金额} = @待入账金额#][2]["提前待入账记录已存在！"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_before_preentry (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, crncy_type, 
        exch_crncy_type, exch_rate, exch_no, stock_acco_no, 
        stock_code_no, trade_code_no, target_code_no, stock_type, 
        asset_type, pre_entry_qty, pre_entry_amt, impawn_ratio, 
        bond_accr_intrst, busi_flag, act_record_flag, acco_entry_flag, 
        entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, entry_status, 
        reg_date, arrive_date, begin_trade_date) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
        v_exch_crncy_type, v_exch_rate, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_trade_code_no, v_target_code_no, v_stock_type, 
        v_asset_type, v_pre_entry_qty, v_pre_entry_amt, v_impawn_ratio, 
        v_bond_accr_intrst, v_busi_flag, v_act_record_flag, v_acco_entry_flag, 
        v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_entry_status, 
        v_reg_date, v_arrive_date, v_begin_trade_date) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_entry_qty = v_pre_entry_qty, pre_entry_amt = v_pre_entry_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.53.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("提前待入账记录已存在！","#",v_mysql_message);
        else
            SET v_error_info = "提前待入账记录已存在！";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_flag = v_busi_flag;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_记录登记处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_AddBeforePreEntryRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_AddBeforePreEntryRecord(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_impawn_ratio decimal(18,12),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_curr_qty decimal(18,2),
    IN p_divi_cacl_num int,
    IN p_par_value decimal(16,9),
    IN p_divi_amt decimal(18,4),
    IN p_divi_qty decimal(18,2),
    IN p_equity_trans_qty decimal(18,2),
    IN p_rights_issue_qty decimal(18,2),
    IN p_reg_date int,
    IN p_ex_date int,
    IN p_arrive_date int,
    IN p_begin_trade_date int,
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
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_curr_qty decimal(18,2);
    declare v_divi_cacl_num int;
    declare v_par_value decimal(16,9);
    declare v_divi_amt decimal(18,4);
    declare v_divi_qty decimal(18,2);
    declare v_equity_trans_qty decimal(18,2);
    declare v_rights_issue_qty decimal(18,2);
    declare v_reg_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_busi_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_curr_qty = p_curr_qty;
    SET v_divi_cacl_num = p_divi_cacl_num;
    SET v_par_value = p_par_value;
    SET v_divi_amt = p_divi_amt;
    SET v_divi_qty = p_divi_qty;
    SET v_equity_trans_qty = p_equity_trans_qty;
    SET v_rights_issue_qty = p_rights_issue_qty;
    SET v_reg_date = p_reg_date;
    SET v_ex_date = p_ex_date;
    SET v_arrive_date = p_arrive_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pre_entry_amt = 0;
    SET v_pre_entry_qty = 0;
    SET v_busi_flag = 0;

    
    label_pro:BEGIN
    
    #根据持仓数量计算分配的红利和红股
    #根据相关税率计算待入账数量及待入账金额
    #如果是债券业务，则单独计算

    /* if @证券类型#>20 and @证券类型#<50 then */
    if v_stock_type>20 and v_stock_type<50 then

        /* set @待入账金额# = @当前数量#/@行为单位#*@分红金额#; */
        set v_pre_entry_amt = v_curr_qty/v_divi_cacl_num*v_divi_amt;

        /* set @待入账数量# = @当前数量#/@行为单位#*@红股数量#; */
        set v_pre_entry_qty = v_curr_qty/v_divi_cacl_num*v_divi_qty;
    else

        /* 调用【原子_清算证券_结算_计算结算资金持仓数据】*/
        call db_clsecu.pra_clsest_SettleCapitalStockCacl(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_crncy_type,
            v_divi_cacl_num,
            v_par_value,
            v_divi_amt,
            v_divi_qty,
            v_equity_trans_qty,
            v_rights_issue_qty,
            v_curr_qty,
            v_error_code,
            v_error_info,
            v_pre_entry_qty,
            v_pre_entry_amt);
        if v_error_code = "1" then
            SET v_error_code = "clsecuA.3.54.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_结算_计算结算资金持仓数据出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    #先处理红利入账

    /* if @待入账金额# <> 0 then */
    if v_pre_entry_amt <> 0 then

        /* 调用【原子_清算证券_结算_资金记录处理】*/
        call db_clsecu.pra_clsest_CapitalJourDeal(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_crncy_type,
            v_exch_crncy_type,
            v_exch_rate,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_code_no,
            v_impawn_ratio,
            v_stock_type,
            v_asset_type,
            v_divi_qty,
            v_pre_entry_amt,
            v_reg_date,
            v_ex_date,
            v_arrive_date,
            v_begin_trade_date,
            v_error_code,
            v_error_info,
            v_busi_flag);
        if v_error_code = "1" then
            SET v_error_code = "clsecuA.3.54.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_结算_资金记录处理出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    #再处理红股入账

    /* if @待入账数量# <> 0 then */
    if v_pre_entry_qty <> 0 then

        /* 调用【原子_清算证券_结算_持仓记录处理】*/
        call db_clsecu.pra_clsest_PosiJourDeal(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_crncy_type,
            v_exch_crncy_type,
            v_exch_rate,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_target_code_no,
            v_impawn_ratio,
            v_stock_type,
            v_asset_type,
            v_pre_entry_qty,
            v_reg_date,
            v_ex_date,
            v_arrive_date,
            v_begin_trade_date,
            v_error_code,
            v_error_info,
            v_busi_flag);
        if v_error_code = "1" then
            SET v_error_code = "clsecuA.3.54.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_结算_持仓记录处理出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_记录到账处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_AddBeforePreEntryReceive;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_AddBeforePreEntryReceive(
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
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_intrst_days int;
    declare v_impawn_ratio decimal(18,12);
    declare v_repo_back_date int;
    declare v_entry_date int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_deal_flag int;
    declare v_tmp_init_date int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_busi_flag int;
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
    declare v_reg_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_no = " ";
    SET v_order_dir = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_intrst_days = 0;
    SET v_impawn_ratio = 0;
    SET v_repo_back_date = 0;
    SET v_entry_date = date_format(curdate(),'%Y%m%d');
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_deal_flag = 0;
    SET v_tmp_init_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_bond_accr_intrst = 0;
    SET v_busi_flag = 0;
    SET v_act_record_flag = 0;
    SET v_acco_entry_flag = 0;
    SET v_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    
    #处理到账日结算数据，从提前待入账记录表转入数据即可
    #初始化证券结算表的相关字段

    /* set @成交日期#=@初始化日期#; */
    set v_strike_date=v_init_date;

    /* set @成交编号#=0; */
    set v_strike_no=0;

    /* set @订单方向#=0; */
    set v_order_dir=0;

    /* set @成交价格#=0; */
    set v_strike_price=0;

    /* set @成交数量#=0; */
    set v_strike_qty=0;

    /* set @成交金额#=0; */
    set v_strike_amt=0;

    /* set @入账资金流水号#=0; */
    set v_entry_money_jour_no=0;

    /* set @入账交易组持仓流水号#=0; */
    set v_entry_exgp_posi_jour_no=0;

    /* set @入账资产账户持仓流水号#=0; */
    set v_entry_asac_posi_jour_no=0;

    /* set @对账流水号#=0; */
    set v_deli_jour_no=0;

    /* set @计息天数#=0; */
    set v_intrst_days=0;

    /* set @质押比例#=0; */
    set v_impawn_ratio=0;

    /* set @回购到期日期#=0; */
    set v_repo_back_date=0;

    /* set @入账日期# = @初始化日期#; */
    set v_entry_date = v_init_date;

    /* set @入账状态#=《入账状态-未入账》; */
    set v_entry_status="2";

    /* set @回滚状态#=《回滚状态-未回滚》; */
    set v_undo_status="2";

    /* set @处理标志#=《处理标志-未处理》; */
    set v_deal_flag=2;

    /* set @临时_初始化日期# = @初始化日期#; */
    set v_tmp_init_date = v_init_date;

    /* [声明游标][清算证券_结算_提前待入账记录表][字段][{到账日期}=@初始化日期# and {入账状态}=@入账状态#][cursor_secu_settpreentry] */
    cursor_secu_settpreentry:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_secu_settpreentry CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, trade_code_no, target_code_no, 
        stock_type, asset_type, pre_entry_qty, pre_entry_amt, 
        impawn_ratio, bond_accr_intrst, busi_flag, act_record_flag, 
        acco_entry_flag, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        entry_status, reg_date, arrive_date, begin_trade_date 
        from db_clsecu.tb_clsest_before_preentry 
        where arrive_date=v_init_date and entry_status=v_entry_status;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_secu_settpreentry][loop_secu_settpreentry] */
    open cursor_secu_settpreentry;
    loop_secu_settpreentry: LOOP
    fetch cursor_secu_settpreentry into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_crncy_type, v_exch_crncy_type, v_exch_rate, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_trade_code_no, v_target_code_no, 
        v_stock_type, v_asset_type, v_pre_entry_qty, v_pre_entry_amt, 
        v_impawn_ratio, v_bond_accr_intrst, v_busi_flag, v_act_record_flag, 
        v_acco_entry_flag, v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, 
        v_entry_status, v_reg_date, v_arrive_date, v_begin_trade_date;
        IF v_cursor_done THEN
            LEAVE loop_secu_settpreentry;
        END IF;


        /* set @交易代码编号#=@证券代码编号#; */
        set v_trade_code_no=v_stock_code_no;

        /* set @标的代码编号#=@证券代码编号#; */
        set v_target_code_no=v_stock_code_no;

        /* set @初始化日期# = @临时_初始化日期#; */
        set v_init_date = v_tmp_init_date;

        /* [插入表记录][清算证券_结算_待入账记录表][字段][字段变量][2]["读取提前待入账记录表数据插入待入账记录表错误！"] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_clsecu.tb_clsest_preentry(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, crncy_type, 
            exch_crncy_type, exch_rate, exch_no, stock_acco_no, 
            stock_code_no, stock_type, asset_type, order_dir, 
            pre_entry_qty, pre_entry_amt, busi_flag, entry_status, 
            undo_status, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
            trade_code_no, target_code_no, intrst_days, bond_accr_intrst, 
            impawn_ratio, repo_back_date) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
            v_exch_crncy_type, v_exch_rate, v_exch_no, v_stock_acco_no, 
            v_stock_code_no, v_stock_type, v_asset_type, v_order_dir, 
            v_pre_entry_qty, v_pre_entry_amt, v_busi_flag, v_entry_status, 
            v_undo_status, v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, 
            v_trade_code_no, v_target_code_no, v_intrst_days, v_bond_accr_intrst, 
            v_impawn_ratio, v_repo_back_date);
        if v_error_code = "1" then
                    
            SET v_error_code = "clsecuA.3.55.2";
            SET v_error_info =  CONCAT("读取提前待入账记录表数据插入待入账记录表错误！","#",v_mysql_message);
            close cursor_secu_settpreentry;
            leave label_pro;
        end if;


        /* set @入账状态#=《入账状态-已入账》; */
        set v_entry_status="1";

        /* set @对账流水号#=0; */
        set v_deli_jour_no=0;

        /* [更新表记录][清算证券_结算_提前待入账记录表][{入账状态}=@入账状态#][{记录序号}=@记录序号#][4]["更新提前待入账记录表记录错误！"] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_clsecu.tb_clsest_before_preentry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status=v_entry_status where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "clsecuA.3.55.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("更新提前待入账记录表记录错误！","#",v_mysql_message);
            else
                SET v_error_info = "更新提前待入账记录表记录错误！";
            end if;
            close cursor_secu_settpreentry;
            leave label_pro;
        end if;


    /* [关闭游标][cursor_secu_settpreentry] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_secu_settpreentry;
    end cursor_secu_settpreentry;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_新股中签记录处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_NewSharesDeal_One;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_NewSharesDeal_One(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_order_dir int,
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_stat_rows_num int,
    IN p_net_asset_total decimal(18,4),
    IN p_IPO_match_type int,
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_order_dir int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_stat_rows_num int;
    declare v_net_asset_total decimal(18,4);
    declare v_IPO_match_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_flag int;
    declare v_crncy_type varchar(3);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_intrst_days int;
    declare v_impawn_ratio decimal(18,12);
    declare v_repo_back_date int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_stock_type int;
    declare v_dist_qty int;
    declare v_nav_asset decimal(18,4);
    declare v_deal_flag int;
    declare v_tmp_row_id bigint;
    declare v_tmp_stock_code_no int;
    declare v_strike_amt decimal(18,4);
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_split_strike_flag int;
    declare v_entry_date int;
    declare v_asset_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_dir = p_order_dir;
    SET v_strike_date = p_strike_date;
    SET v_strike_no = p_strike_no;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_stat_rows_num = p_stat_rows_num;
    SET v_net_asset_total = p_net_asset_total;
    SET v_IPO_match_type = p_IPO_match_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_flag = 0;
    SET v_crncy_type = "CNY";
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_bond_accr_intrst = 0;
    SET v_intrst_days = 0;
    SET v_impawn_ratio = 0;
    SET v_repo_back_date = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_stock_type = 0;
    SET v_dist_qty = 0;
    SET v_nav_asset = 0;
    SET v_deal_flag = 0;
    SET v_tmp_row_id = 0;
    SET v_tmp_stock_code_no = 0;
    SET v_strike_amt = 0;
    SET v_pre_entry_amt = 0;
    SET v_pre_entry_qty = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_split_strike_flag = 0;
    SET v_entry_date = date_format(curdate(),'%Y%m%d');
    SET v_asset_type = 0;

    
    label_pro:BEGIN
    

    /* set @业务标志#=《业务标志-新股入账》; */
    set v_busi_flag=2001005;

    /* set @本币币种# = "CNY"; */
    set v_crncy_type = "CNY";

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;

    /* set @入账交易组持仓流水号# = 0; */
    set v_entry_exgp_posi_jour_no = 0;

    /* set @入账资产账户持仓流水号# = 0; */
    set v_entry_asac_posi_jour_no = 0;

    /* set @对账流水号# = 0; */
    set v_deli_jour_no = 0;

    /* set @交易代码编号# = @证券代码编号#; */
    set v_trade_code_no = v_stock_code_no;

    /* set @标的代码编号# = @证券代码编号#; */
    set v_target_code_no = v_stock_code_no;

    /* set @债券计提利息# = 0; */
    set v_bond_accr_intrst = 0;

    /* set @计息天数# = 0; */
    set v_intrst_days = 0;

    /* set @质押比例# = 0; */
    set v_impawn_ratio = 0;

    /* set @回购到期日期# = 0; */
    set v_repo_back_date = 0;

    /* [声明游标][清算证券_结算_新股申购表][字段][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {标的代码编号}=@证券代码编号# and {处理标志}=《处理标志-未处理》][cursor_stock_iporeport] */
    cursor_stock_iporeport:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_stock_iporeport CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, dist_qty, 
        nav_asset, deal_flag, trade_code_no, target_code_no 
        from db_clsecu.tb_clsest_new_report 
        where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and target_code_no=v_stock_code_no and deal_flag=2;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_stock_iporeport][loop_stock_iporeport] */
    open cursor_stock_iporeport;
    loop_stock_iporeport: LOOP
    fetch cursor_stock_iporeport into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_crncy_type, v_exch_crncy_type, v_exch_rate, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_type, v_dist_qty, 
        v_nav_asset, v_deal_flag, v_trade_code_no, v_target_code_no;
        IF v_cursor_done THEN
            LEAVE loop_stock_iporeport;
        END IF;


        /* set @临时_记录序号# = @记录序号#; */
        set v_tmp_row_id = v_row_id;

        /* set @临时_证券代码编号# = @证券代码编号#; */
        set v_tmp_stock_code_no = v_stock_code_no;
        #计算每个单元分配的数量

        /* if @新股分配方式#=《新股分配方式-市值分配》 then */
        if v_IPO_match_type=2 then

            /* if @净资产合计# <= 0 then */
            if v_net_asset_total <= 0 then

                /* set @分配数量#=0; */
                set v_dist_qty=0;
            else

                /* set @分配数量#=@成交数量# * @净资产#/@净资产合计#; */
                set v_dist_qty=v_strike_qty * v_nav_asset/v_net_asset_total;
            end if;
        else

            /* if @统计笔数# <= 0 then */
            if v_stat_rows_num <= 0 then

                /* set @分配数量#=0; */
                set v_dist_qty=0;
            else

                /* set @分配数量#=@成交数量# /@统计笔数#; */
                set v_dist_qty=v_strike_qty /v_stat_rows_num;
            end if;
        end if;

        /* set @证券代码编号# = @标的代码编号#; */
        set v_stock_code_no = v_target_code_no;
        #中签不能有成交数量，否则入账时会反冲掉

        /* set @成交金额# = 0; */
        set v_strike_amt = 0;

        /* set @成交数量# = 0; */
        set v_strike_qty = 0;

        /* set @待入账金额# = -@分配数量# * @成交价格#; */
        set v_pre_entry_amt = -v_dist_qty * v_strike_price;

        /* set @待入账数量# = @分配数量#; */
        set v_pre_entry_qty = v_dist_qty;
        #对资金处理取2位小数

        /* set @待入账金额# = round(@待入账金额#, 2); */
        set v_pre_entry_amt = round(v_pre_entry_amt, 2);

        /* set @成交金额# = round(@成交金额#, 2); */
        set v_strike_amt = round(v_strike_amt, 2);

        /* set @处理标志# = 《处理标志-未处理》; */
        set v_deal_flag = 2;

        /* set @入账状态# = 《入账状态-未入账》; */
        set v_entry_status = "2";

        /* set @回滚状态# = 《回滚状态-未回滚》; */
        set v_undo_status = "2";

        /* set @分笔成交标志# = 《分笔成交标志-单笔成交》; */
        set v_split_strike_flag = 1;

        /* set @入账日期# = @初始化日期#; */
        set v_entry_date = v_init_date;

        /* set @资产类型# = 1; */
        set v_asset_type = 1;

        /* [插入表记录][清算证券_结算_待入账记录表][字段][字段变量][2]["待入账记录已存在！"] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_clsecu.tb_clsest_preentry(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, crncy_type, 
            exch_crncy_type, exch_rate, exch_no, stock_acco_no, 
            stock_code_no, stock_type, asset_type, order_dir, 
            pre_entry_qty, pre_entry_amt, busi_flag, entry_status, 
            undo_status, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
            trade_code_no, target_code_no, intrst_days, bond_accr_intrst, 
            impawn_ratio, repo_back_date) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
            v_exch_crncy_type, v_exch_rate, v_exch_no, v_stock_acco_no, 
            v_stock_code_no, v_stock_type, v_asset_type, v_order_dir, 
            v_pre_entry_qty, v_pre_entry_amt, v_busi_flag, v_entry_status, 
            v_undo_status, v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, 
            v_trade_code_no, v_target_code_no, v_intrst_days, v_bond_accr_intrst, 
            v_impawn_ratio, v_repo_back_date);
        if v_error_code = "1" then
                    
            SET v_error_code = "clsecuA.3.56.2";
            SET v_error_info =  CONCAT("待入账记录已存在！","#",v_mysql_message);
            close cursor_stock_iporeport;
            leave label_pro;
        end if;


        /* set @处理标志# = 《处理标志-已处理》; */
        set v_deal_flag = 1;

        /* set @证券代码编号# = @临时_证券代码编号#; */
        set v_stock_code_no = v_tmp_stock_code_no;

        /* [更新表记录][清算证券_结算_新股申购表][{分配数量}=@分配数量#, {处理标志}=@处理标志#][{记录序号}=@临时_记录序号#][3]["更新清算证券新股申购表记录错误！"] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_clsecu.tb_clsest_new_report set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, dist_qty=v_dist_qty, deal_flag=v_deal_flag where row_id=v_tmp_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "clsecuA.3.56.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("更新清算证券新股申购表记录错误！","#",v_mysql_message);
            else
                SET v_error_info = "更新清算证券新股申购表记录错误！";
            end if;
            close cursor_stock_iporeport;
            leave label_pro;
        end if;


    /* [关闭游标][cursor_stock_iporeport] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_stock_iporeport;
    end cursor_stock_iporeport;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_新股中签处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_NewSharesDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_NewSharesDeal(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_IPO_match_type int,
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
    declare v_IPO_match_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_stat_rows_num int;
    declare v_net_asset_total decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_IPO_match_type = p_IPO_match_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_no = " ";
    SET v_order_dir = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_stat_rows_num = 0;
    SET v_net_asset_total = 0;

    
    label_pro:BEGIN
    

    /* [声明游标][清算证券_结算_新股中签表][字段][{成交日期}<=@初始化日期#][cursor_stock_ipo] */
    cursor_stock_ipo:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_stock_ipo CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt 
        from db_clsecu.tb_clsest_new_shares 
        where strike_date<=v_init_date;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_stock_ipo][loop_stock_ipo] */
    open cursor_stock_ipo;
    loop_stock_ipo: LOOP
    fetch cursor_stock_ipo into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_stock_type, 
        v_strike_date, v_strike_no, v_order_dir, v_strike_price, 
        v_strike_qty, v_strike_amt;
        IF v_cursor_done THEN
            LEAVE loop_stock_ipo;
        END IF;

        #先检查是否已经处理过新股申购转入处理

        /* [记录不存在][清算证券_结算_新股申购表][@统计笔数#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][1]["清算证券新股申购表记录不存在！请先处理新股申购记录转入！"] */
        select count(1) into v_stat_rows_num from db_clsecu.tb_clsest_new_report where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;
        if v_stat_rows_num = 0 then
                    
            SET v_error_code = "clsecuA.3.57.1";
            SET v_error_info = "清算证券新股申购表记录不存在！请先处理新股申购记录转入！";
            close cursor_stock_ipo;
            leave label_pro;
        end if;

        #获得总笔数和总的市值

        /* [获取表记录变量][清算证券_结算_新股申购表][sum(1),ifnull(sum({净资产}),0)][@统计笔数#, @净资产合计#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][4][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
        select sum(1),ifnull(sum(nav_asset),0) into v_stat_rows_num, v_net_asset_total from db_clsecu.tb_clsest_new_report where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "clsecuA.3.57.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
            end if;
            close cursor_stock_ipo;
            leave label_pro;
        end if;


        /* 调用【原子_清算证券_结算_新股中签记录处理】*/
        call db_clsecu.pra_clsest_NewSharesDeal_One(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_order_dir,
            v_strike_date,
            v_strike_no,
            v_strike_price,
            v_strike_qty,
            v_stat_rows_num,
            v_net_asset_total,
            v_IPO_match_type,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "clsecuA.3.57.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_结算_新股中签记录处理出现错误！',v_mysql_message);
            end if;
            close cursor_stock_ipo;
            leave label_pro;
        elseif v_error_code <> "0" then
            close cursor_stock_ipo;
            leave label_pro;
        end if;


    /* [关闭游标][cursor_stock_ipo] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_stock_ipo;
    end cursor_stock_ipo;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_更新提前待入账状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_UpdateBeforePreEntryStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_UpdateBeforePreEntryStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_act_record_flag int,
    IN p_acco_entry_flag int,
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
    declare v_row_id bigint;
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
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
    SET v_row_id = p_row_id;
    SET v_act_record_flag = p_act_record_flag;
    SET v_acco_entry_flag = p_acco_entry_flag;
    SET v_entry_status = p_entry_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_结算_提前待入账记录表][{账户登记标志}=@账户登记标志#,{账户入账标志}=@账户入账标志#, {入账状态}=@入账状态#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_before_preentry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, act_record_flag=v_act_record_flag,acco_entry_flag=v_acco_entry_flag, entry_status=v_entry_status where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.61.2";
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
use db_clsecu;;

# 原子_清算证券_结算_更新获取结算登记记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_UpdateGetActBeforePreEntryRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_UpdateGetActBeforePreEntryRecord(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_row_id bigint,
    IN p_ctrl_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_asset_type int,
    OUT p_stock_type int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_occur_amt decimal(18,4),
    OUT p_occur_qty decimal(18,2),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_busi_flag int,
    OUT p_act_record_flag int,
    OUT p_acco_entry_flag int,
    OUT p_entry_status varchar(2),
    OUT p_arrive_date int,
    OUT p_begin_trade_date int
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
    declare v_ctrl_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_impawn_ratio decimal(18,12);
    declare v_busi_flag int;
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
    declare v_entry_status varchar(2);
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_reg_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_ctrl_flag = p_ctrl_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_asset_type = 0;
    SET v_stock_type = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_occur_amt = 0;
    SET v_occur_qty = 0;
    SET v_impawn_ratio = 0;
    SET v_busi_flag = 0;
    SET v_act_record_flag = 0;
    SET v_acco_entry_flag = 0;
    SET v_entry_status = "0";
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_bond_accr_intrst = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_reg_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    
    #获取提前待入账记录

    /* if @控制标志# = 1 then */
    if v_ctrl_flag = 1 then

        /* [锁定获取表记录变量][清算证券_结算_提前待入账记录表][字段][字段变量][{记录序号}=@查询记录序号#  and {入账状态} <>《入账状态-已入账》][1]["读取提前待入账记录错误！"] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, pd_no, exch_group_no, asset_acco_no, 
            crncy_type, exch_crncy_type, exch_rate, exch_no, 
            stock_acco_no, stock_code_no, trade_code_no, target_code_no, 
            stock_type, asset_type, pre_entry_qty, pre_entry_amt, 
            impawn_ratio, bond_accr_intrst, busi_flag, act_record_flag, 
            acco_entry_flag, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
            entry_status, reg_date, arrive_date, begin_trade_date into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_init_date, 
            v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
            v_crncy_type, v_exch_crncy_type, v_exch_rate, v_exch_no, 
            v_stock_acco_no, v_stock_code_no, v_trade_code_no, v_target_code_no, 
            v_stock_type, v_asset_type, v_pre_entry_qty, v_pre_entry_amt, 
            v_impawn_ratio, v_bond_accr_intrst, v_busi_flag, v_act_record_flag, 
            v_acco_entry_flag, v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, 
            v_entry_status, v_reg_date, v_arrive_date, v_begin_trade_date from db_clsecu.tb_clsest_before_preentry where row_id=v_query_row_id  and entry_status <>"1" limit 1 for update;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "clsecuA.3.62.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("读取提前待入账记录错误！","#",v_mysql_message);
            else
                SET v_error_info = "读取提前待入账记录错误！";
            end if;
            leave label_pro;
        end if;

    else

        /* [锁定获取表记录变量][清算证券_结算_提前待入账记录表][字段][字段变量][{记录序号}>@查询记录序号# and {登记日期}=@初始化日期# and {入账状态} <>《入账状态-已入账》 order by row_id][1]["读取提前待入账记录错误！"] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, pd_no, exch_group_no, asset_acco_no, 
            crncy_type, exch_crncy_type, exch_rate, exch_no, 
            stock_acco_no, stock_code_no, trade_code_no, target_code_no, 
            stock_type, asset_type, pre_entry_qty, pre_entry_amt, 
            impawn_ratio, bond_accr_intrst, busi_flag, act_record_flag, 
            acco_entry_flag, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
            entry_status, reg_date, arrive_date, begin_trade_date into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_init_date, 
            v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
            v_crncy_type, v_exch_crncy_type, v_exch_rate, v_exch_no, 
            v_stock_acco_no, v_stock_code_no, v_trade_code_no, v_target_code_no, 
            v_stock_type, v_asset_type, v_pre_entry_qty, v_pre_entry_amt, 
            v_impawn_ratio, v_bond_accr_intrst, v_busi_flag, v_act_record_flag, 
            v_acco_entry_flag, v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, 
            v_entry_status, v_reg_date, v_arrive_date, v_begin_trade_date from db_clsecu.tb_clsest_before_preentry where row_id>v_query_row_id and reg_date=v_init_date and entry_status <>"1" order by row_id limit 1 for update;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "clsecuA.3.62.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("读取提前待入账记录错误！","#",v_mysql_message);
            else
                SET v_error_info = "读取提前待入账记录错误！";
            end if;
            leave label_pro;
        end if;

    end if;

    /* set @变动数量# = @待入账数量#; */
    set v_occur_qty = v_pre_entry_qty;

    /* set @变动金额# = @待入账金额#; */
    set v_occur_amt = v_pre_entry_amt;

    /* set @账户登记标志# = 《账户登记标志-已处理》; */
    set v_act_record_flag = 1;

    /* set @入账状态# = 《入账状态-已入账》; */
    set v_entry_status = "1";
    #更新成本盈亏以及状态，先把待入账记录更新为已入账，如果后面失败，则再更新回来，以避免重新入账

    /* 调用【原子_清算证券_结算_更新提前待入账状态】*/
    call db_clsecu.pra_clsest_UpdateBeforePreEntryStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_act_record_flag,
        v_acco_entry_flag,
        v_entry_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clsecuA.3.62.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_结算_更新提前待入账状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
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
    SET p_asset_type = v_asset_type;
    SET p_stock_type = v_stock_type;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_occur_amt = v_occur_amt;
    SET p_occur_qty = v_occur_qty;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_busi_flag = v_busi_flag;
    SET p_act_record_flag = v_act_record_flag;
    SET p_acco_entry_flag = v_acco_entry_flag;
    SET p_entry_status = v_entry_status;
    SET p_arrive_date = v_arrive_date;
    SET p_begin_trade_date = v_begin_trade_date;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_获取结算入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_GetActBeforePreEntryReceive;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_GetActBeforePreEntryReceive(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_row_id bigint,
    IN p_intrst_entry_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_occur_amt decimal(18,4),
    OUT p_occur_qty decimal(18,2),
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
    declare v_intrst_entry_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_entry_status varchar(2);
    declare v_reg_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_intrst_entry_type = p_intrst_entry_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_occur_amt = 0;
    SET v_occur_qty = 0;
    SET v_busi_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_impawn_ratio = 0;
    SET v_bond_accr_intrst = 0;
    SET v_act_record_flag = 0;
    SET v_acco_entry_flag = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_entry_status = "0";
    SET v_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    
    #获取提前待入账记录
    #20170222债券付息修改，对于到账日期小于初始化日期未处理的都处理，因为债券当天付息的情况下，账户初始化处理时已经是第二天了

    /* [锁定获取表记录变量][清算证券_结算_提前待入账记录表][字段][字段变量][{记录序号}>@查询记录序号# and {到账日期}<=@初始化日期# and {账户入账标志}=《账户入账标志-未处理》 order by row_id][1]["读取提前待入账记录错误！"] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, trade_code_no, target_code_no, 
        stock_type, asset_type, pre_entry_qty, pre_entry_amt, 
        impawn_ratio, bond_accr_intrst, busi_flag, act_record_flag, 
        acco_entry_flag, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        entry_status, reg_date, arrive_date, begin_trade_date into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_crncy_type, v_exch_crncy_type, v_exch_rate, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_trade_code_no, v_target_code_no, 
        v_stock_type, v_asset_type, v_pre_entry_qty, v_pre_entry_amt, 
        v_impawn_ratio, v_bond_accr_intrst, v_busi_flag, v_act_record_flag, 
        v_acco_entry_flag, v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, 
        v_entry_status, v_reg_date, v_arrive_date, v_begin_trade_date from db_clsecu.tb_clsest_before_preentry where row_id>v_query_row_id and arrive_date<=v_init_date and acco_entry_flag=2 order by row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.3.63.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("读取提前待入账记录错误！","#",v_mysql_message);
        else
            SET v_error_info = "读取提前待入账记录错误！";
        end if;
        leave label_pro;
    end if;


    /* set @变动数量# = @待入账数量#; */
    set v_occur_qty = v_pre_entry_qty;

    /* set @变动金额# = @待入账金额#; */
    set v_occur_amt = v_pre_entry_amt;

    /* set @账户入账标志# = 《账户入账标志-已处理》; */
    set v_acco_entry_flag = 1;
    #更新成本盈亏以及状态，先把待入账记录更新为已入账，如果后面失败，则再更新回来，以避免重新入账

    /* 调用【原子_清算证券_结算_更新提前待入账状态】*/
    call db_clsecu.pra_clsest_UpdateBeforePreEntryStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_act_record_flag,
        v_acco_entry_flag,
        v_entry_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clsecuA.3.63.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_结算_更新提前待入账状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
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
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_occur_amt = v_occur_amt;
    SET p_occur_qty = v_occur_qty;
    SET p_busi_flag = v_busi_flag;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_获取提前待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_GetBeforePreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_GetBeforePreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_arrive_date int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_busi_flag int,
    OUT p_act_record_flag int,
    OUT p_acco_entry_flag int,
    OUT p_entry_status varchar(2),
    OUT p_stock_type int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_arrive_date int;
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_busi_flag int;
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
    declare v_entry_status varchar(2);
    declare v_stock_type int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_asset_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_reg_date int;
    declare v_begin_trade_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_arrive_date = p_arrive_date;
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_bond_accr_intrst = 0;
    SET v_busi_flag = 0;
    SET v_act_record_flag = 0;
    SET v_acco_entry_flag = 0;
    SET v_entry_status = "0";
    SET v_stock_type = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_asset_type = 0;
    SET v_impawn_ratio = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][清算证券_结算_提前待入账记录表][字段][字段变量][{到账日期}=@到账日期# and {记录序号}>@查询记录序号# order by {记录序号}][1]["获取提前待入账记录错误！"] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, trade_code_no, target_code_no, 
        stock_type, asset_type, pre_entry_qty, pre_entry_amt, 
        impawn_ratio, bond_accr_intrst, busi_flag, act_record_flag, 
        acco_entry_flag, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        entry_status, reg_date, arrive_date, begin_trade_date into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_crncy_type, v_exch_crncy_type, v_exch_rate, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_trade_code_no, v_target_code_no, 
        v_stock_type, v_asset_type, v_pre_entry_qty, v_pre_entry_amt, 
        v_impawn_ratio, v_bond_accr_intrst, v_busi_flag, v_act_record_flag, 
        v_acco_entry_flag, v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, 
        v_entry_status, v_reg_date, v_arrive_date, v_begin_trade_date from db_clsecu.tb_clsest_before_preentry where arrive_date=v_arrive_date and row_id>v_query_row_id order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.3.64.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("获取提前待入账记录错误！","#",v_mysql_message);
        else
            SET v_error_info = "获取提前待入账记录错误！";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_busi_flag = v_busi_flag;
    SET p_act_record_flag = v_act_record_flag;
    SET p_acco_entry_flag = v_acco_entry_flag;
    SET p_entry_status = v_entry_status;
    SET p_stock_type = v_stock_type;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_查询提前待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_QueryBeforePreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_QueryBeforePreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_reg_date int,
    IN p_arrive_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_crncy_type_str varchar(2048),
    IN p_act_record_flag int,
    IN p_acco_entry_flag int,
    IN p_entry_status varchar(2),
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
    declare v_reg_date int;
    declare v_arrive_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
    declare v_entry_status varchar(2);
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
    SET v_reg_date = p_reg_date;
    SET v_arrive_date = p_arrive_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_act_record_flag = p_act_record_flag;
    SET v_acco_entry_flag = p_acco_entry_flag;
    SET v_entry_status = p_entry_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_结算_提前待入账记录表][字段][(@登记日期#=0 or {登记日期}=@登记日期#) and (@到账日期#=0 or {到账日期}=@到账日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@本币币种串#=" " or instr(@本币币种串#, concat(";",{本币币种},";"))>0) and (@账户登记标志# = 0 or {账户登记标志}=@账户登记标志#) and (@账户入账标志# = 0 or {账户入账标志}=@账户入账标志#) and (@入账状态# = " " or {入账状态}=@入账状态#) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, trade_code_no, target_code_no, 
        stock_type, asset_type, pre_entry_qty, pre_entry_amt, 
        impawn_ratio, bond_accr_intrst, busi_flag, act_record_flag, 
        acco_entry_flag, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        entry_status, reg_date, arrive_date, begin_trade_date from db_clsecu.tb_clsest_before_preentry where (v_reg_date=0 or reg_date=v_reg_date) and (v_arrive_date=0 or arrive_date=v_arrive_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_act_record_flag = 0 or act_record_flag=v_act_record_flag) and (v_acco_entry_flag = 0 or acco_entry_flag=v_acco_entry_flag) and (v_entry_status = " " or entry_status=v_entry_status) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, trade_code_no, target_code_no, 
        stock_type, asset_type, pre_entry_qty, pre_entry_amt, 
        impawn_ratio, bond_accr_intrst, busi_flag, act_record_flag, 
        acco_entry_flag, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        entry_status, reg_date, arrive_date, begin_trade_date from db_clsecu.tb_clsest_before_preentry where (v_reg_date=0 or reg_date=v_reg_date) and (v_arrive_date=0 or arrive_date=v_arrive_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_act_record_flag = 0 or act_record_flag=v_act_record_flag) and (v_acco_entry_flag = 0 or acco_entry_flag=v_acco_entry_flag) and (v_entry_status = " " or entry_status=v_entry_status) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_更新待入账记录入账状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_UpdatePreEntryEntryStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_UpdatePreEntryEntryStatus(
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
    

    /* [更新表记录][清算证券_结算_待入账记录表][{入账状态}=@入账状态#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_preentry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status=v_entry_status where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.81.2";
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
use db_clsecu;;

# 原子_清算证券_结算_更新待入账记录回滚状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_UpdatePreEntryUndoStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_UpdatePreEntryUndoStatus(
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
    

    /* [更新表记录][清算证券_结算_待入账记录表][{回滚状态}=@回滚状态#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_preentry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, undo_status=v_undo_status where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.82.2";
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
use db_clsecu;;

# 原子_清算证券_结算_更新待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_UpdatePreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_UpdatePreEntry(
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
    IN p_entry_exgp_posi_jour_no bigint,
    IN p_entry_asac_posi_jour_no bigint,
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
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
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
    SET v_entry_exgp_posi_jour_no = p_entry_exgp_posi_jour_no;
    SET v_entry_asac_posi_jour_no = p_entry_asac_posi_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_结算_待入账记录表][{入账资金流水号}=@入账资金流水号#, {入账交易组持仓流水号}=@入账交易组持仓流水号#, {入账资产账户持仓流水号}=@入账资产账户持仓流水号#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_preentry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_money_jour_no=v_entry_money_jour_no, entry_exgp_posi_jour_no=v_entry_exgp_posi_jour_no, entry_asac_posi_jour_no=v_entry_asac_posi_jour_no where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.83.2";
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
use db_clsecu;;

# 原子_清算证券_结算_更新获取待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_UpdateGetPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_UpdateGetPreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_row_id bigint,
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_strike_date int,
    OUT p_strike_no varchar(64),
    OUT p_order_dir int,
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_posi_jour_no bigint,
    OUT p_deli_jour_no bigint,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_intrst_days int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_repo_back_date int
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
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_impawn_ratio decimal(18,12);
    declare v_repo_back_date int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_no = " ";
    SET v_order_dir = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_entry_money_jour_no = 0;
    SET v_entry_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_impawn_ratio = 0;
    SET v_repo_back_date = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [锁定获取表记录变量][清算证券_结算_待入账记录表][字段][字段变量][{入账状态}=《入账状态-未入账》 order by {记录序号}][4][" "] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        order_dir, pre_entry_qty, pre_entry_amt, busi_flag, 
        entry_status, undo_status, entry_money_jour_no, entry_exgp_posi_jour_no, 
        entry_asac_posi_jour_no, trade_code_no, target_code_no, intrst_days, 
        bond_accr_intrst, impawn_ratio, repo_back_date into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_crncy_type, v_exch_crncy_type, v_exch_rate, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_type, v_asset_type, 
        v_order_dir, v_pre_entry_qty, v_pre_entry_amt, v_busi_flag, 
        v_entry_status, v_undo_status, v_entry_money_jour_no, v_entry_exgp_posi_jour_no, 
        v_entry_asac_posi_jour_no, v_trade_code_no, v_target_code_no, v_intrst_days, 
        v_bond_accr_intrst, v_impawn_ratio, v_repo_back_date from db_clsecu.tb_clsest_preentry where entry_status="2" order by row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.3.84.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* set @记录个数# = 1; */
    set v_record_count = 1;

    /* [更新表记录][清算证券_结算_待入账记录表][{入账状态}=《入账状态-已入账》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_preentry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="1" where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.84.2";
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
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_strike_date = v_strike_date;
    SET p_strike_no = v_strike_no;
    SET p_order_dir = v_order_dir;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_posi_jour_no = v_entry_posi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_repo_back_date = v_repo_back_date;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_更新获取回滚待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_UpdateGetUndoPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_UpdateGetUndoPreEntry(
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
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_strike_date int,
    OUT p_strike_no varchar(64),
    OUT p_order_dir int,
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_exgp_posi_jour_no bigint,
    OUT p_entry_asac_posi_jour_no bigint,
    OUT p_deli_jour_no bigint,
    OUT p_stock_type int,
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_intrst_days int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_repo_back_date int,
    OUT p_arrive_date int
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_stock_type int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_impawn_ratio decimal(18,12);
    declare v_repo_back_date int;
    declare v_arrive_date int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_asset_type int;
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
    declare v_reg_date int;
    declare v_begin_trade_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_no = " ";
    SET v_order_dir = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_stock_type = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_impawn_ratio = 0;
    SET v_repo_back_date = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_asset_type = 0;
    SET v_act_record_flag = 0;
    SET v_acco_entry_flag = 0;
    SET v_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][清算证券_结算_提前待入账记录表][字段][字段变量][{记录序号} = @记录序号# and {入账状态}=《入账状态-已入账》][4][" "] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, trade_code_no, target_code_no, 
        stock_type, asset_type, pre_entry_qty, pre_entry_amt, 
        impawn_ratio, bond_accr_intrst, busi_flag, act_record_flag, 
        acco_entry_flag, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        entry_status, reg_date, arrive_date, begin_trade_date into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_crncy_type, v_exch_crncy_type, v_exch_rate, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_trade_code_no, v_target_code_no, 
        v_stock_type, v_asset_type, v_pre_entry_qty, v_pre_entry_amt, 
        v_impawn_ratio, v_bond_accr_intrst, v_busi_flag, v_act_record_flag, 
        v_acco_entry_flag, v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, 
        v_entry_status, v_reg_date, v_arrive_date, v_begin_trade_date from db_clsecu.tb_clsest_before_preentry where row_id = v_row_id and entry_status="1" limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.3.85.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][清算证券_结算_提前待入账记录表][{入账状态}=《入账状态-未入账》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_before_preentry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="2" where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.85.2";
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
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_strike_date = v_strike_date;
    SET p_strike_no = v_strike_no;
    SET p_order_dir = v_order_dir;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;
    SET p_entry_asac_posi_jour_no = v_entry_asac_posi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;
    SET p_stock_type = v_stock_type;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_repo_back_date = v_repo_back_date;
    SET p_arrive_date = v_arrive_date;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_查询待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_QueryPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_QueryPreEntry(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_entry_status = p_entry_status;
    SET v_undo_status = p_undo_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_结算_待入账记录表][字段][{初始化日期}<=@初始化日期# and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=" " or {资产账户编号}=@资产账户编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@本币币种串#=" " or instr(@本币币种串#, concat(";",{本币币种},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) and (@入账状态# = " " or {入账状态}=@入账状态#) and (@回滚状态# = " " or {回滚状态}=@回滚状态#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        order_dir, pre_entry_qty, pre_entry_amt, busi_flag, 
        entry_status, undo_status, entry_money_jour_no, entry_exgp_posi_jour_no, 
        entry_asac_posi_jour_no, trade_code_no, target_code_no, intrst_days, 
        bond_accr_intrst, impawn_ratio, repo_back_date from db_clsecu.tb_clsest_preentry where init_date<=v_init_date and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=" " or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) and (v_entry_status = " " or entry_status=v_entry_status) and (v_undo_status = " " or undo_status=v_undo_status) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        order_dir, pre_entry_qty, pre_entry_amt, busi_flag, 
        entry_status, undo_status, entry_money_jour_no, entry_exgp_posi_jour_no, 
        entry_asac_posi_jour_no, trade_code_no, target_code_no, intrst_days, 
        bond_accr_intrst, impawn_ratio, repo_back_date from db_clsecu.tb_clsest_preentry where init_date<=v_init_date and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=" " or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) and (v_entry_status = " " or entry_status=v_entry_status) and (v_undo_status = " " or undo_status=v_undo_status) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_入账异常处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_SettEntryErrorDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_SettEntryErrorDeal(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_order_dir int,
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_pre_entry_qty decimal(18,2),
    IN p_pre_entry_amt decimal(18,4),
    IN p_stock_type int,
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_intrst_days int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_impawn_ratio decimal(18,12),
    IN p_repo_back_date int,
    IN p_busi_flag int,
    IN p_undo_error_no int,
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
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_stock_type int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_impawn_ratio decimal(18,12);
    declare v_repo_back_date int;
    declare v_busi_flag int;
    declare v_undo_error_no int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_no = p_strike_no;
    SET v_order_dir = p_order_dir;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_stock_type = p_stock_type;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_intrst_days = p_intrst_days;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_repo_back_date = p_repo_back_date;
    SET v_busi_flag = p_busi_flag;
    SET v_undo_error_no = p_undo_error_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][清算证券_结算_入账异常表][字段][字段变量][1]["证券清算结算入账异常记录已存在！"] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_entry_error(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, crncy_type, 
        exch_crncy_type, exch_rate, exch_no, stock_acco_no, 
        stock_code_no, stock_type, order_dir, strike_date, 
        strike_no, strike_price, strike_qty, strike_amt, 
        pre_entry_qty, pre_entry_amt, trade_code_no, target_code_no, 
        intrst_days, bond_accr_intrst, impawn_ratio, repo_back_date, 
        busi_flag, undo_error_no, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
        v_exch_crncy_type, v_exch_rate, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_type, v_order_dir, v_strike_date, 
        v_strike_no, v_strike_price, v_strike_qty, v_strike_amt, 
        v_pre_entry_qty, v_pre_entry_amt, v_trade_code_no, v_target_code_no, 
        v_intrst_days, v_bond_accr_intrst, v_impawn_ratio, v_repo_back_date, 
        v_busi_flag, v_undo_error_no, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.87.1";
        SET v_error_info =  CONCAT("证券清算结算入账异常记录已存在！","#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_回写入账流水号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_UpdateEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_UpdateEntryJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_entry_money_jour_no bigint,
    IN p_entry_exgp_posi_jour_no bigint,
    IN p_entry_asac_posi_jour_no bigint,
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
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
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
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_exgp_posi_jour_no = p_entry_exgp_posi_jour_no;
    SET v_entry_asac_posi_jour_no = p_entry_asac_posi_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_结算_提前待入账记录表][{入账资金流水号} = @入账资金流水号#, {入账交易组持仓流水号} = @入账交易组持仓流水号#, {入账资产账户持仓流水号} = @入账资产账户持仓流水号#][{记录序号} = @记录序号#][1]["回写入账流水失败"] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_before_preentry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_money_jour_no = v_entry_money_jour_no, entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no, entry_asac_posi_jour_no = v_entry_asac_posi_jour_no where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.88.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("回写入账流水失败","#",v_mysql_message);
        else
            SET v_error_info = "回写入账流水失败";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_系统初始化
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_InitSystem;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_InitSystem(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
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
    declare v_next_init_date int;
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
    SET v_next_init_date = p_next_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #清算模块表记录归历史

    /* [数据归历史][清算证券_清算_成交表][字段][1=1][1a]["清算成交表归历史失败"] */
    insert into db_clsecu_his.tb_clsecl_strike_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, exch_rate, exch_no, stock_acco_no, 
        stock_code_no, target_stock_code_no, stock_type, asset_type, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        strike_price, strike_qty, strike_amt, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, trade_code_no, target_code_no, 
        arrive_date, capit_reback_days, posi_reback_days, net_price_flag, 
        intrst_days, par_value, bond_accr_intrst, bond_rate_type, 
        impawn_ratio, clear_entry_type, busi_jour_no, repo_pd_jour_no, 
        deal_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, exch_rate, exch_no, stock_acco_no, 
        stock_code_no, target_stock_code_no, stock_type, asset_type, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        strike_price, strike_qty, strike_amt, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, trade_code_no, target_code_no, 
        arrive_date, capit_reback_days, posi_reback_days, net_price_flag, 
        intrst_days, par_value, bond_accr_intrst, bond_rate_type, 
        impawn_ratio, clear_entry_type, busi_jour_no, repo_pd_jour_no, 
        deal_flag 
        from db_clsecu.tb_clsecl_strike 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.90.1a";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清算成交表归历史失败","#",v_mysql_message);
        else
            SET v_error_info = "清算成交表归历史失败";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_清算_合并清算表][字段][1=1][2a]["合并清算表归历史失败"] */
    insert into db_clsecu_his.tb_clsecl_merge_clear_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, exch_rate, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, order_price, order_qty, strike_num, 
        strike_aver_price, pre_entry_qty, pre_entry_amt, split_strike_qty, 
        split_strike_amt, split_stamp_tax, split_trans_fee, split_brkage, 
        split_SEC_charges, split_other_fee, split_brkage_commis, split_other_commis, 
        split_trade_tax, split_trade_cost_fee, split_trade_system_use_fee, split_stock_settle_fee, 
        trade_code_no, target_code_no, arrive_date, capit_reback_days, 
        posi_reback_days, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, clear_entry_type, 
        busi_flag, deal_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, exch_rate, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, order_price, order_qty, strike_num, 
        strike_aver_price, pre_entry_qty, pre_entry_amt, split_strike_qty, 
        split_strike_amt, split_stamp_tax, split_trans_fee, split_brkage, 
        split_SEC_charges, split_other_fee, split_brkage_commis, split_other_commis, 
        split_trade_tax, split_trade_cost_fee, split_trade_system_use_fee, split_stock_settle_fee, 
        trade_code_no, target_code_no, arrive_date, capit_reback_days, 
        posi_reback_days, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, clear_entry_type, 
        busi_flag, deal_flag 
        from db_clsecu.tb_clsecl_merge_clear 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.90.2a";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("合并清算表归历史失败","#",v_mysql_message);
        else
            SET v_error_info = "合并清算表归历史失败";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_清算_待入账记录表][字段][1=1][3a]["清算入账表归历史失败"] */
    insert into db_clsecu_his.tb_clsecl_pre_entry_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_rate, exch_no, stock_acco_no, stock_code_no, 
        target_stock_code_no, stock_type, asset_type, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, order_price, order_qty, strike_price, 
        strike_qty, strike_amt, strike_num, pre_entry_qty, 
        pre_entry_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, busi_flag, entry_status, undo_status, 
        busi_jour_no, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        trade_code_no, target_code_no, arrive_date, intrst_days, 
        bond_accr_intrst, bond_rate_type, impawn_ratio) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_rate, exch_no, stock_acco_no, stock_code_no, 
        target_stock_code_no, stock_type, asset_type, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, order_price, order_qty, strike_price, 
        strike_qty, strike_amt, strike_num, pre_entry_qty, 
        pre_entry_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, busi_flag, entry_status, undo_status, 
        busi_jour_no, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        trade_code_no, target_code_no, arrive_date, intrst_days, 
        bond_accr_intrst, bond_rate_type, impawn_ratio 
        from db_clsecu.tb_clsecl_pre_entry 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.90.3a";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清算入账表归历史失败","#",v_mysql_message);
        else
            SET v_error_info = "清算入账表归历史失败";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_清算_入账异常表][字段][1=1][4a]["清算入账异常表归历史失败"] */
    insert into db_clsecu_his.tb_clsecl_entry_error_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        undo_error_no, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        undo_error_no, remark_info 
        from db_clsecu.tb_clsecl_entry_error 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.90.4a";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清算入账异常表归历史失败","#",v_mysql_message);
        else
            SET v_error_info = "清算入账异常表归历史失败";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_清算_统计表][字段][1=1][5a]["清算统计表归历史失败"] */
    insert into db_clsecu_his.tb_clsecl_clear_total_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, busi_flag, 
        clear_num, order_dir, strike_num, strike_aver_price, 
        strike_qty, strike_amt, entry_qty, entry_amt, 
        all_fee, stamp_tax, trans_fee, brkage_fee, 
        SEC_charges, other_fee, trade_commis, chann_commis, 
        divi_commis, other_commis) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, busi_flag, 
        clear_num, order_dir, strike_num, strike_aver_price, 
        strike_qty, strike_amt, entry_qty, entry_amt, 
        all_fee, stamp_tax, trans_fee, brkage_fee, 
        SEC_charges, other_fee, trade_commis, chann_commis, 
        divi_commis, other_commis 
        from db_clsecu.tb_clsecl_clear_total 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.90.5a";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清算统计表归历史失败","#",v_mysql_message);
        else
            SET v_error_info = "清算统计表归历史失败";
        end if;
        leave label_pro;
    end if;

    #结算模块表记录归历史

    /* [数据归历史][清算证券_结算_新股中签表][字段][1=1][11a]["新股中签表归历史失败"] */
    insert into db_clsecu_his.tb_clsest_new_shares_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        strike_date, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt 
        from db_clsecu.tb_clsest_new_shares 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.90.11a";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("新股中签表归历史失败","#",v_mysql_message);
        else
            SET v_error_info = "新股中签表归历史失败";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_结算_新股申购表][字段][1=1][12a]["新股申购表归历史失败"] */
    insert into db_clsecu_his.tb_clsest_new_report_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, dist_qty, 
        nav_asset, deal_flag, trade_code_no, target_code_no) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, dist_qty, 
        nav_asset, deal_flag, trade_code_no, target_code_no 
        from db_clsecu.tb_clsest_new_report 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.90.12a";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("新股申购表归历史失败","#",v_mysql_message);
        else
            SET v_error_info = "新股申购表归历史失败";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_结算_提前待入账记录表][字段][1=1][16a]["结算提前待入账表归历史失败"] */
    insert into db_clsecu_his.tb_clsest_before_preentry_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, trade_code_no, target_code_no, 
        stock_type, asset_type, pre_entry_qty, pre_entry_amt, 
        impawn_ratio, bond_accr_intrst, busi_flag, act_record_flag, 
        acco_entry_flag, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        entry_status, reg_date, arrive_date, begin_trade_date) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, trade_code_no, target_code_no, 
        stock_type, asset_type, pre_entry_qty, pre_entry_amt, 
        impawn_ratio, bond_accr_intrst, busi_flag, act_record_flag, 
        acco_entry_flag, entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        entry_status, reg_date, arrive_date, begin_trade_date 
        from db_clsecu.tb_clsest_before_preentry 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.90.16a";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("结算提前待入账表归历史失败","#",v_mysql_message);
        else
            SET v_error_info = "结算提前待入账表归历史失败";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_结算_待入账记录表][字段][1=1][13a]["结算入账表归历史失败"] */
    insert into db_clsecu_his.tb_clsest_preentry_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        order_dir, pre_entry_qty, pre_entry_amt, busi_flag, 
        entry_status, undo_status, entry_money_jour_no, entry_exgp_posi_jour_no, 
        entry_asac_posi_jour_no, trade_code_no, target_code_no, intrst_days, 
        bond_accr_intrst, impawn_ratio, repo_back_date) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        order_dir, pre_entry_qty, pre_entry_amt, busi_flag, 
        entry_status, undo_status, entry_money_jour_no, entry_exgp_posi_jour_no, 
        entry_asac_posi_jour_no, trade_code_no, target_code_no, intrst_days, 
        bond_accr_intrst, impawn_ratio, repo_back_date 
        from db_clsecu.tb_clsest_preentry 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.90.13a";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("结算入账表归历史失败","#",v_mysql_message);
        else
            SET v_error_info = "结算入账表归历史失败";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_结算_入账异常表][字段][1=1][14a]["结算入账异常表归历史失败"] */
    insert into db_clsecu_his.tb_clsest_entry_error_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, order_dir, 
        strike_date, strike_no, strike_price, strike_qty, 
        strike_amt, pre_entry_qty, pre_entry_amt, trade_code_no, 
        target_code_no, intrst_days, bond_accr_intrst, impawn_ratio, 
        repo_back_date, busi_flag, undo_error_no, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, stock_type, order_dir, 
        strike_date, strike_no, strike_price, strike_qty, 
        strike_amt, pre_entry_qty, pre_entry_amt, trade_code_no, 
        target_code_no, intrst_days, bond_accr_intrst, impawn_ratio, 
        repo_back_date, busi_flag, undo_error_no, remark_info 
        from db_clsecu.tb_clsest_entry_error 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.90.14a";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("结算入账异常表归历史失败","#",v_mysql_message);
        else
            SET v_error_info = "结算入账异常表归历史失败";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_结算_统计表][字段][1=1][15a]["结算统计表归历史失败"] */
    insert into db_clsecu_his.tb_clsest_settle_total_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_no, stock_acco_no, stock_code_no, 
        busi_flag, sett_num, entry_qty, entry_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_no, stock_acco_no, stock_code_no, 
        busi_flag, sett_num, entry_qty, entry_amt 
        from db_clsecu.tb_clsest_settle_total 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.90.15a";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("结算统计表归历史失败","#",v_mysql_message);
        else
            SET v_error_info = "结算统计表归历史失败";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][清算证券_结算_公司行为表][字段][({登记日期}<=@初始化日期# and {处理标志} =《处理标志-已处理》 and {业务标志}=《业务标志-公司行为红股红利》) or  ({业务标志}=《业务标志-公司行为配股》 and {上市日期}=@初始化日期#)][17a]["公司行为记录归历史失败"] */
    insert into db_clsecu_his.tb_clsest_co_action_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code_no, stock_type, asset_type, crncy_type, 
        par_value, divi_cacl_num, divi_amt, divi_qty, 
        equity_trans_qty, rights_issue_qty, placement_price, notice_date, 
        reg_date, ex_date, arrive_date, begin_trade_date, 
        deal_flag, busi_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code_no, stock_type, asset_type, crncy_type, 
        par_value, divi_cacl_num, divi_amt, divi_qty, 
        equity_trans_qty, rights_issue_qty, placement_price, notice_date, 
        reg_date, ex_date, arrive_date, begin_trade_date, 
        deal_flag, busi_flag 
        from db_clsecu.tb_clsest_co_action 
        where (reg_date<=v_init_date and deal_flag =1 and busi_flag=2001027) or  (busi_flag=2001028 and begin_trade_date=v_init_date);
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.90.17a";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("公司行为记录归历史失败","#",v_mysql_message);
        else
            SET v_error_info = "公司行为记录归历史失败";
        end if;
        leave label_pro;
    end if;

    #[删除表记录][清算证券_结算_历史配股登记表][{初始化日期}=@初始化日期#][301a]["配股登记表归历史失败"]

    /* [不分日期数据归历史][清算证券_结算_配股登记表][字段][302]["配股登记表归历史失败"] */
    insert into db_clsecu_his.tb_clsest_placement_register_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, curr_qty, rights_issue_qty, placement_price, 
        avail_pla_qty, frozen_qty, frozen_amt, reg_date, 
        ex_date, arrive_date, begin_trade_date, placement_status) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, curr_qty, rights_issue_qty, placement_price, 
        avail_pla_qty, frozen_qty, frozen_amt, reg_date, 
        ex_date, arrive_date, begin_trade_date, placement_status 
        from db_clsecu.tb_clsest_placement_register;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.90.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("配股登记表归历史失败","#",v_mysql_message);
            else
                SET v_error_info = "配股登记表归历史失败";
            end if;
        leave label_pro;
    end if;

    #清算模块初始化数据
    #成交控制表 用于清算时，控制成交处理方式- 汇总 的并发，当日清空 Modify by wjp 20190304

    /* [删除表记录][清算证券_清算_成交控制表][1=1][21]["清空清算成交控制表失败"] */
    delete from db_clsecu.tb_clsecl_strike_ctrl 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.90.21";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清空清算成交控制表失败","#",v_mysql_message);
        else
            SET v_error_info = "清空清算成交控制表失败";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_清算_成交表][1=1][21]["清空清算成交表失败"] */
    delete from db_clsecu.tb_clsecl_strike 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.90.21";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清空清算成交表失败","#",v_mysql_message);
        else
            SET v_error_info = "清空清算成交表失败";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_清算_合并清算表][1=1][22]["清空合并清算表失败"] */
    delete from db_clsecu.tb_clsecl_merge_clear 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.90.22";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清空合并清算表失败","#",v_mysql_message);
        else
            SET v_error_info = "清空合并清算表失败";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_清算_待入账记录表][1=1][23]["清空清算入账表失败"] */
    delete from db_clsecu.tb_clsecl_pre_entry 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.90.23";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清空清算入账表失败","#",v_mysql_message);
        else
            SET v_error_info = "清空清算入账表失败";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_清算_入账异常表][1=1][24]["清空清算入账异常表失败"] */
    delete from db_clsecu.tb_clsecl_entry_error 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.90.24";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清空清算入账异常表失败","#",v_mysql_message);
        else
            SET v_error_info = "清空清算入账异常表失败";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_清算_统计表][1=1][25]["清空清算统计表失败"] */
    delete from db_clsecu.tb_clsecl_clear_total 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.90.25";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清空清算统计表失败","#",v_mysql_message);
        else
            SET v_error_info = "清空清算统计表失败";
        end if;
        leave label_pro;
    end if;

    #结算模块初始化数据

    /* [删除表记录][清算证券_结算_新股中签表][1=1][31]["清空新股中签表失败"] */
    delete from db_clsecu.tb_clsest_new_shares 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.90.31";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清空新股中签表失败","#",v_mysql_message);
        else
            SET v_error_info = "清空新股中签表失败";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_结算_新股申购表][1=1][32]["清空新股申购表失败"] */
    delete from db_clsecu.tb_clsest_new_report 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.90.32";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清空新股申购表失败","#",v_mysql_message);
        else
            SET v_error_info = "清空新股申购表失败";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_结算_提前待入账记录表][1=1][36]["清空结算提前待入账表失败"] */
    delete from db_clsecu.tb_clsest_before_preentry 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.90.36";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清空结算提前待入账表失败","#",v_mysql_message);
        else
            SET v_error_info = "清空结算提前待入账表失败";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_结算_待入账记录表][1=1][33]["清空结算入账表失败"] */
    delete from db_clsecu.tb_clsest_preentry 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.90.33";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清空结算入账表失败","#",v_mysql_message);
        else
            SET v_error_info = "清空结算入账表失败";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_结算_入账异常表][1=1][34]["清空结算入账异常表失败"] */
    delete from db_clsecu.tb_clsest_entry_error 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.90.34";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清空结算入账异常表失败","#",v_mysql_message);
        else
            SET v_error_info = "清空结算入账异常表失败";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_结算_统计表][1=1][35]["清空结算统计表失败"] */
    delete from db_clsecu.tb_clsest_settle_total 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.90.35";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("清空结算统计表失败","#",v_mysql_message);
        else
            SET v_error_info = "清空结算统计表失败";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_结算_公司行为表][({登记日期}<=@初始化日期# and {处理标志} =《处理标志-已处理》 and {业务标志}=《业务标志-公司行为红股红利》) or  ({业务标志}=《业务标志-公司行为配股》 and  {上市日期}=@初始化日期#)][37]["删除公司行为记录失败"] */
    delete from db_clsecu.tb_clsest_co_action 
        where (reg_date<=v_init_date and deal_flag =1 and busi_flag=2001027) or  (busi_flag=2001028 and  begin_trade_date=v_init_date);
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.90.37";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("删除公司行为记录失败","#",v_mysql_message);
        else
            SET v_error_info = "删除公司行为记录失败";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_结算_配股登记表][({配股状态} =《配股状态-未配股》 and   {到账日期}<=@初始化日期# ) or ({上市日期} <> 0  and {上市日期}<=@初始化日期#)][38]["删除配股登记表失败"] */
    delete from db_clsecu.tb_clsest_placement_register 
        where (placement_status ="0" and   arrive_date<=v_init_date ) or (begin_trade_date <> 0  and begin_trade_date<=v_init_date);
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.90.38";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("删除配股登记表失败","#",v_mysql_message);
        else
            SET v_error_info = "删除配股登记表失败";
        end if;
        leave label_pro;
    end if;

    #归档操作还未初始化，将即将上市的配股状态修改为已上市。

    /* [更新表记录][清算证券_结算_配股登记表][{配股状态}=《配股状态-已上市》][{配股状态}=《配股状态-已缴款》 and  {上市日期} = @下日初始化日期# ][2]["更新配股上市日配股状态失败！"] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_placement_register set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, placement_status="3" where placement_status="2" and  begin_trade_date = v_next_init_date ;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.90.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("更新配股上市日配股状态失败！","#",v_mysql_message);
        else
            SET v_error_info = "更新配股上市日配股状态失败！";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_数据统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_DataTotal;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_DataTotal(
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
    declare v_stock_acco_no int;
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
    SET v_stock_acco_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #为避免插入重复，先删除证券结算统计表数据

    /* [删除表记录][清算证券_结算_统计表][{初始化日期}=@初始化日期#][3][@初始化日期#] */
    delete from db_clsecu.tb_clsest_settle_total 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #从待入账记录表统计已入账记录数据，结算数据
    #统计产品相关数据，市场编号、证券代码、订单方向、业务标志

    /* set @机构编号# = 0; */
    set v_co_no = 0;

    /* set @产品编号# = 0; */
    set v_pd_no = 0;

    /* set @交易组编号# = 0; */
    set v_exch_group_no = 0;

    /* set @资产账户编号# = 0; */
    set v_asset_acco_no = 0;

    /* set @股东代码编号# = 0; */
    set v_stock_acco_no = 0;

    /* [读取插入表记录][清算证券_结算_统计表][清算证券_结算_待入账记录表][{初始化日期},{业务标志},{机构编号},{产品编号},{交易组编号},{资产账户编号},{本币币种},{市场编号},{股东代码编号},{证券代码编号},{结算笔数},{入账数量},{入账金额}][@初始化日期#, {业务标志}, @机构编号#, @产品编号#, @交易组编号#, @资产账户编号#,{本币币种}, {市场编号}, @股东代码编号#, {证券代码编号}, count(*), sum({待入账数量}), sum({待入账金额})][{初始化日期}=@初始化日期# and {入账日期}=@初始化日期# and {入账状态} = 《入账状态-已入账》 group by {本币币种}, {市场编号}, {证券代码编号}, {订单方向}, {业务标志}][1][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_settle_total (
        init_date,busi_flag,co_no,pd_no,exch_group_no,asset_acco_no,crncy_type,exch_no,stock_acco_no,stock_code_no,sett_num,entry_qty,entry_amt) 
        select 
        v_init_date, busi_flag, v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no,crncy_type, exch_no, v_stock_acco_no, stock_code_no, count(*), sum(pre_entry_qty), sum(pre_entry_amt) 
        from db_clsecu.tb_clsest_preentry 
        where init_date=v_init_date and entry_date=v_init_date and entry_status = "1" group by crncy_type, exch_no, stock_code_no, order_dir, busi_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #统计产品相关数据，机构编号、产品编号、市场编号、证券代码、订单方向、业务标志

    /* set @交易组编号# = 0; */
    set v_exch_group_no = 0;

    /* set @资产账户编号# = 0; */
    set v_asset_acco_no = 0;

    /* set @股东代码编号# = 0; */
    set v_stock_acco_no = 0;

    /* [读取插入表记录][清算证券_结算_统计表][清算证券_结算_待入账记录表][{初始化日期},{业务标志},{机构编号},{产品编号},{交易组编号},{资产账户编号},{本币币种},{市场编号},{股东代码编号},{证券代码编号},{结算笔数},{入账数量},{入账金额}][@初始化日期#, {业务标志}, {机构编号}, {产品编号}, @交易组编号#, @资产账户编号#, {本币币种}, {市场编号}, @股东代码编号#, {证券代码编号}, count(*), sum({待入账数量}), sum({待入账金额})][{初始化日期}=@初始化日期# and {入账日期}=@初始化日期# and {入账状态} = 《入账状态-已入账》 group by {机构编号}, {产品编号}, {本币币种}, {市场编号}, {证券代码编号}, {订单方向}, {业务标志}][1][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_settle_total (
        init_date,busi_flag,co_no,pd_no,exch_group_no,asset_acco_no,crncy_type,exch_no,stock_acco_no,stock_code_no,sett_num,entry_qty,entry_amt) 
        select 
        v_init_date, busi_flag, co_no, pd_no, v_exch_group_no, v_asset_acco_no, crncy_type, exch_no, v_stock_acco_no, stock_code_no, count(*), sum(pre_entry_qty), sum(pre_entry_amt) 
        from db_clsecu.tb_clsest_preentry 
        where init_date=v_init_date and entry_date=v_init_date and entry_status = "1" group by co_no, pd_no, crncy_type, exch_no, stock_code_no, order_dir, busi_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #统计产品单元相关数据，机构编号、产品编号、交易单元、市场编号、证券代码、订单方向、业务标志

    /* set @资产账户编号# = 0; */
    set v_asset_acco_no = 0;

    /* set @股东代码编号# = 0; */
    set v_stock_acco_no = 0;

    /* [读取插入表记录][清算证券_结算_统计表][清算证券_结算_待入账记录表][{初始化日期},{业务标志},{机构编号},{产品编号},{交易组编号},{资产账户编号},{本币币种},{市场编号},{股东代码编号},{证券代码编号},{结算笔数},{入账数量},{入账金额}][@初始化日期#, {业务标志}, {机构编号}, {产品编号}, {交易组编号}, @资产账户编号#, {本币币种}, {市场编号}, @股东代码编号#, {证券代码编号}, count(*), sum({待入账数量}), sum({待入账金额})][{初始化日期}=@初始化日期# and {入账日期}=@初始化日期# and {入账状态} = 《入账状态-已入账》 group by {机构编号}, {产品编号}, {交易组编号}, {本币币种}, {市场编号}, {证券代码编号}, {订单方向}, {业务标志}][1][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_settle_total (
        init_date,busi_flag,co_no,pd_no,exch_group_no,asset_acco_no,crncy_type,exch_no,stock_acco_no,stock_code_no,sett_num,entry_qty,entry_amt) 
        select 
        v_init_date, busi_flag, co_no, pd_no, exch_group_no, v_asset_acco_no, crncy_type, exch_no, v_stock_acco_no, stock_code_no, count(*), sum(pre_entry_qty), sum(pre_entry_amt) 
        from db_clsecu.tb_clsest_preentry 
        where init_date=v_init_date and entry_date=v_init_date and entry_status = "1" group by co_no, pd_no, exch_group_no, crncy_type, exch_no, stock_code_no, order_dir, busi_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #统计产品单元资产账户相关数据，机构编号、产品编号、交易单元、资产账户、市场编号、证券代码、订单方向、业务标志

    /* set @股东代码编号# = 0; */
    set v_stock_acco_no = 0;

    /* [读取插入表记录][清算证券_结算_统计表][清算证券_结算_待入账记录表][{初始化日期},{业务标志},{机构编号},{产品编号},{交易组编号},{资产账户编号},{本币币种},{市场编号},{股东代码编号},{证券代码编号},{结算笔数},{入账数量},{入账金额}][@初始化日期#, {业务标志}, {机构编号}, {产品编号}, {交易组编号}, {资产账户编号}, {本币币种}, {市场编号}, @股东代码编号#, {证券代码编号}, count(*), sum({待入账数量}), sum({待入账金额})][{初始化日期}=@初始化日期# and {入账日期}=@初始化日期# and {入账状态} = 《入账状态-已入账》 group by {机构编号}, {产品编号}, {交易单元}, {资产账户编号}, {本币币种}, {市场编号}, {证券代码编号}, {订单方向}, {业务标志}][1][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_settle_total (
        init_date,busi_flag,co_no,pd_no,exch_group_no,asset_acco_no,crncy_type,exch_no,stock_acco_no,stock_code_no,sett_num,entry_qty,entry_amt) 
        select 
        v_init_date, busi_flag, co_no, pd_no, exch_group_no, asset_acco_no, crncy_type, exch_no, v_stock_acco_no, stock_code_no, count(*), sum(pre_entry_qty), sum(pre_entry_amt) 
        from db_clsecu.tb_clsest_preentry 
        where init_date=v_init_date and entry_date=v_init_date and entry_status = "1" group by co_no, pd_no, part_code, asset_acco_no, crncy_type, exch_no, stock_code_no, order_dir, busi_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #统计产品单元资产账户相关数据，机构编号、产品编号、交易单元、资产账户、市场编号、股东代码、证券代码、订单方向、业务标志

    /* [读取插入表记录][清算证券_结算_统计表][清算证券_结算_待入账记录表][{初始化日期},{业务标志},{机构编号},{产品编号},{交易组编号},{资产账户编号},{本币币种},{市场编号},{股东代码编号},{证券代码编号},{结算笔数},{入账数量},{入账金额}][@初始化日期#, {业务标志}, {机构编号}, {产品编号}, {交易组编号}, {资产账户编号}, {本币币种}, {市场编号}, {股东代码编号}, {证券代码编号}, count(*), sum({待入账数量}), sum({待入账金额})][{初始化日期}=@初始化日期# and {入账日期}=@初始化日期# and {入账状态} = 《入账状态-已入账》 group by {机构编号}, {产品编号}, {交易单元}, {资产账户编号}, {本币币种}, {市场编号}, {股东代码编号}, {证券代码编号}, {订单方向}, {业务标志}][1][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_settle_total (
        init_date,busi_flag,co_no,pd_no,exch_group_no,asset_acco_no,crncy_type,exch_no,stock_acco_no,stock_code_no,sett_num,entry_qty,entry_amt) 
        select 
        v_init_date, busi_flag, co_no, pd_no, exch_group_no, asset_acco_no, crncy_type, exch_no, stock_acco_no, stock_code_no, count(*), sum(pre_entry_qty), sum(pre_entry_amt) 
        from db_clsecu.tb_clsest_preentry 
        where init_date=v_init_date and entry_date=v_init_date and entry_status = "1" group by co_no, pd_no, part_code, asset_acco_no, crncy_type, exch_no, stock_acco_no, stock_code_no, order_dir, busi_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.201.1";
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
use db_clsecu;;

# 原子_清算证券_结算_查询统计数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_QuerySettTotalData;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_QuerySettTotalData(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_结算_统计表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#编号) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@本币币种串#=" " or instr(@本币币种串#, concat(";",{本币币种},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_no, stock_acco_no, stock_code_no, 
        busi_flag, sett_num, entry_qty, entry_amt from db_clsecu.tb_clsest_settle_total where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no编号) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_no, stock_acco_no, stock_code_no, 
        busi_flag, sett_num, entry_qty, entry_amt from db_clsecu.tb_clsest_settle_total where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no编号) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_查询公司行为表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_QueryCompanyActionTable;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_QueryCompanyActionTable(
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

# 原子_清算证券_结算_新增新股中签记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_AddNewSharesByHand;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_AddNewSharesByHand(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_order_dir int,
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_strike_date = p_strike_date;
    SET v_strike_no = p_strike_no;
    SET v_order_dir = p_order_dir;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #先检查历史表是否已经存在，存在就不处理了

    /* [记录已存在][历史_清算证券_结算_新股中签表][@记录个数#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][1][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    select count(1) into v_record_count from db_clsecu_his.tb_clsest_new_shares_his where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "clsecuA.3.204.1";
        SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        leave label_pro;
    end if;


    /* [插入表记录][清算证券_结算_新股中签表][字段][字段变量][1][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_new_shares(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, strike_date, 
        strike_no, order_dir, strike_price, strike_qty, 
        strike_amt) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_type, v_strike_date, 
        v_strike_no, v_order_dir, v_strike_price, v_strike_qty, 
        v_strike_amt);
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.204.1";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #[插入重复更新][清算证券_结算_新股中签表][字段][字段变量][{成交日期}=@成交日期#,{成交编号}=@成交编号#,{订单方向}=@订单方向#,{成交价格}=@成交价格#,{成交数量}=@成交数量#,{成交金额}=@成交金额#][1][@资产账户编号#,@股东代码编号#,@证券代码编号#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_获取公司行为配股记录更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_GetCoActionPlacementUpdate;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_GetCoActionPlacementUpdate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_row_id bigint,
    IN p_placement_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_reg_date int,
    OUT p_exch_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_crncy_type varchar(3),
    OUT p_par_value decimal(16,9),
    OUT p_divi_cacl_num int,
    OUT p_divi_amt decimal(18,4),
    OUT p_divi_qty decimal(18,2),
    OUT p_equity_trans_qty decimal(18,2),
    OUT p_rights_issue_qty decimal(18,2),
    OUT p_placement_price decimal(16,9),
    OUT p_notice_date int,
    OUT p_ex_date int,
    OUT p_arrive_date int,
    OUT p_begin_trade_date int
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
    declare v_placement_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_reg_date int;
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
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_deal_flag int;
    declare v_busi_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_placement_status = p_placement_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_par_value = 0;
    SET v_divi_cacl_num = 0;
    SET v_divi_amt = 0;
    SET v_divi_qty = 0;
    SET v_equity_trans_qty = 0;
    SET v_rights_issue_qty = 0;
    SET v_placement_price = 0;
    SET v_notice_date = date_format(curdate(),'%Y%m%d');
    SET v_ex_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_deal_flag = 0;
    SET v_busi_flag = 0;

    
    label_pro:BEGIN
    
    #配股登记日 和 缴款截止日 不在同一天，所以处理标志 只会从 未处理 到已处理。

    /* if @配股状态# = 《配股状态-未配股》 then */
    if v_placement_status = "0" then

         /* [锁定获取表记录变量][清算证券_结算_公司行为表][字段][字段变量][{登记日期}=@初始化日期# and {处理标志} <>《处理标志-已处理》 and {业务标志}=《业务标志-公司行为配股》 ][4][@登记日期#,@证券代码编号#,@本币币种#,@业务标志#] */
         select row_id, create_date, create_time, 
             update_date, update_time, update_times, exch_no, 
             stock_code_no, stock_type, asset_type, crncy_type, 
             par_value, divi_cacl_num, divi_amt, divi_qty, 
             equity_trans_qty, rights_issue_qty, placement_price, notice_date, 
             reg_date, ex_date, arrive_date, begin_trade_date, 
             deal_flag, busi_flag into v_row_id, v_create_date, v_create_time, 
             v_update_date, v_update_time, v_update_times, v_exch_no, 
             v_stock_code_no, v_stock_type, v_asset_type, v_crncy_type, 
             v_par_value, v_divi_cacl_num, v_divi_amt, v_divi_qty, 
             v_equity_trans_qty, v_rights_issue_qty, v_placement_price, v_notice_date, 
             v_reg_date, v_ex_date, v_arrive_date, v_begin_trade_date, 
             v_deal_flag, v_busi_flag from db_clsecu.tb_clsest_co_action where reg_date=v_init_date and deal_flag <>1 and busi_flag=2001028  limit 1 for update;
         if FOUND_ROWS() = 0 then
                     
             SET v_error_code = "clsecuA.3.205.4";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("登记日期=",v_reg_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type,",","业务标志=",v_busi_flag),"#",v_mysql_message);
             else
                 SET v_error_info = concat("登记日期=",v_reg_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type,",","业务标志=",v_busi_flag);
             end if;
             leave label_pro;
         end if;


    /* elseif @配股状态# = 《配股状态-已登记》 then */
    elseif v_placement_status = "1" then
         #配股业务的{到账日期} 实际为 缴款截止日期，在这天进行 扣款，冻结配股数量。

         /* [锁定获取表记录变量][清算证券_结算_公司行为表][字段][字段变量][{到账日期}=@初始化日期#  and {业务标志}=《业务标志-公司行为配股》 and {处理标志} <>《处理标志-已处理》 ][4][@到账日期#,@证券代码编号#,@本币币种#,@业务标志#] */
         select row_id, create_date, create_time, 
             update_date, update_time, update_times, exch_no, 
             stock_code_no, stock_type, asset_type, crncy_type, 
             par_value, divi_cacl_num, divi_amt, divi_qty, 
             equity_trans_qty, rights_issue_qty, placement_price, notice_date, 
             reg_date, ex_date, arrive_date, begin_trade_date, 
             deal_flag, busi_flag into v_row_id, v_create_date, v_create_time, 
             v_update_date, v_update_time, v_update_times, v_exch_no, 
             v_stock_code_no, v_stock_type, v_asset_type, v_crncy_type, 
             v_par_value, v_divi_cacl_num, v_divi_amt, v_divi_qty, 
             v_equity_trans_qty, v_rights_issue_qty, v_placement_price, v_notice_date, 
             v_reg_date, v_ex_date, v_arrive_date, v_begin_trade_date, 
             v_deal_flag, v_busi_flag from db_clsecu.tb_clsest_co_action where arrive_date=v_init_date  and busi_flag=2001028 and deal_flag <>1  limit 1 for update;
         if FOUND_ROWS() = 0 then
                     
             SET v_error_code = "clsecuA.3.205.4";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("到账日期=",v_arrive_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type,",","业务标志=",v_busi_flag),"#",v_mysql_message);
             else
                 SET v_error_info = concat("到账日期=",v_arrive_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type,",","业务标志=",v_busi_flag);
             end if;
             leave label_pro;
         end if;

    end if;

    /* [更新表记录][清算证券_结算_公司行为表][{处理标志}=《处理标志-已处理》][{记录序号}=@记录序号#][2][@登记日期#,@证券代码编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_co_action set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=1 where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.205.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("登记日期=",v_reg_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("登记日期=",v_reg_date,",","证券代码编号=",v_stock_code_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_reg_date = v_reg_date;
    SET p_exch_no = v_exch_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_crncy_type = v_crncy_type;
    SET p_par_value = v_par_value;
    SET p_divi_cacl_num = v_divi_cacl_num;
    SET p_divi_amt = v_divi_amt;
    SET p_divi_qty = v_divi_qty;
    SET p_equity_trans_qty = v_equity_trans_qty;
    SET p_rights_issue_qty = v_rights_issue_qty;
    SET p_placement_price = v_placement_price;
    SET p_notice_date = v_notice_date;
    SET p_ex_date = v_ex_date;
    SET p_arrive_date = v_arrive_date;
    SET p_begin_trade_date = v_begin_trade_date;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_处理配股登记
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_DealPlacementReg;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_DealPlacementReg(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_curr_qty decimal(18,2),
    IN p_divi_cacl_num int,
    IN p_par_value decimal(16,9),
    IN p_divi_amt decimal(18,4),
    IN p_divi_qty decimal(18,2),
    IN p_equity_trans_qty decimal(18,2),
    IN p_rights_issue_qty decimal(18,2),
    IN p_placement_price decimal(16,9),
    IN p_reg_date int,
    IN p_ex_date int,
    IN p_arrive_date int,
    IN p_begin_trade_date int,
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_curr_qty decimal(18,2);
    declare v_divi_cacl_num int;
    declare v_par_value decimal(16,9);
    declare v_divi_amt decimal(18,4);
    declare v_divi_qty decimal(18,2);
    declare v_equity_trans_qty decimal(18,2);
    declare v_rights_issue_qty decimal(18,2);
    declare v_placement_price decimal(16,9);
    declare v_reg_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_avail_pla_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_frozen_amt decimal(18,4);
    declare v_placement_status varchar(2);
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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_curr_qty = p_curr_qty;
    SET v_divi_cacl_num = p_divi_cacl_num;
    SET v_par_value = p_par_value;
    SET v_divi_amt = p_divi_amt;
    SET v_divi_qty = p_divi_qty;
    SET v_equity_trans_qty = p_equity_trans_qty;
    SET v_rights_issue_qty = p_rights_issue_qty;
    SET v_placement_price = p_placement_price;
    SET v_reg_date = p_reg_date;
    SET v_ex_date = p_ex_date;
    SET v_arrive_date = p_arrive_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_avail_pla_qty = 0;
    SET v_frozen_qty = 0;
    SET v_frozen_amt = 0;
    SET v_placement_status = "0";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #存在零股 直接舍去。

    /* [检查报错返回][@行为单位#=0][1][concat("行为单位为0,证券代码编号:",@证券代码编号#)] */
    if v_divi_cacl_num=0 then
        
        SET v_error_code = "clsecuA.3.206.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("行为单位为0,证券代码编号:",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("行为单位为0,证券代码编号:",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* set @可配数量# = floor(@当前数量#/@行为单位#*@配股数量#); */
    set v_avail_pla_qty = floor(v_curr_qty/v_divi_cacl_num*v_rights_issue_qty);

    /* set @冻结数量# = 0; */
    set v_frozen_qty = 0;

    /* set @冻结金额# = 0; */
    set v_frozen_amt = 0;
    #默认都选不配股，需要配股的手工维护。

    /* set @配股状态# = 《配股状态-未配股》; */
    set v_placement_status = "0";

    /* [插入表记录][清算证券_结算_配股登记表][字段][字段变量][1][@机构编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_placement_register(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, curr_qty, rights_issue_qty, placement_price, 
        avail_pla_qty, frozen_qty, frozen_amt, reg_date, 
        ex_date, arrive_date, begin_trade_date, placement_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_curr_qty, v_rights_issue_qty, v_placement_price, 
        v_avail_pla_qty, v_frozen_qty, v_frozen_amt, v_reg_date, 
        v_ex_date, v_arrive_date, v_begin_trade_date, v_placement_status);
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.206.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_获取配股登记表信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_GetPlacementRegInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_GetPlacementRegInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_curr_qty decimal(18,2),
    OUT p_rights_issue_qty decimal(18,2),
    OUT p_placement_price decimal(16,9),
    OUT p_avail_pla_qty decimal(18,2),
    OUT p_frozen_qty decimal(18,2),
    OUT p_frozen_amt decimal(18,4),
    OUT p_reg_date int,
    OUT p_ex_date int,
    OUT p_arrive_date int,
    OUT p_begin_trade_date int
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
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_curr_qty decimal(18,2);
    declare v_rights_issue_qty decimal(18,2);
    declare v_placement_price decimal(16,9);
    declare v_avail_pla_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_frozen_amt decimal(18,4);
    declare v_reg_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_placement_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_curr_qty = 0;
    SET v_rights_issue_qty = 0;
    SET v_placement_price = 0;
    SET v_avail_pla_qty = 0;
    SET v_frozen_qty = 0;
    SET v_frozen_amt = 0;
    SET v_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_ex_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_placement_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][清算证券_结算_配股登记表][字段][字段变量][{证券代码编号}=@证券代码编号# and {配股状态}=《配股状态-已登记》 and {记录序号}>@查询记录序号# order by {记录序号}] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, curr_qty, rights_issue_qty, 
        placement_price, avail_pla_qty, frozen_qty, frozen_amt, 
        reg_date, ex_date, arrive_date, begin_trade_date, 
        placement_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_curr_qty, v_rights_issue_qty, 
        v_placement_price, v_avail_pla_qty, v_frozen_qty, v_frozen_amt, 
        v_reg_date, v_ex_date, v_arrive_date, v_begin_trade_date, 
        v_placement_status from db_clsecu.tb_clsest_placement_register where stock_code_no=v_stock_code_no and placement_status="1" and row_id>v_query_row_id order by row_id limit 1;

    #取不到时 为0。

    /* set @记录序号# = ifnull(@记录序号#,0); */
    set v_row_id = ifnull(v_row_id,0);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_curr_qty = v_curr_qty;
    SET p_rights_issue_qty = v_rights_issue_qty;
    SET p_placement_price = v_placement_price;
    SET p_avail_pla_qty = v_avail_pla_qty;
    SET p_frozen_qty = v_frozen_qty;
    SET p_frozen_amt = v_frozen_amt;
    SET p_reg_date = v_reg_date;
    SET p_ex_date = v_ex_date;
    SET p_arrive_date = v_arrive_date;
    SET p_begin_trade_date = v_begin_trade_date;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_处理配股到账日记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_DealPlaDateToAcctInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_DealPlaDateToAcctInfo(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_impawn_ratio decimal(18,12),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_curr_qty decimal(18,2),
    IN p_divi_cacl_num int,
    IN p_par_value decimal(16,9),
    IN p_rights_issue_qty decimal(18,2),
    IN p_placement_price decimal(16,9),
    IN p_avail_pla_qty decimal(18,2),
    IN p_frozen_qty decimal(18,2),
    IN p_frozen_amt decimal(18,4),
    IN p_reg_date int,
    IN p_ex_date int,
    IN p_arrive_date int,
    IN p_begin_trade_date int,
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
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_curr_qty decimal(18,2);
    declare v_divi_cacl_num int;
    declare v_par_value decimal(16,9);
    declare v_rights_issue_qty decimal(18,2);
    declare v_placement_price decimal(16,9);
    declare v_avail_pla_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_frozen_amt decimal(18,4);
    declare v_reg_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_tmp_pre_entry_qty decimal(18,2);
    declare v_tmp_pre_entry_amt decimal(18,4);
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_trade_code_no int;
    declare v_undo_status varchar(2);
    declare v_entry_status varchar(2);
    declare v_busi_flag int;
    declare v_act_record_flag int;
    declare v_acco_entry_flag int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_curr_qty = p_curr_qty;
    SET v_divi_cacl_num = p_divi_cacl_num;
    SET v_par_value = p_par_value;
    SET v_rights_issue_qty = p_rights_issue_qty;
    SET v_placement_price = p_placement_price;
    SET v_avail_pla_qty = p_avail_pla_qty;
    SET v_frozen_qty = p_frozen_qty;
    SET v_frozen_amt = p_frozen_amt;
    SET v_reg_date = p_reg_date;
    SET v_ex_date = p_ex_date;
    SET v_arrive_date = p_arrive_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_tmp_pre_entry_qty = 0;
    SET v_tmp_pre_entry_amt = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_no = " ";
    SET v_order_dir = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_bond_accr_intrst = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_trade_code_no = 0;
    SET v_undo_status = "0";
    SET v_entry_status = "0";
    SET v_busi_flag = 0;
    SET v_act_record_flag = 0;
    SET v_acco_entry_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #登记确认配股后的金额和数量

    /* set @待入账数量#=@可配数量#; */
    set v_pre_entry_qty=v_avail_pla_qty;

    /* set @待入账金额#=-round(@可配数量#*@配股价格#,2); */
    set v_pre_entry_amt=-round(v_avail_pla_qty*v_placement_price,2);

    /* set @临时_待入账数量#=@待入账数量#; */
    set v_tmp_pre_entry_qty=v_pre_entry_qty;

    /* set @临时_待入账金额#=@待入账金额#; */
    set v_tmp_pre_entry_amt=v_pre_entry_amt;

       /* set @成交日期#=@初始化日期#; */
       set v_strike_date=v_init_date;

       /* set @成交编号#=0; */
       set v_strike_no=0;

       /* set @订单方向#=0; */
       set v_order_dir=0;

       /* set @成交价格#=0; */
       set v_strike_price=0;

       /* set @成交数量#=0; */
       set v_strike_qty=0;

       /* set @成交金额#=0; */
       set v_strike_amt=0;

       /* set @债券计提利息#=0; */
       set v_bond_accr_intrst=0;

       /* set @入账资金流水号#=0; */
       set v_entry_money_jour_no=0;

       /* set @入账交易组持仓流水号#=0; */
       set v_entry_exgp_posi_jour_no=0;

       /* set @入账资产账户持仓流水号#=0; */
       set v_entry_asac_posi_jour_no=0;

       /* set @交易代码编号# = @证券代码编号#; */
       set v_trade_code_no = v_stock_code_no;

       /* set @回滚状态#=《回滚状态-未回滚》; */
       set v_undo_status="2";

       /* set @入账状态#=《入账状态-未入账》; */
       set v_entry_status="2";

        /* set @业务标志#=《业务标志-公司行为配股》; */
        set v_busi_flag=2001028;
        #提前待入账记录表的处理标志用于给账户系统获取数据使用

        /* set @账户登记标志#=《账户登记标志-未处理》; */
        set v_act_record_flag=2;

        /* set @账户入账标志#=《账户入账标志-未处理》; */
        set v_acco_entry_flag=2;
    #先处理 缴款入账  到账日期当天。

    /* if @待入账金额# <> 0 then */
    if v_pre_entry_amt <> 0 then

        /* set @待入账数量#=0; */
        set v_pre_entry_qty=0;

        /* [插入重复更新][清算证券_结算_提前待入账记录表][字段][字段变量][{待入账数量} = @待入账数量#, {待入账金额} = @待入账金额#][2]["提前待入账记录已存在！"] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_clsecu.tb_clsest_before_preentry (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, crncy_type, 
            exch_crncy_type, exch_rate, exch_no, stock_acco_no, 
            stock_code_no, trade_code_no, target_code_no, stock_type, 
            asset_type, pre_entry_qty, pre_entry_amt, impawn_ratio, 
            bond_accr_intrst, busi_flag, act_record_flag, acco_entry_flag, 
            entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, entry_status, 
            reg_date, arrive_date, begin_trade_date) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
            v_exch_crncy_type, v_exch_rate, v_exch_no, v_stock_acco_no, 
            v_stock_code_no, v_trade_code_no, v_target_code_no, v_stock_type, 
            v_asset_type, v_pre_entry_qty, v_pre_entry_amt, v_impawn_ratio, 
            v_bond_accr_intrst, v_busi_flag, v_act_record_flag, v_acco_entry_flag, 
            v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_entry_status, 
            v_reg_date, v_arrive_date, v_begin_trade_date) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_entry_qty = v_pre_entry_qty, pre_entry_amt = v_pre_entry_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "clsecuA.3.208.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("提前待入账记录已存在！","#",v_mysql_message);
            else
                SET v_error_info = "提前待入账记录已存在！";
            end if;
            leave label_pro;
        end if;

    end if;

    /* set @待入账数量#=@临时_待入账数量#; */
    set v_pre_entry_qty=v_tmp_pre_entry_qty;
    #再处理 配股入账 配股持仓要到 上市当天才能释放

    /* if @待入账数量# <> 0 then */
    if v_pre_entry_qty <> 0 then

        /* set @到账日期# = @上市日期#; */
        set v_arrive_date = v_begin_trade_date;

        /* set @待入账金额#=0; */
        set v_pre_entry_amt=0;

        /* [插入重复更新][清算证券_结算_提前待入账记录表][字段][字段变量][{待入账数量} = @待入账数量#, {待入账金额} = @待入账金额#][2]["提前待入账记录已存在！"] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_clsecu.tb_clsest_before_preentry (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, crncy_type, 
            exch_crncy_type, exch_rate, exch_no, stock_acco_no, 
            stock_code_no, trade_code_no, target_code_no, stock_type, 
            asset_type, pre_entry_qty, pre_entry_amt, impawn_ratio, 
            bond_accr_intrst, busi_flag, act_record_flag, acco_entry_flag, 
            entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, entry_status, 
            reg_date, arrive_date, begin_trade_date) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_crncy_type, 
            v_exch_crncy_type, v_exch_rate, v_exch_no, v_stock_acco_no, 
            v_stock_code_no, v_trade_code_no, v_target_code_no, v_stock_type, 
            v_asset_type, v_pre_entry_qty, v_pre_entry_amt, v_impawn_ratio, 
            v_bond_accr_intrst, v_busi_flag, v_act_record_flag, v_acco_entry_flag, 
            v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_entry_status, 
            v_reg_date, v_arrive_date, v_begin_trade_date) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_entry_qty = v_pre_entry_qty, pre_entry_amt = v_pre_entry_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "clsecuA.3.208.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("提前待入账记录已存在！","#",v_mysql_message);
            else
                SET v_error_info = "提前待入账记录已存在！";
            end if;
            leave label_pro;
        end if;

    end if;

    /* set @待入账金额#=@临时_待入账金额#; */
    set v_pre_entry_amt=v_tmp_pre_entry_amt;
    #处理完 缴款截止日 的记录，更改配股状态

    /* [更新表记录][清算证券_结算_配股登记表][{冻结数量}= @临时_待入账数量#,{冻结金额}=0,{配股状态}=《配股状态-已缴款》][{机构编号}=@机构编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][2][@机构编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_placement_register set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty= v_tmp_pre_entry_qty,frozen_amt=0,placement_status="2" where co_no=v_co_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.208.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_查询配股登记信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_QueryPlacementRegInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_QueryPlacementRegInfo(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_reg_date int,
    IN p_placement_status varchar(2),
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_reg_date int;
    declare v_placement_status varchar(2);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_reg_date = p_reg_date;
    SET v_placement_status = p_placement_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_结算_配股登记表][字段][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#)  and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@配股状态# = " " or {配股状态}=@配股状态#) and (@登记日期# = 0 or {登记日期}=@登记日期#)and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, curr_qty, rights_issue_qty, 
        placement_price, avail_pla_qty, frozen_qty, frozen_amt, 
        reg_date, ex_date, arrive_date, begin_trade_date, 
        placement_status from db_clsecu.tb_clsest_placement_register where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no)  and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_placement_status = " " or placement_status=v_placement_status) and (v_reg_date = 0 or reg_date=v_reg_date)and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, curr_qty, rights_issue_qty, 
        placement_price, avail_pla_qty, frozen_qty, frozen_amt, 
        reg_date, ex_date, arrive_date, begin_trade_date, 
        placement_status from db_clsecu.tb_clsest_placement_register where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no)  and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_placement_status = " " or placement_status=v_placement_status) and (v_reg_date = 0 or reg_date=v_reg_date)and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_确认配股登记信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_ComfirPlacementRegInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_ComfirPlacementRegInfo(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_avail_pla_qty decimal(18,2),
    IN p_placement_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_frozen_amt decimal(18,4)
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_avail_pla_qty decimal(18,2);
    declare v_placement_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_tmp_avail_pla_qty decimal(18,2);
    declare v_tmp_placement_status varchar(2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_curr_qty decimal(18,2);
    declare v_rights_issue_qty decimal(18,2);
    declare v_placement_price decimal(16,9);
    declare v_frozen_qty decimal(18,2);
    declare v_reg_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_tmp_frozen_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_avail_pla_qty = p_avail_pla_qty;
    SET v_placement_status = p_placement_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_frozen_amt = 0;
    SET v_tmp_avail_pla_qty = 0;
    SET v_tmp_placement_status = "0";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_curr_qty = 0;
    SET v_rights_issue_qty = 0;
    SET v_placement_price = 0;
    SET v_frozen_qty = 0;
    SET v_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_ex_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_frozen_amt = 0;

    
    label_pro:BEGIN
    
    #修改的可配数量 调整可以超过额度？

    /* set @临时_可配数量# = @可配数量#; */
    set v_tmp_avail_pla_qty = v_avail_pla_qty;

    /* set @临时_配股状态# = @配股状态#; */
    set v_tmp_placement_status = v_placement_status;

    /* [获取表记录变量][清算证券_结算_配股登记表][字段][字段变量][{机构编号} = @机构编号#  and {交易组编号} = @交易组编号#  and {资产账户编号} = @资产账户编号#  and  {股东代码编号} = @股东代码编号#  and {证券代码编号}=@证券代码编号# ][4][@机构编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, curr_qty, rights_issue_qty, 
        placement_price, avail_pla_qty, frozen_qty, frozen_amt, 
        reg_date, ex_date, arrive_date, begin_trade_date, 
        placement_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_curr_qty, v_rights_issue_qty, 
        v_placement_price, v_avail_pla_qty, v_frozen_qty, v_frozen_amt, 
        v_reg_date, v_ex_date, v_arrive_date, v_begin_trade_date, 
        v_placement_status from db_clsecu.tb_clsest_placement_register where co_no = v_co_no  and exch_group_no = v_exch_group_no  and asset_acco_no = v_asset_acco_no  and  stock_acco_no = v_stock_acco_no  and stock_code_no=v_stock_code_no  limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.3.210.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@配股状态# <> 《配股状态-未配股》][2]["当前配股状态不可确认！"] */
    if v_placement_status <> "0" then
        
        SET v_error_code = "clsecuA.3.210.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("当前配股状态不可确认！","#",v_mysql_message);
        else
            SET v_error_info = "当前配股状态不可确认！";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@初始化日期# > @到账日期#][2]["已过缴款日期,不允许确认！"] */
    if v_init_date > v_arrive_date then
        
        SET v_error_code = "clsecuA.3.210.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("已过缴款日期,不允许确认！","#",v_mysql_message);
        else
            SET v_error_info = "已过缴款日期,不允许确认！";
        end if;
        leave label_pro;
    end if;


    /* set @临时_冻结金额# = @临时_可配数量#*@配股价格#; */
    set v_tmp_frozen_amt = v_tmp_avail_pla_qty*v_placement_price;

    /* [更新表记录][清算证券_结算_配股登记表][{可配数量}= @临时_可配数量#,{冻结金额}=@临时_冻结金额#,{配股状态}=@临时_配股状态#][{机构编号}=@机构编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][2][@机构编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_placement_register set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, avail_pla_qty= v_tmp_avail_pla_qty,frozen_amt=v_tmp_frozen_amt,placement_status=v_tmp_placement_status where co_no=v_co_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.210.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* set @冻结金额# = @临时_冻结金额#; */
    set v_frozen_amt = v_tmp_frozen_amt;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_frozen_amt = v_frozen_amt;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_结算_撤销配股登记信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsest_CancelPlacementReg;;
DELIMITER ;;
CREATE PROCEDURE pra_clsest_CancelPlacementReg(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_placement_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_frozen_amt decimal(18,4)
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_placement_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_frozen_amt decimal(18,4);
    declare v_tmp_placement_status varchar(2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_curr_qty decimal(18,2);
    declare v_rights_issue_qty decimal(18,2);
    declare v_placement_price decimal(16,9);
    declare v_avail_pla_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_reg_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_placement_status = p_placement_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_frozen_amt = 0;
    SET v_tmp_placement_status = "0";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_curr_qty = 0;
    SET v_rights_issue_qty = 0;
    SET v_placement_price = 0;
    SET v_avail_pla_qty = 0;
    SET v_frozen_qty = 0;
    SET v_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_ex_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @临时_配股状态# = @配股状态#; */
    set v_tmp_placement_status = v_placement_status;

    /* [获取表记录变量][清算证券_结算_配股登记表][字段][字段变量][{机构编号} = @机构编号#  and {交易组编号} = @交易组编号#  and {资产账户编号} = @资产账户编号#  and  {股东代码编号} = @股东代码编号#  and {证券代码编号}=@证券代码编号# ][4][@机构编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, curr_qty, rights_issue_qty, 
        placement_price, avail_pla_qty, frozen_qty, frozen_amt, 
        reg_date, ex_date, arrive_date, begin_trade_date, 
        placement_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_curr_qty, v_rights_issue_qty, 
        v_placement_price, v_avail_pla_qty, v_frozen_qty, v_frozen_amt, 
        v_reg_date, v_ex_date, v_arrive_date, v_begin_trade_date, 
        v_placement_status from db_clsecu.tb_clsest_placement_register where co_no = v_co_no  and exch_group_no = v_exch_group_no  and asset_acco_no = v_asset_acco_no  and  stock_acco_no = v_stock_acco_no  and stock_code_no=v_stock_code_no  limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.3.211.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@配股状态# <> 《配股状态-已登记》][2]["当前配股状态不可撤销！"] */
    if v_placement_status <> "1" then
        
        SET v_error_code = "clsecuA.3.211.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("当前配股状态不可撤销！","#",v_mysql_message);
        else
            SET v_error_info = "当前配股状态不可撤销！";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][清算证券_结算_配股登记表][{配股状态}=@临时_配股状态#,{冻结金额}=0][{机构编号}=@机构编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][2][@机构编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clsest_placement_register set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, placement_status=v_tmp_placement_status,frozen_amt=0 where co_no=v_co_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.3.211.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_frozen_amt = v_frozen_amt;

END;;


