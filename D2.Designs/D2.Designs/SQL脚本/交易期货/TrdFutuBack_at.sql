DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易运维_查询订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfubk_QueryOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfubk_QueryOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_contrc_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_id bigint,
    IN p_order_dir_str varchar(1024),
    IN p_order_status_str varchar(64),
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
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_contrc_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_dir_str varchar(1024);
    declare v_order_status_str varchar(64);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_id = p_order_id;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_status_str = p_order_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_交易_订单表][{记录序号},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{外部账号},{市场编号},{通道编号},{交易编码编号},{合约代码编号},{资产类型},{合约类型},{合约乘数},{外部编号},{申报日期},{申报时间},{申报编号},{订单批号},{记录序号} as {订单序号},{订单日期},{订单时间},{订单方向},{开平方向},{套保标志},{订单价格},{订单数量},{订单状态},{撤单数量},{成交数量},{成交价格},{成交金额},{交易佣金},{其他佣金},{申报费用},{撤单费用},{应收保证金},{组合编码},{保证金比例},{回报信息},{合规触警序号},{订单操作方式},{更新次数}][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#)  and (@合约类型串#=" " or instr(@合约类型串#, concat(";",{合约类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,out_acco,exch_no,pass_no,futu_acco_no,contrc_code_no,asset_type,contrc_type,contrc_unit,external_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,contrc_dir,hedge_type,order_price,order_qty,order_status,wtdraw_qty,strike_qty,strike_price,strike_amt,trade_commis,other_commis,report_fee,wtdraw_fee,rece_margin,comb_code,margin_ratio,rsp_info,compli_trig_id,order_oper_way,update_times from db_tdfutu.tb_tdfutd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_contrc_type_str=" " or instr(v_contrc_type_str, concat(";",contrc_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,out_acco,exch_no,pass_no,futu_acco_no,contrc_code_no,asset_type,contrc_type,contrc_unit,external_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,contrc_dir,hedge_type,order_price,order_qty,order_status,wtdraw_qty,strike_qty,strike_price,strike_amt,trade_commis,other_commis,report_fee,wtdraw_fee,rece_margin,comb_code,margin_ratio,rsp_info,compli_trig_id,order_oper_way,update_times from db_tdfutu.tb_tdfutd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_contrc_type_str=" " or instr(v_contrc_type_str, concat(";",contrc_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易运维_查询订单历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfubk_QueryOrder_His;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfubk_QueryOrder_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_busi_opor_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_contrc_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_id bigint,
    IN p_order_dir_str varchar(1024),
    IN p_order_status_str varchar(64),
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
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_contrc_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_dir_str varchar(1024);
    declare v_order_status_str varchar(64);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_id = p_order_id;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_status_str = p_order_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_交易期货_交易_订单表][{记录序号},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{外部账号},{市场编号},{通道编号},{交易编码编号},{合约代码编号},{资产类型},{合约类型},{合约乘数},{外部编号},{申报日期},{申报时间},{申报编号},{订单批号},{记录序号} as {订单序号},{订单日期},{订单时间},{订单方向},{开平方向},{套保标志},{订单价格},{订单数量},{订单状态},{撤单数量},{成交数量},{成交价格},{成交金额},0 as {全部费用},{交易佣金},{其他佣金},{申报费用},{撤单费用},{应收保证金},{组合编码},{保证金比例},{回报信息},{合规触警序号},{更新次数}][({订单日期} between @开始日期# and @结束日期#) and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#)  and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@合约类型串#=" " or instr(@合约类型串#, concat(";",{合约类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,out_acco,exch_no,pass_no,futu_acco_no,contrc_code_no,asset_type,contrc_type,contrc_unit,external_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,contrc_dir,hedge_type,order_price,order_qty,order_status,wtdraw_qty,strike_qty,strike_price,strike_amt,0 as all_fee,trade_commis,other_commis,report_fee,wtdraw_fee,rece_margin,comb_code,margin_ratio,rsp_info,compli_trig_id,update_times from db_tdfutu_his.tb_tdfutd_order_his where (order_date between v_begin_date and v_end_date) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_contrc_type_str=" " or instr(v_contrc_type_str, concat(";",contrc_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,out_acco,exch_no,pass_no,futu_acco_no,contrc_code_no,asset_type,contrc_type,contrc_unit,external_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,contrc_dir,hedge_type,order_price,order_qty,order_status,wtdraw_qty,strike_qty,strike_price,strike_amt,0 as all_fee,trade_commis,other_commis,report_fee,wtdraw_fee,rece_margin,comb_code,margin_ratio,rsp_info,compli_trig_id,update_times from db_tdfutu_his.tb_tdfutd_order_his where (order_date between v_begin_date and v_end_date) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no)  and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_contrc_type_str=" " or instr(v_contrc_type_str, concat(";",contrc_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易运维_查询订单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfubk_QueryOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfubk_QueryOrderRsp(
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
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_order_no_str varchar(2048),
    IN p_order_dir_str varchar(1024),
    IN p_rsp_status_str varchar(64),
    IN p_deal_status_str varchar(64),
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
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_order_no_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_rsp_status_str varchar(64);
    declare v_deal_status_str varchar(64);
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
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_order_no_str = p_order_no_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_rsp_status_str = p_rsp_status_str;
    SET v_deal_status_str = p_deal_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_报盘_订单回报表][字段][(@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@交易编码#=" " or {交易编码}=@交易编码#) and (@合约代码#=" " or {合约代码}=@合约代码#) and (@订单编号串#=" " or instr(@订单编号串#,concat(";",{订单序号},";"))>0) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@回报状态串#=" " or instr(@回报状态串#,concat(";",{回报状态},";"))>0) and (@处理状态串#=" " or instr(@处理状态串#,concat(";",{处理状态},";"))>0) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, rsp_status, 
        rsp_info, deal_status, sett_flag from db_tdfutu.tb_tdfurp_orderrsp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code) and (v_order_no_str=" " or instr(v_order_no_str,concat(";",order_id,";"))>0) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_rsp_status_str=" " or instr(v_rsp_status_str,concat(";",rsp_status,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, rsp_status, 
        rsp_info, deal_status, sett_flag from db_tdfutu.tb_tdfurp_orderrsp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code) and (v_order_no_str=" " or instr(v_order_no_str,concat(";",order_id,";"))>0) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_rsp_status_str=" " or instr(v_rsp_status_str,concat(";",rsp_status,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易运维_查询成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfubk_QueryStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfubk_QueryStrikeRsp(
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
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_report_no_str varchar(2048),
    IN p_order_dir_str varchar(1024),
    IN p_deal_status_str varchar(64),
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
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_report_no_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_deal_status_str varchar(64);
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
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_report_no_str = p_report_no_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_deal_status_str = p_deal_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_报盘_成交回报表][字段][(@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@交易编码#=" " or {交易编码}=@交易编码#) and (@合约代码#=" " or {合约代码}=@合约代码#) and (@申报编号串#=" " or instr(@申报编号串#,concat(";",{申报编号},";"))>0) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@处理状态串#=" " or instr(@处理状态串#,concat(";",{处理状态},";"))>0) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, contrc_dir, 
        hedge_type, strike_price, strike_qty, strike_amt, 
        rsp_info, deal_status, sett_flag from db_tdfutu.tb_tdfurp_executionrsp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code) and (v_report_no_str=" " or instr(v_report_no_str,concat(";",report_no,";"))>0) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, contrc_dir, 
        hedge_type, strike_price, strike_qty, strike_amt, 
        rsp_info, deal_status, sett_flag from db_tdfutu.tb_tdfurp_executionrsp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code) and (v_report_no_str=" " or instr(v_report_no_str,concat(";",report_no,";"))>0) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易运维_查询成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfubk_QueryStrikeDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfubk_QueryStrikeDetail(
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
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_contrc_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_no_str varchar(2048),
    IN p_order_dir_str varchar(1024),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
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
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_contrc_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_no_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_no_str = p_order_no_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易期货_报盘_成交表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@合约类型串#=" " or instr(@合约类型串#,concat(";",{合约类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@订单编号串#=" " or instr(@订单编号串#,concat(";",{订单序号},";"))>0) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            init_date, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, crncy_type, 
            exch_no, futu_acco_no, contrc_code_no, contrc_code, 
            contrc_type, contrc_unit, comm_id, comm_batch_no, 
            strike_date, strike_time, strike_no, report_date, 
            report_no, order_date, order_time, order_id, 
            order_dir, contrc_dir, hedge_type, order_price, 
            order_qty, strike_qty, strike_price, strike_amt, 
            strike_fee, close_pandl, strike_margin, order_oper_way from db_tdfutu.tb_tdfurp_execution where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_contrc_type_str=" " or instr(v_contrc_type_str,concat(";",contrc_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_no_str=" " or instr(v_order_no_str,concat(";",order_id,";"))>0) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            init_date, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, crncy_type, 
            exch_no, futu_acco_no, contrc_code_no, contrc_code, 
            contrc_type, contrc_unit, comm_id, comm_batch_no, 
            strike_date, strike_time, strike_no, report_date, 
            report_no, order_date, order_time, order_id, 
            order_dir, contrc_dir, hedge_type, order_price, 
            order_qty, strike_qty, strike_price, strike_amt, 
            strike_fee, close_pandl, strike_margin, order_oper_way from db_tdfutu.tb_tdfurp_execution where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_contrc_type_str=" " or instr(v_contrc_type_str,concat(";",contrc_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_no_str=" " or instr(v_order_no_str,concat(";",order_id,";"))>0) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易期货_报盘_成交表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@合约类型串#=" " or instr(@合约类型串#,concat(";",{合约类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@订单编号串#=" " or instr(@订单编号串#,concat(";",{订单序号},";"))>0) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            init_date, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, crncy_type, 
            exch_no, futu_acco_no, contrc_code_no, contrc_code, 
            contrc_type, contrc_unit, comm_id, comm_batch_no, 
            strike_date, strike_time, strike_no, report_date, 
            report_no, order_date, order_time, order_id, 
            order_dir, contrc_dir, hedge_type, order_price, 
            order_qty, strike_qty, strike_price, strike_amt, 
            strike_fee, close_pandl, strike_margin, order_oper_way from db_tdfutu.tb_tdfurp_execution where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_contrc_type_str=" " or instr(v_contrc_type_str,concat(";",contrc_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_no_str=" " or instr(v_order_no_str,concat(";",order_id,";"))>0) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and row_id<v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            init_date, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, crncy_type, 
            exch_no, futu_acco_no, contrc_code_no, contrc_code, 
            contrc_type, contrc_unit, comm_id, comm_batch_no, 
            strike_date, strike_time, strike_no, report_date, 
            report_no, order_date, order_time, order_id, 
            order_dir, contrc_dir, hedge_type, order_price, 
            order_qty, strike_qty, strike_price, strike_amt, 
            strike_fee, close_pandl, strike_margin, order_oper_way from db_tdfutu.tb_tdfurp_execution where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_contrc_type_str=" " or instr(v_contrc_type_str,concat(";",contrc_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_no_str=" " or instr(v_order_no_str,concat(";",order_id,";"))>0) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易运维_查询成交明细历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfubk_QueryStrikeDetail_His;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfubk_QueryStrikeDetail_His(
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
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_contrc_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_dir_str varchar(1024),
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
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_contrc_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_dir_str varchar(1024);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_交易期货_报盘_成交表][字段][ ({初始化日期} between @开始日期# and @结束日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@合约类型串#=" " or instr(@合约类型串#,concat(";",{合约类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, crncy_type, 
        exch_no, futu_acco_no, contrc_code_no, contrc_code, 
        contrc_type, contrc_unit, comm_id, comm_batch_no, 
        strike_date, strike_time, strike_no, report_date, 
        report_no, order_date, order_time, order_id, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, strike_qty, strike_price, strike_amt, 
        strike_fee, close_pandl, strike_margin, order_oper_way from db_tdfutu_his.tb_tdfurp_execution_his where  (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_contrc_type_str=" " or instr(v_contrc_type_str,concat(";",contrc_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, crncy_type, 
        exch_no, futu_acco_no, contrc_code_no, contrc_code, 
        contrc_type, contrc_unit, comm_id, comm_batch_no, 
        strike_date, strike_time, strike_no, report_date, 
        report_no, order_date, order_time, order_id, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, strike_qty, strike_price, strike_amt, 
        strike_fee, close_pandl, strike_margin, order_oper_way from db_tdfutu_his.tb_tdfurp_execution_his where  (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_contrc_type_str=" " or instr(v_contrc_type_str,concat(";",contrc_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易运维_查询撤单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfubk_QueryCancel;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfubk_QueryCancel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_external_no bigint,
    IN p_order_id bigint,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
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
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_external_no bigint;
    declare v_order_id bigint;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_external_no = p_external_no;
    SET v_order_id = p_order_id;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易期货_交易_撤单表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#)  and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, crncy_type, exch_no, futu_acco_no, 
            futu_acco, contrc_code_no, contrc_code, external_no, 
            wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
            order_id, report_date, report_time, report_no, 
            wtdraw_status, wtdraw_qty, wtdraw_remark from db_tdfutu.tb_tdfutd_wtdraw where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_external_no=0 or external_no=v_external_no) and (v_order_id=0 or row_id=v_order_id) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, crncy_type, exch_no, futu_acco_no, 
            futu_acco, contrc_code_no, contrc_code, external_no, 
            wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
            order_id, report_date, report_time, report_no, 
            wtdraw_status, wtdraw_qty, wtdraw_remark from db_tdfutu.tb_tdfutd_wtdraw where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_external_no=0 or external_no=v_external_no) and (v_order_id=0 or row_id=v_order_id) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易期货_交易_撤单表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#)  and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and {记录序号}>@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, crncy_type, exch_no, futu_acco_no, 
            futu_acco, contrc_code_no, contrc_code, external_no, 
            wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
            order_id, report_date, report_time, report_no, 
            wtdraw_status, wtdraw_qty, wtdraw_remark from db_tdfutu.tb_tdfutd_wtdraw where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_external_no=0 or external_no=v_external_no) and (v_order_id=0 or row_id=v_order_id) and row_id>v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, crncy_type, exch_no, futu_acco_no, 
            futu_acco, contrc_code_no, contrc_code, external_no, 
            wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
            order_id, report_date, report_time, report_no, 
            wtdraw_status, wtdraw_qty, wtdraw_remark from db_tdfutu.tb_tdfutd_wtdraw where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no)  and (v_external_no=0 or external_no=v_external_no) and (v_order_id=0 or row_id=v_order_id) and row_id>v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易运维_查询机构统计异常订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfubk_QueryConoExceptionOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfubk_QueryConoExceptionOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_status_str varchar(64),
    IN p_order_date int,
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
    declare v_order_status_str varchar(64);
    declare v_order_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_count int;

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
    SET v_order_status_str = p_order_status_str;
    SET v_order_date = p_order_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易期货_交易_订单表][{记录序号},{机构编号},{订单状态},{订单时间},date_format(curtime(),'%H%i%s') as {机器时间},{订单操作方式}][{订单日期}=@订单日期#  and  (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) ][@指定行数#] */
    if v_row_count = -1 then
        select row_id,co_no,order_status,order_time,date_format(curtime(),'%H%i%s') as mach_time,order_oper_way from db_tdfutu.tb_tdfutd_order where order_date=v_order_date  and  (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) ;
    else
        select row_id,co_no,order_status,order_time,date_format(curtime(),'%H%i%s') as mach_time,order_oper_way from db_tdfutu.tb_tdfutd_order where order_date=v_order_date  and  (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0)  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_交易运维_查询机构统计异常订单数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfubk_QueryConoExceptionOrderCnt;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfubk_QueryConoExceptionOrderCnt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_auth_time int,
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
    declare v_order_date int;
    declare v_auth_time int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_mach_time int;
    declare v_row_count int;

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
    SET v_order_date = p_order_date;
    SET v_auth_time = p_auth_time;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;

    #机器时间 - 订单时间 > 前台设置的有效时间 判断为异常。

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易期货_交易_订单表][{机构编号},count(case when {订单状态}=《订单状态-未报》 then 1 END) AS {未报记录数},count(case when {订单状态}=《订单状态-已报》 then 1 END) AS {已报记录数},count(case when {订单状态}=《订单状态-待报》 then 1 END) AS {待报记录数},count(case when ({订单状态}=《订单状态-待报》 and @机器时间#-{订单时间}>@有效时间#) then 1 END) AS {待报异常数},count(case when {订单状态}=《订单状态-正报》 then 1 END) AS {正报记录数},count(case when ({订单状态}=《订单状态-正报》 and @机器时间#-{订单时间}>@有效时间#) then 1 END) AS {正报异常数},count(case when {订单状态}=《订单状态-待撤》 then 1 END) AS {待撤记录数},count(case when ({订单状态}=《订单状态-待撤》 and @机器时间#-{订单时间}>@有效时间#) then 1 END) AS {待撤异常数},count(case when {订单状态}=《订单状态-部成》 then 1 END) AS {部成记录数},count(case when {订单状态}=《订单状态-已成》 then 1 END) AS {已成记录数},count(case when {订单状态}=《订单状态-废单》 then 1 END) AS {废单记录数}][{订单日期}=@订单日期#  group by {机构编号}][@指定行数#] */
    if v_row_count = -1 then
        select co_no,count(case when order_status="1" then 1 END) AS no_report_cnt,count(case when order_status="2" then 1 END) AS already_report_cnt,count(case when order_status="a" then 1 END) AS wait_report_cnt,count(case when (order_status="a" and v_mach_time-order_time>v_auth_time) then 1 END) AS wait_report_except_cnt,count(case when order_status="b" then 1 END) AS in_report_cnt,count(case when (order_status="b" and v_mach_time-order_time>v_auth_time) then 1 END) AS in_report_except_cnt,count(case when order_status="3" then 1 END) AS wait_cancel_cnt,count(case when (order_status="3" and v_mach_time-order_time>v_auth_time) then 1 END) AS wait_cancel_except_cnt,count(case when order_status="5" then 1 END) AS part_strike_cnt,count(case when order_status="6" then 1 END) AS all_strike_cnt,count(case when order_status="8" then 1 END) AS abolish_cnt from db_tdfutu.tb_tdfutd_order where order_date=v_order_date  group by co_no;
    else
        select co_no,count(case when order_status="1" then 1 END) AS no_report_cnt,count(case when order_status="2" then 1 END) AS already_report_cnt,count(case when order_status="a" then 1 END) AS wait_report_cnt,count(case when (order_status="a" and v_mach_time-order_time>v_auth_time) then 1 END) AS wait_report_except_cnt,count(case when order_status="b" then 1 END) AS in_report_cnt,count(case when (order_status="b" and v_mach_time-order_time>v_auth_time) then 1 END) AS in_report_except_cnt,count(case when order_status="3" then 1 END) AS wait_cancel_cnt,count(case when (order_status="3" and v_mach_time-order_time>v_auth_time) then 1 END) AS wait_cancel_except_cnt,count(case when order_status="5" then 1 END) AS part_strike_cnt,count(case when order_status="6" then 1 END) AS all_strike_cnt,count(case when order_status="8" then 1 END) AS abolish_cnt from db_tdfutu.tb_tdfutd_order where order_date=v_order_date  group by co_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


