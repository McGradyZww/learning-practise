DELIMITER ;;
use db_rkfutu;;

# 事务_风控期货_公用_查询风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfupb_QueryFutuRiskRule;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfupb_QueryFutuRiskRule(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_risk_rule_type int,
    IN p_risk_rule_name varchar(64),
    IN p_corrsp_plug varchar(64),
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
    declare v_co_no int;
    declare v_risk_rule_type int;
    declare v_risk_rule_name varchar(64);
    declare v_corrsp_plug varchar(64);
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
    SET v_co_no = p_co_no;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_risk_rule_name = p_risk_rule_name;
    SET v_corrsp_plug = p_corrsp_plug;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控期货_公用_查询风险规则记录】*/
    call db_rkfutu.pra_rkfupb_QueryFutuRiskRule(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_co_no,
        v_risk_rule_type,
        v_risk_rule_name,
        v_corrsp_plug,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rkfutuT.1.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_公用_查询风险规则记录出现错误！',v_mysql_message);
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

# 事务_风控期货_公用_增加风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfupb_AddFutuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfupb_AddFutuRiskItem(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_risk_item_name varchar(64),
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_order_dir_str varchar(1024),
    IN p_trig_stage_type int,
    IN p_compli_calc_level int,
    IN p_unit_nav_flag int,
    IN p_trig_type int,
    IN p_risk_rule_id int,
    IN p_risk_rule_type int,
    IN p_risk_rule_name varchar(64),
    IN p_risk_rule_code varchar(2048),
    IN p_risk_rule_value_str varchar(255),
    IN p_corrsp_plug varchar(64),
    IN p_risk_rule_action varchar(32),
    IN p_begin_time int,
    IN p_end_time int,
    IN p_rule_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint
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
    declare v_risk_rule_value_str varchar(255);
    declare v_corrsp_plug varchar(64);
    declare v_risk_rule_action varchar(32);
    declare v_begin_time int;
    declare v_end_time int;
    declare v_rule_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;

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
    SET v_risk_item_name = p_risk_item_name;
    SET v_exch_no = p_exch_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir_str = p_order_dir_str;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_unit_nav_flag = p_unit_nav_flag;
    SET v_trig_type = p_trig_type;
    SET v_risk_rule_id = p_risk_rule_id;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_risk_rule_name = p_risk_rule_name;
    SET v_risk_rule_code = p_risk_rule_code;
    SET v_risk_rule_value_str = p_risk_rule_value_str;
    SET v_corrsp_plug = p_corrsp_plug;
    SET v_risk_rule_action = p_risk_rule_action;
    SET v_begin_time = p_begin_time;
    SET v_end_time = p_end_time;
    SET v_rule_flag = p_rule_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* if @机构编号# = 0 then */
    if v_co_no = 0 then

        /* set @机构编号# = @操作员机构编号#; */
        set v_co_no = v_opor_co_no;
    else

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][1]["操作员不允许增加非本机构的风险条目！"] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rkfutuT.1.5.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("操作员不允许增加非本机构的风险条目！","#",v_mysql_message);
            else
                SET v_error_info = "操作员不允许增加非本机构的风险条目！";
            end if;
            leave label_pro;
        end if;

    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控期货_公用_增加风险条目记录】*/
        call db_rkfutu.pra_rkfupb_AddFutuRiskItem(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
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
            v_risk_rule_value_str,
            v_corrsp_plug,
            v_risk_rule_action,
            v_begin_time,
            v_end_time,
            v_rule_flag,
            v_error_code,
            v_error_info,
            v_row_id);
        if v_error_code = "1" then
            SET v_error_code = "rkfutuT.1.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_公用_增加风险条目记录出现错误！',v_mysql_message);
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

END;;


DELIMITER ;;
use db_rkfutu;;

