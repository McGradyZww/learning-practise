DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_账户运维_查询全部期货账户
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuacbk_QueryAllFutuAcco;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuacbk_QueryAllFutuAcco(
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
    IN p_futu_acco_no int,
    IN p_futu_acco_status varchar(2),
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
    declare v_futu_acco_no int;
    declare v_futu_acco_status varchar(2);
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_futu_acco_status = p_futu_acco_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][产品期货_账户_期货账户信息表][{机构编号},{产品编号},{资产账户编号},{交易编码编号},{市场编号},{交易编码},{交易编码名称},{交易编码状态}][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@交易编码编号#=0 or {交易编码编号}=@交易编码编号#)  and (@交易编码状态#=" " or {交易编码状态}=@交易编码状态#)] */
    select co_no,pd_no,asset_acco_no,futu_acco_no,exch_no,futu_acco,futu_acco_name,futu_acco_status from db_pdfutu.tb_pdfuac_futu_acco where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_futu_acco_no=0 or futu_acco_no=v_futu_acco_no)  and (v_futu_acco_status=" " or futu_acco_status=v_futu_acco_status);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_账户运维_查询期货账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuacbk_QueryFutuAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuacbk_QueryFutuAccoInfo(
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
    IN p_futu_acco_no int,
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_status_str varchar(64),
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
    declare v_futu_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_status_str varchar(64);
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_status_str = p_futu_acco_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品期货_账户_期货账户信息表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#)  and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易编码状态串# = "; ;" or instr(@交易编码状态串#, concat(";",{交易编码状态},";"))>0) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号},";"))>0) and (@交易编码编号# = 0 or {交易编码编号}=@交易编码编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, futu_acco_no, exch_no, 
        futu_acco, futu_acco_name, futu_acco_status, hedge_type, 
        allow_contrc_type, busi_limit_str, remark_info from db_pdfutu.tb_pdfuac_futu_acco where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_futu_acco_status_str = "; ;" or instr(v_futu_acco_status_str, concat(";",futu_acco_status,";"))>0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no,";"))>0) and (v_futu_acco_no = 0 or futu_acco_no=v_futu_acco_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, futu_acco_no, exch_no, 
        futu_acco, futu_acco_name, futu_acco_status, hedge_type, 
        allow_contrc_type, busi_limit_str, remark_info from db_pdfutu.tb_pdfuac_futu_acco where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_futu_acco_status_str = "; ;" or instr(v_futu_acco_status_str, concat(";",futu_acco_status,";"))>0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no,";"))>0) and (v_futu_acco_no = 0 or futu_acco_no=v_futu_acco_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


