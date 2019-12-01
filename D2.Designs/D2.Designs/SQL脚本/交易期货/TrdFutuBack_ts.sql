DELIMITER ;;
use db_tdfutu;;

# 事务_交易期货_交易运维_查询订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfubk_QueryOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfubk_QueryOrder(
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
    declare v_order_no_str varchar(2048);

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
    SET v_order_no_str = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数# > 500 or @指定行数# <1 then */
    if v_row_count > 500 or v_row_count <1 then

      /* set @指定行数# = 500; */
      set v_row_count = 500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
        set v_exch_no_str = concat(";", v_exch_no_str, ";");
    end if;

    /* if @合约类型串# <> " " then */
    if v_contrc_type_str <> " " then

        /* set @合约类型串# = concat(";", @合约类型串#, ";"); */
        set v_contrc_type_str = concat(";", v_contrc_type_str, ";");
    end if;

    /* if @订单编号串# <> " " then */
    if v_order_no_str <> " " then

        /* set @订单编号串# = concat(";", @订单编号串#, ";"); */
        set v_order_no_str = concat(";", v_order_no_str, ";");
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

    /* 调用【原子_交易期货_交易运维_查询订单】*/
    call db_tdfutu.pra_tdfubk_QueryOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_pass_no,
        v_exch_no_str,
        v_contrc_code_no,
        v_contrc_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_comm_opor,
        v_external_no,
        v_order_batch_no,
        v_order_id,
        v_order_dir_str,
        v_order_status_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.8.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易运维_查询订单出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_交易运维_查询订单历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfubk_QueryOrder_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfubk_QueryOrder_His(
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
    

    /* if @指定行数# > 500 or @指定行数# <1 then */
    if v_row_count > 500 or v_row_count <1 then

      /* set @指定行数# = 500; */
      set v_row_count = 500;
    end if;

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][259][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdfutuT.8.2.259";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdfutuT.8.2.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>90][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>90 then
        
        SET v_error_code = "tdfutuT.8.2.255";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
        set v_exch_no_str = concat(";", v_exch_no_str, ";");
    end if;

    /* if @合约类型串# <> " " then */
    if v_contrc_type_str <> " " then

        /* set @合约类型串# = concat(";", @合约类型串#, ";"); */
        set v_contrc_type_str = concat(";", v_contrc_type_str, ";");
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

    /* 调用【原子_交易期货_交易运维_查询订单历史】*/
    call db_tdfutu.pra_tdfubk_QueryOrder_His(
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
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_pass_no,
        v_exch_no_str,
        v_contrc_code_no,
        v_contrc_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_comm_opor,
        v_external_no,
        v_order_batch_no,
        v_order_id,
        v_order_dir_str,
        v_order_status_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.8.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易运维_查询订单历史出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_交易运维_查询订单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfubk_QueryOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfubk_QueryOrderRsp(
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

    /* if @订单编号串# <> " " then */
    if v_order_no_str <> " " then

        /* set @订单编号串#=concat(";", @订单编号串#, ";"); */
        set v_order_no_str=concat(";", v_order_no_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* if @回报状态串# <> " " then */
    if v_rsp_status_str <> " " then

        /* set @回报状态串#=concat(";", @回报状态串#, ";"); */
        set v_rsp_status_str=concat(";", v_rsp_status_str, ";");
    end if;

    /* if @处理状态串# <> " " then */
    if v_deal_status_str <> " " then

        /* set @处理状态串#=concat(";", @处理状态串#, ";"); */
        set v_deal_status_str=concat(";", v_deal_status_str, ";");
    end if;

    /* 调用【原子_交易期货_交易运维_查询订单回报】*/
    call db_tdfutu.pra_tdfubk_QueryOrderRsp(
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
        v_futu_acco,
        v_contrc_code,
        v_order_no_str,
        v_order_dir_str,
        v_rsp_status_str,
        v_deal_status_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.8.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易运维_查询订单回报出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_交易运维_查询成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfubk_QueryStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfubk_QueryStrikeRsp(
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

    /* if @申报编号串# <> " " then */
    if v_report_no_str <> " " then

        /* set @申报编号串#=concat(";", @申报编号串#, ";"); */
        set v_report_no_str=concat(";", v_report_no_str, ";");
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

    /* 调用【原子_交易期货_交易运维_查询成交回报】*/
    call db_tdfutu.pra_tdfubk_QueryStrikeRsp(
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
        v_futu_acco,
        v_contrc_code,
        v_report_no_str,
        v_order_dir_str,
        v_deal_status_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.8.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易运维_查询成交回报出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_交易运维_查询成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfubk_QueryStrikeDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfubk_QueryStrikeDetail(
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

    /* if @合约类型串# <> " " then */
    if v_contrc_type_str <> " " then

        /* set @合约类型串#=concat(";", @合约类型串#, ";"); */
        set v_contrc_type_str=concat(";", v_contrc_type_str, ";");
    end if;

    /* if @订单编号串# <> " " then */
    if v_order_no_str <> " " then

        /* set @订单编号串#=concat(";", @订单编号串#, ";"); */
        set v_order_no_str=concat(";", v_order_no_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* 调用【原子_交易期货_交易运维_查询成交明细】*/
    call db_tdfutu.pra_tdfubk_QueryStrikeDetail(
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
        v_pass_no,
        v_exch_no_str,
        v_contrc_code_no,
        v_contrc_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_order_no_str,
        v_order_dir_str,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.8.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易运维_查询成交明细出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_交易运维_查询成交明细历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfubk_QueryStrikeDetail_His;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfubk_QueryStrikeDetail_His(
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
    

    /* [检查报错返回][@开始日期# = 0 or @结束日期# = 0][256][@开始日期#,@结束日期#] */
    if v_begin_date = 0 or v_end_date = 0 then
        
        SET v_error_code = "tdfutuT.8.6.256";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@结束日期# < @开始日期#][254][@开始日期#,@结束日期#] */
    if v_end_date < v_begin_date then
        
        SET v_error_code = "tdfutuT.8.6.254";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("开始日期=",v_begin_date,",","结束日期=",v_end_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("开始日期=",v_begin_date,",","结束日期=",v_end_date);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][datediff(@结束日期#,@开始日期#)>90][255][@开始日期#,@结束日期#] */
    if datediff(v_end_date,v_begin_date)>90 then
        
        SET v_error_code = "tdfutuT.8.6.255";
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

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串#=concat(";", @市场编号串#, ";"); */
        set v_exch_no_str=concat(";", v_exch_no_str, ";");
    end if;

    /* if @合约类型串# <> " " then */
    if v_contrc_type_str <> " " then

        /* set @合约类型串#=concat(";", @合约类型串#, ";"); */
        set v_contrc_type_str=concat(";", v_contrc_type_str, ";");
    end if;

    /* if @订单方向串# <> " " then */
    if v_order_dir_str <> " " then

        /* set @订单方向串#=concat(";", @订单方向串#, ";"); */
        set v_order_dir_str=concat(";", v_order_dir_str, ";");
    end if;

    /* 调用【原子_交易期货_交易运维_查询成交明细历史】*/
    call db_tdfutu.pra_tdfubk_QueryStrikeDetail_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_pass_no,
        v_exch_no_str,
        v_contrc_code_no,
        v_contrc_type_str,
        v_comm_id,
        v_comm_batch_no,
        v_order_dir_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.8.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易运维_查询成交明细历史出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_交易运维_查询撤单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfubk_QueryCancel;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfubk_QueryCancel(
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
    

    /* if @指定行数# > 500 or @指定行数# <1 then */
    if v_row_count > 500 or v_row_count <1 then

      /* set @指定行数# = 500; */
      set v_row_count = 500;
    end if;

    /* if @市场编号串# <> " " then */
    if v_exch_no_str <> " " then

        /* set @市场编号串# = concat(";", @市场编号串#, ";"); */
        set v_exch_no_str = concat(";", v_exch_no_str, ";");
    end if;

    /* 调用【原子_交易期货_交易运维_查询撤单】*/
    call db_tdfutu.pra_tdfubk_QueryCancel(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_pass_no,
        v_exch_no_str,
        v_contrc_code_no,
        v_external_no,
        v_order_id,
        v_row_id,
        v_row_count,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.8.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易运维_查询撤单出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_交易运维_查询机构统计异常订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfubk_QueryConoExceptionOrder;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfubk_QueryConoExceptionOrder(
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

    
    label_pro:BEGIN
    

    /* 调用【原子_交易期货_交易运维_查询机构统计异常订单】*/
    call db_tdfutu.pra_tdfubk_QueryConoExceptionOrder(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_order_status_str,
        v_order_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdfutuT.8.80.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易运维_查询机构统计异常订单出现错误！',v_mysql_message);
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
use db_tdfutu;;

# 事务_交易期货_交易运维_查询机构统计异常订单数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tdfubk_QueryConoExceptionOrderCnt;;
DELIMITER ;;
CREATE PROCEDURE prt_tdfubk_QueryConoExceptionOrderCnt(
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
    

    /* 调用【原子_交易期货_交易运维_查询机构统计异常订单数量】*/
    call db_tdfutu.pra_tdfubk_QueryConoExceptionOrderCnt(
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
        SET v_error_code = "tdfutuT.8.81.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易期货_交易运维_查询机构统计异常订单数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


