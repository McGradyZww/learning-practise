DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_appr_oper int,
    IN p_comm_appr_status_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
    IN p_comm_dir_str varchar(2048),
    IN p_comm_status_str varchar(64),
    IN p_strike_status_str varchar(64),
    IN p_basket_id bigint,
    IN p_comm_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_comm_comple_flag int,
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
    declare v_comm_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_appr_oper int;
    declare v_comm_appr_status_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_comm_dir_str varchar(2048);
    declare v_comm_status_str varchar(64);
    declare v_strike_status_str varchar(64);
    declare v_basket_id bigint;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_comm_comple_flag int;
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
    SET v_comm_id = p_comm_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_comm_appr_status_str = p_comm_appr_status_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_status_str = p_comm_status_str;
    SET v_strike_status_str = p_strike_status_str;
    SET v_basket_id = p_basket_id;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_comm_comple_flag = p_comm_comple_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_指令_指令表][{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{操作功能},{记录序号},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{证券代码编号},{资产类型},{证券类型},{指令下达人},{指令执行人},{记录序号} as {指令序号},{指令日期},{指令时间},{指令批号},{指令方向},{指令限价},{指令实际限价},{指令数量},{指令金额},{订单数量},{指令撤销数量},{成交金额},{成交数量},{指令冻结金额},{指令冻结数量},{净价标志},{票面面值},{债券计提利息},{成交状态},{指令状态},{指令开始日期},{指令结束日期},{指令开始时间},{指令结束时间},{指令完成日期},{指令完成时间},{指令审批日期},{指令审批时间},{指令审批状态},{指令审批操作员序号},{指令审批操作员},{指令审批说明},{篮子序号},{指令操作方式},{体外指令标志},{指令完成标志},{更新次数}][(@指令序号#=0 or {记录序号}=@指令序号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and (@指令完成标志# = 0 or {指令完成标志}=@指令完成标志#) and (@篮子序号# = 0 or {篮子序号} = @篮子序号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#) and (@指令审批操作员#=0 or {指令审批操作员}=@指令审批操作员#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@指令审批状态串#=" " or instr(@指令审批状态串#, concat(";",{指令审批状态},";"))>0) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@资产类型串#=" " or instr(@资产类型串#, concat(";",{资产类型},";"))>0) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@指令状态串#=" " or instr(@指令状态串#, concat(";",{指令状态},";"))>0) and (@成交状态串#=" " or instr(@成交状态串#, concat(";",{成交状态},";"))>0) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#)  and (@指令操作方式# = " " or {指令操作方式} = @指令操作方式#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,row_id,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,asset_type,stock_type,comm_opor,comm_executor,row_id as comm_id,comm_date,comm_time,comm_batch_no,comm_dir,comm_limit_price,limit_actual_price,comm_qty,comm_amt,order_qty,comm_cancel_qty,strike_amt,strike_qty,comm_frozen_amt,comm_frozen_qty,net_price_flag,par_value,bond_accr_intrst,strike_status,comm_status,comm_begin_date,comm_end_date,comm_begin_time,comm_end_time,comm_comple_date,comm_comple_time,comm_appr_date,comm_appr_time,comm_appr_status,comm_appr_oper_no,comm_appr_oper,comm_appr_remark,basket_id,comm_oper_way,exter_comm_flag,comm_comple_flag,update_times from db_tdsecu.tb_tdseap_command where (v_comm_id=0 or row_id=v_comm_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_comm_comple_flag = 0 or comm_comple_flag=v_comm_comple_flag) and (v_basket_id = 0 or basket_id = v_basket_id) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_appr_status_str=" " or instr(v_comm_appr_status_str, concat(";",comm_appr_status,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_status_str=" " or instr(v_comm_status_str, concat(";",comm_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id>v_row_id order by row_id;
        else
            select opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,row_id,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,asset_type,stock_type,comm_opor,comm_executor,row_id as comm_id,comm_date,comm_time,comm_batch_no,comm_dir,comm_limit_price,limit_actual_price,comm_qty,comm_amt,order_qty,comm_cancel_qty,strike_amt,strike_qty,comm_frozen_amt,comm_frozen_qty,net_price_flag,par_value,bond_accr_intrst,strike_status,comm_status,comm_begin_date,comm_end_date,comm_begin_time,comm_end_time,comm_comple_date,comm_comple_time,comm_appr_date,comm_appr_time,comm_appr_status,comm_appr_oper_no,comm_appr_oper,comm_appr_remark,basket_id,comm_oper_way,exter_comm_flag,comm_comple_flag,update_times from db_tdsecu.tb_tdseap_command where (v_comm_id=0 or row_id=v_comm_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_comm_comple_flag = 0 or comm_comple_flag=v_comm_comple_flag) and (v_basket_id = 0 or basket_id = v_basket_id) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_appr_status_str=" " or instr(v_comm_appr_status_str, concat(";",comm_appr_status,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_status_str=" " or instr(v_comm_status_str, concat(";",comm_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_指令_指令表][{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{操作功能},{记录序号},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{证券代码编号},{资产类型},{证券类型},{指令下达人},{指令执行人},{记录序号} as {指令序号},{指令日期},{指令时间},{指令批号},{指令方向},{指令限价},{指令实际限价},{指令数量},{指令金额},{订单数量},{指令撤销数量},{成交金额},{成交数量},{指令冻结金额},{指令冻结数量},{净价标志},{票面面值},{债券计提利息},{成交状态},{指令状态},{指令开始日期},{指令结束日期},{指令开始时间},{指令结束时间},{指令完成日期},{指令完成时间},{指令审批日期},{指令审批时间},{指令审批状态},{指令审批操作员序号},{指令审批操作员},{指令审批说明},{篮子序号},{指令操作方式},{体外指令标志},{指令完成标志},{更新次数}][(@指令序号#=0 or {记录序号}=@指令序号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and (@指令完成标志# = 0 or {指令完成标志}=@指令完成标志#) and (@篮子序号# = 0 or {篮子序号} = @篮子序号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#) and (@指令审批操作员#=0 or {指令审批操作员}=@指令审批操作员#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@指令审批状态串#=" " or instr(@指令审批状态串#, concat(";",{指令审批状态},";"))>0) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@资产类型串#=" " or instr(@资产类型串#, concat(";",{资产类型},";"))>0) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@指令状态串#=" " or instr(@指令状态串#, concat(";",{指令状态},";"))>0) and (@成交状态串#=" " or instr(@成交状态串#, concat(";",{成交状态},";"))>0) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#)  and (@指令操作方式# = " " or {指令操作方式} = @指令操作方式#) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,row_id,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,asset_type,stock_type,comm_opor,comm_executor,row_id as comm_id,comm_date,comm_time,comm_batch_no,comm_dir,comm_limit_price,limit_actual_price,comm_qty,comm_amt,order_qty,comm_cancel_qty,strike_amt,strike_qty,comm_frozen_amt,comm_frozen_qty,net_price_flag,par_value,bond_accr_intrst,strike_status,comm_status,comm_begin_date,comm_end_date,comm_begin_time,comm_end_time,comm_comple_date,comm_comple_time,comm_appr_date,comm_appr_time,comm_appr_status,comm_appr_oper_no,comm_appr_oper,comm_appr_remark,basket_id,comm_oper_way,exter_comm_flag,comm_comple_flag,update_times from db_tdsecu.tb_tdseap_command where (v_comm_id=0 or row_id=v_comm_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_comm_comple_flag = 0 or comm_comple_flag=v_comm_comple_flag) and (v_basket_id = 0 or basket_id = v_basket_id) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_appr_status_str=" " or instr(v_comm_appr_status_str, concat(";",comm_appr_status,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_status_str=" " or instr(v_comm_status_str, concat(";",comm_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id<v_row_id order by row_id desc;
        else
            select opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,row_id,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,asset_type,stock_type,comm_opor,comm_executor,row_id as comm_id,comm_date,comm_time,comm_batch_no,comm_dir,comm_limit_price,limit_actual_price,comm_qty,comm_amt,order_qty,comm_cancel_qty,strike_amt,strike_qty,comm_frozen_amt,comm_frozen_qty,net_price_flag,par_value,bond_accr_intrst,strike_status,comm_status,comm_begin_date,comm_end_date,comm_begin_time,comm_end_time,comm_comple_date,comm_comple_time,comm_appr_date,comm_appr_time,comm_appr_status,comm_appr_oper_no,comm_appr_oper,comm_appr_remark,basket_id,comm_oper_way,exter_comm_flag,comm_comple_flag,update_times from db_tdsecu.tb_tdseap_command where (v_comm_id=0 or row_id=v_comm_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_comm_comple_flag = 0 or comm_comple_flag=v_comm_comple_flag) and (v_basket_id = 0 or basket_id = v_basket_id) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_appr_status_str=" " or instr(v_comm_appr_status_str, concat(";",comm_appr_status,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_status_str=" " or instr(v_comm_status_str, concat(";",comm_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询指令历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryComm_His;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryComm_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_comm_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_appr_oper int,
    IN p_comm_appr_status_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
    IN p_comm_dir_str varchar(2048),
    IN p_comm_status_str varchar(64),
    IN p_strike_status_str varchar(64),
    IN p_basket_id bigint,
    IN p_comm_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_comm_comple_flag int,
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
    declare v_comm_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_appr_oper int;
    declare v_comm_appr_status_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_comm_dir_str varchar(2048);
    declare v_comm_status_str varchar(64);
    declare v_strike_status_str varchar(64);
    declare v_basket_id bigint;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_comm_comple_flag int;
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
    SET v_comm_id = p_comm_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_comm_appr_status_str = p_comm_appr_status_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_status_str = p_comm_status_str;
    SET v_strike_status_str = p_strike_status_str;
    SET v_basket_id = p_basket_id;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_comm_comple_flag = p_comm_comple_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_交易证券_指令_指令表][{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{操作功能},{记录序号},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{证券代码编号},{资产类型},{证券类型},{指令下达人},{指令执行人},{记录序号} as {指令序号},{指令日期},{指令时间},{指令批号},{指令方向},{指令限价},{指令实际限价},{指令数量},{指令金额},{订单数量},{指令撤销数量},{成交金额},{成交数量},{指令冻结金额},{指令冻结数量},{净价标志},{票面面值},{债券计提利息},{成交状态},{指令状态},{指令开始日期},{指令结束日期},{指令开始时间},{指令结束时间},{指令完成日期},{指令完成时间},{指令审批日期},{指令审批时间},{指令审批状态},{指令审批操作员序号},{指令审批操作员},{指令审批说明},{篮子序号},{指令操作方式},{体外指令标志},{指令完成标志},{更新次数}][({初始化日期} between @开始日期# and @结束日期#) and (@指令序号#=0 or {记录序号}=@指令序号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and (@指令完成标志# = 0 or {指令完成标志}=@指令完成标志#) and (@篮子序号# = 0 or {篮子序号} = @篮子序号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#) and (@指令审批操作员#=0 or {指令审批操作员}=@指令审批操作员#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@指令审批状态串#=" " or instr(@指令审批状态串#, concat(";",{指令审批状态},";"))>0) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@资产类型串#=" " or instr(@资产类型串#, concat(";",{资产类型},";"))>0) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@指令状态串#=" " or instr(@指令状态串#, concat(";",{指令状态},";"))>0) and (@成交状态串#=" " or instr(@成交状态串#, concat(";",{成交状态},";"))>0) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#)  and (@指令操作方式# = " " or {指令操作方式} = @指令操作方式#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,row_id,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,asset_type,stock_type,comm_opor,comm_executor,row_id as comm_id,comm_date,comm_time,comm_batch_no,comm_dir,comm_limit_price,limit_actual_price,comm_qty,comm_amt,order_qty,comm_cancel_qty,strike_amt,strike_qty,comm_frozen_amt,comm_frozen_qty,net_price_flag,par_value,bond_accr_intrst,strike_status,comm_status,comm_begin_date,comm_end_date,comm_begin_time,comm_end_time,comm_comple_date,comm_comple_time,comm_appr_date,comm_appr_time,comm_appr_status,comm_appr_oper_no,comm_appr_oper,comm_appr_remark,basket_id,comm_oper_way,exter_comm_flag,comm_comple_flag,update_times from db_tdsecu_his.tb_tdseap_command_his where (init_date between v_begin_date and v_end_date) and (v_comm_id=0 or row_id=v_comm_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_comm_comple_flag = 0 or comm_comple_flag=v_comm_comple_flag) and (v_basket_id = 0 or basket_id = v_basket_id) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_appr_status_str=" " or instr(v_comm_appr_status_str, concat(";",comm_appr_status,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_status_str=" " or instr(v_comm_status_str, concat(";",comm_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id>v_row_id order by row_id;
    else
        select opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,oper_func_code,row_id,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,asset_type,stock_type,comm_opor,comm_executor,row_id as comm_id,comm_date,comm_time,comm_batch_no,comm_dir,comm_limit_price,limit_actual_price,comm_qty,comm_amt,order_qty,comm_cancel_qty,strike_amt,strike_qty,comm_frozen_amt,comm_frozen_qty,net_price_flag,par_value,bond_accr_intrst,strike_status,comm_status,comm_begin_date,comm_end_date,comm_begin_time,comm_end_time,comm_comple_date,comm_comple_time,comm_appr_date,comm_appr_time,comm_appr_status,comm_appr_oper_no,comm_appr_oper,comm_appr_remark,basket_id,comm_oper_way,exter_comm_flag,comm_comple_flag,update_times from db_tdsecu_his.tb_tdseap_command_his where (init_date between v_begin_date and v_end_date) and (v_comm_id=0 or row_id=v_comm_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_comm_comple_flag = 0 or comm_comple_flag=v_comm_comple_flag) and (v_basket_id = 0 or basket_id = v_basket_id) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_comm_appr_oper=0 or comm_appr_oper=v_comm_appr_oper) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_appr_status_str=" " or instr(v_comm_appr_status_str, concat(";",comm_appr_status,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_status_str=" " or instr(v_comm_status_str, concat(";",comm_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_order_oper_way_str varchar(1024),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_id bigint,
    IN p_order_dir_str varchar(1024),
    IN p_order_status_str varchar(64),
    IN p_price_type_str varchar(2048),
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
    declare v_order_oper_way_str varchar(1024);
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_dir_str varchar(1024);
    declare v_order_status_str varchar(64);
    declare v_price_type_str varchar(2048);
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
    SET v_order_oper_way_str = p_order_oper_way_str;
    SET v_co_no = p_co_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_id = p_order_id;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_status_str = p_order_status_str;
    SET v_price_type_str = p_price_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_交易_订单表][{记录序号},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码编号},{证券代码编号},{资产类型},{证券类型},{指令下达人},{外部编号},{指令序号},{指令批号},{申报日期},{申报时间},{申报编号},{订单批号},{记录序号} as {订单序号},{订单日期},{订单时间},{订单方向},{价格类型},{订单价格},{订单数量},{订单状态},{撤单数量},{成交金额},{成交数量},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{债券计提利息},{净价标志},{订单冻结金额},{订单冻结数量},{回报信息},{合规触警序号},{备注信息},{订单操作方式},{更新次数}][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式串#=" " or instr(@订单操作方式串#, concat(";",{订单操作方式},";"))>0) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号串#=" " or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0) and (@通道编号#=0 or {通道编号}=@通道编号#) and {体外指令标志} = 《体外指令标志-体内》 and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#)  and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) and (@价格类型串#=" " or instr(@价格类型串#, concat(";",{价格类型},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,update_times from db_tdsecu.tb_tdsetd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and exter_comm_flag = 1 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no)  and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and row_id>v_row_id order by row_id;
        else
            select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,update_times from db_tdsecu.tb_tdsetd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and exter_comm_flag = 1 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no)  and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_交易_订单表][{记录序号},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码编号},{证券代码编号},{资产类型},{证券类型},{指令下达人},{外部编号},{指令序号},{指令批号},{申报日期},{申报时间},{申报编号},{订单批号},{记录序号} as {订单序号},{订单日期},{订单时间},{订单方向},{价格类型},{订单价格},{订单数量},{订单状态},{撤单数量},{成交金额},{成交数量},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{债券计提利息},{净价标志},{订单冻结金额},{订单冻结数量},{回报信息},{合规触警序号},{备注信息},{订单操作方式},{更新次数}][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式串#=" " or instr(@订单操作方式串#, concat(";",{订单操作方式},";"))>0) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号串#=" " or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0) and (@通道编号#=0 or {通道编号}=@通道编号#) and {体外指令标志} = 《体外指令标志-体内》 and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) and (@价格类型串#=" " or instr(@价格类型串#, concat(";",{价格类型},";"))>0) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,update_times from db_tdsecu.tb_tdsetd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and exter_comm_flag = 1 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and row_id<v_row_id order by row_id desc;
        else
            select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,update_times from db_tdsecu.tb_tdsetd_order where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and exter_comm_flag = 1 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询订单历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryOrder_His;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryOrder_His(
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
    IN p_order_oper_way_str varchar(1024),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_pass_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_order_id bigint,
    IN p_order_dir_str varchar(1024),
    IN p_order_status_str varchar(64),
    IN p_price_type_str varchar(2048),
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
    declare v_order_oper_way_str varchar(1024);
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_pass_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_dir_str varchar(1024);
    declare v_order_status_str varchar(64);
    declare v_price_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_order_oper_way_str = p_order_oper_way_str;
    SET v_co_no = p_co_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pass_no = p_pass_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_id = p_order_id;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_status_str = p_order_status_str;
    SET v_price_type_str = p_price_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_交易证券_交易_订单表][{记录序号},{操作员机构编号},{操作员编号},{操作MAC},{操作IP},{操作信息},{操作方式},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{市场编号},{股东代码编号},{证券代码编号},{资产类型},{证券类型},{指令下达人},{外部编号},{指令序号},{指令批号},{申报日期},{申报时间},{申报编号},{订单批号},{记录序号} as {订单序号},{订单日期},{订单时间},{订单方向},{价格类型},{订单价格},{订单数量},{订单状态},{撤单数量},{成交金额},{成交数量},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{债券计提利息},{净价标志},{订单冻结金额},{订单冻结数量},{回报信息},{合规触警序号},{备注信息},{订单操作方式},{更新次数}][({订单日期} between @开始日期# and @结束日期#) and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@订单操作方式串#=" " or instr(@订单操作方式串#, concat(";",{订单操作方式},";"))>0) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号串#=" " or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0) and (@通道编号#=0 or {通道编号}=@通道编号#) and {体外指令标志} = 《体外指令标志-体内》 and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单序号#=0 or {记录序号}=@订单序号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) and (@价格类型串#=" " or instr(@价格类型串#, concat(";",{价格类型},";"))>0) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,update_times from db_tdsecu_his.tb_tdsetd_order_his where (order_date between v_begin_date and v_end_date) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and exter_comm_flag = 1 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and row_id>v_row_id order by row_id;
    else
        select row_id,opor_co_no,opor_no,oper_mac,oper_ip_addr,oper_info,oper_way,init_date,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,exch_no,stock_acco_no,stock_code_no,asset_type,stock_type,comm_opor,external_no,comm_id,comm_batch_no,report_date,report_time,report_no,order_batch_no,row_id as order_id,order_date,order_time,order_dir,price_type,order_price,order_qty,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag,order_frozen_amt,order_frozen_qty,rsp_info,compli_trig_id,remark_info,order_oper_way,update_times from db_tdsecu_his.tb_tdsetd_order_his where (order_date between v_begin_date and v_end_date) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and exter_comm_flag = 1 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_order_id=0 or row_id=v_order_id) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_order_status_str=" " or instr(v_order_status_str, concat(";",order_status,";"))>0) and (v_price_type_str=" " or instr(v_price_type_str, concat(";",price_type,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询订单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryOrderRsp(
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
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_order_dir_str varchar(1024),
    IN p_order_rsp_status_str varchar(64),
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
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_order_dir_str varchar(1024);
    declare v_order_rsp_status_str varchar(64);
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
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_rsp_status_str = p_order_rsp_status_str;
    SET v_deal_status_str = p_deal_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_报盘_订单回报表][字段][(@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@股东代码#=" " or {股东代码}=@股东代码#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@订单回报状态串#=" " or instr(@订单回报状态串#,concat(";",{订单回报状态},";"))>0) and (@处理状态串#=" " or instr(@处理状态串#,concat(";",{处理状态},";"))>0) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, order_price, 
        order_qty, price_type, order_rsp_status, rsp_info, 
        deal_status, record_valid_flag, contra_no from db_tdsecu.tb_tdserp_orderrsp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_acco=" " or stock_acco=v_stock_acco) and (v_stock_code=" " or stock_code=v_stock_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_order_rsp_status_str=" " or instr(v_order_rsp_status_str,concat(";",order_rsp_status,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, order_price, 
        order_qty, price_type, order_rsp_status, rsp_info, 
        deal_status, record_valid_flag, contra_no from db_tdsecu.tb_tdserp_orderrsp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_acco=" " or stock_acco=v_stock_acco) and (v_stock_code=" " or stock_code=v_stock_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_order_rsp_status_str=" " or instr(v_order_rsp_status_str,concat(";",order_rsp_status,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryStrikeRsp(
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
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
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
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
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
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_deal_status_str = p_deal_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_报盘_成交回报表][字段][(@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@股东代码#=" " or {股东代码}=@股东代码#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@处理状态串#=" " or instr(@处理状态串#,concat(";",{处理状态},";"))>0) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info, 
        deal_status, sett_flag, record_valid_flag, asset_acco_type from db_tdsecu.tb_tdserp_strikersp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_acco=" " or stock_acco=v_stock_acco) and (v_stock_code=" " or stock_code=v_stock_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info, 
        deal_status, sett_flag, record_valid_flag, asset_acco_type from db_tdsecu.tb_tdserp_strikersp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_acco=" " or stock_acco=v_stock_acco) and (v_stock_code=" " or stock_code=v_stock_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryStrikeDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryStrikeDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_order_oper_way_str varchar(1024),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_exter_comm_flag int,
    IN p_record_valid_flag int,
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
    declare v_order_oper_way_str varchar(1024);
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;

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
    SET v_order_oper_way_str = p_order_oper_way_str;
    SET v_co_no = p_co_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_record_valid_flag = p_record_valid_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_报盘_成交表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号串#=" " or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and (@记录有效标志# = 0 or {记录有效标志}=@记录有效标志#) and  (@订单操作方式串#=" " or instr(@订单操作方式串#, concat(";",{订单操作方式},";"))>0) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#,concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            init_date, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, exch_no, 
            stock_acco_no, stock_code, stock_code_no, stock_type, 
            asset_type, comm_id, comm_batch_no, strike_date, 
            strike_time, strike_no, report_date, report_no, 
            order_date, order_time, order_batch_no, order_id, 
            order_dir, order_price, order_qty, strike_qty, 
            strike_price, strike_amt, all_fee, stamp_tax, 
            trans_fee, brkage_fee, SEC_charges, other_fee, 
            trade_commis, other_commis, trade_tax, trade_cost_fee, 
            trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
            par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
            strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
            exter_comm_flag, record_valid_flag, external_no, combo_code, 
            asset_acco_type from db_tdsecu.tb_tdserp_strike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and  (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            init_date, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, exch_no, 
            stock_acco_no, stock_code, stock_code_no, stock_type, 
            asset_type, comm_id, comm_batch_no, strike_date, 
            strike_time, strike_no, report_date, report_no, 
            order_date, order_time, order_batch_no, order_id, 
            order_dir, order_price, order_qty, strike_qty, 
            strike_price, strike_amt, all_fee, stamp_tax, 
            trans_fee, brkage_fee, SEC_charges, other_fee, 
            trade_commis, other_commis, trade_tax, trade_cost_fee, 
            trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
            par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
            strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
            exter_comm_flag, record_valid_flag, external_no, combo_code, 
            asset_acco_type from db_tdsecu.tb_tdserp_strike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and  (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_报盘_成交表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号串#=" " or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and (@记录有效标志# = 0 or {记录有效标志}=@记录有效标志#) and  (@订单操作方式串#=" " or instr(@订单操作方式串#, concat(";",{订单操作方式},";"))>0) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#,concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            init_date, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, exch_no, 
            stock_acco_no, stock_code, stock_code_no, stock_type, 
            asset_type, comm_id, comm_batch_no, strike_date, 
            strike_time, strike_no, report_date, report_no, 
            order_date, order_time, order_batch_no, order_id, 
            order_dir, order_price, order_qty, strike_qty, 
            strike_price, strike_amt, all_fee, stamp_tax, 
            trans_fee, brkage_fee, SEC_charges, other_fee, 
            trade_commis, other_commis, trade_tax, trade_cost_fee, 
            trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
            par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
            strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
            exter_comm_flag, record_valid_flag, external_no, combo_code, 
            asset_acco_type from db_tdsecu.tb_tdserp_strike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and  (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and row_id<v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            init_date, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, exch_no, 
            stock_acco_no, stock_code, stock_code_no, stock_type, 
            asset_type, comm_id, comm_batch_no, strike_date, 
            strike_time, strike_no, report_date, report_no, 
            order_date, order_time, order_batch_no, order_id, 
            order_dir, order_price, order_qty, strike_qty, 
            strike_price, strike_amt, all_fee, stamp_tax, 
            trans_fee, brkage_fee, SEC_charges, other_fee, 
            trade_commis, other_commis, trade_tax, trade_cost_fee, 
            trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
            par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
            strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
            exter_comm_flag, record_valid_flag, external_no, combo_code, 
            asset_acco_type from db_tdsecu.tb_tdserp_strike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and  (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询成交明细历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryStrikeDetail_His;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryStrikeDetail_His(
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
    IN p_order_oper_way_str varchar(1024),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_exter_comm_flag int,
    IN p_record_valid_flag int,
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
    declare v_order_oper_way_str varchar(1024);
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;

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
    SET v_order_oper_way_str = p_order_oper_way_str;
    SET v_co_no = p_co_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_record_valid_flag = p_record_valid_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_交易证券_报盘_成交表][字段][ ({初始化日期} between @开始日期# and @结束日期#) and (@订单操作方式串#=" " or instr(@订单操作方式串#, concat(";",{订单操作方式},";"))>0) and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号串#=" " or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and (@记录有效标志# = 0 or {记录有效标志}=@记录有效标志#) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#,concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, comm_id, comm_batch_no, strike_date, 
        strike_time, strike_no, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_price, strike_amt, all_fee, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
        par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
        strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
        exter_comm_flag, record_valid_flag, external_no, combo_code, 
        asset_acco_type from db_tdsecu_his.tb_tdserp_strike_his where  (init_date between v_begin_date and v_end_date) and (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, comm_id, comm_batch_no, strike_date, 
        strike_time, strike_no, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_price, strike_amt, all_fee, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
        par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
        strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
        exter_comm_flag, record_valid_flag, external_no, combo_code, 
        asset_acco_type from db_tdsecu_his.tb_tdserp_strike_his where  (init_date between v_begin_date and v_end_date) and (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询机构统计订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryConoOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryConoOrder(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易证券_交易_订单表][{记录序号},{机构编号},{订单状态},{订单操作方式}][1=1][@指定行数#] */
    if v_row_count = -1 then
        select row_id,co_no,order_status,order_oper_way from db_tdsecu.tb_tdsetd_order where 1=1;
    else
        select row_id,co_no,order_status,order_oper_way from db_tdsecu.tb_tdsetd_order where 1=1 limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_补单关联原订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_AppendOrderAssociatedOriginalOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_AppendOrderAssociatedOriginalOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id bigint,
    IN p_new_order_id bigint,
    IN p_order_batch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_append_exch_group_no int,
    OUT p_order_append_frozen_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_order_status varchar(2),
    OUT p_comm_batch_no int,
    OUT p_wtdraw_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_order_id bigint;
    declare v_new_order_id bigint;
    declare v_order_batch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_append_exch_group_no int;
    declare v_order_append_frozen_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_order_status varchar(2);
    declare v_comm_batch_no int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_opor int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_cost_calc_type int;
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_sett_flag int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_contra_no varchar(32);
    declare v_asset_acco_type int;
    declare v_exist_debt_flag int;
    declare v_busi_opor_no int;
    declare v_tmp_order_oper_way varchar(2);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_wtdraw_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_new_order_no int;
    declare v_tmp_buy_strike_qty decimal(18,2);
    declare v_tmp_buy_strike_amt decimal(18,4);
    declare v_tmp_sell_strike_qty decimal(18,2);
    declare v_tmp_sell_strike_amt decimal(18,4);
    declare v_order_sum_status varchar(2);
    declare v_waste_qty decimal(18,2);
    declare v_strike_aver_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_date int;
    declare v_occur_amt decimal(18,4);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_time int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_comm_sum_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_max_comm_comple_date int;
    declare v_max_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_qty decimal(18,2);
    declare v_comm_sum_approve_status varchar(2);
    declare v_basket_id bigint;
    declare v_buy_order_qty decimal(18,2);
    declare v_sell_order_qty decimal(18,2);
    declare v_buy_comm_qty decimal(18,2);
    declare v_sell_comm_qty decimal(18,2);
    declare v_buy_strike_qty decimal(18,2);
    declare v_sell_strike_qty decimal(18,2);
    declare v_buy_strike_amt decimal(18,4);
    declare v_sell_strike_amt decimal(18,4);
    declare v_buy_comm_amt decimal(18,4);
    declare v_sell_comm_amt decimal(18,4);
    declare v_comm_oper_way varchar(2);
    declare v_comm_remark_info varchar(1024);
    declare v_read_flag int;
    declare v_acco_concat_info varchar(4096);

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
    SET v_order_id = p_order_id;
    SET v_new_order_id = p_new_order_id;
    SET v_order_batch_no = p_order_batch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_append_exch_group_no = 0;
    SET v_order_append_frozen_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_order_status = "0";
    SET v_comm_batch_no = 0;
    SET v_wtdraw_qty = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_opor = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_impawn_ratio = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_cost_calc_type = 0;
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_sett_flag = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;
    SET v_busi_opor_no = 0;
    SET v_tmp_order_oper_way = " ";
    SET v_tmp_strike_qty = 0;
    SET v_tmp_wtdraw_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_new_order_no = 0;
    SET v_tmp_buy_strike_qty = 0;
    SET v_tmp_buy_strike_amt = 0;
    SET v_tmp_sell_strike_qty = 0;
    SET v_tmp_sell_strike_amt = 0;
    SET v_order_sum_status = "0";
    SET v_waste_qty = 0;
    SET v_strike_aver_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_occur_amt = 0;
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_await_cancel_qty = 0;
    SET v_strike_status = "0";
    SET v_comm_sum_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_max_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_max_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_qty = 0;
    SET v_comm_sum_approve_status = "0";
    SET v_basket_id = 0;
    SET v_buy_order_qty = 0;
    SET v_sell_order_qty = 0;
    SET v_buy_comm_qty = 0;
    SET v_sell_comm_qty = 0;
    SET v_buy_strike_qty = 0;
    SET v_sell_strike_qty = 0;
    SET v_buy_strike_amt = 0;
    SET v_sell_strike_amt = 0;
    SET v_buy_comm_amt = 0;
    SET v_sell_comm_amt = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_remark_info = " ";
    SET v_read_flag = 0;
    SET v_acco_concat_info = " ";

    
    label_pro:BEGIN
    
    #找到原订单A这条订单记录，更新订单状态，补填订单记录的申报编号，申报日期和时间等字段

    /* [锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{记录序号} = @订单序号#][1][concat("获取订单表失败,订单编号=",@订单序号#)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, external_no, 
        comm_id, comm_batch_no, comm_opor, report_date, 
        report_time, report_no, order_date, order_time, 
        order_batch_no, order_dir, price_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_amt, 
        strike_qty, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, strike_bond_accr_intrst, impawn_ratio, 
        order_frozen_amt, order_frozen_qty, rsp_info, compli_trig_id, 
        remark_info, cost_calc_type, order_oper_way, exter_comm_flag, 
        record_valid_flag, combo_code, combo_posi_id, strategy_id, 
        sett_flag, target_stock_code, target_stock_code_no, registration_agency, 
        trade_acco, contra_no, asset_acco_type, exist_debt_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_stock_acco_no, 
        v_stock_acco, v_stock_code_no, v_stock_code, v_trade_code_no, 
        v_target_code_no, v_stock_type, v_asset_type, v_external_no, 
        v_comm_id, v_comm_batch_no, v_comm_opor, v_report_date, 
        v_report_time, v_report_no, v_order_date, v_order_time, 
        v_order_batch_no, v_order_dir, v_price_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_amt, 
        v_strike_qty, v_all_fee, v_stamp_tax, v_trans_fee, 
        v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
        v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
        v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
        v_bond_accr_intrst, v_bond_rate_type, v_strike_bond_accr_intrst, v_impawn_ratio, 
        v_order_frozen_amt, v_order_frozen_qty, v_rsp_info, v_compli_trig_id, 
        v_remark_info, v_cost_calc_type, v_order_oper_way, v_exter_comm_flag, 
        v_record_valid_flag, v_combo_code, v_combo_posi_id, v_strategy_id, 
        v_sett_flag, v_target_stock_code, v_target_stock_code_no, v_registration_agency, 
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where row_id = v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.10.56.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("获取订单表失败,订单编号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("获取订单表失败,订单编号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;

    /* set @临时_订单操作方式# = @订单操作方式#; */
    set v_tmp_order_oper_way = v_order_oper_way;
     #判断订单A的状态，如果不是正报或者废单，就报错返回，【撤单数量，成交数量，申报编号】都必须为0

    /* [检查报错返回][(@撤单数量# <>0 or @成交数量# <>0) ][206]["订单状态为已报，处理失败，撤单数量，成交数量都必须为0"] */
    if (v_wtdraw_qty <>0 or v_strike_qty <>0)  then
        
        SET v_error_code = "tdsecuA.10.56.206";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("订单状态为已报，处理失败，撤单数量，成交数量都必须为0","#",v_mysql_message);
        else
            SET v_error_info = "订单状态为已报，处理失败，撤单数量，成交数量都必须为0";
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@申报编号# <>' ' ][206]["处理失败，订单状态必须为正报，申报编号都必须为空"] */
    if v_report_no <>' '  then
        
        SET v_error_code = "tdsecuA.10.56.206";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("处理失败，订单状态必须为正报，申报编号都必须为空","#",v_mysql_message);
        else
            SET v_error_info = "处理失败，订单状态必须为正报，申报编号都必须为空";
        end if;
        leave label_pro;
    end if;

    #找到补单B这条订单记录，更新订单状态为废单，清空订单记录的申报编号，申报日期和时间

    /* [锁定获取表记录变量][交易证券_交易_订单表][{申报编号}, {申报日期}, {申报时间},{机构编号},{产品编号},{交易组编号},{证券代码},{市场编号},{资产账户编号},{股东代码编号},{订单状态},{撤单数量},{成交金额},{成交数量},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{交易征费},{交易费},{交易系统使用费},{股份交收费},{债券计提利息},{成交债券计提利息},{订单冻结金额},{订单操作方式},{净价标志},{计息天数}][@申报编号#, @申报日期#, @申报时间#, @机构编号#, @产品编号#,@补单交易组编号#, @证券代码#, @市场编号#, @资产账户编号#, @股东代码编号#,@订单状态#,@撤单数量#,@成交金额#,@成交数量#,@全部费用#,@印花税#,@过户费#,@经手费#,@证管费#,@其他费用#,@交易佣金#,@其他佣金#,@交易征费#,@交易费#,@交易系统使用费#,@股份交收费#,@债券计提利息#,@成交债券计提利息#,@补单订单冻结金额#,@订单操作方式#,@净价标志#,@计息天数#][{记录序号} = @新订单序号#][1][concat("获取订单表失败,订单编号=",@新订单序号#)] */
    select report_no, report_date, report_time,co_no,pd_no,exch_group_no,stock_code,exch_no,asset_acco_no,stock_acco_no,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,trade_tax,trade_cost_fee,trade_system_use_fee,stock_settle_fee,bond_accr_intrst,strike_bond_accr_intrst,order_frozen_amt,order_oper_way,net_price_flag,intrst_days into v_report_no, v_report_date, v_report_time, v_co_no, v_pd_no,v_order_append_exch_group_no, v_stock_code, v_exch_no, v_asset_acco_no, v_stock_acco_no,v_order_status,v_wtdraw_qty,v_strike_amt,v_strike_qty,v_all_fee,v_stamp_tax,v_trans_fee,v_brkage_fee,v_SEC_charges,v_other_fee,v_trade_commis,v_other_commis,v_trade_tax,v_trade_cost_fee,v_trade_system_use_fee,v_stock_settle_fee,v_bond_accr_intrst,v_strike_bond_accr_intrst,v_order_append_frozen_amt,v_order_oper_way,v_net_price_flag,v_intrst_days from db_tdsecu.tb_tdsetd_order where row_id = v_new_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.10.56.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("获取订单表失败,订单编号=",v_new_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("获取订单表失败,订单编号=",v_new_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @临时_撤单数量# = @撤单数量#; */
    set v_tmp_wtdraw_qty = v_wtdraw_qty;

    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;
    #判断补单B的状态，如果#1:未报 a:待报 b:正报，-1:待审批 ，#4:已撤 -2:审批拒绝 8:废单，就报错返回，操作方式为报盘机补单

    /* [检查报错返回][@订单状态# = '1' or @订单状态# = 'a' or @订单状态# = 'b' or @订单状态# = '-1' or @订单状态# = '4' or @订单状态# = '-2' or @订单状态# = '8' or @订单操作方式# !=《订单操作方式-报盘机补单》][207][concat("处理失败，补单状态不能为未报、待报、正报、待审批、已撤、审批拒绝、废单, 订单状态 = ", @订单状态#,"订单编号=",@新订单序号#,"订单操作方式=",@订单操作方式#)] */
    if v_order_status = '1' or v_order_status = 'a' or v_order_status = 'b' or v_order_status = '-1' or v_order_status = '4' or v_order_status = '-2' or v_order_status = '8' or v_order_oper_way !="33" then
        
        SET v_error_code = "tdsecuA.10.56.207";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("处理失败，补单状态不能为未报、待报、正报、待审批、已撤、审批拒绝、废单, 订单状态 = ", v_order_status,"订单编号=",v_new_order_id,"订单操作方式=",v_order_oper_way),"#",v_mysql_message);
        else
            SET v_error_info = concat("处理失败，补单状态不能为未报、待报、正报、待审批、已撤、审批拒绝、废单, 订单状态 = ", v_order_status,"订单编号=",v_new_order_id,"订单操作方式=",v_order_oper_way);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_交易_订单表][{申报编号} = 0,{申报日期}=0,{申报时间}=0,{记录有效标志}=《记录有效标志-无效》,{订单状态} = 8,{撤单数量} = @订单数量#,{成交数量} = 0,{成交金额} = 0,{全部费用}=0,{印花税}=0,{过户费}=0,{经手费}=0,{证管费}=0,{其他费用}=0,{交易佣金}=0,{其他佣金}=0,{交易征费}=0,{交易费}=0,{交易系统使用费}=0,{股份交收费}=0][{记录序号}=@新订单序号#][2][concat("更新订单表失败,订单编号=",@新订单编号#)] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, report_no = 0,report_date=0,report_time=0,record_valid_flag=2,order_status = 8,wtdraw_qty = v_order_qty,strike_qty = 0,strike_amt = 0,all_fee=0,stamp_tax=0,trans_fee=0,brkage_fee=0,SEC_charges=0,other_fee=0,trade_commis=0,other_commis=0,trade_tax=0,trade_cost_fee=0,trade_system_use_fee=0,stock_settle_fee=0 where row_id=v_new_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.10.56.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("更新订单表失败,订单编号=",v_new_order_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("更新订单表失败,订单编号=",v_new_order_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_交易_订单表][{申报编号} = @申报编号#,{申报日期}=@申报日期#,{申报时间}=@申报时间#,{订单状态}=@订单状态#,{撤单数量}=@撤单数量#,{成交金额}=@成交金额#,{成交数量}=@成交数量#,{全部费用}=@全部费用#,{印花税}=@印花税#,{过户费}=@过户费#,{经手费}=@经手费#,{证管费}=@证管费#,{其他费用}=@其他费用#,{交易佣金}=@交易佣金#,{其他佣金}=@其他佣金#,{交易征费}=@交易征费#,{交易费}=@交易费#,{交易系统使用费}=@交易系统使用费#,{股份交收费}=@股份交收费#,{债券计提利息}=@债券计提利息#,{成交债券计提利息}=@成交债券计提利息#,{订单冻结金额}=@补单订单冻结金额#,{净价标志}=@净价标志#,{计息天数}=@计息天数#][{记录序号}=@订单序号#][2][concat("更新订单表失败,订单编号=",@订单序号#)] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, report_no = v_report_no,report_date=v_report_date,report_time=v_report_time,order_status=v_order_status,wtdraw_qty=v_wtdraw_qty,strike_amt=v_strike_amt,strike_qty=v_strike_qty,all_fee=v_all_fee,stamp_tax=v_stamp_tax,trans_fee=v_trans_fee,brkage_fee=v_brkage_fee,SEC_charges=v_SEC_charges,other_fee=v_other_fee,trade_commis=v_trade_commis,other_commis=v_other_commis,trade_tax=v_trade_tax,trade_cost_fee=v_trade_cost_fee,trade_system_use_fee=v_trade_system_use_fee,stock_settle_fee=v_stock_settle_fee,bond_accr_intrst=v_bond_accr_intrst,strike_bond_accr_intrst=v_strike_bond_accr_intrst,order_frozen_amt=v_order_append_frozen_amt,net_price_flag=v_net_price_flag,intrst_days=v_intrst_days where row_id=v_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.10.56.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("更新订单表失败,订单编号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("更新订单表失败,订单编号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* if @订单方向#=《订单方向-买入》 or @订单方向# = 《订单方向-融资买入》  then */
    if v_order_dir=1 or v_order_dir = 5  then

        /* set @临时_买入成交数量# = @成交数量#; */
        set v_tmp_buy_strike_qty = v_strike_qty;

        /* set @临时_买入成交金额# = @成交金额#; */
        set v_tmp_buy_strike_amt = v_strike_amt;
    else

        /* set @临时_卖出成交数量# = @成交数量#; */
        set v_tmp_sell_strike_qty = v_strike_qty;

        /* set @临时_卖出成交金额# = @成交金额#; */
        set v_tmp_sell_strike_amt = v_strike_amt;
    end if;

    /* if @订单批号# >0  then */
    if v_order_batch_no >0  then

        /* [更新表记录][交易证券_交易_订单汇总表][{撤单数量}={撤单数量}+@撤单数量#,{成交金额}={成交金额}+@成交金额#,{成交数量}={成交数量}+@成交数量#,{全部费用}={全部费用}+@全部费用#,{印花税}={印花税}+@印花税#,{过户费}={过户费}+@过户费#,{经手费}={经手费}+@经手费#,{证管费}={证管费}+@证管费#,{其他费用}={其他费用}+@其他费用#,{交易佣金}={交易佣金}+@交易佣金#,{其他佣金}={其他佣金}+@其他佣金#,{交易征费}={交易征费}+@交易征费#,{交易费}={交易费}+@交易费#,{交易系统使用费}={交易系统使用费}+@交易系统使用费#,{股份交收费}={股份交收费}+@股份交收费#,{成交债券计提利息}={成交债券计提利息}+@成交债券计提利息#][{订单批号}=@订单批号# and {机构编号} = @机构编号# and {订单日期}=@订单日期#][2][concat("更新订单表失败,订单批号=",@订单批号#)] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdsetd_sumorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, wtdraw_qty=wtdraw_qty+v_wtdraw_qty,strike_amt=strike_amt+v_strike_amt,strike_qty=strike_qty+v_strike_qty,all_fee=all_fee+v_all_fee,stamp_tax=stamp_tax+v_stamp_tax,trans_fee=trans_fee+v_trans_fee,brkage_fee=brkage_fee+v_brkage_fee,SEC_charges=SEC_charges+v_SEC_charges,other_fee=other_fee+v_other_fee,trade_commis=trade_commis+v_trade_commis,other_commis=other_commis+v_other_commis,trade_tax=trade_tax+v_trade_tax,trade_cost_fee=trade_cost_fee+v_trade_cost_fee,trade_system_use_fee=trade_system_use_fee+v_trade_system_use_fee,stock_settle_fee=stock_settle_fee+v_stock_settle_fee,strike_bond_accr_intrst=strike_bond_accr_intrst+v_strike_bond_accr_intrst where order_batch_no=v_order_batch_no and co_no = v_co_no and order_date=v_order_date;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.10.56.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("更新订单表失败,订单批号=",v_order_batch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("更新订单表失败,订单批号=",v_order_batch_no);
            end if;
            leave label_pro;
        end if;


        /* [锁定获取表记录变量][交易证券_交易_订单汇总表][字段][字段变量][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#][4][@订单日期#, @机构编号#, @订单批号#] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            exch_crncy_type, exch_no, stock_code_no, stock_code, 
            trade_code_no, target_code_no, stock_type, asset_type, 
            external_no, order_date, order_batch_no, order_dir, 
            price_type, order_price, order_qty, order_sum_status, 
            wtdraw_qty, waste_qty, strike_amt, strike_qty, 
            strike_aver_price, all_fee, stamp_tax, trans_fee, 
            brkage_fee, SEC_charges, other_fee, trade_commis, 
            other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
            stock_settle_fee, net_price_flag, intrst_days, par_value, 
            bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
            order_oper_way, exter_comm_flag, record_valid_flag into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_opor_co_no, 
            v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
            v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
            v_exch_crncy_type, v_exch_no, v_stock_code_no, v_stock_code, 
            v_trade_code_no, v_target_code_no, v_stock_type, v_asset_type, 
            v_external_no, v_order_date, v_order_batch_no, v_order_dir, 
            v_price_type, v_order_price, v_order_qty, v_order_sum_status, 
            v_wtdraw_qty, v_waste_qty, v_strike_amt, v_strike_qty, 
            v_strike_aver_price, v_all_fee, v_stamp_tax, v_trans_fee, 
            v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
            v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
            v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
            v_bond_accr_intrst, v_bond_rate_type, v_impawn_ratio, v_strike_bond_accr_intrst, 
            v_order_oper_way, v_exter_comm_flag, v_record_valid_flag from db_tdsecu.tb_tdsetd_sumorder where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no limit 1 for update;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.10.56.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no);
            end if;
            leave label_pro;
        end if;


        /* 调用【原子_交易证券_公用_计算订单汇总状态】*/
        call db_tdsecu.pra_tdsepb_CaclOrderSumStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_qty,
            v_wtdraw_qty,
            v_strike_qty,
            v_waste_qty,
            v_error_code,
            v_error_info,
            v_order_sum_status);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.10.56.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单汇总状态出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* [更新表记录][交易证券_交易_订单汇总表][{订单汇总状态}=@订单汇总状态#][{订单批号}=@订单批号# and {机构编号} = @机构编号# and {订单日期}=@订单日期#][2][concat("更新订单表失败,订单批号=",@订单批号#)] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdsetd_sumorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_sum_status=v_order_sum_status where order_batch_no=v_order_batch_no and co_no = v_co_no and order_date=v_order_date;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.10.56.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("更新订单表失败,订单批号=",v_order_batch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("更新订单表失败,订单批号=",v_order_batch_no);
            end if;
            leave label_pro;
        end if;

    end if;
    #更新指令表

    /* set @成交数量# = @临时_成交数量#; */
    set v_strike_qty = v_tmp_strike_qty;

    /* set @撤单数量# = @临时_撤单数量#; */
    set v_wtdraw_qty = v_tmp_wtdraw_qty;

    /* set @成交金额# = @临时_成交金额#; */
    set v_strike_amt = v_tmp_strike_amt;

    /* if (@指令序号# >0) then */
    if (v_comm_id >0) then

      /* [获取表记录变量][交易证券_指令_指令表][{指令实际限价},{指令日期}][@指令实际限价#,@指令日期#][{记录序号}=@指令序号#][1][concat("获取指令表失败,指令序号=",@指令序号#)] */
      select limit_actual_price,comm_date into v_limit_actual_price,v_comm_date from db_tdsecu.tb_tdseap_command where row_id=v_comm_id limit 1;
      if FOUND_ROWS() = 0 then
                  
          SET v_error_code = "tdsecuA.10.56.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("获取指令表失败,指令序号=",v_comm_id),"#",v_mysql_message);
          else
              SET v_error_info = concat("获取指令表失败,指令序号=",v_comm_id);
          end if;
          leave label_pro;
      end if;


      /* if @净价标志# = 《净价标志-净价》 then */
      if v_net_price_flag = 1 then

        /* set @变动金额# = @撤单数量# * (@指令实际限价# + @债券计提利息#); */
        set v_occur_amt = v_wtdraw_qty * (v_limit_actual_price + v_bond_accr_intrst);
      else

        /* set @变动金额# = @撤单数量# * @指令实际限价#; */
        set v_occur_amt = v_wtdraw_qty * v_limit_actual_price;
      end if;

      /* [更新表记录][交易证券_指令_指令表][{订单数量} = {订单数量} - @撤单数量#,{指令冻结金额} = case when ({指令方向} = 1 or {指令方向} = 4) and {指令状态} not in ("4", "5","6") then {指令冻结金额} + @变动金额# else {指令冻结金额} end,{成交数量} = {成交数量}  + @成交数量#,{成交金额}= {成交金额} + @成交金额#,{成交状态}=case when {指令数量} = {成交数量} then "3"
when {指令数量} > {成交数量} then "2" else {成交状态} end,{指令状态} = case when {指令数量} = {订单数量} and {指令状态} not in ("4", "5","6") then "3"
             when {订单数量} = 0 and {指令状态} not in ("4", "5","6","7") then "1"
             when {指令数量} > {订单数量} + {指令撤销数量} and {指令状态} not in ("4", "5","6","7") then "2"
    when {指令数量} = {指令撤销数量} then "6"
    when {指令数量} > {指令撤销数量} and {指令撤销数量} > 0 then "5"
             else {指令状态}
             end,{指令完成日期} = case when {指令数量} - {指令撤销数量} - {成交数量} = 0 then @指令完成日期# else 0 end,{指令完成时间} = case when {指令数量} - {指令撤销数量} - {成交数量} = 0 then @指令完成时间# else 0 end,{指令完成标志}= case when {指令数量} - {指令撤销数量} - {成交数量} = 0 then 《指令完成标志-已完成》 else 《指令完成标志-未完成》 end][{记录序号}=@指令序号#][2][concat("更新指令表失败,指令序号=",@指令序号#)] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_tdsecu.tb_tdseap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_qty = order_qty - v_wtdraw_qty,comm_frozen_amt = case when (comm_dir = 1 or comm_dir = 4) and comm_status not in ("4", "5","6") then comm_frozen_amt + v_occur_amt else comm_frozen_amt end,strike_qty = strike_qty  + v_strike_qty,strike_amt= strike_amt + v_strike_amt,strike_status=case when comm_qty = strike_qty then "3"
      when comm_qty > strike_qty then "2" else strike_status end,comm_status = case when comm_qty = order_qty and comm_status not in ("4", "5","6") then "3"
                   when order_qty = 0 and comm_status not in ("4", "5","6","7") then "1"
                   when comm_qty > order_qty + comm_cancel_qty and comm_status not in ("4", "5","6","7") then "2"
          when comm_qty = comm_cancel_qty then "6"
          when comm_qty > comm_cancel_qty and comm_cancel_qty > 0 then "5"
                   else comm_status
                   end,comm_comple_date = case when comm_qty - comm_cancel_qty - strike_qty = 0 then v_comm_comple_date else 0 end,comm_comple_time = case when comm_qty - comm_cancel_qty - strike_qty = 0 then v_comm_comple_time else 0 end,comm_comple_flag= case when comm_qty - comm_cancel_qty - strike_qty = 0 then 2 else 1 end where row_id=v_comm_id;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdsecuA.10.56.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("更新指令表失败,指令序号=",v_comm_id),"#",v_mysql_message);
          else
              SET v_error_info = concat("更新指令表失败,指令序号=",v_comm_id);
          end if;
          leave label_pro;
      end if;


        /* if @指令批号# > 0 then */
        if v_comm_batch_no > 0 then

            /* [更新表记录][交易证券_指令_指令汇总表][{订单数量} = {订单数量} - @撤单数量#,{成交数量} = {成交数量}  + @成交数量#,{成交金额}= {成交金额} + @成交金额#,{买入成交数量} = {买入成交数量}+@临时_买入成交数量#,{买入成交金额} = {买入成交金额} +@临时_买入成交金额#,{卖出成交数量} = {卖出成交数量}+@临时_卖出成交数量#,{卖出成交金额} = {卖出成交金额}+@临时_卖出成交金额#][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号#][2][concat("更新指令汇总表失败,指令批号=",@指令批号#)] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseap_sumcommand set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_qty = order_qty - v_wtdraw_qty,strike_qty = strike_qty  + v_strike_qty,strike_amt= strike_amt + v_strike_amt,buy_strike_qty = buy_strike_qty+v_tmp_buy_strike_qty,buy_strike_amt = buy_strike_amt +v_tmp_buy_strike_amt,sell_strike_qty = sell_strike_qty+v_tmp_sell_strike_qty,sell_strike_amt = sell_strike_amt+v_tmp_sell_strike_amt where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.10.56.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("更新指令汇总表失败,指令批号=",v_comm_batch_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("更新指令汇总表失败,指令批号=",v_comm_batch_no);
                end if;
                leave label_pro;
            end if;


            /* [锁定获取表记录变量][交易证券_指令_指令汇总表][字段][字段变量][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号#][1][@指令日期#, @机构编号#, @指令批号#] */
            select row_id, create_date, create_time, 
                update_date, update_time, update_times, opor_co_no, 
                opor_no, oper_mac, oper_ip_addr, oper_info, 
                oper_way, oper_func_code, init_date, co_no, 
                pd_no, exch_group_no, asset_acco_no, pass_no, 
                out_acco, exch_crncy_type, exch_no, stock_code_no, 
                stock_code, target_code_no, trade_code_no, stock_type, 
                asset_type, comm_date, comm_time, comm_batch_no, 
                comm_opor, comm_executor, comm_dir, comm_limit_price, 
                limit_actual_price, comm_qty, comm_amt, order_qty, 
                comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
                net_price_flag, par_value, impawn_ratio, intrst_days, 
                bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
                comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
                comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
                comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
                basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
                sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
                sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
                exter_comm_flag, comm_remark_info, read_flag, acco_concat_info into v_row_id, v_create_date, v_create_time, 
                v_update_date, v_update_time, v_update_times, v_opor_co_no, 
                v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
                v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
                v_out_acco, v_exch_crncy_type, v_exch_no, v_stock_code_no, 
                v_stock_code, v_target_code_no, v_trade_code_no, v_stock_type, 
                v_asset_type, v_comm_date, v_comm_time, v_comm_batch_no, 
                v_comm_opor, v_comm_executor, v_comm_dir, v_comm_limit_price, 
                v_limit_actual_price, v_comm_qty, v_comm_amt, v_order_qty, 
                v_comm_cancel_qty, v_comm_await_cancel_qty, v_strike_amt, v_strike_qty, 
                v_net_price_flag, v_par_value, v_impawn_ratio, v_intrst_days, 
                v_bond_accr_intrst, v_bond_rate_type, v_strike_status, v_comm_sum_status, 
                v_comm_begin_date, v_comm_end_date, v_comm_begin_time, v_comm_end_time, 
                v_comm_comple_date, v_comm_comple_time, v_max_comm_comple_date, v_max_comm_comple_time, 
                v_comm_appr_date, v_comm_appr_time, v_comm_appr_qty, v_comm_sum_approve_status, 
                v_basket_id, v_buy_order_qty, v_sell_order_qty, v_buy_comm_qty, 
                v_sell_comm_qty, v_buy_strike_qty, v_sell_strike_qty, v_buy_strike_amt, 
                v_sell_strike_amt, v_buy_comm_amt, v_sell_comm_amt, v_comm_oper_way, 
                v_exter_comm_flag, v_comm_remark_info, v_read_flag, v_acco_concat_info from db_tdsecu.tb_tdseap_sumcommand where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no limit 1 for update;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "tdsecuA.10.56.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no);
                end if;
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_公用_计算指令汇总状态】*/
            call db_tdsecu.pra_tdsepb_CaclCommSumStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_comm_qty,
                v_order_qty,
                v_comm_cancel_qty,
                v_comm_await_cancel_qty,
                v_strike_qty,
                v_error_code,
                v_error_info,
                v_comm_sum_status);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.10.56.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令汇总状态出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_公用_计算指令成交状态】*/
            call db_tdsecu.pra_tdsepb_CaclCommStrikeStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_comm_qty,
                v_strike_qty,
                v_comm_cancel_qty,
                v_error_code,
                v_error_info,
                v_strike_status,
                v_comm_comple_date,
                v_comm_comple_time);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.10.56.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令成交状态出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_指令_指令汇总表][{指令汇总状态}=@指令汇总状态#, {成交状态}=@成交状态#][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号#][2][@指令日期#, @机构编号#, @指令批号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseap_sumcommand set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, comm_sum_status=v_comm_sum_status, strike_status=v_strike_status where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.10.56.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no);
                end if;
                leave label_pro;
            end if;

        end if;
    end if;

    /* set @成交数量# = @临时_成交数量#; */
    set v_strike_qty = v_tmp_strike_qty;

    /* set @撤单数量# = @临时_撤单数量#; */
    set v_wtdraw_qty = v_tmp_wtdraw_qty;

    /* set @成交金额# = @临时_成交金额#; */
    set v_strike_amt = v_tmp_strike_amt;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_append_exch_group_no = v_order_append_exch_group_no;
    SET p_order_append_frozen_amt = v_order_append_frozen_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_order_status = v_order_status;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_wtdraw_qty = v_wtdraw_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_回溯成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_RollbackExecution;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_RollbackExecution(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id bigint,
    IN p_new_order_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_order_append_exch_group_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_order_qty decimal(18,2),
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_crncy_type varchar(3),
    IN p_invest_type int,
    IN p_wtdraw_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_net_price_flag int,
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_id bigint
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_order_id bigint;
    declare v_new_order_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_order_append_exch_group_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_order_qty decimal(18,2);
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_crncy_type varchar(3);
    declare v_invest_type int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_net_price_flag int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_id bigint;
    declare v_exter_comm_flag int;
    declare v_rsp_no int;
    declare v_rsp_id bigint;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_stock_code_no int;
    declare v_asset_type int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_batch_no int;
    declare v_order_price decimal(16,9);
    declare v_strike_price decimal(16,9);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_order_oper_way varchar(2);
    declare v_record_valid_flag int;
    declare v_external_no bigint;
    declare v_combo_code varchar(32);
    declare v_busi_opor_no int;
    declare v_asset_acco_type int;
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
    SET v_order_id = p_order_id;
    SET v_new_order_id = p_new_order_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_order_append_exch_group_no = p_order_append_exch_group_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_order_qty = p_order_qty;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_crncy_type = p_crncy_type;
    SET v_invest_type = p_invest_type;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_net_price_flag = p_net_price_flag;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_id = 0;
    SET v_exter_comm_flag = 0;
    SET v_rsp_no = 0;
    SET v_rsp_id = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_stock_code_no = 0;
    SET v_asset_type = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_batch_no = 0;
    SET v_order_price = 0;
    SET v_strike_price = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_order_oper_way = " ";
    SET v_record_valid_flag = 0;
    SET v_external_no = 0;
    SET v_combo_code = " ";
    SET v_busi_opor_no = 0;
    SET v_asset_acco_type = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #补插原订单的成交数据

    /* set @体外指令标志# = 1; */
    set v_exter_comm_flag = 1;

    /* set @回报编号# = 0; */
    set v_rsp_no = 0;

    /* set @回报序号# = 0 ; */
    set v_rsp_id = 0 ;

    /* [声明游标][交易证券_报盘_成交表][{操作员编号},
{初始化日期},
{机构编号},
{产品编号},
{交易组编号},
{资产账户编号},
{通道编号},
{外部账号},
{市场编号},
{股东代码编号},
{证券代码},
{证券代码编号},
{证券类型},
{资产类型},
{成交日期},
{成交时间},
{成交编号},
{申报日期},
{申报编号},
{订单日期},
{订单时间},
{订单批号},
{订单方向},
{订单价格},
{订单数量},
{成交数量},
{成交价格},
{成交金额},
{全部费用},
{印花税},
{过户费},
{经手费},
{证管费},
{其他费用},
{交易佣金},
{其他佣金},
{交易征费},
{交易费},
{交易系统使用费},
{股份交收费},
{净价标志},
{计息天数},
{票面面值},
{债券计提利息},
{债券利率类型},
{质押比例},
{成交债券计提利息},
{交易代码编号},
{标的代码编号},
{订单操作方式},
{体外指令标志},
{记录有效标志},
{外部编号},
{组合代码}
][{订单序号}= @新订单序号#][cursor_secu_execute] */
    cursor_secu_execute:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_secu_execute CURSOR FOR
        select opor_no,
    init_date,
    co_no,
    pd_no,
    exch_group_no,
    asset_acco_no,
    pass_no,
    out_acco,
    exch_no,
    stock_acco_no,
    stock_code,
    stock_code_no,
    stock_type,
    asset_type,
    strike_date,
    strike_time,
    strike_no,
    report_date,
    report_no,
    order_date,
    order_time,
    order_batch_no,
    order_dir,
    order_price,
    order_qty,
    strike_qty,
    strike_price,
    strike_amt,
    all_fee,
    stamp_tax,
    trans_fee,
    brkage_fee,
    SEC_charges,
    other_fee,
    trade_commis,
    other_commis,
    trade_tax,
    trade_cost_fee,
    trade_system_use_fee,
    stock_settle_fee,
    net_price_flag,
    intrst_days,
    par_value,
    bond_accr_intrst,
    bond_rate_type,
    impawn_ratio,
    strike_bond_accr_intrst,
    trade_code_no,
    target_code_no,
    order_oper_way,
    exter_comm_flag,
    record_valid_flag,
    external_no,
    combo_code
     
        from db_tdsecu.tb_tdserp_strike 
        where order_id= v_new_order_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@操作员编号#,
@初始化日期#,
@机构编号#,
@产品编号#,
@交易组编号#,
@资产账户编号#,
@通道编号#,
@外部账号#,
@市场编号#,
@股东代码编号#,
@证券代码#,
@证券代码编号#,
@证券类型#,
@资产类型#,
@成交日期#,
@成交时间#,
@成交编号#,
@申报日期#,
@申报编号#,
@订单日期#,
@订单时间#,
@订单批号#,
@订单方向#,
@订单价格#,
@订单数量#,
@成交数量#,
@成交价格#,
@成交金额#,
@全部费用#,
@印花税#,
@过户费#,
@经手费#,
@证管费#,
@其他费用#,
@交易佣金#,
@其他佣金#,
@交易征费#,
@交易费#,
@交易系统使用费#,
@股份交收费#,
@净价标志#,
@计息天数#,
@票面面值#,
@债券计提利息#,
@债券利率类型#,
@质押比例#,
@成交债券计提利息#,
@交易代码编号#,
@标的代码编号#,
@订单操作方式#,
@体外指令标志#,
@记录有效标志#,
@外部编号#,
@组合代码#
][cursor_secu_execute][loop_secu_execute] */
    open cursor_secu_execute;
    loop_secu_execute: LOOP
    fetch cursor_secu_execute into v_opor_no,
    v_init_date,
    v_co_no,
    v_pd_no,
    v_exch_group_no,
    v_asset_acco_no,
    v_pass_no,
    v_out_acco,
    v_exch_no,
    v_stock_acco_no,
    v_stock_code,
    v_stock_code_no,
    v_stock_type,
    v_asset_type,
    v_strike_date,
    v_strike_time,
    v_strike_no,
    v_report_date,
    v_report_no,
    v_order_date,
    v_order_time,
    v_order_batch_no,
    v_order_dir,
    v_order_price,
    v_order_qty,
    v_strike_qty,
    v_strike_price,
    v_strike_amt,
    v_all_fee,
    v_stamp_tax,
    v_trans_fee,
    v_brkage_fee,
    v_SEC_charges,
    v_other_fee,
    v_trade_commis,
    v_other_commis,
    v_trade_tax,
    v_trade_cost_fee,
    v_trade_system_use_fee,
    v_stock_settle_fee,
    v_net_price_flag,
    v_intrst_days,
    v_par_value,
    v_bond_accr_intrst,
    v_bond_rate_type,
    v_impawn_ratio,
    v_strike_bond_accr_intrst,
    v_trade_code_no,
    v_target_code_no,
    v_order_oper_way,
    v_exter_comm_flag,
    v_record_valid_flag,
    v_external_no,
    v_combo_code
    ;
        IF v_cursor_done THEN
            LEAVE loop_secu_execute;
        END IF;


      /* set @业务操作员编号# = @操作员编号#; */
      set v_busi_opor_no = v_opor_no;

      /* set @成交编号# = concat("BG_", @成交编号#); */
      set v_strike_no = concat("BG_", v_strike_no);

      /* 调用【原子_交易证券_报盘_新增成交】*/
      call db_tdsecu.pra_tdserp_AddStrike(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_busi_opor_no,
          v_init_date,
          v_rsp_id,
          v_co_no,
          v_pd_no,
          v_exch_group_no,
          v_asset_acco_no,
          v_pass_no,
          v_out_acco,
          v_exch_no,
          v_stock_acco_no,
          v_stock_code_no,
          v_stock_code,
          v_target_code_no,
          v_trade_code_no,
          v_stock_type,
          v_asset_type,
          v_comm_id,
          v_comm_batch_no,
          v_strike_date,
          v_strike_time,
          v_strike_no,
          v_report_date,
          v_report_no,
          v_order_date,
          v_order_time,
          v_order_id,
          v_order_dir,
          v_order_price,
          v_order_qty,
          v_strike_qty,
          v_strike_price,
          v_strike_amt,
          v_all_fee,
          v_stamp_tax,
          v_trans_fee,
          v_brkage_fee,
          v_SEC_charges,
          v_other_fee,
          v_trade_commis,
          v_other_commis,
          v_trade_tax,
          v_trade_cost_fee,
          v_trade_system_use_fee,
          v_stock_settle_fee,
          v_net_price_flag,
          v_intrst_days,
          v_par_value,
          v_bond_accr_intrst,
          v_bond_rate_type,
          v_impawn_ratio,
          v_strike_bond_accr_intrst,
          v_order_oper_way,
          v_exter_comm_flag,
          v_order_batch_no,
          v_external_no,
          v_combo_code,
          v_asset_acco_type,
          v_error_code,
          v_error_info,
          v_strike_id);

      /* if @错误编码# <> "0" then */
      if v_error_code <> "0" then

        /* [退出循环][loop_secu_execute] */
        LEAVE loop_secu_execute;

      end if;

    /* [关闭游标][cursor_secu_execute] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_secu_execute;
    end cursor_secu_execute;

    #把补单的成交记录置成无效

    /* [更新表记录][交易证券_报盘_成交表][{记录有效标志} = 《记录有效标志-无效》][{订单序号}=@新订单序号#][2][concat("更新成交表失败,订单编号=",@新订单序号#)] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_strike set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, record_valid_flag = 2 where order_id=v_new_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.10.57.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("更新成交表失败,订单编号=",v_new_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("更新成交表失败,订单编号=",v_new_order_id);
        end if;
        leave label_pro;
    end if;

    #把补单的成交汇总记录置成无效

    /* [更新表记录][交易证券_报盘_成交汇总表][{记录有效标志} = 《记录有效标志-无效》][{订单序号}=@新订单序号# and {订单日期} = @初始化日期#][2][concat("更新成交汇总表失败,订单编号=",@新订单序号#)] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_sumstrike set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, record_valid_flag = 2 where order_id=v_new_order_id and order_date = v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.10.57.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("更新成交汇总表失败,订单编号=",v_new_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("更新成交汇总表失败,订单编号=",v_new_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @成交序号# = -@订单序号#; */
    set v_strike_id = -v_order_id;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_id = v_strike_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_处理正报订单资金持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_DealReportOrderCapitalPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_DealReportOrderCapitalPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id bigint,
    IN p_new_order_id bigint,
    IN p_order_batch_no int,
    IN p_par_value decimal(16,9),
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_intrst_days int,
    IN p_bond_rate_type int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_order_qty decimal(18,2),
    IN p_comm_id bigint,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_crncy_type varchar(3),
    IN p_invest_type int,
    IN p_wtdraw_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_order_price decimal(16,9),
    IN p_exch_crncy_type varchar(3),
    IN p_asset_type int,
    IN p_stock_code_no int,
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_order_oper_way varchar(2),
    IN p_order_frozen_amt decimal(18,4),
    IN p_busi_opor_no int,
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_exgp_cost_amt decimal(18,4),
    IN p_exgp_intrst_cost_amt decimal(18,4),
    IN p_exgp_curr_qty decimal(18,2),
    IN p_asac_cost_amt decimal(18,4),
    IN p_asac_intrst_cost_amt decimal(18,4),
    IN p_asac_curr_qty decimal(18,2),
    IN p_repo_days int,
    IN p_repo_cale_days int,
    IN p_repo_back_date int,
    IN p_cost_calc_type int,
    IN p_order_append_exch_group_no int,
    IN p_order_append_frozen_amt decimal(18,4),
    IN p_order_status varchar(2),
    IN p_is_record_jour int,
    IN p_open_close_permission int,
    IN p_avail_cal_flag int,
    IN p_combo_code varchar(32),
    IN p_combo_posi_id bigint,
    IN p_strike_qty decimal(18,2),
    IN p_strike_id bigint,
    IN p_repo_order_id bigint,
    IN p_repo_strike_id bigint,
    IN p_strike_no varchar(64),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_price decimal(16,9),
    IN p_strike_fee decimal(18,4),
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
    declare v_order_id bigint;
    declare v_new_order_id bigint;
    declare v_order_batch_no int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_order_qty decimal(18,2);
    declare v_comm_id bigint;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_crncy_type varchar(3);
    declare v_invest_type int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_order_price decimal(16,9);
    declare v_exch_crncy_type varchar(3);
    declare v_asset_type int;
    declare v_stock_code_no int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_order_oper_way varchar(2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_busi_opor_no int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_repo_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_cost_calc_type int;
    declare v_order_append_exch_group_no int;
    declare v_order_append_frozen_amt decimal(18,4);
    declare v_order_status varchar(2);
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_avail_cal_flag int;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strike_qty decimal(18,2);
    declare v_strike_id bigint;
    declare v_repo_order_id bigint;
    declare v_repo_strike_id bigint;
    declare v_strike_no varchar(64);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_price decimal(16,9);
    declare v_strike_fee decimal(18,4);
    declare v_order_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_target_stock_code_no int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_trade_occur_qty decimal(18,2);
    declare v_open_posi_date int;
    declare v_strike_occur_qty decimal(18,2);
    declare v_strike_occur_amt decimal(18,4);
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_strike_status varchar(2);
    declare v_comm_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_status varchar(2);
    declare v_exter_comm_flag int;
    declare v_comm_oper_way varchar(2);
    declare v_asset_acco_type int;
    declare v_exist_debt_flag int;

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
    SET v_order_id = p_order_id;
    SET v_new_order_id = p_new_order_id;
    SET v_order_batch_no = p_order_batch_no;
    SET v_par_value = p_par_value;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_intrst_days = p_intrst_days;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_order_qty = p_order_qty;
    SET v_comm_id = p_comm_id;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_crncy_type = p_crncy_type;
    SET v_invest_type = p_invest_type;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_order_price = p_order_price;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_asset_type = p_asset_type;
    SET v_stock_code_no = p_stock_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_order_oper_way = p_order_oper_way;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_exgp_cost_amt = p_exgp_cost_amt;
    SET v_exgp_intrst_cost_amt = p_exgp_intrst_cost_amt;
    SET v_exgp_curr_qty = p_exgp_curr_qty;
    SET v_asac_cost_amt = p_asac_cost_amt;
    SET v_asac_intrst_cost_amt = p_asac_intrst_cost_amt;
    SET v_asac_curr_qty = p_asac_curr_qty;
    SET v_repo_days = p_repo_days;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_order_append_exch_group_no = p_order_append_exch_group_no;
    SET v_order_append_frozen_amt = p_order_append_frozen_amt;
    SET v_order_status = p_order_status;
    SET v_is_record_jour = p_is_record_jour;
    SET v_open_close_permission = p_open_close_permission;
    SET v_avail_cal_flag = p_avail_cal_flag;
    SET v_combo_code = p_combo_code;
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_id = p_strike_id;
    SET v_repo_order_id = p_repo_order_id;
    SET v_repo_strike_id = p_repo_strike_id;
    SET v_strike_no = p_strike_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_price = p_strike_price;
    SET v_strike_fee = p_strike_fee;
    SET v_order_date = p_order_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_occur_amt = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_trade_occur_qty = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_occur_qty = 0;
    SET v_strike_occur_amt = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_all_fee = 0;
    SET v_strike_status = "0";
    SET v_comm_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_exter_comm_flag = 0;
    SET v_comm_oper_way = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;

    /* set @目标证券代码编号# = 0; */
    set v_target_stock_code_no = 0;
    #2:已报  已报待撤

    /* if(@订单状态# = '2'  or  (@订单状态# = '3' and @成交数量# =0)) then */
    if(v_order_status = '2'  or  (v_order_status = '3' and v_strike_qty =0)) then

      /* if(@订单方向# =1 or @订单方向# =4) then */
      if(v_order_dir =1 or v_order_dir =4) then

        /* set @交易变动金额# = -@补单订单冻结金额#; */
        set v_trade_occur_amt = -v_order_append_frozen_amt;

      /* elseif(@订单方向# =2) then */
      elseif(v_order_dir =2) then

        /* set @交易变动金额# = -@订单价格# * @成交数量#; */
        set v_trade_occur_amt = -v_order_price * v_strike_qty;

        /* if (@证券类型# > (20)) and (@证券类型# < (50)) and (@净价标志# = 《净价标志-净价》) and (@债券利率类型# <> 《债券利率类型-零息》) then */
        if (v_stock_type > (20)) and (v_stock_type < (50)) and (v_net_price_flag = 1) and (v_bond_rate_type <> 3) then

          /* set @交易变动金额# = -(@订单价格# + round(@债券计提利息#,3)) * @订单数量#; */
          set v_trade_occur_amt = -(v_order_price + round(v_bond_accr_intrst,3)) * v_order_qty;
        end if;

      /* elseif(@订单方向# =3) then */
      elseif(v_order_dir =3) then

         /* set @交易变动金额# = -@票面面值# * @订单数量#; */
         set v_trade_occur_amt = -v_par_value * v_order_qty;
      end if;
      #回滚订单B的持仓资金，订单A保持不变

      /* set @指令变动金额# = 0; */
      set v_comm_occur_amt = 0;

      /* set @指令变动数量# = 0; */
      set v_comm_occur_qty = 0;

      /* set @交易组编号# = @补单交易组编号#; */
      set v_exch_group_no = v_order_append_exch_group_no;

      /* set @交易变动数量# = -@订单数量#; */
      set v_trade_occur_qty = -v_order_qty;

      /* set @订单序号# = -@新订单序号#; */
      set v_order_id = -v_new_order_id;

      /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
      call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
          v_exch_crncy_type,
          v_comm_id,
          v_order_id,
          v_exch_no,
          v_stock_code,
          v_stock_type,
          v_asset_type,
          v_order_dir,
          v_impawn_ratio,
          v_stock_acco_no,
          v_stock_code_no,
          v_trade_code_no,
          v_target_code_no,
          v_comm_occur_amt,
          v_comm_occur_qty,
          v_trade_occur_amt,
          v_trade_occur_qty,
          v_is_record_jour,
          v_order_oper_way,
          v_busi_opor_no,
          v_open_close_permission,
          v_avail_cal_flag,
          v_combo_code,
          v_combo_posi_id,
          v_target_stock_code_no,
          v_error_code,
          v_error_info,
          v_open_posi_date);
      if v_error_code = "1" then
          SET v_error_code = "tdsecuA.10.58.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    #部成 部成待撤

    /* elseif(@订单状态# = '5' or (@订单状态# = '3' and @成交数量# > 0) ) then */
    elseif(v_order_status = '5' or (v_order_status = '3' and v_strike_qty > 0) ) then

      /* set @交易变动数量# = @订单数量# - @成交数量#; */
      set v_trade_occur_qty = v_order_qty - v_strike_qty;

      /* if(@订单方向# =1 or @订单方向# =4) then */
      if(v_order_dir =1 or v_order_dir =4) then

        /* set @交易变动金额# = @订单冻结金额# / @订单数量# * (@订单数量#  - @成交数量#); */
        set v_trade_occur_amt = v_order_frozen_amt / v_order_qty * (v_order_qty  - v_strike_qty);

      /* elseif(@订单方向# =2) then */
      elseif(v_order_dir =2) then

        /* set @交易变动金额# = @订单价格# * @交易变动数量#; */
        set v_trade_occur_amt = v_order_price * v_trade_occur_qty;

        /* if (@证券类型# > (20)) and (@证券类型# < (50)) and (@净价标志# = 《净价标志-净价》) and (@债券利率类型# <> 《债券利率类型-零息》) then */
        if (v_stock_type > (20)) and (v_stock_type < (50)) and (v_net_price_flag = 1) and (v_bond_rate_type <> 3) then

          /* set @交易变动金额# = (@订单价格# + round(@债券计提利息#,3)) * @交易变动数量#; */
          set v_trade_occur_amt = (v_order_price + round(v_bond_accr_intrst,3)) * v_trade_occur_qty;
        end if;

      /* elseif(@订单方向# =3) then */
      elseif(v_order_dir =3) then

         /* set @交易变动金额# = @票面面值# * @交易变动数量#; */
         set v_trade_occur_amt = v_par_value * v_trade_occur_qty;
      end if;
      #成交处理

      /* set @交易变动数量# = -@成交数量#; */
      set v_trade_occur_qty = -v_strike_qty;

      /* set @交易变动金额# = -@交易变动金额#; */
      set v_trade_occur_amt = -v_trade_occur_amt;

      /* set @成交变动数量# = @成交数量#; */
      set v_strike_occur_qty = v_strike_qty;

      /* set @成交变动金额# = @成交金额#; */
      set v_strike_occur_amt = v_strike_amt;

      /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
      call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
          v_order_dir,
          v_comm_id,
          v_strike_id,
          v_exch_no,
          v_stock_code,
          v_stock_acco_no,
          v_stock_code_no,
          v_trade_code_no,
          v_target_code_no,
          v_asset_type,
          v_stock_type,
          v_strike_occur_amt,
          v_strike_occur_qty,
          v_trade_occur_amt,
          v_trade_occur_qty,
          v_impawn_ratio,
          v_repo_order_id,
          v_repo_strike_id,
          v_strike_no,
          v_strike_date,
          v_strike_time,
          v_strike_qty,
          v_strike_price,
          v_strike_amt,
          v_strike_fee,
          v_par_value,
          v_net_price_flag,
          v_intrst_days,
          v_bond_accr_intrst,
          v_bond_rate_type,
          v_repo_days,
          v_repo_cale_days,
          v_repo_back_date,
          v_capit_reback_days,
          v_posi_reback_days,
          v_is_record_jour,
          v_order_oper_way,
          v_cost_calc_type,
          v_exgp_cost_amt,
          v_exgp_intrst_cost_amt,
          v_exgp_curr_qty,
          v_asac_cost_amt,
          v_asac_intrst_cost_amt,
          v_asac_curr_qty,
          v_buy_ref_rate,
          v_sell_ref_rate,
          v_combo_code,
          v_combo_posi_id,
          v_order_date,
          v_target_stock_code_no,
          v_error_code,
          v_error_info,
          v_open_posi_date);
      if v_error_code = "1" then
          SET v_error_code = "tdsecuA.10.58.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* set @交易变动数量# = @订单数量# - @成交数量#; */
      set v_trade_occur_qty = v_order_qty - v_strike_qty;

      /* if(@订单方向# =1 or @订单方向# =4) then */
      if(v_order_dir =1 or v_order_dir =4) then

        /* set @交易变动金额# = @补单订单冻结金额#; */
        set v_trade_occur_amt = v_order_append_frozen_amt;

      /* elseif(@订单方向# =2) then */
      elseif(v_order_dir =2) then

        /* set @交易变动金额# = @订单价格# * @交易变动数量#; */
        set v_trade_occur_amt = v_order_price * v_trade_occur_qty;

        /* if (@证券类型# > (20)) and (@证券类型# < (50)) and (@净价标志# = 《净价标志-净价》) and (@债券利率类型# <> 《债券利率类型-零息》) then */
        if (v_stock_type > (20)) and (v_stock_type < (50)) and (v_net_price_flag = 1) and (v_bond_rate_type <> 3) then

          /* set @交易变动金额# = (@订单价格# + round(@债券计提利息#,3)) * @交易变动数量#; */
          set v_trade_occur_amt = (v_order_price + round(v_bond_accr_intrst,3)) * v_trade_occur_qty;
        end if;

      /* elseif(@订单方向# =3) then */
      elseif(v_order_dir =3) then

         /* set @交易变动金额# = @票面面值# * @交易变动数量#; */
         set v_trade_occur_amt = v_par_value * v_trade_occur_qty;
      end if;

      /* set @交易组编号# = @补单交易组编号#; */
      set v_exch_group_no = v_order_append_exch_group_no;

      /* set @交易变动数量# = -@交易变动数量#; */
      set v_trade_occur_qty = -v_trade_occur_qty;

      /* set @交易变动金额# = -@交易变动金额#; */
      set v_trade_occur_amt = -v_trade_occur_amt;

      /* set  @成交变动数量# = -@成交数量#; */
      set  v_strike_occur_qty = -v_strike_qty;

      /* set  @成交变动金额# = -@成交金额#; */
      set  v_strike_occur_amt = -v_strike_amt;

      /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
      call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
          v_order_dir,
          v_comm_id,
          v_strike_id,
          v_exch_no,
          v_stock_code,
          v_stock_acco_no,
          v_stock_code_no,
          v_trade_code_no,
          v_target_code_no,
          v_asset_type,
          v_stock_type,
          v_strike_occur_amt,
          v_strike_occur_qty,
          v_trade_occur_amt,
          v_trade_occur_qty,
          v_impawn_ratio,
          v_repo_order_id,
          v_repo_strike_id,
          v_strike_no,
          v_strike_date,
          v_strike_time,
          v_strike_qty,
          v_strike_price,
          v_strike_amt,
          v_strike_fee,
          v_par_value,
          v_net_price_flag,
          v_intrst_days,
          v_bond_accr_intrst,
          v_bond_rate_type,
          v_repo_days,
          v_repo_cale_days,
          v_repo_back_date,
          v_capit_reback_days,
          v_posi_reback_days,
          v_is_record_jour,
          v_order_oper_way,
          v_cost_calc_type,
          v_exgp_cost_amt,
          v_exgp_intrst_cost_amt,
          v_exgp_curr_qty,
          v_asac_cost_amt,
          v_asac_intrst_cost_amt,
          v_asac_curr_qty,
          v_buy_ref_rate,
          v_sell_ref_rate,
          v_combo_code,
          v_combo_posi_id,
          v_order_date,
          v_target_stock_code_no,
          v_error_code,
          v_error_info,
          v_open_posi_date);
      if v_error_code = "1" then
          SET v_error_code = "tdsecuA.10.58.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    #已成 部撤

    /* elseif( @订单状态# = '6' or @订单状态# = '7' ) then */
    elseif( v_order_status = '6' or v_order_status = '7' ) then

      /* set @交易变动数量# = @成交数量#+@撤单数量#; */
      set v_trade_occur_qty = v_strike_qty+v_wtdraw_qty;
      #单元证券业务持仓表处理
      #证券业务资金表成交金额处理

      /* if(@订单方向# =1 or @订单方向# =4) then */
      if(v_order_dir =1 or v_order_dir =4) then

        /* set @交易变动金额# = @订单冻结金额#; */
        set v_trade_occur_amt = v_order_frozen_amt;

      /* elseif(@订单方向# =2) then */
      elseif(v_order_dir =2) then

        /* set @交易变动金额# = @订单价格# * @成交数量#; */
        set v_trade_occur_amt = v_order_price * v_strike_qty;

        /* if (@证券类型# > (20)) and (@证券类型# < (50)) and (@净价标志# = 《净价标志-净价》) and (@债券利率类型# <> 《债券利率类型-零息》) then */
        if (v_stock_type > (20)) and (v_stock_type < (50)) and (v_net_price_flag = 1) and (v_bond_rate_type <> 3) then

          /* set @交易变动金额# = (@订单价格# + round(@债券计提利息#,3)) * @交易变动数量#; */
          set v_trade_occur_amt = (v_order_price + round(v_bond_accr_intrst,3)) * v_trade_occur_qty;
        end if;

      /* elseif(@订单方向# =3) then */
      elseif(v_order_dir =3) then

         /* set @交易变动金额# = @票面面值# * @交易变动数量#; */
         set v_trade_occur_amt = v_par_value * v_trade_occur_qty;
      end if;

      /* set @交易变动数量# = -@交易变动数量#; */
      set v_trade_occur_qty = -v_trade_occur_qty;

      /* set @交易变动金额# = -@交易变动金额#; */
      set v_trade_occur_amt = -v_trade_occur_amt;

      /* set @成交变动数量# = @成交数量#; */
      set v_strike_occur_qty = v_strike_qty;

      /* set @成交变动金额# = @成交金额#; */
      set v_strike_occur_amt = v_strike_amt;

      /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
      call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
          v_order_dir,
          v_comm_id,
          v_strike_id,
          v_exch_no,
          v_stock_code,
          v_stock_acco_no,
          v_stock_code_no,
          v_trade_code_no,
          v_target_code_no,
          v_asset_type,
          v_stock_type,
          v_strike_occur_amt,
          v_strike_occur_qty,
          v_trade_occur_amt,
          v_trade_occur_qty,
          v_impawn_ratio,
          v_repo_order_id,
          v_repo_strike_id,
          v_strike_no,
          v_strike_date,
          v_strike_time,
          v_strike_qty,
          v_strike_price,
          v_strike_amt,
          v_strike_fee,
          v_par_value,
          v_net_price_flag,
          v_intrst_days,
          v_bond_accr_intrst,
          v_bond_rate_type,
          v_repo_days,
          v_repo_cale_days,
          v_repo_back_date,
          v_capit_reback_days,
          v_posi_reback_days,
          v_is_record_jour,
          v_order_oper_way,
          v_cost_calc_type,
          v_exgp_cost_amt,
          v_exgp_intrst_cost_amt,
          v_exgp_curr_qty,
          v_asac_cost_amt,
          v_asac_intrst_cost_amt,
          v_asac_curr_qty,
          v_buy_ref_rate,
          v_sell_ref_rate,
          v_combo_code,
          v_combo_posi_id,
          v_order_date,
          v_target_stock_code_no,
          v_error_code,
          v_error_info,
          v_open_posi_date);
      if v_error_code = "1" then
          SET v_error_code = "tdsecuA.10.58.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

      #如果是部撤并有指令，还要回滚订单A的指令

      /* if(@订单状态# = '7' and @指令序号# >0) then */
      if(v_order_status = '7' and v_comm_id >0) then
        #更新指令表

        /* 调用【原子_交易证券_指令_获取指令信息】*/
        call db_tdsecu.pra_tdseap_CheckCommInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_id,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_comm_date,
            v_comm_time,
            v_comm_batch_no,
            v_comm_opor,
            v_comm_executor,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_comm_amt,
            v_order_qty,
            v_comm_cancel_qty,
            v_strike_amt,
            v_strike_qty,
            v_comm_frozen_amt,
            v_comm_frozen_qty,
            v_all_fee,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_strike_status,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_date,
            v_comm_comple_time,
            v_comm_appr_status,
            v_exter_comm_flag,
            v_comm_oper_way,
            v_combo_posi_id,
            v_combo_code,
            v_asset_acco_type,
            v_exist_debt_flag);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.10.58.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_获取指令信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @指令变动金额# = 0; */
        set v_comm_occur_amt = 0;

        /* if @指令方向# = 1 then */
        if v_comm_dir = 1 then

          /* set @指令变动金额# = @指令实际限价# * @撤单数量#; */
          set v_comm_occur_amt = v_limit_actual_price * v_wtdraw_qty;

          /* if (@证券类型# > (20)) and (@证券类型# < (50)) and (@净价标志# = 《净价标志-净价》) and (@债券利率类型# <> 《债券利率类型-零息》) then */
          if (v_stock_type > (20)) and (v_stock_type < (50)) and (v_net_price_flag = 1) and (v_bond_rate_type <> 3) then

            /* set @指令变动金额# = (@指令实际限价# + @债券计提利息#) * @撤单数量#; */
            set v_comm_occur_amt = (v_limit_actual_price + v_bond_accr_intrst) * v_wtdraw_qty;
          end if;

        /* elseif @指令方向# = 2 then */
        elseif v_comm_dir = 2 then

          /* set @指令变动金额# = @指令实际限价# * @撤单数量#; */
          set v_comm_occur_amt = v_limit_actual_price * v_wtdraw_qty;

          /* if (@证券类型# > (20)) and (@证券类型# < (50)) and (@净价标志# = 《净价标志-净价》) and (@债券利率类型# <> 《债券利率类型-零息》) then */
          if (v_stock_type > (20)) and (v_stock_type < (50)) and (v_net_price_flag = 1) and (v_bond_rate_type <> 3) then

            /* set @指令变动金额# = (@指令实际限价# + round(@债券计提利息#,3)) * @撤单数量#; */
            set v_comm_occur_amt = (v_limit_actual_price + round(v_bond_accr_intrst,3)) * v_wtdraw_qty;
          end if;

        /* elseif @指令方向# = 3 or @指令方向# = 4 then */
        elseif v_comm_dir = 3 or v_comm_dir = 4 then

          /* set @指令变动金额# = @票面面值# * @撤单数量#; */
          set v_comm_occur_amt = v_par_value * v_wtdraw_qty;
        end if;

        /* set @指令变动数量# = @撤单数量#; */
        set v_comm_occur_qty = v_wtdraw_qty;

        /* set @交易变动金额# = 0; */
        set v_trade_occur_amt = 0;

        /* set @交易变动数量# = 0; */
        set v_trade_occur_qty = 0;

        /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
        call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
            v_exch_crncy_type,
            v_comm_id,
            v_order_id,
            v_exch_no,
            v_stock_code,
            v_stock_type,
            v_asset_type,
            v_order_dir,
            v_impawn_ratio,
            v_stock_acco_no,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_comm_occur_amt,
            v_comm_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_is_record_jour,
            v_order_oper_way,
            v_busi_opor_no,
            v_open_close_permission,
            v_avail_cal_flag,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code_no,
            v_error_code,
            v_error_info,
            v_open_posi_date);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.10.58.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

      end if;

      /* set @成交数量# = @临时_成交数量#; */
      set v_strike_qty = v_tmp_strike_qty;

      /* set @成交金额# = @临时_成交金额#; */
      set v_strike_amt = v_tmp_strike_amt;

      /* set @交易组编号# = @补单交易组编号#; */
      set v_exch_group_no = v_order_append_exch_group_no;

      /* set @交易变动数量# = 0; */
      set v_trade_occur_qty = 0;

      /* set @交易变动金额# = 0; */
      set v_trade_occur_amt = 0;

      /* set  @成交变动数量# = -@成交数量#; */
      set  v_strike_occur_qty = -v_strike_qty;

      /* set  @成交变动金额# = -@成交金额#; */
      set  v_strike_occur_amt = -v_strike_amt;

      /* set @订单日期#=@初始化日期#; */
      set v_order_date=v_init_date;

      /* set @目标证券代码编号#=0; */
      set v_target_stock_code_no=0;

      /* set @成交数量#=-@成交数量#; */
      set v_strike_qty=-v_strike_qty;

      /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
      call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
          v_order_dir,
          v_comm_id,
          v_strike_id,
          v_exch_no,
          v_stock_code,
          v_stock_acco_no,
          v_stock_code_no,
          v_trade_code_no,
          v_target_code_no,
          v_asset_type,
          v_stock_type,
          v_strike_occur_amt,
          v_strike_occur_qty,
          v_trade_occur_amt,
          v_trade_occur_qty,
          v_impawn_ratio,
          v_repo_order_id,
          v_repo_strike_id,
          v_strike_no,
          v_strike_date,
          v_strike_time,
          v_strike_qty,
          v_strike_price,
          v_strike_amt,
          v_strike_fee,
          v_par_value,
          v_net_price_flag,
          v_intrst_days,
          v_bond_accr_intrst,
          v_bond_rate_type,
          v_repo_days,
          v_repo_cale_days,
          v_repo_back_date,
          v_capit_reback_days,
          v_posi_reback_days,
          v_is_record_jour,
          v_order_oper_way,
          v_cost_calc_type,
          v_exgp_cost_amt,
          v_exgp_intrst_cost_amt,
          v_exgp_curr_qty,
          v_asac_cost_amt,
          v_asac_intrst_cost_amt,
          v_asac_curr_qty,
          v_buy_ref_rate,
          v_sell_ref_rate,
          v_combo_code,
          v_combo_posi_id,
          v_order_date,
          v_target_stock_code_no,
          v_error_code,
          v_error_info,
          v_open_posi_date);
      if v_error_code = "1" then
          SET v_error_code = "tdsecuA.10.58.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 原子_交易证券_交易运维_处理废单资金持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_DealWasteOrderCapitalPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_DealWasteOrderCapitalPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id bigint,
    IN p_new_order_id bigint,
    IN p_order_batch_no int,
    IN p_par_value decimal(16,9),
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_intrst_days int,
    IN p_bond_rate_type int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_order_qty decimal(18,2),
    IN p_comm_id bigint,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_crncy_type varchar(3),
    IN p_invest_type int,
    IN p_wtdraw_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_order_price decimal(16,9),
    IN p_exch_crncy_type varchar(3),
    IN p_asset_type int,
    IN p_stock_code_no int,
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_order_oper_way varchar(2),
    IN p_order_frozen_amt decimal(18,4),
    IN p_busi_opor_no int,
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_exgp_cost_amt decimal(18,4),
    IN p_exgp_intrst_cost_amt decimal(18,4),
    IN p_exgp_curr_qty decimal(18,2),
    IN p_asac_cost_amt decimal(18,4),
    IN p_asac_intrst_cost_amt decimal(18,4),
    IN p_asac_curr_qty decimal(18,2),
    IN p_repo_days int,
    IN p_repo_cale_days int,
    IN p_repo_back_date int,
    IN p_cost_calc_type int,
    IN p_order_append_exch_group_no int,
    IN p_order_append_frozen_amt decimal(18,4),
    IN p_order_status varchar(2),
    IN p_is_record_jour int,
    IN p_open_close_permission int,
    IN p_avail_cal_flag int,
    IN p_combo_code varchar(32),
    IN p_combo_posi_id bigint,
    IN p_strike_qty decimal(18,2),
    IN p_strike_id bigint,
    IN p_repo_order_id bigint,
    IN p_repo_strike_id bigint,
    IN p_strike_no varchar(64),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_price decimal(16,9),
    IN p_strike_fee decimal(18,4),
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
    declare v_order_id bigint;
    declare v_new_order_id bigint;
    declare v_order_batch_no int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_order_qty decimal(18,2);
    declare v_comm_id bigint;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_crncy_type varchar(3);
    declare v_invest_type int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_order_price decimal(16,9);
    declare v_exch_crncy_type varchar(3);
    declare v_asset_type int;
    declare v_stock_code_no int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_order_oper_way varchar(2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_busi_opor_no int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_repo_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_cost_calc_type int;
    declare v_order_append_exch_group_no int;
    declare v_order_append_frozen_amt decimal(18,4);
    declare v_order_status varchar(2);
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_avail_cal_flag int;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strike_qty decimal(18,2);
    declare v_strike_id bigint;
    declare v_repo_order_id bigint;
    declare v_repo_strike_id bigint;
    declare v_strike_no varchar(64);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_price decimal(16,9);
    declare v_strike_fee decimal(18,4);
    declare v_order_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_target_stock_code_no int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_trade_occur_qty decimal(18,2);
    declare v_open_posi_date int;
    declare v_strike_occur_qty decimal(18,2);
    declare v_strike_occur_amt decimal(18,4);
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_strike_status varchar(2);
    declare v_comm_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_appr_status varchar(2);
    declare v_exter_comm_flag int;
    declare v_comm_oper_way varchar(2);
    declare v_asset_acco_type int;
    declare v_exist_debt_flag int;

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
    SET v_order_id = p_order_id;
    SET v_new_order_id = p_new_order_id;
    SET v_order_batch_no = p_order_batch_no;
    SET v_par_value = p_par_value;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_intrst_days = p_intrst_days;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_order_qty = p_order_qty;
    SET v_comm_id = p_comm_id;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_crncy_type = p_crncy_type;
    SET v_invest_type = p_invest_type;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_order_price = p_order_price;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_asset_type = p_asset_type;
    SET v_stock_code_no = p_stock_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_order_oper_way = p_order_oper_way;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_exgp_cost_amt = p_exgp_cost_amt;
    SET v_exgp_intrst_cost_amt = p_exgp_intrst_cost_amt;
    SET v_exgp_curr_qty = p_exgp_curr_qty;
    SET v_asac_cost_amt = p_asac_cost_amt;
    SET v_asac_intrst_cost_amt = p_asac_intrst_cost_amt;
    SET v_asac_curr_qty = p_asac_curr_qty;
    SET v_repo_days = p_repo_days;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_order_append_exch_group_no = p_order_append_exch_group_no;
    SET v_order_append_frozen_amt = p_order_append_frozen_amt;
    SET v_order_status = p_order_status;
    SET v_is_record_jour = p_is_record_jour;
    SET v_open_close_permission = p_open_close_permission;
    SET v_avail_cal_flag = p_avail_cal_flag;
    SET v_combo_code = p_combo_code;
    SET v_combo_posi_id = p_combo_posi_id;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_id = p_strike_id;
    SET v_repo_order_id = p_repo_order_id;
    SET v_repo_strike_id = p_repo_strike_id;
    SET v_strike_no = p_strike_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_price = p_strike_price;
    SET v_strike_fee = p_strike_fee;
    SET v_order_date = p_order_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_target_stock_code_no = 0;
    SET v_trade_occur_amt = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_trade_occur_qty = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_occur_qty = 0;
    SET v_strike_occur_amt = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_all_fee = 0;
    SET v_strike_status = "0";
    SET v_comm_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_status = " ";
    SET v_exter_comm_flag = 0;
    SET v_comm_oper_way = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;

    
    label_pro:BEGIN
    

    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;

    /* set @目标证券代码编号# = 0; */
    set v_target_stock_code_no = 0;
    #2:已报  已报待撤

    /* if(@订单状态# = '2'  or  (@订单状态# = '3' and @成交数量# =0)) then */
    if(v_order_status = '2'  or  (v_order_status = '3' and v_strike_qty =0)) then

      /* if(@订单方向# =1 or @订单方向# =4) then */
      if(v_order_dir =1 or v_order_dir =4) then

        /* set @交易变动金额# = @补单订单冻结金额#; */
        set v_trade_occur_amt = v_order_append_frozen_amt;

      /* elseif(@订单方向# =2) then */
      elseif(v_order_dir =2) then

        /* set @交易变动金额# = @订单价格# * @成交数量#; */
        set v_trade_occur_amt = v_order_price * v_strike_qty;

        /* if (@证券类型# > (20)) and (@证券类型# < (50)) and (@净价标志# = 《净价标志-净价》) and (@债券利率类型# <> 《债券利率类型-零息》) then */
        if (v_stock_type > (20)) and (v_stock_type < (50)) and (v_net_price_flag = 1) and (v_bond_rate_type <> 3) then

          /* set @交易变动金额# = (@订单价格# + round(@债券计提利息#,3)) * @订单数量#; */
          set v_trade_occur_amt = (v_order_price + round(v_bond_accr_intrst,3)) * v_order_qty;
        end if;

      /* elseif(@订单方向# =3) then */
      elseif(v_order_dir =3) then

         /* set @交易变动金额# = @票面面值# * @订单数量#; */
         set v_trade_occur_amt = v_par_value * v_order_qty;
      end if;
      #处理废单A的资金持仓

      /* set @指令变动金额# = 0; */
      set v_comm_occur_amt = 0;

      /* set @指令变动数量# = 0; */
      set v_comm_occur_qty = 0;

      /* set @交易变动数量# = @订单数量#; */
      set v_trade_occur_qty = v_order_qty;

      /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
      call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
          v_exch_crncy_type,
          v_comm_id,
          v_order_id,
          v_exch_no,
          v_stock_code,
          v_stock_type,
          v_asset_type,
          v_order_dir,
          v_impawn_ratio,
          v_stock_acco_no,
          v_stock_code_no,
          v_trade_code_no,
          v_target_code_no,
          v_comm_occur_amt,
          v_comm_occur_qty,
          v_trade_occur_amt,
          v_trade_occur_qty,
          v_is_record_jour,
          v_order_oper_way,
          v_busi_opor_no,
          v_open_close_permission,
          v_avail_cal_flag,
          v_combo_code,
          v_combo_posi_id,
          v_target_stock_code_no,
          v_error_code,
          v_error_info,
          v_open_posi_date);
      if v_error_code = "1" then
          SET v_error_code = "tdsecuA.10.59.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

      #回滚订单B的持仓资金

      /* set @交易组编号# = @补单交易组编号#; */
      set v_exch_group_no = v_order_append_exch_group_no;

      /* set @交易变动数量# = -@订单数量#; */
      set v_trade_occur_qty = -v_order_qty;

      /* set @交易变动金额# = -@交易变动金额#; */
      set v_trade_occur_amt = -v_trade_occur_amt;

      /* set @订单序号# = -@新订单序号#; */
      set v_order_id = -v_new_order_id;

      /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
      call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
          v_exch_crncy_type,
          v_comm_id,
          v_order_id,
          v_exch_no,
          v_stock_code,
          v_stock_type,
          v_asset_type,
          v_order_dir,
          v_impawn_ratio,
          v_stock_acco_no,
          v_stock_code_no,
          v_trade_code_no,
          v_target_code_no,
          v_comm_occur_amt,
          v_comm_occur_qty,
          v_trade_occur_amt,
          v_trade_occur_qty,
          v_is_record_jour,
          v_order_oper_way,
          v_busi_opor_no,
          v_open_close_permission,
          v_avail_cal_flag,
          v_combo_code,
          v_combo_posi_id,
          v_target_stock_code_no,
          v_error_code,
          v_error_info,
          v_open_posi_date);
      if v_error_code = "1" then
          SET v_error_code = "tdsecuA.10.59.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    #部成 部成待撤

    /* elseif(@订单状态# = '5' or (@订单状态# = '3' and @成交数量# > 0) ) then */
    elseif(v_order_status = '5' or (v_order_status = '3' and v_strike_qty > 0) ) then

      /* set @交易变动数量# = @订单数量# - @成交数量#; */
      set v_trade_occur_qty = v_order_qty - v_strike_qty;

      /* if(@订单方向# =1 or @订单方向# =4) then */
      if(v_order_dir =1 or v_order_dir =4) then

        /* set @交易变动金额# = @订单冻结金额# / @订单数量# * (@订单数量#  - @成交数量#); */
        set v_trade_occur_amt = v_order_frozen_amt / v_order_qty * (v_order_qty  - v_strike_qty);

      /* elseif(@订单方向# =2) then */
      elseif(v_order_dir =2) then

        /* set @交易变动金额# = @订单价格# * @交易变动数量#; */
        set v_trade_occur_amt = v_order_price * v_trade_occur_qty;

        /* if (@证券类型# > (20)) and (@证券类型# < (50)) and (@净价标志# = 《净价标志-净价》) and (@债券利率类型# <> 《债券利率类型-零息》) then */
        if (v_stock_type > (20)) and (v_stock_type < (50)) and (v_net_price_flag = 1) and (v_bond_rate_type <> 3) then

          /* set @交易变动金额# = (@订单价格# + round(@债券计提利息#,3)) * @交易变动数量#; */
          set v_trade_occur_amt = (v_order_price + round(v_bond_accr_intrst,3)) * v_trade_occur_qty;
        end if;

      /* elseif(@订单方向# =3) then */
      elseif(v_order_dir =3) then

         /* set @交易变动金额# = @票面面值# * @交易变动数量#; */
         set v_trade_occur_amt = v_par_value * v_trade_occur_qty;
      end if;
      #成交处理

      /* set @交易变动数量# = -@成交数量#; */
      set v_trade_occur_qty = -v_strike_qty;

      /* set @交易变动金额# = -@交易变动金额#; */
      set v_trade_occur_amt = -v_trade_occur_amt;

      /* set @成交变动数量# = @成交数量#; */
      set v_strike_occur_qty = v_strike_qty;

      /* set @成交变动金额# = @成交金额#; */
      set v_strike_occur_amt = v_strike_amt;

      /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
      call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
          v_order_dir,
          v_comm_id,
          v_strike_id,
          v_exch_no,
          v_stock_code,
          v_stock_acco_no,
          v_stock_code_no,
          v_trade_code_no,
          v_target_code_no,
          v_asset_type,
          v_stock_type,
          v_strike_occur_amt,
          v_strike_occur_qty,
          v_trade_occur_amt,
          v_trade_occur_qty,
          v_impawn_ratio,
          v_repo_order_id,
          v_repo_strike_id,
          v_strike_no,
          v_strike_date,
          v_strike_time,
          v_strike_qty,
          v_strike_price,
          v_strike_amt,
          v_strike_fee,
          v_par_value,
          v_net_price_flag,
          v_intrst_days,
          v_bond_accr_intrst,
          v_bond_rate_type,
          v_repo_days,
          v_repo_cale_days,
          v_repo_back_date,
          v_capit_reback_days,
          v_posi_reback_days,
          v_is_record_jour,
          v_order_oper_way,
          v_cost_calc_type,
          v_exgp_cost_amt,
          v_exgp_intrst_cost_amt,
          v_exgp_curr_qty,
          v_asac_cost_amt,
          v_asac_intrst_cost_amt,
          v_asac_curr_qty,
          v_buy_ref_rate,
          v_sell_ref_rate,
          v_combo_code,
          v_combo_posi_id,
          v_order_date,
          v_target_stock_code_no,
          v_error_code,
          v_error_info,
          v_open_posi_date);
      if v_error_code = "1" then
          SET v_error_code = "tdsecuA.10.59.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* set @交易变动数量# = @订单数量# - @成交数量#; */
      set v_trade_occur_qty = v_order_qty - v_strike_qty;

      /* if(@订单方向# =1 or @订单方向# =4) then */
      if(v_order_dir =1 or v_order_dir =4) then

        /* set @交易变动金额# = @补单订单冻结金额#; */
        set v_trade_occur_amt = v_order_append_frozen_amt;

      /* elseif(@订单方向# =2) then */
      elseif(v_order_dir =2) then

        /* set @交易变动金额# = @订单价格# * @交易变动数量#; */
        set v_trade_occur_amt = v_order_price * v_trade_occur_qty;

        /* if (@证券类型# > (20)) and (@证券类型# < (50)) and (@净价标志# = 《净价标志-净价》) and (@债券利率类型# <> 《债券利率类型-零息》) then */
        if (v_stock_type > (20)) and (v_stock_type < (50)) and (v_net_price_flag = 1) and (v_bond_rate_type <> 3) then

          /* set @交易变动金额# = (@订单价格# + round(@债券计提利息#,3)) * @交易变动数量#; */
          set v_trade_occur_amt = (v_order_price + round(v_bond_accr_intrst,3)) * v_trade_occur_qty;
        end if;

      /* elseif(@订单方向# =3) then */
      elseif(v_order_dir =3) then

         /* set @交易变动金额# = @票面面值# * @交易变动数量#; */
         set v_trade_occur_amt = v_par_value * v_trade_occur_qty;
      end if;

      /* set @交易组编号# = @补单交易组编号#; */
      set v_exch_group_no = v_order_append_exch_group_no;

      /* set @交易变动数量# = -@交易变动数量#; */
      set v_trade_occur_qty = -v_trade_occur_qty;

      /* set @交易变动金额# = -@交易变动金额#; */
      set v_trade_occur_amt = -v_trade_occur_amt;

      /* set  @成交变动数量# = -@成交数量#; */
      set  v_strike_occur_qty = -v_strike_qty;

      /* set  @成交变动金额# = -@成交金额#; */
      set  v_strike_occur_amt = -v_strike_amt;

      /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
      call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
          v_order_dir,
          v_comm_id,
          v_strike_id,
          v_exch_no,
          v_stock_code,
          v_stock_acco_no,
          v_stock_code_no,
          v_trade_code_no,
          v_target_code_no,
          v_asset_type,
          v_stock_type,
          v_strike_occur_amt,
          v_strike_occur_qty,
          v_trade_occur_amt,
          v_trade_occur_qty,
          v_impawn_ratio,
          v_repo_order_id,
          v_repo_strike_id,
          v_strike_no,
          v_strike_date,
          v_strike_time,
          v_strike_qty,
          v_strike_price,
          v_strike_amt,
          v_strike_fee,
          v_par_value,
          v_net_price_flag,
          v_intrst_days,
          v_bond_accr_intrst,
          v_bond_rate_type,
          v_repo_days,
          v_repo_cale_days,
          v_repo_back_date,
          v_capit_reback_days,
          v_posi_reback_days,
          v_is_record_jour,
          v_order_oper_way,
          v_cost_calc_type,
          v_exgp_cost_amt,
          v_exgp_intrst_cost_amt,
          v_exgp_curr_qty,
          v_asac_cost_amt,
          v_asac_intrst_cost_amt,
          v_asac_curr_qty,
          v_buy_ref_rate,
          v_sell_ref_rate,
          v_combo_code,
          v_combo_posi_id,
          v_order_date,
          v_target_stock_code_no,
          v_error_code,
          v_error_info,
          v_open_posi_date);
      if v_error_code = "1" then
          SET v_error_code = "tdsecuA.10.59.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

    #已成 部撤

    /* elseif( @订单状态# = '6' or @订单状态# = '7' ) then */
    elseif( v_order_status = '6' or v_order_status = '7' ) then

      /* set @交易变动数量# = @成交数量#+@撤单数量#; */
      set v_trade_occur_qty = v_strike_qty+v_wtdraw_qty;
      #单元证券业务持仓表处理
      #证券业务资金表成交金额处理

      /* if(@订单方向# =1 or @订单方向# =4) then */
      if(v_order_dir =1 or v_order_dir =4) then

        /* set @交易变动金额# = @订单冻结金额#; */
        set v_trade_occur_amt = v_order_frozen_amt;

      /* elseif(@订单方向# =2) then */
      elseif(v_order_dir =2) then

        /* set @交易变动金额# = @订单价格# * @成交数量#; */
        set v_trade_occur_amt = v_order_price * v_strike_qty;

        /* if (@证券类型# > (20)) and (@证券类型# < (50)) and (@净价标志# = 《净价标志-净价》) and (@债券利率类型# <> 《债券利率类型-零息》) then */
        if (v_stock_type > (20)) and (v_stock_type < (50)) and (v_net_price_flag = 1) and (v_bond_rate_type <> 3) then

          /* set @交易变动金额# = (@订单价格# + round(@债券计提利息#,3)) * @交易变动数量#; */
          set v_trade_occur_amt = (v_order_price + round(v_bond_accr_intrst,3)) * v_trade_occur_qty;
        end if;

      /* elseif(@订单方向# =3) then */
      elseif(v_order_dir =3) then

         /* set @交易变动金额# = @票面面值# * @交易变动数量#; */
         set v_trade_occur_amt = v_par_value * v_trade_occur_qty;
      end if;

      /* set @交易变动数量# = 0; */
      set v_trade_occur_qty = 0;

      /* set @交易变动金额# = 0; */
      set v_trade_occur_amt = 0;

      /* set @成交变动数量# = @成交数量#; */
      set v_strike_occur_qty = v_strike_qty;

      /* set @成交变动金额# = @成交金额#; */
      set v_strike_occur_amt = v_strike_amt;

      /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
      call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
          v_order_dir,
          v_comm_id,
          v_strike_id,
          v_exch_no,
          v_stock_code,
          v_stock_acco_no,
          v_stock_code_no,
          v_trade_code_no,
          v_target_code_no,
          v_asset_type,
          v_stock_type,
          v_strike_occur_amt,
          v_strike_occur_qty,
          v_trade_occur_amt,
          v_trade_occur_qty,
          v_impawn_ratio,
          v_repo_order_id,
          v_repo_strike_id,
          v_strike_no,
          v_strike_date,
          v_strike_time,
          v_strike_qty,
          v_strike_price,
          v_strike_amt,
          v_strike_fee,
          v_par_value,
          v_net_price_flag,
          v_intrst_days,
          v_bond_accr_intrst,
          v_bond_rate_type,
          v_repo_days,
          v_repo_cale_days,
          v_repo_back_date,
          v_capit_reback_days,
          v_posi_reback_days,
          v_is_record_jour,
          v_order_oper_way,
          v_cost_calc_type,
          v_exgp_cost_amt,
          v_exgp_intrst_cost_amt,
          v_exgp_curr_qty,
          v_asac_cost_amt,
          v_asac_intrst_cost_amt,
          v_asac_curr_qty,
          v_buy_ref_rate,
          v_sell_ref_rate,
          v_combo_code,
          v_combo_posi_id,
          v_order_date,
          v_target_stock_code_no,
          v_error_code,
          v_error_info,
          v_open_posi_date);
      if v_error_code = "1" then
          SET v_error_code = "tdsecuA.10.59.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;

      #如果是部撤并有指令，还要回滚订单A的指令

      /* if(@订单状态# = '7' and @指令序号# >0) then */
      if(v_order_status = '7' and v_comm_id >0) then
        #更新指令表

        /* 调用【原子_交易证券_指令_获取指令信息】*/
        call db_tdsecu.pra_tdseap_CheckCommInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_comm_id,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_crncy_type,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_comm_date,
            v_comm_time,
            v_comm_batch_no,
            v_comm_opor,
            v_comm_executor,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_comm_amt,
            v_order_qty,
            v_comm_cancel_qty,
            v_strike_amt,
            v_strike_qty,
            v_comm_frozen_amt,
            v_comm_frozen_qty,
            v_all_fee,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_strike_status,
            v_comm_status,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_date,
            v_comm_comple_time,
            v_comm_appr_status,
            v_exter_comm_flag,
            v_comm_oper_way,
            v_combo_posi_id,
            v_combo_code,
            v_asset_acco_type,
            v_exist_debt_flag);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.10.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_获取指令信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @成交数量# = @临时_成交数量#; */
        set v_strike_qty = v_tmp_strike_qty;

        /* set @指令变动金额# = 0; */
        set v_comm_occur_amt = 0;

        /* if @指令方向# = 1 then */
        if v_comm_dir = 1 then

          /* set @指令变动金额# = @指令实际限价# * @成交数量#; */
          set v_comm_occur_amt = v_limit_actual_price * v_strike_qty;

          /* if (@证券类型# > (20)) and (@证券类型# < (50)) and (@净价标志# = 《净价标志-净价》) and (@债券利率类型# <> 《债券利率类型-零息》) then */
          if (v_stock_type > (20)) and (v_stock_type < (50)) and (v_net_price_flag = 1) and (v_bond_rate_type <> 3) then

            /* set @指令变动金额# = (@指令实际限价# + @债券计提利息#) * @成交数量#; */
            set v_comm_occur_amt = (v_limit_actual_price + v_bond_accr_intrst) * v_strike_qty;
          end if;

        /* elseif @指令方向# = 2 then */
        elseif v_comm_dir = 2 then

          /* set @指令变动金额# = @指令实际限价# * @成交数量#; */
          set v_comm_occur_amt = v_limit_actual_price * v_strike_qty;

          /* if (@证券类型# > (20)) and (@证券类型# < (50)) and (@净价标志# = 《净价标志-净价》) and (@债券利率类型# <> 《债券利率类型-零息》) then */
          if (v_stock_type > (20)) and (v_stock_type < (50)) and (v_net_price_flag = 1) and (v_bond_rate_type <> 3) then

            /* set @指令变动金额# = (@指令实际限价# + round(@债券计提利息#,3)) * @成交数量#; */
            set v_comm_occur_amt = (v_limit_actual_price + round(v_bond_accr_intrst,3)) * v_strike_qty;
          end if;

        /* elseif @指令方向# = 3 or @指令方向# = 4 then */
        elseif v_comm_dir = 3 or v_comm_dir = 4 then

          /* set @指令变动金额# = @票面面值# * @成交数量#; */
          set v_comm_occur_amt = v_par_value * v_strike_qty;
        end if;

        /* set @指令变动数量# = -@成交数量#; */
        set v_comm_occur_qty = -v_strike_qty;

        /* set @指令变动金额# = -@指令变动金额#; */
        set v_comm_occur_amt = -v_comm_occur_amt;

        /* set @交易变动金额# = 0; */
        set v_trade_occur_amt = 0;

        /* set @交易变动数量# = 0; */
        set v_trade_occur_qty = 0;

        /* 调用【原子_交易证券_账户_更新指令交易资金持仓】*/
        call db_tdsecu.pra_tdseac_UpdateApprExchCashPosi(
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
            v_exch_crncy_type,
            v_comm_id,
            v_order_id,
            v_exch_no,
            v_stock_code,
            v_stock_type,
            v_asset_type,
            v_order_dir,
            v_impawn_ratio,
            v_stock_acco_no,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_comm_occur_amt,
            v_comm_occur_qty,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_is_record_jour,
            v_order_oper_way,
            v_busi_opor_no,
            v_open_close_permission,
            v_avail_cal_flag,
            v_combo_code,
            v_combo_posi_id,
            v_target_stock_code_no,
            v_error_code,
            v_error_info,
            v_open_posi_date);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.10.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

      end if;

      /* set @成交数量# = @临时_成交数量#; */
      set v_strike_qty = v_tmp_strike_qty;

      /* set @成交金额# = @临时_成交金额#; */
      set v_strike_amt = v_tmp_strike_amt;

      /* set @交易组编号# = @补单交易组编号#; */
      set v_exch_group_no = v_order_append_exch_group_no;

      /* set @交易变动数量# = 0; */
      set v_trade_occur_qty = 0;

      /* set @交易变动金额# = 0; */
      set v_trade_occur_amt = 0;

      /* set  @成交变动数量# = -@成交数量#; */
      set  v_strike_occur_qty = -v_strike_qty;

      /* set  @成交变动金额# = -@成交金额#; */
      set  v_strike_occur_amt = -v_strike_amt;

      /* set  @成交数量# = -@成交数量#; */
      set  v_strike_qty = -v_strike_qty;

      /* 调用【原子_交易证券_账户_更新成交资金持仓】*/
      call db_tdsecu.pra_tdseac_UpdateStrikeCashPosi(
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
          v_order_dir,
          v_comm_id,
          v_strike_id,
          v_exch_no,
          v_stock_code,
          v_stock_acco_no,
          v_stock_code_no,
          v_trade_code_no,
          v_target_code_no,
          v_asset_type,
          v_stock_type,
          v_strike_occur_amt,
          v_strike_occur_qty,
          v_trade_occur_amt,
          v_trade_occur_qty,
          v_impawn_ratio,
          v_repo_order_id,
          v_repo_strike_id,
          v_strike_no,
          v_strike_date,
          v_strike_time,
          v_strike_qty,
          v_strike_price,
          v_strike_amt,
          v_strike_fee,
          v_par_value,
          v_net_price_flag,
          v_intrst_days,
          v_bond_accr_intrst,
          v_bond_rate_type,
          v_repo_days,
          v_repo_cale_days,
          v_repo_back_date,
          v_capit_reback_days,
          v_posi_reback_days,
          v_is_record_jour,
          v_order_oper_way,
          v_cost_calc_type,
          v_exgp_cost_amt,
          v_exgp_intrst_cost_amt,
          v_exgp_curr_qty,
          v_asac_cost_amt,
          v_asac_intrst_cost_amt,
          v_asac_curr_qty,
          v_buy_ref_rate,
          v_sell_ref_rate,
          v_combo_code,
          v_combo_posi_id,
          v_order_date,
          v_target_stock_code_no,
          v_error_code,
          v_error_info,
          v_open_posi_date);
      if v_error_code = "1" then
          SET v_error_code = "tdsecuA.10.59.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 原子_交易证券_交易运维_补单关联废单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_AppendOrderAssociatedOriginalWasteOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_AppendOrderAssociatedOriginalWasteOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id bigint,
    IN p_new_order_id bigint,
    IN p_order_batch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_append_exch_group_no int,
    OUT p_order_append_frozen_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_order_status varchar(2),
    OUT p_comm_batch_no int,
    OUT p_wtdraw_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_order_id bigint;
    declare v_new_order_id bigint;
    declare v_order_batch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_append_exch_group_no int;
    declare v_order_append_frozen_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_order_status varchar(2);
    declare v_comm_batch_no int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_opor int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_frozen_qty decimal(18,2);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_remark_info varchar(255);
    declare v_cost_calc_type int;
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_strategy_id bigint;
    declare v_sett_flag int;
    declare v_target_stock_code varchar(6);
    declare v_target_stock_code_no int;
    declare v_registration_agency varchar(32);
    declare v_trade_acco varchar(32);
    declare v_contra_no varchar(32);
    declare v_asset_acco_type int;
    declare v_exist_debt_flag int;
    declare v_busi_opor_no int;
    declare v_tmp_order_oper_way varchar(2);
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_wtdraw_qty decimal(18,2);
    declare v_tmp_strike_amt decimal(18,4);
    declare v_new_order_no int;
    declare v_tmp_buy_strike_qty decimal(18,2);
    declare v_tmp_buy_strike_amt decimal(18,4);
    declare v_tmp_buy_order_qty decimal(18,2);
    declare v_tmp_sell_strike_qty decimal(18,2);
    declare v_tmp_sell_strike_amt decimal(18,4);
    declare v_tmp_sell_order_qty decimal(18,2);
    declare v_order_sum_status varchar(2);
    declare v_waste_qty decimal(18,2);
    declare v_strike_aver_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_date int;
    declare v_occur_amt decimal(18,4);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_comm_time int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_strike_status varchar(2);
    declare v_comm_sum_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_max_comm_comple_date int;
    declare v_max_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_qty decimal(18,2);
    declare v_comm_sum_approve_status varchar(2);
    declare v_basket_id bigint;
    declare v_buy_order_qty decimal(18,2);
    declare v_sell_order_qty decimal(18,2);
    declare v_buy_comm_qty decimal(18,2);
    declare v_sell_comm_qty decimal(18,2);
    declare v_buy_strike_qty decimal(18,2);
    declare v_sell_strike_qty decimal(18,2);
    declare v_buy_strike_amt decimal(18,4);
    declare v_sell_strike_amt decimal(18,4);
    declare v_buy_comm_amt decimal(18,4);
    declare v_sell_comm_amt decimal(18,4);
    declare v_comm_oper_way varchar(2);
    declare v_comm_remark_info varchar(1024);
    declare v_read_flag int;
    declare v_acco_concat_info varchar(4096);

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
    SET v_order_id = p_order_id;
    SET v_new_order_id = p_new_order_id;
    SET v_order_batch_no = p_order_batch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_append_exch_group_no = 0;
    SET v_order_append_frozen_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_order_status = "0";
    SET v_comm_batch_no = 0;
    SET v_wtdraw_qty = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_opor = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_dir = 0;
    SET v_price_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_impawn_ratio = 0;
    SET v_order_frozen_amt = 0;
    SET v_order_frozen_qty = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_remark_info = " ";
    SET v_cost_calc_type = 0;
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_strategy_id = 0;
    SET v_sett_flag = 0;
    SET v_target_stock_code = " ";
    SET v_target_stock_code_no = 0;
    SET v_registration_agency = " ";
    SET v_trade_acco = " ";
    SET v_contra_no = " ";
    SET v_asset_acco_type = 0;
    SET v_exist_debt_flag = 0;
    SET v_busi_opor_no = 0;
    SET v_tmp_order_oper_way = " ";
    SET v_tmp_strike_qty = 0;
    SET v_tmp_wtdraw_qty = 0;
    SET v_tmp_strike_amt = 0;
    SET v_new_order_no = 0;
    SET v_tmp_buy_strike_qty = 0;
    SET v_tmp_buy_strike_amt = 0;
    SET v_tmp_buy_order_qty = 0;
    SET v_tmp_sell_strike_qty = 0;
    SET v_tmp_sell_strike_amt = 0;
    SET v_tmp_sell_order_qty = 0;
    SET v_order_sum_status = "0";
    SET v_waste_qty = 0;
    SET v_strike_aver_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_occur_amt = 0;
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_await_cancel_qty = 0;
    SET v_strike_status = "0";
    SET v_comm_sum_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_max_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_max_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_qty = 0;
    SET v_comm_sum_approve_status = "0";
    SET v_basket_id = 0;
    SET v_buy_order_qty = 0;
    SET v_sell_order_qty = 0;
    SET v_buy_comm_qty = 0;
    SET v_sell_comm_qty = 0;
    SET v_buy_strike_qty = 0;
    SET v_sell_strike_qty = 0;
    SET v_buy_strike_amt = 0;
    SET v_sell_strike_amt = 0;
    SET v_buy_comm_amt = 0;
    SET v_sell_comm_amt = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_remark_info = " ";
    SET v_read_flag = 0;
    SET v_acco_concat_info = " ";

    
    label_pro:BEGIN
    
    #找到原订单A这条订单记录，更新订单状态，补填订单记录的申报编号，申报日期和时间等字段

    /* [锁定获取表记录变量][交易证券_交易_订单表][字段][字段变量][{记录序号} = @订单序号#][1][concat("获取订单表失败,订单编号=",@订单序号#)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, external_no, 
        comm_id, comm_batch_no, comm_opor, report_date, 
        report_time, report_no, order_date, order_time, 
        order_batch_no, order_dir, price_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_amt, 
        strike_qty, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, strike_bond_accr_intrst, impawn_ratio, 
        order_frozen_amt, order_frozen_qty, rsp_info, compli_trig_id, 
        remark_info, cost_calc_type, order_oper_way, exter_comm_flag, 
        record_valid_flag, combo_code, combo_posi_id, strategy_id, 
        sett_flag, target_stock_code, target_stock_code_no, registration_agency, 
        trade_acco, contra_no, asset_acco_type, exist_debt_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_stock_acco_no, 
        v_stock_acco, v_stock_code_no, v_stock_code, v_trade_code_no, 
        v_target_code_no, v_stock_type, v_asset_type, v_external_no, 
        v_comm_id, v_comm_batch_no, v_comm_opor, v_report_date, 
        v_report_time, v_report_no, v_order_date, v_order_time, 
        v_order_batch_no, v_order_dir, v_price_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_amt, 
        v_strike_qty, v_all_fee, v_stamp_tax, v_trans_fee, 
        v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
        v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
        v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
        v_bond_accr_intrst, v_bond_rate_type, v_strike_bond_accr_intrst, v_impawn_ratio, 
        v_order_frozen_amt, v_order_frozen_qty, v_rsp_info, v_compli_trig_id, 
        v_remark_info, v_cost_calc_type, v_order_oper_way, v_exter_comm_flag, 
        v_record_valid_flag, v_combo_code, v_combo_posi_id, v_strategy_id, 
        v_sett_flag, v_target_stock_code, v_target_stock_code_no, v_registration_agency, 
        v_trade_acco, v_contra_no, v_asset_acco_type, v_exist_debt_flag from db_tdsecu.tb_tdsetd_order where row_id = v_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.10.60.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("获取订单表失败,订单编号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("获取订单表失败,订单编号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;

    /* set @临时_订单操作方式# = @订单操作方式#; */
    set v_tmp_order_oper_way = v_order_oper_way;
     #判断订单A的状态，如果不是正报或者废单，就报错返回，【撤单数量，成交数量，申报编号】都必须为0
    #找到补单B这条订单记录，更新订单状态为废单，清空订单记录的申报编号，申报日期和时间

    /* [锁定获取表记录变量][交易证券_交易_订单表][{申报编号}, {申报日期}, {申报时间},{机构编号},{产品编号},{交易组编号},{证券代码},{市场编号},{资产账户编号},{股东代码编号},{订单状态},{撤单数量},{成交金额},{成交数量},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{交易征费},{交易费},{交易系统使用费},{股份交收费},{债券计提利息},{成交债券计提利息},{订单冻结金额},{订单操作方式}][@申报编号#, @申报日期#, @申报时间#, @机构编号#, @产品编号#,@补单交易组编号#, @证券代码#, @市场编号#, @资产账户编号#, @股东代码编号#,@订单状态#,@撤单数量#,@成交金额#,@成交数量#,@全部费用#,@印花税#,@过户费#,@经手费#,@证管费#,@其他费用#,@交易佣金#,@其他佣金#,@交易征费#,@交易费#,@交易系统使用费#,@股份交收费#,@债券计提利息#,@成交债券计提利息#,@补单订单冻结金额#,@订单操作方式#][{记录序号} = @新订单序号#][1][concat("获取订单表失败,订单编号=",@新订单序号#)] */
    select report_no, report_date, report_time,co_no,pd_no,exch_group_no,stock_code,exch_no,asset_acco_no,stock_acco_no,order_status,wtdraw_qty,strike_amt,strike_qty,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,trade_tax,trade_cost_fee,trade_system_use_fee,stock_settle_fee,bond_accr_intrst,strike_bond_accr_intrst,order_frozen_amt,order_oper_way into v_report_no, v_report_date, v_report_time, v_co_no, v_pd_no,v_order_append_exch_group_no, v_stock_code, v_exch_no, v_asset_acco_no, v_stock_acco_no,v_order_status,v_wtdraw_qty,v_strike_amt,v_strike_qty,v_all_fee,v_stamp_tax,v_trans_fee,v_brkage_fee,v_SEC_charges,v_other_fee,v_trade_commis,v_other_commis,v_trade_tax,v_trade_cost_fee,v_trade_system_use_fee,v_stock_settle_fee,v_bond_accr_intrst,v_strike_bond_accr_intrst,v_order_append_frozen_amt,v_order_oper_way from db_tdsecu.tb_tdsetd_order where row_id = v_new_order_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.10.60.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("获取订单表失败,订单编号=",v_new_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("获取订单表失败,订单编号=",v_new_order_id);
        end if;
        leave label_pro;
    end if;


    /* set @临时_成交数量# = @成交数量#; */
    set v_tmp_strike_qty = v_strike_qty;

    /* set @临时_撤单数量# = @撤单数量#; */
    set v_tmp_wtdraw_qty = v_wtdraw_qty;

    /* set @临时_成交金额# = @成交金额#; */
    set v_tmp_strike_amt = v_strike_amt;
    #判断补单B的状态，如果#1:未报 a:待报 b:正报，-1:待审批 ，#4:已撤 -2:审批拒绝 8:废单，就报错返回，操作方式为报盘机补单

    /* [检查报错返回][@订单状态# = '1' or @订单状态# = 'a' or @订单状态# = 'b' or @订单状态# = '-1' or @订单状态# = '4' or @订单状态# = '-2' or @订单状态# = '8' or @订单操作方式# !=《订单操作方式-报盘机补单》][207][concat("处理失败，补单状态不能为未报、待报、正报、待审批、已撤、审批拒绝、废单, 订单状态 = ", @订单状态#,"订单编号=",@新订单序号#,"订单操作方式=",@订单操作方式#)] */
    if v_order_status = '1' or v_order_status = 'a' or v_order_status = 'b' or v_order_status = '-1' or v_order_status = '4' or v_order_status = '-2' or v_order_status = '8' or v_order_oper_way !="33" then
        
        SET v_error_code = "tdsecuA.10.60.207";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("处理失败，补单状态不能为未报、待报、正报、待审批、已撤、审批拒绝、废单, 订单状态 = ", v_order_status,"订单编号=",v_new_order_id,"订单操作方式=",v_order_oper_way),"#",v_mysql_message);
        else
            SET v_error_info = concat("处理失败，补单状态不能为未报、待报、正报、待审批、已撤、审批拒绝、废单, 订单状态 = ", v_order_status,"订单编号=",v_new_order_id,"订单操作方式=",v_order_oper_way);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_交易_订单表][{申报编号} = 0,{申报日期}=0,{申报时间}=0,{记录有效标志}=《记录有效标志-无效》,{订单状态} = 8,{撤单数量} = @订单数量#,{成交数量} = 0,{成交金额} = 0,{全部费用}=0,{印花税}=0,{过户费}=0,{经手费}=0,{证管费}=0,{其他费用}=0,{交易佣金}=0,{其他佣金}=0,{交易征费}=0,{交易费}=0,{交易系统使用费}=0,{股份交收费}=0][{记录序号}=@新订单序号#][2][concat("更新订单表失败,订单编号=",@新订单编号#)] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, report_no = 0,report_date=0,report_time=0,record_valid_flag=2,order_status = 8,wtdraw_qty = v_order_qty,strike_qty = 0,strike_amt = 0,all_fee=0,stamp_tax=0,trans_fee=0,brkage_fee=0,SEC_charges=0,other_fee=0,trade_commis=0,other_commis=0,trade_tax=0,trade_cost_fee=0,trade_system_use_fee=0,stock_settle_fee=0 where row_id=v_new_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.10.60.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("更新订单表失败,订单编号=",v_new_order_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("更新订单表失败,订单编号=",v_new_order_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_交易_订单表][{申报编号} = @申报编号#,{申报日期}=@申报日期#,{申报时间}=@申报时间#,{订单状态}=@订单状态#,{撤单数量}={撤单数量}-@成交数量#,{成交金额}=@成交金额#,{成交数量}=@成交数量#,{全部费用}=@全部费用#,{印花税}=@印花税#,{过户费}=@过户费#,{经手费}=@经手费#,{证管费}=@证管费#,{其他费用}=@其他费用#,{交易佣金}=@交易佣金#,{其他佣金}=@其他佣金#,{交易征费}=@交易征费#,{交易费}=@交易费#,{交易系统使用费}=@交易系统使用费#,{股份交收费}=@股份交收费#,{债券计提利息}=@债券计提利息#,{成交债券计提利息}=@成交债券计提利息#,{订单冻结金额}=@补单订单冻结金额#][{记录序号}=@订单序号#][2][concat("更新订单表失败,订单编号=",@订单序号#)] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, report_no = v_report_no,report_date=v_report_date,report_time=v_report_time,order_status=v_order_status,wtdraw_qty=wtdraw_qty-v_strike_qty,strike_amt=v_strike_amt,strike_qty=v_strike_qty,all_fee=v_all_fee,stamp_tax=v_stamp_tax,trans_fee=v_trans_fee,brkage_fee=v_brkage_fee,SEC_charges=v_SEC_charges,other_fee=v_other_fee,trade_commis=v_trade_commis,other_commis=v_other_commis,trade_tax=v_trade_tax,trade_cost_fee=v_trade_cost_fee,trade_system_use_fee=v_trade_system_use_fee,stock_settle_fee=v_stock_settle_fee,bond_accr_intrst=v_bond_accr_intrst,strike_bond_accr_intrst=v_strike_bond_accr_intrst,order_frozen_amt=v_order_append_frozen_amt where row_id=v_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.10.60.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("更新订单表失败,订单编号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("更新订单表失败,订单编号=",v_order_id);
        end if;
        leave label_pro;
    end if;


    /* if @订单方向#=《订单方向-买入》 or @订单方向# = 《订单方向-融资买入》  then */
    if v_order_dir=1 or v_order_dir = 5  then

        /* set @临时_买入成交数量# = @成交数量#; */
        set v_tmp_buy_strike_qty = v_strike_qty;

        /* set @临时_买入成交金额# = @成交金额#; */
        set v_tmp_buy_strike_amt = v_strike_amt;

        /* set @临时_买入订单数量# = @成交数量#; */
        set v_tmp_buy_order_qty = v_strike_qty;
    else

        /* set @临时_卖出成交数量# = @成交数量#; */
        set v_tmp_sell_strike_qty = v_strike_qty;

        /* set @临时_卖出成交金额# = @成交金额#; */
        set v_tmp_sell_strike_amt = v_strike_amt;

        /* set @临时_卖出订单数量# = @成交数量#; */
        set v_tmp_sell_order_qty = v_strike_qty;
    end if;

    /* if @订单批号# >0   then */
    if v_order_batch_no >0   then

        /* [更新表记录][交易证券_交易_订单汇总表][{撤单数量}={撤单数量}-@成交数量#,{成交金额}={成交金额}+@成交金额#,{成交数量}={成交数量}+@成交数量#,{全部费用}={全部费用}+@全部费用#,{印花税}={印花税}+@印花税#,{过户费}={过户费}+@过户费#,{经手费}={经手费}+@经手费#,{证管费}={证管费}+@证管费#,{其他费用}={其他费用}+@其他费用#,{交易佣金}={交易佣金}+@交易佣金#,{其他佣金}={其他佣金}+@其他佣金#,{交易征费}={交易征费}+@交易征费#,{交易费}={交易费}+@交易费#,{交易系统使用费}={交易系统使用费}+@交易系统使用费#,{股份交收费}={股份交收费}+@股份交收费#,{成交债券计提利息}={成交债券计提利息}+@成交债券计提利息#][{订单批号}=@订单批号# and {机构编号} = @机构编号# and {订单日期}=@订单日期#][2][concat("更新订单表失败,订单批号=",@订单批号#)] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdsetd_sumorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, wtdraw_qty=wtdraw_qty-v_strike_qty,strike_amt=strike_amt+v_strike_amt,strike_qty=strike_qty+v_strike_qty,all_fee=all_fee+v_all_fee,stamp_tax=stamp_tax+v_stamp_tax,trans_fee=trans_fee+v_trans_fee,brkage_fee=brkage_fee+v_brkage_fee,SEC_charges=SEC_charges+v_SEC_charges,other_fee=other_fee+v_other_fee,trade_commis=trade_commis+v_trade_commis,other_commis=other_commis+v_other_commis,trade_tax=trade_tax+v_trade_tax,trade_cost_fee=trade_cost_fee+v_trade_cost_fee,trade_system_use_fee=trade_system_use_fee+v_trade_system_use_fee,stock_settle_fee=stock_settle_fee+v_stock_settle_fee,strike_bond_accr_intrst=strike_bond_accr_intrst+v_strike_bond_accr_intrst where order_batch_no=v_order_batch_no and co_no = v_co_no and order_date=v_order_date;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.10.60.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("更新订单表失败,订单批号=",v_order_batch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("更新订单表失败,订单批号=",v_order_batch_no);
            end if;
            leave label_pro;
        end if;


        /* [锁定获取表记录变量][交易证券_交易_订单汇总表][字段][字段变量][{订单日期}=@订单日期# and {机构编号} = @机构编号# and {订单批号}= @订单批号#][4][@订单日期#, @机构编号#, @订单批号#] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            exch_crncy_type, exch_no, stock_code_no, stock_code, 
            trade_code_no, target_code_no, stock_type, asset_type, 
            external_no, order_date, order_batch_no, order_dir, 
            price_type, order_price, order_qty, order_sum_status, 
            wtdraw_qty, waste_qty, strike_amt, strike_qty, 
            strike_aver_price, all_fee, stamp_tax, trans_fee, 
            brkage_fee, SEC_charges, other_fee, trade_commis, 
            other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
            stock_settle_fee, net_price_flag, intrst_days, par_value, 
            bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
            order_oper_way, exter_comm_flag, record_valid_flag into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_opor_co_no, 
            v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
            v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
            v_exch_crncy_type, v_exch_no, v_stock_code_no, v_stock_code, 
            v_trade_code_no, v_target_code_no, v_stock_type, v_asset_type, 
            v_external_no, v_order_date, v_order_batch_no, v_order_dir, 
            v_price_type, v_order_price, v_order_qty, v_order_sum_status, 
            v_wtdraw_qty, v_waste_qty, v_strike_amt, v_strike_qty, 
            v_strike_aver_price, v_all_fee, v_stamp_tax, v_trans_fee, 
            v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
            v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
            v_stock_settle_fee, v_net_price_flag, v_intrst_days, v_par_value, 
            v_bond_accr_intrst, v_bond_rate_type, v_impawn_ratio, v_strike_bond_accr_intrst, 
            v_order_oper_way, v_exter_comm_flag, v_record_valid_flag from db_tdsecu.tb_tdsetd_sumorder where order_date=v_order_date and co_no = v_co_no and order_batch_no= v_order_batch_no limit 1 for update;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.10.60.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单日期=",v_order_date,","," 机构编号=", v_co_no,","," 订单批号=", v_order_batch_no);
            end if;
            leave label_pro;
        end if;


        /* 调用【原子_交易证券_公用_计算订单汇总状态】*/
        call db_tdsecu.pra_tdsepb_CaclOrderSumStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_qty,
            v_wtdraw_qty,
            v_strike_qty,
            v_waste_qty,
            v_error_code,
            v_error_info,
            v_order_sum_status);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.10.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算订单汇总状态出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* [更新表记录][交易证券_交易_订单汇总表][{订单汇总状态}=@订单汇总状态#][{订单批号}=@订单批号# and {机构编号} = @机构编号# and {订单日期}=@订单日期#][2][concat("更新订单表失败,订单批号=",@订单批号#)] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdsetd_sumorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_sum_status=v_order_sum_status where order_batch_no=v_order_batch_no and co_no = v_co_no and order_date=v_order_date;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.10.60.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("更新订单表失败,订单批号=",v_order_batch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("更新订单表失败,订单批号=",v_order_batch_no);
            end if;
            leave label_pro;
        end if;

    end if;
    #更新指令表

    /* set @成交数量# = @临时_成交数量#; */
    set v_strike_qty = v_tmp_strike_qty;

    /* set @撤单数量# = @临时_撤单数量#; */
    set v_wtdraw_qty = v_tmp_wtdraw_qty;

    /* set @成交金额# = @临时_成交金额#; */
    set v_strike_amt = v_tmp_strike_amt;

    /* if (@指令序号# >0) then */
    if (v_comm_id >0) then

      /* [获取表记录变量][交易证券_指令_指令表][{指令实际限价},{指令日期}][@指令实际限价#,@指令日期#][{记录序号}=@指令序号#][1][concat("获取指令表失败,指令序号=",@指令序号#)] */
      select limit_actual_price,comm_date into v_limit_actual_price,v_comm_date from db_tdsecu.tb_tdseap_command where row_id=v_comm_id limit 1;
      if FOUND_ROWS() = 0 then
                  
          SET v_error_code = "tdsecuA.10.60.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("获取指令表失败,指令序号=",v_comm_id),"#",v_mysql_message);
          else
              SET v_error_info = concat("获取指令表失败,指令序号=",v_comm_id);
          end if;
          leave label_pro;
      end if;


      /* if @净价标志# = 《净价标志-净价》 then */
      if v_net_price_flag = 1 then

        /* set @变动金额# = @撤单数量# * (@指令实际限价# + @债券计提利息#); */
        set v_occur_amt = v_wtdraw_qty * (v_limit_actual_price + v_bond_accr_intrst);
      else

        /* set @变动金额# = @撤单数量# * @指令实际限价#; */
        set v_occur_amt = v_wtdraw_qty * v_limit_actual_price;
      end if;

      /* [更新表记录][交易证券_指令_指令表][{订单数量} = {订单数量} + @成交数量#,{指令冻结金额} = case when ({指令方向} = 1 or {指令方向} = 4) and {指令状态} not in ("4", "5","6") then {指令冻结金额} + @变动金额# else {指令冻结金额} end,{成交数量} = {成交数量}  + @成交数量#,{成交金额}= {成交金额} + @成交金额#,{成交状态}=case when {指令数量} = {成交数量} then "3"
when {指令数量} > {成交数量} then "2" else {成交状态} end,{指令状态} = case when {指令数量} = {订单数量} and {指令状态} not in ("4", "5","6") then "3"
             when {订单数量} = 0 and {指令状态} not in ("4", "5","6","7") then "1"
             when {指令数量} > {订单数量} + {指令撤销数量} and {指令状态} not in ("4", "5","6","7") then "2"
    when {指令数量} = {指令撤销数量} then "6"
    when {指令数量} > {指令撤销数量} and {指令撤销数量} > 0 then "5"
             else {指令状态}
             end,{指令完成日期} = case when {指令数量} - {指令撤销数量} - {成交数量} = 0 then @指令完成日期# else 0 end,{指令完成时间} = case when {指令数量} - {指令撤销数量} - {成交数量} = 0 then @指令完成时间# else 0 end,{指令完成标志}= case when {指令数量} - {指令撤销数量} - {成交数量} = 0 then 《指令完成标志-已完成》 else 《指令完成标志-未完成》 end][{记录序号}=@指令序号#][2][concat("更新指令表失败,指令序号=",@指令序号#)] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_tdsecu.tb_tdseap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_qty = order_qty + v_strike_qty,comm_frozen_amt = case when (comm_dir = 1 or comm_dir = 4) and comm_status not in ("4", "5","6") then comm_frozen_amt + v_occur_amt else comm_frozen_amt end,strike_qty = strike_qty  + v_strike_qty,strike_amt= strike_amt + v_strike_amt,strike_status=case when comm_qty = strike_qty then "3"
      when comm_qty > strike_qty then "2" else strike_status end,comm_status = case when comm_qty = order_qty and comm_status not in ("4", "5","6") then "3"
                   when order_qty = 0 and comm_status not in ("4", "5","6","7") then "1"
                   when comm_qty > order_qty + comm_cancel_qty and comm_status not in ("4", "5","6","7") then "2"
          when comm_qty = comm_cancel_qty then "6"
          when comm_qty > comm_cancel_qty and comm_cancel_qty > 0 then "5"
                   else comm_status
                   end,comm_comple_date = case when comm_qty - comm_cancel_qty - strike_qty = 0 then v_comm_comple_date else 0 end,comm_comple_time = case when comm_qty - comm_cancel_qty - strike_qty = 0 then v_comm_comple_time else 0 end,comm_comple_flag= case when comm_qty - comm_cancel_qty - strike_qty = 0 then 2 else 1 end where row_id=v_comm_id;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdsecuA.10.60.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("更新指令表失败,指令序号=",v_comm_id),"#",v_mysql_message);
          else
              SET v_error_info = concat("更新指令表失败,指令序号=",v_comm_id);
          end if;
          leave label_pro;
      end if;


        /* if @指令批号# > 0 then */
        if v_comm_batch_no > 0 then

            /* [更新表记录][交易证券_指令_指令汇总表][{订单数量} = {订单数量} + @成交数量#,{成交数量} = {成交数量}  + @成交数量#,{成交金额}= {成交金额} + @成交金额#,{买入成交数量} = {买入成交数量}+@临时_买入成交数量#,{买入成交金额} = {买入成交金额} +@临时_买入成交金额#,{卖出成交数量} = {卖出成交数量}+@临时_卖出成交数量#,{卖出成交金额} = {卖出成交金额}+@临时_卖出成交金额#,{买入订单数量} = {买入订单数量}+@临时_买入订单数量#,{卖出订单数量} = {卖出订单数量}+@临时_卖出订单数量#][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号#][2][concat("更新指令汇总表失败,指令批号=",@指令批号#)] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseap_sumcommand set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_qty = order_qty + v_strike_qty,strike_qty = strike_qty  + v_strike_qty,strike_amt= strike_amt + v_strike_amt,buy_strike_qty = buy_strike_qty+v_tmp_buy_strike_qty,buy_strike_amt = buy_strike_amt +v_tmp_buy_strike_amt,sell_strike_qty = sell_strike_qty+v_tmp_sell_strike_qty,sell_strike_amt = sell_strike_amt+v_tmp_sell_strike_amt,buy_order_qty = buy_order_qty+v_tmp_buy_order_qty,sell_order_qty = sell_order_qty+v_tmp_sell_order_qty where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.10.60.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("更新指令汇总表失败,指令批号=",v_comm_batch_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("更新指令汇总表失败,指令批号=",v_comm_batch_no);
                end if;
                leave label_pro;
            end if;


            /* [锁定获取表记录变量][交易证券_指令_指令汇总表][字段][字段变量][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号#][1][@指令日期#, @机构编号#, @指令批号#] */
            select row_id, create_date, create_time, 
                update_date, update_time, update_times, opor_co_no, 
                opor_no, oper_mac, oper_ip_addr, oper_info, 
                oper_way, oper_func_code, init_date, co_no, 
                pd_no, exch_group_no, asset_acco_no, pass_no, 
                out_acco, exch_crncy_type, exch_no, stock_code_no, 
                stock_code, target_code_no, trade_code_no, stock_type, 
                asset_type, comm_date, comm_time, comm_batch_no, 
                comm_opor, comm_executor, comm_dir, comm_limit_price, 
                limit_actual_price, comm_qty, comm_amt, order_qty, 
                comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
                net_price_flag, par_value, impawn_ratio, intrst_days, 
                bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
                comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
                comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
                comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
                basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
                sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
                sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
                exter_comm_flag, comm_remark_info, read_flag, acco_concat_info into v_row_id, v_create_date, v_create_time, 
                v_update_date, v_update_time, v_update_times, v_opor_co_no, 
                v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
                v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
                v_out_acco, v_exch_crncy_type, v_exch_no, v_stock_code_no, 
                v_stock_code, v_target_code_no, v_trade_code_no, v_stock_type, 
                v_asset_type, v_comm_date, v_comm_time, v_comm_batch_no, 
                v_comm_opor, v_comm_executor, v_comm_dir, v_comm_limit_price, 
                v_limit_actual_price, v_comm_qty, v_comm_amt, v_order_qty, 
                v_comm_cancel_qty, v_comm_await_cancel_qty, v_strike_amt, v_strike_qty, 
                v_net_price_flag, v_par_value, v_impawn_ratio, v_intrst_days, 
                v_bond_accr_intrst, v_bond_rate_type, v_strike_status, v_comm_sum_status, 
                v_comm_begin_date, v_comm_end_date, v_comm_begin_time, v_comm_end_time, 
                v_comm_comple_date, v_comm_comple_time, v_max_comm_comple_date, v_max_comm_comple_time, 
                v_comm_appr_date, v_comm_appr_time, v_comm_appr_qty, v_comm_sum_approve_status, 
                v_basket_id, v_buy_order_qty, v_sell_order_qty, v_buy_comm_qty, 
                v_sell_comm_qty, v_buy_strike_qty, v_sell_strike_qty, v_buy_strike_amt, 
                v_sell_strike_amt, v_buy_comm_amt, v_sell_comm_amt, v_comm_oper_way, 
                v_exter_comm_flag, v_comm_remark_info, v_read_flag, v_acco_concat_info from db_tdsecu.tb_tdseap_sumcommand where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no limit 1 for update;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "tdsecuA.10.60.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no);
                end if;
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_公用_计算指令汇总状态】*/
            call db_tdsecu.pra_tdsepb_CaclCommSumStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_comm_qty,
                v_order_qty,
                v_comm_cancel_qty,
                v_comm_await_cancel_qty,
                v_strike_qty,
                v_error_code,
                v_error_info,
                v_comm_sum_status);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.10.60.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令汇总状态出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* 调用【原子_交易证券_公用_计算指令成交状态】*/
            call db_tdsecu.pra_tdsepb_CaclCommStrikeStatus(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_comm_qty,
                v_strike_qty,
                v_comm_cancel_qty,
                v_error_code,
                v_error_info,
                v_strike_status,
                v_comm_comple_date,
                v_comm_comple_time);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.10.60.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令成交状态出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_指令_指令汇总表][{指令汇总状态}=@指令汇总状态#, {成交状态}=@成交状态#][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号#][2][@指令日期#, @机构编号#, @指令批号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdseap_sumcommand set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, comm_sum_status=v_comm_sum_status, strike_status=v_strike_status where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.10.60.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no);
                end if;
                leave label_pro;
            end if;

        end if;
    end if;

    /* set @成交数量# = @临时_成交数量#; */
    set v_strike_qty = v_tmp_strike_qty;

    /* set @撤单数量# = @临时_撤单数量#; */
    set v_wtdraw_qty = v_tmp_wtdraw_qty;

    /* set @成交金额# = @临时_成交金额#; */
    set v_strike_amt = v_tmp_strike_amt;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_append_exch_group_no = v_order_append_exch_group_no;
    SET p_order_append_frozen_amt = v_order_append_frozen_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_order_status = v_order_status;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_wtdraw_qty = v_wtdraw_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询机构统计异常订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryConoExceptionOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryConoExceptionOrder(
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

    /* [获取表记录][交易证券_交易_订单表][{机构编号},count(case when {订单状态}=《订单状态-未报》 then 1 END) AS {未报记录数},count(case when {订单状态}=《订单状态-已报》 then 1 END) AS {已报记录数},count(case when {订单状态}=《订单状态-待报》 then 1 END) AS {待报记录数},count(case when ({订单状态}=《订单状态-待报》 and @机器时间#-{订单时间}>@有效时间#) then 1 END) AS {待报异常数},count(case when {订单状态}=《订单状态-正报》 then 1 END) AS {正报记录数},count(case when ({订单状态}=《订单状态-正报》 and @机器时间#-{订单时间}>@有效时间#) then 1 END) AS {正报异常数},count(case when {订单状态}=《订单状态-待撤》 then 1 END) AS {待撤记录数},count(case when ({订单状态}=《订单状态-待撤》 and @机器时间#-{订单时间}>@有效时间#) then 1 END) AS {待撤异常数},count(case when {订单状态}=《订单状态-部撤》 then 1 END) AS {部撤记录数},count(case when {订单状态}=《订单状态-已撤》 then 1 END) AS {已撤记录数},count(case when {订单状态}=《订单状态-部成》 then 1 END) AS {部成记录数},count(case when {订单状态}=《订单状态-已成》 then 1 END) AS {已成记录数},count(case when {订单状态}=《订单状态-废单》 then 1 END) AS {废单记录数}][{订单日期}=@订单日期#  group by {机构编号}][@指定行数#] */
    if v_row_count = -1 then
        select co_no,count(case when order_status="1" then 1 END) AS no_report_cnt,count(case when order_status="2" then 1 END) AS already_report_cnt,count(case when order_status="a" then 1 END) AS wait_report_cnt,count(case when (order_status="a" and v_mach_time-order_time>v_auth_time) then 1 END) AS wait_report_except_cnt,count(case when order_status="b" then 1 END) AS in_report_cnt,count(case when (order_status="b" and v_mach_time-order_time>v_auth_time) then 1 END) AS in_report_except_cnt,count(case when order_status="3" then 1 END) AS wait_cancel_cnt,count(case when (order_status="3" and v_mach_time-order_time>v_auth_time) then 1 END) AS wait_cancel_except_cnt,count(case when order_status="7" then 1 END) AS part_cancel_cnt,count(case when order_status="4" then 1 END) AS all_cancel_cnt,count(case when order_status="5" then 1 END) AS part_strike_cnt,count(case when order_status="6" then 1 END) AS all_strike_cnt,count(case when order_status="8" then 1 END) AS abolish_cnt from db_tdsecu.tb_tdsetd_order where order_date=v_order_date  group by co_no;
    else
        select co_no,count(case when order_status="1" then 1 END) AS no_report_cnt,count(case when order_status="2" then 1 END) AS already_report_cnt,count(case when order_status="a" then 1 END) AS wait_report_cnt,count(case when (order_status="a" and v_mach_time-order_time>v_auth_time) then 1 END) AS wait_report_except_cnt,count(case when order_status="b" then 1 END) AS in_report_cnt,count(case when (order_status="b" and v_mach_time-order_time>v_auth_time) then 1 END) AS in_report_except_cnt,count(case when order_status="3" then 1 END) AS wait_cancel_cnt,count(case when (order_status="3" and v_mach_time-order_time>v_auth_time) then 1 END) AS wait_cancel_except_cnt,count(case when order_status="7" then 1 END) AS part_cancel_cnt,count(case when order_status="4" then 1 END) AS all_cancel_cnt,count(case when order_status="5" then 1 END) AS part_strike_cnt,count(case when order_status="6" then 1 END) AS all_strike_cnt,count(case when order_status="8" then 1 END) AS abolish_cnt from db_tdsecu.tb_tdsetd_order where order_date=v_order_date  group by co_no limit v_row_count;
    end if;

    #[获取表记录][交易证券_交易_订单表][{记录序号},{机构编号},{订单状态},{订单时间},date_format(curtime(),'%H%i%s') as {机器时间},{订单操作方式}][{订单日期}=@订单日期#  and  (@订单状态串#=" " or instr(@订单状态串#, concat(";",{订单状态},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询指令汇总考核
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QuerySumCommCheck;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QuerySumCommCheck(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_sum_appr_status_str varchar(64),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
    IN p_comm_dir_str varchar(2048),
    IN p_comm_sum_status_str varchar(64),
    IN p_strike_status_str varchar(64),
    IN p_basket_id bigint,
    IN p_comm_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
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
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_sum_appr_status_str varchar(64);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_comm_dir_str varchar(2048);
    declare v_comm_sum_status_str varchar(64);
    declare v_strike_status_str varchar(64);
    declare v_basket_id bigint;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_sum_appr_status_str = p_comm_sum_appr_status_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_sum_status_str = p_comm_sum_status_str;
    SET v_strike_status_str = p_strike_status_str;
    SET v_basket_id = p_basket_id;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_交易运维_指令汇总考核表][字段][(@指令日期#=0 or {指令日期}=@指令日期#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and {机构编号}=@操作员机构编号#  and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#)  and {指令数量} > 0 and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@指令汇总审批状态串#=" " or instr(@指令汇总审批状态串#, concat(";",{指令汇总审批状态},";"))>0) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@资产类型串#=" " or instr(@资产类型串#, concat(";",{资产类型},";"))>0) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@指令汇总状态串#=" " or instr(@指令汇总状态串#, concat(";",{指令汇总状态},";"))>0) and (@成交状态串#=" " or instr(@成交状态串#, concat(";",{成交状态},";"))>0) and (@篮子序号# = 0 or {篮子序号} = @篮子序号#) and (@指令操作方式# = " " or {指令操作方式} = @指令操作方式#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, stock_code_no, 
            stock_code, target_code_no, trade_code_no, stock_type, 
            asset_type, comm_date, comm_time, comm_batch_no, 
            comm_opor, comm_executor, comm_dir, comm_limit_price, 
            limit_actual_price, comm_qty, comm_amt, order_qty, 
            comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
            net_price_flag, par_value, impawn_ratio, intrst_days, 
            bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
            comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
            comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
            basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
            sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
            sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
            exter_comm_flag, valid_aver_price, valid_aver_price_allday, exec_price_diff, 
            exec_price_diff_allday, valid_ratio, valid_ratio_allday, valid_qty, 
            valid_qty_allday, comm_remark_info from db_tdsecu.tb_tdsebk_sumcommand_check where (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and co_no=v_opor_co_no  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor)  and comm_qty > 0 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_sum_appr_status_str=" " or instr(v_comm_sum_appr_status_str, concat(";",comm_sum_approve_status,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_sum_status_str=" " or instr(v_comm_sum_status_str, concat(";",comm_sum_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_basket_id = 0 or basket_id = v_basket_id) and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, stock_code_no, 
            stock_code, target_code_no, trade_code_no, stock_type, 
            asset_type, comm_date, comm_time, comm_batch_no, 
            comm_opor, comm_executor, comm_dir, comm_limit_price, 
            limit_actual_price, comm_qty, comm_amt, order_qty, 
            comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
            net_price_flag, par_value, impawn_ratio, intrst_days, 
            bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
            comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
            comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
            basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
            sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
            sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
            exter_comm_flag, valid_aver_price, valid_aver_price_allday, exec_price_diff, 
            exec_price_diff_allday, valid_ratio, valid_ratio_allday, valid_qty, 
            valid_qty_allday, comm_remark_info from db_tdsecu.tb_tdsebk_sumcommand_check where (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and co_no=v_opor_co_no  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor)  and comm_qty > 0 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_sum_appr_status_str=" " or instr(v_comm_sum_appr_status_str, concat(";",comm_sum_approve_status,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_sum_status_str=" " or instr(v_comm_sum_status_str, concat(";",comm_sum_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_basket_id = 0 or basket_id = v_basket_id) and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_交易运维_指令汇总考核表][字段][(@指令日期#=0 or {指令日期}=@指令日期#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and {机构编号}=@操作员机构编号#  and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#) and {指令数量} > 0 and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@指令汇总审批状态串#=" " or instr(@指令汇总审批状态串#, concat(";",{指令汇总审批状态},";"))>0) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@资产类型串#=" " or instr(@资产类型串#, concat(";",{资产类型},";"))>0) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@指令汇总状态串#=" " or instr(@指令汇总状态串#, concat(";",{指令汇总状态},";"))>0) and (@成交状态串#=" " or instr(@成交状态串#, concat(";",{成交状态},";"))>0) and (@篮子序号# = 0 or {篮子序号} = @篮子序号#) and (@指令操作方式# = " " or {指令操作方式} = @指令操作方式#) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, stock_code_no, 
            stock_code, target_code_no, trade_code_no, stock_type, 
            asset_type, comm_date, comm_time, comm_batch_no, 
            comm_opor, comm_executor, comm_dir, comm_limit_price, 
            limit_actual_price, comm_qty, comm_amt, order_qty, 
            comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
            net_price_flag, par_value, impawn_ratio, intrst_days, 
            bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
            comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
            comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
            basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
            sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
            sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
            exter_comm_flag, valid_aver_price, valid_aver_price_allday, exec_price_diff, 
            exec_price_diff_allday, valid_ratio, valid_ratio_allday, valid_qty, 
            valid_qty_allday, comm_remark_info from db_tdsecu.tb_tdsebk_sumcommand_check where (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and co_no=v_opor_co_no  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and comm_qty > 0 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_sum_appr_status_str=" " or instr(v_comm_sum_appr_status_str, concat(";",comm_sum_approve_status,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_sum_status_str=" " or instr(v_comm_sum_status_str, concat(";",comm_sum_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_basket_id = 0 or basket_id = v_basket_id) and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id<v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, stock_code_no, 
            stock_code, target_code_no, trade_code_no, stock_type, 
            asset_type, comm_date, comm_time, comm_batch_no, 
            comm_opor, comm_executor, comm_dir, comm_limit_price, 
            limit_actual_price, comm_qty, comm_amt, order_qty, 
            comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
            net_price_flag, par_value, impawn_ratio, intrst_days, 
            bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
            comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
            comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
            basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
            sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
            sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
            exter_comm_flag, valid_aver_price, valid_aver_price_allday, exec_price_diff, 
            exec_price_diff_allday, valid_ratio, valid_ratio_allday, valid_qty, 
            valid_qty_allday, comm_remark_info from db_tdsecu.tb_tdsebk_sumcommand_check where (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and co_no=v_opor_co_no  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor) and comm_qty > 0 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_sum_appr_status_str=" " or instr(v_comm_sum_appr_status_str, concat(";",comm_sum_approve_status,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_sum_status_str=" " or instr(v_comm_sum_status_str, concat(";",comm_sum_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_basket_id = 0 or basket_id = v_basket_id) and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询指令汇总考核历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QuerySumCommCheck_His;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QuerySumCommCheck_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_comm_opor int,
    IN p_comm_executor int,
    IN p_comm_sum_appr_status_str varchar(64),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
    IN p_comm_dir_str varchar(2048),
    IN p_comm_sum_status_str varchar(64),
    IN p_strike_status_str varchar(64),
    IN p_basket_id bigint,
    IN p_comm_oper_way varchar(2),
    IN p_exter_comm_flag int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_sum_appr_status_str varchar(64);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_comm_dir_str varchar(2048);
    declare v_comm_sum_status_str varchar(64);
    declare v_strike_status_str varchar(64);
    declare v_basket_id bigint;
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_comm_executor = p_comm_executor;
    SET v_comm_sum_appr_status_str = p_comm_sum_appr_status_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_comm_sum_status_str = p_comm_sum_status_str;
    SET v_strike_status_str = p_strike_status_str;
    SET v_basket_id = p_basket_id;
    SET v_comm_oper_way = p_comm_oper_way;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_交易证券_交易运维_指令汇总考核表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@指令日期#=0 or {指令日期}=@指令日期#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and {机构编号}=@操作员机构编号#  and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#)  and {指令数量} > 0 and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@指令汇总审批状态串#=" " or instr(@指令汇总审批状态串#, concat(";",{指令汇总审批状态},";"))>0) and (@证券类型串#=" " or instr(@证券类型串#, concat(";",{证券类型},";"))>0) and (@资产类型串#=" " or instr(@资产类型串#, concat(";",{资产类型},";"))>0) and (@指令方向串#=" " or instr(@指令方向串#, concat(";",{指令方向},";"))>0) and (@指令汇总状态串#=" " or instr(@指令汇总状态串#, concat(";",{指令汇总状态},";"))>0) and (@成交状态串#=" " or instr(@成交状态串#, concat(";",{成交状态},";"))>0) and (@篮子序号# = 0 or {篮子序号} = @篮子序号#) and (@指令操作方式# = " " or {指令操作方式} = @指令操作方式#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_code_no, 
        stock_code, target_code_no, trade_code_no, stock_type, 
        asset_type, comm_date, comm_time, comm_batch_no, 
        comm_opor, comm_executor, comm_dir, comm_limit_price, 
        limit_actual_price, comm_qty, comm_amt, order_qty, 
        comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
        net_price_flag, par_value, impawn_ratio, intrst_days, 
        bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
        sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
        sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
        exter_comm_flag, valid_aver_price, valid_aver_price_allday, exec_price_diff, 
        exec_price_diff_allday, valid_ratio, valid_ratio_allday, valid_qty, 
        valid_qty_allday, comm_remark_info from db_tdsecu_his.tb_tdsebk_sumcommand_check_his where (init_date between v_begin_date and v_end_date) and (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and co_no=v_opor_co_no  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor)  and comm_qty > 0 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_sum_appr_status_str=" " or instr(v_comm_sum_appr_status_str, concat(";",comm_sum_approve_status,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_sum_status_str=" " or instr(v_comm_sum_status_str, concat(";",comm_sum_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_basket_id = 0 or basket_id = v_basket_id) and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_code_no, 
        stock_code, target_code_no, trade_code_no, stock_type, 
        asset_type, comm_date, comm_time, comm_batch_no, 
        comm_opor, comm_executor, comm_dir, comm_limit_price, 
        limit_actual_price, comm_qty, comm_amt, order_qty, 
        comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
        net_price_flag, par_value, impawn_ratio, intrst_days, 
        bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
        sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
        sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
        exter_comm_flag, valid_aver_price, valid_aver_price_allday, exec_price_diff, 
        exec_price_diff_allday, valid_ratio, valid_ratio_allday, valid_qty, 
        valid_qty_allday, comm_remark_info from db_tdsecu_his.tb_tdsebk_sumcommand_check_his where (init_date between v_begin_date and v_end_date) and (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and co_no=v_opor_co_no  and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_comm_executor=0 or comm_executor=v_comm_executor)  and comm_qty > 0 and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_comm_sum_appr_status_str=" " or instr(v_comm_sum_appr_status_str, concat(";",comm_sum_approve_status,";"))>0) and (v_stock_type_str=" " or instr(v_stock_type_str, concat(";",stock_type,";"))>0) and (v_asset_type_str=" " or instr(v_asset_type_str, concat(";",asset_type,";"))>0) and (v_comm_dir_str=" " or instr(v_comm_dir_str, concat(";",comm_dir,";"))>0) and (v_comm_sum_status_str=" " or instr(v_comm_sum_status_str, concat(";",comm_sum_status,";"))>0) and (v_strike_status_str=" " or instr(v_strike_status_str, concat(";",strike_status,";"))>0) and (v_basket_id = 0 or basket_id = v_basket_id) and (v_comm_oper_way = " " or comm_oper_way = v_comm_oper_way) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_更新查询指令汇总考核
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_UpdateSumCommCheck;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_UpdateSumCommCheck(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_comm_executor int,
    IN p_valid_aver_price decimal(16,9),
    IN p_valid_aver_price_allday decimal(16,9),
    IN p_exec_price_diff decimal(18,12),
    IN p_exec_price_diff_allday decimal(18,12),
    IN p_valid_ratio decimal(18,12),
    IN p_valid_ratio_allday decimal(18,12),
    IN p_valid_qty decimal(18,2),
    IN p_valid_qty_allday decimal(18,2),
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
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_valid_aver_price decimal(16,9);
    declare v_valid_aver_price_allday decimal(16,9);
    declare v_exec_price_diff decimal(18,12);
    declare v_exec_price_diff_allday decimal(18,12);
    declare v_valid_ratio decimal(18,12);
    declare v_valid_ratio_allday decimal(18,12);
    declare v_valid_qty decimal(18,2);
    declare v_valid_qty_allday decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_time int;
    declare v_comm_opor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_comm_amt decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_strike_status varchar(2);
    declare v_comm_sum_status varchar(2);
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;
    declare v_max_comm_comple_date int;
    declare v_max_comm_comple_time int;
    declare v_comm_appr_date int;
    declare v_comm_appr_time int;
    declare v_comm_appr_qty decimal(18,2);
    declare v_comm_sum_approve_status varchar(2);
    declare v_basket_id bigint;
    declare v_buy_order_qty decimal(18,2);
    declare v_sell_order_qty decimal(18,2);
    declare v_buy_comm_qty decimal(18,2);
    declare v_sell_comm_qty decimal(18,2);
    declare v_buy_strike_qty decimal(18,2);
    declare v_sell_strike_qty decimal(18,2);
    declare v_buy_strike_amt decimal(18,4);
    declare v_sell_strike_amt decimal(18,4);
    declare v_buy_comm_amt decimal(18,4);
    declare v_sell_comm_amt decimal(18,4);
    declare v_comm_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_comm_remark_info varchar(1024);
    declare v_read_flag int;
    declare v_acco_concat_info varchar(4096);

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
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_executor = p_comm_executor;
    SET v_valid_aver_price = p_valid_aver_price;
    SET v_valid_aver_price_allday = p_valid_aver_price_allday;
    SET v_exec_price_diff = p_exec_price_diff;
    SET v_exec_price_diff_allday = p_exec_price_diff_allday;
    SET v_valid_ratio = p_valid_ratio;
    SET v_valid_ratio_allday = p_valid_ratio_allday;
    SET v_valid_qty = p_valid_qty;
    SET v_valid_qty_allday = p_valid_qty_allday;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_opor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_comm_amt = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_comm_await_cancel_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_strike_status = "0";
    SET v_comm_sum_status = "0";
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_max_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_max_comm_comple_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_appr_time = date_format(curtime(),'%H%i%s');
    SET v_comm_appr_qty = 0;
    SET v_comm_sum_approve_status = "0";
    SET v_basket_id = 0;
    SET v_buy_order_qty = 0;
    SET v_sell_order_qty = 0;
    SET v_buy_comm_qty = 0;
    SET v_sell_comm_qty = 0;
    SET v_buy_strike_qty = 0;
    SET v_sell_strike_qty = 0;
    SET v_buy_strike_amt = 0;
    SET v_sell_strike_amt = 0;
    SET v_buy_comm_amt = 0;
    SET v_sell_comm_amt = 0;
    SET v_comm_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_comm_remark_info = " ";
    SET v_read_flag = 0;
    SET v_acco_concat_info = " ";

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易证券_指令_指令汇总表][字段][字段变量][{指令日期}=@指令日期# and {机构编号}=@机构编号# and {指令批号}=@指令批号# and {指令执行人}=@指令执行人#][4][@指令日期#, @机构编号#, @指令批号#,@指令执行人#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_code_no, 
        stock_code, target_code_no, trade_code_no, stock_type, 
        asset_type, comm_date, comm_time, comm_batch_no, 
        comm_opor, comm_executor, comm_dir, comm_limit_price, 
        limit_actual_price, comm_qty, comm_amt, order_qty, 
        comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
        net_price_flag, par_value, impawn_ratio, intrst_days, 
        bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
        sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
        sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
        exter_comm_flag, comm_remark_info, read_flag, acco_concat_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_crncy_type, v_exch_no, v_stock_code_no, 
        v_stock_code, v_target_code_no, v_trade_code_no, v_stock_type, 
        v_asset_type, v_comm_date, v_comm_time, v_comm_batch_no, 
        v_comm_opor, v_comm_executor, v_comm_dir, v_comm_limit_price, 
        v_limit_actual_price, v_comm_qty, v_comm_amt, v_order_qty, 
        v_comm_cancel_qty, v_comm_await_cancel_qty, v_strike_amt, v_strike_qty, 
        v_net_price_flag, v_par_value, v_impawn_ratio, v_intrst_days, 
        v_bond_accr_intrst, v_bond_rate_type, v_strike_status, v_comm_sum_status, 
        v_comm_begin_date, v_comm_end_date, v_comm_begin_time, v_comm_end_time, 
        v_comm_comple_date, v_comm_comple_time, v_max_comm_comple_date, v_max_comm_comple_time, 
        v_comm_appr_date, v_comm_appr_time, v_comm_appr_qty, v_comm_sum_approve_status, 
        v_basket_id, v_buy_order_qty, v_sell_order_qty, v_buy_comm_qty, 
        v_sell_comm_qty, v_buy_strike_qty, v_sell_strike_qty, v_buy_strike_amt, 
        v_sell_strike_amt, v_buy_comm_amt, v_sell_comm_amt, v_comm_oper_way, 
        v_exter_comm_flag, v_comm_remark_info, v_read_flag, v_acco_concat_info from db_tdsecu.tb_tdseap_sumcommand where comm_date=v_comm_date and co_no=v_co_no and comm_batch_no=v_comm_batch_no and comm_executor=v_comm_executor limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.10.64.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,",","指令执行人=",v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,","," 机构编号=", v_co_no,","," 指令批号=", v_comm_batch_no,",","指令执行人=",v_comm_executor);
        end if;
        leave label_pro;
    end if;


    /* [插入重复更新][交易证券_交易运维_指令汇总考核表][字段][字段变量][{有效均价}=@有效均价#,{全天有效均价}=@全天有效均价#,{执行价差}=@执行价差#,{全天执行价差}=@全天执行价差#,{有效占比}=@有效占比#,{全天有效占比}=@全天有效占比#,{有效数量}=@有效数量#,{全天有效数量}=@全天有效数量#,{初始化日期}=@初始化日期#,{产品编号}=@产品编号#,{交易组编号}=@交易组编号#,{资产账户编号}=@资产账户编号#,{通道编号}=@通道编号#,{外部账号}=@外部账号#,{交易币种}=@交易币种#,{市场编号}=@市场编号#,{证券代码编号}=@证券代码编号#,{证券代码}=@证券代码#,{标的代码编号}=@标的代码编号#,{交易代码编号}=@交易代码编号#,{证券类型}=@证券类型#,{资产类型}=@资产类型#,{指令时间}=@指令时间#,{指令下达人}=@指令下达人#,{指令方向}=@指令方向#,{指令限价}=@指令限价#,{指令实际限价}=@指令实际限价#,{指令数量}=@指令数量#,{指令金额}=@指令金额#,{订单数量}=@订单数量#,{指令撤销数量}=@指令撤销数量#,{指令待撤销数量}=@指令待撤销数量#,{成交金额}=@成交金额#,{成交数量}=@成交数量#,{净价标志}=@净价标志#,{票面面值}=@票面面值#,{质押比例}=@质押比例#,{计息天数}=@计息天数#,{债券计提利息}=@债券计提利息#,{债券利率类型}=@债券利率类型#,{成交状态}=@成交状态#,{指令汇总状态}=@指令汇总状态#,{指令开始日期}=@指令开始日期#,{指令结束日期}=@指令结束日期#,{指令开始时间}=@指令开始时间#,{指令结束时间}=@指令结束时间#,{指令完成日期}=@指令完成日期#,{指令完成时间}=@指令完成时间#,{指令最大完成日期}=@指令最大完成日期#,{指令最大完成时间}=@指令最大完成时间#,{指令审批日期}=@指令审批日期#,{指令审批时间}=@指令审批时间#,{指令审批数量}=@指令审批数量#,{指令汇总审批状态}=@指令汇总审批状态#,{篮子序号}=@篮子序号#,{买入订单数量}=@买入订单数量#,{卖出订单数量}=@卖出订单数量#,{买入指令数量}=@买入指令数量#,{卖出指令数量}=@卖出指令数量#,{买入成交数量}=@买入成交数量#,{卖出成交数量}=@卖出成交数量#,{买入成交金额}=@买入成交金额#,{卖出成交金额}=@卖出成交金额#,{买入指令金额}=@买入指令金额#,{卖出指令金额}=@卖出指令金额#,{指令操作方式}=@指令操作方式#,{体外指令标志}=@体外指令标志#,{指令备注信息}=@指令备注信息#][1][@指令日期#,@机构编号#,@指令批号#,@指令执行人#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsebk_sumcommand_check (
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, init_date, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, out_acco, 
        exch_crncy_type, exch_no, stock_code_no, stock_code, 
        target_code_no, trade_code_no, stock_type, asset_type, 
        comm_date, comm_time, comm_batch_no, comm_opor, 
        comm_executor, comm_dir, comm_limit_price, limit_actual_price, 
        comm_qty, comm_amt, order_qty, comm_cancel_qty, 
        comm_await_cancel_qty, strike_amt, strike_qty, net_price_flag, 
        par_value, impawn_ratio, intrst_days, bond_accr_intrst, 
        bond_rate_type, strike_status, comm_sum_status, comm_begin_date, 
        comm_end_date, comm_begin_time, comm_end_time, comm_comple_date, 
        comm_comple_time, max_comm_comple_date, max_comm_comple_time, comm_appr_date, 
        comm_appr_time, comm_appr_qty, comm_sum_approve_status, basket_id, 
        buy_order_qty, sell_order_qty, buy_comm_qty, sell_comm_qty, 
        buy_strike_qty, sell_strike_qty, buy_strike_amt, sell_strike_amt, 
        buy_comm_amt, sell_comm_amt, comm_oper_way, exter_comm_flag, 
        valid_aver_price, valid_aver_price_allday, exec_price_diff, exec_price_diff_allday, 
        valid_ratio, valid_ratio_allday, valid_qty, valid_qty_allday, 
        comm_remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_init_date, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_crncy_type, v_exch_no, v_stock_code_no, v_stock_code, 
        v_target_code_no, v_trade_code_no, v_stock_type, v_asset_type, 
        v_comm_date, v_comm_time, v_comm_batch_no, v_comm_opor, 
        v_comm_executor, v_comm_dir, v_comm_limit_price, v_limit_actual_price, 
        v_comm_qty, v_comm_amt, v_order_qty, v_comm_cancel_qty, 
        v_comm_await_cancel_qty, v_strike_amt, v_strike_qty, v_net_price_flag, 
        v_par_value, v_impawn_ratio, v_intrst_days, v_bond_accr_intrst, 
        v_bond_rate_type, v_strike_status, v_comm_sum_status, v_comm_begin_date, 
        v_comm_end_date, v_comm_begin_time, v_comm_end_time, v_comm_comple_date, 
        v_comm_comple_time, v_max_comm_comple_date, v_max_comm_comple_time, v_comm_appr_date, 
        v_comm_appr_time, v_comm_appr_qty, v_comm_sum_approve_status, v_basket_id, 
        v_buy_order_qty, v_sell_order_qty, v_buy_comm_qty, v_sell_comm_qty, 
        v_buy_strike_qty, v_sell_strike_qty, v_buy_strike_amt, v_sell_strike_amt, 
        v_buy_comm_amt, v_sell_comm_amt, v_comm_oper_way, v_exter_comm_flag, 
        v_valid_aver_price, v_valid_aver_price_allday, v_exec_price_diff, v_exec_price_diff_allday, 
        v_valid_ratio, v_valid_ratio_allday, v_valid_qty, v_valid_qty_allday, 
        v_comm_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, valid_aver_price=v_valid_aver_price,valid_aver_price_allday=v_valid_aver_price_allday,exec_price_diff=v_exec_price_diff,exec_price_diff_allday=v_exec_price_diff_allday,valid_ratio=v_valid_ratio,valid_ratio_allday=v_valid_ratio_allday,valid_qty=v_valid_qty,valid_qty_allday=v_valid_qty_allday,init_date=v_init_date,pd_no=v_pd_no,exch_group_no=v_exch_group_no,asset_acco_no=v_asset_acco_no,pass_no=v_pass_no,out_acco=v_out_acco,exch_crncy_type=v_exch_crncy_type,exch_no=v_exch_no,stock_code_no=v_stock_code_no,stock_code=v_stock_code,target_code_no=v_target_code_no,trade_code_no=v_trade_code_no,stock_type=v_stock_type,asset_type=v_asset_type,comm_time=v_comm_time,comm_opor=v_comm_opor,comm_dir=v_comm_dir,comm_limit_price=v_comm_limit_price,limit_actual_price=v_limit_actual_price,comm_qty=v_comm_qty,comm_amt=v_comm_amt,order_qty=v_order_qty,comm_cancel_qty=v_comm_cancel_qty,comm_await_cancel_qty=v_comm_await_cancel_qty,strike_amt=v_strike_amt,strike_qty=v_strike_qty,net_price_flag=v_net_price_flag,par_value=v_par_value,impawn_ratio=v_impawn_ratio,intrst_days=v_intrst_days,bond_accr_intrst=v_bond_accr_intrst,bond_rate_type=v_bond_rate_type,strike_status=v_strike_status,comm_sum_status=v_comm_sum_status,comm_begin_date=v_comm_begin_date,comm_end_date=v_comm_end_date,comm_begin_time=v_comm_begin_time,comm_end_time=v_comm_end_time,comm_comple_date=v_comm_comple_date,comm_comple_time=v_comm_comple_time,max_comm_comple_date=v_max_comm_comple_date,max_comm_comple_time=v_max_comm_comple_time,comm_appr_date=v_comm_appr_date,comm_appr_time=v_comm_appr_time,comm_appr_qty=v_comm_appr_qty,comm_sum_approve_status=v_comm_sum_approve_status,basket_id=v_basket_id,buy_order_qty=v_buy_order_qty,sell_order_qty=v_sell_order_qty,buy_comm_qty=v_buy_comm_qty,sell_comm_qty=v_sell_comm_qty,buy_strike_qty=v_buy_strike_qty,sell_strike_qty=v_sell_strike_qty,buy_strike_amt=v_buy_strike_amt,sell_strike_amt=v_sell_strike_amt,buy_comm_amt=v_buy_comm_amt,sell_comm_amt=v_sell_comm_amt,comm_oper_way=v_comm_oper_way,exter_comm_flag=v_exter_comm_flag,comm_remark_info=v_comm_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.10.64.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令日期=",v_comm_date,",","机构编号=",v_co_no,",","指令批号=",v_comm_batch_no,",","指令执行人=",v_comm_executor),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令日期=",v_comm_date,",","机构编号=",v_co_no,",","指令批号=",v_comm_batch_no,",","指令执行人=",v_comm_executor);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询所有指令汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryAllSumComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryAllSumComm(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_date int,
    IN p_comm_batch_no int,
    IN p_comm_executor int,
    IN p_stock_code_no int,
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
    declare v_comm_date int;
    declare v_comm_batch_no int;
    declare v_comm_executor int;
    declare v_stock_code_no int;
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
    SET v_comm_date = p_comm_date;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_executor = p_comm_executor;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_指令_指令汇总表][字段][(@指令日期#=0 or {指令日期}=@指令日期#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@机构编号#=0 or {机构编号}=@机构编号#)  and (@指令执行人#=0 or {指令执行人}=@指令执行人#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, stock_code_no, 
            stock_code, target_code_no, trade_code_no, stock_type, 
            asset_type, comm_date, comm_time, comm_batch_no, 
            comm_opor, comm_executor, comm_dir, comm_limit_price, 
            limit_actual_price, comm_qty, comm_amt, order_qty, 
            comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
            net_price_flag, par_value, impawn_ratio, intrst_days, 
            bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
            comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
            comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
            basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
            sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
            sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
            exter_comm_flag, comm_remark_info, read_flag, acco_concat_info from db_tdsecu.tb_tdseap_sumcommand where (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_co_no=0 or co_no=v_co_no)  and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, stock_code_no, 
            stock_code, target_code_no, trade_code_no, stock_type, 
            asset_type, comm_date, comm_time, comm_batch_no, 
            comm_opor, comm_executor, comm_dir, comm_limit_price, 
            limit_actual_price, comm_qty, comm_amt, order_qty, 
            comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
            net_price_flag, par_value, impawn_ratio, intrst_days, 
            bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
            comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
            comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
            basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
            sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
            sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
            exter_comm_flag, comm_remark_info, read_flag, acco_concat_info from db_tdsecu.tb_tdseap_sumcommand where (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_co_no=0 or co_no=v_co_no)  and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_指令_指令汇总表][字段][(@指令日期#=0 or {指令日期}=@指令日期#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@指令执行人#=0 or {指令执行人}=@指令执行人#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, stock_code_no, 
            stock_code, target_code_no, trade_code_no, stock_type, 
            asset_type, comm_date, comm_time, comm_batch_no, 
            comm_opor, comm_executor, comm_dir, comm_limit_price, 
            limit_actual_price, comm_qty, comm_amt, order_qty, 
            comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
            net_price_flag, par_value, impawn_ratio, intrst_days, 
            bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
            comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
            comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
            basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
            sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
            sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
            exter_comm_flag, comm_remark_info, read_flag, acco_concat_info from db_tdsecu.tb_tdseap_sumcommand where (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_co_no=0 or co_no=v_co_no) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and row_id<v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_crncy_type, exch_no, stock_code_no, 
            stock_code, target_code_no, trade_code_no, stock_type, 
            asset_type, comm_date, comm_time, comm_batch_no, 
            comm_opor, comm_executor, comm_dir, comm_limit_price, 
            limit_actual_price, comm_qty, comm_amt, order_qty, 
            comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
            net_price_flag, par_value, impawn_ratio, intrst_days, 
            bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
            comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
            comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
            comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
            basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
            sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
            sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
            exter_comm_flag, comm_remark_info, read_flag, acco_concat_info from db_tdsecu.tb_tdseap_sumcommand where (v_comm_date=0 or comm_date=v_comm_date) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_co_no=0 or co_no=v_co_no) and (v_comm_executor=0 or comm_executor=v_comm_executor) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询运维订单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryBkOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryBkOrderRsp(
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
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_order_dir_str varchar(1024),
    IN p_order_rsp_status_str varchar(64),
    IN p_deal_status_str varchar(64),
    IN p_pass_no int,
    IN p_report_no varchar(32),
    IN p_order_id bigint,
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
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_order_dir_str varchar(1024);
    declare v_order_rsp_status_str varchar(64);
    declare v_deal_status_str varchar(64);
    declare v_pass_no int;
    declare v_report_no varchar(32);
    declare v_order_id bigint;
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
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_rsp_status_str = p_order_rsp_status_str;
    SET v_deal_status_str = p_deal_status_str;
    SET v_pass_no = p_pass_no;
    SET v_report_no = p_report_no;
    SET v_order_id = p_order_id;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_报盘_订单回报表][字段][(@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@股东代码#=" " or {股东代码}=@股东代码#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@订单回报状态串#=" " or instr(@订单回报状态串#,concat(";",{订单回报状态},";"))>0) and (@处理状态串#=" " or instr(@处理状态串#,concat(";",{处理状态},";"))>0) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#)  and (@通道编号#=0 or {通道编号}=@通道编号#)  and (@申报编号#=0 or {申报编号}=@申报编号#)  and  (@订单序号#=0 or {订单序号}=@订单序号#)  and  {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, order_price, 
        order_qty, price_type, order_rsp_status, rsp_info, 
        deal_status, record_valid_flag, contra_no from db_tdsecu.tb_tdserp_orderrsp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_acco=" " or stock_acco=v_stock_acco) and (v_stock_code=" " or stock_code=v_stock_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_order_rsp_status_str=" " or instr(v_order_rsp_status_str,concat(";",order_rsp_status,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and (v_pass_no=0 or pass_no=v_pass_no)  and (v_report_no=0 or report_no=v_report_no)  and  (v_order_id=0 or order_id=v_order_id)  and  row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, order_price, 
        order_qty, price_type, order_rsp_status, rsp_info, 
        deal_status, record_valid_flag, contra_no from db_tdsecu.tb_tdserp_orderrsp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_acco=" " or stock_acco=v_stock_acco) and (v_stock_code=" " or stock_code=v_stock_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_order_rsp_status_str=" " or instr(v_order_rsp_status_str,concat(";",order_rsp_status,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and (v_pass_no=0 or pass_no=v_pass_no)  and (v_report_no=0 or report_no=v_report_no)  and  (v_order_id=0 or order_id=v_order_id)  and  row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询运维成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryBkStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryBkStrikeRsp(
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
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_order_dir_str varchar(1024),
    IN p_deal_status_str varchar(64),
    IN p_pass_no int,
    IN p_report_no varchar(32),
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
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_order_dir_str varchar(1024);
    declare v_deal_status_str varchar(64);
    declare v_pass_no int;
    declare v_report_no varchar(32);
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
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_deal_status_str = p_deal_status_str;
    SET v_pass_no = p_pass_no;
    SET v_report_no = p_report_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_报盘_成交回报表][字段][(@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@股东代码#=" " or {股东代码}=@股东代码#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@处理状态串#=" " or instr(@处理状态串#,concat(";",{处理状态},";"))>0) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#)  and (@申报编号#=0 or {申报编号}=@申报编号#)   and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info, 
        deal_status, sett_flag, record_valid_flag, asset_acco_type from db_tdsecu.tb_tdserp_strikersp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_acco=" " or stock_acco=v_stock_acco) and (v_stock_code=" " or stock_code=v_stock_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no)  and (v_report_no=0 or report_no=v_report_no)   and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info, 
        deal_status, sett_flag, record_valid_flag, asset_acco_type from db_tdsecu.tb_tdserp_strikersp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_acco=" " or stock_acco=v_stock_acco) and (v_stock_code=" " or stock_code=v_stock_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no)  and (v_report_no=0 or report_no=v_report_no)   and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询运维成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryBkStrikeDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryBkStrikeDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_order_oper_way_str varchar(1024),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_exter_comm_flag int,
    IN p_record_valid_flag int,
    IN p_pass_no int,
    IN p_report_no varchar(32),
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
    declare v_order_oper_way_str varchar(1024);
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_pass_no int;
    declare v_report_no varchar(32);
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
    SET v_order_oper_way_str = p_order_oper_way_str;
    SET v_co_no = p_co_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_record_valid_flag = p_record_valid_flag;
    SET v_pass_no = p_pass_no;
    SET v_report_no = p_report_no;
    SET v_order_id = p_order_id;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_报盘_成交表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号串#=" " or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and (@记录有效标志# = 0 or {记录有效标志}=@记录有效标志#) and  (@订单操作方式串#=" " or instr(@订单操作方式串#, concat(";",{订单操作方式},";"))>0) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#,concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@申报编号#=0 or {申报编号}=@申报编号#)  and  (@订单序号#=0 or {订单序号}=@订单序号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            init_date, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, exch_no, 
            stock_acco_no, stock_code, stock_code_no, stock_type, 
            asset_type, comm_id, comm_batch_no, strike_date, 
            strike_time, strike_no, report_date, report_no, 
            order_date, order_time, order_batch_no, order_id, 
            order_dir, order_price, order_qty, strike_qty, 
            strike_price, strike_amt, all_fee, stamp_tax, 
            trans_fee, brkage_fee, SEC_charges, other_fee, 
            trade_commis, other_commis, trade_tax, trade_cost_fee, 
            trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
            par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
            strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
            exter_comm_flag, record_valid_flag, external_no, combo_code, 
            asset_acco_type from db_tdsecu.tb_tdserp_strike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and  (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_report_no=0 or report_no=v_report_no)  and  (v_order_id=0 or order_id=v_order_id) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            init_date, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, exch_no, 
            stock_acco_no, stock_code, stock_code_no, stock_type, 
            asset_type, comm_id, comm_batch_no, strike_date, 
            strike_time, strike_no, report_date, report_no, 
            order_date, order_time, order_batch_no, order_id, 
            order_dir, order_price, order_qty, strike_qty, 
            strike_price, strike_amt, all_fee, stamp_tax, 
            trans_fee, brkage_fee, SEC_charges, other_fee, 
            trade_commis, other_commis, trade_tax, trade_cost_fee, 
            trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
            par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
            strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
            exter_comm_flag, record_valid_flag, external_no, combo_code, 
            asset_acco_type from db_tdsecu.tb_tdserp_strike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and  (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_report_no=0 or report_no=v_report_no)  and  (v_order_id=0 or order_id=v_order_id) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_报盘_成交表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号串#=" " or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and (@记录有效标志# = 0 or {记录有效标志}=@记录有效标志#) and  (@订单操作方式串#=" " or instr(@订单操作方式串#, concat(";",{订单操作方式},";"))>0) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#,concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0)  and  (@申报编号#=0 or {申报编号}=@申报编号#)  and  (@订单序号#=0 or {订单序号}=@订单序号#) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            init_date, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, exch_no, 
            stock_acco_no, stock_code, stock_code_no, stock_type, 
            asset_type, comm_id, comm_batch_no, strike_date, 
            strike_time, strike_no, report_date, report_no, 
            order_date, order_time, order_batch_no, order_id, 
            order_dir, order_price, order_qty, strike_qty, 
            strike_price, strike_amt, all_fee, stamp_tax, 
            trans_fee, brkage_fee, SEC_charges, other_fee, 
            trade_commis, other_commis, trade_tax, trade_cost_fee, 
            trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
            par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
            strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
            exter_comm_flag, record_valid_flag, external_no, combo_code, 
            asset_acco_type from db_tdsecu.tb_tdserp_strike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and  (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0)  and  (v_report_no=0 or report_no=v_report_no)  and  (v_order_id=0 or order_id=v_order_id) and row_id<v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            init_date, co_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, out_acco, exch_no, 
            stock_acco_no, stock_code, stock_code_no, stock_type, 
            asset_type, comm_id, comm_batch_no, strike_date, 
            strike_time, strike_no, report_date, report_no, 
            order_date, order_time, order_batch_no, order_id, 
            order_dir, order_price, order_qty, strike_qty, 
            strike_price, strike_amt, all_fee, stamp_tax, 
            trans_fee, brkage_fee, SEC_charges, other_fee, 
            trade_commis, other_commis, trade_tax, trade_cost_fee, 
            trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
            par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
            strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
            exter_comm_flag, record_valid_flag, external_no, combo_code, 
            asset_acco_type from db_tdsecu.tb_tdserp_strike where (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exter_comm_flag = 0 or exter_comm_flag = v_exter_comm_flag) and (v_record_valid_flag = 0 or record_valid_flag=v_record_valid_flag) and  (v_order_oper_way_str=" " or instr(v_order_oper_way_str, concat(";",order_oper_way,";"))>0) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",stock_type,";"))>0) and (v_comm_id=0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0)  and  (v_report_no=0 or report_no=v_report_no)  and  (v_order_id=0 or order_id=v_order_id) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询报盘信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryOfferInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryOfferInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
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
    SET v_pass_no = p_pass_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易证券_公用_报盘信息表][{记录序号},{通道编号},{报盘类型},{报盘标识},{报盘服务器名称},{报盘服务器IP},{报盘服务器端口}][ (@通道编号#=0 or {通道编号}=@通道编号#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id,pass_no,offer_type,offer_name,offer_server_name,offer_server_ip,offer_server_port from db_tdsecu.tb_tdsepb_offerinfo where  (v_pass_no=0 or pass_no=v_pass_no);
    else
        select row_id,pass_no,offer_type,offer_name,offer_server_name,offer_server_ip,offer_server_port from db_tdsecu.tb_tdsepb_offerinfo where  (v_pass_no=0 or pass_no=v_pass_no) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询运维撤单流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryBkCancelJour;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryBkCancelJour(
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
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_order_dir_str varchar(1024),
    IN p_pass_no int,
    IN p_report_no varchar(32),
    IN p_order_id bigint,
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
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_order_dir_str varchar(1024);
    declare v_pass_no int;
    declare v_report_no varchar(32);
    declare v_order_id bigint;
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
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_pass_no = p_pass_no;
    SET v_report_no = p_report_no;
    SET v_order_id = p_order_id;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_交易_撤单表][字段][(@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@股东代码#=" " or {股东代码}=@股东代码#) and (@证券代码#=" " or {证券代码}=@证券代码#) and  (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#)  and (@通道编号#=0 or {通道编号}=@通道编号#)  and (@申报编号#=0 or {申报编号}=@申报编号#)  and  (@订单序号#=0 or {订单序号}=@订单序号#)  and  {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, external_no, 
        wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
        order_id, report_date, report_time, report_no, 
        wtdraw_status, wtdraw_qty, wtdraw_remark, order_price, 
        trade_acco from db_tdsecu.tb_tdsetd_cancel where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_acco=" " or stock_acco=v_stock_acco) and (v_stock_code=" " or stock_code=v_stock_code) and  (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and (v_pass_no=0 or pass_no=v_pass_no)  and (v_report_no=0 or report_no=v_report_no)  and  (v_order_id=0 or order_id=v_order_id)  and  row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, external_no, 
        wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
        order_id, report_date, report_time, report_no, 
        wtdraw_status, wtdraw_qty, wtdraw_remark, order_price, 
        trade_acco from db_tdsecu.tb_tdsetd_cancel where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_stock_acco=" " or stock_acco=v_stock_acco) and (v_stock_code=" " or stock_code=v_stock_code) and  (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and (v_pass_no=0 or pass_no=v_pass_no)  and (v_report_no=0 or report_no=v_report_no)  and  (v_order_id=0 or order_id=v_order_id)  and  row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询结算资金股份流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_GetSetFuShFlow;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_GetSetFuShFlow(
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
    

    /* [获取表全记录][交易证券_交易运维_结算资金股份流水表][字段][1=1] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, out_acco, 
        report_date, report_no, strike_no, strike_price, 
        strike_qty, strike_amt, strike_date, strike_time from db_tdsecu.tb_tdsebk_setfushflow where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_同步场外基金成交回报表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_SyncOffSiteFundrSp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_SyncOffSiteFundrSp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_out_acco varchar(32),
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_strike_no varchar(64),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_exch_no int,
    IN p_rsp_info varchar(255),
    IN p_strike_deal_type int,
    IN p_strike_time int,
    IN p_strike_date int,
    IN p_pass_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_order_dir int,
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
    declare v_out_acco varchar(32);
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_strike_no varchar(64);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_exch_no int;
    declare v_rsp_info varchar(255);
    declare v_strike_deal_type int;
    declare v_strike_time int;
    declare v_strike_date int;
    declare v_pass_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_order_dir int;
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
    SET v_out_acco = p_out_acco;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_strike_no = p_strike_no;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_exch_no = p_exch_no;
    SET v_rsp_info = p_rsp_info;
    SET v_strike_deal_type = p_strike_deal_type;
    SET v_strike_time = p_strike_time;
    SET v_strike_date = p_strike_date;
    SET v_pass_no = p_pass_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][交易证券_交易运维_场外基金成交回报表][字段][字段变量][1][@成交编号#, @成交日期#, @市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsebk_off_site_fundrsp(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, pass_no, 
        out_acco, exch_no, stock_acco, stock_code, 
        report_date, report_no, strike_date, strike_time, 
        strike_no, order_dir, strike_price, strike_qty, 
        strike_amt, strike_deal_type, rsp_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_pass_no, 
        v_out_acco, v_exch_no, v_stock_acco, v_stock_code, 
        v_report_date, v_report_no, v_strike_date, v_strike_time, 
        v_strike_no, v_order_dir, v_strike_price, v_strike_qty, 
        v_strike_amt, v_strike_deal_type, v_rsp_info);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.10.72.1";
        SET v_error_info =  CONCAT(concat("成交编号=",v_strike_no,","," 成交日期=", v_strike_date,","," 市场编号=", v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询场外基金成交回报表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryOffSiteFundrSp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryOffSiteFundrSp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_order_dir int,
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
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_order_dir int;
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
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][交易证券_交易运维_场外基金成交回报表][字段][1=1] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info from db_tdsecu.tb_tdsebk_off_site_fundrsp where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_回溯取错单修改成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_BackGetModiErrorOrderStrike;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_BackGetModiErrorOrderStrike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strike_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_combo_code varchar(32),
    OUT p_stock_type int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_date int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_batch_no int,
    OUT p_order_id bigint,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_amt decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_stamp_tax decimal(18,4),
    OUT p_trans_fee decimal(18,4),
    OUT p_brkage_fee decimal(18,4),
    OUT p_SEC_charges decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_trade_tax decimal(18,4),
    OUT p_trade_cost_fee decimal(18,4),
    OUT p_trade_system_use_fee decimal(18,4),
    OUT p_stock_settle_fee decimal(18,4),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_impawn_ratio decimal(18,12),
    OUT p_trade_code_no int,
    OUT p_target_code_no int,
    OUT p_order_oper_way varchar(2),
    OUT p_exter_comm_flag int,
    OUT p_record_valid_flag int,
    OUT p_busi_opor_no int,
    OUT p_update_times int,
    OUT p_external_no bigint
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_strike_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_combo_code varchar(32);
    declare v_stock_type int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_batch_no int;
    declare v_order_id bigint;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_impawn_ratio decimal(18,12);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_order_oper_way varchar(2);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_busi_opor_no int;
    declare v_update_times int;
    declare v_external_no bigint;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_asset_type int;
    declare v_order_time int;
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_asset_acco_type int;

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
    SET v_strike_id = p_strike_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_combo_code = " ";
    SET v_stock_type = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_batch_no = 0;
    SET v_order_id = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_amt = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_impawn_ratio = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_order_oper_way = " ";
    SET v_exter_comm_flag = 0;
    SET v_record_valid_flag = 0;
    SET v_busi_opor_no = 0;
    SET v_update_times = 1;
    SET v_external_no = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_asset_type = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_strike_bond_accr_intrst = 0;
    SET v_asset_acco_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易证券_报盘_成交表][字段][字段变量][{记录序号} = @成交序号# ][4][@成交序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, comm_id, comm_batch_no, strike_date, 
        strike_time, strike_no, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_price, strike_amt, all_fee, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
        par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
        strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
        exter_comm_flag, record_valid_flag, external_no, combo_code, 
        asset_acco_type into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_no, 
        v_init_date, v_co_no, v_pd_no, v_exch_group_no, 
        v_asset_acco_no, v_pass_no, v_out_acco, v_exch_no, 
        v_stock_acco_no, v_stock_code, v_stock_code_no, v_stock_type, 
        v_asset_type, v_comm_id, v_comm_batch_no, v_strike_date, 
        v_strike_time, v_strike_no, v_report_date, v_report_no, 
        v_order_date, v_order_time, v_order_batch_no, v_order_id, 
        v_order_dir, v_order_price, v_order_qty, v_strike_qty, 
        v_strike_price, v_strike_amt, v_all_fee, v_stamp_tax, 
        v_trans_fee, v_brkage_fee, v_SEC_charges, v_other_fee, 
        v_trade_commis, v_other_commis, v_trade_tax, v_trade_cost_fee, 
        v_trade_system_use_fee, v_stock_settle_fee, v_net_price_flag, v_intrst_days, 
        v_par_value, v_bond_accr_intrst, v_bond_rate_type, v_impawn_ratio, 
        v_strike_bond_accr_intrst, v_trade_code_no, v_target_code_no, v_order_oper_way, 
        v_exter_comm_flag, v_record_valid_flag, v_external_no, v_combo_code, 
        v_asset_acco_type from db_tdsecu.tb_tdserp_strike where row_id = v_strike_id  limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.10.74.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("成交序号=",v_strike_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("成交序号=",v_strike_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_combo_code = v_combo_code;
    SET p_stock_type = v_stock_type;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_date = v_report_date;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_batch_no = v_order_batch_no;
    SET p_order_id = v_order_id;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_price = v_strike_price;
    SET p_strike_amt = v_strike_amt;
    SET p_all_fee = v_all_fee;
    SET p_stamp_tax = v_stamp_tax;
    SET p_trans_fee = v_trans_fee;
    SET p_brkage_fee = v_brkage_fee;
    SET p_SEC_charges = v_SEC_charges;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_trade_tax = v_trade_tax;
    SET p_trade_cost_fee = v_trade_cost_fee;
    SET p_trade_system_use_fee = v_trade_system_use_fee;
    SET p_stock_settle_fee = v_stock_settle_fee;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_trade_code_no = v_trade_code_no;
    SET p_target_code_no = v_target_code_no;
    SET p_order_oper_way = v_order_oper_way;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_record_valid_flag = v_record_valid_flag;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_update_times = v_update_times;
    SET p_external_no = v_external_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_错单修改成交回溯更新回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_BackErrorStrikeUpdateRspStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_BackErrorStrikeUpdateRspStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_order_dir int,
    IN p_rsp_info varchar(255),
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
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_rsp_info varchar(255);
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_no = p_strike_no;
    SET v_order_dir = p_order_dir;
    SET v_rsp_info = p_rsp_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #更新成交回报表

    /* [更新表记录][交易证券_报盘_成交回报表][{记录有效标志} = 《记录有效标志-无效》, {回报信息}=@回报信息#][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {成交日期}=@成交日期# and {成交编号}=@成交编号# and {订单方向}=@订单方向#][2][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#,@订单方向#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_strikersp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, record_valid_flag = 2, rsp_info=v_rsp_info where pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and strike_date=v_strike_date and strike_no=v_strike_no and order_dir=v_order_dir;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.10.75.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no,",","订单方向=",v_order_dir);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_查询所有交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsebk_QueryAllExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsebk_QueryAllExgpPosi(
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
    IN p_stock_type_str varchar(2048),
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
    declare v_stock_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
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
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_账户_交易组业务持仓表][字段][(@机构编号# = 0 or {机构编号} = @机构编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#)  and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        comm_frozen_qty, comm_unfroz_qty, comm_capt_qty, comm_releas_qty, 
        trade_frozen_qty, trade_unfroz_qty, trade_capt_qty, trade_releas_qty, 
        strike_capt_qty, strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, 
        realize_pandl, cost_amt, intrst_cost_amt, intrst_pandl from db_tdsecu.tb_tdseac_exgp_busi_posi where (v_co_no = 0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        comm_frozen_qty, comm_unfroz_qty, comm_capt_qty, comm_releas_qty, 
        trade_frozen_qty, trade_unfroz_qty, trade_capt_qty, trade_releas_qty, 
        strike_capt_qty, strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, 
        realize_pandl, cost_amt, intrst_cost_amt, intrst_pandl from db_tdsecu.tb_tdseac_exgp_busi_posi where (v_co_no = 0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_交易运维_更新回退撤单状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsetd_UpdateBackCancelOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsetd_UpdateBackCancelOrderStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_wtdraw_status varchar(2),
    IN p_wtdraw_remark varchar(255),
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
    declare v_order_id bigint;
    declare v_wtdraw_status varchar(2);
    declare v_wtdraw_remark varchar(255);
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
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_wtdraw_status = p_wtdraw_status;
    SET v_wtdraw_remark = p_wtdraw_remark;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #判断撤单表是否有已撤流水，不存在需要报错

        /* [更新表记录][交易证券_交易_撤单表][{撤单状态} = @撤单状态#, {撤单说明} = @撤单说明#][{订单序号} = @订单序号# and {撤单状态} = 《撤单状态-成功》][2][concat("该订单不存在成功的撤单流水记录!",@订单序号#)] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdsetd_cancel set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, wtdraw_status = v_wtdraw_status, wtdraw_remark = v_wtdraw_remark where order_id = v_order_id and wtdraw_status = "3";
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.10.77.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("该订单不存在成功的撤单流水记录!",v_order_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("该订单不存在成功的撤单流水记录!",v_order_id);
            end if;
            leave label_pro;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


