DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易运维_查询指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryComm(
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
    

    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @指令审批状态串# <> " " then */
    if v_comm_appr_status_str <> " " then

        /* set @指令审批状态串#=concat(";", @指令审批状态串#, ";"); */
        set v_comm_appr_status_str=concat(";", v_comm_appr_status_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @资产类型串# <> " " then */
    if v_asset_type_str <> " " then

        /* set @资产类型串#=concat(";", @资产类型串#, ";"); */
        set v_asset_type_str=concat(";", v_asset_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* if @指令状态串# <> " " then */
    if v_comm_status_str <> " " then

        /* set @指令状态串#=concat(";", @指令状态串#, ";"); */
        set v_comm_status_str=concat(";", v_comm_status_str, ";");
    end if;

    /* if @成交状态串# <> " " then */
    if v_strike_status_str <> " " then

        /* set @成交状态串#=concat(";", @成交状态串#, ";"); */
        set v_strike_status_str=concat(";", v_strike_status_str, ";");
    end if;

    /* 调用【原子_交易证券_交易运维_查询指令】*/
    call db_tdsecu.pra_tdsebk_QueryComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_id,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_appr_oper,
        v_comm_appr_status_str,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_asset_type_str,
        v_comm_dir_str,
        v_comm_status_str,
        v_strike_status_str,
        v_basket_id,
        v_comm_oper_way,
        v_exter_comm_flag,
        v_comm_comple_flag,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询指令出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询指令历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryComm_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryComm_His(
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
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.10.32.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdsecuT.10.32.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>90][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>90 then
        
        SET v_error_code = "tdsecuT.10.32.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @指令审批状态串# <> " " then */
    if v_comm_appr_status_str <> " " then

        /* set @指令审批状态串#=concat(";", @指令审批状态串#, ";"); */
        set v_comm_appr_status_str=concat(";", v_comm_appr_status_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @资产类型串# <> " " then */
    if v_asset_type_str <> " " then

        /* set @资产类型串#=concat(";", @资产类型串#, ";"); */
        set v_asset_type_str=concat(";", v_asset_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* if @指令状态串# <> " " then */
    if v_comm_status_str <> " " then

        /* set @指令状态串#=concat(";", @指令状态串#, ";"); */
        set v_comm_status_str=concat(";", v_comm_status_str, ";");
    end if;

    /* if @成交状态串# <> " " then */
    if v_strike_status_str <> " " then

        /* set @成交状态串#=concat(";", @成交状态串#, ";"); */
        set v_strike_status_str=concat(";", v_strike_status_str, ";");
    end if;

    /* 调用【原子_交易证券_交易运维_查询指令历史】*/
    call db_tdsecu.pra_tdsebk_QueryComm_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_comm_id,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_appr_oper,
        v_comm_appr_status_str,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_asset_type_str,
        v_comm_dir_str,
        v_comm_status_str,
        v_strike_status_str,
        v_basket_id,
        v_comm_oper_way,
        v_exter_comm_flag,
        v_comm_comple_flag,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.32.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询指令历史出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryOrder(
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
    

    /* if @指定行数# > 65530 or @指定行数# <1 then */
    if v_row_count > 65530 or v_row_count <1 then

      /* set @指定行数# = 65530; */
      set v_row_count = 65530;
    end if;

    /* if @订单操作方式串# <> " " then */
    if v_order_oper_way_str <> " " then

        /* set @订单操作方式串# = concat(";", @订单操作方式串#, ";"); */
        set v_order_oper_way_str = concat(";", v_order_oper_way_str, ";");
    end if;

    /* if @产品编号串# <> " " then */
    if v_pd_no_str <> " " then

        /* set @产品编号串# = concat(";", @产品编号串#, ";"); */
        set v_pd_no_str = concat(";", v_pd_no_str, ";");
    end if;

    /* if @交易组编号串# <> " " then */
    if v_exch_group_no_str <> " " then

        /* set @交易组编号串# = concat(";", @交易组编号串#, ";"); */
        set v_exch_group_no_str = concat(";", v_exch_group_no_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
        set v_exch_no_str = concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串# = concat(";", @证券类型串#, ";"); */
        set v_stock_type_str = concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串# = concat(";", @订单方向串#, ";"); */
        set v_order_dir_str = concat(";", v_order_dir_str, ";");
    end if;

    /* if @订单状态串# <> " " then */
    if v_order_status_str <> " " then

        /* set @订单状态串# = concat(";", @订单状态串#, ";"); */
        set v_order_status_str = concat(";", v_order_status_str, ";");
    end if;

    /* if @价格类型串# <> " " then */
    if v_price_type_str <> " " then

        /* set @价格类型串# = concat(";", @价格类型串#, ";"); */
        set v_price_type_str = concat(";", v_price_type_str, ";");
    end if;

    /* 调用【原子_交易证券_交易运维_查询订单】*/
    call db_tdsecu.pra_tdsebk_QueryOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_order_oper_way_str,
        v_co_no,
        v_pd_no_str,
        v_exch_group_no_str,
        v_pass_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_comm_opor,
        v_external_no,
        v_order_batch_no,
        v_order_id,
        v_order_dir_str,
        v_order_status_str,
        v_price_type_str,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.41.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询订单出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询订单历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryOrder_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryOrder_His(
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

    
    label_pro:BEGIN
    

    /* if @指定行数# > 500 or @指定行数# <1 then */
    if v_row_count > 500 or v_row_count <1 then

      /* set @指定行数# = 500; */
      set v_row_count = 500;
    end if;

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][259][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.10.42.259";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdsecuT.10.42.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>90][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>90 then
        
        SET v_error_code = "tdsecuT.10.42.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* if @订单操作方式串# <> " " then */
    if v_order_oper_way_str <> " " then

        /* set @订单操作方式串# = concat(";", @订单操作方式串#, ";"); */
        set v_order_oper_way_str = concat(";", v_order_oper_way_str, ";");
    end if;

    /* if @产品编号串# <> " " then */
    if v_pd_no_str <> " " then

        /* set @产品编号串# = concat(";", @产品编号串#, ";"); */
        set v_pd_no_str = concat(";", v_pd_no_str, ";");
    end if;

    /* if @交易组编号串# <> " " then */
    if v_exch_group_no_str <> " " then

        /* set @交易组编号串# = concat(";", @交易组编号串#, ";"); */
        set v_exch_group_no_str = concat(";", v_exch_group_no_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
        set v_exch_no_str = concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串# = concat(";", @证券类型串#, ";"); */
        set v_stock_type_str = concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串# = concat(";", @订单方向串#, ";"); */
        set v_order_dir_str = concat(";", v_order_dir_str, ";");
    end if;

    /* if @订单状态串# <> " " then */
    if v_order_status_str <> " " then

        /* set @订单状态串# = concat(";", @订单状态串#, ";"); */
        set v_order_status_str = concat(";", v_order_status_str, ";");
    end if;

    /* if @价格类型串# <> " " then */
    if v_price_type_str <> " " then

        /* set @价格类型串# = concat(";", @价格类型串#, ";"); */
        set v_price_type_str = concat(";", v_price_type_str, ";");
    end if;

    /* 调用【原子_交易证券_交易运维_查询订单历史】*/
    call db_tdsecu.pra_tdsebk_QueryOrder_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_busi_opor_no,
        v_order_oper_way_str,
        v_co_no,
        v_pd_no_str,
        v_exch_group_no_str,
        v_pass_no,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_comm_opor,
        v_external_no,
        v_order_batch_no,
        v_order_id,
        v_order_dir_str,
        v_order_status_str,
        v_price_type_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.42.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询订单历史出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询订单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryOrderRsp(
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
    

    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* if @订单回报状态串# <> " " then */
    if v_order_rsp_status_str <> " " then

        /* set @订单回报状态串#=concat(";", @订单回报状态串#, ";"); */
        set v_order_rsp_status_str=concat(";", v_order_rsp_status_str, ";");
    end if;

    /* if @处理状态串# <> " " then */
    if v_deal_status_str <> " " then

        /* set @处理状态串#=concat(";", @处理状态串#, ";"); */
        set v_deal_status_str=concat(";", v_deal_status_str, ";");
    end if;

    /* 调用【原子_交易证券_交易运维_查询订单回报】*/
    call db_tdsecu.pra_tdsebk_QueryOrderRsp(
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
        v_exch_no_str,
        v_stock_acco,
        v_stock_code,
        v_order_dir_str,
        v_order_rsp_status_str,
        v_deal_status_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.51.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询订单回报出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryStrikeRsp(
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
    

    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* if @处理状态串# <> " " then */
    if v_deal_status_str <> " " then

        /* set @处理状态串#=concat(";", @处理状态串#, ";"); */
        set v_deal_status_str=concat(";", v_deal_status_str, ";");
    end if;

    /* 调用【原子_交易证券_交易运维_查询成交回报】*/
    call db_tdsecu.pra_tdsebk_QueryStrikeRsp(
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
        v_exch_no_str,
        v_stock_acco,
        v_stock_code,
        v_order_dir_str,
        v_deal_status_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.52.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询成交回报出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryStrikeDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryStrikeDetail(
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

    
    label_pro:BEGIN
    

    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @订单操作方式串# <> " " then */
    if v_order_oper_way_str <> " " then

        /* set @订单操作方式串# = concat(";", @订单操作方式串#, ";"); */
        set v_order_oper_way_str = concat(";", v_order_oper_way_str, ";");
    end if;

    /* if @产品编号串# <> " " then */
    if v_pd_no_str <> " " then

        /* set @产品编号串# = concat(";", @产品编号串#, ";"); */
        set v_pd_no_str = concat(";", v_pd_no_str, ";");
    end if;

    /* if @交易组编号串# <> " " then */
    if v_exch_group_no_str <> " " then

        /* set @交易组编号串# = concat(";", @交易组编号串#, ";"); */
        set v_exch_group_no_str = concat(";", v_exch_group_no_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* 调用【原子_交易证券_交易运维_查询成交明细】*/
    call db_tdsecu.pra_tdsebk_QueryStrikeDetail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_order_oper_way_str,
        v_co_no,
        v_pd_no_str,
        v_exch_group_no_str,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_order_dir_str,
        v_exter_comm_flag,
        v_record_valid_flag,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.53.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询成交明细出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询成交明细历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryStrikeDetail_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryStrikeDetail_His(
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

    
    label_pro:BEGIN
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.10.54.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdsecuT.10.54.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>90][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>90 then
        
        SET v_error_code = "tdsecuT.10.54.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @订单操作方式串# <> " " then */
    if v_order_oper_way_str <> " " then

        /* set @订单操作方式串# = concat(";", @订单操作方式串#, ";"); */
        set v_order_oper_way_str = concat(";", v_order_oper_way_str, ";");
    end if;

    /* if @产品编号串# <> " " then */
    if v_pd_no_str <> " " then

        /* set @产品编号串# = concat(";", @产品编号串#, ";"); */
        set v_pd_no_str = concat(";", v_pd_no_str, ";");
    end if;

    /* if @交易组编号串# <> " " then */
    if v_exch_group_no_str <> " " then

        /* set @交易组编号串# = concat(";", @交易组编号串#, ";"); */
        set v_exch_group_no_str = concat(";", v_exch_group_no_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* 调用【原子_交易证券_交易运维_查询成交明细历史】*/
    call db_tdsecu.pra_tdsebk_QueryStrikeDetail_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_busi_opor_no,
        v_order_oper_way_str,
        v_co_no,
        v_pd_no_str,
        v_exch_group_no_str,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_order_dir_str,
        v_exter_comm_flag,
        v_record_valid_flag,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.54.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询成交明细历史出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询机构统计订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryConoOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryConoOrder(
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
    

    /* 调用【原子_交易证券_交易运维_查询机构统计订单】*/
    call db_tdsecu.pra_tdsebk_QueryConoOrder(
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
        SET v_error_code = "tdsecuT.10.55.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询机构统计订单出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_补单关联订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_AppendOrderAssociatedOriginalOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_AppendOrderAssociatedOriginalOrder(
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
    IN p_order_status varchar(2),
    IN p_order_date int,
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
    declare v_order_status varchar(2);
    declare v_order_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_id bigint;
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_avail_cal_flag int;
    declare v_combo_code varchar(32);
    declare v_combo_posi_id bigint;
    declare v_repo_order_id bigint;
    declare v_strike_no varchar(64);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_price decimal(16,9);
    declare v_strike_fee decimal(18,4);
    declare v_tmp_order_status varchar(2);
    declare v_order_append_exch_group_no int;
    declare v_order_append_frozen_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_comm_batch_no int;
    declare v_wtdraw_qty decimal(18,2);
    declare v_repo_strike_id bigint;

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
    SET v_order_status = p_order_status;
    SET v_order_date = p_order_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_id = 0;
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_avail_cal_flag = 0;
    SET v_combo_code = " ";
    SET v_combo_posi_id = 0;
    SET v_repo_order_id = 0;
    SET v_strike_no = " ";
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_price = 0;
    SET v_strike_fee = 0;
    SET v_tmp_order_status = "0";
    SET v_order_append_exch_group_no = 0;
    SET v_order_append_frozen_amt = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_comm_batch_no = 0;
    SET v_wtdraw_qty = 0;
    SET v_repo_strike_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* set @是否记录流水# = 0; */
    set v_is_record_jour = 0;

    /* set @开平仓权限# = 0; */
    set v_open_close_permission = 0;

    /* set @可用计算标志# = 0; */
    set v_avail_cal_flag = 0;

    /* set @组合代码# = " "; */
    set v_combo_code = " ";

    /* set @组合持仓序号# = 0; */
    set v_combo_posi_id = 0;

    /* set @回购委托序号# = @订单序号#; */
    set v_repo_order_id = v_order_id;

    /* set @成交编号# = 0; */
    set v_strike_no = 0;

    /* set @成交日期# = 0; */
    set v_strike_date = 0;

    /* set @成交时间# = 0; */
    set v_strike_time = 0;

    /* set @成交价格# = 0; */
    set v_strike_price = 0;

    /* set @成交费用# = 0; */
    set v_strike_fee = 0;

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @临时_订单状态# = @订单状态#; */
    set v_tmp_order_status = v_order_status;

    /* [检查报错返回][@订单状态# <> 'b'  and @订单状态# <> '8' ][206]["处理失败，订单状态必须为正报或者废单"] */
    if v_order_status <> 'b'  and v_order_status <> '8'  then
        ROLLBACK;
        SET v_error_code = "tdsecuT.10.56.206";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("处理失败，订单状态必须为正报或者废单","#",v_mysql_message);
        else
            SET v_error_info = "处理失败，订单状态必须为正报或者废单";
        end if;
        leave label_pro;
    end if;

    #找到补单B这条订单记录，更新订单状态为已撤，清空订单记录的申报编号，申报日期和时间。
    #找到原订单A这条订单记录，更新订单状态为已报，补填订单记录的申报编号，申报日期和时间。

    /* if @临时_订单状态# = 《订单状态-正报》 then */
    if v_tmp_order_status = "b" then

        /* 调用【原子_交易证券_交易运维_补单关联原订单】*/
        call db_tdsecu.pra_tdsebk_AppendOrderAssociatedOriginalOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_id,
            v_new_order_id,
            v_order_batch_no,
            v_error_code,
            v_error_info,
            v_order_append_exch_group_no,
            v_order_append_frozen_amt,
            v_strike_qty,
            v_strike_amt,
            v_order_status,
            v_comm_batch_no,
            v_wtdraw_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.10.56.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_补单关联原订单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* elseif @临时_订单状态# = 《订单状态-废单》 then */
    elseif v_tmp_order_status = "8" then

        /* 调用【原子_交易证券_交易运维_补单关联废单】*/
        call db_tdsecu.pra_tdsebk_AppendOrderAssociatedOriginalWasteOrder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_id,
            v_new_order_id,
            v_order_batch_no,
            v_error_code,
            v_error_info,
            v_order_append_exch_group_no,
            v_order_append_frozen_amt,
            v_strike_qty,
            v_strike_amt,
            v_order_status,
            v_comm_batch_no,
            v_wtdraw_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.10.56.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_补单关联废单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

    end if;
    #回溯补单B的相关表记录，补填订单A的相关表记录


    /* 调用【原子_交易证券_交易运维_回溯成交记录】*/
    call db_tdsecu.pra_tdsebk_RollbackExecution(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_id,
        v_new_order_id,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_order_append_exch_group_no,
        v_stock_code,
        v_exch_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_order_qty,
        v_stock_type,
        v_order_dir,
        v_crncy_type,
        v_invest_type,
        v_wtdraw_qty,
        v_strike_qty,
        v_strike_amt,
        v_net_price_flag,
        v_comm_id,
        v_comm_batch_no,
        v_init_date,
        v_error_code,
        v_error_info,
        v_strike_id);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.56.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_回溯成交记录出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* set @回购成交序号# = @成交序号#; */
    set v_repo_strike_id = v_strike_id;

    /* if @临时_订单状态# = 《订单状态-正报》 then */
    if v_tmp_order_status = "b" then

        /* 调用【原子_交易证券_交易运维_处理正报订单资金持仓】*/
        call db_tdsecu.pra_tdsebk_DealReportOrderCapitalPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_id,
            v_new_order_id,
            v_order_batch_no,
            v_par_value,
            v_impawn_ratio,
            v_net_price_flag,
            v_intrst_days,
            v_bond_rate_type,
            v_bond_accr_intrst,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_stock_code,
            v_exch_no,
            v_asset_acco_no,
            v_stock_acco_no,
            v_order_qty,
            v_comm_id,
            v_stock_type,
            v_order_dir,
            v_crncy_type,
            v_invest_type,
            v_wtdraw_qty,
            v_strike_amt,
            v_order_price,
            v_exch_crncy_type,
            v_asset_type,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_order_oper_way,
            v_order_frozen_amt,
            v_busi_opor_no,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_capit_reback_days,
            v_posi_reback_days,
            v_exgp_cost_amt,
            v_exgp_intrst_cost_amt,
            v_exgp_curr_qty,
            v_asac_cost_amt,
            v_asac_intrst_cost_amt,
            v_asac_curr_qty,
            v_repo_days,
            v_repo_cale_days,
            v_repo_back_date,
            v_cost_calc_type,
            v_order_append_exch_group_no,
            v_order_append_frozen_amt,
            v_order_status,
            v_is_record_jour,
            v_open_close_permission,
            v_avail_cal_flag,
            v_combo_code,
            v_combo_posi_id,
            v_strike_qty,
            v_strike_id,
            v_repo_order_id,
            v_repo_strike_id,
            v_strike_no,
            v_strike_date,
            v_strike_time,
            v_strike_price,
            v_strike_fee,
            v_order_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.10.56.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_处理正报订单资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* elseif @临时_订单状态# = 《订单状态-废单》 then */
    elseif v_tmp_order_status = "8" then

        /* 调用【原子_交易证券_交易运维_处理废单资金持仓】*/
        call db_tdsecu.pra_tdsebk_DealWasteOrderCapitalPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_id,
            v_new_order_id,
            v_order_batch_no,
            v_par_value,
            v_impawn_ratio,
            v_net_price_flag,
            v_intrst_days,
            v_bond_rate_type,
            v_bond_accr_intrst,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_stock_code,
            v_exch_no,
            v_asset_acco_no,
            v_stock_acco_no,
            v_order_qty,
            v_comm_id,
            v_stock_type,
            v_order_dir,
            v_crncy_type,
            v_invest_type,
            v_wtdraw_qty,
            v_strike_amt,
            v_order_price,
            v_exch_crncy_type,
            v_asset_type,
            v_stock_code_no,
            v_trade_code_no,
            v_target_code_no,
            v_order_oper_way,
            v_order_frozen_amt,
            v_busi_opor_no,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_capit_reback_days,
            v_posi_reback_days,
            v_exgp_cost_amt,
            v_exgp_intrst_cost_amt,
            v_exgp_curr_qty,
            v_asac_cost_amt,
            v_asac_intrst_cost_amt,
            v_asac_curr_qty,
            v_repo_days,
            v_repo_cale_days,
            v_repo_back_date,
            v_cost_calc_type,
            v_order_append_exch_group_no,
            v_order_append_frozen_amt,
            v_order_status,
            v_is_record_jour,
            v_open_close_permission,
            v_avail_cal_flag,
            v_combo_code,
            v_combo_posi_id,
            v_strike_qty,
            v_strike_id,
            v_repo_order_id,
            v_repo_strike_id,
            v_strike_no,
            v_strike_date,
            v_strike_time,
            v_strike_price,
            v_strike_fee,
            v_order_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.10.56.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_处理废单资金持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

    end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_id = v_strike_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易运维_查询机构统计异常订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryConoExceptionOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryConoExceptionOrder(
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

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易运维_查询机构统计异常订单】*/
    call db_tdsecu.pra_tdsebk_QueryConoExceptionOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_date,
        v_auth_time,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.57.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询机构统计异常订单出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询指令汇总考核
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QuerySumCommCheck;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QuerySumCommCheck(
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
    

    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @指令汇总审批状态串# <> " " then */
    if v_comm_sum_appr_status_str <> " " then

        /* set @指令汇总审批状态串#=concat(";", @指令汇总审批状态串#, ";"); */
        set v_comm_sum_appr_status_str=concat(";", v_comm_sum_appr_status_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @资产类型串# <> " " then */
    if v_asset_type_str <> " " then

        /* set @资产类型串#=concat(";", @资产类型串#, ";"); */
        set v_asset_type_str=concat(";", v_asset_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* if @指令汇总状态串# <> " " then */
    if v_comm_sum_status_str <> " " then

        /* set @指令汇总状态串#=concat(";", @指令汇总状态串#, ";"); */
        set v_comm_sum_status_str=concat(";", v_comm_sum_status_str, ";");
    end if;

    /* if @成交状态串# <> " " then */
    if v_strike_status_str <> " " then

        /* set @成交状态串#=concat(";", @成交状态串#, ";"); */
        set v_strike_status_str=concat(";", v_strike_status_str, ";");
    end if;

    /* 调用【原子_交易证券_交易运维_查询指令汇总考核】*/
    call db_tdsecu.pra_tdsebk_QuerySumCommCheck(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_comm_date,
        v_comm_batch_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_sum_appr_status_str,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_asset_type_str,
        v_comm_dir_str,
        v_comm_sum_status_str,
        v_strike_status_str,
        v_basket_id,
        v_comm_oper_way,
        v_exter_comm_flag,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.58.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询指令汇总考核出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询指令汇总考核历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QuerySumCommCheck_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QuerySumCommCheck_His(
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
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdsecuT.10.59.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdsecuT.10.59.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>93][255][concat("查询日期间隔不允许超过三个月!",@开始日期#,@结束日期#)] */
    if datediff(v_end_date,v_begin_date)>93 then
        
        SET v_error_code = "tdsecuT.10.59.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询日期间隔不允许超过三个月!",v_begin_date,v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询日期间隔不允许超过三个月!",v_begin_date,v_end_date);
        end if;
        leave label_pro;
    end if;


    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @指令汇总审批状态串# <> " " then */
    if v_comm_sum_appr_status_str <> " " then

        /* set @指令汇总审批状态串#=concat(";", @指令汇总审批状态串#, ";"); */
        set v_comm_sum_appr_status_str=concat(";", v_comm_sum_appr_status_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @资产类型串# <> " " then */
    if v_asset_type_str <> " " then

        /* set @资产类型串#=concat(";", @资产类型串#, ";"); */
        set v_asset_type_str=concat(";", v_asset_type_str, ";");
    end if;

    /* if @指令方向串# <> " " then */
    if v_comm_dir_str <> " " then

        /* set @指令方向串#=concat(";", @指令方向串#, ";"); */
        set v_comm_dir_str=concat(";", v_comm_dir_str, ";");
    end if;

    /* if @指令汇总状态串# <> " " then */
    if v_comm_sum_status_str <> " " then

        /* set @指令汇总状态串#=concat(";", @指令汇总状态串#, ";"); */
        set v_comm_sum_status_str=concat(";", v_comm_sum_status_str, ";");
    end if;

    /* if @成交状态串# <> " " then */
    if v_strike_status_str <> " " then

        /* set @成交状态串#=concat(";", @成交状态串#, ";"); */
        set v_strike_status_str=concat(";", v_strike_status_str, ";");
    end if;

    /* 调用【原子_交易证券_交易运维_查询指令汇总考核历史】*/
    call db_tdsecu.pra_tdsebk_QuerySumCommCheck_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_comm_date,
        v_comm_batch_no,
        v_comm_opor,
        v_comm_executor,
        v_comm_sum_appr_status_str,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_asset_type_str,
        v_comm_dir_str,
        v_comm_sum_status_str,
        v_strike_status_str,
        v_basket_id,
        v_comm_oper_way,
        v_exter_comm_flag,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.59.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询指令汇总考核历史出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_更新查询指令汇总考核
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_UpdateSumCommCheck;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_UpdateSumCommCheck(
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_交易运维_更新查询指令汇总考核】*/
        call db_tdsecu.pra_tdsebk_UpdateSumCommCheck(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_comm_date,
            v_comm_batch_no,
            v_comm_executor,
            v_valid_aver_price,
            v_valid_aver_price_allday,
            v_exec_price_diff,
            v_exec_price_diff_allday,
            v_valid_ratio,
            v_valid_ratio_allday,
            v_valid_qty,
            v_valid_qty_allday,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.10.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_更新查询指令汇总考核出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询所有指令汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryAllSumComm;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryAllSumComm(
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
    

    /* 调用【原子_交易证券_交易运维_查询所有指令汇总】*/
    call db_tdsecu.pra_tdsebk_QueryAllSumComm(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_comm_date,
        v_comm_batch_no,
        v_comm_executor,
        v_stock_code_no,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.61.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询所有指令汇总出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询运维订单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryBkOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryBkOrderRsp(
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
    

    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* if @订单回报状态串# <> " " then */
    if v_order_rsp_status_str <> " " then

        /* set @订单回报状态串#=concat(";", @订单回报状态串#, ";"); */
        set v_order_rsp_status_str=concat(";", v_order_rsp_status_str, ";");
    end if;

    /* if @处理状态串# <> " " then */
    if v_deal_status_str <> " " then

        /* set @处理状态串#=concat(";", @处理状态串#, ";"); */
        set v_deal_status_str=concat(";", v_deal_status_str, ";");
    end if;

    /* 调用【原子_交易证券_交易运维_查询运维订单回报】*/
    call db_tdsecu.pra_tdsebk_QueryBkOrderRsp(
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
        v_exch_no_str,
        v_stock_acco,
        v_stock_code,
        v_order_dir_str,
        v_order_rsp_status_str,
        v_deal_status_str,
        v_pass_no,
        v_report_no,
        v_order_id,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.62.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询运维订单回报出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询运维成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryBkStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryBkStrikeRsp(
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
    

    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* if @处理状态串# <> " " then */
    if v_deal_status_str <> " " then

        /* set @处理状态串#=concat(";", @处理状态串#, ";"); */
        set v_deal_status_str=concat(";", v_deal_status_str, ";");
    end if;

    /* 调用【原子_交易证券_交易运维_查询运维成交回报】*/
    call db_tdsecu.pra_tdsebk_QueryBkStrikeRsp(
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
        v_exch_no_str,
        v_stock_acco,
        v_stock_code,
        v_order_dir_str,
        v_deal_status_str,
        v_pass_no,
        v_report_no,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.63.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询运维成交回报出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询运维成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryBkStrikeDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryBkStrikeDetail(
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
    

    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @订单操作方式串# <> " " then */
    if v_order_oper_way_str <> " " then

        /* set @订单操作方式串# = concat(";", @订单操作方式串#, ";"); */
        set v_order_oper_way_str = concat(";", v_order_oper_way_str, ";");
    end if;

    /* if @产品编号串# <> " " then */
    if v_pd_no_str <> " " then

        /* set @产品编号串# = concat(";", @产品编号串#, ";"); */
        set v_pd_no_str = concat(";", v_pd_no_str, ";");
    end if;

    /* if @交易组编号串# <> " " then */
    if v_exch_group_no_str <> " " then

        /* set @交易组编号串# = concat(";", @交易组编号串#, ";"); */
        set v_exch_group_no_str = concat(";", v_exch_group_no_str, ";");
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @证券类型串# <> " " then */
    if v_stock_type_str <> " " then

        /* set @证券类型串#=concat(";", @证券类型串#, ";"); */
        set v_stock_type_str=concat(";", v_stock_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* 调用【原子_交易证券_交易运维_查询运维成交明细】*/
    call db_tdsecu.pra_tdsebk_QueryBkStrikeDetail(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_order_oper_way_str,
        v_co_no,
        v_pd_no_str,
        v_exch_group_no_str,
        v_exch_no_str,
        v_stock_code_no,
        v_stock_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_order_dir_str,
        v_exter_comm_flag,
        v_record_valid_flag,
        v_pass_no,
        v_report_no,
        v_order_id,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.64.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询运维成交明细出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询报盘信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryOfferInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryOfferInfo(
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

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易运维_查询报盘信息】*/
    call db_tdsecu.pra_tdsebk_QueryOfferInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.65.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询报盘信息出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询运维撤单流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryBkCancelJour;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryBkCancelJour(
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
    

    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* 调用【原子_交易证券_交易运维_查询运维撤单流水】*/
    call db_tdsecu.pra_tdsebk_QueryBkCancelJour(
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
        v_exch_no_str,
        v_stock_acco,
        v_stock_code,
        v_order_dir_str,
        v_pass_no,
        v_report_no,
        v_order_id,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.66.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询运维撤单流水出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_获取结算资金股份流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_GetSetFuShFlow;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_GetSetFuShFlow(
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
    

    /* 调用【原子_交易证券_交易运维_查询结算资金股份流水】*/
    call db_tdsecu.pra_tdsebk_GetSetFuShFlow(
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
        SET v_error_code = "tdsecuT.10.67.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询结算资金股份流水出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_同步场外基金成交回报表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_SyncOffSiteFundrSp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_SyncOffSiteFundrSp(
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_交易运维_同步场外基金成交回报表】*/
        call db_tdsecu.pra_tdsebk_SyncOffSiteFundrSp(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_out_acco,
            v_report_date,
            v_report_no,
            v_strike_no,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_exch_no,
            v_rsp_info,
            v_strike_deal_type,
            v_strike_time,
            v_strike_date,
            v_pass_no,
            v_stock_acco,
            v_stock_code,
            v_order_dir,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.10.68.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_同步场外基金成交回报表出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询场外基金成交回报表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryOffSiteFundrSp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryOffSiteFundrSp(
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
    

             /* 调用【原子_交易证券_交易运维_查询场外基金成交回报表】*/
             call db_tdsecu.pra_tdsebk_QueryOffSiteFundrSp(
                 v_opor_co_no,
                 v_opor_no,
                 v_oper_mac,
                 v_oper_ip_addr,
                 v_oper_info,
                 v_oper_way,
                 v_func_code,
                 v_stock_code,
                 v_exch_no,
                 v_order_dir,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "tdsecuT.10.69.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询场外基金成交回报表出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_回溯取错单修改成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_BackGetModiErrorOrderStrike;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_BackGetModiErrorOrderStrike(
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
    OUT p_combo_code varchar(32),
    OUT p_stock_acco_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_date int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
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
    OUT p_order_batch_no int,
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
    declare v_combo_code varchar(32);
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_date int;
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
    declare v_order_batch_no int;
    declare v_external_no bigint;

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
    SET v_combo_code = " ";
    SET v_stock_acco_no = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
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
    SET v_order_batch_no = 0;
    SET v_external_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_交易证券_交易运维_回溯取错单修改成交】*/
    call db_tdsecu.pra_tdsebk_BackGetModiErrorOrderStrike(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_strike_id,
        v_error_code,
        v_error_info,
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
        v_combo_code,
        v_stock_type,
        v_comm_id,
        v_comm_batch_no,
        v_strike_date,
        v_strike_time,
        v_strike_no,
        v_report_date,
        v_report_no,
        v_order_date,
        v_order_batch_no,
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
        v_trade_code_no,
        v_target_code_no,
        v_order_oper_way,
        v_exter_comm_flag,
        v_record_valid_flag,
        v_busi_opor_no,
        v_update_times,
        v_external_no);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.70.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_回溯取错单修改成交出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

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
    SET p_combo_code = v_combo_code;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_date = v_report_date;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
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
    SET p_order_batch_no = v_order_batch_no;
    SET p_external_no = v_external_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易运维_错单修改成交回溯
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_BackModiErrorOrderStrike;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_BackModiErrorOrderStrike(
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
    IN p_exch_crncy_type varchar(3),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_combo_code varchar(32),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_asset_type int,
    IN p_stock_type int,
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_id bigint,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_trade_tax decimal(18,4),
    IN p_trade_cost_fee decimal(18,4),
    IN p_trade_system_use_fee decimal(18,4),
    IN p_stock_settle_fee decimal(18,4),
    IN p_par_value decimal(16,9),
    IN p_intrst_days int,
    IN p_impawn_ratio decimal(18,12),
    IN p_net_price_flag int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_remark_info varchar(255),
    IN p_repo_strike_id bigint,
    IN p_repo_days int,
    IN p_repo_cale_days int,
    IN p_repo_back_date int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_order_oper_way varchar(2),
    IN p_cost_calc_type int,
    IN p_exgp_cost_amt decimal(18,4),
    IN p_exgp_intrst_cost_amt decimal(18,4),
    IN p_exgp_curr_qty decimal(18,2),
    IN p_asac_cost_amt decimal(18,4),
    IN p_asac_intrst_cost_amt decimal(18,4),
    IN p_asac_curr_qty decimal(18,2),
    IN p_busi_opor_no int,
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_sys_config_str varchar(64),
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_combo_code varchar(32);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_id bigint;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
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
    declare v_par_value decimal(16,9);
    declare v_intrst_days int;
    declare v_impawn_ratio decimal(18,12);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_remark_info varchar(255);
    declare v_repo_strike_id bigint;
    declare v_repo_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_date int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_order_oper_way varchar(2);
    declare v_cost_calc_type int;
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_busi_opor_no int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_is_record_jour int;
    declare v_strike_fee decimal(18,4);
    declare v_open_close_permission int;
    declare v_target_stock_code_no int;
    declare v_comm_cancel_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_comm_dir int;
    declare v_comm_strike_qty decimal(18,2);
    declare v_comm_strike_amt decimal(18,4);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_rsp_info varchar(255);
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_strike_occur_qty decimal(18,2);
    declare v_repo_order_id bigint;
    declare v_avail_cal_flag int;
    declare v_combo_posi_id bigint;
    declare v_open_posi_date int;

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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_combo_code = p_combo_code;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_asset_type = p_asset_type;
    SET v_stock_type = p_stock_type;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_id = p_strike_id;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_trade_tax = p_trade_tax;
    SET v_trade_cost_fee = p_trade_cost_fee;
    SET v_trade_system_use_fee = p_trade_system_use_fee;
    SET v_stock_settle_fee = p_stock_settle_fee;
    SET v_par_value = p_par_value;
    SET v_intrst_days = p_intrst_days;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_remark_info = p_remark_info;
    SET v_repo_strike_id = p_repo_strike_id;
    SET v_repo_days = p_repo_days;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_date = p_repo_back_date;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_order_oper_way = p_order_oper_way;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_exgp_cost_amt = p_exgp_cost_amt;
    SET v_exgp_intrst_cost_amt = p_exgp_intrst_cost_amt;
    SET v_exgp_curr_qty = p_exgp_curr_qty;
    SET v_asac_cost_amt = p_asac_cost_amt;
    SET v_asac_intrst_cost_amt = p_asac_intrst_cost_amt;
    SET v_asac_curr_qty = p_asac_curr_qty;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_is_record_jour = 1;
    SET v_strike_fee = 0;
    SET v_open_close_permission = 0;
    SET v_target_stock_code_no = 0;
    SET v_comm_cancel_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_comm_dir = 0;
    SET v_comm_strike_qty = 0;
    SET v_comm_strike_amt = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_status = "0";
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_order_status = "0";
    SET v_rsp_info = " ";
    SET v_strike_occur_amt = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_strike_occur_qty = 0;
    SET v_repo_order_id = 0;
    SET v_avail_cal_flag = 0;
    SET v_combo_posi_id = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;

    /* set @成交费用# = @全部费用#; */
    set v_strike_fee = v_all_fee;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* set @目标证券代码编号# =0; */
    set v_target_stock_code_no =0;

    /* [事务开始] */
    START TRANSACTION;

        #第一步，判断有无指令，回溯指令、指令汇总、订单、订单汇总

        /* if @指令序号# > 0 then */
        if v_comm_id > 0 then

            /* set @指令撤销数量# = 0; */
            set v_comm_cancel_qty = 0;

            /* set @撤单数量# = @成交数量#; */
            set v_wtdraw_qty = v_strike_qty;

            /* 调用【原子_交易证券_指令_错单修改成交回溯更新指令】*/
            call db_tdsecu.pra_tdseap_BackErrorStrikeUpdateComm(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_comm_id,
                v_strike_qty,
                v_strike_amt,
                v_error_code,
                v_error_info,
                v_comm_dir,
                v_comm_cancel_qty,
                v_comm_strike_qty,
                v_comm_strike_amt,
                v_limit_actual_price,
                v_comm_status);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.10.71.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_错单修改成交回溯更新指令出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* set @备注信息# = concat('错单修改成交回溯，备注信息：',@备注信息#); */
        set v_remark_info = concat('错单修改成交回溯，备注信息：',v_remark_info);

        /* 调用【原子_交易证券_交易_回溯错单修改订单】*/
        call db_tdsecu.pra_tdsetd_BackErrorUpdateOrder(
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
            v_order_id,
            v_strike_id,
            v_strike_amt,
            v_strike_qty,
            v_remark_info,
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
            v_sys_config_str,
            v_error_code,
            v_error_info,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_order_status,
            v_order_dir);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.10.71.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_回溯错单修改订单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #第二步，回溯订单回报与成交回报

        /* set @回报信息# = '错单修改回溯成交。'; */
        set v_rsp_info = '错单修改回溯成交。';

        /* 调用【原子_交易证券_交易运维_错单修改成交回溯更新回报】*/
        call db_tdsecu.pra_tdsebk_BackErrorStrikeUpdateRspStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_report_date,
            v_report_no,
            v_strike_date,
            v_strike_no,
            v_order_dir,
            v_rsp_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.10.71.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_错单修改成交回溯更新回报出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #第三步，回溯成交

        /* 调用【原子_交易证券_报盘_错单修改成交回溯更新成交记录】*/
        call db_tdsecu.pra_tdserp_BackErrorStrikeUpdateStrikeFlag(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_date,
            v_order_id,
            v_strike_id,
            v_comm_id,
            v_strike_qty,
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.10.71.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_报盘_错单修改成交回溯更新成交记录出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @交易变动金额# = -1 * @交易变动金额#; */
        set v_trade_occur_amt = -1 * v_trade_occur_amt;

        /* set @交易变动数量# = -1 * @交易变动数量#; */
        set v_trade_occur_qty = -1 * v_trade_occur_qty;

        /* 调用【原子_交易证券_公用_计算成交变动金额和数量】*/
        call db_tdsecu.pra_tdsepb_GetStrikeOccurAmtAndQty(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_type,
            v_order_dir,
            v_strike_qty,
            v_strike_price,
            v_strike_amt,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_all_fee,
            v_error_code,
            v_error_info,
            v_strike_occur_amt,
            v_strike_bond_accr_intrst,
            v_strike_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.10.71.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算成交变动金额和数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @回购成交序号# = @成交序号#; */
        set v_repo_strike_id = v_strike_id;

        /* set @回购委托序号# = @订单序号#; */
        set v_repo_order_id = v_order_id;

        /* set @成交变动数量# = -1 * @成交变动数量#; */
        set v_strike_occur_qty = -1 * v_strike_occur_qty;

        /* set @成交变动金额# = -1 * @成交变动金额#; */
        set v_strike_occur_amt = -1 * v_strike_occur_amt;

        /* set @成交数量# = -1 * @成交数量#; */
        set v_strike_qty = -1 * v_strike_qty;
        #更新资金持仓变动

        /* set @可用计算标志# = 0; */
        set v_avail_cal_flag = 0;

        /* set @组合持仓序号# = 0; */
        set v_combo_posi_id = 0;

        /* set @备注信息# = "成交回溯"; */
        set v_remark_info = "成交回溯";
        #[原子_交易证券_账户_更新指令交易资金持仓]

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
            SET v_error_code = "tdsecuT.10.71.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新成交资金持仓出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_查询所有交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_QueryAllExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_QueryAllExgpPosi(
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
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* [变量补分隔符][@证券代码编号串#] */
    set v_stock_code_no_str = concat(";", v_stock_code_no_str,";");


    /* [变量补分隔符][@证券类型串#] */
    set v_stock_type_str = concat(";", v_stock_type_str,";");


    /* 调用【原子_交易证券_交易运维_查询所有交易组持仓】*/
    call db_tdsecu.pra_tdsebk_QueryAllExgpPosi(
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
        v_exch_no_str,
        v_stock_acco_no,
        v_stock_code_no_str,
        v_stock_type_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuT.10.72.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_查询所有交易组持仓出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 事务_交易证券_交易运维_错单修改撤单回退
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_BackModiErrorOrderCancel;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_BackModiErrorOrderCancel(
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
    IN p_exch_crncy_type varchar(3),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_asset_type int,
    IN p_stock_type int,
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
    IN p_impawn_ratio decimal(18,12),
    IN p_busi_opor_no int,
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_remark_info varchar(255),
    IN p_sys_config_str varchar(64),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_busi_opor_no int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_remark_info varchar(255);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_id bigint;
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_target_stock_code_no int;
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_comm_oper_way varchar(2);
    declare v_comm_dir int;
    declare v_comm_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_order_oper_way varchar(2);
    declare v_combo_code varchar(32);
    declare v_wtdraw_remark varchar(255);
    declare v_wtdraw_status varchar(2);
    declare v_avail_cal_flag int;
    declare v_combo_posi_id bigint;
    declare v_open_posi_date int;

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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_asset_type = p_asset_type;
    SET v_stock_type = p_stock_type;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_all_fee = p_all_fee;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_remark_info = p_remark_info;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_id = 0;
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_target_stock_code_no = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_status = "0";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_executor = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_dir = 0;
    SET v_comm_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_qty = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_order_status = "0";
    SET v_order_oper_way = " ";
    SET v_combo_code = " ";
    SET v_wtdraw_remark = " ";
    SET v_wtdraw_status = "0";
    SET v_avail_cal_flag = 0;
    SET v_combo_posi_id = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;
    #set @成交费用# = @全部费用#;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* set @目标证券代码编号# =0; */
    set v_target_stock_code_no =0;

    /* [事务开始] */
    START TRANSACTION;

        #第一步，判断有无指令，回退指令、指令汇总、订单、订单汇总

        /* if @指令序号# > 0 then */
        if v_comm_id > 0 then

            /* 调用【原子_交易证券_指令_错单修改撤单回退更新指令】*/
            call db_tdsecu.pra_tdseap_BackModiErrorOrderCancelUpdateComm(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_comm_id,
                v_wtdraw_qty,
                v_error_code,
                v_error_info,
                v_limit_actual_price,
                v_comm_status,
                v_comm_date,
                v_comm_batch_no,
                v_comm_executor,
                v_comm_oper_way,
                v_comm_dir,
                v_comm_amt,
                v_comm_frozen_amt,
                v_comm_frozen_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.10.73.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_错单修改撤单回退更新指令出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @计算方向# = 《计算方向-减去》; */
            set v_calc_dir = -1;

            /* set @指令数量# = @撤单数量#; */
            set v_comm_qty = v_wtdraw_qty;

            /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_stock_type,
                v_comm_dir,
                v_limit_actual_price,
                v_comm_qty,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_calc_dir,
                v_error_code,
                v_error_info,
                v_comm_occur_amt,
                v_comm_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.10.73.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* set @备注信息# = concat('错单修改撤单回退，备注信息：',@备注信息#); */
        set v_remark_info = concat('错单修改撤单回退，备注信息：',v_remark_info);

        /* 调用【原子_交易证券_交易_回退撤单修改订单】*/
        call db_tdsecu.pra_tdsetd_BackCancelUpdateOrder(
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
            v_order_id,
            v_remark_info,
            v_all_fee,
            v_sys_config_str,
            v_error_code,
            v_error_info,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_order_status,
            v_order_dir,
            v_strike_id,
            v_order_oper_way,
            v_combo_code);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.10.73.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_回退撤单修改订单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #第二步，处理撤单表及撤单回报表？

        /* set  @撤单说明# = "撤单回退操作！"; */
        set  v_wtdraw_remark = "撤单回退操作！";

        /* set  @撤单状态# = 《撤单状态-失败》; */
        set  v_wtdraw_status = "4";

        /* 调用【原子_交易证券_交易运维_更新回退撤单状态】*/
        call db_tdsecu.pra_tdsetd_UpdateBackCancelOrderStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_date,
            v_order_id,
            v_wtdraw_status,
            v_wtdraw_remark,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.10.73.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易运维_更新回退撤单状态出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #第三步，更新资金持仓变动

        /* set @可用计算标志# = 0; */
        set v_avail_cal_flag = 0;

        /* set @组合持仓序号# = 0; */
        set v_combo_posi_id = 0;

        /* set @备注信息# = "撤单回退"; */
        set v_remark_info = "撤单回退";

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
            SET v_error_code = "tdsecuT.10.73.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
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
    SET p_strike_id = v_strike_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 事务_交易证券_交易运维_错单修改废单回退
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdsebk_BackModiErrorOrderWaste;;
DELIMITER ;;
CREATE PROCEDURE prt_tdsebk_BackModiErrorOrderWaste(
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
    IN p_exch_crncy_type varchar(3),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_asset_type int,
    IN p_stock_type int,
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
    IN p_impawn_ratio decimal(18,12),
    IN p_busi_opor_no int,
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_remark_info varchar(255),
    IN p_sys_config_str varchar(64),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_busi_opor_no int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_remark_info varchar(255);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_id bigint;
    declare v_is_record_jour int;
    declare v_open_close_permission int;
    declare v_target_stock_code_no int;
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_comm_date int;
    declare v_comm_executor int;
    declare v_comm_oper_way varchar(2);
    declare v_comm_dir int;
    declare v_comm_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);
    declare v_calc_dir int;
    declare v_comm_qty decimal(18,2);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_order_oper_way varchar(2);
    declare v_combo_code varchar(32);
    declare v_avail_cal_flag int;
    declare v_combo_posi_id bigint;
    declare v_open_posi_date int;

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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_asset_type = p_asset_type;
    SET v_stock_type = p_stock_type;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_all_fee = p_all_fee;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_remark_info = p_remark_info;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_id = 0;
    SET v_is_record_jour = 1;
    SET v_open_close_permission = 0;
    SET v_target_stock_code_no = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_status = "0";
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_executor = 0;
    SET v_comm_oper_way = " ";
    SET v_comm_dir = 0;
    SET v_comm_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;
    SET v_calc_dir = 1;
    SET v_comm_qty = 0;
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_order_status = "0";
    SET v_order_oper_way = " ";
    SET v_combo_code = " ";
    SET v_avail_cal_flag = 0;
    SET v_combo_posi_id = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @是否记录流水# = 《是否记录流水-记录》; */
    set v_is_record_jour = 1;
    #set @成交费用# = @全部费用#;

    /* set @开平仓权限# =《开平仓权限-不限制》; */
    set v_open_close_permission =0;

    /* set @目标证券代码编号# =0; */
    set v_target_stock_code_no =0;

    /* [事务开始] */
    START TRANSACTION;

        #废单会置撤单数量，废单回退可用撤单回退逻辑。
        #第一步，判断有无指令，回退指令、指令汇总、订单、订单汇总

        /* if @指令序号# > 0 then */
        if v_comm_id > 0 then

            /* 调用【原子_交易证券_指令_错单修改撤单回退更新指令】*/
            call db_tdsecu.pra_tdseap_BackModiErrorOrderCancelUpdateComm(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_comm_id,
                v_wtdraw_qty,
                v_error_code,
                v_error_info,
                v_limit_actual_price,
                v_comm_status,
                v_comm_date,
                v_comm_batch_no,
                v_comm_executor,
                v_comm_oper_way,
                v_comm_dir,
                v_comm_amt,
                v_comm_frozen_amt,
                v_comm_frozen_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.10.74.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_错单修改撤单回退更新指令出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @计算方向# = 《计算方向-减去》; */
            set v_calc_dir = -1;

            /* set @指令数量# = @撤单数量#; */
            set v_comm_qty = v_wtdraw_qty;

            /* 调用【原子_交易证券_公用_计算指令变动金额和数量】*/
            call db_tdsecu.pra_tdsepb_GetCommOccurAmtAndQty(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_stock_type,
                v_comm_dir,
                v_limit_actual_price,
                v_comm_qty,
                v_net_price_flag,
                v_par_value,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_calc_dir,
                v_error_code,
                v_error_info,
                v_comm_occur_amt,
                v_comm_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuT.10.74.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_公用_计算指令变动金额和数量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* set @备注信息# = concat('错单修改废单回退，备注信息：',@备注信息#); */
        set v_remark_info = concat('错单修改废单回退，备注信息：',v_remark_info);

        /* 调用【原子_交易证券_交易_回退废单修改订单】*/
        call db_tdsecu.pra_tdsetd_BackWasteUpdateOrder(
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
            v_order_id,
            v_remark_info,
            v_all_fee,
            v_sys_config_str,
            v_error_code,
            v_error_info,
            v_trade_occur_amt,
            v_trade_occur_qty,
            v_order_status,
            v_order_dir,
            v_strike_id,
            v_order_oper_way,
            v_combo_code);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuT.10.74.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_交易_回退废单修改订单出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        ##第二步，处理撤单表及撤单回报表？
        #set  @撤单说明# = "撤单回退操作！";
        #set  @撤单状态# = 《撤单状态-失败》;
        #[原子_交易证券_交易运维_更新回退撤单状态]
        #第三步，更新资金持仓变动

        /* set @可用计算标志# = 0; */
        set v_avail_cal_flag = 0;

        /* set @组合持仓序号# = 0; */
        set v_combo_posi_id = 0;

        /* set @备注信息# = "废单回退"; */
        set v_remark_info = "废单回退";

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
            SET v_error_code = "tdsecuT.10.74.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_更新指令交易资金持仓出现错误！',v_mysql_message);
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
    SET p_strike_id = v_strike_id;

END;;


