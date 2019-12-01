DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_公共接口_获取交易编码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopubif_GetFoFutuAccoNo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopubif_GetFoFutuAccoNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_futu_acco varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_futu_acco_no int
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
    declare v_exch_no int;
    declare v_futu_acco varchar(16);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_futu_acco_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco = p_futu_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_futu_acco_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品外盘期货_账户_外盘期货账户信息表][{交易编码编号}][@交易编码编号#][{资产账户编号} = @资产账户编号# and {市场编号} = @市场编号# and {交易编码} = @交易编码#][165][@资产账户编号#, @市场编号#, @交易编码#] */
    select futu_acco_no into v_futu_acco_no from db_pdfofu.tb_pdfoac_fofutuacco where asset_acco_no = v_asset_acco_no and exch_no = v_exch_no and futu_acco = v_futu_acco limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.4.1.165";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 市场编号=", v_exch_no,","," 交易编码=", v_futu_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 市场编号=", v_exch_no,","," 交易编码=", v_futu_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_futu_acco_no = v_futu_acco_no;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_公共接口_获取交易编码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopubif_GetFoFutuAcco;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopubif_GetFoFutuAcco(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_futu_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_no int,
    OUT p_futu_acco varchar(16)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_futu_acco varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_futu_acco = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品外盘期货_账户_外盘期货账户信息表][{市场编号}, {交易编码}][@市场编号#, @交易编码#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号#][165][@资产账户编号#,@交易编码编号#] */
    select exch_no, futu_acco into v_exch_no, v_futu_acco from db_pdfofu.tb_pdfoac_fofutuacco where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.4.2.165";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco = v_futu_acco;

END;;