# 事务_风控期货_公用_修改风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfupb_ModiFutuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfupb_ModiFutuRiskItem(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_risk_item_name varchar(64),
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_order_dir_str varchar(1024),
    IN p_trig_stage_type int,
    IN p_compli_calc_level int,
    IN p_unit_nav_flag int,
    IN p_trig_type int,
    IN p_risk_rule_id int,
    IN p_risk_rule_type int,
    IN p_risk_rule_name varchar(64),
    IN p_risk_rule_code varchar(2048),
    IN p_risk_rule_value_str varchar(255),
    IN p_corrsp_plug varchar(64),
    IN p_risk_rule_action varchar(32),
    IN p_begin_time int,
    IN p_end_time int,
    IN p_rule_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_change_risk_rule_code varchar(2048),
    OUT p_change_risk_param_str varchar(2048)
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
    declare v_co_no int;
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
    declare v_risk_rule_value_str varchar(255);
    declare v_corrsp_plug varchar(64);
    declare v_risk_rule_action varchar(32);
    declare v_begin_time int;
    declare v_end_time int;
    declare v_rule_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_change_risk_rule_code varchar(2048);
    declare v_change_risk_param_str varchar(2048);

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
    SET v_co_no = p_co_no;
    SET v_risk_item_name = p_risk_item_name;
    SET v_exch_no = p_exch_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir_str = p_order_dir_str;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_unit_nav_flag = p_unit_nav_flag;
    SET v_trig_type = p_trig_type;
    SET v_risk_rule_id = p_risk_rule_id;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_risk_rule_name = p_risk_rule_name;
    SET v_risk_rule_code = p_risk_rule_code;
    SET v_risk_rule_value_str = p_risk_rule_value_str;
    SET v_corrsp_plug = p_corrsp_plug;
    SET v_risk_rule_action = p_risk_rule_action;
    SET v_begin_time = p_begin_time;
    SET v_end_time = p_end_time;
    SET v_rule_flag = p_rule_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_change_risk_rule_code = " ";
    SET v_change_risk_param_str = " ";

    
    label_pro:BEGIN
    

    /* if @机构编号# = 0 then */
    if v_co_no = 0 then

        /* set @机构编号# = @操作员机构编号#; */
        set v_co_no = v_opor_co_no;
    else

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][1]["操作员不允许修改非本机构的风险条目！"] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rkfutuT.1.6.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("操作员不允许修改非本机构的风险条目！","#",v_mysql_message);
            else
                SET v_error_info = "操作员不允许修改非本机构的风险条目！";
            end if;
            leave label_pro;
        end if;

    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控期货_公用_修改风险条目记录】*/
        call db_rkfutu.pra_rkfupb_ModiFutuRiskItem(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_co_no,
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
            v_risk_rule_value_str,
            v_corrsp_plug,
            v_risk_rule_action,
            v_begin_time,
            v_end_time,
            v_rule_flag,
            v_error_code,
            v_error_info,
            v_change_risk_rule_code,
            v_change_risk_param_str);
        if v_error_code = "1" then
            SET v_error_code = "rkfutuT.1.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_公用_修改风险条目记录出现错误！',v_mysql_message);
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
    SET p_change_risk_rule_code = v_change_risk_rule_code;
    SET p_change_risk_param_str = v_change_risk_param_str;

END;;


DELIMITER ;;
use db_rkfutu;;

