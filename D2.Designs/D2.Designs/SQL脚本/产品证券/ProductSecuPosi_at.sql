DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_红冲蓝补交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_UpdateExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_UpdateExgpPosi(
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
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_invest_type int,
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exch_group_stock_type int,
    OUT p_exch_group_asset_type int,
    OUT p_exgp_invest_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_pre_settle_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_posi_qty_check_diff decimal(18,2),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
    declare v_exch_group_asset_type int;
    declare v_exgp_invest_type int;
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
    declare v_update_times int;
    declare v_curr_qty decimal(18,2);
    declare v_begin_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_exch_group_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_end_qty decimal(18,2);
    declare v_oper_menu_no int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_invest_type = p_invest_type;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
    SET v_exch_group_asset_type = 0;
    SET v_exgp_invest_type = 0;
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
    SET v_update_times = 1;
    SET v_curr_qty = 0;
    SET v_begin_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_exch_group_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

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

    /* [获取流水变动][{当前数量}][@变动数量#] */
    set v_jour_occur_field = concat("当前数量","|");
    set v_jour_occur_info = concat(v_occur_qty,"|");


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
                
        SET v_error_code = "pdsecuA.3.1.1";
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
                
        SET v_error_code = "pdsecuA.3.1.4";
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
                
        SET v_error_code = "pdsecuA.3.1.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exch_group_stock_type = v_exch_group_stock_type;
    SET p_exch_group_asset_type = v_exch_group_asset_type;
    SET p_exgp_invest_type = v_exgp_invest_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_pre_settle_qty = v_exgp_pre_settle_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_posi_qty_check_diff = v_exgp_posi_qty_check_diff;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_冻结交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_FrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_FrozenExgpPosi(
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
    IN p_stock_code_no int,
    IN p_occur_qty decimal(18,2),
    IN p_expire_date int,
    IN p_asac_frozen_no bigint,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exch_group_stock_type int,
    OUT p_exch_group_asset_type int,
    OUT p_exgp_invest_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_pre_settle_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_posi_qty_check_diff decimal(18,2),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_asac_frozen_no bigint;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
    declare v_exch_group_asset_type int;
    declare v_exgp_invest_type int;
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
    declare v_update_times int;
    declare v_invest_type int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_qty decimal(18,2);
    declare v_exch_group_update_times int;
    declare v_jour_status varchar(2);
    declare v_frozen_type int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_asac_frozen_no = p_asac_frozen_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
    SET v_exch_group_asset_type = 0;
    SET v_exgp_invest_type = 0;
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
    SET v_update_times = 1;
    SET v_invest_type = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_qty = 0;
    SET v_exch_group_update_times = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [更新表记录][产品证券_持仓_交易组持仓表][{冻结数量} = {冻结数量} + @变动数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty = frozen_qty + v_occur_qty where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.2.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{冻结数量},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@冻结数量#,@交易组持仓序号#,@交易组证券类型#,@交易组资产类型#,@交易组投资类型#,@交易组期初数量#,@交易组当前数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组持仓核对差额#,@交易组成本金额#,@交易组实现盈亏#,@交易组利息成本金额#,@交易组利息收益#,@交易组更新次数#,@交易组待交收数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select frozen_qty,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_frozen_qty,v_exgp_posi_id,v_exch_group_stock_type,v_exch_group_asset_type,v_exgp_invest_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_posi_qty_check_diff,v_exgp_cost_amt,v_exgp_realize_pandl,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_exch_group_update_times,v_exgp_pre_settle_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.2.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* set @流水状态# = 《流水状态-有效》; */
    set v_jour_status = "1";

    /* set @冻结解冻类型# = 《冻结解冻类型-冻结》; */
    set v_frozen_type = 1;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_持仓_交易组持仓冻结解冻流水表][字段][字段变量][5][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_exgp_posi_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, asac_frozen_no, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_frozen_type, v_occur_qty, 
        v_expire_date, v_jour_status, v_asac_frozen_no, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.2.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exch_group_stock_type = v_exch_group_stock_type;
    SET p_exch_group_asset_type = v_exch_group_asset_type;
    SET p_exgp_invest_type = v_exgp_invest_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_pre_settle_qty = v_exgp_pre_settle_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_posi_qty_check_diff = v_exgp_posi_qty_check_diff;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_取消冻结交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_UndoFrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_UndoFrozenExgpPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exch_group_stock_type int,
    OUT p_exch_group_asset_type int,
    OUT p_exgp_invest_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_pre_settle_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_posi_qty_check_diff decimal(18,2),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
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
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
    declare v_exch_group_asset_type int;
    declare v_exgp_invest_type int;
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
    declare v_update_times int;
    declare v_invest_type int;
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_qty decimal(18,2);
    declare v_exch_group_update_times int;

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
    SET v_exch_group_asset_type = 0;
    SET v_exgp_invest_type = 0;
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
    SET v_update_times = 1;
    SET v_invest_type = 0;
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_qty = 0;
    SET v_exch_group_update_times = 0;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [锁定获取表记录变量][产品证券_持仓_交易组持仓冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdsecu.tb_pdsepo_exgp_posi_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.3.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdsecuA.3.3.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_交易组持仓表][{冻结数量} = {冻结数量} - @变动数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty = frozen_qty - v_occur_qty where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.3.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{冻结数量},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@冻结数量#,@交易组持仓序号#,@交易组证券类型#,@交易组资产类型#,@交易组投资类型#,@交易组期初数量#,@交易组当前数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组持仓核对差额#,@交易组成本金额#,@交易组实现盈亏#,@交易组利息成本金额#,@交易组利息收益#,@交易组更新次数#,@交易组待交收数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select frozen_qty,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_frozen_qty,v_exgp_posi_id,v_exch_group_stock_type,v_exch_group_asset_type,v_exgp_invest_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_posi_qty_check_diff,v_exgp_cost_amt,v_exgp_realize_pandl,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_exch_group_update_times,v_exgp_pre_settle_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.3.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_交易组持仓冻结解冻流水表][{流水状态} = 《流水状态-无效》,{操作备注}=@操作备注#][{记录序号}=@记录序号#][5][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status = "2",oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.3.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exch_group_stock_type = v_exch_group_stock_type;
    SET p_exch_group_asset_type = v_exch_group_asset_type;
    SET p_exgp_invest_type = v_exgp_invest_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_pre_settle_qty = v_exgp_pre_settle_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_posi_qty_check_diff = v_exgp_posi_qty_check_diff;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_解冻交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_UnFrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_UnFrozenExgpPosi(
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
    IN p_stock_code_no int,
    IN p_occur_qty decimal(18,2),
    IN p_expire_date int,
    IN p_asac_frozen_no bigint,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exch_group_stock_type int,
    OUT p_exch_group_asset_type int,
    OUT p_exgp_invest_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_pre_settle_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_posi_qty_check_diff decimal(18,2),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_asac_frozen_no bigint;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
    declare v_exch_group_asset_type int;
    declare v_exgp_invest_type int;
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
    declare v_update_times int;
    declare v_invest_type int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_qty decimal(18,2);
    declare v_exch_group_update_times int;
    declare v_jour_status varchar(2);
    declare v_frozen_type int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_asac_frozen_no = p_asac_frozen_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
    SET v_exch_group_asset_type = 0;
    SET v_exgp_invest_type = 0;
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
    SET v_update_times = 1;
    SET v_invest_type = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_qty = 0;
    SET v_exch_group_update_times = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [更新表记录][产品证券_持仓_交易组持仓表][{解冻数量} = {解冻数量} + @变动数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_qty = unfroz_qty + v_occur_qty where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.4.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{解冻数量},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@解冻数量#,@交易组持仓序号#,@交易组证券类型#,@交易组资产类型#,@交易组投资类型#,@交易组期初数量#,@交易组当前数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组持仓核对差额#,@交易组成本金额#,@交易组实现盈亏#,@交易组利息成本金额#,@交易组利息收益#,@交易组更新次数#,@交易组待交收数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select unfroz_qty,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_unfroz_qty,v_exgp_posi_id,v_exch_group_stock_type,v_exch_group_asset_type,v_exgp_invest_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_posi_qty_check_diff,v_exgp_cost_amt,v_exgp_realize_pandl,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_exch_group_update_times,v_exgp_pre_settle_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.4.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* set @流水状态# = 《流水状态-有效》; */
    set v_jour_status = "1";

    /* set @冻结解冻类型# = 《冻结解冻类型-解冻》; */
    set v_frozen_type = 2;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_持仓_交易组持仓冻结解冻流水表][字段][字段变量][5][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_exgp_posi_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, asac_frozen_no, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_frozen_type, v_occur_qty, 
        v_expire_date, v_jour_status, v_asac_frozen_no, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.4.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exch_group_stock_type = v_exch_group_stock_type;
    SET p_exch_group_asset_type = v_exch_group_asset_type;
    SET p_exgp_invest_type = v_exgp_invest_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_pre_settle_qty = v_exgp_pre_settle_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_posi_qty_check_diff = v_exgp_posi_qty_check_diff;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_取消解冻交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_UndoUnFrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_UndoUnFrozenExgpPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exch_group_stock_type int,
    OUT p_exch_group_asset_type int,
    OUT p_exgp_invest_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_pre_settle_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_posi_qty_check_diff decimal(18,2),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
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
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
    declare v_exch_group_asset_type int;
    declare v_exgp_invest_type int;
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
    declare v_update_times int;
    declare v_invest_type int;
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_qty decimal(18,2);
    declare v_exch_group_update_times int;

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
    SET v_exch_group_asset_type = 0;
    SET v_exgp_invest_type = 0;
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
    SET v_update_times = 1;
    SET v_invest_type = 0;
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_qty = 0;
    SET v_exch_group_update_times = 0;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [锁定获取表记录变量][产品证券_持仓_交易组持仓冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdsecu.tb_pdsepo_exgp_posi_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.5.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdsecuA.3.5.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_交易组持仓表][{解冻数量} = {解冻数量} - @变动数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_qty = unfroz_qty - v_occur_qty where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.5.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{解冻数量},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@解冻数量#,@交易组持仓序号#,@交易组证券类型#,@交易组资产类型#,@交易组投资类型#,@交易组期初数量#,@交易组当前数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组持仓核对差额#,@交易组成本金额#,@交易组实现盈亏#,@交易组利息成本金额#,@交易组利息收益#,@交易组更新次数#,@交易组待交收数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select unfroz_qty,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_unfroz_qty,v_exgp_posi_id,v_exch_group_stock_type,v_exch_group_asset_type,v_exgp_invest_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_posi_qty_check_diff,v_exgp_cost_amt,v_exgp_realize_pandl,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_exch_group_update_times,v_exgp_pre_settle_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.5.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_交易组持仓冻结解冻流水表][{流水状态} = 《流水状态-无效》,{操作备注}=@操作备注#][{记录序号}=@记录序号#][5][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status = "2",oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.5.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exch_group_stock_type = v_exch_group_stock_type;
    SET p_exch_group_asset_type = v_exch_group_asset_type;
    SET p_exgp_invest_type = v_exgp_invest_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_pre_settle_qty = v_exgp_pre_settle_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_posi_qty_check_diff = v_exgp_posi_qty_check_diff;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_调整交易组持仓成本
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_UpdateExgpPosiCost;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_UpdateExgpPosiCost(
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
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_invest_type int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_occur_cost_amt decimal(18,4),
    IN p_occur_intrst_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exch_group_stock_type int,
    OUT p_exch_group_asset_type int,
    OUT p_exgp_invest_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_pre_settle_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_posi_qty_check_diff decimal(18,2),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_cost_amt decimal(18,4);
    declare v_occur_intrst_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
    declare v_exch_group_asset_type int;
    declare v_exgp_invest_type int;
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
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_exch_group_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_qty decimal(18,2);
    declare v_occur_end_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
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
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_invest_type = p_invest_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_cost_amt = p_occur_cost_amt;
    SET v_occur_intrst_amt = p_occur_intrst_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
    SET v_exch_group_asset_type = 0;
    SET v_exgp_invest_type = 0;
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
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_pandl = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_exch_group_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_occur_qty = 0;
    SET v_occur_end_qty = 0;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{变动成本金额},{成本金额},{变动利息金额},{利息成本金额}][@变动成本金额#, @成本金额#, @变动利息金额#, @利息成本金额#] */
    set v_jour_occur_field = concat("变动成本金额","|","成本金额","|","变动利息金额","|","利息成本金额","|");
    set v_jour_occur_info = concat(v_occur_cost_amt,"|", v_cost_amt,"|", v_occur_intrst_amt,"|", v_intrst_cost_amt,"|");

    #管理端 传入的变动成本金额、变动利息金额是与交易库做 差值的。 考虑交易库有 而 产品库没有的持仓做插入操作。

    /* set @期初数量# =0; */
    set v_begin_qty =0;

    /* set @当前数量# =0; */
    set v_curr_qty =0;

    /* set @待交收数量# =0; */
    set v_pre_settle_qty =0;

    /* set @冻结数量# =0; */
    set v_frozen_qty =0;

    /* set @解冻数量# =0; */
    set v_unfroz_qty =0;

    /* set @持仓核对差额# =0; */
    set v_posi_qty_check_diff =0;

    /* set @实现盈亏# =0; */
    set v_realize_pandl =0;

    /* set @利息收益# =0; */
    set v_intrst_pandl =0;

    /* set @成本金额# =@变动成本金额#; */
    set v_cost_amt =v_occur_cost_amt;

    /* set @利息成本金额# =@变动利息金额#; */
    set v_intrst_cost_amt =v_occur_intrst_amt;

    /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{成本金额} = {成本金额} + @变动成本金额#, {利息成本金额} = {利息成本金额} + @变动利息金额#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, cost_amt = cost_amt + v_occur_cost_amt, intrst_cost_amt = intrst_cost_amt + v_occur_intrst_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.6.exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(2,"#",v_mysql_message);
        else
            SET v_error_info = 2;
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{成本金额},{利息成本金额},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@成本金额#,@利息成本金额#,@交易组持仓序号#,@交易组证券类型#,@交易组资产类型#,@交易组投资类型#,@交易组期初数量#,@交易组当前数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组持仓核对差额#,@交易组成本金额#,@交易组实现盈亏#,@交易组利息成本金额#,@交易组利息收益#,@交易组更新次数#,@交易组待交收数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select cost_amt,intrst_cost_amt,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_cost_amt,v_intrst_cost_amt,v_exgp_posi_id,v_exch_group_stock_type,v_exch_group_asset_type,v_exgp_invest_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_posi_qty_check_diff,v_exgp_cost_amt,v_exgp_realize_pandl,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_exch_group_update_times,v_exgp_pre_settle_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.6.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@变动成本金额#, @成本金额#, @变动利息金额#, @利息成本金额#] */
    set v_jour_after_occur_info = concat(v_occur_cost_amt,"|", v_cost_amt,"|", v_occur_intrst_amt,"|", v_intrst_cost_amt,"|");


    /* set @变动数量# = 0; */
    set v_occur_qty = 0;

    /* set @变动后数量# = 0; */
    set v_occur_end_qty = 0;

    /* set @业务标志# = 《业务标志-持仓成本调整》; */
    set v_busi_flag = 1105001;

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
                
        SET v_error_code = "pdsecuA.3.6.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exch_group_stock_type = v_exch_group_stock_type;
    SET p_exch_group_asset_type = v_exch_group_asset_type;
    SET p_exgp_invest_type = v_exgp_invest_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_pre_settle_qty = v_exgp_pre_settle_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_posi_qty_check_diff = v_exgp_posi_qty_check_diff;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryExgpPosi(
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
    IN p_stock_type_str varchar(2048),
    IN p_stock_code_no_str varchar(4096),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_stock_acco_str varchar(2048),
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
    declare v_stock_type_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_stock_acco_str varchar(2048);
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
    SET v_stock_type_str = p_stock_type_str;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_stock_acco_str = p_stock_acco_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_交易组持仓表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{证券类型},{投资类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and instr(@股东代码串#, concat(";", {股东代码编号}, ";")) = 0 and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type,invest_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and instr(v_stock_acco_str, concat(";", stock_acco_no, ";")) = 0 and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and row_id>v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type,invest_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and instr(v_stock_acco_str, concat(";", stock_acco_no, ";")) = 0 and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询历史交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryExgpPosi_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryExgpPosi_His(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_type_str varchar(2048),
    IN p_stock_code_no_str varchar(4096),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_type_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_历史交易组持仓表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{投资类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,invest_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl from db_pdsecu_his.tb_pdsepo_exgp_posi_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and row_id>v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,init_date,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,invest_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl from db_pdsecu_his.tb_pdsepo_exgp_posi_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询交易组持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryExgpPosiJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryExgpPosiJour(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_交易组持仓流水表][字段][{初始化日期}<=@初始化日期# and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0)  and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, busi_flag, 
        occur_qty, occur_end_qty, jour_occur_field, jour_after_occur_info, 
        oper_remark_info, invest_type from db_pdsecu.tb_pdsepo_exgp_posi_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0)  and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, busi_flag, 
        occur_qty, occur_end_qty, jour_occur_field, jour_after_occur_info, 
        oper_remark_info, invest_type from db_pdsecu.tb_pdsepo_exgp_posi_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0)  and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询历史交易组持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryExgpPosiJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryExgpPosiJour_His(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品证券_持仓_交易组持仓流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0)  and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, busi_flag, 
        occur_qty, occur_end_qty, jour_occur_field, jour_after_occur_info, 
        oper_remark_info, invest_type from db_pdsecu_his.tb_pdsepo_exgp_posi_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0)  and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, busi_flag, 
        occur_qty, occur_end_qty, jour_occur_field, jour_after_occur_info, 
        oper_remark_info, invest_type from db_pdsecu_his.tb_pdsepo_exgp_posi_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0)  and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取交易组持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetExgpPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetExgpPosiFrozenJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_oper_func_code varchar(16),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_frozen_type int,
    OUT p_jour_status varchar(2),
    OUT p_occur_qty decimal(18,2),
    OUT p_expire_date int,
    OUT p_asac_frozen_no bigint
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_frozen_type int;
    declare v_jour_status varchar(2);
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_asac_frozen_no bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_menu_no int;
    declare v_init_date int;
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
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_func_code = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_frozen_type = 0;
    SET v_jour_status = "0";
    SET v_occur_qty = 0;
    SET v_expire_date = date_format(curdate(),'%Y%m%d');
    SET v_asac_frozen_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_持仓_交易组持仓冻结解冻流水表][字段][字段变量][{记录序号} = @记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, frozen_type, 
        occur_qty, expire_date, jour_status, asac_frozen_no, 
        oper_remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_menu_no, v_oper_func_code, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_frozen_type, 
        v_occur_qty, v_expire_date, v_jour_status, v_asac_frozen_no, 
        v_oper_remark_info from db_pdsecu.tb_pdsepo_exgp_posi_frozen_jour where row_id = v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_oper_func_code = v_oper_func_code;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_frozen_type = v_frozen_type;
    SET p_jour_status = v_jour_status;
    SET p_occur_qty = v_occur_qty;
    SET p_expire_date = v_expire_date;
    SET p_asac_frozen_no = v_asac_frozen_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取资产账户关联交易组持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetAsacExgpPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetAsacExgpPosiFrozenJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_asac_frozen_no bigint,
    IN p_frozen_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_exch_group_no int,
    OUT p_occur_qty decimal(18,2)
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_asac_frozen_no bigint;
    declare v_frozen_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_exch_group_no int;
    declare v_occur_qty decimal(18,2);
    declare v_jour_status varchar(2);

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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_asac_frozen_no = p_asac_frozen_no;
    SET v_frozen_type = p_frozen_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_exch_group_no = 0;
    SET v_occur_qty = 0;
    SET v_jour_status = "0";

    
    label_pro:BEGIN
    

    /* set @流水状态# = 《流水状态-有效》; */
    set v_jour_status = "1";

    /* [获取表记录变量][产品证券_持仓_交易组持仓冻结解冻流水表][{记录序号},{交易组编号},{变动数量}][@记录序号#,@交易组编号#,@变动数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {资产账户冻结解冻流水号}=@资产账户冻结解冻流水号# and {冻结解冻类型}=@冻结解冻类型# and {流水状态}=@流水状态#][4][@资产账户编号#,@股东代码编号#,@证券代码编号#,@资产账户冻结解冻流水号#,@冻结解冻类型#,@流水状态#] */
    select row_id,exch_group_no,occur_qty into v_row_id,v_exch_group_no,v_occur_qty from db_pdsecu.tb_pdsepo_exgp_posi_frozen_jour where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and asac_frozen_no=v_asac_frozen_no and frozen_type=v_frozen_type and jour_status=v_jour_status limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.40.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","资产账户冻结解冻流水号=",v_asac_frozen_no,",","冻结解冻类型=",v_frozen_type,",","流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","资产账户冻结解冻流水号=",v_asac_frozen_no,",","冻结解冻类型=",v_frozen_type,",","流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_exch_group_no = v_exch_group_no;
    SET p_occur_qty = v_occur_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询交易组持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryExgpPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryExgpPosiFrozenJour(
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
    IN p_stock_code_no_str varchar(4096),
    IN p_frozen_type int,
    IN p_jour_status varchar(2),
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
    declare v_frozen_type int;
    declare v_jour_status varchar(2);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_frozen_type = p_frozen_type;
    SET v_jour_status = p_jour_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_交易组持仓冻结解冻流水表][字段][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@流水状态# = " " or {流水状态}=@流水状态#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, frozen_type, 
        occur_qty, expire_date, jour_status, asac_frozen_no, 
        oper_remark_info from db_pdsecu.tb_pdsepo_exgp_posi_frozen_jour where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, frozen_type, 
        occur_qty, expire_date, jour_status, asac_frozen_no, 
        oper_remark_info from db_pdsecu.tb_pdsepo_exgp_posi_frozen_jour where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询历史交易组持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryExgpPosiFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryExgpPosiFrozenJour_His(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
    IN p_frozen_type int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
    declare v_frozen_type int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_frozen_type = p_frozen_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品证券_持仓_交易组持仓冻结解冻流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, frozen_type, 
        occur_qty, expire_date, jour_status, asac_frozen_no, 
        oper_remark_info from db_pdsecu_his.tb_pdsepo_exgp_posi_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, frozen_type, 
        occur_qty, expire_date, jour_status, asac_frozen_no, 
        oper_remark_info from db_pdsecu_his.tb_pdsepo_exgp_posi_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询债券质押交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryBondImpawnExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryBondImpawnExgpPosi(
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #此处只查询二级市场的持仓

    /* [获取表记录][产品证券_持仓_交易组持仓表][{记录序号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{当前数量}+{待交收数量}-{冻结数量}+{解冻数量} as {可质押数量},0 as {质押比例}][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and ({证券类型}>20 and {证券类型}<50) and {投资类型}=1 and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,curr_qty+pre_settle_qty-frozen_qty+unfroz_qty as avail_impawn_qty,0 as impawn_ratio from db_pdsecu.tb_pdsepo_exgp_posi where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (stock_type>20 and stock_type<50) and invest_type=1 and row_id>v_row_id order by row_id;
    else
        select row_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,curr_qty+pre_settle_qty-frozen_qty+unfroz_qty as avail_impawn_qty,0 as impawn_ratio from db_pdsecu.tb_pdsepo_exgp_posi where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (stock_type>20 and stock_type<50) and invest_type=1 and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询债券转回质押质押信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryBondImpawnExgpImpawn;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryBondImpawnExgpImpawn(
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_交易组债券质押表][{记录序号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{当前数量} as {质押数量}][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,curr_qty as impawn_qty from db_pdsecu.tb_pdsepo_exgp_bond_pledge where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and row_id>v_row_id order by row_id;
    else
        select row_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,curr_qty as impawn_qty from db_pdsecu.tb_pdsepo_exgp_bond_pledge where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询交易组标准券可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryExgpTargetCodeAvai;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryExgpTargetCodeAvai(
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #此处只查询二级市场的持仓

    /* [获取表记录][产品证券_持仓_交易组持仓表][{记录序号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{当前数量}+{待交收数量}-{冻结数量}+{解冻数量} as {可用数量}][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and {证券类型}=《证券类型-回购标准券》  and {投资类型}=1 and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,curr_qty+pre_settle_qty-frozen_qty+unfroz_qty as avail_qty from db_pdsecu.tb_pdsepo_exgp_posi where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and stock_type=27  and invest_type=1 and row_id>v_row_id order by row_id;
    else
        select row_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,curr_qty+pre_settle_qty-frozen_qty+unfroz_qty as avail_qty from db_pdsecu.tb_pdsepo_exgp_posi where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and stock_type=27  and invest_type=1 and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询债券回购
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryBondRepo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryBondRepo(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_order_dir int,
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_order_dir int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_dir = p_order_dir;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_债券回购表][字段][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@订单方向#=0 or {订单方向}=@订单方向#) and {回购处理状态} =《回购处理状态-未处理》 and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_code, target_code_no, 
        target_code, order_dir, repo_qty, repo_amt, 
        repo_rate, repo_trade_date, repo_order_id, repo_strike_id, 
        repo_days, repo_cale_days, repo_back_date, repo_back_amt, 
        repo_back_intrst, repo_back_trade_date, repo_status from db_pdsecu.tb_pdsepo_bond_repo where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_order_dir=0 or order_dir=v_order_dir) and repo_status ="2" and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_code, target_code_no, 
        target_code, order_dir, repo_qty, repo_amt, 
        repo_rate, repo_trade_date, repo_order_id, repo_strike_id, 
        repo_days, repo_cale_days, repo_back_date, repo_back_amt, 
        repo_back_intrst, repo_back_trade_date, repo_status from db_pdsecu.tb_pdsepo_bond_repo where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_order_dir=0 or order_dir=v_order_dir) and repo_status ="2" and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询交易组债券质押
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryExchGroupBondPledge;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryExchGroupBondPledge(
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
    IN p_stock_code_no int,
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
    declare v_stock_code_no int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_交易组债券质押表][{记录序号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{期初数量},{当前数量},{提交质押数量},{转回质押数量}][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,begin_qty,curr_qty,put_impawn_qty,get_impawn_qty from db_pdsecu.tb_pdsepo_exgp_bond_pledge where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and row_id>v_row_id order by row_id;
    else
        select row_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,begin_qty,curr_qty,put_impawn_qty,get_impawn_qty from db_pdsecu.tb_pdsepo_exgp_bond_pledge where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_红冲蓝补资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_UpdateAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_UpdateAsacPosi(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_invest_type int,
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_posi_id bigint,
    OUT p_asac_stock_type int,
    OUT p_asac_asset_type int,
    OUT p_asac_invest_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_pre_settle_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_posi_qty_check_diff decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_posi_id bigint;
    declare v_asac_stock_type int;
    declare v_asac_asset_type int;
    declare v_asac_invest_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_pre_settle_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_posi_qty_check_diff decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_update_times int;
    declare v_curr_qty decimal(18,2);
    declare v_begin_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_asac_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_end_qty decimal(18,2);
    declare v_oper_menu_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_invest_type = p_invest_type;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_posi_id = 0;
    SET v_asac_stock_type = 0;
    SET v_asac_asset_type = 0;
    SET v_asac_invest_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_pre_settle_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_posi_qty_check_diff = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_update_times = 1;
    SET v_curr_qty = 0;
    SET v_begin_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_asac_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

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

    /* [获取流水变动][{当前数量}][@变动数量#] */
    set v_jour_occur_field = concat("当前数量","|");
    set v_jour_occur_info = concat(v_occur_qty,"|");


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
                
        SET v_error_code = "pdsecuA.3.51.asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type";
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
                
        SET v_error_code = "pdsecuA.3.51.4";
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
                
        SET v_error_code = "pdsecuA.3.51.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_stock_type = v_asac_stock_type;
    SET p_asac_asset_type = v_asac_asset_type;
    SET p_asac_invest_type = v_asac_invest_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_pre_settle_qty = v_asac_pre_settle_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_posi_qty_check_diff = v_asac_posi_qty_check_diff;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_冻结资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_FrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_FrozenAsacPosi(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_occur_qty decimal(18,2),
    IN p_expire_date int,
    IN p_is_change_exch_group_posi int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_posi_id bigint,
    OUT p_asac_stock_type int,
    OUT p_asac_asset_type int,
    OUT p_asac_invest_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_pre_settle_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_posi_qty_check_diff decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
    OUT p_update_times int,
    OUT p_asac_frozen_no bigint
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_is_change_exch_group_posi int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_posi_id bigint;
    declare v_asac_stock_type int;
    declare v_asac_asset_type int;
    declare v_asac_invest_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_pre_settle_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_posi_qty_check_diff decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_update_times int;
    declare v_asac_frozen_no bigint;
    declare v_invest_type int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_qty decimal(18,2);
    declare v_asac_update_times int;
    declare v_jour_status varchar(2);
    declare v_frozen_type int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_is_change_exch_group_posi = p_is_change_exch_group_posi;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_posi_id = 0;
    SET v_asac_stock_type = 0;
    SET v_asac_asset_type = 0;
    SET v_asac_invest_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_pre_settle_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_posi_qty_check_diff = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_update_times = 1;
    SET v_asac_frozen_no = 0;
    SET v_invest_type = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_qty = 0;
    SET v_asac_update_times = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [更新表记录][产品证券_持仓_资产账户持仓表][{冻结数量} = {冻结数量} + @变动数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty = frozen_qty + v_occur_qty where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.52.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{冻结数量},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@冻结数量#,@资产账户持仓序号#,@资产账户证券类型#,@资产账户资产类型#,@资产账户投资类型#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户持仓核对差额#,@资产账户成本金额#,@资产账户实现盈亏#,@资产账户利息成本金额#,@资产账户利息收益#,@资产账户更新次数#,@资产账户待交收数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select frozen_qty,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_frozen_qty,v_asac_posi_id,v_asac_stock_type,v_asac_asset_type,v_asac_invest_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_posi_qty_check_diff,v_asac_cost_amt,v_asac_realize_pandl,v_asac_intrst_cost_amt,v_asac_intrst_pandl,v_asac_update_times,v_asac_pre_settle_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.52.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* set @流水状态# = 《流水状态-有效》; */
    set v_jour_status = "1";

    /* set @冻结解冻类型# = 《冻结解冻类型-冻结》; */
    set v_frozen_type = 1;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_持仓_资产账户持仓冻结解冻流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_posi_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, frozen_type, occur_qty, expire_date, 
        jour_status, is_change_exch_group_posi, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_frozen_type, v_occur_qty, v_expire_date, 
        v_jour_status, v_is_change_exch_group_posi, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.52.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@资产账户冻结解冻流水号#] */
    select LAST_INSERT_ID() into v_asac_frozen_no;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_stock_type = v_asac_stock_type;
    SET p_asac_asset_type = v_asac_asset_type;
    SET p_asac_invest_type = v_asac_invest_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_pre_settle_qty = v_asac_pre_settle_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_posi_qty_check_diff = v_asac_posi_qty_check_diff;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_update_times = v_update_times;
    SET p_asac_frozen_no = v_asac_frozen_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_取消冻结资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_UndoFrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_UndoFrozenAsacPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_posi_id bigint,
    OUT p_asac_stock_type int,
    OUT p_asac_asset_type int,
    OUT p_asac_invest_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_pre_settle_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_posi_qty_check_diff decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
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
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_posi_id bigint;
    declare v_asac_stock_type int;
    declare v_asac_asset_type int;
    declare v_asac_invest_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_pre_settle_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_posi_qty_check_diff decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_update_times int;
    declare v_invest_type int;
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_qty decimal(18,2);
    declare v_asac_update_times int;

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_posi_id = 0;
    SET v_asac_stock_type = 0;
    SET v_asac_asset_type = 0;
    SET v_asac_invest_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_pre_settle_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_posi_qty_check_diff = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_update_times = 1;
    SET v_invest_type = 0;
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_qty = 0;
    SET v_asac_update_times = 0;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [锁定获取表记录变量][产品证券_持仓_资产账户持仓冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdsecu.tb_pdsepo_asac_posi_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdsecuA.3.53.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_资产账户持仓表][{冻结数量} = {冻结数量} - @变动数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty = frozen_qty - v_occur_qty where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.53.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{冻结数量},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@冻结数量#,@资产账户持仓序号#,@资产账户证券类型#,@资产账户资产类型#,@资产账户投资类型#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户持仓核对差额#,@资产账户成本金额#,@资产账户实现盈亏#,@资产账户利息成本金额#,@资产账户利息收益#,@资产账户更新次数#,@资产账户待交收数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select frozen_qty,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_frozen_qty,v_asac_posi_id,v_asac_stock_type,v_asac_asset_type,v_asac_invest_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_posi_qty_check_diff,v_asac_cost_amt,v_asac_realize_pandl,v_asac_intrst_cost_amt,v_asac_intrst_pandl,v_asac_update_times,v_asac_pre_settle_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_资产账户持仓冻结解冻流水表][{流水状态} = 《流水状态-无效》,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][concat("记录序号=", @记录序号#)] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status = "2",oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.53.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=", v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=", v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_stock_type = v_asac_stock_type;
    SET p_asac_asset_type = v_asac_asset_type;
    SET p_asac_invest_type = v_asac_invest_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_pre_settle_qty = v_asac_pre_settle_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_posi_qty_check_diff = v_asac_posi_qty_check_diff;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_解冻资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_UnFrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_UnFrozenAsacPosi(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_occur_qty decimal(18,2),
    IN p_expire_date int,
    IN p_is_change_exch_group_posi int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_posi_id bigint,
    OUT p_asac_stock_type int,
    OUT p_asac_asset_type int,
    OUT p_asac_invest_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_pre_settle_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_posi_qty_check_diff decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
    OUT p_update_times int,
    OUT p_asac_frozen_no bigint
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_is_change_exch_group_posi int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_posi_id bigint;
    declare v_asac_stock_type int;
    declare v_asac_asset_type int;
    declare v_asac_invest_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_pre_settle_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_posi_qty_check_diff decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_update_times int;
    declare v_asac_frozen_no bigint;
    declare v_invest_type int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_qty decimal(18,2);
    declare v_asac_update_times int;
    declare v_jour_status varchar(2);
    declare v_frozen_type int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_is_change_exch_group_posi = p_is_change_exch_group_posi;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_posi_id = 0;
    SET v_asac_stock_type = 0;
    SET v_asac_asset_type = 0;
    SET v_asac_invest_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_pre_settle_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_posi_qty_check_diff = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_update_times = 1;
    SET v_asac_frozen_no = 0;
    SET v_invest_type = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_qty = 0;
    SET v_asac_update_times = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [更新表记录][产品证券_持仓_资产账户持仓表][{解冻数量} = {解冻数量} + @变动数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_qty = unfroz_qty + v_occur_qty where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.54.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{解冻数量},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@解冻数量#,@资产账户持仓序号#,@资产账户证券类型#,@资产账户资产类型#,@资产账户投资类型#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户持仓核对差额#,@资产账户成本金额#,@资产账户实现盈亏#,@资产账户利息成本金额#,@资产账户利息收益#,@资产账户更新次数#,@资产账户待交收数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select unfroz_qty,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_unfroz_qty,v_asac_posi_id,v_asac_stock_type,v_asac_asset_type,v_asac_invest_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_posi_qty_check_diff,v_asac_cost_amt,v_asac_realize_pandl,v_asac_intrst_cost_amt,v_asac_intrst_pandl,v_asac_update_times,v_asac_pre_settle_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.54.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* set @流水状态# = 《流水状态-有效》; */
    set v_jour_status = "1";

    /* set @冻结解冻类型# = 《冻结解冻类型-解冻》; */
    set v_frozen_type = 2;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_持仓_资产账户持仓冻结解冻流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_posi_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, frozen_type, occur_qty, expire_date, 
        jour_status, is_change_exch_group_posi, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_frozen_type, v_occur_qty, v_expire_date, 
        v_jour_status, v_is_change_exch_group_posi, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.54.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@资产账户冻结解冻流水号#] */
    select LAST_INSERT_ID() into v_asac_frozen_no;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_stock_type = v_asac_stock_type;
    SET p_asac_asset_type = v_asac_asset_type;
    SET p_asac_invest_type = v_asac_invest_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_pre_settle_qty = v_asac_pre_settle_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_posi_qty_check_diff = v_asac_posi_qty_check_diff;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_update_times = v_update_times;
    SET p_asac_frozen_no = v_asac_frozen_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_取消解冻资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_UndoUnFrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_UndoUnFrozenAsacPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_posi_id bigint,
    OUT p_asac_stock_type int,
    OUT p_asac_asset_type int,
    OUT p_asac_invest_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_pre_settle_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_posi_qty_check_diff decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
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
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_posi_id bigint;
    declare v_asac_stock_type int;
    declare v_asac_asset_type int;
    declare v_asac_invest_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_pre_settle_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_posi_qty_check_diff decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_update_times int;
    declare v_invest_type int;
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_qty decimal(18,2);
    declare v_asac_update_times int;

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_posi_id = 0;
    SET v_asac_stock_type = 0;
    SET v_asac_asset_type = 0;
    SET v_asac_invest_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_pre_settle_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_posi_qty_check_diff = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_update_times = 1;
    SET v_invest_type = 0;
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_qty = 0;
    SET v_asac_update_times = 0;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [锁定获取表记录变量][产品证券_持仓_资产账户持仓冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdsecu.tb_pdsepo_asac_posi_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.55.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdsecuA.3.55.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_资产账户持仓表][{解冻数量} = {解冻数量} - @变动数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_qty = unfroz_qty - v_occur_qty where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.55.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{解冻数量},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@解冻数量#,@资产账户持仓序号#,@资产账户证券类型#,@资产账户资产类型#,@资产账户投资类型#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户持仓核对差额#,@资产账户成本金额#,@资产账户实现盈亏#,@资产账户利息成本金额#,@资产账户利息收益#,@资产账户更新次数#,@资产账户待交收数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select unfroz_qty,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_unfroz_qty,v_asac_posi_id,v_asac_stock_type,v_asac_asset_type,v_asac_invest_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_posi_qty_check_diff,v_asac_cost_amt,v_asac_realize_pandl,v_asac_intrst_cost_amt,v_asac_intrst_pandl,v_asac_update_times,v_asac_pre_settle_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.55.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_资产账户持仓冻结解冻流水表][{流水状态} = 《流水状态-无效》,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][concat("记录序号=", @记录序号#)] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status = "2",oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.55.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=", v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=", v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_stock_type = v_asac_stock_type;
    SET p_asac_asset_type = v_asac_asset_type;
    SET p_asac_invest_type = v_asac_invest_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_pre_settle_qty = v_asac_pre_settle_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_posi_qty_check_diff = v_asac_posi_qty_check_diff;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_调整资产账户持仓成本
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_UpdateAsacPosiCost;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_UpdateAsacPosiCost(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_invest_type int,
    IN p_occur_cost_amt decimal(18,4),
    IN p_occur_intrst_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_posi_id bigint,
    OUT p_asac_stock_type int,
    OUT p_asac_asset_type int,
    OUT p_asac_invest_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_pre_settle_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_posi_qty_check_diff decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_occur_cost_amt decimal(18,4);
    declare v_occur_intrst_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_posi_id bigint;
    declare v_asac_stock_type int;
    declare v_asac_asset_type int;
    declare v_asac_invest_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_pre_settle_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_posi_qty_check_diff decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_asac_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_qty decimal(18,2);
    declare v_occur_end_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_invest_type = p_invest_type;
    SET v_occur_cost_amt = p_occur_cost_amt;
    SET v_occur_intrst_amt = p_occur_intrst_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_posi_id = 0;
    SET v_asac_stock_type = 0;
    SET v_asac_asset_type = 0;
    SET v_asac_invest_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_pre_settle_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_posi_qty_check_diff = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_pandl = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_asac_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_occur_qty = 0;
    SET v_occur_end_qty = 0;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{变动成本金额},{成本金额},{变动利息金额},{利息成本金额}][@变动成本金额#, @成本金额#, @变动利息金额#, @利息成本金额#] */
    set v_jour_occur_field = concat("变动成本金额","|","成本金额","|","变动利息金额","|","利息成本金额","|");
    set v_jour_occur_info = concat(v_occur_cost_amt,"|", v_cost_amt,"|", v_occur_intrst_amt,"|", v_intrst_cost_amt,"|");

    #管理端 传入的变动成本金额、变动利息金额是与交易库做 差值的。 考虑交易库有 而 产品库没有的持仓做插入操作。

    /* set @期初数量# =0; */
    set v_begin_qty =0;

    /* set @当前数量# =0; */
    set v_curr_qty =0;

    /* set @待交收数量# =0; */
    set v_pre_settle_qty =0;

    /* set @冻结数量# =0; */
    set v_frozen_qty =0;

    /* set @解冻数量# =0; */
    set v_unfroz_qty =0;

    /* set @持仓核对差额# =0; */
    set v_posi_qty_check_diff =0;

    /* set @实现盈亏# =0; */
    set v_realize_pandl =0;

    /* set @利息收益# =0; */
    set v_intrst_pandl =0;

    /* set @成本金额# =@变动成本金额#; */
    set v_cost_amt =v_occur_cost_amt;

    /* set @利息成本金额# =@变动利息金额#; */
    set v_intrst_cost_amt =v_occur_intrst_amt;

    /* [插入重复更新][产品证券_持仓_资产账户持仓表][字段][字段变量][{成本金额} = {成本金额} + @变动成本金额#, {利息成本金额} = {利息成本金额} + @变动利息金额#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, cost_amt = cost_amt + v_occur_cost_amt, intrst_cost_amt = intrst_cost_amt + v_occur_intrst_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.56.asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(2,"#",v_mysql_message);
        else
            SET v_error_info = 2;
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{成本金额}, {利息成本金额},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@成本金额#, @利息成本金额#,@资产账户持仓序号#,@资产账户证券类型#,@资产账户资产类型#,@资产账户投资类型#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户持仓核对差额#,@资产账户成本金额#,@资产账户实现盈亏#,@资产账户利息成本金额#,@资产账户利息收益#,@资产账户更新次数#,@资产账户待交收数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select cost_amt, intrst_cost_amt,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_cost_amt, v_intrst_cost_amt,v_asac_posi_id,v_asac_stock_type,v_asac_asset_type,v_asac_invest_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_posi_qty_check_diff,v_asac_cost_amt,v_asac_realize_pandl,v_asac_intrst_cost_amt,v_asac_intrst_pandl,v_asac_update_times,v_asac_pre_settle_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.56.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@变动成本金额#, @成本金额#, @变动利息金额#, @利息成本金额#] */
    set v_jour_after_occur_info = concat(v_occur_cost_amt,"|", v_cost_amt,"|", v_occur_intrst_amt,"|", v_intrst_cost_amt,"|");


    /* set @变动数量# = 0; */
    set v_occur_qty = 0;

    /* set @变动后数量# = 0; */
    set v_occur_end_qty = 0;

    /* set @业务标志# = 《业务标志-持仓成本调整》; */
    set v_busi_flag = 1105001;

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
                
        SET v_error_code = "pdsecuA.3.56.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_stock_type = v_asac_stock_type;
    SET p_asac_asset_type = v_asac_asset_type;
    SET p_asac_invest_type = v_asac_invest_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_pre_settle_qty = v_asac_pre_settle_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_posi_qty_check_diff = v_asac_posi_qty_check_diff;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryAsacPosi(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_资产账户持仓表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{机构编号},{产品编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{投资类型},{证券类型},{资产类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][(@机构编号# =0 or {机构编号} = @机构编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@产品编号权限串# = ' ' or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,invest_type,stock_type,asset_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl from db_pdsecu.tb_pdsepo_asac_posi where (v_co_no =0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_pd_no_rights_str = ' ' or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,invest_type,stock_type,asset_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl from db_pdsecu.tb_pdsepo_asac_posi where (v_co_no =0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_pd_no_rights_str = ' ' or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询历史资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryAsacPosi_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryAsacPosi_His(
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
    IN p_asset_acco_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_历史资产账户持仓表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{投资类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,init_date,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,invest_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl from db_pdsecu_his.tb_pdsepo_asac_posi_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,init_date,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,invest_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl from db_pdsecu_his.tb_pdsepo_asac_posi_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询资产账户持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryAsacPosiJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryAsacPosiJour(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_资产账户持仓流水表][字段][{初始化日期}<=@初始化日期# and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
        invest_type from db_pdsecu.tb_pdsepo_asac_posi_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
        invest_type from db_pdsecu.tb_pdsepo_asac_posi_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询历史资产账户持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryAsacPosiJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryAsacPosiJour_His(
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
    IN p_asset_acco_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品证券_持仓_资产账户持仓流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0)  and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
        invest_type from db_pdsecu_his.tb_pdsepo_asac_posi_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0)  and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
        invest_type from db_pdsecu_his.tb_pdsepo_asac_posi_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0)  and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取资产账户持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetAsacPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetAsacPosiFrozenJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_oper_func_code varchar(16),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_frozen_type int,
    OUT p_jour_status varchar(2),
    OUT p_occur_qty decimal(18,2),
    OUT p_expire_date int,
    OUT p_is_change_exch_group_posi int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_frozen_type int;
    declare v_jour_status varchar(2);
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_is_change_exch_group_posi int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_menu_no int;
    declare v_init_date int;
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
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_func_code = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_frozen_type = 0;
    SET v_jour_status = "0";
    SET v_occur_qty = 0;
    SET v_expire_date = date_format(curdate(),'%Y%m%d');
    SET v_is_change_exch_group_posi = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_持仓_资产账户持仓冻结解冻流水表][字段][字段变量][{记录序号} = @记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, is_change_exch_group_posi, oper_remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_menu_no, v_oper_func_code, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_frozen_type, v_occur_qty, 
        v_expire_date, v_jour_status, v_is_change_exch_group_posi, v_oper_remark_info from db_pdsecu.tb_pdsepo_asac_posi_frozen_jour where row_id = v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.83.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_oper_func_code = v_oper_func_code;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_frozen_type = v_frozen_type;
    SET p_jour_status = v_jour_status;
    SET p_occur_qty = v_occur_qty;
    SET p_expire_date = v_expire_date;
    SET p_is_change_exch_group_posi = v_is_change_exch_group_posi;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询资产账户持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryAsacPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryAsacPosiFrozenJour(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
    IN p_frozen_type int,
    IN p_jour_status varchar(2),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
    declare v_frozen_type int;
    declare v_jour_status varchar(2);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_frozen_type = p_frozen_type;
    SET v_jour_status = p_jour_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_资产账户持仓冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 or @产品编号权限串# = " ") and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@流水状态# = " " or {流水状态}=@流水状态#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, is_change_exch_group_posi, oper_remark_info from db_pdsecu.tb_pdsepo_asac_posi_frozen_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 or v_pd_no_rights_str = " ") and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, is_change_exch_group_posi, oper_remark_info from db_pdsecu.tb_pdsepo_asac_posi_frozen_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 or v_pd_no_rights_str = " ") and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询历史资产账户持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryAsacPosiFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryAsacPosiFrozenJour_His(
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
    IN p_asset_acco_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_frozen_type int;

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_frozen_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品证券_持仓_资产账户持仓冻结解冻流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, is_change_exch_group_posi, oper_remark_info from db_pdsecu_his.tb_pdsepo_asac_posi_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, is_change_exch_group_posi, oper_remark_info from db_pdsecu_his.tb_pdsepo_asac_posi_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取资产账户持仓可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetAsacPosiAvail;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetAsacPosiAvail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_default_exch_group_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no int,
    OUT p_curr_qty decimal(18,2),
    OUT p_avail_qty decimal(18,2)
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
    declare v_default_exch_group_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no int;
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_invest_type int;
    declare v_posi_qty decimal(18,2);
    declare v_tmp_curr_qty decimal(18,2);

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
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_curr_qty = 0;
    SET v_avail_qty = 0;
    SET v_invest_type = 0;
    SET v_posi_qty = 0;
    SET v_tmp_curr_qty = 0;

    
    label_pro:BEGIN
    
    #当前和可用都需要用二级市场的普通持仓+大宗交易的当前数量

    /* set @投资类型#=1; */
    set v_invest_type=1;
    #先获取产品库和交易库的二级市场非大宗交易对应的数据

    /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][{当前数量},{当前数量}+{待交收数量}+{持仓核对差额}][@当前数量#,@可用数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
    select curr_qty,curr_qty+pre_settle_qty+posi_qty_check_diff into v_curr_qty,v_avail_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;


    /* [获取表记录变量语句][产品证券_持仓_交易资产账户持仓表][{持仓数量}][@持仓数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
    select posi_qty into v_posi_qty from db_pdsecu.tb_pdsepo_trd_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;

    #再获取产品库大宗交易对应的数据

    /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][{当前数量}][@临时_当前数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=3] */
    select curr_qty into v_tmp_curr_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=3 limit 1;


    /* set @当前数量#=@当前数量#+@临时_当前数量#; */
    set v_curr_qty=v_curr_qty+v_tmp_curr_qty;

    /* set @可用数量#=@可用数量#+@持仓数量#+@临时_当前数量#; */
    set v_avail_qty=v_avail_qty+v_posi_qty+v_tmp_curr_qty;
    #[获取表记录数量][产品证券_资金_交易组资金表][@记录个数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#]
    #if @记录个数#=1 then
      #  [获取表记录变量][产品证券_资金_交易组资金表][{交易组编号}][@交易组编号#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#]
    #else

        /* set @交易组编号# = @默认交易组编号#; */
        set v_exch_group_no = v_default_exch_group_no;
    #end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;
    SET p_curr_qty = v_curr_qty;
    SET p_avail_qty = v_avail_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取资产账户质押数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetAsacBondImpawnQty;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetAsacBondImpawnQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_default_exch_group_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no int,
    OUT p_curr_qty decimal(18,2),
    OUT p_avail_qty decimal(18,2)
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
    declare v_default_exch_group_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no int;
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_posi_qty decimal(18,2);
    declare v_record_count int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_curr_qty = 0;
    SET v_avail_qty = 0;
    SET v_posi_qty = 0;
    SET v_record_count = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    
    #可用数量=产品库的当前数量+交易库的持仓数量(提交质押数量-转回质押数量) , 早盘同步进来时交易库没有值 , 盘后可能会有值

    /* [获取表记录变量语句][产品证券_持仓_资产账户债券质押表][{当前数量}][@当前数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
    select curr_qty into v_curr_qty from db_pdsecu.tb_pdsepo_asac_bond_pledge where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;


    /* set @持仓数量#=0; */
    set v_posi_qty=0;

    /* [获取表记录变量语句][产品证券_持仓_交易库资产账户债券质押表][{持仓数量}][@持仓数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
    select posi_qty into v_posi_qty from db_pdsecu.tb_pdsepo_trd_asac_bond_pledge where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;


    /* set @可用数量# = @当前数量#+@持仓数量#; */
    set v_avail_qty = v_curr_qty+v_posi_qty;

    /* [获取表记录数量][产品证券_资金_交易组资金表][@记录个数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select count(1) into v_record_count from db_pdsecu.tb_pdseca_exgp_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;


    /* if @记录个数#=1 then */
    if v_record_count=1 then

        /* [获取表记录变量][产品证券_资金_交易组资金表][{交易组编号}][@交易组编号#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
        select exch_group_no into v_exch_group_no from db_pdsecu.tb_pdseca_exgp_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.3.87.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;

    else

        /* set @交易组编号# = @默认交易组编号#; */
        set v_exch_group_no = v_default_exch_group_no;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;
    SET p_curr_qty = v_curr_qty;
    SET p_avail_qty = v_avail_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询自动打新证券账户列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QuerySecuAccoListByAutoNewStock;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QuerySecuAccoListByAutoNewStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* SELECT
    a.{机构编号},
    a.{产品编号},
    a.{资产账户编号},
    a.{股东代码编号},
    a.{市场编号},
    a.{股东代码},
    a.{股东代码名称},
    IFNULL(b.{申购上限}, -1) as {申购上限},
    c.{操作员编号},
    c.{开始时间}
FROM
    ~产品证券_账户_证券账户信息表^ a
    inner join ~产品证券_账户_证券账户自动打新配置表^ c on a.{股东代码编号} = c.{股东代码编号}
    and c.{操作员编号}<>0
    LEFT JOIN ~产品证券_持仓_新股申购上限表^ b ON a.{资产账户编号} = b.{资产账户编号}
    AND a.{股东代码编号} = b.{股东代码编号}
    AND a.{市场编号} = b.{市场编号}
    AND a.{股东代码} = b.{股东代码} 
    AND b.{初始化日期} = @初始化日期#
    WHERE
    (@机构编号#=0 or a.{机构编号}=@机构编号#)
    and instr(a.{业务限制串},《业务限制-限制打新》)=0
    and a.{股东代码状态} = 《股东代码状态-正常》; */
    SELECT
        a.co_no,
        a.pd_no,
        a.asset_acco_no,
        a.stock_acco_no,
        a.exch_no,
        a.stock_acco,
        a.stock_acco_name,
        IFNULL(b.apply_limit, -1) as apply_limit,
        c.opor_no,
        c.begin_time
    FROM
        db_pdsecu.tb_pdseac_secu_acco a
        inner join db_pdsecu.tb_pdseac_secu_acco_new_stock_config c on a.stock_acco_no = c.stock_acco_no
        and c.opor_no<>0
        LEFT JOIN db_pdsecu.tb_pdsepo_new_stock_limit b ON a.asset_acco_no = b.asset_acco_no
        AND a.stock_acco_no = b.stock_acco_no
        AND a.exch_no = b.exch_no
        AND a.stock_acco = b.stock_acco 
        AND b.init_date = v_init_date
        WHERE
        (v_co_no=0 or a.co_no=v_co_no)
        and instr(a.busi_limit_str,1)=0
        and a.stock_acco_status = "1";
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_转入外部证券持仓记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_AddOutSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_AddOutSecuPosi(
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
    IN p_exch_group_no int,
    IN p_asac_busi_config_str varchar(64),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_out_cost_price decimal(16,9),
    IN p_out_curr_qty decimal(18,2),
    IN p_out_enable_qty decimal(18,2),
    IN p_out_frozen_qty decimal(18,2),
    IN p_out_unfroz_qty decimal(18,2),
    IN p_curr_qty decimal(18,2),
    IN p_avail_qty decimal(18,2),
    IN p_target_code_no int,
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
    declare v_exch_group_no int;
    declare v_asac_busi_config_str varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_out_cost_price decimal(16,9);
    declare v_out_curr_qty decimal(18,2);
    declare v_out_enable_qty decimal(18,2);
    declare v_out_frozen_qty decimal(18,2);
    declare v_out_unfroz_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_target_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_acco_curr_qty decimal(18,2);
    declare v_acco_avail_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_deal_flag int;
    declare v_asset_sync_flag int;
    declare v_add_pledge_to_bond int;
    declare v_remark_info varchar(255);
    declare v_acco_curr_qty_diff decimal(18,2);
    declare v_acco_avail_qty_diff decimal(18,2);
    declare v_out_impawn_qty decimal(18,2);

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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_out_cost_price = p_out_cost_price;
    SET v_out_curr_qty = p_out_curr_qty;
    SET v_out_enable_qty = p_out_enable_qty;
    SET v_out_frozen_qty = p_out_frozen_qty;
    SET v_out_unfroz_qty = p_out_unfroz_qty;
    SET v_curr_qty = p_curr_qty;
    SET v_avail_qty = p_avail_qty;
    SET v_target_code_no = p_target_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_acco_curr_qty = 0;
    SET v_acco_avail_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_deal_flag = 0;
    SET v_asset_sync_flag = 0;
    SET v_add_pledge_to_bond = 0;
    SET v_remark_info = " ";
    SET v_acco_curr_qty_diff = 0;
    SET v_acco_avail_qty_diff = 0;
    SET v_out_impawn_qty = 0;

    
    label_pro:BEGIN
    

    /* set @账户当前数量#=@当前数量#; */
    set v_acco_curr_qty=v_curr_qty;

    /* set @账户可用数量#=@可用数量#; */
    set v_acco_avail_qty=v_avail_qty;

    /* if (@市场编号#=《市场编号-上海证券交易所》 or @市场编号#=《市场编号-深圳证券交易所》) and (@证券类型#=《证券类型-债券回购》 or @证券类型#=《证券类型-回购标准券》)  then */
    if (v_exch_no=1 or v_exch_no=2) and (v_stock_type=26 or v_stock_type=27)  then
    #回购代码直接入外部持仓表，插到diff表时再做转换。Modify by wjp 20190628

       /* [插入重复更新][产品证券_持仓_外部资产账户持仓表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {股东代码编号}=@股东代码编号#, {证券代码编号}=@证券代码编号#, {证券名称}=@证券名称#, {外部成本价}=@外部成本价#, {外部当前数量}=@外部当前数量#, {外部可用数量}=@外部可用数量#, {外部冻结数量}=@外部冻结数量#, {外部解冻数量}=@外部解冻数量#][1][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@股东代码#,@证券代码#] */
       set v_create_date = date_format(curdate(),'%Y%m%d');
       set v_create_time = date_format(curtime(),'%H%i%s');
       set v_update_date = v_create_date;
       set v_update_time = v_create_time;
       set v_update_times = 1;
       insert into db_pdsecu.tb_pdsepo_out_asac_posi (
           create_date, create_time, update_date, 
           update_time, update_times, init_date, co_no, 
           pd_no, asset_acco_no, pass_no, out_acco, 
           exch_no, stock_acco_no, stock_acco, stock_code_no, 
           stock_code, stock_name, out_cost_price, out_curr_qty, 
           out_enable_qty, out_frozen_qty, out_unfroz_qty) 
       values(
           v_create_date, v_create_time, v_update_date, 
           v_update_time, v_update_times, v_init_date, v_co_no, 
           v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
           v_exch_no, v_stock_acco_no, v_stock_acco, v_stock_code_no, 
           v_stock_code, v_stock_name, v_out_cost_price, v_out_curr_qty, 
           v_out_enable_qty, v_out_frozen_qty, v_out_unfroz_qty) 
       ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, stock_acco_no=v_stock_acco_no, stock_code_no=v_stock_code_no, stock_name=v_stock_name, out_cost_price=v_out_cost_price, out_curr_qty=v_out_curr_qty, out_enable_qty=v_out_enable_qty, out_frozen_qty=v_out_frozen_qty, out_unfroz_qty=v_out_unfroz_qty;
       if v_error_code = "1" then
                   
           SET v_error_code = "pdsecuA.3.171.1";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code),"#",v_mysql_message);
           else
               SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code);
           end if;
           leave label_pro;
       end if;


        /* if @市场编号#=《市场编号-上海证券交易所》  then */
        if v_exch_no=1  then

            /* [获取表记录变量][产品证券_持仓_外部资产账户持仓表][SUM({外部当前数量}),SUM({外部可用数量}),SUM({外部冻结数量}),SUM({外部解冻数量})][@外部当前数量#,@外部可用数量#,@外部冻结数量#,@外部解冻数量#][{初始化日期}=@初始化日期# and  {通道编号}=@通道编号# and  {外部账号}=@外部账号# and  {市场编号}=@市场编号# and {股东代码}=@股东代码# and {证券代码} in ("204001","204002","204003","204007","204014","204028","204091","204182")][4][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@股东代码#,@证券代码#] */
            select SUM(out_curr_qty),SUM(out_enable_qty),SUM(out_frozen_qty),SUM(out_unfroz_qty) into v_out_curr_qty,v_out_enable_qty,v_out_frozen_qty,v_out_unfroz_qty from db_pdsecu.tb_pdsepo_out_asac_posi where init_date=v_init_date and  pass_no=v_pass_no and  out_acco=v_out_acco and  exch_no=v_exch_no and stock_acco=v_stock_acco and stock_code in ("204001","204002","204003","204007","204014","204028","204091","204182") limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.3.171.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code);
                end if;
                leave label_pro;
            end if;


            /* set @证券代码# = '888880'; */
            set v_stock_code = '888880';

            /* set @证券名称# = "新标准券"; */
            set v_stock_name = "新标准券";

        /* elseif @市场编号#=《市场编号-深圳证券交易所》 then */
        elseif v_exch_no=2 then

            /* [获取表记录变量][产品证券_持仓_外部资产账户持仓表][SUM({外部当前数量}),SUM({外部可用数量}),SUM({外部冻结数量}),SUM({外部解冻数量})][@外部当前数量#,@外部可用数量#,@外部冻结数量#,@外部解冻数量#][{初始化日期}=@初始化日期# and  {通道编号}=@通道编号# and  {外部账号}=@外部账号# and  {市场编号}=@市场编号# and {股东代码}=@股东代码# and {证券代码} in ("131810","131811","131800","131801","131802","131803","131805","131806","131809")][4][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@股东代码#,@证券代码#] */
            select SUM(out_curr_qty),SUM(out_enable_qty),SUM(out_frozen_qty),SUM(out_unfroz_qty) into v_out_curr_qty,v_out_enable_qty,v_out_frozen_qty,v_out_unfroz_qty from db_pdsecu.tb_pdsepo_out_asac_posi where init_date=v_init_date and  pass_no=v_pass_no and  out_acco=v_out_acco and  exch_no=v_exch_no and stock_acco=v_stock_acco and stock_code in ("131810","131811","131800","131801","131802","131803","131805","131806","131809") limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.3.171.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code),"#",v_mysql_message);
                else
                    SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code);
                end if;
                leave label_pro;
            end if;


            /* set @证券代码# = '131990'; */
            set v_stock_code = '131990';

            /* set @证券名称# = "标准券"; */
            set v_stock_name = "标准券";
        end if;

        /* set @证券代码编号# = @标的代码编号#; */
        set v_stock_code_no = v_target_code_no;

        /* set @证券类型# = 《证券类型-回购标准券》; */
        set v_stock_type = 27;
    else

       /* [插入重复更新][产品证券_持仓_外部资产账户持仓表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {股东代码编号}=@股东代码编号#, {证券代码编号}=@证券代码编号#, {证券名称}=@证券名称#, {外部成本价}=@外部成本价#, {外部当前数量}=@外部当前数量#, {外部可用数量}=@外部可用数量#, {外部冻结数量}=@外部冻结数量#, {外部解冻数量}=@外部解冻数量#][1][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@股东代码#,@证券代码#] */
       set v_create_date = date_format(curdate(),'%Y%m%d');
       set v_create_time = date_format(curtime(),'%H%i%s');
       set v_update_date = v_create_date;
       set v_update_time = v_create_time;
       set v_update_times = 1;
       insert into db_pdsecu.tb_pdsepo_out_asac_posi (
           create_date, create_time, update_date, 
           update_time, update_times, init_date, co_no, 
           pd_no, asset_acco_no, pass_no, out_acco, 
           exch_no, stock_acco_no, stock_acco, stock_code_no, 
           stock_code, stock_name, out_cost_price, out_curr_qty, 
           out_enable_qty, out_frozen_qty, out_unfroz_qty) 
       values(
           v_create_date, v_create_time, v_update_date, 
           v_update_time, v_update_times, v_init_date, v_co_no, 
           v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
           v_exch_no, v_stock_acco_no, v_stock_acco, v_stock_code_no, 
           v_stock_code, v_stock_name, v_out_cost_price, v_out_curr_qty, 
           v_out_enable_qty, v_out_frozen_qty, v_out_unfroz_qty) 
       ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, stock_acco_no=v_stock_acco_no, stock_code_no=v_stock_code_no, stock_name=v_stock_name, out_cost_price=v_out_cost_price, out_curr_qty=v_out_curr_qty, out_enable_qty=v_out_enable_qty, out_frozen_qty=v_out_frozen_qty, out_unfroz_qty=v_out_unfroz_qty;
       if v_error_code = "1" then
                   
           SET v_error_code = "pdsecuA.3.171.1";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code),"#",v_mysql_message);
           else
               SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code);
           end if;
           leave label_pro;
       end if;

    end if;

    /* if @外部当前数量# = 0 then */
    if v_out_curr_qty = 0 then

        /* set @处理标志# = 《处理标志-内部数据》; */
        set v_deal_flag = 3;
    else

        /* set @处理标志# = 《处理标志-未处理》; */
        set v_deal_flag = 2;
    end if;

    /* set @资产是否同步#=cast(substring(@资产账户业务控制配置串#, 12, 1) as SIGNED); */
    set v_asset_sync_flag=cast(substring(v_asac_busi_config_str, 12, 1) as SIGNED);

    /* set @质押数量累加到债券数量#=cast(substring(@资产账户业务控制配置串#, 19, 1) as SIGNED); */
    set v_add_pledge_to_bond=cast(substring(v_asac_busi_config_str, 19, 1) as SIGNED);

    /* set @备注信息# = "外部数据转入"; */
    set v_remark_info = "外部数据转入";

    /* set @账户当前数量差额#=@外部当前数量# - @账户当前数量#; */
    set v_acco_curr_qty_diff=v_out_curr_qty - v_acco_curr_qty;

    /* set @账户可用数量差额#=@外部可用数量# - @账户可用数量#-@账户当前数量差额#; */
    set v_acco_avail_qty_diff=v_out_enable_qty - v_acco_avail_qty-v_acco_curr_qty_diff;

    /* set @外部质押数量# = 0; */
    set v_out_impawn_qty = 0;

    /* if @账户可用数量差额#<>0 then */
    if v_acco_avail_qty_diff<>0 then

        /* set @处理标志# = 《处理标志-未处理》; */
        set v_deal_flag = 2;
    end if;

    /* if (@市场编号#=《市场编号-上海证券交易所》 and @证券代码#='888880') or (@市场编号#=《市场编号-深圳证券交易所》 and @证券代码#='131990') then */
    if (v_exch_no=1 and v_stock_code='888880') or (v_exch_no=2 and v_stock_code='131990') then

        /* set @处理标志# = 《处理标志-内部数据》; */
        set v_deal_flag = 3;

        /* set @外部成本价#=100; */
        set v_out_cost_price=100;
    end if;

     /* [插入重复更新][产品证券_持仓_内外资产账户持仓差异表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {交易组编号}=@交易组编号#, {股东代码编号}=@股东代码编号#, {证券代码编号}=@证券代码编号#, {证券名称}=@证券名称#, {外部成本价}=@外部成本价#, {账户当前数量}=@账户当前数量#, {账户可用数量}=@账户可用数量#, {外部当前数量}=@外部当前数量#, {外部可用数量}=@外部可用数量#, {账户当前数量差额}=@账户当前数量差额#+{外部质押数量}, {账户可用数量差额}=@账户可用数量差额#, {处理标志}=@处理标志#, {资产是否同步}=@资产是否同步#, {备注信息}=@备注信息#][1][@初始化日期#,@通道编号#,@外部账号#,@股东代码#,@市场编号#,@证券代码#] */
     set v_create_date = date_format(curdate(),'%Y%m%d');
     set v_create_time = date_format(curtime(),'%H%i%s');
     set v_update_date = v_create_date;
     set v_update_time = v_create_time;
     set v_update_times = 1;
     insert into db_pdsecu.tb_pdsepo_asac_posi_diff (
         create_date, create_time, update_date, 
         update_time, update_times, init_date, co_no, 
         pd_no, asset_acco_no, exch_group_no, pass_no, 
         out_acco, exch_no, stock_acco_no, stock_acco, 
         stock_code_no, stock_code, stock_name, stock_type, 
         asset_type, out_cost_price, acco_curr_qty, acco_avail_qty, 
         out_curr_qty, out_enable_qty, acco_curr_qty_diff, acco_avail_qty_diff, 
         out_impawn_qty, deal_flag, asset_sync_flag, remark_info) 
     values(
         v_create_date, v_create_time, v_update_date, 
         v_update_time, v_update_times, v_init_date, v_co_no, 
         v_pd_no, v_asset_acco_no, v_exch_group_no, v_pass_no, 
         v_out_acco, v_exch_no, v_stock_acco_no, v_stock_acco, 
         v_stock_code_no, v_stock_code, v_stock_name, v_stock_type, 
         v_asset_type, v_out_cost_price, v_acco_curr_qty, v_acco_avail_qty, 
         v_out_curr_qty, v_out_enable_qty, v_acco_curr_qty_diff, v_acco_avail_qty_diff, 
         v_out_impawn_qty, v_deal_flag, v_asset_sync_flag, v_remark_info) 
     ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, exch_group_no=v_exch_group_no, stock_acco_no=v_stock_acco_no, stock_code_no=v_stock_code_no, stock_name=v_stock_name, out_cost_price=v_out_cost_price, acco_curr_qty=v_acco_curr_qty, acco_avail_qty=v_acco_avail_qty, out_curr_qty=v_out_curr_qty, out_enable_qty=v_out_enable_qty, acco_curr_qty_diff=v_acco_curr_qty_diff+out_impawn_qty, acco_avail_qty_diff=v_acco_avail_qty_diff, deal_flag=v_deal_flag, asset_sync_flag=v_asset_sync_flag, remark_info=v_remark_info;
     if v_error_code = "1" then
                 
         SET v_error_code = "pdsecuA.3.171.1";
         if v_mysql_message <> "" then
             SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","股东代码=",v_stock_acco,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
         else
             SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","股东代码=",v_stock_acco,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code);
         end if;
         leave label_pro;
     end if;

    #质押数量不累加到债券数量上的话 , 那么账户当前数量差额不应该包括外部质押数量

    /* if @质押数量累加到债券数量#<>1 then */
    if v_add_pledge_to_bond<>1 then

        /* [更新表记录][产品证券_持仓_内外资产账户持仓差异表][ {账户当前数量差额}={账户当前数量差额}-{外部质押数量}][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号}=@外部账号# and {股东代码}=@股东代码# and {市场编号}=@市场编号# and {证券代码}=@证券代码#][2][@初始化日期#,@通道编号#,@外部账号#,@股东代码#,@市场编号#,@证券代码#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdsepo_asac_posi_diff set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1,  acco_curr_qty_diff=acco_curr_qty_diff-out_impawn_qty where init_date=v_init_date and pass_no=v_pass_no and out_acco=v_out_acco and stock_acco=v_stock_acco and exch_no=v_exch_no and stock_code=v_stock_code;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.3.171.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","股东代码=",v_stock_acco,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","股东代码=",v_stock_acco,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code);
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

# 原子_产品证券_持仓_清除外部转入记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_ClearOutRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_ClearOutRecord(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #清除外部证券持仓表记录、内外证券持仓差异表记录

    /* [删除表记录][产品证券_持仓_外部资产账户持仓表][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号} = @外部账号#][3][@初始化日期#,@通道编号#,@外部账号#] */
    delete from db_pdsecu.tb_pdsepo_out_asac_posi 
        where init_date=v_init_date and pass_no=v_pass_no and out_acco = v_out_acco;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.172.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_内外资产账户持仓差异表][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号} = @外部账号#][3][@初始化日期#,@通道编号#,@外部账号#] */
    delete from db_pdsecu.tb_pdsepo_asac_posi_diff 
        where init_date=v_init_date and pass_no=v_pass_no and out_acco = v_out_acco;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.172.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_外部资产账户债券质押表][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号} = @外部账号#][3][@初始化日期#,@通道编号#,@外部账号#] */
    delete from db_pdsecu.tb_pdsepo_out_asac_bond_pledge 
        where init_date=v_init_date and pass_no=v_pass_no and out_acco = v_out_acco;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.172.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_内外资产账户债券质押差异表][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号} = @外部账号#][3][@初始化日期#,@通道编号#,@外部账号#] */
    delete from db_pdsecu.tb_pdsepo_asac_bond_pledge_diff 
        where init_date=v_init_date and pass_no=v_pass_no and out_acco = v_out_acco;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.172.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_外部新股申购上限表][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号} = @外部账号#][3][@初始化日期#,@通道编号#,@外部账号#] */
    delete from db_pdsecu.tb_pdsepo_out_new_stock_limit 
        where init_date=v_init_date and pass_no=v_pass_no and out_acco = v_out_acco;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.172.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_科创板外部新股申购上限表][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号} = @外部账号#][3][@初始化日期#,@通道编号#,@外部账号#] */
    delete from db_pdsecu.tb_pdsepo_kcb_out_new_stock_limit 
        where init_date=v_init_date and pass_no=v_pass_no and out_acco = v_out_acco;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.172.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_转入外部质押明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_AddOutBondPledge;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_AddOutBondPledge(
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
    IN p_exch_group_no int,
    IN p_asac_busi_config_str varchar(64),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_out_begin_qty decimal(18,2),
    IN p_out_curr_qty decimal(18,2),
    IN p_out_enable_qty decimal(18,2),
    IN p_impawn_ratio decimal(18,12),
    IN p_curr_qty decimal(18,2),
    IN p_avail_qty decimal(18,2),
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
    declare v_exch_group_no int;
    declare v_asac_busi_config_str varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_out_begin_qty decimal(18,2);
    declare v_out_curr_qty decimal(18,2);
    declare v_out_enable_qty decimal(18,2);
    declare v_impawn_ratio decimal(18,12);
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_acco_curr_qty decimal(18,2);
    declare v_acco_avail_qty decimal(18,2);
    declare v_out_impawn_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_deal_flag int;
    declare v_asset_sync_flag int;
    declare v_add_pledge_to_bond int;
    declare v_remark_info varchar(255);
    declare v_acco_avail_qty_diff decimal(18,2);
    declare v_out_cost_price decimal(16,9);
    declare v_acco_curr_qty_diff decimal(18,2);

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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_out_begin_qty = p_out_begin_qty;
    SET v_out_curr_qty = p_out_curr_qty;
    SET v_out_enable_qty = p_out_enable_qty;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_curr_qty = p_curr_qty;
    SET v_avail_qty = p_avail_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_acco_curr_qty = 0;
    SET v_acco_avail_qty = 0;
    SET v_out_impawn_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_deal_flag = 0;
    SET v_asset_sync_flag = 0;
    SET v_add_pledge_to_bond = 0;
    SET v_remark_info = " ";
    SET v_acco_avail_qty_diff = 0;
    SET v_out_cost_price = 0;
    SET v_acco_curr_qty_diff = 0;

    
    label_pro:BEGIN
    

    /* set @账户当前数量#=@当前数量#; */
    set v_acco_curr_qty=v_curr_qty;

    /* set @账户可用数量#=@可用数量#; */
    set v_acco_avail_qty=v_avail_qty;

    /* set @外部质押数量#=@外部可用数量#; */
    set v_out_impawn_qty=v_out_enable_qty;

    /* [插入重复更新][产品证券_持仓_外部资产账户债券质押表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {股东代码编号}=@股东代码编号#, {证券代码编号}=@证券代码编号#, {证券名称}=@证券名称#, {外部期初数量}=@外部期初数量#, {外部当前数量}=@外部当前数量#, {外部可用数量}=@外部可用数量#, {质押比例}=@质押比例#][1][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@股东代码#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_out_asac_bond_pledge (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, out_acco, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_name, out_begin_qty, out_curr_qty, 
        out_enable_qty, impawn_ratio) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_no, v_stock_acco_no, v_stock_acco, v_stock_code_no, 
        v_stock_code, v_stock_name, v_out_begin_qty, v_out_curr_qty, 
        v_out_enable_qty, v_impawn_ratio) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, stock_acco_no=v_stock_acco_no, stock_code_no=v_stock_code_no, stock_name=v_stock_name, out_begin_qty=v_out_begin_qty, out_curr_qty=v_out_curr_qty, out_enable_qty=v_out_enable_qty, impawn_ratio=v_impawn_ratio;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.181.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* if @外部可用数量# = 0 then */
    if v_out_enable_qty = 0 then

        /* set @处理标志# = 《处理标志-内部数据》; */
        set v_deal_flag = 3;
    else

        /* set @处理标志# = 《处理标志-未处理》; */
        set v_deal_flag = 2;
    end if;

    /* set @资产是否同步#=cast(substring(@资产账户业务控制配置串#, 12, 1) as SIGNED); */
    set v_asset_sync_flag=cast(substring(v_asac_busi_config_str, 12, 1) as SIGNED);

    /* set @质押数量累加到债券数量#=cast(substring(@资产账户业务控制配置串#, 19, 1) as SIGNED); */
    set v_add_pledge_to_bond=cast(substring(v_asac_busi_config_str, 19, 1) as SIGNED);

    /* set @备注信息# = "外部数据转入"; */
    set v_remark_info = "外部数据转入";

    /* set @账户可用数量差额#=@外部可用数量#-@账户可用数量#; */
    set v_acco_avail_qty_diff=v_out_enable_qty-v_acco_avail_qty;

    /* [插入重复更新][产品证券_持仓_内外资产账户债券质押差异表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {交易组编号}=@交易组编号#, {股东代码编号}=@股东代码编号#, {证券代码编号}=@证券代码编号#, {证券名称}=@证券名称#, {账户当前数量}=@账户当前数量#, {账户可用数量}=@账户可用数量#, {外部期初数量}=@外部期初数量#, {外部当前数量}=@外部当前数量#, {外部可用数量}=@外部可用数量#, {账户可用数量差额}=@账户可用数量差额#, {处理标志}=@处理标志#, {资产是否同步}=@资产是否同步#, {备注信息}=@备注信息#][1][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@股东代码#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_bond_pledge_diff (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, stock_name, stock_type, 
        asset_type, acco_curr_qty, acco_avail_qty, out_begin_qty, 
        out_curr_qty, out_enable_qty, acco_avail_qty_diff, deal_flag, 
        asset_sync_flag, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_pass_no, 
        v_out_acco, v_exch_no, v_stock_acco_no, v_stock_acco, 
        v_stock_code_no, v_stock_code, v_stock_name, v_stock_type, 
        v_asset_type, v_acco_curr_qty, v_acco_avail_qty, v_out_begin_qty, 
        v_out_curr_qty, v_out_enable_qty, v_acco_avail_qty_diff, v_deal_flag, 
        v_asset_sync_flag, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, exch_group_no=v_exch_group_no, stock_acco_no=v_stock_acco_no, stock_code_no=v_stock_code_no, stock_name=v_stock_name, acco_curr_qty=v_acco_curr_qty, acco_avail_qty=v_acco_avail_qty, out_begin_qty=v_out_begin_qty, out_curr_qty=v_out_curr_qty, out_enable_qty=v_out_enable_qty, acco_avail_qty_diff=v_acco_avail_qty_diff, deal_flag=v_deal_flag, asset_sync_flag=v_asset_sync_flag, remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.181.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* set @外部成本价# = 0; */
    set v_out_cost_price = 0;

    /* set @账户当前数量# = 0; */
    set v_acco_curr_qty = 0;

    /* set @账户可用数量# = 0; */
    set v_acco_avail_qty = 0;

    /* set @外部当前数量# = 0; */
    set v_out_curr_qty = 0;

    /* set @外部可用数量# = 0; */
    set v_out_enable_qty = 0;

    /* set @账户当前数量差额# = @外部可用数量#; */
    set v_acco_curr_qty_diff = v_out_enable_qty;

    /* set @账户可用数量差额# = 0; */
    set v_acco_avail_qty_diff = 0;

    /* set @处理标志# = 《处理标志-未处理》; */
    set v_deal_flag = 2;

    /* set @备注信息# = "外部数据转入"; */
    set v_remark_info = "外部数据转入";

    /* [插入重复更新][产品证券_持仓_内外资产账户持仓差异表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {交易组编号}=@交易组编号#, {股东代码编号}=@股东代码编号#, {证券代码编号}=@证券代码编号#, {证券名称}=@证券名称#, {处理标志}=@处理标志#, {资产是否同步}=@资产是否同步#, {备注信息}=@备注信息#, {外部质押数量}=@外部质押数量#, {账户当前数量差额}={外部当前数量}-{账户当前数量}+@外部质押数量#][1][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@股东代码#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_posi_diff (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, stock_name, stock_type, 
        asset_type, out_cost_price, acco_curr_qty, acco_avail_qty, 
        out_curr_qty, out_enable_qty, acco_curr_qty_diff, acco_avail_qty_diff, 
        out_impawn_qty, deal_flag, asset_sync_flag, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_pass_no, 
        v_out_acco, v_exch_no, v_stock_acco_no, v_stock_acco, 
        v_stock_code_no, v_stock_code, v_stock_name, v_stock_type, 
        v_asset_type, v_out_cost_price, v_acco_curr_qty, v_acco_avail_qty, 
        v_out_curr_qty, v_out_enable_qty, v_acco_curr_qty_diff, v_acco_avail_qty_diff, 
        v_out_impawn_qty, v_deal_flag, v_asset_sync_flag, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, exch_group_no=v_exch_group_no, stock_acco_no=v_stock_acco_no, stock_code_no=v_stock_code_no, stock_name=v_stock_name, deal_flag=v_deal_flag, asset_sync_flag=v_asset_sync_flag, remark_info=v_remark_info, out_impawn_qty=v_out_impawn_qty, acco_curr_qty_diff=out_curr_qty-acco_curr_qty+v_out_impawn_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.181.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* if @质押数量累加到债券数量#<>1 then */
    if v_add_pledge_to_bond<>1 then

        /* [更新表记录][产品证券_持仓_内外资产账户持仓差异表][{账户当前数量差额}={账户当前数量差额}-{外部质押数量}][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {股东代码}=@股东代码# and {证券代码}=@证券代码#][2][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@股东代码#,@证券代码#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdsepo_asac_posi_diff set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, acco_curr_qty_diff=acco_curr_qty_diff-out_impawn_qty where init_date=v_init_date and pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and stock_acco=v_stock_acco and stock_code=v_stock_code;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.3.181.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code);
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

# 原子_产品证券_持仓_转入外部新股申购额度
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_AddOutNewStockLimit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_AddOutNewStockLimit(
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
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_apply_limit decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_acco_no int,
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
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_apply_limit decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_no int;
    declare v_update_times int;
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_apply_limit = p_apply_limit;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_no = 0;
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_账户_证券账户信息表][{股东代码编号}][@股东代码编号#][{资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {股东代码}=@股东代码#][4][@资产账户编号#,@市场编号#,@股东代码#] */
    select stock_acco_no into v_stock_acco_no from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no=v_asset_acco_no and exch_no=v_exch_no and stock_acco=v_stock_acco limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.191.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco);
        end if;
        leave label_pro;
    end if;


    /* [插入重复更新][产品证券_持仓_外部新股申购上限表][字段][字段变量][{申购上限}=@申购上限#][1][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@股东代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_out_new_stock_limit (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, out_acco, 
        exch_no, stock_acco_no, stock_acco, apply_limit) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_no, v_stock_acco_no, v_stock_acco, v_apply_limit) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, apply_limit=v_apply_limit;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.191.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco);
        end if;
        leave label_pro;
    end if;


    /* [插入重复更新][产品证券_持仓_新股申购上限表][字段][字段变量][{申购上限}=@申购上限#][1][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@股东代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_new_stock_limit (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, out_acco, 
        exch_no, stock_acco_no, stock_acco, apply_limit) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_no, v_stock_acco_no, v_stock_acco, v_apply_limit) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, apply_limit=v_apply_limit;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.191.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询新股申购额度
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryOutNewStockLimit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryOutNewStockLimit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_pd_no_str varchar(2048),
    IN p_stock_acco_no_str varchar(4096),
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
    declare v_init_date int;
    declare v_exch_no int;
    declare v_pd_no_str varchar(2048);
    declare v_stock_acco_no_str varchar(4096);
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
    SET v_init_date = p_init_date;
    SET v_exch_no = p_exch_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_stock_acco_no_str = p_stock_acco_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_新股申购上限表][字段][{初始化日期}=@初始化日期# and {机构编号}=@操作员机构编号# and (@市场编号#=0 or {市场编号}=@市场编号#) and (@产品编号串#="; ;" or instr(@产品编号串#,concat(";",{产品编号},";"))>0) and (@股东代码编号串#="; ;" or instr(@股东代码编号串#,concat(";",{股东代码编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        apply_limit from db_pdsecu.tb_pdsepo_new_stock_limit where init_date=v_init_date and co_no=v_opor_co_no and (v_exch_no=0 or exch_no=v_exch_no) and (v_pd_no_str="; ;" or instr(v_pd_no_str,concat(";",pd_no,";"))>0) and (v_stock_acco_no_str="; ;" or instr(v_stock_acco_no_str,concat(";",stock_acco_no,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        apply_limit from db_pdsecu.tb_pdsepo_new_stock_limit where init_date=v_init_date and co_no=v_opor_co_no and (v_exch_no=0 or exch_no=v_exch_no) and (v_pd_no_str="; ;" or instr(v_pd_no_str,concat(";",pd_no,";"))>0) and (v_stock_acco_no_str="; ;" or instr(v_stock_acco_no_str,concat(";",stock_acco_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_归档产品证券持仓数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_BackUpPdSecuPosiData;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_BackUpPdSecuPosiData(
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [不分日期数据归历史][产品证券_持仓_交易资产账户持仓表][字段][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_trd_asac_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        posi_qty, cost_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        posi_qty, cost_amt 
        from db_pdsecu.tb_pdsepo_trd_asac_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_交易资产账户持仓表][1=1][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_trd_asac_posi 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品证券_持仓_交易库交易组持仓表][字段][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_trd_exgp_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, posi_qty, cost_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, posi_qty, cost_amt 
        from db_pdsecu.tb_pdsepo_trd_exgp_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_交易库交易组持仓表][1=1][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_trd_exgp_posi 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品证券_持仓_交易库资产账户债券质押表][字段][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_trd_asac_bond_pledge_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        posi_qty) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        posi_qty 
        from db_pdsecu.tb_pdsepo_trd_asac_bond_pledge;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_交易库资产账户债券质押表][1=1][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_trd_asac_bond_pledge 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品证券_持仓_交易库交易组债券质押表][字段][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_trd_exgp_bond_pledge_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, posi_qty) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, posi_qty 
        from db_pdsecu.tb_pdsepo_trd_exgp_bond_pledge;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_交易库交易组债券质押表][1=1][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_trd_exgp_bond_pledge 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_交易组持仓表][{当前数量}={当前数量}+{持仓核对差额},{持仓核对差额}=0][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty+posi_qty_check_diff,posi_qty_check_diff=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_历史交易组持仓表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdsepo_exgp_posi_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品证券_持仓_交易组持仓表][字段][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_exgp_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, invest_type, 
        begin_qty, curr_qty, pre_settle_qty, frozen_qty, 
        unfroz_qty, posi_qty_check_diff, cost_amt, realize_pandl, 
        intrst_cost_amt, intrst_pandl) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, invest_type, 
        begin_qty, curr_qty, pre_settle_qty, frozen_qty, 
        unfroz_qty, posi_qty_check_diff, cost_amt, realize_pandl, 
        intrst_cost_amt, intrst_pandl 
        from db_pdsecu.tb_pdsepo_exgp_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;

    #清除 无效的持仓数据。

    /* delete  from ~产品证券_持仓_交易组持仓表^  where {期初数量}=0 and {当前数量}=0 and {待交收数量}=0 and {冻结数量}=0 and {解冻数量}=0 and {持仓核对差额}=0 and {成本金额}=0 and {实现盈亏}=0 and {利息成本金额}=0 and {利息收益}=0; */
    delete  from db_pdsecu.tb_pdsepo_exgp_posi  where begin_qty=0 and curr_qty=0 and pre_settle_qty=0 and frozen_qty=0 and unfroz_qty=0 and posi_qty_check_diff=0 and cost_amt=0 and realize_pandl=0 and intrst_cost_amt=0 and intrst_pandl=0;

    /* [数据归历史][产品证券_持仓_交易组持仓流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_exgp_posi_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, busi_flag, 
        occur_qty, occur_end_qty, jour_occur_field, jour_after_occur_info, 
        oper_remark_info, invest_type) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, busi_flag, 
        occur_qty, occur_end_qty, jour_occur_field, jour_after_occur_info, 
        oper_remark_info, invest_type 
        from db_pdsecu.tb_pdsepo_exgp_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_交易组持仓流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_exgp_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_持仓_交易组持仓冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_exgp_posi_frozen_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, frozen_type, 
        occur_qty, expire_date, jour_status, asac_frozen_no, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, frozen_type, 
        occur_qty, expire_date, jour_status, asac_frozen_no, 
        oper_remark_info 
        from db_pdsecu.tb_pdsepo_exgp_posi_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_交易组持仓冻结解冻流水表][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_exgp_posi_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_历史交易组债券质押表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdsepo_exgp_bond_pledge_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品证券_持仓_交易组债券质押表][字段][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_exgp_bond_pledge_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, begin_qty, curr_qty, put_impawn_qty, 
        get_impawn_qty) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, begin_qty, curr_qty, put_impawn_qty, 
        get_impawn_qty 
        from db_pdsecu.tb_pdsepo_exgp_bond_pledge;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_交易组债券质押表][{期初数量}={当前数量}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_bond_pledge set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=curr_qty where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_资产账户持仓表][{当前数量}={当前数量}+{持仓核对差额},{持仓核对差额}=0][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty+posi_qty_check_diff,posi_qty_check_diff=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_历史资产账户持仓表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdsepo_asac_posi_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品证券_持仓_资产账户持仓表][字段][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_asac_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        stock_type, asset_type, invest_type, begin_qty, 
        curr_qty, pre_settle_qty, frozen_qty, unfroz_qty, 
        posi_qty_check_diff, cost_amt, realize_pandl, intrst_cost_amt, 
        intrst_pandl) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        stock_type, asset_type, invest_type, begin_qty, 
        curr_qty, pre_settle_qty, frozen_qty, unfroz_qty, 
        posi_qty_check_diff, cost_amt, realize_pandl, intrst_cost_amt, 
        intrst_pandl 
        from db_pdsecu.tb_pdsepo_asac_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;

    #清除 无效的持仓数据。

    /* delete  from ~产品证券_持仓_资产账户持仓表^  where {期初数量}=0 and {当前数量}=0 and {待交收数量}=0 and {冻结数量}=0 and {解冻数量}=0 and {持仓核对差额}=0 and {成本金额}=0 and {实现盈亏}=0 and {利息成本金额}=0 and {利息收益}=0; */
    delete  from db_pdsecu.tb_pdsepo_asac_posi  where begin_qty=0 and curr_qty=0 and pre_settle_qty=0 and frozen_qty=0 and unfroz_qty=0 and posi_qty_check_diff=0 and cost_amt=0 and realize_pandl=0 and intrst_cost_amt=0 and intrst_pandl=0;

    /* [数据归历史][产品证券_持仓_资产账户持仓流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_asac_posi_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
        invest_type) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
        invest_type 
        from db_pdsecu.tb_pdsepo_asac_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_资产账户持仓流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_asac_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_持仓_资产账户持仓冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_asac_posi_frozen_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, is_change_exch_group_posi, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, is_change_exch_group_posi, oper_remark_info 
        from db_pdsecu.tb_pdsepo_asac_posi_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_资产账户持仓冻结解冻流水表][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_asac_posi_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_历史资产账户债券质押表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdsepo_asac_bond_pledge_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品证券_持仓_资产账户债券质押表][字段][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_asac_bond_pledge_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        begin_qty, curr_qty, put_impawn_qty, get_impawn_qty) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        begin_qty, curr_qty, put_impawn_qty, get_impawn_qty 
        from db_pdsecu.tb_pdsepo_asac_bond_pledge;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_资产账户债券质押表][{期初数量}={当前数量}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_bond_pledge set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=curr_qty where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_持仓_资产账户债券质押流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_asac_bond_pledge_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, occur_qty, jour_occur_field, jour_occur_info, 
        jour_after_occur_info, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, occur_qty, jour_occur_field, jour_occur_info, 
        jour_after_occur_info, remark_info 
        from db_pdsecu.tb_pdsepo_asac_bond_pledge_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_资产账户债券质押流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_asac_bond_pledge_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据条件归历史][产品证券_持仓_债券回购表][字段][({回购处理状态}=《回购处理状态-已回滚》 or {回购处理状态}=《回购处理状态-已处理》)][301][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_bond_repo_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, target_code_no, target_code, 
        order_dir, repo_qty, repo_amt, repo_rate, 
        repo_trade_date, repo_order_id, repo_strike_id, repo_days, 
        repo_cale_days, repo_back_date, repo_back_amt, repo_back_intrst, 
        repo_back_trade_date, repo_status) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, target_code_no, target_code, 
        order_dir, repo_qty, repo_amt, repo_rate, 
        repo_trade_date, repo_order_id, repo_strike_id, repo_days, 
        repo_cale_days, repo_back_date, repo_back_amt, repo_back_intrst, 
        repo_back_trade_date, repo_status 
        from db_pdsecu.tb_pdsepo_bond_repo
        where (repo_status="4" or repo_status="1");
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.301";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_债券回购表][({回购处理状态}=《回购处理状态-已回滚》 or {回购处理状态}=《回购处理状态-已处理》)][302][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_bond_repo 
        where (repo_status="4" or repo_status="1");
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][历史_产品证券_持仓_外部资产账户持仓表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdsepo_out_asac_posi_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_持仓_外部资产账户持仓表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_out_asac_posi_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, stock_name, out_cost_price, 
        out_curr_qty, out_enable_qty, out_frozen_qty, out_unfroz_qty) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, stock_name, out_cost_price, 
        out_curr_qty, out_enable_qty, out_frozen_qty, out_unfroz_qty 
        from db_pdsecu.tb_pdsepo_out_asac_posi 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_外部资产账户持仓表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_out_asac_posi 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_持仓_估值外部资产账户持仓表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_evalu_out_asac_posi_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, stock_name, out_cost_price, 
        out_curr_qty, out_enable_qty, out_frozen_qty, out_unfroz_qty) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, stock_name, out_cost_price, 
        out_curr_qty, out_enable_qty, out_frozen_qty, out_unfroz_qty 
        from db_pdsecu.tb_pdsepo_evalu_out_asac_posi 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_估值外部资产账户持仓表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_evalu_out_asac_posi 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][历史_产品证券_持仓_内外资产账户持仓差异表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdsepo_asac_posi_diff_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_持仓_内外资产账户持仓差异表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_asac_posi_diff_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_name, 
        stock_type, asset_type, out_cost_price, acco_curr_qty, 
        acco_avail_qty, out_curr_qty, out_enable_qty, acco_curr_qty_diff, 
        acco_avail_qty_diff, out_impawn_qty, deal_flag, asset_sync_flag, 
        remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_name, 
        stock_type, asset_type, out_cost_price, acco_curr_qty, 
        acco_avail_qty, out_curr_qty, out_enable_qty, acco_curr_qty_diff, 
        acco_avail_qty_diff, out_impawn_qty, deal_flag, asset_sync_flag, 
        remark_info 
        from db_pdsecu.tb_pdsepo_asac_posi_diff 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_内外资产账户持仓差异表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_asac_posi_diff 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_持仓_外部资产账户债券质押表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_out_asac_bond_pledge_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, stock_name, out_begin_qty, 
        out_curr_qty, out_enable_qty, impawn_ratio) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, stock_name, out_begin_qty, 
        out_curr_qty, out_enable_qty, impawn_ratio 
        from db_pdsecu.tb_pdsepo_out_asac_bond_pledge 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_外部资产账户债券质押表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_out_asac_bond_pledge 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_持仓_内外资产账户债券质押差异表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_asac_bond_pledge_diff_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_name, 
        stock_type, asset_type, acco_curr_qty, acco_avail_qty, 
        out_begin_qty, out_curr_qty, out_enable_qty, acco_avail_qty_diff, 
        deal_flag, asset_sync_flag, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_name, 
        stock_type, asset_type, acco_curr_qty, acco_avail_qty, 
        out_begin_qty, out_curr_qty, out_enable_qty, acco_avail_qty_diff, 
        deal_flag, asset_sync_flag, remark_info 
        from db_pdsecu.tb_pdsepo_asac_bond_pledge_diff 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_内外资产账户债券质押差异表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_asac_bond_pledge_diff 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][历史_产品证券_持仓_外部新股申购上限表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdsepo_out_new_stock_limit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_持仓_外部新股申购上限表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_out_new_stock_limit_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        apply_limit) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        apply_limit 
        from db_pdsecu.tb_pdsepo_out_new_stock_limit 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_外部新股申购上限表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_out_new_stock_limit 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][历史_产品证券_持仓_新股申购上限表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdsepo_new_stock_limit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_持仓_新股申购上限表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_new_stock_limit_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        apply_limit) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        apply_limit 
        from db_pdsecu.tb_pdsepo_new_stock_limit 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_新股申购上限表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_new_stock_limit 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][历史_产品证券_持仓_科创板外部新股申购上限表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdsepo_kcb_out_new_stock_limit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_持仓_科创板外部新股申购上限表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_kcb_out_new_stock_limit_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        apply_limit) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        apply_limit 
        from db_pdsecu.tb_pdsepo_kcb_out_new_stock_limit 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_科创板外部新股申购上限表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_kcb_out_new_stock_limit 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][历史_产品证券_持仓_科创板新股申购上限表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdsepo_kcb_new_stock_limit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_持仓_科创板新股申购上限表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_kcb_new_stock_limit_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        apply_limit) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        apply_limit 
        from db_pdsecu.tb_pdsepo_kcb_new_stock_limit 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_科创板新股申购上限表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_kcb_new_stock_limit 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_持仓_交易组持仓入账流水表][字段][{初始化日期}<=@初始化日期# and {入账状态}<>《入账状态-未入账》][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_exgp_posi_entry_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, target_code_no, 
        stock_type, asset_type, busi_flag, occur_qty, 
        cost_amt, intrst_cost_amt, realize_pandl, intrst_pandl, 
        impawn_qty, impawn_ratio, begin_trade_date, old_arrive_date, 
        arrive_date, order_no, entry_status) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, target_code_no, 
        stock_type, asset_type, busi_flag, occur_qty, 
        cost_amt, intrst_cost_amt, realize_pandl, intrst_pandl, 
        impawn_qty, impawn_ratio, begin_trade_date, old_arrive_date, 
        arrive_date, order_no, entry_status 
        from db_pdsecu.tb_pdsepo_exgp_posi_entry_jour 
        where init_date<=v_init_date and entry_status<>"2";
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_交易组持仓入账流水表][{初始化日期}<=@初始化日期# and {入账状态}<>《入账状态-未入账》][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_exgp_posi_entry_jour 
        where init_date<=v_init_date and entry_status<>"2";
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_持仓_资产账户持仓入账流水表][字段][{初始化日期}<=@初始化日期# and {入账状态}<>《入账状态-未入账》][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_asac_posi_entry_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, target_code_no, stock_type, 
        asset_type, busi_flag, occur_qty, cost_amt, 
        intrst_cost_amt, realize_pandl, intrst_pandl, impawn_ratio, 
        begin_trade_date, old_arrive_date, arrive_date, order_no, 
        entry_status) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, target_code_no, stock_type, 
        asset_type, busi_flag, occur_qty, cost_amt, 
        intrst_cost_amt, realize_pandl, intrst_pandl, impawn_ratio, 
        begin_trade_date, old_arrive_date, arrive_date, order_no, 
        entry_status 
        from db_pdsecu.tb_pdsepo_asac_posi_entry_jour 
        where init_date<=v_init_date and entry_status<>"2";
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_资产账户持仓入账流水表][{初始化日期}<=@初始化日期# and {入账状态}<>《入账状态-未入账》][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_asac_posi_entry_jour 
        where init_date<=v_init_date and entry_status<>"2";
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_历史大宗交易持仓表][{初始化日期}=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdsepo_block_trade_posi_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据条件归历史][产品证券_持仓_大宗交易持仓表][字段][1=1][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_block_trade_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, posi_id, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        stock_acco_no, stock_code_no, strike_qty, strike_price, 
        fair_price, strike_date, release_date, deal_status) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, posi_id, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        stock_acco_no, stock_code_no, strike_qty, strike_price, 
        fair_price, strike_date, release_date, deal_status 
        from db_pdsecu.tb_pdsepo_block_trade_posi
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;

    #将到期已处理 和 注销资产账户回退的持仓删除。

    /* [删除表记录][产品证券_持仓_大宗交易持仓表][{解禁日期}<=@初始化日期# and {处理状态}="1" and {持仓序号}>0][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_block_trade_posi 
        where release_date<=v_init_date and deal_status="1" and posi_id>0;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_持仓_大宗交易持仓流水表][字段][1=1][1][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdsepo_block_trade_posi_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, occur_qty, 
        occur_end_qty, occur_price, occur_end_price, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, occur_qty, 
        occur_end_qty, occur_price, occur_end_price, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pdsecu.tb_pdsepo_block_trade_posi_jour 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_大宗交易持仓流水表][1=1][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdsepo_block_trade_posi_jour 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取日终到期交易组冻结解冻记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetCloseExgpFrozenUnfrozen;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetCloseExgpFrozenUnfrozen(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_asset_acco_no int,
    OUT p_exch_group_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_frozen_type int,
    OUT p_occur_qty decimal(18,2)
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_frozen_type int;
    declare v_occur_qty decimal(18,2);

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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_frozen_type = 0;
    SET v_occur_qty = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_持仓_交易组持仓冻结解冻流水表][{记录序号},{资产账户编号},{交易组编号},{股东代码编号},{证券代码编号},{冻结解冻类型},{变动数量}][@记录序号#,@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#,@冻结解冻类型#,@变动数量#][{记录序号}>@查询记录序号# and {流水状态}=《流水状态-有效》 and {到期日期}<=@初始化日期# order by {记录序号}][4][@查询记录序号#,@初始化日期#] */
    select row_id,asset_acco_no,exch_group_no,stock_acco_no,stock_code_no,frozen_type,occur_qty into v_row_id,v_asset_acco_no,v_exch_group_no,v_stock_acco_no,v_stock_code_no,v_frozen_type,v_occur_qty from db_pdsecu.tb_pdsepo_exgp_posi_frozen_jour where row_id>v_query_row_id and jour_status="1" and expire_date<=v_init_date order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.355.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询记录序号=",v_query_row_id,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_frozen_type = v_frozen_type;
    SET p_occur_qty = v_occur_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取日终到期资产账户冻结解冻记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetCloseAsacFrozenUnfrozen;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetCloseAsacFrozenUnfrozen(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_asset_acco_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_frozen_type int,
    OUT p_occur_qty decimal(18,2)
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_frozen_type int;
    declare v_occur_qty decimal(18,2);

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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_frozen_type = 0;
    SET v_occur_qty = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_持仓_资产账户持仓冻结解冻流水表][{记录序号},{资产账户编号},{股东代码编号},{证券代码编号},{冻结解冻类型},{变动数量}][@记录序号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@冻结解冻类型#,@变动数量#][{记录序号}>@查询记录序号# and {流水状态}=《流水状态-有效》 and {到期日期}<=@初始化日期# order by {记录序号}][4][@查询记录序号#,@初始化日期#] */
    select row_id,asset_acco_no,stock_acco_no,stock_code_no,frozen_type,occur_qty into v_row_id,v_asset_acco_no,v_stock_acco_no,v_stock_code_no,v_frozen_type,v_occur_qty from db_pdsecu.tb_pdsepo_asac_posi_frozen_jour where row_id>v_query_row_id and jour_status="1" and expire_date<=v_init_date order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.356.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询记录序号=",v_query_row_id,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_frozen_type = v_frozen_type;
    SET p_occur_qty = v_occur_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取回购到期记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetRepoExpireRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetRepoExpireRecord(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_target_code_no int,
    OUT p_target_code varchar(6),
    OUT p_busi_flag int,
    OUT p_repo_qty decimal(18,2),
    OUT p_repo_back_amt decimal(18,4),
    OUT p_repo_back_intrst decimal(18,4)
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_busi_flag int;
    declare v_repo_qty decimal(18,2);
    declare v_repo_back_amt decimal(18,4);
    declare v_repo_back_intrst decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_repo_amt decimal(18,4);
    declare v_repo_rate decimal(18,12);
    declare v_repo_trade_date int;
    declare v_repo_order_id bigint;
    declare v_repo_strike_id bigint;
    declare v_repo_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_repo_back_trade_date int;
    declare v_repo_status varchar(2);

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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_target_code_no = 0;
    SET v_target_code = " ";
    SET v_busi_flag = 0;
    SET v_repo_qty = 0;
    SET v_repo_back_amt = 0;
    SET v_repo_back_intrst = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_order_dir = 0;
    SET v_repo_amt = 0;
    SET v_repo_rate = 0;
    SET v_repo_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_repo_order_id = 0;
    SET v_repo_strike_id = 0;
    SET v_repo_days = 0;
    SET v_repo_cale_days = 0;
    SET v_repo_back_date = 0;
    SET v_repo_back_trade_date = 0;
    SET v_repo_status = "0";

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品证券_持仓_债券回购表][字段][字段变量][{记录序号}>@查询记录序号# and {实际回购到期日期}=@初始化日期# and {回购处理状态}=《回购处理状态-未处理》][1][@初始化日期#,@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_code, target_code_no, 
        target_code, order_dir, repo_qty, repo_amt, 
        repo_rate, repo_trade_date, repo_order_id, repo_strike_id, 
        repo_days, repo_cale_days, repo_back_date, repo_back_amt, 
        repo_back_intrst, repo_back_trade_date, repo_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_code, v_target_code_no, 
        v_target_code, v_order_dir, v_repo_qty, v_repo_amt, 
        v_repo_rate, v_repo_trade_date, v_repo_order_id, v_repo_strike_id, 
        v_repo_days, v_repo_cale_days, v_repo_back_date, v_repo_back_amt, 
        v_repo_back_intrst, v_repo_back_trade_date, v_repo_status from db_pdsecu.tb_pdsepo_bond_repo where row_id>v_query_row_id and repo_back_trade_date=v_init_date and repo_status="2" limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.357.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;


    /* if @订单方向# = 《订单方向-融资回购》 then */
    if v_order_dir = 3 then

        /* set @业务标志# = 《业务标志-融资回购到期》; */
        set v_busi_flag = 2004003;
    else

        /* set @业务标志# = 《业务标志-融券回购到期》; */
        set v_busi_flag = 2004004;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_target_code_no = v_target_code_no;
    SET p_target_code = v_target_code;
    SET p_busi_flag = v_busi_flag;
    SET p_repo_qty = v_repo_qty;
    SET p_repo_back_amt = v_repo_back_amt;
    SET p_repo_back_intrst = v_repo_back_intrst;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_处理回购到期持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_DealRepoExpirePosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_DealRepoExpirePosi(
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
    IN p_stock_code_no int,
    IN p_repo_qty decimal(18,2),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_repo_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_occur_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_order_no int;
    declare v_tmp_frozen_qty decimal(18,2);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_occur_end_qty decimal(18,2);
    declare v_jour_after_occur_info varchar(2048);
    declare v_target_code_no int;
    declare v_impawn_qty decimal(18,2);
    declare v_impawn_ratio decimal(18,12);
    declare v_arrive_date int;
    declare v_old_arrive_date int;
    declare v_begin_trade_date int;
    declare v_entry_status varchar(2);

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
    SET v_stock_code_no = p_stock_code_no;
    SET v_repo_qty = p_repo_qty;
    SET v_busi_flag = p_busi_flag;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_occur_qty = 0;
    SET v_frozen_qty = 0;
    SET v_oper_remark_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_order_no = 0;
    SET v_tmp_frozen_qty = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_invest_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_occur_end_qty = 0;
    SET v_jour_after_occur_info = " ";
    SET v_target_code_no = 0;
    SET v_impawn_qty = 0;
    SET v_impawn_ratio = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    

    /* if @业务标志# = 《业务标志-融资回购到期》 then */
    if v_busi_flag = 2004003 then

        /* set @变动数量# = @回购数量#; */
        set v_occur_qty = v_repo_qty;

        /* set @冻结数量# = 0; */
        set v_frozen_qty = 0;

        /* set @操作备注# = "融资回购到期处理"; */
        set v_oper_remark_info = "融资回购到期处理";
    else

        /* [获取流水变动][{冻结数量}][@冻结数量#] */
        set v_jour_occur_field = concat("冻结数量","|");
        set v_jour_occur_info = concat(v_frozen_qty,"|");


        /* set @变动数量# = -1 * @回购数量#; */
        set v_occur_qty = -1 * v_repo_qty;

        /* set @冻结数量# = -1 * @回购数量#; */
        set v_frozen_qty = -1 * v_repo_qty;

        /* set @操作备注# = "融券回购到期处理"; */
        set v_oper_remark_info = "融券回购到期处理";
    end if;

    /* set @订单编号#=0; */
    set v_order_no=0;

    /* set @临时_冻结数量# = @冻结数量#; */
    set v_tmp_frozen_qty = v_frozen_qty;

    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* set @当前数量# = 0; */
    set v_curr_qty = 0;

    /* set @待交收数量# = @变动数量#; */
    set v_pre_settle_qty = v_occur_qty;

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

    /* set @证券类型# = 《证券类型-回购标准券》; */
    set v_stock_type = 27;

    /* set @资产类型# = 《资产类型-回购资产》; */
    set v_asset_type = 43;

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @操作菜单# =@菜单编号#; */
    set v_oper_menu_no =v_menu_no;

    /* set @操作功能# =@功能编码#; */
    set v_oper_func_code =v_func_code;

    /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{待交收数量} = {待交收数量} + @待交收数量#, {冻结数量} = {冻结数量} + @冻结数量#][1][@交易组编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_settle_qty = pre_settle_qty + v_pre_settle_qty, frozen_qty = frozen_qty + v_frozen_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.358.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;

    #注意获取当前数量赋值为当前数量会把原先的值冲掉

    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{待交收数量}, {冻结数量}][@变动后数量#, @冻结数量#][{交易组编号} = @交易组编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select pre_settle_qty, frozen_qty into v_occur_end_qty, v_frozen_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.358.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* if @业务标志# = 《业务标志-融券回购到期》 then */
    if v_busi_flag = 2004004 then

        /* [获取流水后信息][@冻结数量#] */
        set v_jour_after_occur_info = concat(v_frozen_qty,"|");

    end if;

    /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#, @股东代码编号#, @证券代码编号#] */
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
                
        SET v_error_code = "pdsecuA.3.358.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @标的代码编号# = 0; */
    set v_target_code_no = 0;

    /* set @质押数量# = 0; */
    set v_impawn_qty = 0;

    /* set @质押比例# = 0; */
    set v_impawn_ratio = 0;

    /* set @到账日期# = @初始化日期#; */
    set v_arrive_date = v_init_date;

    /* set @原到账日期# = @到账日期#; */
    set v_old_arrive_date = v_arrive_date;

    /* set @上市日期# = @初始化日期#; */
    set v_begin_trade_date = v_init_date;

    /* set @入账状态# = 《入账状态-未入账》; */
    set v_entry_status = "2";

    /* [插入表记录][产品证券_持仓_交易组持仓入账流水表][字段][字段变量][5][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@业务标志#,@变动数量#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_exgp_posi_entry_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, target_code_no, stock_type, 
        asset_type, busi_flag, occur_qty, cost_amt, 
        intrst_cost_amt, realize_pandl, intrst_pandl, impawn_qty, 
        impawn_ratio, begin_trade_date, old_arrive_date, arrive_date, 
        order_no, entry_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_target_code_no, v_stock_type, 
        v_asset_type, v_busi_flag, v_occur_qty, v_cost_amt, 
        v_intrst_cost_amt, v_realize_pandl, v_intrst_pandl, v_impawn_qty, 
        v_impawn_ratio, v_begin_trade_date, v_old_arrive_date, v_arrive_date, 
        v_order_no, v_entry_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.358.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","业务标志=",v_busi_flag,",","变动数量=",v_occur_qty),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @冻结数量# = @临时_冻结数量#; */
    set v_frozen_qty = v_tmp_frozen_qty;

    /* [插入重复更新][产品证券_持仓_资产账户持仓表][字段][字段变量][{待交收数量} = {待交收数量} + @待交收数量#, {冻结数量} = {冻结数量} + @冻结数量#][1][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_settle_qty = pre_settle_qty + v_pre_settle_qty, frozen_qty = frozen_qty + v_frozen_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.358.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{待交收数量}, {冻结数量}][@变动后数量#, @冻结数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select pre_settle_qty, frozen_qty into v_occur_end_qty, v_frozen_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.358.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* if @业务标志# = 《业务标志-融券回购到期》 then */
    if v_busi_flag = 2004004 then

        /* [获取流水后信息][@冻结数量#] */
        set v_jour_after_occur_info = concat(v_frozen_qty,"|");

    end if;

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
                
        SET v_error_code = "pdsecuA.3.358.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @到账日期# = @初始化日期#; */
    set v_arrive_date = v_init_date;

    /* set @原到账日期# = @到账日期#; */
    set v_old_arrive_date = v_arrive_date;

    /* set @上市日期# = @初始化日期#; */
    set v_begin_trade_date = v_init_date;

    /* set @入账状态# = 《入账状态-未入账》; */
    set v_entry_status = "2";

    /* [插入表记录][产品证券_持仓_资产账户持仓入账流水表][字段][字段变量][5][@资产账户编号#,@股东代码编号#,@证券代码编号#,@业务标志#,@变动数量#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_posi_entry_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, target_code_no, stock_type, asset_type, 
        busi_flag, occur_qty, cost_amt, intrst_cost_amt, 
        realize_pandl, intrst_pandl, impawn_ratio, begin_trade_date, 
        old_arrive_date, arrive_date, order_no, entry_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_target_code_no, v_stock_type, v_asset_type, 
        v_busi_flag, v_occur_qty, v_cost_amt, v_intrst_cost_amt, 
        v_realize_pandl, v_intrst_pandl, v_impawn_ratio, v_begin_trade_date, 
        v_old_arrive_date, v_arrive_date, v_order_no, v_entry_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.358.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","业务标志=",v_busi_flag,",","变动数量=",v_occur_qty),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_更新回购到期记录状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_UpdateRepoExpireRecordStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_UpdateRepoExpireRecordStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
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
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_持仓_债券回购表][{回购处理状态} = 《回购处理状态-已处理》][{记录序号} = @记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_bond_repo set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, repo_status = "1" where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.359.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取交易组红股到期记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetExgpBonusSharesRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetExgpBonusSharesRecord(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_occur_qty decimal(18,2),
    OUT p_busi_flag int
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_impawn_qty decimal(18,2);
    declare v_impawn_ratio decimal(18,12);
    declare v_begin_trade_date int;
    declare v_old_arrive_date int;
    declare v_arrive_date int;
    declare v_order_no int;
    declare v_entry_status varchar(2);

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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_occur_qty = 0;
    SET v_busi_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_pandl = 0;
    SET v_impawn_qty = 0;
    SET v_impawn_ratio = 0;
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_order_no = 0;
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品证券_持仓_交易组持仓入账流水表][字段][字段变量][{记录序号}>@查询记录序号# and {上市日期}<=@初始化日期# and ({业务标志}=《业务标志-红股登记》 or {业务标志}=《业务标志-公司行为配股》) and {入账状态}=《入账状态-未入账》][4][@初始化日期#,@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, target_code_no, 
        stock_type, asset_type, busi_flag, occur_qty, 
        cost_amt, intrst_cost_amt, realize_pandl, intrst_pandl, 
        impawn_qty, impawn_ratio, begin_trade_date, old_arrive_date, 
        arrive_date, order_no, entry_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_target_code_no, 
        v_stock_type, v_asset_type, v_busi_flag, v_occur_qty, 
        v_cost_amt, v_intrst_cost_amt, v_realize_pandl, v_intrst_pandl, 
        v_impawn_qty, v_impawn_ratio, v_begin_trade_date, v_old_arrive_date, 
        v_arrive_date, v_order_no, v_entry_status from db_pdsecu.tb_pdsepo_exgp_posi_entry_jour where row_id>v_query_row_id and begin_trade_date<=v_init_date and (busi_flag=2001014 or busi_flag=2001028) and entry_status="2" limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.360.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_交易组持仓入账流水表][{入账状态}=《入账状态-已入账》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="1" where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.360.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_occur_qty = v_occur_qty;
    SET p_busi_flag = v_busi_flag;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_处理红股到期更新交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_DealBonusSharesUpdateExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_DealBonusSharesUpdateExgpPosi(
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
    IN p_stock_code_no int,
    IN p_occur_qty decimal(18,2),
    IN p_menu_no int,
    IN p_busi_flag int,
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
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_menu_no int;
    declare v_busi_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_invest_type int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_end_qty decimal(18,2);
    declare v_jour_after_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_menu_no = p_menu_no;
    SET v_busi_flag = p_busi_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_invest_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_end_qty = 0;
    SET v_jour_after_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @变动数量# = -1 * @变动数量#; */
    set v_occur_qty = -1 * v_occur_qty;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* if @业务标志# = 《业务标志-红股入账》 then */
    if v_busi_flag = 2001008 then

        /* set @操作备注# = "红股到账处理"; */
        set v_oper_remark_info = "红股到账处理";

    /* elseif @业务标志# = 《业务标志-公司行为配股》 then */
    elseif v_busi_flag = 2001028 then

        /* set @操作备注# = "配股上市日到账处理"; */
        set v_oper_remark_info = "配股上市日到账处理";
    end if;
    #set @业务标志# = 《业务标志-红股入账》;

    /* [获取流水变动][{冻结数量}][@变动数量#] */
    set v_jour_occur_field = concat("冻结数量","|");
    set v_jour_occur_info = concat(v_occur_qty,"|");


    /* [更新表记录][产品证券_持仓_交易组持仓表][{冻结数量}={冻结数量}+@变动数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty=frozen_qty+v_occur_qty where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.361.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{冻结数量}][@变动后数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select frozen_qty into v_occur_end_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.361.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][ @变动后数量#] */
    set v_jour_after_occur_info = concat( v_occur_end_qty,"|");


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
                
        SET v_error_code = "pdsecuA.3.361.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取资产账户红股到期记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetAsacBonusSharesRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetAsacBonusSharesRecord(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_occur_qty decimal(18,2),
    OUT p_busi_flag int
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_begin_trade_date int;
    declare v_old_arrive_date int;
    declare v_arrive_date int;
    declare v_order_no int;
    declare v_entry_status varchar(2);

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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_occur_qty = 0;
    SET v_busi_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_pandl = 0;
    SET v_impawn_ratio = 0;
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_order_no = 0;
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品证券_持仓_资产账户持仓入账流水表][字段][字段变量][{记录序号}>@查询记录序号# and {上市日期}<=@初始化日期# and ({业务标志}=《业务标志-红股登记》 or {业务标志}=《业务标志-公司行为配股》 ) and {入账状态}=《入账状态-未入账》][4][@初始化日期#,@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, target_code_no, stock_type, 
        asset_type, busi_flag, occur_qty, cost_amt, 
        intrst_cost_amt, realize_pandl, intrst_pandl, impawn_ratio, 
        begin_trade_date, old_arrive_date, arrive_date, order_no, 
        entry_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_target_code_no, v_stock_type, 
        v_asset_type, v_busi_flag, v_occur_qty, v_cost_amt, 
        v_intrst_cost_amt, v_realize_pandl, v_intrst_pandl, v_impawn_ratio, 
        v_begin_trade_date, v_old_arrive_date, v_arrive_date, v_order_no, 
        v_entry_status from db_pdsecu.tb_pdsepo_asac_posi_entry_jour where row_id>v_query_row_id and begin_trade_date<=v_init_date and (busi_flag=2001014 or busi_flag=2001028 ) and entry_status="2" limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.362.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_资产账户持仓入账流水表][{入账状态}=《入账状态-已入账》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="1" where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.362.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
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
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_occur_qty = v_occur_qty;
    SET p_busi_flag = v_busi_flag;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_处理红股到期更新资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_DealBonusSharesUpdateAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_DealBonusSharesUpdateAsacPosi(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_occur_qty decimal(18,2),
    IN p_menu_no int,
    IN p_busi_flag int,
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_menu_no int;
    declare v_busi_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_invest_type int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_end_qty decimal(18,2);
    declare v_jour_after_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_menu_no = p_menu_no;
    SET v_busi_flag = p_busi_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_invest_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_end_qty = 0;
    SET v_jour_after_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @变动数量# = -1 * @变动数量#; */
    set v_occur_qty = -1 * v_occur_qty;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* if @业务标志# = 《业务标志-红股入账》 then */
    if v_busi_flag = 2001008 then

        /* set @操作备注# = "红股到账处理"; */
        set v_oper_remark_info = "红股到账处理";

    /* elseif @业务标志# = 《业务标志-公司行为配股》 then */
    elseif v_busi_flag = 2001028 then

        /* set @操作备注# = "配股上市日到账处理"; */
        set v_oper_remark_info = "配股上市日到账处理";
    end if;
    #set @业务标志# = 《业务标志-红股入账》;

    /* [获取流水变动][{冻结数量}][@变动数量#] */
    set v_jour_occur_field = concat("冻结数量","|");
    set v_jour_occur_info = concat(v_occur_qty,"|");


    /* [更新表记录][产品证券_持仓_资产账户持仓表][{冻结数量}={冻结数量}+@变动数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty=frozen_qty+v_occur_qty where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.363.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{冻结数量}][@变动后数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select frozen_qty into v_occur_end_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.363.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][ @变动后数量#] */
    set v_jour_after_occur_info = concat( v_occur_end_qty,"|");


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
                
        SET v_error_code = "pdsecuA.3.363.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取交易组持仓待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetExgpPosiPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetExgpPosiPreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_busi_flag int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_occur_qty decimal(18,2)
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_busi_flag int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_impawn_qty decimal(18,2);
    declare v_impawn_ratio decimal(18,12);
    declare v_begin_trade_date int;
    declare v_old_arrive_date int;
    declare v_arrive_date int;
    declare v_order_no int;
    declare v_entry_status varchar(2);

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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_busi_flag = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_occur_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_pandl = 0;
    SET v_impawn_qty = 0;
    SET v_impawn_ratio = 0;
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_order_no = 0;
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    
    #[锁定获取表记录变量][产品证券_持仓_交易组持仓入账流水表][字段][字段变量][{记录序号}>@查询记录序号# and {到账日期}<=@初始化日期# and ((({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》)) or {业务标志}=《业务标志-融资回购到期》 or {业务标志}=《业务标志-融券回购到期》) and {入账状态}=《入账状态-未入账》][4][@初始化日期#,@查询记录序号#]
    #[更新表记录][产品证券_持仓_交易组持仓入账流水表][{入账状态}=《入账状态-已入账》][{记录序号}=@记录序号#][2][@记录序号#]

    /* set @记录序号#=0; */
    set v_row_id=0;

    /* [获取表记录变量语句][产品证券_持仓_交易组持仓入账流水表][字段][字段变量][{记录序号}>@查询记录序号# and {到账日期}<=@初始化日期# and ((({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》 or {市场编号}=《市场编号-场外交易市场》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》 or {业务标志}=《业务标志-基金申购》 or {业务标志}=《业务标志-基金赎回》 or {业务标志}=《业务标志-基金转换》)) or {业务标志}=《业务标志-融资回购到期》 or {业务标志}=《业务标志-融券回购到期》) and {入账状态}=《入账状态-未入账》] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, target_code_no, 
        stock_type, asset_type, busi_flag, occur_qty, 
        cost_amt, intrst_cost_amt, realize_pandl, intrst_pandl, 
        impawn_qty, impawn_ratio, begin_trade_date, old_arrive_date, 
        arrive_date, order_no, entry_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_target_code_no, 
        v_stock_type, v_asset_type, v_busi_flag, v_occur_qty, 
        v_cost_amt, v_intrst_cost_amt, v_realize_pandl, v_intrst_pandl, 
        v_impawn_qty, v_impawn_ratio, v_begin_trade_date, v_old_arrive_date, 
        v_arrive_date, v_order_no, v_entry_status from db_pdsecu.tb_pdsepo_exgp_posi_entry_jour where row_id>v_query_row_id and arrive_date<=v_init_date and (((exch_no=3 or exch_no=4 or exch_no=5) and (busi_flag=2001001 or busi_flag=2001002 or busi_flag=2006001 or busi_flag=2006002 or busi_flag=2006003)) or busi_flag=2004003 or busi_flag=2004004) and entry_status="2" limit 1;


    /* if @记录序号#<>0 then */
    if v_row_id<>0 then

        /* [更新表记录][产品证券_持仓_交易组持仓入账流水表][{入账状态}=《入账状态-已入账》][{记录序号}=@记录序号#][2][@记录序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdsepo_exgp_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="1" where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.3.364.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
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
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_busi_flag = v_busi_flag;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_occur_qty = v_occur_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_处理持仓入账更新交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_DealPosiEntryUpdateExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_DealPosiEntryUpdateExgpPosi(
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
    IN p_busi_flag int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_occur_qty decimal(18,2),
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
    declare v_busi_flag int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_invest_type int;
    declare v_oper_remark_info varchar(255);
    declare v_frozen_qty decimal(18,2);
    declare v_tmp_pre_settle_qty decimal(18,2);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_pre_settle_qty decimal(18,2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_end_qty decimal(18,2);
    declare v_tmp_frozen_qty decimal(18,2);
    declare v_jour_after_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_exch_no = p_exch_no;
    SET v_busi_flag = p_busi_flag;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_invest_type = 0;
    SET v_oper_remark_info = " ";
    SET v_frozen_qty = 0;
    SET v_tmp_pre_settle_qty = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_pre_settle_qty = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_end_qty = 0;
    SET v_tmp_frozen_qty = 0;
    SET v_jour_after_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* if @业务标志# = 《业务标志-股票买入》 then */
    if v_busi_flag = 2001001 then

        /* set @业务标志# = 《业务标志-港股买入交收》; */
        set v_busi_flag = 2001015;

        /* set @操作备注# = "港股买入到账处理"; */
        set v_oper_remark_info = "港股买入到账处理";

    /* elseif @业务标志# = 《业务标志-股票卖出》 then */
    elseif v_busi_flag = 2001002 then

        /* set @业务标志# = 《业务标志-港股卖出交收》; */
        set v_busi_flag = 2001016;

        /* set @操作备注# = "港股卖出到账处理"; */
        set v_oper_remark_info = "港股卖出到账处理";

    /* elseif @业务标志# = 《业务标志-融资回购到期》 then */
    elseif v_busi_flag = 2004003 then

        /* set @业务标志# = 《业务标志-融资回购到期入账》; */
        set v_busi_flag = 2004005;

        /* set @操作备注# = "融资回购到账处理"; */
        set v_oper_remark_info = "融资回购到账处理";

    /* elseif @业务标志# = 《业务标志-融券回购到期》 then */
    elseif v_busi_flag = 2004004 then

        /* set @业务标志# = 《业务标志-融券回购到期入账》; */
        set v_busi_flag = 2004006;

        /* set @操作备注# = "融券回购到账处理"; */
        set v_oper_remark_info = "融券回购到账处理";

    /* elseif @业务标志# = 《业务标志-基金赎回》 then */
    elseif v_busi_flag = 2006002 then

        /* set @操作备注# = "场外基金赎回委托处理"; */
        set v_oper_remark_info = "场外基金赎回委托处理";

    /* elseif @业务标志# = 《业务标志-基金转换》 then */
    elseif v_busi_flag = 2006003 then

        /* set @操作备注# = "场外基金转换委托处理"; */
        set v_oper_remark_info = "场外基金转换委托处理";
    end if;

    /* set @冻结数量#=0; */
    set v_frozen_qty=0;

    /* set @临时_待交收数量# = -1 * @变动数量#; */
    set v_tmp_pre_settle_qty = -1 * v_occur_qty;

    /* if (@业务标志# = 《业务标志-基金赎回》 or @业务标志# = 《业务标志-基金转换》) then */
    if (v_busi_flag = 2006002 or v_busi_flag = 2006003) then

        /* set @临时_待交收数量#=0; */
        set v_tmp_pre_settle_qty=0;

        /* set @冻结数量#=-1*@变动数量#; */
        set v_frozen_qty=-1*v_occur_qty;

        /* set @变动数量#=0; */
        set v_occur_qty=0;
    end if;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [获取流水变动][{待交收数量}][@待交收数量#] */
    set v_jour_occur_field = concat("待交收数量","|");
    set v_jour_occur_info = concat(v_pre_settle_qty,"|");


    /* [更新表记录][产品证券_持仓_交易组持仓表][{当前数量}={当前数量}+@变动数量#,{待交收数量}={待交收数量}+@临时_待交收数量#,{冻结数量}={冻结数量}+@冻结数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][2][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty+v_occur_qty,pre_settle_qty=pre_settle_qty+v_tmp_pre_settle_qty,frozen_qty=frozen_qty+v_frozen_qty where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.365.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量},{待交收数量},{冻结数量}][@变动后数量#,@待交收数量#,@临时_冻结数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
    select curr_qty,pre_settle_qty,frozen_qty into v_occur_end_qty,v_pre_settle_qty,v_tmp_frozen_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.365.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* if (@业务标志# = 《业务标志-基金赎回》 or @业务标志# = 《业务标志-基金转换》) then */
    if (v_busi_flag = 2006002 or v_busi_flag = 2006003) then

        /* set @变动数量#=@冻结数量#; */
        set v_occur_qty=v_frozen_qty;

        /* set @变动后数量#=@临时_冻结数量#; */
        set v_occur_end_qty=v_tmp_frozen_qty;
    end if;

    /* [获取流水后信息][@待交收数量#] */
    set v_jour_after_occur_info = concat(v_pre_settle_qty,"|");


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
                
        SET v_error_code = "pdsecuA.3.365.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取资产账户持仓待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetAsacPosiPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetAsacPosiPreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_busi_flag int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_occur_qty decimal(18,2)
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_busi_flag int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_begin_trade_date int;
    declare v_old_arrive_date int;
    declare v_arrive_date int;
    declare v_order_no int;
    declare v_entry_status varchar(2);

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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_busi_flag = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_occur_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_pandl = 0;
    SET v_impawn_ratio = 0;
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_order_no = 0;
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    
    #[锁定获取表记录变量][产品证券_持仓_资产账户持仓入账流水表][字段][字段变量][{记录序号}>@查询记录序号# and {到账日期}<=@初始化日期# and ((({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》)) or {业务标志}=《业务标志-融资回购到期》 or {业务标志}=《业务标志-融券回购到期》) and {入账状态}=《入账状态-未入账》][4][@初始化日期#,@查询记录序号#]
    #[更新表记录][产品证券_持仓_资产账户持仓入账流水表][{入账状态}=《入账状态-已入账》][{记录序号}=@记录序号#][2][@记录序号#]

    /* set @记录序号#=0; */
    set v_row_id=0;

    /* [获取表记录变量语句][产品证券_持仓_资产账户持仓入账流水表][字段][字段变量][{记录序号}>@查询记录序号# and {到账日期}<=@初始化日期# and ((({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》 or {市场编号}=《市场编号-场外交易市场》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》 or {业务标志}=《业务标志-基金申购》 or {业务标志}=《业务标志-基金赎回》 or {业务标志}=《业务标志-基金转换》)) or {业务标志}=《业务标志-融资回购到期》 or {业务标志}=《业务标志-融券回购到期》) and {入账状态}=《入账状态-未入账》] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, target_code_no, stock_type, 
        asset_type, busi_flag, occur_qty, cost_amt, 
        intrst_cost_amt, realize_pandl, intrst_pandl, impawn_ratio, 
        begin_trade_date, old_arrive_date, arrive_date, order_no, 
        entry_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_target_code_no, v_stock_type, 
        v_asset_type, v_busi_flag, v_occur_qty, v_cost_amt, 
        v_intrst_cost_amt, v_realize_pandl, v_intrst_pandl, v_impawn_ratio, 
        v_begin_trade_date, v_old_arrive_date, v_arrive_date, v_order_no, 
        v_entry_status from db_pdsecu.tb_pdsepo_asac_posi_entry_jour where row_id>v_query_row_id and arrive_date<=v_init_date and (((exch_no=3 or exch_no=4 or exch_no=5) and (busi_flag=2001001 or busi_flag=2001002 or busi_flag=2006001 or busi_flag=2006002 or busi_flag=2006003)) or busi_flag=2004003 or busi_flag=2004004) and entry_status="2" limit 1;


    /* if @记录序号#<>0 then */
    if v_row_id<>0 then

        /* [更新表记录][产品证券_持仓_资产账户持仓入账流水表][{入账状态}=《入账状态-已入账》][{记录序号}=@记录序号#][2][@记录序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdsepo_asac_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="1" where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.3.366.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
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
    SET p_busi_flag = v_busi_flag;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_occur_qty = v_occur_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_处理持仓入账更新资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_DealPosiEntryUpdateAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_DealPosiEntryUpdateAsacPosi(
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
    IN p_exch_no int,
    IN p_busi_flag int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_occur_qty decimal(18,2),
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
    declare v_exch_no int;
    declare v_busi_flag int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_invest_type int;
    declare v_oper_remark_info varchar(255);
    declare v_frozen_qty decimal(18,2);
    declare v_tmp_pre_settle_qty decimal(18,2);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_pre_settle_qty decimal(18,2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_end_qty decimal(18,2);
    declare v_tmp_frozen_qty decimal(18,2);
    declare v_jour_after_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_busi_flag = p_busi_flag;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_invest_type = 0;
    SET v_oper_remark_info = " ";
    SET v_frozen_qty = 0;
    SET v_tmp_pre_settle_qty = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_pre_settle_qty = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_end_qty = 0;
    SET v_tmp_frozen_qty = 0;
    SET v_jour_after_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* if @业务标志# = 《业务标志-股票买入》 then */
    if v_busi_flag = 2001001 then

        /* set @业务标志# = 《业务标志-港股买入交收》; */
        set v_busi_flag = 2001015;

        /* set @操作备注# = "港股买入到账处理"; */
        set v_oper_remark_info = "港股买入到账处理";

    /* elseif @业务标志# = 《业务标志-股票卖出》 then */
    elseif v_busi_flag = 2001002 then

        /* set @业务标志# = 《业务标志-港股卖出交收》; */
        set v_busi_flag = 2001016;

        /* set @操作备注# = "港股卖出到账处理"; */
        set v_oper_remark_info = "港股卖出到账处理";

    /* elseif @业务标志# = 《业务标志-融资回购到期》 then */
    elseif v_busi_flag = 2004003 then

        /* set @业务标志# = 《业务标志-融资回购到期入账》; */
        set v_busi_flag = 2004005;

        /* set @操作备注# = "融资回购到账处理"; */
        set v_oper_remark_info = "融资回购到账处理";

    /* elseif @业务标志# = 《业务标志-融券回购到期》 then */
    elseif v_busi_flag = 2004004 then

        /* set @业务标志# = 《业务标志-融券回购到期入账》; */
        set v_busi_flag = 2004006;

        /* set @操作备注# = "融券回购到账处理"; */
        set v_oper_remark_info = "融券回购到账处理";

    /* elseif @业务标志# = 《业务标志-基金赎回》 then */
    elseif v_busi_flag = 2006002 then

        /* set @操作备注# = "场外基金赎回委托处理"; */
        set v_oper_remark_info = "场外基金赎回委托处理";

    /* elseif @业务标志# = 《业务标志-基金转换》 then */
    elseif v_busi_flag = 2006003 then

        /* set @操作备注# = "场外基金转换委托处理"; */
        set v_oper_remark_info = "场外基金转换委托处理";
    end if;

    /* set @冻结数量#=0; */
    set v_frozen_qty=0;

    /* set @临时_待交收数量# = -1 * @变动数量#; */
    set v_tmp_pre_settle_qty = -1 * v_occur_qty;

    /* if (@业务标志# = 《业务标志-基金赎回》 or @业务标志# = 《业务标志-基金转换》) then */
    if (v_busi_flag = 2006002 or v_busi_flag = 2006003) then

        /* set @临时_待交收数量#=0; */
        set v_tmp_pre_settle_qty=0;

        /* set @冻结数量#=-1*@变动数量#; */
        set v_frozen_qty=-1*v_occur_qty;

        /* set @变动数量#=0; */
        set v_occur_qty=0;
    end if;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [获取流水变动][{待交收数量}][@待交收数量#] */
    set v_jour_occur_field = concat("待交收数量","|");
    set v_jour_occur_info = concat(v_pre_settle_qty,"|");


    /* [更新表记录][产品证券_持仓_资产账户持仓表][{当前数量}={当前数量}+@变动数量#,{待交收数量}={待交收数量}+@临时_待交收数量#,{冻结数量}={冻结数量}+@冻结数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][2][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty+v_occur_qty,pre_settle_qty=pre_settle_qty+v_tmp_pre_settle_qty,frozen_qty=frozen_qty+v_frozen_qty where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.367.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{当前数量},{待交收数量},@冻结数量#][@变动后数量#,@待交收数量#,@临时_冻结数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
    select curr_qty,pre_settle_qty,v_frozen_qty into v_occur_end_qty,v_pre_settle_qty,v_tmp_frozen_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.367.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* if (@业务标志# = 《业务标志-基金赎回》 or @业务标志# = 《业务标志-基金转换》) then */
    if (v_busi_flag = 2006002 or v_busi_flag = 2006003) then

        /* set @变动数量#=@冻结数量#; */
        set v_occur_qty=v_frozen_qty;

        /* set @变动后数量#=@临时_冻结数量#; */
        set v_occur_end_qty=v_tmp_frozen_qty;
    end if;

    /* [获取流水后信息][@待交收数量#] */
    set v_jour_after_occur_info = concat(v_pre_settle_qty,"|");


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
                
        SET v_error_code = "pdsecuA.3.367.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_清除持仓导入记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_ClearPosiImportRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_ClearPosiImportRecord(
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_invest_type int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_invest_type = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [更新表记录][产品证券_持仓_资产账户持仓表][{当前数量}=0, {待交收数量}=0, {冻结数量}=0, {解冻数量}=0, {成本金额}=0, {利息成本金额}=0,{持仓核对差额}=0][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#  and {投资类型}=@投资类型#][2][@机构编号#,@产品编号#,@资产账户编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=0, pre_settle_qty=0, frozen_qty=0, unfroz_qty=0, cost_amt=0, intrst_cost_amt=0,posi_qty_check_diff=0 where co_no=v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no  and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.501.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_交易组持仓表][{当前数量}=0, {待交收数量}=0, {冻结数量}=0, {解冻数量}=0, {成本金额}=0,  {利息成本金额}=0,{持仓核对差额}=0][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {投资类型}=@投资类型#][2][@机构编号#,@产品编号#,@资产账户编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=0, pre_settle_qty=0, frozen_qty=0, unfroz_qty=0, cost_amt=0,  intrst_cost_amt=0,posi_qty_check_diff=0 where co_no=v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.501.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_导入持仓记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_ImportRecordPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_ImportRecordPosi(
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
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_acco_no int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_cost_price decimal(16,9),
    IN p_posi_qty decimal(18,2),
    IN p_settle_sell_rate decimal(18,12),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exch_group_stock_type int,
    OUT p_exch_group_asset_type int,
    OUT p_exgp_invest_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_pre_settle_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_posi_qty_check_diff decimal(18,2),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
    OUT p_exch_group_update_times int,
    OUT p_asac_posi_id bigint,
    OUT p_asac_stock_type int,
    OUT p_asac_asset_type int,
    OUT p_asac_invest_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_pre_settle_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_posi_qty_check_diff decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_cost_price decimal(16,9);
    declare v_posi_qty decimal(18,2);
    declare v_settle_sell_rate decimal(18,12);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
    declare v_exch_group_asset_type int;
    declare v_exgp_invest_type int;
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
    declare v_asac_posi_id bigint;
    declare v_asac_stock_type int;
    declare v_asac_asset_type int;
    declare v_asac_invest_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_pre_settle_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_posi_qty_check_diff decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_asac_update_times int;
    declare v_curr_qty decimal(18,2);
    declare v_invest_type int;
    declare v_tmp_occur_qty decimal(18,2);
    declare v_begin_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_occur_end_qty decimal(18,2);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);

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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_cost_price = p_cost_price;
    SET v_posi_qty = p_posi_qty;
    SET v_settle_sell_rate = p_settle_sell_rate;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
    SET v_exch_group_asset_type = 0;
    SET v_exgp_invest_type = 0;
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
    SET v_asac_posi_id = 0;
    SET v_asac_stock_type = 0;
    SET v_asac_asset_type = 0;
    SET v_asac_invest_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_pre_settle_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_posi_qty_check_diff = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_asac_update_times = 0;
    SET v_curr_qty = 0;
    SET v_invest_type = 0;
    SET v_tmp_occur_qty = 0;
    SET v_begin_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_occur_qty = 0;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_occur_end_qty = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    

    /* set @当前数量#=0; */
    set v_curr_qty=0;

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{当前数量}][@当前数量#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
    select curr_qty into v_curr_qty from db_pdsecu.tb_pdsepo_exgp_posi where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;


    /* set @临时_变动数量#=@持仓数量#-@当前数量#; */
    set v_tmp_occur_qty=v_posi_qty-v_curr_qty;

    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* set @当前数量# = @临时_变动数量#; */
    set v_curr_qty = v_tmp_occur_qty;

    /* set @待交收数量# = 0; */
    set v_pre_settle_qty = 0;

    /* set @冻结数量# = 0; */
    set v_frozen_qty = 0;

    /* set @解冻数量# = 0; */
    set v_unfroz_qty = 0;

    /* set @持仓核对差额#=0; */
    set v_posi_qty_check_diff=0;

    /* set @成本金额# = round(ifnull(@持仓数量# * @成本价# * @卖出结算汇率#,0),2); */
    set v_cost_amt = round(ifnull(v_posi_qty * v_cost_price * v_settle_sell_rate,0),2);

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利息成本金额# = 0; */
    set v_intrst_cost_amt = 0;

    /* set @利息收益# = 0; */
    set v_intrst_pandl = 0;

    /* set @变动数量# = @临时_变动数量#; */
    set v_occur_qty = v_tmp_occur_qty;

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @业务标志# = 《业务标志-持仓蓝补》; */
    set v_busi_flag = 1103002;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "转入持仓记录"; */
    set v_oper_remark_info = "转入持仓记录";

    /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{当前数量}={当前数量}+@临时_变动数量#, {冻结数量}=@冻结数量#, {解冻数量}=@解冻数量#, {成本金额}=@成本金额#, {实现盈亏}=@实现盈亏#, {利息成本金额}=@利息成本金额#, {利息收益}=@利息收益#][1][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=curr_qty+v_tmp_occur_qty, frozen_qty=v_frozen_qty, unfroz_qty=v_unfroz_qty, cost_amt=v_cost_amt, realize_pandl=v_realize_pandl, intrst_cost_amt=v_intrst_cost_amt, intrst_pandl=v_intrst_pandl;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.502.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@交易组持仓序号#,@交易组证券类型#,@交易组资产类型#,@交易组投资类型#,@交易组期初数量#,@交易组当前数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组持仓核对差额#,@交易组成本金额#,@交易组实现盈亏#,@交易组利息成本金额#,@交易组利息收益#,@交易组更新次数#,@交易组待交收数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    select row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_exgp_posi_id,v_exch_group_stock_type,v_exch_group_asset_type,v_exgp_invest_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_posi_qty_check_diff,v_exgp_cost_amt,v_exgp_realize_pandl,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_exch_group_update_times,v_exgp_pre_settle_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.502.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* set @变动后数量#=@交易组当前数量#; */
    set v_occur_end_qty=v_exgp_curr_qty;

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
                
        SET v_error_code = "pdsecuA.3.502.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @成本金额#= round(ifnull(@临时_变动数量# * @成本价# * @卖出结算汇率#,0),2); */
    set v_cost_amt= round(ifnull(v_tmp_occur_qty * v_cost_price * v_settle_sell_rate,0),2);

    /* [插入重复更新][产品证券_持仓_资产账户持仓表][字段][字段变量][{当前数量}={当前数量}+@临时_变动数量#, {冻结数量}=@冻结数量#, {解冻数量}=@解冻数量#, {成本金额}={成本金额}+@成本金额#, {实现盈亏}=@实现盈亏#, {利息成本金额}=@利息成本金额#, {利息收益}=@利息收益#][1][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=curr_qty+v_tmp_occur_qty, frozen_qty=v_frozen_qty, unfroz_qty=v_unfroz_qty, cost_amt=cost_amt+v_cost_amt, realize_pandl=v_realize_pandl, intrst_cost_amt=v_intrst_cost_amt, intrst_pandl=v_intrst_pandl;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.502.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@资产账户持仓序号#,@资产账户证券类型#,@资产账户资产类型#,@资产账户投资类型#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户持仓核对差额#,@资产账户成本金额#,@资产账户实现盈亏#,@资产账户利息成本金额#,@资产账户利息收益#,@资产账户更新次数#,@资产账户待交收数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    select row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_asac_posi_id,v_asac_stock_type,v_asac_asset_type,v_asac_invest_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_posi_qty_check_diff,v_asac_cost_amt,v_asac_realize_pandl,v_asac_intrst_cost_amt,v_asac_intrst_pandl,v_asac_update_times,v_asac_pre_settle_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.502.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* set @变动后数量#=@资产账户当前数量#; */
    set v_occur_end_qty=v_asac_curr_qty;

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
                
        SET v_error_code = "pdsecuA.3.502.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exch_group_stock_type = v_exch_group_stock_type;
    SET p_exch_group_asset_type = v_exch_group_asset_type;
    SET p_exgp_invest_type = v_exgp_invest_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_pre_settle_qty = v_exgp_pre_settle_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_posi_qty_check_diff = v_exgp_posi_qty_check_diff;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_exch_group_update_times = v_exch_group_update_times;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_stock_type = v_asac_stock_type;
    SET p_asac_asset_type = v_asac_asset_type;
    SET p_asac_invest_type = v_asac_invest_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_pre_settle_qty = v_asac_pre_settle_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_posi_qty_check_diff = v_asac_posi_qty_check_diff;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_asac_update_times = v_asac_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询持仓清除后交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryExgpPosiAfterClear;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryExgpPosiAfterClear(
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_count int;
    declare v_invest_type int;

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;
    SET v_invest_type = 0;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [获取表记录][产品证券_持仓_交易组持仓表][{记录序号} as {交易组持仓序号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{证券类型} as {交易组证券类型},{资产类型} as {交易组资产类型},{投资类型} as {交易组投资类型},{期初数量} as {交易组期初数量},{当前数量} as {交易组当前数量},{待交收数量} as {交易组待交收数量},{冻结数量} as {交易组冻结数量},{解冻数量} as {交易组解冻数量},{持仓核对差额} as {交易组持仓核对差额},{成本金额} as {交易组成本金额},{实现盈亏} as {交易组实现盈亏},{利息成本金额} as {交易组利息成本金额},{利息收益} as {交易组利息收益},{更新次数}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {投资类型}=@投资类型#][@指定行数#] */
    if v_row_count = -1 then
        select row_id as exgp_posi_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type as exch_group_stock_type,asset_type as exch_group_asset_type,invest_type as exgp_invest_type,begin_qty as exch_group_begin_qty,curr_qty as exgp_curr_qty,pre_settle_qty as exgp_pre_settle_qty,frozen_qty as exgp_frozen_qty,unfroz_qty as exgp_unfroz_qty,posi_qty_check_diff as exgp_posi_qty_check_diff,cost_amt as exgp_cost_amt,realize_pandl as exgp_realize_pandl,intrst_cost_amt as exgp_intrst_cost_amt,intrst_pandl as exgp_intrst_pandl,update_times from db_pdsecu.tb_pdsepo_exgp_posi where co_no=v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and invest_type=v_invest_type;
    else
        select row_id as exgp_posi_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type as exch_group_stock_type,asset_type as exch_group_asset_type,invest_type as exgp_invest_type,begin_qty as exch_group_begin_qty,curr_qty as exgp_curr_qty,pre_settle_qty as exgp_pre_settle_qty,frozen_qty as exgp_frozen_qty,unfroz_qty as exgp_unfroz_qty,posi_qty_check_diff as exgp_posi_qty_check_diff,cost_amt as exgp_cost_amt,realize_pandl as exgp_realize_pandl,intrst_cost_amt as exgp_intrst_cost_amt,intrst_pandl as exgp_intrst_pandl,update_times from db_pdsecu.tb_pdsepo_exgp_posi where co_no=v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and invest_type=v_invest_type limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询持仓清除后资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryAsacPosiAfterClear;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryAsacPosiAfterClear(
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_count int;
    declare v_invest_type int;

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;
    SET v_invest_type = 0;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [获取表记录][产品证券_持仓_资产账户持仓表][{记录序号} as {资产账户持仓序号},{机构编号},{产品编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{证券类型} as {资产账户证券类型},{资产类型} as {资产账户资产类型},{投资类型} as {资产账户投资类型},{期初数量} as {资产账户期初数量},{当前数量} as {资产账户当前数量},{待交收数量} as {资产账户待交收数量},{冻结数量} as {资产账户冻结数量},{解冻数量} as {资产账户解冻数量},{持仓核对差额} as {资产账户持仓核对差额},{成本金额} as {资产账户成本金额},{实现盈亏} as {资产账户实现盈亏},{利息成本金额} as {资产账户利息成本金额},{利息收益} as {资产账户利息收益},{更新次数}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {投资类型}=@投资类型#][@指定行数#] */
    if v_row_count = -1 then
        select row_id as asac_posi_id,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type as asac_stock_type,asset_type as asac_asset_type,invest_type as asac_invest_type,begin_qty as asac_begin_qty,curr_qty as asac_curr_qty,pre_settle_qty as asac_pre_settle_qty,frozen_qty as asac_frozen_qty,unfroz_qty as asac_unfroz_qty,posi_qty_check_diff as asac_posi_qty_check_diff,cost_amt as asac_cost_amt,realize_pandl as asac_realize_pandl,intrst_cost_amt as asac_intrst_cost_amt,intrst_pandl as asac_intrst_pandl,update_times from db_pdsecu.tb_pdsepo_asac_posi where co_no=v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and invest_type=v_invest_type;
    else
        select row_id as asac_posi_id,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type as asac_stock_type,asset_type as asac_asset_type,invest_type as asac_invest_type,begin_qty as asac_begin_qty,curr_qty as asac_curr_qty,pre_settle_qty as asac_pre_settle_qty,frozen_qty as asac_frozen_qty,unfroz_qty as asac_unfroz_qty,posi_qty_check_diff as asac_posi_qty_check_diff,cost_amt as asac_cost_amt,realize_pandl as asac_realize_pandl,intrst_cost_amt as asac_intrst_cost_amt,intrst_pandl as asac_intrst_pandl,update_times from db_pdsecu.tb_pdsepo_asac_posi where co_no=v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and invest_type=v_invest_type limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_更新交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_UpdateTrdPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_UpdateTrdPosi(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_posi_qty decimal(18,2),
    IN p_cost_amt decimal(18,4),
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_posi_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_posi_qty = p_posi_qty;
    SET v_cost_amt = p_cost_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][产品证券_持仓_交易资产账户持仓表][字段][字段变量][{持仓数量}=@持仓数量#,{成本金额}=@成本金额#][1][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_trd_asac_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        posi_qty, cost_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
        v_posi_qty, v_cost_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, posi_qty=v_posi_qty,cost_amt=v_cost_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.505.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_更新交易库交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_UpdateTrdExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_UpdateTrdExgpPosi(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_posi_qty decimal(18,2),
    IN p_cost_amt decimal(18,4),
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_posi_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_posi_qty = p_posi_qty;
    SET v_cost_amt = p_cost_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][产品证券_持仓_交易库交易组持仓表][字段][字段变量][{持仓数量}=@持仓数量#,{成本金额}=@成本金额#][1][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_trd_exgp_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, posi_qty, cost_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_posi_qty, v_cost_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, posi_qty=v_posi_qty,cost_amt=v_cost_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.506.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_交易组持仓划转
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_TransferExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_TransferExgpPosi(
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
    IN p_target_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_cost_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exch_group_stock_type int,
    OUT p_exch_group_asset_type int,
    OUT p_exgp_invest_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_pre_settle_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_posi_qty_check_diff decimal(18,2),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
    OUT p_exch_group_update_times int,
    OUT p_row_id bigint,
    OUT p_invest_type int,
    OUT p_begin_qty decimal(18,2),
    OUT p_curr_qty decimal(18,2),
    OUT p_pre_settle_qty decimal(18,2),
    OUT p_frozen_qty decimal(18,2),
    OUT p_unfroz_qty decimal(18,2),
    OUT p_posi_qty_check_diff decimal(18,2),
    OUT p_cost_amt decimal(18,4),
    OUT p_realize_pandl decimal(18,4),
    OUT p_intrst_cost_amt decimal(18,4),
    OUT p_intrst_pandl decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_target_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_cost_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
    declare v_exch_group_asset_type int;
    declare v_exgp_invest_type int;
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
    declare v_row_id bigint;
    declare v_invest_type int;
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_update_times int;
    declare v_tmp_occur_qty decimal(18,2);
    declare v_tmp_exch_group_no int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_tmp_curr_qty decimal(18,2);
    declare v_posi_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_tmp_cost_amt decimal(18,4);
    declare v_tmp_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_occur_end_qty decimal(18,2);

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
    SET v_target_exch_group_no = p_target_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_cost_amt = p_occur_cost_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
    SET v_exch_group_asset_type = 0;
    SET v_exgp_invest_type = 0;
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
    SET v_row_id = 0;
    SET v_invest_type = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_update_times = 1;
    SET v_tmp_occur_qty = 0;
    SET v_tmp_exch_group_no = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_tmp_curr_qty = 0;
    SET v_posi_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_cost_amt = 0;
    SET v_tmp_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_occur_end_qty = 0;

    
    label_pro:BEGIN
    

    /* set @当前数量# = @变动数量#; */
    set v_curr_qty = v_occur_qty;

    /* set @临时_变动数量#=@变动数量#; */
    set v_tmp_occur_qty=v_occur_qty;

    /* set @临时_交易组编号#=@交易组编号#; */
    set v_tmp_exch_group_no=v_exch_group_no;

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

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [获取流水变动][{当前数量},{成本金额}][@当前数量#,@变动成本金额#] */
    set v_jour_occur_field = concat("当前数量","|","成本金额","|");
    set v_jour_occur_info = concat(v_curr_qty,"|",v_occur_cost_amt,"|");


    /* set @交易组编号#=@目标交易组编号#; */
    set v_exch_group_no=v_target_exch_group_no;

    /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{当前数量}][@临时_当前数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#] */
    select curr_qty into v_tmp_curr_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;


    /* set @持仓数量#=@临时_当前数量#+@变动数量#; */
    set v_posi_qty=v_tmp_curr_qty+v_occur_qty;

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
                
        SET v_error_code = "pdsecuA.3.507.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* if @临时_当前数量#=0 then */
    if v_tmp_curr_qty=0 then

        /* set @临时_当前数量#=1; */
        set v_tmp_curr_qty=1;
    end if;

    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数}][@交易组持仓序号#,@交易组证券类型#,@交易组资产类型#,@交易组投资类型#,@交易组期初数量#,@交易组当前数量#,@交易组待交收数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组持仓核对差额#,@交易组成本金额#,@交易组实现盈亏#,@交易组利息成本金额#,@交易组利息收益#,@交易组更新次数#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times into v_exgp_posi_id,v_exch_group_stock_type,v_exch_group_asset_type,v_exgp_invest_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_pre_settle_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_posi_qty_check_diff,v_exgp_cost_amt,v_exgp_realize_pandl,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_exch_group_update_times from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.507.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;

    #源交易组。

    /* set @交易组编号#=@临时_交易组编号#; */
    set v_exch_group_no=v_tmp_exch_group_no;

    /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{当前数量},{成本金额}][@临时_当前数量#,@临时_成本金额#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#] */
    select curr_qty,cost_amt into v_tmp_curr_qty,v_tmp_cost_amt from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;


    /* set @当前数量#=-1*@变动数量#; */
    set v_curr_qty=-1*v_occur_qty;

    /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{当前数量} = {当前数量} - @变动数量#][1][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty - v_occur_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.507.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* if @临时_当前数量#=0 then */
    if v_tmp_curr_qty=0 then

        /* set @临时_当前数量#=1; */
        set v_tmp_curr_qty=1;
    end if;

    /* set @持仓数量#=@临时_当前数量#-@变动数量#; */
    set v_posi_qty=v_tmp_curr_qty-v_occur_qty;
    #[更新表记录][产品证券_持仓_交易组持仓表][{成本金额}={成本金额}*@持仓数量#/@临时_当前数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#]

    /* [更新表记录][产品证券_持仓_交易组持仓表][{成本金额}={成本金额}-@变动成本金额#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cost_amt=cost_amt-v_occur_cost_amt where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.507.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数}][@记录序号#,@证券类型#,@资产类型#,@投资类型#,@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@持仓核对差额#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#,@临时_更新次数#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times into v_row_id,v_stock_type,v_asset_type,v_invest_type,v_begin_qty,v_curr_qty,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty,v_posi_qty_check_diff,v_cost_amt,v_realize_pandl,v_intrst_cost_amt,v_intrst_pandl,v_tmp_update_times from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.507.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;

    #变更目标交易组的成本金额
    #set @临时_成本金额#=@临时_成本金额#-@成本金额#;

    /* [更新表记录][产品证券_持仓_交易组持仓表][{成本金额}={成本金额}+@变动成本金额#][{记录序号}=@交易组持仓序号#][2][@交易组持仓序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cost_amt=cost_amt+v_occur_cost_amt where row_id=v_exgp_posi_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.507.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组持仓序号=",v_exgp_posi_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组持仓序号=",v_exgp_posi_id);
        end if;
        leave label_pro;
    end if;


    /* set @交易组成本金额#=@交易组成本金额#+@变动成本金额#; */
    set v_exgp_cost_amt=v_exgp_cost_amt+v_occur_cost_amt;
    #目标交易组的持仓变动流水

    /* [获取流水后信息][@交易组当前数量#,@交易组成本金额#] */
    set v_jour_after_occur_info = concat(v_exgp_curr_qty,"|",v_exgp_cost_amt,"|");


    /* set @交易组编号#=@目标交易组编号#; */
    set v_exch_group_no=v_target_exch_group_no;

    /* set @业务标志# = 《业务标志-持仓划转》; */
    set v_busi_flag = 1104003;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @变动后数量# = @交易组当前数量#; */
    set v_occur_end_qty = v_exgp_curr_qty;

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
                
        SET v_error_code = "pdsecuA.3.507.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #源交易组的持仓变动流水

    /* set @交易组编号#=@临时_交易组编号#; */
    set v_exch_group_no=v_tmp_exch_group_no;

    /* [获取流水后信息][@当前数量#,@成本金额#] */
    set v_jour_after_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|");


    /* set @变动数量#=-1*@变动数量#; */
    set v_occur_qty=-1*v_occur_qty;

    /* set @变动后数量# = @当前数量#; */
    set v_occur_end_qty = v_curr_qty;

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
                
        SET v_error_code = "pdsecuA.3.507.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @临时_更新次数#; */
    set v_update_times = v_tmp_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exch_group_stock_type = v_exch_group_stock_type;
    SET p_exch_group_asset_type = v_exch_group_asset_type;
    SET p_exgp_invest_type = v_exgp_invest_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_pre_settle_qty = v_exgp_pre_settle_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_posi_qty_check_diff = v_exgp_posi_qty_check_diff;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_exch_group_update_times = v_exch_group_update_times;
    SET p_row_id = v_row_id;
    SET p_invest_type = v_invest_type;
    SET p_begin_qty = v_begin_qty;
    SET p_curr_qty = v_curr_qty;
    SET p_pre_settle_qty = v_pre_settle_qty;
    SET p_frozen_qty = v_frozen_qty;
    SET p_unfroz_qty = v_unfroz_qty;
    SET p_posi_qty_check_diff = v_posi_qty_check_diff;
    SET p_cost_amt = v_cost_amt;
    SET p_realize_pandl = v_realize_pandl;
    SET p_intrst_cost_amt = v_intrst_cost_amt;
    SET p_intrst_pandl = v_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_更新交易库资产账户债券质押
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_UpdateTrdAsacBondPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_UpdateTrdAsacBondPosi(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_posi_qty decimal(18,2),
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_posi_qty decimal(18,2);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_posi_qty = p_posi_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][产品证券_持仓_交易库资产账户债券质押表][字段][字段变量][{持仓数量}=@持仓数量#][1][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_trd_asac_bond_pledge (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        posi_qty) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
        v_posi_qty) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, posi_qty=v_posi_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.508.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_更新交易库交易组债券质押
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_UpdateTrdExgpBondPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_UpdateTrdExgpBondPosi(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_posi_qty decimal(18,2),
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_posi_qty decimal(18,2);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_posi_qty = p_posi_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][产品证券_持仓_交易库交易组债券质押表][字段][字段变量][{持仓数量}=@持仓数量#][1][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_trd_exgp_bond_pledge (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, posi_qty) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_posi_qty) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, posi_qty=v_posi_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.509.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_修改大宗交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_ModiBlockTradeposi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_ModiBlockTradeposi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_posi_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_fair_price decimal(16,9),
    IN p_release_date int,
    IN p_menu_no int,
    IN p_oper_remark_info varchar(255),
    IN p_invest_type int,
    IN p_stock_type int,
    IN p_asset_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_occur_qty decimal(18,2),
    OUT p_occur_cost_amt decimal(18,4),
    OUT p_occur_fair_price decimal(16,9),
    OUT p_update_times int,
    OUT p_strike_date int
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
    declare v_posi_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_release_date int;
    declare v_menu_no int;
    declare v_oper_remark_info varchar(255);
    declare v_invest_type int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_occur_qty decimal(18,2);
    declare v_occur_cost_amt decimal(18,4);
    declare v_occur_fair_price decimal(16,9);
    declare v_update_times int;
    declare v_strike_date int;
    declare v_tmp_strike_qty decimal(18,2);
    declare v_tmp_strike_price decimal(16,9);
    declare v_tmp_fair_price decimal(16,9);
    declare v_occur_price decimal(16,9);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_tmp_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_end_qty decimal(18,2);
    declare v_occur_end_price decimal(16,9);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_curr_qty decimal(18,2);
    declare v_begin_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_busi_flag int;

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
    SET v_posi_id = p_posi_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_fair_price = p_fair_price;
    SET v_release_date = p_release_date;
    SET v_menu_no = p_menu_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_invest_type = p_invest_type;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_occur_qty = 0;
    SET v_occur_cost_amt = 0;
    SET v_occur_fair_price = 0;
    SET v_update_times = 1;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_strike_qty = 0;
    SET v_tmp_strike_price = 0;
    SET v_tmp_fair_price = 0;
    SET v_occur_price = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_occur_end_qty = 0;
    SET v_occur_end_price = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_curr_qty = 0;
    SET v_begin_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_busi_flag = 0;

    
    label_pro:BEGIN
    

    /* set @临时_成交数量# =0; */
    set v_tmp_strike_qty =0;

    /* set @临时_成交价格# =0; */
    set v_tmp_strike_price =0;

    /* [获取表记录变量][产品证券_持仓_大宗交易持仓表][{成交数量},{成交价格},{公允价格}][@临时_成交数量#,@临时_成交价格#,@临时_公允价格#][{持仓序号}=@持仓序号# and {机构编号}=@机构编号# and {市场编号}=@市场编号# and {产品编号}=@产品编号#][4][@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#,@成交日期#] */
    select strike_qty,strike_price,fair_price into v_tmp_strike_qty,v_tmp_strike_price,v_tmp_fair_price from db_pdsecu.tb_pdsepo_block_trade_posi where posi_id=v_posi_id and co_no=v_co_no and exch_no=v_exch_no and pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.510.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","成交日期=",v_strike_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","成交日期=",v_strike_date);
        end if;
        leave label_pro;
    end if;


    /* set @变动数量# = @成交数量# - @临时_成交数量#; */
    set v_occur_qty = v_strike_qty - v_tmp_strike_qty;

    /* set @变动成本金额# = (@成交价格#*@成交数量# )- (@临时_成交数量#*@临时_成交价格#); */
    set v_occur_cost_amt = (v_strike_price*v_strike_qty )- (v_tmp_strike_qty*v_tmp_strike_price);

    /* set @变动价格# = @成交价格# - @临时_成交价格#; */
    set v_occur_price = v_strike_price - v_tmp_strike_price;

    /* set @变动公允价格#=@公允价格#-@临时_公允价格#; */
    set v_occur_fair_price=v_fair_price-v_tmp_fair_price;

    /* [获取流水变动][{成交数量},{成交价格},{公允价格},{解禁日期}][@成交数量#,@成交价格#,@公允价格#,@解禁日期#] */
    set v_jour_occur_field = concat("成交数量","|","成交价格","|","公允价格","|","解禁日期","|");
    set v_jour_occur_info = concat(v_strike_qty,"|",v_strike_price,"|",v_fair_price,"|",v_release_date,"|");


    /* [更新表记录][产品证券_持仓_大宗交易持仓表][{成交数量}=@成交数量#,{成交价格}=@成交价格#,{公允价格}=@公允价格#,{解禁日期}=@解禁日期#][{持仓序号}=@持仓序号# and {机构编号}=@机构编号# and {资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号#][2][@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_block_trade_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_qty=v_strike_qty,strike_price=v_strike_price,fair_price=v_fair_price,release_date=v_release_date where posi_id=v_posi_id and co_no=v_co_no and asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.510.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_大宗交易持仓表][{成交数量},{成交价格},{公允价格},{解禁日期},{成交日期},{更新次数}][@成交数量#,@成交价格#,@公允价格#,@解禁日期#,@成交日期#,@临时_更新次数#][{持仓序号}=@持仓序号# and {机构编号}=@机构编号# and {资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
    select strike_qty,strike_price,fair_price,release_date,strike_date,update_times into v_strike_qty,v_strike_price,v_fair_price,v_release_date,v_strike_date,v_tmp_update_times from db_pdsecu.tb_pdsepo_block_trade_posi where posi_id=v_posi_id and co_no=v_co_no and asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.510.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@成交数量#,@成交价格#,@公允价格#,@解禁日期#] */
    set v_jour_after_occur_info = concat(v_strike_qty,"|",v_strike_price,"|",v_fair_price,"|",v_release_date,"|");


    /* set @变动后数量# = @成交数量#; */
    set v_occur_end_qty = v_strike_qty;

    /* set @变动后价格# = @成交价格#; */
    set v_occur_end_price = v_strike_price;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_持仓_大宗交易持仓流水表][字段][字段变量][5][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_block_trade_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, occur_qty, occur_end_qty, 
        occur_price, occur_end_price, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_occur_qty, v_occur_end_qty, 
        v_occur_price, v_occur_end_price, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.510.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #差额有变动才 更新交易组持仓、成本金额

    /* if (@变动数量# <>0 or @变动成本金额# <>0) then */
    if (v_occur_qty <>0 or v_occur_cost_amt <>0) then
           #插入时当前数量为变动数量

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

           /* set @成本金额# = @变动成本金额#; */
           set v_cost_amt = v_occur_cost_amt;

           /* set @实现盈亏# = 0; */
           set v_realize_pandl = 0;

           /* set @利息成本金额# = 0; */
           set v_intrst_cost_amt = 0;

           /* set @利息收益# = 0; */
           set v_intrst_pandl = 0;

           /* set @持仓核对差额#=0; */
           set v_posi_qty_check_diff=0;

           /* set @操作菜单# = @菜单编号#; */
           set v_oper_menu_no = v_menu_no;

           /* set @操作功能# = @功能编码#; */
           set v_oper_func_code = v_func_code;

           /* set @操作备注# = "大宗交易持仓、成本金额更新"; */
           set v_oper_remark_info = "大宗交易持仓、成本金额更新";

           /* [获取流水变动][{当前数量},{成本金额}][@变动数量#,@变动成本金额#] */
           set v_jour_occur_field = concat("当前数量","|","成本金额","|");
           set v_jour_occur_info = concat(v_occur_qty,"|",v_occur_cost_amt,"|");


           /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{当前数量}={当前数量}+@变动数量#,{成本金额}={成本金额}+@变动成本金额#][1][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
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
           ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=curr_qty+v_occur_qty,cost_amt=cost_amt+v_occur_cost_amt;
           if v_error_code = "1" then
                       
               SET v_error_code = "pdsecuA.3.510.1";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
               else
                   SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
               end if;
               leave label_pro;
           end if;


           /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量},{成本金额}][@当前数量#,@成本金额#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
           select curr_qty,cost_amt into v_curr_qty,v_cost_amt from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
           if FOUND_ROWS() = 0 then
                       
               SET v_error_code = "pdsecuA.3.510.4";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
               else
                   SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
               end if;
               leave label_pro;
           end if;


           /* [获取流水后信息][@当前数量#,@成本金额#] */
           set v_jour_after_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|");


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
                      
              SET v_error_code = "pdsecuA.3.510.5";
              SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
              leave label_pro;
          end if;

          #set @更新次数# = @交易组更新次数#;  通过查询获得
          #更新资产账户持仓、成本金额

          /* set @当前数量# = @变动数量#; */
          set v_curr_qty = v_occur_qty;

          /* set @成本金额# = @变动成本金额#; */
          set v_cost_amt = v_occur_cost_amt;

          /* [获取流水变动][{当前数量},{成本金额}][@变动数量#,@变动成本金额#] */
          set v_jour_occur_field = concat("当前数量","|","成本金额","|");
          set v_jour_occur_info = concat(v_occur_qty,"|",v_occur_cost_amt,"|");


          /* [插入重复更新][产品证券_持仓_资产账户持仓表][字段][字段变量][{当前数量} = {当前数量} + @变动数量#,{成本金额}={成本金额}+@变动成本金额#][1][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
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
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty + v_occur_qty,cost_amt=cost_amt+v_occur_cost_amt;
          if v_error_code = "1" then
                      
              SET v_error_code = "pdsecuA.3.510.1";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
              end if;
              leave label_pro;
          end if;


          /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{当前数量},{成本金额}][@当前数量#,@成本金额#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
          select curr_qty,cost_amt into v_curr_qty,v_cost_amt from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
          if FOUND_ROWS() = 0 then
                      
              SET v_error_code = "pdsecuA.3.510.4";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
              end if;
              leave label_pro;
          end if;


          /* [获取流水后信息][@当前数量#,@成本金额#] */
          set v_jour_after_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|");


          /* set @变动后数量# = @当前数量#; */
          set v_occur_end_qty = v_curr_qty;

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
                      
              SET v_error_code = "pdsecuA.3.510.5";
              SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
              leave label_pro;
          end if;

    end if;

    /* set @更新次数#=@临时_更新次数#+1; */
    set v_update_times=v_tmp_update_times+1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_occur_qty = v_occur_qty;
    SET p_occur_cost_amt = v_occur_cost_amt;
    SET p_occur_fair_price = v_occur_fair_price;
    SET p_update_times = v_update_times;
    SET p_strike_date = v_strike_date;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取交易组持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetExgpPosiInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetExgpPosiInfo(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_invest_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exch_group_stock_type int,
    OUT p_exch_group_asset_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_pre_settle_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_posi_qty_check_diff decimal(18,2),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
    OUT p_exch_group_update_times int
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_invest_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_invest_type = p_invest_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
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

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{记录序号},{证券类型},{资产类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数}][@交易组持仓序号#,@交易组证券类型#,@交易组资产类型#,@交易组期初数量#,@交易组当前数量#,@交易组待交收数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组持仓核对差额#,@交易组成本金额#,@交易组实现盈亏#,@交易组利息成本金额#,@交易组利息收益#,@交易组更新次数#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@机构编号#,@产品编号#,@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select row_id,stock_type,asset_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times into v_exgp_posi_id,v_exch_group_stock_type,v_exch_group_asset_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_pre_settle_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_posi_qty_check_diff,v_exgp_cost_amt,v_exgp_realize_pandl,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_exch_group_update_times from db_pdsecu.tb_pdsepo_exgp_posi where co_no=v_co_no and pd_no=v_pd_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.511.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exch_group_stock_type = v_exch_group_stock_type;
    SET p_exch_group_asset_type = v_exch_group_asset_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_pre_settle_qty = v_exgp_pre_settle_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_posi_qty_check_diff = v_exgp_posi_qty_check_diff;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_exch_group_update_times = v_exch_group_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取资产账户持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetAsacPosiInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetAsacPosiInfo(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_invest_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_posi_id bigint,
    OUT p_asac_stock_type int,
    OUT p_asac_asset_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_pre_settle_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_posi_qty_check_diff decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_invest_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_posi_id bigint;
    declare v_asac_stock_type int;
    declare v_asac_asset_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_pre_settle_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_posi_qty_check_diff decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_asac_update_times int;

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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_invest_type = p_invest_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_posi_id = 0;
    SET v_asac_stock_type = 0;
    SET v_asac_asset_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_pre_settle_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_posi_qty_check_diff = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_asac_update_times = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{记录序号},{证券类型},{资产类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数}][@资产账户持仓序号#,@资产账户证券类型#,@资产账户资产类型#,@资产账户期初数量#,@资产账户当前数量#,@资产账户待交收数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户持仓核对差额#,@资产账户成本金额#,@资产账户实现盈亏#,@资产账户利息成本金额#,@资产账户利息收益#,@资产账户更新次数#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户编号} = @资产账户编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@机构编号#,@产品编号#,@资产账户编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select row_id,stock_type,asset_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times into v_asac_posi_id,v_asac_stock_type,v_asac_asset_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_pre_settle_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_posi_qty_check_diff,v_asac_cost_amt,v_asac_realize_pandl,v_asac_intrst_cost_amt,v_asac_intrst_pandl,v_asac_update_times from db_pdsecu.tb_pdsepo_asac_posi where co_no=v_co_no and pd_no=v_pd_no and asset_acco_no = v_asset_acco_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.512.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_stock_type = v_asac_stock_type;
    SET p_asac_asset_type = v_asac_asset_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_pre_settle_qty = v_asac_pre_settle_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_posi_qty_check_diff = v_asac_posi_qty_check_diff;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_asac_update_times = v_asac_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_新增大宗交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_AddBlockTradeposi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_AddBlockTradeposi(
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
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_fair_price decimal(16,9),
    IN p_strike_date int,
    IN p_release_date int,
    IN p_menu_no int,
    IN p_deal_status varchar(2),
    IN p_oper_remark_info varchar(255),
    IN p_invest_type int,
    IN p_stock_type int,
    IN p_asset_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_occur_qty decimal(18,2),
    OUT p_occur_cost_amt decimal(18,4),
    OUT p_update_times int,
    OUT p_posi_id bigint
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
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_strike_date int;
    declare v_release_date int;
    declare v_menu_no int;
    declare v_deal_status varchar(2);
    declare v_oper_remark_info varchar(255);
    declare v_invest_type int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_occur_qty decimal(18,2);
    declare v_occur_cost_amt decimal(18,4);
    declare v_update_times int;
    declare v_posi_id bigint;
    declare v_occur_price decimal(16,9);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_end_qty decimal(18,2);
    declare v_occur_end_price decimal(16,9);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_curr_qty decimal(18,2);
    declare v_begin_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_busi_flag int;

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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_fair_price = p_fair_price;
    SET v_strike_date = p_strike_date;
    SET v_release_date = p_release_date;
    SET v_menu_no = p_menu_no;
    SET v_deal_status = p_deal_status;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_invest_type = p_invest_type;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_occur_qty = 0;
    SET v_occur_cost_amt = 0;
    SET v_update_times = 1;
    SET v_posi_id = 0;
    SET v_occur_price = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_occur_end_qty = 0;
    SET v_occur_end_price = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_curr_qty = 0;
    SET v_begin_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_busi_flag = 0;

    
    label_pro:BEGIN
    

    /* set @持仓序号# =0; */
    set v_posi_id =0;

    /* set @变动数量# = @成交数量#; */
    set v_occur_qty = v_strike_qty;

    /* set @变动成本金额# = @成交价格#*@成交数量#; */
    set v_occur_cost_amt = v_strike_price*v_strike_qty;

    /* set @变动价格# = @成交价格#; */
    set v_occur_price = v_strike_price;

    /* [获取流水变动][{机构编号},{产品编号},{资产账户编号},{交易组编号},{市场编号},{股东代码编号},{证券代码编号},{成交数量},{成交价格},{公允价格},{成交日期},{解禁日期},{处理状态}][@机构编号#,@产品编号#,@资产账户编号#,@交易组编号#,@市场编号#,@股东代码编号#,@证券代码编号#,@成交数量#,@成交价格#,@公允价格#,@成交日期#,@解禁日期#,@处理状态#] */
    set v_jour_occur_field = concat("机构编号","|","产品编号","|","资产账户编号","|","交易组编号","|","市场编号","|","股东代码编号","|","证券代码编号","|","成交数量","|","成交价格","|","公允价格","|","成交日期","|","解禁日期","|","处理状态","|");
    set v_jour_occur_info = concat(v_co_no,"|",v_pd_no,"|",v_asset_acco_no,"|",v_exch_group_no,"|",v_exch_no,"|",v_stock_acco_no,"|",v_stock_code_no,"|",v_strike_qty,"|",v_strike_price,"|",v_fair_price,"|",v_strike_date,"|",v_release_date,"|",v_deal_status,"|");


    /* [插入表记录][产品证券_持仓_大宗交易持仓表][字段][字段变量][1][@机构编号#,@产品编号#,@市场编号#,@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_block_trade_posi(
        create_date, create_time, update_date, 
        update_time, update_times, posi_id, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        stock_acco_no, stock_code_no, strike_qty, strike_price, 
        fair_price, strike_date, release_date, deal_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_posi_id, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_strike_qty, v_strike_price, 
        v_fair_price, v_strike_date, v_release_date, v_deal_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.513.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","市场编号=",v_exch_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #目前获取表记录的方法，后续高并发可能考虑修改

    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;

    #更新持仓序号

    /* [更新表记录][产品证券_持仓_大宗交易持仓表][{持仓序号}=@记录序号#][{记录序号}=@记录序号# and {机构编号}=@机构编号#  and {产品编号}=@产品编号# and {市场编号} =@市场编号# and {资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {成交日期}=@成交日期#][2][@机构编号#,@产品编号#,@市场编号#,@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_block_trade_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, posi_id=v_row_id where row_id=v_row_id and co_no=v_co_no  and pd_no=v_pd_no and exch_no =v_exch_no and asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and strike_date=v_strike_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.513.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","市场编号=",v_exch_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","市场编号=",v_exch_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_大宗交易持仓表][{持仓序号},{更新次数},{股东代码编号},{证券代码编号},{成交数量},{成交价格},{公允价格},{解禁日期},{处理状态}][@持仓序号#,@更新次数#,@股东代码编号#,@证券代码编号#,@成交数量#,@成交价格#,@公允价格#,@解禁日期#,@处理状态#][{持仓序号}=@记录序号# and {机构编号}=@机构编号#  and {产品编号}=@产品编号# and {市场编号} =@市场编号# and {资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {成交日期}=@成交日期#][4][@机构编号#,@产品编号#,@市场编号#,@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#] */
    select posi_id,update_times,stock_acco_no,stock_code_no,strike_qty,strike_price,fair_price,release_date,deal_status into v_posi_id,v_update_times,v_stock_acco_no,v_stock_code_no,v_strike_qty,v_strike_price,v_fair_price,v_release_date,v_deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where posi_id=v_row_id and co_no=v_co_no  and pd_no=v_pd_no and exch_no =v_exch_no and asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and strike_date=v_strike_date limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.513.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","市场编号=",v_exch_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","市场编号=",v_exch_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@机构编号#,@产品编号#,@资产账户编号#,@交易组编号#,@市场编号#,@股东代码编号#,@证券代码编号#,@成交数量#,@成交价格#,@公允价格#,@成交日期#,@解禁日期#,@处理状态#] */
    set v_jour_after_occur_info = concat(v_co_no,"|",v_pd_no,"|",v_asset_acco_no,"|",v_exch_group_no,"|",v_exch_no,"|",v_stock_acco_no,"|",v_stock_code_no,"|",v_strike_qty,"|",v_strike_price,"|",v_fair_price,"|",v_strike_date,"|",v_release_date,"|",v_deal_status,"|");


    /* set @变动后数量# = @成交数量#; */
    set v_occur_end_qty = v_strike_qty;

    /* set @变动后价格# = @成交价格#; */
    set v_occur_end_price = v_strike_price;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_持仓_大宗交易持仓流水表][字段][字段变量][5][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_block_trade_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, occur_qty, occur_end_qty, 
        occur_price, occur_end_price, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_occur_qty, v_occur_end_qty, 
        v_occur_price, v_occur_end_price, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.513.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #更新交易组持仓、成本金额
           #插入时当前数量为变动数量

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

    /* set @成本金额# = @变动成本金额#; */
    set v_cost_amt = v_occur_cost_amt;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利息成本金额# = 0; */
    set v_intrst_cost_amt = 0;

    /* set @利息收益# = 0; */
    set v_intrst_pandl = 0;

    /* set @持仓核对差额#=0; */
    set v_posi_qty_check_diff=0;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "大宗交易持仓、成本金额更新"; */
    set v_oper_remark_info = "大宗交易持仓、成本金额更新";

    /* [获取流水变动][{当前数量},{成本金额}][@变动数量#,@变动成本金额#] */
    set v_jour_occur_field = concat("当前数量","|","成本金额","|");
    set v_jour_occur_info = concat(v_occur_qty,"|",v_occur_cost_amt,"|");


    /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{当前数量} = {当前数量} + @变动数量#,{成本金额}={成本金额}+@变动成本金额#][1][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty + v_occur_qty,cost_amt=cost_amt+v_occur_cost_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.513.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量},{成本金额}][@当前数量#,@成本金额#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select curr_qty,cost_amt into v_curr_qty,v_cost_amt from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.513.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前数量#,@成本金额#] */
    set v_jour_after_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|");


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
                
        SET v_error_code = "pdsecuA.3.513.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #set @更新次数# = @交易组更新次数#;  通过查询获得
    #更新资产账户持仓、成本金额

    /* set @当前数量# = @变动数量#; */
    set v_curr_qty = v_occur_qty;

    /* set @成本金额# = @变动成本金额#; */
    set v_cost_amt = v_occur_cost_amt;

    /* [获取流水变动][{当前数量},{成本金额}][@变动数量#,@变动成本金额#] */
    set v_jour_occur_field = concat("当前数量","|","成本金额","|");
    set v_jour_occur_info = concat(v_occur_qty,"|",v_occur_cost_amt,"|");


    /* [插入重复更新][产品证券_持仓_资产账户持仓表][字段][字段变量][{当前数量}={当前数量}+@变动数量#,{成本金额}={成本金额}+@变动成本金额#][1][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=curr_qty+v_occur_qty,cost_amt=cost_amt+v_occur_cost_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.513.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{当前数量},{成本金额}][@当前数量#,@成本金额#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select curr_qty,cost_amt into v_curr_qty,v_cost_amt from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.513.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前数量#,@成本金额#] */
    set v_jour_after_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|");


    /* set @变动后数量# = @当前数量#; */
    set v_occur_end_qty = v_curr_qty;

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
                
        SET v_error_code = "pdsecuA.3.513.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_occur_qty = v_occur_qty;
    SET p_occur_cost_amt = v_occur_cost_amt;
    SET p_update_times = v_update_times;
    SET p_posi_id = v_posi_id;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_删除大宗交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_DeleteBlockTradeposi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_DeleteBlockTradeposi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_posi_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_menu_no int,
    IN p_oper_remark_info varchar(255),
    IN p_invest_type int,
    IN p_stock_type int,
    IN p_asset_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_occur_qty decimal(18,2),
    OUT p_occur_cost_amt decimal(18,4),
    OUT p_update_times int,
    OUT p_strike_date int
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
    declare v_posi_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_menu_no int;
    declare v_oper_remark_info varchar(255);
    declare v_invest_type int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_occur_qty decimal(18,2);
    declare v_occur_cost_amt decimal(18,4);
    declare v_update_times int;
    declare v_strike_date int;
    declare v_table_row_id bigint;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_release_date int;
    declare v_deal_status varchar(2);
    declare v_tmp_update_times int;
    declare v_occur_price decimal(16,9);
    declare v_table_field_value varchar(10000);
    declare v_table_uni_index_value varchar(10000);
    declare v_table_name varchar(64);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_end_qty decimal(18,2);
    declare v_occur_end_price decimal(16,9);
    declare v_curr_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_busi_flag int;

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
    SET v_posi_id = p_posi_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_menu_no = p_menu_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_invest_type = p_invest_type;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_occur_qty = 0;
    SET v_occur_cost_amt = 0;
    SET v_update_times = 1;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_table_row_id = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_fair_price = 0;
    SET v_release_date = 0;
    SET v_deal_status = "0";
    SET v_tmp_update_times = 1;
    SET v_occur_price = 0;
    SET v_table_field_value = " ";
    SET v_table_uni_index_value = " ";
    SET v_table_name = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_jour_after_occur_info = " ";
    SET v_occur_end_qty = 0;
    SET v_occur_end_price = 0;
    SET v_curr_qty = 0;
    SET v_cost_amt = 0;
    SET v_busi_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_持仓_大宗交易持仓表][{记录序号},{资产账户编号},{股东代码编号},{成交数量},{成交价格},{公允价格},{成交日期},{解禁日期},{处理状态},{更新次数}][@表记录序号#,@资产账户编号#,@股东代码编号#,@成交数量#,@成交价格#,@公允价格#,@成交日期#,@解禁日期#,@处理状态#,@临时_更新次数#][{机构编号}=@机构编号#  and {产品编号}=@产品编号# and {市场编号} =@市场编号# and {交易组编号}=@交易组编号# and {持仓序号}=@持仓序号#][4][@机构编号#,@产品编号#,@市场编号#,@交易组编号#,@持仓序号#,@证券代码编号#] */
    select row_id,asset_acco_no,stock_acco_no,strike_qty,strike_price,fair_price,strike_date,release_date,deal_status,update_times into v_table_row_id,v_asset_acco_no,v_stock_acco_no,v_strike_qty,v_strike_price,v_fair_price,v_strike_date,v_release_date,v_deal_status,v_tmp_update_times from db_pdsecu.tb_pdsepo_block_trade_posi where co_no=v_co_no  and pd_no=v_pd_no and exch_no =v_exch_no and exch_group_no=v_exch_group_no and posi_id=v_posi_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.514.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","市场编号=",v_exch_no,",","交易组编号=",v_exch_group_no,",","持仓序号=",v_posi_id,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","市场编号=",v_exch_no,",","交易组编号=",v_exch_group_no,",","持仓序号=",v_posi_id,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* set @变动数量# = 0-@成交数量#; */
    set v_occur_qty = 0-v_strike_qty;

    /* set @变动成本金额# = 0-(@成交价格#*@成交数量#); */
    set v_occur_cost_amt = 0-(v_strike_price*v_strike_qty);

    /* set @变动价格# = 0-@成交价格#; */
    set v_occur_price = 0-v_strike_price;
    #删除流水记录

    /* set @表字段值# =  concat("|持仓序号:",@持仓序号#,"|机构编号:",@机构编号#,"|产品编号:",@产品编号#,"|资产账户编号:",@资产账户编号#,"|交易组编号:",@交易组编号#,"|市场编号:",@市场编号#,"|股东代码编号:",@股东代码编号#,"|证券代码编号:",@证券代码编号#,"|成交数量:",@成交数量#,"|成交价格:",@成交价格#,"|公允价格:",@公允价格#,"|成交日期:",@成交日期#,"|解禁日期:",@解禁日期#,"|处理状态:",@处理状态#); */
    set v_table_field_value =  concat("|持仓序号:",v_posi_id,"|机构编号:",v_co_no,"|产品编号:",v_pd_no,"|资产账户编号:",v_asset_acco_no,"|交易组编号:",v_exch_group_no,"|市场编号:",v_exch_no,"|股东代码编号:",v_stock_acco_no,"|证券代码编号:",v_stock_code_no,"|成交数量:",v_strike_qty,"|成交价格:",v_strike_price,"|公允价格:",v_fair_price,"|成交日期:",v_strike_date,"|解禁日期:",v_release_date,"|处理状态:",v_deal_status);

    /* set @表唯一索引值# = concat("|持仓序号:",@持仓序号#); */
    set v_table_uni_index_value = concat("|持仓序号:",v_posi_id);

    /* set @数据表名称# = "tb_pdsepo_block_trade_posi"; */
    set v_table_name = "tb_pdsepo_block_trade_posi";

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_账户_产品证券库删除流水表][字段][字段变量][5][@数据表名称#, @持仓序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_pdsecu_delete_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, table_name, 
        table_row_id, table_field_value, table_uni_index_value) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_table_name, 
        v_table_row_id, v_table_field_value, v_table_uni_index_value);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.514.5";
        SET v_error_info =  CONCAT(concat("数据表名称=",v_table_name,","," 持仓序号=", v_posi_id),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水变动][{持仓序号},{机构编号},{产品编号},{资产账户编号},{交易组编号},{市场编号},{股东代码编号},{证券代码编号},{成交数量},{成交价格},{公允价格},{成交日期},{解禁日期},{处理状态},{更新次数}][@持仓序号#,@机构编号#,@产品编号#,@资产账户编号#,@交易组编号#,@市场编号#,@股东代码编号#,@证券代码编号#,@成交数量#,@成交价格#,@公允价格#,@成交日期#,@解禁日期#,@处理状态#,@更新次数#] */
    set v_jour_occur_field = concat("持仓序号","|","机构编号","|","产品编号","|","资产账户编号","|","交易组编号","|","市场编号","|","股东代码编号","|","证券代码编号","|","成交数量","|","成交价格","|","公允价格","|","成交日期","|","解禁日期","|","处理状态","|","更新次数","|");
    set v_jour_occur_info = concat(v_posi_id,"|",v_co_no,"|",v_pd_no,"|",v_asset_acco_no,"|",v_exch_group_no,"|",v_exch_no,"|",v_stock_acco_no,"|",v_stock_code_no,"|",v_strike_qty,"|",v_strike_price,"|",v_fair_price,"|",v_strike_date,"|",v_release_date,"|",v_deal_status,"|",v_update_times,"|");


    /* [删除表记录][产品证券_持仓_大宗交易持仓表][{持仓序号}=@持仓序号# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {市场编号}=@市场编号#][3][@机构编号#,@产品编号#,@市场编号#,@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#] */
    delete from db_pdsecu.tb_pdsepo_block_trade_posi 
        where posi_id=v_posi_id and co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and exch_no=v_exch_no;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.3.514.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","市场编号=",v_exch_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","市场编号=",v_exch_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    #更新持仓序号

    /* [获取流水后信息][@持仓序号#,@机构编号#,@产品编号#,@资产账户编号#,@交易组编号#,@市场编号#,@股东代码编号#,@证券代码编号#,0,0,0,0,0,"0",0] */
    set v_jour_after_occur_info = concat(v_posi_id,"|",v_co_no,"|",v_pd_no,"|",v_asset_acco_no,"|",v_exch_group_no,"|",v_exch_no,"|",v_stock_acco_no,"|",v_stock_code_no,"|",0,"|",0,"|",0,"|",0,"|",0,"|","0","|",0,"|");


    /* set @变动后数量# = 0; */
    set v_occur_end_qty = 0;

    /* set @变动后价格# = 0; */
    set v_occur_end_price = 0;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_持仓_大宗交易持仓流水表][字段][字段变量][5][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_block_trade_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, occur_qty, occur_end_qty, 
        occur_price, occur_end_price, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_occur_qty, v_occur_end_qty, 
        v_occur_price, v_occur_end_price, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.514.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #更新交易组持仓、成本金额

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "大宗交易持仓删除及成本金额更新"; */
    set v_oper_remark_info = "大宗交易持仓删除及成本金额更新";

    /* [获取流水变动][{当前数量},{成本金额}][@变动数量#,@变动成本金额#] */
    set v_jour_occur_field = concat("当前数量","|","成本金额","|");
    set v_jour_occur_info = concat(v_occur_qty,"|",v_occur_cost_amt,"|");


    /* [更新表记录][产品证券_持仓_交易组持仓表][{当前数量}={当前数量}+@变动数量#,{成本金额}={成本金额}+@变动成本金额#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][1][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty+v_occur_qty,cost_amt=cost_amt+v_occur_cost_amt where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.514.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量},{成本金额}][@当前数量#,@成本金额#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select curr_qty,cost_amt into v_curr_qty,v_cost_amt from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.514.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前数量#,@成本金额#] */
    set v_jour_after_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|");


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
                
        SET v_error_code = "pdsecuA.3.514.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #set @更新次数# = @交易组更新次数#;  通过查询获得
    #更新资产账户持仓、成本金额

    /* set @当前数量# = @变动数量#; */
    set v_curr_qty = v_occur_qty;

    /* set @成本金额# = @变动成本金额#; */
    set v_cost_amt = v_occur_cost_amt;

    /* [获取流水变动][{当前数量},{成本金额}][@变动数量#,@变动成本金额#] */
    set v_jour_occur_field = concat("当前数量","|","成本金额","|");
    set v_jour_occur_info = concat(v_occur_qty,"|",v_occur_cost_amt,"|");


    /* [更新表记录][产品证券_持仓_资产账户持仓表][{当前数量}={当前数量}+@变动数量#,{成本金额}={成本金额}+@变动成本金额#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][1][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty+v_occur_qty,cost_amt=cost_amt+v_occur_cost_amt where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.514.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{当前数量},{成本金额}][@当前数量#,@成本金额#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select curr_qty,cost_amt into v_curr_qty,v_cost_amt from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.514.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前数量#,@成本金额#] */
    set v_jour_after_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|");


    /* set @变动后数量# = @当前数量#; */
    set v_occur_end_qty = v_curr_qty;

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
                
        SET v_error_code = "pdsecuA.3.514.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数#=@临时_更新次数#+1; */
    set v_update_times=v_tmp_update_times+1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_occur_qty = v_occur_qty;
    SET p_occur_cost_amt = v_occur_cost_amt;
    SET p_update_times = v_update_times;
    SET p_strike_date = v_strike_date;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询大宗交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryBlockTradeposi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryBlockTradeposi(
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
    IN p_begin_date int,
    IN p_end_date int,
    IN p_deal_status_str varchar(64),
    IN p_row_count int,
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_deal_status_str varchar(64);
    declare v_row_count int;
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_deal_status_str = p_deal_status_str;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_大宗交易持仓表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{持仓序号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{成交数量},{成交价格},{公允价格},{成交日期},{解禁日期},{处理状态}][(@机构编号# =0 or {机构编号} = @机构编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and (@市场编号# = 0 or {市场编号} = @市场编号#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and  (({成交日期} between @开始日期# and @结束日期#)or (@开始日期#=0 and @结束日期#=0)) and instr(@处理状态串#,concat(";",{处理状态},";"))>0 and (@交易组编号权限串# = ' ' or instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0) and (@产品编号权限串# = ' ' or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select create_date,create_time,update_date,update_time,update_times,posi_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,strike_qty,strike_price,fair_price,strike_date,release_date,deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where (v_co_no =0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_exch_no = 0 or exch_no = v_exch_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and  ((strike_date between v_begin_date and v_end_date)or (v_begin_date=0 and v_end_date=0)) and instr(v_deal_status_str,concat(";",deal_status,";"))>0 and (v_exch_group_no_rights_str = ' ' or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and (v_pd_no_rights_str = ' ' or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) order by row_id;
    else
        select create_date,create_time,update_date,update_time,update_times,posi_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,strike_qty,strike_price,fair_price,strike_date,release_date,deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where (v_co_no =0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_exch_no = 0 or exch_no = v_exch_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and  ((strike_date between v_begin_date and v_end_date)or (v_begin_date=0 and v_end_date=0)) and instr(v_deal_status_str,concat(";",deal_status,";"))>0 and (v_exch_group_no_rights_str = ' ' or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and (v_pd_no_rights_str = ' ' or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询历史大宗交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryBlockTradeposi_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryBlockTradeposi_His(
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
    IN p_begin_date int,
    IN p_end_date int,
    IN p_deal_status_str varchar(64),
    IN p_row_count int,
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_deal_status_str varchar(64);
    declare v_row_count int;
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_deal_status_str = p_deal_status_str;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_历史大宗交易持仓表][{创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{持仓序号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{成交数量},{成交价格},{公允价格},{成交日期},{解禁日期},{处理状态}][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and  (({初始化日期} between @开始日期# and @结束日期#)or (@开始日期#=0 and @结束日期#=0))  and instr(@处理状态串#,concat(";",{处理状态},";"))>0 and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select create_date,create_time,update_date,update_time,init_date,posi_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,strike_qty,strike_price,fair_price,strike_date,release_date,deal_status from db_pdsecu_his.tb_pdsepo_block_trade_posi_his where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and  ((init_date between v_begin_date and v_end_date)or (v_begin_date=0 and v_end_date=0))  and instr(v_deal_status_str,concat(";",deal_status,";"))>0 and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 order by row_id;
    else
        select create_date,create_time,update_date,update_time,init_date,posi_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,strike_qty,strike_price,fair_price,strike_date,release_date,deal_status from db_pdsecu_his.tb_pdsepo_block_trade_posi_his where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and  ((init_date between v_begin_date and v_end_date)or (v_begin_date=0 and v_end_date=0))  and instr(v_deal_status_str,concat(";",deal_status,";"))>0 and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_修改资产账户持仓期初数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_ModifyAsacPosiBeginQty;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_ModifyAsacPosiBeginQty(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_invest_type int,
    IN p_begin_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_posi_id bigint,
    OUT p_asac_stock_type int,
    OUT p_asac_asset_type int,
    OUT p_asac_invest_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_pre_settle_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_posi_qty_check_diff decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_begin_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_posi_id bigint;
    declare v_asac_stock_type int;
    declare v_asac_asset_type int;
    declare v_asac_invest_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_pre_settle_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_posi_qty_check_diff decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_update_times int;
    declare v_tmp_begin_qty decimal(18,2);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_asac_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_end_qty decimal(18,2);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_invest_type = p_invest_type;
    SET v_begin_qty = p_begin_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_posi_id = 0;
    SET v_asac_stock_type = 0;
    SET v_asac_asset_type = 0;
    SET v_asac_invest_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_pre_settle_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_posi_qty_check_diff = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_update_times = 1;
    SET v_tmp_begin_qty = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_asac_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_qty = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{期初数量}][@临时_期初数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select begin_qty into v_tmp_begin_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.601.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水变动][{期初数量}][@期初数量#] */
    set v_jour_occur_field = concat("期初数量","|");
    set v_jour_occur_info = concat(v_begin_qty,"|");


    /* [更新表记录][产品证券_持仓_资产账户持仓表][{期初数量} = {期初数量} + @期初数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty = begin_qty + v_begin_qty where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.601.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{成本金额}, {利息成本金额},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@成本金额#, @利息成本金额#,@资产账户持仓序号#,@资产账户证券类型#,@资产账户资产类型#,@资产账户投资类型#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户持仓核对差额#,@资产账户成本金额#,@资产账户实现盈亏#,@资产账户利息成本金额#,@资产账户利息收益#,@资产账户更新次数#,@资产账户待交收数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select cost_amt, intrst_cost_amt,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_cost_amt, v_intrst_cost_amt,v_asac_posi_id,v_asac_stock_type,v_asac_asset_type,v_asac_invest_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_posi_qty_check_diff,v_asac_cost_amt,v_asac_realize_pandl,v_asac_intrst_cost_amt,v_asac_intrst_pandl,v_asac_update_times,v_asac_pre_settle_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.601.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@资产账户期初数量#] */
    set v_jour_after_occur_info = concat(v_asac_begin_qty,"|");


    /* set @业务标志# =《业务标志-修改期初数量》 ; */
    set v_busi_flag =1106001 ;

    /* set @变动数量# = @期初数量#; */
    set v_occur_qty = v_begin_qty;

    /* set @变动后数量# = @资产账户期初数量#; */
    set v_occur_end_qty = v_asac_begin_qty;

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
                
        SET v_error_code = "pdsecuA.3.601.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_stock_type = v_asac_stock_type;
    SET p_asac_asset_type = v_asac_asset_type;
    SET p_asac_invest_type = v_asac_invest_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_pre_settle_qty = v_asac_pre_settle_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_posi_qty_check_diff = v_asac_posi_qty_check_diff;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_修改交易组持仓期初数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_ModifyExgpPosiBeginQty;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_ModifyExgpPosiBeginQty(
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
    IN p_invest_type int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_begin_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exch_group_stock_type int,
    OUT p_exch_group_asset_type int,
    OUT p_exgp_invest_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_pre_settle_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_posi_qty_check_diff decimal(18,2),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
    OUT p_update_times int,
    OUT p_occur_qty decimal(18,2)
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
    declare v_invest_type int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_begin_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
    declare v_exch_group_asset_type int;
    declare v_exgp_invest_type int;
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
    declare v_update_times int;
    declare v_occur_qty decimal(18,2);
    declare v_tmp_begin_qty decimal(18,2);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_exch_group_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_end_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_invest_type = p_invest_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_begin_qty = p_begin_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
    SET v_exch_group_asset_type = 0;
    SET v_exgp_invest_type = 0;
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
    SET v_update_times = 1;
    SET v_occur_qty = 0;
    SET v_tmp_begin_qty = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_exch_group_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_occur_end_qty = 0;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{期初数量}][@临时_期初数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select begin_qty into v_tmp_begin_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.602.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@期初数量# = @临时_期初数量#][2][concat("修改变动数量不能为0！","期初数量：",@期初数量# )] */
    if v_begin_qty = v_tmp_begin_qty then
        
        SET v_error_code = "pdsecuA.3.602.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("修改变动数量不能为0！","期初数量：",v_begin_qty ),"#",v_mysql_message);
        else
            SET v_error_info = concat("修改变动数量不能为0！","期初数量：",v_begin_qty );
        end if;
        leave label_pro;
    end if;


    /* [获取流水变动][{期初数量}][@期初数量#-@临时_期初数量#] */
    set v_jour_occur_field = concat("期初数量","|");
    set v_jour_occur_info = concat(v_begin_qty-v_tmp_begin_qty,"|");


    /* [更新表记录][产品证券_持仓_交易组持仓表][{期初数量} =  @期初数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty =  v_begin_qty where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.602.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{成本金额},{利息成本金额},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@成本金额#,@利息成本金额#,@交易组持仓序号#,@交易组证券类型#,@交易组资产类型#,@交易组投资类型#,@交易组期初数量#,@交易组当前数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组持仓核对差额#,@交易组成本金额#,@交易组实现盈亏#,@交易组利息成本金额#,@交易组利息收益#,@交易组更新次数#,@交易组待交收数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select cost_amt,intrst_cost_amt,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_cost_amt,v_intrst_cost_amt,v_exgp_posi_id,v_exch_group_stock_type,v_exch_group_asset_type,v_exgp_invest_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_posi_qty_check_diff,v_exgp_cost_amt,v_exgp_realize_pandl,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_exch_group_update_times,v_exgp_pre_settle_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.602.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@期初数量#] */
    set v_jour_after_occur_info = concat(v_begin_qty,"|");


    /* set @变动数量# = @期初数量#-@临时_期初数量#; */
    set v_occur_qty = v_begin_qty-v_tmp_begin_qty;

    /* set @变动后数量# = @交易组期初数量#; */
    set v_occur_end_qty = v_exch_group_begin_qty;

    /* set @业务标志# =《业务标志-修改期初数量》 ; */
    set v_busi_flag =1106001 ;

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
                
        SET v_error_code = "pdsecuA.3.602.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exch_group_stock_type = v_exch_group_stock_type;
    SET p_exch_group_asset_type = v_exch_group_asset_type;
    SET p_exgp_invest_type = v_exgp_invest_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_pre_settle_qty = v_exgp_pre_settle_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_posi_qty_check_diff = v_exgp_posi_qty_check_diff;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_update_times = v_update_times;
    SET p_occur_qty = v_occur_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_同步场外基金资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_SyncOffSeFundOutPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_SyncOffSeFundOutPosi(
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
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_out_cost_price decimal(16,9),
    IN p_out_curr_qty decimal(18,2),
    IN p_out_enable_qty decimal(18,2),
    IN p_out_frozen_qty decimal(18,2),
    IN p_out_unfroz_qty decimal(18,2),
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_out_cost_price decimal(16,9);
    declare v_out_curr_qty decimal(18,2);
    declare v_out_enable_qty decimal(18,2);
    declare v_out_frozen_qty decimal(18,2);
    declare v_out_unfroz_qty decimal(18,2);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_out_cost_price = p_out_cost_price;
    SET v_out_curr_qty = p_out_curr_qty;
    SET v_out_enable_qty = p_out_enable_qty;
    SET v_out_frozen_qty = p_out_frozen_qty;
    SET v_out_unfroz_qty = p_out_unfroz_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][产品证券_持仓_外部资产账户持仓表][字段][字段变量][1][@外部账号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_out_asac_posi(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, out_acco, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_name, out_cost_price, out_curr_qty, 
        out_enable_qty, out_frozen_qty, out_unfroz_qty) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_no, v_stock_acco_no, v_stock_acco, v_stock_code_no, 
        v_stock_code, v_stock_name, v_out_cost_price, v_out_curr_qty, 
        v_out_enable_qty, v_out_frozen_qty, v_out_unfroz_qty);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.603.1";
        SET v_error_info =  CONCAT(concat("外部账号=",v_out_acco),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取场外基金资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetOffSeFundAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetOffSeFundAsacPosi(
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
    

    /* [获取表全记录][产品证券_持仓_场外基金资产账户持仓表][字段][1=1] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, out_acco, 
        exch_no, stock_acco, stock_code, out_cost_price, 
        out_curr_qty, out_enable_qty, out_frozen_qty, out_unfroz_qty from db_pdsecu.tb_pdsepo_off_side_fund_asac_posi where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取场外基金代码映射
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetOffSeFundCodeMapping;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetOffSeFundCodeMapping(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_link_row_id bigint,
    OUT p_stock_name varchar(64)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_link_row_id bigint;
    declare v_stock_name varchar(64);
    declare v_row_id bigint;
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
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_link_row_id = 0;
    SET v_stock_name = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_持仓_场外基金代码映射表][字段][字段变量][{证券代码} = @证券代码#][1][@证券代码#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, link_row_id, 
        stock_code, stock_name into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_link_row_id, 
        v_stock_code, v_stock_name from db_pdsecu.tb_pdsepo_off_side_fund_code_mapping where stock_code = v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.605.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_link_row_id = v_link_row_id;
    SET p_stock_name = v_stock_name;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_清空外部资产账户持仓表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_ClearOutAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_ClearOutAsacPosi(
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
    

    /* [清空表记录][产品证券_持仓_外部资产账户持仓表] */
    truncate table db_pdsecu.tb_pdsepo_out_asac_posi;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_转入外部资产账户持仓记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_AddOutAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_AddOutAsacPosi(
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
    IN p_exch_group_no int,
    IN p_asac_busi_config_str varchar(64),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_out_cost_price decimal(16,9),
    IN p_out_curr_qty decimal(18,2),
    IN p_out_enable_qty decimal(18,2),
    IN p_out_frozen_qty decimal(18,2),
    IN p_out_unfroz_qty decimal(18,2),
    IN p_curr_qty decimal(18,2),
    IN p_avail_qty decimal(18,2),
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
    declare v_exch_group_no int;
    declare v_asac_busi_config_str varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_out_cost_price decimal(16,9);
    declare v_out_curr_qty decimal(18,2);
    declare v_out_enable_qty decimal(18,2);
    declare v_out_frozen_qty decimal(18,2);
    declare v_out_unfroz_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_acco_curr_qty decimal(18,2);
    declare v_acco_avail_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_deal_flag int;
    declare v_asset_sync_flag int;
    declare v_add_pledge_to_bond int;
    declare v_remark_info varchar(255);
    declare v_acco_curr_qty_diff decimal(18,2);
    declare v_acco_avail_qty_diff decimal(18,2);
    declare v_out_impawn_qty decimal(18,2);

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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_out_cost_price = p_out_cost_price;
    SET v_out_curr_qty = p_out_curr_qty;
    SET v_out_enable_qty = p_out_enable_qty;
    SET v_out_frozen_qty = p_out_frozen_qty;
    SET v_out_unfroz_qty = p_out_unfroz_qty;
    SET v_curr_qty = p_curr_qty;
    SET v_avail_qty = p_avail_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_acco_curr_qty = 0;
    SET v_acco_avail_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_deal_flag = 0;
    SET v_asset_sync_flag = 0;
    SET v_add_pledge_to_bond = 0;
    SET v_remark_info = " ";
    SET v_acco_curr_qty_diff = 0;
    SET v_acco_avail_qty_diff = 0;
    SET v_out_impawn_qty = 0;

    
    label_pro:BEGIN
    

    /* set @账户当前数量#=@当前数量#; */
    set v_acco_curr_qty=v_curr_qty;

    /* set @账户可用数量#=@可用数量#; */
    set v_acco_avail_qty=v_avail_qty;

    /* [插入重复更新][产品证券_持仓_外部资产账户持仓表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {股东代码编号}=@股东代码编号#, {证券代码编号}=@证券代码编号#, {证券名称}=@证券名称#, {外部成本价}=@外部成本价#, {外部当前数量}=@外部当前数量#, {外部可用数量}=@外部可用数量#, {外部冻结数量}=@外部冻结数量#, {外部解冻数量}=@外部解冻数量#][1][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@股东代码#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_out_asac_posi (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, out_acco, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_name, out_cost_price, out_curr_qty, 
        out_enable_qty, out_frozen_qty, out_unfroz_qty) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_no, v_stock_acco_no, v_stock_acco, v_stock_code_no, 
        v_stock_code, v_stock_name, v_out_cost_price, v_out_curr_qty, 
        v_out_enable_qty, v_out_frozen_qty, v_out_unfroz_qty) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, stock_acco_no=v_stock_acco_no, stock_code_no=v_stock_code_no, stock_name=v_stock_name, out_cost_price=v_out_cost_price, out_curr_qty=v_out_curr_qty, out_enable_qty=v_out_enable_qty, out_frozen_qty=v_out_frozen_qty, out_unfroz_qty=v_out_unfroz_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.607.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;


    /* if @外部当前数量# = 0 then */
    if v_out_curr_qty = 0 then

        /* set @处理标志# = 《处理标志-内部数据》; */
        set v_deal_flag = 3;
    else

        /* set @处理标志# = 《处理标志-未处理》; */
        set v_deal_flag = 2;
    end if;

    /* set @资产是否同步#=cast(substring(@资产账户业务控制配置串#, 12, 1) as SIGNED); */
    set v_asset_sync_flag=cast(substring(v_asac_busi_config_str, 12, 1) as SIGNED);

    /* set @质押数量累加到债券数量#=cast(substring(@资产账户业务控制配置串#, 19, 1) as SIGNED); */
    set v_add_pledge_to_bond=cast(substring(v_asac_busi_config_str, 19, 1) as SIGNED);

    /* set @备注信息# = "外部数据转入"; */
    set v_remark_info = "外部数据转入";

    /* set @账户当前数量差额#=@外部当前数量# - @账户当前数量#; */
    set v_acco_curr_qty_diff=v_out_curr_qty - v_acco_curr_qty;

    /* set @账户可用数量差额#=@外部可用数量# - @账户可用数量#-@账户当前数量差额#; */
    set v_acco_avail_qty_diff=v_out_enable_qty - v_acco_avail_qty-v_acco_curr_qty_diff;

    /* set @外部质押数量# = 0; */
    set v_out_impawn_qty = 0;

    /* if @账户可用数量差额#<>0 then */
    if v_acco_avail_qty_diff<>0 then

        /* set @处理标志# = 《处理标志-未处理》; */
        set v_deal_flag = 2;
    end if;

    /* if (@市场编号#=《市场编号-上海证券交易所》 and @证券代码#='888880') or (@市场编号#=《市场编号-深圳证券交易所》 and @证券代码#='131990') then */
    if (v_exch_no=1 and v_stock_code='888880') or (v_exch_no=2 and v_stock_code='131990') then

        /* set @处理标志# = 《处理标志-内部数据》; */
        set v_deal_flag = 3;

        /* set @外部成本价#=100; */
        set v_out_cost_price=100;
    end if;

    /* [插入重复更新][产品证券_持仓_内外资产账户持仓差异表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {交易组编号}=@交易组编号#, {股东代码编号}=@股东代码编号#, {证券代码编号}=@证券代码编号#, {证券名称}=@证券名称#, {外部成本价}=@外部成本价#, {账户当前数量}=@账户当前数量#, {账户可用数量}=@账户可用数量#, {外部当前数量}=@外部当前数量#, {外部可用数量}=@外部可用数量#, {账户当前数量差额}=@账户当前数量差额#+{外部质押数量}, {账户可用数量差额}=@账户可用数量差额#, {处理标志}=@处理标志#, {资产是否同步}=@资产是否同步#, {备注信息}=@备注信息#][1][@初始化日期#,@通道编号#,@外部账号#,@股东代码#,@市场编号#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_posi_diff (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, stock_name, stock_type, 
        asset_type, out_cost_price, acco_curr_qty, acco_avail_qty, 
        out_curr_qty, out_enable_qty, acco_curr_qty_diff, acco_avail_qty_diff, 
        out_impawn_qty, deal_flag, asset_sync_flag, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_pass_no, 
        v_out_acco, v_exch_no, v_stock_acco_no, v_stock_acco, 
        v_stock_code_no, v_stock_code, v_stock_name, v_stock_type, 
        v_asset_type, v_out_cost_price, v_acco_curr_qty, v_acco_avail_qty, 
        v_out_curr_qty, v_out_enable_qty, v_acco_curr_qty_diff, v_acco_avail_qty_diff, 
        v_out_impawn_qty, v_deal_flag, v_asset_sync_flag, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, exch_group_no=v_exch_group_no, stock_acco_no=v_stock_acco_no, stock_code_no=v_stock_code_no, stock_name=v_stock_name, out_cost_price=v_out_cost_price, acco_curr_qty=v_acco_curr_qty, acco_avail_qty=v_acco_avail_qty, out_curr_qty=v_out_curr_qty, out_enable_qty=v_out_enable_qty, acco_curr_qty_diff=v_acco_curr_qty_diff+out_impawn_qty, acco_avail_qty_diff=v_acco_avail_qty_diff, deal_flag=v_deal_flag, asset_sync_flag=v_asset_sync_flag, remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.607.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","股东代码=",v_stock_acco,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","股东代码=",v_stock_acco,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;

    #质押数量不累加到债券数量上的话 , 那么账户当前数量差额不应该包括外部质押数量

    /* if @质押数量累加到债券数量#<>1 then */
    if v_add_pledge_to_bond<>1 then

        /* [更新表记录][产品证券_持仓_内外资产账户持仓差异表][ {账户当前数量差额}={账户当前数量差额}-{外部质押数量}][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号}=@外部账号# and {股东代码}=@股东代码# and {市场编号}=@市场编号# and {证券代码}=@证券代码#][2][@初始化日期#,@通道编号#,@外部账号#,@股东代码#,@市场编号#,@证券代码#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdsepo_asac_posi_diff set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1,  acco_curr_qty_diff=acco_curr_qty_diff-out_impawn_qty where init_date=v_init_date and pass_no=v_pass_no and out_acco=v_out_acco and stock_acco=v_stock_acco and exch_no=v_exch_no and stock_code=v_stock_code;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.3.607.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","股东代码=",v_stock_acco,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","股东代码=",v_stock_acco,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code);
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

# 原子_产品证券_持仓_批量调整交易组持仓成本
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_BatchUpdateExgpPosiCost;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_BatchUpdateExgpPosiCost(
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
    IN p_stock_acco_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_invest_type int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_cost_amt decimal(18,4),
    IN p_intrst_cost_amt decimal(18,4),
    IN p_trd_cost_amt decimal(18,4),
    IN p_trd_intrst_cost_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exch_group_stock_type int,
    OUT p_exch_group_asset_type int,
    OUT p_exgp_invest_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_pre_settle_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_posi_qty_check_diff decimal(18,2),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
    OUT p_exch_group_update_times int,
    OUT p_asac_posi_id bigint,
    OUT p_asac_stock_type int,
    OUT p_asac_asset_type int,
    OUT p_asac_invest_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_pre_settle_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_posi_qty_check_diff decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_invest_type int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_trd_cost_amt decimal(18,4);
    declare v_trd_intrst_cost_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
    declare v_exch_group_asset_type int;
    declare v_exgp_invest_type int;
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
    declare v_asac_posi_id bigint;
    declare v_asac_stock_type int;
    declare v_asac_asset_type int;
    declare v_asac_invest_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_pre_settle_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_posi_qty_check_diff decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_asac_update_times int;
    declare v_record_count int;
    declare v_tmp_cost_amt decimal(18,4);
    declare v_tmp_intrst_cost_amt decimal(18,4);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_occur_cost_amt decimal(18,4);
    declare v_occur_intrst_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_qty decimal(18,2);
    declare v_occur_end_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_invest_type = p_invest_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_cost_amt = p_cost_amt;
    SET v_intrst_cost_amt = p_intrst_cost_amt;
    SET v_trd_cost_amt = p_trd_cost_amt;
    SET v_trd_intrst_cost_amt = p_trd_intrst_cost_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
    SET v_exch_group_asset_type = 0;
    SET v_exgp_invest_type = 0;
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
    SET v_asac_posi_id = 0;
    SET v_asac_stock_type = 0;
    SET v_asac_asset_type = 0;
    SET v_asac_invest_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_pre_settle_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_posi_qty_check_diff = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_asac_update_times = 0;
    SET v_record_count = 0;
    SET v_tmp_cost_amt = 0;
    SET v_tmp_intrst_cost_amt = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_pandl = 0;
    SET v_occur_cost_amt = 0;
    SET v_occur_intrst_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_occur_qty = 0;
    SET v_occur_end_qty = 0;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][count(1),{成本金额},{利息成本金额}][@记录个数#,@临时_成本金额#,@临时_利息成本金额#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#] */
    select count(1),cost_amt,intrst_cost_amt into v_record_count,v_tmp_cost_amt,v_tmp_intrst_cost_amt from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;


    /* if @记录个数# = 0 then */
    if v_record_count = 0 then
        #管理端 传入的成本金额、利息金额包含交易库。

         /* set @期初数量# =0; */
         set v_begin_qty =0;

         /* set @当前数量# =0; */
         set v_curr_qty =0;

         /* set @待交收数量# =0; */
         set v_pre_settle_qty =0;

         /* set @冻结数量# =0; */
         set v_frozen_qty =0;

         /* set @解冻数量# =0; */
         set v_unfroz_qty =0;

         /* set @持仓核对差额# =0; */
         set v_posi_qty_check_diff =0;

         /* set @实现盈亏# =0; */
         set v_realize_pandl =0;

         /* set @利息收益# =0; */
         set v_intrst_pandl =0;

          /* set @临时_成本金额# =0; */
          set v_tmp_cost_amt =0;

          /* set @临时_利息成本金额# =0; */
          set v_tmp_intrst_cost_amt =0;

          /* set @成本金额# =@成本金额# - @交易库成本金额#; */
          set v_cost_amt =v_cost_amt - v_trd_cost_amt;

          /* set @利息成本金额# =@利息成本金额# - @交易库利息成本金额#; */
          set v_intrst_cost_amt =v_intrst_cost_amt - v_trd_intrst_cost_amt;

          /* set @变动成本金额# = @成本金额#; */
          set v_occur_cost_amt = v_cost_amt;

          /* set @变动利息金额# = @利息成本金额#; */
          set v_occur_intrst_amt = v_intrst_cost_amt;
    else

          /* set @变动成本金额# = @成本金额# - @交易库成本金额# - @临时_成本金额#; */
          set v_occur_cost_amt = v_cost_amt - v_trd_cost_amt - v_tmp_cost_amt;

          /* set @变动利息金额# = @利息成本金额# - @交易库利息成本金额# - @临时_利息成本金额#; */
          set v_occur_intrst_amt = v_intrst_cost_amt - v_trd_intrst_cost_amt - v_tmp_intrst_cost_amt;
    end if;

    /* [获取流水变动][{变动成本金额},{成本金额},{变动利息金额},{利息成本金额}][@变动成本金额#, @成本金额#, @变动利息金额#, @利息成本金额#] */
    set v_jour_occur_field = concat("变动成本金额","|","成本金额","|","变动利息金额","|","利息成本金额","|");
    set v_jour_occur_info = concat(v_occur_cost_amt,"|", v_cost_amt,"|", v_occur_intrst_amt,"|", v_intrst_cost_amt,"|");


    /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{成本金额} = {成本金额} + @变动成本金额#, {利息成本金额} = {利息成本金额} + @变动利息金额#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, cost_amt = cost_amt + v_occur_cost_amt, intrst_cost_amt = intrst_cost_amt + v_occur_intrst_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.608.exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(2,"#",v_mysql_message);
        else
            SET v_error_info = 2;
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{成本金额},{利息成本金额},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@成本金额#,@利息成本金额#,@交易组持仓序号#,@交易组证券类型#,@交易组资产类型#,@交易组投资类型#,@交易组期初数量#,@交易组当前数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组持仓核对差额#,@交易组成本金额#,@交易组实现盈亏#,@交易组利息成本金额#,@交易组利息收益#,@交易组更新次数#,@交易组待交收数量#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select cost_amt,intrst_cost_amt,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_cost_amt,v_intrst_cost_amt,v_exgp_posi_id,v_exch_group_stock_type,v_exch_group_asset_type,v_exgp_invest_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_posi_qty_check_diff,v_exgp_cost_amt,v_exgp_realize_pandl,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_exch_group_update_times,v_exgp_pre_settle_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.608.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@变动成本金额#, @成本金额#, @变动利息金额#, @利息成本金额#] */
    set v_jour_after_occur_info = concat(v_occur_cost_amt,"|", v_cost_amt,"|", v_occur_intrst_amt,"|", v_intrst_cost_amt,"|");


    /* set @变动数量# = 0; */
    set v_occur_qty = 0;

    /* set @变动后数量# = 0; */
    set v_occur_end_qty = 0;

    /* set @业务标志# = 《业务标志-持仓成本调整》; */
    set v_busi_flag = 1105001;

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
                
        SET v_error_code = "pdsecuA.3.608.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #联动修改资产账户持仓成本金额。

    /* [获取流水变动][{变动成本金额},{成本金额},{变动利息金额},{利息成本金额}][@变动成本金额#, @成本金额#, @变动利息金额#, @利息成本金额#] */
    set v_jour_occur_field = concat("变动成本金额","|","成本金额","|","变动利息金额","|","利息成本金额","|");
    set v_jour_occur_info = concat(v_occur_cost_amt,"|", v_cost_amt,"|", v_occur_intrst_amt,"|", v_intrst_cost_amt,"|");


    /* [插入重复更新][产品证券_持仓_资产账户持仓表][字段][字段变量][{成本金额} = {成本金额} + @变动成本金额#, {利息成本金额} = {利息成本金额} + @变动利息金额#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][2][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, cost_amt = cost_amt + v_occur_cost_amt, intrst_cost_amt = intrst_cost_amt + v_occur_intrst_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.608.asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(2,"#",v_mysql_message);
        else
            SET v_error_info = 2;
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{成本金额}, {利息成本金额},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@成本金额#, @利息成本金额#,@资产账户持仓序号#,@资产账户证券类型#,@资产账户资产类型#,@资产账户投资类型#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户持仓核对差额#,@资产账户成本金额#,@资产账户实现盈亏#,@资产账户利息成本金额#,@资产账户利息收益#,@资产账户更新次数#,@资产账户待交收数量#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select cost_amt, intrst_cost_amt,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_cost_amt, v_intrst_cost_amt,v_asac_posi_id,v_asac_stock_type,v_asac_asset_type,v_asac_invest_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_posi_qty_check_diff,v_asac_cost_amt,v_asac_realize_pandl,v_asac_intrst_cost_amt,v_asac_intrst_pandl,v_asac_update_times,v_asac_pre_settle_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.608.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@变动成本金额#, @成本金额#, @变动利息金额#, @利息成本金额#] */
    set v_jour_after_occur_info = concat(v_occur_cost_amt,"|", v_cost_amt,"|", v_occur_intrst_amt,"|", v_intrst_cost_amt,"|");


    /* set @变动数量# = 0; */
    set v_occur_qty = 0;

    /* set @变动后数量# = 0; */
    set v_occur_end_qty = 0;

    /* set @业务标志# = 《业务标志-持仓成本调整》; */
    set v_busi_flag = 1105001;

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
                
        SET v_error_code = "pdsecuA.3.608.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exch_group_stock_type = v_exch_group_stock_type;
    SET p_exch_group_asset_type = v_exch_group_asset_type;
    SET p_exgp_invest_type = v_exgp_invest_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_pre_settle_qty = v_exgp_pre_settle_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_posi_qty_check_diff = v_exgp_posi_qty_check_diff;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_exch_group_update_times = v_exch_group_update_times;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_stock_type = v_asac_stock_type;
    SET p_asac_asset_type = v_asac_asset_type;
    SET p_asac_invest_type = v_asac_invest_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_pre_settle_qty = v_asac_pre_settle_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_posi_qty_check_diff = v_asac_posi_qty_check_diff;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_asac_update_times = v_asac_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询资产账户内外持仓差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QuerySecuPosiDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QuerySecuPosiDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_asset_acco_no int,
    IN p_stock_code_str varchar(4096),
    IN p_exch_no_str varchar(2048),
    IN p_is_contain int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_deal_flag_query_str varchar(2048),
    IN p_filter_diff_cond int,
    IN p_asset_sync_flag int,
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
    declare v_pd_no_str varchar(2048);
    declare v_asset_acco_no int;
    declare v_stock_code_str varchar(4096);
    declare v_exch_no_str varchar(2048);
    declare v_is_contain int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_deal_flag_query_str varchar(2048);
    declare v_filter_diff_cond int;
    declare v_asset_sync_flag int;
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_str = p_stock_code_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_is_contain = p_is_contain;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_deal_flag_query_str = p_deal_flag_query_str;
    SET v_filter_diff_cond = p_filter_diff_cond;
    SET v_asset_sync_flag = p_asset_sync_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_内外资产账户持仓差异表][字段][{机构编号}=@机构编号# and (@产品编号串#="; ;" or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@市场编号串#="; ;" or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (((@证券代码串#="; ;" or instr(@证券代码串#, concat(";",{证券代码},";"))>0) and @是否包含#=1) or ((@证券代码串#="; ;" or instr(@证券代码串#, concat(";",{证券代码},";"))=0) and @是否包含#=0)) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@处理标志查询串#="; ;" or instr(@处理标志查询串#,concat(";",{处理标志},";"))>0) and (@过滤差额条件#=《过滤差额条件-不过滤》 or (@过滤差额条件#=《过滤差额条件-只显示差额不为0》 and ({账户当前数量差额}<>0 or {账户可用数量差额}<>0)) or (@过滤差额条件#=《过滤差额条件-只显示差额为0》 and ({账户当前数量差额}=0 and {账户可用数量差额}=0))) and (@资产是否同步#=0 or {资产是否同步}=@资产是否同步#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_name, 
        stock_type, asset_type, out_cost_price, acco_curr_qty, 
        acco_avail_qty, out_curr_qty, out_enable_qty, acco_curr_qty_diff, 
        acco_avail_qty_diff, out_impawn_qty, deal_flag, asset_sync_flag, 
        remark_info from db_pdsecu.tb_pdsepo_asac_posi_diff where co_no=v_co_no and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_no_str="; ;" or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))>0) and v_is_contain=1) or ((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))=0) and v_is_contain=0)) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_qty_diff<>0 or acco_avail_qty_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_qty_diff=0 and acco_avail_qty_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_name, 
        stock_type, asset_type, out_cost_price, acco_curr_qty, 
        acco_avail_qty, out_curr_qty, out_enable_qty, acco_curr_qty_diff, 
        acco_avail_qty_diff, out_impawn_qty, deal_flag, asset_sync_flag, 
        remark_info from db_pdsecu.tb_pdsepo_asac_posi_diff where co_no=v_co_no and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_no_str="; ;" or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))>0) and v_is_contain=1) or ((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))=0) and v_is_contain=0)) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_qty_diff<>0 or acco_avail_qty_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_qty_diff=0 and acco_avail_qty_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_转入科创板外部新股申购额度
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_AddKcbOutNewStockLimit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_AddKcbOutNewStockLimit(
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
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_apply_limit decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_acco_no int,
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
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_apply_limit decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_no int;
    declare v_update_times int;
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_apply_limit = p_apply_limit;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_no = 0;
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_账户_证券账户信息表][{股东代码编号}][@股东代码编号#][{资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {股东代码}=@股东代码#][4][@资产账户编号#,@市场编号#,@股东代码#] */
    select stock_acco_no into v_stock_acco_no from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no=v_asset_acco_no and exch_no=v_exch_no and stock_acco=v_stock_acco limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.193.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco);
        end if;
        leave label_pro;
    end if;


    /* [插入重复更新][产品证券_持仓_科创板外部新股申购上限表][字段][字段变量][{申购上限}=@申购上限#][1][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@股东代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_kcb_out_new_stock_limit (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, out_acco, 
        exch_no, stock_acco_no, stock_acco, apply_limit) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_no, v_stock_acco_no, v_stock_acco, v_apply_limit) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, apply_limit=v_apply_limit;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.193.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco);
        end if;
        leave label_pro;
    end if;


    /* [插入重复更新][产品证券_持仓_科创板新股申购上限表][字段][字段变量][{申购上限}=@申购上限#][1][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@股东代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_kcb_new_stock_limit (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, out_acco, 
        exch_no, stock_acco_no, stock_acco, apply_limit) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_no, v_stock_acco_no, v_stock_acco, v_apply_limit) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, apply_limit=v_apply_limit;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.3.193.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_查询科创板新股申购额度
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_QueryKcbOutNewStockLimit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_QueryKcbOutNewStockLimit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_pd_no_str varchar(2048),
    IN p_stock_acco_no_str varchar(4096),
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
    declare v_init_date int;
    declare v_exch_no int;
    declare v_pd_no_str varchar(2048);
    declare v_stock_acco_no_str varchar(4096);
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
    SET v_init_date = p_init_date;
    SET v_exch_no = p_exch_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_stock_acco_no_str = p_stock_acco_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_科创板新股申购上限表][字段][{初始化日期}=@初始化日期# and {机构编号}=@操作员机构编号# and (@市场编号#=0 or {市场编号}=@市场编号#) and (@产品编号串#="; ;" or instr(@产品编号串#,concat(";",{产品编号},";"))>0) and (@股东代码编号串#="; ;" or instr(@股东代码编号串#,concat(";",{股东代码编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        apply_limit from db_pdsecu.tb_pdsepo_kcb_new_stock_limit where init_date=v_init_date and co_no=v_opor_co_no and (v_exch_no=0 or exch_no=v_exch_no) and (v_pd_no_str="; ;" or instr(v_pd_no_str,concat(";",pd_no,";"))>0) and (v_stock_acco_no_str="; ;" or instr(v_stock_acco_no_str,concat(";",stock_acco_no,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        apply_limit from db_pdsecu.tb_pdsepo_kcb_new_stock_limit where init_date=v_init_date and co_no=v_opor_co_no and (v_exch_no=0 or exch_no=v_exch_no) and (v_pd_no_str="; ;" or instr(v_pd_no_str,concat(";",pd_no,";"))>0) and (v_stock_acco_no_str="; ;" or instr(v_stock_acco_no_str,concat(";",stock_acco_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓_获取机构内部证券持仓记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetCoInSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetCoInSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_curr_qty decimal(18,2),
    OUT p_avail_qty decimal(18,2),
    OUT p_out_impawn_qty decimal(18,2)
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_out_impawn_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_posi_qty decimal(18,2);

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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_curr_qty = 0;
    SET v_avail_qty = 0;
    SET v_out_impawn_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_posi_qty = 0;

    
    label_pro:BEGIN
    

    /* if @查询记录序号# = 0 then */
    if v_query_row_id = 0 then

        /* delete from  ~产品证券_持仓_内部资产账户持仓核对表^  where {初始化日期}=@初始化日期# and  {机构编号}=@机构编号#; */
        delete from  db_pdsecu.tb_pdsepo_asac_posi_check  where init_date=v_init_date and  co_no=v_co_no;

      /* insert into ~产品证券_持仓_内部资产账户持仓核对表^  ({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{当前数量},{可用数量}) select @创建日期#,@创建时间#,@更新日期#,@更新时间#,1,@初始化日期#,a.{机构编号},a.{产品编号},a.{资产账户编号},a.{市场编号},a.{股东代码编号},a.{证券代码编号},a.{当前数量},a.{当前数量}+a.{待交收数量}+a.{持仓核对差额} from ~产品证券_持仓_资产账户持仓表^ a where (a.{资产账户编号},a.{股东代码编号},a.{证券代码编号})  not in (select {资产账户编号},{股东代码编号},{证券代码编号}  from ~产品证券_持仓_外部资产账户持仓表^ where {初始化日期}=@初始化日期# and {机构编号}=@机构编号#) and a.{机构编号}=@机构编号# and a.{投资类型}=1 and a.{证券类型}<>《证券类型-回购标准券》 and (a.{资产账户编号},a.{股东代码编号},a.{证券代码编号}) not in (select {资产账户编号},{股东代码编号},{证券代码编号}  from ~产品证券_持仓_外部资产账户债券质押表^ where {初始化日期}=@初始化日期# and {机构编号}=@机构编号#) and (a.{当前数量}<>0 or a.{待交收数量}<>0 or a.{持仓核对差额}<>0 or IFNULL((select {持仓数量} from ~产品证券_持仓_交易资产账户持仓表^ b where b.{资产账户编号}=a.{资产账户编号} and b.{股东代码编号}=a.{股东代码编号} and b.{证券代码编号}=a.{证券代码编号}),0)<>0)  order by a.{资产账户编号},a.{股东代码编号},a.{证券代码编号}; */
      insert into db_pdsecu.tb_pdsepo_asac_posi_check  (create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,curr_qty,avail_qty) select v_create_date,v_create_time,v_update_date,v_update_time,1,v_init_date,a.co_no,a.pd_no,a.asset_acco_no,a.exch_no,a.stock_acco_no,a.stock_code_no,a.curr_qty,a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff from db_pdsecu.tb_pdsepo_asac_posi a where (a.asset_acco_no,a.stock_acco_no,a.stock_code_no)  not in (select asset_acco_no,stock_acco_no,stock_code_no  from db_pdsecu.tb_pdsepo_out_asac_posi where init_date=v_init_date and co_no=v_co_no) and a.co_no=v_co_no and a.invest_type=1 and a.stock_type<>27 and (a.asset_acco_no,a.stock_acco_no,a.stock_code_no) not in (select asset_acco_no,stock_acco_no,stock_code_no  from db_pdsecu.tb_pdsepo_out_asac_bond_pledge where init_date=v_init_date and co_no=v_co_no) and (a.curr_qty<>0 or a.pre_settle_qty<>0 or a.posi_qty_check_diff<>0 or IFNULL((select posi_qty from db_pdsecu.tb_pdsepo_trd_asac_posi b where b.asset_acco_no=a.asset_acco_no and b.stock_acco_no=a.stock_acco_no and b.stock_code_no=a.stock_code_no),0)<>0)  order by a.asset_acco_no,a.stock_acco_no,a.stock_code_no;
    #债券回购单独核对，外部持仓记回购代码，内部记的是标准券代码。Modify by wjp20190628

      /* insert into ~产品证券_持仓_内部资产账户持仓核对表^  ({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{当前数量},{可用数量}) select @创建日期#,@创建时间#,@更新日期#,@更新时间#,1,@初始化日期#,a.{机构编号},a.{产品编号},a.{资产账户编号},a.{市场编号},a.{股东代码编号},a.{证券代码编号},a.{当前数量},a.{当前数量}+a.{待交收数量}+a.{持仓核对差额} from ~产品证券_持仓_资产账户持仓表^ a where (a.{资产账户编号},a.{股东代码编号}) not in (select c.{资产账户编号},c.{股东代码编号}  from ~产品证券_持仓_外部资产账户持仓表^ c where c.{初始化日期}=@初始化日期# and c.{机构编号}=@机构编号# and if(a.{市场编号}=1,c.{证券代码} in ("204001","204002","204003","204007","204014","204028","204091","204182"),c.{证券代码} in ("131810","131811","131800","131801","131802","131803","131805","131806","131809"))) and a.{机构编号}= @机构编号# and a.{投资类型}=1 and a.{证券类型}=《证券类型-回购标准券》  and (a.{当前数量}<>0 or a.{待交收数量}<>0 or a.{持仓核对差额}<>0 or IFNULL((select {持仓数量} from ~产品证券_持仓_交易资产账户持仓表^ b where b.{资产账户编号}=a.{资产账户编号} and b.{股东代码编号}=a.{股东代码编号} and b.{证券代码编号}=a.{证券代码编号}),0)<>0)  order by a.{资产账户编号},a.{股东代码编号},a.{证券代码编号}; */
      insert into db_pdsecu.tb_pdsepo_asac_posi_check  (create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,curr_qty,avail_qty) select v_create_date,v_create_time,v_update_date,v_update_time,1,v_init_date,a.co_no,a.pd_no,a.asset_acco_no,a.exch_no,a.stock_acco_no,a.stock_code_no,a.curr_qty,a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff from db_pdsecu.tb_pdsepo_asac_posi a where (a.asset_acco_no,a.stock_acco_no) not in (select c.asset_acco_no,c.stock_acco_no  from db_pdsecu.tb_pdsepo_out_asac_posi c where c.init_date=v_init_date and c.co_no=v_co_no and if(a.exch_no=1,c.stock_code in ("204001","204002","204003","204007","204014","204028","204091","204182"),c.stock_code in ("131810","131811","131800","131801","131802","131803","131805","131806","131809"))) and a.co_no= v_co_no and a.invest_type=1 and a.stock_type=27  and (a.curr_qty<>0 or a.pre_settle_qty<>0 or a.posi_qty_check_diff<>0 or IFNULL((select posi_qty from db_pdsecu.tb_pdsepo_trd_asac_posi b where b.asset_acco_no=a.asset_acco_no and b.stock_acco_no=a.stock_acco_no and b.stock_code_no=a.stock_code_no),0)<>0)  order by a.asset_acco_no,a.stock_acco_no,a.stock_code_no;
    end if;

    /* [获取表记录变量][产品证券_持仓_内部资产账户持仓核对表][{记录序号},{机构编号},{产品编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{当前数量},{可用数量}][@记录序号#,@机构编号#,@产品编号#,@资产账户编号#,@市场编号#,@股东代码编号#,@证券代码编号#,@当前数量#,@可用数量#][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {记录序号} > @查询记录序号# order by {记录序号}][4][@查询记录序号#] */
    select row_id,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,curr_qty,avail_qty into v_row_id,v_co_no,v_pd_no,v_asset_acco_no,v_exch_no,v_stock_acco_no,v_stock_code_no,v_curr_qty,v_avail_qty from db_pdsecu.tb_pdsepo_asac_posi_check where init_date=v_init_date and co_no=v_co_no and row_id > v_query_row_id order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.3.195.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][产品证券_持仓_交易资产账户持仓表][{持仓数量}][@持仓数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
    select posi_qty into v_posi_qty from db_pdsecu.tb_pdsepo_trd_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;


    /* set @可用数量#=@可用数量#+@持仓数量#; */
    set v_avail_qty=v_avail_qty+v_posi_qty;

    /* [获取表记录变量语句][产品证券_持仓_外部资产账户债券质押表][{外部可用数量}][@外部质押数量#][{初始化日期}=@初始化日期# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
    select out_enable_qty into v_out_impawn_qty from db_pdsecu.tb_pdsepo_out_asac_bond_pledge where init_date=v_init_date and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_curr_qty = v_curr_qty;
    SET p_avail_qty = v_avail_qty;
    SET p_out_impawn_qty = v_out_impawn_qty;

END;;


