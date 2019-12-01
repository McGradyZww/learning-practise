DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_公用_查询风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfupb_QueryFutuRiskRule;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfupb_QueryFutuRiskRule(
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
    

    /* [获取表记录][风控期货_公用_风险规则表][字段][(@机构编号#=0 or (@机构编号#<>0 and ({机构编号}=@机构编号#))) and (@风险规则类别#=" " or {风险规则类别}=@风险规则类别#) and (@风险规则名称#=" " or {风险规则名称}=@风险规则名称#) and (@对应插件#=" " or {对应插件}=@对应插件#) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        risk_rule_type, risk_rule_name, risk_rule_code, risk_param_str, 
        corrsp_plug from db_rkfutu.tb_rkfupb_risk_rule where (v_co_no=0 or (v_co_no<>0 and (co_no=v_co_no))) and (v_risk_rule_type=" " or risk_rule_type=v_risk_rule_type) and (v_risk_rule_name=" " or risk_rule_name=v_risk_rule_name) and (v_corrsp_plug=" " or corrsp_plug=v_corrsp_plug) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        risk_rule_type, risk_rule_name, risk_rule_code, risk_param_str, 
        corrsp_plug from db_rkfutu.tb_rkfupb_risk_rule where (v_co_no=0 or (v_co_no<>0 and (co_no=v_co_no))) and (v_risk_rule_type=" " or risk_rule_type=v_risk_rule_type) and (v_risk_rule_name=" " or risk_rule_name=v_risk_rule_name) and (v_corrsp_plug=" " or corrsp_plug=v_corrsp_plug) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_公用_增加风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfupb_AddFutuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfupb_AddFutuRiskItem(
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
    declare v_tmp_risk_rule_type int;
    declare v_tmp_risk_rule_code varchar(2048);
    declare v_tmp_corrsp_plug varchar(64);
    declare v_risk_param_str varchar(2048);
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
    SET v_tmp_risk_rule_type = 0;
    SET v_tmp_risk_rule_code = " ";
    SET v_tmp_corrsp_plug = " ";
    SET v_risk_param_str = " ";
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

    /* [获取表记录变量][风控期货_公用_风险规则表][{风险规则类别},{风险要素串}, {风险规则代码},{对应插件}][@风险规则类别#,@风险要素串#, @风险规则代码#, @对应插件#][(({机构编号}＝@机构编号# or {机构编号} = 0) and {风险规则名称}=@风险规则名称#) and {记录序号}=@风险规则序号# order by {机构编号} desc][4][@风险规则序号#] */
    select risk_rule_type,risk_param_str, risk_rule_code,corrsp_plug into v_risk_rule_type,v_risk_param_str, v_risk_rule_code, v_corrsp_plug from db_rkfutu.tb_rkfupb_risk_rule where ((co_no=v_co_no or co_no = 0) and risk_rule_name=v_risk_rule_name) and row_id=v_risk_rule_id order by co_no desc limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "rkfutuA.1.5.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("风险规则序号=",v_risk_rule_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("风险规则序号=",v_risk_rule_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@临时_风险规则类别# <> @风险规则类别# or @临时_风险规则代码# <> @风险规则代码#  or @临时_对应插件# <> @对应插件#][902][@风险规则序号#] */
    if v_tmp_risk_rule_type <> v_risk_rule_type or v_tmp_risk_rule_code <> v_risk_rule_code  or v_tmp_corrsp_plug <> v_corrsp_plug then
        
        SET v_error_code = "rkfutuA.1.5.902";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("风险规则序号=",v_risk_rule_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("风险规则序号=",v_risk_rule_id);
        end if;
        leave label_pro;
    end if;


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

    /* [插入表记录][风控期货_公用_风险条目表][字段][字段变量][1][@机构编号#,@风险条目名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rkfutu.tb_rkfupb_risk_item(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, risk_item_name, 
        exch_no, contrc_type, order_dir_str, trig_stage_type, 
        compli_calc_level, unit_nav_flag, trig_type, risk_rule_id, 
        risk_rule_type, risk_rule_name, risk_rule_code, risk_param_str, 
        risk_rule_value_str, corrsp_plug, risk_rule_action, begin_time, 
        end_time, rule_flag) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_risk_item_name, 
        v_exch_no, v_contrc_type, v_order_dir_str, v_trig_stage_type, 
        v_compli_calc_level, v_unit_nav_flag, v_trig_type, v_risk_rule_id, 
        v_risk_rule_type, v_risk_rule_name, v_risk_rule_code, v_risk_param_str, 
        v_risk_rule_value_str, v_corrsp_plug, v_risk_rule_action, v_begin_time, 
        v_end_time, v_rule_flag);
    if v_error_code = "1" then
                
        SET v_error_code = "rkfutuA.1.5.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","风险条目名称=",v_risk_item_name),"#",v_mysql_message);
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
use db_rkfutu;;

# 原子_风控期货_公用_修改风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfupb_ModiFutuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfupb_ModiFutuRiskItem(
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
    declare v_tmp_risk_rule_type int;
    declare v_tmp_corrsp_plug varchar(64);
    declare v_tmp_risk_rule_name varchar(64);
    declare v_risk_param_str varchar(2048);
    declare v_risk_item_id int;
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
    SET v_tmp_risk_rule_type = 0;
    SET v_tmp_corrsp_plug = " ";
    SET v_tmp_risk_rule_name = " ";
    SET v_risk_param_str = " ";
    SET v_risk_item_id = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #将需要校验的输入参数先记入临时变量

    /* set @临时_风险规则类别# = @风险规则类别#; */
    set v_tmp_risk_rule_type = v_risk_rule_type;

    /* set @临时_对应插件# = @对应插件#; */
    set v_tmp_corrsp_plug = v_corrsp_plug;

    /* set @临时_风险规则名称# = @风险规则名称#; */
    set v_tmp_risk_rule_name = v_risk_rule_name;
    #将记录序号和其他唯一索引字段都加在条件中，以防记录序号和相关数据不匹配

    /* [获取表记录变量][风控期货_公用_风险规则表][{风险规则类别},{风险要素串},{风险规则名称},{对应插件}][@风险规则类别#,@风险要素串#,@风险规则名称#, @对应插件#][({机构编号}＝@机构编号# or {机构编号} = 0) and {记录序号}=@风险规则序号#][4][@机构编号#,@风险规则序号#] */
    select risk_rule_type,risk_param_str,risk_rule_name,corrsp_plug into v_risk_rule_type,v_risk_param_str,v_risk_rule_name, v_corrsp_plug from db_rkfutu.tb_rkfupb_risk_rule where (co_no=v_co_no or co_no = 0) and row_id=v_risk_rule_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "rkfutuA.1.6.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","风险规则序号=",v_risk_rule_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","风险规则序号=",v_risk_rule_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@临时_风险规则类别# <> @风险规则类别# or @临时_风险规则名称# <> @风险规则名称# or  @临时_对应插件# <> @对应插件#][902][@风险规则代码#,@风险规则类别#] */
    if v_tmp_risk_rule_type <> v_risk_rule_type or v_tmp_risk_rule_name <> v_risk_rule_name or  v_tmp_corrsp_plug <> v_corrsp_plug then
        
        SET v_error_code = "rkfutuA.1.6.902";
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

    /* [更新表记录][风控期货_公用_风险条目表][{市场编号}=@市场编号#,{风险条目名称}=@风险条目名称#, {合约类型}=@合约类型#, {订单方向串}=@订单方向串#,{触发阶段类型} = @触发阶段类型#,{合规计算层级} = @合规计算层级#,{单位净值标志} = @单位净值标志#, {触发方向} = @触发方向#, {风险规则序号}=@风险规则序号#, {风险规则类别}=@风险规则类别#, {风险规则名称}=@风险规则名称#, {风险规则代码}=@风险规则代码#, {风险要素串}=@风险要素串#, {风险规则值串}=@风险规则值串#, {对应插件}=@对应插件#, {风险采取行为}=@风险采取行为#, {开始时间}=@开始时间#, {结束时间}=@结束时间#, {启用标志}=@启用标志#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rkfutu.tb_rkfupb_risk_item set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, exch_no=v_exch_no,risk_item_name=v_risk_item_name, contrc_type=v_contrc_type, order_dir_str=v_order_dir_str,trig_stage_type = v_trig_stage_type,compli_calc_level = v_compli_calc_level,unit_nav_flag = v_unit_nav_flag, trig_type = v_trig_type, risk_rule_id=v_risk_rule_id, risk_rule_type=v_risk_rule_type, risk_rule_name=v_risk_rule_name, risk_rule_code=v_risk_rule_code, risk_param_str=v_risk_param_str, risk_rule_value_str=v_risk_rule_value_str, corrsp_plug=v_corrsp_plug, risk_rule_action=v_risk_rule_action, begin_time=v_begin_time, end_time=v_end_time, rule_flag=v_rule_flag where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rkfutuA.1.6.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][风控期货_风控_客户风险规则表][{市场编号}=@市场编号#, {合约类型}=@合约类型#, {订单方向串}=@订单方向串#,{触发阶段类型} = @触发阶段类型#,{合规计算层级} = @合规计算层级#,{单位净值标志} = @单位净值标志#, {触发方向} = @触发方向#, {风险条目名称}=@风险条目名称#, {风险规则序号}=@风险规则序号#, {风险规则类别}=@风险规则类别#, {风险规则名称}=@风险规则名称#, {风险规则代码}=@风险规则代码#, {风险要素串}=@风险要素串#, {风险规则值串}=@风险规则值串#, {对应插件}=@对应插件#, {风险采取行为}=@风险采取行为#, {开始时间}=@开始时间#, {结束时间}=@结束时间#, {启用标志}=@启用标志#][{机构编号} = @机构编号# and {风险条目序号}=@风险条目序号#][2][@风险条目序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rkfutu.tb_rkfurk_client_risk_rule set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, exch_no=v_exch_no, contrc_type=v_contrc_type, order_dir_str=v_order_dir_str,trig_stage_type = v_trig_stage_type,compli_calc_level = v_compli_calc_level,unit_nav_flag = v_unit_nav_flag, trig_type = v_trig_type, risk_item_name=v_risk_item_name, risk_rule_id=v_risk_rule_id, risk_rule_type=v_risk_rule_type, risk_rule_name=v_risk_rule_name, risk_rule_code=v_risk_rule_code, risk_param_str=v_risk_param_str, risk_rule_value_str=v_risk_rule_value_str, corrsp_plug=v_corrsp_plug, risk_rule_action=v_risk_rule_action, begin_time=v_begin_time, end_time=v_end_time, rule_flag=v_rule_flag where co_no = v_co_no and risk_item_id=v_risk_item_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rkfutuA.1.6.2";
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
use db_rkfutu;;

# 原子_风控期货_公用_更新风险条目记录启用标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfupb_UpdateFutuRiskItemFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfupb_UpdateFutuRiskItemFlag(
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][风控期货_公用_风险条目表][{启用标志}=@启用标志#][{机构编号}=@机构编号# and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",{记录序号},";")) > 0) and (@风险条目名称#=" " or {风险条目名称}=@风险条目名称#) and  (@市场编号#=0 or {市场编号}=@市场编号#) and (@合约类型#=0 or {合约类型}=@合约类型#) and (@订单方向串#=" " or {订单方向串}=@订单方向串#) and (@风险规则序号#=0 or {风险规则序号} = @风险规则序号#) and (@风险规则类别#=0 or {风险规则类别}=@风险规则类别#) and (@风险规则名称#=" " or {风险规则名称}=@风险规则名称#) and (@对应插件#=" " or {对应插件}=@对应插件#)][2][@风险条目序号串#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rkfutu.tb_rkfupb_risk_item set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, rule_flag=v_rule_flag where co_no=v_co_no and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",row_id,";")) > 0) and (v_risk_item_name=" " or risk_item_name=v_risk_item_name) and  (v_exch_no=0 or exch_no=v_exch_no) and (v_contrc_type=0 or contrc_type=v_contrc_type) and (v_order_dir_str=" " or order_dir_str=v_order_dir_str) and (v_risk_rule_id=0 or risk_rule_id = v_risk_rule_id) and (v_risk_rule_type=0 or risk_rule_type=v_risk_rule_type) and (v_risk_rule_name=" " or risk_rule_name=v_risk_rule_name) and (v_corrsp_plug=" " or corrsp_plug=v_corrsp_plug);
    if v_error_code = "1" then
                
        SET v_error_code = "rkfutuA.1.7.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("风险条目序号串=",v_risk_item_id_str),"#",v_mysql_message);
        else
            SET v_error_info = concat("风险条目序号串=",v_risk_item_id_str);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][风控期货_风控_客户风险规则表][{启用标志}=@启用标志#][{机构编号}=@机构编号# and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",{风险条目序号},";")) > 0) and (@风险条目名称#=" " or {风险条目名称}=@风险条目名称#) and  (@市场编号#=0 or {市场编号}=@市场编号#) and (@合约类型#=0 or {合约类型}=@合约类型#) and (@订单方向串#=" " or {订单方向串}=@订单方向串#) and (@风险规则序号#=0 or {风险规则序号} = @风险规则序号#) and (@风险规则类别#=0 or {风险规则类别}=@风险规则类别#) and (@风险规则名称#=" " or {风险规则名称}=@风险规则名称#) and (@对应插件#=" " or {对应插件}=@对应插件#)][2][@风险条目序号串#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rkfutu.tb_rkfurk_client_risk_rule set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, rule_flag=v_rule_flag where co_no=v_co_no and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",risk_item_id,";")) > 0) and (v_risk_item_name=" " or risk_item_name=v_risk_item_name) and  (v_exch_no=0 or exch_no=v_exch_no) and (v_contrc_type=0 or contrc_type=v_contrc_type) and (v_order_dir_str=" " or order_dir_str=v_order_dir_str) and (v_risk_rule_id=0 or risk_rule_id = v_risk_rule_id) and (v_risk_rule_type=0 or risk_rule_type=v_risk_rule_type) and (v_risk_rule_name=" " or risk_rule_name=v_risk_rule_name) and (v_corrsp_plug=" " or corrsp_plug=v_corrsp_plug);
    if v_error_code = "1" then
                
        SET v_error_code = "rkfutuA.1.7.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("风险条目序号串=",v_risk_item_id_str),"#",v_mysql_message);
        else
            SET v_error_info = concat("风险条目序号串=",v_risk_item_id_str);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_公用_删除风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfupb_DeleteFutuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfupb_DeleteFutuRiskItem(
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
    

    /* [删除表记录][风控期货_公用_风险条目表][{机构编号}=@机构编号# and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",{记录序号},";")) > 0) and (@风险条目名称#=" " or {风险条目名称}=@风险条目名称#)][3][@风险条目序号串#] */
    delete from db_rkfutu.tb_rkfupb_risk_item 
        where co_no=v_co_no and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",row_id,";")) > 0) and (v_risk_item_name=" " or risk_item_name=v_risk_item_name);
    if v_error_code = 1 then
                
        SET v_error_code = "rkfutuA.1.8.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("风险条目序号串=",v_risk_item_id_str),"#",v_mysql_message);
        else
            SET v_error_info = concat("风险条目序号串=",v_risk_item_id_str);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][风控期货_风控_客户风险规则表][{机构编号}=@机构编号# and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",{风险条目序号},";")) > 0) and (@风险条目名称#=" " or {风险条目名称}=@风险条目名称#)][3][@风险条目序号串#] */
    delete from db_rkfutu.tb_rkfurk_client_risk_rule 
        where co_no=v_co_no and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",risk_item_id,";")) > 0) and (v_risk_item_name=" " or risk_item_name=v_risk_item_name);
    if v_error_code = 1 then
                
        SET v_error_code = "rkfutuA.1.8.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("风险条目序号串=",v_risk_item_id_str),"#",v_mysql_message);
        else
            SET v_error_info = concat("风险条目序号串=",v_risk_item_id_str);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_公用_查询风险条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfupb_QueryFutuRiskItem;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfupb_QueryFutuRiskItem(
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
    

    /* [获取表记录][风控期货_公用_风险条目表][字段][{机构编号}=@机构编号# and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",{记录序号},";")) > 0) and (@风险条目名称#=" " or {风险条目名称}=@风险条目名称#) and  (@市场编号#=0 or {市场编号}=@市场编号#) and (@合约类型#=0 or {合约类型}=@合约类型#) and (@订单方向串#=" " or instr(concat(";",{订单方向串}),concat(";",@订单方向串#,";"))>0) and (@风险规则序号#=0 or {风险规则序号}=@风险规则序号#) and (@风险规则类别#=0 or {风险规则类别}=@风险规则类别#) and (@风险规则名称#=" " or {风险规则名称}=@风险规则名称#) and (@对应插件#=" " or {对应插件}=@对应插件#) and (@启用标志#=" " or {启用标志}=@启用标志#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        risk_item_name, exch_no, contrc_type, order_dir_str, 
        trig_stage_type, compli_calc_level, unit_nav_flag, trig_type, 
        risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
        risk_param_str, risk_rule_value_str, corrsp_plug, risk_rule_action, 
        begin_time, end_time, rule_flag from db_rkfutu.tb_rkfupb_risk_item where co_no=v_co_no and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",row_id,";")) > 0) and (v_risk_item_name=" " or risk_item_name=v_risk_item_name) and  (v_exch_no=0 or exch_no=v_exch_no) and (v_contrc_type=0 or contrc_type=v_contrc_type) and (v_order_dir_str=" " or instr(concat(";",order_dir_str),concat(";",v_order_dir_str,";"))>0) and (v_risk_rule_id=0 or risk_rule_id=v_risk_rule_id) and (v_risk_rule_type=0 or risk_rule_type=v_risk_rule_type) and (v_risk_rule_name=" " or risk_rule_name=v_risk_rule_name) and (v_corrsp_plug=" " or corrsp_plug=v_corrsp_plug) and (v_rule_flag=" " or rule_flag=v_rule_flag) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        risk_item_name, exch_no, contrc_type, order_dir_str, 
        trig_stage_type, compli_calc_level, unit_nav_flag, trig_type, 
        risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
        risk_param_str, risk_rule_value_str, corrsp_plug, risk_rule_action, 
        begin_time, end_time, rule_flag from db_rkfutu.tb_rkfupb_risk_item where co_no=v_co_no and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",row_id,";")) > 0) and (v_risk_item_name=" " or risk_item_name=v_risk_item_name) and  (v_exch_no=0 or exch_no=v_exch_no) and (v_contrc_type=0 or contrc_type=v_contrc_type) and (v_order_dir_str=" " or instr(concat(";",order_dir_str),concat(";",v_order_dir_str,";"))>0) and (v_risk_rule_id=0 or risk_rule_id=v_risk_rule_id) and (v_risk_rule_type=0 or risk_rule_type=v_risk_rule_type) and (v_risk_rule_name=" " or risk_rule_name=v_risk_rule_name) and (v_corrsp_plug=" " or corrsp_plug=v_corrsp_plug) and (v_rule_flag=" " or rule_flag=v_rule_flag) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_公用_增加风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfupb_AddFutuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfupb_AddFutuRiskModel(
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
    declare v_model_id bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_model_id = 0;

    
    label_pro:BEGIN
    

    /* [插入表记录][风控期货_公用_风险模板表][字段][字段变量][5][@模板序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rkfutu.tb_rkfupb_risk_model(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, model_name, 
        remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_model_name, 
        v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "rkfutuA.1.10.5";
        SET v_error_info =  CONCAT(concat("模板序号=",v_model_id),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_公用_删除风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfupb_DeleteFutuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfupb_DeleteFutuRiskModel(
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
    

    /* [删除表记录][风控期货_公用_风险模板表][{记录序号}=@模板序号# and {机构编号}=@机构编号#][3][@模板序号#] */
    delete from db_rkfutu.tb_rkfupb_risk_model 
        where row_id=v_model_id and co_no=v_co_no;
    if v_error_code = 1 then
                
        SET v_error_code = "rkfutuA.1.11.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("模板序号=",v_model_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("模板序号=",v_model_id);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][风控期货_公用_风险模板条目表][{机构编号}=@机构编号# and {模板序号}=@模板序号#][3][@模板序号#] */
    delete from db_rkfutu.tb_rkfupb_futu_risk_model_item 
        where co_no=v_co_no and model_id=v_model_id;
    if v_error_code = 1 then
                
        SET v_error_code = "rkfutuA.1.11.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("模板序号=",v_model_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("模板序号=",v_model_id);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][风控期货_风控_客户风险规则表][{机构编号}=@机构编号# and {模板序号}=@模板序号#][3][@模板序号#] */
    delete from db_rkfutu.tb_rkfurk_client_risk_rule 
        where co_no=v_co_no and model_id=v_model_id;
    if v_error_code = 1 then
                
        SET v_error_code = "rkfutuA.1.11.3";
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
use db_rkfutu;;

# 原子_风控期货_公用_修改风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfupb_ModiSecuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfupb_ModiSecuRiskModel(
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
    

    /* [更新表记录][风控期货_公用_风险模板表][{模板名称} = @模板名称#,{备注信息}=@备注信息#][{机构编号}=@机构编号# and {记录序号}=@模板序号# ][2][@机构编号#,@模板序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rkfutu.tb_rkfupb_risk_model set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, model_name = v_model_name,remark_info=v_remark_info where co_no=v_co_no and row_id=v_model_id ;
    if v_error_code = "1" then
                
        SET v_error_code = "rkfutuA.1.12.2";
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
use db_rkfutu;;

# 原子_风控期货_公用_查询风险模板记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfupb_QuerySecuRiskModel;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfupb_QuerySecuRiskModel(
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
    

    /* [获取表记录][风控期货_公用_风险模板表][字段][(@机构编号#=0 or (@机构编号#<>0 and ({机构编号}=@机构编号#) or {机构编号}=0)) and (@模板序号# = 0 or {记录序号}=@模板序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        model_name, remark_info from db_rkfutu.tb_rkfupb_risk_model where (v_co_no=0 or (v_co_no<>0 and (co_no=v_co_no) or co_no=0)) and (v_model_id = 0 or row_id=v_model_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        model_name, remark_info from db_rkfutu.tb_rkfupb_risk_model where (v_co_no=0 or (v_co_no<>0 and (co_no=v_co_no) or co_no=0)) and (v_model_id = 0 or row_id=v_model_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_公用_增加风险模板条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfupb_AddSecuRiskModelItem;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfupb_AddSecuRiskModelItem(
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
    declare v_record_count int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
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
    SET v_co_no = p_co_no;
    SET v_model_id = p_model_id;
    SET v_risk_item_id_str = p_risk_item_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录数量][风控期货_公用_风险模板条目表][@记录个数#][({机构编号}=@机构编号# or {机构编号}= 0) and instr(@风险条目序号串#, concat(";",{风险条目序号},";")) > 0 and {模板序号} = @模板序号#] */
    select count(1) into v_record_count from db_rkfutu.tb_rkfupb_futu_risk_model_item where (co_no=v_co_no or co_no= 0) and instr(v_risk_item_id_str, concat(";",risk_item_id,";")) > 0 and model_id = v_model_id;


    /* [检查报错返回][@记录个数# > 0][909][@风险条目序号串#] */
    if v_record_count > 0 then
        
        SET v_error_code = "rkfutuA.1.14.909";
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

    /* [读取插入表记录][风控期货_公用_风险模板条目表][风控期货_公用_风险条目表][{创建日期},{创建时间},{更新日期},{更新次数},{更新时间},{机构编号}, {模板序号}, {风险条目序号}, {风险条目名称}, {风险规则类别}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@机构编号#, @模板序号#, {记录序号}, {风险条目名称}, {风险规则类别}][({机构编号}=@机构编号# or {机构编号}= 0) and instr(@风险条目序号串#, concat(";",{记录序号},";")) > 0][5][@模板序号#,@风险条目序号串#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rkfutu.tb_rkfupb_futu_risk_model_item (
        create_date,create_time,update_date,update_times,update_time,co_no, model_id, risk_item_id, risk_item_name, risk_rule_type) 
        select 
        v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_co_no, v_model_id, row_id, risk_item_name, risk_rule_type 
        from db_rkfutu.tb_rkfupb_risk_item 
        where (co_no=v_co_no or co_no= 0) and instr(v_risk_item_id_str, concat(";",row_id,";")) > 0;
    if v_error_code = "1" then
                
        SET v_error_code = "rkfutuA.1.14.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("模板序号=",v_model_id,",","风险条目序号串=",v_risk_item_id_str),"#",v_mysql_message);
        else
            SET v_error_info = concat("模板序号=",v_model_id,",","风险条目序号串=",v_risk_item_id_str);
        end if;
        leave label_pro;
    end if;


    /* [声明游标][风控期货_风控_客户风险规则表][{机构编号},{产品编号},{交易组编号}][{机构编号} = @机构编号# and {模板序号}=@模板序号# group by {机构编号}, {交易组编号}][cursor_rkfupb_client_risk_rule] */
    cursor_rkfupb_client_risk_rule:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_rkfupb_client_risk_rule CURSOR FOR
        select co_no,pd_no,exch_group_no 
        from db_rkfutu.tb_rkfurk_client_risk_rule 
        where co_no = v_co_no and model_id=v_model_id group by co_no, exch_group_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@机构编号#,@产品编号#,@交易组编号#][cursor_rkfupb_client_risk_rule][loop_rkfupb_client_risk_rule] */
    open cursor_rkfupb_client_risk_rule;
    loop_rkfupb_client_risk_rule: LOOP
    fetch cursor_rkfupb_client_risk_rule into v_co_no,v_pd_no,v_exch_group_no;
        IF v_cursor_done THEN
            LEAVE loop_rkfupb_client_risk_rule;
        END IF;


        /* insert into ~风控期货_风控_客户风险规则表^ ({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{机构编号},{产品编号},{交易组编号},{模板序号},{风险条目序号},{风险条目名称},{市场编号},{合约类型},{订单方向串},{触发阶段类型},{合规计算层级},{单位净值标志},{触发方向},{风险规则序号},{风险规则类别},{风险规则名称},{风险规则代码},{风险要素串},{风险规则值串},{风险采取行为},{对应插件},{开始时间},{结束时间},{启用标志}) select @创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@机构编号#,@产品编号#,@交易组编号#,@模板序号#,b.{记录序号},b.{风险条目名称},b.{市场编号},b.{订单方向串},b.{触发阶段类型},b.{合规计算层级},b.{单位净值标志},b.{触发方向},b.{风险规则序号},b.{风险规则类别},b.{风险规则名称},b.{风险规则代码},b.{风险要素串},b.{风险规则值串},b.{风险采取行为},b.{对应插件},b.{开始时间},b.{结束时间},b.{启用标志} from ~风控期货_公用_风险模板条目表^ a,~风控期货_公用_风险条目表^ b where a.{机构编号}=@机构编号# and a.{模板序号}= @模板序号# and a.{风险条目序号} = b.{记录序号} and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",b.{记录序号},";")) > 0); */
        insert into db_rkfutu.tb_rkfurk_client_risk_rule (create_date,create_time,update_date,update_time,update_times,co_no,pd_no,exch_group_no,model_id,risk_item_id,risk_item_name,exch_no,contrc_type,order_dir_str,trig_stage_type,compli_calc_level,unit_nav_flag,trig_type,risk_rule_id,risk_rule_type,risk_rule_name,risk_rule_code,risk_param_str,risk_rule_value_str,risk_rule_action,corrsp_plug,begin_time,end_time,rule_flag) select v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_co_no,v_pd_no,v_exch_group_no,v_model_id,b.row_id,b.risk_item_name,b.exch_no,b.order_dir_str,b.trig_stage_type,b.compli_calc_level,b.unit_nav_flag,b.trig_type,b.risk_rule_id,b.risk_rule_type,b.risk_rule_name,b.risk_rule_code,b.risk_param_str,b.risk_rule_value_str,b.risk_rule_action,b.corrsp_plug,b.begin_time,b.end_time,b.rule_flag from db_rkfutu.tb_rkfupb_futu_risk_model_item a,db_rkfutu.tb_rkfupb_risk_item b where a.co_no=v_co_no and a.model_id= v_model_id and a.risk_item_id = b.row_id and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",b.row_id,";")) > 0);

    /* [关闭游标][cursor_rkfupb_client_risk_rule] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_rkfupb_client_risk_rule;
    end cursor_rkfupb_client_risk_rule;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_公用_删除风险模板条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfupb_DeleteSecuRiskModelItem;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfupb_DeleteSecuRiskModelItem(
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
    

    /* [删除表记录][风控期货_公用_风险模板条目表][{机构编号}=@机构编号# and {模板序号}=@模板序号# and (instr(@风险条目序号串#,  concat(";", {风险条目序号}, ";")) > 0)][3][@模板序号#] */
    delete from db_rkfutu.tb_rkfupb_futu_risk_model_item 
        where co_no=v_co_no and model_id=v_model_id and (instr(v_risk_item_id_str,  concat(";", risk_item_id, ";")) > 0);
    if v_error_code = 1 then
                
        SET v_error_code = "rkfutuA.1.15.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("模板序号=",v_model_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("模板序号=",v_model_id);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][风控期货_风控_客户风险规则表][{机构编号}=@机构编号# and {模板序号}=@模板序号# and (instr(@风险条目序号串#,  concat(";", {风险条目序号}, ";")) > 0)][3][@机构编号#,@模板序号#] */
    delete from db_rkfutu.tb_rkfurk_client_risk_rule 
        where co_no=v_co_no and model_id=v_model_id and (instr(v_risk_item_id_str,  concat(";", risk_item_id, ";")) > 0);
    if v_error_code = 1 then
                
        SET v_error_code = "rkfutuA.1.15.3";
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
use db_rkfutu;;

# 原子_风控期货_公用_查询风险模板条目记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfupb_QuerySecuRiskModelItem;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfupb_QuerySecuRiskModelItem(
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
    

    /* [获取表记录两表关联][风控期货_公用_风险模板条目表][风控期货_公用_风险条目表][b.{记录序号},a.{机构编号},a.{模板序号},a.{风险条目序号},a.{风险条目名称},a.{风险规则类别},b.{市场编号}, b.{合规计算层级}, b.{单位净值标志}, b.{触发方向},b.{触发阶段类型},b.{合约类型},b.{订单方向串},b.{风险规则序号},b.{风险规则名称},b.{风险规则代码},b.{风险要素串},b.{风险规则值串},b.{对应插件},b.{风险采取行为},b.{开始时间},b.{结束时间},b.{启用标志}][ a.{风险条目序号} = b.{记录序号} and a.{机构编号}=@机构编号# and (@模板序号#=0 or a. {模板序号}=@模板序号#) and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",a.{风险条目序号},";")) > 0) and (@风险规则类别#=0 or a. {风险规则类别}=@风险规则类别#) and (@风险条目名称#=" " or a.{风险条目名称}=@风险条目名称#) order by a. {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select b.row_id,a.co_no,a.model_id,a.risk_item_id,a.risk_item_name,a.risk_rule_type,b.exch_no, b.compli_calc_level, b.unit_nav_flag, b.trig_type,b.trig_stage_type,b.contrc_type,b.order_dir_str,b.risk_rule_id,b.risk_rule_name,b.risk_rule_code,b.risk_param_str,b.risk_rule_value_str,b.corrsp_plug,b.risk_rule_action,b.begin_time,b.end_time,b.rule_flag from db_rkfutu.tb_rkfupb_futu_risk_model_item a,db_rkfutu.tb_rkfupb_risk_item b where  a.risk_item_id = b.row_id and a.co_no=v_co_no and (v_model_id=0 or a. model_id=v_model_id) and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",a.risk_item_id,";")) > 0) and (v_risk_rule_type=0 or a. risk_rule_type=v_risk_rule_type) and (v_risk_item_name=" " or a.risk_item_name=v_risk_item_name) order by a. row_id;
    else
        select b.row_id,a.co_no,a.model_id,a.risk_item_id,a.risk_item_name,a.risk_rule_type,b.exch_no, b.compli_calc_level, b.unit_nav_flag, b.trig_type,b.trig_stage_type,b.contrc_type,b.order_dir_str,b.risk_rule_id,b.risk_rule_name,b.risk_rule_code,b.risk_param_str,b.risk_rule_value_str,b.corrsp_plug,b.risk_rule_action,b.begin_time,b.end_time,b.rule_flag from db_rkfutu.tb_rkfupb_futu_risk_model_item a,db_rkfutu.tb_rkfupb_risk_item b where  a.risk_item_id = b.row_id and a.co_no=v_co_no and (v_model_id=0 or a. model_id=v_model_id) and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",a.risk_item_id,";")) > 0) and (v_risk_rule_type=0 or a. risk_rule_type=v_risk_rule_type) and (v_risk_item_name=" " or a.risk_item_name=v_risk_item_name) order by a. row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_公用_期货数据归历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfupb_FutuDataToHis;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfupb_FutuDataToHis(
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
    

    /* [数据归历史][风控期货_风控_客户风险触警流水表][字段][{创建日期} <= @初始化日期#][1][@初始化日期#] */
    insert into db_rkfutu_his.tbjour_rkfurk_futu_client_risk_trig_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, client_risk_rule_id, 
        compli_trig_id, co_no, pd_no, exch_group_no, 
        order_dir_str, exch_no, contrc_type, contrc_code, 
        trig_stage_type, compli_calc_level, unit_nav_flag, trig_type, 
        risk_item_name, risk_rule_action, risk_rule_type, risk_rule_value_str, 
        risk_rule_calc_str, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, client_risk_rule_id, 
        compli_trig_id, co_no, pd_no, exch_group_no, 
        order_dir_str, exch_no, contrc_type, contrc_code, 
        trig_stage_type, compli_calc_level, unit_nav_flag, trig_type, 
        risk_item_name, risk_rule_action, risk_rule_type, risk_rule_value_str, 
        risk_rule_calc_str, remark_info 
        from db_rkfutu.tbjour_rkfurk_futu_client_risk_trig 
        where create_date <= v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "rkfutuA.1.17.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][风控期货_风控_客户风险触警流水表][{创建日期}<= @初始化日期#][3][@初始化日期#] */
    delete from db_rkfutu.tbjour_rkfurk_futu_client_risk_trig 
        where create_date<= v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "rkfutuA.1.17.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][风控期货_风控_合规触警流水序号表][{合规触警序号} = 1][1=1][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rkfutu.tb_rkfurk_compliancetrigger_id set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, compli_trig_id = 1 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "rkfutuA.1.17.2";
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