# 事务_风控期货_公用_更新风险条目记录启用标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfupb_UpdateFutuRiskItemFlag;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfupb_UpdateFutuRiskItemFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_risk_item_id_str varchar(2048),
    IN p_risk_item_name varchar(64),
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_order_dir_str varchar(1024),
    IN p_risk_rule_id int,
    IN p_risk_rule_type int,
    IN p_risk_rule_name varchar(64),
    IN p_corrsp_plug varchar(64),
    IN p_rule_flag int,
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
    declare v_risk_item_id_str varchar(2048);
    declare v_risk_item_name varchar(64);
    declare v_exch_no int;
    declare v_contrc_type int;
    declare v_order_dir_str varchar(1024);
    declare v_risk_rule_id int;
    declare v_risk_rule_type int;
    declare v_risk_rule_name varchar(64);
    declare v_corrsp_plug varchar(64);
    declare v_rule_flag int;
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
    SET v_risk_item_id_str = p_risk_item_id_str;
    SET v_risk_item_name = p_risk_item_name;
    SET v_exch_no = p_exch_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir_str = p_order_dir_str;
    SET v_risk_rule_id = p_risk_rule_id;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_risk_rule_name = p_risk_rule_name;
    SET v_corrsp_plug = p_corrsp_plug;
    SET v_rule_flag = p_rule_flag;
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

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][1]["操作员不允许更新非本机构的风险条目启用标志！"] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rkfutuT.1.7.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("操作员不允许更新非本机构的风险条目启用标志！","#",v_mysql_message);
            else
                SET v_error_info = "操作员不允许更新非本机构的风险条目启用标志！";
            end if;
            leave label_pro;
        end if;

    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控期货_公用_更新风险条目记录启用标志】*/
        call db_rkfutu.pra_rkfupb_UpdateFutuRiskItemFlag(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_risk_item_id_str,
            v_risk_item_name,
            v_exch_no,
            v_contrc_type,
            v_order_dir_str,
            v_risk_rule_id,
            v_risk_rule_type,
            v_risk_rule_name,
            v_corrsp_plug,
            v_rule_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rkfutuT.1.7.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_公用_更新风险条目记录启用标志出现错误！',v_mysql_message);
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

# 事务_风控期货_公用_删除风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfupb_DeleteFutuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfupb_DeleteFutuRiskItem(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_risk_item_id_str varchar(2048),
    IN p_risk_item_name varchar(64),
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
    declare v_risk_item_id_str varchar(2048);
    declare v_risk_item_name varchar(64);
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
    SET v_risk_item_id_str = p_risk_item_id_str;
    SET v_risk_item_name = p_risk_item_name;
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

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][1]["操作员不允许删除非本机构的风险条目！"] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rkfutuT.1.8.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("操作员不允许删除非本机构的风险条目！","#",v_mysql_message);
            else
                SET v_error_info = "操作员不允许删除非本机构的风险条目！";
            end if;
            leave label_pro;
        end if;

    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控期货_公用_删除风险条目记录】*/
        call db_rkfutu.pra_rkfupb_DeleteFutuRiskItem(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_risk_item_id_str,
            v_risk_item_name,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rkfutuT.1.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_公用_删除风险条目记录出现错误！',v_mysql_message);
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

# 事务_风控期货_公用_查询风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfupb_QueryFutuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfupb_QueryFutuRiskItem(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_risk_item_id_str varchar(2048),
    IN p_risk_item_name varchar(64),
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_order_dir_str varchar(1024),
    IN p_risk_rule_id int,
    IN p_risk_rule_type int,
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
    declare v_risk_item_id_str varchar(2048);
    declare v_risk_item_name varchar(64);
    declare v_exch_no int;
    declare v_contrc_type int;
    declare v_order_dir_str varchar(1024);
    declare v_risk_rule_id int;
    declare v_risk_rule_type int;
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
    SET v_risk_item_id_str = p_risk_item_id_str;
    SET v_risk_item_name = p_risk_item_name;
    SET v_exch_no = p_exch_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir_str = p_order_dir_str;
    SET v_risk_rule_id = p_risk_rule_id;
    SET v_risk_rule_type = p_risk_rule_type;
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

    /* if @机构编号# = 0 then */
    if v_co_no = 0 then

        /* set @机构编号# = @操作员机构编号#; */
        set v_co_no = v_opor_co_no;
    else

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][1]["操作员不允许查询非本机构的风险条目！"] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rkfutuT.1.9.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("操作员不允许查询非本机构的风险条目！","#",v_mysql_message);
            else
                SET v_error_info = "操作员不允许查询非本机构的风险条目！";
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_风控期货_公用_查询风险条目记录】*/
    call db_rkfutu.pra_rkfupb_QueryFutuRiskItem(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_risk_item_id_str,
        v_risk_item_name,
        v_exch_no,
        v_contrc_type,
        v_order_dir_str,
        v_risk_rule_id,
        v_risk_rule_type,
        v_risk_rule_name,
        v_corrsp_plug,
        v_rule_flag,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rkfutuT.1.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_公用_查询风险条目记录出现错误！',v_mysql_message);
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

# 事务_风控期货_公用_增加风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfupb_AddFutuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfupb_AddFutuRiskModel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_model_name varchar(64),
    IN p_remark_info varchar(255),
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
    declare v_model_name varchar(64);
    declare v_remark_info varchar(255);
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
    SET v_model_name = p_model_name;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @机构编号# = 0 then */
    if v_co_no = 0 then

        /* set @机构编号# = @操作员机构编号#; */
        set v_co_no = v_opor_co_no;
    else

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][1]["操作员不允许增加非本机构的风险模板！"] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rkfutuT.1.10.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("操作员不允许增加非本机构的风险模板！","#",v_mysql_message);
            else
                SET v_error_info = "操作员不允许增加非本机构的风险模板！";
            end if;
            leave label_pro;
        end if;

    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控期货_公用_增加风险模板记录】*/
        call db_rkfutu.pra_rkfupb_AddFutuRiskModel(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_model_name,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rkfutuT.1.10.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_公用_增加风险模板记录出现错误！',v_mysql_message);
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

# 事务_风控期货_公用_删除风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfupb_DeleteFutuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfupb_DeleteFutuRiskModel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_model_id bigint,
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @机构编号# = 0 then */
    if v_co_no = 0 then

        /* set @机构编号# = @操作员机构编号#; */
        set v_co_no = v_opor_co_no;
    else

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][50][@机构编号#] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rkfutuT.1.11.50";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控期货_公用_删除风险模板记录】*/
        call db_rkfutu.pra_rkfupb_DeleteFutuRiskModel(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_model_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rkfutuT.1.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_公用_删除风险模板记录出现错误！',v_mysql_message);
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

# 事务_风控期货_公用_修改风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfupb_ModiSecuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfupb_ModiSecuRiskModel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_model_id bigint,
    IN p_model_name varchar(64),
    IN p_remark_info varchar(255),
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
    declare v_model_name varchar(64);
    declare v_remark_info varchar(255);
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
    SET v_model_name = p_model_name;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @机构编号# = 0 then */
    if v_co_no = 0 then

        /* set @机构编号# = @操作员机构编号#; */
        set v_co_no = v_opor_co_no;
    else

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][50][@机构编号#] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rkfutuT.1.12.50";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控期货_公用_修改风险模板记录】*/
        call db_rkfutu.pra_rkfupb_ModiSecuRiskModel(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_model_id,
            v_model_name,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rkfutuT.1.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_公用_修改风险模板记录出现错误！',v_mysql_message);
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

# 事务_风控期货_公用_查询风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfupb_QuerySecuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfupb_QuerySecuRiskModel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_model_id bigint,
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
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @机构编号# = 0 then */
    if v_co_no = 0 then

        /* set @机构编号# = @操作员机构编号#; */
        set v_co_no = v_opor_co_no;
    else

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][50][@机构编号#] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rkfutuT.1.13.50";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_风控期货_公用_查询风险模板记录】*/
    call db_rkfutu.pra_rkfupb_QuerySecuRiskModel(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_model_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rkfutuT.1.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_公用_查询风险模板记录出现错误！',v_mysql_message);
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

# 事务_风控期货_公用_增加风险模板条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfupb_AddSecuRiskModelItem;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfupb_AddSecuRiskModelItem(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][50][@机构编号#] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rkfutuT.1.14.50";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控期货_公用_增加风险模板条目记录】*/
        call db_rkfutu.pra_rkfupb_AddSecuRiskModelItem(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_model_id,
            v_risk_item_id_str,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rkfutuT.1.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_公用_增加风险模板条目记录出现错误！',v_mysql_message);
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

# 事务_风控期货_公用_删除风险模板条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfupb_DeleteSecuRiskModelItem;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfupb_DeleteSecuRiskModelItem(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][50][@机构编号#] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rkfutuT.1.15.50";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控期货_公用_删除风险模板条目记录】*/
        call db_rkfutu.pra_rkfupb_DeleteSecuRiskModelItem(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_model_id,
            v_risk_item_id_str,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rkfutuT.1.15.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_公用_删除风险模板条目记录出现错误！',v_mysql_message);
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

# 事务_风控期货_公用_查询风险模板条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfupb_QuerySecuRiskModelItem;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfupb_QuerySecuRiskModelItem(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_model_id bigint,
    IN p_risk_item_id_str varchar(2048),
    IN p_risk_item_name varchar(64),
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
    declare v_co_no int;
    declare v_model_id bigint;
    declare v_risk_item_id_str varchar(2048);
    declare v_risk_item_name varchar(64);
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
    SET v_co_no = p_co_no;
    SET v_model_id = p_model_id;
    SET v_risk_item_id_str = p_risk_item_id_str;
    SET v_risk_item_name = p_risk_item_name;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_row_count = p_row_count;
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

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][50][@机构编号#] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rkfutuT.1.16.50";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_风控期货_公用_查询风险模板条目记录】*/
    call db_rkfutu.pra_rkfupb_QuerySecuRiskModelItem(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_model_id,
        v_risk_item_id_str,
        v_risk_item_name,
        v_risk_rule_type,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rkfutuT.1.16.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_公用_查询风险模板条目记录出现错误！',v_mysql_message);
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

# 事务_风控期货_公用_期货数据归历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkfupb_FutuDataToHis;;
DELIMITER ;;
CREATE PROCEDURE prt_rkfupb_FutuDataToHis(
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
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控期货_公用_期货数据归历史】*/
      call db_rkfutu.pra_rkfupb_FutuDataToHis(
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
          SET v_error_code = "rkfutuT.1.17.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_公用_期货数据归历史出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* 调用【原子_风控期货_计算_计算数据归历史】*/
      call db_rkfutu.pra_rkfucc_FutuDataToHis(
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
          SET v_error_code = "rkfutuT.1.17.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_计算_计算数据归历史出现错误！',v_mysql_message);
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


