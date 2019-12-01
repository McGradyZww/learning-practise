DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_风控接口_查询风控所需交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdserkif_QueryExgpCapitalByRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_pdserkif_QueryExgpCapitalByRisk(
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
    IN p_exch_group_no int,
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_资金_交易组资金表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{机构编号},{产品编号},{资产账户编号},{交易组编号},{本币币种},{期初金额},({当前金额}+{金额核对差额}) as {当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{更新次数}][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,asset_acco_no,exch_group_no,crncy_type,begin_amt,(curr_amt+amt_check_diff) as curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_exgp_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,asset_acco_no,exch_group_no,crncy_type,begin_amt,(curr_amt+amt_check_diff) as curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_exgp_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_风控接口_查询风控所需资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdserkif_QueryAsacCapitalByRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_pdserkif_QueryAsacCapitalByRisk(
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
    declare v_asset_acco_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_资金_资产账户资金表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{机构编号},{产品编号},{资产账户编号},{本币币种},{期初金额},({当前金额}+{金额核对差额}) as {当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{更新次数}][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,asset_acco_no,crncy_type,begin_amt,(curr_amt+amt_check_diff) as curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_asac_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,asset_acco_no,crncy_type,begin_amt,(curr_amt+amt_check_diff) as curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_asac_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_风控接口_查询风控所需交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdserkif_QueryExgpPosiByRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_pdserkif_QueryExgpPosiByRisk(
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_交易组持仓表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{期初数量},{当前数量}+{待交收数量}+{持仓核对差额} as {当前数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{投资类型}][(@机构编号#=0 or {机构编号} = @机构编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and {投资类型}<>0 and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,begin_qty,curr_qty+pre_settle_qty+posi_qty_check_diff as curr_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,invest_type from db_pdsecu.tb_pdsepo_exgp_posi where (v_co_no=0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and invest_type<>0 and row_id>v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,begin_qty,curr_qty+pre_settle_qty+posi_qty_check_diff as curr_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,invest_type from db_pdsecu.tb_pdsepo_exgp_posi where (v_co_no=0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and invest_type<>0 and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_风控接口_查询风控所需资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdserkif_QueryAsacPosiByRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_pdserkif_QueryAsacPosiByRisk(
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
    

    /* [获取表记录][产品证券_持仓_资产账户持仓表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{机构编号},{产品编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{期初数量},{当前数量}+{待交收数量}+{持仓核对差额} as {当前数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{投资类型}][(@机构编号#=0 or {机构编号} = @机构编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and {投资类型}<>0 and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,begin_qty,curr_qty+pre_settle_qty+posi_qty_check_diff as curr_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,invest_type from db_pdsecu.tb_pdsepo_asac_posi where (v_co_no=0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and invest_type<>0 and row_id>v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,begin_qty,curr_qty+pre_settle_qty+posi_qty_check_diff as curr_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,invest_type from db_pdsecu.tb_pdsepo_asac_posi where (v_co_no=0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and invest_type<>0 and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_风控接口_更新交易组资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdserkif_UpdateExchGroupAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdserkif_UpdateExchGroupAsset(
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
    IN p_crncy_type varchar(3),
    IN p_asset_item int,
    IN p_asset_value decimal(18,4),
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
    declare v_crncy_type varchar(3);
    declare v_asset_item int;
    declare v_asset_value decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_NAV decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_cash_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_asset_item = p_asset_item;
    SET v_asset_value = p_asset_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_NAV = 0;
    SET v_nav_asset = 0;
    SET v_cash_asset = 0;
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_futu_asset = 0;
    SET v_other_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @期初净资产# = 0; */
    set v_begin_NAV = 0;

    /* set @净资产# = @资产值#; */
    set v_nav_asset = v_asset_value;

    /* set @现金资产# = 0; */
    set v_cash_asset = 0;

    /* set @股票资产# = 0; */
    set v_stock_asset = 0;

    /* set @债券资产# = 0; */
    set v_bond_asset = 0;

    /* set @基金资产# = 0; */
    set v_fund_asset = 0;

    /* set @回购资产# = 0; */
    set v_repo_asset = 0;

    /* set @期货资产# = 0; */
    set v_futu_asset = 0;

    /* set @其他资产# = 0; */
    set v_other_asset = 0;

    /* set @港股通资产# = 0; */
    set v_hk_thrgh_stock_asset = 0;

    /* if @资产项# = 《资产项-现金资产》 then */
    if v_asset_item = 1 then

        /* set @现金资产# = @资产值#; */
        set v_cash_asset = v_asset_value;

        /* [插入重复更新][产品证券_资金_交易组资产表][字段][字段变量][{现金资产}=@现金资产#,{净资产}=@现金资产#+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{其他资产}+{港股通资产}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdseca_exgp_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            cash_asset, stock_asset, fund_asset, bond_asset, 
            repo_asset, other_asset, hk_thrgh_stock_asset) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_cash_asset, v_stock_asset, v_fund_asset, v_bond_asset, 
            v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, cash_asset=v_cash_asset,nav_asset=v_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+other_asset+hk_thrgh_stock_asset;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.8.5.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-股票资产》 then */
    elseif v_asset_item = 2 then

        /* set @股票资产# = @资产值#; */
        set v_stock_asset = v_asset_value;

        /* [插入重复更新][产品证券_资金_交易组资产表][字段][字段变量][{股票资产}=@股票资产#,{净资产}={现金资产}+@股票资产#+{债券资产}+{基金资产}+{回购资产}+{其他资产}+{港股通资产}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdseca_exgp_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            cash_asset, stock_asset, fund_asset, bond_asset, 
            repo_asset, other_asset, hk_thrgh_stock_asset) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_cash_asset, v_stock_asset, v_fund_asset, v_bond_asset, 
            v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, stock_asset=v_stock_asset,nav_asset=cash_asset+v_stock_asset+bond_asset+fund_asset+repo_asset+other_asset+hk_thrgh_stock_asset;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.8.5.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-债券资产》 then */
    elseif v_asset_item = 3 then

        /* set @债券资产# = @资产值#; */
        set v_bond_asset = v_asset_value;

        /* [插入重复更新][产品证券_资金_交易组资产表][字段][字段变量][{债券资产}=@债券资产#,{净资产}={现金资产}+{股票资产}+@债券资产#+{基金资产}+{回购资产}+{其他资产}+{港股通资产}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdseca_exgp_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            cash_asset, stock_asset, fund_asset, bond_asset, 
            repo_asset, other_asset, hk_thrgh_stock_asset) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_cash_asset, v_stock_asset, v_fund_asset, v_bond_asset, 
            v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, bond_asset=v_bond_asset,nav_asset=cash_asset+stock_asset+v_bond_asset+fund_asset+repo_asset+other_asset+hk_thrgh_stock_asset;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.8.5.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-基金资产》 then */
    elseif v_asset_item = 4 then

        /* set @基金资产# = @资产值#; */
        set v_fund_asset = v_asset_value;

        /* [插入重复更新][产品证券_资金_交易组资产表][字段][字段变量][{基金资产}=@基金资产#,{净资产}={现金资产}+{股票资产}+{债券资产}+@基金资产#+{回购资产}+{其他资产}+{港股通资产}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdseca_exgp_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            cash_asset, stock_asset, fund_asset, bond_asset, 
            repo_asset, other_asset, hk_thrgh_stock_asset) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_cash_asset, v_stock_asset, v_fund_asset, v_bond_asset, 
            v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, fund_asset=v_fund_asset,nav_asset=cash_asset+stock_asset+bond_asset+v_fund_asset+repo_asset+other_asset+hk_thrgh_stock_asset;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.8.5.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-回购资产》 then */
    elseif v_asset_item = 5 then

        /* set @回购资产# = @资产值#; */
        set v_repo_asset = v_asset_value;

        /* [插入重复更新][产品证券_资金_交易组资产表][字段][字段变量][{回购资产}=@回购资产#,{净资产}={现金资产}+{股票资产}+{债券资产}+{基金资产}+@回购资产#+{其他资产}+{港股通资产}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdseca_exgp_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            cash_asset, stock_asset, fund_asset, bond_asset, 
            repo_asset, other_asset, hk_thrgh_stock_asset) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_cash_asset, v_stock_asset, v_fund_asset, v_bond_asset, 
            v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, repo_asset=v_repo_asset,nav_asset=cash_asset+stock_asset+bond_asset+fund_asset+v_repo_asset+other_asset+hk_thrgh_stock_asset;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.8.5.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-其他资产》 then */
    elseif v_asset_item = 7 then

        /* set @其他资产# = @资产值#; */
        set v_other_asset = v_asset_value;

        /* [插入重复更新][产品证券_资金_交易组资产表][字段][字段变量][{其他资产}=@其他资产#,{净资产}={现金资产}+{股票资产}+{债券资产}+{基金资产}+{回购资产}+@其他资产#+{港股通资产}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdseca_exgp_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            cash_asset, stock_asset, fund_asset, bond_asset, 
            repo_asset, other_asset, hk_thrgh_stock_asset) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_cash_asset, v_stock_asset, v_fund_asset, v_bond_asset, 
            v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, other_asset=v_other_asset,nav_asset=cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+v_other_asset+hk_thrgh_stock_asset;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.8.5.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-港股通资产》 then */
    elseif v_asset_item = 8 then

        /* set @港股通资产# = @资产值#; */
        set v_hk_thrgh_stock_asset = v_asset_value;

        /* [插入重复更新][产品证券_资金_交易组资产表][字段][字段变量][{港股通资产}=@港股通资产#,{净资产}={现金资产}+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{其他资产}+@港股通资产#][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdseca_exgp_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            cash_asset, stock_asset, fund_asset, bond_asset, 
            repo_asset, other_asset, hk_thrgh_stock_asset) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_cash_asset, v_stock_asset, v_fund_asset, v_bond_asset, 
            v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, hk_thrgh_stock_asset=v_hk_thrgh_stock_asset,nav_asset=cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+other_asset+v_hk_thrgh_stock_asset;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.8.5.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_风控接口_查询风控所需债券回购记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdserkif_QueryBondRepoByRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_pdserkif_QueryBondRepoByRisk(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_债券回购表][字段][(@机构编号#=0 or {机构编号} = @机构编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and {回购处理状态}=《回购处理状态-未处理》 and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_code, target_code_no, 
        target_code, order_dir, repo_qty, repo_amt, 
        repo_rate, repo_trade_date, repo_order_id, repo_strike_id, 
        repo_days, repo_cale_days, repo_back_date, repo_back_amt, 
        repo_back_intrst, repo_back_trade_date, repo_status from db_pdsecu.tb_pdsepo_bond_repo where (v_co_no=0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and repo_status="2" and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_code, target_code_no, 
        target_code, order_dir, repo_qty, repo_amt, 
        repo_rate, repo_trade_date, repo_order_id, repo_strike_id, 
        repo_days, repo_cale_days, repo_back_date, repo_back_amt, 
        repo_back_intrst, repo_back_trade_date, repo_status from db_pdsecu.tb_pdsepo_bond_repo where (v_co_no=0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and repo_status="2" and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_风控接口_查询风控所需大宗交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdserkif_QueryBlockTradePosiByRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_pdserkif_QueryBlockTradePosiByRisk(
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
    IN p_exch_no int,
    IN p_stock_code_no int,
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
    declare v_exch_no int;
    declare v_stock_code_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_大宗交易持仓表][{持仓序号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{成交数量},{成交价格},{公允价格},{成交日期},{解禁日期},{处理状态},{更新次数}][(@机构编号#=0 or {机构编号} = @机构编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and (@市场编号# = 0 or {市场编号} = @市场编号#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#)order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select posi_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,strike_qty,strike_price,fair_price,strike_date,release_date,deal_status,update_times from db_pdsecu.tb_pdsepo_block_trade_posi where (v_co_no=0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_exch_no = 0 or exch_no = v_exch_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no)order by row_id;
    else
        select posi_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,strike_qty,strike_price,fair_price,strike_date,release_date,deal_status,update_times from db_pdsecu.tb_pdsepo_block_trade_posi where (v_co_no=0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_exch_no = 0 or exch_no = v_exch_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no)order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


