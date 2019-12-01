DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_获取交易组净资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_GetExgpNetAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_GetExgpNetAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_group_no int,
    IN p_crncy_type varchar(3),
    IN p_update_preci_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_nav_asset decimal(18,4),
    OUT p_cash_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_stock_asset decimal(18,4)
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
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_update_preci_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_nav_asset decimal(18,4);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_update_preci_type = p_update_preci_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_nav_asset = 0;
    SET v_cash_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_repo_asset = 0;
    SET v_stock_asset = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品外盘期货_清算接口_获取交易组净资产】*/
    call db_pdfofu.pra_pdfoclif_GetExgpNetAsset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_exch_group_no,
        v_crncy_type,
        v_update_preci_type,
        v_error_code,
        v_error_info,
        v_nav_asset,
        v_cash_asset,
        v_fund_asset,
        v_bond_asset,
        v_repo_asset,
        v_stock_asset);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuT.5.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_获取交易组净资产出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_nav_asset = v_nav_asset;
    SET p_cash_asset = v_cash_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_stock_asset = v_stock_asset;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_获取资产账户净资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_GetAsacNetAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_GetAsacNetAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_update_preci_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_nav_asset decimal(18,4),
    OUT p_cash_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_stock_asset decimal(18,4)
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
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_update_preci_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_nav_asset decimal(18,4);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_update_preci_type = p_update_preci_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_nav_asset = 0;
    SET v_cash_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_repo_asset = 0;
    SET v_stock_asset = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品外盘期货_清算接口_获取资产账户净资产】*/
    call db_pdfofu.pra_pdfoclif_GetAsacNetAsset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_asset_acco_no,
        v_crncy_type,
        v_update_preci_type,
        v_error_code,
        v_error_info,
        v_nav_asset,
        v_cash_asset,
        v_fund_asset,
        v_bond_asset,
        v_repo_asset,
        v_stock_asset);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuT.5.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_获取资产账户净资产出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_nav_asset = v_nav_asset;
    SET p_cash_asset = v_cash_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_stock_asset = v_stock_asset;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_清算资金入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_ClearCapitalRecorded;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_ClearCapitalRecorded(
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
    IN p_busi_flag int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_money_jour_no bigint
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
    declare v_busi_flag int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_busi_flag = p_busi_flag;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品外盘期货_清算接口_清算资金入账】*/
        call db_pdfofu.pra_pdfoclif_ClearCapitalRecorded(
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
            v_busi_flag,
            v_crncy_type,
            v_exch_crncy_type,
            v_occur_amt,
            v_remark_info,
            v_error_code,
            v_error_info,
            v_entry_money_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "pdfofuT.5.55.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_清算资金入账出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_回滚清算资金入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_UndoClearCapitalRecorded;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_UndoClearCapitalRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_entry_money_jour_no bigint,
    IN p_busi_flag int,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_init_date int;
    declare v_entry_money_jour_no bigint;
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
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
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_occur_amt = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品外盘期货_清算接口_获取资产账户资金流水信息】*/
    call db_pdfofu.pra_pdfoclif_GetAsacCapitalJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_entry_money_jour_no,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_crncy_type,
        v_exch_crncy_type,
        v_occur_amt);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuT.5.56.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_获取资产账户资金流水信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @变动金额# = -@变动金额#; */
    set v_occur_amt = -v_occur_amt;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品外盘期货_清算接口_清算资金入账】*/
        call db_pdfofu.pra_pdfoclif_ClearCapitalRecorded(
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
            v_busi_flag,
            v_crncy_type,
            v_exch_crncy_type,
            v_occur_amt,
            v_remark_info,
            v_error_code,
            v_error_info,
            v_entry_money_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "pdfofuT.5.56.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_清算资金入账出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @记录序号# = @入账资金流水号#; */
    set v_row_id = v_entry_money_jour_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_公司行为资金登记处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_CoActionCapiatlRegDeal;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_CoActionCapiatlRegDeal(
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
    IN p_busi_flag int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_money_jour_no bigint
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
    declare v_busi_flag int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_busi_flag = p_busi_flag;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品外盘期货_清算接口_公司行为资金登记处理】*/
        call db_pdfofu.pra_pdfoclif_CoActionCapiatlRegDeal(
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
            v_busi_flag,
            v_crncy_type,
            v_exch_crncy_type,
            v_occur_amt,
            v_remark_info,
            v_error_code,
            v_error_info,
            v_entry_money_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "pdfofuT.5.57.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_公司行为资金登记处理出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_回滚公司行为资金登记
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_UndoCoActionCapiatlReg;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_UndoCoActionCapiatlReg(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_entry_money_jour_no bigint,
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
    declare v_entry_money_jour_no bigint;
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
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
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_occur_amt = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品外盘期货_清算接口_获取资产账户资金流水信息】*/
    call db_pdfofu.pra_pdfoclif_GetAsacCapitalJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_entry_money_jour_no,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_crncy_type,
        v_exch_crncy_type,
        v_occur_amt);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuT.5.58.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_获取资产账户资金流水信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @变动金额# = -@变动金额#; */
    set v_occur_amt = -v_occur_amt;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品外盘期货_清算接口_公司行为资金登记处理】*/
        call db_pdfofu.pra_pdfoclif_CoActionCapiatlRegDeal(
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
            v_busi_flag,
            v_crncy_type,
            v_exch_crncy_type,
            v_occur_amt,
            v_remark_info,
            v_error_code,
            v_error_info,
            v_entry_money_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "pdfofuT.5.58.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_公司行为资金登记处理出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_公司行为资金到账处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_CoActionCapiatlRecordedDeal;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_CoActionCapiatlRecordedDeal(
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
    IN p_busi_flag int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
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
    declare v_busi_flag int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_busi_flag = p_busi_flag;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品外盘期货_清算接口_公司行为资金到账处理】*/
        call db_pdfofu.pra_pdfoclif_CoActionCapiatlRecordedDeal(
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
            v_busi_flag,
            v_crncy_type,
            v_exch_crncy_type,
            v_occur_amt,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdfofuT.5.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_公司行为资金到账处理出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_期货盯市盈亏入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_FutuMarkedPandlAcco;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_FutuMarkedPandlAcco(
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
    IN p_sett_marked_pandl decimal(18,4),
    IN p_busi_flag int,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_money_jour_no bigint
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
    declare v_sett_marked_pandl decimal(18,4);
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_sett_marked_pandl = p_sett_marked_pandl;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品外盘期货_清算接口_期货盯市盈亏入账】*/
        call db_pdfofu.pra_pdfoclif_FutuMarkedPandlAcco(
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
            v_sett_marked_pandl,
            v_busi_flag,
            v_remark_info,
            v_error_code,
            v_error_info,
            v_entry_money_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "pdfofuT.5.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_期货盯市盈亏入账出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_回滚期货盯市盈亏入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_UndoFutuMarkedPandlAcco;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_UndoFutuMarkedPandlAcco(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_entry_money_jour_no bigint,
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
    declare v_entry_money_jour_no bigint;
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_sett_marked_pandl decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_occur_amt = 0;
    SET v_sett_marked_pandl = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品外盘期货_清算接口_获取资产账户资金流水信息】*/
    call db_pdfofu.pra_pdfoclif_GetAsacCapitalJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_entry_money_jour_no,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_crncy_type,
        v_exch_crncy_type,
        v_occur_amt);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuT.5.61.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_获取资产账户资金流水信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @清算盯市盈亏# = -@变动金额#; */
    set v_sett_marked_pandl = -v_occur_amt;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品外盘期货_清算接口_期货盯市盈亏入账】*/
        call db_pdfofu.pra_pdfoclif_FutuMarkedPandlAcco(
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
            v_sett_marked_pandl,
            v_busi_flag,
            v_remark_info,
            v_error_code,
            v_error_info,
            v_entry_money_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "pdfofuT.5.61.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_期货盯市盈亏入账出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_清算持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_ClearPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_ClearPosiRecorded(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_unit int,
    IN p_occur_qty decimal(18,2),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_unit int;
    declare v_occur_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_unit = p_contrc_unit;
    SET v_occur_qty = p_occur_qty;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品外盘期货_清算接口_清算持仓入账】*/
        call db_pdfofu.pra_pdfoclif_ClearPosiRecorded(
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
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_unit,
            v_occur_qty,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdfofuT.5.74.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_清算持仓入账出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_回滚清算持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_UndoClearPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_UndoClearPosiRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_entry_posi_jour_no bigint,
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
    declare v_entry_posi_jour_no bigint;
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_unit int;
    declare v_occur_qty decimal(18,2);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_realize_pandl decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_entry_posi_jour_no = p_entry_posi_jour_no;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_unit = 0;
    SET v_occur_qty = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_rece_margin = 0;
    SET v_realize_pandl = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品外盘期货_清算接口_获取资产账户持仓流水信息】*/
    call db_pdfofu.pra_pdfoclif_GetAsacPosiJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_entry_posi_jour_no,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_unit,
        v_occur_qty,
        v_begin_qty,
        v_curr_qty,
        v_frozen_qty,
        v_unfroz_qty,
        v_sett_price,
        v_rece_margin,
        v_realize_pandl);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuT.5.75.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_获取资产账户持仓流水信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @变动数量#=-@变动数量#; */
    set v_occur_qty=-v_occur_qty;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品外盘期货_清算接口_清算持仓入账】*/
        call db_pdfofu.pra_pdfoclif_ClearPosiRecorded(
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
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_unit,
            v_occur_qty,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdfofuT.5.75.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_清算持仓入账出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_更新持仓结算价应收保证金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_UpdatePosiSettInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_UpdatePosiSettInfo(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_sett_price decimal(16,9),
    IN p_rece_margin decimal(18,4),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_sett_price = p_sett_price;
    SET v_rece_margin = p_rece_margin;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品外盘期货_清算接口_更新持仓结算价应收保证金】*/
        call db_pdfofu.pra_pdfoclif_UpdatePosiSettInfo(
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
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_sett_price,
            v_rece_margin,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdfofuT.5.76.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_更新持仓结算价应收保证金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_更新持仓实现盈亏
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_UpdatePosiRealizePandl;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_UpdatePosiRealizePandl(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_realize_pandl decimal(18,4),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_realize_pandl decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_realize_pandl = p_realize_pandl;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品外盘期货_清算接口_更新持仓实现盈亏】*/
        call db_pdfofu.pra_pdfoclif_UpdatePosiRealizePandl(
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
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_realize_pandl,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdfofuT.5.77.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_更新持仓实现盈亏出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_获取资产账户指定持仓数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_GetAsacRegPosiQTY;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_GetAsacRegPosiQTY(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_qty decimal(18,2),
    OUT p_sett_price decimal(16,9)
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_qty decimal(18,2);
    declare v_sett_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_qty = 0;
    SET v_sett_price = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品外盘期货_清算接口_获取资产账户指定持仓数量】*/
    call db_pdfofu.pra_pdfoclif_GetAsacRegPosiQTY(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_error_code,
        v_error_info,
        v_curr_qty,
        v_sett_price);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuT.5.78.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_获取资产账户指定持仓数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_qty = v_curr_qty;
    SET p_sett_price = v_sett_price;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_获取资产账户持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_GetAsacPosiInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_GetAsacPosiInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_query_row_id_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_unit int,
    OUT p_crncy_type varchar(3),
    OUT p_begin_qty decimal(18,2),
    OUT p_curr_qty decimal(18,2),
    OUT p_frozen_qty decimal(18,2),
    OUT p_unfroz_qty decimal(18,2),
    OUT p_sett_price decimal(16,9),
    OUT p_rece_margin decimal(18,4),
    OUT p_realize_pandl decimal(18,4)
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
    declare v_query_row_id_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_unit int;
    declare v_crncy_type varchar(3);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_realize_pandl decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_query_row_id_type = p_query_row_id_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_unit = 0;
    SET v_crncy_type = "CNY";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_rece_margin = 0;
    SET v_realize_pandl = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品外盘期货_清算接口_获取资产账户持仓信息】*/
    call db_pdfofu.pra_pdfoclif_GetAsacPosiInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_row_id,
        v_query_row_id_type,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_unit,
        v_crncy_type,
        v_begin_qty,
        v_curr_qty,
        v_frozen_qty,
        v_unfroz_qty,
        v_sett_price,
        v_rece_margin,
        v_realize_pandl);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuT.5.79.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_获取资产账户持仓信息出现错误！',v_mysql_message);
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
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_unit = v_contrc_unit;
    SET p_crncy_type = v_crncy_type;
    SET p_begin_qty = v_begin_qty;
    SET p_curr_qty = v_curr_qty;
    SET p_frozen_qty = v_frozen_qty;
    SET p_unfroz_qty = v_unfroz_qty;
    SET p_sett_price = v_sett_price;
    SET p_rece_margin = v_rece_margin;
    SET p_realize_pandl = v_realize_pandl;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_对账记录处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_AddDeli;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_AddDeli(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_entry_jour_no bigint,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_no int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_sett_price decimal(16,9),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_num int,
    IN p_pre_entry_qty decimal(18,2),
    IN p_pre_entry_amt decimal(18,4),
    IN p_rece_margin decimal(18,4),
    IN p_all_fee decimal(18,4),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
    IN p_deli_fee decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_out_all_fee decimal(18,4),
    IN p_out_report_fee decimal(18,4),
    IN p_out_cancel_fee decimal(18,4),
    IN p_out_deli_fee decimal(18,4),
    IN p_out_other_fee decimal(18,4),
    IN p_out_brkage_commis decimal(18,4),
    IN p_out_other_commis decimal(18,4),
    IN p_entry_money_jour_no bigint,
    IN p_entry_posi_jour_no bigint,
    IN p_busi_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_entry_jour_no bigint;
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
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
    declare v_busi_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_deli_jour_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_entry_jour_no = p_entry_jour_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_no = p_order_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_sett_price = p_sett_price;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_num = p_strike_num;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_rece_margin = p_rece_margin;
    SET v_all_fee = p_all_fee;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_deli_fee = p_deli_fee;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_out_all_fee = p_out_all_fee;
    SET v_out_report_fee = p_out_report_fee;
    SET v_out_cancel_fee = p_out_cancel_fee;
    SET v_out_deli_fee = p_out_deli_fee;
    SET v_out_other_fee = p_out_other_fee;
    SET v_out_brkage_commis = p_out_brkage_commis;
    SET v_out_other_commis = p_out_other_commis;
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_posi_jour_no = p_entry_posi_jour_no;
    SET v_busi_flag = p_busi_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_deli_jour_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品外盘期货_清算接口_对账记录处理】*/
        call db_pdfofu.pra_pdfoclif_AddDeli(
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
            v_pass_no,
            v_out_acco,
            v_crncy_type,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_entry_jour_no,
            v_strike_date,
            v_strike_time,
            v_strike_no,
            v_report_date,
            v_report_time,
            v_report_no,
            v_order_date,
            v_order_time,
            v_order_no,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_sett_price,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_strike_num,
            v_pre_entry_qty,
            v_pre_entry_amt,
            v_rece_margin,
            v_all_fee,
            v_report_fee,
            v_wtdraw_fee,
            v_deli_fee,
            v_other_fee,
            v_trade_commis,
            v_other_commis,
            v_out_all_fee,
            v_out_report_fee,
            v_out_cancel_fee,
            v_out_deli_fee,
            v_out_other_fee,
            v_out_brkage_commis,
            v_out_other_commis,
            v_entry_money_jour_no,
            v_entry_posi_jour_no,
            v_busi_flag,
            v_error_code,
            v_error_info,
            v_deli_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "pdfofuT.5.80.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_对账记录处理出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_deli_jour_no = v_deli_jour_no;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_清算资金持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_ClearCapitalPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_ClearCapitalPosiRecorded(
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
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_unit int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_amt decimal(18,4),
    IN p_busi_flag int,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_posi_jour_no bigint
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_unit int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_unit = p_contrc_unit;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_amt = p_occur_amt;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_entry_posi_jour_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* if @变动金额# <> 0 then */
        if v_occur_amt <> 0 then

            /* 调用【原子_产品外盘期货_清算接口_清算资金入账】*/
            call db_pdfofu.pra_pdfoclif_ClearCapitalRecorded(
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
                v_busi_flag,
                v_crncy_type,
                v_exch_crncy_type,
                v_occur_amt,
                v_remark_info,
                v_error_code,
                v_error_info,
                v_entry_money_jour_no);
            if v_error_code = "1" then
                SET v_error_code = "pdfofuT.5.101.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_清算资金入账出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* if @变动数量# <> 0 then */
        if v_occur_qty <> 0 then

            /* 调用【原子_产品外盘期货_清算接口_清算持仓入账】*/
            call db_pdfofu.pra_pdfoclif_ClearPosiRecorded(
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
                v_exch_no,
                v_futu_acco_no,
                v_contrc_code_no,
                v_contrc_unit,
                v_occur_qty,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdfofuT.5.101.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_清算持仓入账出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_posi_jour_no = v_entry_posi_jour_no;

END;;


DELIMITER ;;
use db_pdfofu;;

# 事务_产品外盘期货_清算接口_回滚清算资金持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfoclif_UndoClearCapitalPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfoclif_UndoClearCapitalPosiRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_entry_money_jour_no bigint,
    IN p_entry_posi_jour_no bigint,
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
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_unit int;
    declare v_occur_qty decimal(18,2);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_realize_pandl decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_posi_jour_no = p_entry_posi_jour_no;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_occur_amt = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_unit = 0;
    SET v_occur_qty = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_rece_margin = 0;
    SET v_realize_pandl = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* if @入账资金流水号# <> 0 then */
        if v_entry_money_jour_no <> 0 then

            /* 调用【原子_产品外盘期货_清算接口_获取资产账户资金流水信息】*/
            call db_pdfofu.pra_pdfoclif_GetAsacCapitalJour(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_entry_money_jour_no,
                v_error_code,
                v_error_info,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_crncy_type,
                v_exch_crncy_type,
                v_occur_amt);
            if v_error_code = "1" then
                SET v_error_code = "pdfofuT.5.102.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_获取资产账户资金流水信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @变动金额# = -@变动金额#; */
            set v_occur_amt = -v_occur_amt;

            /* 调用【原子_产品外盘期货_清算接口_清算资金入账】*/
            call db_pdfofu.pra_pdfoclif_ClearCapitalRecorded(
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
                v_busi_flag,
                v_crncy_type,
                v_exch_crncy_type,
                v_occur_amt,
                v_remark_info,
                v_error_code,
                v_error_info,
                v_entry_money_jour_no);
            if v_error_code = "1" then
                SET v_error_code = "pdfofuT.5.102.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_清算资金入账出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* if @入账持仓流水号# <> 0 then */
        if v_entry_posi_jour_no <> 0 then

            /* 调用【原子_产品外盘期货_清算接口_获取资产账户持仓流水信息】*/
            call db_pdfofu.pra_pdfoclif_GetAsacPosiJour(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_entry_posi_jour_no,
                v_error_code,
                v_error_info,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_exch_no,
                v_futu_acco_no,
                v_contrc_code_no,
                v_contrc_unit,
                v_occur_qty,
                v_begin_qty,
                v_curr_qty,
                v_frozen_qty,
                v_unfroz_qty,
                v_sett_price,
                v_rece_margin,
                v_realize_pandl);
            if v_error_code = "1" then
                SET v_error_code = "pdfofuT.5.102.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_获取资产账户持仓流水信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @变动数量#=-@变动数量#; */
            set v_occur_qty=-v_occur_qty;

            /* 调用【原子_产品外盘期货_清算接口_清算持仓入账】*/
            call db_pdfofu.pra_pdfoclif_ClearPosiRecorded(
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
                v_exch_no,
                v_futu_acco_no,
                v_contrc_code_no,
                v_contrc_unit,
                v_occur_qty,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdfofuT.5.102.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_清算持仓入账出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


