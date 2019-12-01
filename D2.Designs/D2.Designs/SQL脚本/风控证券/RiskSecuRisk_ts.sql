DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_风控_增加客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_AddSecuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_AddSecuClientRiskRule(
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
    IN p_model_id bigint,
    IN p_risk_item_id int,
    IN p_templ_flag int,
    IN p_union_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_exch_no_str varchar(2048),
    OUT p_order_dir_str varchar(1024),
    OUT p_dime_id bigint,
    OUT p_trig_stage_type_str varchar(64),
    OUT p_compli_calc_level int,
    OUT p_unit_nav_flag int,
    OUT p_trig_type int,
    OUT p_compli_rules_remark varchar(255),
    OUT p_risk_rule_id int,
    OUT p_risk_rule_type int,
    OUT p_risk_rule_name varchar(64),
    OUT p_risk_rule_code varchar(2048),
    OUT p_risk_param_str varchar(2048),
    OUT p_risk_rule_calc_str varchar(255),
    OUT p_risk_rule_value_str1 varchar(255),
    OUT p_risk_rule_action1 varchar(32),
    OUT p_risk_rule_value_str2 varchar(255),
    OUT p_risk_rule_action2 varchar(32),
    OUT p_risk_rule_value_str3 varchar(255),
    OUT p_risk_rule_action3 varchar(32),
    OUT p_risk_rule_value_str4 varchar(255),
    OUT p_risk_rule_action4 varchar(32),
    OUT p_corrsp_plug varchar(64),
    OUT p_begin_time int,
    OUT p_end_time int,
    OUT p_rule_flag int,
    OUT p_update_times int,
    OUT p_risk_item_id_str varchar(2048)
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
    declare v_model_id bigint;
    declare v_risk_item_id int;
    declare v_templ_flag int;
    declare v_union_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_exch_no_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_dime_id bigint;
    declare v_trig_stage_type_str varchar(64);
    declare v_compli_calc_level int;
    declare v_unit_nav_flag int;
    declare v_trig_type int;
    declare v_compli_rules_remark varchar(255);
    declare v_risk_rule_id int;
    declare v_risk_rule_type int;
    declare v_risk_rule_name varchar(64);
    declare v_risk_rule_code varchar(2048);
    declare v_risk_param_str varchar(2048);
    declare v_risk_rule_calc_str varchar(255);
    declare v_risk_rule_value_str1 varchar(255);
    declare v_risk_rule_action1 varchar(32);
    declare v_risk_rule_value_str2 varchar(255);
    declare v_risk_rule_action2 varchar(32);
    declare v_risk_rule_value_str3 varchar(255);
    declare v_risk_rule_action3 varchar(32);
    declare v_risk_rule_value_str4 varchar(255);
    declare v_risk_rule_action4 varchar(32);
    declare v_corrsp_plug varchar(64);
    declare v_begin_time int;
    declare v_end_time int;
    declare v_rule_flag int;
    declare v_update_times int;
    declare v_risk_item_id_str varchar(2048);

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
    SET v_model_id = p_model_id;
    SET v_risk_item_id = p_risk_item_id;
    SET v_templ_flag = p_templ_flag;
    SET v_union_flag = p_union_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_exch_no_str = " ";
    SET v_order_dir_str = " ";
    SET v_dime_id = 0;
    SET v_trig_stage_type_str = " ";
    SET v_compli_calc_level = 0;
    SET v_unit_nav_flag = 0;
    SET v_trig_type = 0;
    SET v_compli_rules_remark = " ";
    SET v_risk_rule_id = 0;
    SET v_risk_rule_type = 0;
    SET v_risk_rule_name = " ";
    SET v_risk_rule_code = " ";
    SET v_risk_param_str = " ";
    SET v_risk_rule_calc_str = " ";
    SET v_risk_rule_value_str1 = " ";
    SET v_risk_rule_action1 = " ";
    SET v_risk_rule_value_str2 = " ";
    SET v_risk_rule_action2 = " ";
    SET v_risk_rule_value_str3 = " ";
    SET v_risk_rule_action3 = " ";
    SET v_risk_rule_value_str4 = " ";
    SET v_risk_rule_action4 = " ";
    SET v_corrsp_plug = " ";
    SET v_begin_time = date_format(curtime(),'%H%i%s');
    SET v_end_time = date_format(curtime(),'%H%i%s');
    SET v_rule_flag = 0;
    SET v_update_times = 1;
    SET v_risk_item_id_str = " ";

    
    label_pro:BEGIN
    

    /* if @机构编号# = 0 then */
    if v_co_no = 0 then

        /* set @机构编号# = @操作员机构编号#; */
        set v_co_no = v_opor_co_no;
    else

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][50][@机构编号#] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rksecuT.4.1.50";
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


        /* 调用【原子_风控证券_风控_增加客户风险规则记录】*/
        call db_rksecu.pra_rkserk_AddSecuClientRiskRule(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no_str,
            v_exch_group_no_str,
            v_model_id,
            v_risk_item_id,
            v_templ_flag,
            v_union_flag,
            v_error_code,
            v_error_info,
            v_row_id,
            v_exch_no_str,
            v_order_dir_str,
            v_dime_id,
            v_trig_stage_type_str,
            v_compli_calc_level,
            v_unit_nav_flag,
            v_trig_type,
            v_compli_rules_remark,
            v_risk_rule_id,
            v_risk_rule_type,
            v_risk_rule_name,
            v_risk_rule_code,
            v_risk_param_str,
            v_risk_rule_calc_str,
            v_risk_rule_value_str1,
            v_risk_rule_action1,
            v_risk_rule_value_str2,
            v_risk_rule_action2,
            v_risk_rule_value_str3,
            v_risk_rule_action3,
            v_risk_rule_value_str4,
            v_risk_rule_action4,
            v_corrsp_plug,
            v_begin_time,
            v_end_time,
            v_rule_flag,
            v_update_times,
            v_risk_item_id_str);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_增加客户风险规则记录出现错误！',v_mysql_message);
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
    SET p_exch_no_str = v_exch_no_str;
    SET p_order_dir_str = v_order_dir_str;
    SET p_dime_id = v_dime_id;
    SET p_trig_stage_type_str = v_trig_stage_type_str;
    SET p_compli_calc_level = v_compli_calc_level;
    SET p_unit_nav_flag = v_unit_nav_flag;
    SET p_trig_type = v_trig_type;
    SET p_compli_rules_remark = v_compli_rules_remark;
    SET p_risk_rule_id = v_risk_rule_id;
    SET p_risk_rule_type = v_risk_rule_type;
    SET p_risk_rule_name = v_risk_rule_name;
    SET p_risk_rule_code = v_risk_rule_code;
    SET p_risk_param_str = v_risk_param_str;
    SET p_risk_rule_calc_str = v_risk_rule_calc_str;
    SET p_risk_rule_value_str1 = v_risk_rule_value_str1;
    SET p_risk_rule_action1 = v_risk_rule_action1;
    SET p_risk_rule_value_str2 = v_risk_rule_value_str2;
    SET p_risk_rule_action2 = v_risk_rule_action2;
    SET p_risk_rule_value_str3 = v_risk_rule_value_str3;
    SET p_risk_rule_action3 = v_risk_rule_action3;
    SET p_risk_rule_value_str4 = v_risk_rule_value_str4;
    SET p_risk_rule_action4 = v_risk_rule_action4;
    SET p_corrsp_plug = v_corrsp_plug;
    SET p_begin_time = v_begin_time;
    SET p_end_time = v_end_time;
    SET p_rule_flag = v_rule_flag;
    SET p_update_times = v_update_times;
    SET p_risk_item_id_str = v_risk_item_id_str;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_风控_删除客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_DeleteSecuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_DeleteSecuClientRiskRule(
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
    IN p_model_id bigint,
    IN p_risk_item_id_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_model_id bigint;
    declare v_risk_item_id_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_model_id = p_model_id;
    SET v_risk_item_id_str = p_risk_item_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_risk_param_str = " ";

    
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
            
            SET v_error_code = "rksecuT.4.2.50";
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


        /* 调用【原子_风控证券_风控_删除客户风险规则记录】*/
        call db_rksecu.pra_rkserk_DeleteSecuClientRiskRule(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no_str,
            v_exch_group_no_str,
            v_model_id,
            v_risk_item_id_str,
            v_error_code,
            v_error_info,
            v_row_id,
            v_risk_param_str);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_删除客户风险规则记录出现错误！',v_mysql_message);
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
    SET p_risk_param_str = v_risk_param_str;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_风控_查询客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QuerySecuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QuerySecuClientRiskRule(
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
    IN p_model_id bigint,
    IN p_risk_item_id_str varchar(2048),
    IN p_risk_rule_type_str varchar(64),
    IN p_trig_stage_type int,
    IN p_templ_flag int,
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
    declare v_model_id bigint;
    declare v_risk_item_id_str varchar(2048);
    declare v_risk_rule_type_str varchar(64);
    declare v_trig_stage_type int;
    declare v_templ_flag int;
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
    SET v_model_id = p_model_id;
    SET v_risk_item_id_str = p_risk_item_id_str;
    SET v_risk_rule_type_str = p_risk_rule_type_str;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_templ_flag = p_templ_flag;
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

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][50][@机构编号#] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rksecuT.4.3.50";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_风控证券_风控_查询客户风险规则记录】*/
    call db_rksecu.pra_rkserk_QuerySecuClientRiskRule(
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
        v_model_id,
        v_risk_item_id_str,
        v_risk_rule_type_str,
        v_trig_stage_type,
        v_templ_flag,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_查询客户风险规则记录出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_静态风险合规判断
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_HoldingRiskComplianceJudge;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_HoldingRiskComplianceJudge(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_client_risk_rule_id_str varchar(2048),
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
    declare v_client_risk_rule_id_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_trig_stage_type int;
    declare v_risk_rule_action varchar(32);

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
    SET v_client_risk_rule_id_str = p_client_risk_rule_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_compli_trig_id = 0;
    SET v_trig_stage_type = 0;
    SET v_risk_rule_action = " ";

    
    label_pro:BEGIN
    

    /* set @客户风险规则序号串# = concat(@客户风险规则序号串#,";"); */
    set v_client_risk_rule_id_str = concat(v_client_risk_rule_id_str,";");

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_获取最大的合规触警流水序号】*/
      call db_rksecu.pra_rkserk_GetMaxComplianceTriggerId(
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
          SET v_error_code = "rksecuT.4.4.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取最大的合规触警流水序号出现错误！',v_mysql_message);
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


      /* 调用【原子_风控证券_风控_静态风险合规判断】*/
      call db_rksecu.pra_rkserk_HoldingRiskComplianceJudge(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_client_risk_rule_id_str,
          v_compli_trig_id,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.4.4.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_静态风险合规判断出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


    /* [事务结束] */
    COMMIT;


    /* set @触发阶段类型# = 3; */
    set v_trig_stage_type = 3;

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
        SET v_error_code = "rksecuT.4.4.999";
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



END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_风控_客户风险触警流水查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QuerySecuClientRiskTrig;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QuerySecuClientRiskTrig(
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
    IN p_trig_stage_type int,
    IN p_risk_rule_action varchar(32),
    IN p_risk_rule_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_trig_stage_type int;
    declare v_risk_rule_action varchar(32);
    declare v_risk_rule_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_risk_rule_action = p_risk_rule_action;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_风控_客户风险触警流水查询】*/
    call db_rksecu.pra_rkserk_QuerySecuClientRiskTrig(
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
        v_trig_stage_type,
        v_risk_rule_action,
        v_risk_rule_type,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_客户风险触警流水查询出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_模板查询客户产品交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QueryPdExchGroupByModel;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QueryPdExchGroupByModel(
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
    

    /* 调用【原子_风控证券_风控_模板查询客户产品交易组】*/
    call db_rksecu.pra_rkserk_QueryPdExchGroupByModel(
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
        SET v_error_code = "rksecuT.4.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_模板查询客户产品交易组出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_试算检查客户风险
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_CheckCalcSecuClientRisk;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_CheckCalcSecuClientRisk(
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
    IN p_exch_crncy_type varchar(3),
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
    IN p_stock_type int,
    IN p_asset_type int,
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
    declare v_exch_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_trig_stage_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_risk_param_value_str varchar(1024);
    declare v_risk_rule_action varchar(32);

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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_all_fee = p_all_fee;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_compli_trig_id = 0;
    SET v_risk_param_value_str = " ";
    SET v_risk_rule_action = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_获取最大的合规触警流水序号】*/
      call db_rksecu.pra_rkserk_GetMaxComplianceTriggerId(
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
          SET v_error_code = "rksecuT.4.7.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取最大的合规触警流水序号出现错误！',v_mysql_message);
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

      #[原子_风控证券_风控_获取最大的合规触警流水序号]
      #[原子_风控证券_风控_增加交易流水记录]

      /* set @风险要素值串# = concat(";", "证券代码=", @证券代码#, ";"); */
      set v_risk_param_value_str = concat(";", "证券代码=", v_stock_code, ";");

      /* 调用【原子_风控证券_风控_试算检查客户风险】*/
      call db_rksecu.pra_rkserk_CheckCalcSecuClientRisk(
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
          v_exch_no,
          v_exch_crncy_type,
          v_stock_code,
          v_order_dir,
          v_order_price,
          v_order_qty,
          v_all_fee,
          v_trig_stage_type,
          v_risk_param_value_str,
          v_compli_trig_id,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.4.7.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_试算检查客户风险出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


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
          SET v_error_code = "rksecuT.4.7.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取指定序号合规触警流水出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;

      #[原子_风控证券_风控_清空交易流水记录]

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_风控_新增账户风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_InsertProductMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_InsertProductMonitorSet(
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
    IN p_moni_role_type int,
    IN p_moni_value_flag int,
    IN p_moni_value_type int,
    IN p_warn_posi_value decimal(18,4),
    IN p_warn_trig_oper_type int,
    IN p_close_posi_value decimal(18,4),
    IN p_close_trig_oper_type int,
    IN p_appd_value decimal(18,4),
    IN p_appd_trig_oper_type int,
    IN p_begin_moni_date int,
    IN p_begin_moni_value decimal(18,4),
    IN p_max_moni_value decimal(18,4),
    IN p_contrs_stock_code varchar(6),
    IN p_contrs_exch_no int,
    IN p_contrs_max_moni_value decimal(18,4),
    IN p_close_posi_flag int,
    IN p_close_ratio_level_one decimal(18,12),
    IN p_close_ratio_level_two decimal(18,12),
    IN p_close_ratio_level_three decimal(18,12),
    IN p_remark_info varchar(255),
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_moni_role_type int;
    declare v_moni_value_flag int;
    declare v_moni_value_type int;
    declare v_warn_posi_value decimal(18,4);
    declare v_warn_trig_oper_type int;
    declare v_close_posi_value decimal(18,4);
    declare v_close_trig_oper_type int;
    declare v_appd_value decimal(18,4);
    declare v_appd_trig_oper_type int;
    declare v_begin_moni_date int;
    declare v_begin_moni_value decimal(18,4);
    declare v_max_moni_value decimal(18,4);
    declare v_contrs_stock_code varchar(6);
    declare v_contrs_exch_no int;
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_close_posi_flag int;
    declare v_close_ratio_level_one decimal(18,12);
    declare v_close_ratio_level_two decimal(18,12);
    declare v_close_ratio_level_three decimal(18,12);
    declare v_remark_info varchar(255);
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_moni_role_type = p_moni_role_type;
    SET v_moni_value_flag = p_moni_value_flag;
    SET v_moni_value_type = p_moni_value_type;
    SET v_warn_posi_value = p_warn_posi_value;
    SET v_warn_trig_oper_type = p_warn_trig_oper_type;
    SET v_close_posi_value = p_close_posi_value;
    SET v_close_trig_oper_type = p_close_trig_oper_type;
    SET v_appd_value = p_appd_value;
    SET v_appd_trig_oper_type = p_appd_trig_oper_type;
    SET v_begin_moni_date = p_begin_moni_date;
    SET v_begin_moni_value = p_begin_moni_value;
    SET v_max_moni_value = p_max_moni_value;
    SET v_contrs_stock_code = p_contrs_stock_code;
    SET v_contrs_exch_no = p_contrs_exch_no;
    SET v_contrs_max_moni_value = p_contrs_max_moni_value;
    SET v_close_posi_flag = p_close_posi_flag;
    SET v_close_ratio_level_one = p_close_ratio_level_one;
    SET v_close_ratio_level_two = p_close_ratio_level_two;
    SET v_close_ratio_level_three = p_close_ratio_level_three;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_新增账户风险监控设置】*/
      call db_rksecu.pra_rkserk_InsertProductMonitorSet(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_pd_no_str,
          v_exch_group_no_str,
          v_moni_role_type,
          v_moni_value_flag,
          v_moni_value_type,
          v_warn_posi_value,
          v_warn_trig_oper_type,
          v_close_posi_value,
          v_close_trig_oper_type,
          v_appd_value,
          v_appd_trig_oper_type,
          v_begin_moni_date,
          v_begin_moni_value,
          v_max_moni_value,
          v_contrs_stock_code,
          v_contrs_exch_no,
          v_contrs_max_moni_value,
          v_close_posi_flag,
          v_close_ratio_level_one,
          v_close_ratio_level_two,
          v_close_ratio_level_three,
          v_remark_info,
          v_error_code,
          v_error_info,
          v_row_id);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.4.8.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_新增账户风险监控设置出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_修改账户风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_UpdateProductMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_UpdateProductMonitorSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_moni_set_id bigint,
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_moni_role_type int,
    IN p_moni_value_flag int,
    IN p_moni_value_type int,
    IN p_warn_posi_value decimal(18,4),
    IN p_warn_trig_oper_type int,
    IN p_close_posi_value decimal(18,4),
    IN p_close_trig_oper_type int,
    IN p_appd_value decimal(18,4),
    IN p_appd_trig_oper_type int,
    IN p_begin_moni_date int,
    IN p_begin_moni_value decimal(18,4),
    IN p_max_moni_value decimal(18,4),
    IN p_curr_moni_value decimal(18,4),
    IN p_contrs_stock_code varchar(6),
    IN p_contrs_exch_no int,
    IN p_contrs_max_moni_value decimal(18,4),
    IN p_close_posi_flag int,
    IN p_close_ratio_level_one decimal(18,12),
    IN p_close_ratio_level_two decimal(18,12),
    IN p_close_ratio_level_three decimal(18,12),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_moni_set_id bigint;
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_moni_role_type int;
    declare v_moni_value_flag int;
    declare v_moni_value_type int;
    declare v_warn_posi_value decimal(18,4);
    declare v_warn_trig_oper_type int;
    declare v_close_posi_value decimal(18,4);
    declare v_close_trig_oper_type int;
    declare v_appd_value decimal(18,4);
    declare v_appd_trig_oper_type int;
    declare v_begin_moni_date int;
    declare v_begin_moni_value decimal(18,4);
    declare v_max_moni_value decimal(18,4);
    declare v_curr_moni_value decimal(18,4);
    declare v_contrs_stock_code varchar(6);
    declare v_contrs_exch_no int;
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_close_posi_flag int;
    declare v_close_ratio_level_one decimal(18,12);
    declare v_close_ratio_level_two decimal(18,12);
    declare v_close_ratio_level_three decimal(18,12);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_co_no = p_co_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_moni_role_type = p_moni_role_type;
    SET v_moni_value_flag = p_moni_value_flag;
    SET v_moni_value_type = p_moni_value_type;
    SET v_warn_posi_value = p_warn_posi_value;
    SET v_warn_trig_oper_type = p_warn_trig_oper_type;
    SET v_close_posi_value = p_close_posi_value;
    SET v_close_trig_oper_type = p_close_trig_oper_type;
    SET v_appd_value = p_appd_value;
    SET v_appd_trig_oper_type = p_appd_trig_oper_type;
    SET v_begin_moni_date = p_begin_moni_date;
    SET v_begin_moni_value = p_begin_moni_value;
    SET v_max_moni_value = p_max_moni_value;
    SET v_curr_moni_value = p_curr_moni_value;
    SET v_contrs_stock_code = p_contrs_stock_code;
    SET v_contrs_exch_no = p_contrs_exch_no;
    SET v_contrs_max_moni_value = p_contrs_max_moni_value;
    SET v_close_posi_flag = p_close_posi_flag;
    SET v_close_ratio_level_one = p_close_ratio_level_one;
    SET v_close_ratio_level_two = p_close_ratio_level_two;
    SET v_close_ratio_level_three = p_close_ratio_level_three;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_修改账户风险监控设置】*/
      call db_rksecu.pra_rkserk_UpdateProductMonitorSet(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_moni_set_id,
          v_co_no,
          v_pd_no_str,
          v_exch_group_no_str,
          v_moni_role_type,
          v_moni_value_flag,
          v_moni_value_type,
          v_warn_posi_value,
          v_warn_trig_oper_type,
          v_close_posi_value,
          v_close_trig_oper_type,
          v_appd_value,
          v_appd_trig_oper_type,
          v_begin_moni_date,
          v_begin_moni_value,
          v_max_moni_value,
          v_curr_moni_value,
          v_contrs_stock_code,
          v_contrs_exch_no,
          v_contrs_max_moni_value,
          v_close_posi_flag,
          v_close_ratio_level_one,
          v_close_ratio_level_two,
          v_close_ratio_level_three,
          v_remark_info,
          v_error_code,
          v_error_info,
          v_update_times);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.4.9.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_修改账户风险监控设置出现错误！',v_mysql_message);
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_风控_删除账户风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_DeleteProductMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_DeleteProductMonitorSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_moni_set_id bigint,
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
    declare v_moni_set_id bigint;
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_删除账户风险监控设置】*/
      call db_rksecu.pra_rkserk_DeleteProductMonitorSet(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_moni_set_id,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.4.10.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_删除账户风险监控设置出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_查询账户风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QueryProductMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QueryProductMonitorSet(
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
    IN p_moni_role_type int,
    IN p_moni_value_flag int,
    IN p_moni_value_type int,
    IN p_moni_set_status varchar(2),
    IN p_moni_result_status varchar(2),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_co_no_rights_str varchar(2048),
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
    declare v_moni_role_type int;
    declare v_moni_value_flag int;
    declare v_moni_value_type int;
    declare v_moni_set_status varchar(2);
    declare v_moni_result_status varchar(2);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_co_no_rights_str varchar(2048);
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
    SET v_moni_role_type = p_moni_role_type;
    SET v_moni_value_flag = p_moni_value_flag;
    SET v_moni_value_type = p_moni_value_type;
    SET v_moni_set_status = p_moni_set_status;
    SET v_moni_result_status = p_moni_result_status;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_风控_查询账户风险监控设置】*/
    call db_rksecu.pra_rkserk_QueryProductMonitorSet(
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
        v_moni_role_type,
        v_moni_value_flag,
        v_moni_value_type,
        v_moni_set_status,
        v_moni_result_status,
        v_exch_group_no_rights_str,
        v_pd_no_rights_str,
        v_co_no_rights_str,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_查询账户风险监控设置出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_更新账户风险监控设置状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_UpdateProductMonitorSetStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_UpdateProductMonitorSetStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_moni_set_id bigint,
    IN p_moni_set_status varchar(2),
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
    declare v_moni_set_id bigint;
    declare v_moni_set_status varchar(2);
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_moni_set_status = p_moni_set_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_风控证券_风控_更新账户风险监控设置状态】*/
    call db_rksecu.pra_rkserk_UpdateProductMonitorSetStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_moni_set_id,
        v_moni_set_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_更新账户风险监控设置状态出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_更新所有账户风险监控设置状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_UpdateAllProductMonitorSetStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_UpdateAllProductMonitorSetStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_moni_set_status varchar(2),
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
    declare v_moni_set_status varchar(2);
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
    SET v_moni_set_status = p_moni_set_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_风控证券_风控_更新所有账户风险监控设置状态】*/
    call db_rksecu.pra_rkserk_UpdateAllProductMonitorSetStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_moni_set_status,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_更新所有账户风险监控设置状态出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_新增证券风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_InsertStockMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_InsertStockMonitorSet(
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
    IN p_monitor_ctrl_type int,
    IN p_moni_value_type int,
    IN p_monitor_param_value int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_moni_value_flag int,
    IN p_warn_posi_value decimal(18,4),
    IN p_appd_value decimal(18,4),
    IN p_close_posi_value decimal(18,4),
    IN p_max_moni_value decimal(18,4),
    IN p_contrs_stock_code varchar(6),
    IN p_contrs_exch_no int,
    IN p_contrs_max_moni_value decimal(18,4),
    IN p_close_posi_flag int,
    IN p_close_ratio_level_one decimal(18,12),
    IN p_close_ratio_level_two decimal(18,12),
    IN p_close_ratio_level_three decimal(18,12),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_moni_set_id bigint
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
    declare v_monitor_ctrl_type int;
    declare v_moni_value_type int;
    declare v_monitor_param_value int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_moni_value_flag int;
    declare v_warn_posi_value decimal(18,4);
    declare v_appd_value decimal(18,4);
    declare v_close_posi_value decimal(18,4);
    declare v_max_moni_value decimal(18,4);
    declare v_contrs_stock_code varchar(6);
    declare v_contrs_exch_no int;
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_close_posi_flag int;
    declare v_close_ratio_level_one decimal(18,12);
    declare v_close_ratio_level_two decimal(18,12);
    declare v_close_ratio_level_three decimal(18,12);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_moni_set_id bigint;

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
    SET v_monitor_ctrl_type = p_monitor_ctrl_type;
    SET v_moni_value_type = p_moni_value_type;
    SET v_monitor_param_value = p_monitor_param_value;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_moni_value_flag = p_moni_value_flag;
    SET v_warn_posi_value = p_warn_posi_value;
    SET v_appd_value = p_appd_value;
    SET v_close_posi_value = p_close_posi_value;
    SET v_max_moni_value = p_max_moni_value;
    SET v_contrs_stock_code = p_contrs_stock_code;
    SET v_contrs_exch_no = p_contrs_exch_no;
    SET v_contrs_max_moni_value = p_contrs_max_moni_value;
    SET v_close_posi_flag = p_close_posi_flag;
    SET v_close_ratio_level_one = p_close_ratio_level_one;
    SET v_close_ratio_level_two = p_close_ratio_level_two;
    SET v_close_ratio_level_three = p_close_ratio_level_three;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_moni_set_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控证券_风控_新增证券风险监控设置】*/
        call db_rksecu.pra_rkserk_InsertStockMonitorSet(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no_str,
            v_exch_group_no_str,
            v_monitor_ctrl_type,
            v_moni_value_type,
            v_monitor_param_value,
            v_stock_code,
            v_exch_no,
            v_moni_value_flag,
            v_warn_posi_value,
            v_appd_value,
            v_close_posi_value,
            v_max_moni_value,
            v_contrs_stock_code,
            v_contrs_exch_no,
            v_contrs_max_moni_value,
            v_close_posi_flag,
            v_close_ratio_level_one,
            v_close_ratio_level_two,
            v_close_ratio_level_three,
            v_remark_info,
            v_error_code,
            v_error_info,
            v_moni_set_id);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_新增证券风险监控设置出现错误！',v_mysql_message);
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
    SET p_moni_set_id = v_moni_set_id;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_风控_修改证券风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_UpdateStockMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_UpdateStockMonitorSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_moni_set_id bigint,
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_monitor_ctrl_type int,
    IN p_moni_value_type int,
    IN p_monitor_param_value int,
    IN p_moni_value_flag int,
    IN p_warn_posi_value decimal(18,4),
    IN p_appd_value decimal(18,4),
    IN p_close_posi_value decimal(18,4),
    IN p_max_moni_value decimal(18,4),
    IN p_contrs_stock_code varchar(6),
    IN p_contrs_exch_no int,
    IN p_contrs_max_moni_value decimal(18,4),
    IN p_close_posi_flag int,
    IN p_close_ratio_level_one decimal(18,12),
    IN p_close_ratio_level_two decimal(18,12),
    IN p_close_ratio_level_three decimal(18,12),
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
    declare v_moni_set_id bigint;
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_monitor_ctrl_type int;
    declare v_moni_value_type int;
    declare v_monitor_param_value int;
    declare v_moni_value_flag int;
    declare v_warn_posi_value decimal(18,4);
    declare v_appd_value decimal(18,4);
    declare v_close_posi_value decimal(18,4);
    declare v_max_moni_value decimal(18,4);
    declare v_contrs_stock_code varchar(6);
    declare v_contrs_exch_no int;
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_close_posi_flag int;
    declare v_close_ratio_level_one decimal(18,12);
    declare v_close_ratio_level_two decimal(18,12);
    declare v_close_ratio_level_three decimal(18,12);
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_co_no = p_co_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_monitor_ctrl_type = p_monitor_ctrl_type;
    SET v_moni_value_type = p_moni_value_type;
    SET v_monitor_param_value = p_monitor_param_value;
    SET v_moni_value_flag = p_moni_value_flag;
    SET v_warn_posi_value = p_warn_posi_value;
    SET v_appd_value = p_appd_value;
    SET v_close_posi_value = p_close_posi_value;
    SET v_max_moni_value = p_max_moni_value;
    SET v_contrs_stock_code = p_contrs_stock_code;
    SET v_contrs_exch_no = p_contrs_exch_no;
    SET v_contrs_max_moni_value = p_contrs_max_moni_value;
    SET v_close_posi_flag = p_close_posi_flag;
    SET v_close_ratio_level_one = p_close_ratio_level_one;
    SET v_close_ratio_level_two = p_close_ratio_level_two;
    SET v_close_ratio_level_three = p_close_ratio_level_three;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控证券_风控_修改证券风险监控设置】*/
        call db_rksecu.pra_rkserk_UpdateStockMonitorSet(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_moni_set_id,
            v_co_no,
            v_pd_no_str,
            v_exch_group_no_str,
            v_monitor_ctrl_type,
            v_moni_value_type,
            v_monitor_param_value,
            v_moni_value_flag,
            v_warn_posi_value,
            v_appd_value,
            v_close_posi_value,
            v_max_moni_value,
            v_contrs_stock_code,
            v_contrs_exch_no,
            v_contrs_max_moni_value,
            v_close_posi_flag,
            v_close_ratio_level_one,
            v_close_ratio_level_two,
            v_close_ratio_level_three,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.15.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_修改证券风险监控设置出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_删除证券风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_DeleteStockMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_DeleteStockMonitorSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_moni_set_id bigint,
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
    declare v_moni_set_id bigint;
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_删除证券风险监控设置】*/
      call db_rksecu.pra_rkserk_DeleteStockMonitorSet(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_moni_set_id,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.4.16.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_删除证券风险监控设置出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_查询证券风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QueryStockMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QueryStockMonitorSet(
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
    IN p_moni_value_flag int,
    IN p_moni_value_type int,
    IN p_moni_set_status varchar(2),
    IN p_moni_result_status varchar(2),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_co_no_rights_str varchar(2048),
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
    declare v_moni_value_flag int;
    declare v_moni_value_type int;
    declare v_moni_set_status varchar(2);
    declare v_moni_result_status varchar(2);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_co_no_rights_str varchar(2048);
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
    SET v_moni_value_flag = p_moni_value_flag;
    SET v_moni_value_type = p_moni_value_type;
    SET v_moni_set_status = p_moni_set_status;
    SET v_moni_result_status = p_moni_result_status;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_风控_查询证券风险监控设置】*/
    call db_rksecu.pra_rkserk_QueryStockMonitorSet(
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
        v_moni_value_flag,
        v_moni_value_type,
        v_moni_set_status,
        v_moni_result_status,
        v_exch_group_no_rights_str,
        v_pd_no_rights_str,
        v_co_no_rights_str,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_查询证券风险监控设置出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_更新证券风险监控设置状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_UpdateStockMonitorSetStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_UpdateStockMonitorSetStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_moni_set_id bigint,
    IN p_moni_set_status varchar(2),
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
    declare v_moni_set_id bigint;
    declare v_moni_set_status varchar(2);
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_moni_set_status = p_moni_set_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_更新证券风险监控设置状态】*/
      call db_rksecu.pra_rkserk_UpdateStockMonitorSetStatus(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_moni_set_id,
          v_moni_set_status,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.4.18.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_更新证券风险监控设置状态出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_更新所有证券风险监控设置状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_UpdateAllStockMonitorSetStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_UpdateAllStockMonitorSetStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_moni_set_status varchar(2),
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
    declare v_moni_set_status varchar(2);
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
    SET v_moni_set_status = p_moni_set_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_更新所有证券风险监控设置状态】*/
      call db_rksecu.pra_rkserk_UpdateAllStockMonitorSetStatus(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_moni_set_status,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.4.19.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_更新所有证券风险监控设置状态出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_计算账户风险监控设置数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_CalcStockMonitorSetService;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_CalcStockMonitorSetService(
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
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_计算账户风险监控设置数据】*/
      call db_rksecu.pra_rkserk_CalcStockMonitorSetService(
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
          SET v_error_code = "rksecuT.4.20.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_计算账户风险监控设置数据出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_客户风险触警历史流水查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QueryHisSecuClientRiskTrig;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QueryHisSecuClientRiskTrig(
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
    IN p_trig_stage_type int,
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
    declare v_trig_stage_type int;
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
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_risk_rule_action = p_risk_rule_action;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_风控_客户风险触警历史流水查询】*/
    call db_rksecu.pra_rkserk_QueryHisSecuClientRiskTrig(
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
        v_trig_stage_type,
        v_risk_rule_action,
        v_risk_rule_type,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_客户风险触警历史流水查询出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_条目查询客户产品交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QueryPdExchGroupByItem;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QueryPdExchGroupByItem(
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
    IN p_risk_item_id int,
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
    declare v_risk_item_id int;
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
    SET v_risk_item_id = p_risk_item_id;
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
            
            SET v_error_code = "rksecuT.4.22.50";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_风控证券_风控_条目查询客户产品交易组】*/
    call db_rksecu.pra_rkserk_QueryPdExchGroupByItem(
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
        v_risk_item_id,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_条目查询客户产品交易组出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_更新客户风险规则启用标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_UpdateClientRiskRuleFlag;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_UpdateClientRiskRuleFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_row_id bigint,
    IN p_rule_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_risk_item_id_str varchar(2048)
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
    declare v_row_id bigint;
    declare v_rule_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_risk_item_id_str varchar(2048);

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
    SET v_row_id = p_row_id;
    SET v_rule_flag = p_rule_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_risk_item_id_str = " ";

    
    label_pro:BEGIN
    

    /* if @机构编号# = 0 then */
    if v_co_no = 0 then

        /* set @机构编号# = @操作员机构编号#; */
        set v_co_no = v_opor_co_no;
    else

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][1]["操作员不允许更新非本机构的风险条目启用标志！"] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rksecuT.4.23.1";
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


        /* 调用【原子_风控证券_风控_更新客户风险规则启用标志】*/
        call db_rksecu.pra_rkserk_UpdateClientRiskRuleFlag(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_row_id,
            v_rule_flag,
            v_error_code,
            v_error_info,
            v_risk_item_id_str);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_更新客户风险规则启用标志出现错误！',v_mysql_message);
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
    SET p_risk_item_id_str = v_risk_item_id_str;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_风控_批量试算检查客户风险
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_CheckBatchCalcSecuClientRisk;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_CheckBatchCalcSecuClientRisk(
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
    IN p_exch_no_str varchar(2048),
    IN p_exch_crncy_type_str varchar(2048),
    IN p_stock_code_str varchar(4096),
    IN p_order_dir_str varchar(1024),
    IN p_order_price_str varchar(4096),
    IN p_order_qty_str varchar(4096),
    IN p_all_fee_str varchar(4096),
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_exch_crncy_type_str varchar(2048);
    declare v_stock_code_str varchar(4096);
    declare v_order_dir_str varchar(1024);
    declare v_order_price_str varchar(4096);
    declare v_order_qty_str varchar(4096);
    declare v_all_fee_str varchar(4096);
    declare v_trig_stage_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_tmp_pd_no_str varchar(2048);
    declare v_tmp_exch_group_no_str varchar(2048);
    declare v_tmp_exch_no_str varchar(2048);
    declare v_tmp_exch_crncy_type_str varchar(2048);
    declare v_tmp_stock_code_str varchar(4096);
    declare v_split_str varchar(4);
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_exch_crncy_type varchar(3);
    declare v_all_fee decimal(18,4);
    declare v_risk_param_value_str varchar(1024);
    declare v_update_date int;
    declare v_update_time int;
    declare v_risk_rule_action varchar(32);

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
    SET v_exch_no_str = p_exch_no_str;
    SET v_exch_crncy_type_str = p_exch_crncy_type_str;
    SET v_stock_code_str = p_stock_code_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_price_str = p_order_price_str;
    SET v_order_qty_str = p_order_qty_str;
    SET v_all_fee_str = p_all_fee_str;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_compli_trig_id = 0;
    SET v_tmp_pd_no_str = " ";
    SET v_tmp_exch_group_no_str = " ";
    SET v_tmp_exch_no_str = " ";
    SET v_tmp_exch_crncy_type_str = " ";
    SET v_tmp_stock_code_str = " ";
    SET v_split_str = " ";
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_all_fee = 0;
    SET v_risk_param_value_str = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_risk_rule_action = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_获取最大的合规触警流水序号】*/
      call db_rksecu.pra_rkserk_GetMaxComplianceTriggerId(
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
          SET v_error_code = "rksecuT.4.24.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取最大的合规触警流水序号出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


    /* [事务结束] */
    COMMIT;


    /* set @临时_产品编号串# = @产品编号串#; */
    set v_tmp_pd_no_str = v_pd_no_str;

    /* set @临时_交易组编号串# = @交易组编号串#; */
    set v_tmp_exch_group_no_str = v_exch_group_no_str;

    /* set @临时_市场编号串# = @市场编号串#; */
    set v_tmp_exch_no_str = v_exch_no_str;

    /* set @临时_交易币种串#  = @交易币种串#; */
    set v_tmp_exch_crncy_type_str  = v_exch_crncy_type_str;

    /* set @临时_证券代码串# = @证券代码串#; */
    set v_tmp_stock_code_str = v_stock_code_str;

    /* set @分隔符# = ";"; */
    set v_split_str = ";";

    /* while LOCATE(@分隔符#,@证券代码串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_str)<>0   do

    /* [事务开始] */
    START TRANSACTION;

        #截取前面每一位

        /* set @产品编号#=cast(substring(@产品编号串#,1,LOCATE(@分隔符#,@产品编号串#)-1) as SIGNED); */
        set v_pd_no=cast(substring(v_pd_no_str,1,LOCATE(v_split_str,v_pd_no_str)-1) as SIGNED);

        /* set @交易组编号#=cast(substring(@交易组编号串#,1,LOCATE(@分隔符#,@交易组编号串#)-1) as SIGNED); */
        set v_exch_group_no=cast(substring(v_exch_group_no_str,1,LOCATE(v_split_str,v_exch_group_no_str)-1) as SIGNED);

        /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
        set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @订单方向#=cast(substring(@订单方向串#,1,LOCATE(@分隔符#,@订单方向串#)-1) as SIGNED); */
        set v_order_dir=cast(substring(v_order_dir_str,1,LOCATE(v_split_str,v_order_dir_str)-1) as SIGNED);

        /* set @订单价格#=cast(substring(@订单价格串#,1,LOCATE(@分隔符#,@订单价格串#)-1) as decimal(16,9)); */
        set v_order_price=cast(substring(v_order_price_str,1,LOCATE(v_split_str,v_order_price_str)-1) as decimal(16,9));

        /* set @订单数量#=cast(substring(@订单数量串#,1,LOCATE(@分隔符#,@订单数量串#)-1) as decimal(18,2)); */
        set v_order_qty=cast(substring(v_order_qty_str,1,LOCATE(v_split_str,v_order_qty_str)-1) as decimal(18,2));

        /* set @交易币种#=substring(@交易币种串#,1,LOCATE(@分隔符#,@交易币种串#)-1); */
        set v_exch_crncy_type=substring(v_exch_crncy_type_str,1,LOCATE(v_split_str,v_exch_crncy_type_str)-1);

        /* set @全部费用#=cast(substring(@全部费用串#,1,LOCATE(@分隔符#,@全部费用串#)-1) as decimal(32,6)); */
        set v_all_fee=cast(substring(v_all_fee_str,1,LOCATE(v_split_str,v_all_fee_str)-1) as decimal(32,6));

        /* 调用【原子_风控证券_风控_增加交易流水记录】*/
        call db_rksecu.pra_rkserk_AddTradeTrigRecord(
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
            v_exch_no,
            v_exch_crncy_type,
            v_stock_code,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_all_fee,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.24.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_增加交易流水记录出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @风险要素值串# = concat(";", "证券代码=", @证券代码#, ";"); */
        set v_risk_param_value_str = concat(";", "证券代码=", v_stock_code, ";");

        /* 调用【原子_风控证券_风控_试算检查客户风险】*/
        call db_rksecu.pra_rkserk_CheckCalcSecuClientRisk(
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
            v_exch_no,
            v_exch_crncy_type,
            v_stock_code,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_all_fee,
            v_trig_stage_type,
            v_risk_param_value_str,
            v_compli_trig_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.24.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_试算检查客户风险出现错误！',v_mysql_message);
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

        /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
        set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @订单方向串#=substring(@订单方向串#,LOCATE(@分隔符#,@订单方向串#)+1); */
        set v_order_dir_str=substring(v_order_dir_str,LOCATE(v_split_str,v_order_dir_str)+1);

        /* set @订单价格串#=substring(@订单价格串#,LOCATE(@分隔符#,@订单价格串#)+1); */
        set v_order_price_str=substring(v_order_price_str,LOCATE(v_split_str,v_order_price_str)+1);

        /* set @订单数量串#=substring(@订单数量串#,LOCATE(@分隔符#,@订单数量串#)+1); */
        set v_order_qty_str=substring(v_order_qty_str,LOCATE(v_split_str,v_order_qty_str)+1);

        /* set @交易币种串#=substring(@交易币种串#,LOCATE(@分隔符#,@交易币种串#)+1); */
        set v_exch_crncy_type_str=substring(v_exch_crncy_type_str,LOCATE(v_split_str,v_exch_crncy_type_str)+1);

        /* set @全部费用串#=substring(@全部费用串#,LOCATE(@分隔符#,@全部费用串#)+1); */
        set v_all_fee_str=substring(v_all_fee_str,LOCATE(v_split_str,v_all_fee_str)+1);

        /* [更新表记录][风控证券_风控_交易流水记录表][{变动数量} = 0 , {变动金额} = 0, {全部费用} = 0, {交易金额} = 0][{机构编号} = @机构编号# and {机构编号} = @机构编号# and {产品编号} = @产品编号# and {交易组编号} = @交易组编号#  and {交易币种} = @交易币种# and {市场编号} = @市场编号# and {证券代码} = @证券代码#][3][@机构编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_rksecu.tb_rkserk_trd_trig set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, occur_qty = 0 , occur_amt = 0, all_fee = 0, trade_amt = 0 where co_no = v_co_no and co_no = v_co_no and pd_no = v_pd_no and exch_group_no = v_exch_group_no  and exch_crncy_type = v_exch_crncy_type and exch_no = v_exch_no and stock_code = v_stock_code;
        if v_error_code = "1" then
            ROLLBACK;        
            SET v_error_code = "rksecuT.4.24.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;


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
        SET v_error_code = "rksecuT.4.24.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取指定序号合规触警流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @产品编号串# = @临时_产品编号串#; */
    set v_pd_no_str = v_tmp_pd_no_str;

    /* set @交易组编号串# = @临时_交易组编号串#; */
    set v_exch_group_no_str = v_tmp_exch_group_no_str;

    /* set @市场编号串# = @临时_市场编号串#; */
    set v_exch_no_str = v_tmp_exch_no_str;

    /* set @交易币种串#  = @临时_交易币种串#; */
    set v_exch_crncy_type_str  = v_tmp_exch_crncy_type_str;

    /* set @证券代码串# = @临时_证券代码串#; */
    set v_stock_code_str = v_tmp_stock_code_str;
    #[原子_风控证券_风控_批量清空交易流水记录]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_风控_T0操作员阈值信息查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_T0QueryOporTsholdInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_T0QueryOporTsholdInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_last_tshold_value decimal(18,4),
    IN p_posi_status varchar(2),
    IN p_co_no int,
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_query_opor_no int;
    declare v_last_tshold_value decimal(18,4);
    declare v_posi_status varchar(2);
    declare v_co_no int;
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_last_tshold_value = p_last_tshold_value;
    SET v_posi_status = p_posi_status;
    SET v_co_no = p_co_no;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_风控_T0操作员阈值信息查询】*/
    call db_rksecu.pra_rkserk_T0QueryOporTsholdInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_last_tshold_value,
        v_posi_status,
        v_co_no,
        v_allow_opor_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.25.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_T0操作员阈值信息查询出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_T0操作员阈值信息更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_T0UpdateOporTsholdInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_T0UpdateOporTsholdInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_detail_posi_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_lngsht_type int,
    IN p_curr_qty decimal(18,2),
    IN p_open_posi_date int,
    IN p_open_posi_time int,
    IN p_open_posi_price decimal(16,9),
    IN p_open_posi_value decimal(18,4),
    IN p_open_posi_fee decimal(18,4),
    IN p_close_posi_qty decimal(18,2),
    IN p_close_posi_market_value decimal(18,4),
    IN p_close_posi_fee decimal(18,4),
    IN p_realize_pandl decimal(18,4),
    IN p_pandl_ratio decimal(18,12),
    IN p_un_close_posi_qty decimal(18,2),
    IN p_un_close_marke_value decimal(18,4),
    IN p_last_price decimal(16,9),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_cost_price decimal(16,9),
    IN p_last_tshold_value decimal(18,4),
    IN p_float_pandl decimal(18,4),
    IN p_posi_status varchar(2),
    IN p_moni_result_status varchar(2),
    IN p_posi_limit_status varchar(2),
    IN p_opor_warn_tshold decimal(18,4),
    IN p_opor_stop_tshold decimal(18,4),
    IN p_stock_warn_ratio decimal(18,12),
    IN p_stock_stop_ratio decimal(18,12),
    IN p_stock_warn_amt decimal(18,4),
    IN p_stock_stop_amt decimal(18,4),
    IN p_open_close_permission int,
    IN p_posi_limit_time int,
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
    declare v_detail_posi_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_lngsht_type int;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_pandl_ratio decimal(18,12);
    declare v_un_close_posi_qty decimal(18,2);
    declare v_un_close_marke_value decimal(18,4);
    declare v_last_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_cost_price decimal(16,9);
    declare v_last_tshold_value decimal(18,4);
    declare v_float_pandl decimal(18,4);
    declare v_posi_status varchar(2);
    declare v_moni_result_status varchar(2);
    declare v_posi_limit_status varchar(2);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_stock_warn_ratio decimal(18,12);
    declare v_stock_stop_ratio decimal(18,12);
    declare v_stock_warn_amt decimal(18,4);
    declare v_stock_stop_amt decimal(18,4);
    declare v_open_close_permission int;
    declare v_posi_limit_time int;
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
    SET v_detail_posi_id = p_detail_posi_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_curr_qty = p_curr_qty;
    SET v_open_posi_date = p_open_posi_date;
    SET v_open_posi_time = p_open_posi_time;
    SET v_open_posi_price = p_open_posi_price;
    SET v_open_posi_value = p_open_posi_value;
    SET v_open_posi_fee = p_open_posi_fee;
    SET v_close_posi_qty = p_close_posi_qty;
    SET v_close_posi_market_value = p_close_posi_market_value;
    SET v_close_posi_fee = p_close_posi_fee;
    SET v_realize_pandl = p_realize_pandl;
    SET v_pandl_ratio = p_pandl_ratio;
    SET v_un_close_posi_qty = p_un_close_posi_qty;
    SET v_un_close_marke_value = p_un_close_marke_value;
    SET v_last_price = p_last_price;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_cost_price = p_cost_price;
    SET v_last_tshold_value = p_last_tshold_value;
    SET v_float_pandl = p_float_pandl;
    SET v_posi_status = p_posi_status;
    SET v_moni_result_status = p_moni_result_status;
    SET v_posi_limit_status = p_posi_limit_status;
    SET v_opor_warn_tshold = p_opor_warn_tshold;
    SET v_opor_stop_tshold = p_opor_stop_tshold;
    SET v_stock_warn_ratio = p_stock_warn_ratio;
    SET v_stock_stop_ratio = p_stock_stop_ratio;
    SET v_stock_warn_amt = p_stock_warn_amt;
    SET v_stock_stop_amt = p_stock_stop_amt;
    SET v_open_close_permission = p_open_close_permission;
    SET v_posi_limit_time = p_posi_limit_time;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控证券_风控_T0操作员阈值信息更新】*/
        call db_rksecu.pra_rkserk_T0UpdateOporTsholdInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_detail_posi_id,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_no,
            v_stock_code,
            v_stock_acco_no,
            v_stock_code_no,
            v_lngsht_type,
            v_curr_qty,
            v_open_posi_date,
            v_open_posi_time,
            v_open_posi_price,
            v_open_posi_value,
            v_open_posi_fee,
            v_close_posi_qty,
            v_close_posi_market_value,
            v_close_posi_fee,
            v_realize_pandl,
            v_pandl_ratio,
            v_un_close_posi_qty,
            v_un_close_marke_value,
            v_last_price,
            v_up_limit_price,
            v_down_limit_price,
            v_cost_price,
            v_last_tshold_value,
            v_float_pandl,
            v_posi_status,
            v_moni_result_status,
            v_posi_limit_status,
            v_opor_warn_tshold,
            v_opor_stop_tshold,
            v_stock_warn_ratio,
            v_stock_stop_ratio,
            v_stock_warn_amt,
            v_stock_stop_amt,
            v_open_close_permission,
            v_posi_limit_time,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.26.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_T0操作员阈值信息更新出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_T0操作员汇总阈值信息更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_T0UpdateSumOporTsholdInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_T0UpdateSumOporTsholdInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_curr_qty decimal(18,2),
    IN p_open_posi_value decimal(18,4),
    IN p_open_posi_fee decimal(18,4),
    IN p_close_posi_qty decimal(18,2),
    IN p_close_posi_market_value decimal(18,4),
    IN p_close_posi_fee decimal(18,4),
    IN p_realize_pandl decimal(18,4),
    IN p_float_pandl decimal(18,4),
    IN p_pandl_ratio decimal(18,12),
    IN p_un_close_posi_qty decimal(18,2),
    IN p_un_close_marke_value decimal(18,4),
    IN p_last_tshold_value decimal(18,4),
    IN p_moni_result_status varchar(2),
    IN p_opor_warn_tshold decimal(18,4),
    IN p_opor_stop_tshold decimal(18,4),
    IN p_open_close_permission int,
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
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_float_pandl decimal(18,4);
    declare v_pandl_ratio decimal(18,12);
    declare v_un_close_posi_qty decimal(18,2);
    declare v_un_close_marke_value decimal(18,4);
    declare v_last_tshold_value decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_open_close_permission int;
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
    SET v_curr_qty = p_curr_qty;
    SET v_open_posi_value = p_open_posi_value;
    SET v_open_posi_fee = p_open_posi_fee;
    SET v_close_posi_qty = p_close_posi_qty;
    SET v_close_posi_market_value = p_close_posi_market_value;
    SET v_close_posi_fee = p_close_posi_fee;
    SET v_realize_pandl = p_realize_pandl;
    SET v_float_pandl = p_float_pandl;
    SET v_pandl_ratio = p_pandl_ratio;
    SET v_un_close_posi_qty = p_un_close_posi_qty;
    SET v_un_close_marke_value = p_un_close_marke_value;
    SET v_last_tshold_value = p_last_tshold_value;
    SET v_moni_result_status = p_moni_result_status;
    SET v_opor_warn_tshold = p_opor_warn_tshold;
    SET v_opor_stop_tshold = p_opor_stop_tshold;
    SET v_open_close_permission = p_open_close_permission;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控证券_风控_T0操作员汇总阈值信息更新】*/
        call db_rksecu.pra_rkserk_T0UpdateSumOporTsholdInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_curr_qty,
            v_open_posi_value,
            v_open_posi_fee,
            v_close_posi_qty,
            v_close_posi_market_value,
            v_close_posi_fee,
            v_realize_pandl,
            v_float_pandl,
            v_pandl_ratio,
            v_un_close_posi_qty,
            v_un_close_marke_value,
            v_last_tshold_value,
            v_moni_result_status,
            v_opor_warn_tshold,
            v_opor_stop_tshold,
            v_open_close_permission,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.27.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_T0操作员汇总阈值信息更新出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_T0操作员阈值信息汇总查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_T0QueryOporTsholdSumInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_T0QueryOporTsholdSumInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_last_tshold_value decimal(18,4),
    IN p_posi_status varchar(2),
    IN p_co_no int,
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_query_opor_no int;
    declare v_last_tshold_value decimal(18,4);
    declare v_posi_status varchar(2);
    declare v_co_no int;
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_last_tshold_value = p_last_tshold_value;
    SET v_posi_status = p_posi_status;
    SET v_co_no = p_co_no;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_风控_T0操作员阈值信息汇总查询】*/
    call db_rksecu.pra_rkserk_T0QueryOporTsholdSumInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_opor_no,
        v_last_tshold_value,
        v_posi_status,
        v_co_no,
        v_allow_opor_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.28.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_T0操作员阈值信息汇总查询出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_新增操作员风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_InsertOporMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_InsertOporMonitorSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_moni_role_type int,
    IN p_moni_value_flag int,
    IN p_moni_value_type int,
    IN p_warn_posi_value decimal(18,4),
    IN p_warn_trig_oper_type int,
    IN p_close_posi_value decimal(18,4),
    IN p_close_trig_oper_type int,
    IN p_appd_value decimal(18,4),
    IN p_appd_trig_oper_type int,
    IN p_begin_moni_date int,
    IN p_begin_moni_value decimal(18,4),
    IN p_max_moni_value decimal(18,4),
    IN p_contrs_stock_code varchar(6),
    IN p_contrs_exch_no int,
    IN p_contrs_max_moni_value decimal(18,4),
    IN p_close_posi_flag int,
    IN p_close_ratio_level_one decimal(18,12),
    IN p_close_ratio_level_two decimal(18,12),
    IN p_close_ratio_level_three decimal(18,12),
    IN p_remark_info varchar(255),
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
    declare v_busi_opor_no int;
    declare v_moni_role_type int;
    declare v_moni_value_flag int;
    declare v_moni_value_type int;
    declare v_warn_posi_value decimal(18,4);
    declare v_warn_trig_oper_type int;
    declare v_close_posi_value decimal(18,4);
    declare v_close_trig_oper_type int;
    declare v_appd_value decimal(18,4);
    declare v_appd_trig_oper_type int;
    declare v_begin_moni_date int;
    declare v_begin_moni_value decimal(18,4);
    declare v_max_moni_value decimal(18,4);
    declare v_contrs_stock_code varchar(6);
    declare v_contrs_exch_no int;
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_close_posi_flag int;
    declare v_close_ratio_level_one decimal(18,12);
    declare v_close_ratio_level_two decimal(18,12);
    declare v_close_ratio_level_three decimal(18,12);
    declare v_remark_info varchar(255);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_moni_role_type = p_moni_role_type;
    SET v_moni_value_flag = p_moni_value_flag;
    SET v_moni_value_type = p_moni_value_type;
    SET v_warn_posi_value = p_warn_posi_value;
    SET v_warn_trig_oper_type = p_warn_trig_oper_type;
    SET v_close_posi_value = p_close_posi_value;
    SET v_close_trig_oper_type = p_close_trig_oper_type;
    SET v_appd_value = p_appd_value;
    SET v_appd_trig_oper_type = p_appd_trig_oper_type;
    SET v_begin_moni_date = p_begin_moni_date;
    SET v_begin_moni_value = p_begin_moni_value;
    SET v_max_moni_value = p_max_moni_value;
    SET v_contrs_stock_code = p_contrs_stock_code;
    SET v_contrs_exch_no = p_contrs_exch_no;
    SET v_contrs_max_moni_value = p_contrs_max_moni_value;
    SET v_close_posi_flag = p_close_posi_flag;
    SET v_close_ratio_level_one = p_close_ratio_level_one;
    SET v_close_ratio_level_two = p_close_ratio_level_two;
    SET v_close_ratio_level_three = p_close_ratio_level_three;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_新增操作员风险监控设置】*/
      call db_rksecu.pra_rkserk_InsertOporMonitorSet(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_busi_opor_no,
          v_moni_role_type,
          v_moni_value_flag,
          v_moni_value_type,
          v_warn_posi_value,
          v_warn_trig_oper_type,
          v_close_posi_value,
          v_close_trig_oper_type,
          v_appd_value,
          v_appd_trig_oper_type,
          v_begin_moni_date,
          v_begin_moni_value,
          v_max_moni_value,
          v_contrs_stock_code,
          v_contrs_exch_no,
          v_contrs_max_moni_value,
          v_close_posi_flag,
          v_close_ratio_level_one,
          v_close_ratio_level_two,
          v_close_ratio_level_three,
          v_remark_info,
          v_error_code,
          v_error_info,
          v_row_id);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.4.29.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_新增操作员风险监控设置出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_修改操作员风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_UpdateOporMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_UpdateOporMonitorSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_moni_set_id bigint,
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_moni_role_type int,
    IN p_moni_value_flag int,
    IN p_moni_value_type int,
    IN p_warn_posi_value decimal(18,4),
    IN p_warn_trig_oper_type int,
    IN p_close_posi_value decimal(18,4),
    IN p_close_trig_oper_type int,
    IN p_appd_value decimal(18,4),
    IN p_appd_trig_oper_type int,
    IN p_begin_moni_date int,
    IN p_begin_moni_value decimal(18,4),
    IN p_max_moni_value decimal(18,4),
    IN p_curr_moni_value decimal(18,4),
    IN p_contrs_stock_code varchar(6),
    IN p_contrs_exch_no int,
    IN p_contrs_max_moni_value decimal(18,4),
    IN p_close_posi_flag int,
    IN p_close_ratio_level_one decimal(18,12),
    IN p_close_ratio_level_two decimal(18,12),
    IN p_close_ratio_level_three decimal(18,12),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_moni_set_id bigint;
    declare v_co_no int;
    declare v_busi_opor_no int;
    declare v_moni_role_type int;
    declare v_moni_value_flag int;
    declare v_moni_value_type int;
    declare v_warn_posi_value decimal(18,4);
    declare v_warn_trig_oper_type int;
    declare v_close_posi_value decimal(18,4);
    declare v_close_trig_oper_type int;
    declare v_appd_value decimal(18,4);
    declare v_appd_trig_oper_type int;
    declare v_begin_moni_date int;
    declare v_begin_moni_value decimal(18,4);
    declare v_max_moni_value decimal(18,4);
    declare v_curr_moni_value decimal(18,4);
    declare v_contrs_stock_code varchar(6);
    declare v_contrs_exch_no int;
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_close_posi_flag int;
    declare v_close_ratio_level_one decimal(18,12);
    declare v_close_ratio_level_two decimal(18,12);
    declare v_close_ratio_level_three decimal(18,12);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_co_no = p_co_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_moni_role_type = p_moni_role_type;
    SET v_moni_value_flag = p_moni_value_flag;
    SET v_moni_value_type = p_moni_value_type;
    SET v_warn_posi_value = p_warn_posi_value;
    SET v_warn_trig_oper_type = p_warn_trig_oper_type;
    SET v_close_posi_value = p_close_posi_value;
    SET v_close_trig_oper_type = p_close_trig_oper_type;
    SET v_appd_value = p_appd_value;
    SET v_appd_trig_oper_type = p_appd_trig_oper_type;
    SET v_begin_moni_date = p_begin_moni_date;
    SET v_begin_moni_value = p_begin_moni_value;
    SET v_max_moni_value = p_max_moni_value;
    SET v_curr_moni_value = p_curr_moni_value;
    SET v_contrs_stock_code = p_contrs_stock_code;
    SET v_contrs_exch_no = p_contrs_exch_no;
    SET v_contrs_max_moni_value = p_contrs_max_moni_value;
    SET v_close_posi_flag = p_close_posi_flag;
    SET v_close_ratio_level_one = p_close_ratio_level_one;
    SET v_close_ratio_level_two = p_close_ratio_level_two;
    SET v_close_ratio_level_three = p_close_ratio_level_three;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_修改操作员风险监控设置】*/
      call db_rksecu.pra_rkserk_UpdateOporMonitorSet(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_moni_set_id,
          v_co_no,
          v_busi_opor_no,
          v_moni_role_type,
          v_moni_value_flag,
          v_moni_value_type,
          v_warn_posi_value,
          v_warn_trig_oper_type,
          v_close_posi_value,
          v_close_trig_oper_type,
          v_appd_value,
          v_appd_trig_oper_type,
          v_begin_moni_date,
          v_begin_moni_value,
          v_max_moni_value,
          v_curr_moni_value,
          v_contrs_stock_code,
          v_contrs_exch_no,
          v_contrs_max_moni_value,
          v_close_posi_flag,
          v_close_ratio_level_one,
          v_close_ratio_level_two,
          v_close_ratio_level_three,
          v_remark_info,
          v_error_code,
          v_error_info,
          v_update_times);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.4.30.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_修改操作员风险监控设置出现错误！',v_mysql_message);
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_风控_删除操作员风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_DeleteOporMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_DeleteOporMonitorSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_moni_set_id bigint,
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
    declare v_moni_set_id bigint;
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_删除操作员风险监控设置】*/
      call db_rksecu.pra_rkserk_DeleteOporMonitorSet(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_moni_set_id,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.4.31.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_删除操作员风险监控设置出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_查询操作员风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QueryOporMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QueryOporMonitorSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_moni_role_type int,
    IN p_moni_value_flag int,
    IN p_moni_value_type int,
    IN p_moni_set_status varchar(2),
    IN p_moni_result_status varchar(2),
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
    declare v_busi_opor_no int;
    declare v_moni_role_type int;
    declare v_moni_value_flag int;
    declare v_moni_value_type int;
    declare v_moni_set_status varchar(2);
    declare v_moni_result_status varchar(2);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_moni_role_type = p_moni_role_type;
    SET v_moni_value_flag = p_moni_value_flag;
    SET v_moni_value_type = p_moni_value_type;
    SET v_moni_set_status = p_moni_set_status;
    SET v_moni_result_status = p_moni_result_status;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_风控_查询操作员风险监控设置】*/
    call db_rksecu.pra_rkserk_QueryOporMonitorSet(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_busi_opor_no,
        v_moni_role_type,
        v_moni_value_flag,
        v_moni_value_type,
        v_moni_set_status,
        v_moni_result_status,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.32.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_查询操作员风险监控设置出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_更新操作员风险监控设置状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_UpdateOporMonitorSetStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_UpdateOporMonitorSetStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_moni_set_id bigint,
    IN p_moni_set_status varchar(2),
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
    declare v_moni_set_id bigint;
    declare v_moni_set_status varchar(2);
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_moni_set_status = p_moni_set_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控证券_风控_更新操作员风险监控设置状态】*/
        call db_rksecu.pra_rkserk_UpdateOporMonitorSetStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_moni_set_id,
            v_moni_set_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.33.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_更新操作员风险监控设置状态出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_更新所有操作员风险监控设置状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_UpdateAllOporMonitorSetStatus;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_UpdateAllOporMonitorSetStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_moni_set_status varchar(2),
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
    declare v_moni_set_status varchar(2);
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
    SET v_moni_set_status = p_moni_set_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控证券_风控_更新所有操作员风险监控设置状态】*/
        call db_rksecu.pra_rkserk_UpdateAllOporMonitorSetStatus(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_moni_set_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.34.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_更新所有操作员风险监控设置状态出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_查询主推客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QueryPushSecuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QueryPushSecuClientRiskRule(
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_model_id = p_model_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

        /* 调用【原子_风控证券_风控_查询主推客户风险规则记录】*/
        call db_rksecu.pra_rkserk_QueryPushSecuClientRiskRule(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no_str,
            v_exch_group_no_str,
            v_model_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.35.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_查询主推客户风险规则记录出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_查询T0操作员触警流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QueryT0OporTrigInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QueryT0OporTrigInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_query_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

        /* 调用【原子_风控证券_风控_查询T0操作员触警流水信息】*/
        call db_rksecu.pra_rkserk_QueryT0OporTrigInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_query_opor_no,
            v_pd_no,
            v_exch_group_no,
            v_exch_no,
            v_stock_code_no,
            v_begin_date,
            v_end_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.36.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_查询T0操作员触警流水信息出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_查询T0操作员汇总触警流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QueryT0OporSumTrigInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QueryT0OporSumTrigInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_query_opor_no int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

        /* 调用【原子_风控证券_风控_查询T0操作员汇总触警流水信息】*/
        call db_rksecu.pra_rkserk_QueryT0OporSumTrigInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_query_opor_no,
            v_begin_date,
            v_end_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.37.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_查询T0操作员汇总触警流水信息出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_查询T0操作员历史触警流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QueryT0OporHisTrigInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QueryT0OporHisTrigInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_query_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

        /* 调用【原子_风控证券_风控_查询T0操作员历史触警流水信息】*/
        call db_rksecu.pra_rkserk_QueryT0OporHisTrigInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_query_opor_no,
            v_pd_no,
            v_exch_group_no,
            v_exch_no,
            v_stock_code_no,
            v_begin_date,
            v_end_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.38.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_查询T0操作员历史触警流水信息出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_查询T0操作员历史汇总触警流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QueryT0OporHisSumTrigInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QueryT0OporHisSumTrigInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_query_opor_no int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

        /* 调用【原子_风控证券_风控_查询T0操作员历史汇总触警流水信息】*/
        call db_rksecu.pra_rkserk_QueryT0OporHisSumTrigInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_query_opor_no,
            v_begin_date,
            v_end_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.39.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_查询T0操作员历史汇总触警流水信息出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_删除客户风险触警流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_DeleteSecuClientRiskTrig;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_DeleteSecuClientRiskTrig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    declare v_trig_stage_type int;
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
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


       /* 调用【原子_风控证券_风控_删除客户风险触警流水】*/
       call db_rksecu.pra_rkserk_DeleteSecuClientRiskTrig(
           v_opor_co_no,
           v_opor_no,
           v_oper_mac,
           v_oper_ip_addr,
           v_oper_info,
           v_oper_way,
           v_func_code,
           v_co_no,
           v_trig_stage_type,
           v_error_code,
           v_error_info);
       if v_error_code = "1" then
           SET v_error_code = "rksecuT.4.40.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_删除客户风险触警流水出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_查询融资融券保证金计算
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QueryFinaLoanMarginCalc;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QueryFinaLoanMarginCalc(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_converted_margin decimal(18,4),
    OUT p_asac_fina_converted_pandl decimal(18,4),
    OUT p_asac_loan_converted_pandl decimal(18,4),
    OUT p_asac_fina_comm_capt_margin decimal(18,4),
    OUT p_asac_loan_comm_capt_margin decimal(18,4),
    OUT p_asac_fina_order_capt_margin decimal(18,4),
    OUT p_asac_loan_order_capt_margin decimal(18,4),
    OUT p_asac_fina_capt_margin decimal(18,4),
    OUT p_asac_loan_capt_margin decimal(18,4),
    OUT p_asac_keep_guarantee_ratio decimal(18,12),
    OUT p_asac_cmmd_converted_margin decimal(18,4),
    OUT p_asac_order_converted_margin decimal(18,4),
    OUT p_asac_curr_converted_margin decimal(18,4),
    OUT p_asac_fina_interest decimal(18,4),
    OUT p_asac_loan_interest decimal(18,4),
    OUT p_exgp_converted_margin decimal(18,4),
    OUT p_exgp_fina_converted_pandl decimal(18,4),
    OUT p_exgp_loan_converted_pandl decimal(18,4),
    OUT p_exgp_fina_comm_capt_margin decimal(18,4),
    OUT p_exgp_loan_comm_capt_margin decimal(18,4),
    OUT p_exgp_fina_order_capt_margin decimal(18,4),
    OUT p_exgp_loan_order_capt_margin decimal(18,4),
    OUT p_exgp_fina_capt_margin decimal(18,4),
    OUT p_exgp_loan_capt_margin decimal(18,4),
    OUT p_exgp_keep_guarantee_ratio decimal(18,12),
    OUT p_exgp_cmmd_converted_margin decimal(18,4),
    OUT p_exgp_order_converted_margin decimal(18,4),
    OUT p_exgp_curr_converted_margin decimal(18,4),
    OUT p_exgp_fina_interest decimal(18,4),
    OUT p_exgp_loan_interest decimal(18,4)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_converted_margin decimal(18,4);
    declare v_asac_fina_converted_pandl decimal(18,4);
    declare v_asac_loan_converted_pandl decimal(18,4);
    declare v_asac_fina_comm_capt_margin decimal(18,4);
    declare v_asac_loan_comm_capt_margin decimal(18,4);
    declare v_asac_fina_order_capt_margin decimal(18,4);
    declare v_asac_loan_order_capt_margin decimal(18,4);
    declare v_asac_fina_capt_margin decimal(18,4);
    declare v_asac_loan_capt_margin decimal(18,4);
    declare v_asac_keep_guarantee_ratio decimal(18,12);
    declare v_asac_cmmd_converted_margin decimal(18,4);
    declare v_asac_order_converted_margin decimal(18,4);
    declare v_asac_curr_converted_margin decimal(18,4);
    declare v_asac_fina_interest decimal(18,4);
    declare v_asac_loan_interest decimal(18,4);
    declare v_exgp_converted_margin decimal(18,4);
    declare v_exgp_fina_converted_pandl decimal(18,4);
    declare v_exgp_loan_converted_pandl decimal(18,4);
    declare v_exgp_fina_comm_capt_margin decimal(18,4);
    declare v_exgp_loan_comm_capt_margin decimal(18,4);
    declare v_exgp_fina_order_capt_margin decimal(18,4);
    declare v_exgp_loan_order_capt_margin decimal(18,4);
    declare v_exgp_fina_capt_margin decimal(18,4);
    declare v_exgp_loan_capt_margin decimal(18,4);
    declare v_exgp_keep_guarantee_ratio decimal(18,12);
    declare v_exgp_cmmd_converted_margin decimal(18,4);
    declare v_exgp_order_converted_margin decimal(18,4);
    declare v_exgp_curr_converted_margin decimal(18,4);
    declare v_exgp_fina_interest decimal(18,4);
    declare v_exgp_loan_interest decimal(18,4);

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_converted_margin = 0;
    SET v_asac_fina_converted_pandl = 0;
    SET v_asac_loan_converted_pandl = 0;
    SET v_asac_fina_comm_capt_margin = 0;
    SET v_asac_loan_comm_capt_margin = 0;
    SET v_asac_fina_order_capt_margin = 0;
    SET v_asac_loan_order_capt_margin = 0;
    SET v_asac_fina_capt_margin = 0;
    SET v_asac_loan_capt_margin = 0;
    SET v_asac_keep_guarantee_ratio = 0;
    SET v_asac_cmmd_converted_margin = 0;
    SET v_asac_order_converted_margin = 0;
    SET v_asac_curr_converted_margin = 0;
    SET v_asac_fina_interest = 0;
    SET v_asac_loan_interest = 0;
    SET v_exgp_converted_margin = 0;
    SET v_exgp_fina_converted_pandl = 0;
    SET v_exgp_loan_converted_pandl = 0;
    SET v_exgp_fina_comm_capt_margin = 0;
    SET v_exgp_loan_comm_capt_margin = 0;
    SET v_exgp_fina_order_capt_margin = 0;
    SET v_exgp_loan_order_capt_margin = 0;
    SET v_exgp_fina_capt_margin = 0;
    SET v_exgp_loan_capt_margin = 0;
    SET v_exgp_keep_guarantee_ratio = 0;
    SET v_exgp_cmmd_converted_margin = 0;
    SET v_exgp_order_converted_margin = 0;
    SET v_exgp_curr_converted_margin = 0;
    SET v_exgp_fina_interest = 0;
    SET v_exgp_loan_interest = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_风控_查询融资融券保证金计算】*/
    call db_rksecu.pra_rkserk_QueryFinaLoanMarginCalc(
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
        v_exch_group_no,
        v_error_code,
        v_error_info,
        v_asac_converted_margin,
        v_asac_fina_converted_pandl,
        v_asac_loan_converted_pandl,
        v_asac_fina_comm_capt_margin,
        v_asac_loan_comm_capt_margin,
        v_asac_fina_order_capt_margin,
        v_asac_loan_order_capt_margin,
        v_asac_fina_capt_margin,
        v_asac_loan_capt_margin,
        v_asac_keep_guarantee_ratio,
        v_asac_cmmd_converted_margin,
        v_asac_order_converted_margin,
        v_asac_curr_converted_margin,
        v_asac_fina_interest,
        v_asac_loan_interest,
        v_exgp_converted_margin,
        v_exgp_fina_converted_pandl,
        v_exgp_loan_converted_pandl,
        v_exgp_fina_comm_capt_margin,
        v_exgp_loan_comm_capt_margin,
        v_exgp_fina_order_capt_margin,
        v_exgp_loan_order_capt_margin,
        v_exgp_fina_capt_margin,
        v_exgp_loan_capt_margin,
        v_exgp_keep_guarantee_ratio,
        v_exgp_cmmd_converted_margin,
        v_exgp_order_converted_margin,
        v_exgp_curr_converted_margin,
        v_exgp_fina_interest,
        v_exgp_loan_interest);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.55.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_查询融资融券保证金计算出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asac_converted_margin = v_asac_converted_margin;
    SET p_asac_fina_converted_pandl = v_asac_fina_converted_pandl;
    SET p_asac_loan_converted_pandl = v_asac_loan_converted_pandl;
    SET p_asac_fina_comm_capt_margin = v_asac_fina_comm_capt_margin;
    SET p_asac_loan_comm_capt_margin = v_asac_loan_comm_capt_margin;
    SET p_asac_fina_order_capt_margin = v_asac_fina_order_capt_margin;
    SET p_asac_loan_order_capt_margin = v_asac_loan_order_capt_margin;
    SET p_asac_fina_capt_margin = v_asac_fina_capt_margin;
    SET p_asac_loan_capt_margin = v_asac_loan_capt_margin;
    SET p_asac_keep_guarantee_ratio = v_asac_keep_guarantee_ratio;
    SET p_asac_cmmd_converted_margin = v_asac_cmmd_converted_margin;
    SET p_asac_order_converted_margin = v_asac_order_converted_margin;
    SET p_asac_curr_converted_margin = v_asac_curr_converted_margin;
    SET p_asac_fina_interest = v_asac_fina_interest;
    SET p_asac_loan_interest = v_asac_loan_interest;
    SET p_exgp_converted_margin = v_exgp_converted_margin;
    SET p_exgp_fina_converted_pandl = v_exgp_fina_converted_pandl;
    SET p_exgp_loan_converted_pandl = v_exgp_loan_converted_pandl;
    SET p_exgp_fina_comm_capt_margin = v_exgp_fina_comm_capt_margin;
    SET p_exgp_loan_comm_capt_margin = v_exgp_loan_comm_capt_margin;
    SET p_exgp_fina_order_capt_margin = v_exgp_fina_order_capt_margin;
    SET p_exgp_loan_order_capt_margin = v_exgp_loan_order_capt_margin;
    SET p_exgp_fina_capt_margin = v_exgp_fina_capt_margin;
    SET p_exgp_loan_capt_margin = v_exgp_loan_capt_margin;
    SET p_exgp_keep_guarantee_ratio = v_exgp_keep_guarantee_ratio;
    SET p_exgp_cmmd_converted_margin = v_exgp_cmmd_converted_margin;
    SET p_exgp_order_converted_margin = v_exgp_order_converted_margin;
    SET p_exgp_curr_converted_margin = v_exgp_curr_converted_margin;
    SET p_exgp_fina_interest = v_exgp_fina_interest;
    SET p_exgp_loan_interest = v_exgp_loan_interest;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_风控_更新资产账户融资融券保证金计算结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_InsertAsacFinaLoanMarginCalcList;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_InsertAsacFinaLoanMarginCalcList(
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
    IN p_curr_converted_margin decimal(18,4),
    IN p_cmmd_converted_margin decimal(18,4),
    IN p_order_converted_margin decimal(18,4),
    IN p_fina_market_value decimal(18,4),
    IN p_fina_profit decimal(18,4),
    IN p_fina_converted_pandl decimal(18,4),
    IN p_loan_market_value decimal(18,4),
    IN p_loan_profit decimal(18,4),
    IN p_loan_converted_pandl decimal(18,4),
    IN p_fina_capt_margin decimal(18,4),
    IN p_loan_capt_margin decimal(18,4),
    IN p_keep_guarantee_ratio decimal(18,12),
    IN p_loan_sell_amt decimal(18,4),
    IN p_margin_ratio_market_value decimal(18,4),
    IN p_fina_interest decimal(18,4),
    IN p_loan_interest decimal(18,4),
    IN p_update_times int,
    IN p_fina_comm_capt_margin decimal(18,4),
    IN p_loan_comm_capt_margin decimal(18,4),
    IN p_fina_order_capt_margin decimal(18,4),
    IN p_loan_order_capt_margin decimal(18,4),
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
    declare v_curr_converted_margin decimal(18,4);
    declare v_cmmd_converted_margin decimal(18,4);
    declare v_order_converted_margin decimal(18,4);
    declare v_fina_market_value decimal(18,4);
    declare v_fina_profit decimal(18,4);
    declare v_fina_converted_pandl decimal(18,4);
    declare v_loan_market_value decimal(18,4);
    declare v_loan_profit decimal(18,4);
    declare v_loan_converted_pandl decimal(18,4);
    declare v_fina_capt_margin decimal(18,4);
    declare v_loan_capt_margin decimal(18,4);
    declare v_keep_guarantee_ratio decimal(18,12);
    declare v_loan_sell_amt decimal(18,4);
    declare v_margin_ratio_market_value decimal(18,4);
    declare v_fina_interest decimal(18,4);
    declare v_loan_interest decimal(18,4);
    declare v_update_times int;
    declare v_fina_comm_capt_margin decimal(18,4);
    declare v_loan_comm_capt_margin decimal(18,4);
    declare v_fina_order_capt_margin decimal(18,4);
    declare v_loan_order_capt_margin decimal(18,4);
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
    SET v_curr_converted_margin = p_curr_converted_margin;
    SET v_cmmd_converted_margin = p_cmmd_converted_margin;
    SET v_order_converted_margin = p_order_converted_margin;
    SET v_fina_market_value = p_fina_market_value;
    SET v_fina_profit = p_fina_profit;
    SET v_fina_converted_pandl = p_fina_converted_pandl;
    SET v_loan_market_value = p_loan_market_value;
    SET v_loan_profit = p_loan_profit;
    SET v_loan_converted_pandl = p_loan_converted_pandl;
    SET v_fina_capt_margin = p_fina_capt_margin;
    SET v_loan_capt_margin = p_loan_capt_margin;
    SET v_keep_guarantee_ratio = p_keep_guarantee_ratio;
    SET v_loan_sell_amt = p_loan_sell_amt;
    SET v_margin_ratio_market_value = p_margin_ratio_market_value;
    SET v_fina_interest = p_fina_interest;
    SET v_loan_interest = p_loan_interest;
    SET v_update_times = p_update_times;
    SET v_fina_comm_capt_margin = p_fina_comm_capt_margin;
    SET v_loan_comm_capt_margin = p_loan_comm_capt_margin;
    SET v_fina_order_capt_margin = p_fina_order_capt_margin;
    SET v_loan_order_capt_margin = p_loan_order_capt_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_风控证券_风控_更新资产账户融资融券保证金计算结果集】*/
    call db_rksecu.pra_rkserk_InsertAsacFinaLoanMarginCalcList(
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
        v_curr_converted_margin,
        v_cmmd_converted_margin,
        v_order_converted_margin,
        v_fina_market_value,
        v_fina_profit,
        v_fina_converted_pandl,
        v_loan_market_value,
        v_loan_profit,
        v_loan_converted_pandl,
        v_fina_capt_margin,
        v_loan_capt_margin,
        v_keep_guarantee_ratio,
        v_loan_sell_amt,
        v_margin_ratio_market_value,
        v_fina_interest,
        v_loan_interest,
        v_update_times,
        v_fina_comm_capt_margin,
        v_loan_comm_capt_margin,
        v_fina_order_capt_margin,
        v_loan_order_capt_margin,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.51.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_更新资产账户融资融券保证金计算结果集出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_查询资产账户融资融券保证金计算结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QueryAsacFinaLoanMarginCalcList;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QueryAsacFinaLoanMarginCalcList(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_风控_查询资产账户融资融券保证金计算结果集】*/
    call db_rksecu.pra_rkserk_QueryAsacFinaLoanMarginCalcList(
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
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.54.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_查询资产账户融资融券保证金计算结果集出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_更新交易组融资融券保证金计算结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_InsertGrpFinaLoanMarginCalcList;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_InsertGrpFinaLoanMarginCalcList(
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
    IN p_curr_converted_margin decimal(18,4),
    IN p_cmmd_converted_margin decimal(18,4),
    IN p_order_converted_margin decimal(18,4),
    IN p_fina_market_value decimal(18,4),
    IN p_fina_profit decimal(18,4),
    IN p_fina_converted_pandl decimal(18,4),
    IN p_loan_market_value decimal(18,4),
    IN p_loan_profit decimal(18,4),
    IN p_loan_converted_pandl decimal(18,4),
    IN p_fina_capt_margin decimal(18,4),
    IN p_loan_capt_margin decimal(18,4),
    IN p_keep_guarantee_ratio decimal(18,12),
    IN p_loan_sell_amt decimal(18,4),
    IN p_margin_ratio_market_value decimal(18,4),
    IN p_fina_interest decimal(18,4),
    IN p_loan_interest decimal(18,4),
    IN p_update_times int,
    IN p_fina_comm_capt_margin decimal(18,4),
    IN p_loan_comm_capt_margin decimal(18,4),
    IN p_fina_order_capt_margin decimal(18,4),
    IN p_loan_order_capt_margin decimal(18,4),
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
    declare v_curr_converted_margin decimal(18,4);
    declare v_cmmd_converted_margin decimal(18,4);
    declare v_order_converted_margin decimal(18,4);
    declare v_fina_market_value decimal(18,4);
    declare v_fina_profit decimal(18,4);
    declare v_fina_converted_pandl decimal(18,4);
    declare v_loan_market_value decimal(18,4);
    declare v_loan_profit decimal(18,4);
    declare v_loan_converted_pandl decimal(18,4);
    declare v_fina_capt_margin decimal(18,4);
    declare v_loan_capt_margin decimal(18,4);
    declare v_keep_guarantee_ratio decimal(18,12);
    declare v_loan_sell_amt decimal(18,4);
    declare v_margin_ratio_market_value decimal(18,4);
    declare v_fina_interest decimal(18,4);
    declare v_loan_interest decimal(18,4);
    declare v_update_times int;
    declare v_fina_comm_capt_margin decimal(18,4);
    declare v_loan_comm_capt_margin decimal(18,4);
    declare v_fina_order_capt_margin decimal(18,4);
    declare v_loan_order_capt_margin decimal(18,4);
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_curr_converted_margin = p_curr_converted_margin;
    SET v_cmmd_converted_margin = p_cmmd_converted_margin;
    SET v_order_converted_margin = p_order_converted_margin;
    SET v_fina_market_value = p_fina_market_value;
    SET v_fina_profit = p_fina_profit;
    SET v_fina_converted_pandl = p_fina_converted_pandl;
    SET v_loan_market_value = p_loan_market_value;
    SET v_loan_profit = p_loan_profit;
    SET v_loan_converted_pandl = p_loan_converted_pandl;
    SET v_fina_capt_margin = p_fina_capt_margin;
    SET v_loan_capt_margin = p_loan_capt_margin;
    SET v_keep_guarantee_ratio = p_keep_guarantee_ratio;
    SET v_loan_sell_amt = p_loan_sell_amt;
    SET v_margin_ratio_market_value = p_margin_ratio_market_value;
    SET v_fina_interest = p_fina_interest;
    SET v_loan_interest = p_loan_interest;
    SET v_update_times = p_update_times;
    SET v_fina_comm_capt_margin = p_fina_comm_capt_margin;
    SET v_loan_comm_capt_margin = p_loan_comm_capt_margin;
    SET v_fina_order_capt_margin = p_fina_order_capt_margin;
    SET v_loan_order_capt_margin = p_loan_order_capt_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_风控证券_风控_更新交易组融资融券保证金计算结果集】*/
    call db_rksecu.pra_rkserk_InsertGrpFinaLoanMarginCalcList(
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
        v_exch_group_no,
        v_curr_converted_margin,
        v_cmmd_converted_margin,
        v_order_converted_margin,
        v_fina_market_value,
        v_fina_profit,
        v_fina_converted_pandl,
        v_loan_market_value,
        v_loan_profit,
        v_loan_converted_pandl,
        v_fina_capt_margin,
        v_loan_capt_margin,
        v_keep_guarantee_ratio,
        v_loan_sell_amt,
        v_margin_ratio_market_value,
        v_fina_interest,
        v_loan_interest,
        v_update_times,
        v_fina_comm_capt_margin,
        v_loan_comm_capt_margin,
        v_fina_order_capt_margin,
        v_loan_order_capt_margin,
        v_error_code,
        v_error_info,
        v_row_id);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.61.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_更新交易组融资融券保证金计算结果集出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_查询交易组融资融券保证金计算结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QueryGrpFinaLoanMarginCalcList;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QueryGrpFinaLoanMarginCalcList(
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
    declare v_exch_group_no int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_风控_查询交易组融资融券保证金计算结果集】*/
    call db_rksecu.pra_rkserk_QueryGrpFinaLoanMarginCalcList(
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
        v_exch_group_no,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.64.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_查询交易组融资融券保证金计算结果集出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_查询所有账户风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_QueryAllProductMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_QueryAllProductMonitorSet(
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
    IN p_moni_role_type int,
    IN p_moni_value_flag int,
    IN p_moni_value_type int,
    IN p_moni_set_status varchar(2),
    IN p_moni_result_status varchar(2),
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
    declare v_moni_role_type int;
    declare v_moni_value_flag int;
    declare v_moni_value_type int;
    declare v_moni_set_status varchar(2);
    declare v_moni_result_status varchar(2);
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
    SET v_moni_role_type = p_moni_role_type;
    SET v_moni_value_flag = p_moni_value_flag;
    SET v_moni_value_type = p_moni_value_type;
    SET v_moni_set_status = p_moni_set_status;
    SET v_moni_result_status = p_moni_result_status;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_风控_查询所有账户风险监控设置】*/
    call db_rksecu.pra_rkserk_QueryAllProductMonitorSet(
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
        v_moni_role_type,
        v_moni_value_flag,
        v_moni_value_type,
        v_moni_set_status,
        v_moni_result_status,
        v_sort_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.65.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_查询所有账户风险监控设置出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_新增预订单信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tb_rkserk_Addpreorder;;
DELIMITER ;;
CREATE PROCEDURE prt_tb_rkserk_Addpreorder(
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
    IN p_exch_crncy_type varchar(3),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
    IN p_order_batch_no int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_order_batch_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_all_fee = p_all_fee;
    SET v_order_batch_no = p_order_batch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控证券_风控_新增预订单信息表】*/
        call db_rksecu.pra_tb_rkserk_Addpreorder(
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
            v_exch_crncy_type,
            v_stock_code_no,
            v_stock_code,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_all_fee,
            v_order_batch_no,
            v_error_code,
            v_error_info,
            v_row_id);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.66.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_新增预订单信息表出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_删除预订单信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_tb_rkserk_Delpreorder;;
DELIMITER ;;
CREATE PROCEDURE prt_tb_rkserk_Delpreorder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_batch_no int,
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
    declare v_order_batch_no int;
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
    SET v_order_batch_no = p_order_batch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控证券_风控_删除预订单信息表】*/
        call db_rksecu.pra_tb_rkserk_Delpreorder(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_order_batch_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.4.67.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_删除预订单信息表出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_风控_联合汇总检查客户风险
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_SumCheckSecuClientRisk;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_SumCheckSecuClientRisk(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_order_batch_no int,
    IN p_trig_stage_type int,
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_compli_trig_id bigint,
    OUT p_risk_rule_type int,
    OUT p_compli_rules_remark varchar(255),
    OUT p_numer_value decimal(18,4),
    OUT p_dino_value decimal(18,4),
    OUT p_trig_type int,
    OUT p_risk_rule_value_str varchar(255),
    OUT p_client_risk_rule_id int,
    OUT p_risk_rule_action varchar(32),
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
    declare v_order_batch_no int;
    declare v_trig_stage_type int;
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_risk_rule_type int;
    declare v_compli_rules_remark varchar(255);
    declare v_numer_value decimal(18,4);
    declare v_dino_value decimal(18,4);
    declare v_trig_type int;
    declare v_risk_rule_value_str varchar(255);
    declare v_client_risk_rule_id int;
    declare v_risk_rule_action varchar(32);
    declare v_remark_info varchar(255);
    declare v_risk_param_value varchar(255);

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
    SET v_order_batch_no = p_order_batch_no;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_compli_trig_id = 0;
    SET v_risk_rule_type = 0;
    SET v_compli_rules_remark = " ";
    SET v_numer_value = 0;
    SET v_dino_value = 0;
    SET v_trig_type = 0;
    SET v_risk_rule_value_str = " ";
    SET v_client_risk_rule_id = 0;
    SET v_risk_rule_action = " ";
    SET v_remark_info = " ";
    SET v_risk_param_value = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


      /* 调用【原子_风控证券_风控_获取最大的合规触警流水序号】*/
      call db_rksecu.pra_rkserk_GetMaxComplianceTriggerId(
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
          SET v_error_code = "rksecuT.4.68.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取最大的合规触警流水序号出现错误！',v_mysql_message);
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


      /* 调用【原子_风控证券_风控_交易检查联合汇总客户风险】*/
      call db_rksecu.pra_rkserk_CheckSumSecuClientRisk(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_order_batch_no,
          v_trig_stage_type,
          v_compli_trig_id,
          v_row_id,
          v_error_code,
          v_error_info,
          v_compli_rules_remark,
          v_risk_rule_action,
          v_risk_param_value,
          v_risk_rule_value_str,
          v_trig_type,
          v_numer_value,
          v_dino_value,
          v_risk_rule_type,
          v_client_risk_rule_id);
      if v_error_code = "1" then
          SET v_error_code = "rksecuT.4.68.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_交易检查联合汇总客户风险出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


    /* [事务结束] */
    COMMIT;


    /* set @备注信息# = concat("触发风控:", @合规规则说明#,";分子:",@分子值#,";分母:",@分母值#,";合规规则控制值:",@风险规则值串#); */
    set v_remark_info = concat("触发风控:", v_compli_rules_remark,";分子:",v_numer_value,";分母:",v_dino_value,";合规规则控制值:",v_risk_rule_value_str);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_compli_trig_id = v_compli_trig_id;
    SET p_risk_rule_type = v_risk_rule_type;
    SET p_compli_rules_remark = v_compli_rules_remark;
    SET p_numer_value = v_numer_value;
    SET p_dino_value = v_dino_value;
    SET p_trig_type = v_trig_type;
    SET p_risk_rule_value_str = v_risk_rule_value_str;
    SET p_client_risk_rule_id = v_client_risk_rule_id;
    SET p_risk_rule_action = v_risk_rule_action;
    SET p_remark_info = v_remark_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_风控_新增预指令信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rkserk_Addprecommand;;
DELIMITER ;;
CREATE PROCEDURE prt_rkserk_Addprecommand(
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
    IN p_exch_crncy_type varchar(3),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_comm_dir int,
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
    IN p_comm_batch_no int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_comm_dir int;
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_comm_batch_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_comm_dir = p_comm_dir;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_all_fee = p_all_fee;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_风控证券_风控_新增预指令信息表】*/
    call db_rksecu.pra_rkserk_Addprecommand(
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
        v_exch_crncy_type,
        v_stock_code_no,
        v_stock_code,
        v_comm_dir,
        v_limit_actual_price,
        v_comm_qty,
        v_all_fee,
        v_comm_batch_no,
        v_error_code,
        v_error_info,
        v_row_id);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.4.69.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_新增预指令信息表出现错误！',v_mysql_message);
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


