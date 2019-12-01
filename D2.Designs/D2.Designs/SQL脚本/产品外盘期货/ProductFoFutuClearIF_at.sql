DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_清算接口_获取交易组净资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_GetExgpNetAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_GetExgpNetAsset(
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
    
    #获取净资产

    /* [获取表记录变量语句][产品外盘期货_资金_交易组资产表][sum({净资产})][@净资产#][{初始化日期}=@初始化日期# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#] */
    select sum(nav_asset) into v_nav_asset from db_pdfofu.tb_pdfoca_exgp_asset where init_date=v_init_date and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;

    if FOUND_ROWS() = 0 then

        /* set @净资产# = 0; */
        set v_nav_asset = 0;
    end if;
    #获取现金资产

    /* [获取表记录变量语句][产品外盘期货_资金_交易组资产表][{净资产}][@现金资产#][{初始化日期}=@初始化日期# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种# and {资产类型}=《资产类型-现金》] */
    select nav_asset into v_cash_asset from db_pdfofu.tb_pdfoca_exgp_asset where init_date=v_init_date and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type and asset_type=41 limit 1;

    if FOUND_ROWS() = 0 then

        /* set @现金资产# = 0; */
        set v_cash_asset = 0;
    end if;
    #获取基金资产

    /* [获取表记录变量语句][产品外盘期货_资金_交易组资产表][{净资产}][@基金资产#][{初始化日期}=@初始化日期# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种# and ({资产类型}=《资产类型-股票基金》 or {资产类型}=《资产类型-混合基金》 or {资产类型}=《资产类型-债券基金》 or {资产类型}=《资产类型-商品基金》 or {资产类型}=《资产类型-货币基金》)] */
    select nav_asset into v_fund_asset from db_pdfofu.tb_pdfoca_exgp_asset where init_date=v_init_date and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type and (asset_type=51 or asset_type=52 or asset_type=53 or asset_type=54 or asset_type=55) limit 1;

    if FOUND_ROWS() = 0 then

        /* set @基金资产# = 0; */
        set v_fund_asset = 0;
    end if;
    #获取债券资产

    /* [获取表记录变量语句][产品外盘期货_资金_交易组资产表][{净资产}][@债券资产#][{初始化日期}=@初始化日期# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种# and ({资产类型}=《资产类型-国债》 or {资产类型}=《资产类型-企业债》 or {资产类型}=《资产类型-公司债》 or {资产类型}=《资产类型-金融债》 or {资产类型}=《资产类型-地方政府债》 or {资产类型}=《资产类型-次级债》)] */
    select nav_asset into v_bond_asset from db_pdfofu.tb_pdfoca_exgp_asset where init_date=v_init_date and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type and (asset_type=21 or asset_type=22 or asset_type=23 or asset_type=24 or asset_type=25 or asset_type=26) limit 1;

    if FOUND_ROWS() = 0 then

        /* set @债券资产# = 0; */
        set v_bond_asset = 0;
    end if;
    #获取回购资产

    /* [获取表记录变量语句][产品外盘期货_资金_交易组资产表][{净资产}][@回购资产#][{初始化日期}=@初始化日期# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种# and ({资产类型}=《资产类型-回购资产》)] */
    select nav_asset into v_repo_asset from db_pdfofu.tb_pdfoca_exgp_asset where init_date=v_init_date and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type and (asset_type=43) limit 1;

    if FOUND_ROWS() = 0 then

        /* set @回购资产# = 0; */
        set v_repo_asset = 0;
    end if;
    #获取股票资产

    /* [获取表记录变量语句][产品外盘期货_资金_交易组资产表][{净资产}][@股票资产#][{初始化日期}=@初始化日期# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种# and ({资产类型}=《资产类型-股票》)] */
    select nav_asset into v_stock_asset from db_pdfofu.tb_pdfoca_exgp_asset where init_date=v_init_date and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type and (asset_type=11) limit 1;

    if FOUND_ROWS() = 0 then

        /* set @股票资产# = 0; */
        set v_stock_asset = 0;
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

# 原子_产品外盘期货_清算接口_获取资产账户净资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_GetAsacNetAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_GetAsacNetAsset(
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
    
    #获取净资产

    /* [获取表记录变量语句][产品外盘期货_资金_资产账户资产表][sum({净资产})][@净资产#][{初始化日期}=@初始化日期# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select sum(nav_asset) into v_nav_asset from db_pdfofu.tb_pdfoca_asac_asset where init_date=v_init_date and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

    if FOUND_ROWS() = 0 then

        /* set @净资产# = 0; */
        set v_nav_asset = 0;
    end if;
    #获取现金资产

    /* [获取表记录变量语句][产品外盘期货_资金_资产账户资产表][{净资产}][@现金资产#][{初始化日期}=@初始化日期# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种# and {资产类型}=《资产类型-现金》] */
    select nav_asset into v_cash_asset from db_pdfofu.tb_pdfoca_asac_asset where init_date=v_init_date and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type and asset_type=41 limit 1;

    if FOUND_ROWS() = 0 then

        /* set @现金资产# = 0; */
        set v_cash_asset = 0;
    end if;
    #获取基金资产

    /* [获取表记录变量语句][产品外盘期货_资金_资产账户资产表][{净资产}][@基金资产#][{初始化日期}=@初始化日期# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种# and ({资产类型}=《资产类型-股票基金》 or {资产类型}=《资产类型-混合基金》 or {资产类型}=《资产类型-债券基金》 or {资产类型}=《资产类型-商品基金》 or {资产类型}=《资产类型-货币基金》)] */
    select nav_asset into v_fund_asset from db_pdfofu.tb_pdfoca_asac_asset where init_date=v_init_date and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type and (asset_type=51 or asset_type=52 or asset_type=53 or asset_type=54 or asset_type=55) limit 1;

    if FOUND_ROWS() = 0 then

        /* set @基金资产# = 0; */
        set v_fund_asset = 0;
    end if;
    #获取债券资产

    /* [获取表记录变量语句][产品外盘期货_资金_资产账户资产表][{净资产}][@债券资产#][{初始化日期}=@初始化日期# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种# and ({资产类型}=《资产类型-国债》 or {资产类型}=《资产类型-企业债》 or {资产类型}=《资产类型-公司债》 or {资产类型}=《资产类型-金融债》 or {资产类型}=《资产类型-地方政府债》 or {资产类型}=《资产类型-次级债》)] */
    select nav_asset into v_bond_asset from db_pdfofu.tb_pdfoca_asac_asset where init_date=v_init_date and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type and (asset_type=21 or asset_type=22 or asset_type=23 or asset_type=24 or asset_type=25 or asset_type=26) limit 1;

    if FOUND_ROWS() = 0 then

        /* set @债券资产# = 0; */
        set v_bond_asset = 0;
    end if;
    #获取回购资产

    /* [获取表记录变量语句][产品外盘期货_资金_资产账户资产表][{净资产}][@回购资产#][{初始化日期}=@初始化日期# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种# and ({资产类型}=《资产类型-回购资产》)] */
    select nav_asset into v_repo_asset from db_pdfofu.tb_pdfoca_asac_asset where init_date=v_init_date and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type and (asset_type=43) limit 1;

    if FOUND_ROWS() = 0 then

        /* set @回购资产# = 0; */
        set v_repo_asset = 0;
    end if;
    #获取股票资产

    /* [获取表记录变量语句][产品外盘期货_资金_资产账户资产表][{净资产}][@股票资产#][{初始化日期}=@初始化日期# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种# and ({资产类型}=《资产类型-股票》)] */
    select nav_asset into v_stock_asset from db_pdfofu.tb_pdfoca_asac_asset where init_date=v_init_date and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type and (asset_type=11) limit 1;

    if FOUND_ROWS() = 0 then

        /* set @股票资产# = 0; */
        set v_stock_asset = 0;
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

# 原子_产品外盘期货_清算接口_获取资产账户资金流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_GetAsacCapitalJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_GetAsacCapitalJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_entry_money_jour_no bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
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
    declare v_entry_money_jour_no bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_busi_flag int;
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
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
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_occur_amt = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品外盘期货_资金_资产账户资金流水表][字段][字段变量][{记录序号}=@入账资金流水号#][4][@入账资金流水号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, busi_flag, 
        crncy_type, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_menu_no, v_oper_func_code, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_busi_flag, 
        v_crncy_type, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info from db_pdfofu.tb_pdfoca_asac_capit_jour where row_id=v_entry_money_jour_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.5.51.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("入账资金流水号=",v_entry_money_jour_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("入账资金流水号=",v_entry_money_jour_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_occur_amt = v_occur_amt;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_清算接口_交易组资金入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_ExgpCapitalRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_ExgpCapitalRecorded(
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
    IN p_busi_flag int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_curr_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
    IN p_unfroz_amt decimal(18,4),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
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
    declare v_busi_flag int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_menu_no int;
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_asset_acco_no int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_begin_amt decimal(18,4);
    declare v_capt_margin decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_marked_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_jour_after_occur_info varchar(2048);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_busi_flag = p_busi_flag;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_unfroz_amt = p_unfroz_amt;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_menu_no = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_remark_info = " ";
    SET v_asset_acco_no = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_begin_amt = 0;
    SET v_capt_margin = 0;
    SET v_close_pandl = 0;
    SET v_marked_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @操作菜单# =0; */
    set v_oper_menu_no =0;

    /* set @变动后金额# =0; */
    set v_occur_end_amt =0;

    /* set @操作备注# = " "; */
    set v_oper_remark_info = " ";

    /* set @资产账户编号# =0; */
    set v_asset_acco_no =0;

    /* set @变动金额# = @当前金额#; */
    set v_occur_amt = v_curr_amt;
    #处理交易组资金入账

    /* [获取流水变动][{当前金额},{冻结金额},{解冻金额}][@当前金额#,@冻结金额#,@解冻金额#] */
    set v_jour_occur_field = concat("当前金额","|","冻结金额","|","解冻金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|");


    /* [更新表记录][产品外盘期货_资金_交易组资金表][{当前金额}={当前金额}+@当前金额#,{冻结金额}={冻结金额}+@冻结金额#,{解冻金额}={解冻金额}+@解冻金额#,{累计应收金额}={累计应收金额}+@累计应收金额#,{累计应付金额}={累计应付金额}+@累计应付金额#,{备注信息}=@备注信息#][{交易组编号}=@交易组编号# and {本币币种}=@本币币种# and {资产账户编号}=@资产账户编号#][2][@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt+v_curr_amt,frozen_amt=frozen_amt+v_frozen_amt,unfroz_amt=unfroz_amt+v_unfroz_amt,total_rece_amt=total_rece_amt+v_total_rece_amt,total_payab_amt=total_payab_amt+v_total_payab_amt,remark_info=v_remark_info where exch_group_no=v_exch_group_no and crncy_type=v_crncy_type and asset_acco_no=v_asset_acco_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.5.53.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_交易组资金表][字段][字段变量][{交易组编号}=@交易组编号# and {本币币种}=@本币币种# and {资产账户编号}=@资产账户编号#][4][@交易组编号#,@本币币种#] */
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
        v_total_payab_amt, v_intrst_rate, v_intrst_base_amt, v_pre_entry_intrst_amt from db_pdfofu.tb_pdfoca_exgp_capit where exch_group_no=v_exch_group_no and crncy_type=v_crncy_type and asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.5.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#,@冻结金额#,@解冻金额#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|");


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
                
        SET v_error_code = "pdfofuA.5.53.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_清算接口_资产账户资金入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_AsacCapitalRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_AsacCapitalRecorded(
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
    IN p_curr_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
    IN p_unfroz_amt decimal(18,4),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
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
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
    declare v_oper_menu_no int;
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_begin_amt decimal(18,4);
    declare v_capt_margin decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_marked_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_jour_after_occur_info varchar(2048);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_busi_flag = p_busi_flag;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_unfroz_amt = p_unfroz_amt;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_oper_menu_no = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_remark_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_begin_amt = 0;
    SET v_capt_margin = 0;
    SET v_close_pandl = 0;
    SET v_marked_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @操作菜单# =0; */
    set v_oper_menu_no =0;

    /* set @变动后金额# =0; */
    set v_occur_end_amt =0;

    /* set @操作备注# = " "; */
    set v_oper_remark_info = " ";

    /* set @变动金额# = @当前金额#; */
    set v_occur_amt = v_curr_amt;
    #处理资产账户资金入账

    /* [获取流水变动][{当前金额},{冻结金额},{解冻金额}][@当前金额#,@冻结金额#,@解冻金额#] */
    set v_jour_occur_field = concat("当前金额","|","冻结金额","|","解冻金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|");


    /* [更新表记录][产品外盘期货_资金_资产账户资金表][{当前金额}={当前金额}+@当前金额#,{冻结金额}={冻结金额}+@冻结金额#,{解冻金额}={解冻金额}+@解冻金额#,{累计应收金额}={累计应收金额}+@累计应收金额#,{累计应付金额}={累计应付金额}+@累计应付金额#,{备注信息}=@备注信息#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt+v_curr_amt,frozen_amt=frozen_amt+v_frozen_amt,unfroz_amt=unfroz_amt+v_unfroz_amt,total_rece_amt=total_rece_amt+v_total_rece_amt,total_payab_amt=total_payab_amt+v_total_payab_amt,remark_info=v_remark_info where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.5.54.2";
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
                
        SET v_error_code = "pdfofuA.5.54.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#,@冻结金额#,@解冻金额#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|");


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
                
        SET v_error_code = "pdfofuA.5.54.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@入账资金流水号#] */
    select LAST_INSERT_ID() into v_entry_money_jour_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_清算接口_清算资金入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_ClearCapitalRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_ClearCapitalRecorded(
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
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;

    
    label_pro:BEGIN
    

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;
    #根据汇率重置入账金额

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;

    /* set @冻结金额# = 0; */
    set v_frozen_amt = 0;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;
    #处理交易组资金入账

    /* 调用【原子_产品外盘期货_清算接口_交易组资金入账】*/
    call db_pdfofu.pra_pdfoclif_ExgpCapitalRecorded(
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
        v_busi_flag,
        v_crncy_type,
        v_exch_crncy_type,
        v_occur_amt,
        v_curr_amt,
        v_frozen_amt,
        v_unfroz_amt,
        v_total_rece_amt,
        v_total_payab_amt,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuA.5.55.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_交易组资金入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #处理资产账户资金入账

    /* 调用【原子_产品外盘期货_清算接口_资产账户资金入账】*/
    call db_pdfofu.pra_pdfoclif_AsacCapitalRecorded(
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
        v_curr_amt,
        v_frozen_amt,
        v_unfroz_amt,
        v_total_rece_amt,
        v_total_payab_amt,
        v_remark_info,
        v_error_code,
        v_error_info,
        v_entry_money_jour_no);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuA.5.55.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_资产账户资金入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_清算接口_公司行为资金登记处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_CoActionCapiatlRegDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_CoActionCapiatlRegDeal(
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
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_total_payab_amt = 0;

    
    label_pro:BEGIN
    

    /* if @业务标志#=《红利入账》  then */
    if v_busi_flag=红利入账  then

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @冻结金额# = @变动金额#; */
        set v_frozen_amt = v_occur_amt;

        /* set @累计应收金额# = 0; */
        set v_total_rece_amt = 0;

    /* elseif @业务标志#=《债券付息》 or @业务标志#=《债券兑付》 then */
    elseif v_busi_flag=债券付息 or v_busi_flag=债券兑付 then

        /* set @当前金额# = 0; */
        set v_curr_amt = 0;

        /* set @冻结金额# = 0; */
        set v_frozen_amt = 0;

        /* set @累计应收金额# = @变动金额#; */
        set v_total_rece_amt = v_occur_amt;
    end if;

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;
    #处理交易组资金入账

    /* 调用【原子_产品外盘期货_清算接口_交易组资金入账】*/
    call db_pdfofu.pra_pdfoclif_ExgpCapitalRecorded(
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
        v_busi_flag,
        v_crncy_type,
        v_exch_crncy_type,
        v_occur_amt,
        v_curr_amt,
        v_frozen_amt,
        v_unfroz_amt,
        v_total_rece_amt,
        v_total_payab_amt,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuA.5.57.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_交易组资金入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #处理资产账户资金入账

    /* 调用【原子_产品外盘期货_清算接口_资产账户资金入账】*/
    call db_pdfofu.pra_pdfoclif_AsacCapitalRecorded(
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
        v_curr_amt,
        v_frozen_amt,
        v_unfroz_amt,
        v_total_rece_amt,
        v_total_payab_amt,
        v_remark_info,
        v_error_code,
        v_error_info,
        v_entry_money_jour_no);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuA.5.57.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_资产账户资金入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_清算接口_公司行为资金到账处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_CoActionCapiatlRecordedDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_CoActionCapiatlRecordedDeal(
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
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_entry_money_jour_no bigint;
    declare v_unfroz_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_entry_money_jour_no = 0;
    SET v_unfroz_amt = 0;
    SET v_total_payab_amt = 0;

    
    label_pro:BEGIN
    

    /* if @业务标志#=《红利入账》 then */
    if v_busi_flag=红利入账 then

        /* set @当前金额# = 0; */
        set v_curr_amt = 0;

        /* set @冻结金额# = -@变动金额#; */
        set v_frozen_amt = -v_occur_amt;

        /* set @累计应收金额# = 0; */
        set v_total_rece_amt = 0;

    /* elseif @业务标志#=《债券付息》 or @业务标志#=《债券兑付》 then */
    elseif v_busi_flag=债券付息 or v_busi_flag=债券兑付 then

        /* set @当前金额# = -@变动金额#; */
        set v_curr_amt = -v_occur_amt;

        /* set @冻结金额# = 0; */
        set v_frozen_amt = 0;

        /* set @累计应收金额# = @变动金额#; */
        set v_total_rece_amt = v_occur_amt;
    end if;

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;
    #处理交易组资金入账

    /* 调用【原子_产品外盘期货_清算接口_交易组资金入账】*/
    call db_pdfofu.pra_pdfoclif_ExgpCapitalRecorded(
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
        v_busi_flag,
        v_crncy_type,
        v_exch_crncy_type,
        v_occur_amt,
        v_curr_amt,
        v_frozen_amt,
        v_unfroz_amt,
        v_total_rece_amt,
        v_total_payab_amt,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuA.5.59.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_交易组资金入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #处理资产账户资金入账

    /* 调用【原子_产品外盘期货_清算接口_资产账户资金入账】*/
    call db_pdfofu.pra_pdfoclif_AsacCapitalRecorded(
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
        v_curr_amt,
        v_frozen_amt,
        v_unfroz_amt,
        v_total_rece_amt,
        v_total_payab_amt,
        v_remark_info,
        v_error_code,
        v_error_info,
        v_entry_money_jour_no);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuA.5.59.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_资产账户资金入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_清算接口_期货盯市盈亏入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_FutuMarkedPandlAcco;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_FutuMarkedPandlAcco(
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
    declare v_sett_marked_pandl decimal(18,4);
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
    declare v_curr_amt decimal(18,4);
    declare v_occur_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_sett_marked_pandl = p_sett_marked_pandl;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_curr_amt = 0;
    SET v_occur_amt = 0;
    SET v_frozen_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_total_payab_amt = 0;

    
    label_pro:BEGIN
    

    /* if @清算盯市盈亏#<>0 then */
    if v_sett_marked_pandl<>0 then

        /* set @当前金额# = @清算盯市盈亏#; */
        set v_curr_amt = v_sett_marked_pandl;

        /* set @变动金额# = @清算盯市盈亏#; */
        set v_occur_amt = v_sett_marked_pandl;

        /* set @冻结金额# = 0; */
        set v_frozen_amt = 0;

        /* set @累计应收金额# = 0; */
        set v_total_rece_amt = 0;

        /* set @入账资金流水号# = 0; */
        set v_entry_money_jour_no = 0;

        /* set @解冻金额# = 0; */
        set v_unfroz_amt = 0;

        /* set @累计应付金额# = 0; */
        set v_total_payab_amt = 0;
        #处理交易组资金入账

        /* 调用【原子_产品外盘期货_清算接口_交易组资金入账】*/
        call db_pdfofu.pra_pdfoclif_ExgpCapitalRecorded(
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
            v_busi_flag,
            v_crncy_type,
            v_exch_crncy_type,
            v_occur_amt,
            v_curr_amt,
            v_frozen_amt,
            v_unfroz_amt,
            v_total_rece_amt,
            v_total_payab_amt,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdfofuA.5.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_交易组资金入账出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

        #处理资产账户资金入账

        /* 调用【原子_产品外盘期货_清算接口_资产账户资金入账】*/
        call db_pdfofu.pra_pdfoclif_AsacCapitalRecorded(
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
            v_curr_amt,
            v_frozen_amt,
            v_unfroz_amt,
            v_total_rece_amt,
            v_total_payab_amt,
            v_remark_info,
            v_error_code,
            v_error_info,
            v_entry_money_jour_no);
        if v_error_code = "1" then
            SET v_error_code = "pdfofuA.5.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_资产账户资金入账出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_清算接口_获取资产账户持仓流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_GetAsacPosiJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_GetAsacPosiJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_entry_posi_jour_no bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_unit int,
    OUT p_occur_qty decimal(18,2),
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
    declare v_entry_posi_jour_no bigint;
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_busi_flag int;
    declare v_occur_end_qty decimal(18,2);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
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
    SET v_entry_posi_jour_no = p_entry_posi_jour_no;
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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_busi_flag = 0;
    SET v_occur_end_qty = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品外盘期货_持仓_资产账户持仓流水表][字段][字段变量][{记录序号}=@入账持仓流水号#][4][@入账持仓流水号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_menu_no, v_oper_func_code, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_busi_flag, v_occur_qty, 
        v_occur_end_qty, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info from db_pdfofu.tb_pdfopo_asac_posi_jour where row_id=v_entry_posi_jour_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.5.71.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("入账持仓流水号=",v_entry_posi_jour_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("入账持仓流水号=",v_entry_posi_jour_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_unit = v_contrc_unit;
    SET p_occur_qty = v_occur_qty;
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

# 原子_产品外盘期货_清算接口_资产账户持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_AsacPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_AsacPosiRecorded(
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
    IN p_begin_qty decimal(18,2),
    IN p_curr_qty decimal(18,2),
    IN p_frozen_qty decimal(18,2),
    IN p_unfroz_qty decimal(18,2),
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
    declare v_contrc_unit int;
    declare v_occur_qty decimal(18,2);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_contrc_type int;
    declare v_oper_menu_no int;
    declare v_busi_flag int;
    declare v_occur_end_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_oper_func_code varchar(16);
    declare v_tmp_begin_qty decimal(18,2);
    declare v_tmp_curr_qty decimal(18,2);
    declare v_tmp_frozen_qty decimal(18,2);
    declare v_tmp_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_jour_occur_field varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_begin_qty = p_begin_qty;
    SET v_curr_qty = p_curr_qty;
    SET v_frozen_qty = p_frozen_qty;
    SET v_unfroz_qty = p_unfroz_qty;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_contrc_type = 0;
    SET v_oper_menu_no = 0;
    SET v_busi_flag = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_remark_info = " ";
    SET v_oper_func_code = " ";
    SET v_tmp_begin_qty = 0;
    SET v_tmp_curr_qty = 0;
    SET v_tmp_frozen_qty = 0;
    SET v_tmp_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_rece_margin = 0;
    SET v_realize_pandl = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_jour_occur_field = " ";

    
    label_pro:BEGIN
    

    /* set @合约类型# =0; */
    set v_contrc_type =0;

    /* set @操作菜单# =0; */
    set v_oper_menu_no =0;

    /* set @业务标志# =0; */
    set v_busi_flag =0;

    /* set @变动后数量# =0; */
    set v_occur_end_qty =0;

    /* set @操作备注# =" "; */
    set v_oper_remark_info =" ";

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;
    #先保存一下临时值，以免后续获取时变量冲掉。

    /* set @临时_期初数量#=@期初数量#; */
    set v_tmp_begin_qty=v_begin_qty;

    /* set @临时_当前数量#=@当前数量#; */
    set v_tmp_curr_qty=v_curr_qty;

    /* set @临时_冻结数量#=@冻结数量#; */
    set v_tmp_frozen_qty=v_frozen_qty;

    /* set @临时_解冻数量#=@解冻数量#; */
    set v_tmp_unfroz_qty=v_unfroz_qty;
    #用于插入表记录时初值，更新时无用。

    /* set @结算价#=0; */
    set v_sett_price=0;

    /* set @应收保证金#=0; */
    set v_rece_margin=0;

    /* set @实现盈亏#=0; */
    set v_realize_pandl=0;
    #持仓记录不存在，则插入，否则更新

    /* [插入重复更新][产品外盘期货_持仓_资产账户持仓表][字段][字段变量][{期初数量}={期初数量}+@期初数量#,{当前数量}={当前数量}+@当前数量#,{冻结数量}={冻结数量}+@冻结数量#,{解冻数量}={解冻数量}+@解冻数量#][1][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfopo_asac_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, sett_price, rece_margin, 
        realize_pandl) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
        v_contrc_type, v_contrc_unit, v_begin_qty, v_curr_qty, 
        v_frozen_qty, v_unfroz_qty, v_sett_price, v_rece_margin, 
        v_realize_pandl) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, begin_qty=begin_qty+v_begin_qty,curr_qty=curr_qty+v_curr_qty,frozen_qty=frozen_qty+v_frozen_qty,unfroz_qty=unfroz_qty+v_unfroz_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.5.72.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_资产账户持仓表][字段][字段变量][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号#][4][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, sett_price, 
        rece_margin, realize_pandl into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_type, v_contrc_unit, v_begin_qty, 
        v_curr_qty, v_frozen_qty, v_unfroz_qty, v_sett_price, 
        v_rece_margin, v_realize_pandl from db_pdfofu.tb_pdfopo_asac_posi where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.5.72.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@期初数量#,@当前数量#,@冻结数量#,@解冻数量#] */
    set v_jour_after_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|");

    #重置回来各字段的变化值。

    /* set @期初数量#=@临时_期初数量#; */
    set v_begin_qty=v_tmp_begin_qty;

    /* set @当前数量#=@临时_当前数量#; */
    set v_curr_qty=v_tmp_curr_qty;

    /* set @冻结数量#=@临时_冻结数量#; */
    set v_frozen_qty=v_tmp_frozen_qty;

    /* set @解冻数量#=@临时_解冻数量#; */
    set v_unfroz_qty=v_tmp_unfroz_qty;

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
                
        SET v_error_code = "pdfofuA.5.72.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_清算接口_交易组持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_ExchGroupPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_ExchGroupPosiRecorded(
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
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_unit int,
    IN p_occur_qty decimal(18,2),
    IN p_begin_qty decimal(18,2),
    IN p_curr_qty decimal(18,2),
    IN p_frozen_qty decimal(18,2),
    IN p_unfroz_qty decimal(18,2),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_unit int;
    declare v_occur_qty decimal(18,2);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_posi_jour_no bigint;
    declare v_asset_acco_no int;
    declare v_contrc_type int;
    declare v_oper_menu_no int;
    declare v_busi_flag int;
    declare v_occur_end_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_oper_func_code varchar(16);
    declare v_tmp_begin_qty decimal(18,2);
    declare v_tmp_curr_qty decimal(18,2);
    declare v_tmp_frozen_qty decimal(18,2);
    declare v_tmp_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_jour_occur_field varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_unit = p_contrc_unit;
    SET v_occur_qty = p_occur_qty;
    SET v_begin_qty = p_begin_qty;
    SET v_curr_qty = p_curr_qty;
    SET v_frozen_qty = p_frozen_qty;
    SET v_unfroz_qty = p_unfroz_qty;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_posi_jour_no = 0;
    SET v_asset_acco_no = 0;
    SET v_contrc_type = 0;
    SET v_oper_menu_no = 0;
    SET v_busi_flag = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_remark_info = " ";
    SET v_oper_func_code = " ";
    SET v_tmp_begin_qty = 0;
    SET v_tmp_curr_qty = 0;
    SET v_tmp_frozen_qty = 0;
    SET v_tmp_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_rece_margin = 0;
    SET v_realize_pandl = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_jour_occur_field = " ";

    
    label_pro:BEGIN
    

    /* set @资产账户编号# =0; */
    set v_asset_acco_no =0;

    /* set @合约类型# =0; */
    set v_contrc_type =0;

    /* set @操作菜单# =0; */
    set v_oper_menu_no =0;

    /* set @业务标志# =0; */
    set v_busi_flag =0;

    /* set @变动后数量# =0; */
    set v_occur_end_qty =0;

    /* set @操作备注# =" "; */
    set v_oper_remark_info =" ";

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;
    #先保存一下临时值，以免后续获取时变量冲掉。

    /* set @临时_期初数量#=@期初数量#; */
    set v_tmp_begin_qty=v_begin_qty;

    /* set @临时_当前数量#=@当前数量#; */
    set v_tmp_curr_qty=v_curr_qty;

    /* set @临时_冻结数量#=@冻结数量#; */
    set v_tmp_frozen_qty=v_frozen_qty;

    /* set @临时_解冻数量#=@解冻数量#; */
    set v_tmp_unfroz_qty=v_unfroz_qty;
    #用于插入表记录时初值，更新时无用。

    /* set @结算价#=0; */
    set v_sett_price=0;

    /* set @应收保证金#=0; */
    set v_rece_margin=0;

    /* set @实现盈亏#=0; */
    set v_realize_pandl=0;
    #持仓记录不存在，则插入，否则更新

    /* [插入重复更新][产品外盘期货_持仓_交易组持仓表][字段][字段变量][{期初数量}={期初数量}+@期初数量#,{当前数量}={当前数量}+@当前数量#,{冻结数量}={冻结数量}+@冻结数量#,{解冻数量}={解冻数量}+@解冻数量#][1][@交易组编号#,@交易编码编号#,@合约代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfopo_exgp_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, sett_price, 
        rece_margin, realize_pandl) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_group_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_type, v_contrc_unit, v_begin_qty, 
        v_curr_qty, v_frozen_qty, v_unfroz_qty, v_sett_price, 
        v_rece_margin, v_realize_pandl) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, begin_qty=begin_qty+v_begin_qty,curr_qty=curr_qty+v_curr_qty,frozen_qty=frozen_qty+v_frozen_qty,unfroz_qty=unfroz_qty+v_unfroz_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.5.73.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_交易组持仓表][字段][字段变量][{交易组编号}=@交易组编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号#][4][@交易组编号#,@交易编码编号#,@合约代码编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        sett_price, rece_margin, realize_pandl into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_contrc_unit, 
        v_begin_qty, v_curr_qty, v_frozen_qty, v_unfroz_qty, 
        v_sett_price, v_rece_margin, v_realize_pandl from db_pdfofu.tb_pdfopo_exgp_posi where exch_group_no=v_exch_group_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.5.73.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@期初数量#,@当前数量#,@冻结数量#,@解冻数量#] */
    set v_jour_after_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|");

    #重置回来各字段的变化值。

    /* set @期初数量#=@临时_期初数量#; */
    set v_begin_qty=v_tmp_begin_qty;

    /* set @当前数量#=@临时_当前数量#; */
    set v_curr_qty=v_tmp_curr_qty;

    /* set @冻结数量#=@临时_冻结数量#; */
    set v_frozen_qty=v_tmp_frozen_qty;

    /* set @解冻数量#=@临时_解冻数量#; */
    set v_unfroz_qty=v_tmp_unfroz_qty;

    /* [插入表记录][产品外盘期货_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#,@交易编码编号#,@合约代码编号#] */
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
                
        SET v_error_code = "pdfofuA.5.73.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@入账持仓流水号#] */
    select LAST_INSERT_ID() into v_entry_posi_jour_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_posi_jour_no = v_entry_posi_jour_no;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_清算接口_清算持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_ClearPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_ClearPosiRecorded(
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
    declare v_contrc_unit int;
    declare v_occur_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_func_code varchar(16);
    declare v_curr_qty decimal(18,2);
    declare v_begin_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_unit = p_contrc_unit;
    SET v_occur_qty = p_occur_qty;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_func_code = " ";
    SET v_curr_qty = 0;
    SET v_begin_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_entry_posi_jour_no = 0;

    
    label_pro:BEGIN
    

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* set @当前数量#=@变动数量#; */
    set v_curr_qty=v_occur_qty;

    /* set @期初数量#=0; */
    set v_begin_qty=0;

    /* set @冻结数量#=0; */
    set v_frozen_qty=0;

    /* set @解冻数量#=0; */
    set v_unfroz_qty=0;
    #处理交易组持仓

    /* 调用【原子_产品外盘期货_清算接口_交易组持仓入账】*/
    call db_pdfofu.pra_pdfoclif_ExchGroupPosiRecorded(
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
        v_exch_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_contrc_unit,
        v_occur_qty,
        v_begin_qty,
        v_curr_qty,
        v_frozen_qty,
        v_unfroz_qty,
        v_remark_info,
        v_error_code,
        v_error_info,
        v_entry_posi_jour_no);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuA.5.74.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_交易组持仓入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #处理资产账户持仓

    /* 调用【原子_产品外盘期货_清算接口_资产账户持仓入账】*/
    call db_pdfofu.pra_pdfoclif_AsacPosiRecorded(
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
        v_begin_qty,
        v_curr_qty,
        v_frozen_qty,
        v_unfroz_qty,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfofuA.5.74.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品外盘期货_清算接口_资产账户持仓入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_清算接口_更新持仓结算价应收保证金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_UpdatePosiSettInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_UpdatePosiSettInfo(
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
    declare v_oper_menu_no int;
    declare v_busi_flag int;
    declare v_occur_end_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_oper_func_code varchar(16);
    declare v_tmp_rece_margin decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_oper_menu_no = 0;
    SET v_busi_flag = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_remark_info = " ";
    SET v_oper_func_code = " ";
    SET v_tmp_rece_margin = 0;
    SET v_occur_qty = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_realize_pandl = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";

    
    label_pro:BEGIN
    

    /* set @操作菜单# =0; */
    set v_oper_menu_no =0;

    /* set @业务标志# =0; */
    set v_busi_flag =0;

    /* set @变动后数量# =0; */
    set v_occur_end_qty =0;

    /* set @操作备注# =" "; */
    set v_oper_remark_info =" ";

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* set @临时_应收保证金#=@应收保证金#; */
    set v_tmp_rece_margin=v_rece_margin;

    /* set @变动数量#=0; */
    set v_occur_qty=0;

    /* set @期初数量#=0; */
    set v_begin_qty=0;

    /* set @当前数量#=0; */
    set v_curr_qty=0;

    /* set @冻结数量#=0; */
    set v_frozen_qty=0;

    /* set @解冻数量#=0; */
    set v_unfroz_qty=0;

    /* set @实现盈亏#=0; */
    set v_realize_pandl=0;
    #处理交易组持仓

    /* [更新表记录][产品外盘期货_持仓_交易组持仓表][{结算价}=@结算价#, {应收保证金}={应收保证金}+@应收保证金#][{交易组编号}=@交易组编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号#][2][@交易组编号#,@交易编码编号#,@合约代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_price=v_sett_price, rece_margin=rece_margin+v_rece_margin where exch_group_no=v_exch_group_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.5.76.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_交易组持仓表][{结算价},{应收保证金}][@结算价#,@应收保证金#][{交易组编号}=@交易组编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号#][4][@交易组编号#,@交易编码编号#,@合约代码编号#] */
    select sett_price,rece_margin into v_sett_price,v_rece_margin from db_pdfofu.tb_pdfopo_exgp_posi where exch_group_no=v_exch_group_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.5.76.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@结算价#,@应收保证金#] */
    set v_jour_after_occur_info = concat(v_sett_price,"|",v_rece_margin,"|");

    #重置回来各字段的变化值。

    /* set @应收保证金#=@临时_应收保证金#; */
    set v_rece_margin=v_tmp_rece_margin;

    /* [插入表记录][产品外盘期货_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#,@交易编码编号#,@合约代码编号#] */
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
                
        SET v_error_code = "pdfofuA.5.76.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #处理资产账户持仓

    /* [更新表记录][产品外盘期货_持仓_资产账户持仓表][{结算价}=@结算价#, {应收保证金}={应收保证金}+@应收保证金#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_price=v_sett_price, rece_margin=rece_margin+v_rece_margin where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.5.76.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_资产账户持仓表][{结算价},{应收保证金}][@结算价#,@应收保证金#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号#][4][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    select sett_price,rece_margin into v_sett_price,v_rece_margin from db_pdfofu.tb_pdfopo_asac_posi where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.5.76.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@结算价#,@应收保证金#] */
    set v_jour_after_occur_info = concat(v_sett_price,"|",v_rece_margin,"|");

    #重置回来各字段的变化值。

    /* set @应收保证金#=@临时_应收保证金#; */
    set v_rece_margin=v_tmp_rece_margin;

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
                
        SET v_error_code = "pdfofuA.5.76.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_清算接口_更新持仓实现盈亏
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_UpdatePosiRealizePandl;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_UpdatePosiRealizePandl(
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
    declare v_oper_menu_no int;
    declare v_busi_flag int;
    declare v_occur_end_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_oper_func_code varchar(16);
    declare v_tmp_realize_pandl decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_update_date int;
    declare v_update_time int;
    declare v_sett_price decimal(16,9);
    declare v_jour_after_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_oper_menu_no = 0;
    SET v_busi_flag = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_remark_info = " ";
    SET v_oper_func_code = " ";
    SET v_tmp_realize_pandl = 0;
    SET v_occur_qty = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_rece_margin = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_sett_price = 0;
    SET v_jour_after_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";

    
    label_pro:BEGIN
    

    /* set @操作菜单# =0; */
    set v_oper_menu_no =0;

    /* set @业务标志# =0; */
    set v_busi_flag =0;

    /* set @变动后数量# =0; */
    set v_occur_end_qty =0;

    /* set @操作备注# =" "; */
    set v_oper_remark_info =" ";

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* set @临时_实现盈亏#=@实现盈亏#; */
    set v_tmp_realize_pandl=v_realize_pandl;

    /* set @变动数量#=0; */
    set v_occur_qty=0;

    /* set @期初数量#=0; */
    set v_begin_qty=0;

    /* set @当前数量#=0; */
    set v_curr_qty=0;

    /* set @冻结数量#=0; */
    set v_frozen_qty=0;

    /* set @解冻数量#=0; */
    set v_unfroz_qty=0;

    /* set @应收保证金#=0; */
    set v_rece_margin=0;
    #处理交易组持仓

    /* [更新表记录][产品外盘期货_持仓_交易组持仓表][{实现盈亏}={实现盈亏}+@实现盈亏#][{交易组编号}=@交易组编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号#][2][@交易组编号#,@交易编码编号#,@合约代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, realize_pandl=realize_pandl+v_realize_pandl where exch_group_no=v_exch_group_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.5.77.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_交易组持仓表][{结算价},{实现盈亏}][@结算价#,@实现盈亏#][{交易组编号}=@交易组编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号#][4][@交易组编号#,@交易编码编号#,@合约代码编号#] */
    select sett_price,realize_pandl into v_sett_price,v_realize_pandl from db_pdfofu.tb_pdfopo_exgp_posi where exch_group_no=v_exch_group_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.5.77.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@结算价#,@实现盈亏#] */
    set v_jour_after_occur_info = concat(v_sett_price,"|",v_realize_pandl,"|");

    #重置回来各字段的变化值。

    /* set @实现盈亏#=@临时_实现盈亏#; */
    set v_realize_pandl=v_tmp_realize_pandl;

    /* [插入表记录][产品外盘期货_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#,@交易编码编号#,@合约代码编号#] */
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
                
        SET v_error_code = "pdfofuA.5.77.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #处理资产账户持仓

    /* [更新表记录][产品外盘期货_持仓_资产账户持仓表][{实现盈亏}={实现盈亏}+@实现盈亏#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, realize_pandl=realize_pandl+v_realize_pandl where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.5.77.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_资产账户持仓表][{结算价},{实现盈亏}][@结算价#,@实现盈亏#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号#][4][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    select sett_price,realize_pandl into v_sett_price,v_realize_pandl from db_pdfofu.tb_pdfopo_asac_posi where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.5.77.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@结算价#,@实现盈亏#] */
    set v_jour_after_occur_info = concat(v_sett_price,"|",v_realize_pandl,"|");

    #重置回来各字段的变化值。

    /* set @实现盈亏#=@临时_实现盈亏#; */
    set v_realize_pandl=v_tmp_realize_pandl;

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
                
        SET v_error_code = "pdfofuA.5.77.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_清算接口_获取资产账户指定持仓数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_GetAsacRegPosiQTY;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_GetAsacRegPosiQTY(
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
    

    /* [获取表记录变量语句][产品外盘期货_持仓_资产账户持仓表][{结算价}, {当前数量}][@结算价#, @当前数量#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号#] */
    select sett_price, curr_qty into v_sett_price, v_curr_qty from db_pdfofu.tb_pdfopo_asac_posi where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no limit 1;

    if FOUND_ROWS()=0 then

        /* set @当前数量#=0; */
        set v_curr_qty=0;

        /* set @结算价#=0; */
        set v_sett_price=0;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_qty = v_curr_qty;
    SET p_sett_price = v_sett_price;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_清算接口_获取资产账户持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_GetAsacPosiInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_GetAsacPosiInfo(
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_contrc_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_contrc_type = 0;

    
    label_pro:BEGIN
    

    /* if @查询记录序号方式# = 《查询记录序号方式-等于》 then */
    if v_query_row_id_type = 1 then

        /* [获取表记录变量][产品外盘期货_持仓_资产账户持仓表][字段][字段变量][{记录序号}=@查询记录序号#][4][@查询记录序号#] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no, asset_acco_no, exch_no, futu_acco_no, 
            contrc_code_no, contrc_type, contrc_unit, begin_qty, 
            curr_qty, frozen_qty, unfroz_qty, sett_price, 
            rece_margin, realize_pandl into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_co_no, 
            v_pd_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
            v_contrc_code_no, v_contrc_type, v_contrc_unit, v_begin_qty, 
            v_curr_qty, v_frozen_qty, v_unfroz_qty, v_sett_price, 
            v_rece_margin, v_realize_pandl from db_pdfofu.tb_pdfopo_asac_posi where row_id=v_query_row_id limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdfofuA.5.79.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("查询记录序号=",v_query_row_id);
            end if;
            leave label_pro;
        end if;


    /* elseif @查询记录序号方式# = 《查询记录序号方式-大于》 then */
    elseif v_query_row_id_type = 2 then

        /* [获取表记录变量][产品外盘期货_持仓_资产账户持仓表][字段][字段变量][{记录序号}>@查询记录序号# order by {记录序号}][4][@查询记录序号#] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no, asset_acco_no, exch_no, futu_acco_no, 
            contrc_code_no, contrc_type, contrc_unit, begin_qty, 
            curr_qty, frozen_qty, unfroz_qty, sett_price, 
            rece_margin, realize_pandl into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_co_no, 
            v_pd_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
            v_contrc_code_no, v_contrc_type, v_contrc_unit, v_begin_qty, 
            v_curr_qty, v_frozen_qty, v_unfroz_qty, v_sett_price, 
            v_rece_margin, v_realize_pandl from db_pdfofu.tb_pdfopo_asac_posi where row_id>v_query_row_id order by row_id limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdfofuA.5.79.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("查询记录序号=",v_query_row_id);
            end if;
            leave label_pro;
        end if;

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

# 原子_产品外盘期货_清算接口_对账记录处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoclif_AddDeli;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoclif_AddDeli(
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
    declare v_entry_qty decimal(18,2);
    declare v_entry_amt decimal(18,4);
    declare v_deli_status varchar(2);
    declare v_remark_info varchar(255);
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
    SET v_entry_qty = 0;
    SET v_entry_amt = 0;
    SET v_deli_status = "0";
    SET v_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @入账数量#=@待入账数量#; */
    set v_entry_qty=v_pre_entry_qty;

    /* set @入账金额#=@待入账金额#; */
    set v_entry_amt=v_pre_entry_amt;

    /* set @对账状态#=《对账状态-未处理》; */
    set v_deli_status="2";

    /* set @备注信息#="外盘期货清算结算生成对账单记录！"; */
    set v_remark_info="外盘期货清算结算生成对账单记录！";

    /* [插入表记录][产品外盘期货_持仓_对账表][字段][字段变量][1][@初始化日期#,@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfopo_deli(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, entry_jour_no, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_date, order_time, order_no, 
        order_dir, order_price, order_qty, sett_price, 
        strike_price, strike_qty, strike_amt, strike_num, 
        entry_qty, entry_amt, rece_margin, all_fee, 
        report_fee, wtdraw_fee, deli_fee, other_fee, 
        trade_commis, other_commis, out_all_fee, out_report_fee, 
        out_cancel_fee, out_deli_fee, out_other_fee, out_brkage_commis, 
        out_other_commis, busi_flag, deli_status, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_type, v_entry_jour_no, v_strike_date, 
        v_strike_time, v_strike_no, v_report_date, v_report_time, 
        v_report_no, v_order_date, v_order_time, v_order_no, 
        v_order_dir, v_order_price, v_order_qty, v_sett_price, 
        v_strike_price, v_strike_qty, v_strike_amt, v_strike_num, 
        v_entry_qty, v_entry_amt, v_rece_margin, v_all_fee, 
        v_report_fee, v_wtdraw_fee, v_deli_fee, v_other_fee, 
        v_trade_commis, v_other_commis, v_out_all_fee, v_out_report_fee, 
        v_out_cancel_fee, v_out_deli_fee, v_out_other_fee, v_out_brkage_commis, 
        v_out_other_commis, v_busi_flag, v_deli_status, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.5.80.1";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@对账流水号#] */
    select LAST_INSERT_ID() into v_deli_jour_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_deli_jour_no = v_deli_jour_no;

END;;


