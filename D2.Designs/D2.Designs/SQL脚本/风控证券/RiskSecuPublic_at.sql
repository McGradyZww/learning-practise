DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_公用_查询风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_QuerySecuRiskRule;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_QuerySecuRiskRule(
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
    

    /* [获取表记录][风控证券_公用_风险规则表][字段][(@机构编号#=0 or (@机构编号#<>0 and ({机构编号}=@机构编号#) or {机构编号}=0)) and (@风险规则类别# = 0 or {风险规则类别}=@风险规则类别#) and (@风控计算类型#=0 or {风控计算类型}=@风控计算类型#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        risk_rule_type, risk_rule_name, risk_rule_code, risk_param_str, 
        risk_calc_type, tim_deal_flag, corrsp_plug from db_rksecu.tb_rksepb_secu_risk_rule where (v_co_no=0 or (v_co_no<>0 and (co_no=v_co_no) or co_no=0)) and (v_risk_rule_type = 0 or risk_rule_type=v_risk_rule_type) and (v_risk_calc_type=0 or risk_calc_type=v_risk_calc_type) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        risk_rule_type, risk_rule_name, risk_rule_code, risk_param_str, 
        risk_calc_type, tim_deal_flag, corrsp_plug from db_rksecu.tb_rksepb_secu_risk_rule where (v_co_no=0 or (v_co_no<>0 and (co_no=v_co_no) or co_no=0)) and (v_risk_rule_type = 0 or risk_rule_type=v_risk_rule_type) and (v_risk_calc_type=0 or risk_calc_type=v_risk_calc_type) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_公用_增加风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_AddSecuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_AddSecuRiskItem(
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
    declare v_tmp_risk_rule_type int;
    declare v_tmp_risk_rule_code varchar(2048);
    declare v_tmp_corrsp_plug varchar(64);
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
    SET v_tmp_risk_rule_type = 0;
    SET v_tmp_risk_rule_code = " ";
    SET v_tmp_corrsp_plug = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #将需要校验的输入参数先记入临时变量

    /* set @临时_风险规则类别# = @风险规则类别#; */
    set v_tmp_risk_rule_type = v_risk_rule_type;

    /* set @临时_风险规则代码# = @风险规则代码#; */
    set v_tmp_risk_rule_code = v_risk_rule_code;

    /* set @临时_对应插件# = @对应插件#; */
    set v_tmp_corrsp_plug = v_corrsp_plug;
    #将记录序号和其他唯一索引字段都加在条件中，以防记录序号和相关数据不匹配

    /* [获取表记录变量][风控证券_公用_风险规则表][{风险规则类别}, {风险规则代码},{对应插件},{风险要素串}][@风险规则类别#, @风险规则代码#, @对应插件#,@风险要素串#][(({机构编号}＝@机构编号# or {机构编号} = 0) and {风险规则名称}=@风险规则名称#) and {记录序号}=@风险规则序号# order by {机构编号} desc][4][@机构编号#,@风险规则序号#] */
    select risk_rule_type, risk_rule_code,corrsp_plug,risk_param_str into v_risk_rule_type, v_risk_rule_code, v_corrsp_plug,v_risk_param_str from db_rksecu.tb_rksepb_secu_risk_rule where ((co_no=v_co_no or co_no = 0) and risk_rule_name=v_risk_rule_name) and row_id=v_risk_rule_id order by co_no desc limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "rksecuA.1.2.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","风险规则序号=",v_risk_rule_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","风险规则序号=",v_risk_rule_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@临时_风险规则类别# <> @风险规则类别# or @临时_风险规则代码# <> @风险规则代码#  or @临时_对应插件# <> @对应插件#][902][@风险规则代码#,@风险规则类别#] */
    if v_tmp_risk_rule_type <> v_risk_rule_type or v_tmp_risk_rule_code <> v_risk_rule_code  or v_tmp_corrsp_plug <> v_corrsp_plug then
        
        SET v_error_code = "rksecuA.1.2.902";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("风险规则代码=",v_risk_rule_code,",","风险规则类别=",v_risk_rule_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("风险规则代码=",v_risk_rule_code,",","风险规则类别=",v_risk_rule_type);
        end if;
        leave label_pro;
    end if;

    # 根据单位净值标志来判断是否加风险要素

    /* if @单位净值标志# <> 1  then */
    if v_unit_nav_flag <> 1  then

      /* set @风险要素串# = concat(@风险要素串#,"单位净值;"); */
      set v_risk_param_str = concat(v_risk_param_str,"单位净值;");

      /* if @单位净值标志# = 2 then */
      if v_unit_nav_flag = 2 then

        /* set @风险规则代码# = concat("[单位净值]>=[n] and [单位净值]<[n] and ",@风险规则代码#); */
        set v_risk_rule_code = concat("[单位净值]>=[n] and [单位净值]<[n] and ",v_risk_rule_code);
      else

        /* set @风险规则代码# = concat("[单位净值]>[n] and [单位净值]<=[n] and ",@风险规则代码#); */
        set v_risk_rule_code = concat("[单位净值]>[n] and [单位净值]<=[n] and ",v_risk_rule_code);
      end if;
    end if;
    # 根据触发方向来增加判断条件

    /* if @触发方向# = 1  then */
    if v_trig_type = 1  then

       /* set @风险规则代码# = concat(@风险规则代码#," > [n] "); */
       set v_risk_rule_code = concat(v_risk_rule_code," > [n] ");

    /* elseif @触发方向# = 2 then */
    elseif v_trig_type = 2 then

       /* set @风险规则代码# = concat(@风险规则代码#," >= [n] "); */
       set v_risk_rule_code = concat(v_risk_rule_code," >= [n] ");

    /* elseif @触发方向# = 3 then */
    elseif v_trig_type = 3 then

       /* set @风险规则代码# = concat(@风险规则代码#," < [n] "); */
       set v_risk_rule_code = concat(v_risk_rule_code," < [n] ");

    /* elseif @触发方向# = 4 then */
    elseif v_trig_type = 4 then

       /* set @风险规则代码# = concat(@风险规则代码#," <= [n] "); */
       set v_risk_rule_code = concat(v_risk_rule_code," <= [n] ");
    end if;

        /* [插入表记录][风控证券_公用_风险条目表][字段][字段变量][1][@机构编号#,@合规规则说明#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_rksecu.tb_rksepb_secu_risk_item(
            create_date, create_time, update_date, 
            update_time, update_times, co_no, exch_no_str, 
            order_dir_str, dime_id, risk_item_tmplat_id, trig_stage_type_str, 
            compli_calc_level, unit_nav_flag, trig_type, compli_rules_remark, 
            risk_rule_id, risk_rule_name, risk_rule_type, risk_rule_code, 
            risk_param_str, corrsp_plug, risk_rule_value_str1, risk_rule_action1, 
            risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
            risk_rule_value_str4, risk_rule_action4, begin_time, end_time, 
            rule_flag) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_exch_no_str, 
            v_order_dir_str, v_dime_id, v_risk_item_tmplat_id, v_trig_stage_type_str, 
            v_compli_calc_level, v_unit_nav_flag, v_trig_type, v_compli_rules_remark, 
            v_risk_rule_id, v_risk_rule_name, v_risk_rule_type, v_risk_rule_code, 
            v_risk_param_str, v_corrsp_plug, v_risk_rule_value_str1, v_risk_rule_action1, 
            v_risk_rule_value_str2, v_risk_rule_action2, v_risk_rule_value_str3, v_risk_rule_action3, 
            v_risk_rule_value_str4, v_risk_rule_action4, v_begin_time, v_end_time, 
            v_rule_flag);
        if v_error_code = "1" then
                    
            SET v_error_code = "rksecuA.1.2.1";
            SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","合规规则说明=",v_compli_rules_remark),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* [获取记录序号][@记录序号#] */
        select LAST_INSERT_ID() into v_row_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_公用_修改风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_ModiSecuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_ModiSecuRiskItem(
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
    declare v_tmp_risk_rule_type int;
    declare v_tmp_corrsp_plug varchar(64);
    declare v_tmp_risk_rule_name varchar(64);
    declare v_risk_item_id int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_tmp_risk_rule_type = 0;
    SET v_tmp_corrsp_plug = " ";
    SET v_tmp_risk_rule_name = " ";
    SET v_risk_item_id = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #将需要校验的输入参数先记入临时变量

    /* set @临时_风险规则类别# = @风险规则类别#; */
    set v_tmp_risk_rule_type = v_risk_rule_type;

    /* set @临时_对应插件# = @对应插件#; */
    set v_tmp_corrsp_plug = v_corrsp_plug;

    /* set @临时_风险规则名称# = @风险规则名称#; */
    set v_tmp_risk_rule_name = v_risk_rule_name;
    #将记录序号和其他唯一索引字段都加在条件中，以防记录序号和相关数据不匹配

    /* [获取表记录变量][风控证券_公用_风险规则表][{风险规则类别},{风险规则名称},{对应插件}][@风险规则类别#,@风险规则名称#, @对应插件#][({机构编号}＝@机构编号# or {机构编号} = 0) and {记录序号}=@风险规则序号#][4][@机构编号#,@风险规则序号#] */
    select risk_rule_type,risk_rule_name,corrsp_plug into v_risk_rule_type,v_risk_rule_name, v_corrsp_plug from db_rksecu.tb_rksepb_secu_risk_rule where (co_no=v_co_no or co_no = 0) and row_id=v_risk_rule_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "rksecuA.1.3.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","风险规则序号=",v_risk_rule_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","风险规则序号=",v_risk_rule_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@临时_风险规则类别# <> @风险规则类别# or @临时_风险规则名称# <> @风险规则名称# or  @临时_对应插件# <> @对应插件#][902][@风险规则代码#,@风险规则类别#] */
    if v_tmp_risk_rule_type <> v_risk_rule_type or v_tmp_risk_rule_name <> v_risk_rule_name or  v_tmp_corrsp_plug <> v_corrsp_plug then
        
        SET v_error_code = "rksecuA.1.3.902";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("风险规则代码=",v_risk_rule_code,",","风险规则类别=",v_risk_rule_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("风险规则代码=",v_risk_rule_code,",","风险规则类别=",v_risk_rule_type);
        end if;
        leave label_pro;
    end if;

    # 根据单位净值标志来判断是否加风险要素

    /* if @单位净值标志# <> 1  then */
    if v_unit_nav_flag <> 1  then

      /* set @风险要素串# = concat(@风险要素串#,"单位净值;"); */
      set v_risk_param_str = concat(v_risk_param_str,"单位净值;");

      /* if @单位净值标志# = 2 then */
      if v_unit_nav_flag = 2 then

        /* set @风险规则代码# = concat("[单位净值]>=[n] and [单位净值]<[n] and ",@风险规则代码#); */
        set v_risk_rule_code = concat("[单位净值]>=[n] and [单位净值]<[n] and ",v_risk_rule_code);
      else

        /* set @风险规则代码# = concat("[单位净值]>[n] and [单位净值]<=[n] and ",@风险规则代码#); */
        set v_risk_rule_code = concat("[单位净值]>[n] and [单位净值]<=[n] and ",v_risk_rule_code);
      end if;
    end if;
    # 根据触发方向来增加判断条件

    /* if @触发方向# = 1  then */
    if v_trig_type = 1  then

       /* set @风险规则代码# = concat(@风险规则代码#," > [n] "); */
       set v_risk_rule_code = concat(v_risk_rule_code," > [n] ");

    /* elseif @触发方向# = 2 then */
    elseif v_trig_type = 2 then

       /* set @风险规则代码# = concat(@风险规则代码#," >= [n] "); */
       set v_risk_rule_code = concat(v_risk_rule_code," >= [n] ");

    /* elseif @触发方向# = 3 then */
    elseif v_trig_type = 3 then

       /* set @风险规则代码# = concat(@风险规则代码#," < [n] "); */
       set v_risk_rule_code = concat(v_risk_rule_code," < [n] ");

    /* elseif @触发方向# = 4 then */
    elseif v_trig_type = 4 then

       /* set @风险规则代码# = concat(@风险规则代码#," <= [n] "); */
       set v_risk_rule_code = concat(v_risk_rule_code," <= [n] ");
    end if;

    /* set @风险条目序号# = @记录序号#; */
    set v_risk_item_id = v_row_id;

    /* [更新表记录][风控证券_公用_风险条目表][{市场编号串}=@市场编号串#, {订单方向串}=@订单方向串#, {维度序号}=@维度序号#, {合规计算层级}=@合规计算层级#, {单位净值标志}=@单位净值标志#, {触发方向}=@触发方向#,{触发阶段类型串}=@触发阶段类型串#,{合规规则说明}=@合规规则说明#, {风险规则序号}=@风险规则序号#, {风险规则类别}=@风险规则类别#, {风险规则名称}=@风险规则名称#, {风险规则代码}=@风险规则代码#, {风险要素串}=@风险要素串#, {风险规则值串1}=@风险规则值串1#,{风险采取行为1}=@风险采取行为1#, {风险规则值串2}=@风险规则值串2#, {风险采取行为2}=@风险采取行为2#, {风险规则值串3}=@风险规则值串3#,{风险采取行为3}=@风险采取行为3#, {风险规则值串4}=@风险规则值串4#,{风险采取行为4}=@风险采取行为4#, {对应插件}=@对应插件#, {开始时间}=@开始时间#, {结束时间}=@结束时间#, {启用标志}=@启用标志#, {条目模板序号} = @条目模板序号#][{记录序号}=@记录序号#][2][@风险条目序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rksepb_secu_risk_item set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, exch_no_str=v_exch_no_str, order_dir_str=v_order_dir_str, dime_id=v_dime_id, compli_calc_level=v_compli_calc_level, unit_nav_flag=v_unit_nav_flag, trig_type=v_trig_type,trig_stage_type_str=v_trig_stage_type_str,compli_rules_remark=v_compli_rules_remark, risk_rule_id=v_risk_rule_id, risk_rule_type=v_risk_rule_type, risk_rule_name=v_risk_rule_name, risk_rule_code=v_risk_rule_code, risk_param_str=v_risk_param_str, risk_rule_value_str1=v_risk_rule_value_str1,risk_rule_action1=v_risk_rule_action1, risk_rule_value_str2=v_risk_rule_value_str2, risk_rule_action2=v_risk_rule_action2, risk_rule_value_str3=v_risk_rule_value_str3,risk_rule_action3=v_risk_rule_action3, risk_rule_value_str4=v_risk_rule_value_str4,risk_rule_action4=v_risk_rule_action4, corrsp_plug=v_corrsp_plug, begin_time=v_begin_time, end_time=v_end_time, rule_flag=v_rule_flag, risk_item_tmplat_id = v_risk_item_tmplat_id where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.1.3.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("风险条目序号=",v_risk_item_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("风险条目序号=",v_risk_item_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][风控证券_公用_风险条目表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        exch_no_str, order_dir_str, dime_id, risk_item_tmplat_id, 
        trig_stage_type_str, compli_calc_level, unit_nav_flag, trig_type, 
        compli_rules_remark, risk_rule_id, risk_rule_name, risk_rule_type, 
        risk_rule_code, risk_param_str, corrsp_plug, risk_rule_value_str1, 
        risk_rule_action1, risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, 
        risk_rule_action3, risk_rule_value_str4, risk_rule_action4, begin_time, 
        end_time, rule_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_exch_no_str, v_order_dir_str, v_dime_id, v_risk_item_tmplat_id, 
        v_trig_stage_type_str, v_compli_calc_level, v_unit_nav_flag, v_trig_type, 
        v_compli_rules_remark, v_risk_rule_id, v_risk_rule_name, v_risk_rule_type, 
        v_risk_rule_code, v_risk_param_str, v_corrsp_plug, v_risk_rule_value_str1, 
        v_risk_rule_action1, v_risk_rule_value_str2, v_risk_rule_action2, v_risk_rule_value_str3, 
        v_risk_rule_action3, v_risk_rule_value_str4, v_risk_rule_action4, v_begin_time, 
        v_end_time, v_rule_flag from db_rksecu.tb_rksepb_secu_risk_item where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "rksecuA.1.3.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][风控证券_风控_客户风险规则表][{市场编号串}=@市场编号串#, {订单方向串}=@订单方向串#, {维度序号}=@维度序号#, {合规计算层级}=@合规计算层级#, {单位净值标志}=@单位净值标志#, {触发方向}=@触发方向#,{触发阶段类型串}=@触发阶段类型串#,{合规规则说明}=@合规规则说明#, {风险规则序号}=@风险规则序号#, {风险规则类别}=@风险规则类别#, {风险规则名称}=@风险规则名称#, {风险规则代码}=@风险规则代码#, {风险要素串}=@风险要素串#, {风险规则值串1}=@风险规则值串1#,{风险采取行为1}=@风险采取行为1#, {风险规则值串2}=@风险规则值串2#, {风险采取行为2}=@风险采取行为2#, {风险规则值串3}=@风险规则值串3#,{风险采取行为3}=@风险采取行为3#, {风险规则值串4}=@风险规则值串4#,{风险采取行为4}=@风险采取行为4#, {对应插件}=@对应插件#, {开始时间}=@开始时间#, {结束时间}=@结束时间#, {启用标志}=@启用标志#][{机构编号} = @机构编号# and {风险条目序号}=@风险条目序号#][2][@风险条目序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rkserk_secu_client_risk_rule set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, exch_no_str=v_exch_no_str, order_dir_str=v_order_dir_str, dime_id=v_dime_id, compli_calc_level=v_compli_calc_level, unit_nav_flag=v_unit_nav_flag, trig_type=v_trig_type,trig_stage_type_str=v_trig_stage_type_str,compli_rules_remark=v_compli_rules_remark, risk_rule_id=v_risk_rule_id, risk_rule_type=v_risk_rule_type, risk_rule_name=v_risk_rule_name, risk_rule_code=v_risk_rule_code, risk_param_str=v_risk_param_str, risk_rule_value_str1=v_risk_rule_value_str1,risk_rule_action1=v_risk_rule_action1, risk_rule_value_str2=v_risk_rule_value_str2, risk_rule_action2=v_risk_rule_action2, risk_rule_value_str3=v_risk_rule_value_str3,risk_rule_action3=v_risk_rule_action3, risk_rule_value_str4=v_risk_rule_value_str4,risk_rule_action4=v_risk_rule_action4, corrsp_plug=v_corrsp_plug, begin_time=v_begin_time, end_time=v_end_time, rule_flag=v_rule_flag where co_no = v_co_no and risk_item_id=v_risk_item_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.1.3.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("风险条目序号=",v_risk_item_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("风险条目序号=",v_risk_item_id);
        end if;
        leave label_pro;
    end if;


    /* set @改后风险规则代码# = @风险规则代码#; */
    set v_change_risk_rule_code = v_risk_rule_code;

    /* set @改后风险要素串# = @风险要素串#; */
    set v_change_risk_param_str = v_risk_param_str;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_change_risk_rule_code = v_change_risk_rule_code;
    SET p_change_risk_param_str = v_change_risk_param_str;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_公用_删除风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_DeleteSecuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_DeleteSecuRiskItem(
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
    

    /* [删除表记录][风控证券_公用_风险条目表][{机构编号}=@机构编号# and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",{记录序号},";")) > 0) and (@合规规则说明#=" " or {合规规则说明}=@合规规则说明#)][3][@合规规则说明#] */
    delete from db_rksecu.tb_rksepb_secu_risk_item 
        where co_no=v_co_no and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",row_id,";")) > 0) and (v_compli_rules_remark=" " or compli_rules_remark=v_compli_rules_remark);
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合规规则说明=",v_compli_rules_remark),"#",v_mysql_message);
        else
            SET v_error_info = concat("合规规则说明=",v_compli_rules_remark);
        end if;
        leave label_pro;
    end if;


    /* select GROUP_CONCAT(row_id separator ';') into @风险要素串# from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no=v_co_no and  instr(v_risk_item_id_str, concat(";",risk_item_id,";")) > 0; */
    select GROUP_CONCAT(row_id separator ';') into v_risk_param_str from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no=v_co_no and  instr(v_risk_item_id_str, concat(";",risk_item_id,";")) > 0;

    /* [删除表记录][风控证券_风控_客户风险规则表][{机构编号}=@机构编号# and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",{风险条目序号},";")) > 0) and (@合规规则说明#=" " or {合规规则说明}=@合规规则说明#)][3][@合规规则说明#] */
    delete from db_rksecu.tb_rkserk_secu_client_risk_rule 
        where co_no=v_co_no and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",risk_item_id,";")) > 0) and (v_compli_rules_remark=" " or compli_rules_remark=v_compli_rules_remark);
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.1.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合规规则说明=",v_compli_rules_remark),"#",v_mysql_message);
        else
            SET v_error_info = concat("合规规则说明=",v_compli_rules_remark);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_risk_param_str = v_risk_param_str;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_公用_查询风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_QuerySecuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_QuerySecuRiskItem(
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
    

    /* if @条目模板序号# = 0 then */
    if v_risk_item_tmplat_id = 0 then

      /* [获取表记录][风控证券_公用_风险条目表][字段][{机构编号}=@机构编号# and (@风险规则序号#=0 or {风险规则序号}=@风险规则序号#) and (@合规规则说明#=" " or {合规规则说明}=@合规规则说明#) and (@风险规则类别#=0 or {风险规则类别}=@风险规则类别#) and (@风险规则名称#=" " or {风险规则名称}=@风险规则名称#) and (@对应插件#=" " or {对应插件}=@对应插件#) and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",{记录序号},";")) > 0) and {条目模板序号} = 0 order by {记录序号}][@指定行数#] */
      if v_row_count = -1 then
          select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          exch_no_str, order_dir_str, dime_id, risk_item_tmplat_id, 
          trig_stage_type_str, compli_calc_level, unit_nav_flag, trig_type, 
          compli_rules_remark, risk_rule_id, risk_rule_name, risk_rule_type, 
          risk_rule_code, risk_param_str, corrsp_plug, risk_rule_value_str1, 
          risk_rule_action1, risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, 
          risk_rule_action3, risk_rule_value_str4, risk_rule_action4, begin_time, 
          end_time, rule_flag from db_rksecu.tb_rksepb_secu_risk_item where co_no=v_co_no and (v_risk_rule_id=0 or risk_rule_id=v_risk_rule_id) and (v_compli_rules_remark=" " or compli_rules_remark=v_compli_rules_remark) and (v_risk_rule_type=0 or risk_rule_type=v_risk_rule_type) and (v_risk_rule_name=" " or risk_rule_name=v_risk_rule_name) and (v_corrsp_plug=" " or corrsp_plug=v_corrsp_plug) and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",row_id,";")) > 0) and risk_item_tmplat_id = 0 order by row_id;
      else
          select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          exch_no_str, order_dir_str, dime_id, risk_item_tmplat_id, 
          trig_stage_type_str, compli_calc_level, unit_nav_flag, trig_type, 
          compli_rules_remark, risk_rule_id, risk_rule_name, risk_rule_type, 
          risk_rule_code, risk_param_str, corrsp_plug, risk_rule_value_str1, 
          risk_rule_action1, risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, 
          risk_rule_action3, risk_rule_value_str4, risk_rule_action4, begin_time, 
          end_time, rule_flag from db_rksecu.tb_rksepb_secu_risk_item where co_no=v_co_no and (v_risk_rule_id=0 or risk_rule_id=v_risk_rule_id) and (v_compli_rules_remark=" " or compli_rules_remark=v_compli_rules_remark) and (v_risk_rule_type=0 or risk_rule_type=v_risk_rule_type) and (v_risk_rule_name=" " or risk_rule_name=v_risk_rule_name) and (v_corrsp_plug=" " or corrsp_plug=v_corrsp_plug) and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",row_id,";")) > 0) and risk_item_tmplat_id = 0 order by row_id limit v_row_count;
      end if;

    else

      /* [获取表记录][风控证券_公用_风险条目表][字段][{机构编号}=@机构编号# and (@风险规则序号#=0 or {风险规则序号}=@风险规则序号#) and (@合规规则说明#=" " or {合规规则说明}=@合规规则说明#) and (@风险规则类别#=0 or {风险规则类别}=@风险规则类别#) and (@风险规则名称#=" " or {风险规则名称}=@风险规则名称#) and (@对应插件#=" " or {对应插件}=@对应插件#) and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",{记录序号},";")) > 0) and {条目模板序号} <> 0 order by {记录序号}][@指定行数#] */
      if v_row_count = -1 then
          select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          exch_no_str, order_dir_str, dime_id, risk_item_tmplat_id, 
          trig_stage_type_str, compli_calc_level, unit_nav_flag, trig_type, 
          compli_rules_remark, risk_rule_id, risk_rule_name, risk_rule_type, 
          risk_rule_code, risk_param_str, corrsp_plug, risk_rule_value_str1, 
          risk_rule_action1, risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, 
          risk_rule_action3, risk_rule_value_str4, risk_rule_action4, begin_time, 
          end_time, rule_flag from db_rksecu.tb_rksepb_secu_risk_item where co_no=v_co_no and (v_risk_rule_id=0 or risk_rule_id=v_risk_rule_id) and (v_compli_rules_remark=" " or compli_rules_remark=v_compli_rules_remark) and (v_risk_rule_type=0 or risk_rule_type=v_risk_rule_type) and (v_risk_rule_name=" " or risk_rule_name=v_risk_rule_name) and (v_corrsp_plug=" " or corrsp_plug=v_corrsp_plug) and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",row_id,";")) > 0) and risk_item_tmplat_id <> 0 order by row_id;
      else
          select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          exch_no_str, order_dir_str, dime_id, risk_item_tmplat_id, 
          trig_stage_type_str, compli_calc_level, unit_nav_flag, trig_type, 
          compli_rules_remark, risk_rule_id, risk_rule_name, risk_rule_type, 
          risk_rule_code, risk_param_str, corrsp_plug, risk_rule_value_str1, 
          risk_rule_action1, risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, 
          risk_rule_action3, risk_rule_value_str4, risk_rule_action4, begin_time, 
          end_time, rule_flag from db_rksecu.tb_rksepb_secu_risk_item where co_no=v_co_no and (v_risk_rule_id=0 or risk_rule_id=v_risk_rule_id) and (v_compli_rules_remark=" " or compli_rules_remark=v_compli_rules_remark) and (v_risk_rule_type=0 or risk_rule_type=v_risk_rule_type) and (v_risk_rule_name=" " or risk_rule_name=v_risk_rule_name) and (v_corrsp_plug=" " or corrsp_plug=v_corrsp_plug) and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",row_id,";")) > 0) and risk_item_tmplat_id <> 0 order by row_id limit v_row_count;
      end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_公用_增加风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_AddSecuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_AddSecuRiskModel(
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
    SET v_model_name = p_model_name;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][风控证券_公用_风险模板表][字段][字段变量][5][@模板名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rksepb_secu_risk_model(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, model_name, 
        remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_model_name, 
        v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.1.6.5";
        SET v_error_info =  CONCAT(concat("模板名称=",v_model_name),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_公用_删除风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_DeleteSecuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_DeleteSecuRiskModel(
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
    

    /* [删除表记录][风控证券_公用_风险模板表][{记录序号}=@模板序号# and {机构编号}=@机构编号#][3][@模板序号#] */
    delete from db_rksecu.tb_rksepb_secu_risk_model 
        where row_id=v_model_id and co_no=v_co_no;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.1.7.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("模板序号=",v_model_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("模板序号=",v_model_id);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][风控证券_公用_风险模板条目表][{机构编号}=@机构编号# and {模板序号}=@模板序号#][3][@模板序号#] */
    delete from db_rksecu.tb_rksepb_secu_risk_model_item 
        where co_no=v_co_no and model_id=v_model_id;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.1.7.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("模板序号=",v_model_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("模板序号=",v_model_id);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][风控证券_风控_客户风险规则表][{机构编号}=@机构编号# and {模板序号}=@模板序号#][3][@模板序号#] */
    delete from db_rksecu.tb_rkserk_secu_client_risk_rule 
        where co_no=v_co_no and model_id=v_model_id;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.1.7.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("模板序号=",v_model_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("模板序号=",v_model_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_公用_修改风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_ModiSecuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_ModiSecuRiskModel(
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
    SET v_model_id = p_model_id;
    SET v_model_name = p_model_name;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][风控证券_公用_风险模板表][{模板名称} = @模板名称#,{备注信息}=@备注信息#][{机构编号}=@机构编号# and {记录序号}=@模板序号# ][2][@机构编号#,@模板序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rksepb_secu_risk_model set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, model_name = v_model_name,remark_info=v_remark_info where co_no=v_co_no and row_id=v_model_id ;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.1.8.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","模板序号=",v_model_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","模板序号=",v_model_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_公用_查询风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_QuerySecuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_QuerySecuRiskModel(
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
    

    /* [获取表记录][风控证券_公用_风险模板表][字段][(@机构编号#=0 or (@机构编号#<>0 and ({机构编号}=@机构编号#) or {机构编号}=0)) and (@模板序号# = 0 or {记录序号}=@模板序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        model_name, remark_info from db_rksecu.tb_rksepb_secu_risk_model where (v_co_no=0 or (v_co_no<>0 and (co_no=v_co_no) or co_no=0)) and (v_model_id = 0 or row_id=v_model_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        model_name, remark_info from db_rksecu.tb_rksepb_secu_risk_model where (v_co_no=0 or (v_co_no<>0 and (co_no=v_co_no) or co_no=0)) and (v_model_id = 0 or row_id=v_model_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_公用_增加风险模板条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_AddSecuRiskModelItem;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_AddSecuRiskModelItem(
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
    declare v_record_count int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_dime_id bigint;
    declare v_trig_stage_type_str varchar(64);
    declare v_compli_calc_level int;
    declare v_unit_nav_flag int;
    declare v_trig_type int;
    declare v_risk_item_id int;
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
    declare v_templ_flag int;
    declare v_compli_trig_result_type int;
    declare v_union_flag int;
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
    SET v_model_id = p_model_id;
    SET v_risk_item_id_str = p_risk_item_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id_str = " ";
    SET v_record_count = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pd_no_str = " ";
    SET v_exch_group_no_str = " ";
    SET v_exch_no_str = " ";
    SET v_order_dir_str = " ";
    SET v_dime_id = 0;
    SET v_trig_stage_type_str = " ";
    SET v_compli_calc_level = 0;
    SET v_unit_nav_flag = 0;
    SET v_trig_type = 0;
    SET v_risk_item_id = 0;
    SET v_compli_rules_remark = " ";
    SET v_risk_rule_id = 0;
    SET v_risk_rule_type = 0;
    SET v_risk_rule_name = " ";
    SET v_risk_rule_code = " ";
    SET v_risk_param_str = " ";
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
    SET v_templ_flag = 0;
    SET v_compli_trig_result_type = 0;
    SET v_union_flag = 0;
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录数量][风控证券_公用_风险模板条目表][@记录个数#][({机构编号}=@机构编号# or {机构编号}= 0) and instr(concat(";",@风险条目序号串#,";"), concat(";",{风险条目序号},";")) > 0 and {模板序号} = @模板序号#] */
    select count(1) into v_record_count from db_rksecu.tb_rksepb_secu_risk_model_item where (co_no=v_co_no or co_no= 0) and instr(concat(";",v_risk_item_id_str,";"), concat(";",risk_item_id,";")) > 0 and model_id = v_model_id;


    /* [检查报错返回][@记录个数# > 0][909][@风险条目序号串#] */
    if v_record_count > 0 then
        
        SET v_error_code = "rksecuA.1.10.909";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("风险条目序号串=",v_risk_item_id_str),"#",v_mysql_message);
        else
            SET v_error_info = concat("风险条目序号串=",v_risk_item_id_str);
        end if;
        leave label_pro;
    end if;


    /* set @创建日期# = date_format(curdate(),'%Y%m%d'); */
    set v_create_date = date_format(curdate(),'%Y%m%d');

    /* set @创建时间# = date_format(curtime(),'%H%i%s'); */
    set v_create_time = date_format(curtime(),'%H%i%s');

    /* set @更新日期# = @创建日期#; */
    set v_update_date = v_create_date;

    /* set @更新时间# = @创建时间#; */
    set v_update_time = v_create_time;

    /* set @更新次数# = 1; */
    set v_update_times = 1;

    /* set @记录序号串# = ";"; */
    set v_row_id_str = ";";

    /* [读取插入表记录][风控证券_公用_风险模板条目表][风控证券_公用_风险条目表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{机构编号}, {模板序号}, {风险条目序号}, {合规规则说明}, {风险规则类别}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@机构编号#, @模板序号#, {记录序号}, {合规规则说明}, {风险规则类别}][({机构编号}=@机构编号# or {机构编号}= 0) and instr(@风险条目序号串#, concat(";",{记录序号},";")) > 0][5][@模板序号#,@风险条目序号串#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rksepb_secu_risk_model_item (
        create_date,create_time,update_date,update_time,update_times,co_no, model_id, risk_item_id, compli_rules_remark, risk_rule_type) 
        select 
        v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_co_no, v_model_id, row_id, compli_rules_remark, risk_rule_type 
        from db_rksecu.tb_rksepb_secu_risk_item 
        where (co_no=v_co_no or co_no= 0) and instr(v_risk_item_id_str, concat(";",row_id,";")) > 0;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.1.10.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("模板序号=",v_model_id,",","风险条目序号串=",v_risk_item_id_str),"#",v_mysql_message);
        else
            SET v_error_info = concat("模板序号=",v_model_id,",","风险条目序号串=",v_risk_item_id_str);
        end if;
        leave label_pro;
    end if;


    /* [声明游标][风控证券_风控_客户风险规则表][{机构编号},{产品编号串},{交易组编号串}][{机构编号} = @机构编号# and {模板序号}=@模板序号# group by {机构编号},{产品编号串},{交易组编号串}][cursor_rksepb_client_risk_rule] */
    cursor_rksepb_client_risk_rule:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_rksepb_client_risk_rule CURSOR FOR
        select co_no,pd_no_str,exch_group_no_str 
        from db_rksecu.tb_rkserk_secu_client_risk_rule 
        where co_no = v_co_no and model_id=v_model_id group by co_no,pd_no_str,exch_group_no_str;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@机构编号#,@产品编号串#,@交易组编号串#][cursor_rksepb_client_risk_rule][loop_rksepb_client_risk_rule] */
    open cursor_rksepb_client_risk_rule;
    loop_rksepb_client_risk_rule: LOOP
    fetch cursor_rksepb_client_risk_rule into v_co_no,v_pd_no_str,v_exch_group_no_str;
        IF v_cursor_done THEN
            LEAVE loop_rksepb_client_risk_rule;
        END IF;

        #insert into ~风控证券_风控_客户风险规则表^ ({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{机构编号}, {产品编号串}, {交易组编号串}, {市场编号串}, {订单方向串}, {维度序号}, {触发阶段类型串}, {合规计算层级}, {单位净值标志}, {触发方向}, {模板序号}, {风险条目序号}, {合规规则说明}, {风险规则序号}, {风险规则类别}, {风险规则名称}, {风险规则代码}, {风险要素串}, {风险规则值串1}, {风险采取行为1}, {风险规则值串2}, {风险采取行为2}, {风险规则值串3}, {风险采取行为3}, {风险规则值串4}, {风险采取行为4}, {对应插件}, {开始时间}, {结束时间}, {启用标志}, {条目模板标志}, {合规触发结果}, {联合标志}) select @创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@机构编号#,@产品编号串#,@交易组编号串#,b.{市场编号串},b.{订单方向串},b.{维度序号},b.{触发阶段类型串},b.{合规计算层级},b.{单位净值标志},b.{触发方向},@模板序号#,b.{记录序号},b.{合规规则说明},b.{风险规则序号},b.{风险规则类别},b.{风险规则名称},b.{风险规则代码},b.{风险要素串},b.{风险规则值串1},b.{风险采取行为1},b.{风险规则值串2},b.{风险采取行为2},b.{风险规则值串3},b.{风险采取行为3},b.{风险规则值串4},b.{风险采取行为4},b.{对应插件},b.{开始时间},b.{结束时间},b.{启用标志},0,0 ,1 from ~风控证券_公用_风险模板条目表^ a,~风控证券_公用_风险条目表^ b where a.{机构编号}=@机构编号# and a.{模板序号}= @模板序号# and a.{风险条目序号} = b.{记录序号} and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",b.{记录序号},";")) > 0);

        /* [声明游标两表关联][风控证券_公用_风险模板条目表][风控证券_公用_风险条目表][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@机构编号#,@产品编号串#,@交易组编号串#,b.{市场编号串},b.{订单方向串},b.{维度序号},b.{触发阶段类型串},b.{合规计算层级},b.{单位净值标志},b.{触发方向},{模板序号},b.{记录序号},b.{合规规则说明},b.{风险规则序号},b.{风险规则类别},b.{风险规则名称},b.{风险规则代码},b.{风险要素串},b.{风险规则值串1},b.{风险采取行为1},b.{风险规则值串2},b.{风险采取行为2},b.{风险规则值串3},b.{风险采取行为3},b.{风险规则值串4},b.{风险采取行为4},b.{对应插件},b.{开始时间},b.{结束时间},b.{启用标志}][a.{机构编号}=@机构编号# and a.{模板序号}= @模板序号# and a.{风险条目序号} = b.{记录序号} and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",b.{记录序号},";")) > 0)][cursor_rksepb_model_item] */
        cursor_rksepb_model_item:BEGIN
        DECLARE v_cursor_done int default false;
        DECLARE cursor_rksepb_model_item CURSOR FOR
            select v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_co_no,v_pd_no_str,v_exch_group_no_str,b.exch_no_str,b.order_dir_str,b.dime_id,b.trig_stage_type_str,b.compli_calc_level,b.unit_nav_flag,b.trig_type,model_id,b.row_id,b.compli_rules_remark,b.risk_rule_id,b.risk_rule_type,b.risk_rule_name,b.risk_rule_code,b.risk_param_str,b.risk_rule_value_str1,b.risk_rule_action1,b.risk_rule_value_str2,b.risk_rule_action2,b.risk_rule_value_str3,b.risk_rule_action3,b.risk_rule_value_str4,b.risk_rule_action4,b.corrsp_plug,b.begin_time,b.end_time,b.rule_flag 
            from db_rksecu.tb_rksepb_secu_risk_model_item a,db_rksecu.tb_rksepb_secu_risk_item b  
            where a.co_no=v_co_no and a.model_id= v_model_id and a.risk_item_id = b.row_id and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",b.row_id,";")) > 0);
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


        /* [打开游标][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@机构编号#,@产品编号串#,@交易组编号串#,@市场编号串#,@订单方向串#,@维度序号#,@触发阶段类型串#,@合规计算层级#,@单位净值标志#,@触发方向#,@模板序号#,@风险条目序号#,@合规规则说明#,@风险规则序号#,@风险规则类别#,@风险规则名称#,@风险规则代码#,@风险要素串#,@风险规则值串1#,@风险采取行为1#,@风险规则值串2#,@风险采取行为2#,@风险规则值串3#,@风险采取行为3#,@风险规则值串4#,@风险采取行为4#,@对应插件#,@开始时间#,@结束时间#,@启用标志#][cursor_rksepb_model_item][loop_rksepb_model_item] */
        open cursor_rksepb_model_item;
        loop_rksepb_model_item: LOOP
        fetch cursor_rksepb_model_item into v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_co_no,v_pd_no_str,v_exch_group_no_str,v_exch_no_str,v_order_dir_str,v_dime_id,v_trig_stage_type_str,v_compli_calc_level,v_unit_nav_flag,v_trig_type,v_model_id,v_risk_item_id,v_compli_rules_remark,v_risk_rule_id,v_risk_rule_type,v_risk_rule_name,v_risk_rule_code,v_risk_param_str,v_risk_rule_value_str1,v_risk_rule_action1,v_risk_rule_value_str2,v_risk_rule_action2,v_risk_rule_value_str3,v_risk_rule_action3,v_risk_rule_value_str4,v_risk_rule_action4,v_corrsp_plug,v_begin_time,v_end_time,v_rule_flag;
            IF v_cursor_done THEN
                LEAVE loop_rksepb_model_item;
            END IF;


              /* set @条目模板标志# = 0; */
              set v_templ_flag = 0;

              /* set @合规触发结果# = 0; */
              set v_compli_trig_result_type = 0;

              /* set @联合标志# = 1; */
              set v_union_flag = 1;

             /* [插入表记录][风控证券_风控_客户风险规则表][字段][字段变量][5][@模板序号#] */
             set v_create_date = date_format(curdate(),'%Y%m%d');
             set v_create_time = date_format(curtime(),'%H%i%s');
             set v_update_date = v_create_date;
             set v_update_time = v_create_time;
             set v_update_times = 1;
             insert into db_rksecu.tb_rkserk_secu_client_risk_rule(
                 create_date, create_time, update_date, 
                 update_time, update_times, co_no, pd_no_str, 
                 exch_group_no_str, exch_no_str, order_dir_str, dime_id, 
                 trig_stage_type_str, compli_calc_level, unit_nav_flag, trig_type, 
                 model_id, risk_item_id, compli_rules_remark, risk_rule_id, 
                 risk_rule_type, risk_rule_name, risk_rule_code, risk_param_str, 
                 union_flag, risk_rule_value_str1, risk_rule_action1, risk_rule_value_str2, 
                 risk_rule_action2, risk_rule_value_str3, risk_rule_action3, risk_rule_value_str4, 
                 risk_rule_action4, corrsp_plug, begin_time, end_time, 
                 rule_flag, templ_flag, compli_trig_result_type) 
             value( 
                 v_create_date, v_create_time, v_update_date, 
                 v_update_time, v_update_times, v_co_no, v_pd_no_str, 
                 v_exch_group_no_str, v_exch_no_str, v_order_dir_str, v_dime_id, 
                 v_trig_stage_type_str, v_compli_calc_level, v_unit_nav_flag, v_trig_type, 
                 v_model_id, v_risk_item_id, v_compli_rules_remark, v_risk_rule_id, 
                 v_risk_rule_type, v_risk_rule_name, v_risk_rule_code, v_risk_param_str, 
                 v_union_flag, v_risk_rule_value_str1, v_risk_rule_action1, v_risk_rule_value_str2, 
                 v_risk_rule_action2, v_risk_rule_value_str3, v_risk_rule_action3, v_risk_rule_value_str4, 
                 v_risk_rule_action4, v_corrsp_plug, v_begin_time, v_end_time, 
                 v_rule_flag, v_templ_flag, v_compli_trig_result_type);
             if v_error_code = "1" then
                         
                 SET v_error_code = "rksecuA.1.10.5";
                 SET v_error_info =  CONCAT(concat("模板序号=",v_model_id),"#",v_mysql_message);
                 close cursor_rksepb_model_item;
                 leave label_pro;
             end if;


             /* [获取记录序号][@记录序号#] */
             select LAST_INSERT_ID() into v_row_id;


             /* set @记录序号串# = concat(@记录序号串#,@记录序号#,";"); */
             set v_row_id_str = concat(v_row_id_str,v_row_id,";");

        /* [关闭游标][cursor_rksepb_model_item] */
            IF v_cursor_done THEN
                set v_cursor_done = false;
            END IF;
        END LOOP;
        close cursor_rksepb_model_item;
        end cursor_rksepb_model_item;


    /* [关闭游标][cursor_rksepb_client_risk_rule] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_rksepb_client_risk_rule;
    end cursor_rksepb_client_risk_rule;

        #set @记录序号串# = concat(";",@记录序号串#);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id_str = v_row_id_str;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_公用_删除风险模板条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_DeleteSecuRiskModelItem;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_DeleteSecuRiskModelItem(
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
    

    /* [删除表记录][风控证券_公用_风险模板条目表][{机构编号}=@机构编号# and {模板序号}=@模板序号# and (instr(@风险条目序号串#,  concat(";", {风险条目序号}, ";")) > 0)][3][@模板序号#] */
    delete from db_rksecu.tb_rksepb_secu_risk_model_item 
        where co_no=v_co_no and model_id=v_model_id and (instr(v_risk_item_id_str,  concat(";", risk_item_id, ";")) > 0);
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.1.11.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("模板序号=",v_model_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("模板序号=",v_model_id);
        end if;
        leave label_pro;
    end if;


     /* select GROUP_CONCAT(row_id separator ';') into v_risk_param_str from db_rksecu.tb_rkserk_secu_client_risk_rule where {机构编号}=@机构编号# and {模板序号}=@模板序号# and (instr(@风险条目序号串#,  concat(";", {风险条目序号}, ";")) > 0); */
     select GROUP_CONCAT(row_id separator ';') into v_risk_param_str from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no=v_co_no and model_id=v_model_id and (instr(v_risk_item_id_str,  concat(";", risk_item_id, ";")) > 0);

    /* [删除表记录][风控证券_风控_客户风险规则表][{机构编号}=@机构编号# and {模板序号}=@模板序号# and (instr(@风险条目序号串#,  concat(";", {风险条目序号}, ";")) > 0)][3][@机构编号#,@模板序号#] */
    delete from db_rksecu.tb_rkserk_secu_client_risk_rule 
        where co_no=v_co_no and model_id=v_model_id and (instr(v_risk_item_id_str,  concat(";", risk_item_id, ";")) > 0);
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.1.11.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","模板序号=",v_model_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","模板序号=",v_model_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_risk_param_str = v_risk_param_str;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_公用_查询风险模板条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_QuerySecuRiskModelItem;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_QuerySecuRiskModelItem(
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
    

    /* [获取表记录两表关联][风控证券_公用_风险模板条目表][风控证券_公用_风险条目表][a.{记录序号},a.{机构编号},a.{模板序号},a.{合规规则说明},a.{风险规则类别},b.{市场编号串}, b.{订单方向串}, b.{维度序号},a.{风险条目序号}, b.{合规计算层级}, b.{单位净值标志}, b.{触发方向},b.{触发阶段类型串},b.{合规规则说明}, b.{风险规则序号}, b.{风险规则类别}, b.{风险规则名称}, b.{风险规则代码}, b.{风险要素串}, b.{风险规则值串1},b.{风险采取行为1}, b.{风险规则值串2}, b.{风险采取行为2}, b.{风险规则值串3},b.{风险采取行为3}, b.{风险规则值串4},b.{风险采取行为4}, b.{对应插件}, b.{开始时间}, b.{结束时间}, b.{启用标志}][ a.{风险条目序号} = b.{记录序号} and a.{机构编号}=@机构编号# and (@模板序号#=0 or a. {模板序号}=@模板序号#) and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",a.{风险条目序号},";")) > 0) and (@风险规则类别#=0 or a. {风险规则类别}=@风险规则类别#) and (@合规规则说明#=" " or a.{合规规则说明}=@合规规则说明#) order by a. {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select a.row_id,a.co_no,a.model_id,a.compli_rules_remark,a.risk_rule_type,b.exch_no_str, b.order_dir_str, b.dime_id,a.risk_item_id, b.compli_calc_level, b.unit_nav_flag, b.trig_type,b.trig_stage_type_str,b.compli_rules_remark, b.risk_rule_id, b.risk_rule_type, b.risk_rule_name, b.risk_rule_code, b.risk_param_str, b.risk_rule_value_str1,b.risk_rule_action1, b.risk_rule_value_str2, b.risk_rule_action2, b.risk_rule_value_str3,b.risk_rule_action3, b.risk_rule_value_str4,b.risk_rule_action4, b.corrsp_plug, b.begin_time, b.end_time, b.rule_flag from db_rksecu.tb_rksepb_secu_risk_model_item a,db_rksecu.tb_rksepb_secu_risk_item b where  a.risk_item_id = b.row_id and a.co_no=v_co_no and (v_model_id=0 or a. model_id=v_model_id) and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",a.risk_item_id,";")) > 0) and (v_risk_rule_type=0 or a. risk_rule_type=v_risk_rule_type) and (v_compli_rules_remark=" " or a.compli_rules_remark=v_compli_rules_remark) order by a. row_id;
    else
        select a.row_id,a.co_no,a.model_id,a.compli_rules_remark,a.risk_rule_type,b.exch_no_str, b.order_dir_str, b.dime_id,a.risk_item_id, b.compli_calc_level, b.unit_nav_flag, b.trig_type,b.trig_stage_type_str,b.compli_rules_remark, b.risk_rule_id, b.risk_rule_type, b.risk_rule_name, b.risk_rule_code, b.risk_param_str, b.risk_rule_value_str1,b.risk_rule_action1, b.risk_rule_value_str2, b.risk_rule_action2, b.risk_rule_value_str3,b.risk_rule_action3, b.risk_rule_value_str4,b.risk_rule_action4, b.corrsp_plug, b.begin_time, b.end_time, b.rule_flag from db_rksecu.tb_rksepb_secu_risk_model_item a,db_rksecu.tb_rksepb_secu_risk_item b where  a.risk_item_id = b.row_id and a.co_no=v_co_no and (v_model_id=0 or a. model_id=v_model_id) and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",a.risk_item_id,";")) > 0) and (v_risk_rule_type=0 or a. risk_rule_type=v_risk_rule_type) and (v_compli_rules_remark=" " or a.compli_rules_remark=v_compli_rules_remark) order by a. row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_公用_更新风险条目记录启用标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_UpdateFutuRiskItemFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_UpdateFutuRiskItemFlag(
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
    SET v_risk_item_id_str = p_risk_item_id_str;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_rule_flag = p_rule_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][风控证券_公用_风险条目表][{启用标志}=@启用标志#][{机构编号}=@机构编号# and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",{记录序号},";")) > 0) and (@风险规则类别#=0 or {风险规则类别}=@风险规则类别#)][1]["更新期货风险条目表记录错误！"] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rksepb_secu_risk_item set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, rule_flag=v_rule_flag where co_no=v_co_no and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",row_id,";")) > 0) and (v_risk_rule_type=0 or risk_rule_type=v_risk_rule_type);
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.1.13.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("更新期货风险条目表记录错误！","#",v_mysql_message);
        else
            SET v_error_info = "更新期货风险条目表记录错误！";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][风控证券_风控_客户风险规则表][{启用标志}=@启用标志#][{机构编号}=@机构编号# and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",{风险条目序号},";")) > 0) and (@风险规则类别#=0 or {风险规则类别}=@风险规则类别#)][1]["更新期货风险条目表记录错误！"] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rkserk_secu_client_risk_rule set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, rule_flag=v_rule_flag where co_no=v_co_no and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",risk_item_id,";")) > 0) and (v_risk_rule_type=0 or risk_rule_type=v_risk_rule_type);
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.1.13.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("更新期货风险条目表记录错误！","#",v_mysql_message);
        else
            SET v_error_info = "更新期货风险条目表记录错误！";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_公用_证券数据归历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_SecuDataToHis;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_SecuDataToHis(
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
    

    /* [数据归历史][风控证券_风控_客户风险触警流水表][字段][{创建日期} <= @初始化日期#][1][@初始化日期#] */
    insert into db_rksecu_his.tbjour_rkserk_secu_client_risk_trig_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, client_risk_rule_id, 
        risk_item_id, compli_trig_id, co_no, pd_no, 
        exch_group_no, order_dir, dime_id, stock_code_no, 
        trig_stage_type, compli_calc_level, unit_nav_flag, trig_type, 
        compli_rules_remark, risk_rule_action, risk_rule_type, risk_rule_value_str, 
        risk_rule_calc_str, remark_info, opor_no, pd_no_str) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, client_risk_rule_id, 
        risk_item_id, compli_trig_id, co_no, pd_no, 
        exch_group_no, order_dir, dime_id, stock_code_no, 
        trig_stage_type, compli_calc_level, unit_nav_flag, trig_type, 
        compli_rules_remark, risk_rule_action, risk_rule_type, risk_rule_value_str, 
        risk_rule_calc_str, remark_info, opor_no, pd_no_str 
        from db_rksecu.tbjour_rkserk_secu_client_risk_trig 
        where create_date <= v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.1.14.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][风控证券_风控_客户风险触警流水表][{创建日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_rksecu.tbjour_rkserk_secu_client_risk_trig 
        where create_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.1.14.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #[更新表记录][风控证券_风控_合规触警流水序号表][{合规触警序号} = 1][1=1][2][@初始化日期#]

    /* [数据归历史][风控证券_风控_T0操作员触警流水表][字段][{创建日期} <= @初始化日期#][1][@初始化日期#] */
    insert into db_rksecu_his.tbjour_rkserk_opor_tshold_risk_trig_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code_no, stock_acco_no, lngsht_type, 
        curr_qty, open_posi_price, open_posi_value, open_posi_fee, 
        close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
        pandl_ratio, un_close_posi_qty, un_close_marke_value, last_price, 
        cost_price, last_tshold_value, float_pandl, moni_result_status, 
        opor_warn_tshold, opor_stop_tshold, stock_warn_ratio, stock_stop_ratio, 
        stock_warn_amt, stock_stop_amt, open_close_permission) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code_no, stock_acco_no, lngsht_type, 
        curr_qty, open_posi_price, open_posi_value, open_posi_fee, 
        close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
        pandl_ratio, un_close_posi_qty, un_close_marke_value, last_price, 
        cost_price, last_tshold_value, float_pandl, moni_result_status, 
        opor_warn_tshold, opor_stop_tshold, stock_warn_ratio, stock_stop_ratio, 
        stock_warn_amt, stock_stop_amt, open_close_permission 
        from db_rksecu.tbjour_rkserk_opor_tshold_risk_trig 
        where create_date <= v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.1.14.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][风控证券_风控_T0操作员触警流水表][{创建日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_rksecu.tbjour_rkserk_opor_tshold_risk_trig 
        where create_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.1.14.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][风控证券_风控_T0操作员汇总触警流水表][字段][{创建日期} <= @初始化日期#][1][@初始化日期#] */
    insert into db_rksecu_his.tbjour_rkserk_opor_tshold_sum_risk_trig_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, curr_qty, open_posi_value, open_posi_fee, 
        close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
        float_pandl, pandl_ratio, un_close_posi_qty, un_close_marke_value, 
        last_tshold_value, moni_result_status, opor_warn_tshold, opor_stop_tshold, 
        open_close_permission) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, curr_qty, open_posi_value, open_posi_fee, 
        close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
        float_pandl, pandl_ratio, un_close_posi_qty, un_close_marke_value, 
        last_tshold_value, moni_result_status, opor_warn_tshold, opor_stop_tshold, 
        open_close_permission 
        from db_rksecu.tbjour_rkserk_opor_tshold_sum_risk_trig 
        where create_date <= v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.1.14.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][风控证券_风控_T0操作员汇总触警流水表][{创建日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_rksecu.tbjour_rkserk_opor_tshold_sum_risk_trig 
        where create_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.1.14.3";
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
use db_rksecu;;

# 原子_风控证券_公用_查询风险条目模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_QuerySecuRiskItemTempl;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_QuerySecuRiskItemTempl(
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
    SET v_co_no = p_co_no;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][风控证券_公用_风险条目模板表][字段][({机构编号}=@机构编号# or {机构编号} = 0) and (@风险规则类别#=0 or {风险规则类别}=@风险规则类别#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        exch_no_str, order_dir_str, dime_type, ctrl_cond_dim_code_str, 
        trig_stage_type_str, compli_calc_level, trig_type, risk_item_tmplat_name, 
        risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
        risk_param_str from db_rksecu.tb_rksepb_secu_risk_rule_templ where (co_no=v_co_no or co_no = 0) and (v_risk_rule_type=0 or risk_rule_type=v_risk_rule_type);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        exch_no_str, order_dir_str, dime_type, ctrl_cond_dim_code_str, 
        trig_stage_type_str, compli_calc_level, trig_type, risk_item_tmplat_name, 
        risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
        risk_param_str from db_rksecu.tb_rksepb_secu_risk_rule_templ where (co_no=v_co_no or co_no = 0) and (v_risk_rule_type=0 or risk_rule_type=v_risk_rule_type) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_公用_查询主推客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_QueryPushSecuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_QueryPushSecuClientRiskRule(
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
    SET v_row_id_str = p_row_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

        /* set @指定行数# = -1; */
        set v_row_count = -1;

        /* [获取表记录][风控证券_风控_客户风险规则表][字段][instr(@记录序号串#, concat(";",{记录序号},";")) > 0][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no_str, exch_group_no_str, exch_no_str, order_dir_str, 
            dime_id, trig_stage_type_str, compli_calc_level, unit_nav_flag, 
            trig_type, model_id, risk_item_id, compli_rules_remark, 
            risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
            risk_param_str, union_flag, risk_rule_value_str1, risk_rule_action1, 
            risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
            risk_rule_value_str4, risk_rule_action4, corrsp_plug, begin_time, 
            end_time, rule_flag, templ_flag, compli_trig_result_type from db_rksecu.tb_rkserk_secu_client_risk_rule where instr(v_row_id_str, concat(";",row_id,";")) > 0;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no_str, exch_group_no_str, exch_no_str, order_dir_str, 
            dime_id, trig_stage_type_str, compli_calc_level, unit_nav_flag, 
            trig_type, model_id, risk_item_id, compli_rules_remark, 
            risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
            risk_param_str, union_flag, risk_rule_value_str1, risk_rule_action1, 
            risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
            risk_rule_value_str4, risk_rule_action4, corrsp_plug, begin_time, 
            end_time, rule_flag, templ_flag, compli_trig_result_type from db_rksecu.tb_rkserk_secu_client_risk_rule where instr(v_row_id_str, concat(";",row_id,";")) > 0 limit v_row_count;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


