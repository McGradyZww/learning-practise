DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_查询资产账户持仓负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_QueryAsacPosiDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_QueryAsacPosiDebt(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
    IN p_debt_type int,
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
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
    declare v_debt_type int;
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_debt_type = p_debt_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_融资融券_资产账户持仓负债表][字段][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#)  and  (@负债类型#=0 or {负债类型}=@负债类型#) and  instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        invest_type, debt_type, begin_debt_qty, curr_debt_qty, 
        posi_qty_check_diff, begin_debt_amt, curr_debt_amt, debt_interest_amt, 
        debt_return_amt, debt_return_qty, return_interest_amt from db_pdsecu.tb_pdsecr_asac_posidebt where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no)  and  (v_debt_type=0 or debt_type=v_debt_type) and  instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        invest_type, debt_type, begin_debt_qty, curr_debt_qty, 
        posi_qty_check_diff, begin_debt_amt, curr_debt_amt, debt_interest_amt, 
        debt_return_amt, debt_return_qty, return_interest_amt from db_pdsecu.tb_pdsecr_asac_posidebt where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no)  and  (v_debt_type=0 or debt_type=v_debt_type) and  instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_查询交易组持仓负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_QueryExgpPosiDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_QueryExgpPosiDebt(
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
    IN p_stock_code_no_str varchar(4096),
    IN p_debt_type int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
    declare v_debt_type int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_debt_type = p_debt_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_融资融券_交易组持仓负债表][字段][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#)  and    (@负债类型#=0 or {负债类型}=@负债类型#)  and  (@交易组编号# = 0 or {交易组编号} = @交易组编号#)  and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_code, stock_type, 
        asset_type, invest_type, debt_type, begin_debt_qty, 
        curr_debt_qty, posi_qty_check_diff, begin_debt_amt, curr_debt_amt, 
        debt_interest_amt, debt_return_amt, debt_return_qty, return_interest_amt from db_pdsecu.tb_pdsecr_exgp_posidebt where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no)  and    (v_debt_type=0 or debt_type=v_debt_type)  and  (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_code, stock_type, 
        asset_type, invest_type, debt_type, begin_debt_qty, 
        curr_debt_qty, posi_qty_check_diff, begin_debt_amt, curr_debt_amt, 
        debt_interest_amt, debt_return_amt, debt_return_qty, return_interest_amt from db_pdsecu.tb_pdsecr_exgp_posidebt where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no)  and    (v_debt_type=0 or debt_type=v_debt_type)  and  (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_查询交易组资金负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_QueryExgpCapitalDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_QueryExgpCapitalDebt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
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
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_融资融券_交易组资金负债表][字段][{机构编号} = @操作员机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#)  and (@交易组编号# = 0 or {交易组编号} = @交易组编号#)  and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, loan_sell_amt, debt_interest_amt from db_pdsecu.tb_pdsecr_exgp_capitdebt where co_no = v_opor_co_no and (v_pd_no = 0 or pd_no = v_pd_no)  and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, loan_sell_amt, debt_interest_amt from db_pdsecu.tb_pdsecr_exgp_capitdebt where co_no = v_opor_co_no and (v_pd_no = 0 or pd_no = v_pd_no)  and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_查询资产账户资金负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_QueryAsacCapitalDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_QueryAsacCapitalDebt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_asset_acco_no int,
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
    declare v_pd_no int;
    declare v_asset_acco_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_融资融券_资产账户资金负债表][字段][{机构编号} = @操作员机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#)  and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        loan_sell_amt, debt_interest_amt from db_pdsecu.tb_pdsecr_asac_capitdebt where co_no = v_opor_co_no and (v_pd_no = 0 or pd_no = v_pd_no)  and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        loan_sell_amt, debt_interest_amt from db_pdsecu.tb_pdsecr_asac_capitdebt where co_no = v_opor_co_no and (v_pd_no = 0 or pd_no = v_pd_no)  and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_查询资产账户负债明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_QueryAsacDebtDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_QueryAsacDebtDetail(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
    IN p_debt_type int,
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
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
    declare v_debt_type int;
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_debt_type = p_debt_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_融资融券_资产账户负债明细表][字段][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#)  and  (@负债类型#=0 or {负债类型}=@负债类型#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        pass_no, exch_no, stock_acco_no, stock_code_no, 
        stock_code, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_intrst_rate, begin_debt_amt, 
        begin_debt_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, interest_update_date, debt_end_date, orign_debt_end_date, 
        defer_times, debt_return_date, debt_status, remark_info from db_pdsecu.tb_pdsecr_asac_debtdetail where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no)  and  (v_debt_type=0 or debt_type=v_debt_type) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        pass_no, exch_no, stock_acco_no, stock_code_no, 
        stock_code, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_intrst_rate, begin_debt_amt, 
        begin_debt_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, interest_update_date, debt_end_date, orign_debt_end_date, 
        defer_times, debt_return_date, debt_status, remark_info from db_pdsecu.tb_pdsecr_asac_debtdetail where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no)  and  (v_debt_type=0 or debt_type=v_debt_type) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_查询交易组负债明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_QueryExgpDebtDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_QueryExgpDebtDetail(
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
    IN p_stock_code_no_str varchar(4096),
    IN p_debt_type int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
    declare v_debt_type int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_debt_type = p_debt_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_融资融券_交易组负债明细表][字段][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#)  and (@交易组编号# = 0 or {交易组编号} = @交易组编号#)  and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#)  and  (@负债类型#=0 or {负债类型}=@负债类型#)  and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        exch_group_no, pass_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        debt_type, strike_qty, strike_amt, strike_fee, 
        order_no, report_no, order_date, order_time, 
        order_dir, order_price, order_qty, debt_intrst_rate, 
        begin_debt_amt, begin_debt_qty, debt_amt, debt_qty, 
        debt_fee, debt_interest, intrst_base_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt, interest_update_date, debt_end_date, 
        orign_debt_end_date, defer_times, debt_return_date, debt_status, 
        remark_info from db_pdsecu.tb_pdsecr_exgp_debtdetail where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no)  and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no)  and  (v_debt_type=0 or debt_type=v_debt_type)  and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        exch_group_no, pass_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        debt_type, strike_qty, strike_amt, strike_fee, 
        order_no, report_no, order_date, order_time, 
        order_dir, order_price, order_qty, debt_intrst_rate, 
        begin_debt_amt, begin_debt_qty, debt_amt, debt_qty, 
        debt_fee, debt_interest, intrst_base_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt, interest_update_date, debt_end_date, 
        orign_debt_end_date, defer_times, debt_return_date, debt_status, 
        remark_info from db_pdsecu.tb_pdsecr_exgp_debtdetail where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no)  and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no)  and  (v_debt_type=0 or debt_type=v_debt_type)  and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_归档产品证券融资融券数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_BackUpPdSecuCrdtData;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_BackUpPdSecuCrdtData(
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
    declare v_table_name varchar(64);

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
    SET v_table_name = " ";

    
    label_pro:BEGIN
    

    /* set @数据表名称# = "~产品证券_融资融券_历史交易组资金负债表^"; */
    set v_table_name = "db_pdsecu_his.tb_pdsecr_exgp_capitdebt_his";

    /* [删除表记录][产品证券_融资融券_历史交易组资金负债表][{初始化日期}=@初始化日期#][301][@数据表名称#,@初始化日期#] */
    delete from db_pdsecu_his.tb_pdsecr_exgp_capitdebt_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.21.21.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_交易组资金负债表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_exgp_capitdebt";

    /* [不分日期数据归历史][产品证券_融资融券_交易组资金负债表][字段][302][@数据表名称#,@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsecr_exgp_capitdebt_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, crncy_type, begin_amt, 
        loan_sell_amt, debt_interest_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, crncy_type, begin_amt, 
        loan_sell_amt, debt_interest_amt 
        from db_pdsecu.tb_pdsecr_exgp_capitdebt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.21.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_历史资产账户资金负债表^"; */
    set v_table_name = "db_pdsecu_his.tb_pdsecr_asac_capitdebt_his";

    /* [删除表记录][产品证券_融资融券_历史资产账户资金负债表][{初始化日期}=@初始化日期#][301][@数据表名称#,@初始化日期#] */
    delete from db_pdsecu_his.tb_pdsecr_asac_capitdebt_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.21.21.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_资产账户资金负债表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_asac_capitdebt";

    /* [不分日期数据归历史][产品证券_融资融券_资产账户资金负债表][字段][302][@数据表名称#,@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsecr_asac_capitdebt_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, begin_amt, loan_sell_amt, 
        debt_interest_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, begin_amt, loan_sell_amt, 
        debt_interest_amt 
        from db_pdsecu.tb_pdsecr_asac_capitdebt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.21.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_历史交易组持仓负债表^"; */
    set v_table_name = "db_pdsecu_his.tb_pdsecr_exgp_posidebt_his";

    /* [删除表记录][产品证券_融资融券_历史交易组持仓负债表][{初始化日期}=@初始化日期#][301][@数据表名称#,@初始化日期#] */
    delete from db_pdsecu_his.tb_pdsecr_exgp_posidebt_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.21.21.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_交易组持仓负债表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_exgp_posidebt";

    /* [不分日期数据归历史][产品证券_融资融券_交易组持仓负债表][字段][302][@数据表名称#,@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsecr_exgp_posidebt_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        invest_type, debt_type, begin_debt_qty, curr_debt_qty, 
        posi_qty_check_diff, begin_debt_amt, curr_debt_amt, debt_interest_amt, 
        debt_return_amt, debt_return_qty, return_interest_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        invest_type, debt_type, begin_debt_qty, curr_debt_qty, 
        posi_qty_check_diff, begin_debt_amt, curr_debt_amt, debt_interest_amt, 
        debt_return_amt, debt_return_qty, return_interest_amt 
        from db_pdsecu.tb_pdsecr_exgp_posidebt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.21.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_历史资产账户持仓负债表^"; */
    set v_table_name = "db_pdsecu_his.tb_pdsecr_asac_posidebt_his";

    /* [删除表记录][产品证券_融资融券_历史资产账户持仓负债表][{初始化日期}=@初始化日期#][301][@数据表名称#,@初始化日期#] */
    delete from db_pdsecu_his.tb_pdsecr_asac_posidebt_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.21.21.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_资产账户持仓负债表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_asac_posidebt";

    /* [不分日期数据归历史][产品证券_融资融券_资产账户持仓负债表][字段][302][@数据表名称#,@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsecr_asac_posidebt_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        stock_code, stock_type, asset_type, invest_type, 
        debt_type, begin_debt_qty, curr_debt_qty, posi_qty_check_diff, 
        begin_debt_amt, curr_debt_amt, debt_interest_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        stock_code, stock_type, asset_type, invest_type, 
        debt_type, begin_debt_qty, curr_debt_qty, posi_qty_check_diff, 
        begin_debt_amt, curr_debt_amt, debt_interest_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt 
        from db_pdsecu.tb_pdsecr_asac_posidebt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.21.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_资产账户负债明细表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_asac_debtdetail";

    /* [非主键数据归历史][产品证券_融资融券_资产账户负债明细表][字段][302][@数据表名称#,@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsecr_asac_debtdetail_his (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, opor_no, 
        co_no, pd_no, asset_acco_no, pass_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_type, asset_type, debt_type, strike_qty, 
        strike_amt, strike_fee, order_no, report_no, 
        order_date, order_time, order_dir, order_price, 
        order_qty, debt_intrst_rate, begin_debt_amt, begin_debt_qty, 
        debt_amt, debt_qty, debt_fee, debt_interest, 
        intrst_base_amt, debt_return_amt, debt_return_qty, return_interest_amt, 
        interest_update_date, debt_end_date, orign_debt_end_date, defer_times, 
        debt_return_date, debt_status, remark_info) 
        select 
        create_date, create_time, update_date, 
        update_time, update_times, init_date, opor_no, 
        co_no, pd_no, asset_acco_no, pass_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_type, asset_type, debt_type, strike_qty, 
        strike_amt, strike_fee, order_no, report_no, 
        order_date, order_time, order_dir, order_price, 
        order_qty, debt_intrst_rate, begin_debt_amt, begin_debt_qty, 
        debt_amt, debt_qty, debt_fee, debt_interest, 
        intrst_base_amt, debt_return_amt, debt_return_qty, return_interest_amt, 
        interest_update_date, debt_end_date, orign_debt_end_date, defer_times, 
        debt_return_date, debt_status, remark_info 
        from db_pdsecu.tb_pdsecr_asac_debtdetail;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.21.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_资产账户负债明细表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_asac_debtdetail";

    /* [删除表记录][产品证券_融资融券_资产账户负债明细表][{负债状态}=《负债状态-已归还》 ][301][@数据表名称#,@初始化日期#] */
    delete from db_pdsecu.tb_pdsecr_asac_debtdetail 
        where debt_status=2 ;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.21.21.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_交易组负债明细表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_exgp_debtdetail";

    /* [非主键数据归历史][产品证券_融资融券_交易组负债明细表][字段][302][@数据表名称#,@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsecr_exgp_debtdetail_his (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, opor_no, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, exch_no, stock_acco_no, stock_code_no, 
        stock_code, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_intrst_rate, begin_debt_amt, 
        begin_debt_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, interest_update_date, debt_end_date, orign_debt_end_date, 
        defer_times, debt_return_date, debt_status, remark_info) 
        select 
        create_date, create_time, update_date, 
        update_time, update_times, init_date, opor_no, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, exch_no, stock_acco_no, stock_code_no, 
        stock_code, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_intrst_rate, begin_debt_amt, 
        begin_debt_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, interest_update_date, debt_end_date, orign_debt_end_date, 
        defer_times, debt_return_date, debt_status, remark_info 
        from db_pdsecu.tb_pdsecr_exgp_debtdetail;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.21.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_融资融券_交易组负债明细表][{负债状态}=《负债状态-已归还》][301][@数据表名称#,@初始化日期#] */
    delete from db_pdsecu.tb_pdsecr_exgp_debtdetail 
        where debt_status=2;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.21.21.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_负债变动流水表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_debt_occur_jour";

    /* [数据归历史][产品证券_融资融券_负债变动流水表][字段][1=1][302][@数据表名称#,@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsecr_debt_occur_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_type, asset_type, debt_type, busi_flag, 
        occur_qty, occur_amt, occur_end_qty, occur_end_amt, 
        strike_price, record_valid_flag, curr_row_id, return_capit_jour_nor, 
        remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_type, asset_type, debt_type, busi_flag, 
        occur_qty, occur_amt, occur_end_qty, occur_end_amt, 
        strike_price, record_valid_flag, curr_row_id, return_capit_jour_nor, 
        remark_info 
        from db_pdsecu.tb_pdsecr_debt_occur_jour 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.21.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_融资融券_负债变动流水表][1=1][301][@数据表名称#,@初始化日期#] */
    delete from db_pdsecu.tb_pdsecr_debt_occur_jour 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.21.21.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_初始化更新负债期初
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_InitUpdateDebtBegin;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_InitUpdateDebtBegin(
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
    declare v_table_name varchar(64);
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
    SET v_table_name = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @数据表名称# = "~产品证券_融资融券_交易组资金负债表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_exgp_capitdebt";

    /* [更新表记录][产品证券_融资融券_交易组资金负债表][{期初金额}={融券卖出金额}][1=1][2][@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsecr_exgp_capitdebt set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt=loan_sell_amt where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_资产账户资金负债表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_asac_capitdebt";

    /* [更新表记录][产品证券_融资融券_资产账户资金负债表][{期初金额}={融券卖出金额}][1=1][2][@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsecr_asac_capitdebt set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt=loan_sell_amt where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_资产账户持仓负债表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_asac_posidebt";

    /* [更新表记录][产品证券_融资融券_资产账户持仓负债表][{期初负债数量}={当前负债数量},{期初负债金额}={当前负债金额},{持仓核对差额}=0][1=1][2][@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsecr_asac_posidebt set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_debt_qty=curr_debt_qty,begin_debt_amt=curr_debt_amt,posi_qty_check_diff=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_交易组持仓负债表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_exgp_posidebt";

    /* [更新表记录][产品证券_融资融券_交易组持仓负债表][{期初负债数量}={当前负债数量},{期初负债金额}={当前负债金额},{持仓核对差额}=0][1=1][2][@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsecr_exgp_posidebt set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_debt_qty=curr_debt_qty,begin_debt_amt=curr_debt_amt,posi_qty_check_diff=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_交易组负债明细表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_exgp_debtdetail";

    /* [更新表记录][产品证券_融资融券_交易组负债明细表][{期初负债数量}={负债数量},{期初负债金额}={负债金额},{初始化日期}=@初始化日期#][1=1][2][@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_debt_qty=debt_qty,begin_debt_amt=debt_amt,init_date=v_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~产品证券_融资融券_资产账户负债明细表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_asac_debtdetail";

    /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{期初负债数量}={负债数量},{期初负债金额}={负债金额},{初始化日期}=@初始化日期#][1=1][2][@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_debt_qty=debt_qty,begin_debt_amt=debt_amt,init_date=v_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_更新资产账户负债利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_UpdateAsacDebtInterest;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_UpdateAsacDebtInterest(
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
    declare v_mach_date int;
    declare v_invest_type int;
    declare v_tmp_init_date int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_order_no int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_debt_intrst_rate decimal(18,12);
    declare v_begin_debt_amt decimal(18,4);
    declare v_begin_debt_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_interest_update_date int;
    declare v_debt_end_date int;
    declare v_orign_debt_end_date int;
    declare v_defer_times int;
    declare v_debt_return_date int;
    declare v_debt_status int;
    declare v_remark_info varchar(255);
    declare v_tmp_intrst_base_amt decimal(18,4);
    declare v_inteval_days int;
    declare v_occur_intrst_amt decimal(18,4);

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
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_invest_type = 0;
    SET v_tmp_init_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_debt_type = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_fee = 0;
    SET v_order_no = 0;
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_debt_intrst_rate = 0;
    SET v_begin_debt_amt = 0;
    SET v_begin_debt_qty = 0;
    SET v_debt_amt = 0;
    SET v_debt_qty = 0;
    SET v_debt_fee = 0;
    SET v_debt_interest = 0;
    SET v_intrst_base_amt = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_interest_update_date = 0;
    SET v_debt_end_date = 0;
    SET v_orign_debt_end_date = 0;
    SET v_defer_times = 0;
    SET v_debt_return_date = 0;
    SET v_debt_status = 0;
    SET v_remark_info = " ";
    SET v_tmp_intrst_base_amt = 0;
    SET v_inteval_days = 0;
    SET v_occur_intrst_amt = 0;

    
    label_pro:BEGIN
    

     /* [获取机器日期][@机器日期#] */
     select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set  @临时_初始化日期#=@初始化日期#; */
    set  v_tmp_init_date=v_init_date;

    /* [声明游标][产品证券_融资融券_资产账户负债明细表][字段][{负债状态}<>《负债状态-已归还》][cursor_debtjour] */
    cursor_debtjour:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_debtjour CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        pass_no, exch_no, stock_acco_no, stock_code_no, 
        stock_code, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_intrst_rate, begin_debt_amt, 
        begin_debt_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, interest_update_date, debt_end_date, orign_debt_end_date, 
        defer_times, debt_return_date, debt_status, remark_info 
        from db_pdsecu.tb_pdsecr_asac_debtdetail 
        where debt_status<>2;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_debtjour][loop_debtjour] */
    open cursor_debtjour;
    loop_debtjour: LOOP
    fetch cursor_debtjour into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_opor_no, v_co_no, v_pd_no, v_asset_acco_no, 
        v_pass_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
        v_stock_code, v_stock_type, v_asset_type, v_debt_type, 
        v_strike_qty, v_strike_amt, v_strike_fee, v_order_no, 
        v_report_no, v_order_date, v_order_time, v_order_dir, 
        v_order_price, v_order_qty, v_debt_intrst_rate, v_begin_debt_amt, 
        v_begin_debt_qty, v_debt_amt, v_debt_qty, v_debt_fee, 
        v_debt_interest, v_intrst_base_amt, v_debt_return_amt, v_debt_return_qty, 
        v_return_interest_amt, v_interest_update_date, v_debt_end_date, v_orign_debt_end_date, 
        v_defer_times, v_debt_return_date, v_debt_status, v_remark_info;
        IF v_cursor_done THEN
            LEAVE loop_debtjour;
        END IF;


          /* set @临时_利息积数#=@利息积数#; */
          set v_tmp_intrst_base_amt=v_intrst_base_amt;

          /* [获取日期差值][@利息积数更改日期#][@临时_初始化日期#][@间隔天数#]; */
          set v_inteval_days = datediff(v_tmp_init_date,v_interest_update_date);


          /* set @利息积数#= @利息积数#+(@负债金额#-@已归还金额#)*@间隔天数#; */
          set v_intrst_base_amt= v_intrst_base_amt+(v_debt_amt-v_debt_return_amt)*v_inteval_days;

          /* set  @利息积数更改日期#=@临时_初始化日期#; */
          set  v_interest_update_date=v_tmp_init_date;
          #新增利息金额

          /* set @变动利息金额#=@负债年利率#/360.0*@利息积数# - @负债年利率#/360.0*@临时_利息积数#; */
          set v_occur_intrst_amt=v_debt_intrst_rate/360.0*v_intrst_base_amt - v_debt_intrst_rate/360.0*v_tmp_intrst_base_amt;

          /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债利息}={负债利息}+@变动利息金额#,{利息积数更改日期}=@利息积数更改日期#,{利息积数}=@利息积数#][{记录序号}=@记录序号#][1][@记录序号#] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_interest=debt_interest+v_occur_intrst_amt,interest_update_date=v_interest_update_date,intrst_base_amt=v_intrst_base_amt where row_id=v_row_id;
          if v_error_code = "1" then
                      
              SET v_error_code = "pdsecuA.21.23.1";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
              else
                  SET v_error_info = concat("记录序号=",v_row_id);
              end if;
              close cursor_debtjour;
              leave label_pro;
          end if;


    /* [关闭游标][cursor_debtjour] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_debtjour;
    end cursor_debtjour;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_更新交易组负债利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_UpdateExgpDebtInterest;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_UpdateExgpDebtInterest(
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
    declare v_mach_date int;
    declare v_invest_type int;
    declare v_tmp_init_date int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_order_no int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_debt_intrst_rate decimal(18,12);
    declare v_begin_debt_amt decimal(18,4);
    declare v_begin_debt_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_interest_update_date int;
    declare v_debt_end_date int;
    declare v_orign_debt_end_date int;
    declare v_defer_times int;
    declare v_debt_return_date int;
    declare v_debt_status int;
    declare v_remark_info varchar(255);
    declare v_tmp_intrst_base_amt decimal(18,4);
    declare v_inteval_days int;
    declare v_occur_intrst_amt decimal(18,4);

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
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_invest_type = 0;
    SET v_tmp_init_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_pass_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_debt_type = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_fee = 0;
    SET v_order_no = 0;
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_debt_intrst_rate = 0;
    SET v_begin_debt_amt = 0;
    SET v_begin_debt_qty = 0;
    SET v_debt_amt = 0;
    SET v_debt_qty = 0;
    SET v_debt_fee = 0;
    SET v_debt_interest = 0;
    SET v_intrst_base_amt = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_interest_update_date = 0;
    SET v_debt_end_date = 0;
    SET v_orign_debt_end_date = 0;
    SET v_defer_times = 0;
    SET v_debt_return_date = 0;
    SET v_debt_status = 0;
    SET v_remark_info = " ";
    SET v_tmp_intrst_base_amt = 0;
    SET v_inteval_days = 0;
    SET v_occur_intrst_amt = 0;

    
    label_pro:BEGIN
    

     /* [获取机器日期][@机器日期#] */
     select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set  @临时_初始化日期#=@初始化日期#; */
    set  v_tmp_init_date=v_init_date;

    /* [声明游标][产品证券_融资融券_交易组负债明细表][字段][{负债状态}<>《负债状态-已归还》][cursor_debtjour] */
    cursor_debtjour:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_debtjour CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        exch_group_no, pass_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        debt_type, strike_qty, strike_amt, strike_fee, 
        order_no, report_no, order_date, order_time, 
        order_dir, order_price, order_qty, debt_intrst_rate, 
        begin_debt_amt, begin_debt_qty, debt_amt, debt_qty, 
        debt_fee, debt_interest, intrst_base_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt, interest_update_date, debt_end_date, 
        orign_debt_end_date, defer_times, debt_return_date, debt_status, 
        remark_info 
        from db_pdsecu.tb_pdsecr_exgp_debtdetail 
        where debt_status<>2;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_debtjour][loop_debtjour] */
    open cursor_debtjour;
    loop_debtjour: LOOP
    fetch cursor_debtjour into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_opor_no, v_co_no, v_pd_no, v_asset_acco_no, 
        v_exch_group_no, v_pass_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_stock_type, v_asset_type, 
        v_debt_type, v_strike_qty, v_strike_amt, v_strike_fee, 
        v_order_no, v_report_no, v_order_date, v_order_time, 
        v_order_dir, v_order_price, v_order_qty, v_debt_intrst_rate, 
        v_begin_debt_amt, v_begin_debt_qty, v_debt_amt, v_debt_qty, 
        v_debt_fee, v_debt_interest, v_intrst_base_amt, v_debt_return_amt, 
        v_debt_return_qty, v_return_interest_amt, v_interest_update_date, v_debt_end_date, 
        v_orign_debt_end_date, v_defer_times, v_debt_return_date, v_debt_status, 
        v_remark_info;
        IF v_cursor_done THEN
            LEAVE loop_debtjour;
        END IF;


          /* set @临时_利息积数#=@利息积数#; */
          set v_tmp_intrst_base_amt=v_intrst_base_amt;

          /* [获取日期差值][@利息积数更改日期#][@临时_初始化日期#][@间隔天数#] */
          set v_inteval_days = datediff(v_tmp_init_date,v_interest_update_date);


          /* set @利息积数#= @利息积数#+(@负债金额#-@已归还金额#)*@间隔天数#; */
          set v_intrst_base_amt= v_intrst_base_amt+(v_debt_amt-v_debt_return_amt)*v_inteval_days;

          /* set  @利息积数更改日期#=@临时_初始化日期#; */
          set  v_interest_update_date=v_tmp_init_date;
          #新增利息金额

          /* set @变动利息金额#=@负债年利率#/360.0*@利息积数# - @负债年利率#/360.0*@临时_利息积数#; */
          set v_occur_intrst_amt=v_debt_intrst_rate/360.0*v_intrst_base_amt - v_debt_intrst_rate/360.0*v_tmp_intrst_base_amt;

         /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债利息}={负债利息}+@变动利息金额#,{利息积数更改日期}=@利息积数更改日期#,{利息积数}=@利息积数#][{记录序号}=@记录序号#][1][@记录序号#] */
         set v_update_date = date_format(curdate(),'%Y%m%d');
         set v_update_time = date_format(curtime(),'%H%i%s');
         update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_interest=debt_interest+v_occur_intrst_amt,interest_update_date=v_interest_update_date,intrst_base_amt=v_intrst_base_amt where row_id=v_row_id;
         if v_error_code = "1" then
                     
             SET v_error_code = "pdsecuA.21.24.1";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
             else
                 SET v_error_info = concat("记录序号=",v_row_id);
             end if;
             close cursor_debtjour;
             leave label_pro;
         end if;


    /* [关闭游标][cursor_debtjour] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_debtjour;
    end cursor_debtjour;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_初始化融资融券数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_InitPdSecuCrdtData;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_InitPdSecuCrdtData(
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
    declare v_remark_info varchar(255);

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
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

        /* set @备注信息#=""; */
        set v_remark_info="";

        /* 调用【原子_产品证券_融资融券_更新交易组负债利息】*/
        call db_pdsecu.pra_pdsecrdt_UpdateExgpDebtInterest(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuA.21.25.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券_更新交易组负债利息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* 调用【原子_产品证券_融资融券_更新资产账户负债利息】*/
        call db_pdsecu.pra_pdsecrdt_UpdateAsacDebtInterest(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuA.21.25.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券_更新资产账户负债利息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* 调用【原子_产品证券_融资融券_更新资产账户持仓汇总负债利息】*/
        call db_pdsecu.pra_pdsecrdt_UpdateAsacPosiDebtInterest(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuA.21.25.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券_更新资产账户持仓汇总负债利息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* 调用【原子_产品证券_融资融券_更新交易组持仓汇总负债利息】*/
        call db_pdsecu.pra_pdsecrdt_UpdateExgpPosiDebtInterest(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuA.21.25.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券_更新交易组持仓汇总负债利息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* 调用【原子_产品证券_融资融券_初始化更新负债期初】*/
        call db_pdsecu.pra_pdsecrdt_InitUpdateDebtBegin(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuA.21.25.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券_初始化更新负债期初出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 原子_产品证券_融资融券_更新资产账户持仓汇总负债利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_UpdateAsacPosiDebtInterest;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_UpdateAsacPosiDebtInterest(
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

    
    label_pro:BEGIN
    

    /* update ~产品证券_融资融券_资产账户持仓负债表^  t ,(select {机构编号},{资产账户编号},{证券代码编号},{负债类型},sum({负债利息}) as {负债利息},sum({归还利息金额}) as {归还利息金额} from ~产品证券_融资融券_资产账户负债明细表^ group by {机构编号},{资产账户编号},{证券代码编号},{负债类型}) x set t.{负债利息金额}=x.{负债利息},t.{归还利息金额}=x.{归还利息金额}  where t.{机构编号}=x.{机构编号}  and t.{资产账户编号}=x.{资产账户编号} and t.{证券代码编号}=x.{证券代码编号} and t.{负债类型}=x.{负债类型}; */
    update db_pdsecu.tb_pdsecr_asac_posidebt  t ,(select co_no,asset_acco_no,stock_code_no,debt_type,sum(debt_interest) as debt_interest,sum(return_interest_amt) as return_interest_amt from db_pdsecu.tb_pdsecr_asac_debtdetail group by co_no,asset_acco_no,stock_code_no,debt_type) x set t.debt_interest_amt=x.debt_interest,t.return_interest_amt=x.return_interest_amt  where t.co_no=x.co_no  and t.asset_acco_no=x.asset_acco_no and t.stock_code_no=x.stock_code_no and t.debt_type=x.debt_type;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_更新交易组持仓汇总负债利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_UpdateExgpPosiDebtInterest;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_UpdateExgpPosiDebtInterest(
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

    
    label_pro:BEGIN
    

    /* update ~产品证券_融资融券_交易组持仓负债表^  t ,( select {机构编号},{资产账户编号},{交易组编号},{证券代码编号},{负债类型},sum({负债利息}) as {负债利息},sum({归还利息金额}) as {归还利息金额} from ~产品证券_融资融券_交易组负债明细表^ group by {机构编号},{资产账户编号},{交易组编号},{证券代码编号},{负债类型}) x set t.{负债利息金额}=x.{负债利息}, t.{归还利息金额}=x.{归还利息金额}  where t.{机构编号}=x.{机构编号}  and t.{资产账户编号}=x.{资产账户编号} and  t.{交易组编号}=x.{交易组编号}  and t.{证券代码编号}=x.{证券代码编号} and t.{负债类型}=x.{负债类型}; */
    update db_pdsecu.tb_pdsecr_exgp_posidebt  t ,( select co_no,asset_acco_no,exch_group_no,stock_code_no,debt_type,sum(debt_interest) as debt_interest,sum(return_interest_amt) as return_interest_amt from db_pdsecu.tb_pdsecr_exgp_debtdetail group by co_no,asset_acco_no,exch_group_no,stock_code_no,debt_type) x set t.debt_interest_amt=x.debt_interest, t.return_interest_amt=x.return_interest_amt  where t.co_no=x.co_no  and t.asset_acco_no=x.asset_acco_no and  t.exch_group_no=x.exch_group_no  and t.stock_code_no=x.stock_code_no and t.debt_type=x.debt_type;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_更新融资融券负债利率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_UpdateCrdtDebtIntrstRate;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_UpdateCrdtDebtIntrstRate(
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
    IN p_fina_year_intrst_rate decimal(18,12),
    IN p_secu_loan_year_intrst_rate decimal(18,12),
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
    declare v_fina_year_intrst_rate decimal(18,12);
    declare v_secu_loan_year_intrst_rate decimal(18,12);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_fina_year_intrst_rate = p_fina_year_intrst_rate;
    SET v_secu_loan_year_intrst_rate = p_secu_loan_year_intrst_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债年利率}=@融资年利率#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {资产账户编号}=@资产账户编号# and {负债类型}=《负债类型-融资》][1][@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_intrst_rate=v_fina_year_intrst_rate where co_no=v_co_no and pd_no=v_pd_no  and asset_acco_no=v_asset_acco_no and debt_type=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.28.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债年利率}=@融券年利率#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {资产账户编号}=@资产账户编号# and {负债类型}=《负债类型-融券》][2][@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_intrst_rate=v_secu_loan_year_intrst_rate where co_no=v_co_no and pd_no=v_pd_no  and asset_acco_no=v_asset_acco_no and debt_type=2;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.28.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债年利率}=@融资年利率#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {资产账户编号}=@资产账户编号# and {负债类型}=《负债类型-融资》][3][@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_intrst_rate=v_fina_year_intrst_rate where co_no=v_co_no and pd_no=v_pd_no  and asset_acco_no=v_asset_acco_no and debt_type=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.28.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债年利率}=@融券年利率#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {资产账户编号}=@资产账户编号# and {负债类型}=《负债类型-融券》][4][@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_intrst_rate=v_secu_loan_year_intrst_rate where co_no=v_co_no and pd_no=v_pd_no  and asset_acco_no=v_asset_acco_no and debt_type=2;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.28.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_查询风控资产账户持仓负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_QueryRiskAsacPosiDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_QueryRiskAsacPosiDebt(
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
    

    /* [获取表记录][产品证券_融资融券_资产账户持仓负债表][字段][{记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        invest_type, debt_type, begin_debt_qty, curr_debt_qty, 
        posi_qty_check_diff, begin_debt_amt, curr_debt_amt, debt_interest_amt, 
        debt_return_amt, debt_return_qty, return_interest_amt from db_pdsecu.tb_pdsecr_asac_posidebt where row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        invest_type, debt_type, begin_debt_qty, curr_debt_qty, 
        posi_qty_check_diff, begin_debt_amt, curr_debt_amt, debt_interest_amt, 
        debt_return_amt, debt_return_qty, return_interest_amt from db_pdsecu.tb_pdsecr_asac_posidebt where row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_查询风控交易组持仓负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_QueryRiskExgpPosiDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_QueryRiskExgpPosiDebt(
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
    

    /* [获取表记录][产品证券_融资融券_交易组持仓负债表][字段][ {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_code, stock_type, 
        asset_type, invest_type, debt_type, begin_debt_qty, 
        curr_debt_qty, posi_qty_check_diff, begin_debt_amt, curr_debt_amt, 
        debt_interest_amt, debt_return_amt, debt_return_qty, return_interest_amt from db_pdsecu.tb_pdsecr_exgp_posidebt where  row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_code, stock_type, 
        asset_type, invest_type, debt_type, begin_debt_qty, 
        curr_debt_qty, posi_qty_check_diff, begin_debt_amt, curr_debt_amt, 
        debt_interest_amt, debt_return_amt, debt_return_qty, return_interest_amt from db_pdsecu.tb_pdsecr_exgp_posidebt where  row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_查询风控交易组资金负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_QueryRiskExgpCapitalDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_QueryRiskExgpCapitalDebt(
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
    

    /* [获取表记录][产品证券_融资融券_交易组资金负债表][字段][ {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, loan_sell_amt, debt_interest_amt from db_pdsecu.tb_pdsecr_exgp_capitdebt where  row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, loan_sell_amt, debt_interest_amt from db_pdsecu.tb_pdsecr_exgp_capitdebt where  row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_查询风控资产账户资金负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_QueryRiskAsacCapitalDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_QueryRiskAsacCapitalDebt(
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
    

    /* [获取表记录][产品证券_融资融券_资产账户资金负债表][字段][{记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        loan_sell_amt, debt_interest_amt from db_pdsecu.tb_pdsecr_asac_capitdebt where row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        loan_sell_amt, debt_interest_amt from db_pdsecu.tb_pdsecr_asac_capitdebt where row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_查询风控资产账户负债明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_QueryRiskAsacDebtDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_QueryRiskAsacDebtDetail(
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
    

    /* [获取表记录][产品证券_融资融券_资产账户负债明细表][字段][{记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        pass_no, exch_no, stock_acco_no, stock_code_no, 
        stock_code, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_intrst_rate, begin_debt_amt, 
        begin_debt_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, interest_update_date, debt_end_date, orign_debt_end_date, 
        defer_times, debt_return_date, debt_status, remark_info from db_pdsecu.tb_pdsecr_asac_debtdetail where row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        pass_no, exch_no, stock_acco_no, stock_code_no, 
        stock_code, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_intrst_rate, begin_debt_amt, 
        begin_debt_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, interest_update_date, debt_end_date, orign_debt_end_date, 
        defer_times, debt_return_date, debt_status, remark_info from db_pdsecu.tb_pdsecr_asac_debtdetail where row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_查询风控交易组负债明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_QueryRiskExgpDebtDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_QueryRiskExgpDebtDetail(
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
    

    /* [获取表记录][产品证券_融资融券_交易组负债明细表][字段][ {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        exch_group_no, pass_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        debt_type, strike_qty, strike_amt, strike_fee, 
        order_no, report_no, order_date, order_time, 
        order_dir, order_price, order_qty, debt_intrst_rate, 
        begin_debt_amt, begin_debt_qty, debt_amt, debt_qty, 
        debt_fee, debt_interest, intrst_base_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt, interest_update_date, debt_end_date, 
        orign_debt_end_date, defer_times, debt_return_date, debt_status, 
        remark_info from db_pdsecu.tb_pdsecr_exgp_debtdetail where  row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        exch_group_no, pass_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        debt_type, strike_qty, strike_amt, strike_fee, 
        order_no, report_no, order_date, order_time, 
        order_dir, order_price, order_qty, debt_intrst_rate, 
        begin_debt_amt, begin_debt_qty, debt_amt, debt_qty, 
        debt_fee, debt_interest, intrst_base_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt, interest_update_date, debt_end_date, 
        orign_debt_end_date, defer_times, debt_return_date, debt_status, 
        remark_info from db_pdsecu.tb_pdsecr_exgp_debtdetail where  row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_红冲蓝补交易组持仓负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_UpdateExgpPosiDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_UpdateExgpPosiDebt(
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
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_asset_type int,
    IN p_stock_type int,
    IN p_invest_type int,
    IN p_debt_type int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_amt decimal(18,4),
    IN p_debt_fee decimal(18,4),
    IN p_debt_interest decimal(18,4),
    IN p_oper_remark_info varchar(255),
    IN p_order_dir int,
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_invest_type int;
    declare v_debt_type int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_debt_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_order_dir int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_no int;
    declare v_begin_debt_qty decimal(18,2);
    declare v_curr_debt_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_begin_debt_amt decimal(18,4);
    declare v_curr_debt_amt decimal(18,4);
    declare v_debt_interest_amt decimal(18,4);
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_begin_amt decimal(18,4);
    declare v_pass_no int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_debt_intrst_rate decimal(18,12);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_intrst_base_amt decimal(18,4);
    declare v_interest_update_date int;
    declare v_debt_end_date int;
    declare v_orign_debt_end_date int;
    declare v_defer_times int;
    declare v_debt_return_date int;
    declare v_debt_status int;
    declare v_remark_info varchar(255);
    declare v_loan_sell_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_curr_qty decimal(18,2);
    declare v_curr_amt decimal(18,4);
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_end_qty decimal(18,2);
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_strike_price decimal(16,9);
    declare v_record_valid_flag int;
    declare v_return_capit_jour_nor int;
    declare v_curr_row_id bigint;
    declare v_busi_flag int;
    declare v_begin_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
    declare v_exgp_invest_type int;
    declare v_exch_group_asset_type int;
    declare v_exch_group_begin_qty decimal(18,2);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_exgp_pre_settle_qty decimal(18,2);
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_posi_qty_check_diff decimal(18,2);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_exch_group_update_times int;
    declare v_exgp_cash_id bigint;
    declare v_exgp_begin_amt decimal(18,4);
    declare v_exgp_curr_amt decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exgp_pre_settle_amt decimal(18,4);
    declare v_exgp_shsz_avail_change_amt decimal(18,4);
    declare v_exgp_amt_check_diff decimal(18,4);
    declare v_exgp_hk_avail_change_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_tmp_debt_interest decimal(18,4);
    declare v_tmp_debt_fee decimal(18,4);
    declare v_remain_strike_amt decimal(18,4);
    declare v_remain_strike_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_detail_posi_id bigint;
    declare v_occur_intrst_amt decimal(18,4);

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
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_asset_type = p_asset_type;
    SET v_stock_type = p_stock_type;
    SET v_invest_type = p_invest_type;
    SET v_debt_type = p_debt_type;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_amt = p_occur_amt;
    SET v_debt_fee = p_debt_fee;
    SET v_debt_interest = p_debt_interest;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_order_dir = p_order_dir;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_no = 0;
    SET v_begin_debt_qty = 0;
    SET v_curr_debt_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_begin_debt_amt = 0;
    SET v_curr_debt_amt = 0;
    SET v_debt_interest_amt = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_crncy_type = "CNY";
    SET v_begin_amt = 0;
    SET v_pass_no = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_fee = 0;
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_debt_intrst_rate = 0;
    SET v_debt_amt = 0;
    SET v_debt_qty = 0;
    SET v_intrst_base_amt = 0;
    SET v_interest_update_date = 0;
    SET v_debt_end_date = 0;
    SET v_orign_debt_end_date = 0;
    SET v_defer_times = 0;
    SET v_debt_return_date = 0;
    SET v_debt_status = 0;
    SET v_remark_info = " ";
    SET v_loan_sell_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_curr_qty = 0;
    SET v_curr_amt = 0;
    SET v_jour_after_occur_info = " ";
    SET v_occur_end_qty = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_strike_price = 0;
    SET v_record_valid_flag = 0;
    SET v_return_capit_jour_nor = 0;
    SET v_curr_row_id = 0;
    SET v_busi_flag = 0;
    SET v_begin_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;
    SET v_intrst_rate = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
    SET v_exgp_invest_type = 0;
    SET v_exch_group_asset_type = 0;
    SET v_exch_group_begin_qty = 0;
    SET v_exgp_curr_qty = 0;
    SET v_exgp_pre_settle_qty = 0;
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_posi_qty_check_diff = 0;
    SET v_exgp_cost_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_exch_group_update_times = 0;
    SET v_exgp_cash_id = 0;
    SET v_exgp_begin_amt = 0;
    SET v_exgp_curr_amt = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exgp_pre_settle_amt = 0;
    SET v_exgp_shsz_avail_change_amt = 0;
    SET v_exgp_amt_check_diff = 0;
    SET v_exgp_hk_avail_change_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
    SET v_exch_group_intrst_rate = 0;
    SET v_exch_group_intrst_base_amt = 0;
    SET v_exch_group_pre_entry_intrst_amt = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_tmp_debt_interest = 0;
    SET v_tmp_debt_fee = 0;
    SET v_remain_strike_amt = 0;
    SET v_remain_strike_qty = 0;
    SET v_row_id = 0;
    SET v_detail_posi_id = 0;
    SET v_occur_intrst_amt = 0;

    
    label_pro:BEGIN
    

    /* set @订单编号# = 0; */
    set v_order_no = 0;

    /* set @期初负债数量# = 0; */
    set v_begin_debt_qty = 0;

    /* set @当前负债数量# = 0; */
    set v_curr_debt_qty = 0;

    /* set @持仓核对差额# = 0; */
    set v_posi_qty_check_diff = 0;

    /* set @期初负债金额# = 0; */
    set v_begin_debt_amt = 0;

    /* set @当前负债金额#=0; */
    set v_curr_debt_amt=0;

    /* set @负债利息金额# = 0; */
    set v_debt_interest_amt = 0;

    /* set @已归还金额# = 0; */
    set v_debt_return_amt = 0;

    /* set @已归还数量# = 0; */
    set v_debt_return_qty = 0;

    /* set @归还利息金额# = 0; */
    set v_return_interest_amt = 0;

    /* set @本币币种# = "CNY"; */
    set v_crncy_type = "CNY";

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @通道编号# = 0; */
    set v_pass_no = 0;

    /* set @成交数量# = 0; */
    set v_strike_qty = 0;

    /* set @成交金额# = 0; */
    set v_strike_amt = 0;

    /* set @成交费用# = 0; */
    set v_strike_fee = 0;

    /* set @申报编号# = 0; */
    set v_report_no = 0;

    /* set @订单日期# = 0; */
    set v_order_date = 0;

    /* set @订单时间# = 0; */
    set v_order_time = 0;

    /* set @订单价格# = 0; */
    set v_order_price = 0;

    /* set @订单数量# = 0; */
    set v_order_qty = 0;

    /* set @负债年利率# = 0; */
    set v_debt_intrst_rate = 0;

    /* set @期初负债金额# = 0; */
    set v_begin_debt_amt = 0;

    /* set @期初负债数量# = 0; */
    set v_begin_debt_qty = 0;

    /* set @负债金额# = 0; */
    set v_debt_amt = 0;

    /* set @负债数量# = 0; */
    set v_debt_qty = 0;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @已归还金额# = 0; */
    set v_debt_return_amt = 0;

    /* set @已归还数量# = 0; */
    set v_debt_return_qty = 0;

    /* set @归还利息金额# = 0; */
    set v_return_interest_amt = 0;

    /* set @利息积数更改日期# = @初始化日期#; */
    set v_interest_update_date = v_init_date;

    /* set @负债截止日期# = 0; */
    set v_debt_end_date = 0;

    /* set @原负债截止日期# = 0; */
    set v_orign_debt_end_date = 0;

    /* set @展期次数# = 0; */
    set v_defer_times = 0;

    /* set @负债归还日期# = 0; */
    set v_debt_return_date = 0;

    /* set @负债状态# = 0; */
    set v_debt_status = 0;

    /* set @备注信息# = 0; */
    set v_remark_info = 0;

    /* set @当前负债数量# = @变动数量#; */
    set v_curr_debt_qty = v_occur_qty;

    /* set @当前负债金额# = @变动金额#; */
    set v_curr_debt_amt = v_occur_amt;

    /* set @融券卖出金额# = @变动金额#; */
    set v_loan_sell_amt = v_occur_amt;

    /* set @负债数量# = @变动数量#; */
    set v_debt_qty = v_occur_qty;

    /* set @负债金额# = @变动金额#; */
    set v_debt_amt = v_occur_amt;

    /* set @负债利息金额# = @负债利息#; */
    set v_debt_interest_amt = v_debt_interest;

    /* [获取流水变动][{当前数量},{当前金额}][@变动数量#,@变动金额#] */
    set v_jour_occur_field = concat("当前数量","|","当前金额","|");
    set v_jour_occur_info = concat(v_occur_qty,"|",v_occur_amt,"|");

    #1-持仓负债表

    /* [插入重复更新][产品证券_融资融券_交易组持仓负债表][字段][字段变量][{当前负债数量} = {当前负债数量} + @变动数量#,{当前负债金额} = {当前负债金额} + @变动金额#,{负债利息金额} = {负债利息金额} + @负债利息#][1][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsecr_exgp_posidebt (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        invest_type, debt_type, begin_debt_qty, curr_debt_qty, 
        posi_qty_check_diff, begin_debt_amt, curr_debt_amt, debt_interest_amt, 
        debt_return_amt, debt_return_qty, return_interest_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_stock_type, v_asset_type, 
        v_invest_type, v_debt_type, v_begin_debt_qty, v_curr_debt_qty, 
        v_posi_qty_check_diff, v_begin_debt_amt, v_curr_debt_amt, v_debt_interest_amt, 
        v_debt_return_amt, v_debt_return_qty, v_return_interest_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_debt_qty = curr_debt_qty + v_occur_qty,curr_debt_amt = curr_debt_amt + v_occur_amt,debt_interest_amt = debt_interest_amt + v_debt_interest;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.107.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_融资融券_交易组持仓负债表][{当前负债数量},{当前负债金额}][@当前数量#,@当前金额#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型# and {负债类型} = @负债类型#][4][@交易组编号#,@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select curr_debt_qty,curr_debt_amt into v_curr_qty,v_curr_amt from db_pdsecu.tb_pdsecr_exgp_posidebt where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type and debt_type = v_debt_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.21.107.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前数量#,@当前金额#] */
    set v_jour_after_occur_info = concat(v_curr_qty,"|",v_curr_amt,"|");

    #2-融券，记资金负债表

    /* if @负债类型# = 《负债类型-融券》 then */
    if v_debt_type = 2 then

        /* set @融券卖出金额# = @变动金额# - @负债费用#; */
        set v_loan_sell_amt = v_occur_amt - v_debt_fee;

        /* [插入重复更新][产品证券_融资融券_交易组资金负债表][字段][字段变量][{融券卖出金额} = {融券卖出金额} + @变动金额#-@负债费用#][1][@交易组编号#, @资产账户编号#, @本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsecr_exgp_capitdebt (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            asset_acco_no, exch_group_no, crncy_type, begin_amt, 
            loan_sell_amt, debt_interest_amt) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
            v_loan_sell_amt, v_debt_interest_amt) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, loan_sell_amt = loan_sell_amt + v_occur_amt-v_debt_fee;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.21.107.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 本币币种=", v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 本币币种=", v_crncy_type);
            end if;
            leave label_pro;
        end if;

    end if;
    #4-更新流水表

    /* set @变动后数量# = @当前数量#; */
    set v_occur_end_qty = v_curr_qty;

    /* set @变动后金额# = @当前金额#; */
    set v_occur_end_amt = v_curr_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @成交价格# = 0; */
    set v_strike_price = 0;

    /* set @记录有效标志# = 《记录有效标志-有效》; */
    set v_record_valid_flag = 1;

    /* set @还款资金流水号# = 0; */
    set v_return_capit_jour_nor = 0;

    /* set @当前记录序号# = 0; */
    set v_curr_row_id = 0;

    /* if @变动数量# > 0 or @变动金额# > 0 then */
    if v_occur_qty > 0 or v_occur_amt > 0 then

        /* set @业务标志# = 《业务标志-负债持仓蓝补》; */
        set v_busi_flag = 1103006;
    else

        /* set @业务标志# = 《业务标志-负债持仓红冲》; */
        set v_busi_flag = 1103005;
    end if;

    /* [插入表记录][产品证券_融资融券_负债变动流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsecr_debt_occur_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_code, stock_type, 
        asset_type, debt_type, busi_flag, occur_qty, 
        occur_amt, occur_end_qty, occur_end_amt, strike_price, 
        record_valid_flag, curr_row_id, return_capit_jour_nor, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_code, v_stock_type, 
        v_asset_type, v_debt_type, v_busi_flag, v_occur_qty, 
        v_occur_amt, v_occur_end_qty, v_occur_end_amt, v_strike_price, 
        v_record_valid_flag, v_curr_row_id, v_return_capit_jour_nor, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.107.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #5-更新普通持仓和资金表

    /* set @当前数量# = @变动数量#; */
    set v_curr_qty = v_occur_qty;

    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* set @待交收数量# = 0; */
    set v_pre_settle_qty = 0;

    /* set @冻结数量# = 0; */
    set v_frozen_qty = 0;

    /* set @解冻数量# = 0; */
    set v_unfroz_qty = 0;

    /* set @成本金额# = 0; */
    set v_cost_amt = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利息成本金额# = 0; */
    set v_intrst_cost_amt = 0;

    /* set @利息收益# = 0; */
    set v_intrst_pandl = 0;

    /* set @持仓核对差额#=0; */
    set v_posi_qty_check_diff=0;

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;

    /* set @冻结金额# = 0; */
    set v_frozen_amt = 0;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @待交收金额# = 0; */
    set v_pre_settle_amt = 0;

    /* set @沪深可用调整金额# = 0; */
    set v_shsz_avail_change_amt = 0;

    /* set @港股通可用调整金额# = 0; */
    set v_hk_avail_change_amt = 0;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @T日当日港股买入金额#=0; */
    set v_T_hk_buy_total_amt=0;

    /* set @T日当日港股卖出金额#=0; */
    set v_T_hk_sell_total_amt=0;

    /* set @T1日当日港股买入金额#=0; */
    set v_T1_hk_buy_total_amt=0;

    /* set @T1日当日港股卖出金额#=0; */
    set v_T1_hk_sell_total_amt=0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @红冲蓝补金额# = @变动金额#; */
    set v_total_change_amt = v_occur_amt;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利率# = 0; */
    set v_intrst_rate = 0;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* if @负债类型# = 《负债类型-融资》 then */
    if v_debt_type = 1 then

        /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{当前数量} = {当前数量} + @变动数量#][1][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_exgp_posi (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
            stock_code_no, stock_type, asset_type, invest_type, 
            begin_qty, curr_qty, pre_settle_qty, frozen_qty, 
            unfroz_qty, posi_qty_check_diff, cost_amt, realize_pandl, 
            intrst_cost_amt, intrst_pandl) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
            v_stock_code_no, v_stock_type, v_asset_type, v_invest_type, 
            v_begin_qty, v_curr_qty, v_pre_settle_qty, v_frozen_qty, 
            v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, 
            v_intrst_cost_amt, v_intrst_pandl) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty + v_occur_qty;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.21.107.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量},{记录序号},{证券类型},{投资类型},{资产类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数}][@当前数量#,@交易组持仓序号#,@交易组证券类型#,@交易组投资类型#,@交易组资产类型#,@交易组期初数量#,@交易组当前数量#,@交易组待交收数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组持仓核对差额#,@交易组成本金额#,@交易组实现盈亏#,@交易组利息成本金额#,@交易组利息收益#,@交易组更新次数#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
        select curr_qty,row_id,stock_type,invest_type,asset_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times into v_curr_qty,v_exgp_posi_id,v_exch_group_stock_type,v_exgp_invest_type,v_exch_group_asset_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_pre_settle_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_posi_qty_check_diff,v_exgp_cost_amt,v_exgp_realize_pandl,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_exch_group_update_times from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.21.107.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
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

        /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_exgp_posi_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, exch_no, 
            stock_acco_no, stock_code_no, busi_flag, occur_qty, 
            occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
            invest_type) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
            v_stock_acco_no, v_stock_code_no, v_busi_flag, v_occur_qty, 
            v_occur_end_qty, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, 
            v_invest_type);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.21.107.5";
            SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;


    /* elseif @负债类型# = 《负债类型-融券》 then */
    elseif v_debt_type = 2 then

        /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#-@负债费用#,{红冲蓝补金额}={红冲蓝补金额}+@红冲蓝补金额#][1][@资产账户编号#,@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdseca_exgp_capit (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            asset_acco_no, exch_group_no, crncy_type, begin_amt, 
            curr_amt, frozen_amt, unfroz_amt, pre_settle_amt, 
            shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, 
            T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, 
            total_payab_amt, total_change_amt, realize_pandl, intrst_rate, 
            intrst_base_amt, pre_entry_intrst_amt) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
            v_curr_amt, v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, 
            v_shsz_avail_change_amt, v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, 
            v_T_hk_sell_total_amt, v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, 
            v_total_payab_amt, v_total_change_amt, v_realize_pandl, v_intrst_rate, 
            v_intrst_base_amt, v_pre_entry_intrst_amt) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt-v_debt_fee,total_change_amt=total_change_amt+v_total_change_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.21.107.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][产品证券_资金_交易组资金表][{当前金额},{红冲蓝补金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@当前金额#,@红冲蓝补金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组金额核对差额#,@交易组港股通可用调整金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
        select curr_amt,total_change_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_curr_amt,v_total_change_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_amt_check_diff,v_exgp_hk_avail_change_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.21.107.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


        /* [获取流水后信息][@当前金额#,@红冲蓝补金额#] */
        set v_jour_after_occur_info = concat(v_curr_amt,"|",v_total_change_amt,"|");


        /* if @变动金额# > 0 then */
        if v_occur_amt > 0 then

            /* set @业务标志# = 《业务标志-资金蓝补》; */
            set v_busi_flag = 1003002;
        else

            /* set @业务标志# = 《业务标志-资金红冲》; */
            set v_busi_flag = 1003001;
        end if;

        /* set @变动后金额# = @当前金额#; */
        set v_occur_end_amt = v_curr_amt;

        /* set @操作菜单# = @菜单编号#; */
        set v_oper_menu_no = v_menu_no;

        /* set @操作功能# = @功能编码#; */
        set v_oper_func_code = v_func_code;

        /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@资产账户编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
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
                    
            SET v_error_code = "pdsecuA.21.107.5";
            SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;

    /* set @临时_负债利息# = @负债利息#; */
    set v_tmp_debt_interest = v_debt_interest;

    /* set @临时_负债费用# = @负债费用#; */
    set v_tmp_debt_fee = v_debt_fee;

    /* set @剩余成交金额# = -@变动金额# - @临时_负债利息#; */
    set v_remain_strike_amt = -v_occur_amt - v_tmp_debt_interest;

    /* set @剩余成交数量# = -@变动数量#; */
    set v_remain_strike_qty = -v_occur_qty;

    /* set @记录序号# = 0; */
    set v_row_id = 0;
    #3-交易组负债明细表

    /* if @剩余成交金额# > 0  or @剩余成交数量# > 0 then */
    if v_remain_strike_amt > 0  or v_remain_strike_qty > 0 then
        #遍历去反冲负债
        loop_label:loop

            /* 调用【原子_产品证券_融资融券_锁定获取交易组负债明细】*/
            call db_pdsecu.pra_tdseac_LockGetExgpDebtDetail(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_stock_code_no,
                v_debt_type,
                v_row_id,
                v_error_code,
                v_error_info,
                v_detail_posi_id,
                v_init_date,
                v_pass_no,
                v_exch_no,
                v_stock_type,
                v_asset_type,
                v_strike_qty,
                v_strike_amt,
                v_strike_fee,
                v_order_no,
                v_report_no,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_order_price,
                v_order_qty,
                v_debt_amt,
                v_debt_qty,
                v_debt_fee,
                v_debt_interest,
                v_intrst_base_amt,
                v_debt_return_amt,
                v_debt_return_qty,
                v_return_interest_amt,
                v_debt_status,
                v_remark_info,
                v_update_times,
                v_stock_code,
                v_stock_acco_no);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuA.21.107.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券_锁定获取交易组负债明细出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* if @错误编码#="0" then */
            if v_error_code="0" then

                /* set @记录序号# = @明细持仓序号#; */
                set v_row_id = v_detail_posi_id;

                /* if @负债类型# = 《负债类型-融资》 then */
                if v_debt_type = 1 then
                    #只够还利息

                    /* if @负债利息# >= (@归还利息金额#+@剩余成交金额#) then */
                    if v_debt_interest >= (v_return_interest_amt+v_remain_strike_amt) then

                        /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债利息} = {负债利息}-@剩余成交金额#][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_interest = debt_interest-v_remain_strike_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.107.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;

                    /* elseif (@负债金额#+@负债利息#) > (@已归还金额#+@归还利息金额#+@剩余成交金额#) then */
                    elseif (v_debt_amt+v_debt_interest) > (v_debt_return_amt+v_return_interest_amt+v_remain_strike_amt) then

                        /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债利息} = {归还利息金额}][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_interest = return_interest_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.107.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交金额# = @剩余成交金额# - (@负债利息#-@归还利息金额#); */
                        set v_remain_strike_amt = v_remain_strike_amt - (v_debt_interest-v_return_interest_amt);

                        /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债金额} = {负债金额} -@剩余成交金额#][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_amt = debt_amt -v_remain_strike_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.107.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;

                    /* elseif (@负债金额#+@负债利息#) = (@已归还金额#+@归还利息金额#+@剩余成交金额#) then */
                    elseif (v_debt_amt+v_debt_interest) = (v_debt_return_amt+v_return_interest_amt+v_remain_strike_amt) then

                        /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债利息} = {归还利息金额}][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_interest = return_interest_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.107.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交金额# = @剩余成交金额# - (@负债利息#-@归还利息金额#); */
                        set v_remain_strike_amt = v_remain_strike_amt - (v_debt_interest-v_return_interest_amt);

                        /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债金额} = {负债金额} -@剩余成交金额#,{负债状态} = 《负债状态-已归还》][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_amt = debt_amt -v_remain_strike_amt,debt_status = 2 where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.107.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;
                   else

                        /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债金额} = {已归还金额},{负债利息} ={归还利息金额},{负债状态} = 《负债状态-已归还》][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_amt = debt_return_amt,debt_interest =return_interest_amt,debt_status = 2 where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.107.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交金额# = @剩余成交金额# - (@负债利息#-@归还利息金额#) - (@负债金额# - @已归还金额#); */
                        set v_remain_strike_amt = v_remain_strike_amt - (v_debt_interest-v_return_interest_amt) - (v_debt_amt - v_debt_return_amt);
                    end if;

                /* elseif @负债类型# = 《负债类型-融券》 then */
                elseif v_debt_type = 2 then

                    /* if @负债数量# > (@已归还数量# + @剩余成交数量#) then */
                    if v_debt_qty > (v_debt_return_qty + v_remain_strike_qty) then

                        /* set @变动利息金额# = round((@负债利息#-@归还利息金额#)*@剩余成交数量#/(@负债数量#-@已归还数量#),4); */
                        set v_occur_intrst_amt = round((v_debt_interest-v_return_interest_amt)*v_remain_strike_qty/(v_debt_qty-v_debt_return_qty),4);

                        /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债数量} = {负债数量}-@剩余成交数量#,{已归还金额} =round({已归还数量}/{负债数量}*{负债金额},4),{归还利息金额}={归还利息金额}+@变动利息金额#][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty = debt_qty-v_remain_strike_qty,debt_return_amt =round(debt_return_qty/debt_qty*debt_amt,4),return_interest_amt=return_interest_amt+v_occur_intrst_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.107.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;

                   /* elseif @负债数量# = (@已归还数量# +@剩余成交数量#) then */
                   elseif v_debt_qty = (v_debt_return_qty +v_remain_strike_qty) then

                        /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债数量} = {已归还数量},{已归还金额} ={负债金额},{归还利息金额}={负债利息},{负债状态} = 《负债状态-已归还》][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty = debt_return_qty,debt_return_amt =debt_amt,return_interest_amt=debt_interest,debt_status = 2 where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.107.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;
                   else

                        /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债数量} = {已归还数量},{已归还金额} ={负债金额},{归还利息金额}={负债利息},{负债状态} = 《负债状态-已归还》 ][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty = debt_return_qty,debt_return_amt =debt_amt,return_interest_amt=debt_interest,debt_status = 2  where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.107.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交数量# = @剩余成交数量#-(@负债数量#-@已归还数量#); */
                        set v_remain_strike_qty = v_remain_strike_qty-(v_debt_qty-v_debt_return_qty);
                   end if;
                end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";

                /* set @错误信息#=' '; */
                set v_error_info=' ';
                leave loop_label;
            end if;
        end loop;
    else

        /* set @负债状态# = 《负债状态-未归还》; */
        set v_debt_status = 1;

        /* [插入表记录][产品证券_融资融券_交易组负债明细表][字段][字段变量][1][@初始化日期#, @订单编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsecr_exgp_debtdetail(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, opor_no, 
            co_no, pd_no, asset_acco_no, exch_group_no, 
            pass_no, exch_no, stock_acco_no, stock_code_no, 
            stock_code, stock_type, asset_type, debt_type, 
            strike_qty, strike_amt, strike_fee, order_no, 
            report_no, order_date, order_time, order_dir, 
            order_price, order_qty, debt_intrst_rate, begin_debt_amt, 
            begin_debt_qty, debt_amt, debt_qty, debt_fee, 
            debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
            return_interest_amt, interest_update_date, debt_end_date, orign_debt_end_date, 
            defer_times, debt_return_date, debt_status, remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_opor_no, 
            v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
            v_pass_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
            v_stock_code, v_stock_type, v_asset_type, v_debt_type, 
            v_strike_qty, v_strike_amt, v_strike_fee, v_order_no, 
            v_report_no, v_order_date, v_order_time, v_order_dir, 
            v_order_price, v_order_qty, v_debt_intrst_rate, v_begin_debt_amt, 
            v_begin_debt_qty, v_debt_amt, v_debt_qty, v_debt_fee, 
            v_debt_interest, v_intrst_base_amt, v_debt_return_amt, v_debt_return_qty, 
            v_return_interest_amt, v_interest_update_date, v_debt_end_date, v_orign_debt_end_date, 
            v_defer_times, v_debt_return_date, v_debt_status, v_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.21.107.1";
            SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,","," 订单编号=", v_order_no),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_红冲蓝补资产账户持仓负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrdt_UpdateAsacPosiDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrdt_UpdateAsacPosiDebt(
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
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_invest_type int,
    IN p_debt_type int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_amt decimal(18,4),
    IN p_debt_fee decimal(18,4),
    IN p_debt_interest decimal(18,4),
    IN p_oper_remark_info varchar(255),
    IN p_order_dir int,
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_debt_type int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_debt_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_order_dir int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_no int;
    declare v_begin_debt_qty decimal(18,2);
    declare v_curr_debt_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_begin_debt_amt decimal(18,4);
    declare v_curr_debt_amt decimal(18,4);
    declare v_debt_interest_amt decimal(18,4);
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_begin_amt decimal(18,4);
    declare v_pass_no int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_debt_intrst_rate decimal(18,12);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_intrst_base_amt decimal(18,4);
    declare v_interest_update_date int;
    declare v_debt_end_date int;
    declare v_orign_debt_end_date int;
    declare v_defer_times int;
    declare v_debt_return_date int;
    declare v_debt_status int;
    declare v_remark_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_loan_sell_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_curr_qty decimal(18,2);
    declare v_curr_amt decimal(18,4);
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_end_qty decimal(18,2);
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_strike_price decimal(16,9);
    declare v_record_valid_flag int;
    declare v_return_capit_jour_nor int;
    declare v_curr_row_id bigint;
    declare v_busi_flag int;
    declare v_begin_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_asac_posi_id bigint;
    declare v_asac_stock_type int;
    declare v_asac_asset_type int;
    declare v_asac_invest_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_posi_qty_check_diff decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_asac_update_times int;
    declare v_asac_pre_settle_qty decimal(18,2);
    declare v_asac_cash_id bigint;
    declare v_asac_begin_amt decimal(18,4);
    declare v_asac_curr_amt decimal(18,4);
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_pre_settle_amt decimal(18,4);
    declare v_asac_shsz_avail_change_amt decimal(18,4);
    declare v_asac_amt_check_diff decimal(18,4);
    declare v_asac_hk_avail_change_amt decimal(18,4);
    declare v_asac_total_rece_amt decimal(18,4);
    declare v_asac_total_payab_amt decimal(18,4);
    declare v_asac_intrst_rate decimal(18,4);
    declare v_asac_intrst_base_amt decimal(18,4);
    declare v_asac_pre_entry_intrst_amt decimal(18,4);
    declare v_asac_T_hk_buy_total_amt decimal(18,4);
    declare v_asac_T_hk_sell_total_amt decimal(18,4);
    declare v_asac_T1_hk_buy_total_amt decimal(18,4);
    declare v_asac_T1_hk_sell_total_amt decimal(18,4);
    declare v_tmp_debt_interest decimal(18,4);
    declare v_tmp_debt_fee decimal(18,4);
    declare v_remain_strike_amt decimal(18,4);
    declare v_remain_strike_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_detail_posi_id bigint;
    declare v_occur_intrst_amt decimal(18,4);

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
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_invest_type = p_invest_type;
    SET v_debt_type = p_debt_type;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_amt = p_occur_amt;
    SET v_debt_fee = p_debt_fee;
    SET v_debt_interest = p_debt_interest;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_order_dir = p_order_dir;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_no = 0;
    SET v_begin_debt_qty = 0;
    SET v_curr_debt_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_begin_debt_amt = 0;
    SET v_curr_debt_amt = 0;
    SET v_debt_interest_amt = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_crncy_type = "CNY";
    SET v_begin_amt = 0;
    SET v_pass_no = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_fee = 0;
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_debt_intrst_rate = 0;
    SET v_debt_amt = 0;
    SET v_debt_qty = 0;
    SET v_intrst_base_amt = 0;
    SET v_interest_update_date = 0;
    SET v_debt_end_date = 0;
    SET v_orign_debt_end_date = 0;
    SET v_defer_times = 0;
    SET v_debt_return_date = 0;
    SET v_debt_status = 0;
    SET v_remark_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_loan_sell_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_curr_qty = 0;
    SET v_curr_amt = 0;
    SET v_jour_after_occur_info = " ";
    SET v_occur_end_qty = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_strike_price = 0;
    SET v_record_valid_flag = 0;
    SET v_return_capit_jour_nor = 0;
    SET v_curr_row_id = 0;
    SET v_busi_flag = 0;
    SET v_begin_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;
    SET v_intrst_rate = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_asac_posi_id = 0;
    SET v_asac_stock_type = 0;
    SET v_asac_asset_type = 0;
    SET v_asac_invest_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_posi_qty_check_diff = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_asac_update_times = 0;
    SET v_asac_pre_settle_qty = 0;
    SET v_asac_cash_id = 0;
    SET v_asac_begin_amt = 0;
    SET v_asac_curr_amt = 0;
    SET v_asac_frozen_amt = 0;
    SET v_asac_unfroz_amt = 0;
    SET v_asac_pre_settle_amt = 0;
    SET v_asac_shsz_avail_change_amt = 0;
    SET v_asac_amt_check_diff = 0;
    SET v_asac_hk_avail_change_amt = 0;
    SET v_asac_total_rece_amt = 0;
    SET v_asac_total_payab_amt = 0;
    SET v_asac_intrst_rate = 0;
    SET v_asac_intrst_base_amt = 0;
    SET v_asac_pre_entry_intrst_amt = 0;
    SET v_asac_T_hk_buy_total_amt = 0;
    SET v_asac_T_hk_sell_total_amt = 0;
    SET v_asac_T1_hk_buy_total_amt = 0;
    SET v_asac_T1_hk_sell_total_amt = 0;
    SET v_tmp_debt_interest = 0;
    SET v_tmp_debt_fee = 0;
    SET v_remain_strike_amt = 0;
    SET v_remain_strike_qty = 0;
    SET v_row_id = 0;
    SET v_detail_posi_id = 0;
    SET v_occur_intrst_amt = 0;

    
    label_pro:BEGIN
    

    /* set @订单编号# = 0; */
    set v_order_no = 0;

    /* set @期初负债数量# = 0; */
    set v_begin_debt_qty = 0;

    /* set @当前负债数量# = 0; */
    set v_curr_debt_qty = 0;

    /* set @持仓核对差额# = 0; */
    set v_posi_qty_check_diff = 0;

    /* set @期初负债金额# = 0; */
    set v_begin_debt_amt = 0;

    /* set @当前负债金额#=0; */
    set v_curr_debt_amt=0;

    /* set @负债利息金额# = 0; */
    set v_debt_interest_amt = 0;

    /* set @已归还金额# = 0; */
    set v_debt_return_amt = 0;

    /* set @已归还数量# = 0; */
    set v_debt_return_qty = 0;

    /* set @归还利息金额# = 0; */
    set v_return_interest_amt = 0;

    /* set @本币币种# = "CNY"; */
    set v_crncy_type = "CNY";

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @通道编号# = 0; */
    set v_pass_no = 0;

    /* set @成交数量# = 0; */
    set v_strike_qty = 0;

    /* set @成交金额# = 0; */
    set v_strike_amt = 0;

    /* set @成交费用# = 0; */
    set v_strike_fee = 0;

    /* set @申报编号# = 0; */
    set v_report_no = 0;

    /* set @订单日期# = 0; */
    set v_order_date = 0;

    /* set @订单时间# = 0; */
    set v_order_time = 0;

    /* set @订单价格# = 0; */
    set v_order_price = 0;

    /* set @订单数量# = 0; */
    set v_order_qty = 0;

    /* set @负债年利率# = 0; */
    set v_debt_intrst_rate = 0;

    /* set @期初负债金额# = 0; */
    set v_begin_debt_amt = 0;

    /* set @期初负债数量# = 0; */
    set v_begin_debt_qty = 0;

    /* set @负债金额# = 0; */
    set v_debt_amt = 0;

    /* set @负债数量# = 0; */
    set v_debt_qty = 0;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @已归还金额# = 0; */
    set v_debt_return_amt = 0;

    /* set @已归还数量# = 0; */
    set v_debt_return_qty = 0;

    /* set @归还利息金额# = 0; */
    set v_return_interest_amt = 0;

    /* set @利息积数更改日期# = @初始化日期#; */
    set v_interest_update_date = v_init_date;

    /* set @负债截止日期# = 0; */
    set v_debt_end_date = 0;

    /* set @原负债截止日期# = 0; */
    set v_orign_debt_end_date = 0;

    /* set @展期次数# = 0; */
    set v_defer_times = 0;

    /* set @负债归还日期# = 0; */
    set v_debt_return_date = 0;

    /* set @负债状态# = 0; */
    set v_debt_status = 0;

    /* set @备注信息# = 0; */
    set v_remark_info = 0;

    /* [获取流水变动][{当前数量}][@变动数量#] */
    set v_jour_occur_field = concat("当前数量","|");
    set v_jour_occur_info = concat(v_occur_qty,"|");


    /* set @当前负债数量# = @变动数量#; */
    set v_curr_debt_qty = v_occur_qty;

    /* set @当前负债金额# = @变动金额#; */
    set v_curr_debt_amt = v_occur_amt;

    /* set @融券卖出金额# = @变动金额#; */
    set v_loan_sell_amt = v_occur_amt;

    /* set @负债数量# = @变动数量#; */
    set v_debt_qty = v_occur_qty;

    /* set @负债金额# = @变动金额#; */
    set v_debt_amt = v_occur_amt;

    /* set @负债利息金额# = @负债利息#; */
    set v_debt_interest_amt = v_debt_interest;

    /* [获取流水变动][{当前数量},{当前金额}][@变动数量#,@变动金额#] */
    set v_jour_occur_field = concat("当前数量","|","当前金额","|");
    set v_jour_occur_info = concat(v_occur_qty,"|",v_occur_amt,"|");

    #1-持仓负债表

    /* [插入重复更新][产品证券_融资融券_资产账户持仓负债表][字段][字段变量][{当前负债数量} = {当前负债数量} + @变动数量#,{当前负债金额} = {当前负债金额} + @变动金额#,{负债利息金额} = {负债利息金额} + @负债利息#][1][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#,@负债类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsecr_asac_posidebt (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        stock_code, stock_type, asset_type, invest_type, 
        debt_type, begin_debt_qty, curr_debt_qty, posi_qty_check_diff, 
        begin_debt_amt, curr_debt_amt, debt_interest_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
        v_stock_code, v_stock_type, v_asset_type, v_invest_type, 
        v_debt_type, v_begin_debt_qty, v_curr_debt_qty, v_posi_qty_check_diff, 
        v_begin_debt_amt, v_curr_debt_amt, v_debt_interest_amt, v_debt_return_amt, 
        v_debt_return_qty, v_return_interest_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_debt_qty = curr_debt_qty + v_occur_qty,curr_debt_amt = curr_debt_amt + v_occur_amt,debt_interest_amt = debt_interest_amt + v_debt_interest;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.108.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type,",","负债类型=",v_debt_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type,",","负债类型=",v_debt_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_融资融券_资产账户持仓负债表][{当前负债数量},{当前负债金额}][@当前数量#,@当前金额#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型# and {负债类型} = @负债类型#][4][@交易组编号#,@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select curr_debt_qty,curr_debt_amt into v_curr_qty,v_curr_amt from db_pdsecu.tb_pdsecr_asac_posidebt where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type and debt_type = v_debt_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.21.108.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前数量#,@当前金额#] */
    set v_jour_after_occur_info = concat(v_curr_qty,"|",v_curr_amt,"|");

    #2-融券，记资金负债表

    /* if @负债类型# = 《负债类型-融券》 then */
    if v_debt_type = 2 then

        /* set @融券卖出金额# = @变动金额# - @负债费用#; */
        set v_loan_sell_amt = v_occur_amt - v_debt_fee;

        /* [插入重复更新][产品证券_融资融券_资产账户资金负债表][字段][字段变量][{融券卖出金额} = {融券卖出金额} + @变动金额# - @负债费用#][1][@资产账户编号#, @本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsecr_asac_capitdebt (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            asset_acco_no, crncy_type, begin_amt, loan_sell_amt, 
            debt_interest_amt) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_asset_acco_no, v_crncy_type, v_begin_amt, v_loan_sell_amt, 
            v_debt_interest_amt) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, loan_sell_amt = loan_sell_amt + v_occur_amt - v_debt_fee;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.21.108.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 本币币种=", v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 本币币种=", v_crncy_type);
            end if;
            leave label_pro;
        end if;

    end if;
    #4-更新流水表

    /* set @变动后数量# = @当前数量#; */
    set v_occur_end_qty = v_curr_qty;

    /* set @变动后金额# = @当前金额#; */
    set v_occur_end_amt = v_curr_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @成交价格# = 0; */
    set v_strike_price = 0;

    /* set @记录有效标志# = 《记录有效标志-有效》; */
    set v_record_valid_flag = 1;

    /* set @还款资金流水号# = 0; */
    set v_return_capit_jour_nor = 0;

    /* set @当前记录序号# = 0; */
    set v_curr_row_id = 0;

    /* if @变动数量# > 0 or @变动金额# > 0 then */
    if v_occur_qty > 0 or v_occur_amt > 0 then

        /* set @业务标志# = 《业务标志-负债持仓蓝补》; */
        set v_busi_flag = 1103006;
    else

        /* set @业务标志# = 《业务标志-负债持仓红冲》; */
        set v_busi_flag = 1103005;
    end if;

    /* [插入表记录][产品证券_融资融券_资产账户负债变动流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsecr_asac_debt_occur_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        debt_type, busi_flag, occur_qty, occur_amt, 
        occur_end_qty, occur_end_amt, strike_price, record_valid_flag, 
        curr_row_id, return_capit_jour_nor, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_stock_type, v_asset_type, 
        v_debt_type, v_busi_flag, v_occur_qty, v_occur_amt, 
        v_occur_end_qty, v_occur_end_amt, v_strike_price, v_record_valid_flag, 
        v_curr_row_id, v_return_capit_jour_nor, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.21.108.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #5-更新普通持仓和资金表

    /* set @当前数量# = @变动数量#; */
    set v_curr_qty = v_occur_qty;

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;

    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* set @待交收数量# = 0; */
    set v_pre_settle_qty = 0;

    /* set @冻结数量# = 0; */
    set v_frozen_qty = 0;

    /* set @解冻数量# = 0; */
    set v_unfroz_qty = 0;

    /* set @持仓核对差额#=0; */
    set v_posi_qty_check_diff=0;

    /* set @成本金额# = 0; */
    set v_cost_amt = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利息成本金额# = 0; */
    set v_intrst_cost_amt = 0;

    /* set @利息收益# = 0; */
    set v_intrst_pandl = 0;

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @冻结金额# = 0; */
    set v_frozen_amt = 0;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @待交收金额# = 0; */
    set v_pre_settle_amt = 0;

    /* set @沪深可用调整金额# = 0; */
    set v_shsz_avail_change_amt = 0;

    /* set @港股通可用调整金额# = 0; */
    set v_hk_avail_change_amt = 0;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @T日当日港股买入金额#=0; */
    set v_T_hk_buy_total_amt=0;

    /* set @T日当日港股卖出金额#=0; */
    set v_T_hk_sell_total_amt=0;

    /* set @T1日当日港股买入金额#=0; */
    set v_T1_hk_buy_total_amt=0;

    /* set @T1日当日港股卖出金额#=0; */
    set v_T1_hk_sell_total_amt=0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @红冲蓝补金额# = @变动金额#; */
    set v_total_change_amt = v_occur_amt;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利率# = 0; */
    set v_intrst_rate = 0;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* if @负债类型# = 《负债类型-融资》 then */
    if v_debt_type = 1 then

        /* [插入重复更新][产品证券_持仓_资产账户持仓表][字段][字段变量][{当前数量} = {当前数量} + @变动数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][1][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_asac_posi (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
            stock_type, asset_type, invest_type, begin_qty, 
            curr_qty, pre_settle_qty, frozen_qty, unfroz_qty, 
            posi_qty_check_diff, cost_amt, realize_pandl, intrst_cost_amt, 
            intrst_pandl) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
            v_stock_type, v_asset_type, v_invest_type, v_begin_qty, 
            v_curr_qty, v_pre_settle_qty, v_frozen_qty, v_unfroz_qty, 
            v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, v_intrst_cost_amt, 
            v_intrst_pandl) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty + v_occur_qty;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.21.108.asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(1,"#",v_mysql_message);
            else
                SET v_error_info = 1;
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{当前数量},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@当前数量#,@资产账户持仓序号#,@资产账户证券类型#,@资产账户资产类型#,@资产账户投资类型#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户持仓核对差额#,@资产账户成本金额#,@资产账户实现盈亏#,@资产账户利息成本金额#,@资产账户利息收益#,@资产账户更新次数#,@资产账户待交收数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
        select curr_qty,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_curr_qty,v_asac_posi_id,v_asac_stock_type,v_asac_asset_type,v_asac_invest_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_posi_qty_check_diff,v_asac_cost_amt,v_asac_realize_pandl,v_asac_intrst_cost_amt,v_asac_intrst_pandl,v_asac_update_times,v_asac_pre_settle_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.21.108.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
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

        /* [插入表记录][产品证券_持仓_资产账户持仓流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_asac_posi_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, asset_acco_no, exch_no, stock_acco_no, 
            stock_code_no, busi_flag, occur_qty, occur_end_qty, 
            jour_occur_field, jour_after_occur_info, oper_remark_info, invest_type) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
            v_stock_code_no, v_busi_flag, v_occur_qty, v_occur_end_qty, 
            v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, v_invest_type);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.21.108.5";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;


    /* elseif @负债类型# = 《负债类型-融券》 then */
    elseif v_debt_type = 2 then

        /* [插入重复更新][产品证券_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额# - @负债费用#,{红冲蓝补金额}={红冲蓝补金额}+@红冲蓝补金额#][1][@资产账户编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdseca_asac_capit (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            asset_acco_no, crncy_type, begin_amt, curr_amt, 
            frozen_amt, unfroz_amt, pre_settle_amt, shsz_avail_change_amt, 
            hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, T_hk_sell_total_amt, 
            T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, total_payab_amt, 
            total_change_amt, realize_pandl, intrst_rate, intrst_base_amt, 
            pre_entry_intrst_amt) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_asset_acco_no, v_crncy_type, v_begin_amt, v_curr_amt, 
            v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, v_shsz_avail_change_amt, 
            v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, v_T_hk_sell_total_amt, 
            v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, v_total_payab_amt, 
            v_total_change_amt, v_realize_pandl, v_intrst_rate, v_intrst_base_amt, 
            v_pre_entry_intrst_amt) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt - v_debt_fee,total_change_amt=total_change_amt+v_total_change_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.21.108.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][产品证券_资金_资产账户资金表][{当前金额},{红冲蓝补金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@当前金额#,@红冲蓝补金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户金额核对差额#,@资产账户港股通可用调整金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
        select curr_amt,total_change_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_curr_amt,v_total_change_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_amt_check_diff,v_asac_hk_avail_change_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.21.108.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


        /* [获取流水后信息][@当前金额#,@红冲蓝补金额#] */
        set v_jour_after_occur_info = concat(v_curr_amt,"|",v_total_change_amt,"|");


        /* if @变动金额# > 0 then */
        if v_occur_amt > 0 then

            /* set @业务标志# = 《业务标志-资金蓝补》; */
            set v_busi_flag = 1003002;
        else

            /* set @业务标志# = 《业务标志-资金红冲》; */
            set v_busi_flag = 1003001;
        end if;

        /* set @变动后金额# = @当前金额#; */
        set v_occur_end_amt = v_curr_amt;

        /* set @操作菜单# = @菜单编号#; */
        set v_oper_menu_no = v_menu_no;

        /* set @操作功能# = @功能编码#; */
        set v_oper_func_code = v_func_code;

        /* [插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdseca_asac_capit_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, asset_acco_no, crncy_type, busi_flag, 
            occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
            oper_remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_crncy_type, v_busi_flag, 
            v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
            v_oper_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.21.108.5";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;

    /* set @临时_负债利息# = @负债利息#; */
    set v_tmp_debt_interest = v_debt_interest;

    /* set @临时_负债费用# = @负债费用#; */
    set v_tmp_debt_fee = v_debt_fee;

    /* set @剩余成交金额# = -@变动金额# - @临时_负债利息#; */
    set v_remain_strike_amt = -v_occur_amt - v_tmp_debt_interest;

    /* set @剩余成交数量# = -@变动数量#; */
    set v_remain_strike_qty = -v_occur_qty;

    /* set @记录序号# = 0; */
    set v_row_id = 0;
    #3-资产账户负债明细表

    /* if @剩余成交金额# > 0  or @剩余成交数量# > 0 then */
    if v_remain_strike_amt > 0  or v_remain_strike_qty > 0 then
        #遍历去反冲负债
        loop_label:loop

            /* 调用【原子_产品证券_融资融券_锁定获取资产账户负债明细】*/
            call db_pdsecu.pra_tdseac_LockGetAsacDebtDetail(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_pd_no,
                v_asset_acco_no,
                v_stock_code_no,
                v_debt_type,
                v_row_id,
                v_error_code,
                v_error_info,
                v_detail_posi_id,
                v_init_date,
                v_pass_no,
                v_exch_no,
                v_stock_type,
                v_asset_type,
                v_strike_qty,
                v_strike_amt,
                v_strike_fee,
                v_order_no,
                v_report_no,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_order_price,
                v_order_qty,
                v_debt_amt,
                v_debt_qty,
                v_debt_fee,
                v_debt_interest,
                v_intrst_base_amt,
                v_debt_return_amt,
                v_debt_return_qty,
                v_return_interest_amt,
                v_debt_status,
                v_remark_info,
                v_update_times,
                v_stock_code,
                v_stock_acco_no);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuA.21.108.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券_锁定获取资产账户负债明细出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* if @错误编码#="0" then */
            if v_error_code="0" then

                /* set @记录序号# = @明细持仓序号#; */
                set v_row_id = v_detail_posi_id;

                /* if @负债类型# = 《负债类型-融资》 then */
                if v_debt_type = 1 then
                    #只够还利息

                    /* if @负债利息# >= (@归还利息金额#+@剩余成交金额#) then */
                    if v_debt_interest >= (v_return_interest_amt+v_remain_strike_amt) then

                        /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债利息} = {负债利息}-@剩余成交金额#][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_interest = debt_interest-v_remain_strike_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.108.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;

                    /* elseif (@负债金额#+@负债利息#) > (@已归还金额#+@归还利息金额#+@剩余成交金额#) then */
                    elseif (v_debt_amt+v_debt_interest) > (v_debt_return_amt+v_return_interest_amt+v_remain_strike_amt) then

                        /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债利息} = {归还利息金额}][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_interest = return_interest_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.108.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交金额# = @剩余成交金额# - (@负债利息#-@归还利息金额#); */
                        set v_remain_strike_amt = v_remain_strike_amt - (v_debt_interest-v_return_interest_amt);

                        /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债金额} = {负债金额} -@剩余成交金额#][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_amt = debt_amt -v_remain_strike_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.108.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;

                    /* elseif (@负债金额#+@负债利息#) = (@已归还金额#+@归还利息金额#+@剩余成交金额#) then */
                    elseif (v_debt_amt+v_debt_interest) = (v_debt_return_amt+v_return_interest_amt+v_remain_strike_amt) then

                        /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债利息} = {归还利息金额}][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_interest = return_interest_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.108.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交金额# = @剩余成交金额# - (@负债利息#-@归还利息金额#); */
                        set v_remain_strike_amt = v_remain_strike_amt - (v_debt_interest-v_return_interest_amt);

                        /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债金额} = {负债金额} -@剩余成交金额#,{负债状态} = 《负债状态-已归还》][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_amt = debt_amt -v_remain_strike_amt,debt_status = 2 where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.108.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;
                   else

                        /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债金额} = {已归还金额},{负债利息} ={归还利息金额},{负债状态} = 《负债状态-已归还》][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_amt = debt_return_amt,debt_interest =return_interest_amt,debt_status = 2 where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.108.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交金额# = @剩余成交金额# - (@负债利息#-@归还利息金额#) - (@负债金额# - @已归还金额#); */
                        set v_remain_strike_amt = v_remain_strike_amt - (v_debt_interest-v_return_interest_amt) - (v_debt_amt - v_debt_return_amt);
                    end if;

                /* elseif @负债类型# = 《负债类型-融券》 then */
                elseif v_debt_type = 2 then

                    /* if @负债数量# > (@已归还数量# + @剩余成交数量#) then */
                    if v_debt_qty > (v_debt_return_qty + v_remain_strike_qty) then

                        /* set @变动利息金额# = round((@负债利息#-@归还利息金额#)*@剩余成交数量#/(@负债数量#-@已归还数量#),4); */
                        set v_occur_intrst_amt = round((v_debt_interest-v_return_interest_amt)*v_remain_strike_qty/(v_debt_qty-v_debt_return_qty),4);

                        /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债数量} = {负债数量}-@剩余成交数量#,{已归还金额} =round({已归还数量}/{负债数量}*{负债金额},4),{归还利息金额}={归还利息金额}+@变动利息金额#][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty = debt_qty-v_remain_strike_qty,debt_return_amt =round(debt_return_qty/debt_qty*debt_amt,4),return_interest_amt=return_interest_amt+v_occur_intrst_amt where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.108.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;

                   /* elseif @负债数量# = (@已归还数量# +@剩余成交数量#) then */
                   elseif v_debt_qty = (v_debt_return_qty +v_remain_strike_qty) then

                        /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债数量} = {已归还数量},{已归还金额} ={负债金额},{归还利息金额}={负债利息},{负债状态} = 《负债状态-已归还》][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty = debt_return_qty,debt_return_amt =debt_amt,return_interest_amt=debt_interest,debt_status = 2 where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.108.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;

                        leave loop_label;
                   else

                        /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债数量} = {已归还数量},{已归还金额} ={负债金额},{归还利息金额}={负债利息},{负债状态} = 《负债状态-已归还》 ][{记录序号} = @明细持仓序号#][1][@明细持仓序号#] */
                        set v_update_date = date_format(curdate(),'%Y%m%d');
                        set v_update_time = date_format(curtime(),'%H%i%s');
                        update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty = debt_return_qty,debt_return_amt =debt_amt,return_interest_amt=debt_interest,debt_status = 2  where row_id = v_detail_posi_id;
                        if v_error_code = "1" then
                                    
                            SET v_error_code = "pdsecuA.21.108.1";
                            if v_mysql_message <> "" then
                                SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                            else
                                SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                            end if;
                            leave label_pro;
                        end if;


                        /* set @剩余成交数量# = @剩余成交数量#-(@负债数量#-@已归还数量#); */
                        set v_remain_strike_qty = v_remain_strike_qty-(v_debt_qty-v_debt_return_qty);
                   end if;
                end if;
            else

                /* set @错误编码#="0"; */
                set v_error_code="0";

                /* set @错误信息#=' '; */
                set v_error_info=' ';
                leave loop_label;
            end if;
        end loop;
    else

        /* set @负债状态# = 《负债状态-未归还》; */
        set v_debt_status = 1;

        /* [插入表记录][产品证券_融资融券_资产账户负债明细表][字段][字段变量][1][@初始化日期#, @订单编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsecr_asac_debtdetail(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, opor_no, 
            co_no, pd_no, asset_acco_no, pass_no, 
            exch_no, stock_acco_no, stock_code_no, stock_code, 
            stock_type, asset_type, debt_type, strike_qty, 
            strike_amt, strike_fee, order_no, report_no, 
            order_date, order_time, order_dir, order_price, 
            order_qty, debt_intrst_rate, begin_debt_amt, begin_debt_qty, 
            debt_amt, debt_qty, debt_fee, debt_interest, 
            intrst_base_amt, debt_return_amt, debt_return_qty, return_interest_amt, 
            interest_update_date, debt_end_date, orign_debt_end_date, defer_times, 
            debt_return_date, debt_status, remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_opor_no, 
            v_co_no, v_pd_no, v_asset_acco_no, v_pass_no, 
            v_exch_no, v_stock_acco_no, v_stock_code_no, v_stock_code, 
            v_stock_type, v_asset_type, v_debt_type, v_strike_qty, 
            v_strike_amt, v_strike_fee, v_order_no, v_report_no, 
            v_order_date, v_order_time, v_order_dir, v_order_price, 
            v_order_qty, v_debt_intrst_rate, v_begin_debt_amt, v_begin_debt_qty, 
            v_debt_amt, v_debt_qty, v_debt_fee, v_debt_interest, 
            v_intrst_base_amt, v_debt_return_amt, v_debt_return_qty, v_return_interest_amt, 
            v_interest_update_date, v_debt_end_date, v_orign_debt_end_date, v_defer_times, 
            v_debt_return_date, v_debt_status, v_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.21.108.1";
            SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,","," 订单编号=", v_order_no),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_锁定获取交易组负债明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdseac_LockGetExgpDebtDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdseac_LockGetExgpDebtDetail(
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
    IN p_stock_code_no int,
    IN p_debt_type int,
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_detail_posi_id bigint,
    OUT p_init_date int,
    OUT p_pass_no int,
    OUT p_exch_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_fee decimal(18,4),
    OUT p_order_no int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_debt_amt decimal(18,4),
    OUT p_debt_qty decimal(18,2),
    OUT p_debt_fee decimal(18,4),
    OUT p_debt_interest decimal(18,4),
    OUT p_intrst_base_amt decimal(18,4),
    OUT p_debt_return_amt decimal(18,4),
    OUT p_debt_return_qty decimal(18,2),
    OUT p_return_interest_amt decimal(18,4),
    OUT p_debt_status int,
    OUT p_remark_info varchar(255),
    OUT p_update_times int,
    OUT p_stock_code varchar(6),
    OUT p_stock_acco_no int
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
    declare v_stock_code_no int;
    declare v_debt_type int;
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_detail_posi_id bigint;
    declare v_init_date int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_order_no int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_debt_status int;
    declare v_remark_info varchar(255);
    declare v_update_times int;
    declare v_stock_code varchar(6);
    declare v_stock_acco_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_debt_intrst_rate decimal(18,12);
    declare v_begin_debt_amt decimal(18,4);
    declare v_begin_debt_qty decimal(18,2);
    declare v_interest_update_date int;
    declare v_debt_end_date int;
    declare v_orign_debt_end_date int;
    declare v_defer_times int;
    declare v_debt_return_date int;

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
    SET v_stock_code_no = p_stock_code_no;
    SET v_debt_type = p_debt_type;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_detail_posi_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pass_no = 0;
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_fee = 0;
    SET v_order_no = 0;
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_debt_amt = 0;
    SET v_debt_qty = 0;
    SET v_debt_fee = 0;
    SET v_debt_interest = 0;
    SET v_intrst_base_amt = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_debt_status = 0;
    SET v_remark_info = " ";
    SET v_update_times = 1;
    SET v_stock_code = " ";
    SET v_stock_acco_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_debt_intrst_rate = 0;
    SET v_begin_debt_amt = 0;
    SET v_begin_debt_qty = 0;
    SET v_interest_update_date = 0;
    SET v_debt_end_date = 0;
    SET v_orign_debt_end_date = 0;
    SET v_defer_times = 0;
    SET v_debt_return_date = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品证券_融资融券_交易组负债明细表][字段][字段变量][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号#  and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and {负债类型}=@负债类型# and {负债状态}<>《负债状态-已归还》   order by {订单编号},{更新时间}][4][@交易组编号#,@资产账户编号#,@证券代码编号#,@负债类型#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        exch_group_no, pass_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        debt_type, strike_qty, strike_amt, strike_fee, 
        order_no, report_no, order_date, order_time, 
        order_dir, order_price, order_qty, debt_intrst_rate, 
        begin_debt_amt, begin_debt_qty, debt_amt, debt_qty, 
        debt_fee, debt_interest, intrst_base_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt, interest_update_date, debt_end_date, 
        orign_debt_end_date, defer_times, debt_return_date, debt_status, 
        remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_opor_no, v_co_no, v_pd_no, v_asset_acco_no, 
        v_exch_group_no, v_pass_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_stock_type, v_asset_type, 
        v_debt_type, v_strike_qty, v_strike_amt, v_strike_fee, 
        v_order_no, v_report_no, v_order_date, v_order_time, 
        v_order_dir, v_order_price, v_order_qty, v_debt_intrst_rate, 
        v_begin_debt_amt, v_begin_debt_qty, v_debt_amt, v_debt_qty, 
        v_debt_fee, v_debt_interest, v_intrst_base_amt, v_debt_return_amt, 
        v_debt_return_qty, v_return_interest_amt, v_interest_update_date, v_debt_end_date, 
        v_orign_debt_end_date, v_defer_times, v_debt_return_date, v_debt_status, 
        v_remark_info from db_pdsecu.tb_pdsecr_exgp_debtdetail where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no  and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and debt_type=v_debt_type and debt_status<>2   order by order_no,update_time limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.21.109.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","负债类型=",v_debt_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","负债类型=",v_debt_type);
        end if;
        leave label_pro;
    end if;


    /* set @明细持仓序号# = @记录序号#; */
    set v_detail_posi_id = v_row_id;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_detail_posi_id = v_detail_posi_id;
    SET p_init_date = v_init_date;
    SET p_pass_no = v_pass_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_fee = v_strike_fee;
    SET p_order_no = v_order_no;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_debt_amt = v_debt_amt;
    SET p_debt_qty = v_debt_qty;
    SET p_debt_fee = v_debt_fee;
    SET p_debt_interest = v_debt_interest;
    SET p_intrst_base_amt = v_intrst_base_amt;
    SET p_debt_return_amt = v_debt_return_amt;
    SET p_debt_return_qty = v_debt_return_qty;
    SET p_return_interest_amt = v_return_interest_amt;
    SET p_debt_status = v_debt_status;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;
    SET p_stock_code = v_stock_code;
    SET p_stock_acco_no = v_stock_acco_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券_锁定获取资产账户负债明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdseac_LockGetAsacDebtDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdseac_LockGetAsacDebtDetail(
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
    IN p_stock_code_no int,
    IN p_debt_type int,
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_detail_posi_id bigint,
    OUT p_init_date int,
    OUT p_pass_no int,
    OUT p_exch_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_fee decimal(18,4),
    OUT p_order_no int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_debt_amt decimal(18,4),
    OUT p_debt_qty decimal(18,2),
    OUT p_debt_fee decimal(18,4),
    OUT p_debt_interest decimal(18,4),
    OUT p_intrst_base_amt decimal(18,4),
    OUT p_debt_return_amt decimal(18,4),
    OUT p_debt_return_qty decimal(18,2),
    OUT p_return_interest_amt decimal(18,4),
    OUT p_debt_status int,
    OUT p_remark_info varchar(255),
    OUT p_update_times int,
    OUT p_stock_code varchar(6),
    OUT p_stock_acco_no int
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
    declare v_stock_code_no int;
    declare v_debt_type int;
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_detail_posi_id bigint;
    declare v_init_date int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_order_no int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_debt_status int;
    declare v_remark_info varchar(255);
    declare v_update_times int;
    declare v_stock_code varchar(6);
    declare v_stock_acco_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_debt_intrst_rate decimal(18,12);
    declare v_begin_debt_amt decimal(18,4);
    declare v_begin_debt_qty decimal(18,2);
    declare v_interest_update_date int;
    declare v_debt_end_date int;
    declare v_orign_debt_end_date int;
    declare v_defer_times int;
    declare v_debt_return_date int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_debt_type = p_debt_type;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_detail_posi_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pass_no = 0;
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_fee = 0;
    SET v_order_no = 0;
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_debt_amt = 0;
    SET v_debt_qty = 0;
    SET v_debt_fee = 0;
    SET v_debt_interest = 0;
    SET v_intrst_base_amt = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_debt_status = 0;
    SET v_remark_info = " ";
    SET v_update_times = 1;
    SET v_stock_code = " ";
    SET v_stock_acco_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_debt_intrst_rate = 0;
    SET v_begin_debt_amt = 0;
    SET v_begin_debt_qty = 0;
    SET v_interest_update_date = 0;
    SET v_debt_end_date = 0;
    SET v_orign_debt_end_date = 0;
    SET v_defer_times = 0;
    SET v_debt_return_date = 0;
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品证券_融资融券_资产账户负债明细表][字段][字段变量][{资产账户编号}=@资产账户编号#  and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and {负债类型}=@负债类型# and {负债状态}<>《负债状态-已归还》   order by {订单编号},{更新时间}][4][@交易组编号#,@资产账户编号#,@证券代码编号#,@负债类型#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        pass_no, exch_no, stock_acco_no, stock_code_no, 
        stock_code, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_intrst_rate, begin_debt_amt, 
        begin_debt_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, interest_update_date, debt_end_date, orign_debt_end_date, 
        defer_times, debt_return_date, debt_status, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_opor_no, v_co_no, v_pd_no, v_asset_acco_no, 
        v_pass_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
        v_stock_code, v_stock_type, v_asset_type, v_debt_type, 
        v_strike_qty, v_strike_amt, v_strike_fee, v_order_no, 
        v_report_no, v_order_date, v_order_time, v_order_dir, 
        v_order_price, v_order_qty, v_debt_intrst_rate, v_begin_debt_amt, 
        v_begin_debt_qty, v_debt_amt, v_debt_qty, v_debt_fee, 
        v_debt_interest, v_intrst_base_amt, v_debt_return_amt, v_debt_return_qty, 
        v_return_interest_amt, v_interest_update_date, v_debt_end_date, v_orign_debt_end_date, 
        v_defer_times, v_debt_return_date, v_debt_status, v_remark_info from db_pdsecu.tb_pdsecr_asac_debtdetail where asset_acco_no=v_asset_acco_no  and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and debt_type=v_debt_type and debt_status<>2   order by order_no,update_time limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.21.110.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","负债类型=",v_debt_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","负债类型=",v_debt_type);
        end if;
        leave label_pro;
    end if;


    /* set @明细持仓序号# = @记录序号#; */
    set v_detail_posi_id = v_row_id;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_detail_posi_id = v_detail_posi_id;
    SET p_init_date = v_init_date;
    SET p_pass_no = v_pass_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_fee = v_strike_fee;
    SET p_order_no = v_order_no;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_debt_amt = v_debt_amt;
    SET p_debt_qty = v_debt_qty;
    SET p_debt_fee = v_debt_fee;
    SET p_debt_interest = v_debt_interest;
    SET p_intrst_base_amt = v_intrst_base_amt;
    SET p_debt_return_amt = v_debt_return_amt;
    SET p_debt_return_qty = v_debt_return_qty;
    SET p_return_interest_amt = v_return_interest_amt;
    SET p_debt_status = v_debt_status;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;
    SET p_stock_code = v_stock_code;
    SET p_stock_acco_no = v_stock_acco_no;

END;;


