DELIMITER ;;
use db_rkfutu;;

# 事务_风控期货_风控_增加客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfurk_AddFutuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfurk_AddFutuClientRiskRule(
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
    IN p_model_id bigint,
    IN p_risk_item_id int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_model_name varchar(64),
    OUT p_risk_item_name varchar(64),
    OUT p_exch_no int,
    OUT p_contrc_type int,
    OUT p_order_dir_str varchar(1024),
    OUT p_trig_stage_type int,
    OUT p_compli_calc_level int,
    OUT p_unit_nav_flag int,
    OUT p_trig_type int,
    OUT p_risk_rule_id int,
    OUT p_risk_rule_type int,
    OUT p_risk_rule_name varchar(64),
    OUT p_risk_rule_code varchar(2048),
    OUT p_risk_param_str varchar(2048),
    OUT p_risk_rule_value_str varchar(255),
    OUT p_risk_rule_calc_str varchar(255),
    OUT p_corrsp_plug varchar(64),
    OUT p_risk_rule_action varchar(32),
    OUT p_begin_time int,
    OUT p_end_time int,
    OUT p_rule_flag int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_model_id bigint;
    declare v_risk_item_id int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_model_name varchar(64);
    declare v_risk_item_name varchar(64);
    declare v_exch_no int;
    declare v_contrc_type int;
    declare v_order_dir_str varchar(1024);
    declare v_trig_stage_type int;
    declare v_compli_calc_level int;
    declare v_unit_nav_flag int;
    declare v_trig_type int;
    declare v_risk_rule_id int;
    declare v_risk_rule_type int;
    declare v_risk_rule_name varchar(64);
    declare v_risk_rule_code varchar(2048);
    declare v_risk_param_str varchar(2048);
    declare v_risk_rule_value_str varchar(255);
    declare v_risk_rule_calc_str varchar(255);
    declare v_corrsp_plug varchar(64);
    declare v_risk_rule_action varchar(32);
    declare v_begin_time int;
    declare v_end_time int;
    declare v_rule_flag int;
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
    SET v_model_id = p_model_id;
    SET v_risk_item_id = p_risk_item_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_model_name = " ";
    SET v_risk_item_name = " ";
    SET v_exch_no = 0;
    SET v_contrc_type = 0;
    SET v_order_dir_str = " ";
    SET v_trig_stage_type = 0;
    SET v_compli_calc_level = 0;
    SET v_unit_nav_flag = 0;
    SET v_trig_type = 0;
    SET v_risk_rule_id = 0;
    SET v_risk_rule_type = 0;
    SET v_risk_rule_name = " ";
    SET v_risk_rule_code = " ";
    SET v_risk_param_str = " ";
    SET v_risk_rule_value_str = " ";
    SET v_risk_rule_calc_str = " ";
    SET v_corrsp_plug = " ";
    SET v_risk_rule_action = " ";
    SET v_begin_time = date_format(curtime(),'%H%i%s');
    SET v_end_time = date_format(curtime(),'%H%i%s');
    SET v_rule_flag = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* if @机构编号# = 0 then */
    if v_co_no = 0 then

        /* set @机构编号# = @操作员机构编号#; */
        set v_co_no = v_opor_co_no;
    else

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][1]["操作员不允许增加非本机构的客户风险规则！"] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rkfutuT.3.1.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("操作员不允许增加非本机构的客户风险规则！","#",v_mysql_message);
            else
                SET v_error_info = "操作员不允许增加非本机构的客户风险规则！";
            end if;
            leave label_pro;
        end if;

    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控期货_风控_增加客户风险规则记录】*/
        call db_rkfutu.pra_rkfurk_AddFutuClientRiskRule(
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
            v_model_id,
            v_risk_item_id,
            v_error_code,
            v_error_info,
            v_row_id,
            v_model_name,
            v_risk_item_name,
            v_exch_no,
            v_contrc_type,
            v_order_dir_str,
            v_trig_stage_type,
            v_compli_calc_level,
            v_unit_nav_flag,
            v_trig_type,
            v_risk_rule_id,
            v_risk_rule_type,
            v_risk_rule_name,
            v_risk_rule_code,
            v_risk_param_str,
            v_risk_rule_value_str,
            v_risk_rule_calc_str,
            v_corrsp_plug,
            v_risk_rule_action,
            v_begin_time,
            v_end_time,
            v_rule_flag,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "rkfutuT.3.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_增加客户风险规则记录出现错误！',v_mysql_message);
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
    SET p_row_id = v_row_id;
    SET p_model_name = v_model_name;
    SET p_risk_item_name = v_risk_item_name;
    SET p_exch_no = v_exch_no;
    SET p_contrc_type = v_contrc_type;
    SET p_order_dir_str = v_order_dir_str;
    SET p_trig_stage_type = v_trig_stage_type;
    SET p_compli_calc_level = v_compli_calc_level;
    SET p_unit_nav_flag = v_unit_nav_flag;
    SET p_trig_type = v_trig_type;
    SET p_risk_rule_id = v_risk_rule_id;
    SET p_risk_rule_type = v_risk_rule_type;
    SET p_risk_rule_name = v_risk_rule_name;
    SET p_risk_rule_code = v_risk_rule_code;
    SET p_risk_param_str = v_risk_param_str;
    SET p_risk_rule_value_str = v_risk_rule_value_str;
    SET p_risk_rule_calc_str = v_risk_rule_calc_str;
    SET p_corrsp_plug = v_corrsp_plug;
    SET p_risk_rule_action = v_risk_rule_action;
    SET p_begin_time = v_begin_time;
    SET p_end_time = v_end_time;
    SET p_rule_flag = v_rule_flag;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_rkfutu;;

# 事务_风控期货_风控_删除客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfurk_DeleteFutuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfurk_DeleteFutuClientRiskRule(
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
    IN p_model_id bigint,
    IN p_risk_item_id_str varchar(2048),
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
    declare v_model_id bigint;
    declare v_risk_item_id_str varchar(2048);
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
    SET v_model_id = p_model_id;
    SET v_risk_item_id_str = p_risk_item_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @风险条目序号串# <> " " then */
    if v_risk_item_id_str <> " " then

        /* set @风险条目序号串#=concat(";",@风险条目序号串#,";"); */
        set v_risk_item_id_str=concat(";",v_risk_item_id_str,";");
    end if;

    /* if @机构编号# = 0 then */
    if v_co_no = 0 then

        /* set @机构编号# = @操作员机构编号#; */
        set v_co_no = v_opor_co_no;
    else

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][1]["操作员不允许删除非本机构的客户风险规则！"] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rkfutuT.3.2.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("操作员不允许删除非本机构的客户风险规则！","#",v_mysql_message);
            else
                SET v_error_info = "操作员不允许删除非本机构的客户风险规则！";
            end if;
            leave label_pro;
        end if;

    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控期货_风控_删除客户风险规则记录】*/
        call db_rkfutu.pra_rkfurk_DeleteFutuClientRiskRule(
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
            v_model_id,
            v_risk_item_id_str,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rkfutuT.3.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_删除客户风险规则记录出现错误！',v_mysql_message);
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
use db_rkfutu;;

# 事务_风控期货_风控_查询客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfurk_QueryFutuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfurk_QueryFutuClientRiskRule(
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
    IN p_model_id bigint,
    IN p_risk_item_id_str varchar(2048),
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_order_dir_str varchar(1024),
    IN p_risk_rule_id int,
    IN p_risk_rule_type_str varchar(64),
    IN p_risk_rule_name varchar(64),
    IN p_corrsp_plug varchar(64),
    IN p_rule_flag int,
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
    declare v_model_id bigint;
    declare v_risk_item_id_str varchar(2048);
    declare v_exch_no int;
    declare v_contrc_type int;
    declare v_order_dir_str varchar(1024);
    declare v_risk_rule_id int;
    declare v_risk_rule_type_str varchar(64);
    declare v_risk_rule_name varchar(64);
    declare v_corrsp_plug varchar(64);
    declare v_rule_flag int;
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
    SET v_model_id = p_model_id;
    SET v_risk_item_id_str = p_risk_item_id_str;
    SET v_exch_no = p_exch_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir_str = p_order_dir_str;
    SET v_risk_rule_id = p_risk_rule_id;
    SET v_risk_rule_type_str = p_risk_rule_type_str;
    SET v_risk_rule_name = p_risk_rule_name;
    SET v_corrsp_plug = p_corrsp_plug;
    SET v_rule_flag = p_rule_flag;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @风险条目序号串# <> " " then */
    if v_risk_item_id_str <> " " then

        /* set @风险条目序号串#=concat(";",@风险条目序号串#,";"); */
        set v_risk_item_id_str=concat(";",v_risk_item_id_str,";");
    end if;

    /* if @风险规则类别串# <> " " then */
    if v_risk_rule_type_str <> " " then

        /* set @风险规则类别串#=concat(";",@风险规则类别串#,";"); */
        set v_risk_rule_type_str=concat(";",v_risk_rule_type_str,";");
    end if;

    /* if @机构编号# = 0 then */
    if v_co_no = 0 then

        /* set @机构编号# = @操作员机构编号#; */
        set v_co_no = v_opor_co_no;
    else

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][1]["操作员不允许设置非本机构的客户风险规则！"] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rkfutuT.3.3.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("操作员不允许设置非本机构的客户风险规则！","#",v_mysql_message);
            else
                SET v_error_info = "操作员不允许设置非本机构的客户风险规则！";
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_风控期货_风控_查询客户风险规则记录】*/
    call db_rkfutu.pra_rkfurk_QueryFutuClientRiskRule(
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
        v_model_id,
        v_risk_item_id_str,
        v_exch_no,
        v_contrc_type,
        v_order_dir_str,
        v_risk_rule_id,
        v_risk_rule_type_str,
        v_risk_rule_name,
        v_corrsp_plug,
        v_rule_flag,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rkfutuT.3.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_查询客户风险规则记录出现错误！',v_mysql_message);
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
use db_rkfutu;;

# 事务_风控期货_风控_获取客户风险要素
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfurk_GetFutuClientRiskParam;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfurk_GetFutuClientRiskParam(
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
    IN p_contrc_type int,
    IN p_order_dir_str varchar(1024),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_risk_param_str varchar(2048)
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
    declare v_contrc_type int;
    declare v_order_dir_str varchar(1024);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_risk_param_str varchar(2048);

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
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir_str = p_order_dir_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_risk_param_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控期货_风控_获取客户风险要素】*/
    call db_rkfutu.pra_rkfurk_GetFutuClientRiskParam(
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
        v_exch_no,
        v_contrc_type,
        v_order_dir_str,
        v_error_code,
        v_error_info,
        v_risk_param_str);
    if v_error_code = "1" then
        SET v_error_code = "rkfutuT.3.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_获取客户风险要素出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_risk_param_str = v_risk_param_str;

END;;


DELIMITER ;;
use db_rkfutu;;

# 事务_风控期货_风控_试算检查客户风险
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfurk_CheckCalcFutuClientRisk;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfurk_CheckCalcFutuClientRisk(
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
    IN p_hedge_type int,
    IN p_comb_code varchar(6),
    IN p_lngsht_type int,
    IN p_contrc_type int,
    IN p_contrc_code varchar(6),
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_all_fee decimal(18,4),
    IN p_rece_margin decimal(18,4),
    IN p_order_qty decimal(18,2),
    IN p_contrc_unit int,
    IN p_order_price decimal(16,9),
    IN p_trig_stage_type int,
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
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_lngsht_type int;
    declare v_contrc_type int;
    declare v_contrc_code varchar(6);
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_all_fee decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_contrc_unit int;
    declare v_order_price decimal(16,9);
    declare v_trig_stage_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_risk_param_value_str varchar(1024);
    declare v_order_dir_str varchar(1024);

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
    SET v_hedge_type = p_hedge_type;
    SET v_comb_code = p_comb_code;
    SET v_lngsht_type = p_lngsht_type;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_code = p_contrc_code;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_all_fee = p_all_fee;
    SET v_rece_margin = p_rece_margin;
    SET v_order_qty = p_order_qty;
    SET v_contrc_unit = p_contrc_unit;
    SET v_order_price = p_order_price;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_compli_trig_id = 0;
    SET v_risk_param_value_str = " ";
    SET v_order_dir_str = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控期货_风控_获取最大的合规触警流水序号】*/
      call db_rkfutu.pra_rkfurk_GetMaxComplianceTriggerId(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_error_code,
          v_error_info,
          v_compli_trig_id);
      if v_error_code = "1" then
          SET v_error_code = "rkfutuT.3.5.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_获取最大的合规触警流水序号出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


    /* [事务结束] */
    COMMIT;


    /* [事务开始] */
    START TRANSACTION;


    /* set @风险要素值串# = concat(";", "市场编号=", @市场编号#, ";", "合约类型=", @合约类型#, ";", "订单方向串=", @订单方向串#, ";", "订单数量=", @订单数量#, ";"); */
    set v_risk_param_value_str = concat(";", "市场编号=", v_exch_no, ";", "合约类型=", v_contrc_type, ";", "订单方向串=", v_order_dir_str, ";", "订单数量=", v_order_qty, ";");

    /* 调用【原子_风控期货_风控_试算检查客户风险】*/
    call db_rkfutu.pra_rkfurk_CheckCalcFutuClientRisk(
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
        v_exch_no,
        v_hedge_type,
        v_comb_code,
        v_lngsht_type,
        v_contrc_type,
        v_contrc_code,
        v_order_dir,
        v_contrc_dir,
        v_all_fee,
        v_rece_margin,
        v_order_qty,
        v_contrc_unit,
        v_order_price,
        v_trig_stage_type,
        v_compli_trig_id,
        v_risk_param_value_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rkfutuT.3.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_试算检查客户风险出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* [事务结束] */
    COMMIT;


    /* 调用【原子_风控期货_风控_获取指定序号合规触警流水】*/
    call db_rkfutu.pra_rkfurk_GetComplianceTriggerByTriggerId(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_compli_trig_id,
        v_trig_stage_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rkfutuT.3.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_获取指定序号合规触警流水出现错误！',v_mysql_message);
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
use db_rkfutu;;

# 事务_风控期货_风控_客户风险触警流水查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfurk_QuerySecuClientRiskTrig;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfurk_QuerySecuClientRiskTrig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_create_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_risk_rule_action varchar(32),
    IN p_risk_rule_type int,
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
    declare v_create_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_risk_rule_action varchar(32);
    declare v_risk_rule_type int;
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
    SET v_create_date = p_create_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_risk_rule_action = p_risk_rule_action;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控期货_风控_客户风险触警流水查询】*/
    call db_rkfutu.pra_rkfurk_QueryFutuClientRiskTrig(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_create_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_risk_rule_action,
        v_risk_rule_type,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rkfutuT.3.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_客户风险触警流水查询出现错误！',v_mysql_message);
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
use db_rkfutu;;

# 事务_风控期货_风控_模板查询客户产品交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfurk_QueryPdExchGroupByModel;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfurk_QueryPdExchGroupByModel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_model_id bigint,
    IN p_risk_rule_type_str varchar(64),
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
    declare v_model_id bigint;
    declare v_risk_rule_type_str varchar(64);
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
    SET v_model_id = p_model_id;
    SET v_risk_rule_type_str = p_risk_rule_type_str;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控期货_风控_模板查询客户产品交易组】*/
    call db_rkfutu.pra_rkfurk_QueryPdExchGroupByModel(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_model_id,
        v_risk_rule_type_str,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rkfutuT.3.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_模板查询客户产品交易组出现错误！',v_mysql_message);
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
use db_rkfutu;;

# 事务_风控期货_风控_客户风险触警历史流水查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfurk_QueryHisFutuClientRiskTrig;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfurk_QueryHisFutuClientRiskTrig(
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
    IN p_risk_rule_action varchar(32),
    IN p_risk_rule_type int,
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
    declare v_risk_rule_action varchar(32);
    declare v_risk_rule_type int;
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
    SET v_risk_rule_action = p_risk_rule_action;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控期货_风控_客户风险触警历史流水查询】*/
    call db_rkfutu.pra_rkfurk_QueryHisFutuClientRiskTrig(
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
        v_risk_rule_action,
        v_risk_rule_type,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rkfutuT.3.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_客户风险触警历史流水查询出现错误！',v_mysql_message);
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
use db_rkfutu;;

# 事务_风控期货_风控_批量试算检查客户风险
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfurk_CheckBatchCalcSecuClientRisk;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfurk_CheckBatchCalcSecuClientRisk(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_asset_acco_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_hedge_type_str varchar(64),
    IN p_comb_code_str varchar(4096),
    IN p_lngsht_type_str varchar(4096),
    IN p_contrc_type_str varchar(2048),
    IN p_contrc_code_str varchar(4096),
    IN p_order_dir_str varchar(1024),
    IN p_contrc_dir_str varchar(64),
    IN p_all_fee_str varchar(4096),
    IN p_rece_margin_str varchar(4096),
    IN p_order_qty_str varchar(4096),
    IN p_contrc_unit_str varchar(4096),
    IN p_order_price_str varchar(4096),
    IN p_trig_stage_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_client_risk_rule_id int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_compli_rules_remark varchar(255),
    OUT p_risk_rule_action varchar(32),
    OUT p_risk_rule_value_str varchar(255),
    OUT p_risk_rule_calc_str varchar(255),
    OUT p_remark_info varchar(255)
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
    declare v_exch_group_no_str varchar(2048);
    declare v_asset_acco_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_hedge_type_str varchar(64);
    declare v_comb_code_str varchar(4096);
    declare v_lngsht_type_str varchar(4096);
    declare v_contrc_type_str varchar(2048);
    declare v_contrc_code_str varchar(4096);
    declare v_order_dir_str varchar(1024);
    declare v_contrc_dir_str varchar(64);
    declare v_all_fee_str varchar(4096);
    declare v_rece_margin_str varchar(4096);
    declare v_order_qty_str varchar(4096);
    declare v_contrc_unit_str varchar(4096);
    declare v_order_price_str varchar(4096);
    declare v_trig_stage_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_client_risk_rule_id int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_compli_rules_remark varchar(255);
    declare v_risk_rule_action varchar(32);
    declare v_risk_rule_value_str varchar(255);
    declare v_risk_rule_calc_str varchar(255);
    declare v_remark_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_split_str varchar(4);
    declare v_asset_acco_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_lngsht_type int;
    declare v_contrc_dir int;
    declare v_rece_margin decimal(18,4);
    declare v_contrc_unit int;
    declare v_exch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_risk_param_value_str varchar(1024);

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
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_hedge_type_str = p_hedge_type_str;
    SET v_comb_code_str = p_comb_code_str;
    SET v_lngsht_type_str = p_lngsht_type_str;
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_contrc_code_str = p_contrc_code_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_contrc_dir_str = p_contrc_dir_str;
    SET v_all_fee_str = p_all_fee_str;
    SET v_rece_margin_str = p_rece_margin_str;
    SET v_order_qty_str = p_order_qty_str;
    SET v_contrc_unit_str = p_contrc_unit_str;
    SET v_order_price_str = p_order_price_str;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_client_risk_rule_id = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_compli_rules_remark = " ";
    SET v_risk_rule_action = " ";
    SET v_risk_rule_value_str = " ";
    SET v_risk_rule_calc_str = " ";
    SET v_remark_info = " ";
    SET v_compli_trig_id = 0;
    SET v_split_str = " ";
    SET v_asset_acco_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_hedge_type = 0;
    SET v_comb_code = " ";
    SET v_lngsht_type = 0;
    SET v_contrc_dir = 0;
    SET v_rece_margin = 0;
    SET v_contrc_unit = 0;
    SET v_exch_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_all_fee = 0;
    SET v_risk_param_value_str = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控期货_风控_获取最大的合规触警流水序号】*/
      call db_rkfutu.pra_rkfurk_GetMaxComplianceTriggerId(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_error_code,
          v_error_info,
          v_compli_trig_id);
      if v_error_code = "1" then
          SET v_error_code = "rkfutuT.3.9.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_获取最大的合规触警流水序号出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


    /* [事务结束] */
    COMMIT;


    /* set @分隔符# = ";"; */
    set v_split_str = ";";

    /* while LOCATE(@分隔符#,@合约代码串#)<>0   do */
    while LOCATE(v_split_str,v_contrc_code_str)<>0   do

    /* [事务开始] */
    START TRANSACTION;

        #截取前面每一位

        /* set @产品编号#=cast(substring(@产品编号串#,1,LOCATE(@分隔符#,@产品编号串#)-1) as SIGNED); */
        set v_pd_no=cast(substring(v_pd_no_str,1,LOCATE(v_split_str,v_pd_no_str)-1) as SIGNED);

        /* set @交易组编号#=cast(substring(@交易组编号串#,1,LOCATE(@分隔符#,@交易组编号串#)-1) as SIGNED); */
        set v_exch_group_no=cast(substring(v_exch_group_no_str,1,LOCATE(v_split_str,v_exch_group_no_str)-1) as SIGNED);

        /* set @资产账户编号#=cast(substring(@资产账户编号串#,1,LOCATE(@分隔符#,@资产账户编号串#)-1) as SIGNED); */
        set v_asset_acco_no=cast(substring(v_asset_acco_no_str,1,LOCATE(v_split_str,v_asset_acco_no_str)-1) as SIGNED);

        /* set @合约代码#=substring(@合约代码串#,1,LOCATE(@分隔符#,@合约代码串#)-1); */
        set v_contrc_code=substring(v_contrc_code_str,1,LOCATE(v_split_str,v_contrc_code_str)-1);

        /* set @合约类型#=substring(@合约类型串#,1,LOCATE(@分隔符#,@合约类型串#)-1); */
        set v_contrc_type=substring(v_contrc_type_str,1,LOCATE(v_split_str,v_contrc_type_str)-1);

        /* set @套保标志#=substring(@套保标志串#,1,LOCATE(@分隔符#,@套保标志串#)-1); */
        set v_hedge_type=substring(v_hedge_type_str,1,LOCATE(v_split_str,v_hedge_type_str)-1);

        /* set @组合编码#=substring(@组合编码串#,1,LOCATE(@分隔符#,@组合编码串#)-1); */
        set v_comb_code=substring(v_comb_code_str,1,LOCATE(v_split_str,v_comb_code_str)-1);

        /* set @多空类型#=cast(substring(@多空类型串#,1,LOCATE(@分隔符#,@多空类型串#)-1) as SIGNED); */
        set v_lngsht_type=cast(substring(v_lngsht_type_str,1,LOCATE(v_split_str,v_lngsht_type_str)-1) as SIGNED);

        /* set @开平方向#=cast(substring(@开平方向串#,1,LOCATE(@分隔符#,@开平方向串#)-1) as SIGNED); */
        set v_contrc_dir=cast(substring(v_contrc_dir_str,1,LOCATE(v_split_str,v_contrc_dir_str)-1) as SIGNED);

        /* set @应收保证金#=cast(substring(@应收保证金串#,1,LOCATE(@分隔符#,@应收保证金串#)-1) as decimal(32,6)); */
        set v_rece_margin=cast(substring(v_rece_margin_str,1,LOCATE(v_split_str,v_rece_margin_str)-1) as decimal(32,6));

        /* set @合约乘数#=cast(substring(@合约乘数串#,1,LOCATE(@分隔符#,@合约乘数串#)-1) as SIGNED); */
        set v_contrc_unit=cast(substring(v_contrc_unit_str,1,LOCATE(v_split_str,v_contrc_unit_str)-1) as SIGNED);

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @订单方向#=cast(substring(@订单方向串#,1,LOCATE(@分隔符#,@订单方向串#)-1) as SIGNED); */
        set v_order_dir=cast(substring(v_order_dir_str,1,LOCATE(v_split_str,v_order_dir_str)-1) as SIGNED);

        /* set @订单价格#=cast(substring(@订单价格串#,1,LOCATE(@分隔符#,@订单价格串#)-1) as decimal(16,9)); */
        set v_order_price=cast(substring(v_order_price_str,1,LOCATE(v_split_str,v_order_price_str)-1) as decimal(16,9));

        /* set @订单数量#=cast(substring(@订单数量串#,1,LOCATE(@分隔符#,@订单数量串#)-1) as decimal(18,2)); */
        set v_order_qty=cast(substring(v_order_qty_str,1,LOCATE(v_split_str,v_order_qty_str)-1) as decimal(18,2));
        #set @交易币种#=substring(@交易币种串#,1,LOCATE(@分隔符#,@交易币种串#)-1);

        /* set @全部费用#=cast(substring(@全部费用串#,1,LOCATE(@分隔符#,@全部费用串#)-1) as decimal(32,6)); */
        set v_all_fee=cast(substring(v_all_fee_str,1,LOCATE(v_split_str,v_all_fee_str)-1) as decimal(32,6));
        #[原子_风控证券_风控_增加交易流水记录]

        /* set @风险要素值串# = concat(";", "市场编号=", @市场编号#, ";", "合约类型=", @合约类型#, ";", "订单方向串=", @订单方向串#, ";", "订单数量=", @订单数量#, ";"); */
        set v_risk_param_value_str = concat(";", "市场编号=", v_exch_no, ";", "合约类型=", v_contrc_type, ";", "订单方向串=", v_order_dir_str, ";", "订单数量=", v_order_qty, ";");

        /* 调用【原子_风控期货_风控_试算检查客户风险】*/
        call db_rkfutu.pra_rkfurk_CheckCalcFutuClientRisk(
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
            v_exch_no,
            v_hedge_type,
            v_comb_code,
            v_lngsht_type,
            v_contrc_type,
            v_contrc_code,
            v_order_dir,
            v_contrc_dir,
            v_all_fee,
            v_rece_margin,
            v_order_qty,
            v_contrc_unit,
            v_order_price,
            v_trig_stage_type,
            v_compli_trig_id,
            v_risk_param_value_str,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rkfutuT.3.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_试算检查客户风险出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @产品编号串#=substring(@产品编号串#,LOCATE(@分隔符#,@产品编号串#)+1); */
        set v_pd_no_str=substring(v_pd_no_str,LOCATE(v_split_str,v_pd_no_str)+1);

        /* set @交易组编号串#=substring(@交易组编号串#,LOCATE(@分隔符#,@交易组编号串#)+1); */
        set v_exch_group_no_str=substring(v_exch_group_no_str,LOCATE(v_split_str,v_exch_group_no_str)+1);

        /* set @资产账户编号串#=substring(@资产账户编号串#,LOCATE(@分隔符#,@资产账户编号串#)+1); */
        set v_asset_acco_no_str=substring(v_asset_acco_no_str,LOCATE(v_split_str,v_asset_acco_no_str)+1);

        /* set @合约代码串#=substring(@合约代码串#,LOCATE(@分隔符#,@合约代码串#)+1); */
        set v_contrc_code_str=substring(v_contrc_code_str,LOCATE(v_split_str,v_contrc_code_str)+1);

        /* set @合约类型串#=substring(@合约类型串#,LOCATE(@分隔符#,@合约类型串#)+1); */
        set v_contrc_type_str=substring(v_contrc_type_str,LOCATE(v_split_str,v_contrc_type_str)+1);

        /* set @套保标志串#=substring(@套保标志串#,LOCATE(@分隔符#,@套保标志串#)+1); */
        set v_hedge_type_str=substring(v_hedge_type_str,LOCATE(v_split_str,v_hedge_type_str)+1);

        /* set @组合编码串#=substring(@组合编码串#,LOCATE(@分隔符#,@组合编码串#)+1); */
        set v_comb_code_str=substring(v_comb_code_str,LOCATE(v_split_str,v_comb_code_str)+1);

        /* set @多空类型串#=substring(@多空类型串#,LOCATE(@分隔符#,@多空类型串#)+1); */
        set v_lngsht_type_str=substring(v_lngsht_type_str,LOCATE(v_split_str,v_lngsht_type_str)+1);

        /* set @开平方向串#=substring(@开平方向串#,LOCATE(@分隔符#,@开平方向串#)+1); */
        set v_contrc_dir_str=substring(v_contrc_dir_str,LOCATE(v_split_str,v_contrc_dir_str)+1);

        /* set @应收保证金串#=substring(@应收保证金串#,LOCATE(@分隔符#,@应收保证金串#)+1); */
        set v_rece_margin_str=substring(v_rece_margin_str,LOCATE(v_split_str,v_rece_margin_str)+1);

        /* set @合约乘数串#=substring(@合约乘数串#,LOCATE(@分隔符#,@合约乘数串#)+1); */
        set v_contrc_unit_str=substring(v_contrc_unit_str,LOCATE(v_split_str,v_contrc_unit_str)+1);

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @订单方向串#=substring(@订单方向串#,LOCATE(@分隔符#,@订单方向串#)+1); */
        set v_order_dir_str=substring(v_order_dir_str,LOCATE(v_split_str,v_order_dir_str)+1);

        /* set @订单价格串#=substring(@订单价格串#,LOCATE(@分隔符#,@订单价格串#)+1); */
        set v_order_price_str=substring(v_order_price_str,LOCATE(v_split_str,v_order_price_str)+1);

        /* set @订单数量串#=substring(@订单数量串#,LOCATE(@分隔符#,@订单数量串#)+1); */
        set v_order_qty_str=substring(v_order_qty_str,LOCATE(v_split_str,v_order_qty_str)+1);
        #set @交易币种串#=substring(@交易币种串#,LOCATE(@分隔符#,@交易币种串#)+1);

        /* set @全部费用串#=substring(@全部费用串#,LOCATE(@分隔符#,@全部费用串#)+1); */
        set v_all_fee_str=substring(v_all_fee_str,LOCATE(v_split_str,v_all_fee_str)+1);
        #[更新表记录][风控证券_风控_交易流水记录表][{变动数量} = 0 , {变动金额} = 0, {全部费用} = 0, {交易金额} = 0][{机构编号} = @机构编号# and {机构编号} = @机构编号# and {产品编号} = @产品编号# and {交易组编号} = @交易组编号#  and {交易币种} = @交易币种# and {市场编号} = @市场编号# and {证券代码} = @证券代码#][3][@机构编号#]

    /* [事务结束] */
    COMMIT;

    end while;

    /* set @风险采取行为# = " "; */
    set v_risk_rule_action = " ";

    /* 调用【原子_风控证券_风控_获取指定序号合规触警流水】*/
    call db_rksecu.pra_rkserk_GetComplianceTriggerByTriggerId(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_compli_trig_id,
        v_trig_stage_type,
        v_risk_rule_action,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rkfutuT.3.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取指定序号合规触警流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_client_risk_rule_id = v_client_risk_rule_id;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_compli_rules_remark = v_compli_rules_remark;
    SET p_risk_rule_action = v_risk_rule_action;
    SET p_risk_rule_value_str = v_risk_rule_value_str;
    SET p_risk_rule_calc_str = v_risk_rule_calc_str;
    SET p_remark_info = v_remark_info;

END;;


