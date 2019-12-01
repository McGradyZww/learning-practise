DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_公用_查询风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_QuerySecuRiskRule;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_QuerySecuRiskRule(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_risk_rule_type int,
    IN p_risk_calc_type int,
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
    declare v_risk_rule_type int;
    declare v_risk_calc_type int;
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
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_risk_calc_type = p_risk_calc_type;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_公用_查询风险规则记录】*/
    call db_rksecu.pra_rksepb_QuerySecuRiskRule(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_risk_rule_type,
        v_risk_calc_type,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.1.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_查询风险规则记录出现错误！',v_mysql_message);
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

# 事务_风控证券_公用_增加风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_AddSecuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_AddSecuRiskItem(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_exch_no_str varchar(2048),
    IN p_order_dir_str varchar(1024),
    IN p_dime_id bigint,
    IN p_risk_item_tmplat_id bigint,
    IN p_trig_stage_type_str varchar(64),
    IN p_compli_calc_level int,
    IN p_unit_nav_flag int,
    IN p_trig_type int,
    IN p_compli_rules_remark varchar(255),
    IN p_risk_rule_id int,
    IN p_risk_rule_type int,
    IN p_risk_rule_name varchar(64),
    IN p_risk_rule_code varchar(2048),
    IN p_risk_param_str varchar(2048),
    IN p_risk_rule_value_str1 varchar(255),
    IN p_risk_rule_action1 varchar(32),
    IN p_risk_rule_value_str2 varchar(255),
    IN p_risk_rule_action2 varchar(32),
    IN p_risk_rule_value_str3 varchar(255),
    IN p_risk_rule_action3 varchar(32),
    IN p_risk_rule_value_str4 varchar(255),
    IN p_risk_rule_action4 varchar(32),
    IN p_corrsp_plug varchar(64),
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
    declare v_exch_no_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_dime_id bigint;
    declare v_risk_item_tmplat_id bigint;
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_dime_type int;
    declare v_ctrl_cond_dim_code_str varchar(255);

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
    SET v_exch_no_str = p_exch_no_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_dime_id = p_dime_id;
    SET v_risk_item_tmplat_id = p_risk_item_tmplat_id;
    SET v_trig_stage_type_str = p_trig_stage_type_str;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_unit_nav_flag = p_unit_nav_flag;
    SET v_trig_type = p_trig_type;
    SET v_compli_rules_remark = p_compli_rules_remark;
    SET v_risk_rule_id = p_risk_rule_id;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_risk_rule_name = p_risk_rule_name;
    SET v_risk_rule_code = p_risk_rule_code;
    SET v_risk_param_str = p_risk_param_str;
    SET v_risk_rule_value_str1 = p_risk_rule_value_str1;
    SET v_risk_rule_action1 = p_risk_rule_action1;
    SET v_risk_rule_value_str2 = p_risk_rule_value_str2;
    SET v_risk_rule_action2 = p_risk_rule_action2;
    SET v_risk_rule_value_str3 = p_risk_rule_value_str3;
    SET v_risk_rule_action3 = p_risk_rule_action3;
    SET v_risk_rule_value_str4 = p_risk_rule_value_str4;
    SET v_risk_rule_action4 = p_risk_rule_action4;
    SET v_corrsp_plug = p_corrsp_plug;
    SET v_begin_time = p_begin_time;
    SET v_end_time = p_end_time;
    SET v_rule_flag = p_rule_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_dime_type = 0;
    SET v_ctrl_cond_dim_code_str = " ";

    
    label_pro:BEGIN
    

    /* if @机构编号# = 0 then */
    if v_co_no = 0 then

        /* set @机构编号# = @操作员机构编号#; */
        set v_co_no = v_opor_co_no;
    else

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][50][@机构编号#] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rksecuT.1.2.50";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向串# = " " then */
    if v_order_dir_str = " " then

        /* if @触发方向# = 1 or @触发方向# = 2 then */
        if v_trig_type = 1 or v_trig_type = 2 then

          /* set @订单方向串# = "1;"; */
          set v_order_dir_str = "1;";

        /* elseif @触发方向# = 3 or @触发方向# = 4 then */
        elseif v_trig_type = 3 or v_trig_type = 4 then

          /* set @订单方向串# = "2;"; */
          set v_order_dir_str = "2;";
        end if;

        /* if @风险规则类别# = 7 or  @风险规则类别# = 8 then */
        if v_risk_rule_type = 7 or  v_risk_rule_type = 8 then

           /* set @订单方向串# = "1;2;"; */
           set v_order_dir_str = "1;2;";
        end if;
    end if;

    /* 调用【原子_风控证券_维度_维度序号获取维度信息】*/
    call db_rksecu.pra_rksedm_QueryDimInfoByDimID(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_dime_id,
        v_error_code,
        v_error_info,
        v_co_no,
        v_dime_type,
        v_ctrl_cond_dim_code_str);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.1.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_维度_维度序号获取维度信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @维度类型# = 9 and instr(concat(";",@控制条件维度编码串#,";") , concat(";",101, ";")) > 0 then */
    if v_dime_type = 9 and instr(concat(";",v_ctrl_cond_dim_code_str,";") , concat(";",101, ";")) > 0 then

      /* set @订单方向串# = concat(@订单方向串#  ,"3;") ; */
      set v_order_dir_str = concat(v_order_dir_str  ,"3;") ;
    #elseif @维度类型# = 9 and @控制条件维度编码串#  = 102 then
    #  set @订单方向串# = "4;";

    /* elseif @维度类型# = 9 and instr(concat(";",@控制条件维度编码串#,";") , concat(";",4, ";")) > 0 then */
    elseif v_dime_type = 9 and instr(concat(";",v_ctrl_cond_dim_code_str,";") , concat(";",4, ";")) > 0 then
    #如果控制资产类型包含了现金资产,订单方向全部都存

        /* set @订单方向串# = "1;2;3;4;"; */
        set v_order_dir_str = "1;2;3;4;";
    #elseif @维度类型# = 1 and (instr(concat(";",@控制条件维度编码串#,";") , concat(";",27, ";")) > 0  or instr(concat(";",@控制条件维度编码串#,";") , concat(";",26, ";")) > 0 ) then
      #  set @订单方向串# = "3;4;";
    end if;

    /* if left(@订单方向串#, 1) <> ';'  then */
    if left(v_order_dir_str, 1) <> ';'  then

       /* set @订单方向串# = concat(";",@订单方向串# ); */
       set v_order_dir_str = concat(";",v_order_dir_str );
    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控证券_公用_增加风险条目记录】*/
        call db_rksecu.pra_rksepb_AddSecuRiskItem(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_exch_no_str,
            v_order_dir_str,
            v_dime_id,
            v_risk_item_tmplat_id,
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
            v_error_code,
            v_error_info,
            v_row_id);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.1.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_增加风险条目记录出现错误！',v_mysql_message);
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

# 事务_风控证券_公用_修改风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_ModiSecuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_ModiSecuRiskItem(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_exch_no_str varchar(2048),
    IN p_order_dir_str varchar(1024),
    IN p_dime_id bigint,
    IN p_risk_item_tmplat_id bigint,
    IN p_trig_stage_type_str varchar(64),
    IN p_compli_calc_level int,
    IN p_unit_nav_flag int,
    IN p_trig_type int,
    IN p_compli_rules_remark varchar(255),
    IN p_risk_rule_id int,
    IN p_risk_rule_type int,
    IN p_risk_rule_name varchar(64),
    IN p_risk_rule_code varchar(2048),
    IN p_risk_param_str varchar(2048),
    IN p_risk_rule_value_str1 varchar(255),
    IN p_risk_rule_action1 varchar(32),
    IN p_risk_rule_value_str2 varchar(255),
    IN p_risk_rule_action2 varchar(32),
    IN p_risk_rule_value_str3 varchar(255),
    IN p_risk_rule_action3 varchar(32),
    IN p_risk_rule_value_str4 varchar(255),
    IN p_risk_rule_action4 varchar(32),
    IN p_corrsp_plug varchar(64),
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
    declare v_exch_no_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_dime_id bigint;
    declare v_risk_item_tmplat_id bigint;
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_change_risk_rule_code varchar(2048);
    declare v_change_risk_param_str varchar(2048);
    declare v_record_count int;
    declare v_tmp_compli_calc_level int;
    declare v_dime_type int;
    declare v_ctrl_cond_dim_code_str varchar(255);

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
    SET v_exch_no_str = p_exch_no_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_dime_id = p_dime_id;
    SET v_risk_item_tmplat_id = p_risk_item_tmplat_id;
    SET v_trig_stage_type_str = p_trig_stage_type_str;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_unit_nav_flag = p_unit_nav_flag;
    SET v_trig_type = p_trig_type;
    SET v_compli_rules_remark = p_compli_rules_remark;
    SET v_risk_rule_id = p_risk_rule_id;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_risk_rule_name = p_risk_rule_name;
    SET v_risk_rule_code = p_risk_rule_code;
    SET v_risk_param_str = p_risk_param_str;
    SET v_risk_rule_value_str1 = p_risk_rule_value_str1;
    SET v_risk_rule_action1 = p_risk_rule_action1;
    SET v_risk_rule_value_str2 = p_risk_rule_value_str2;
    SET v_risk_rule_action2 = p_risk_rule_action2;
    SET v_risk_rule_value_str3 = p_risk_rule_value_str3;
    SET v_risk_rule_action3 = p_risk_rule_action3;
    SET v_risk_rule_value_str4 = p_risk_rule_value_str4;
    SET v_risk_rule_action4 = p_risk_rule_action4;
    SET v_corrsp_plug = p_corrsp_plug;
    SET v_begin_time = p_begin_time;
    SET v_end_time = p_end_time;
    SET v_rule_flag = p_rule_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_change_risk_rule_code = " ";
    SET v_change_risk_param_str = " ";
    SET v_record_count = 0;
    SET v_tmp_compli_calc_level = 0;
    SET v_dime_type = 0;
    SET v_ctrl_cond_dim_code_str = " ";

    
    label_pro:BEGIN
    

    /* if @机构编号# = 0 then */
    if v_co_no = 0 then

        /* set @机构编号# = @操作员机构编号#; */
        set v_co_no = v_opor_co_no;
    else

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][50][@机构编号#] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rksecuT.1.3.50";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [获取表记录变量][风控证券_公用_风险条目表][{合规计算层级}][@临时_合规计算层级#][{记录序号}=@记录序号#][4][@记录序号#] */
    select compli_calc_level into v_tmp_compli_calc_level from db_rksecu.tb_rksepb_secu_risk_item where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "rksecuT.1.3.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* if @临时_合规计算层级# <> @合规计算层级# then */
    if v_tmp_compli_calc_level <> v_compli_calc_level then

         /* [记录已存在][风控证券_风控_客户风险规则表][@记录个数#][{机构编号} = @机构编号# and {风险条目序号}=@记录序号# and {模板序号}<>0][915][""] */
         select count(1) into v_record_count from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no = v_co_no and risk_item_id=v_row_id and model_id<>0 limit 1;
         if v_record_count > 0 then
                     
             SET v_error_code = "rksecuT.1.3.915";
             SET v_error_info = "";
             leave label_pro;
         end if;

    end if;

    /* if @订单方向串# = " " then */
    if v_order_dir_str = " " then

        /* if @触发方向# = 1 or @触发方向# = 2 then */
        if v_trig_type = 1 or v_trig_type = 2 then

          /* set @订单方向串# = "1;"; */
          set v_order_dir_str = "1;";

        /* elseif @触发方向# = 3 or @触发方向# = 4 then */
        elseif v_trig_type = 3 or v_trig_type = 4 then

          /* set @订单方向串# = "2;"; */
          set v_order_dir_str = "2;";
        end if;

        /* if @风险规则类别# = 7 or  @风险规则类别# = 8 then */
        if v_risk_rule_type = 7 or  v_risk_rule_type = 8 then

           /* set @订单方向串# = "1;2;"; */
           set v_order_dir_str = "1;2;";
        end if;
    end if;

    /* 调用【原子_风控证券_维度_维度序号获取维度信息】*/
    call db_rksecu.pra_rksedm_QueryDimInfoByDimID(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_dime_id,
        v_error_code,
        v_error_info,
        v_co_no,
        v_dime_type,
        v_ctrl_cond_dim_code_str);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.1.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_维度_维度序号获取维度信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @维度类型# = 9 and instr(concat(";",@控制条件维度编码串#,";") , concat(";",101, ";")) > 0 then */
    if v_dime_type = 9 and instr(concat(";",v_ctrl_cond_dim_code_str,";") , concat(";",101, ";")) > 0 then

      /* set @订单方向串# = "3;"; */
      set v_order_dir_str = "3;";
    #elseif @维度类型# = 9 and instr(concat(";",@控制条件维度编码串#,";") , concat(";",102, ";")) > 0 then
    #  set @订单方向串# = "4;";

    /* elseif @维度类型# = 9 and instr(concat(";",@控制条件维度编码串#,";") , concat(";",4, ";")) > 0 then */
    elseif v_dime_type = 9 and instr(concat(";",v_ctrl_cond_dim_code_str,";") , concat(";",4, ";")) > 0 then
    #如果控制资产类型包含了现金资产,订单方向全部都存

        /* set @订单方向串# = "1;2;3;4;"; */
        set v_order_dir_str = "1;2;3;4;";
    #elseif @维度类型# = 1 and (instr(concat(";",@控制条件维度编码串#,";") , concat(";",27, ";")) > 0  or instr(concat(";",@控制条件维度编码串#,";") , concat(";",26, ";")) > 0 ) then
       # set @订单方向串# = "3;4;";
    end if;

    /* if left(@订单方向串#, 1) <> ';'  then */
    if left(v_order_dir_str, 1) <> ';'  then

       /* set @订单方向串# = concat(";",@订单方向串# ); */
       set v_order_dir_str = concat(";",v_order_dir_str );
    end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_风控证券_公用_修改风险条目记录】*/
        call db_rksecu.pra_rksepb_ModiSecuRiskItem(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_co_no,
            v_exch_no_str,
            v_order_dir_str,
            v_dime_id,
            v_risk_item_tmplat_id,
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
            v_error_code,
            v_error_info,
            v_change_risk_rule_code,
            v_change_risk_param_str);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.1.3.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_修改风险条目记录出现错误！',v_mysql_message);
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
use db_rksecu;;

# 事务_风控证券_公用_删除风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_DeleteSecuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_DeleteSecuRiskItem(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_risk_item_id_str varchar(2048),
    IN p_compli_rules_remark varchar(255),
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
    declare v_risk_item_id_str varchar(2048);
    declare v_compli_rules_remark varchar(255);
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
    SET v_risk_item_id_str = p_risk_item_id_str;
    SET v_compli_rules_remark = p_compli_rules_remark;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
            
            SET v_error_code = "rksecuT.1.4.50";
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


        /* 调用【原子_风控证券_公用_删除风险条目记录】*/
        call db_rksecu.pra_rksepb_DeleteSecuRiskItem(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_risk_item_id_str,
            v_compli_rules_remark,
            v_error_code,
            v_error_info,
            v_risk_param_str);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.1.4.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_删除风险条目记录出现错误！',v_mysql_message);
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
    SET p_risk_param_str = v_risk_param_str;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_公用_查询风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_QuerySecuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_QuerySecuRiskItem(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_risk_item_id_str varchar(2048),
    IN p_compli_rules_remark varchar(255),
    IN p_risk_rule_id int,
    IN p_risk_rule_type int,
    IN p_risk_rule_name varchar(64),
    IN p_corrsp_plug varchar(64),
    IN p_risk_item_tmplat_id bigint,
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
    declare v_compli_rules_remark varchar(255);
    declare v_risk_rule_id int;
    declare v_risk_rule_type int;
    declare v_risk_rule_name varchar(64);
    declare v_corrsp_plug varchar(64);
    declare v_risk_item_tmplat_id bigint;
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
    SET v_compli_rules_remark = p_compli_rules_remark;
    SET v_risk_rule_id = p_risk_rule_id;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_risk_rule_name = p_risk_rule_name;
    SET v_corrsp_plug = p_corrsp_plug;
    SET v_risk_item_tmplat_id = p_risk_item_tmplat_id;
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
            
            SET v_error_code = "rksecuT.1.5.50";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_风控证券_公用_查询风险条目记录】*/
    call db_rksecu.pra_rksepb_QuerySecuRiskItem(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_risk_item_id_str,
        v_compli_rules_remark,
        v_risk_rule_id,
        v_risk_rule_type,
        v_risk_rule_name,
        v_corrsp_plug,
        v_risk_item_tmplat_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.1.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_查询风险条目记录出现错误！',v_mysql_message);
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

# 事务_风控证券_公用_增加风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_AddSecuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_AddSecuRiskModel(
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

        /* [检查报错返回][@操作员机构编号# <> @机构编号#][50][@机构编号#] */
        if v_opor_co_no <> v_co_no then
            
            SET v_error_code = "rksecuT.1.6.50";
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


        /* 调用【原子_风控证券_公用_增加风险模板记录】*/
        call db_rksecu.pra_rksepb_AddSecuRiskModel(
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
            SET v_error_code = "rksecuT.1.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_增加风险模板记录出现错误！',v_mysql_message);
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

# 事务_风控证券_公用_删除风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_DeleteSecuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_DeleteSecuRiskModel(
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
            
            SET v_error_code = "rksecuT.1.7.50";
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


        /* 调用【原子_风控证券_公用_删除风险模板记录】*/
        call db_rksecu.pra_rksepb_DeleteSecuRiskModel(
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
            SET v_error_code = "rksecuT.1.7.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_删除风险模板记录出现错误！',v_mysql_message);
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

# 事务_风控证券_公用_修改风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_ModiSecuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_ModiSecuRiskModel(
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
            
            SET v_error_code = "rksecuT.1.8.50";
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


        /* 调用【原子_风控证券_公用_修改风险模板记录】*/
        call db_rksecu.pra_rksepb_ModiSecuRiskModel(
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
            SET v_error_code = "rksecuT.1.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_修改风险模板记录出现错误！',v_mysql_message);
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

# 事务_风控证券_公用_查询风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_QuerySecuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_QuerySecuRiskModel(
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
            
            SET v_error_code = "rksecuT.1.9.50";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_风控证券_公用_查询风险模板记录】*/
    call db_rksecu.pra_rksepb_QuerySecuRiskModel(
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
        SET v_error_code = "rksecuT.1.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_查询风险模板记录出现错误！',v_mysql_message);
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

# 事务_风控证券_公用_增加风险模板条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_AddSecuRiskModelItem;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_AddSecuRiskModelItem(
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
    OUT p_error_info varchar(255),
    OUT p_row_id_str varchar(2048)
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
    declare v_row_id_str varchar(2048);

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
    SET v_row_id_str = " ";

    
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
            
            SET v_error_code = "rksecuT.1.10.50";
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


        /* 调用【原子_风控证券_公用_增加风险模板条目记录】*/
        call db_rksecu.pra_rksepb_AddSecuRiskModelItem(
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
            v_error_info,
            v_row_id_str);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.1.10.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_增加风险模板条目记录出现错误！',v_mysql_message);
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
    SET p_row_id_str = v_row_id_str;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_公用_删除风险模板条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_DeleteSecuRiskModelItem;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_DeleteSecuRiskModelItem(
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
    declare v_model_id bigint;
    declare v_risk_item_id_str varchar(2048);
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
    SET v_model_id = p_model_id;
    SET v_risk_item_id_str = p_risk_item_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
            
            SET v_error_code = "rksecuT.1.11.50";
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


        /* 调用【原子_风控证券_公用_删除风险模板条目记录】*/
        call db_rksecu.pra_rksepb_DeleteSecuRiskModelItem(
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
            v_error_info,
            v_risk_param_str);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.1.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_删除风险模板条目记录出现错误！',v_mysql_message);
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
    SET p_risk_param_str = v_risk_param_str;

END;;


DELIMITER ;;
use db_rksecu;;

# 事务_风控证券_公用_查询风险模板条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_QuerySecuRiskModelItem;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_QuerySecuRiskModelItem(
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
    IN p_compli_rules_remark varchar(255),
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
    declare v_compli_rules_remark varchar(255);
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
    SET v_compli_rules_remark = p_compli_rules_remark;
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
            
            SET v_error_code = "rksecuT.1.12.50";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_风控证券_公用_查询风险模板条目记录】*/
    call db_rksecu.pra_rksepb_QuerySecuRiskModelItem(
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
        v_compli_rules_remark,
        v_risk_rule_type,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.1.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_查询风险模板条目记录出现错误！',v_mysql_message);
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

# 事务_风控证券_公用_更新风险条目记录启用标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_UpdateFutuRiskItemFlag;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_UpdateFutuRiskItemFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_risk_item_id_str varchar(2048),
    IN p_risk_rule_type int,
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
    declare v_risk_rule_type int;
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
    SET v_risk_rule_type = p_risk_rule_type;
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
            
            SET v_error_code = "rksecuT.1.13.1";
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


        /* 调用【原子_风控证券_公用_更新风险条目记录启用标志】*/
        call db_rksecu.pra_rksepb_UpdateFutuRiskItemFlag(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_risk_item_id_str,
            v_risk_rule_type,
            v_rule_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.1.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_更新风险条目记录启用标志出现错误！',v_mysql_message);
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

# 事务_风控证券_公用_证券数据归历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_SecuDataToHis;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_SecuDataToHis(
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


      /* 调用【原子_风控证券_公用_证券数据归历史】*/
      call db_rksecu.pra_rksepb_SecuDataToHis(
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
          SET v_error_code = "rksecuT.1.14.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_证券数据归历史出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* 调用【原子_风控证券_计算_计算数据归历史】*/
      call db_rksecu.pra_rksecc_SecuDataToHis(
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
          SET v_error_code = "rksecuT.1.14.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算数据归历史出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          leave label_pro;
      end if;


      /* 调用【原子_风控证券_风控_风控数据归历史】*/
      call db_rksecu.pra_rkserk_SecuDataToHis(
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
          SET v_error_code = "rksecuT.1.14.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_风控数据归历史出现错误！',v_mysql_message);
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

# 事务_风控证券_公用_查询风险条目模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_QuerySecuRiskItemTempl;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_QuerySecuRiskItemTempl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_risk_rule_type int,
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
    declare v_risk_rule_type int;
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
    SET v_risk_rule_type = p_risk_rule_type;
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
            
            SET v_error_code = "rksecuT.1.15.50";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_风控证券_公用_查询风险条目模板记录】*/
    call db_rksecu.pra_rksepb_QuerySecuRiskItemTempl(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_risk_rule_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "rksecuT.1.15.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_查询风险条目模板记录出现错误！',v_mysql_message);
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

# 事务_风控证券_公用_查询主推客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_rksepb_QueryPushSecuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE prt_rksepb_QueryPushSecuClientRiskRule(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id_str varchar(2048),
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
    declare v_row_id_str varchar(2048);
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
    SET v_row_id_str = p_row_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

        /* 调用【原子_风控证券_公用_查询主推客户风险规则记录】*/
        call db_rksecu.pra_rksepb_QueryPushSecuClientRiskRule(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id_str,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuT.1.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_公用_查询主推客户风险规则记录出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


