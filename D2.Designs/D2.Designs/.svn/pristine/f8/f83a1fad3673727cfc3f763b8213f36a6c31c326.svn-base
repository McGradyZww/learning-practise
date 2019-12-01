DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_检查产品状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_CheckProductStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_CheckProductStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_pd_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_pd_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no = p_pd_no;
    SET v_pd_status = p_pd_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_检查资产账户状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_CheckAssetAccoStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_CheckAssetAccoStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_asset_acco_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_asset_acco_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_asset_acco_status = p_asset_acco_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_检查资产账户状态】*/
    call db_prod.pra_pdacco_CheckAssetAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_asset_acco_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查资产账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_获取产品本币币种
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_GetProductMoneyType;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_GetProductMoneyType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_crncy_type varchar(3)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_获取产品本币币种】*/
    call db_prod.pra_pdacco_GetProductMoneyType(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_crncy_type);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取产品本币币种出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_crncy_type = v_crncy_type;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_获取产品份额
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_GetProductShare;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_GetProductShare(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_share decimal(18,2)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_share decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_share = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_获取产品份额】*/
    call db_prod.pra_pdacco_GetProductShare(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_pd_share);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取产品份额出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_share = v_pd_share;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_更新产品份额
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_UpdateProductShare;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_UpdateProductShare(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_pd_share decimal(18,2),
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
    declare v_pd_no int;
    declare v_pd_share decimal(18,2);
    declare v_menu_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_pd_share = p_pd_share;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_更新产品份额】*/
        call db_prod.pra_pdacco_UpdateProductShare(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pd_no,
            v_pd_share,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_更新产品份额出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_资产账户编号获取外部账号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_AssetAccoNoGetOutAcco;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_AssetAccoNoGetOutAcco(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;
    declare v_out_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_资产账户编号获取外部账号】*/
    call db_prod.pra_pdacco_AssetAccoNoGetOutAcco(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no,
        v_error_code,
        v_error_info,
        v_pass_no,
        v_out_acco);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_资产账户编号获取外部账号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_外部账号获取资产账户编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_OutAccoGetAssetAccoNo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_OutAccoGetAssetAccoNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_外部账号获取资产账户编号】*/
    call db_prod.pra_pdacco_OutAccoGetAssetAccoNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_out_acco,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_asset_acco_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_外部账号获取资产账户编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_检查和获取同步外部账号信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_CheckAndGetOutAccoInfoBySync;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_CheckAndGetOutAccoInfoBySync(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_stock_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_asac_busi_config_str varchar(64),
    OUT p_record_count int,
    OUT p_default_exch_group_no int
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
    declare v_stock_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_asac_busi_config_str varchar(64);
    declare v_record_count int;
    declare v_default_exch_group_no int;
    declare v_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_asac_busi_config_str = " ";
    SET v_record_count = 0;
    SET v_default_exch_group_no = 0;
    SET v_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_获取外部账号资产账户信息】*/
    call db_prod.pra_pdacco_GetOutAccoAssetAccoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_out_acco,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取外部账号资产账户信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @记录个数# = length(@证券代码#); */
    set v_record_count = length(v_stock_code);

    /* set @资产账户业务控制配置串# = @业务控制配置串#; */
    set v_asac_busi_config_str = v_busi_config_str;

    /* 调用【原子_产品_公共接口_获取资产账户默认交易组编号】*/
    call db_prod.pra_pdpubif_GetAccoDefaultExgp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no,
        v_error_code,
        v_error_info,
        v_default_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_获取资产账户默认交易组编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_record_count = v_record_count;
    SET p_default_exch_group_no = v_default_exch_group_no;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_获取外部账号资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_GetOutAccoAssetAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_GetOutAccoAssetAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_获取外部账号资产账户信息】*/
    call db_prod.pra_pdacco_GetOutAccoAssetAccoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_out_acco,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.15.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取外部账号资产账户信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_检查和获取同步资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_CheckAndGetAssetAccoInfoBySync;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_CheckAndGetAssetAccoInfoBySync(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_asac_busi_config_str varchar(64)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_asac_busi_config_str varchar(64);
    declare v_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_asac_busi_config_str = " ";
    SET v_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_获取资产账户编号外部账号信息】*/
    call db_prod.pra_pdacco_GetAccoNoOutAccoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no,
        v_error_code,
        v_error_info,
        v_pass_no,
        v_out_acco,
        v_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取资产账户编号外部账号信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @资产账户业务控制配置串# = @业务控制配置串#; */
    set v_asac_busi_config_str = v_busi_config_str;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_asac_busi_config_str = v_asac_busi_config_str;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_同步资产账户资金更新产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_UpdatePdCapitalBySyncAssetCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_UpdatePdCapitalBySyncAssetCapital(
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
    IN p_occur_amt decimal(18,4),
    IN p_amt_check_diff decimal(18,4),
    IN p_sync_total_rece_payab int,
    IN p_acco_total_rece_amt_diff decimal(18,4),
    IN p_acco_total_payab_amt_diff decimal(18,4),
    IN p_crncy_type varchar(3),
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
    OUT p_pd_update_times int
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
    declare v_occur_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_sync_total_rece_payab int;
    declare v_acco_total_rece_amt_diff decimal(18,4);
    declare v_acco_total_payab_amt_diff decimal(18,4);
    declare v_crncy_type varchar(3);
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
    declare v_pd_update_times int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_occur_amt = p_occur_amt;
    SET v_amt_check_diff = p_amt_check_diff;
    SET v_sync_total_rece_payab = p_sync_total_rece_payab;
    SET v_acco_total_rece_amt_diff = p_acco_total_rece_amt_diff;
    SET v_acco_total_payab_amt_diff = p_acco_total_payab_amt_diff;
    SET v_crncy_type = p_crncy_type;
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
    SET v_pd_update_times = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_公共接口_同步资产账户资金更新产品资金】*/
        call db_prod.pra_pdpubif_UpdatePdCapitalBySyncAssetCapital(
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
            v_occur_amt,
            v_amt_check_diff,
            v_sync_total_rece_payab,
            v_acco_total_rece_amt_diff,
            v_acco_total_payab_amt_diff,
            v_crncy_type,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_cash_id,
            v_pd_first_amt,
            v_pd_curr_amt,
            v_pd_dist_amt,
            v_pd_auth_amt,
            v_pd_amt_check_diff,
            v_pd_pre_settle_amt,
            v_pd_total_cash_divide,
            v_pd_total_pre_fee,
            v_pd_total_rece_amt,
            v_pd_total_payab_amt,
            v_pd_intrst_cacl_amt,
            v_pd_pre_entry_intrst_amt,
            v_pd_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.10.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_同步资产账户资金更新产品资金出现错误！',v_mysql_message);
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
    SET p_pd_update_times = v_pd_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_分配产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_DistrPdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_DistrPdCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_status varchar(2);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @资产账户状态# = 0; */
    set v_asset_acco_status = 0;

    /* 调用【原子_产品_账户_检查资产账户状态】*/
    call db_prod.pra_pdacco_CheckAssetAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_asset_acco_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查资产账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号# and @操作员机构编号# <> 9999][50][@产品编号#,@机构编号#,@操作员机构编号#] */
    if v_co_no <> v_opor_co_no and v_opor_co_no <> 9999 then
        
        SET v_error_code = "prodT.6.11.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_公共接口_分配产品资金】*/
        call db_prod.pra_pdpubif_DistrPdCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_分配产品资金出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_回收产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_BackPdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_BackPdCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_status varchar(2);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @资产账户状态# = 0; */
    set v_asset_acco_status = 0;

    /* 调用【原子_产品_账户_检查资产账户状态】*/
    call db_prod.pra_pdacco_CheckAssetAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_asset_acco_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查资产账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号# and @操作员机构编号# <> 9999][50][@产品编号#,@机构编号#,@操作员机构编号#] */
    if v_co_no <> v_opor_co_no and v_opor_co_no <> 9999 then
        
        SET v_error_code = "prodT.6.12.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_公共接口_回收产品资金】*/
        call db_prod.pra_pdpubif_BackPdCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_回收产品资金出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_授权产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_AuthPdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_AuthPdCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_status varchar(2);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @资产账户状态# = 0; */
    set v_asset_acco_status = 0;

    /* 调用【原子_产品_账户_检查资产账户状态】*/
    call db_prod.pra_pdacco_CheckAssetAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_asset_acco_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查资产账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号# and @操作员机构编号# <> 9999][50][@产品编号#,@机构编号#,@操作员机构编号#] */
    if v_co_no <> v_opor_co_no and v_opor_co_no <> 9999 then
        
        SET v_error_code = "prodT.6.13.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_公共接口_授权产品资金】*/
        call db_prod.pra_pdpubif_AuthPdCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_授权产品资金出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_回收授权产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_BackAuthPdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_BackAuthPdCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_status varchar(2);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @资产账户状态# = 0; */
    set v_asset_acco_status = 0;

    /* 调用【原子_产品_账户_检查资产账户状态】*/
    call db_prod.pra_pdacco_CheckAssetAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_asset_acco_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查资产账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号# and @操作员机构编号# <> 9999][50][@产品编号#,@机构编号#,@操作员机构编号#] */
    if v_co_no <> v_opor_co_no and v_opor_co_no <> 9999 then
        
        SET v_error_code = "prodT.6.14.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_公共接口_回收授权产品资金】*/
        call db_prod.pra_pdpubif_BackAuthPdCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_回收授权产品资金出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_获取通道资产账户编号串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_GetAssetAccoNoStrByChannel;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_GetAssetAccoNoStrByChannel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asset_acco_no_str varchar(2048)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_no_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_获取通道资产账户编号串】*/
    call db_prod.pra_pdacco_GetAssetAccoNoStrByChannel(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_error_code,
        v_error_info,
        v_asset_acco_no_str);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取通道资产账户编号串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asset_acco_no_str = v_asset_acco_no_str;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_获取资产更新产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_GetProdInfoByAssetUpdate;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_GetProdInfoByAssetUpdate(
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
    OUT p_row_id_str varchar(2048),
    OUT p_co_no_str varchar(2048),
    OUT p_pd_no_str varchar(2048)
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
    declare v_row_id_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id_str = " ";
    SET v_co_no_str = " ";
    SET v_pd_no_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_公共接口_获取资产更新产品信息】*/
    call db_prod.pra_pdpubif_GetProdInfoByAssetUpdate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_row_id,
        v_error_code,
        v_error_info,
        v_row_id_str,
        v_co_no_str,
        v_pd_no_str);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_获取资产更新产品信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id_str = v_row_id_str;
    SET p_co_no_str = v_co_no_str;
    SET p_pd_no_str = v_pd_no_str;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_更新产品证券资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_UpdateProdSecuAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_UpdateProdSecuAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_crncy_type_str varchar(2048),
    IN p_stock_asset_str varchar(4096),
    IN p_bond_asset_str varchar(4096),
    IN p_fund_asset_str varchar(4096),
    IN p_repo_asset_str varchar(4096),
    IN p_hk_thrgh_stock_asset_str varchar(4096),
    IN p_futu_cash_asset_str varchar(4096),
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
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_crncy_type_str varchar(2048);
    declare v_stock_asset_str varchar(4096);
    declare v_bond_asset_str varchar(4096);
    declare v_fund_asset_str varchar(4096);
    declare v_repo_asset_str varchar(4096);
    declare v_hk_thrgh_stock_asset_str varchar(4096);
    declare v_futu_cash_asset_str varchar(4096);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_futu_asset decimal(18,4);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_crncy_type varchar(3);
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_futu_cash_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_stock_asset_str = p_stock_asset_str;
    SET v_bond_asset_str = p_bond_asset_str;
    SET v_fund_asset_str = p_fund_asset_str;
    SET v_repo_asset_str = p_repo_asset_str;
    SET v_hk_thrgh_stock_asset_str = p_hk_thrgh_stock_asset_str;
    SET v_futu_cash_asset_str = p_futu_cash_asset_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_futu_asset = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_crncy_type = "CNY";
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_futu_cash_asset = 0;
    SET v_money_fund_asset = 0;
    SET v_not_money_fund_asset = 0;
    SET v_futu_long_market_value = 0;
    SET v_futu_short_market_value = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* set @期货资产# =0; */
    set v_futu_asset =0;
    loop_label:loop

        /* if instr(@机构编号串#,";") > 0 then */
        if instr(v_co_no_str,";") > 0 then

            /* set @机构编号#=cast(substring(@机构编号串#,1,LOCATE(";",@机构编号串#)-1) as SIGNED); */
            set v_co_no=cast(substring(v_co_no_str,1,LOCATE(";",v_co_no_str)-1) as SIGNED);

            /* set @产品编号#=cast(substring(@产品编号串#,1,LOCATE(";",@产品编号串#)-1) as SIGNED); */
            set v_pd_no=cast(substring(v_pd_no_str,1,LOCATE(";",v_pd_no_str)-1) as SIGNED);

            /* set @本币币种#=substring(@本币币种串#,1,LOCATE(";",@本币币种串#)-1); */
            set v_crncy_type=substring(v_crncy_type_str,1,LOCATE(";",v_crncy_type_str)-1);

            /* set @股票资产#=cast(substring(@股票资产串#,1,LOCATE(";",@股票资产串#)-1) as decimal(32,6)); */
            set v_stock_asset=cast(substring(v_stock_asset_str,1,LOCATE(";",v_stock_asset_str)-1) as decimal(32,6));

            /* set @债券资产#=cast(substring(@债券资产串#,1,LOCATE(";",@债券资产串#)-1) as decimal(32,6)); */
            set v_bond_asset=cast(substring(v_bond_asset_str,1,LOCATE(";",v_bond_asset_str)-1) as decimal(32,6));

            /* set @基金资产#=cast(substring(@基金资产串#,1,LOCATE(";",@基金资产串#)-1) as decimal(32,6)); */
            set v_fund_asset=cast(substring(v_fund_asset_str,1,LOCATE(";",v_fund_asset_str)-1) as decimal(32,6));

            /* set @回购资产#=cast(substring(@回购资产串#,1,LOCATE(";",@回购资产串#)-1) as decimal(32,6)); */
            set v_repo_asset=cast(substring(v_repo_asset_str,1,LOCATE(";",v_repo_asset_str)-1) as decimal(32,6));

            /* set @港股通资产#=cast(substring(@港股通资产串#,1,LOCATE(";",@港股通资产串#)-1) as decimal(32,6)); */
            set v_hk_thrgh_stock_asset=cast(substring(v_hk_thrgh_stock_asset_str,1,LOCATE(";",v_hk_thrgh_stock_asset_str)-1) as decimal(32,6));

            /* set @期货现金资产#=cast(substring(@期货现金资产串#,1,LOCATE(";",@期货现金资产串#)-1) as decimal(32,6)); */
            set v_futu_cash_asset=cast(substring(v_futu_cash_asset_str,1,LOCATE(";",v_futu_cash_asset_str)-1) as decimal(32,6));
    #接口目前没用，先设为0

    /* set @货币基金资产#=0; */
    set v_money_fund_asset=0;

    /* set @非货币基金资产#=0; */
    set v_not_money_fund_asset=0;

    /* set @期货多头市值# = 0; */
    set v_futu_long_market_value = 0;

    /* set @期货空头市值# = 0; */
    set v_futu_short_market_value = 0;

                /* 调用【原子_产品_公共接口_更新产品证券资产】*/
                call db_prod.pra_pdpubif_UpdateProdSecuAsset(
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
                    v_stock_asset,
                    v_bond_asset,
                    v_fund_asset,
                    v_money_fund_asset,
                    v_not_money_fund_asset,
                    v_repo_asset,
                    v_hk_thrgh_stock_asset,
                    v_futu_cash_asset,
                    v_futu_asset,
                    v_futu_long_market_value,
                    v_futu_short_market_value,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "prodT.6.23.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_更新产品证券资产出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


            /* set @机构编号串#=substring(@机构编号串#,LOCATE(";",@机构编号串#)+1); */
            set v_co_no_str=substring(v_co_no_str,LOCATE(";",v_co_no_str)+1);

            /* set @产品编号串#=substring(@产品编号串#,LOCATE(";",@产品编号串#)+1); */
            set v_pd_no_str=substring(v_pd_no_str,LOCATE(";",v_pd_no_str)+1);

            /* set @本币币种串#=substring(@本币币种串#,LOCATE(";",@本币币种串#)+1); */
            set v_crncy_type_str=substring(v_crncy_type_str,LOCATE(";",v_crncy_type_str)+1);

            /* set @股票资产串#=substring(@股票资产串#,LOCATE(";",@股票资产串#)+1); */
            set v_stock_asset_str=substring(v_stock_asset_str,LOCATE(";",v_stock_asset_str)+1);

            /* set @债券资产串#=substring(@债券资产串#,LOCATE(";",@债券资产串#)+1); */
            set v_bond_asset_str=substring(v_bond_asset_str,LOCATE(";",v_bond_asset_str)+1);

            /* set @基金资产串#=substring(@基金资产串#,LOCATE(";",@基金资产串#)+1); */
            set v_fund_asset_str=substring(v_fund_asset_str,LOCATE(";",v_fund_asset_str)+1);

            /* set @回购资产串#=substring(@回购资产串#,LOCATE(";",@回购资产串#)+1); */
            set v_repo_asset_str=substring(v_repo_asset_str,LOCATE(";",v_repo_asset_str)+1);

            /* set @港股通资产串#=substring(@港股通资产串#,LOCATE(";",@港股通资产串#)+1); */
            set v_hk_thrgh_stock_asset_str=substring(v_hk_thrgh_stock_asset_str,LOCATE(";",v_hk_thrgh_stock_asset_str)+1);

            /* set @期货现金资产串#=substring(@期货现金资产串#,LOCATE(";",@期货现金资产串#)+1); */
            set v_futu_cash_asset_str=substring(v_futu_cash_asset_str,LOCATE(";",v_futu_cash_asset_str)+1);
        else
            leave loop_label;
        end if;
    end loop;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_更新产品期货资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_UpdateProdFutuAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_UpdateProdFutuAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_crncy_type_str varchar(2048),
    IN p_futu_asset_str varchar(4096),
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
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_crncy_type_str varchar(2048);
    declare v_futu_asset_str varchar(4096);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_crncy_type varchar(3);
    declare v_futu_asset decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_futu_asset_str = p_futu_asset_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_crncy_type = "CNY";
    SET v_futu_asset = 0;

    
    label_pro:BEGIN
    
    loop_label:loop

        /* if instr(@机构编号串#,";") > 0 then */
        if instr(v_co_no_str,";") > 0 then

            /* set @机构编号#=cast(substring(@机构编号串#,1,LOCATE(";",@机构编号串#)-1) as SIGNED); */
            set v_co_no=cast(substring(v_co_no_str,1,LOCATE(";",v_co_no_str)-1) as SIGNED);

            /* set @产品编号#=cast(substring(@产品编号串#,1,LOCATE(";",@产品编号串#)-1) as SIGNED); */
            set v_pd_no=cast(substring(v_pd_no_str,1,LOCATE(";",v_pd_no_str)-1) as SIGNED);

            /* set @本币币种#=substring(@本币币种串#,1,LOCATE(";",@本币币种串#)-1); */
            set v_crncy_type=substring(v_crncy_type_str,1,LOCATE(";",v_crncy_type_str)-1);

            /* set @期货资产#=cast(substring(@期货资产串#,1,LOCATE(";",@期货资产串#)-1) as decimal(32,6)); */
            set v_futu_asset=cast(substring(v_futu_asset_str,1,LOCATE(";",v_futu_asset_str)-1) as decimal(32,6));

            /* [事务开始] */
            START TRANSACTION;


                /* 调用【原子_产品_公共接口_更新产品期货资产】*/
                call db_prod.pra_pdpubif_UpdateProdFutuAsset(
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
                    v_futu_asset,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "prodT.6.26.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_更新产品期货资产出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


            /* [事务结束] */
            COMMIT;


            /* set @机构编号串#=substring(@机构编号串#,LOCATE(";",@机构编号串#)+1); */
            set v_co_no_str=substring(v_co_no_str,LOCATE(";",v_co_no_str)+1);

            /* set @产品编号串#=substring(@产品编号串#,LOCATE(";",@产品编号串#)+1); */
            set v_pd_no_str=substring(v_pd_no_str,LOCATE(";",v_pd_no_str)+1);

            /* set @本币币种串#=substring(@本币币种串#,LOCATE(";",@本币币种串#)+1); */
            set v_crncy_type_str=substring(v_crncy_type_str,LOCATE(";",v_crncy_type_str)+1);

            /* set @期货资产串#=substring(@期货资产串#,LOCATE(";",@期货资产串#)+1); */
            set v_futu_asset_str=substring(v_futu_asset_str,LOCATE(";",v_futu_asset_str)+1);
        else
            leave loop_label;
        end if;
    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_红冲蓝补产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_PatchProdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_PatchProdCapital(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_资金_红冲蓝补产品资金】*/
        call db_prod.pra_pdcapit_PatchProdCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_is_change_exch_group_capital,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_cash_id,
            v_pd_first_amt,
            v_pd_curr_amt,
            v_pd_dist_amt,
            v_pd_auth_amt,
            v_pd_amt_check_diff,
            v_pd_pre_settle_amt,
            v_pd_total_cash_divide,
            v_pd_total_pre_fee,
            v_pd_total_rece_amt,
            v_pd_total_payab_amt,
            v_pd_intrst_cacl_amt,
            v_pd_pre_entry_intrst_amt,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.24.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_红冲蓝补产品资金出现错误！',v_mysql_message);
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

# 事务_产品_公共接口_处理回购到期产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_DealRepoExpireProdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_DealRepoExpireProdCapital(
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
    IN p_repo_back_amt decimal(18,4),
    IN p_repo_back_intrst decimal(18,4),
    IN p_busi_flag int,
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
    declare v_repo_back_amt decimal(18,4);
    declare v_repo_back_intrst decimal(18,4);
    declare v_busi_flag int;
    declare v_menu_no int;
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
    SET v_repo_back_amt = p_repo_back_amt;
    SET v_repo_back_intrst = p_repo_back_intrst;
    SET v_busi_flag = p_busi_flag;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_公共接口_处理回购到期产品资金】*/
        call db_prod.pra_pdpubif_DealRepoExpireProdCapital(
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
            v_repo_back_amt,
            v_repo_back_intrst,
            v_busi_flag,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.25.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_处理回购到期产品资金出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_处理产品资金待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_DealCapitPreEntry;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_DealCapitPreEntry(
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
    IN p_busi_flag int,
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
    declare v_busi_flag int;
    declare v_menu_no int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_busi_flag = p_busi_flag;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_公共接口_处理产品资金待入账记录】*/
        call db_prod.pra_pdpubif_DealCapitPreEntry(
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
            v_crncy_type,
            v_occur_amt,
            v_busi_flag,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.27.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_处理产品资金待入账记录出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_产品资金应收应付变动
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_ProdCapitalChange;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_ProdCapitalChange(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_资金_产品资金应收应付变动】*/
        call db_prod.pra_pdcapit_ProdCapitalChange(
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
            v_crncy_type,
            v_total_rece_amt_diff,
            v_total_payab_amt_diff,
            v_is_change_exch_group_capital,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_cash_id,
            v_pd_first_amt,
            v_pd_curr_amt,
            v_pd_dist_amt,
            v_pd_auth_amt,
            v_pd_amt_check_diff,
            v_pd_pre_settle_amt,
            v_pd_total_cash_divide,
            v_pd_total_pre_fee,
            v_pd_total_rece_amt,
            v_pd_total_payab_amt,
            v_pd_intrst_cacl_amt,
            v_pd_pre_entry_intrst_amt,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.28.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_产品资金应收应付变动出现错误！',v_mysql_message);
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

# 事务_产品_公共接口_查询报盘所需资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_QueryAssetAccoByTrans;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_QueryAssetAccoByTrans(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_asset_acco_no_str varchar(2048),
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
    declare v_asset_acco_no_str varchar(2048);
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
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@资产账户编号串#] */
    set v_asset_acco_no_str = concat(";", v_asset_acco_no_str,";");


    /* 调用【原子_产品_账户_查询报盘所需资产账户信息】*/
    call db_prod.pra_pdacco_QueryAssetAccoByTrans(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.501.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_查询报盘所需资产账户信息出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_导入产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_ImportProdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_ImportProdCapital(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_资金_导入产品资金】*/
        call db_prod.pra_pdcapit_ImportProdCapital(
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
            v_crncy_type,
            v_target_amt,
            v_occur_amt,
            v_frozen_amt,
            v_unfroz_amt,
            v_total_rece_amt_diff,
            v_total_payab_amt_diff,
            v_occur_amt_check_diff,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_cash_id,
            v_pd_first_amt,
            v_pd_curr_amt,
            v_pd_dist_amt,
            v_pd_auth_amt,
            v_pd_amt_check_diff,
            v_pd_pre_settle_amt,
            v_pd_total_cash_divide,
            v_pd_total_pre_fee,
            v_pd_total_rece_amt,
            v_pd_total_payab_amt,
            v_pd_intrst_cacl_amt,
            v_pd_pre_entry_intrst_amt,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.29.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_导入产品资金出现错误！',v_mysql_message);
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

# 事务_产品_公共接口_更新产品估值资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_UpdateProdEvaluAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_UpdateProdEvaluAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_crncy_type varchar(3),
    IN p_evalu_nav_asset decimal(18,4),
    IN p_begin_evalu_nav_asset decimal(18,4),
    IN p_evalu_share decimal(18,2),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_cash_id bigint,
    OUT p_co_no int,
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
    declare v_pd_no int;
    declare v_crncy_type varchar(3);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_evalu_share decimal(18,2);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_cash_id bigint;
    declare v_co_no int;
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pd_no = p_pd_no;
    SET v_crncy_type = p_crncy_type;
    SET v_evalu_nav_asset = p_evalu_nav_asset;
    SET v_begin_evalu_nav_asset = p_begin_evalu_nav_asset;
    SET v_evalu_share = p_evalu_share;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_cash_id = 0;
    SET v_co_no = 0;
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户运维_更新产品估值资产】*/
        call db_prod.pra_pdaccobk_UpdateProdEvaluAsset(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pd_no,
            v_crncy_type,
            v_evalu_nav_asset,
            v_begin_evalu_nav_asset,
            v_evalu_share,
            v_total_rece_amt,
            v_total_payab_amt,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_cash_id,
            v_co_no,
            v_pd_first_amt,
            v_pd_curr_amt,
            v_pd_dist_amt,
            v_pd_auth_amt,
            v_pd_amt_check_diff,
            v_pd_pre_settle_amt,
            v_pd_total_cash_divide,
            v_pd_total_pre_fee,
            v_pd_total_rece_amt,
            v_pd_total_payab_amt,
            v_pd_intrst_cacl_amt,
            v_pd_pre_entry_intrst_amt,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.30.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户运维_更新产品估值资产出现错误！',v_mysql_message);
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
    SET p_pd_cash_id = v_pd_cash_id;
    SET p_co_no = v_co_no;
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

# 事务_产品_公共接口_获取资产账户业务控制串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_GetAsacBusiConfigStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_GetAsacBusiConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_busi_config_str varchar(64)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_公共接口_获取资产账户业务控制串】*/
        call db_prod.pra_pdpubif_GetAsacBusiConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_asset_acco_no,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.31.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_获取资产账户业务控制串出现错误！',v_mysql_message);
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
    SET p_busi_config_str = v_busi_config_str;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_重置待交收金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_ResetPreSettleAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_ResetPreSettleAmt(
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
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_公共接口_重置待交收金额】*/
        call db_prod.pra_pdpubif_ResetPreSettleAmt(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.32.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_重置待交收金额出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_归档更新待交收金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_BackUpUpdatePreSettleAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_BackUpUpdatePreSettleAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_pre_settle_amt decimal(18,4),
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
    declare v_pd_no int;
    declare v_pre_settle_amt decimal(18,4);
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
    SET v_pd_no = p_pd_no;
    SET v_pre_settle_amt = p_pre_settle_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_公共接口_归档更新待交收金额】*/
        call db_prod.pra_pdpubif_BackUpUpdatePreSettleAmt(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pd_no,
            v_pre_settle_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.33.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_归档更新待交收金额出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_事务提交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_TransactionCommit;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_TransactionCommit(
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
    
    commit;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_银证转账更新产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_BankTransferUpdatePdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_BankTransferUpdatePdCapital(
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
    IN p_busi_flag int,
    IN p_occur_amt decimal(18,4),
    IN p_crncy_type varchar(3),
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
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_crncy_type varchar(3);
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_busi_flag = p_busi_flag;
    SET v_occur_amt = p_occur_amt;
    SET v_crncy_type = p_crncy_type;
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_公共接口_银证转账更新产品资金】*/
        call db_prod.pra_pdpubif_BankTransferUpdatePdCapital(
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
            v_busi_flag,
            v_occur_amt,
            v_crncy_type,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_cash_id,
            v_pd_first_amt,
            v_pd_curr_amt,
            v_pd_dist_amt,
            v_pd_auth_amt,
            v_pd_amt_check_diff,
            v_pd_pre_settle_amt,
            v_pd_total_cash_divide,
            v_pd_total_pre_fee,
            v_pd_total_rece_amt,
            v_pd_total_payab_amt,
            v_pd_intrst_cacl_amt,
            v_pd_pre_entry_intrst_amt,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.35.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_银证转账更新产品资金出现错误！',v_mysql_message);
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

# 事务_产品_公共接口_新增产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_AddProductInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_AddProductInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_pd_name varchar(64),
    IN p_pd_flname varchar(255),
    IN p_fund_reg_code varchar(16),
    IN p_pd_manager varchar(32),
    IN p_pd_type int,
    IN p_apply_currency varchar(3),
    IN p_crncy_type varchar(3),
    IN p_first_asset decimal(18,4),
    IN p_first_amt decimal(18,4),
    IN p_pd_all_share decimal(18,2),
    IN p_curr_share decimal(18,2),
    IN p_pre_share decimal(18,2),
    IN p_his_max_per_nav decimal(18,4),
    IN p_pre_nav decimal(18,4),
    IN p_coust_full_name varchar(255),
    IN p_coust_acco varchar(16),
    IN p_coust_acco_name varchar(64),
    IN p_warn_posi_value decimal(18,4),
    IN p_close_posi_value decimal(18,4),
    IN p_target_posi_ratio decimal(18,4),
    IN p_beta_coeffi decimal(18,12),
    IN p_custom_pd_class varchar(255),
    IN p_index_value int,
    IN p_remark_info varchar(255),
    IN p_cost_calc_type int,
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_busi_config_str varchar(64),
    IN p_comm_appr_oper int,
    IN p_market_price_ratio decimal(18,12),
    IN p_forbid_order_dir varchar(64),
    IN p_comm_no_limit_price_ratio decimal(18,12),
    IN p_menu_no int,
    IN p_pd_qty_max int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int,
    OUT p_pd_cost_calc_type int,
    OUT p_pd_status varchar(2),
    OUT p_asac_update_times int
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
    declare v_pd_code varchar(32);
    declare v_pd_name varchar(64);
    declare v_pd_flname varchar(255);
    declare v_fund_reg_code varchar(16);
    declare v_pd_manager varchar(32);
    declare v_pd_type int;
    declare v_apply_currency varchar(3);
    declare v_crncy_type varchar(3);
    declare v_first_asset decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_pd_all_share decimal(18,2);
    declare v_curr_share decimal(18,2);
    declare v_pre_share decimal(18,2);
    declare v_his_max_per_nav decimal(18,4);
    declare v_pre_nav decimal(18,4);
    declare v_coust_full_name varchar(255);
    declare v_coust_acco varchar(16);
    declare v_coust_acco_name varchar(64);
    declare v_warn_posi_value decimal(18,4);
    declare v_close_posi_value decimal(18,4);
    declare v_target_posi_ratio decimal(18,4);
    declare v_beta_coeffi decimal(18,12);
    declare v_custom_pd_class varchar(255);
    declare v_index_value int;
    declare v_remark_info varchar(255);
    declare v_cost_calc_type int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_config_str varchar(64);
    declare v_comm_appr_oper int;
    declare v_market_price_ratio decimal(18,12);
    declare v_forbid_order_dir varchar(64);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_menu_no int;
    declare v_pd_qty_max int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_pd_cost_calc_type int;
    declare v_pd_status varchar(2);
    declare v_asac_update_times int;
    declare v_found_date int;
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_pd_update_times int;
    declare v_update_times int;
    declare v_hk_asset_calc_rate int;
    declare v_oper_remark_info varchar(255);
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pd_code = p_pd_code;
    SET v_pd_name = p_pd_name;
    SET v_pd_flname = p_pd_flname;
    SET v_fund_reg_code = p_fund_reg_code;
    SET v_pd_manager = p_pd_manager;
    SET v_pd_type = p_pd_type;
    SET v_apply_currency = p_apply_currency;
    SET v_crncy_type = p_crncy_type;
    SET v_first_asset = p_first_asset;
    SET v_first_amt = p_first_amt;
    SET v_pd_all_share = p_pd_all_share;
    SET v_curr_share = p_curr_share;
    SET v_pre_share = p_pre_share;
    SET v_his_max_per_nav = p_his_max_per_nav;
    SET v_pre_nav = p_pre_nav;
    SET v_coust_full_name = p_coust_full_name;
    SET v_coust_acco = p_coust_acco;
    SET v_coust_acco_name = p_coust_acco_name;
    SET v_warn_posi_value = p_warn_posi_value;
    SET v_close_posi_value = p_close_posi_value;
    SET v_target_posi_ratio = p_target_posi_ratio;
    SET v_beta_coeffi = p_beta_coeffi;
    SET v_custom_pd_class = p_custom_pd_class;
    SET v_index_value = p_index_value;
    SET v_remark_info = p_remark_info;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_busi_config_str = p_busi_config_str;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_forbid_order_dir = p_forbid_order_dir;
    SET v_comm_no_limit_price_ratio = p_comm_no_limit_price_ratio;
    SET v_menu_no = p_menu_no;
    SET v_pd_qty_max = p_pd_qty_max;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_pd_cost_calc_type = 0;
    SET v_pd_status = "0";
    SET v_asac_update_times = 0;
    SET v_found_date = date_format(curdate(),'%Y%m%d');
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_pd_update_times = 0;
    SET v_update_times = 1;
    SET v_hk_asset_calc_rate = 0;
    SET v_oper_remark_info = " ";
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

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_检查产品存在】*/
    call db_prod.pra_pdacco_CheckProductExists(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.36.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品存在出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [获取机器日期][@成立日期#] */
    select date_format(curdate(),'%Y%m%d') into v_found_date;


    /* set @编号类型# = 《编号类型-产品编号》; */
    set v_record_no_type = 2;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_获取机构业务记录编号】*/
        call db_prod.pra_pdacco_GetCoBusiRecordNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_record_no_type,
            v_error_code,
            v_error_info,
            v_curr_no);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.36.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取机构业务记录编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @产品编号# = @当前编号#; */
    set v_pd_no = v_curr_no;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_新增产品信息】*/
        call db_prod.pra_pdacco_AddProductInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pd_no,
            v_co_no,
            v_pd_code,
            v_pd_name,
            v_pd_flname,
            v_fund_reg_code,
            v_pd_manager,
            v_found_date,
            v_pd_type,
            v_apply_currency,
            v_crncy_type,
            v_first_asset,
            v_first_amt,
            v_pd_all_share,
            v_curr_share,
            v_pre_share,
            v_his_max_per_nav,
            v_pre_nav,
            v_coust_full_name,
            v_coust_acco,
            v_coust_acco_name,
            v_warn_posi_value,
            v_close_posi_value,
            v_target_posi_ratio,
            v_beta_coeffi,
            v_custom_pd_class,
            v_remark_info,
            v_index_value,
            v_menu_no,
            v_pd_qty_max,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.36.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_新增产品信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @产品更新次数# = @更新次数#; */
        set v_pd_update_times = v_update_times;

        /* set @港股通资产计算采用汇率#=0; */
        set v_hk_asset_calc_rate=0;

        /* 调用【原子_产品_账户_新增产品限制信息】*/
        call db_prod.pra_pdacco_AddProductLimit(
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
            v_cost_calc_type,
            v_allow_exch,
            v_allow_stock_type,
            v_busi_config_str,
            v_comm_appr_oper,
            v_market_price_ratio,
            v_forbid_order_dir,
            v_comm_no_limit_price_ratio,
            v_menu_no,
            v_hk_asset_calc_rate,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.36.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_新增产品限制信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @资产账户更新次数# = @更新次数#; */
        set v_asac_update_times = v_update_times;

        /* set @操作备注# = "新增产品"; */
        set v_oper_remark_info = "新增产品";

        /* set @原始金额# = 0; */
        set v_first_amt = 0;

        /* 调用【原子_产品_公共接口_新增产品资金】*/
        call db_prod.pra_pdpubif_AddPdCapital(
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
            v_crncy_type,
            v_first_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_cash_id,
            v_pd_first_amt,
            v_pd_curr_amt,
            v_pd_dist_amt,
            v_pd_auth_amt,
            v_pd_amt_check_diff,
            v_pd_pre_settle_amt,
            v_pd_total_cash_divide,
            v_pd_total_pre_fee,
            v_pd_total_rece_amt,
            v_pd_total_payab_amt,
            v_pd_intrst_cacl_amt,
            v_pd_pre_entry_intrst_amt,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.36.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_新增产品资金出现错误！',v_mysql_message);
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
    SET p_pd_no = v_pd_no;
    SET p_pd_cost_calc_type = v_pd_cost_calc_type;
    SET p_pd_status = v_pd_status;
    SET p_asac_update_times = v_asac_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_新增资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_AddAssetAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_AddAssetAccoInfo(
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
    IN p_asset_acco varchar(16),
    IN p_asset_acco_name varchar(64),
    IN p_asset_acco_type int,
    IN p_out_acco varchar(32),
    IN p_trade_pwd varchar(64),
    IN p_comm_pwd varchar(64),
    IN p_market_price_ratio decimal(18,12),
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_split_fee_typr_str varchar(64),
    IN p_busi_limit_str varchar(2048),
    IN p_exter_comm_flag int,
    IN p_sh_hk_trader_type int,
    IN p_sz_hk_trader_type int,
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    IN p_max_acco_count int,
    IN p_busi_depart varchar(255),
    IN p_syn_update_cost_amt int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asset_acco_no int
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
    declare v_asset_acco varchar(16);
    declare v_asset_acco_name varchar(64);
    declare v_asset_acco_type int;
    declare v_out_acco varchar(32);
    declare v_trade_pwd varchar(64);
    declare v_comm_pwd varchar(64);
    declare v_market_price_ratio decimal(18,12);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_split_fee_typr_str varchar(64);
    declare v_busi_limit_str varchar(2048);
    declare v_exter_comm_flag int;
    declare v_sh_hk_trader_type int;
    declare v_sz_hk_trader_type int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_max_acco_count int;
    declare v_busi_depart varchar(255);
    declare v_syn_update_cost_amt int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_no int;
    declare v_pd_status varchar(2);
    declare v_record_no_type int;
    declare v_curr_no bigint;
    declare v_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco = p_asset_acco;
    SET v_asset_acco_name = p_asset_acco_name;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_out_acco = p_out_acco;
    SET v_trade_pwd = p_trade_pwd;
    SET v_comm_pwd = p_comm_pwd;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_split_fee_typr_str = p_split_fee_typr_str;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_sh_hk_trader_type = p_sh_hk_trader_type;
    SET v_sz_hk_trader_type = p_sz_hk_trader_type;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_max_acco_count = p_max_acco_count;
    SET v_busi_depart = p_busi_depart;
    SET v_syn_update_cost_amt = p_syn_update_cost_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_no = 0;
    SET v_pd_status = "0";
    SET v_record_no_type = 0;
    SET v_curr_no = 0;
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.37.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.6.37.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_产品_账户_检查资产账户存在】*/
    call db_prod.pra_pdacco_CheckAssetAccoExists(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.37.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查资产账户存在出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @编号类型# = 《编号类型-资产账户编号》; */
    set v_record_no_type = 3;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_获取机构业务记录编号】*/
        call db_prod.pra_pdacco_GetCoBusiRecordNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_record_no_type,
            v_error_code,
            v_error_info,
            v_curr_no);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.37.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取机构业务记录编号出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;


    /* set @资产账户编号# = @当前编号#; */
    set v_asset_acco_no = v_curr_no;

    /* set @交易密码#=to_base64(@交易密码#); */
    set v_trade_pwd=to_base64(v_trade_pwd);

    /* set @通讯密码#=to_base64(@通讯密码#); */
    set v_comm_pwd=to_base64(v_comm_pwd);
    #逻辑_产品证券_账户_授权开立交易中台账户 目前没用。先设交易组编号=0

    /* set @交易组编号#=0; */
    set v_exch_group_no=0;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_新增资产账户信息】*/
        call db_prod.pra_pdacco_AddAssetAccoInfo(
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
            v_asset_acco_no,
            v_asset_acco,
            v_asset_acco_name,
            v_asset_acco_type,
            v_out_acco,
            v_trade_pwd,
            v_comm_pwd,
            v_market_price_ratio,
            v_allow_exch,
            v_allow_stock_type,
            v_split_fee_typr_str,
            v_busi_limit_str,
            v_exter_comm_flag,
            v_sh_hk_trader_type,
            v_sz_hk_trader_type,
            v_remark_info,
            v_menu_no,
            v_max_acco_count,
            v_busi_depart,
            v_syn_update_cost_amt,
            v_exch_group_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.37.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_新增资产账户信息出现错误！',v_mysql_message);
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
    SET p_asset_acco_no = v_asset_acco_no;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_外部账号获取产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_OutAccoGetPdInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_OutAccoGetPdInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_out_acco varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_curr_share decimal(18,2),
    OUT p_first_asset decimal(18,4),
    OUT p_allow_exch varchar(64),
    OUT p_allow_stock_type varchar(2048),
    OUT p_busi_config_str varchar(64),
    OUT p_market_price_ratio decimal(18,12)
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
    declare v_out_acco varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_curr_share decimal(18,2);
    declare v_first_asset decimal(18,4);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_config_str varchar(64);
    declare v_market_price_ratio decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_curr_share = 0;
    SET v_first_asset = 0;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_busi_config_str = " ";
    SET v_market_price_ratio = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_公共接口_外部账号获取产品信息】*/
    call db_prod.pra_pdpubif_OutAccoGetPdInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_out_acco,
        v_error_code,
        v_error_info,
        v_pd_no,
        v_asset_acco_no,
        v_curr_share,
        v_first_asset,
        v_allow_exch,
        v_allow_stock_type,
        v_busi_config_str,
        v_market_price_ratio);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.38.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_外部账号获取产品信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_curr_share = v_curr_share;
    SET p_first_asset = v_first_asset;
    SET p_allow_exch = v_allow_exch;
    SET p_allow_stock_type = v_allow_stock_type;
    SET p_busi_config_str = v_busi_config_str;
    SET p_market_price_ratio = v_market_price_ratio;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_更新资产获取产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_UpdateAssetGetPdInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_UpdateAssetGetPdInfo(
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
    OUT p_pd_no int
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_公共接口_更新资产获取产品信息】*/
    call db_prod.pra_pdpubif_UpdateAssetGetPdInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_row_id,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_pd_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.39.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_更新资产获取产品信息出现错误！',v_mysql_message);
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

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_获取产品计算资产配置值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_GetPdAssetCalcConfigValue;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_GetPdAssetCalcConfigValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_hk_asset_calc_rate int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_hk_asset_calc_rate int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_hk_asset_calc_rate = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_公共接口_获取产品计算资产配置值】*/
    call db_prod.pra_pdpubif_GetPdAssetCalcConfigValue(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_hk_asset_calc_rate);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.40.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_获取产品计算资产配置值出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_hk_asset_calc_rate = v_hk_asset_calc_rate;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_更新产品证券资产修改版
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_UpdateProdSecuAsset_New;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_UpdateProdSecuAsset_New(
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
    IN p_stock_asset decimal(18,4),
    IN p_bond_asset decimal(18,4),
    IN p_fund_asset decimal(18,4),
    IN p_money_fund_asset decimal(18,4),
    IN p_not_money_fund_asset decimal(18,4),
    IN p_repo_asset decimal(18,4),
    IN p_hk_thrgh_stock_asset decimal(18,4),
    IN p_futu_cash_asset decimal(18,4),
    IN p_futu_asset decimal(18,4),
    IN p_futu_long_market_value decimal(18,4),
    IN p_futu_short_market_value decimal(18,4),
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
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_futu_cash_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);
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
    SET v_stock_asset = p_stock_asset;
    SET v_bond_asset = p_bond_asset;
    SET v_fund_asset = p_fund_asset;
    SET v_money_fund_asset = p_money_fund_asset;
    SET v_not_money_fund_asset = p_not_money_fund_asset;
    SET v_repo_asset = p_repo_asset;
    SET v_hk_thrgh_stock_asset = p_hk_thrgh_stock_asset;
    SET v_futu_cash_asset = p_futu_cash_asset;
    SET v_futu_asset = p_futu_asset;
    SET v_futu_long_market_value = p_futu_long_market_value;
    SET v_futu_short_market_value = p_futu_short_market_value;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


                /* 调用【原子_产品_公共接口_更新产品证券资产】*/
                call db_prod.pra_pdpubif_UpdateProdSecuAsset(
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
                    v_stock_asset,
                    v_bond_asset,
                    v_fund_asset,
                    v_money_fund_asset,
                    v_not_money_fund_asset,
                    v_repo_asset,
                    v_hk_thrgh_stock_asset,
                    v_futu_cash_asset,
                    v_futu_asset,
                    v_futu_long_market_value,
                    v_futu_short_market_value,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "prodT.6.41.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_更新产品证券资产出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_获取同步产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_GetSyncPdInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_GetSyncPdInfo(
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
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_busi_config_str varchar(64),
    OUT p_pd_status varchar(2),
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_busi_config_str varchar(64);
    declare v_pd_status varchar(2);
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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_busi_config_str = " ";
    SET v_pd_status = "0";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_公共接口_获取同步产品信息】*/
    call db_prod.pra_pdpubif_GetSyncPdInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_row_id,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_busi_config_str,
        v_pd_status,
        v_row_id);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.42.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_获取同步产品信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_busi_config_str = v_busi_config_str;
    SET p_pd_status = v_pd_status;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_外部账号获取资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_OutAccoGetAssetAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_OutAccoGetAssetAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_allow_stock_type varchar(2048),
    OUT p_busi_limit_str varchar(2048)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_allow_stock_type varchar(2048);
    declare v_busi_limit_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_allow_stock_type = " ";
    SET v_busi_limit_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_公共接口_外部账号获取资产账户信息】*/
    call db_prod.pra_pdpubif_OutAccoGetAssetAccoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_out_acco,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_allow_stock_type,
        v_busi_limit_str);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.43.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_外部账号获取资产账户信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_allow_stock_type = v_allow_stock_type;
    SET p_busi_limit_str = v_busi_limit_str;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_更新资产账户状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_UpdateAssetAccoStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_UpdateAssetAccoStatus(
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
    IN p_asset_acco_status varchar(2),
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
    declare v_asset_acco_status varchar(2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_asset_acco_status = p_asset_acco_status;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #[原子_产品_账户_检查资产账户状态]
    #if (@操作员机构编号# <> 9999) then
      #  [检查报错返回][@机构编号# <> @操作员机构编号#][50][@机构编号#,@产品编号#]
    #end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_更新资产账户状态】*/
        call db_prod.pra_pdacco_UpdateAssetAccoStatus(
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
            v_asset_acco_no,
            v_asset_acco_status,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.44.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_更新资产账户状态出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_注销回退产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_CancelRollBackProdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_CancelRollBackProdCapital(
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
    IN p_curr_amt decimal(18,4),
    IN p_amt_check_diff decimal(18,4),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
    IN p_total_change_amt decimal(18,4),
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
    OUT p_pd_update_times int
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
    declare v_curr_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
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
    declare v_pd_update_times int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_curr_amt = p_curr_amt;
    SET v_amt_check_diff = p_amt_check_diff;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_total_change_amt = p_total_change_amt;
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
    SET v_pd_update_times = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_公共接口_注销回退产品资金】*/
        call db_prod.pra_pdpubif_CancelRollBackProdCapital(
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
            v_crncy_type,
            v_curr_amt,
            v_amt_check_diff,
            v_total_rece_amt,
            v_total_payab_amt,
            v_total_change_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_cash_id,
            v_pd_first_amt,
            v_pd_curr_amt,
            v_pd_dist_amt,
            v_pd_auth_amt,
            v_pd_amt_check_diff,
            v_pd_pre_settle_amt,
            v_pd_total_cash_divide,
            v_pd_total_pre_fee,
            v_pd_total_rece_amt,
            v_pd_total_payab_amt,
            v_pd_intrst_cacl_amt,
            v_pd_pre_entry_intrst_amt,
            v_pd_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.45.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_注销回退产品资金出现错误！',v_mysql_message);
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
    SET p_pd_update_times = v_pd_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_更新资产账户通道备注信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_UpdateAssetAccoChannelRemarkInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_UpdateAssetAccoChannelRemarkInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
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
    declare v_asset_acco_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_公共接口_更新资产账户通道备注信息】*/
        call db_prod.pra_pdpubif_UpdateAssetAccoChannelRemarkInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_asset_acco_no,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.46.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_更新资产账户通道备注信息出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_获取资产账户默认交易组编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_GetAccoDefaultExgp;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_GetAccoDefaultExgp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_default_exch_group_no int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_default_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_default_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_公共接口_获取资产账户默认交易组编号】*/
    call db_prod.pra_pdpubif_GetAccoDefaultExgp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no,
        v_error_code,
        v_error_info,
        v_default_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.47.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_获取资产账户默认交易组编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_default_exch_group_no = v_default_exch_group_no;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_获取资产账户默认交易组关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_GetAccoDefaultExgpRelation;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_GetAccoDefaultExgpRelation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asset_acco_no_str varchar(2048),
    OUT p_default_exch_group_no_str varchar(2048)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_no_str varchar(2048);
    declare v_default_exch_group_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_no_str = " ";
    SET v_default_exch_group_no_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_公共接口_获取资产账户默认交易组关系】*/
    call db_prod.pra_pdpubif_GetAccoDefaultExgpRelation(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_asset_acco_no_str,
        v_default_exch_group_no_str);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.48.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_获取资产账户默认交易组关系出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asset_acco_no_str = v_asset_acco_no_str;
    SET p_default_exch_group_no_str = v_default_exch_group_no_str;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_检查和获取同步资产账户及默认交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_CheckAndGetAssetAccoAndDefaulExgpBySync;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_CheckAndGetAssetAccoAndDefaulExgpBySync(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_default_exch_group_no int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_asac_busi_config_str varchar(64);
    declare v_default_exch_group_no int;
    declare v_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_asac_busi_config_str = " ";
    SET v_default_exch_group_no = 0;
    SET v_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_获取资产账户编号外部账号信息】*/
    call db_prod.pra_pdacco_GetAccoNoOutAccoInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no,
        v_error_code,
        v_error_info,
        v_pass_no,
        v_out_acco,
        v_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.49.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取资产账户编号外部账号信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @资产账户业务控制配置串# = @业务控制配置串#; */
    set v_asac_busi_config_str = v_busi_config_str;

    /* 调用【原子_产品_公共接口_获取资产账户默认交易组编号】*/
    call db_prod.pra_pdpubif_GetAccoDefaultExgp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no,
        v_error_code,
        v_error_info,
        v_default_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.49.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_获取资产账户默认交易组编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_default_exch_group_no = v_default_exch_group_no;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_申赎产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_ApplyPdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_ApplyPdCapital(
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
    OUT p_pd_update_times int,
    OUT p_pd_code varchar(32),
    OUT p_pd_name varchar(64),
    OUT p_pd_type int,
    OUT p_pd_apply_currency varchar(3),
    OUT p_pd_crncy_type varchar(3),
    OUT p_pd_first_asset decimal(18,4),
    OUT p_pd_all_share decimal(18,2),
    OUT p_pd_curr_share decimal(18,2),
    OUT p_pd_pre_share decimal(18,2),
    OUT p_pd_his_max_per_nav decimal(18,4),
    OUT p_pd_pre_nav decimal(18,4),
    OUT p_asac_update_times int
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
    declare v_pd_update_times int;
    declare v_pd_code varchar(32);
    declare v_pd_name varchar(64);
    declare v_pd_type int;
    declare v_pd_apply_currency varchar(3);
    declare v_pd_crncy_type varchar(3);
    declare v_pd_first_asset decimal(18,4);
    declare v_pd_all_share decimal(18,2);
    declare v_pd_curr_share decimal(18,2);
    declare v_pd_pre_share decimal(18,2);
    declare v_pd_his_max_per_nav decimal(18,4);
    declare v_pd_pre_nav decimal(18,4);
    declare v_asac_update_times int;
    declare v_pd_status varchar(2);
    declare v_crncy_type varchar(3);
    declare v_update_times int;
    declare v_occur_share decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pd_update_times = 0;
    SET v_pd_code = " ";
    SET v_pd_name = " ";
    SET v_pd_type = 0;
    SET v_pd_apply_currency = "CNY";
    SET v_pd_crncy_type = "CNY";
    SET v_pd_first_asset = 0;
    SET v_pd_all_share = 0;
    SET v_pd_curr_share = 0;
    SET v_pd_pre_share = 0;
    SET v_pd_his_max_per_nav = 0;
    SET v_pd_pre_nav = 0;
    SET v_asac_update_times = 0;
    SET v_pd_status = "0";
    SET v_crncy_type = "CNY";
    SET v_update_times = 1;
    SET v_occur_share = 0;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.50.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @本币币种# = "CNY"; */
    set v_crncy_type = "CNY";
    # 出入产品资金 的资金，要同时分配给产品下的资产账户及其交易组。

    /* [事务开始] */
    START TRANSACTION;


    /* if @申赎类型# = 《申赎类型-赎回》  then */
    if v_redempt_type = 2  then

        /* set @申赎金额# = -@申赎金额#; */
        set v_redempt_amt = -v_redempt_amt;
        #set @申赎份额# = -@申赎份额#;
    end if;

        /* 调用【原子_产品_资金_申赎产品资金】*/
        call db_prod.pra_pdcapit_ApplyPdCapital(
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
            v_crncy_type,
            v_redempt_type,
            v_redempt_amt,
            v_redempt_qty,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_cash_id,
            v_pd_first_amt,
            v_pd_curr_amt,
            v_pd_dist_amt,
            v_pd_auth_amt,
            v_pd_amt_check_diff,
            v_pd_pre_settle_amt,
            v_pd_total_cash_divide,
            v_pd_total_pre_fee,
            v_pd_total_rece_amt,
            v_pd_total_payab_amt,
            v_pd_intrst_cacl_amt,
            v_pd_pre_entry_intrst_amt,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.50.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_申赎产品资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @产品更新次数# = @更新次数#; */
        set v_pd_update_times = v_update_times;

        /* if @申赎份额# <> 0 then */
        if v_redempt_qty <> 0 then

            /* set @变动份额# = @申赎份额#; */
            set v_occur_share = v_redempt_qty;

            /* 调用【原子_产品_账户_更新产品份额变动量】*/
            call db_prod.pra_pdacco_UpdateProductShareOcurr(
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
                v_occur_share,
                v_oper_remark_info,
                v_menu_no,
                v_error_code,
                v_error_info,
                v_pd_code,
                v_pd_name,
                v_pd_type,
                v_pd_apply_currency,
                v_pd_crncy_type,
                v_pd_first_asset,
                v_pd_all_share,
                v_pd_curr_share,
                v_pd_pre_share,
                v_pd_his_max_per_nav,
                v_pd_pre_nav,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "prodT.6.50.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_更新产品份额变动量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @资产账户更新次数# = @更新次数#; */
            set v_asac_update_times = v_update_times;
        end if;

    /* [事务结束] */
    COMMIT;

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
    SET p_pd_update_times = v_pd_update_times;
    SET p_pd_code = v_pd_code;
    SET p_pd_name = v_pd_name;
    SET p_pd_type = v_pd_type;
    SET p_pd_apply_currency = v_pd_apply_currency;
    SET p_pd_crncy_type = v_pd_crncy_type;
    SET p_pd_first_asset = v_pd_first_asset;
    SET p_pd_all_share = v_pd_all_share;
    SET p_pd_curr_share = v_pd_curr_share;
    SET p_pd_pre_share = v_pd_pre_share;
    SET p_pd_his_max_per_nav = v_pd_his_max_per_nav;
    SET p_pd_pre_nav = v_pd_pre_nav;
    SET p_asac_update_times = v_asac_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_报盘回写通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_TransWriteInPassInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_TransWriteInPassInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_offer_server_name varchar(64),
    IN p_offer_server_ip varchar(64),
    IN p_mac_addr varchar(32),
    IN p_offer_name varchar(32),
    IN p_software_start_time int,
    IN p_pass_no int,
    IN p_pass_status varchar(2),
    IN p_bkup_field_1 varchar(32),
    IN p_bkup_field_2 int,
    IN p_bkup_field_3 decimal(18,12),
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
    declare v_offer_server_name varchar(64);
    declare v_offer_server_ip varchar(64);
    declare v_mac_addr varchar(32);
    declare v_offer_name varchar(32);
    declare v_software_start_time int;
    declare v_pass_no int;
    declare v_pass_status varchar(2);
    declare v_bkup_field_1 varchar(32);
    declare v_bkup_field_2 int;
    declare v_bkup_field_3 decimal(18,12);
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
    SET v_offer_server_name = p_offer_server_name;
    SET v_offer_server_ip = p_offer_server_ip;
    SET v_mac_addr = p_mac_addr;
    SET v_offer_name = p_offer_name;
    SET v_software_start_time = p_software_start_time;
    SET v_pass_no = p_pass_no;
    SET v_pass_status = p_pass_status;
    SET v_bkup_field_1 = p_bkup_field_1;
    SET v_bkup_field_2 = p_bkup_field_2;
    SET v_bkup_field_3 = p_bkup_field_3;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_公共接口_报盘回写通道信息】*/
    call db_prod.pra_pdpubif_TransWriteInPassInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_offer_server_name,
        v_offer_server_ip,
        v_mac_addr,
        v_offer_name,
        v_software_start_time,
        v_pass_no,
        v_pass_status,
        v_bkup_field_1,
        v_bkup_field_2,
        v_bkup_field_3,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.51.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_报盘回写通道信息出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_查询报盘回写通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_QueryTransWriteInPassInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_QueryTransWriteInPassInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_公共接口_查询报盘回写通道信息】*/
    call db_prod.pra_pdpubif_QueryTransWriteInPassInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_count,
        v_row_id,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.52.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_查询报盘回写通道信息出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_资产账户串获取默认交易组串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_AsacStrGetDefaultExgpStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_AsacStrGetDefaultExgpStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_default_exch_group_no_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_default_exch_group_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_default_exch_group_no_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_公共接口_资产账户串获取默认交易组串】*/
    call db_prod.pra_pdpubif_AsacStrGetDefaultExgpStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no_str,
        v_error_code,
        v_error_info,
        v_default_exch_group_no_str);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.53.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_资产账户串获取默认交易组串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_default_exch_group_no_str = v_default_exch_group_no_str;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_查询融资融券配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_QuerySecuMargTradConfig;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_QuerySecuMargTradConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_pd_no int,
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
    declare v_asset_acco_no int;
    declare v_pd_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_公共接口_查询融资融券配置表】*/
    call db_prod.pra_pdpubif_QuerySecuMargTradConfig(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_asset_acco_no,
        v_pd_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.54.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_查询融资融券配置表出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_获取产品业务控制串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_GetProdBusiConfigStr;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_GetProdBusiConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_busi_config_str varchar(64)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_config_str = " ";

    
    label_pro:BEGIN
    

     /* 调用【原子_产品_公共接口_获取产品业务控制串】*/
     call db_prod.pra_pdpubif_GetProdBusiConfigStr(
         v_opor_co_no,
         v_opor_no,
         v_oper_mac,
         v_oper_ip_addr,
         v_oper_info,
         v_oper_way,
         v_func_code,
         v_co_no,
         v_pd_no,
         v_error_code,
         v_error_info,
         v_busi_config_str);
     if v_error_code = "1" then
         SET v_error_code = "prodT.6.55.999";
         if v_mysql_message <> "" then
              SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_获取产品业务控制串出现错误！',v_mysql_message);
         end if;
         leave label_pro;
     elseif v_error_code <> "0" then
         leave label_pro;
     end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_config_str = v_busi_config_str;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_资产账户编号串获取外部账号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_AssetAccoNoStrGetOutAcco;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_AssetAccoNoStrGetOutAcco(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pass_no_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no_str varchar(2048);
    declare v_split_str varchar(4);
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no_str = " ";
    SET v_split_str = " ";
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";

    
    label_pro:BEGIN
    

    /* set @分隔符# = ";"; */
    set v_split_str = ";";

    /* set @通道编号串# =""; */
    set v_pass_no_str ="";

    /* while LOCATE(@分隔符#,@资产账户编号串#) <> 0  do */
    while LOCATE(v_split_str,v_asset_acco_no_str) <> 0  do

         /* set  @资产账户编号# = cast(substring(@资产账户编号串#,1,LOCATE(@分隔符#,@资产账户编号串#)-1)as SIGNED); */
         set  v_asset_acco_no = cast(substring(v_asset_acco_no_str,1,LOCATE(v_split_str,v_asset_acco_no_str)-1)as SIGNED);

         /* 调用【原子_产品_账户_资产账户编号获取外部账号】*/
         call db_prod.pra_pdacco_AssetAccoNoGetOutAcco(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_asset_acco_no,
             v_error_code,
             v_error_info,
             v_pass_no,
             v_out_acco);
         if v_error_code = "1" then
             SET v_error_code = "prodT.6.56.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_资产账户编号获取外部账号出现错误！',v_mysql_message);
             end if;
             leave label_pro;
         elseif v_error_code <> "0" then
             leave label_pro;
         end if;


         /* set @通道编号串# = concat(@通道编号串#,@通道编号#,";"); */
         set v_pass_no_str = concat(v_pass_no_str,v_pass_no,";");

         /* set @资产账户编号串# = substring(@资产账户编号串#,LOCATE(@分隔符#,@资产账户编号串#)+1); */
         set v_asset_acco_no_str = substring(v_asset_acco_no_str,LOCATE(v_split_str,v_asset_acco_no_str)+1);
    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pass_no_str = v_pass_no_str;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_公共接口_设置资产账户默认交易组关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_SetAccoDefaultExgpRelation;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_SetAccoDefaultExgpRelation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
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
    declare v_asset_acco_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_账户_设置资产账户默认交易组关系】*/
        call db_prod.pra_pdacco_SetAccoDefaultExgpRelation(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_asset_acco_no,
            v_pd_no,
            v_exch_group_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.6.57.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_设置资产账户默认交易组关系出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_公共接口_获取资产账户默认交易组编号不报错
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdpubif_GetAccoDefaultExgpWithoutError;;
DELIMITER ;;
CREATE PROCEDURE prt_pdpubif_GetAccoDefaultExgpWithoutError(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_default_exch_group_no int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_default_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_default_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_公共接口_获取资产账户默认交易组编号不报错】*/
    call db_prod.pra_pdpubif_GetAccoDefaultExgpWithoutError(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no,
        v_error_code,
        v_error_info,
        v_default_exch_group_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.6.58.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_公共接口_获取资产账户默认交易组编号不报错出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_default_exch_group_no = v_default_exch_group_no;

END;;


