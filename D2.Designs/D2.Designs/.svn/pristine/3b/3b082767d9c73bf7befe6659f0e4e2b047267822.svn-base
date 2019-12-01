DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_风控接口_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserkif_QueryExgpCash;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserkif_QueryExgpCash(
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
    IN p_exch_crncy_type varchar(3),
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
    declare v_exch_crncy_type varchar(3);
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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_账户_交易组业务资金表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@交易币种# = " " or {交易币种} = @交易币种#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, comm_releas_amt, 
        trade_frozen_amt, trade_unfroz_amt, trade_capt_amt, trade_releas_amt, 
        strike_capt_amt, strike_releas_amt from db_tdsecu.tb_tdseac_exgp_busi_capit where (v_co_no=0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_exch_crncy_type = " " or exch_crncy_type = v_exch_crncy_type) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, comm_releas_amt, 
        trade_frozen_amt, trade_unfroz_amt, trade_capt_amt, trade_releas_amt, 
        strike_capt_amt, strike_releas_amt from db_tdsecu.tb_tdseac_exgp_busi_capit where (v_co_no=0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_exch_crncy_type = " " or exch_crncy_type = v_exch_crncy_type) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_风控接口_查询资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserkif_QueryAsacCash;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserkif_QueryAsacCash(
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
    IN p_exch_crncy_type varchar(3),
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
    declare v_exch_crncy_type varchar(3);
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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_账户_资产账户业务资金表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易币种# = " " or  {交易币种} = @交易币种#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_frozen_amt, 
        trade_unfroz_amt, trade_capt_amt, trade_releas_amt, strike_capt_amt, 
        strike_releas_amt from db_tdsecu.tb_tdseac_asac_busi_capit where (v_co_no=0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_crncy_type = " " or  exch_crncy_type = v_exch_crncy_type) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_frozen_amt, 
        trade_unfroz_amt, trade_capt_amt, trade_releas_amt, strike_capt_amt, 
        strike_releas_amt from db_tdsecu.tb_tdseac_asac_busi_capit where (v_co_no=0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_crncy_type = " " or  exch_crncy_type = v_exch_crncy_type) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_风控接口_查询交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserkif_QueryExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserkif_QueryExgpPosi(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_账户_交易组业务持仓表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        comm_frozen_qty, comm_unfroz_qty, comm_capt_qty, comm_releas_qty, 
        trade_frozen_qty, trade_unfroz_qty, trade_capt_qty, trade_releas_qty, 
        strike_capt_qty, strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, 
        realize_pandl, cost_amt, intrst_cost_amt, intrst_pandl from db_tdsecu.tb_tdseac_exgp_busi_posi where (v_co_no=0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        comm_frozen_qty, comm_unfroz_qty, comm_capt_qty, comm_releas_qty, 
        trade_frozen_qty, trade_unfroz_qty, trade_capt_qty, trade_releas_qty, 
        strike_capt_qty, strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, 
        realize_pandl, cost_amt, intrst_cost_amt, intrst_pandl from db_tdsecu.tb_tdseac_exgp_busi_posi where (v_co_no=0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_风控接口_查询资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserkif_QueryAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserkif_QueryAsacPosi(
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
    IN p_stock_code_no int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_账户_资产账户业务持仓表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
        comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
        trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_capt_qty, 
        strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, realize_pandl, 
        cost_amt, intrst_cost_amt, intrst_pandl from db_tdsecu.tb_tdseac_asac_busi_posi where (v_co_no=0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
        comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
        trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_capt_qty, 
        strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, realize_pandl, 
        cost_amt, intrst_cost_amt, intrst_pandl from db_tdsecu.tb_tdseac_asac_busi_posi where (v_co_no=0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_风控接口_查询订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserkif_QueryOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserkif_QueryOrder(
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
    IN p_pass_no int,
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
    declare v_pass_no int;
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
    SET v_pass_no = p_pass_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_交易_订单表][{记录序号},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码编号},{证券代码编号},{资产类型},{证券类型},{指令下达人},{外部编号},{指令序号},{指令批号},{申报日期},{申报时间},{申报编号},{订单批号},{记录序号} as {订单序号},{订单日期},{订单时间},{订单方向},{价格类型},{订单价格},{订单数量},{订单状态},{撤单数量},{成交金额},{成交数量},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{债券计提利息},{净价标志},{订单冻结金额},{订单冻结数量},{回报信息},{合规触警序号},{备注信息},{订单操作方式},{更新次数}][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,update_times from db_tdsecu.tb_tdsetd_order where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and row_id>v_row_id order by row_id;
    else
        select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,update_times from db_tdsecu.tb_tdsetd_order where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_风控接口_查询指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserkif_QueryComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserkif_QueryComm(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_指令_指令表][{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{操作功能},{记录序号},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{证券代码编号},{资产类型},{证券类型},{指令下达人},{指令执行人},{记录序号} as {指令序号},{指令日期},{指令时间},{指令批号},{指令方向},{指令限价},{指令实际限价},{指令数量},{指令金额},{订单数量},{指令撤销数量},{成交金额},{成交数量},{指令冻结金额},{指令冻结数量},{净价标志},{票面面值},{债券计提利息},{成交状态},{指令状态},{指令开始日期},{指令结束日期},{指令开始时间},{指令结束时间},{指令完成日期},{指令完成时间},{指令审批日期},{指令审批时间},{指令审批状态},{指令审批操作员序号},{指令审批操作员},{指令审批说明},{篮子序号},{指令操作方式},{体外指令标志},{指令完成标志},{更新次数}][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,row_id,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,asset_type,stock_type,comm_opor,comm_executor,row_id as comm_id,comm_date,comm_time,comm_batch_no,comm_dir,comm_limit_price,limit_actual_price,comm_qty,comm_amt,order_qty,comm_cancel_qty,strike_amt,strike_qty,comm_frozen_amt,comm_frozen_qty,net_price_flag,par_value,bond_accr_intrst,strike_status,comm_status,comm_begin_date,comm_end_date,comm_begin_time,comm_end_time,comm_comple_date,comm_comple_time,comm_appr_date,comm_appr_time,comm_appr_status,comm_appr_oper_no,comm_appr_oper,comm_appr_remark,basket_id,comm_oper_way,exter_comm_flag,comm_comple_flag,update_times from db_tdsecu.tb_tdseap_command where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and row_id>v_row_id order by row_id;
    else
        select opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,row_id,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,asset_type,stock_type,comm_opor,comm_executor,row_id as comm_id,comm_date,comm_time,comm_batch_no,comm_dir,comm_limit_price,limit_actual_price,comm_qty,comm_amt,order_qty,comm_cancel_qty,strike_amt,strike_qty,comm_frozen_amt,comm_frozen_qty,net_price_flag,par_value,bond_accr_intrst,strike_status,comm_status,comm_begin_date,comm_end_date,comm_begin_time,comm_end_time,comm_comple_date,comm_comple_time,comm_appr_date,comm_appr_time,comm_appr_status,comm_appr_oper_no,comm_appr_oper,comm_appr_remark,basket_id,comm_oper_way,exter_comm_flag,comm_comple_flag,update_times from db_tdsecu.tb_tdseap_command where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_风控接口_查询交易组业务持仓负债结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserkif_QueryExgpBusiPosiDebtList;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserkif_QueryExgpBusiPosiDebtList(
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
    

    /* [获取表记录][交易证券_账户_交易组业务持仓负债表][字段][{记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code, stock_code_no, 
        stock_type, asset_type, invest_type, debt_type, 
        debt_fina_buy_strike_qty, fina_return_strike_qty, debt_loan_sell_strike_qty, loan_return_strike_qty, 
        debt_fina_buy_order_qty, fina_return_order_qty, debt_loan_sell_order_qty, loan_return_order_qty, 
        debt_fina_buy_comm_qty, fina_return_comm_qty, debt_loan_sell_comm_qty, loan_return_comm_qty, 
        debt_fina_buy_strike_amt, fina_return_strike_amt, debt_loan_sell_strike_amt, loan_return_strike_amt, 
        debt_fina_buy_order_amt, fina_return_order_amt, debt_loan_sell_order_amt, loan_return_order_amt, 
        debt_fina_buy_comm_amt, fina_return_comm_amt, debt_loan_sell_comm_amt, loan_return_comm_amt, 
        debt_strike_fee, return_strike_fee, debt_interest, return_interest_amt from db_tdsecu.tb_tdseac_exgp_busi_posi_debt where row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code, stock_code_no, 
        stock_type, asset_type, invest_type, debt_type, 
        debt_fina_buy_strike_qty, fina_return_strike_qty, debt_loan_sell_strike_qty, loan_return_strike_qty, 
        debt_fina_buy_order_qty, fina_return_order_qty, debt_loan_sell_order_qty, loan_return_order_qty, 
        debt_fina_buy_comm_qty, fina_return_comm_qty, debt_loan_sell_comm_qty, loan_return_comm_qty, 
        debt_fina_buy_strike_amt, fina_return_strike_amt, debt_loan_sell_strike_amt, loan_return_strike_amt, 
        debt_fina_buy_order_amt, fina_return_order_amt, debt_loan_sell_order_amt, loan_return_order_amt, 
        debt_fina_buy_comm_amt, fina_return_comm_amt, debt_loan_sell_comm_amt, loan_return_comm_amt, 
        debt_strike_fee, return_strike_fee, debt_interest, return_interest_amt from db_tdsecu.tb_tdseac_exgp_busi_posi_debt where row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_风控接口_查询资产账户业务持仓负债结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserkif_QueryAsacBusiPosiDebtList;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserkif_QueryAsacBusiPosiDebtList(
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
    

    /* [获取表记录][交易证券_账户_资产账户业务持仓负债表][字段][{记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, invest_type, debt_type, debt_fina_buy_strike_qty, 
        fina_return_strike_qty, debt_loan_sell_strike_qty, loan_return_strike_qty, debt_fina_buy_order_qty, 
        fina_return_order_qty, debt_loan_sell_order_qty, loan_return_order_qty, debt_fina_buy_comm_qty, 
        fina_return_comm_qty, debt_loan_sell_comm_qty, loan_return_comm_qty, debt_fina_buy_strike_amt, 
        fina_return_strike_amt, debt_loan_sell_strike_amt, loan_return_strike_amt, debt_fina_buy_order_amt, 
        fina_return_order_amt, debt_loan_sell_order_amt, loan_return_order_amt, debt_fina_buy_comm_amt, 
        fina_return_comm_amt, debt_loan_sell_comm_amt, loan_return_comm_amt, debt_strike_fee, 
        return_strike_fee, debt_interest, return_interest_amt from db_tdsecu.tb_tdseac_asac_busi_posi_debt where row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, invest_type, debt_type, debt_fina_buy_strike_qty, 
        fina_return_strike_qty, debt_loan_sell_strike_qty, loan_return_strike_qty, debt_fina_buy_order_qty, 
        fina_return_order_qty, debt_loan_sell_order_qty, loan_return_order_qty, debt_fina_buy_comm_qty, 
        fina_return_comm_qty, debt_loan_sell_comm_qty, loan_return_comm_qty, debt_fina_buy_strike_amt, 
        fina_return_strike_amt, debt_loan_sell_strike_amt, loan_return_strike_amt, debt_fina_buy_order_amt, 
        fina_return_order_amt, debt_loan_sell_order_amt, loan_return_order_amt, debt_fina_buy_comm_amt, 
        fina_return_comm_amt, debt_loan_sell_comm_amt, loan_return_comm_amt, debt_strike_fee, 
        return_strike_fee, debt_interest, return_interest_amt from db_tdsecu.tb_tdseac_asac_busi_posi_debt where row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_风控接口_查询交易组业务资金负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdserkif_QueryExgpBusiCapitalDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_tdserkif_QueryExgpBusiCapitalDebt(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@初始化日期#] */
    select date_format(curdate(),'%Y%m%d') into v_init_date;


    /* [获取表记录][交易证券_账户_交易组业务资金负债表][字段][{初始化日期} = @初始化日期# and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        debt_loan_sell_strike_amt, debt_strike_fee, loan_return_strike_amt, loan_return_order_amt, 
        loan_return_comm_amt, return_strike_fee from db_tdsecu.tb_tdseac_exgp_busi_capital_debt where init_date = v_init_date and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        debt_loan_sell_strike_amt, debt_strike_fee, loan_return_strike_amt, loan_return_order_amt, 
        loan_return_comm_amt, return_strike_fee from db_tdsecu.tb_tdseac_exgp_busi_capital_debt where init_date = v_init_date and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


