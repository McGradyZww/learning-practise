DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_增加客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_AddSecuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_AddSecuClientRiskRule(
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
    declare v_compli_trig_result_type int;
    declare v_row_count int;
    declare v_record_count int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_risk_item_tmplat_id bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_compli_trig_result_type = 0;
    SET v_row_count = -1;
    SET v_record_count = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_risk_item_tmplat_id = 0;

    
    label_pro:BEGIN
    

    /* set @风险计算值串# = ""; */
    set v_risk_rule_calc_str = "";

    /* set @合规触发结果# = 2; */
    set v_compli_trig_result_type = 2;

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* if @模板序号# = 0 then */
    if v_model_id = 0 then

      /* [获取表记录数量][风控证券_风控_客户风险规则表][@记录个数#][{机构编号} = @机构编号#  and {风险条目序号} = @风险条目序号# and {产品编号串} = @产品编号串# and {交易组编号串} = @交易组编号串#] */
      select count(1) into v_record_count from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no = v_co_no  and risk_item_id = v_risk_item_id and pd_no_str = v_pd_no_str and exch_group_no_str = v_exch_group_no_str;


      /* [检查报错返回][@记录个数# > 0 ][907][@风险条目序号#] */
      if v_record_count > 0  then
          
          SET v_error_code = "rksecuA.4.1.907";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("风险条目序号=",v_risk_item_id),"#",v_mysql_message);
          else
              SET v_error_info = concat("风险条目序号=",v_risk_item_id);
          end if;
          leave label_pro;
      end if;

    else

      /* [获取表记录数量][风控证券_风控_客户风险规则表][@记录个数#][{机构编号} = @机构编号# and {产品编号串} = @产品编号串# and {交易组编号串} = @交易组编号串# and {模板序号} = @模板序号#] */
      select count(1) into v_record_count from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no = v_co_no and pd_no_str = v_pd_no_str and exch_group_no_str = v_exch_group_no_str and model_id = v_model_id;


      /* [检查报错返回][@记录个数# > 0 ][907][@风险条目序号#] */
      if v_record_count > 0  then
          
          SET v_error_code = "rksecuA.4.1.907";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("风险条目序号=",v_risk_item_id),"#",v_mysql_message);
          else
              SET v_error_info = concat("风险条目序号=",v_risk_item_id);
          end if;
          leave label_pro;
      end if;

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

    /* if @模板序号# = 0 then */
    if v_model_id = 0 then
        #将记录序号和其他唯一索引字段都加在条件中，以防记录序号和相关数据不匹配

        /* [获取表记录变量][风控证券_公用_风险条目表][字段][字段变量][{机构编号}＝@机构编号# and {记录序号}=@风险条目序号#][4][@风险条目序号#] */
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
            v_end_time, v_rule_flag from db_rksecu.tb_rksepb_secu_risk_item where co_no=v_co_no and row_id=v_risk_item_id limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "rksecuA.4.1.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("风险条目序号=",v_risk_item_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("风险条目序号=",v_risk_item_id);
            end if;
            leave label_pro;
        end if;

        #[检查报错返回][@启用标志# = 《启用标志-不启用》][904][@启用标志#]

        /* [读取插入表记录][风控证券_风控_客户风险规则表][风控证券_公用_风险条目表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{机构编号},{产品编号串},{交易组编号串},{模板序号},{风险条目序号},{合规规则说明},{市场编号串},{订单方向串},{维度序号},{触发阶段类型串},{合规计算层级},{单位净值标志},{触发方向},{风险规则序号},{风险规则类别},{风险规则名称},{风险规则代码},{风险要素串},{风险规则值串1},{风险采取行为1},{风险规则值串2},{风险采取行为2},{风险规则值串3},{风险采取行为3},{风险规则值串4},{风险采取行为4},{对应插件},{开始时间},{结束时间},{启用标志},{合规触发结果},{条目模板标志}, {联合标志}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@机构编号#,@产品编号串#,@交易组编号串#,@模板序号#,{记录序号},{合规规则说明},{市场编号串},{订单方向串},{维度序号},{触发阶段类型串},{合规计算层级},{单位净值标志},{触发方向},{风险规则序号},{风险规则类别},{风险规则名称},{风险规则代码},{风险要素串},{风险规则值串1},{风险采取行为1},{风险规则值串2},{风险采取行为2},{风险规则值串3},{风险采取行为3},{风险规则值串4},{风险采取行为4},{对应插件},{开始时间},{结束时间},{启用标志},@合规触发结果#,@条目模板标志#, @联合标志#][{机构编号}=@机构编号#  and  {记录序号} = @风险条目序号#][5][@风险条目序号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_rksecu.tb_rkserk_secu_client_risk_rule (
            create_date,create_time,update_date,update_time,update_times,co_no,pd_no_str,exch_group_no_str,model_id,risk_item_id,compli_rules_remark,exch_no_str,order_dir_str,dime_id,trig_stage_type_str,compli_calc_level,unit_nav_flag,trig_type,risk_rule_id,risk_rule_type,risk_rule_name,risk_rule_code,risk_param_str,risk_rule_value_str1,risk_rule_action1,risk_rule_value_str2,risk_rule_action2,risk_rule_value_str3,risk_rule_action3,risk_rule_value_str4,risk_rule_action4,corrsp_plug,begin_time,end_time,rule_flag,compli_trig_result_type,templ_flag, union_flag) 
            select 
            v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_co_no,v_pd_no_str,v_exch_group_no_str,v_model_id,row_id,compli_rules_remark,exch_no_str,order_dir_str,dime_id,trig_stage_type_str,compli_calc_level,unit_nav_flag,trig_type,risk_rule_id,risk_rule_type,risk_rule_name,risk_rule_code,risk_param_str,risk_rule_value_str1,risk_rule_action1,risk_rule_value_str2,risk_rule_action2,risk_rule_value_str3,risk_rule_action3,risk_rule_value_str4,risk_rule_action4,corrsp_plug,begin_time,end_time,rule_flag,v_compli_trig_result_type,v_templ_flag, v_union_flag 
            from db_rksecu.tb_rksepb_secu_risk_item 
            where co_no=v_co_no  and  row_id = v_risk_item_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "rksecuA.4.1.5";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("风险条目序号=",v_risk_item_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("风险条目序号=",v_risk_item_id);
            end if;
            leave label_pro;
        end if;


        /* [获取记录序号][@记录序号#] */
        select LAST_INSERT_ID() into v_row_id;


        /* [获取表记录变量语句][风控证券_风控_客户风险规则表][字段][字段变量][{记录序号} = @记录序号#] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no_str, exch_group_no_str, exch_no_str, order_dir_str, 
            dime_id, trig_stage_type_str, compli_calc_level, unit_nav_flag, 
            trig_type, model_id, risk_item_id, compli_rules_remark, 
            risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
            risk_param_str, union_flag, risk_rule_value_str1, risk_rule_action1, 
            risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
            risk_rule_value_str4, risk_rule_action4, corrsp_plug, begin_time, 
            end_time, rule_flag, templ_flag, compli_trig_result_type into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_co_no, 
            v_pd_no_str, v_exch_group_no_str, v_exch_no_str, v_order_dir_str, 
            v_dime_id, v_trig_stage_type_str, v_compli_calc_level, v_unit_nav_flag, 
            v_trig_type, v_model_id, v_risk_item_id, v_compli_rules_remark, 
            v_risk_rule_id, v_risk_rule_type, v_risk_rule_name, v_risk_rule_code, 
            v_risk_param_str, v_union_flag, v_risk_rule_value_str1, v_risk_rule_action1, 
            v_risk_rule_value_str2, v_risk_rule_action2, v_risk_rule_value_str3, v_risk_rule_action3, 
            v_risk_rule_value_str4, v_risk_rule_action4, v_corrsp_plug, v_begin_time, 
            v_end_time, v_rule_flag, v_templ_flag, v_compli_trig_result_type from db_rksecu.tb_rkserk_secu_client_risk_rule where row_id = v_row_id limit 1;


        /* set @风险条目序号串# = ""; */
        set v_risk_item_id_str = "";
    else

        /* insert into ~风控证券_风控_客户风险规则表^ ({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{机构编号},{产品编号串},{交易组编号串},{模板序号},{风险条目序号},{合规规则说明},{市场编号串},{订单方向串},{维度序号},{触发阶段类型串},{合规计算层级},{单位净值标志},{触发方向},{风险规则序号},{风险规则类别},{风险规则名称},{风险规则代码},{风险要素串},{风险规则值串1},{风险采取行为1},{风险规则值串2},{风险采取行为2},{风险规则值串3},{风险采取行为3},{风险规则值串4},{风险采取行为4},{对应插件},{开始时间},{结束时间},{启用标志},{合规触发结果},{条目模板标志}, {联合标志}) select @创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@机构编号#,@产品编号串#,@交易组编号串#,@模板序号#,b.{记录序号},b.{合规规则说明},b.{市场编号串},b.{订单方向串},b.{维度序号},b.{触发阶段类型串},b.{合规计算层级},b.{单位净值标志},b.{触发方向},b.{风险规则序号},b.{风险规则类别},b.{风险规则名称},b.{风险规则代码},b.{风险要素串},b.{风险规则值串1},b.{风险采取行为1},b.{风险规则值串2},b.{风险采取行为2},b.{风险规则值串3},b.{风险采取行为3},b.{风险规则值串4},b.{风险采取行为4}, b.{对应插件}, b.{开始时间}, b.{结束时间}, b.{启用标志}, @合规触发结果#, @条目模板标志#, @联合标志# from ~风控证券_公用_风险模板条目表^ a,~风控证券_公用_风险条目表^ b where a.{机构编号}=@机构编号# and a.{模板序号}= @模板序号# and a.{风险条目序号} = b.{记录序号}; */
        insert into db_rksecu.tb_rkserk_secu_client_risk_rule (create_date,create_time,update_date,update_time,update_times,co_no,pd_no_str,exch_group_no_str,model_id,risk_item_id,compli_rules_remark,exch_no_str,order_dir_str,dime_id,trig_stage_type_str,compli_calc_level,unit_nav_flag,trig_type,risk_rule_id,risk_rule_type,risk_rule_name,risk_rule_code,risk_param_str,risk_rule_value_str1,risk_rule_action1,risk_rule_value_str2,risk_rule_action2,risk_rule_value_str3,risk_rule_action3,risk_rule_value_str4,risk_rule_action4,corrsp_plug,begin_time,end_time,rule_flag,compli_trig_result_type,templ_flag, union_flag) select v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_co_no,v_pd_no_str,v_exch_group_no_str,v_model_id,b.row_id,b.compli_rules_remark,b.exch_no_str,b.order_dir_str,b.dime_id,b.trig_stage_type_str,b.compli_calc_level,b.unit_nav_flag,b.trig_type,b.risk_rule_id,b.risk_rule_type,b.risk_rule_name,b.risk_rule_code,b.risk_param_str,b.risk_rule_value_str1,b.risk_rule_action1,b.risk_rule_value_str2,b.risk_rule_action2,b.risk_rule_value_str3,b.risk_rule_action3,b.risk_rule_value_str4,b.risk_rule_action4, b.corrsp_plug, b.begin_time, b.end_time, b.rule_flag, v_compli_trig_result_type, v_templ_flag, v_union_flag from db_rksecu.tb_rksepb_secu_risk_model_item a,db_rksecu.tb_rksepb_secu_risk_item b where a.co_no=v_co_no and a.model_id= v_model_id and a.risk_item_id = b.row_id;
         #[获取表记录][风控证券_风控_客户风险规则表][字段][{机构编号}=@机构编号# and {产品编号串} = @产品编号串# and {交易组编号串} = @交易组编号串# and {模板序号}= @模板序号#][@指定行数#]
        #[获取表记录变量语句][风控证券_风控_客户风险规则表][group_concat({风险条目序号})][@风险条目序号串#][{机构编号}=@机构编号# and {产品编号串} = @产品编号串# and {交易组编号串} = @交易组编号串# and {模板序号}= @模板序号#]
    end if;
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

# 原子_风控证券_风控_删除客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_DeleteSecuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_DeleteSecuClientRiskRule(
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
    
    #删除时，要么删除一个模板下的所有条目，要么删除非模板的条目，不允许单独删除模板下的部分条目

    /* if @模板序号# = 0 then */
    if v_model_id = 0 then
         select GROUP_CONCAT(row_id separator ';') into v_risk_param_str from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no=v_co_no and  (v_pd_no_str = " " or pd_no_str=v_pd_no_str) and (v_exch_group_no_str = " " or exch_group_no_str=v_exch_group_no_str) and model_id = 0 and  instr(v_risk_item_id_str, concat(";",risk_item_id,";")) > 0;

        /* [删除表记录][风控证券_风控_客户风险规则表][{机构编号}=@机构编号# and  (@产品编号串# = " " or {产品编号串}=@产品编号串#) and (@交易组编号串# = " " or {交易组编号串}=@交易组编号串#) and {模板序号} = 0 and  instr(@风险条目序号串#, concat(";",{风险条目序号},";")) > 0][3][@风险条目序号串#] */
        delete from db_rksecu.tb_rkserk_secu_client_risk_rule 
            where co_no=v_co_no and  (v_pd_no_str = " " or pd_no_str=v_pd_no_str) and (v_exch_group_no_str = " " or exch_group_no_str=v_exch_group_no_str) and model_id = 0 and  instr(v_risk_item_id_str, concat(";",risk_item_id,";")) > 0;
        if v_error_code = 1 then
                    
            SET v_error_code = "rksecuA.4.2.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("风险条目序号串=",v_risk_item_id_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("风险条目序号串=",v_risk_item_id_str);
            end if;
            leave label_pro;
        end if;

    else
        select GROUP_CONCAT(row_id separator ';') into v_risk_param_str from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no=v_co_no and pd_no_str=v_pd_no_str and exch_group_no_str=v_exch_group_no_str and model_id =v_model_id;

        /* [获取表记录变量][风控证券_风控_客户风险规则表][{记录序号}][@记录序号#][{机构编号}=@机构编号# and {产品编号串}=@产品编号串# and {交易组编号串}=@交易组编号串# and {模板序号} =@模板序号#][3][@模板序号#,@产品编号串#,@交易组编号串#] */
        select row_id into v_row_id from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no=v_co_no and pd_no_str=v_pd_no_str and exch_group_no_str=v_exch_group_no_str and model_id =v_model_id limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "rksecuA.4.2.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("模板序号=",v_model_id,",","产品编号串=",v_pd_no_str,",","交易组编号串=",v_exch_group_no_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("模板序号=",v_model_id,",","产品编号串=",v_pd_no_str,",","交易组编号串=",v_exch_group_no_str);
            end if;
            leave label_pro;
        end if;


        /* [删除表记录][风控证券_风控_客户风险规则表][{机构编号}=@机构编号# and {产品编号串}=@产品编号串# and {交易组编号串}=@交易组编号串# and {模板序号} =@模板序号#][3][@模板序号#,@产品编号串#,@交易组编号串#] */
        delete from db_rksecu.tb_rkserk_secu_client_risk_rule 
            where co_no=v_co_no and pd_no_str=v_pd_no_str and exch_group_no_str=v_exch_group_no_str and model_id =v_model_id;
        if v_error_code = 1 then
                    
            SET v_error_code = "rksecuA.4.2.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("模板序号=",v_model_id,",","产品编号串=",v_pd_no_str,",","交易组编号串=",v_exch_group_no_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("模板序号=",v_model_id,",","产品编号串=",v_pd_no_str,",","交易组编号串=",v_exch_group_no_str);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_risk_param_str = v_risk_param_str;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_查询客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QuerySecuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QuerySecuClientRiskRule(
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
    

    /* [获取表记录][风控证券_风控_客户风险规则表][字段][{机构编号}=@机构编号# and ({模板序号}=@模板序号# or @模板序号# = 0) and (@产品编号#=0 or instr(concat(";",{产品编号串}), concat(";",@产品编号#,";")) > 0 or {产品编号串}= "-1" ) and (@交易组编号#=0 or {交易组编号串} = " " or instr(concat(";",{交易组编号串}), concat(";",@交易组编号#,";")) > 0 or {交易组编号串}= "-1") and (@风险规则类别串#=" " or instr(@风险规则类别串#, concat(";",{风险规则类别},";")) > 0) and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",{风险条目序号},";")) > 0) and (@触发阶段类型#=0 or instr({触发阶段类型串},@触发阶段类型#)>0 ) and ( @条目模板标志# = 0 or {条目模板标志} = @条目模板标志#) group by {风险条目序号}, {产品编号串}, {交易组编号串}][@指定行数#] */
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
        end_time, rule_flag, templ_flag, compli_trig_result_type from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no=v_co_no and (model_id=v_model_id or v_model_id = 0) and (v_pd_no=0 or instr(concat(";",pd_no_str), concat(";",v_pd_no,";")) > 0 or pd_no_str= "-1" ) and (v_exch_group_no=0 or exch_group_no_str = " " or instr(concat(";",exch_group_no_str), concat(";",v_exch_group_no,";")) > 0 or exch_group_no_str= "-1") and (v_risk_rule_type_str=" " or instr(v_risk_rule_type_str, concat(";",risk_rule_type,";")) > 0) and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",risk_item_id,";")) > 0) and (v_trig_stage_type=0 or instr(trig_stage_type_str,v_trig_stage_type)>0 ) and ( v_templ_flag = 0 or templ_flag = v_templ_flag) group by risk_item_id, pd_no_str, exch_group_no_str;
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
        end_time, rule_flag, templ_flag, compli_trig_result_type from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no=v_co_no and (model_id=v_model_id or v_model_id = 0) and (v_pd_no=0 or instr(concat(";",pd_no_str), concat(";",v_pd_no,";")) > 0 or pd_no_str= "-1" ) and (v_exch_group_no=0 or exch_group_no_str = " " or instr(concat(";",exch_group_no_str), concat(";",v_exch_group_no,";")) > 0 or exch_group_no_str= "-1") and (v_risk_rule_type_str=" " or instr(v_risk_rule_type_str, concat(";",risk_rule_type,";")) > 0) and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",risk_item_id,";")) > 0) and (v_trig_stage_type=0 or instr(trig_stage_type_str,v_trig_stage_type)>0 ) and ( v_templ_flag = 0 or templ_flag = v_templ_flag) group by risk_item_id, pd_no_str, exch_group_no_str limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_获取基础风险要素值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_GetSecuBaseRiskParamValue;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_GetSecuBaseRiskParamValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_risk_param_value_str varchar(1024),
    IN p_target_risk_param varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_risk_param_value varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_risk_param_value_str varchar(1024);
    declare v_target_risk_param varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_risk_param_value varchar(255);
    declare v_tmp_risk_param_value_str varchar(1024);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_risk_param_value_str = p_risk_param_value_str;
    SET v_target_risk_param = p_target_risk_param;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_risk_param_value = " ";
    SET v_tmp_risk_param_value_str = " ";

    
    label_pro:BEGIN
    
    #先取风险要素起始的开始到最后的字符串，会自动从分号后取后面的串

    /* set @临时_风险要素值串# = ifnull(substring(@风险要素值串#, instr(@风险要素值串#, concat(";", @目标风险要素#, "=")) + 1), " "); */
    set v_tmp_risk_param_value_str = ifnull(substring(v_risk_param_value_str, instr(v_risk_param_value_str, concat(";", v_target_risk_param, "=")) + 1), " ");

    /* if instr(@临时_风险要素值串#, ";") > 1 then */
    if instr(v_tmp_risk_param_value_str, ";") > 1 then
        #再取风险要素值串中左边到分号的字符串，即指定风险要素的串

        /* set @临时_风险要素值串# =  left(@临时_风险要素值串#, instr(@临时_风险要素值串#, ";") - 1); */
        set v_tmp_risk_param_value_str =  left(v_tmp_risk_param_value_str, instr(v_tmp_risk_param_value_str, ";") - 1);
        #再取风险要素值串中等号右边的值

        /* set @风险要素值# = ifnull(substring(@临时_风险要素值串#, instr(@临时_风险要素值串#, "=") + 1), " "); */
        set v_risk_param_value = ifnull(substring(v_tmp_risk_param_value_str, instr(v_tmp_risk_param_value_str, "=") + 1), " ");
    else

        /* set @风险要素值# = " "; */
        set v_risk_param_value = " ";
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_risk_param_value = v_risk_param_value;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_获取计算风险要素值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_GetFutuCaclRiskParamValue;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_GetFutuCaclRiskParamValue(
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
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_all_fee decimal(18,4),
    IN p_trig_type int,
    IN p_trig_stage_type int,
    IN p_compli_calc_level int,
    IN p_risk_param_str varchar(2048),
    IN p_target_risk_param varchar(255),
    INOUT p_risk_param_value varchar(255),
    IN p_per_secu_cost_amt decimal(18,4),
    IN p_per_secu_market_value decimal(18,4),
    IN p_trade_qty decimal(18,2),
    IN p_trade_amt decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_evalu_price decimal(16,9)
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_all_fee decimal(18,4);
    declare v_trig_type int;
    declare v_trig_stage_type int;
    declare v_compli_calc_level int;
    declare v_risk_param_str varchar(2048);
    declare v_target_risk_param varchar(255);
    declare v_risk_param_value varchar(255);
    declare v_per_secu_cost_amt decimal(18,4);
    declare v_per_secu_market_value decimal(18,4);
    declare v_trade_qty decimal(18,2);
    declare v_trade_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_evalu_price decimal(16,9);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
    declare v_nav_asset decimal(18,4);
    declare v_posi_cost decimal(18,4);
    declare v_tmp_stock_code varchar(6);
    declare v_tmp_exch_no int;
    declare v_hk_stock_code varchar(16);
    declare v_posi_market_value decimal(18,4);
    declare v_posi_qty decimal(18,2);
    declare v_tmp_posi_qty decimal(18,2);
    declare v_total_stock_issue decimal(18,2);
    declare v_circl_stock_capit decimal(18,2);
    declare v_stock_type int;
    declare v_last_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_today_open_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_tmp_trade_amt decimal(18,4);
    declare v_record_count int;
    declare v_sh_hk_stock_code_no int;
    declare v_sz_hk_stock_code_no int;
    declare v_risk_rule_code varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_all_fee = p_all_fee;
    SET v_trig_type = p_trig_type;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_risk_param_str = p_risk_param_str;
    SET v_target_risk_param = p_target_risk_param;
    SET v_risk_param_value = p_risk_param_value;
    SET v_per_secu_cost_amt = p_per_secu_cost_amt;
    SET v_per_secu_market_value = p_per_secu_market_value;
    SET v_trade_qty = p_trade_qty;
    SET v_trade_amt = p_trade_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_evalu_price = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;
    SET v_nav_asset = 0;
    SET v_posi_cost = 0;
    SET v_tmp_stock_code = " ";
    SET v_tmp_exch_no = 0;
    SET v_hk_stock_code = " ";
    SET v_posi_market_value = 0;
    SET v_posi_qty = 0;
    SET v_tmp_posi_qty = 0;
    SET v_total_stock_issue = 0;
    SET v_circl_stock_capit = 0;
    SET v_stock_type = 0;
    SET v_last_price = 0;
    SET v_pre_close_price = 0;
    SET v_today_open_price = 0;
    SET v_strike_amt = 0;
    SET v_tmp_trade_amt = 0;
    SET v_record_count = 0;
    SET v_sh_hk_stock_code_no = 0;
    SET v_sz_hk_stock_code_no = 0;
    SET v_risk_rule_code = " ";

    
    label_pro:BEGIN
    
    #如果风险要素不在风险要素串中，则为需要计算的风险要素，根据具体的风险要素名称来进行处理

    /* set @风险要素值# = 0; */
    set v_risk_param_value = 0;

    /* set @估值价格# = 0; */
    set v_evalu_price = 0;

    /* 调用【原子_风控证券_计算_获取港股汇率】*/
    call db_rksecu.pra_rksecc_GetHKRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_buy_ref_rate,
        v_sell_ref_rate,
        v_settle_buy_rate,
        v_settle_sell_rate);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.4.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取港股汇率出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @目标风险要素# =  "昨日总净值" then */
    if v_target_risk_param =  "昨日总净值" then

      /* 调用【原子_风控证券_计算_获取昨日净资产】*/
      call db_rksecu.pra_rksecc_GetProductPreNetAsset(
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
          v_compli_calc_level,
          v_error_code,
          v_error_info,
          v_nav_asset);
      if v_error_code = "1" then
          SET v_error_code = "rksecuA.4.5.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取昨日净资产出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* set @风险要素值# = round(@净资产#,2); */
      set v_risk_param_value = round(v_nav_asset,2);

    /* elseif @目标风险要素# =  "单证券成本" then */
    elseif v_target_risk_param =  "单证券成本" then

      /* if  @订单方向# = 《订单方向-买入》 then */
      if  v_order_dir = 1 then

        /* set @买入参考汇率# = @卖出参考汇率#; */
        set v_buy_ref_rate = v_sell_ref_rate;
      end if;

      /* 调用【原子_风控证券_计算_计算单证券持仓成本】*/
      call db_rksecu.pra_rksecc_CalcStockPositionHoldingCost(
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
          v_exch_no,
          v_stock_code,
          v_trig_stage_type,
          v_compli_calc_level,
          v_trig_type,
          v_buy_ref_rate,
          v_error_code,
          v_error_info,
          v_posi_cost);
      if v_error_code = "1" then
          SET v_error_code = "rksecuA.4.5.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券持仓成本出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* set @风险要素值# = round((@持仓成本# + @单券成本#),2); */
      set v_risk_param_value = round((v_posi_cost + v_per_secu_cost_amt),2);

    /* elseif @目标风险要素# =  "关联单证券成本" then */
    elseif v_target_risk_param =  "关联单证券成本" then

      /* if  @订单方向# = 《订单方向-买入》 then */
      if  v_order_dir = 1 then

        /* set @买入参考汇率# = @卖出参考汇率#; */
        set v_buy_ref_rate = v_sell_ref_rate;
      end if;

      /* set @临时_证券代码# = @证券代码#; */
      set v_tmp_stock_code = v_stock_code;

      /* set @临时_市场编号# = @市场编号#; */
      set v_tmp_exch_no = v_exch_no;

      /* if @市场编号# = 1 or @市场编号# = 2 then */
      if v_exch_no = 1 or v_exch_no = 2 then

        /* 调用【原子_风控证券_计算_计算单证券持仓成本】*/
        call db_rksecu.pra_rksecc_CalcStockPositionHoldingCost(
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
            v_exch_no,
            v_stock_code,
            v_trig_stage_type,
            v_compli_calc_level,
            v_trig_type,
            v_buy_ref_rate,
            v_error_code,
            v_error_info,
            v_posi_cost);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券持仓成本出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @风险要素值# = round((@持仓成本# + @单券成本#),3); */
        set v_risk_param_value = round((v_posi_cost + v_per_secu_cost_amt),3);

        /* 调用【原子_风控证券_维度_获取H股代码关系】*/
        call db_rksecu.pra_rksedm_GetHstockCode(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_error_code,
            v_error_info,
            v_hk_stock_code);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_维度_获取H股代码关系出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @证券代码# = @港股代码#; */
        set v_stock_code = v_hk_stock_code;

        /* set @市场编号# = 3; */
        set v_exch_no = 3;

        /* 调用【原子_风控证券_计算_计算单证券持仓成本】*/
        call db_rksecu.pra_rksecc_CalcStockPositionHoldingCost(
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
            v_exch_no,
            v_stock_code,
            v_trig_stage_type,
            v_compli_calc_level,
            v_trig_type,
            v_buy_ref_rate,
            v_error_code,
            v_error_info,
            v_posi_cost);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券持仓成本出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @风险要素值# = round(@持仓成本# + @风险要素值#,2); */
        set v_risk_param_value = round(v_posi_cost + v_risk_param_value,2);
      else

        /* 调用【原子_风控证券_计算_计算单证券持仓成本】*/
        call db_rksecu.pra_rksecc_CalcStockPositionHoldingCost(
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
            v_exch_no,
            v_stock_code,
            v_trig_stage_type,
            v_compli_calc_level,
            v_trig_type,
            v_buy_ref_rate,
            v_error_code,
            v_error_info,
            v_posi_cost);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券持仓成本出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @风险要素值# =round((@持仓成本# + @单券成本#),2); */
        set v_risk_param_value =round((v_posi_cost + v_per_secu_cost_amt),2);

        /* set @港股代码# = @证券代码#; */
        set v_hk_stock_code = v_stock_code;

        /* 调用【原子_风控证券_维度_获取A股代码关系】*/
        call db_rksecu.pra_rksedm_GetAstockCode(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_hk_stock_code,
            v_error_code,
            v_error_info,
            v_stock_code,
            v_exch_no);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_维度_获取A股代码关系出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* 调用【原子_风控证券_计算_计算单证券持仓成本】*/
        call db_rksecu.pra_rksecc_CalcStockPositionHoldingCost(
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
            v_exch_no,
            v_stock_code,
            v_trig_stage_type,
            v_compli_calc_level,
            v_trig_type,
            v_buy_ref_rate,
            v_error_code,
            v_error_info,
            v_posi_cost);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券持仓成本出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @风险要素值# = round((@持仓成本#) + @风险要素值#,2); */
        set v_risk_param_value = round((v_posi_cost) + v_risk_param_value,2);
      end if;

      /* set @证券代码# = @临时_证券代码#; */
      set v_stock_code = v_tmp_stock_code;

      /* set @市场编号# = @临时_市场编号#; */
      set v_exch_no = v_tmp_exch_no;

    /* elseif @目标风险要素# =  "单证券市值" then */
    elseif v_target_risk_param =  "单证券市值" then

      /* set @买入参考汇率# = (@买入参考汇率#+@卖出参考汇率#)/2; */
      set v_buy_ref_rate = (v_buy_ref_rate+v_sell_ref_rate)/2;

      /* 调用【原子_风控证券_计算_计算单证券持仓市值】*/
      call db_rksecu.pra_rksecc_CalcStockPositionHoldingValue(
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
          v_exch_no,
          v_stock_code_no,
          v_stock_code,
          v_trig_stage_type,
          v_compli_calc_level,
          v_trig_type,
          v_order_dir,
          v_order_qty,
          v_trade_qty,
          v_error_code,
          v_error_info,
          v_posi_market_value,
          v_evalu_price);
      if v_error_code = "1" then
          SET v_error_code = "rksecuA.4.5.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券持仓市值出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* set @风险要素值# = round((case when @市场编号# = 3 or @市场编号# = 4 then @持仓市值# * @买入参考汇率# else @持仓市值# end),2); */
      set v_risk_param_value = round((case when v_exch_no = 3 or v_exch_no = 4 then v_posi_market_value * v_buy_ref_rate else v_posi_market_value end),2);

    /* elseif @目标风险要素# =  "持仓数量" then */
    elseif v_target_risk_param =  "持仓数量" then

      /* 调用【原子_风控证券_计算_计算单证券持仓数量】*/
      call db_rksecu.pra_rksecc_CalcStockPositionHoldingEquities(
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
          v_exch_no,
          v_stock_code,
          v_trig_stage_type,
          v_compli_calc_level,
          v_trig_type,
          v_error_code,
          v_error_info,
          v_posi_qty);
      if v_error_code = "1" then
          SET v_error_code = "rksecuA.4.5.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券持仓数量出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* SET @临时_持仓数量# = @持仓数量#; */
      SET v_tmp_posi_qty = v_posi_qty;

      /* 调用【原子_风控证券_计算_计算单证券大宗交易数量】*/
      call db_rksecu.pra_rksecc_CalcStockBlockTradeHoldingQty(
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
          v_exch_no,
          v_stock_code_no,
          v_error_code,
          v_error_info,
          v_posi_qty);
      if v_error_code = "1" then
          SET v_error_code = "rksecuA.4.5.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券大宗交易数量出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* SET @持仓数量# = @持仓数量# + @临时_持仓数量#; */
      SET v_posi_qty = v_posi_qty + v_tmp_posi_qty;

      /* set @风险要素值# = round((@持仓数量# + @交易数量#),0); */
      set v_risk_param_value = round((v_posi_qty + v_trade_qty),0);

    /* elseif (@目标风险要素# =  "当日市场成交金额" or @目标风险要素# =  "最新价"  or @目标风险要素# =  "昨收盘价" or @目标风险要素# =  "今开盘价")  then */
    elseif (v_target_risk_param =  "当日市场成交金额" or v_target_risk_param =  "最新价"  or v_target_risk_param =  "昨收盘价" or v_target_risk_param =  "今开盘价")  then

      /* 调用【原子_风控证券_计算_获取证券信息】*/
      call db_rksecu.pra_rksecc_GetStockInfo(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_exch_no,
          v_stock_code,
          v_error_code,
          v_error_info,
          v_total_stock_issue,
          v_circl_stock_capit,
          v_stock_type,
          v_last_price,
          v_pre_close_price,
          v_today_open_price,
          v_strike_amt);
      if v_error_code = "1" then
          SET v_error_code = "rksecuA.4.5.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券信息出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* if @目标风险要素# =  "当日市场成交金额" then */
      if v_target_risk_param =  "当日市场成交金额" then

        /* set @风险要素值# = round(@成交金额#,2); */
        set v_risk_param_value = round(v_strike_amt,2);

      /* elseif @目标风险要素# =  "最新价" then */
      elseif v_target_risk_param =  "最新价" then

        /* set @风险要素值# = round(@最新价#,3); */
        set v_risk_param_value = round(v_last_price,3);

      /* elseif @目标风险要素# =  "昨收盘价" then */
      elseif v_target_risk_param =  "昨收盘价" then

        /* set @风险要素值# = round(@昨收盘价#,3); */
        set v_risk_param_value = round(v_pre_close_price,3);

      /* elseif @目标风险要素# =  "今开盘价" then */
      elseif v_target_risk_param =  "今开盘价" then

        /* set @风险要素值# = round(@今开盘价#,3); */
        set v_risk_param_value = round(v_today_open_price,3);
      end if;

    /* elseif (@目标风险要素# =  "流通股本" or  @目标风险要素# =  "总股本")  then */
    elseif (v_target_risk_param =  "流通股本" or  v_target_risk_param =  "总股本")  then

      /* 调用【原子_风控证券_计算_获取证券信息】*/
      call db_rksecu.pra_rksecc_GetStockInfo(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_exch_no,
          v_stock_code,
          v_error_code,
          v_error_info,
          v_total_stock_issue,
          v_circl_stock_capit,
          v_stock_type,
          v_last_price,
          v_pre_close_price,
          v_today_open_price,
          v_strike_amt);
      if v_error_code = "1" then
          SET v_error_code = "rksecuA.4.5.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券信息出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* if @目标风险要素# =  "流通股本" then */
      if v_target_risk_param =  "流通股本" then

        /* set @风险要素值# = round(@流通股本#,2); */
        set v_risk_param_value = round(v_circl_stock_capit,2);

      /* elseif @目标风险要素# =  "总股本" then */
      elseif v_target_risk_param =  "总股本" then

        /* set @风险要素值# = round(@总股本#,2); */
        set v_risk_param_value = round(v_total_stock_issue,2);
      end if;

    /* elseif @目标风险要素# =  "汇总交易额度" then */
    elseif v_target_risk_param =  "汇总交易额度" then

      /* if  @订单方向# = 《订单方向-买入》 then */
      if  v_order_dir = 1 then

        /* set @买入参考汇率# = @卖出参考汇率#; */
        set v_buy_ref_rate = v_sell_ref_rate;
      end if;

      /* set @临时_交易金额# = @交易金额#; */
      set v_tmp_trade_amt = v_trade_amt;

      /* 调用【原子_风控证券_计算_计算当前交易金额】*/
      call db_rksecu.pra_rksecc_CalcCurrentTradingAmt(
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
          v_compli_calc_level,
          v_trig_stage_type,
          v_buy_ref_rate,
          v_error_code,
          v_error_info,
          v_trade_amt);
      if v_error_code = "1" then
          SET v_error_code = "rksecuA.4.5.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算当前交易金额出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* set @风险要素值# = round((@交易金额# + @临时_交易金额#),2); */
      set v_risk_param_value = round((v_trade_amt + v_tmp_trade_amt),2);

    /* elseif @目标风险要素# =  "单笔交易额度" then */
    elseif v_target_risk_param =  "单笔交易额度" then

      /* if  @订单方向# = 《订单方向-买入》 then */
      if  v_order_dir = 1 then

        /* set @买入参考汇率# = @卖出参考汇率#; */
        set v_buy_ref_rate = v_sell_ref_rate;
      end if;

      /* set @风险要素值# = round((case when @市场编号# = 3 or @市场编号# = 4 then (@订单价格# * @订单数量#) * @买入参考汇率# else (@订单价格# * @订单数量#) end),2); */
      set v_risk_param_value = round((case when v_exch_no = 3 or v_exch_no = 4 then (v_order_price * v_order_qty) * v_buy_ref_rate else (v_order_price * v_order_qty) end),2);

    /* elseif @目标风险要素# =  "单笔交易数量" then */
    elseif v_target_risk_param =  "单笔交易数量" then

        /* set @风险要素值# = @订单数量#; */
        set v_risk_param_value = v_order_qty;

    /* elseif @目标风险要素# =  "交易价" then */
    elseif v_target_risk_param =  "交易价" then

      /* set @风险要素值# = round(@订单价格#,3); */
      set v_risk_param_value = round(v_order_price,3);

    /* elseif (@目标风险要素# =  "日内对敲" or @目标风险要素# =  "日内反向" or @目标风险要素# =  "挂单对敲" or @目标风险要素# =  "挂单反向") then */
    elseif (v_target_risk_param =  "日内对敲" or v_target_risk_param =  "日内反向" or v_target_risk_param =  "挂单对敲" or v_target_risk_param =  "挂单反向") then

      /* if @市场编号# = 1 or @市场编号# = 2 then */
      if v_exch_no = 1 or v_exch_no = 2 then

        /* 调用【原子_风控证券_计算_获取反向交易合规】*/
        call db_rksecu.pra_rksecc_GetStockReverseTradeCompliance(
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
            v_exch_no,
            v_stock_code_no,
            v_order_dir,
            v_order_price,
            v_trig_stage_type,
            v_compli_calc_level,
            v_target_risk_param,
            v_error_code,
            v_error_info,
            v_record_count);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取反向交易合规出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

      else

        /* 调用【原子_风控证券_计算_获取港股证券代码编号】*/
        call db_rksecu.pra_rksecc_GetHKStockCodeNo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_error_code,
            v_error_info,
            v_sh_hk_stock_code_no,
            v_sz_hk_stock_code_no);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取港股证券代码编号出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* 调用【原子_风控证券_计算_获取港股反向交易合规】*/
        call db_rksecu.pra_rksecc_GetHKStockReverseTradeCompliance(
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
            v_sh_hk_stock_code_no,
            v_sz_hk_stock_code_no,
            v_order_dir,
            v_order_price,
            v_trig_stage_type,
            v_compli_calc_level,
            v_target_risk_param,
            v_error_code,
            v_error_info,
            v_record_count);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取港股反向交易合规出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

      end if;

      /* set @风险要素值# = @记录个数#; */
      set v_risk_param_value = v_record_count;

    /* elseif @目标风险要素# = "白名单" then */
    elseif v_target_risk_param = "白名单" then

      /* set @风险要素值# = 1; */
      set v_risk_param_value = 1;

    /* elseif @目标风险要素# = "黑名单" then */
    elseif v_target_risk_param = "黑名单" then

      /* set @风险要素值# = 1; */
      set v_risk_param_value = 1;
    else

      /* [报错不回滚][905][@风险规则代码#] */
          SET v_error_code = "rksecuA.4.5.905";
          SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
          leave label_pro;

    end if;
    END;

    SET p_risk_param_value = v_risk_param_value;
    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_evalu_price = v_evalu_price;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_交易检查客户风险
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_CheckSecuClientRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_CheckSecuClientRisk(
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
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
    IN p_trig_stage_type int,
    IN p_risk_param_value_str varchar(1024),
    IN p_compli_trig_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_compli_rules_remark varchar(255),
    OUT p_risk_rule_action varchar(32)
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
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_trig_stage_type int;
    declare v_risk_param_value_str varchar(1024);
    declare v_compli_trig_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_compli_rules_remark varchar(255);
    declare v_risk_rule_action varchar(32);
    declare v_mach_time int;
    declare v_tmp_exch_no int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
    declare v_trade_fee decimal(18,4);
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_trade_amt decimal(18,4);
    declare v_evalu_price decimal(16,9);
    declare v_occur_market_value decimal(18,4);
    declare v_per_secu_cost_amt decimal(18,4);
    declare v_per_secu_market_value decimal(18,4);
    declare v_trade_qty decimal(18,2);
    declare v_risk_pre_flag int;
    declare v_tmp_risk_param_value_str varchar(1024);
    declare v_row_id bigint;
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
    declare v_model_id bigint;
    declare v_risk_item_id int;
    declare v_risk_rule_id int;
    declare v_risk_rule_type int;
    declare v_risk_rule_name varchar(64);
    declare v_risk_rule_code varchar(2048);
    declare v_risk_param_str varchar(2048);
    declare v_union_flag int;
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
    declare v_client_risk_rule_id int;
    declare v_risk_rule_calc_str varchar(255);
    declare v_record_count int;
    declare v_cash_asset_flag int;
    declare v_risk_splice_str varchar(255);
    declare v_risk_loop_count int;
    declare v_tmp_risk_rule_code varchar(2048);
    declare v_tmp_risk_rule_action varchar(32);
    declare v_risk_param_value varchar(255);
    declare v_target_risk_param varchar(255);
    declare v_risk_rule_value_str varchar(255);
    declare v_tmp_risk_rule_value_str varchar(255);
    declare v_risk_deal_str varchar(255);
    declare v_remark_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_all_fee = p_all_fee;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_risk_param_value_str = p_risk_param_value_str;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_compli_rules_remark = " ";
    SET v_risk_rule_action = " ";
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_exch_no = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;
    SET v_trade_fee = 0;
    SET v_occur_amt = 0;
    SET v_occur_qty = 0;
    SET v_trade_amt = 0;
    SET v_evalu_price = 0;
    SET v_occur_market_value = 0;
    SET v_per_secu_cost_amt = 0;
    SET v_per_secu_market_value = 0;
    SET v_trade_qty = 0;
    SET v_risk_pre_flag = 0;
    SET v_tmp_risk_param_value_str = " ";
    SET v_row_id = 0;
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
    SET v_model_id = 0;
    SET v_risk_item_id = 0;
    SET v_risk_rule_id = 0;
    SET v_risk_rule_type = 0;
    SET v_risk_rule_name = " ";
    SET v_risk_rule_code = " ";
    SET v_risk_param_str = " ";
    SET v_union_flag = 0;
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
    SET v_client_risk_rule_id = 0;
    SET v_risk_rule_calc_str = " ";
    SET v_record_count = 0;
    SET v_cash_asset_flag = 0;
    SET v_risk_splice_str = " ";
    SET v_risk_loop_count = 0;
    SET v_tmp_risk_rule_code = " ";
    SET v_tmp_risk_rule_action = " ";
    SET v_risk_param_value = " ";
    SET v_target_risk_param = " ";
    SET v_risk_rule_value_str = " ";
    SET v_tmp_risk_rule_value_str = " ";
    SET v_risk_deal_str = " ";
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @临时_市场编号# = @市场编号#; */
    set v_tmp_exch_no = v_exch_no;

    /* set @市场编号# = 3; */
    set v_exch_no = 3;

    /* 调用【原子_风控证券_计算_获取港股汇率】*/
    call db_rksecu.pra_rksecc_GetHKRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_buy_ref_rate,
        v_sell_ref_rate,
        v_settle_buy_rate,
        v_settle_sell_rate);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.4.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取港股汇率出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if  @订单方向# = 《订单方向-买入》 then */
    if  v_order_dir = 1 then

      /* set @买入参考汇率# = @卖出参考汇率#; */
      set v_buy_ref_rate = v_sell_ref_rate;
    end if;

    /* set @市场编号# = @临时_市场编号#; */
    set v_exch_no = v_tmp_exch_no;

    /* set @交易费用# = @全部费用#; */
    set v_trade_fee = v_all_fee;

    /* if @订单方向# = 31 then */
    if v_order_dir = 31 then

        /* set @订单方向# = 2; */
        set v_order_dir = 2;
    end if;

    /* if @订单方向# = 1 then */
    if v_order_dir = 1 then

      /* set @变动金额# = @订单价格# * @订单数量#; */
      set v_occur_amt = v_order_price * v_order_qty;

      /* set @变动数量# = @订单数量#; */
      set v_occur_qty = v_order_qty;

    /* elseif @订单方向# = 2 then */
    elseif v_order_dir = 2 then

      /* set @变动金额# = -1 * @订单价格# * @订单数量#; */
      set v_occur_amt = -1 * v_order_price * v_order_qty;

      /* set @变动数量# = -1 * @订单数量#; */
      set v_occur_qty = -1 * v_order_qty;
    else

      /* set @变动金额# = 0; */
      set v_occur_amt = 0;

      /* set @变动数量# = 0; */
      set v_occur_qty = 0;
    end if;

    /* set @交易金额# = @订单价格# * @订单数量# *  (case when @市场编号# = 3 or @市场编号# = 4 then @买入参考汇率# else 1 end); */
    set v_trade_amt = v_order_price * v_order_qty *  (case when v_exch_no = 3 or v_exch_no = 4 then v_buy_ref_rate else 1 end);

    /* set @变动金额# = @变动金额# * (case when @市场编号# = 3 or @市场编号# = 4 then @买入参考汇率# else 1 end); */
    set v_occur_amt = v_occur_amt * (case when v_exch_no = 3 or v_exch_no = 4 then v_buy_ref_rate else 1 end);

    /* 调用【原子_风控证券_计算_获取证券估值价格】*/
    call db_rksecu.pra_rksecc_GetStockValuationPrice(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_evalu_price);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.4.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券估值价格出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @变动市值# =  @变动数量# * @估值价格#; */
    set v_occur_market_value =  v_occur_qty * v_evalu_price;

    /* set @单券成本# = @变动金额# + @全部费用#  * (case when @市场编号# = 3 or @市场编号# = 4 then @买入参考汇率# else 1 end); */
    set v_per_secu_cost_amt = v_occur_amt + v_all_fee  * (case when v_exch_no = 3 or v_exch_no = 4 then v_buy_ref_rate else 1 end);

    /* set @单券市值# = @变动市值#; */
    set v_per_secu_market_value = v_occur_market_value;

    /* set @交易数量# = @变动数量#; */
    set v_trade_qty = v_occur_qty;

    /* set @风控允许标志# = 0; */
    set v_risk_pre_flag = 0;

    /* set @临时_风险要素值串# = @风险要素值串#; */
    set v_tmp_risk_param_value_str = v_risk_param_value_str;

    /* [声明游标][风控证券_风控_客户风险规则表][字段][{机构编号} = @机构编号# and instr({触发阶段类型串}, @触发阶段类型#)>0 and (instr(concat(";",{产品编号串}), concat(";",@产品编号#,";")) > 0 or {产品编号串} = "-1") and (instr(concat(";",{交易组编号串}), concat(";",@交易组编号#,";")) > 0 or {交易组编号串}=" " or {交易组编号串} = "-1")  and (@订单方向# = 0 or instr(concat(";",{订单方向串}), concat(";",@订单方向#,";")) > 0)  and {启用标志} = 《启用标志-启用》 and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end)][cursor_rkserk_client_riskparam] */
    cursor_rkserk_client_riskparam:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_rkserk_client_riskparam CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no_str, exch_group_no_str, exch_no_str, order_dir_str, 
        dime_id, trig_stage_type_str, compli_calc_level, unit_nav_flag, 
        trig_type, model_id, risk_item_id, compli_rules_remark, 
        risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
        risk_param_str, union_flag, risk_rule_value_str1, risk_rule_action1, 
        risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
        risk_rule_value_str4, risk_rule_action4, corrsp_plug, begin_time, 
        end_time, rule_flag, templ_flag, compli_trig_result_type 
        from db_rksecu.tb_rkserk_secu_client_risk_rule 
        where co_no = v_co_no and instr(trig_stage_type_str, v_trig_stage_type)>0 and (instr(concat(";",pd_no_str), concat(";",v_pd_no,";")) > 0 or pd_no_str = "-1") and (instr(concat(";",exch_group_no_str), concat(";",v_exch_group_no,";")) > 0 or exch_group_no_str=" " or exch_group_no_str = "-1")  and (v_order_dir = 0 or instr(concat(";",order_dir_str), concat(";",v_order_dir,";")) > 0)  and rule_flag = 1 and (case when begin_time>end_time then (v_mach_time between begin_time and 240000 or v_mach_time between 0 and end_time)  when end_time>begin_time then (v_mach_time between begin_time and end_time) else begin_time = end_time end);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_rkserk_client_riskparam][loop_rkserk_client_riskparam] */
    open cursor_rkserk_client_riskparam;
    loop_rkserk_client_riskparam: LOOP
    fetch cursor_rkserk_client_riskparam into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no_str, v_exch_group_no_str, v_exch_no_str, v_order_dir_str, 
        v_dime_id, v_trig_stage_type_str, v_compli_calc_level, v_unit_nav_flag, 
        v_trig_type, v_model_id, v_risk_item_id, v_compli_rules_remark, 
        v_risk_rule_id, v_risk_rule_type, v_risk_rule_name, v_risk_rule_code, 
        v_risk_param_str, v_union_flag, v_risk_rule_value_str1, v_risk_rule_action1, 
        v_risk_rule_value_str2, v_risk_rule_action2, v_risk_rule_value_str3, v_risk_rule_action3, 
        v_risk_rule_value_str4, v_risk_rule_action4, v_corrsp_plug, v_begin_time, 
        v_end_time, v_rule_flag, v_templ_flag, v_compli_trig_result_type;
        IF v_cursor_done THEN
            LEAVE loop_rkserk_client_riskparam;
        END IF;


       /* set @客户风险规则序号# =  @记录序号#; */
       set v_client_risk_rule_id =  v_row_id;

       /* 调用【原子_风控证券_风控_获取对应风控计算值】*/
       call db_rksecu.pra_rkserk_GetCalcResult(
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
           v_trig_stage_type,
           v_client_risk_rule_id,
           v_error_code,
           v_error_info,
           v_risk_rule_calc_str,
           v_pd_no_str,
           v_exch_group_no_str);
       if v_error_code = "1" then
           SET v_error_code = "rksecuA.4.6.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取对应风控计算值出现错误！',v_mysql_message);
           end if;
           close cursor_rkserk_client_riskparam;
           leave label_pro;
       elseif v_error_code <> "0" then
           close cursor_rkserk_client_riskparam;
           leave label_pro;
       end if;


       /* [检查报错返回][@风险计算值串# = " "][910][@风险计算值串#] */
       if v_risk_rule_calc_str = " " then
           
           SET v_error_code = "rksecuA.4.6.910";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("风险计算值串=",v_risk_rule_calc_str),"#",v_mysql_message);
           else
               SET v_error_info = concat("风险计算值串=",v_risk_rule_calc_str);
           end if;
           close cursor_rkserk_client_riskparam;
           leave label_pro;
       end if;

        #判断证券代码是否在维度范围内

      /* 调用【原子_风控证券_维度_维度序号获取范围】*/
      call db_rksecu.pra_rksedm_GetRangeByDimeId(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_dime_id,
          v_exch_no,
          v_stock_code,
          v_order_dir,
          v_trig_type,
          v_error_code,
          v_error_info,
          v_record_count,
          v_stock_code_no,
          v_cash_asset_flag);
      if v_error_code = "1" then
          SET v_error_code = "rksecuA.4.6.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_维度_维度序号获取范围出现错误！',v_mysql_message);
          end if;
          close cursor_rkserk_client_riskparam;
          leave label_pro;
      elseif v_error_code <> "0" then
          close cursor_rkserk_client_riskparam;
          leave label_pro;
      end if;


      /* if @记录个数# = 0 then */
      if v_record_count = 0 then
        ITERATE  loop_rkserk_client_riskparam;
      else
         #判断是否存在并发情况
        #[原子_风控证券_风控_获取交易流水记录]

        /* set @风控拼接值串# = @风险要素串#; */
        set v_risk_splice_str = v_risk_param_str;

        /* set @风险要素值串# = @临时_风险要素值串#; */
        set v_risk_param_value_str = v_tmp_risk_param_value_str;

        /* 调用【原子_风控证券_风控_风险要素值串拼接】*/
        call db_rksecu.pra_rkserk_JointRiskParamValueStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_risk_param_value_str,
            v_risk_rule_calc_str,
            v_risk_param_str,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_all_fee,
            v_trade_fee,
            v_occur_amt,
            v_occur_qty,
            v_occur_market_value,
            v_stock_code,
            v_exch_no,
            v_cash_asset_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_风险要素值串拼接出现错误！',v_mysql_message);
            end if;
            close cursor_rkserk_client_riskparam;
            leave label_pro;
        elseif v_error_code <> "0" then
            close cursor_rkserk_client_riskparam;
            leave label_pro;
        end if;


        /* set @风控循环次数# = 0; */
        set v_risk_loop_count = 0;

        /* set @合规触发结果# = 0; */
        set v_compli_trig_result_type = 0;

        /* set @临时_风险规则代码# = @风险规则代码#; */
        set v_tmp_risk_rule_code = v_risk_rule_code;

        /* set @临时_风险采取行为# = 0; */
        set v_tmp_risk_rule_action = 0;

        /* set @风险要素值# = 0; */
        set v_risk_param_value = 0;
        #循环截取风险规则代码中的风险要素，从风险要素串中获得值，并替换
          loop_label:loop

            /* if instr(@风险规则代码#, "[") > 0 and instr(@风险规则代码#, "]") > 0 then */
            if instr(v_risk_rule_code, "[") > 0 and instr(v_risk_rule_code, "]") > 0 then

                /* if instr(@风险规则代码#, "]") - instr(@风险规则代码#, "[") - 1 > 0 then */
                if instr(v_risk_rule_code, "]") - instr(v_risk_rule_code, "[") - 1 > 0 then

                    /* set @目标风险要素# = trim(substring(@风险规则代码#, instr(@风险规则代码#, "[") + 1, instr(@风险规则代码#, "]") - instr(@风险规则代码#, "[") - 1)); */
                    set v_target_risk_param = trim(substring(v_risk_rule_code, instr(v_risk_rule_code, "[") + 1, instr(v_risk_rule_code, "]") - instr(v_risk_rule_code, "[") - 1));
                else

                    /* [报错不回滚][905][@风险规则代码#] */
                        SET v_error_code = "rksecuA.4.6.905";
                        SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
                        close cursor_rkserk_client_riskparam;
                        leave label_pro;

                    leave loop_label;
                end if;
                #如果目标风险要素是n，表明是参数值宏代码

                /* if @目标风险要素# = "n" then */
                if v_target_risk_param = "n" then
                    #替换风险规则代码中第一个[n]宏代码

                    /* set @风险规则代码# = replace(@风险规则代码#, "[n]", "?" ); */
                    set v_risk_rule_code = replace(v_risk_rule_code, "[n]", "?" );
               else
                    #检查传入的风险要素值串中是否包含目标风险要素，包含直接取值，不包含则认为是需要计算

                    /* if instr(@风险要素值串#, concat(";", @目标风险要素#, "=?")) > 0 then */
                    if instr(v_risk_param_value_str, concat(";", v_target_risk_param, "=?")) > 0 then

                        /* 调用【原子_风控证券_风控_获取计算风险要素值】*/
                        call db_rksecu.pra_rkserk_GetFutuCaclRiskParamValue(
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
                            v_exch_no,
                            v_stock_code,
                            v_stock_code_no,
                            v_order_dir,
                            v_order_qty,
                            v_order_price,
                            v_all_fee,
                            v_trig_type,
                            v_trig_stage_type,
                            v_compli_calc_level,
                            v_risk_param_str,
                            v_target_risk_param,
                            v_risk_param_value,
                            v_per_secu_cost_amt,
                            v_per_secu_market_value,
                            v_trade_qty,
                            v_trade_amt,
                            v_error_code,
                            v_error_info,
                            v_evalu_price);
                        if v_error_code = "1" then
                            SET v_error_code = "rksecuA.4.6.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取计算风险要素值出现错误！',v_mysql_message);
                            end if;
                            close cursor_rkserk_client_riskparam;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            close cursor_rkserk_client_riskparam;
                            leave label_pro;
                        end if;

                    else

                        /* 调用【原子_风控证券_风控_获取基础风险要素值】*/
                        call db_rksecu.pra_rkserk_GetSecuBaseRiskParamValue(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_risk_param_value_str,
                            v_target_risk_param,
                            v_error_code,
                            v_error_info,
                            v_risk_param_value);
                        if v_error_code = "1" then
                            SET v_error_code = "rksecuA.4.6.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取基础风险要素值出现错误！',v_mysql_message);
                            end if;
                            close cursor_rkserk_client_riskparam;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            close cursor_rkserk_client_riskparam;
                            leave label_pro;
                        end if;

                    end if;
                    #替换风控拼接值串中的对应风险要素

                    /* set @风控拼接值串# = replace(@风控拼接值串#,@目标风险要素#,@风险要素值#); */
                    set v_risk_splice_str = replace(v_risk_splice_str,v_target_risk_param,v_risk_param_value);
                    #替换风险规则代码中相应的风险要素宏代码

                    /* if instr(@风险规则代码#, concat("[", @目标风险要素#, "]")) > 0 then */
                    if instr(v_risk_rule_code, concat("[", v_target_risk_param, "]")) > 0 then

                          /* set @风险规则代码# = replace(@风险规则代码#, concat("[", @目标风险要素#, "]"), @风险要素值# ); */
                          set v_risk_rule_code = replace(v_risk_rule_code, concat("[", v_target_risk_param, "]"), v_risk_param_value );
                    end if;
                end if;
            else

                /* if instr(@风险规则代码#, "[") > 0 or instr(@风险规则代码#, "]") > 0 then */
                if instr(v_risk_rule_code, "[") > 0 or instr(v_risk_rule_code, "]") > 0 then

                    /* [报错不回滚][905][@风险规则代码#] */
                        SET v_error_code = "rksecuA.4.6.905";
                        SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
                        close cursor_rkserk_client_riskparam;
                        leave label_pro;

                end if;
                leave loop_label;
              end if;
          end loop loop_label ;

        /* set @临时_风险规则代码# = @风险规则代码#; */
        set v_tmp_risk_rule_code = v_risk_rule_code;
        loop_rule_value:loop
          #循环4次判断是否满足预警条件

          /* set @风控循环次数# = @风控循环次数# + 1; */
          set v_risk_loop_count = v_risk_loop_count + 1;

          /* if @风控循环次数# = 1 then */
          if v_risk_loop_count = 1 then

             /* set @风险规则值串# =  @风险规则值串1#; */
             set v_risk_rule_value_str =  v_risk_rule_value_str1;

             /* set @风险采取行为# =  @风险采取行为1#; */
             set v_risk_rule_action =  v_risk_rule_action1;

          /* elseif @风控循环次数# = 2 then */
          elseif v_risk_loop_count = 2 then

             /* set @风险规则值串# =  @风险规则值串2#; */
             set v_risk_rule_value_str =  v_risk_rule_value_str2;

             /* set @风险采取行为# =  @风险采取行为2#; */
             set v_risk_rule_action =  v_risk_rule_action2;

          /* elseif @风控循环次数# = 3 then */
          elseif v_risk_loop_count = 3 then

             /* set @风险规则值串# =  @风险规则值串3#; */
             set v_risk_rule_value_str =  v_risk_rule_value_str3;

             /* set @风险采取行为# =  @风险采取行为3#; */
             set v_risk_rule_action =  v_risk_rule_action3;

          /* elseif @风控循环次数# = 4 then */
          elseif v_risk_loop_count = 4 then

             /* set @风险规则值串# =  @风险规则值串4#; */
             set v_risk_rule_value_str =  v_risk_rule_value_str4;

             /* set @风险采取行为# =  @风险采取行为4#; */
             set v_risk_rule_action =  v_risk_rule_action4;
          else
             leave loop_rule_value;
          end if;

          /* if @风险采取行为# = " "  then */
          if v_risk_rule_action = " "  then
            ITERATE loop_rule_value;
          end if;

          /* if right(@风险规则值串#, 1) <> ";" and @风险规则值串# <> " " then */
          if right(v_risk_rule_value_str, 1) <> ";" and v_risk_rule_value_str <> " " then

            /* set @风险规则值串# = concat(@风险规则值串#, ";"); */
            set v_risk_rule_value_str = concat(v_risk_rule_value_str, ";");
          end if;

          /* set @风险规则代码# = @临时_风险规则代码#; */
          set v_risk_rule_code = v_tmp_risk_rule_code;

          /* set @临时_风险规则值串# = @风险规则值串#; */
          set v_tmp_risk_rule_value_str = v_risk_rule_value_str;
          loop_label2:loop

            /* if instr(@风险规则代码#, "?") > 0 then */
            if instr(v_risk_rule_code, "?") > 0 then

                    /* set @风险要素值# = left(@风险规则值串#, instr(@风险规则值串#, ";") - 1); */
                    set v_risk_param_value = left(v_risk_rule_value_str, instr(v_risk_rule_value_str, ";") - 1);

                    /* set @风险规则值串# = substring(@风险规则值串#, instr(@风险规则值串#, ";") + 1); */
                    set v_risk_rule_value_str = substring(v_risk_rule_value_str, instr(v_risk_rule_value_str, ";") + 1);
                    #替换风险规则代码中第一个?

                    /* set @风险规则代码# = concat(left(@风险规则代码#, instr(@风险规则代码#, "?") - 1), @风险要素值#, substring(@风险规则代码#, instr(@风险规则代码#, "?") + 1)); */
                    set v_risk_rule_code = concat(left(v_risk_rule_code, instr(v_risk_rule_code, "?") - 1), v_risk_param_value, substring(v_risk_rule_code, instr(v_risk_rule_code, "?") + 1));
            else
                    leave loop_label2;
            end if;
          end loop loop_label2 ;
            #如果风险规则代码替换完成，则检查代码中是否还有宏，如果没有宏，则执行，否则报错

          /* if instr(@风险规则代码#, "[") > 0 or instr(@风险规则代码#, "]") > 0 then */
          if instr(v_risk_rule_code, "[") > 0 or instr(v_risk_rule_code, "]") > 0 then

             /* [报错不回滚][905][@风险规则代码#] */
                 SET v_error_code = "rksecuA.4.6.905";
                 SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
                 close cursor_rkserk_client_riskparam;
                 leave label_pro;

          else

            /* set @风险计算值串# = @风控拼接值串#; */
            set v_risk_rule_calc_str = v_risk_splice_str;
            set @v_result_value = 0;
            #执行风险规则代码，如果为1，则报错返回，风险限制

            /* [执行语句返回值][@风险规则代码#][@返回值#] */
            set @tmp_sql = concat("select ", v_risk_rule_code, " into @v_result_value");
            PREPARE stmt from @tmp_sql;
            EXECUTE stmt;
            set @tmp_sql = '';
            DEALLOCATE PREPARE stmt;


            /* if  instr(@风险要素串#,"白名单;")>0 then */
            if  instr(v_risk_param_str,"白名单;")>0 then

               /* set @风控允许标志# =1; */
               set v_risk_pre_flag =1;
               set @v_result_value = 0;
            end if;
            if @v_result_value = 1 then

              /* set @合规触发结果# = 1; */
              set v_compli_trig_result_type = 1;

              /* if @风险采取行为# > @临时_风险采取行为#  then */
              if v_risk_rule_action > v_tmp_risk_rule_action  then

                /* set @风控处理值串# = @临时_风险规则值串#; */
                set v_risk_deal_str = v_tmp_risk_rule_value_str;

                /* set @临时_风险采取行为# = @风险采取行为#; */
                set v_tmp_risk_rule_action = v_risk_rule_action;
              end if;
            end if;
          end if;
        end loop loop_rule_value;
        #将触发结果计入流水表

        /* if @合规触发结果# = 1 then */
        if v_compli_trig_result_type = 1 then

          /* set @风险规则值串# = @风控处理值串#; */
          set v_risk_rule_value_str = v_risk_deal_str;

          /* set @风险采取行为# = @临时_风险采取行为#; */
          set v_risk_rule_action = v_tmp_risk_rule_action;

          /* set @风险规则代码# = @临时_风险规则代码#; */
          set v_risk_rule_code = v_tmp_risk_rule_code;

          /* set @客户风险规则序号# = @记录序号#; */
          set v_client_risk_rule_id = v_row_id;

          /* set @风险要素值串# = @临时_风险要素值串#; */
          set v_risk_param_value_str = v_tmp_risk_param_value_str;

          /* 调用【原子_风控证券_风控_风险要素值串替换】*/
          call db_rksecu.pra_rkserk_ReplaceRiskParamValueStr(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_risk_param_value_str,
              v_risk_rule_calc_str,
              v_risk_param_str,
              v_risk_rule_name,
              v_trig_type,
              v_risk_rule_value_str,
              v_unit_nav_flag,
              v_risk_rule_code,
              v_error_code,
              v_error_info);
          if v_error_code = "1" then
              SET v_error_code = "rksecuA.4.6.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_风险要素值串替换出现错误！',v_mysql_message);
              end if;
              close cursor_rkserk_client_riskparam;
              leave label_pro;
          elseif v_error_code <> "0" then
              close cursor_rkserk_client_riskparam;
              leave label_pro;
          end if;


          /* if instr(@风险规则名称#,"单证券市值")>0 then */
          if instr(v_risk_rule_name,"单证券市值")>0 then

               /* set @风险要素值串# = concat(@风险要素值串#,"订单数量=",round(@订单数量#,2),";最新价=",round(@估值价格#,2)); */
               set v_risk_param_value_str = concat(v_risk_param_value_str,"订单数量=",round(v_order_qty,2),";最新价=",round(v_evalu_price,2));
          end if;

          /* if instr(@风险要素串#,"黑名单;")>0 then */
          if instr(v_risk_param_str,"黑名单;")>0 then

             /* set @风险要素值串# = concat("证券代码",@证券代码#,"在黑名单范围内!"); */
             set v_risk_param_value_str = concat("证券代码",v_stock_code,"在黑名单范围内!");

          /* elseif instr(@风险要素串#,"日内对敲")>0 or instr(@风险要素串#,"日内反向")>0 or instr(@风险要素串#,"挂单对敲")>0 or instr(@风险要素串#,"挂单反向")>0 then */
          elseif instr(v_risk_param_str,"日内对敲")>0 or instr(v_risk_param_str,"日内反向")>0 or instr(v_risk_param_str,"挂单对敲")>0 or instr(v_risk_param_str,"挂单反向")>0 then

             /* set @风险要素值串# = concat("证券代码",@证券代码#,"触发反向交易",@风险规则名称#,"!"); */
             set v_risk_param_value_str = concat("证券代码",v_stock_code,"触发反向交易",v_risk_rule_name,"!");
          end if;

          /* set @备注信息# = concat( "交易触警!",@风险要素值串#); */
          set v_remark_info = concat( "交易触警!",v_risk_param_value_str);

          /* if @合规计算层级# = 《合规计算层级-交易组级》 then */
          if v_compli_calc_level = 1 then

            /* set @产品编号串# = @交易组编号串#; */
            set v_pd_no_str = v_exch_group_no_str;
          end if;

          /* [插入表记录][风控证券_风控_客户风险触警流水表][字段][字段变量][1][@客户风险规则序号#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_rksecu.tbjour_rkserk_secu_client_risk_trig(
              create_date, create_time, update_date, 
              update_time, update_times, client_risk_rule_id, risk_item_id, 
              compli_trig_id, co_no, pd_no, exch_group_no, 
              order_dir, dime_id, stock_code_no, trig_stage_type, 
              compli_calc_level, unit_nav_flag, trig_type, compli_rules_remark, 
              risk_rule_action, risk_rule_type, risk_rule_value_str, risk_rule_calc_str, 
              remark_info, opor_no, pd_no_str) 
          value( 
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_client_risk_rule_id, v_risk_item_id, 
              v_compli_trig_id, v_co_no, v_pd_no, v_exch_group_no, 
              v_order_dir, v_dime_id, v_stock_code_no, v_trig_stage_type, 
              v_compli_calc_level, v_unit_nav_flag, v_trig_type, v_compli_rules_remark, 
              v_risk_rule_action, v_risk_rule_type, v_risk_rule_value_str, v_risk_rule_calc_str, 
              v_remark_info, v_opor_no, v_pd_no_str);
          if v_error_code = "1" then
                      
              SET v_error_code = "rksecuA.4.6.1";
              SET v_error_info =  CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
              close cursor_rkserk_client_riskparam;
              leave label_pro;
          end if;


          /* [检查正常返回][@风险采取行为# = 4] */
          if v_risk_rule_action = 4 then
              close cursor_rkserk_client_riskparam;
              leave label_pro;
          end if;

        end if;
      end if;

    /* [关闭游标][cursor_rkserk_client_riskparam] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_rkserk_client_riskparam;
    end cursor_rkserk_client_riskparam;

    #白名单需要总的查一遍

    /* if @风控允许标志# =0 then */
    if v_risk_pre_flag =0 then

        /* [获取表记录变量语句][风控证券_风控_客户风险规则表][字段][字段变量][{机构编号} = @机构编号# and instr({触发阶段类型串}, @触发阶段类型#)>0 and (instr(concat(";",{产品编号串}), concat(";",@产品编号#,";")) > 0 or {产品编号串} = "-1") and (instr(concat(";",{交易组编号串}), concat(";",@交易组编号#,";")) > 0 or {交易组编号串}=" " or {交易组编号串} = "-1") and (@订单方向# = 0 or instr(concat(";",{订单方向串}), concat(";",@订单方向#,";")) > 0) and {启用标志} = 《启用标志-启用》 and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end) and instr({风险要素串},"白名单")>0] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no_str, exch_group_no_str, exch_no_str, order_dir_str, 
            dime_id, trig_stage_type_str, compli_calc_level, unit_nav_flag, 
            trig_type, model_id, risk_item_id, compli_rules_remark, 
            risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
            risk_param_str, union_flag, risk_rule_value_str1, risk_rule_action1, 
            risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
            risk_rule_value_str4, risk_rule_action4, corrsp_plug, begin_time, 
            end_time, rule_flag, templ_flag, compli_trig_result_type into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_co_no, 
            v_pd_no_str, v_exch_group_no_str, v_exch_no_str, v_order_dir_str, 
            v_dime_id, v_trig_stage_type_str, v_compli_calc_level, v_unit_nav_flag, 
            v_trig_type, v_model_id, v_risk_item_id, v_compli_rules_remark, 
            v_risk_rule_id, v_risk_rule_type, v_risk_rule_name, v_risk_rule_code, 
            v_risk_param_str, v_union_flag, v_risk_rule_value_str1, v_risk_rule_action1, 
            v_risk_rule_value_str2, v_risk_rule_action2, v_risk_rule_value_str3, v_risk_rule_action3, 
            v_risk_rule_value_str4, v_risk_rule_action4, v_corrsp_plug, v_begin_time, 
            v_end_time, v_rule_flag, v_templ_flag, v_compli_trig_result_type from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no = v_co_no and instr(trig_stage_type_str, v_trig_stage_type)>0 and (instr(concat(";",pd_no_str), concat(";",v_pd_no,";")) > 0 or pd_no_str = "-1") and (instr(concat(";",exch_group_no_str), concat(";",v_exch_group_no,";")) > 0 or exch_group_no_str=" " or exch_group_no_str = "-1") and (v_order_dir = 0 or instr(concat(";",order_dir_str), concat(";",v_order_dir,";")) > 0) and rule_flag = 1 and (case when begin_time>end_time then (v_mach_time between begin_time and 240000 or v_mach_time between 0 and end_time)  when end_time>begin_time then (v_mach_time between begin_time and end_time) else begin_time = end_time end) and instr(risk_param_str,"白名单")>0 limit 1;

        if found_rows() > 0 then

          /* set @备注信息# = concat( "交易触警! 证券代码",@证券代码#,"不在白名单内!"); */
          set v_remark_info = concat( "交易触警! 证券代码",v_stock_code,"不在白名单内!");

          /* set @合规触发结果# = 1; */
          set v_compli_trig_result_type = 1;

          /* set @客户风险规则序号# = @记录序号#; */
          set v_client_risk_rule_id = v_row_id;

          /* set @风险计算值串# = concat("0",substr(@风险计算值串#,2)); */
          set v_risk_rule_calc_str = concat("0",substr(v_risk_rule_calc_str,2));

          /* set @风险采取行为# = greatest(@风险采取行为1#,@风险采取行为2#,@风险采取行为3#,@风险采取行为4#); */
          set v_risk_rule_action = greatest(v_risk_rule_action1,v_risk_rule_action2,v_risk_rule_action3,v_risk_rule_action4);

          /* set @风险规则值串# = case when @风险采取行为1# = @风险采取行为#  then   @风险规则值串1#
                                                       when @风险采取行为2# = @风险采取行为#  then   @风险规则值串2#
                                                       when @风险采取行为3# = @风险采取行为#  then   @风险规则值串3#
                                                       when @风险采取行为4# = @风险采取行为#  then   @风险规则值串4#
                                                       end;
 */
          set v_risk_rule_value_str = case when v_risk_rule_action1 = v_risk_rule_action  then   v_risk_rule_value_str1
                                                                 when v_risk_rule_action2 = v_risk_rule_action  then   v_risk_rule_value_str2
                                                                 when v_risk_rule_action3 = v_risk_rule_action  then   v_risk_rule_value_str3
                                                                 when v_risk_rule_action4 = v_risk_rule_action  then   v_risk_rule_value_str4
                                                                 end;
          

          /* set @产品编号串# = concat(@产品编号#,";"); */
          set v_pd_no_str = concat(v_pd_no,";");

          /* if @合规计算层级# = 《合规计算层级-交易组级》 then */
          if v_compli_calc_level = 1 then

            /* set @产品编号串# = concat(@交易组编号#,";"); */
            set v_pd_no_str = concat(v_exch_group_no,";");
          end if;

          /* [插入表记录][风控证券_风控_客户风险触警流水表][字段][字段变量][1][@客户风险规则序号#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_rksecu.tbjour_rkserk_secu_client_risk_trig(
              create_date, create_time, update_date, 
              update_time, update_times, client_risk_rule_id, risk_item_id, 
              compli_trig_id, co_no, pd_no, exch_group_no, 
              order_dir, dime_id, stock_code_no, trig_stage_type, 
              compli_calc_level, unit_nav_flag, trig_type, compli_rules_remark, 
              risk_rule_action, risk_rule_type, risk_rule_value_str, risk_rule_calc_str, 
              remark_info, opor_no, pd_no_str) 
          value( 
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_client_risk_rule_id, v_risk_item_id, 
              v_compli_trig_id, v_co_no, v_pd_no, v_exch_group_no, 
              v_order_dir, v_dime_id, v_stock_code_no, v_trig_stage_type, 
              v_compli_calc_level, v_unit_nav_flag, v_trig_type, v_compli_rules_remark, 
              v_risk_rule_action, v_risk_rule_type, v_risk_rule_value_str, v_risk_rule_calc_str, 
              v_remark_info, v_opor_no, v_pd_no_str);
          if v_error_code = "1" then
                      
              SET v_error_code = "rksecuA.4.6.1";
              SET v_error_info =  CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
              leave label_pro;
          end if;


          /* [检查正常返回][@风险采取行为# = 4] */
          if v_risk_rule_action = 4 then
              leave label_pro;
          end if;

       end if;
    end if;

    /* set @风险采取行为# = 0; */
    set v_risk_rule_action = 0;

    /* set @合规规则说明# = " "; */
    set v_compli_rules_remark = " ";
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_compli_rules_remark = v_compli_rules_remark;
    SET p_risk_rule_action = v_risk_rule_action;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_客户风险触警流水查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QuerySecuClientRiskTrig;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QuerySecuClientRiskTrig(
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
    

    /* set @交易组编号权限串# = concat(@交易组编号权限串#,"0;"); */
    set v_exch_group_no_rights_str = concat(v_exch_group_no_rights_str,"0;");

    /* [获取表记录][风控证券_风控_客户风险触警流水表][字段][{创建日期}=@创建日期# and {机构编号}=@机构编号# and ({风险采取行为}=@风险采取行为# or @风险采取行为# = " ") and ({风险规则类别}=@风险规则类别# or @风险规则类别# = 0) and case when @产品编号#=0 and @交易组编号#=0 THEN 1 when @产品编号#<>0 and @交易组编号#=0 THEN @产品编号# = {产品编号}  ELSE @交易组编号# = {交易组编号}  END and (@触发阶段类型# = 0 or {触发阶段类型} = @触发阶段类型#) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, client_risk_rule_id, 
        risk_item_id, compli_trig_id, co_no, pd_no, 
        exch_group_no, order_dir, dime_id, stock_code_no, 
        trig_stage_type, compli_calc_level, unit_nav_flag, trig_type, 
        compli_rules_remark, risk_rule_action, risk_rule_type, risk_rule_value_str, 
        risk_rule_calc_str, remark_info, opor_no, pd_no_str from db_rksecu.tbjour_rkserk_secu_client_risk_trig where create_date=v_create_date and co_no=v_co_no and (risk_rule_action=v_risk_rule_action or v_risk_rule_action = " ") and (risk_rule_type=v_risk_rule_type or v_risk_rule_type = 0) and case when v_pd_no=0 and v_exch_group_no=0 THEN 1 when v_pd_no<>0 and v_exch_group_no=0 THEN v_pd_no = pd_no  ELSE v_exch_group_no = exch_group_no  END and (v_trig_stage_type = 0 or trig_stage_type = v_trig_stage_type) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, client_risk_rule_id, 
        risk_item_id, compli_trig_id, co_no, pd_no, 
        exch_group_no, order_dir, dime_id, stock_code_no, 
        trig_stage_type, compli_calc_level, unit_nav_flag, trig_type, 
        compli_rules_remark, risk_rule_action, risk_rule_type, risk_rule_value_str, 
        risk_rule_calc_str, remark_info, opor_no, pd_no_str from db_rksecu.tbjour_rkserk_secu_client_risk_trig where create_date=v_create_date and co_no=v_co_no and (risk_rule_action=v_risk_rule_action or v_risk_rule_action = " ") and (risk_rule_type=v_risk_rule_type or v_risk_rule_type = 0) and case when v_pd_no=0 and v_exch_group_no=0 THEN 1 when v_pd_no<>0 and v_exch_group_no=0 THEN v_pd_no = pd_no  ELSE v_exch_group_no = exch_group_no  END and (v_trig_stage_type = 0 or trig_stage_type = v_trig_stage_type) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0)  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_风险要素值串拼接
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_JointRiskParamValueStr;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_JointRiskParamValueStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    INOUT p_risk_param_value_str varchar(1024),
    IN p_risk_rule_calc_str varchar(255),
    IN p_risk_param_str varchar(2048),
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
    IN p_trade_fee decimal(18,4),
    IN p_occur_amt decimal(18,4),
    IN p_occur_qty decimal(18,2),
    IN p_occur_market_value decimal(18,4),
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_cash_asset_flag int,
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
    declare v_risk_param_value_str varchar(1024);
    declare v_risk_rule_calc_str varchar(255);
    declare v_risk_param_str varchar(2048);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_occur_market_value decimal(18,4);
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_cash_asset_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
    declare v_tmp_risk_deal_str varchar(255);
    declare v_risk_deal_str varchar(255);
    declare v_posi_cost decimal(18,4);
    declare v_posi_market_value decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_risk_param_value_str = p_risk_param_value_str;
    SET v_risk_rule_calc_str = p_risk_rule_calc_str;
    SET v_risk_param_str = p_risk_param_str;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_all_fee = p_all_fee;
    SET v_trade_fee = p_trade_fee;
    SET v_occur_amt = p_occur_amt;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_market_value = p_occur_market_value;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_cash_asset_flag = p_cash_asset_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;
    SET v_tmp_risk_deal_str = " ";
    SET v_risk_deal_str = " ";
    SET v_posi_cost = 0;
    SET v_posi_market_value = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_计算_获取港股汇率】*/
    call db_rksecu.pra_rksecc_GetHKRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_buy_ref_rate,
        v_sell_ref_rate,
        v_settle_buy_rate,
        v_settle_sell_rate);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.4.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取港股汇率出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    loop_label:loop

      /* if @风险要素串# = " " then */
      if v_risk_param_str = " " then
        leave loop_label;
      end if;

      /* if @风险计算值串# = " " then */
      if v_risk_rule_calc_str = " " then

        /* set @临时_风控处理值串# = SUBSTR(@风险要素串#,1,INSTR(@风险要素串#,";")-1); */
        set v_tmp_risk_deal_str = SUBSTR(v_risk_param_str,1,INSTR(v_risk_param_str,";")-1);

        /* set @风险要素值串# = concat(@风险要素值串#,@临时_风控处理值串#,"=?;"); */
        set v_risk_param_value_str = concat(v_risk_param_value_str,v_tmp_risk_deal_str,"=?;");

        /* set  @风险要素串# = SUBSTR(@风险要素串#,INSTR(@风险要素串#,";")+1); */
        set  v_risk_param_str = SUBSTR(v_risk_param_str,INSTR(v_risk_param_str,";")+1);
      else

        /* set @风控处理值串# = SUBSTR(@风险计算值串#,1,INSTR(@风险计算值串#,";")-1); */
        set v_risk_deal_str = SUBSTR(v_risk_rule_calc_str,1,INSTR(v_risk_rule_calc_str,";")-1);

        /* set @临时_风控处理值串# = SUBSTR(@风险要素串#,1,INSTR(@风险要素串#,";")-1); */
        set v_tmp_risk_deal_str = SUBSTR(v_risk_param_str,1,INSTR(v_risk_param_str,";")-1);

        /* if instr(@临时_风控处理值串# ,"合计成本") > 0 then */
        if instr(v_tmp_risk_deal_str ,"合计成本") > 0 then

            /* if  @订单方向# = 《订单方向-买入》 then */
            if  v_order_dir = 1 then

                /* set @买入参考汇率# = @卖出参考汇率#; */
                set v_buy_ref_rate = v_sell_ref_rate;
            end if;

           /* set  @持仓成本# = @风控处理值串# +@变动金额#+  (case when @市场编号# = 3 or @市场编号# = 4 then (@交易费用#) * @买入参考汇率# else (@交易费用#) end); */
           set  v_posi_cost = v_risk_deal_str +v_occur_amt+  (case when v_exch_no = 3 or v_exch_no = 4 then (v_trade_fee) * v_buy_ref_rate else (v_trade_fee) end);

           /* set  @风控处理值串# = round(@持仓成本#,2); */
           set  v_risk_deal_str = round(v_posi_cost,2);

        /* elseif instr(@临时_风控处理值串# , "合计市值") > 0 or  instr(@临时_风控处理值串# , "同类证券总市值") > 0  then */
        elseif instr(v_tmp_risk_deal_str , "合计市值") > 0 or  instr(v_tmp_risk_deal_str , "同类证券总市值") > 0  then

           /* set @持仓市值#=cast(@风控处理值串# as decimal(18,4)); */
           set v_posi_market_value=cast(v_risk_deal_str as decimal(18,4));

           /* if @订单方向# =1 or @订单方向# =2 then */
           if v_order_dir =1 or v_order_dir =2 then

               /* set @买入参考汇率# = (@买入参考汇率#+@卖出参考汇率#)/2; */
               set v_buy_ref_rate = (v_buy_ref_rate+v_sell_ref_rate)/2;

               /* if @现金资产标志# = 2 then */
               if v_cash_asset_flag = 2 then

                   /* set  @持仓市值# = @持仓市值# - (case when @市场编号# = 3 or @市场编号# = 4 then @变动市值# * @买入参考汇率# else @变动市值# end); */
                   set  v_posi_market_value = v_posi_market_value - (case when v_exch_no = 3 or v_exch_no = 4 then v_occur_market_value * v_buy_ref_rate else v_occur_market_value end);
               else

                   /* set  @持仓市值# = @持仓市值# + (case when @市场编号# = 3 or @市场编号# = 4 then @变动市值# * @买入参考汇率# else @变动市值# end); */
                   set  v_posi_market_value = v_posi_market_value + (case when v_exch_no = 3 or v_exch_no = 4 then v_occur_market_value * v_buy_ref_rate else v_occur_market_value end);
               end if;

          /* elseif @订单方向# = 3 or @订单方向# = 4 then */
          elseif v_order_dir = 3 or v_order_dir = 4 then

             /* set  @持仓市值# = @持仓市值# + @订单数量# * 100; */
             set  v_posi_market_value = v_posi_market_value + v_order_qty * 100;
          end if;

          /* set  @风控处理值串# = round(@持仓市值#,2); */
          set  v_risk_deal_str = round(v_posi_market_value,2);
        end if;

        /* set @风险要素值串# = concat(@风险要素值串#,@临时_风控处理值串#,"=",@风控处理值串#,";"); */
        set v_risk_param_value_str = concat(v_risk_param_value_str,v_tmp_risk_deal_str,"=",v_risk_deal_str,";");

        /* set @风险计算值串# = SUBSTR(@风险计算值串#,INSTR(@风险计算值串#,";")+1); */
        set v_risk_rule_calc_str = SUBSTR(v_risk_rule_calc_str,INSTR(v_risk_rule_calc_str,";")+1);

        /* set  @风险要素串# = SUBSTR(@风险要素串#,INSTR(@风险要素串#,";")+1); */
        set  v_risk_param_str = SUBSTR(v_risk_param_str,INSTR(v_risk_param_str,";")+1);
      end if;
    end loop;
    END;

    SET p_risk_param_value_str = v_risk_param_value_str;
    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_模板查询客户产品交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QueryPdExchGroupByModel;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QueryPdExchGroupByModel(
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
    

    /* [获取表记录][风控证券_风控_客户风险规则表][ distinct {产品编号串},{交易组编号串}][{机构编号}=@机构编号# and {模板序号}=@模板序号# and (@风险规则类别串#=" " or instr(concat(";",@风险规则类别串#,";"), concat(";",{风险规则类别},";")) > 0) and  {条目模板标志} = 2 order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select  distinct pd_no_str,exch_group_no_str from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no=v_co_no and model_id=v_model_id and (v_risk_rule_type_str=" " or instr(concat(";",v_risk_rule_type_str,";"), concat(";",risk_rule_type,";")) > 0) and  templ_flag = 2 order by row_id;
    else
        select  distinct pd_no_str,exch_group_no_str from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no=v_co_no and model_id=v_model_id and (v_risk_rule_type_str=" " or instr(concat(";",v_risk_rule_type_str,";"), concat(";",risk_rule_type,";")) > 0) and  templ_flag = 2 order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_静态风险合规判断
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_HoldingRiskComplianceJudge;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_HoldingRiskComplianceJudge(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_client_risk_rule_id_str varchar(2048),
    IN p_compli_trig_id bigint,
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
    declare v_compli_trig_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_mach_time int;
    declare v_trig_stage_type int;
    declare v_row_id bigint;
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
    declare v_model_id bigint;
    declare v_risk_item_id int;
    declare v_compli_rules_remark varchar(255);
    declare v_risk_rule_id int;
    declare v_risk_rule_type int;
    declare v_risk_rule_name varchar(64);
    declare v_risk_rule_code varchar(2048);
    declare v_risk_param_str varchar(2048);
    declare v_union_flag int;
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
    declare v_client_risk_rule_id int;
    declare v_stock_code varchar(6);
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_exch_crncy_type varchar(3);
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
    SET v_client_risk_rule_id_str = p_client_risk_rule_id_str;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_trig_stage_type = 0;
    SET v_row_id = 0;
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
    SET v_model_id = 0;
    SET v_risk_item_id = 0;
    SET v_compli_rules_remark = " ";
    SET v_risk_rule_id = 0;
    SET v_risk_rule_type = 0;
    SET v_risk_rule_name = " ";
    SET v_risk_rule_code = " ";
    SET v_risk_param_str = " ";
    SET v_union_flag = 0;
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
    SET v_client_risk_rule_id = 0;
    SET v_stock_code = " ";
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_exch_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_all_fee = 0;
    SET v_risk_param_value_str = " ";

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @触发阶段类型# = 3; */
    set v_trig_stage_type = 3;

    /* [声明游标][风控证券_风控_客户风险规则表][字段][{机构编号} = @机构编号# and instr({触发阶段类型串}, @触发阶段类型#)>0  and {启用标志} = 《启用标志-启用》 and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end) and (instr(concat(";",@客户风险规则序号串#,";"),concat(";",{记录序号},";"))>0 or @客户风险规则序号串# = " ") and (({风险规则类别} = 2 and {联合标志} = 2) or ({风险规则类别} = 3 and {联合标志} = 2) or ({风险规则类别} = 4 and {联合标志} = 2) or {风险规则类别} = 5 or {风险规则类别} = 6)][cursor_rkserk_client_riskparam] */
    cursor_rkserk_client_riskparam:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_rkserk_client_riskparam CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no_str, exch_group_no_str, exch_no_str, order_dir_str, 
        dime_id, trig_stage_type_str, compli_calc_level, unit_nav_flag, 
        trig_type, model_id, risk_item_id, compli_rules_remark, 
        risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
        risk_param_str, union_flag, risk_rule_value_str1, risk_rule_action1, 
        risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
        risk_rule_value_str4, risk_rule_action4, corrsp_plug, begin_time, 
        end_time, rule_flag, templ_flag, compli_trig_result_type 
        from db_rksecu.tb_rkserk_secu_client_risk_rule 
        where co_no = v_co_no and instr(trig_stage_type_str, v_trig_stage_type)>0  and rule_flag = 1 and (case when begin_time>end_time then (v_mach_time between begin_time and 240000 or v_mach_time between 0 and end_time)  when end_time>begin_time then (v_mach_time between begin_time and end_time) else begin_time = end_time end) and (instr(concat(";",v_client_risk_rule_id_str,";"),concat(";",row_id,";"))>0 or v_client_risk_rule_id_str = " ") and ((risk_rule_type = 2 and union_flag = 2) or (risk_rule_type = 3 and union_flag = 2) or (risk_rule_type = 4 and union_flag = 2) or risk_rule_type = 5 or risk_rule_type = 6);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_rkserk_client_riskparam][loop_rkserk_client_riskparam] */
    open cursor_rkserk_client_riskparam;
    loop_rkserk_client_riskparam: LOOP
    fetch cursor_rkserk_client_riskparam into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no_str, v_exch_group_no_str, v_exch_no_str, v_order_dir_str, 
        v_dime_id, v_trig_stage_type_str, v_compli_calc_level, v_unit_nav_flag, 
        v_trig_type, v_model_id, v_risk_item_id, v_compli_rules_remark, 
        v_risk_rule_id, v_risk_rule_type, v_risk_rule_name, v_risk_rule_code, 
        v_risk_param_str, v_union_flag, v_risk_rule_value_str1, v_risk_rule_action1, 
        v_risk_rule_value_str2, v_risk_rule_action2, v_risk_rule_value_str3, v_risk_rule_action3, 
        v_risk_rule_value_str4, v_risk_rule_action4, v_corrsp_plug, v_begin_time, 
        v_end_time, v_rule_flag, v_templ_flag, v_compli_trig_result_type;
        IF v_cursor_done THEN
            LEAVE loop_rkserk_client_riskparam;
        END IF;


         /* if @交易组编号串# = "-1" then */
         if v_exch_group_no_str = "-1" then
               select GROUP_CONCAT(exch_group_no separator ';') into  v_exch_group_no_str from db_rksecu.tb_rksecc_exch_group_info where co_no=v_co_no and instr(concat(";",v_pd_no_str,";"), concat(";",pd_no,";")) > 0  and exch_group_status <> "3";
         end if;

         /* if (@风险规则类别# = 2 and @联合标志# = 2) or (@风险规则类别# = 3 and @联合标志# = 2) or (@风险规则类别# = 4 and @联合标志# = 2) then */
         if (v_risk_rule_type = 2 and v_union_flag = 2) or (v_risk_rule_type = 3 and v_union_flag = 2) or (v_risk_rule_type = 4 and v_union_flag = 2) then

              /* set @客户风险规则序号# =  @记录序号#; */
              set v_client_risk_rule_id =  v_row_id;

              /* [声明游标][风控证券_计算_交易组证券业务持仓表][{证券代码},{产品编号},{交易组编号},{市场编号}][{机构编号} = @机构编号# and {当前数量} - {成交占用数量} + {成交释放数量} <> 0 and {市场编号}<>5 and ((@合规计算层级# = 1 and {交易组编号}<>0 and  instr(concat(";",@交易组编号串#,";"), concat(";",{交易组编号},";")) > 0) or (@合规计算层级# = 2 and {交易组编号}=0 and (@产品编号串# = "-1" or instr(concat(";",@产品编号串#), concat(";",{产品编号},";")) > 0))) group by {证券代码},{市场编号}][cursor_rkserk_holding_position] */
              cursor_rkserk_holding_position:BEGIN
              DECLARE v_cursor_done int default false;
              DECLARE cursor_rkserk_holding_position CURSOR FOR
                  select stock_code,pd_no,exch_group_no,exch_no 
                  from db_rksecu.tb_rksecc_secu_exgp_posi 
                  where co_no = v_co_no and curr_qty - strike_capt_qty + strike_releas_qty <> 0 and exch_no<>5 and ((v_compli_calc_level = 1 and exch_group_no<>0 and  instr(concat(";",v_exch_group_no_str,";"), concat(";",exch_group_no,";")) > 0) or (v_compli_calc_level = 2 and exch_group_no=0 and (v_pd_no_str = "-1" or instr(concat(";",v_pd_no_str), concat(";",pd_no,";")) > 0))) group by stock_code,exch_no;
              DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


              /* [打开游标][@证券代码#,@产品编号#,@交易组编号#,@市场编号#][cursor_rkserk_holding_position][loop_rkserk_holding_position] */
              open cursor_rkserk_holding_position;
              loop_rkserk_holding_position: LOOP
              fetch cursor_rkserk_holding_position into v_stock_code,v_pd_no,v_exch_group_no,v_exch_no;
                  IF v_cursor_done THEN
                      LEAVE loop_rkserk_holding_position;
                  END IF;


                   /* set @交易币种# = "CNY"; */
                   set v_exch_crncy_type = "CNY";

                   /* set @订单价格# = 0; */
                   set v_order_price = 0;

                   /* set @订单数量# = 0; */
                   set v_order_qty = 0;

                   /* set @全部费用# = 0; */
                   set v_all_fee = 0;

                   /* set @触发阶段类型# = 3; */
                   set v_trig_stage_type = 3;

                   /* set @风险要素值串# = concat(";","证券代码=", @证券代码#, ";"); */
                   set v_risk_param_value_str = concat(";","证券代码=", v_stock_code, ";");

                   /* 调用【原子_风控证券_风控_静态检查客户风险】*/
                   call db_rksecu.pra_rkserk_CheckHoldingSecuClientRisk(
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
                       v_exch_crncy_type,
                       v_exch_no,
                       v_stock_code,
                       v_order_price,
                       v_order_qty,
                       v_all_fee,
                       v_trig_stage_type,
                       v_risk_param_value_str,
                       v_compli_trig_id,
                       v_client_risk_rule_id,
                       v_client_risk_rule_id_str,
                       v_error_code,
                       v_error_info);
                   if v_error_code = "1" then
                       SET v_error_code = "rksecuA.4.11.999";
                       if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_静态检查客户风险出现错误！',v_mysql_message);
                       end if;
                       close cursor_rkserk_holding_position;
                       leave label_pro;
                   elseif v_error_code <> "0" then
                       close cursor_rkserk_holding_position;
                       leave label_pro;
                   end if;


              /* [关闭游标][cursor_rkserk_holding_position] */
                  IF v_cursor_done THEN
                      set v_cursor_done = false;
                  END IF;
              END LOOP;
              close cursor_rkserk_holding_position;
              end cursor_rkserk_holding_position;


         /* elseif @风险规则类别# = 5 or @风险规则类别# = 6 then */
         elseif v_risk_rule_type = 5 or v_risk_rule_type = 6 then

              /* if @联合标志# = 1 then */
              if v_union_flag = 1 then

                   /* set @客户风险规则序号# =  @记录序号#; */
                   set v_client_risk_rule_id =  v_row_id;

                   /* [声明游标][风控证券_计算_交易组证券业务持仓表][{证券代码},{产品编号},{交易组编号},{市场编号}][{机构编号} = @机构编号# and {当前数量} - {成交占用数量} + {成交释放数量} <> 0 and {市场编号}<>5 and ((@合规计算层级# = 1 and {交易组编号}<>0 and (instr(concat(";",@交易组编号串#,";"), concat(";",{交易组编号},";")) > 0)) or (@合规计算层级# = 2 and {交易组编号}=0 and (@产品编号串# = "-1" or instr(concat(";",@产品编号串#), concat(";",{产品编号},";")) > 0))) group by {产品编号},{交易组编号}][cursor_rkserk_holding_position] */
                   cursor_rkserk_holding_position:BEGIN
                   DECLARE v_cursor_done int default false;
                   DECLARE cursor_rkserk_holding_position CURSOR FOR
                       select stock_code,pd_no,exch_group_no,exch_no 
                       from db_rksecu.tb_rksecc_secu_exgp_posi 
                       where co_no = v_co_no and curr_qty - strike_capt_qty + strike_releas_qty <> 0 and exch_no<>5 and ((v_compli_calc_level = 1 and exch_group_no<>0 and (instr(concat(";",v_exch_group_no_str,";"), concat(";",exch_group_no,";")) > 0)) or (v_compli_calc_level = 2 and exch_group_no=0 and (v_pd_no_str = "-1" or instr(concat(";",v_pd_no_str), concat(";",pd_no,";")) > 0))) group by pd_no,exch_group_no;
                   DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


                   /* [打开游标][@证券代码#,@产品编号#,@交易组编号#,@市场编号#][cursor_rkserk_holding_position][loop_rkserk_holding_position] */
                   open cursor_rkserk_holding_position;
                   loop_rkserk_holding_position: LOOP
                   fetch cursor_rkserk_holding_position into v_stock_code,v_pd_no,v_exch_group_no,v_exch_no;
                       IF v_cursor_done THEN
                           LEAVE loop_rkserk_holding_position;
                       END IF;


                        /* set @交易币种# = "CNY"; */
                        set v_exch_crncy_type = "CNY";

                        /* set @订单价格# = 0; */
                        set v_order_price = 0;

                        /* set @订单数量# = 0; */
                        set v_order_qty = 0;

                        /* set @全部费用# = 0; */
                        set v_all_fee = 0;

                        /* set @触发阶段类型# = 3; */
                        set v_trig_stage_type = 3;

                        /* set @风险要素值串# =  ";"; */
                        set v_risk_param_value_str =  ";";

                        /* 调用【原子_风控证券_风控_静态检查客户风险】*/
                        call db_rksecu.pra_rkserk_CheckHoldingSecuClientRisk(
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
                            v_exch_crncy_type,
                            v_exch_no,
                            v_stock_code,
                            v_order_price,
                            v_order_qty,
                            v_all_fee,
                            v_trig_stage_type,
                            v_risk_param_value_str,
                            v_compli_trig_id,
                            v_client_risk_rule_id,
                            v_client_risk_rule_id_str,
                            v_error_code,
                            v_error_info);
                        if v_error_code = "1" then
                            SET v_error_code = "rksecuA.4.11.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_静态检查客户风险出现错误！',v_mysql_message);
                            end if;
                            close cursor_rkserk_holding_position;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            close cursor_rkserk_holding_position;
                            leave label_pro;
                        end if;


                   /* [关闭游标][cursor_rkserk_holding_position] */
                       IF v_cursor_done THEN
                           set v_cursor_done = false;
                       END IF;
                   END LOOP;
                   close cursor_rkserk_holding_position;
                   end cursor_rkserk_holding_position;


              /* elseif @联合标志#=2 then */
              elseif v_union_flag=2 then

                   /* set @客户风险规则序号# =  @记录序号#; */
                   set v_client_risk_rule_id =  v_row_id;

                   /* [声明游标][风控证券_计算_交易组证券业务持仓表][{证券代码},{产品编号},{交易组编号},{市场编号}][{机构编号} = @机构编号# and {当前数量} - {成交占用数量} + {成交释放数量} <> 0 and {市场编号}<>5 and ((@合规计算层级# = 1 and {交易组编号}<>0 and (instr(concat(";",@交易组编号串#,";"), concat(";",{交易组编号},";")) > 0)) or (@合规计算层级# = 2 and {交易组编号}=0 and (@产品编号串# = "-1" or instr(concat(";",@产品编号串#), concat(";",{产品编号},";")) > 0))) group by {产品编号},{交易组编号}][cursor_rkserk_holding_position] */
                   cursor_rkserk_holding_position:BEGIN
                   DECLARE v_cursor_done int default false;
                   DECLARE cursor_rkserk_holding_position CURSOR FOR
                       select stock_code,pd_no,exch_group_no,exch_no 
                       from db_rksecu.tb_rksecc_secu_exgp_posi 
                       where co_no = v_co_no and curr_qty - strike_capt_qty + strike_releas_qty <> 0 and exch_no<>5 and ((v_compli_calc_level = 1 and exch_group_no<>0 and (instr(concat(";",v_exch_group_no_str,";"), concat(";",exch_group_no,";")) > 0)) or (v_compli_calc_level = 2 and exch_group_no=0 and (v_pd_no_str = "-1" or instr(concat(";",v_pd_no_str), concat(";",pd_no,";")) > 0))) group by pd_no,exch_group_no;
                   DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


                   /* [打开游标][@证券代码#,@产品编号#,@交易组编号#,@市场编号#][cursor_rkserk_holding_position][loop_rkserk_holding_position] */
                   open cursor_rkserk_holding_position;
                   loop_rkserk_holding_position: LOOP
                   fetch cursor_rkserk_holding_position into v_stock_code,v_pd_no,v_exch_group_no,v_exch_no;
                       IF v_cursor_done THEN
                           LEAVE loop_rkserk_holding_position;
                       END IF;


                        /* set @交易币种# = "CNY"; */
                        set v_exch_crncy_type = "CNY";

                        /* set @订单价格# = 0; */
                        set v_order_price = 0;

                        /* set @订单数量# = 0; */
                        set v_order_qty = 0;

                        /* set @全部费用# = 0; */
                        set v_all_fee = 0;

                        /* set @触发阶段类型# = 3; */
                        set v_trig_stage_type = 3;

                        /* set @风险要素值串# = ";"; */
                        set v_risk_param_value_str = ";";

                        /* 调用【原子_风控证券_风控_静态检查客户风险】*/
                        call db_rksecu.pra_rkserk_CheckHoldingSecuClientRisk(
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
                            v_exch_crncy_type,
                            v_exch_no,
                            v_stock_code,
                            v_order_price,
                            v_order_qty,
                            v_all_fee,
                            v_trig_stage_type,
                            v_risk_param_value_str,
                            v_compli_trig_id,
                            v_client_risk_rule_id,
                            v_client_risk_rule_id_str,
                            v_error_code,
                            v_error_info);
                        if v_error_code = "1" then
                            SET v_error_code = "rksecuA.4.11.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_静态检查客户风险出现错误！',v_mysql_message);
                            end if;
                            close cursor_rkserk_holding_position;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            close cursor_rkserk_holding_position;
                            leave label_pro;
                        end if;

                        LEAVE  loop_rkserk_holding_position;

                   /* [关闭游标][cursor_rkserk_holding_position] */
                       IF v_cursor_done THEN
                           set v_cursor_done = false;
                       END IF;
                   END LOOP;
                   close cursor_rkserk_holding_position;
                   end cursor_rkserk_holding_position;

              end if;
         end if;

    /* [关闭游标][cursor_rkserk_client_riskparam] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_rkserk_client_riskparam;
    end cursor_rkserk_client_riskparam;


    /* [声明游标][风控证券_计算_交易组证券业务持仓表][{证券代码},{产品编号},{交易组编号},{市场编号}][{机构编号} = @机构编号# and {当前数量} - {成交占用数量} + {成交释放数量} <> 0 and {市场编号}<>5][cursor_rkserk_holding_position] */
    cursor_rkserk_holding_position:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_rkserk_holding_position CURSOR FOR
        select stock_code,pd_no,exch_group_no,exch_no 
        from db_rksecu.tb_rksecc_secu_exgp_posi 
        where co_no = v_co_no and curr_qty - strike_capt_qty + strike_releas_qty <> 0 and exch_no<>5;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@证券代码#,@产品编号#,@交易组编号#,@市场编号#][cursor_rkserk_holding_position][loop_rkserk_holding_position] */
    open cursor_rkserk_holding_position;
    loop_rkserk_holding_position: LOOP
    fetch cursor_rkserk_holding_position into v_stock_code,v_pd_no,v_exch_group_no,v_exch_no;
        IF v_cursor_done THEN
            LEAVE loop_rkserk_holding_position;
        END IF;


      /* set @交易币种# = "CNY"; */
      set v_exch_crncy_type = "CNY";

      /* set @订单价格# = 0; */
      set v_order_price = 0;

      /* set @订单数量# = 0; */
      set v_order_qty = 0;

      /* set @全部费用# = 0; */
      set v_all_fee = 0;

      /* set @触发阶段类型# = 3; */
      set v_trig_stage_type = 3;

      /* set @风险要素值串# = concat(";","证券代码=", @证券代码#, ";"); */
      set v_risk_param_value_str = concat(";","证券代码=", v_stock_code, ";");

      /* set @客户风险规则序号# =  0; */
      set v_client_risk_rule_id =  0;

      /* 调用【原子_风控证券_风控_静态检查客户风险】*/
      call db_rksecu.pra_rkserk_CheckHoldingSecuClientRisk(
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
          v_exch_crncy_type,
          v_exch_no,
          v_stock_code,
          v_order_price,
          v_order_qty,
          v_all_fee,
          v_trig_stage_type,
          v_risk_param_value_str,
          v_compli_trig_id,
          v_client_risk_rule_id,
          v_client_risk_rule_id_str,
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "rksecuA.4.11.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_静态检查客户风险出现错误！',v_mysql_message);
          end if;
          close cursor_rkserk_holding_position;
          leave label_pro;
      elseif v_error_code <> "0" then
          close cursor_rkserk_holding_position;
          leave label_pro;
      end if;


    /* [关闭游标][cursor_rkserk_holding_position] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_rkserk_holding_position;
    end cursor_rkserk_holding_position;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_试算检查客户风险
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_CheckCalcSecuClientRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_CheckCalcSecuClientRisk(
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
    IN p_trig_stage_type int,
    IN p_risk_param_value_str varchar(1024),
    IN p_compli_trig_id bigint,
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
    declare v_trig_stage_type int;
    declare v_risk_param_value_str varchar(1024);
    declare v_compli_trig_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_mach_time int;
    declare v_risk_pre_flag int;
    declare v_tmp_risk_param_value_str varchar(1024);
    declare v_row_id bigint;
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
    declare v_model_id bigint;
    declare v_risk_item_id int;
    declare v_compli_rules_remark varchar(255);
    declare v_risk_rule_id int;
    declare v_risk_rule_type int;
    declare v_risk_rule_name varchar(64);
    declare v_risk_rule_code varchar(2048);
    declare v_risk_param_str varchar(2048);
    declare v_union_flag int;
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
    declare v_client_risk_rule_id int;
    declare v_risk_rule_calc_str varchar(255);
    declare v_record_count int;
    declare v_stock_code_no int;
    declare v_cash_asset_flag int;
    declare v_remark_info varchar(255);
    declare v_risk_rule_action varchar(32);
    declare v_risk_rule_value_str varchar(255);
    declare v_tmp_exch_no int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
    declare v_trade_fee decimal(18,4);
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_trade_amt decimal(18,4);
    declare v_evalu_price decimal(16,9);
    declare v_occur_market_value decimal(18,4);
    declare v_per_secu_cost_amt decimal(18,4);
    declare v_per_secu_market_value decimal(18,4);
    declare v_trade_qty decimal(18,2);
    declare v_risk_splice_str varchar(255);
    declare v_risk_loop_count int;
    declare v_tmp_risk_rule_code varchar(2048);
    declare v_tmp_risk_rule_action varchar(32);
    declare v_risk_param_value varchar(255);
    declare v_target_risk_param varchar(255);
    declare v_tmp_risk_rule_value_str varchar(255);
    declare v_risk_deal_str varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_risk_param_value_str = p_risk_param_value_str;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_risk_pre_flag = 0;
    SET v_tmp_risk_param_value_str = " ";
    SET v_row_id = 0;
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
    SET v_model_id = 0;
    SET v_risk_item_id = 0;
    SET v_compli_rules_remark = " ";
    SET v_risk_rule_id = 0;
    SET v_risk_rule_type = 0;
    SET v_risk_rule_name = " ";
    SET v_risk_rule_code = " ";
    SET v_risk_param_str = " ";
    SET v_union_flag = 0;
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
    SET v_client_risk_rule_id = 0;
    SET v_risk_rule_calc_str = " ";
    SET v_record_count = 0;
    SET v_stock_code_no = 0;
    SET v_cash_asset_flag = 0;
    SET v_remark_info = " ";
    SET v_risk_rule_action = " ";
    SET v_risk_rule_value_str = " ";
    SET v_tmp_exch_no = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;
    SET v_trade_fee = 0;
    SET v_occur_amt = 0;
    SET v_occur_qty = 0;
    SET v_trade_amt = 0;
    SET v_evalu_price = 0;
    SET v_occur_market_value = 0;
    SET v_per_secu_cost_amt = 0;
    SET v_per_secu_market_value = 0;
    SET v_trade_qty = 0;
    SET v_risk_splice_str = " ";
    SET v_risk_loop_count = 0;
    SET v_tmp_risk_rule_code = " ";
    SET v_tmp_risk_rule_action = " ";
    SET v_risk_param_value = " ";
    SET v_target_risk_param = " ";
    SET v_tmp_risk_rule_value_str = " ";
    SET v_risk_deal_str = " ";

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @风控允许标志# = -1; */
    set v_risk_pre_flag = -1;

    /* set @临时_风险要素值串# = @风险要素值串#; */
    set v_tmp_risk_param_value_str = v_risk_param_value_str;
    #先检查所有白名单

    /* [声明游标][风控证券_风控_客户风险规则表][字段][{机构编号} = @机构编号# and instr({风险要素串},"白名单")>0 and instr({触发阶段类型串}, @触发阶段类型#)>0 and (instr(concat(";",{产品编号串}), concat(";",@产品编号#,";")) > 0 or {产品编号串} = "-1") and (instr(concat(";",{交易组编号串}), concat(";",@交易组编号#,";")) > 0 or {交易组编号串}=" " or {交易组编号串} = "-1")   and (@订单方向# = 0 or instr(concat(";",{订单方向串}), concat(";",@订单方向#,";")) > 0) and {启用标志} = 《启用标志-启用》 and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end)][white_cursor_rkserk_client_riskparam] */
    white_cursor_rkserk_client_riskparam:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE white_cursor_rkserk_client_riskparam CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no_str, exch_group_no_str, exch_no_str, order_dir_str, 
        dime_id, trig_stage_type_str, compli_calc_level, unit_nav_flag, 
        trig_type, model_id, risk_item_id, compli_rules_remark, 
        risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
        risk_param_str, union_flag, risk_rule_value_str1, risk_rule_action1, 
        risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
        risk_rule_value_str4, risk_rule_action4, corrsp_plug, begin_time, 
        end_time, rule_flag, templ_flag, compli_trig_result_type 
        from db_rksecu.tb_rkserk_secu_client_risk_rule 
        where co_no = v_co_no and instr(risk_param_str,"白名单")>0 and instr(trig_stage_type_str, v_trig_stage_type)>0 and (instr(concat(";",pd_no_str), concat(";",v_pd_no,";")) > 0 or pd_no_str = "-1") and (instr(concat(";",exch_group_no_str), concat(";",v_exch_group_no,";")) > 0 or exch_group_no_str=" " or exch_group_no_str = "-1")   and (v_order_dir = 0 or instr(concat(";",order_dir_str), concat(";",v_order_dir,";")) > 0) and rule_flag = 1 and (case when begin_time>end_time then (v_mach_time between begin_time and 240000 or v_mach_time between 0 and end_time)  when end_time>begin_time then (v_mach_time between begin_time and end_time) else begin_time = end_time end);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][white_cursor_rkserk_client_riskparam][white_loop_rkserk_client_riskparam] */
    open white_cursor_rkserk_client_riskparam;
    white_loop_rkserk_client_riskparam: LOOP
    fetch white_cursor_rkserk_client_riskparam into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no_str, v_exch_group_no_str, v_exch_no_str, v_order_dir_str, 
        v_dime_id, v_trig_stage_type_str, v_compli_calc_level, v_unit_nav_flag, 
        v_trig_type, v_model_id, v_risk_item_id, v_compli_rules_remark, 
        v_risk_rule_id, v_risk_rule_type, v_risk_rule_name, v_risk_rule_code, 
        v_risk_param_str, v_union_flag, v_risk_rule_value_str1, v_risk_rule_action1, 
        v_risk_rule_value_str2, v_risk_rule_action2, v_risk_rule_value_str3, v_risk_rule_action3, 
        v_risk_rule_value_str4, v_risk_rule_action4, v_corrsp_plug, v_begin_time, 
        v_end_time, v_rule_flag, v_templ_flag, v_compli_trig_result_type;
        IF v_cursor_done THEN
            LEAVE white_loop_rkserk_client_riskparam;
        END IF;

       #检查风控是否计算完成

       /* set @客户风险规则序号# =  @记录序号#; */
       set v_client_risk_rule_id =  v_row_id;

       /* 调用【原子_风控证券_风控_获取对应风控计算值】*/
       call db_rksecu.pra_rkserk_GetCalcResult(
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
           v_trig_stage_type,
           v_client_risk_rule_id,
           v_error_code,
           v_error_info,
           v_risk_rule_calc_str,
           v_pd_no_str,
           v_exch_group_no_str);
       if v_error_code = "1" then
           SET v_error_code = "rksecuA.4.12.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取对应风控计算值出现错误！',v_mysql_message);
           end if;
           close white_cursor_rkserk_client_riskparam;
           leave label_pro;
       elseif v_error_code <> "0" then
           close white_cursor_rkserk_client_riskparam;
           leave label_pro;
       end if;


       /* [检查报错返回][@风险计算值串# = " "][910][@客户风险规则序号#] */
       if v_risk_rule_calc_str = " " then
           
           SET v_error_code = "rksecuA.4.12.910";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
           else
               SET v_error_info = concat("客户风险规则序号=",v_client_risk_rule_id);
           end if;
           close white_cursor_rkserk_client_riskparam;
           leave label_pro;
       end if;

       #判断证券代码是否在维度范围内

      /* 调用【原子_风控证券_维度_维度序号获取范围】*/
      call db_rksecu.pra_rksedm_GetRangeByDimeId(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_dime_id,
          v_exch_no,
          v_stock_code,
          v_order_dir,
          v_trig_type,
          v_error_code,
          v_error_info,
          v_record_count,
          v_stock_code_no,
          v_cash_asset_flag);
      if v_error_code = "1" then
          SET v_error_code = "rksecuA.4.12.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_维度_维度序号获取范围出现错误！',v_mysql_message);
          end if;
          close white_cursor_rkserk_client_riskparam;
          leave label_pro;
      elseif v_error_code <> "0" then
          close white_cursor_rkserk_client_riskparam;
          leave label_pro;
      end if;


      /* if @记录个数# = 0 then */
      if v_record_count = 0 then

             /* set @风控允许标志# = 0; */
             set v_risk_pre_flag = 0;
             ITERATE  white_loop_rkserk_client_riskparam;
      else

             /* set @风控允许标志# = 1; */
             set v_risk_pre_flag = 1;
             LEAVE  white_loop_rkserk_client_riskparam;
      end if;

    /* [关闭游标][white_cursor_rkserk_client_riskparam] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close white_cursor_rkserk_client_riskparam;
    end white_cursor_rkserk_client_riskparam;

    #白名单需要循环后检查

    /* if @风控允许标志# =0 then */
    if v_risk_pre_flag =0 then

        /* [获取表记录变量语句][风控证券_风控_客户风险规则表][字段][字段变量][{机构编号} = @机构编号# and instr({触发阶段类型串}, @触发阶段类型#)>0 and (instr(concat(";",{产品编号串}), concat(";",@产品编号#,";")) > 0 or {产品编号串} = "-1") and (instr(concat(";",{交易组编号串}), concat(";",@交易组编号#,";")) > 0 or {交易组编号串}=" " or {交易组编号串} = "-1") and (@订单方向# = 0 or instr(concat(";",{订单方向串}), concat(";",@订单方向#,";")) > 0) and {启用标志} = 《启用标志-启用》 and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end) and instr({风险要素串},"白名单")>0] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no_str, exch_group_no_str, exch_no_str, order_dir_str, 
            dime_id, trig_stage_type_str, compli_calc_level, unit_nav_flag, 
            trig_type, model_id, risk_item_id, compli_rules_remark, 
            risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
            risk_param_str, union_flag, risk_rule_value_str1, risk_rule_action1, 
            risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
            risk_rule_value_str4, risk_rule_action4, corrsp_plug, begin_time, 
            end_time, rule_flag, templ_flag, compli_trig_result_type into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_co_no, 
            v_pd_no_str, v_exch_group_no_str, v_exch_no_str, v_order_dir_str, 
            v_dime_id, v_trig_stage_type_str, v_compli_calc_level, v_unit_nav_flag, 
            v_trig_type, v_model_id, v_risk_item_id, v_compli_rules_remark, 
            v_risk_rule_id, v_risk_rule_type, v_risk_rule_name, v_risk_rule_code, 
            v_risk_param_str, v_union_flag, v_risk_rule_value_str1, v_risk_rule_action1, 
            v_risk_rule_value_str2, v_risk_rule_action2, v_risk_rule_value_str3, v_risk_rule_action3, 
            v_risk_rule_value_str4, v_risk_rule_action4, v_corrsp_plug, v_begin_time, 
            v_end_time, v_rule_flag, v_templ_flag, v_compli_trig_result_type from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no = v_co_no and instr(trig_stage_type_str, v_trig_stage_type)>0 and (instr(concat(";",pd_no_str), concat(";",v_pd_no,";")) > 0 or pd_no_str = "-1") and (instr(concat(";",exch_group_no_str), concat(";",v_exch_group_no,";")) > 0 or exch_group_no_str=" " or exch_group_no_str = "-1") and (v_order_dir = 0 or instr(concat(";",order_dir_str), concat(";",v_order_dir,";")) > 0) and rule_flag = 1 and (case when begin_time>end_time then (v_mach_time between begin_time and 240000 or v_mach_time between 0 and end_time)  when end_time>begin_time then (v_mach_time between begin_time and end_time) else begin_time = end_time end) and instr(risk_param_str,"白名单")>0 limit 1;

        if found_rows() > 0 then

          /* set @备注信息# = concat( "风险试算触警! |" ,@合规规则说明# ," |证券代码",@证券代码#,"不在白名单内!"); */
          set v_remark_info = concat( "风险试算触警! |" ,v_compli_rules_remark ," |证券代码",v_stock_code,"不在白名单内!");

          /* set @合规触发结果# = 1; */
          set v_compli_trig_result_type = 1;

          /* set @客户风险规则序号# = @记录序号#; */
          set v_client_risk_rule_id = v_row_id;

          /* set @风险计算值串# = concat("0",substr(@风险计算值串#,2)); */
          set v_risk_rule_calc_str = concat("0",substr(v_risk_rule_calc_str,2));

          /* set @风险采取行为# = @风险采取行为1#; */
          set v_risk_rule_action = v_risk_rule_action1;

          /* set @风险规则值串# = @风险规则值串1#; */
          set v_risk_rule_value_str = v_risk_rule_value_str1;

          /* set @产品编号串# = concat(@产品编号#,";"); */
          set v_pd_no_str = concat(v_pd_no,";");

          /* if @合规计算层级# = 《合规计算层级-交易组级》 then */
          if v_compli_calc_level = 1 then

            /* set @产品编号串# = concat(@交易组编号#,";"); */
            set v_pd_no_str = concat(v_exch_group_no,";");
          end if;

          /* [插入表记录][风控证券_风控_客户风险触警流水表][字段][字段变量][1][@客户风险规则序号#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_rksecu.tbjour_rkserk_secu_client_risk_trig(
              create_date, create_time, update_date, 
              update_time, update_times, client_risk_rule_id, risk_item_id, 
              compli_trig_id, co_no, pd_no, exch_group_no, 
              order_dir, dime_id, stock_code_no, trig_stage_type, 
              compli_calc_level, unit_nav_flag, trig_type, compli_rules_remark, 
              risk_rule_action, risk_rule_type, risk_rule_value_str, risk_rule_calc_str, 
              remark_info, opor_no, pd_no_str) 
          value( 
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_client_risk_rule_id, v_risk_item_id, 
              v_compli_trig_id, v_co_no, v_pd_no, v_exch_group_no, 
              v_order_dir, v_dime_id, v_stock_code_no, v_trig_stage_type, 
              v_compli_calc_level, v_unit_nav_flag, v_trig_type, v_compli_rules_remark, 
              v_risk_rule_action, v_risk_rule_type, v_risk_rule_value_str, v_risk_rule_calc_str, 
              v_remark_info, v_opor_no, v_pd_no_str);
          if v_error_code = "1" then
                      
              SET v_error_code = "rksecuA.4.12.1";
              SET v_error_info =  CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
              leave label_pro;
          end if;

        end if;
    end if;

    /* if @风控允许标志# !=0 then */
    if v_risk_pre_flag !=0 then

    /* set @临时_市场编号# = @市场编号#; */
    set v_tmp_exch_no = v_exch_no;

    /* set @市场编号# = 3; */
    set v_exch_no = 3;

    /* 调用【原子_风控证券_计算_获取港股汇率】*/
    call db_rksecu.pra_rksecc_GetHKRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_buy_ref_rate,
        v_sell_ref_rate,
        v_settle_buy_rate,
        v_settle_sell_rate);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.4.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取港股汇率出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if  @订单方向# = 《订单方向-买入》 then */
    if  v_order_dir = 1 then

      /* set @买入参考汇率# = @卖出参考汇率#; */
      set v_buy_ref_rate = v_sell_ref_rate;
    end if;

    /* set @市场编号# = @临时_市场编号#; */
    set v_exch_no = v_tmp_exch_no;

    /* set @交易费用# = @全部费用#; */
    set v_trade_fee = v_all_fee;

    /* if @订单方向# = 31 then */
    if v_order_dir = 31 then

        /* set @订单方向# = 2; */
        set v_order_dir = 2;
    end if;

    /* if @订单方向# = 1 then */
    if v_order_dir = 1 then

      /* set @变动金额# = @订单价格# * @订单数量#; */
      set v_occur_amt = v_order_price * v_order_qty;

      /* set @变动数量# = @订单数量#; */
      set v_occur_qty = v_order_qty;

    /* elseif @订单方向# = 2 then */
    elseif v_order_dir = 2 then

      /* set @变动金额# = -1 * @订单价格# * @订单数量#; */
      set v_occur_amt = -1 * v_order_price * v_order_qty;

      /* set @变动数量# = -1 * @订单数量#; */
      set v_occur_qty = -1 * v_order_qty;
    else

      /* set @变动金额# = 0; */
      set v_occur_amt = 0;

      /* set @变动数量# = 0; */
      set v_occur_qty = 0;
    end if;

    /* set @交易金额# = @订单价格# * @订单数量# *  (case when @市场编号# = 3 or @市场编号# = 4 then @买入参考汇率# else 1 end); */
    set v_trade_amt = v_order_price * v_order_qty *  (case when v_exch_no = 3 or v_exch_no = 4 then v_buy_ref_rate else 1 end);

    /* set @变动金额# = @变动金额# * (case when @市场编号# = 3 or @市场编号# = 4 then @买入参考汇率# else 1 end); */
    set v_occur_amt = v_occur_amt * (case when v_exch_no = 3 or v_exch_no = 4 then v_buy_ref_rate else 1 end);

    /* 调用【原子_风控证券_计算_获取证券估值价格】*/
    call db_rksecu.pra_rksecc_GetStockValuationPrice(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_evalu_price);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.4.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券估值价格出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @变动市值# =  @变动数量# * @估值价格#; */
    set v_occur_market_value =  v_occur_qty * v_evalu_price;

    /* set @单券成本# = @变动金额# + @全部费用#  * (case when @市场编号# = 3 or @市场编号# = 4 then @买入参考汇率# else 1 end); */
    set v_per_secu_cost_amt = v_occur_amt + v_all_fee  * (case when v_exch_no = 3 or v_exch_no = 4 then v_buy_ref_rate else 1 end);

    /* set @单券市值# = @变动市值#; */
    set v_per_secu_market_value = v_occur_market_value;

    /* set @交易数量# = @变动数量#; */
    set v_trade_qty = v_occur_qty;

    /* [声明游标][风控证券_风控_客户风险规则表][字段][{机构编号} = @机构编号# and instr({风险要素串},"白名单")<=0 and instr({触发阶段类型串}, @触发阶段类型#)>0 and (instr(concat(";",{产品编号串}), concat(";",@产品编号#,";")) > 0 or {产品编号串} = "-1") and (instr(concat(";",{交易组编号串}), concat(";",@交易组编号#,";")) > 0 or {交易组编号串}=" " or {交易组编号串} = "-1")   and (@订单方向# = 0 or instr(concat(";",{订单方向串}), concat(";",@订单方向#,";")) > 0) and {启用标志} = 《启用标志-启用》 and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end)][cursor_rkserk_client_riskparam] */
    cursor_rkserk_client_riskparam:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_rkserk_client_riskparam CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no_str, exch_group_no_str, exch_no_str, order_dir_str, 
        dime_id, trig_stage_type_str, compli_calc_level, unit_nav_flag, 
        trig_type, model_id, risk_item_id, compli_rules_remark, 
        risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
        risk_param_str, union_flag, risk_rule_value_str1, risk_rule_action1, 
        risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
        risk_rule_value_str4, risk_rule_action4, corrsp_plug, begin_time, 
        end_time, rule_flag, templ_flag, compli_trig_result_type 
        from db_rksecu.tb_rkserk_secu_client_risk_rule 
        where co_no = v_co_no and instr(risk_param_str,"白名单")<=0 and instr(trig_stage_type_str, v_trig_stage_type)>0 and (instr(concat(";",pd_no_str), concat(";",v_pd_no,";")) > 0 or pd_no_str = "-1") and (instr(concat(";",exch_group_no_str), concat(";",v_exch_group_no,";")) > 0 or exch_group_no_str=" " or exch_group_no_str = "-1")   and (v_order_dir = 0 or instr(concat(";",order_dir_str), concat(";",v_order_dir,";")) > 0) and rule_flag = 1 and (case when begin_time>end_time then (v_mach_time between begin_time and 240000 or v_mach_time between 0 and end_time)  when end_time>begin_time then (v_mach_time between begin_time and end_time) else begin_time = end_time end);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_rkserk_client_riskparam][loop_rkserk_client_riskparam] */
    open cursor_rkserk_client_riskparam;
    loop_rkserk_client_riskparam: LOOP
    fetch cursor_rkserk_client_riskparam into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no_str, v_exch_group_no_str, v_exch_no_str, v_order_dir_str, 
        v_dime_id, v_trig_stage_type_str, v_compli_calc_level, v_unit_nav_flag, 
        v_trig_type, v_model_id, v_risk_item_id, v_compli_rules_remark, 
        v_risk_rule_id, v_risk_rule_type, v_risk_rule_name, v_risk_rule_code, 
        v_risk_param_str, v_union_flag, v_risk_rule_value_str1, v_risk_rule_action1, 
        v_risk_rule_value_str2, v_risk_rule_action2, v_risk_rule_value_str3, v_risk_rule_action3, 
        v_risk_rule_value_str4, v_risk_rule_action4, v_corrsp_plug, v_begin_time, 
        v_end_time, v_rule_flag, v_templ_flag, v_compli_trig_result_type;
        IF v_cursor_done THEN
            LEAVE loop_rkserk_client_riskparam;
        END IF;

       #检查风控是否计算完成

       /* set @客户风险规则序号# =  @记录序号#; */
       set v_client_risk_rule_id =  v_row_id;

       /* 调用【原子_风控证券_风控_获取对应风控计算值】*/
       call db_rksecu.pra_rkserk_GetCalcResult(
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
           v_trig_stage_type,
           v_client_risk_rule_id,
           v_error_code,
           v_error_info,
           v_risk_rule_calc_str,
           v_pd_no_str,
           v_exch_group_no_str);
       if v_error_code = "1" then
           SET v_error_code = "rksecuA.4.12.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取对应风控计算值出现错误！',v_mysql_message);
           end if;
           close cursor_rkserk_client_riskparam;
           leave label_pro;
       elseif v_error_code <> "0" then
           close cursor_rkserk_client_riskparam;
           leave label_pro;
       end if;


       /* [检查报错返回][@风险计算值串# = " "][910][@客户风险规则序号#] */
       if v_risk_rule_calc_str = " " then
           
           SET v_error_code = "rksecuA.4.12.910";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
           else
               SET v_error_info = concat("客户风险规则序号=",v_client_risk_rule_id);
           end if;
           close cursor_rkserk_client_riskparam;
           leave label_pro;
       end if;

       #判断证券代码是否在维度范围内

      /* 调用【原子_风控证券_维度_维度序号获取范围】*/
      call db_rksecu.pra_rksedm_GetRangeByDimeId(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_dime_id,
          v_exch_no,
          v_stock_code,
          v_order_dir,
          v_trig_type,
          v_error_code,
          v_error_info,
          v_record_count,
          v_stock_code_no,
          v_cash_asset_flag);
      if v_error_code = "1" then
          SET v_error_code = "rksecuA.4.12.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_维度_维度序号获取范围出现错误！',v_mysql_message);
          end if;
          close cursor_rkserk_client_riskparam;
          leave label_pro;
      elseif v_error_code <> "0" then
          close cursor_rkserk_client_riskparam;
          leave label_pro;
      end if;


      /* if @记录个数# = 0 then */
      if v_record_count = 0 then
        ITERATE  loop_rkserk_client_riskparam;
      else
         #判断是否存在并发情况
        #[原子_风控证券_风控_获取交易流水记录]

        /* set @风控拼接值串# = @风险要素串#; */
        set v_risk_splice_str = v_risk_param_str;

        /* set @风险要素值串# = @临时_风险要素值串#; */
        set v_risk_param_value_str = v_tmp_risk_param_value_str;

        /* 调用【原子_风控证券_风控_风险要素值串拼接】*/
        call db_rksecu.pra_rkserk_JointRiskParamValueStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_risk_param_value_str,
            v_risk_rule_calc_str,
            v_risk_param_str,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_all_fee,
            v_trade_fee,
            v_occur_amt,
            v_occur_qty,
            v_occur_market_value,
            v_stock_code,
            v_exch_no,
            v_cash_asset_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_风险要素值串拼接出现错误！',v_mysql_message);
            end if;
            close cursor_rkserk_client_riskparam;
            leave label_pro;
        elseif v_error_code <> "0" then
            close cursor_rkserk_client_riskparam;
            leave label_pro;
        end if;


        /* set @风控循环次数# = 0; */
        set v_risk_loop_count = 0;

        /* set @合规触发结果# = 0; */
        set v_compli_trig_result_type = 0;

        /* set @临时_风险规则代码# = @风险规则代码#; */
        set v_tmp_risk_rule_code = v_risk_rule_code;

        /* set @临时_风险采取行为# = 0; */
        set v_tmp_risk_rule_action = 0;

        /* set @风险要素值# = 0; */
        set v_risk_param_value = 0;
        #循环截取风险规则代码中的风险要素，从风险要素串中获得值，并替换
          loop_label:loop

            /* if instr(@风险规则代码#, "[") > 0 and instr(@风险规则代码#, "]") > 0 then */
            if instr(v_risk_rule_code, "[") > 0 and instr(v_risk_rule_code, "]") > 0 then

                /* if instr(@风险规则代码#, "]") - instr(@风险规则代码#, "[") - 1 > 0 then */
                if instr(v_risk_rule_code, "]") - instr(v_risk_rule_code, "[") - 1 > 0 then

                    /* set @目标风险要素# = trim(substring(@风险规则代码#, instr(@风险规则代码#, "[") + 1, instr(@风险规则代码#, "]") - instr(@风险规则代码#, "[") - 1)); */
                    set v_target_risk_param = trim(substring(v_risk_rule_code, instr(v_risk_rule_code, "[") + 1, instr(v_risk_rule_code, "]") - instr(v_risk_rule_code, "[") - 1));
                else

                    /* [报错不回滚][905][@风险规则代码#] */
                        SET v_error_code = "rksecuA.4.12.905";
                        SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
                        close cursor_rkserk_client_riskparam;
                        leave label_pro;

                    leave loop_label;
                end if;
                #如果目标风险要素是n，表明是参数值宏代码

                /* if @目标风险要素# = "n" then */
                if v_target_risk_param = "n" then
                    #替换风险规则代码中第一个[n]宏代码

                    /* set @风险规则代码# = replace(@风险规则代码#, "[n]", "?" ); */
                    set v_risk_rule_code = replace(v_risk_rule_code, "[n]", "?" );
               else
                    #检查传入的风险要素值串中是否包含目标风险要素，包含直接取值，不包含则认为是需要计算

                    /* if instr(@风险要素值串#, concat(";", @目标风险要素#, "=?")) > 0 then */
                    if instr(v_risk_param_value_str, concat(";", v_target_risk_param, "=?")) > 0 then

                        /* 调用【原子_风控证券_风控_获取计算风险要素值】*/
                        call db_rksecu.pra_rkserk_GetFutuCaclRiskParamValue(
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
                            v_exch_no,
                            v_stock_code,
                            v_stock_code_no,
                            v_order_dir,
                            v_order_qty,
                            v_order_price,
                            v_all_fee,
                            v_trig_type,
                            v_trig_stage_type,
                            v_compli_calc_level,
                            v_risk_param_str,
                            v_target_risk_param,
                            v_risk_param_value,
                            v_per_secu_cost_amt,
                            v_per_secu_market_value,
                            v_trade_qty,
                            v_trade_amt,
                            v_error_code,
                            v_error_info,
                            v_evalu_price);
                        if v_error_code = "1" then
                            SET v_error_code = "rksecuA.4.12.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取计算风险要素值出现错误！',v_mysql_message);
                            end if;
                            close cursor_rkserk_client_riskparam;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            close cursor_rkserk_client_riskparam;
                            leave label_pro;
                        end if;

                    else

                        /* 调用【原子_风控证券_风控_获取基础风险要素值】*/
                        call db_rksecu.pra_rkserk_GetSecuBaseRiskParamValue(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_risk_param_value_str,
                            v_target_risk_param,
                            v_error_code,
                            v_error_info,
                            v_risk_param_value);
                        if v_error_code = "1" then
                            SET v_error_code = "rksecuA.4.12.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取基础风险要素值出现错误！',v_mysql_message);
                            end if;
                            close cursor_rkserk_client_riskparam;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            close cursor_rkserk_client_riskparam;
                            leave label_pro;
                        end if;

                    end if;
                    #替换风控拼接值串中的对应风险要素

                    /* set @风控拼接值串# = replace(@风控拼接值串#,@目标风险要素#,@风险要素值#); */
                    set v_risk_splice_str = replace(v_risk_splice_str,v_target_risk_param,v_risk_param_value);
                    #替换风险规则代码中相应的风险要素宏代码

                    /* if instr(@风险规则代码#, concat("[", @目标风险要素#, "]")) > 0 then */
                    if instr(v_risk_rule_code, concat("[", v_target_risk_param, "]")) > 0 then

                          /* set @风险规则代码# = replace(@风险规则代码#, concat("[", @目标风险要素#, "]"), @风险要素值# ); */
                          set v_risk_rule_code = replace(v_risk_rule_code, concat("[", v_target_risk_param, "]"), v_risk_param_value );
                    end if;
                end if;
            else

                /* if instr(@风险规则代码#, "[") > 0 or instr(@风险规则代码#, "]") > 0 then */
                if instr(v_risk_rule_code, "[") > 0 or instr(v_risk_rule_code, "]") > 0 then

                    /* [报错不回滚][905][@风险规则代码#] */
                        SET v_error_code = "rksecuA.4.12.905";
                        SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
                        close cursor_rkserk_client_riskparam;
                        leave label_pro;

                end if;
                leave loop_label;
              end if;
          end loop loop_label ;

        /* set @临时_风险规则代码# = @风险规则代码#; */
        set v_tmp_risk_rule_code = v_risk_rule_code;
        loop_rule_value:loop
          #循环4次判断是否满足预警条件

          /* set @风控循环次数# = @风控循环次数# + 1; */
          set v_risk_loop_count = v_risk_loop_count + 1;

          /* if @风控循环次数# = 1 then */
          if v_risk_loop_count = 1 then

             /* set @风险规则值串# =  @风险规则值串1#; */
             set v_risk_rule_value_str =  v_risk_rule_value_str1;

             /* set @风险采取行为# =  @风险采取行为1#; */
             set v_risk_rule_action =  v_risk_rule_action1;

          /* elseif @风控循环次数# = 2 then */
          elseif v_risk_loop_count = 2 then

             /* set @风险规则值串# =  @风险规则值串2#; */
             set v_risk_rule_value_str =  v_risk_rule_value_str2;

             /* set @风险采取行为# =  @风险采取行为2#; */
             set v_risk_rule_action =  v_risk_rule_action2;

          /* elseif @风控循环次数# = 3 then */
          elseif v_risk_loop_count = 3 then

             /* set @风险规则值串# =  @风险规则值串3#; */
             set v_risk_rule_value_str =  v_risk_rule_value_str3;

             /* set @风险采取行为# =  @风险采取行为3#; */
             set v_risk_rule_action =  v_risk_rule_action3;

          /* elseif @风控循环次数# = 4 then */
          elseif v_risk_loop_count = 4 then

             /* set @风险规则值串# =  @风险规则值串4#; */
             set v_risk_rule_value_str =  v_risk_rule_value_str4;

             /* set @风险采取行为# =  @风险采取行为4#; */
             set v_risk_rule_action =  v_risk_rule_action4;
          else
             leave loop_rule_value;
          end if;

          /* if @风险采取行为# = " "  then */
          if v_risk_rule_action = " "  then
            ITERATE loop_rule_value;
          end if;

          /* if right(@风险规则值串#, 1) <> ";" and @风险规则值串# <> " " then */
          if right(v_risk_rule_value_str, 1) <> ";" and v_risk_rule_value_str <> " " then

            /* set @风险规则值串# = concat(@风险规则值串#, ";"); */
            set v_risk_rule_value_str = concat(v_risk_rule_value_str, ";");
          end if;

          /* set @风险规则代码# = @临时_风险规则代码#; */
          set v_risk_rule_code = v_tmp_risk_rule_code;

          /* set @临时_风险规则值串# = @风险规则值串#; */
          set v_tmp_risk_rule_value_str = v_risk_rule_value_str;
          loop_label2:loop

            /* if instr(@风险规则代码#, "?") > 0 then */
            if instr(v_risk_rule_code, "?") > 0 then

                    /* set @风险要素值# = left(@风险规则值串#, instr(@风险规则值串#, ";") - 1); */
                    set v_risk_param_value = left(v_risk_rule_value_str, instr(v_risk_rule_value_str, ";") - 1);

                    /* set @风险规则值串# = substring(@风险规则值串#, instr(@风险规则值串#, ";") + 1); */
                    set v_risk_rule_value_str = substring(v_risk_rule_value_str, instr(v_risk_rule_value_str, ";") + 1);
                    #替换风险规则代码中第一个?

                    /* set @风险规则代码# = concat(left(@风险规则代码#, instr(@风险规则代码#, "?") - 1), @风险要素值#, substring(@风险规则代码#, instr(@风险规则代码#, "?") + 1)); */
                    set v_risk_rule_code = concat(left(v_risk_rule_code, instr(v_risk_rule_code, "?") - 1), v_risk_param_value, substring(v_risk_rule_code, instr(v_risk_rule_code, "?") + 1));
            else
                    leave loop_label2;
            end if;
          end loop loop_label2 ;
            #如果风险规则代码替换完成，则检查代码中是否还有宏，如果没有宏，则执行，否则报错

          /* if instr(@风险规则代码#, "[") > 0 or instr(@风险规则代码#, "]") > 0 then */
          if instr(v_risk_rule_code, "[") > 0 or instr(v_risk_rule_code, "]") > 0 then

             /* [报错不回滚][905][@风险规则代码#] */
                 SET v_error_code = "rksecuA.4.12.905";
                 SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
                 close cursor_rkserk_client_riskparam;
                 leave label_pro;

          else

            /* set @风险计算值串# = @风控拼接值串#; */
            set v_risk_rule_calc_str = v_risk_splice_str;
            set @v_result_value = 0;
            #执行风险规则代码，如果为1，则报错返回，风险限制

            /* [执行语句返回值][@风险规则代码#][@返回值#] */
            set @tmp_sql = concat("select ", v_risk_rule_code, " into @v_result_value");
            PREPARE stmt from @tmp_sql;
            EXECUTE stmt;
            set @tmp_sql = '';
            DEALLOCATE PREPARE stmt;


            /* if  instr(@风险要素串#,"白名单;")>0 then */
            if  instr(v_risk_param_str,"白名单;")>0 then

               /* set @风控允许标志# =1; */
               set v_risk_pre_flag =1;
               set @v_result_value = 0;
            end if;
            #取同条客户规则最大风险采取行为
            if @v_result_value = 1 then

              /* set @合规触发结果# = 1; */
              set v_compli_trig_result_type = 1;

              /* if @风险采取行为# > @临时_风险采取行为#  then */
              if v_risk_rule_action > v_tmp_risk_rule_action  then

                /* set @风控处理值串# = @临时_风险规则值串#; */
                set v_risk_deal_str = v_tmp_risk_rule_value_str;

                /* set @临时_风险采取行为# = @风险采取行为#; */
                set v_tmp_risk_rule_action = v_risk_rule_action;
              end if;
            end if;
          end if;
        end loop loop_rule_value;
        #将触发结果计入流水表

        /* if @合规触发结果# = 1 then */
        if v_compli_trig_result_type = 1 then

          /* set @风险规则值串# = @风控处理值串#; */
          set v_risk_rule_value_str = v_risk_deal_str;

          /* set @风险采取行为# = @临时_风险采取行为#; */
          set v_risk_rule_action = v_tmp_risk_rule_action;

          /* set @风险规则代码# = @临时_风险规则代码#; */
          set v_risk_rule_code = v_tmp_risk_rule_code;

          /* set @客户风险规则序号# = @记录序号#; */
          set v_client_risk_rule_id = v_row_id;

          /* set @风险要素值串# = @临时_风险要素值串#; */
          set v_risk_param_value_str = v_tmp_risk_param_value_str;

          /* 调用【原子_风控证券_风控_风险要素值串替换】*/
          call db_rksecu.pra_rkserk_ReplaceRiskParamValueStr(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_risk_param_value_str,
              v_risk_rule_calc_str,
              v_risk_param_str,
              v_risk_rule_name,
              v_trig_type,
              v_risk_rule_value_str,
              v_unit_nav_flag,
              v_risk_rule_code,
              v_error_code,
              v_error_info);
          if v_error_code = "1" then
              SET v_error_code = "rksecuA.4.12.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_风险要素值串替换出现错误！',v_mysql_message);
              end if;
              close cursor_rkserk_client_riskparam;
              leave label_pro;
          elseif v_error_code <> "0" then
              close cursor_rkserk_client_riskparam;
              leave label_pro;
          end if;


          /* if instr(@风险规则名称#,"单证券市值")>0 then */
          if instr(v_risk_rule_name,"单证券市值")>0 then

               /* set @风险要素值串# = concat(@风险要素值串#,"订单数量=",round(@订单数量#,2),";最新价=",round(@估值价格#,2)); */
               set v_risk_param_value_str = concat(v_risk_param_value_str,"订单数量=",round(v_order_qty,2),";最新价=",round(v_evalu_price,2));
          end if;

          /* if instr(@风险要素串#,"黑名单;")>0 then */
          if instr(v_risk_param_str,"黑名单;")>0 then

             /* set @风险要素值串# = concat("证券代码",@证券代码#,"在黑名单范围内!"); */
             set v_risk_param_value_str = concat("证券代码",v_stock_code,"在黑名单范围内!");

          /* elseif instr(@风险要素串#,"日内对敲")>0 or instr(@风险要素串#,"日内反向")>0 or instr(@风险要素串#,"挂单对敲")>0 or instr(@风险要素串#,"挂单反向")>0 then */
          elseif instr(v_risk_param_str,"日内对敲")>0 or instr(v_risk_param_str,"日内反向")>0 or instr(v_risk_param_str,"挂单对敲")>0 or instr(v_risk_param_str,"挂单反向")>0 then

             /* set @风险要素值串# = concat("证券代码",@证券代码#,"触发反向交易",@风险规则名称#,"!"); */
             set v_risk_param_value_str = concat("证券代码",v_stock_code,"触发反向交易",v_risk_rule_name,"!");
          end if;

          /* set @备注信息# = concat( "风险试算触警!",@合规规则说明#,"|",@风险要素值串#); */
          set v_remark_info = concat( "风险试算触警!",v_compli_rules_remark,"|",v_risk_param_value_str);

          /* if @合规计算层级# = 《合规计算层级-交易组级》 then */
          if v_compli_calc_level = 1 then

            /* set @产品编号串# = @交易组编号串#; */
            set v_pd_no_str = v_exch_group_no_str;
          end if;

          /* [插入表记录][风控证券_风控_客户风险触警流水表][字段][字段变量][1][@客户风险规则序号#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_rksecu.tbjour_rkserk_secu_client_risk_trig(
              create_date, create_time, update_date, 
              update_time, update_times, client_risk_rule_id, risk_item_id, 
              compli_trig_id, co_no, pd_no, exch_group_no, 
              order_dir, dime_id, stock_code_no, trig_stage_type, 
              compli_calc_level, unit_nav_flag, trig_type, compli_rules_remark, 
              risk_rule_action, risk_rule_type, risk_rule_value_str, risk_rule_calc_str, 
              remark_info, opor_no, pd_no_str) 
          value( 
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_client_risk_rule_id, v_risk_item_id, 
              v_compli_trig_id, v_co_no, v_pd_no, v_exch_group_no, 
              v_order_dir, v_dime_id, v_stock_code_no, v_trig_stage_type, 
              v_compli_calc_level, v_unit_nav_flag, v_trig_type, v_compli_rules_remark, 
              v_risk_rule_action, v_risk_rule_type, v_risk_rule_value_str, v_risk_rule_calc_str, 
              v_remark_info, v_opor_no, v_pd_no_str);
          if v_error_code = "1" then
                      
              SET v_error_code = "rksecuA.4.12.1";
              SET v_error_info =  CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
              close cursor_rkserk_client_riskparam;
              leave label_pro;
          end if;

         #此处缺少退出风控规则循环语句

            /* if  @风险采取行为# = 4 then */
            if  v_risk_rule_action = 4 then
                   LEAVE  loop_rkserk_client_riskparam;
           end if;
        end if;
      end if;

    /* [关闭游标][cursor_rkserk_client_riskparam] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_rkserk_client_riskparam;
    end cursor_rkserk_client_riskparam;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_静态检查客户风险
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_CheckHoldingSecuClientRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_CheckHoldingSecuClientRisk(
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
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
    IN p_trig_stage_type int,
    IN p_risk_param_value_str varchar(1024),
    IN p_compli_trig_id bigint,
    IN p_client_risk_rule_id int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_trig_stage_type int;
    declare v_risk_param_value_str varchar(1024);
    declare v_compli_trig_id bigint;
    declare v_client_risk_rule_id int;
    declare v_client_risk_rule_id_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_mach_time int;
    declare v_risk_pre_flag int;
    declare v_tmp_risk_param_value_str varchar(1024);
    declare v_tmp_client_risk_rule_id int;
    declare v_row_id bigint;
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
    declare v_model_id bigint;
    declare v_risk_item_id int;
    declare v_compli_rules_remark varchar(255);
    declare v_risk_rule_id int;
    declare v_risk_rule_type int;
    declare v_risk_rule_name varchar(64);
    declare v_risk_rule_code varchar(2048);
    declare v_risk_param_str varchar(2048);
    declare v_union_flag int;
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
    declare v_order_dir int;
    declare v_risk_rule_calc_str varchar(255);
    declare v_record_count int;
    declare v_stock_code_no int;
    declare v_cash_asset_flag int;
    declare v_trade_fee decimal(18,4);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_evalu_price decimal(16,9);
    declare v_occur_market_value decimal(18,4);
    declare v_per_secu_cost_amt decimal(18,4);
    declare v_per_secu_market_value decimal(18,4);
    declare v_trade_qty decimal(18,2);
    declare v_trade_amt decimal(18,4);
    declare v_risk_splice_str varchar(255);
    declare v_risk_loop_count int;
    declare v_tmp_risk_rule_code varchar(2048);
    declare v_tmp_risk_rule_action varchar(32);
    declare v_risk_rule_value_str varchar(255);
    declare v_risk_rule_action varchar(32);
    declare v_tmp_risk_rule_value_str varchar(255);
    declare v_target_risk_param varchar(255);
    declare v_risk_param_value varchar(255);
    declare v_risk_deal_str varchar(255);
    declare v_remark_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_all_fee = p_all_fee;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_risk_param_value_str = p_risk_param_value_str;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_client_risk_rule_id = p_client_risk_rule_id;
    SET v_client_risk_rule_id_str = p_client_risk_rule_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_risk_pre_flag = 0;
    SET v_tmp_risk_param_value_str = " ";
    SET v_tmp_client_risk_rule_id = 0;
    SET v_row_id = 0;
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
    SET v_model_id = 0;
    SET v_risk_item_id = 0;
    SET v_compli_rules_remark = " ";
    SET v_risk_rule_id = 0;
    SET v_risk_rule_type = 0;
    SET v_risk_rule_name = " ";
    SET v_risk_rule_code = " ";
    SET v_risk_param_str = " ";
    SET v_union_flag = 0;
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
    SET v_order_dir = 0;
    SET v_risk_rule_calc_str = " ";
    SET v_record_count = 0;
    SET v_stock_code_no = 0;
    SET v_cash_asset_flag = 0;
    SET v_trade_fee = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;
    SET v_occur_amt = 0;
    SET v_occur_qty = 0;
    SET v_evalu_price = 0;
    SET v_occur_market_value = 0;
    SET v_per_secu_cost_amt = 0;
    SET v_per_secu_market_value = 0;
    SET v_trade_qty = 0;
    SET v_trade_amt = 0;
    SET v_risk_splice_str = " ";
    SET v_risk_loop_count = 0;
    SET v_tmp_risk_rule_code = " ";
    SET v_tmp_risk_rule_action = " ";
    SET v_risk_rule_value_str = " ";
    SET v_risk_rule_action = " ";
    SET v_tmp_risk_rule_value_str = " ";
    SET v_target_risk_param = " ";
    SET v_risk_param_value = " ";
    SET v_risk_deal_str = " ";
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @风控允许标志# = -1; */
    set v_risk_pre_flag = -1;

    /* set @临时_风险要素值串# = @风险要素值串#; */
    set v_tmp_risk_param_value_str = v_risk_param_value_str;

    /* set @临时_客户风险规则序号# = @客户风险规则序号#; */
    set v_tmp_client_risk_rule_id = v_client_risk_rule_id;

    /* [声明游标][风控证券_风控_客户风险规则表][字段][(@客户风险规则序号# <> 0 and {记录序号}=@客户风险规则序号#) or ({机构编号} = @机构编号# and instr({触发阶段类型串}, @触发阶段类型#)>0 and (instr(concat(";",{产品编号串}), concat(";",@产品编号#,";")) > 0 or {产品编号串} = "-1") and (instr(concat(";",{交易组编号串}), concat(";",@交易组编号#,";")) > 0 or ({交易组编号串}=" " and @交易组编号# = 0) or {交易组编号串} = "-1") ) and {启用标志} = 《启用标志-启用》 and (instr(concat(";",@客户风险规则序号串#,";"),concat(";",{记录序号},";"))>0 or @客户风险规则序号串# = " ") and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end) ][cursor_rkserk_client_riskparam] */
    cursor_rkserk_client_riskparam:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_rkserk_client_riskparam CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no_str, exch_group_no_str, exch_no_str, order_dir_str, 
        dime_id, trig_stage_type_str, compli_calc_level, unit_nav_flag, 
        trig_type, model_id, risk_item_id, compli_rules_remark, 
        risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
        risk_param_str, union_flag, risk_rule_value_str1, risk_rule_action1, 
        risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
        risk_rule_value_str4, risk_rule_action4, corrsp_plug, begin_time, 
        end_time, rule_flag, templ_flag, compli_trig_result_type 
        from db_rksecu.tb_rkserk_secu_client_risk_rule 
        where (v_client_risk_rule_id <> 0 and row_id=v_client_risk_rule_id) or (co_no = v_co_no and instr(trig_stage_type_str, v_trig_stage_type)>0 and (instr(concat(";",pd_no_str), concat(";",v_pd_no,";")) > 0 or pd_no_str = "-1") and (instr(concat(";",exch_group_no_str), concat(";",v_exch_group_no,";")) > 0 or (exch_group_no_str=" " and v_exch_group_no = 0) or exch_group_no_str = "-1") ) and rule_flag = 1 and (instr(concat(";",v_client_risk_rule_id_str,";"),concat(";",row_id,";"))>0 or v_client_risk_rule_id_str = " ") and (case when begin_time>end_time then (v_mach_time between begin_time and 240000 or v_mach_time between 0 and end_time)  when end_time>begin_time then (v_mach_time between begin_time and end_time) else begin_time = end_time end) ;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;

    #[声明游标][风控证券_风控_客户风险规则表][字段][case when @客户风险规则序号# <> 0 then ({记录序号}=@客户风险规则序号# and {启用标志} = 《启用标志-启用》 and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end) ) else ({机构编号} = @机构编号# and instr({触发阶段类型串}, @触发阶段类型#)>0 and (instr(concat(";",{产品编号串}), concat(";",@产品编号#,";")) > 0 or {产品编号串} = "-1") and (instr(concat(";",{交易组编号串}), concat(";",@交易组编号#,";")) > 0 or ({交易组编号串}=" " and @交易组编号# = 0) or {交易组编号串} = "-1")  and {启用标志} = 《启用标志-启用》 and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end) and (instr(@客户风险规则序号串#,concat(";",{记录序号},";"))>0 or @客户风险规则序号串# = " ")) end][cursor_rkserk_client_riskparam]

    /* [打开游标][字段变量][cursor_rkserk_client_riskparam][loop_rkserk_client_riskparam] */
    open cursor_rkserk_client_riskparam;
    loop_rkserk_client_riskparam: LOOP
    fetch cursor_rkserk_client_riskparam into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no_str, v_exch_group_no_str, v_exch_no_str, v_order_dir_str, 
        v_dime_id, v_trig_stage_type_str, v_compli_calc_level, v_unit_nav_flag, 
        v_trig_type, v_model_id, v_risk_item_id, v_compli_rules_remark, 
        v_risk_rule_id, v_risk_rule_type, v_risk_rule_name, v_risk_rule_code, 
        v_risk_param_str, v_union_flag, v_risk_rule_value_str1, v_risk_rule_action1, 
        v_risk_rule_value_str2, v_risk_rule_action2, v_risk_rule_value_str3, v_risk_rule_action3, 
        v_risk_rule_value_str4, v_risk_rule_action4, v_corrsp_plug, v_begin_time, 
        v_end_time, v_rule_flag, v_templ_flag, v_compli_trig_result_type;
        IF v_cursor_done THEN
            LEAVE loop_rkserk_client_riskparam;
        END IF;


       /* if @临时_客户风险规则序号# <> 0 and @临时_客户风险规则序号# <> @记录序号# then */
       if v_tmp_client_risk_rule_id <> 0 and v_tmp_client_risk_rule_id <> v_row_id then
            ITERATE  loop_rkserk_client_riskparam;
       end if;

        /* if （@交易组编号# = 0 and @合规计算层级# = 《合规计算层级-交易组级》)  or (@交易组编号# <> 0 and @合规计算层级# = 《合规计算层级-产品级》)then */
        if (v_exch_group_no = 0 and v_compli_calc_level = 1)  or (v_exch_group_no <> 0 and v_compli_calc_level = 2)then
            ITERATE  loop_rkserk_client_riskparam;
        end if;

         /* if @临时_客户风险规则序号# = 0 and ((@风险规则类别# = 2 and @联合标志# = 2) or (@风险规则类别# = 3 and @联合标志# = 2) or (@风险规则类别# = 4 and @联合标志# = 2) or @风险规则类别# = 5  or @风险规则类别# = 6)  then */
         if v_tmp_client_risk_rule_id = 0 and ((v_risk_rule_type = 2 and v_union_flag = 2) or (v_risk_rule_type = 3 and v_union_flag = 2) or (v_risk_rule_type = 4 and v_union_flag = 2) or v_risk_rule_type = 5  or v_risk_rule_type = 6)  then
            ITERATE  loop_rkserk_client_riskparam;
        end if;

       /* set @订单方向# = 0; */
       set v_order_dir = 0;

       /* set @客户风险规则序号# =  @记录序号#; */
       set v_client_risk_rule_id =  v_row_id;

       /* 调用【原子_风控证券_风控_获取对应风控计算值】*/
       call db_rksecu.pra_rkserk_GetCalcResult(
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
           v_trig_stage_type,
           v_client_risk_rule_id,
           v_error_code,
           v_error_info,
           v_risk_rule_calc_str,
           v_pd_no_str,
           v_exch_group_no_str);
       if v_error_code = "1" then
           SET v_error_code = "rksecuA.4.13.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取对应风控计算值出现错误！',v_mysql_message);
           end if;
           close cursor_rkserk_client_riskparam;
           leave label_pro;
       elseif v_error_code <> "0" then
           close cursor_rkserk_client_riskparam;
           leave label_pro;
       end if;


       /* [检查报错返回][@风险计算值串# = " "][910][@风险计算值串#] */
       if v_risk_rule_calc_str = " " then
           
           SET v_error_code = "rksecuA.4.13.910";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("风险计算值串=",v_risk_rule_calc_str),"#",v_mysql_message);
           else
               SET v_error_info = concat("风险计算值串=",v_risk_rule_calc_str);
           end if;
           close cursor_rkserk_client_riskparam;
           leave label_pro;
       end if;

        #判断证券代码是否在维度范围内

      /* 调用【原子_风控证券_维度_维度序号获取范围】*/
      call db_rksecu.pra_rksedm_GetRangeByDimeId(
          v_opor_co_no,
          v_opor_no,
          v_oper_mac,
          v_oper_ip_addr,
          v_oper_info,
          v_oper_way,
          v_func_code,
          v_co_no,
          v_dime_id,
          v_exch_no,
          v_stock_code,
          v_order_dir,
          v_trig_type,
          v_error_code,
          v_error_info,
          v_record_count,
          v_stock_code_no,
          v_cash_asset_flag);
      if v_error_code = "1" then
          SET v_error_code = "rksecuA.4.13.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_维度_维度序号获取范围出现错误！',v_mysql_message);
          end if;
          close cursor_rkserk_client_riskparam;
          leave label_pro;
      elseif v_error_code <> "0" then
          close cursor_rkserk_client_riskparam;
          leave label_pro;
      end if;


      /* if @记录个数# = 0  then */
      if v_record_count = 0  then

          /* if instr(@风险要素串#,"白名单;")>0 then */
          if instr(v_risk_param_str,"白名单;")>0 then

              /* if @风控允许标志# <> 1 then */
              if v_risk_pre_flag <> 1 then

                 /* set @风控允许标志# = 0; */
                 set v_risk_pre_flag = 0;
              end if;
         end if;
        ITERATE  loop_rkserk_client_riskparam;
      else

        /* set @交易费用# = @全部费用#; */
        set v_trade_fee = v_all_fee;

        /* 调用【原子_风控证券_计算_获取港股汇率】*/
        call db_rksecu.pra_rksecc_GetHKRate(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_error_code,
            v_error_info,
            v_buy_ref_rate,
            v_sell_ref_rate,
            v_settle_buy_rate,
            v_settle_sell_rate);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取港股汇率出现错误！',v_mysql_message);
            end if;
            close cursor_rkserk_client_riskparam;
            leave label_pro;
        elseif v_error_code <> "0" then
            close cursor_rkserk_client_riskparam;
            leave label_pro;
        end if;


        /* set @变动金额# = ( case when @订单方向#= 1  then @订单数量# when @订单方向# = 2  then -1 * @订单数量# else 0 end)* @订单价格# * (case when @市场编号# = 3 or @市场编号# = 4 then @买入结算汇率# else 1 end); */
        set v_occur_amt = ( case when v_order_dir= 1  then v_order_qty when v_order_dir = 2  then -1 * v_order_qty else 0 end)* v_order_price * (case when v_exch_no = 3 or v_exch_no = 4 then v_settle_buy_rate else 1 end);

        /* set @变动数量# = ( case when @订单方向#= 1  then @订单数量# when @订单方向# = 2  then -1 * @订单数量# else 0 end); */
        set v_occur_qty = ( case when v_order_dir= 1  then v_order_qty when v_order_dir = 2  then -1 * v_order_qty else 0 end);

        /* 调用【原子_风控证券_计算_获取证券估值价格】*/
        call db_rksecu.pra_rksecc_GetStockValuationPrice(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_error_code,
            v_error_info,
            v_evalu_price);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券估值价格出现错误！',v_mysql_message);
            end if;
            close cursor_rkserk_client_riskparam;
            leave label_pro;
        elseif v_error_code <> "0" then
            close cursor_rkserk_client_riskparam;
            leave label_pro;
        end if;


        /* set @变动市值# = ( case when @订单方向#= 1  then @订单数量# when @订单方向# = 2  then -1 * @订单数量# else 0 end) * @估值价格#; */
        set v_occur_market_value = ( case when v_order_dir= 1  then v_order_qty when v_order_dir = 2  then -1 * v_order_qty else 0 end) * v_evalu_price;

        /* set @单券成本# = @变动金额# + @交易费用# * (case when @市场编号# = 3 or @市场编号# = 4 then @买入结算汇率# else 1 end); */
        set v_per_secu_cost_amt = v_occur_amt + v_trade_fee * (case when v_exch_no = 3 or v_exch_no = 4 then v_settle_buy_rate else 1 end);

        /* set @单券市值# = @变动市值#; */
        set v_per_secu_market_value = v_occur_market_value;

        /* set @交易数量# = @变动数量#; */
        set v_trade_qty = v_occur_qty;

        /* set @交易金额# = @订单数量# * @订单价格#; */
        set v_trade_amt = v_order_qty * v_order_price;

        /* set @风控拼接值串# = @风险要素串#; */
        set v_risk_splice_str = v_risk_param_str;

        /* set @风险要素值串# = @临时_风险要素值串#; */
        set v_risk_param_value_str = v_tmp_risk_param_value_str;

        /* 调用【原子_风控证券_风控_风险要素值串拼接】*/
        call db_rksecu.pra_rkserk_JointRiskParamValueStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_risk_param_value_str,
            v_risk_rule_calc_str,
            v_risk_param_str,
            v_order_dir,
            v_order_price,
            v_order_qty,
            v_all_fee,
            v_trade_fee,
            v_occur_amt,
            v_occur_qty,
            v_occur_market_value,
            v_stock_code,
            v_exch_no,
            v_cash_asset_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_风险要素值串拼接出现错误！',v_mysql_message);
            end if;
            close cursor_rkserk_client_riskparam;
            leave label_pro;
        elseif v_error_code <> "0" then
            close cursor_rkserk_client_riskparam;
            leave label_pro;
        end if;


        /* set @风控循环次数# = 0; */
        set v_risk_loop_count = 0;

        /* set @合规触发结果# = 0; */
        set v_compli_trig_result_type = 0;

        /* set @临时_风险规则代码# = @风险规则代码#; */
        set v_tmp_risk_rule_code = v_risk_rule_code;

        /* set @临时_风险采取行为# = 0; */
        set v_tmp_risk_rule_action = 0;
        loop_rule_value:loop
          #循环4次判断是否满足预警条件

          /* set @风控循环次数# = @风控循环次数# + 1; */
          set v_risk_loop_count = v_risk_loop_count + 1;

          /* if @风控循环次数# = 1 then */
          if v_risk_loop_count = 1 then

             /* set @风险规则值串# =  @风险规则值串1#; */
             set v_risk_rule_value_str =  v_risk_rule_value_str1;

             /* set @风险采取行为# =  @风险采取行为1#; */
             set v_risk_rule_action =  v_risk_rule_action1;

          /* elseif @风控循环次数# = 2 then */
          elseif v_risk_loop_count = 2 then

             /* set @风险规则值串# =  @风险规则值串2#; */
             set v_risk_rule_value_str =  v_risk_rule_value_str2;

             /* set @风险采取行为# =  @风险采取行为2#; */
             set v_risk_rule_action =  v_risk_rule_action2;

          /* elseif @风控循环次数# = 3 then */
          elseif v_risk_loop_count = 3 then

             /* set @风险规则值串# =  @风险规则值串3#; */
             set v_risk_rule_value_str =  v_risk_rule_value_str3;

             /* set @风险采取行为# =  @风险采取行为3#; */
             set v_risk_rule_action =  v_risk_rule_action3;

          /* elseif @风控循环次数# = 4 then */
          elseif v_risk_loop_count = 4 then

             /* set @风险规则值串# =  @风险规则值串4#; */
             set v_risk_rule_value_str =  v_risk_rule_value_str4;

             /* set @风险采取行为# =  @风险采取行为4#; */
             set v_risk_rule_action =  v_risk_rule_action4;
          else
             leave loop_rule_value;
          end if;

          /* if @风险采取行为# = " "  then */
          if v_risk_rule_action = " "  then
            ITERATE loop_rule_value;
          end if;

          /* if right(@风险规则值串#, 1) <> ";" and @风险规则值串# <> " " then */
          if right(v_risk_rule_value_str, 1) <> ";" and v_risk_rule_value_str <> " " then

            /* set @风险规则值串# = concat(@风险规则值串#, ";"); */
            set v_risk_rule_value_str = concat(v_risk_rule_value_str, ";");
          end if;

          /* set @风险规则代码# = @临时_风险规则代码#; */
          set v_risk_rule_code = v_tmp_risk_rule_code;

          /* set @临时_风险规则值串# = @风险规则值串#; */
          set v_tmp_risk_rule_value_str = v_risk_rule_value_str;
        #循环截取风险规则代码中的风险要素，从风险要素串中获得值，并替换
          loop_label:loop

            /* if instr(@风险规则代码#, "[") > 0 and instr(@风险规则代码#, "]") > 0 then */
            if instr(v_risk_rule_code, "[") > 0 and instr(v_risk_rule_code, "]") > 0 then

                /* if instr(@风险规则代码#, "]") - instr(@风险规则代码#, "[") - 1 > 0 then */
                if instr(v_risk_rule_code, "]") - instr(v_risk_rule_code, "[") - 1 > 0 then

                    /* set @目标风险要素# = trim(substring(@风险规则代码#, instr(@风险规则代码#, "[") + 1, instr(@风险规则代码#, "]") - instr(@风险规则代码#, "[") - 1)); */
                    set v_target_risk_param = trim(substring(v_risk_rule_code, instr(v_risk_rule_code, "[") + 1, instr(v_risk_rule_code, "]") - instr(v_risk_rule_code, "[") - 1));
                else

                    /* [报错不回滚][905][@风险规则代码#] */
                        SET v_error_code = "rksecuA.4.13.905";
                        SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
                        close cursor_rkserk_client_riskparam;
                        leave label_pro;

                    leave loop_label;
                end if;
                #如果目标风险要素是n，表明是参数值宏代码

                /* if @目标风险要素# = "n" then */
                if v_target_risk_param = "n" then
                    #获取左边第一个参数值

                    /* set @风险要素值# = left(@风险规则值串#, instr(@风险规则值串#, ";") - 1); */
                    set v_risk_param_value = left(v_risk_rule_value_str, instr(v_risk_rule_value_str, ";") - 1);

                    /* set @风险规则值串# = substring(@风险规则值串#, instr(@风险规则值串#, ";") + 1); */
                    set v_risk_rule_value_str = substring(v_risk_rule_value_str, instr(v_risk_rule_value_str, ";") + 1);
                    #替换风险规则代码中第一个[n]宏代码

                    /* set @风险规则代码# = concat(left(@风险规则代码#, instr(@风险规则代码#, "[n]") - 1), @风险要素值#, substring(@风险规则代码#, instr(@风险规则代码#, "[n]") + 3)); */
                    set v_risk_rule_code = concat(left(v_risk_rule_code, instr(v_risk_rule_code, "[n]") - 1), v_risk_param_value, substring(v_risk_rule_code, instr(v_risk_rule_code, "[n]") + 3));
                else
                    #检查传入的风险要素值串中是否包含目标风险要素，包含直接取值，不包含则认为是需要计算

                    /* if instr(@风险要素值串#, concat(";", @目标风险要素#, "=?")) > 0 then */
                    if instr(v_risk_param_value_str, concat(";", v_target_risk_param, "=?")) > 0 then

                        /* 调用【原子_风控证券_风控_获取计算风险要素值】*/
                        call db_rksecu.pra_rkserk_GetFutuCaclRiskParamValue(
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
                            v_exch_no,
                            v_stock_code,
                            v_stock_code_no,
                            v_order_dir,
                            v_order_qty,
                            v_order_price,
                            v_all_fee,
                            v_trig_type,
                            v_trig_stage_type,
                            v_compli_calc_level,
                            v_risk_param_str,
                            v_target_risk_param,
                            v_risk_param_value,
                            v_per_secu_cost_amt,
                            v_per_secu_market_value,
                            v_trade_qty,
                            v_trade_amt,
                            v_error_code,
                            v_error_info,
                            v_evalu_price);
                        if v_error_code = "1" then
                            SET v_error_code = "rksecuA.4.13.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取计算风险要素值出现错误！',v_mysql_message);
                            end if;
                            close cursor_rkserk_client_riskparam;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            close cursor_rkserk_client_riskparam;
                            leave label_pro;
                        end if;

                    else

                        /* 调用【原子_风控证券_风控_获取基础风险要素值】*/
                        call db_rksecu.pra_rkserk_GetSecuBaseRiskParamValue(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_risk_param_value_str,
                            v_target_risk_param,
                            v_error_code,
                            v_error_info,
                            v_risk_param_value);
                        if v_error_code = "1" then
                            SET v_error_code = "rksecuA.4.13.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取基础风险要素值出现错误！',v_mysql_message);
                            end if;
                            close cursor_rkserk_client_riskparam;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            close cursor_rkserk_client_riskparam;
                            leave label_pro;
                        end if;

                    end if;
                    #替换风控拼接值串中的对应风险要素

                    /* set @风控拼接值串# = replace(@风控拼接值串#,@目标风险要素#,@风险要素值#); */
                    set v_risk_splice_str = replace(v_risk_splice_str,v_target_risk_param,v_risk_param_value);
                    #替换风险规则代码中相应的风险要素宏代码

                    /* if instr(@风险规则代码#, concat("[", @目标风险要素#, "]")) > 0 then */
                    if instr(v_risk_rule_code, concat("[", v_target_risk_param, "]")) > 0 then

                          /* set @风险规则代码# = replace(@风险规则代码#, concat("[", @目标风险要素#, "]"), @风险要素值# ); */
                          set v_risk_rule_code = replace(v_risk_rule_code, concat("[", v_target_risk_param, "]"), v_risk_param_value );
                    end if;
                end if;
            else

                /* if instr(@风险规则代码#, "[") > 0 or instr(@风险规则代码#, "]") > 0 then */
                if instr(v_risk_rule_code, "[") > 0 or instr(v_risk_rule_code, "]") > 0 then

                    /* [报错不回滚][905][@风险规则代码#] */
                        SET v_error_code = "rksecuA.4.13.905";
                        SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
                        close cursor_rkserk_client_riskparam;
                        leave label_pro;

                end if;
                leave loop_label;
              end if;
          end loop loop_label ;
            #如果风险规则代码替换完成，则检查代码中是否还有宏，如果没有宏，则执行，否则报错

          /* if instr(@风险规则代码#, "[") > 0 or instr(@风险规则代码#, "]") > 0 then */
          if instr(v_risk_rule_code, "[") > 0 or instr(v_risk_rule_code, "]") > 0 then

             /* [报错不回滚][905][@风险规则代码#] */
                 SET v_error_code = "rksecuA.4.13.905";
                 SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
                 close cursor_rkserk_client_riskparam;
                 leave label_pro;

          else

            /* set @风险计算值串# = @风控拼接值串#; */
            set v_risk_rule_calc_str = v_risk_splice_str;
            set @v_result_value = 0;
            #执行风险规则代码，如果为1，则报错返回，风险限制

            /* [执行语句返回值][@风险规则代码#][@返回值#] */
            set @tmp_sql = concat("select ", v_risk_rule_code, " into @v_result_value");
            PREPARE stmt from @tmp_sql;
            EXECUTE stmt;
            set @tmp_sql = '';
            DEALLOCATE PREPARE stmt;


            /* if  instr(@风险要素串#,"白名单;")>0 then */
            if  instr(v_risk_param_str,"白名单;")>0 then

               /* set @风控允许标志# =1; */
               set v_risk_pre_flag =1;
               set @v_result_value = 0;
            end if;
            if @v_result_value = 1 then

              /* set @合规触发结果# = 1; */
              set v_compli_trig_result_type = 1;

              /* if @风险采取行为# > @临时_风险采取行为#  then */
              if v_risk_rule_action > v_tmp_risk_rule_action  then

                /* set @风控处理值串# = @临时_风险规则值串#; */
                set v_risk_deal_str = v_tmp_risk_rule_value_str;

                /* set @临时_风险采取行为# = @风险采取行为#; */
                set v_tmp_risk_rule_action = v_risk_rule_action;
              end if;
            end if;
          end if;
        end loop loop_rule_value;
        #将触发结果计入流水表

        /* if @合规触发结果# = 1 then */
        if v_compli_trig_result_type = 1 then

          /* set @风险规则值串# = @风控处理值串#; */
          set v_risk_rule_value_str = v_risk_deal_str;

          /* set @风险采取行为# = @临时_风险采取行为#; */
          set v_risk_rule_action = v_tmp_risk_rule_action;

          /* set @风险规则代码# = @临时_风险规则代码#; */
          set v_risk_rule_code = v_tmp_risk_rule_code;

          /* set @客户风险规则序号# = @记录序号#; */
          set v_client_risk_rule_id = v_row_id;

          /* set @风险要素值串# = @临时_风险要素值串#; */
          set v_risk_param_value_str = v_tmp_risk_param_value_str;

          /* set @操作员编号# = 0; */
          set v_opor_no = 0;

          /* 调用【原子_风控证券_风控_风险要素值串替换】*/
          call db_rksecu.pra_rkserk_ReplaceRiskParamValueStr(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_risk_param_value_str,
              v_risk_rule_calc_str,
              v_risk_param_str,
              v_risk_rule_name,
              v_trig_type,
              v_risk_rule_value_str,
              v_unit_nav_flag,
              v_risk_rule_code,
              v_error_code,
              v_error_info);
          if v_error_code = "1" then
              SET v_error_code = "rksecuA.4.13.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_风险要素值串替换出现错误！',v_mysql_message);
              end if;
              close cursor_rkserk_client_riskparam;
              leave label_pro;
          elseif v_error_code <> "0" then
              close cursor_rkserk_client_riskparam;
              leave label_pro;
          end if;


          /* if instr(@风险规则名称#,"单证券市值")>0 then */
          if instr(v_risk_rule_name,"单证券市值")>0 then

               /* set @风险要素值串# = concat(@风险要素值串#,"订单数量=",round(@订单数量#,2),";最新价=",round(@估值价格#,2)); */
               set v_risk_param_value_str = concat(v_risk_param_value_str,"订单数量=",round(v_order_qty,2),";最新价=",round(v_evalu_price,2));
          end if;

          /* if instr(@风险要素串#,"黑名单;")>0 then */
          if instr(v_risk_param_str,"黑名单;")>0 then

             /* set @风险要素值串# = concat("证券代码",@证券代码#,"在黑名单范围内!"); */
             set v_risk_param_value_str = concat("证券代码",v_stock_code,"在黑名单范围内!");

          /* elseif instr(@风险要素串#,"日内对敲")>0 or instr(@风险要素串#,"日内反向")>0 or instr(@风险要素串#,"挂单对敲")>0 or instr(@风险要素串#,"挂单反向")>0 then */
          elseif instr(v_risk_param_str,"日内对敲")>0 or instr(v_risk_param_str,"日内反向")>0 or instr(v_risk_param_str,"挂单对敲")>0 or instr(v_risk_param_str,"挂单反向")>0 then

             /* set @风险要素值串# = concat("触发反向交易",@风险规则名称#,"!"); */
             set v_risk_param_value_str = concat("触发反向交易",v_risk_rule_name,"!");
          end if;

          /* set @备注信息# = concat( "静态风控触警!",@风险要素值串#); */
          set v_remark_info = concat( "静态风控触警!",v_risk_param_value_str);

          /* if @合规计算层级# = 《合规计算层级-交易组级》 then */
          if v_compli_calc_level = 1 then

            /* set @产品编号串# = @交易组编号串#; */
            set v_pd_no_str = v_exch_group_no_str;
          end if;

          /* [插入表记录][风控证券_风控_客户风险触警流水表][字段][字段变量][1][@客户风险规则序号#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_rksecu.tbjour_rkserk_secu_client_risk_trig(
              create_date, create_time, update_date, 
              update_time, update_times, client_risk_rule_id, risk_item_id, 
              compli_trig_id, co_no, pd_no, exch_group_no, 
              order_dir, dime_id, stock_code_no, trig_stage_type, 
              compli_calc_level, unit_nav_flag, trig_type, compli_rules_remark, 
              risk_rule_action, risk_rule_type, risk_rule_value_str, risk_rule_calc_str, 
              remark_info, opor_no, pd_no_str) 
          value( 
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_client_risk_rule_id, v_risk_item_id, 
              v_compli_trig_id, v_co_no, v_pd_no, v_exch_group_no, 
              v_order_dir, v_dime_id, v_stock_code_no, v_trig_stage_type, 
              v_compli_calc_level, v_unit_nav_flag, v_trig_type, v_compli_rules_remark, 
              v_risk_rule_action, v_risk_rule_type, v_risk_rule_value_str, v_risk_rule_calc_str, 
              v_remark_info, v_opor_no, v_pd_no_str);
          if v_error_code = "1" then
                      
              SET v_error_code = "rksecuA.4.13.1";
              SET v_error_info =  CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
              close cursor_rkserk_client_riskparam;
              leave label_pro;
          end if;

        end if;
      end if;

    /* [关闭游标][cursor_rkserk_client_riskparam] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_rkserk_client_riskparam;
    end cursor_rkserk_client_riskparam;

    #白名单需要总的查一遍

    /* if @风控允许标志# =0 then */
    if v_risk_pre_flag =0 then

        /* [获取表记录变量语句][风控证券_风控_客户风险规则表][字段][字段变量][{机构编号} = @机构编号# and instr({触发阶段类型串}, @触发阶段类型#)>0 and (instr(concat(";",{产品编号串}), concat(";",@产品编号#,";")) > 0 or {产品编号串} = "-1") and (instr(concat(";",{交易组编号串}), concat(";",@交易组编号#,";")) > 0 or {交易组编号串}=" " or {交易组编号串} = "-1") and (@订单方向# = 0 or instr(concat(";",{订单方向串}), concat(";",@订单方向#,";")) > 0) and {启用标志} = 《启用标志-启用》 and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end) and (instr(concat(";",@客户风险规则序号串#,";"),concat(";",{记录序号},";"))>0 or @客户风险规则序号串# = " ") and instr({风险要素串},"白名单")>0] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no_str, exch_group_no_str, exch_no_str, order_dir_str, 
            dime_id, trig_stage_type_str, compli_calc_level, unit_nav_flag, 
            trig_type, model_id, risk_item_id, compli_rules_remark, 
            risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
            risk_param_str, union_flag, risk_rule_value_str1, risk_rule_action1, 
            risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
            risk_rule_value_str4, risk_rule_action4, corrsp_plug, begin_time, 
            end_time, rule_flag, templ_flag, compli_trig_result_type into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_co_no, 
            v_pd_no_str, v_exch_group_no_str, v_exch_no_str, v_order_dir_str, 
            v_dime_id, v_trig_stage_type_str, v_compli_calc_level, v_unit_nav_flag, 
            v_trig_type, v_model_id, v_risk_item_id, v_compli_rules_remark, 
            v_risk_rule_id, v_risk_rule_type, v_risk_rule_name, v_risk_rule_code, 
            v_risk_param_str, v_union_flag, v_risk_rule_value_str1, v_risk_rule_action1, 
            v_risk_rule_value_str2, v_risk_rule_action2, v_risk_rule_value_str3, v_risk_rule_action3, 
            v_risk_rule_value_str4, v_risk_rule_action4, v_corrsp_plug, v_begin_time, 
            v_end_time, v_rule_flag, v_templ_flag, v_compli_trig_result_type from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no = v_co_no and instr(trig_stage_type_str, v_trig_stage_type)>0 and (instr(concat(";",pd_no_str), concat(";",v_pd_no,";")) > 0 or pd_no_str = "-1") and (instr(concat(";",exch_group_no_str), concat(";",v_exch_group_no,";")) > 0 or exch_group_no_str=" " or exch_group_no_str = "-1") and (v_order_dir = 0 or instr(concat(";",order_dir_str), concat(";",v_order_dir,";")) > 0) and rule_flag = 1 and (case when begin_time>end_time then (v_mach_time between begin_time and 240000 or v_mach_time between 0 and end_time)  when end_time>begin_time then (v_mach_time between begin_time and end_time) else begin_time = end_time end) and (instr(concat(";",v_client_risk_rule_id_str,";"),concat(";",row_id,";"))>0 or v_client_risk_rule_id_str = " ") and instr(risk_param_str,"白名单")>0 limit 1;

        if found_rows() > 0 then

          /* set @备注信息# = concat( "静态风控触警! 证券代码",@证券代码#,"不在白名单内!"); */
          set v_remark_info = concat( "静态风控触警! 证券代码",v_stock_code,"不在白名单内!");

          /* set @合规触发结果# = 1; */
          set v_compli_trig_result_type = 1;

          /* set @客户风险规则序号# = @记录序号#; */
          set v_client_risk_rule_id = v_row_id;

          /* set @风险计算值串# = concat("0",substr(@风险计算值串#,2)); */
          set v_risk_rule_calc_str = concat("0",substr(v_risk_rule_calc_str,2));

          /* set @风险采取行为# = @风险采取行为1#; */
          set v_risk_rule_action = v_risk_rule_action1;

          /* set @风险规则值串# = @风险规则值串1#; */
          set v_risk_rule_value_str = v_risk_rule_value_str1;

          /* set @产品编号串# = concat(@产品编号#,";"); */
          set v_pd_no_str = concat(v_pd_no,";");

          /* if @合规计算层级# = 《合规计算层级-交易组级》 then */
          if v_compli_calc_level = 1 then

            /* set @产品编号串# = concat(@交易组编号#,";"); */
            set v_pd_no_str = concat(v_exch_group_no,";");
          end if;

          /* [插入表记录][风控证券_风控_客户风险触警流水表][字段][字段变量][1][@客户风险规则序号#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_rksecu.tbjour_rkserk_secu_client_risk_trig(
              create_date, create_time, update_date, 
              update_time, update_times, client_risk_rule_id, risk_item_id, 
              compli_trig_id, co_no, pd_no, exch_group_no, 
              order_dir, dime_id, stock_code_no, trig_stage_type, 
              compli_calc_level, unit_nav_flag, trig_type, compli_rules_remark, 
              risk_rule_action, risk_rule_type, risk_rule_value_str, risk_rule_calc_str, 
              remark_info, opor_no, pd_no_str) 
          value( 
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_client_risk_rule_id, v_risk_item_id, 
              v_compli_trig_id, v_co_no, v_pd_no, v_exch_group_no, 
              v_order_dir, v_dime_id, v_stock_code_no, v_trig_stage_type, 
              v_compli_calc_level, v_unit_nav_flag, v_trig_type, v_compli_rules_remark, 
              v_risk_rule_action, v_risk_rule_type, v_risk_rule_value_str, v_risk_rule_calc_str, 
              v_remark_info, v_opor_no, v_pd_no_str);
          if v_error_code = "1" then
                      
              SET v_error_code = "rksecuA.4.13.1";
              SET v_error_info =  CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
              leave label_pro;
          end if;

        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_新增账户风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_InsertProductMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_InsertProductMonitorSet(
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
    declare v_moni_result_status varchar(2);
    declare v_moni_set_status varchar(2);
    declare v_curr_moni_value decimal(18,4);
    declare v_moni_result_value decimal(18,4);
    declare v_time_stamp int;
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_stock_asset_ratio decimal(18,12);
    declare v_nav_asset decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
    declare v_curr_result_moni_value decimal(18,4);
    declare v_contrs_result_moni_value decimal(18,4);
    declare v_pd_share decimal(18,2);
    declare v_begin_asset_value decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
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
    SET v_moni_result_status = " ";
    SET v_moni_set_status = " ";
    SET v_curr_moni_value = 0;
    SET v_moni_result_value = 0;
    SET v_time_stamp = unix_timestamp();
    SET v_cash_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_stock_asset = 0;
    SET v_repo_asset = 0;
    SET v_stock_asset_ratio = 0;
    SET v_nav_asset = 0;
    SET v_contrs_curr_moni_value = 0;
    SET v_curr_result_moni_value = 0;
    SET v_contrs_result_moni_value = 0;
    SET v_pd_share = 0;
    SET v_begin_asset_value = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* SET @监控结果状态# = '1'; */
    SET v_moni_result_status = '1';

    /* SET @监控设置状态# = '1'; */
    SET v_moni_set_status = '1';

    /* set @当前监控值# = 0; */
    set v_curr_moni_value = 0;

    /* set @监控结果# = 0; */
    set v_moni_result_value = 0;

    /* set @时间戳# = unix_timestamp(); */
    set v_time_stamp = unix_timestamp();

    /* set @现金资产# = 0; */
    set v_cash_asset = 0;

    /* set @基金资产# = 0; */
    set v_fund_asset = 0;

    /* set @债券资产# = 0; */
    set v_bond_asset = 0;

    /* set @股票资产# = 0; */
    set v_stock_asset = 0;

    /* set @回购资产# = 0; */
    set v_repo_asset = 0;

    /* set @股票资产占比# = 0; */
    set v_stock_asset_ratio = 0;

    /* set @净资产# = 0; */
    set v_nav_asset = 0;

    /* set @对比当前监控值# = 0; */
    set v_contrs_curr_moni_value = 0;

    /* set @当前监控结果# = 0; */
    set v_curr_result_moni_value = 0;

    /* set @对比监控结果# = 0; */
    set v_contrs_result_moni_value = 0;

    /* set @产品份额# = 0; */
    set v_pd_share = 0;

    /* set @期初资产值# = 0; */
    set v_begin_asset_value = 0;

    /* set @港股通资产# = 0; */
    set v_hk_thrgh_stock_asset = 0;
    #set @起始监控值# = 0;
    #if @起始监控值# = 0 then
    #  [原子_风控证券_风控_计算账户风险监控设置计算值]
    #  set @起始监控值# = @当前监控值#;
    #end if;

    /* [插入表记录][风控证券_风控_账户风险监控设置表][字段][字段变量][1][@产品编号串#,@交易组编号串#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rkserk_product_monitor_set(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no_str, 
        exch_group_no_str, moni_role_type, moni_value_flag, moni_value_type, 
        warn_posi_value, warn_trig_oper_type, close_posi_value, close_trig_oper_type, 
        appd_value, appd_trig_oper_type, begin_moni_date, begin_moni_value, 
        max_moni_value, curr_moni_value, curr_result_moni_value, contrs_stock_code, 
        contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, contrs_result_moni_value, 
        moni_result_value, moni_result_status, moni_set_status, cash_asset, 
        fund_asset, bond_asset, stock_asset, repo_asset, 
        nav_asset, stock_asset_ratio, close_posi_flag, close_ratio_level_one, 
        close_ratio_level_two, close_ratio_level_three, remark_info, time_stamp, 
        pd_share, begin_asset_value, hk_thrgh_stock_asset) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no_str, 
        v_exch_group_no_str, v_moni_role_type, v_moni_value_flag, v_moni_value_type, 
        v_warn_posi_value, v_warn_trig_oper_type, v_close_posi_value, v_close_trig_oper_type, 
        v_appd_value, v_appd_trig_oper_type, v_begin_moni_date, v_begin_moni_value, 
        v_max_moni_value, v_curr_moni_value, v_curr_result_moni_value, v_contrs_stock_code, 
        v_contrs_exch_no, v_contrs_max_moni_value, v_contrs_curr_moni_value, v_contrs_result_moni_value, 
        v_moni_result_value, v_moni_result_status, v_moni_set_status, v_cash_asset, 
        v_fund_asset, v_bond_asset, v_stock_asset, v_repo_asset, 
        v_nav_asset, v_stock_asset_ratio, v_close_posi_flag, v_close_ratio_level_one, 
        v_close_ratio_level_two, v_close_ratio_level_three, v_remark_info, v_time_stamp, 
        v_pd_share, v_begin_asset_value, v_hk_thrgh_stock_asset);
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.14.1";
        SET v_error_info =  CONCAT(concat("产品编号串=",v_pd_no_str,",","交易组编号串=",v_exch_group_no_str),"#",v_mysql_message);
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

# 原子_风控证券_风控_修改账户风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_UpdateProductMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_UpdateProductMonitorSet(
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][风控证券_风控_账户风险监控设置表][{产品编号串}=@产品编号串#,{交易组编号串}=@交易组编号串#,{监控角色}=@监控角色#,{监控值方式} = @监控值方式#,{监控值类型}=@监控值类型#,{预警线}=@预警线#,{平仓线}=@平仓线#,{追加线}=@追加线#,{起始监控值}=@起始监控值#,{最大监控值}=@最大监控值#,{当前监控值} = @当前监控值#,{备注信息}=@备注信息#,{平仓方式}=@平仓方式#,{一级平仓比例}=@一级平仓比例#,{二级平仓比例}=@二级平仓比例#,{三级平仓比例}=@三级平仓比例#,{对比证券代码}=@对比证券代码#,{对比市场编号}=@对比市场编号#,{对比最大监控值}=@对比最大监控值#,{起始监控日期} = @起始监控日期#,{预警触警操作方式}= @预警触警操作方式#,{平仓触警操作方式}= @平仓触警操作方式#,{追加触警操作方式}= @追加触警操作方式#][{记录序号}=@监控设置序号#][2][@监控设置序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rkserk_product_monitor_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_no_str=v_pd_no_str,exch_group_no_str=v_exch_group_no_str,moni_role_type=v_moni_role_type,moni_value_flag = v_moni_value_flag,moni_value_type=v_moni_value_type,warn_posi_value=v_warn_posi_value,close_posi_value=v_close_posi_value,appd_value=v_appd_value,begin_moni_value=v_begin_moni_value,max_moni_value=v_max_moni_value,curr_moni_value = v_curr_moni_value,remark_info=v_remark_info,close_posi_flag=v_close_posi_flag,close_ratio_level_one=v_close_ratio_level_one,close_ratio_level_two=v_close_ratio_level_two,close_ratio_level_three=v_close_ratio_level_three,contrs_stock_code=v_contrs_stock_code,contrs_exch_no=v_contrs_exch_no,contrs_max_moni_value=v_contrs_max_moni_value,begin_moni_date = v_begin_moni_date,warn_trig_oper_type= v_warn_trig_oper_type,close_trig_oper_type= v_close_trig_oper_type,appd_trig_oper_type= v_appd_trig_oper_type where row_id=v_moni_set_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.15.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("监控设置序号=",v_moni_set_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("监控设置序号=",v_moni_set_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][风控证券_风控_账户风险监控设置表][{更新次数}][@更新次数#][{记录序号}=@监控设置序号#] */
    select update_times into v_update_times from db_rksecu.tb_rkserk_product_monitor_set where row_id=v_moni_set_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_删除账户风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_DeleteProductMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_DeleteProductMonitorSet(
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
    

    /* [删除表记录][风控证券_风控_账户风险监控设置表][{记录序号}=@监控设置序号#][3][@监控设置序号#] */
    delete from db_rksecu.tb_rkserk_product_monitor_set 
        where row_id=v_moni_set_id;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.4.16.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("监控设置序号=",v_moni_set_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("监控设置序号=",v_moni_set_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_查询账户风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QueryProductMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QueryProductMonitorSet(
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
    

    /* if @排序方式# = 2 then */
    if v_sort_type = 2 then

      /* [获取表全记录][风控证券_风控_账户风险监控设置表][字段][({机构编号}=@机构编号# or @机构编号# = 0) and ((@机构编号权限串#=" " or instr(concat(';',@机构编号权限串#,';'),concat(';',{机构编号},';'))>0 ) or (@产品编号权限串#=" " or instr(concat(';',@产品编号权限串#,';'),concat(';',{产品编号串},';'))>0 ) or (@交易组编号权限串#=" " or instr(concat(';',@交易组编号权限串#,';'),concat(';',{交易组编号串},';'))>0 )) and (instr(concat(';',{产品编号串},';'),concat(';',@产品编号#,';'))>0 or @产品编号#= 0 ) and (instr(concat(';',{交易组编号串},';'),concat(';',@交易组编号#,';')) >0 or @交易组编号# = 0) and ({监控角色}=@监控角色# or @监控角色# = 0)  and ({监控值类型}=@监控值类型# or @监控值类型#=0) and  ({监控设置状态}=@监控设置状态# or @监控设置状态#=" ") and  ({监控结果状态}=@监控结果状态# or @监控结果状态#=" ") and  ({监控值方式}=@监控值方式# or @监控值方式#=" ") order by {记录序号} desc] */
      select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          pd_no_str, exch_group_no_str, moni_role_type, moni_value_flag, 
          moni_value_type, warn_posi_value, warn_trig_oper_type, close_posi_value, 
          close_trig_oper_type, appd_value, appd_trig_oper_type, begin_moni_date, 
          begin_moni_value, max_moni_value, curr_moni_value, curr_result_moni_value, 
          contrs_stock_code, contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, 
          contrs_result_moni_value, moni_result_value, moni_result_status, moni_set_status, 
          cash_asset, fund_asset, bond_asset, stock_asset, 
          repo_asset, nav_asset, stock_asset_ratio, close_posi_flag, 
          close_ratio_level_one, close_ratio_level_two, close_ratio_level_three, remark_info, 
          time_stamp, pd_share, begin_asset_value, hk_thrgh_stock_asset from db_rksecu.tb_rkserk_product_monitor_set where (co_no=v_co_no or v_co_no = 0) and ((v_co_no_rights_str=" " or instr(concat(';',v_co_no_rights_str,';'),concat(';',co_no,';'))>0 ) or (v_pd_no_rights_str=" " or instr(concat(';',v_pd_no_rights_str,';'),concat(';',pd_no_str,';'))>0 ) or (v_exch_group_no_rights_str=" " or instr(concat(';',v_exch_group_no_rights_str,';'),concat(';',exch_group_no_str,';'))>0 )) and (instr(concat(';',pd_no_str,';'),concat(';',v_pd_no,';'))>0 or v_pd_no= 0 ) and (instr(concat(';',exch_group_no_str,';'),concat(';',v_exch_group_no,';')) >0 or v_exch_group_no = 0) and (moni_role_type=v_moni_role_type or v_moni_role_type = 0)  and (moni_value_type=v_moni_value_type or v_moni_value_type=0) and  (moni_set_status=v_moni_set_status or v_moni_set_status=" ") and  (moni_result_status=v_moni_result_status or v_moni_result_status=" ") and  (moni_value_flag=v_moni_value_flag or v_moni_value_flag=" ") order by row_id desc;


    /* elseif @排序方式# = 3 then */
    elseif v_sort_type = 3 then

      /* [获取表全记录][风控证券_风控_账户风险监控设置表][字段][({机构编号}=@机构编号# or @机构编号# = 0) and ((@机构编号权限串#=" " or instr(concat(';',@机构编号权限串#,';'),concat(';',{机构编号},';'))>0 ) or (@产品编号权限串#=" " or instr(concat(';',@产品编号权限串#,';'),concat(';',{产品编号串},';'))>0 ) or (@交易组编号权限串#=" " or instr(concat(';',@交易组编号权限串#,';'),concat(';',{交易组编号串},';'))>0 )) and (instr(concat(';',{产品编号串},';'),concat(';',@产品编号#,';'))>0 or @产品编号#= 0 ) and (instr(concat(';',{交易组编号串},';'),concat(';',@交易组编号#,';')) >0 or @交易组编号# = 0)  and ({监控角色}=@监控角色# or @监控角色# = 0)  and ({监控值类型}=@监控值类型# or @监控值类型#=0) and  ({监控设置状态}=@监控设置状态# or @监控设置状态#=" ") and  ({监控结果状态}=@监控结果状态# or @监控结果状态#=" ") and  ({监控值方式}=@监控值方式# or @监控值方式#=" ") order by {监控结果状态} asc] */
      select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          pd_no_str, exch_group_no_str, moni_role_type, moni_value_flag, 
          moni_value_type, warn_posi_value, warn_trig_oper_type, close_posi_value, 
          close_trig_oper_type, appd_value, appd_trig_oper_type, begin_moni_date, 
          begin_moni_value, max_moni_value, curr_moni_value, curr_result_moni_value, 
          contrs_stock_code, contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, 
          contrs_result_moni_value, moni_result_value, moni_result_status, moni_set_status, 
          cash_asset, fund_asset, bond_asset, stock_asset, 
          repo_asset, nav_asset, stock_asset_ratio, close_posi_flag, 
          close_ratio_level_one, close_ratio_level_two, close_ratio_level_three, remark_info, 
          time_stamp, pd_share, begin_asset_value, hk_thrgh_stock_asset from db_rksecu.tb_rkserk_product_monitor_set where (co_no=v_co_no or v_co_no = 0) and ((v_co_no_rights_str=" " or instr(concat(';',v_co_no_rights_str,';'),concat(';',co_no,';'))>0 ) or (v_pd_no_rights_str=" " or instr(concat(';',v_pd_no_rights_str,';'),concat(';',pd_no_str,';'))>0 ) or (v_exch_group_no_rights_str=" " or instr(concat(';',v_exch_group_no_rights_str,';'),concat(';',exch_group_no_str,';'))>0 )) and (instr(concat(';',pd_no_str,';'),concat(';',v_pd_no,';'))>0 or v_pd_no= 0 ) and (instr(concat(';',exch_group_no_str,';'),concat(';',v_exch_group_no,';')) >0 or v_exch_group_no = 0)  and (moni_role_type=v_moni_role_type or v_moni_role_type = 0)  and (moni_value_type=v_moni_value_type or v_moni_value_type=0) and  (moni_set_status=v_moni_set_status or v_moni_set_status=" ") and  (moni_result_status=v_moni_result_status or v_moni_result_status=" ") and  (moni_value_flag=v_moni_value_flag or v_moni_value_flag=" ") order by moni_result_status asc;


    /* elseif @排序方式# = 4 then */
    elseif v_sort_type = 4 then

      /* [获取表全记录][风控证券_风控_账户风险监控设置表][字段][({机构编号}=@机构编号# or @机构编号# = 0) and ((@机构编号权限串#=" " or instr(concat(';',@机构编号权限串#,';'),concat(';',{机构编号},';'))>0 ) or (@产品编号权限串#=" " or instr(concat(';',@产品编号权限串#,';'),concat(';',{产品编号串},';'))>0 ) or (@交易组编号权限串#=" " or instr(concat(';',@交易组编号权限串#,';'),concat(';',{交易组编号串},';'))>0 )) and (instr(concat(';',{产品编号串},';'),concat(';',@产品编号#,';'))>0 or @产品编号#= 0 ) and (instr(concat(';',{交易组编号串},';'),concat(';',@交易组编号#,';')) >0 or @交易组编号# = 0) and ({监控角色}=@监控角色# or @监控角色# = 0)  and ({监控值类型}=@监控值类型# or @监控值类型#=0) and  ({监控设置状态}=@监控设置状态# or @监控设置状态#=" ") and  ({监控结果状态}=@监控结果状态# or @监控结果状态#=" ") and  ({监控值方式}=@监控值方式# or @监控值方式#=" ") order by {监控结果状态} desc] */
      select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          pd_no_str, exch_group_no_str, moni_role_type, moni_value_flag, 
          moni_value_type, warn_posi_value, warn_trig_oper_type, close_posi_value, 
          close_trig_oper_type, appd_value, appd_trig_oper_type, begin_moni_date, 
          begin_moni_value, max_moni_value, curr_moni_value, curr_result_moni_value, 
          contrs_stock_code, contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, 
          contrs_result_moni_value, moni_result_value, moni_result_status, moni_set_status, 
          cash_asset, fund_asset, bond_asset, stock_asset, 
          repo_asset, nav_asset, stock_asset_ratio, close_posi_flag, 
          close_ratio_level_one, close_ratio_level_two, close_ratio_level_three, remark_info, 
          time_stamp, pd_share, begin_asset_value, hk_thrgh_stock_asset from db_rksecu.tb_rkserk_product_monitor_set where (co_no=v_co_no or v_co_no = 0) and ((v_co_no_rights_str=" " or instr(concat(';',v_co_no_rights_str,';'),concat(';',co_no,';'))>0 ) or (v_pd_no_rights_str=" " or instr(concat(';',v_pd_no_rights_str,';'),concat(';',pd_no_str,';'))>0 ) or (v_exch_group_no_rights_str=" " or instr(concat(';',v_exch_group_no_rights_str,';'),concat(';',exch_group_no_str,';'))>0 )) and (instr(concat(';',pd_no_str,';'),concat(';',v_pd_no,';'))>0 or v_pd_no= 0 ) and (instr(concat(';',exch_group_no_str,';'),concat(';',v_exch_group_no,';')) >0 or v_exch_group_no = 0) and (moni_role_type=v_moni_role_type or v_moni_role_type = 0)  and (moni_value_type=v_moni_value_type or v_moni_value_type=0) and  (moni_set_status=v_moni_set_status or v_moni_set_status=" ") and  (moni_result_status=v_moni_result_status or v_moni_result_status=" ") and  (moni_value_flag=v_moni_value_flag or v_moni_value_flag=" ") order by moni_result_status desc;

    else

      /* [获取表全记录][风控证券_风控_账户风险监控设置表][字段][({机构编号}=@机构编号# or @机构编号# = 0) and ((@机构编号权限串#=" " or instr(concat(';',@机构编号权限串#,';'),concat(';',{机构编号},';'))>0 ) or (@产品编号权限串#=" " or instr(concat(';',@产品编号权限串#,';'),concat(';',{产品编号串},';'))>0 ) or (@交易组编号权限串#=" " or instr(concat(';',@交易组编号权限串#,';'),concat(';',{交易组编号串},';'))>0 )) and (instr(concat(';',{产品编号串},';'),concat(';',@产品编号#,';'))>0 or @产品编号#= 0 ) and (instr(concat(';',{交易组编号串},';'),concat(';',@交易组编号#,';')) >0 or @交易组编号# = 0)  and ({监控角色}=@监控角色# or @监控角色# = 0)  and ({监控值类型}=@监控值类型# or @监控值类型#=0) and  ({监控设置状态}=@监控设置状态# or @监控设置状态#=" ") and  ({监控结果状态}=@监控结果状态# or @监控结果状态#=" ") and  ({监控值方式}=@监控值方式# or @监控值方式#=" ") order by {记录序号} asc] */
      select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          pd_no_str, exch_group_no_str, moni_role_type, moni_value_flag, 
          moni_value_type, warn_posi_value, warn_trig_oper_type, close_posi_value, 
          close_trig_oper_type, appd_value, appd_trig_oper_type, begin_moni_date, 
          begin_moni_value, max_moni_value, curr_moni_value, curr_result_moni_value, 
          contrs_stock_code, contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, 
          contrs_result_moni_value, moni_result_value, moni_result_status, moni_set_status, 
          cash_asset, fund_asset, bond_asset, stock_asset, 
          repo_asset, nav_asset, stock_asset_ratio, close_posi_flag, 
          close_ratio_level_one, close_ratio_level_two, close_ratio_level_three, remark_info, 
          time_stamp, pd_share, begin_asset_value, hk_thrgh_stock_asset from db_rksecu.tb_rkserk_product_monitor_set where (co_no=v_co_no or v_co_no = 0) and ((v_co_no_rights_str=" " or instr(concat(';',v_co_no_rights_str,';'),concat(';',co_no,';'))>0 ) or (v_pd_no_rights_str=" " or instr(concat(';',v_pd_no_rights_str,';'),concat(';',pd_no_str,';'))>0 ) or (v_exch_group_no_rights_str=" " or instr(concat(';',v_exch_group_no_rights_str,';'),concat(';',exch_group_no_str,';'))>0 )) and (instr(concat(';',pd_no_str,';'),concat(';',v_pd_no,';'))>0 or v_pd_no= 0 ) and (instr(concat(';',exch_group_no_str,';'),concat(';',v_exch_group_no,';')) >0 or v_exch_group_no = 0)  and (moni_role_type=v_moni_role_type or v_moni_role_type = 0)  and (moni_value_type=v_moni_value_type or v_moni_value_type=0) and  (moni_set_status=v_moni_set_status or v_moni_set_status=" ") and  (moni_result_status=v_moni_result_status or v_moni_result_status=" ") and  (moni_value_flag=v_moni_value_flag or v_moni_value_flag=" ") order by row_id asc;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_更新账户风险监控设置状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_UpdateProductMonitorSetStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_UpdateProductMonitorSetStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_moni_set_id bigint;
    declare v_moni_set_status varchar(2);
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_moni_set_status = p_moni_set_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][风控证券_风控_账户风险监控设置表][{监控设置状态}=@监控设置状态#][{记录序号}=@监控设置序号#][2][@监控设置序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rkserk_product_monitor_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, moni_set_status=v_moni_set_status where row_id=v_moni_set_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.18.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("监控设置序号=",v_moni_set_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("监控设置序号=",v_moni_set_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_更新所有账户风险监控设置状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_UpdateAllProductMonitorSetStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_UpdateAllProductMonitorSetStatus(
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
    SET v_moni_set_status = p_moni_set_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* if @监控设置状态# = "1" then */
    if v_moni_set_status = "1" then

      /* [更新表记录][风控证券_风控_账户风险监控设置表][{监控设置状态}=@监控设置状态#][{机构编号}=@机构编号# and {监控设置状态} = "2"][2][@机构编号#] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_rksecu.tb_rkserk_product_monitor_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, moni_set_status=v_moni_set_status where co_no=v_co_no and moni_set_status = "2";
      if v_error_code = "1" then
                  
          SET v_error_code = "rksecuA.4.19.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
          else
              SET v_error_info = concat("机构编号=",v_co_no);
          end if;
          leave label_pro;
      end if;


    /* elseif @监控设置状态# = "2" then */
    elseif v_moni_set_status = "2" then

      /* [更新表记录][风控证券_风控_账户风险监控设置表][{监控设置状态}=@监控设置状态#][{机构编号}=@机构编号# and {监控设置状态} = "1"][2][@机构编号#] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_rksecu.tb_rkserk_product_monitor_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, moni_set_status=v_moni_set_status where co_no=v_co_no and moni_set_status = "1";
      if v_error_code = "1" then
                  
          SET v_error_code = "rksecuA.4.19.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
          else
              SET v_error_info = concat("机构编号=",v_co_no);
          end if;
          leave label_pro;
      end if;


    /* elseif @监控设置状态# = "3" then */
    elseif v_moni_set_status = "3" then

      /* [更新表记录][风控证券_风控_账户风险监控设置表][{监控设置状态}=@监控设置状态#][{机构编号}=@机构编号# and {监控设置状态}<>@监控设置状态#][2][@机构编号#] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_rksecu.tb_rkserk_product_monitor_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, moni_set_status=v_moni_set_status where co_no=v_co_no and moni_set_status<>v_moni_set_status;
      if v_error_code = "1" then
                  
          SET v_error_code = "rksecuA.4.19.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
          else
              SET v_error_info = concat("机构编号=",v_co_no);
          end if;
          leave label_pro;
      end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_新增证券风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_InsertStockMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_InsertStockMonitorSet(
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
    declare v_moni_result_status varchar(2);
    declare v_moni_set_status varchar(2);
    declare v_moni_result_value decimal(18,4);
    declare v_curr_moni_value decimal(18,4);
    declare v_curr_result_moni_value decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
    declare v_contrs_result_moni_value decimal(18,4);
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
    SET v_moni_result_status = " ";
    SET v_moni_set_status = " ";
    SET v_moni_result_value = 0;
    SET v_curr_moni_value = 0;
    SET v_curr_result_moni_value = 0;
    SET v_contrs_curr_moni_value = 0;
    SET v_contrs_result_moni_value = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* SET @监控结果状态# = 《监控结果状态-正常》; */
    SET v_moni_result_status = "1";

    /* SET @监控设置状态# = 《监控设置状态-启用》; */
    SET v_moni_set_status = "1";

    /* set @监控结果# = 0; */
    set v_moni_result_value = 0;

    /* set @当前监控值# = 0; */
    set v_curr_moni_value = 0;

    /* set @当前监控结果# = 0; */
    set v_curr_result_moni_value = 0;

    /* set @对比当前监控值# = 0; */
    set v_contrs_curr_moni_value = 0;

    /* set @对比监控结果# = 0; */
    set v_contrs_result_moni_value = 0;

    /* [插入表记录][风控证券_风控_证券风险监控设置表][字段][字段变量][2][@操作员编号#,@证券代码#,@市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rkserk_stock_monitor_set(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, opor_no, 
        pd_no_str, exch_group_no_str, monitor_ctrl_type, moni_value_type, 
        monitor_param_value, moni_value_flag, warn_posi_value, appd_value, 
        close_posi_value, max_moni_value, curr_moni_value, curr_result_moni_value, 
        contrs_stock_code, contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, 
        contrs_result_moni_value, moni_result_value, moni_result_status, moni_set_status, 
        close_posi_flag, close_ratio_level_one, close_ratio_level_two, close_ratio_level_three, 
        remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_opor_no, 
        v_pd_no_str, v_exch_group_no_str, v_monitor_ctrl_type, v_moni_value_type, 
        v_monitor_param_value, v_moni_value_flag, v_warn_posi_value, v_appd_value, 
        v_close_posi_value, v_max_moni_value, v_curr_moni_value, v_curr_result_moni_value, 
        v_contrs_stock_code, v_contrs_exch_no, v_contrs_max_moni_value, v_contrs_curr_moni_value, 
        v_contrs_result_moni_value, v_moni_result_value, v_moni_result_status, v_moni_set_status, 
        v_close_posi_flag, v_close_ratio_level_one, v_close_ratio_level_two, v_close_ratio_level_three, 
        v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.20.2";
        SET v_error_info =  CONCAT(concat("操作员编号=",v_opor_no,",","证券代码=",v_stock_code,",","市场编号=",v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@监控设置序号#] */
    select LAST_INSERT_ID() into v_moni_set_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_moni_set_id = v_moni_set_id;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_修改证券风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_UpdateStockMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_UpdateStockMonitorSet(
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][风控证券_风控_证券风险监控设置表][{产品编号串} = @产品编号串#,{交易组编号串} = @交易组编号串#,{监控控制方式}=@监控控制方式#,{监控值类型} = @监控值类型#,{监控参数值} = @监控参数值#,{监控值方式} = @监控值方式#,{最大监控值} = @最大监控值#,{预警线}=@预警线#,{追加线}=@追加线#,{平仓线}=@平仓线#,{备注信息}=@备注信息#,{平仓方式}=@平仓方式#,{一级平仓比例}=@一级平仓比例#,{二级平仓比例}=@二级平仓比例#,{三级平仓比例}=@三级平仓比例#,{对比证券代码}=@对比证券代码#,{对比市场编号}=@对比市场编号#,{对比最大监控值} = @对比最大监控值#][{记录序号}=@监控设置序号# and {操作员编号} = @操作员编号#][2][@监控设置序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rkserk_stock_monitor_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_no_str = v_pd_no_str,exch_group_no_str = v_exch_group_no_str,monitor_ctrl_type=v_monitor_ctrl_type,moni_value_type = v_moni_value_type,monitor_param_value = v_monitor_param_value,moni_value_flag = v_moni_value_flag,max_moni_value = v_max_moni_value,warn_posi_value=v_warn_posi_value,appd_value=v_appd_value,close_posi_value=v_close_posi_value,remark_info=v_remark_info,close_posi_flag=v_close_posi_flag,close_ratio_level_one=v_close_ratio_level_one,close_ratio_level_two=v_close_ratio_level_two,close_ratio_level_three=v_close_ratio_level_three,contrs_stock_code=v_contrs_stock_code,contrs_exch_no=v_contrs_exch_no,contrs_max_moni_value = v_contrs_max_moni_value where row_id=v_moni_set_id and opor_no = v_opor_no;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.21.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("监控设置序号=",v_moni_set_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("监控设置序号=",v_moni_set_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_删除证券风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_DeleteStockMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_DeleteStockMonitorSet(
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
    

    /* [删除表记录][风控证券_风控_证券风险监控设置表][{记录序号}=@监控设置序号#][3][@监控设置序号#] */
    delete from db_rksecu.tb_rkserk_stock_monitor_set 
        where row_id=v_moni_set_id;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.4.22.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("监控设置序号=",v_moni_set_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("监控设置序号=",v_moni_set_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_查询证券风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QueryStockMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QueryStockMonitorSet(
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
    

    /* if @排序方式# = 2 then */
    if v_sort_type = 2 then

      /* [获取表全记录][风控证券_风控_证券风险监控设置表][字段][({机构编号}=@机构编号# or @机构编号# = 0) and ((@机构编号权限串#=" " or instr(concat(';',@机构编号权限串#,';'),concat(';',{机构编号},';'))>0 ) or (@产品编号权限串#=" " or instr(concat(';',@产品编号权限串#,';'),concat(';',{产品编号串},';'))>0 ) or (@交易组编号权限串#=" " or instr(concat(';',@交易组编号权限串#,';'),concat(';',{交易组编号串},';'))>0 )) and (instr(concat(';',{产品编号串},';'),concat(';',@产品编号#,';'))>0 or @产品编号#= 0 ) and (instr(concat(';',{交易组编号串},';'),concat(';',@交易组编号#,';')) >0 or @交易组编号# = 0) and ({监控值类型}=@监控值类型# or @监控值类型#=0) and  ({监控设置状态}=@监控设置状态# or @监控设置状态#=" ") and  ({监控结果状态}=@监控结果状态# or @监控结果状态#=" ") and  ({监控值方式}=@监控值方式# or @监控值方式#=" ") order by {记录序号} desc] */
      select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          opor_no, pd_no_str, exch_group_no_str, monitor_ctrl_type, 
          moni_value_type, monitor_param_value, moni_value_flag, warn_posi_value, 
          appd_value, close_posi_value, max_moni_value, curr_moni_value, 
          curr_result_moni_value, contrs_stock_code, contrs_exch_no, contrs_max_moni_value, 
          contrs_curr_moni_value, contrs_result_moni_value, moni_result_value, moni_result_status, 
          moni_set_status, close_posi_flag, close_ratio_level_one, close_ratio_level_two, 
          close_ratio_level_three, remark_info from db_rksecu.tb_rkserk_stock_monitor_set where (co_no=v_co_no or v_co_no = 0) and ((v_co_no_rights_str=" " or instr(concat(';',v_co_no_rights_str,';'),concat(';',co_no,';'))>0 ) or (v_pd_no_rights_str=" " or instr(concat(';',v_pd_no_rights_str,';'),concat(';',pd_no_str,';'))>0 ) or (v_exch_group_no_rights_str=" " or instr(concat(';',v_exch_group_no_rights_str,';'),concat(';',exch_group_no_str,';'))>0 )) and (instr(concat(';',pd_no_str,';'),concat(';',v_pd_no,';'))>0 or v_pd_no= 0 ) and (instr(concat(';',exch_group_no_str,';'),concat(';',v_exch_group_no,';')) >0 or v_exch_group_no = 0) and (moni_value_type=v_moni_value_type or v_moni_value_type=0) and  (moni_set_status=v_moni_set_status or v_moni_set_status=" ") and  (moni_result_status=v_moni_result_status or v_moni_result_status=" ") and  (moni_value_flag=v_moni_value_flag or v_moni_value_flag=" ") order by row_id desc;


    /* elseif @排序方式# = 3 then */
    elseif v_sort_type = 3 then

      /* [获取表全记录][风控证券_风控_证券风险监控设置表][字段][({机构编号}=@机构编号# or @机构编号# = 0) and ((@机构编号权限串#=" " or instr(concat(';',@机构编号权限串#,';'),concat(';',{机构编号},';'))>0 ) or (@产品编号权限串#=" " or instr(concat(';',@产品编号权限串#,';'),concat(';',{产品编号串},';'))>0 ) or (@交易组编号权限串#=" " or instr(concat(';',@交易组编号权限串#,';'),concat(';',{交易组编号串},';'))>0 )) and (instr(concat(';',{产品编号串},';'),concat(';',@产品编号#,';'))>0 or @产品编号#= 0 ) and (instr(concat(';',{交易组编号串},';'),concat(';',@交易组编号#,';')) >0 or @交易组编号# = 0) and ({监控值类型}=@监控值类型# or @监控值类型#=0) and  ({监控设置状态}=@监控设置状态# or @监控设置状态#=" ") and  ({监控结果状态}=@监控结果状态# or @监控结果状态#=" ") and  ({监控值方式}=@监控值方式# or @监控值方式#=" ") order by {监控结果状态} asc] */
      select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          opor_no, pd_no_str, exch_group_no_str, monitor_ctrl_type, 
          moni_value_type, monitor_param_value, moni_value_flag, warn_posi_value, 
          appd_value, close_posi_value, max_moni_value, curr_moni_value, 
          curr_result_moni_value, contrs_stock_code, contrs_exch_no, contrs_max_moni_value, 
          contrs_curr_moni_value, contrs_result_moni_value, moni_result_value, moni_result_status, 
          moni_set_status, close_posi_flag, close_ratio_level_one, close_ratio_level_two, 
          close_ratio_level_three, remark_info from db_rksecu.tb_rkserk_stock_monitor_set where (co_no=v_co_no or v_co_no = 0) and ((v_co_no_rights_str=" " or instr(concat(';',v_co_no_rights_str,';'),concat(';',co_no,';'))>0 ) or (v_pd_no_rights_str=" " or instr(concat(';',v_pd_no_rights_str,';'),concat(';',pd_no_str,';'))>0 ) or (v_exch_group_no_rights_str=" " or instr(concat(';',v_exch_group_no_rights_str,';'),concat(';',exch_group_no_str,';'))>0 )) and (instr(concat(';',pd_no_str,';'),concat(';',v_pd_no,';'))>0 or v_pd_no= 0 ) and (instr(concat(';',exch_group_no_str,';'),concat(';',v_exch_group_no,';')) >0 or v_exch_group_no = 0) and (moni_value_type=v_moni_value_type or v_moni_value_type=0) and  (moni_set_status=v_moni_set_status or v_moni_set_status=" ") and  (moni_result_status=v_moni_result_status or v_moni_result_status=" ") and  (moni_value_flag=v_moni_value_flag or v_moni_value_flag=" ") order by moni_result_status asc;


    /* elseif @排序方式# = 4 then */
    elseif v_sort_type = 4 then

      /* [获取表全记录][风控证券_风控_证券风险监控设置表][字段][({机构编号}=@机构编号# or @机构编号# = 0) and ((@机构编号权限串#=" " or instr(concat(';',@机构编号权限串#,';'),concat(';',{机构编号},';'))>0 ) or (@产品编号权限串#=" " or instr(concat(';',@产品编号权限串#,';'),concat(';',{产品编号串},';'))>0 ) or (@交易组编号权限串#=" " or instr(concat(';',@交易组编号权限串#,';'),concat(';',{交易组编号串},';'))>0 )) and (instr(concat(';',{产品编号串},';'),concat(';',@产品编号#,';'))>0 or @产品编号#= 0 ) and (instr(concat(';',{交易组编号串},';'),concat(';',@交易组编号#,';')) >0 or @交易组编号# = 0) and ({监控值类型}=@监控值类型# or @监控值类型#=0) and  ({监控设置状态}=@监控设置状态# or @监控设置状态#=" ") and  ({监控结果状态}=@监控结果状态# or @监控结果状态#=" ") and  ({监控值方式}=@监控值方式# or @监控值方式#=" ") order by {监控结果状态} desc] */
      select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          opor_no, pd_no_str, exch_group_no_str, monitor_ctrl_type, 
          moni_value_type, monitor_param_value, moni_value_flag, warn_posi_value, 
          appd_value, close_posi_value, max_moni_value, curr_moni_value, 
          curr_result_moni_value, contrs_stock_code, contrs_exch_no, contrs_max_moni_value, 
          contrs_curr_moni_value, contrs_result_moni_value, moni_result_value, moni_result_status, 
          moni_set_status, close_posi_flag, close_ratio_level_one, close_ratio_level_two, 
          close_ratio_level_three, remark_info from db_rksecu.tb_rkserk_stock_monitor_set where (co_no=v_co_no or v_co_no = 0) and ((v_co_no_rights_str=" " or instr(concat(';',v_co_no_rights_str,';'),concat(';',co_no,';'))>0 ) or (v_pd_no_rights_str=" " or instr(concat(';',v_pd_no_rights_str,';'),concat(';',pd_no_str,';'))>0 ) or (v_exch_group_no_rights_str=" " or instr(concat(';',v_exch_group_no_rights_str,';'),concat(';',exch_group_no_str,';'))>0 )) and (instr(concat(';',pd_no_str,';'),concat(';',v_pd_no,';'))>0 or v_pd_no= 0 ) and (instr(concat(';',exch_group_no_str,';'),concat(';',v_exch_group_no,';')) >0 or v_exch_group_no = 0) and (moni_value_type=v_moni_value_type or v_moni_value_type=0) and  (moni_set_status=v_moni_set_status or v_moni_set_status=" ") and  (moni_result_status=v_moni_result_status or v_moni_result_status=" ") and  (moni_value_flag=v_moni_value_flag or v_moni_value_flag=" ") order by moni_result_status desc;

    else

      /* [获取表全记录][风控证券_风控_证券风险监控设置表][字段][({机构编号}=@机构编号# or @机构编号# = 0) and ((@机构编号权限串#=" " or instr(concat(';',@机构编号权限串#,';'),concat(';',{机构编号},';'))>0 ) or (@产品编号权限串#=" " or instr(concat(';',@产品编号权限串#,';'),concat(';',{产品编号串},';'))>0 ) or (@交易组编号权限串#=" " or instr(concat(';',@交易组编号权限串#,';'),concat(';',{交易组编号串},';'))>0 )) and (instr(concat(';',{产品编号串},';'),concat(';',@产品编号#,';'))>0 or @产品编号#= 0 ) and (instr(concat(';',{交易组编号串},';'),concat(';',@交易组编号#,';')) >0 or @交易组编号# = 0) and ({监控值类型}=@监控值类型# or @监控值类型#=0) and  ({监控设置状态}=@监控设置状态# or @监控设置状态#=" ") and  ({监控结果状态}=@监控结果状态# or @监控结果状态#=" ") and  ({监控值方式}=@监控值方式# or @监控值方式#=" ") order by {记录序号} asc] */
      select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          opor_no, pd_no_str, exch_group_no_str, monitor_ctrl_type, 
          moni_value_type, monitor_param_value, moni_value_flag, warn_posi_value, 
          appd_value, close_posi_value, max_moni_value, curr_moni_value, 
          curr_result_moni_value, contrs_stock_code, contrs_exch_no, contrs_max_moni_value, 
          contrs_curr_moni_value, contrs_result_moni_value, moni_result_value, moni_result_status, 
          moni_set_status, close_posi_flag, close_ratio_level_one, close_ratio_level_two, 
          close_ratio_level_three, remark_info from db_rksecu.tb_rkserk_stock_monitor_set where (co_no=v_co_no or v_co_no = 0) and ((v_co_no_rights_str=" " or instr(concat(';',v_co_no_rights_str,';'),concat(';',co_no,';'))>0 ) or (v_pd_no_rights_str=" " or instr(concat(';',v_pd_no_rights_str,';'),concat(';',pd_no_str,';'))>0 ) or (v_exch_group_no_rights_str=" " or instr(concat(';',v_exch_group_no_rights_str,';'),concat(';',exch_group_no_str,';'))>0 )) and (instr(concat(';',pd_no_str,';'),concat(';',v_pd_no,';'))>0 or v_pd_no= 0 ) and (instr(concat(';',exch_group_no_str,';'),concat(';',v_exch_group_no,';')) >0 or v_exch_group_no = 0) and (moni_value_type=v_moni_value_type or v_moni_value_type=0) and  (moni_set_status=v_moni_set_status or v_moni_set_status=" ") and  (moni_result_status=v_moni_result_status or v_moni_result_status=" ") and  (moni_value_flag=v_moni_value_flag or v_moni_value_flag=" ") order by row_id asc;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_更新证券风险监控设置状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_UpdateStockMonitorSetStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_UpdateStockMonitorSetStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_moni_set_id bigint;
    declare v_moni_set_status varchar(2);
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_moni_set_status = p_moni_set_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][风控证券_风控_证券风险监控设置表][{监控设置状态}=@监控设置状态#][{记录序号}=@监控设置序号#][1][CONCAT('更新风控证券_风控_证券风险监控设置表失败(监控设置序号-',@监控设置序号#,')')] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rkserk_stock_monitor_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, moni_set_status=v_moni_set_status where row_id=v_moni_set_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.24.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat(CONCAT('更新风控证券_风控_证券风险监控设置表失败(监控设置序号-',",","监控设置序号=",v_moni_set_id,",",')')),"#",v_mysql_message);
        else
            SET v_error_info = concat(CONCAT('更新风控证券_风控_证券风险监控设置表失败(监控设置序号-',",","监控设置序号=",v_moni_set_id,",",')'));
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_更新所有证券风险监控设置状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_UpdateAllStockMonitorSetStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_UpdateAllStockMonitorSetStatus(
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
    SET v_moni_set_status = p_moni_set_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][风控证券_风控_证券风险监控设置表][{监控设置状态}=@监控设置状态#][{机构编号}=@机构编号# and {操作员编号}=@操作员编号# and {监控设置状态}<>@监控设置状态#][2][@机构编号#,@操作员编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rkserk_stock_monitor_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, moni_set_status=v_moni_set_status where co_no=v_co_no and opor_no=v_opor_no and moni_set_status<>v_moni_set_status;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.25.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_获取最大的合规触警流水序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_GetMaxComplianceTriggerId;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_GetMaxComplianceTriggerId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_compli_trig_id bigint
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_compli_trig_id bigint;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_compli_trig_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @合规触警序号#=1; */
    set v_compli_trig_id=1;

    /* [插入重复更新][风控证券_风控_合规触警流水序号表][字段][字段变量][{合规触警序号} = {合规触警序号} + 1 ][1][@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rkserk_compliancetrigger_id (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, compli_trig_id) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_compli_trig_id) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, compli_trig_id = compli_trig_id + 1 ;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.26.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][风控证券_风控_合规触警流水序号表][{合规触警序号}][@合规触警序号#][{机构编号}=@机构编号#][4][@合规触警序号#] */
    select compli_trig_id into v_compli_trig_id from db_rksecu.tb_rkserk_compliancetrigger_id where co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "rksecuA.4.26.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合规触警序号=",v_compli_trig_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("合规触警序号=",v_compli_trig_id);
        end if;
        leave label_pro;
    end if;


    /* if @合规触警序号# >=1000000 then */
    if v_compli_trig_id >=1000000 then

      /* set @合规触警序号#=1; */
      set v_compli_trig_id=1;

      /* [更新表记录][风控证券_风控_合规触警流水序号表][{合规触警序号} = @合规触警序号#][{机构编号} = @机构编号#][2][@机构编号#] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_rksecu.tb_rkserk_compliancetrigger_id set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, compli_trig_id = v_compli_trig_id where co_no = v_co_no;
      if v_error_code = "1" then
                  
          SET v_error_code = "rksecuA.4.26.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
          else
              SET v_error_info = concat("机构编号=",v_co_no);
          end if;
          leave label_pro;
      end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_compli_trig_id = v_compli_trig_id;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_获取指定序号合规触警流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_GetComplianceTriggerByTriggerId;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_GetComplianceTriggerByTriggerId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_compli_trig_id bigint,
    IN p_trig_stage_type int,
    IN p_risk_rule_action varchar(32),
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
    declare v_compli_trig_id bigint;
    declare v_trig_stage_type int;
    declare v_risk_rule_action varchar(32);
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
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_risk_rule_action = p_risk_rule_action;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][风控证券_风控_客户风险触警流水表][{客户风险规则序号},{产品编号},{交易组编号},{合规规则说明},{风险采取行为},{风险规则值串},{风险计算值串},{备注信息},{客户风险规则序号},{操作员编号},{产品编号串},{维度序号},{证券代码编号},{风险规则类别}][{机构编号} = @机构编号# and {合规触警序号} = @合规触警序号# and {触发阶段类型} = @触发阶段类型# and (@风险采取行为# = " " or {风险采取行为} = @风险采取行为#)][@指定行数#] */
    if v_row_count = -1 then
        select client_risk_rule_id,pd_no,exch_group_no,compli_rules_remark,risk_rule_action,risk_rule_value_str,risk_rule_calc_str,remark_info,client_risk_rule_id,opor_no,pd_no_str,dime_id,stock_code_no,risk_rule_type from db_rksecu.tbjour_rkserk_secu_client_risk_trig where co_no = v_co_no and compli_trig_id = v_compli_trig_id and trig_stage_type = v_trig_stage_type and (v_risk_rule_action = " " or risk_rule_action = v_risk_rule_action);
    else
        select client_risk_rule_id,pd_no,exch_group_no,compli_rules_remark,risk_rule_action,risk_rule_value_str,risk_rule_calc_str,remark_info,client_risk_rule_id,opor_no,pd_no_str,dime_id,stock_code_no,risk_rule_type from db_rksecu.tbjour_rkserk_secu_client_risk_trig where co_no = v_co_no and compli_trig_id = v_compli_trig_id and trig_stage_type = v_trig_stage_type and (v_risk_rule_action = " " or risk_rule_action = v_risk_rule_action) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_风险要素值串替换
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_ReplaceRiskParamValueStr;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_ReplaceRiskParamValueStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    INOUT p_risk_param_value_str varchar(1024),
    IN p_risk_rule_calc_str varchar(255),
    IN p_risk_param_str varchar(2048),
    IN p_risk_rule_name varchar(64),
    IN p_trig_type int,
    IN p_risk_rule_value_str varchar(255),
    IN p_unit_nav_flag int,
    IN p_risk_rule_code varchar(2048),
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
    declare v_risk_param_value_str varchar(1024);
    declare v_risk_rule_calc_str varchar(255);
    declare v_risk_param_str varchar(2048);
    declare v_risk_rule_name varchar(64);
    declare v_trig_type int;
    declare v_risk_rule_value_str varchar(255);
    declare v_unit_nav_flag int;
    declare v_risk_rule_code varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_risk_rule_calc_str varchar(255);
    declare v_risk_deal_str varchar(255);
    declare v_tmp_risk_deal_str varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_risk_param_value_str = p_risk_param_value_str;
    SET v_risk_rule_calc_str = p_risk_rule_calc_str;
    SET v_risk_param_str = p_risk_param_str;
    SET v_risk_rule_name = p_risk_rule_name;
    SET v_trig_type = p_trig_type;
    SET v_risk_rule_value_str = p_risk_rule_value_str;
    SET v_unit_nav_flag = p_unit_nav_flag;
    SET v_risk_rule_code = p_risk_rule_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_risk_rule_calc_str = " ";
    SET v_risk_deal_str = " ";
    SET v_tmp_risk_deal_str = " ";

    
    label_pro:BEGIN
    

    /* set @临时_风险计算值串# = @风险计算值串#; */
    set v_tmp_risk_rule_calc_str = v_risk_rule_calc_str;
    loop_label:loop

      /* if @风险要素串# = " " then */
      if v_risk_param_str = " " then
        leave loop_label;
      end if;

        /* set @风控处理值串# = SUBSTR(@风险计算值串#,1,INSTR(@风险计算值串#,";")-1); */
        set v_risk_deal_str = SUBSTR(v_risk_rule_calc_str,1,INSTR(v_risk_rule_calc_str,";")-1);

        /* set @临时_风控处理值串# = SUBSTR(@风险要素串#,1,INSTR(@风险要素串#,";")-1); */
        set v_tmp_risk_deal_str = SUBSTR(v_risk_param_str,1,INSTR(v_risk_param_str,";")-1);

        /* set @风险要素值串# = concat(@风险要素值串#,@临时_风控处理值串#,"=",@风控处理值串#,";"); */
        set v_risk_param_value_str = concat(v_risk_param_value_str,v_tmp_risk_deal_str,"=",v_risk_deal_str,";");

        /* set @风险计算值串# = SUBSTR(@风险计算值串#,INSTR(@风险计算值串#,";")+1); */
        set v_risk_rule_calc_str = SUBSTR(v_risk_rule_calc_str,INSTR(v_risk_rule_calc_str,";")+1);

        /* set  @风险要素串# = SUBSTR(@风险要素串#,INSTR(@风险要素串#,";")+1); */
        set  v_risk_param_str = SUBSTR(v_risk_param_str,INSTR(v_risk_param_str,";")+1);
    end loop;

    /* set @风险计算值串# = @临时_风险计算值串#; */
    set v_risk_rule_calc_str = v_tmp_risk_rule_calc_str;

    /* set @风险要素值串# = concat(@风险要素值串#,@风险规则名称#,"="); */
    set v_risk_param_value_str = concat(v_risk_param_value_str,v_risk_rule_name,"=");
    #计算实际结果,加入预警流水说明信息

    /* if instr(@风险规则代码# , "/")>0 then */
    if instr(v_risk_rule_code , "/")>0 then

      /* set @风控处理值串# = substr(@风险计算值串#,1,instr(@风险计算值串#,";")-1); */
      set v_risk_deal_str = substr(v_risk_rule_calc_str,1,instr(v_risk_rule_calc_str,";")-1);

      /* set @风险计算值串# = substr(@风险计算值串#,instr(@风险计算值串#,";")+1); */
      set v_risk_rule_calc_str = substr(v_risk_rule_calc_str,instr(v_risk_rule_calc_str,";")+1);

      /* set @临时_风控处理值串# = substr(@风险计算值串#,1,instr(@风险计算值串#,";")-1); */
      set v_tmp_risk_deal_str = substr(v_risk_rule_calc_str,1,instr(v_risk_rule_calc_str,";")-1);

      /* if instr(@风险规则名称# , "偏移比例")>0 then */
      if instr(v_risk_rule_name , "偏移比例")>0 then

        /* set @风险要素值串# = concat(@风险要素值串#,round((@风控处理值串# - @临时_风控处理值串#) / @临时_风控处理值串# * 100 ,3), "%"); */
        set v_risk_param_value_str = concat(v_risk_param_value_str,round((v_risk_deal_str - v_tmp_risk_deal_str) / v_tmp_risk_deal_str * 100 ,3), "%");
      else

        /* set @风险要素值串# = concat(@风险要素值串#,round(@风控处理值串# / @临时_风控处理值串#  * 100,3),"%"); */
        set v_risk_param_value_str = concat(v_risk_param_value_str,round(v_risk_deal_str / v_tmp_risk_deal_str  * 100,3),"%");
      end if;
    else

      /* set @风控处理值串# = substr(@风险计算值串#,1,instr(@风险计算值串#,";")-1); */
      set v_risk_deal_str = substr(v_risk_rule_calc_str,1,instr(v_risk_rule_calc_str,";")-1);

      /* set @风险要素值串# = concat(@风险要素值串#,@风控处理值串#); */
      set v_risk_param_value_str = concat(v_risk_param_value_str,v_risk_deal_str);
    end if;
    #拼接触发方向和原规则值

    /* if @触发方向# =1 then */
    if v_trig_type =1 then

      /* set @风险要素值串# = concat(@风险要素值串#,">",substring_index(@风险规则值串#,";",-2)); */
      set v_risk_param_value_str = concat(v_risk_param_value_str,">",substring_index(v_risk_rule_value_str,";",-2));

    /* elseif @触发方向# =2 then */
    elseif v_trig_type =2 then

      /* set @风险要素值串# = concat(@风险要素值串#,">=",substring_index(@风险规则值串#,";",-2)); */
      set v_risk_param_value_str = concat(v_risk_param_value_str,">=",substring_index(v_risk_rule_value_str,";",-2));

    /* elseif @触发方向# = 3 then */
    elseif v_trig_type = 3 then

      /* set @风险要素值串# = concat(@风险要素值串#,"<",substring_index(@风险规则值串#,";",-2)); */
      set v_risk_param_value_str = concat(v_risk_param_value_str,"<",substring_index(v_risk_rule_value_str,";",-2));

    /* elseif @触发方向# = 4 then */
    elseif v_trig_type = 4 then

      /* set @风险要素值串# = concat(@风险要素值串#,"<=",substring_index(@风险规则值串#,";",-2)); */
      set v_risk_param_value_str = concat(v_risk_param_value_str,"<=",substring_index(v_risk_rule_value_str,";",-2));
    end if;

    /* if instr(@风险规则代码# , "/")>0 then */
    if instr(v_risk_rule_code , "/")>0 then

        /* set @风险要素值串# = concat(reverse(substring(reverse(@风险要素值串#), 2)),"%"); */
        set v_risk_param_value_str = concat(reverse(substring(reverse(v_risk_param_value_str), 2)),"%");
    end if;
    END;

    SET p_risk_param_value_str = v_risk_param_value_str;
    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_计算账户风险监控设置数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_CalcStockMonitorSetService;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_CalcStockMonitorSetService(
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
    declare v_oper_time int;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_moni_role_type int;
    declare v_moni_value_flag int;
    declare v_moni_value_type int;
    declare v_warn_posi_value decimal(18,4);
    declare v_close_posi_value decimal(18,4);
    declare v_appd_value decimal(18,4);
    declare v_begin_moni_value decimal(18,4);
    declare v_max_moni_value decimal(18,4);
    declare v_curr_moni_value decimal(18,4);
    declare v_moni_result_value decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_time_stamp int;
    declare v_contrs_stock_code varchar(6);
    declare v_contrs_exch_no int;
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_moni_set_id bigint;
    declare v_curr_tmstp int;
    declare v_update_preci_type int;
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_oper_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no_str = " ";
    SET v_exch_group_no_str = " ";
    SET v_moni_role_type = 0;
    SET v_moni_value_flag = 0;
    SET v_moni_value_type = 0;
    SET v_warn_posi_value = 0;
    SET v_close_posi_value = 0;
    SET v_appd_value = 0;
    SET v_begin_moni_value = 0;
    SET v_max_moni_value = 0;
    SET v_curr_moni_value = 0;
    SET v_moni_result_value = 0;
    SET v_remark_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_contrs_stock_code = " ";
    SET v_contrs_exch_no = 0;
    SET v_contrs_max_moni_value = 0;
    SET v_moni_set_id = 0;
    SET v_curr_tmstp = unix_timestamp();
    SET v_update_preci_type = 0;
    SET v_cash_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_stock_asset = 0;
    SET v_repo_asset = 0;
    SET v_nav_asset = 0;
    SET v_contrs_curr_moni_value = 0;

    
    label_pro:BEGIN
    
    #由于定时任务很坑，只能设置成整点，不能设置9点半，所以在后台进行特殊处理
    #由于集合竞价，价格上蹿下跳，其实是假的价格，导致计算不对。时间点是9点28分以前不要计算。直接退出。

    /* [获取机器时间][@操作时间#] */
    select date_format(curtime(),'%H%i%s') into v_oper_time;


    /* [检查正常返回][@操作时间# < 92800] */
    if v_oper_time < 92800 then
        leave label_pro;
    end if;


    /* [声明游标][风控证券_风控_账户风险监控设置表][{记录序号},{机构编号},{产品编号串},{交易组编号串},{监控角色},{监控值方式},{监控值类型},{预警线},{平仓线},{追加线},{起始监控值},{最大监控值},{当前监控值},{监控结果},{备注信息},{时间戳},{对比证券代码},{对比市场编号},{对比最大监控值}][{监控设置状态}=1][cur_productmonitorsetservice] */
    cur_productmonitorsetservice:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cur_productmonitorsetservice CURSOR FOR
        select row_id,co_no,pd_no_str,exch_group_no_str,moni_role_type,moni_value_flag,moni_value_type,warn_posi_value,close_posi_value,appd_value,begin_moni_value,max_moni_value,curr_moni_value,moni_result_value,remark_info,time_stamp,contrs_stock_code,contrs_exch_no,contrs_max_moni_value 
        from db_rksecu.tb_rkserk_product_monitor_set 
        where moni_set_status=1;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@记录序号#,@机构编号#,@产品编号串#,@交易组编号串#,@监控角色#,@监控值方式#,@监控值类型#,@预警线#,@平仓线#,@追加线#,@起始监控值#,@最大监控值#,@当前监控值#,@监控结果#,@备注信息#,@时间戳#,@对比证券代码#,@对比市场编号#,@对比最大监控值#][cur_productmonitorsetservice][productmonitorsetservice] */
    open cur_productmonitorsetservice;
    productmonitorsetservice: LOOP
    fetch cur_productmonitorsetservice into v_row_id,v_co_no,v_pd_no_str,v_exch_group_no_str,v_moni_role_type,v_moni_value_flag,v_moni_value_type,v_warn_posi_value,v_close_posi_value,v_appd_value,v_begin_moni_value,v_max_moni_value,v_curr_moni_value,v_moni_result_value,v_remark_info,v_time_stamp,v_contrs_stock_code,v_contrs_exch_no,v_contrs_max_moni_value;
        IF v_cursor_done THEN
            LEAVE productmonitorsetservice;
        END IF;


      /* set @监控设置序号# = @记录序号#; */
      set v_moni_set_id = v_row_id;

      /* SET @当前时间戳# = unix_timestamp(); */
      SET v_curr_tmstp = unix_timestamp();

      /* SET @更新精度# = 2; */
      SET v_update_preci_type = 2;

      /* IF ((@更新精度# = 1) and (@当前时间戳#-@时间戳#)>1) or ((@更新精度# = 2) and (@当前时间戳#-@时间戳#)>5) or ((@更新精度# = 3) and (@当前时间戳#-@时间戳#)>15) or ((@更新精度# = 4) and (@当前时间戳#-@时间戳#)>30) or ((@更新精度# = 5) and (@当前时间戳#-@时间戳#)>60) then */
      IF ((v_update_preci_type = 1) and (v_curr_tmstp-v_time_stamp)>1) or ((v_update_preci_type = 2) and (v_curr_tmstp-v_time_stamp)>5) or ((v_update_preci_type = 3) and (v_curr_tmstp-v_time_stamp)>15) or ((v_update_preci_type = 4) and (v_curr_tmstp-v_time_stamp)>30) or ((v_update_preci_type = 5) and (v_curr_tmstp-v_time_stamp)>60) then

        /* 调用【原子_风控证券_风控_计算账户风险监控设置计算值】*/
        call db_rksecu.pra_rkserk_CalcProductMonitorSetServiceValue(
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
            v_moni_value_type,
            v_moni_value_flag,
            v_contrs_stock_code,
            v_contrs_exch_no,
            v_error_code,
            v_error_info,
            v_curr_moni_value,
            v_cash_asset,
            v_fund_asset,
            v_bond_asset,
            v_stock_asset,
            v_repo_asset,
            v_nav_asset,
            v_contrs_curr_moni_value);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.29.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_计算账户风险监控设置计算值出现错误！',v_mysql_message);
            end if;
            close cur_productmonitorsetservice;
            leave label_pro;
        elseif v_error_code <> "0" then
            close cur_productmonitorsetservice;
            leave label_pro;
        end if;


        /* 调用【原子_风控证券_风控_更新账户风险监控设置计算值】*/
        call db_rksecu.pra_rkserk_UpdateProductMonitorSetServiceValue(
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
            v_close_posi_value,
            v_appd_value,
            v_begin_moni_value,
            v_max_moni_value,
            v_curr_moni_value,
            v_cash_asset,
            v_fund_asset,
            v_bond_asset,
            v_stock_asset,
            v_repo_asset,
            v_nav_asset,
            v_contrs_max_moni_value,
            v_contrs_curr_moni_value,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.29.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_更新账户风险监控设置计算值出现错误！',v_mysql_message);
            end if;
            close cur_productmonitorsetservice;
            leave label_pro;
        elseif v_error_code <> "0" then
            close cur_productmonitorsetservice;
            leave label_pro;
        end if;

      end if;

    /* [关闭游标][cur_productmonitorsetservice] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cur_productmonitorsetservice;
    end cur_productmonitorsetservice;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_计算账户风险监控设置计算值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_CalcProductMonitorSetServiceValue;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_CalcProductMonitorSetServiceValue(
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
    IN p_moni_value_type int,
    IN p_moni_value_flag int,
    IN p_contrs_stock_code varchar(6),
    IN p_contrs_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_moni_value decimal(18,4),
    OUT p_cash_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_stock_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_nav_asset decimal(18,4),
    OUT p_contrs_curr_moni_value decimal(18,4)
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
    declare v_moni_value_type int;
    declare v_moni_value_flag int;
    declare v_contrs_stock_code varchar(6);
    declare v_contrs_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_moni_value decimal(18,4);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
    declare v_pd_part_nav decimal(18,4);
    declare v_part_part_nav decimal(18,4);
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_total_stock_issue decimal(18,2);
    declare v_circl_stock_capit decimal(18,2);
    declare v_stock_type int;
    declare v_last_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_today_open_price decimal(16,9);
    declare v_strike_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_moni_value_type = p_moni_value_type;
    SET v_moni_value_flag = p_moni_value_flag;
    SET v_contrs_stock_code = p_contrs_stock_code;
    SET v_contrs_exch_no = p_contrs_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_moni_value = 0;
    SET v_cash_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_stock_asset = 0;
    SET v_repo_asset = 0;
    SET v_nav_asset = 0;
    SET v_contrs_curr_moni_value = 0;
    SET v_pd_part_nav = 0;
    SET v_part_part_nav = 0;
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_total_stock_issue = 0;
    SET v_circl_stock_capit = 0;
    SET v_stock_type = 0;
    SET v_last_price = 0;
    SET v_pre_close_price = 0;
    SET v_today_open_price = 0;
    SET v_strike_amt = 0;

    
    label_pro:BEGIN
    

    /* if @交易组编号串# = ' ' then */
    if v_exch_group_no_str = ' ' then
    #计算产品级

      /* if @监控值类型# = 1 then */
      if v_moni_value_type = 1 then

        /* 调用【原子_风控证券_计算_获取多产品单位净值】*/
        call db_rksecu.pra_rksecc_GetMultiProductNAV(
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
            v_error_code,
            v_error_info,
            v_pd_part_nav);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.30.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取多产品单位净值出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @当前监控值# =  @产品单位净值#; */
        set v_curr_moni_value =  v_pd_part_nav;

      /* elseif @监控值类型# = 2 then */
      elseif v_moni_value_type = 2 then

        /* 调用【原子_风控证券_计算_获取多产品净资产】*/
        call db_rksecu.pra_rksecc_GetMultiProductNetAsset(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no_str,
            v_error_code,
            v_error_info,
            v_nav_asset,
            v_cash_asset,
            v_fund_asset,
            v_bond_asset,
            v_repo_asset,
            v_stock_asset);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.30.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取多产品净资产出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @当前监控值# =  @净资产#; */
        set v_curr_moni_value =  v_nav_asset;
      end if;
    else
    #计算单元级

      /* if @监控值类型# = 1 then */
      if v_moni_value_type = 1 then

        /* 调用【原子_风控证券_计算_获取多单元单位净值】*/
        call db_rksecu.pra_rksecc_GetMultiUnitNAV(
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
            v_error_code,
            v_error_info,
            v_part_part_nav);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.30.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取多单元单位净值出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @当前监控值# =  @单元单位净值#; */
        set v_curr_moni_value =  v_part_part_nav;

      /* elseif @监控值类型# = 2 then */
      elseif v_moni_value_type = 2 then

        /* 调用【原子_风控证券_计算_获取多单元净资产】*/
        call db_rksecu.pra_rksecc_GetMultiUnitNetAsset(
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
            v_error_code,
            v_error_info,
            v_nav_asset,
            v_cash_asset,
            v_fund_asset,
            v_bond_asset,
            v_repo_asset,
            v_stock_asset);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.30.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取多单元净资产出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @当前监控值# =  @净资产#; */
        set v_curr_moni_value =  v_nav_asset;
      end if;
    end if;

    /* if @监控值方式# = 《监控值方式-对比最大回撤》 then */
    if v_moni_value_flag = 3 then

    /* set @证券代码# = @对比证券代码#; */
    set v_stock_code = v_contrs_stock_code;

    /* set @市场编号# = @对比市场编号#; */
    set v_exch_no = v_contrs_exch_no;

    /* 调用【原子_风控证券_计算_获取证券信息】*/
    call db_rksecu.pra_rksecc_GetStockInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_total_stock_issue,
        v_circl_stock_capit,
        v_stock_type,
        v_last_price,
        v_pre_close_price,
        v_today_open_price,
        v_strike_amt);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.4.30.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @对比当前监控值# = @最新价#; */
    set v_contrs_curr_moni_value = v_last_price;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_moni_value = v_curr_moni_value;
    SET p_cash_asset = v_cash_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_stock_asset = v_stock_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_nav_asset = v_nav_asset;
    SET p_contrs_curr_moni_value = v_contrs_curr_moni_value;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_更新账户风险监控设置计算值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_UpdateProductMonitorSetServiceValue;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_UpdateProductMonitorSetServiceValue(
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
    IN p_close_posi_value decimal(18,4),
    IN p_appd_value decimal(18,4),
    IN p_begin_moni_value decimal(18,4),
    IN p_max_moni_value decimal(18,4),
    IN p_curr_moni_value decimal(18,4),
    IN p_cash_asset decimal(18,4),
    IN p_fund_asset decimal(18,4),
    IN p_bond_asset decimal(18,4),
    IN p_stock_asset decimal(18,4),
    IN p_repo_asset decimal(18,4),
    IN p_nav_asset decimal(18,4),
    IN p_contrs_max_moni_value decimal(18,4),
    IN p_contrs_curr_moni_value decimal(18,4),
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
    declare v_moni_role_type int;
    declare v_moni_value_flag int;
    declare v_moni_value_type int;
    declare v_warn_posi_value decimal(18,4);
    declare v_close_posi_value decimal(18,4);
    declare v_appd_value decimal(18,4);
    declare v_begin_moni_value decimal(18,4);
    declare v_max_moni_value decimal(18,4);
    declare v_curr_moni_value decimal(18,4);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_moni_result_status varchar(2);
    declare v_moni_result_value decimal(18,4);
    declare v_curr_result_moni_value decimal(18,4);
    declare v_contrs_result_moni_value decimal(18,4);
    declare v_stock_asset_ratio decimal(18,12);
    declare v_update_date int;
    declare v_update_time int;
    declare v_curr_tmstp int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_close_posi_value = p_close_posi_value;
    SET v_appd_value = p_appd_value;
    SET v_begin_moni_value = p_begin_moni_value;
    SET v_max_moni_value = p_max_moni_value;
    SET v_curr_moni_value = p_curr_moni_value;
    SET v_cash_asset = p_cash_asset;
    SET v_fund_asset = p_fund_asset;
    SET v_bond_asset = p_bond_asset;
    SET v_stock_asset = p_stock_asset;
    SET v_repo_asset = p_repo_asset;
    SET v_nav_asset = p_nav_asset;
    SET v_contrs_max_moni_value = p_contrs_max_moni_value;
    SET v_contrs_curr_moni_value = p_contrs_curr_moni_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_moni_result_status = " ";
    SET v_moni_result_value = 0;
    SET v_curr_result_moni_value = 0;
    SET v_contrs_result_moni_value = 0;
    SET v_stock_asset_ratio = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_curr_tmstp = unix_timestamp();

    
    label_pro:BEGIN
    

    /* set @监控结果状态# = 《监控结果状态-正常》; */
    set v_moni_result_status = "1";

    /* if @最大监控值# < @当前监控值# then */
    if v_max_moni_value < v_curr_moni_value then

        /* set @最大监控值# = @当前监控值#; */
        set v_max_moni_value = v_curr_moni_value;
    end if;

    /* if @对比最大监控值# < @对比当前监控值# then */
    if v_contrs_max_moni_value < v_contrs_curr_moni_value then

        /* set @对比最大监控值# = @对比当前监控值#; */
        set v_contrs_max_moni_value = v_contrs_curr_moni_value;
    end if;

    /* if @监控值方式# = 《监控值方式-固定值》 then */
    if v_moni_value_flag = 1 then

      /* set @监控结果# = @当前监控值#; */
      set v_moni_result_value = v_curr_moni_value;

      /* if @当前监控值# <= @预警线# and @预警线# <> 0 then */
      if v_curr_moni_value <= v_warn_posi_value and v_warn_posi_value <> 0 then

        /* set @监控结果状态# = 《监控结果状态-预警》; */
        set v_moni_result_status = "2";
     end if;

      /* if @当前监控值# <= @追加线# and @追加线# <> 0 then */
      if v_curr_moni_value <= v_appd_value and v_appd_value <> 0 then

        /* set @监控结果状态# = 《监控结果状态-追加》; */
        set v_moni_result_status = "3";
     end if;

      /* if @当前监控值# <= @平仓线# and @平仓线# <> 0 then */
      if v_curr_moni_value <= v_close_posi_value and v_close_posi_value <> 0 then

        /* set @监控结果状态# = 《监控结果状态-止损》; */
        set v_moni_result_status = "4";
     end if;

    /* elseif @监控值方式# = 《监控值方式-最大回撤》 or @监控值方式#  = 《监控值方式-对比最大回撤》 then */
    elseif v_moni_value_flag = 2 or v_moni_value_flag  = 3 then

      /* if @最大监控值# > 0 then */
      if v_max_moni_value > 0 then

        /* set @当前监控结果# = round((@最大监控值#-@当前监控值#)/@最大监控值#,4); */
        set v_curr_result_moni_value = round((v_max_moni_value-v_curr_moni_value)/v_max_moni_value,4);

        /* set @监控结果# =@当前监控结果#; */
        set v_moni_result_value =v_curr_result_moni_value;

        /* if @监控值方式# = 《监控值方式-对比最大回撤》 then */
        if v_moni_value_flag = 3 then

          /* if @对比最大监控值# > 0 then */
          if v_contrs_max_moni_value > 0 then

            /* set @对比监控结果# = round((@对比最大监控值#-@对比当前监控值#)/@对比最大监控值#,4); */
            set v_contrs_result_moni_value = round((v_contrs_max_moni_value-v_contrs_curr_moni_value)/v_contrs_max_moni_value,4);

            /* if @对比监控结果# = 0 then */
            if v_contrs_result_moni_value = 0 then

              /* set @监控结果# = 0; */
              set v_moni_result_value = 0;

              /* if @当前监控结果# > 0 then */
              if v_curr_result_moni_value > 0 then

                /* set @监控结果# = -9999; */
                set v_moni_result_value = -9999;
              end if;
            else

              /* set @监控结果# = ifnull(round(@当前监控结果#/@对比监控结果#,4),0); */
              set v_moni_result_value = ifnull(round(v_curr_result_moni_value/v_contrs_result_moni_value,4),0);
            end if;
          else

            /* set @对比监控结果# =0; */
            set v_contrs_result_moni_value =0;

            /* set @监控结果# = 0; */
            set v_moni_result_value = 0;
          end if;
        end if;

        /* if @监控结果# >= @预警线# and @预警线# <> 0 then */
        if v_moni_result_value >= v_warn_posi_value and v_warn_posi_value <> 0 then

          /* set @监控结果状态# = 《监控结果状态-预警》; */
          set v_moni_result_status = "2";
       end if;

        /* if @监控结果# >= @追加线# and @追加线# <> 0 then */
        if v_moni_result_value >= v_appd_value and v_appd_value <> 0 then

          /* set @监控结果状态# = 《监控结果状态-追加》; */
          set v_moni_result_status = "3";
       end if;

        /* if (@监控结果# >= @平仓线#  or  (@监控结果# = -9999 and @监控值方式# = 《监控值方式-对比最大回撤》))  and @平仓线# <> 0 then */
        if (v_moni_result_value >= v_close_posi_value  or  (v_moni_result_value = -9999 and v_moni_value_flag = 3))  and v_close_posi_value <> 0 then

          /* set @监控结果状态# = 《监控结果状态-止损》; */
          set v_moni_result_status = "4";
        end if;
      end if;
    end if;

    /* if @净资产# <> 0 then */
    if v_nav_asset <> 0 then

      /* set @股票资产占比# = Round(@股票资产#/@净资产#,4); */
      set v_stock_asset_ratio = Round(v_stock_asset/v_nav_asset,4);
    end if;

    /* [更新表记录][风控证券_风控_账户风险监控设置表][{最大监控值}=@最大监控值#,{当前监控值}=@当前监控值#,{当前监控结果} = @当前监控结果#,{对比最大监控值}=@对比最大监控值#,{对比当前监控值}=@对比当前监控值#,{对比监控结果} = @对比监控结果#,{监控结果} = @监控结果#,{监控结果状态}=@监控结果状态#,{时间戳}=@当前时间戳#,{现金资产}=@现金资产#,{基金资产}=@基金资产#,{债券资产}=@债券资产#,{股票资产}=@股票资产#,{回购资产}=@回购资产#,{净资产}=@净资产#,{股票资产占比} = @股票资产占比#][{记录序号}=@监控设置序号#][2][@监控设置序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rkserk_product_monitor_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, max_moni_value=v_max_moni_value,curr_moni_value=v_curr_moni_value,curr_result_moni_value = v_curr_result_moni_value,contrs_max_moni_value=v_contrs_max_moni_value,contrs_curr_moni_value=v_contrs_curr_moni_value,contrs_result_moni_value = v_contrs_result_moni_value,moni_result_value = v_moni_result_value,moni_result_status=v_moni_result_status,time_stamp=v_curr_tmstp,cash_asset=v_cash_asset,fund_asset=v_fund_asset,bond_asset=v_bond_asset,stock_asset=v_stock_asset,repo_asset=v_repo_asset,nav_asset=v_nav_asset,stock_asset_ratio = v_stock_asset_ratio where row_id=v_moni_set_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.31.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("监控设置序号=",v_moni_set_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("监控设置序号=",v_moni_set_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_客户风险触警历史流水查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QueryHisSecuClientRiskTrig;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QueryHisSecuClientRiskTrig(
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
    

    /* [获取表记录][历史_风控证券_风控_客户风险触警流水表][字段][({触发阶段类型}=@触发阶段类型# or @触发阶段类型#=0) and {机构编号}=@机构编号# and ({风险采取行为}=@风险采取行为# or @风险采取行为# = " ") and ({风险规则类别}=@风险规则类别# or @风险规则类别# = 0) and case when @产品编号#=0 and @交易组编号#=0 THEN 1  when @产品编号#<>0 and @交易组编号#=0 THEN
 @产品编号# = {产品编号}  ELSE  @交易组编号# = {交易组编号}  END  and ({创建日期} between @开始日期# and @结束日期#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, client_risk_rule_id, 
        risk_item_id, compli_trig_id, co_no, pd_no, 
        exch_group_no, order_dir, dime_id, stock_code_no, 
        trig_stage_type, compli_calc_level, unit_nav_flag, trig_type, 
        compli_rules_remark, risk_rule_action, risk_rule_type, risk_rule_value_str, 
        risk_rule_calc_str, remark_info, opor_no, pd_no_str from db_rksecu_his.tbjour_rkserk_secu_client_risk_trig_his where (trig_stage_type=v_trig_stage_type or v_trig_stage_type=0) and co_no=v_co_no and (risk_rule_action=v_risk_rule_action or v_risk_rule_action = " ") and (risk_rule_type=v_risk_rule_type or v_risk_rule_type = 0) and case when v_pd_no=0 and v_exch_group_no=0 THEN 1  when v_pd_no<>0 and v_exch_group_no=0 THEN
     v_pd_no = pd_no  ELSE  v_exch_group_no = exch_group_no  END  and (create_date between v_begin_date and v_end_date);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, client_risk_rule_id, 
        risk_item_id, compli_trig_id, co_no, pd_no, 
        exch_group_no, order_dir, dime_id, stock_code_no, 
        trig_stage_type, compli_calc_level, unit_nav_flag, trig_type, 
        compli_rules_remark, risk_rule_action, risk_rule_type, risk_rule_value_str, 
        risk_rule_calc_str, remark_info, opor_no, pd_no_str from db_rksecu_his.tbjour_rkserk_secu_client_risk_trig_his where (trig_stage_type=v_trig_stage_type or v_trig_stage_type=0) and co_no=v_co_no and (risk_rule_action=v_risk_rule_action or v_risk_rule_action = " ") and (risk_rule_type=v_risk_rule_type or v_risk_rule_type = 0) and case when v_pd_no=0 and v_exch_group_no=0 THEN 1  when v_pd_no<>0 and v_exch_group_no=0 THEN
     v_pd_no = pd_no  ELSE  v_exch_group_no = exch_group_no  END  and (create_date between v_begin_date and v_end_date) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_条目查询客户产品交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QueryPdExchGroupByItem;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QueryPdExchGroupByItem(
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_risk_item_id = p_risk_item_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* [获取表记录][风控证券_风控_客户风险规则表][{产品编号串}, {交易组编号串}, {联合标志}][{机构编号}=@机构编号# and {模板序号}=0  and (@产品编号#=0 or instr(concat(";",{产品编号串}), concat(";",@产品编号#,";")) > 0 or {产品编号串}= "-1" ) and (@交易组编号#=0 or {交易组编号串} = " " or instr(concat(";",{交易组编号串}), concat(";",@交易组编号#,";")) > 0 or {交易组编号串}= "-1") and {风险条目序号} = @风险条目序号#][@指定行数#] */
    if v_row_count = -1 then
        select pd_no_str, exch_group_no_str, union_flag from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no=v_co_no and model_id=0  and (v_pd_no=0 or instr(concat(";",pd_no_str), concat(";",v_pd_no,";")) > 0 or pd_no_str= "-1" ) and (v_exch_group_no=0 or exch_group_no_str = " " or instr(concat(";",exch_group_no_str), concat(";",v_exch_group_no,";")) > 0 or exch_group_no_str= "-1") and risk_item_id = v_risk_item_id;
    else
        select pd_no_str, exch_group_no_str, union_flag from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no=v_co_no and model_id=0  and (v_pd_no=0 or instr(concat(";",pd_no_str), concat(";",v_pd_no,";")) > 0 or pd_no_str= "-1" ) and (v_exch_group_no=0 or exch_group_no_str = " " or instr(concat(";",exch_group_no_str), concat(";",v_exch_group_no,";")) > 0 or exch_group_no_str= "-1") and risk_item_id = v_risk_item_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_更新客户风险规则启用标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_UpdateClientRiskRuleFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_UpdateClientRiskRuleFlag(
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
    SET v_row_id = p_row_id;
    SET v_rule_flag = p_rule_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_risk_item_id_str = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][风控证券_风控_客户风险规则表][{启用标志}=@启用标志#][{机构编号}=@机构编号# and (@产品编号#=0 or instr(concat(";",{产品编号串}), concat(";",@产品编号#,";")) > 0) and (@记录序号# = 0 or {记录序号} = @记录序号#)][1][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rkserk_secu_client_risk_rule set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, rule_flag=v_rule_flag where co_no=v_co_no and (v_pd_no=0 or instr(concat(";",pd_no_str), concat(";",v_pd_no,";")) > 0) and (v_row_id = 0 or row_id = v_row_id);
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.34.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][风控证券_风控_客户风险规则表][group_concat({风险条目序号})][@风险条目序号串#][{机构编号}=@机构编号# and (@产品编号#=0 or instr(concat(";",{产品编号串}), concat(";",@产品编号#,";")) > 0) and (@记录序号# = 0 or {记录序号} = @记录序号#)][1][@产品编号#] */
    select group_concat(risk_item_id) into v_risk_item_id_str from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no=v_co_no and (v_pd_no=0 or instr(concat(";",pd_no_str), concat(";",v_pd_no,";")) > 0) and (v_row_id = 0 or row_id = v_row_id) limit 1;


    /* set @风险条目序号串# = concat(replace(@风险条目序号串#, ",",";"),";"); */
    set v_risk_item_id_str = concat(replace(v_risk_item_id_str, ",",";"),";");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_risk_item_id_str = v_risk_item_id_str;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_增加交易流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_AddTradeTrigRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_AddTradeTrigRecord(
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_trade_amt decimal(18,4);
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
    SET v_exch_no = p_exch_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_all_fee = p_all_fee;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_occur_amt = 0;
    SET v_occur_qty = 0;
    SET v_trade_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* if @订单方向# = 1 then */
    if v_order_dir = 1 then

      /* set @变动金额# = @订单价格# * @订单数量#; */
      set v_occur_amt = v_order_price * v_order_qty;

      /* set @变动数量# = @订单数量#; */
      set v_occur_qty = v_order_qty;

    /* elseif @订单方向# = 2 then */
    elseif v_order_dir = 2 then

      /* set @变动金额# = -1 * @订单价格# * @订单数量#; */
      set v_occur_amt = -1 * v_order_price * v_order_qty;

      /* set @变动数量# = -1 * @订单数量#; */
      set v_occur_qty = -1 * v_order_qty;
    else

      /* set @变动金额# = 0; */
      set v_occur_amt = 0;

      /* set @变动数量# = 0; */
      set v_occur_qty = 0;
    end if;

    /* set @交易金额# = @订单价格# * @订单数量#; */
    set v_trade_amt = v_order_price * v_order_qty;

    /* [插入重复更新][风控证券_风控_交易流水记录表][字段][字段变量][{变动数量} = {变动数量} + @变动数量#, {变动金额} = {变动金额} +  @变动金额#, {全部费用} = @全部费用# + {全部费用}, {交易金额} = @交易金额# + {交易金额}][1][@证券代码#,@交易组编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rkserk_trd_trig (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, exch_no, exch_crncy_type, stock_code, 
        occur_qty, occur_amt, all_fee, trade_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_exch_no, v_exch_crncy_type, v_stock_code, 
        v_occur_qty, v_occur_amt, v_all_fee, v_trade_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, occur_qty = occur_qty + v_occur_qty, occur_amt = occur_amt +  v_occur_amt, all_fee = v_all_fee + all_fee, trade_amt = v_trade_amt + trade_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.35.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_清空交易流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_DeleteTradeTrigRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_DeleteTradeTrigRecord(
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][风控证券_风控_交易流水记录表][{变动数量} = 0 , {变动金额} = 0, {全部费用} = 0, {交易金额} = 0][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {交易组编号} = @交易组编号# and {市场编号} = @市场编号# and {交易币种} = @交易币种# and {证券代码} = @证券代码#][3][@机构编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rkserk_trd_trig set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, occur_qty = 0 , occur_amt = 0, all_fee = 0, trade_amt = 0 where co_no = v_co_no and pd_no = v_pd_no and exch_group_no = v_exch_group_no and exch_no = v_exch_no and exch_crncy_type = v_exch_crncy_type and stock_code = v_stock_code;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.36.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_获取交易流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_GetTradeTrigRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_GetTradeTrigRecord(
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
    IN p_exch_no int,
    IN p_exch_crncy_type varchar(3),
    IN p_dime_id bigint,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_trig_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_fee decimal(18,4),
    OUT p_occur_qty decimal(18,2),
    OUT p_occur_amt decimal(18,4),
    OUT p_occur_market_value decimal(18,4),
    OUT p_per_secu_cost_amt decimal(18,4),
    OUT p_per_secu_market_value decimal(18,4),
    OUT p_trade_qty decimal(18,2),
    OUT p_trade_amt decimal(18,4)
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
    declare v_exch_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_dime_id bigint;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_trig_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_fee decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_occur_market_value decimal(18,4);
    declare v_per_secu_cost_amt decimal(18,4);
    declare v_per_secu_market_value decimal(18,4);
    declare v_trade_qty decimal(18,2);
    declare v_trade_amt decimal(18,4);
    declare v_tmp_all_fee decimal(18,4);
    declare v_tmp_occur_qty decimal(18,2);
    declare v_tmp_occur_amt decimal(18,4);
    declare v_tmp_occur_market_value decimal(18,4);
    declare v_tmp_exch_no int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
    declare v_all_fee decimal(18,4);
    declare v_tmp_trade_amt decimal(18,4);
    declare v_evalu_price decimal(16,9);
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_stock_code_no int;
    declare v_cash_asset_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_dime_id = p_dime_id;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_trig_type = p_trig_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_fee = 0;
    SET v_occur_qty = 0;
    SET v_occur_amt = 0;
    SET v_occur_market_value = 0;
    SET v_per_secu_cost_amt = 0;
    SET v_per_secu_market_value = 0;
    SET v_trade_qty = 0;
    SET v_trade_amt = 0;
    SET v_tmp_all_fee = 0;
    SET v_tmp_occur_qty = 0;
    SET v_tmp_occur_amt = 0;
    SET v_tmp_occur_market_value = 0;
    SET v_tmp_exch_no = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;
    SET v_all_fee = 0;
    SET v_tmp_trade_amt = 0;
    SET v_evalu_price = 0;
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_stock_code_no = 0;
    SET v_cash_asset_flag = 0;

    
    label_pro:BEGIN
    

    /* set @临时_全部费用# = 0; */
    set v_tmp_all_fee = 0;

    /* set @临时_变动数量# = 0; */
    set v_tmp_occur_qty = 0;

    /* set @临时_变动金额# = 0; */
    set v_tmp_occur_amt = 0;

    /* set @临时_变动市值# = 0; */
    set v_tmp_occur_market_value = 0;

    /* set @临时_市场编号# = @市场编号#; */
    set v_tmp_exch_no = v_exch_no;

    /* set @市场编号# = 3; */
    set v_exch_no = 3;

    /* 调用【原子_风控证券_计算_获取港股汇率】*/
    call db_rksecu.pra_rksecc_GetHKRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_buy_ref_rate,
        v_sell_ref_rate,
        v_settle_buy_rate,
        v_settle_sell_rate);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.4.37.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取港股汇率出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if  @订单方向# = 《订单方向-买入》 then */
    if  v_order_dir = 1 then

      /* set @买入参考汇率# = @卖出参考汇率#; */
      set v_buy_ref_rate = v_sell_ref_rate;
    end if;

    /* set @市场编号# = @临时_市场编号#; */
    set v_exch_no = v_tmp_exch_no;

    /* if @市场编号# = 1 or @市场编号# = 2 then */
    if v_exch_no = 1 or v_exch_no = 2 then

      /* [获取表记录变量语句][风控证券_风控_交易流水记录表][sum({变动金额}), sum({变动数量}), sum({全部费用}), sum({交易金额})][@变动金额#, @变动数量#, @全部费用#, @交易金额#][{机构编号} = @机构编号# and (instr(concat(";",@产品编号串#), concat(";",{产品编号},";")) > 0 or @产品编号串# = "-1") and (instr(concat(";",@交易组编号串#), concat(";",{交易组编号},";")) > 0 or @交易组编号串#=" " or @交易组编号串# = "-1")   and {交易币种} = @交易币种# and {市场编号} = @市场编号# and {证券代码} = @证券代码#] */
      select sum(occur_amt), sum(occur_qty), sum(all_fee), sum(trade_amt) into v_occur_amt, v_occur_qty, v_all_fee, v_trade_amt from db_rksecu.tb_rkserk_trd_trig where co_no = v_co_no and (instr(concat(";",v_pd_no_str), concat(";",pd_no,";")) > 0 or v_pd_no_str = "-1") and (instr(concat(";",v_exch_group_no_str), concat(";",exch_group_no,";")) > 0 or v_exch_group_no_str=" " or v_exch_group_no_str = "-1")   and exch_crncy_type = v_exch_crncy_type and exch_no = v_exch_no and stock_code = v_stock_code limit 1;

    else

      /* [获取表记录变量语句][风控证券_风控_交易流水记录表][sum({变动金额}* @买入参考汇率# ), sum({变动数量}), sum({全部费用}),sum({交易金额}* @买入参考汇率# )][@变动金额#, @变动数量#, @全部费用#, @交易金额#][{机构编号} = @机构编号# and (instr(concat(";",@产品编号串#), concat(";",{产品编号},";")) > 0 or @产品编号串# = "-1") and (instr(concat(";",@交易组编号串#), concat(";",{交易组编号},";")) > 0 or @交易组编号串#=" " or @交易组编号串# = "-1")   and {交易币种} = @交易币种#  and {证券代码} = @证券代码#] */
      select sum(occur_amt* v_buy_ref_rate ), sum(occur_qty), sum(all_fee),sum(trade_amt* v_buy_ref_rate ) into v_occur_amt, v_occur_qty, v_all_fee, v_trade_amt from db_rksecu.tb_rkserk_trd_trig where co_no = v_co_no and (instr(concat(";",v_pd_no_str), concat(";",pd_no,";")) > 0 or v_pd_no_str = "-1") and (instr(concat(";",v_exch_group_no_str), concat(";",exch_group_no,";")) > 0 or v_exch_group_no_str=" " or v_exch_group_no_str = "-1")   and exch_crncy_type = v_exch_crncy_type  and stock_code = v_stock_code limit 1;

    end if;

    /* set @临时_交易金额# = @交易金额#; */
    set v_tmp_trade_amt = v_trade_amt;

    /* set @单券成本# = @变动金额# + @全部费用#  * (case when @市场编号# = 3 or @市场编号# = 4 then @买入参考汇率# else 1 end); */
    set v_per_secu_cost_amt = v_occur_amt + v_all_fee  * (case when v_exch_no = 3 or v_exch_no = 4 then v_buy_ref_rate else 1 end);

    /* 调用【原子_风控证券_计算_获取证券估值价格】*/
    call db_rksecu.pra_rksecc_GetStockValuationPrice(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_evalu_price);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.4.37.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券估值价格出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @单券市值# = @变动数量# * @估值价格#; */
    set v_per_secu_market_value = v_occur_qty * v_evalu_price;

    /* set @交易数量# = @变动数量#; */
    set v_trade_qty = v_occur_qty;

    /* set @临时_市场编号# = @市场编号#; */
    set v_tmp_exch_no = v_exch_no;

    /* [获取表记录数量][风控证券_风控_交易流水记录表][@记录个数#][{机构编号} = @机构编号# and (instr(concat(";",@产品编号串#), concat(";",{产品编号},";")) > 0 or @产品编号串# = "-1") and (instr(concat(";",@交易组编号串#), concat(";",{交易组编号},";")) > 0 or @交易组编号串#=" " or @交易组编号串# = "-1") and {交易币种} = @交易币种#] */
    select count(1) into v_record_count from db_rksecu.tb_rkserk_trd_trig where co_no = v_co_no and (instr(concat(";",v_pd_no_str), concat(";",pd_no,";")) > 0 or v_pd_no_str = "-1") and (instr(concat(";",v_exch_group_no_str), concat(";",exch_group_no,";")) > 0 or v_exch_group_no_str=" " or v_exch_group_no_str = "-1") and exch_crncy_type = v_exch_crncy_type;


    /* if @记录个数# > 0 then */
    if v_record_count > 0 then

       /* [声明游标][风控证券_风控_交易流水记录表][字段][{机构编号} = @机构编号# and (instr(concat(";",@产品编号串#), concat(";",{产品编号},";")) > 0 or @产品编号串# = "-1") and (instr(concat(";",@交易组编号串#), concat(";",{交易组编号},";")) > 0 or @交易组编号串#=" " or @交易组编号串# = "-1")  and {交易币种} = @交易币种#][cursor_rkserk_trade_trig] */
       cursor_rkserk_trade_trig:BEGIN
       DECLARE v_cursor_done int default false;
       DECLARE cursor_rkserk_trade_trig CURSOR FOR
           select row_id, create_date, create_time, 
           update_date, update_time, update_times, co_no, 
           pd_no, exch_group_no, exch_no, exch_crncy_type, 
           stock_code, occur_qty, occur_amt, all_fee, 
           trade_amt 
           from db_rksecu.tb_rkserk_trd_trig 
           where co_no = v_co_no and (instr(concat(";",v_pd_no_str), concat(";",pd_no,";")) > 0 or v_pd_no_str = "-1") and (instr(concat(";",v_exch_group_no_str), concat(";",exch_group_no,";")) > 0 or v_exch_group_no_str=" " or v_exch_group_no_str = "-1")  and exch_crncy_type = v_exch_crncy_type;
       DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


       /* [打开游标][字段变量][cursor_rkserk_trade_trig][loop_rkserk_trade_trig] */
       open cursor_rkserk_trade_trig;
       loop_rkserk_trade_trig: LOOP
       fetch cursor_rkserk_trade_trig into v_row_id, v_create_date, v_create_time, 
           v_update_date, v_update_time, v_update_times, v_co_no, 
           v_pd_no, v_exch_group_no, v_exch_no, v_exch_crncy_type, 
           v_stock_code, v_occur_qty, v_occur_amt, v_all_fee, 
           v_trade_amt;
           IF v_cursor_done THEN
               LEAVE loop_rkserk_trade_trig;
           END IF;


          /* set @记录个数# = 0; */
          set v_record_count = 0;
          #判断是否为该维度下的并发交易

         /* 调用【原子_风控证券_维度_维度序号获取范围】*/
         call db_rksecu.pra_rksedm_GetRangeByDimeId(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_co_no,
             v_dime_id,
             v_exch_no,
             v_stock_code,
             v_order_dir,
             v_trig_type,
             v_error_code,
             v_error_info,
             v_record_count,
             v_stock_code_no,
             v_cash_asset_flag);
         if v_error_code = "1" then
             SET v_error_code = "rksecuA.4.37.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_维度_维度序号获取范围出现错误！',v_mysql_message);
             end if;
             close cursor_rkserk_trade_trig;
             leave label_pro;
         elseif v_error_code <> "0" then
             close cursor_rkserk_trade_trig;
             leave label_pro;
         end if;


         /* if @记录个数# > 0 then */
         if v_record_count > 0 then

            /* 调用【原子_风控证券_计算_获取证券估值价格】*/
            call db_rksecu.pra_rksecc_GetStockValuationPrice(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_exch_no,
                v_stock_code,
                v_error_code,
                v_error_info,
                v_evalu_price);
            if v_error_code = "1" then
                SET v_error_code = "rksecuA.4.37.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券估值价格出现错误！',v_mysql_message);
                end if;
                close cursor_rkserk_trade_trig;
                leave label_pro;
            elseif v_error_code <> "0" then
                close cursor_rkserk_trade_trig;
                leave label_pro;
            end if;


            /* set @临时_变动市值# = @临时_变动市值# + @变动数量# * @估值价格#; */
            set v_tmp_occur_market_value = v_tmp_occur_market_value + v_occur_qty * v_evalu_price;

            /* set @临时_全部费用# = @临时_全部费用# + @全部费用#; */
            set v_tmp_all_fee = v_tmp_all_fee + v_all_fee;

            /* set @临时_变动数量# = @临时_变动数量# + @变动数量#; */
            set v_tmp_occur_qty = v_tmp_occur_qty + v_occur_qty;

            /* set @临时_变动金额# = @临时_变动金额# + @变动金额# * (case when @市场编号# = 3 or @市场编号# = 4 then @买入参考汇率# else 1 end); */
            set v_tmp_occur_amt = v_tmp_occur_amt + v_occur_amt * (case when v_exch_no = 3 or v_exch_no = 4 then v_buy_ref_rate else 1 end);
         end if;

       /* [关闭游标][cursor_rkserk_trade_trig] */
           IF v_cursor_done THEN
               set v_cursor_done = false;
           END IF;
       END LOOP;
       close cursor_rkserk_trade_trig;
       end cursor_rkserk_trade_trig;

    end if;

    /* set @交易费用# = @临时_全部费用#; */
    set v_trade_fee = v_tmp_all_fee;

    /* set @变动数量# = @临时_变动数量#; */
    set v_occur_qty = v_tmp_occur_qty;

    /* set @变动市值# = @临时_变动市值#; */
    set v_occur_market_value = v_tmp_occur_market_value;

    /* set @变动金额# = @临时_变动金额#; */
    set v_occur_amt = v_tmp_occur_amt;

    /* set @交易金额#  =@临时_交易金额#; */
    set v_trade_amt  =v_tmp_trade_amt;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_fee = v_trade_fee;
    SET p_occur_qty = v_occur_qty;
    SET p_occur_amt = v_occur_amt;
    SET p_occur_market_value = v_occur_market_value;
    SET p_per_secu_cost_amt = v_per_secu_cost_amt;
    SET p_per_secu_market_value = v_per_secu_market_value;
    SET p_trade_qty = v_trade_qty;
    SET p_trade_amt = v_trade_amt;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_批量清空交易流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_DeleteBatchTradeTrigRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_DeleteBatchTradeTrigRecord(
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_exch_crncy_type_str = p_exch_crncy_type_str;
    SET v_stock_code_str = p_stock_code_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][风控证券_风控_交易流水记录表][{变动数量} = 0 , {变动金额} = 0, {全部费用} = 0, {交易金额} = 0][{机构编号} = @机构编号# and {机构编号} = @机构编号# and instr(concat(";", @产品编号串#,";"),concat(";", {产品编号},";"))>0 and instr(concat(";", @交易组编号串#,";"),concat(";", {交易组编号},";"))>0  and instr(concat(";", @交易币种串#,";"),concat(";", {交易币种},";"))>0 and instr(concat(";", @市场编号串#,";"),concat(";", {市场编号},";"))>0 and instr(concat(";", @证券代码串#,";"),concat(";", {证券代码},";"))>0][3][@机构编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rkserk_trd_trig set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, occur_qty = 0 , occur_amt = 0, all_fee = 0, trade_amt = 0 where co_no = v_co_no and co_no = v_co_no and instr(concat(";", v_pd_no_str,";"),concat(";", pd_no,";"))>0 and instr(concat(";", v_exch_group_no_str,";"),concat(";", exch_group_no,";"))>0  and instr(concat(";", v_exch_crncy_type_str,";"),concat(";", exch_crncy_type,";"))>0 and instr(concat(";", v_exch_no_str,";"),concat(";", exch_no,";"))>0 and instr(concat(";", v_stock_code_str,";"),concat(";", stock_code,";"))>0;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.38.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_获取对应风控计算值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_GetCalcResult;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_GetCalcResult(
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
    IN p_trig_stage_type int,
    IN p_client_risk_rule_id int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_risk_rule_calc_str varchar(255),
    OUT p_pd_no_str varchar(2048),
    OUT p_exch_group_no_str varchar(2048)
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
    declare v_trig_stage_type int;
    declare v_client_risk_rule_id int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_risk_rule_calc_str varchar(255);
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_client_risk_rule_id = p_client_risk_rule_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_risk_rule_calc_str = " ";
    SET v_pd_no_str = " ";
    SET v_exch_group_no_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][风控证券_风控_层次计算结果表][{风险计算值串}, {产品编号串}, {交易组编号串}][@风险计算值串#,@产品编号串#, @交易组编号串#][{机构编号} = @机构编号# and {触发阶段类型} = @触发阶段类型# and {客户风险规则序号} = @客户风险规则序号# and ({产品编号串} = "-1" or {产品编号串} like concat("%",@产品编号#,"%"))  and ({交易组编号串}=" " or {交易组编号串} = "-1" or {交易组编号串} like concat("%",@交易组编号#,"%"))][908][@客户风险规则序号#] */
    select risk_rule_calc_str, pd_no_str, exch_group_no_str into v_risk_rule_calc_str,v_pd_no_str, v_exch_group_no_str from db_rksecu.tb_rkserk_stage_calc where co_no = v_co_no and trig_stage_type = v_trig_stage_type and client_risk_rule_id = v_client_risk_rule_id and (pd_no_str = "-1" or pd_no_str like concat("%",v_pd_no,"%"))  and (exch_group_no_str=" " or exch_group_no_str = "-1" or exch_group_no_str like concat("%",v_exch_group_no,"%")) limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "rksecuA.4.39.908";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("客户风险规则序号=",v_client_risk_rule_id);
        end if;
        leave label_pro;
    end if;


    /* IF right(@产品编号串#,1) <> ";" and @产品编号串# <> "-1"  then */
    IF right(v_pd_no_str,1) <> ";" and v_pd_no_str <> "-1"  then

      /* set @产品编号串# = concat(@产品编号串#, ";"); */
      set v_pd_no_str = concat(v_pd_no_str, ";");
    end if ;
    #补上分号

    /* IF right(@交易组编号串#,1) <> ";" and @交易组编号串# <> " "  and @交易组编号串# <> "-1"   then */
    IF right(v_exch_group_no_str,1) <> ";" and v_exch_group_no_str <> " "  and v_exch_group_no_str <> "-1"   then

      /* set @交易组编号串# = concat(@交易组编号串#, ";"); */
      set v_exch_group_no_str = concat(v_exch_group_no_str, ";");
    end if ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_risk_rule_calc_str = v_risk_rule_calc_str;
    SET p_pd_no_str = v_pd_no_str;
    SET p_exch_group_no_str = v_exch_group_no_str;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_风控数据归历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_SecuDataToHis;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_SecuDataToHis(
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
    declare v_table_name varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_table_name = " ";

    
    label_pro:BEGIN
    

    /* [清空表记录][风控证券_风控_交易流水记录表] */
    truncate table db_rksecu.tb_rkserk_trd_trig;

    #[清空表记录][风控证券_风控_层次计算结果表]

    /* set @数据表名称# = "~历史_风控证券_风控_T0操作员阈值计算表^"; */
    set v_table_name = "db_rksecu_his.tb_rkserk_opor_tshold_result_his";
    #[删除表记录][历史_风控证券_风控_T0操作员阈值计算表][{初始化日期}=@初始化日期#][1280][@初始化日期#,@数据表名称#]

    /* [不分日期数据归历史][风控证券_风控_T0操作员阈值计算表][字段][1281][@初始化日期#,@数据表名称#] */
    insert into db_rksecu_his.tb_rkserk_opor_tshold_result_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, detail_posi_id, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        lngsht_type, curr_qty, open_posi_date, open_posi_time, 
        open_posi_price, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_market_value, close_posi_fee, realize_pandl, pandl_ratio, 
        un_close_posi_qty, un_close_marke_value, last_price, up_limit_price, 
        down_limit_price, cost_price, last_tshold_value, float_pandl, 
        posi_status, moni_result_status, posi_limit_status, opor_warn_tshold, 
        opor_stop_tshold, stock_warn_ratio, stock_stop_ratio, stock_warn_amt, 
        stock_stop_amt, open_close_permission, posi_limit_time) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, detail_posi_id, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        lngsht_type, curr_qty, open_posi_date, open_posi_time, 
        open_posi_price, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_market_value, close_posi_fee, realize_pandl, pandl_ratio, 
        un_close_posi_qty, un_close_marke_value, last_price, up_limit_price, 
        down_limit_price, cost_price, last_tshold_value, float_pandl, 
        posi_status, moni_result_status, posi_limit_status, opor_warn_tshold, 
        opor_stop_tshold, stock_warn_ratio, stock_stop_ratio, stock_warn_amt, 
        stock_stop_amt, open_close_permission, posi_limit_time 
        from db_rksecu.tb_rkserk_opor_tshold_result;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.40.1281";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][风控证券_风控_T0操作员阈值计算表][1=1][1282][@初始化日期#,@数据表名称#] */
    delete from db_rksecu.tb_rkserk_opor_tshold_result 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.4.40.1282";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~历史_风控证券_风控_T0操作员阈值汇总计算表^"; */
    set v_table_name = "db_rksecu_his.tb_rkserk_opor_tshold_sum_result_his";
    #[删除表记录][历史_风控证券_风控_T0操作员阈值汇总计算表][{初始化日期}=@初始化日期#][1290][@初始化日期#,@数据表名称#]

    /* [不分日期数据归历史][风控证券_风控_T0操作员阈值汇总计算表][字段][1291][@初始化日期#,@数据表名称#] */
    insert into db_rksecu_his.tb_rkserk_opor_tshold_sum_result_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        curr_qty, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_market_value, close_posi_fee, realize_pandl, float_pandl, 
        pandl_ratio, un_close_posi_qty, un_close_marke_value, last_tshold_value, 
        moni_result_status, opor_warn_tshold, opor_stop_tshold, open_close_permission) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        curr_qty, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_market_value, close_posi_fee, realize_pandl, float_pandl, 
        pandl_ratio, un_close_posi_qty, un_close_marke_value, last_tshold_value, 
        moni_result_status, opor_warn_tshold, opor_stop_tshold, open_close_permission 
        from db_rksecu.tb_rkserk_opor_tshold_sum_result;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.40.1291";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][风控证券_风控_T0操作员阈值汇总计算表][1=1][1292][@初始化日期#,@数据表名称#] */
    delete from db_rksecu.tb_rkserk_opor_tshold_sum_result 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.4.40.1292";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [清空表记录][风控证券_风控_预订单信息表] */
    truncate table db_rksecu.tb_rkserk_preorder;


    /* [清空表记录][风控证券_风控_预指令信息表] */
    truncate table db_rksecu.tb_rkserk_precommand;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_T0操作员阈值信息查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_T0QueryOporTsholdInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_T0QueryOporTsholdInfo(
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_last_tshold_value = p_last_tshold_value;
    SET v_posi_status = p_posi_status;
    SET v_co_no = p_co_no;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* SET @指定行数# = -1; */
    SET v_row_count = -1;

    /* [获取表记录][风控证券_风控_T0操作员阈值计算表][字段][{机构编号} = @机构编号# and ((@查询操作员编号# = 0) or ({操作员编号} = @查询操作员编号#)) and (@持仓状态# = " " or {持仓状态} = @持仓状态#) and (@最新阈值# = 0 or {最新阈值} < @最新阈值#) and (@可操作操作员编号串#=" " or instr(@可操作操作员编号串#, concat(";",{操作员编号},";"))>0) ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        detail_posi_id, co_no, pd_no, exch_group_no, 
        asset_acco_no, exch_no, stock_code, stock_acco_no, 
        stock_code_no, lngsht_type, curr_qty, open_posi_date, 
        open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
        close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
        pandl_ratio, un_close_posi_qty, un_close_marke_value, last_price, 
        up_limit_price, down_limit_price, cost_price, last_tshold_value, 
        float_pandl, posi_status, moni_result_status, posi_limit_status, 
        opor_warn_tshold, opor_stop_tshold, stock_warn_ratio, stock_stop_ratio, 
        stock_warn_amt, stock_stop_amt, open_close_permission, posi_limit_time from db_rksecu.tb_rkserk_opor_tshold_result where co_no = v_co_no and ((v_query_opor_no = 0) or (opor_no = v_query_opor_no)) and (v_posi_status = " " or posi_status = v_posi_status) and (v_last_tshold_value = 0 or last_tshold_value < v_last_tshold_value) and (v_allow_opor_no_str=" " or instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0) ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        detail_posi_id, co_no, pd_no, exch_group_no, 
        asset_acco_no, exch_no, stock_code, stock_acco_no, 
        stock_code_no, lngsht_type, curr_qty, open_posi_date, 
        open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
        close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
        pandl_ratio, un_close_posi_qty, un_close_marke_value, last_price, 
        up_limit_price, down_limit_price, cost_price, last_tshold_value, 
        float_pandl, posi_status, moni_result_status, posi_limit_status, 
        opor_warn_tshold, opor_stop_tshold, stock_warn_ratio, stock_stop_ratio, 
        stock_warn_amt, stock_stop_amt, open_close_permission, posi_limit_time from db_rksecu.tb_rkserk_opor_tshold_result where co_no = v_co_no and ((v_query_opor_no = 0) or (opor_no = v_query_opor_no)) and (v_posi_status = " " or posi_status = v_posi_status) and (v_last_tshold_value = 0 or last_tshold_value < v_last_tshold_value) and (v_allow_opor_no_str=" " or instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0)  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_T0操作员阈值信息更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_T0UpdateOporTsholdInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_T0UpdateOporTsholdInfo(
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][风控证券_风控_T0操作员阈值计算表][字段][字段变量][{当前数量}=@当前数量#,
{开仓日期}=@开仓日期#,
{开仓时间}=@开仓时间#,
{开仓价格}=@开仓价格#,
{开仓市值}=@开仓市值#,
{开仓费用}=@开仓费用#,
{平仓数量}=@平仓数量#,
{平仓市值}=@平仓市值#,
{平仓费用}=@平仓费用#,
{实现盈亏}=@实现盈亏#,
{盈亏比例}=@盈亏比例#,
{未平仓数量}=@未平仓数量#,
{未平仓市值}=@未平仓市值#,
{最新价}=@最新价#,
{涨停价}=@涨停价#,
{跌停价}=@跌停价#,{成本价} = @成本价#,
{最新阈值}=@最新阈值#,
{浮动盈亏}=@浮动盈亏#,
{持仓状态}=@持仓状态#,
{监控结果状态}=@监控结果状态#,
{持仓时限状态}=@持仓时限状态#,
{操作员预警阈值}=@操作员预警阈值#,
{操作员止损阈值}=@操作员止损阈值#,
{单券预警比例}=@单券预警比例#,
{单券止损比例}=@单券止损比例#,
{单券预警金额}=@单券预警金额#,
{单券止损金额}=@单券止损金额#,
{开平仓权限}=@开平仓权限#,
{持仓时限}=@持仓时限#][1][@明细持仓序号#,@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rkserk_opor_tshold_result (
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, detail_posi_id, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        lngsht_type, curr_qty, open_posi_date, open_posi_time, 
        open_posi_price, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_market_value, close_posi_fee, realize_pandl, pandl_ratio, 
        un_close_posi_qty, un_close_marke_value, last_price, up_limit_price, 
        down_limit_price, cost_price, last_tshold_value, float_pandl, 
        posi_status, moni_result_status, posi_limit_status, opor_warn_tshold, 
        opor_stop_tshold, stock_warn_ratio, stock_stop_ratio, stock_warn_amt, 
        stock_stop_amt, open_close_permission, posi_limit_time) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_detail_posi_id, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_code, v_stock_acco_no, v_stock_code_no, 
        v_lngsht_type, v_curr_qty, v_open_posi_date, v_open_posi_time, 
        v_open_posi_price, v_open_posi_value, v_open_posi_fee, v_close_posi_qty, 
        v_close_posi_market_value, v_close_posi_fee, v_realize_pandl, v_pandl_ratio, 
        v_un_close_posi_qty, v_un_close_marke_value, v_last_price, v_up_limit_price, 
        v_down_limit_price, v_cost_price, v_last_tshold_value, v_float_pandl, 
        v_posi_status, v_moni_result_status, v_posi_limit_status, v_opor_warn_tshold, 
        v_opor_stop_tshold, v_stock_warn_ratio, v_stock_stop_ratio, v_stock_warn_amt, 
        v_stock_stop_amt, v_open_close_permission, v_posi_limit_time) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=v_curr_qty,
    open_posi_date=v_open_posi_date,
    open_posi_time=v_open_posi_time,
    open_posi_price=v_open_posi_price,
    open_posi_value=v_open_posi_value,
    open_posi_fee=v_open_posi_fee,
    close_posi_qty=v_close_posi_qty,
    close_posi_market_value=v_close_posi_market_value,
    close_posi_fee=v_close_posi_fee,
    realize_pandl=v_realize_pandl,
    pandl_ratio=v_pandl_ratio,
    un_close_posi_qty=v_un_close_posi_qty,
    un_close_marke_value=v_un_close_marke_value,
    last_price=v_last_price,
    up_limit_price=v_up_limit_price,
    down_limit_price=v_down_limit_price,cost_price = v_cost_price,
    last_tshold_value=v_last_tshold_value,
    float_pandl=v_float_pandl,
    posi_status=v_posi_status,
    moni_result_status=v_moni_result_status,
    posi_limit_status=v_posi_limit_status,
    opor_warn_tshold=v_opor_warn_tshold,
    opor_stop_tshold=v_opor_stop_tshold,
    stock_warn_ratio=v_stock_warn_ratio,
    stock_stop_ratio=v_stock_stop_ratio,
    stock_warn_amt=v_stock_warn_amt,
    stock_stop_amt=v_stock_stop_amt,
    open_close_permission=v_open_close_permission,
    posi_limit_time=v_posi_limit_time;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.42.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id,",","机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("明细持仓序号=",v_detail_posi_id,",","机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_T0操作员汇总阈值信息更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_T0UpdateSumOporTsholdInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_T0UpdateSumOporTsholdInfo(
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][风控证券_风控_T0操作员阈值汇总计算表][字段][字段变量][
{当前数量}=@当前数量#,
{开仓市值}=@开仓市值#,
{开仓费用}=@开仓费用#,
{平仓数量}=@平仓数量#,
{平仓市值}=@平仓市值#,
{平仓费用}=@平仓费用#,
{实现盈亏}=@实现盈亏#,
{盈亏比例}=@盈亏比例#,
{未平仓数量}=@未平仓数量#,
{未平仓市值}=@未平仓市值#,
{最新阈值}=@最新阈值#,
{浮动盈亏}=@浮动盈亏#,
{监控结果状态}=@监控结果状态#,
{操作员预警阈值}=@操作员预警阈值#,
{操作员止损阈值}=@操作员止损阈值#,
{开平仓权限}=@开平仓权限#][1][@操作员编号#,@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rkserk_opor_tshold_sum_result (
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        curr_qty, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_market_value, close_posi_fee, realize_pandl, float_pandl, 
        pandl_ratio, un_close_posi_qty, un_close_marke_value, last_tshold_value, 
        moni_result_status, opor_warn_tshold, opor_stop_tshold, open_close_permission) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_co_no, 
        v_curr_qty, v_open_posi_value, v_open_posi_fee, v_close_posi_qty, 
        v_close_posi_market_value, v_close_posi_fee, v_realize_pandl, v_float_pandl, 
        v_pandl_ratio, v_un_close_posi_qty, v_un_close_marke_value, v_last_tshold_value, 
        v_moni_result_status, v_opor_warn_tshold, v_opor_stop_tshold, v_open_close_permission) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, 
    curr_qty=v_curr_qty,
    open_posi_value=v_open_posi_value,
    open_posi_fee=v_open_posi_fee,
    close_posi_qty=v_close_posi_qty,
    close_posi_market_value=v_close_posi_market_value,
    close_posi_fee=v_close_posi_fee,
    realize_pandl=v_realize_pandl,
    pandl_ratio=v_pandl_ratio,
    un_close_posi_qty=v_un_close_posi_qty,
    un_close_marke_value=v_un_close_marke_value,
    last_tshold_value=v_last_tshold_value,
    float_pandl=v_float_pandl,
    moni_result_status=v_moni_result_status,
    opor_warn_tshold=v_opor_warn_tshold,
    opor_stop_tshold=v_opor_stop_tshold,
    open_close_permission=v_open_close_permission;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.43.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_清空层次计算表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksepb_TruncateCalcTable;;
DELIMITER ;;
CREATE PROCEDURE pra_rksepb_TruncateCalcTable(
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
    

    /* [清空表记录][风控证券_风控_交易流水记录表] */
    truncate table db_rksecu.tb_rkserk_trd_trig;


    /* [清空表记录][风控证券_风控_层次计算结果表] */
    truncate table db_rksecu.tb_rkserk_stage_calc;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_T0操作员阈值信息汇总查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_T0QueryOporTsholdSumInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_T0QueryOporTsholdSumInfo(
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_last_tshold_value = p_last_tshold_value;
    SET v_posi_status = p_posi_status;
    SET v_co_no = p_co_no;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* SET @指定行数# = -1; */
    SET v_row_count = -1;

    /* [获取表记录][风控证券_风控_T0操作员阈值汇总计算表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},
{操作员编号},
0 as {明细持仓序号},
{机构编号},
0 as {产品编号},
0 as {交易组编号},
0 as {资产账户编号},
0 as {市场编号},
' ' as {证券代码},
' ' as {股东代码编号},
' ' as {证券代码编号},
0 as {多空类型},
{当前数量},
0 as {开仓日期},
0 as {开仓时间},
0 as {开仓价格},
{开仓市值},
{开仓费用},
{平仓数量},
{平仓市值},
{平仓费用},
{实现盈亏},
{盈亏比例},
{未平仓数量},
{未平仓市值},
0 as {最新价},
0 as {涨停价},
0 as {跌停价},
{最新阈值},
{浮动盈亏},
0 as {持仓状态},
{监控结果状态},
0 as {持仓时限状态},
0 as {操作员预警阈值},
0 as {操作员止损阈值},
0 as {单券预警比例},
0 as {单券止损比例},
0 as {单券预警金额},
0 as {单券止损金额},
{开平仓权限},
0 as {持仓时限}][{机构编号} = @机构编号# and ((@查询操作员编号# = 0) or ({操作员编号} = @查询操作员编号#)) and (@最新阈值# = 0 or {最新阈值} < @最新阈值#) and (@可操作操作员编号串#=" " or instr(@可操作操作员编号串#, concat(";",{操作员编号},";"))>0) ][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,update_times,
    opor_no,
    0 as detail_posi_id,
    co_no,
    0 as pd_no,
    0 as exch_group_no,
    0 as asset_acco_no,
    0 as exch_no,
    ' ' as stock_code,
    ' ' as stock_acco_no,
    ' ' as stock_code_no,
    0 as lngsht_type,
    curr_qty,
    0 as open_posi_date,
    0 as open_posi_time,
    0 as open_posi_price,
    open_posi_value,
    open_posi_fee,
    close_posi_qty,
    close_posi_market_value,
    close_posi_fee,
    realize_pandl,
    pandl_ratio,
    un_close_posi_qty,
    un_close_marke_value,
    0 as last_price,
    0 as up_limit_price,
    0 as down_limit_price,
    last_tshold_value,
    float_pandl,
    0 as posi_status,
    moni_result_status,
    0 as posi_limit_status,
    0 as opor_warn_tshold,
    0 as opor_stop_tshold,
    0 as stock_warn_ratio,
    0 as stock_stop_ratio,
    0 as stock_warn_amt,
    0 as stock_stop_amt,
    open_close_permission,
    0 as posi_limit_time from db_rksecu.tb_rkserk_opor_tshold_sum_result where co_no = v_co_no and ((v_query_opor_no = 0) or (opor_no = v_query_opor_no)) and (v_last_tshold_value = 0 or last_tshold_value < v_last_tshold_value) and (v_allow_opor_no_str=" " or instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0) ;
    else
        select row_id,create_date,create_time,update_date,update_time,update_times,
    opor_no,
    0 as detail_posi_id,
    co_no,
    0 as pd_no,
    0 as exch_group_no,
    0 as asset_acco_no,
    0 as exch_no,
    ' ' as stock_code,
    ' ' as stock_acco_no,
    ' ' as stock_code_no,
    0 as lngsht_type,
    curr_qty,
    0 as open_posi_date,
    0 as open_posi_time,
    0 as open_posi_price,
    open_posi_value,
    open_posi_fee,
    close_posi_qty,
    close_posi_market_value,
    close_posi_fee,
    realize_pandl,
    pandl_ratio,
    un_close_posi_qty,
    un_close_marke_value,
    0 as last_price,
    0 as up_limit_price,
    0 as down_limit_price,
    last_tshold_value,
    float_pandl,
    0 as posi_status,
    moni_result_status,
    0 as posi_limit_status,
    0 as opor_warn_tshold,
    0 as opor_stop_tshold,
    0 as stock_warn_ratio,
    0 as stock_stop_ratio,
    0 as stock_warn_amt,
    0 as stock_stop_amt,
    open_close_permission,
    0 as posi_limit_time from db_rksecu.tb_rkserk_opor_tshold_sum_result where co_no = v_co_no and ((v_query_opor_no = 0) or (opor_no = v_query_opor_no)) and (v_last_tshold_value = 0 or last_tshold_value < v_last_tshold_value) and (v_allow_opor_no_str=" " or instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0)  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_新增操作员风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_InsertOporMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_InsertOporMonitorSet(
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
    declare v_moni_result_status varchar(2);
    declare v_moni_set_status varchar(2);
    declare v_curr_moni_value decimal(18,4);
    declare v_moni_result_value decimal(18,4);
    declare v_time_stamp int;
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_stock_asset_ratio decimal(18,12);
    declare v_nav_asset decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
    declare v_curr_result_moni_value decimal(18,4);
    declare v_contrs_result_moni_value decimal(18,4);
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
    SET v_moni_result_status = " ";
    SET v_moni_set_status = " ";
    SET v_curr_moni_value = 0;
    SET v_moni_result_value = 0;
    SET v_time_stamp = unix_timestamp();
    SET v_cash_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_stock_asset = 0;
    SET v_repo_asset = 0;
    SET v_stock_asset_ratio = 0;
    SET v_nav_asset = 0;
    SET v_contrs_curr_moni_value = 0;
    SET v_curr_result_moni_value = 0;
    SET v_contrs_result_moni_value = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* SET @监控结果状态# = '1'; */
    SET v_moni_result_status = '1';

    /* SET @监控设置状态# = '1'; */
    SET v_moni_set_status = '1';

    /* set @当前监控值# = 0; */
    set v_curr_moni_value = 0;

    /* set @监控结果# = 0; */
    set v_moni_result_value = 0;

    /* set @时间戳# = unix_timestamp(); */
    set v_time_stamp = unix_timestamp();

    /* set @现金资产# = 0; */
    set v_cash_asset = 0;

    /* set @基金资产# = 0; */
    set v_fund_asset = 0;

    /* set @债券资产# = 0; */
    set v_bond_asset = 0;

    /* set @股票资产# = 0; */
    set v_stock_asset = 0;

    /* set @回购资产# = 0; */
    set v_repo_asset = 0;

    /* set @股票资产占比# = 0; */
    set v_stock_asset_ratio = 0;

    /* set @净资产# = 0; */
    set v_nav_asset = 0;

    /* set @对比当前监控值# = 0; */
    set v_contrs_curr_moni_value = 0;

    /* set @当前监控结果# = 0; */
    set v_curr_result_moni_value = 0;

    /* set @对比监控结果# = 0; */
    set v_contrs_result_moni_value = 0;

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* [插入表记录][风控证券_风控_操作员风险监控设置表][字段][字段变量][1][@操作员编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rkserk_opor_monitor_set(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, opor_no, 
        moni_role_type, moni_value_flag, moni_value_type, warn_posi_value, 
        warn_trig_oper_type, close_posi_value, close_trig_oper_type, appd_value, 
        appd_trig_oper_type, begin_moni_date, begin_moni_value, max_moni_value, 
        curr_moni_value, curr_result_moni_value, contrs_stock_code, contrs_exch_no, 
        contrs_max_moni_value, contrs_curr_moni_value, contrs_result_moni_value, moni_result_value, 
        moni_result_status, moni_set_status, cash_asset, fund_asset, 
        bond_asset, stock_asset, repo_asset, nav_asset, 
        stock_asset_ratio, close_posi_flag, close_ratio_level_one, close_ratio_level_two, 
        close_ratio_level_three, remark_info, time_stamp) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_opor_no, 
        v_moni_role_type, v_moni_value_flag, v_moni_value_type, v_warn_posi_value, 
        v_warn_trig_oper_type, v_close_posi_value, v_close_trig_oper_type, v_appd_value, 
        v_appd_trig_oper_type, v_begin_moni_date, v_begin_moni_value, v_max_moni_value, 
        v_curr_moni_value, v_curr_result_moni_value, v_contrs_stock_code, v_contrs_exch_no, 
        v_contrs_max_moni_value, v_contrs_curr_moni_value, v_contrs_result_moni_value, v_moni_result_value, 
        v_moni_result_status, v_moni_set_status, v_cash_asset, v_fund_asset, 
        v_bond_asset, v_stock_asset, v_repo_asset, v_nav_asset, 
        v_stock_asset_ratio, v_close_posi_flag, v_close_ratio_level_one, v_close_ratio_level_two, 
        v_close_ratio_level_three, v_remark_info, v_time_stamp);
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.46.1";
        SET v_error_info =  CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
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

# 原子_风控证券_风控_修改操作员风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_UpdateOporMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_UpdateOporMonitorSet(
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][风控证券_风控_操作员风险监控设置表][{操作员编号}=@业务操作员编号#,{监控角色}=@监控角色#,{监控值方式} = @监控值方式#,{监控值类型}=@监控值类型#,{预警线}=@预警线#,{平仓线}=@平仓线#,{追加线}=@追加线#,{起始监控值}=@起始监控值#,{最大监控值}=@最大监控值#,{当前监控值} = @当前监控值#,{备注信息}=@备注信息#,{平仓方式}=@平仓方式#,{一级平仓比例}=@一级平仓比例#,{二级平仓比例}=@二级平仓比例#,{三级平仓比例}=@三级平仓比例#,{对比证券代码}=@对比证券代码#,{对比市场编号}=@对比市场编号#,{对比最大监控值}=@对比最大监控值#,{起始监控日期} = @起始监控日期#,{预警触警操作方式}= @预警触警操作方式#,{平仓触警操作方式}= @平仓触警操作方式#,{追加触警操作方式}= @追加触警操作方式#][{记录序号}=@监控设置序号#][2][@监控设置序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rkserk_opor_monitor_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, opor_no=v_busi_opor_no,moni_role_type=v_moni_role_type,moni_value_flag = v_moni_value_flag,moni_value_type=v_moni_value_type,warn_posi_value=v_warn_posi_value,close_posi_value=v_close_posi_value,appd_value=v_appd_value,begin_moni_value=v_begin_moni_value,max_moni_value=v_max_moni_value,curr_moni_value = v_curr_moni_value,remark_info=v_remark_info,close_posi_flag=v_close_posi_flag,close_ratio_level_one=v_close_ratio_level_one,close_ratio_level_two=v_close_ratio_level_two,close_ratio_level_three=v_close_ratio_level_three,contrs_stock_code=v_contrs_stock_code,contrs_exch_no=v_contrs_exch_no,contrs_max_moni_value=v_contrs_max_moni_value,begin_moni_date = v_begin_moni_date,warn_trig_oper_type= v_warn_trig_oper_type,close_trig_oper_type= v_close_trig_oper_type,appd_trig_oper_type= v_appd_trig_oper_type where row_id=v_moni_set_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.47.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("监控设置序号=",v_moni_set_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("监控设置序号=",v_moni_set_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][风控证券_风控_操作员风险监控设置表][{更新次数}][@更新次数#][{记录序号}=@监控设置序号#] */
    select update_times into v_update_times from db_rksecu.tb_rkserk_opor_monitor_set where row_id=v_moni_set_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_删除操作员风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_DeleteOporMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_DeleteOporMonitorSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][风控证券_风控_操作员风险监控设置表][{记录序号}=@监控设置序号#][3][@监控设置序号#] */
    delete from db_rksecu.tb_rkserk_opor_monitor_set 
        where row_id=v_moni_set_id;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.4.48.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("监控设置序号=",v_moni_set_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("监控设置序号=",v_moni_set_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_查询操作员风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QueryOporMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QueryOporMonitorSet(
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
    

    /* if @排序方式# = 2 then */
    if v_sort_type = 2 then

      /* [获取表全记录][风控证券_风控_操作员风险监控设置表][字段][({机构编号}=@机构编号# or @机构编号# = 0) and ( {操作员编号} = @业务操作员编号# or @业务操作员编号# = 0) and ({监控角色}=@监控角色# or @监控角色# = 0)  and ({监控值类型}=@监控值类型# or @监控值类型#=0) and  ({监控设置状态}=@监控设置状态# or @监控设置状态#=" ") and  ({监控结果状态}=@监控结果状态# or @监控结果状态#=" ") and  ({监控值方式}=@监控值方式# or @监控值方式#=" ") order by {记录序号} desc] */
      select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          opor_no, moni_role_type, moni_value_flag, moni_value_type, 
          warn_posi_value, warn_trig_oper_type, close_posi_value, close_trig_oper_type, 
          appd_value, appd_trig_oper_type, begin_moni_date, begin_moni_value, 
          max_moni_value, curr_moni_value, curr_result_moni_value, contrs_stock_code, 
          contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, contrs_result_moni_value, 
          moni_result_value, moni_result_status, moni_set_status, cash_asset, 
          fund_asset, bond_asset, stock_asset, repo_asset, 
          nav_asset, stock_asset_ratio, close_posi_flag, close_ratio_level_one, 
          close_ratio_level_two, close_ratio_level_three, remark_info, time_stamp from db_rksecu.tb_rkserk_opor_monitor_set where (co_no=v_co_no or v_co_no = 0) and ( opor_no = v_busi_opor_no or v_busi_opor_no = 0) and (moni_role_type=v_moni_role_type or v_moni_role_type = 0)  and (moni_value_type=v_moni_value_type or v_moni_value_type=0) and  (moni_set_status=v_moni_set_status or v_moni_set_status=" ") and  (moni_result_status=v_moni_result_status or v_moni_result_status=" ") and  (moni_value_flag=v_moni_value_flag or v_moni_value_flag=" ") order by row_id desc;

    else

      /* [获取表全记录][风控证券_风控_操作员风险监控设置表][字段][({机构编号}=@机构编号# or @机构编号# = 0) and ( {操作员编号} = @业务操作员编号# or @业务操作员编号# = 0) and ({监控角色}=@监控角色# or @监控角色# = 0)  and ({监控值类型}=@监控值类型# or @监控值类型#=0) and  ({监控设置状态}=@监控设置状态# or @监控设置状态#=" ") and  ({监控结果状态}=@监控结果状态# or @监控结果状态#=" ") and  ({监控值方式}=@监控值方式# or @监控值方式#=" ") order by {记录序号} asc] */
      select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          opor_no, moni_role_type, moni_value_flag, moni_value_type, 
          warn_posi_value, warn_trig_oper_type, close_posi_value, close_trig_oper_type, 
          appd_value, appd_trig_oper_type, begin_moni_date, begin_moni_value, 
          max_moni_value, curr_moni_value, curr_result_moni_value, contrs_stock_code, 
          contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, contrs_result_moni_value, 
          moni_result_value, moni_result_status, moni_set_status, cash_asset, 
          fund_asset, bond_asset, stock_asset, repo_asset, 
          nav_asset, stock_asset_ratio, close_posi_flag, close_ratio_level_one, 
          close_ratio_level_two, close_ratio_level_three, remark_info, time_stamp from db_rksecu.tb_rkserk_opor_monitor_set where (co_no=v_co_no or v_co_no = 0) and ( opor_no = v_busi_opor_no or v_busi_opor_no = 0) and (moni_role_type=v_moni_role_type or v_moni_role_type = 0)  and (moni_value_type=v_moni_value_type or v_moni_value_type=0) and  (moni_set_status=v_moni_set_status or v_moni_set_status=" ") and  (moni_result_status=v_moni_result_status or v_moni_result_status=" ") and  (moni_value_flag=v_moni_value_flag or v_moni_value_flag=" ") order by row_id asc;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_更新操作员风险监控设置状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_UpdateOporMonitorSetStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_UpdateOporMonitorSetStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_moni_set_id bigint;
    declare v_moni_set_status varchar(2);
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_moni_set_status = p_moni_set_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

        /* [更新表记录][风控证券_风控_操作员风险监控设置表][{监控设置状态}=@监控设置状态#][{记录序号}=@监控设置序号#][2][@监控设置序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_rksecu.tb_rkserk_opor_monitor_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, moni_set_status=v_moni_set_status where row_id=v_moni_set_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "rksecuA.4.50.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("监控设置序号=",v_moni_set_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("监控设置序号=",v_moni_set_id);
            end if;
            leave label_pro;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_更新所有操作员风险监控设置状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_UpdateAllOporMonitorSetStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_UpdateAllOporMonitorSetStatus(
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
    SET v_moni_set_status = p_moni_set_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

        /* [更新表记录][风控证券_风控_操作员风险监控设置表][{监控设置状态}=@监控设置状态#][{机构编号}=@机构编号#][2][@机构编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_rksecu.tb_rkserk_opor_monitor_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, moni_set_status=v_moni_set_status where co_no=v_co_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "rksecuA.4.51.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no);
            end if;
            leave label_pro;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_查询主推客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QueryPushSecuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QueryPushSecuClientRiskRule(
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_model_id = p_model_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

        /* [获取表记录][风控证券_风控_客户风险规则表][字段][{机构编号}=@机构编号# and {产品编号串} = @产品编号串# and {交易组编号串} = @交易组编号串# and {模板序号}= @模板序号#][@指定行数#] */
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
            end_time, rule_flag, templ_flag, compli_trig_result_type from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no=v_co_no and pd_no_str = v_pd_no_str and exch_group_no_str = v_exch_group_no_str and model_id= v_model_id;
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
            end_time, rule_flag, templ_flag, compli_trig_result_type from db_rksecu.tb_rkserk_secu_client_risk_rule where co_no=v_co_no and pd_no_str = v_pd_no_str and exch_group_no_str = v_exch_group_no_str and model_id= v_model_id limit v_row_count;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_查询T0操作员触警流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QueryT0OporTrigInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QueryT0OporTrigInfo(
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

        /* set @指定行数# = -1; */
        set v_row_count = -1;

        /* [获取表记录][风控证券_风控_T0操作员触警流水表][字段][{机构编号}=@机构编号# and (@查询操作员编号#=0 or {操作员编号}=@查询操作员编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@开始日期#=0 or {创建日期} = @开始日期#)][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            opor_no, pd_no, exch_group_no, asset_acco_no, 
            exch_no, stock_code_no, stock_acco_no, lngsht_type, 
            curr_qty, open_posi_price, open_posi_value, open_posi_fee, 
            close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
            pandl_ratio, un_close_posi_qty, un_close_marke_value, last_price, 
            cost_price, last_tshold_value, float_pandl, moni_result_status, 
            opor_warn_tshold, opor_stop_tshold, stock_warn_ratio, stock_stop_ratio, 
            stock_warn_amt, stock_stop_amt, open_close_permission from db_rksecu.tbjour_rkserk_opor_tshold_risk_trig where co_no=v_co_no and (v_query_opor_no=0 or opor_no=v_query_opor_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_begin_date=0 or create_date = v_begin_date);
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            opor_no, pd_no, exch_group_no, asset_acco_no, 
            exch_no, stock_code_no, stock_acco_no, lngsht_type, 
            curr_qty, open_posi_price, open_posi_value, open_posi_fee, 
            close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
            pandl_ratio, un_close_posi_qty, un_close_marke_value, last_price, 
            cost_price, last_tshold_value, float_pandl, moni_result_status, 
            opor_warn_tshold, opor_stop_tshold, stock_warn_ratio, stock_stop_ratio, 
            stock_warn_amt, stock_stop_amt, open_close_permission from db_rksecu.tbjour_rkserk_opor_tshold_risk_trig where co_no=v_co_no and (v_query_opor_no=0 or opor_no=v_query_opor_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_begin_date=0 or create_date = v_begin_date) limit v_row_count;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_查询T0操作员汇总触警流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QueryT0OporSumTrigInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QueryT0OporSumTrigInfo(
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

        /* set @指定行数# = -1; */
        set v_row_count = -1;

        /* [获取表记录][风控证券_风控_T0操作员汇总触警流水表][字段][{机构编号}=@机构编号# and (@查询操作员编号#=0 or {操作员编号}=@查询操作员编号#) and  ( @开始日期#=0 or {创建日期} = @开始日期#)][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            co_no, curr_qty, open_posi_value, open_posi_fee, 
            close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
            float_pandl, pandl_ratio, un_close_posi_qty, un_close_marke_value, 
            last_tshold_value, moni_result_status, opor_warn_tshold, opor_stop_tshold, 
            open_close_permission from db_rksecu.tbjour_rkserk_opor_tshold_sum_risk_trig where co_no=v_co_no and (v_query_opor_no=0 or opor_no=v_query_opor_no) and  ( v_begin_date=0 or create_date = v_begin_date);
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            co_no, curr_qty, open_posi_value, open_posi_fee, 
            close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
            float_pandl, pandl_ratio, un_close_posi_qty, un_close_marke_value, 
            last_tshold_value, moni_result_status, opor_warn_tshold, opor_stop_tshold, 
            open_close_permission from db_rksecu.tbjour_rkserk_opor_tshold_sum_risk_trig where co_no=v_co_no and (v_query_opor_no=0 or opor_no=v_query_opor_no) and  ( v_begin_date=0 or create_date = v_begin_date) limit v_row_count;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_查询T0操作员历史触警流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QueryT0OporHisTrigInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QueryT0OporHisTrigInfo(
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

        /* set @指定行数# = -1; */
        set v_row_count = -1;

        /* [获取表记录][历史_风控证券_风控_T0操作员触警流水表][字段][{机构编号}=@机构编号# and (@查询操作员编号#=0 or {操作员编号}=@查询操作员编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and ((@开始日期#=0 and @结束日期#=0) or ({创建日期} between @开始日期# and @结束日期#))][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            opor_no, pd_no, exch_group_no, asset_acco_no, 
            exch_no, stock_code_no, stock_acco_no, lngsht_type, 
            curr_qty, open_posi_price, open_posi_value, open_posi_fee, 
            close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
            pandl_ratio, un_close_posi_qty, un_close_marke_value, last_price, 
            cost_price, last_tshold_value, float_pandl, moni_result_status, 
            opor_warn_tshold, opor_stop_tshold, stock_warn_ratio, stock_stop_ratio, 
            stock_warn_amt, stock_stop_amt, open_close_permission from db_rksecu_his.tbjour_rkserk_opor_tshold_risk_trig_his where co_no=v_co_no and (v_query_opor_no=0 or opor_no=v_query_opor_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and ((v_begin_date=0 and v_end_date=0) or (create_date between v_begin_date and v_end_date));
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            opor_no, pd_no, exch_group_no, asset_acco_no, 
            exch_no, stock_code_no, stock_acco_no, lngsht_type, 
            curr_qty, open_posi_price, open_posi_value, open_posi_fee, 
            close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
            pandl_ratio, un_close_posi_qty, un_close_marke_value, last_price, 
            cost_price, last_tshold_value, float_pandl, moni_result_status, 
            opor_warn_tshold, opor_stop_tshold, stock_warn_ratio, stock_stop_ratio, 
            stock_warn_amt, stock_stop_amt, open_close_permission from db_rksecu_his.tbjour_rkserk_opor_tshold_risk_trig_his where co_no=v_co_no and (v_query_opor_no=0 or opor_no=v_query_opor_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and ((v_begin_date=0 and v_end_date=0) or (create_date between v_begin_date and v_end_date)) limit v_row_count;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_查询T0操作员历史汇总触警流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QueryT0OporHisSumTrigInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QueryT0OporHisSumTrigInfo(
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

        /* set @指定行数# = -1; */
        set v_row_count = -1;

        /* [获取表记录][历史_风控证券_风控_T0操作员汇总触警流水表][字段][{机构编号}=@机构编号# and (@查询操作员编号#=0 or {操作员编号}=@查询操作员编号#) and  ( (@开始日期#=0 and @结束日期#=0) or ({创建日期} between @开始日期# and @结束日期#))][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            co_no, curr_qty, open_posi_value, open_posi_fee, 
            close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
            float_pandl, pandl_ratio, un_close_posi_qty, un_close_marke_value, 
            last_tshold_value, moni_result_status, opor_warn_tshold, opor_stop_tshold, 
            open_close_permission from db_rksecu_his.tbjour_rkserk_opor_tshold_sum_risk_trig_his where co_no=v_co_no and (v_query_opor_no=0 or opor_no=v_query_opor_no) and  ( (v_begin_date=0 and v_end_date=0) or (create_date between v_begin_date and v_end_date));
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_no, 
            co_no, curr_qty, open_posi_value, open_posi_fee, 
            close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
            float_pandl, pandl_ratio, un_close_posi_qty, un_close_marke_value, 
            last_tshold_value, moni_result_status, opor_warn_tshold, opor_stop_tshold, 
            open_close_permission from db_rksecu_his.tbjour_rkserk_opor_tshold_sum_risk_trig_his where co_no=v_co_no and (v_query_opor_no=0 or opor_no=v_query_opor_no) and  ( (v_begin_date=0 and v_end_date=0) or (create_date between v_begin_date and v_end_date)) limit v_row_count;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_删除客户风险触警流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_DeleteSecuClientRiskTrig;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_DeleteSecuClientRiskTrig(
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
    

    /* [删除表记录][风控证券_风控_客户风险触警流水表][{机构编号}=@机构编号# and {触发阶段类型}=@触发阶段类型#][3][@机构编号#,@触发阶段类型#] */
    delete from db_rksecu.tbjour_rkserk_secu_client_risk_trig 
        where co_no=v_co_no and trig_stage_type=v_trig_stage_type;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.4.57.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","触发阶段类型=",v_trig_stage_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","触发阶段类型=",v_trig_stage_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_查询融资融券保证金计算
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QueryFinaLoanMarginCalc;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QueryFinaLoanMarginCalc(
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
    

    /* [获取表记录变量语句][风控证券_风控_资产账户融资融券保证金计算表][{冲抵证券折算市值},{融资折算盈亏},{融券折算盈亏},{融资指令占用保证金},{融券指令占用保证金},{融资交易占用保证金},{融券交易占用保证金},{融资占用保证金},{融券占用保证金},{维持担保比例},{指令可用保证金},{订单可用保证金},{可用保证金},{融资利息},{融券利息}][@资产账户冲抵折算保证金#,@资产账户融资折算盈亏#,@资产账户融券折算盈亏#,@资产账户融资指令占用保证金#,@资产账户融券指令占用保证金#,@资产账户融资交易占用保证金#,@资产账户融券交易占用保证金#,@资产账户融资占用保证金#,@资产账户融券占用保证金#,@资产账户维持担保比例#,@资产账户指令可用保证金#,@资产账户订单可用保证金#,@资产账户可用保证金#,@资产账户融资利息#,@资产账户融券利息#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and  {资产账户编号} = @资产账户编号# ] */
    select margin_ratio_market_value,fina_converted_pandl,loan_converted_pandl,fina_comm_capt_margin,loan_comm_capt_margin,fina_order_capt_margin,loan_order_capt_margin,fina_capt_margin,loan_capt_margin,keep_guarantee_ratio,cmmd_converted_margin,order_converted_margin,curr_converted_margin,fina_interest,loan_interest into v_asac_converted_margin,v_asac_fina_converted_pandl,v_asac_loan_converted_pandl,v_asac_fina_comm_capt_margin,v_asac_loan_comm_capt_margin,v_asac_fina_order_capt_margin,v_asac_loan_order_capt_margin,v_asac_fina_capt_margin,v_asac_loan_capt_margin,v_asac_keep_guarantee_ratio,v_asac_cmmd_converted_margin,v_asac_order_converted_margin,v_asac_curr_converted_margin,v_asac_fina_interest,v_asac_loan_interest from db_rksecu.tbjour_rkserk_asac_fina_loan_margin_calc where co_no = v_co_no and pd_no = v_pd_no and  asset_acco_no = v_asset_acco_no  limit 1;


    /* [获取表记录变量语句][风控证券_风控_交易组融资融券保证金计算表][{冲抵证券折算市值},{融资折算盈亏},{融券折算盈亏},{融资指令占用保证金},{融券指令占用保证金},{融资交易占用保证金},{融券交易占用保证金},{融资占用保证金},{融券占用保证金},{维持担保比例},{指令可用保证金},{订单可用保证金},{可用保证金},{融资利息},{融券利息}][@交易组冲抵折算保证金#,@交易组融资折算盈亏#,@交易组融券折算盈亏#,@交易组融资指令占用保证金#,@交易组融券指令占用保证金#,@交易组融资交易占用保证金#,@交易组融券交易占用保证金#,@交易组融资占用保证金#,@交易组融券占用保证金#,@交易组维持担保比例#,@交易组指令可用保证金#,@交易组订单可用保证金#,@交易组可用保证金#,@交易组融资利息#,@交易组融券利息#][{机构编号} = @机构编号# and  {产品编号} = @产品编号# and  {资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# ] */
    select margin_ratio_market_value,fina_converted_pandl,loan_converted_pandl,fina_comm_capt_margin,loan_comm_capt_margin,fina_order_capt_margin,loan_order_capt_margin,fina_capt_margin,loan_capt_margin,keep_guarantee_ratio,cmmd_converted_margin,order_converted_margin,curr_converted_margin,fina_interest,loan_interest into v_exgp_converted_margin,v_exgp_fina_converted_pandl,v_exgp_loan_converted_pandl,v_exgp_fina_comm_capt_margin,v_exgp_loan_comm_capt_margin,v_exgp_fina_order_capt_margin,v_exgp_loan_order_capt_margin,v_exgp_fina_capt_margin,v_exgp_loan_capt_margin,v_exgp_keep_guarantee_ratio,v_exgp_cmmd_converted_margin,v_exgp_order_converted_margin,v_exgp_curr_converted_margin,v_exgp_fina_interest,v_exgp_loan_interest from db_rksecu.tbjour_rkserk_exgp_fina_loan_margin_calc where co_no = v_co_no and  pd_no = v_pd_no and  asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no  limit 1;

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

# 原子_风控证券_风控_更新资产账户融资融券保证金计算结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_InsertAsacFinaLoanMarginCalcList;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_InsertAsacFinaLoanMarginCalcList(
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
    declare v_init_date int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [获取机器日期][@初始化日期#] */
    select date_format(curdate(),'%Y%m%d') into v_init_date;


    /* [插入重复更新][风控证券_风控_资产账户融资融券保证金计算表][字段][字段变量][{更新次数} = {更新次数} + 1, {可用保证金} = @可用保证金#, {指令可用保证金} = @指令可用保证金#,  {订单可用保证金} = @订单可用保证金#, {融资证券市值} = @融资证券市值#,{融资盈亏} = @融资盈亏#,{融资折算盈亏} = @融资折算盈亏# ,{融券证券市值} = @融券证券市值#,{融券盈亏} = @融券盈亏#, {融券折算盈亏} = @融券折算盈亏# ,{融资占用保证金} = @融资占用保证金#,{融券占用保证金} = @融券占用保证金#,{维持担保比例} = @维持担保比例#,{融券卖出金额} = @融券卖出金额#, {冲抵证券折算市值} = @冲抵证券折算市值# , {融资利息} = @融资利息#,{融券利息} = @融券利息#,{融资指令占用保证金} = @融资指令占用保证金#,{融券指令占用保证金} = @融券指令占用保证金#,{融资交易占用保证金} = @融资交易占用保证金#,{融券交易占用保证金} = @融券交易占用保证金#][1][@机构编号#,@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tbjour_rkserk_asac_fina_loan_margin_calc (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, curr_converted_margin, cmmd_converted_margin, 
        order_converted_margin, fina_market_value, fina_profit, fina_converted_pandl, 
        loan_market_value, loan_profit, loan_converted_pandl, fina_comm_capt_margin, 
        loan_comm_capt_margin, fina_order_capt_margin, loan_order_capt_margin, fina_capt_margin, 
        loan_capt_margin, keep_guarantee_ratio, loan_sell_amt, margin_ratio_market_value, 
        fina_interest, loan_interest) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_curr_converted_margin, v_cmmd_converted_margin, 
        v_order_converted_margin, v_fina_market_value, v_fina_profit, v_fina_converted_pandl, 
        v_loan_market_value, v_loan_profit, v_loan_converted_pandl, v_fina_comm_capt_margin, 
        v_loan_comm_capt_margin, v_fina_order_capt_margin, v_loan_order_capt_margin, v_fina_capt_margin, 
        v_loan_capt_margin, v_keep_guarantee_ratio, v_loan_sell_amt, v_margin_ratio_market_value, 
        v_fina_interest, v_loan_interest) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, update_times = update_times + 1, curr_converted_margin = v_curr_converted_margin, cmmd_converted_margin = v_cmmd_converted_margin,  order_converted_margin = v_order_converted_margin, fina_market_value = v_fina_market_value,fina_profit = v_fina_profit,fina_converted_pandl = v_fina_converted_pandl ,loan_market_value = v_loan_market_value,loan_profit = v_loan_profit, loan_converted_pandl = v_loan_converted_pandl ,fina_capt_margin = v_fina_capt_margin,loan_capt_margin = v_loan_capt_margin,keep_guarantee_ratio = v_keep_guarantee_ratio,loan_sell_amt = v_loan_sell_amt, margin_ratio_market_value = v_margin_ratio_market_value , fina_interest = v_fina_interest,loan_interest = v_loan_interest,fina_comm_capt_margin = v_fina_comm_capt_margin,loan_comm_capt_margin = v_loan_comm_capt_margin,fina_order_capt_margin = v_fina_order_capt_margin,loan_order_capt_margin = v_loan_order_capt_margin;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.510.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_查询资产账户融资融券保证金计算结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QueryAsacFinaLoanMarginCalcList;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QueryAsacFinaLoanMarginCalcList(
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
    declare v_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@初始化日期#] */
    select date_format(curdate(),'%Y%m%d') into v_init_date;


    /* [获取表记录][风控证券_风控_资产账户融资融券保证金计算表][字段][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@产品编号权限串# = ' ' or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and  {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, curr_converted_margin, 
        cmmd_converted_margin, order_converted_margin, fina_market_value, fina_profit, 
        fina_converted_pandl, loan_market_value, loan_profit, loan_converted_pandl, 
        fina_comm_capt_margin, loan_comm_capt_margin, fina_order_capt_margin, loan_order_capt_margin, 
        fina_capt_margin, loan_capt_margin, keep_guarantee_ratio, loan_sell_amt, 
        margin_ratio_market_value, fina_interest, loan_interest from db_rksecu.tbjour_rkserk_asac_fina_loan_margin_calc where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_pd_no_rights_str = ' ' or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and  row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, curr_converted_margin, 
        cmmd_converted_margin, order_converted_margin, fina_market_value, fina_profit, 
        fina_converted_pandl, loan_market_value, loan_profit, loan_converted_pandl, 
        fina_comm_capt_margin, loan_comm_capt_margin, fina_order_capt_margin, loan_order_capt_margin, 
        fina_capt_margin, loan_capt_margin, keep_guarantee_ratio, loan_sell_amt, 
        margin_ratio_market_value, fina_interest, loan_interest from db_rksecu.tbjour_rkserk_asac_fina_loan_margin_calc where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_pd_no_rights_str = ' ' or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and  row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_更新交易组融资融券保证金计算结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_InsertGrpFinaLoanMarginCalcList;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_InsertGrpFinaLoanMarginCalcList(
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
    declare v_init_date int;
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@初始化日期#] */
    select date_format(curdate(),'%Y%m%d') into v_init_date;


    /* [插入重复更新][风控证券_风控_交易组融资融券保证金计算表][字段][字段变量][{更新次数} = {更新次数} + 1, {可用保证金} = @可用保证金#, {指令可用保证金} = @指令可用保证金#,  {订单可用保证金} = @订单可用保证金#, {融资证券市值} = @融资证券市值#,{融资盈亏} = @融资盈亏#,{融资折算盈亏} = @融资折算盈亏# ,{融券证券市值} = @融券证券市值#,{融券盈亏} = @融券盈亏#, {融券折算盈亏} = @融券折算盈亏# ,{融资占用保证金} = @融资占用保证金#,{融券占用保证金} = @融券占用保证金#,{维持担保比例} = @维持担保比例#,{融券卖出金额} = @融券卖出金额#, {冲抵证券折算市值} = @冲抵证券折算市值# , {融资利息} = @融资利息#,{融券利息} = @融券利息#,{融资指令占用保证金} = @融资指令占用保证金#,{融券指令占用保证金} = @融券指令占用保证金#,{融资交易占用保证金} = @融资交易占用保证金#,{融券交易占用保证金} = @融券交易占用保证金#][1][@机构编号#,@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tbjour_rkserk_exgp_fina_loan_margin_calc (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, curr_converted_margin, 
        cmmd_converted_margin, order_converted_margin, fina_market_value, fina_profit, 
        fina_converted_pandl, loan_market_value, loan_profit, loan_converted_pandl, 
        fina_comm_capt_margin, loan_comm_capt_margin, fina_order_capt_margin, loan_order_capt_margin, 
        fina_capt_margin, loan_capt_margin, keep_guarantee_ratio, loan_sell_amt, 
        margin_ratio_market_value, fina_interest, loan_interest) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_curr_converted_margin, 
        v_cmmd_converted_margin, v_order_converted_margin, v_fina_market_value, v_fina_profit, 
        v_fina_converted_pandl, v_loan_market_value, v_loan_profit, v_loan_converted_pandl, 
        v_fina_comm_capt_margin, v_loan_comm_capt_margin, v_fina_order_capt_margin, v_loan_order_capt_margin, 
        v_fina_capt_margin, v_loan_capt_margin, v_keep_guarantee_ratio, v_loan_sell_amt, 
        v_margin_ratio_market_value, v_fina_interest, v_loan_interest) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, update_times = update_times + 1, curr_converted_margin = v_curr_converted_margin, cmmd_converted_margin = v_cmmd_converted_margin,  order_converted_margin = v_order_converted_margin, fina_market_value = v_fina_market_value,fina_profit = v_fina_profit,fina_converted_pandl = v_fina_converted_pandl ,loan_market_value = v_loan_market_value,loan_profit = v_loan_profit, loan_converted_pandl = v_loan_converted_pandl ,fina_capt_margin = v_fina_capt_margin,loan_capt_margin = v_loan_capt_margin,keep_guarantee_ratio = v_keep_guarantee_ratio,loan_sell_amt = v_loan_sell_amt, margin_ratio_market_value = v_margin_ratio_market_value , fina_interest = v_fina_interest,loan_interest = v_loan_interest,fina_comm_capt_margin = v_fina_comm_capt_margin,loan_comm_capt_margin = v_loan_comm_capt_margin,fina_order_capt_margin = v_fina_order_capt_margin,loan_order_capt_margin = v_loan_order_capt_margin;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.610.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","资产账户编号=",v_asset_acco_no);
        end if;
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

# 原子_风控证券_风控_查询交易组融资融券保证金计算结果集
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QueryGrpFinaLoanMarginCalcList;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QueryGrpFinaLoanMarginCalcList(
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
    declare v_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@初始化日期#] */
    select date_format(curdate(),'%Y%m%d') into v_init_date;


    /* [获取表记录][风控证券_风控_交易组融资融券保证金计算表][字段][{机构编号} = @机构编号# and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@产品编号权限串# = ' ' or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and  {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        curr_converted_margin, cmmd_converted_margin, order_converted_margin, fina_market_value, 
        fina_profit, fina_converted_pandl, loan_market_value, loan_profit, 
        loan_converted_pandl, fina_comm_capt_margin, loan_comm_capt_margin, fina_order_capt_margin, 
        loan_order_capt_margin, fina_capt_margin, loan_capt_margin, keep_guarantee_ratio, 
        loan_sell_amt, margin_ratio_market_value, fina_interest, loan_interest from db_rksecu.tbjour_rkserk_exgp_fina_loan_margin_calc where co_no = v_co_no and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_pd_no_rights_str = ' ' or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and  row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        curr_converted_margin, cmmd_converted_margin, order_converted_margin, fina_market_value, 
        fina_profit, fina_converted_pandl, loan_market_value, loan_profit, 
        loan_converted_pandl, fina_comm_capt_margin, loan_comm_capt_margin, fina_order_capt_margin, 
        loan_order_capt_margin, fina_capt_margin, loan_capt_margin, keep_guarantee_ratio, 
        loan_sell_amt, margin_ratio_market_value, fina_interest, loan_interest from db_rksecu.tbjour_rkserk_exgp_fina_loan_margin_calc where co_no = v_co_no and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_pd_no_rights_str = ' ' or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and  row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_查询所有账户风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_QueryAllProductMonitorSet;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_QueryAllProductMonitorSet(
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
    

    /* if @排序方式# = 2 then */
    if v_sort_type = 2 then

      /* [获取表全记录][风控证券_风控_账户风险监控设置表][字段][({机构编号}=@机构编号# or @机构编号# = 0) and (instr(concat(';',{产品编号串},';'),concat(';',@产品编号#,';'))>0 or @产品编号#= 0 ) and (instr(concat(';',{交易组编号串},';'),concat(';',@交易组编号#,';')) >0 or @交易组编号# = 0) and ({监控角色}=@监控角色# or @监控角色# = 0)  and ({监控值类型}=@监控值类型# or @监控值类型#=0) and  ({监控设置状态}=@监控设置状态# or @监控设置状态#=" ") and  ({监控结果状态}=@监控结果状态# or @监控结果状态#=" ") and  ({监控值方式}=@监控值方式# or @监控值方式#=" ") order by {记录序号} desc] */
      select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          pd_no_str, exch_group_no_str, moni_role_type, moni_value_flag, 
          moni_value_type, warn_posi_value, warn_trig_oper_type, close_posi_value, 
          close_trig_oper_type, appd_value, appd_trig_oper_type, begin_moni_date, 
          begin_moni_value, max_moni_value, curr_moni_value, curr_result_moni_value, 
          contrs_stock_code, contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, 
          contrs_result_moni_value, moni_result_value, moni_result_status, moni_set_status, 
          cash_asset, fund_asset, bond_asset, stock_asset, 
          repo_asset, nav_asset, stock_asset_ratio, close_posi_flag, 
          close_ratio_level_one, close_ratio_level_two, close_ratio_level_three, remark_info, 
          time_stamp, pd_share, begin_asset_value, hk_thrgh_stock_asset from db_rksecu.tb_rkserk_product_monitor_set where (co_no=v_co_no or v_co_no = 0) and (instr(concat(';',pd_no_str,';'),concat(';',v_pd_no,';'))>0 or v_pd_no= 0 ) and (instr(concat(';',exch_group_no_str,';'),concat(';',v_exch_group_no,';')) >0 or v_exch_group_no = 0) and (moni_role_type=v_moni_role_type or v_moni_role_type = 0)  and (moni_value_type=v_moni_value_type or v_moni_value_type=0) and  (moni_set_status=v_moni_set_status or v_moni_set_status=" ") and  (moni_result_status=v_moni_result_status or v_moni_result_status=" ") and  (moni_value_flag=v_moni_value_flag or v_moni_value_flag=" ") order by row_id desc;


    /* elseif @排序方式# = 3 then */
    elseif v_sort_type = 3 then

      /* [获取表全记录][风控证券_风控_账户风险监控设置表][字段][({机构编号}=@机构编号# or @机构编号# = 0)  and (instr(concat(';',{产品编号串},';'),concat(';',@产品编号#,';'))>0 or @产品编号#= 0 ) and (instr(concat(';',{交易组编号串},';'),concat(';',@交易组编号#,';')) >0 or @交易组编号# = 0)  and ({监控角色}=@监控角色# or @监控角色# = 0)  and ({监控值类型}=@监控值类型# or @监控值类型#=0) and  ({监控设置状态}=@监控设置状态# or @监控设置状态#=" ") and  ({监控结果状态}=@监控结果状态# or @监控结果状态#=" ") and  ({监控值方式}=@监控值方式# or @监控值方式#=" ") order by {监控结果状态} asc] */
      select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          pd_no_str, exch_group_no_str, moni_role_type, moni_value_flag, 
          moni_value_type, warn_posi_value, warn_trig_oper_type, close_posi_value, 
          close_trig_oper_type, appd_value, appd_trig_oper_type, begin_moni_date, 
          begin_moni_value, max_moni_value, curr_moni_value, curr_result_moni_value, 
          contrs_stock_code, contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, 
          contrs_result_moni_value, moni_result_value, moni_result_status, moni_set_status, 
          cash_asset, fund_asset, bond_asset, stock_asset, 
          repo_asset, nav_asset, stock_asset_ratio, close_posi_flag, 
          close_ratio_level_one, close_ratio_level_two, close_ratio_level_three, remark_info, 
          time_stamp, pd_share, begin_asset_value, hk_thrgh_stock_asset from db_rksecu.tb_rkserk_product_monitor_set where (co_no=v_co_no or v_co_no = 0)  and (instr(concat(';',pd_no_str,';'),concat(';',v_pd_no,';'))>0 or v_pd_no= 0 ) and (instr(concat(';',exch_group_no_str,';'),concat(';',v_exch_group_no,';')) >0 or v_exch_group_no = 0)  and (moni_role_type=v_moni_role_type or v_moni_role_type = 0)  and (moni_value_type=v_moni_value_type or v_moni_value_type=0) and  (moni_set_status=v_moni_set_status or v_moni_set_status=" ") and  (moni_result_status=v_moni_result_status or v_moni_result_status=" ") and  (moni_value_flag=v_moni_value_flag or v_moni_value_flag=" ") order by moni_result_status asc;


    /* elseif @排序方式# = 4 then */
    elseif v_sort_type = 4 then

      /* [获取表全记录][风控证券_风控_账户风险监控设置表][字段][({机构编号}=@机构编号# or @机构编号# = 0)  and (instr(concat(';',{产品编号串},';'),concat(';',@产品编号#,';'))>0 or @产品编号#= 0 ) and (instr(concat(';',{交易组编号串},';'),concat(';',@交易组编号#,';')) >0 or @交易组编号# = 0) and ({监控角色}=@监控角色# or @监控角色# = 0)  and ({监控值类型}=@监控值类型# or @监控值类型#=0) and  ({监控设置状态}=@监控设置状态# or @监控设置状态#=" ") and  ({监控结果状态}=@监控结果状态# or @监控结果状态#=" ") and  ({监控值方式}=@监控值方式# or @监控值方式#=" ") order by {监控结果状态} desc] */
      select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          pd_no_str, exch_group_no_str, moni_role_type, moni_value_flag, 
          moni_value_type, warn_posi_value, warn_trig_oper_type, close_posi_value, 
          close_trig_oper_type, appd_value, appd_trig_oper_type, begin_moni_date, 
          begin_moni_value, max_moni_value, curr_moni_value, curr_result_moni_value, 
          contrs_stock_code, contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, 
          contrs_result_moni_value, moni_result_value, moni_result_status, moni_set_status, 
          cash_asset, fund_asset, bond_asset, stock_asset, 
          repo_asset, nav_asset, stock_asset_ratio, close_posi_flag, 
          close_ratio_level_one, close_ratio_level_two, close_ratio_level_three, remark_info, 
          time_stamp, pd_share, begin_asset_value, hk_thrgh_stock_asset from db_rksecu.tb_rkserk_product_monitor_set where (co_no=v_co_no or v_co_no = 0)  and (instr(concat(';',pd_no_str,';'),concat(';',v_pd_no,';'))>0 or v_pd_no= 0 ) and (instr(concat(';',exch_group_no_str,';'),concat(';',v_exch_group_no,';')) >0 or v_exch_group_no = 0) and (moni_role_type=v_moni_role_type or v_moni_role_type = 0)  and (moni_value_type=v_moni_value_type or v_moni_value_type=0) and  (moni_set_status=v_moni_set_status or v_moni_set_status=" ") and  (moni_result_status=v_moni_result_status or v_moni_result_status=" ") and  (moni_value_flag=v_moni_value_flag or v_moni_value_flag=" ") order by moni_result_status desc;

    else

      /* [获取表全记录][风控证券_风控_账户风险监控设置表][字段][({机构编号}=@机构编号# or @机构编号# = 0)  and (instr(concat(';',{产品编号串},';'),concat(';',@产品编号#,';'))>0 or @产品编号#= 0 ) and (instr(concat(';',{交易组编号串},';'),concat(';',@交易组编号#,';')) >0 or @交易组编号# = 0)  and ({监控角色}=@监控角色# or @监控角色# = 0)  and ({监控值类型}=@监控值类型# or @监控值类型#=0) and  ({监控设置状态}=@监控设置状态# or @监控设置状态#=" ") and  ({监控结果状态}=@监控结果状态# or @监控结果状态#=" ") and  ({监控值方式}=@监控值方式# or @监控值方式#=" ") order by {记录序号} asc] */
      select row_id, create_date, create_time, 
          update_date, update_time, update_times, co_no, 
          pd_no_str, exch_group_no_str, moni_role_type, moni_value_flag, 
          moni_value_type, warn_posi_value, warn_trig_oper_type, close_posi_value, 
          close_trig_oper_type, appd_value, appd_trig_oper_type, begin_moni_date, 
          begin_moni_value, max_moni_value, curr_moni_value, curr_result_moni_value, 
          contrs_stock_code, contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, 
          contrs_result_moni_value, moni_result_value, moni_result_status, moni_set_status, 
          cash_asset, fund_asset, bond_asset, stock_asset, 
          repo_asset, nav_asset, stock_asset_ratio, close_posi_flag, 
          close_ratio_level_one, close_ratio_level_two, close_ratio_level_three, remark_info, 
          time_stamp, pd_share, begin_asset_value, hk_thrgh_stock_asset from db_rksecu.tb_rkserk_product_monitor_set where (co_no=v_co_no or v_co_no = 0)  and (instr(concat(';',pd_no_str,';'),concat(';',v_pd_no,';'))>0 or v_pd_no= 0 ) and (instr(concat(';',exch_group_no_str,';'),concat(';',v_exch_group_no,';')) >0 or v_exch_group_no = 0)  and (moni_role_type=v_moni_role_type or v_moni_role_type = 0)  and (moni_value_type=v_moni_value_type or v_moni_value_type=0) and  (moni_set_status=v_moni_set_status or v_moni_set_status=" ") and  (moni_result_status=v_moni_result_status or v_moni_result_status=" ") and  (moni_value_flag=v_moni_value_flag or v_moni_value_flag=" ") order by row_id asc;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_获取联合汇总计算风险要素值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_GetSumCaclRiskParamValue;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_GetSumCaclRiskParamValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_trig_type int,
    IN p_trig_stage_type int,
    IN p_compli_calc_level int,
    IN p_risk_param_str varchar(2048),
    IN p_row_id_str varchar(2048),
    INOUT p_risk_rule_code varchar(2048),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_union_flag int,
    IN p_risk_rule_type int,
    IN p_order_batch_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_order_dir_str varchar(1024),
    IN p_client_risk_rule_id int,
    IN p_risk_rule_value_str1 varchar(255),
    IN p_cash_asset_flag int,
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_risk_param_value varchar(255),
    OUT p_numer_value decimal(18,4),
    OUT p_is_relative int,
    OUT p_dino_value decimal(18,4)
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
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_trig_type int;
    declare v_trig_stage_type int;
    declare v_compli_calc_level int;
    declare v_risk_param_str varchar(2048);
    declare v_row_id_str varchar(2048);
    declare v_risk_rule_code varchar(2048);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_union_flag int;
    declare v_risk_rule_type int;
    declare v_order_batch_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_client_risk_rule_id int;
    declare v_risk_rule_value_str1 varchar(255);
    declare v_cash_asset_flag int;
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_risk_param_value varchar(255);
    declare v_numer_value decimal(18,4);
    declare v_is_relative int;
    declare v_dino_value decimal(18,4);
    declare v_risk_rule_calc_str varchar(255);
    declare v_risk_param varchar(255);
    declare v_calc_value decimal(18,4);
    declare v_tmp_numer_value decimal(18,4);
    declare v_tmp_dino_value decimal(18,4);
    declare v_test_id bigint;
    declare v_evalu_price decimal(16,9);
    declare v_tmp_exch_no int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_tmp_occur_qty decimal(18,2);
    declare v_tmp_occur_amt decimal(18,4);
    declare v_posi_qty decimal(18,2);
    declare v_tmp_posi_qty decimal(18,2);
    declare v_per_secu_cost_amt decimal(18,4);
    declare v_posi_cost decimal(18,4);
    declare v_posi_market_value decimal(18,4);
    declare v_tmp_posi_market_value decimal(18,4);
    declare v_occur_market_value decimal(18,4);
    declare v_total_stock_issue decimal(18,2);
    declare v_circl_stock_capit decimal(18,2);
    declare v_stock_type int;
    declare v_last_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_today_open_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_trade_amt decimal(18,4);
    declare v_tmp_stock_code varchar(6);
    declare v_hk_stock_code varchar(16);
    declare v_record_count int;
    declare v_sh_hk_stock_code_no int;
    declare v_sz_hk_stock_code_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_trig_type = p_trig_type;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_risk_param_str = p_risk_param_str;
    SET v_row_id_str = p_row_id_str;
    SET v_risk_rule_code = p_risk_rule_code;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_union_flag = p_union_flag;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_order_batch_no = p_order_batch_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_client_risk_rule_id = p_client_risk_rule_id;
    SET v_risk_rule_value_str1 = p_risk_rule_value_str1;
    SET v_cash_asset_flag = p_cash_asset_flag;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_risk_param_value = " ";
    SET v_numer_value = 0;
    SET v_is_relative = 0;
    SET v_dino_value = 0;
    SET v_risk_rule_calc_str = " ";
    SET v_risk_param = " ";
    SET v_calc_value = 0;
    SET v_tmp_numer_value = 0;
    SET v_tmp_dino_value = 0;
    SET v_test_id = 0;
    SET v_evalu_price = 0;
    SET v_tmp_exch_no = 0;
    SET v_occur_qty = 0;
    SET v_occur_amt = 0;
    SET v_all_fee = 0;
    SET v_tmp_occur_qty = 0;
    SET v_tmp_occur_amt = 0;
    SET v_posi_qty = 0;
    SET v_tmp_posi_qty = 0;
    SET v_per_secu_cost_amt = 0;
    SET v_posi_cost = 0;
    SET v_posi_market_value = 0;
    SET v_tmp_posi_market_value = 0;
    SET v_occur_market_value = 0;
    SET v_total_stock_issue = 0;
    SET v_circl_stock_capit = 0;
    SET v_stock_type = 0;
    SET v_last_price = 0;
    SET v_pre_close_price = 0;
    SET v_today_open_price = 0;
    SET v_strike_amt = 0;
    SET v_nav_asset = 0;
    SET v_trade_amt = 0;
    SET v_tmp_stock_code = " ";
    SET v_hk_stock_code = " ";
    SET v_record_count = 0;
    SET v_sh_hk_stock_code_no = 0;
    SET v_sz_hk_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* if @联合标志# = 《联合标志-单独控制》 and   @合规计算层级# = 《合规计算层级-产品级》 then */
    if v_union_flag = 1 and   v_compli_calc_level = 2 then

        /* [获取表记录变量][风控证券_风控_层次计算结果表][{风险计算值串}][@风险计算值串#][{机构编号} = @机构编号# and {产品编号串} = @产品编号# and {触发阶段类型} = @触发阶段类型# and {客户风险规则序号} = @客户风险规则序号#][908][@客户风险规则序号#] */
        select risk_rule_calc_str into v_risk_rule_calc_str from db_rksecu.tb_rkserk_stage_calc where co_no = v_co_no and pd_no_str = v_pd_no and trig_stage_type = v_trig_stage_type and client_risk_rule_id = v_client_risk_rule_id limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "rksecuA.4.60.908";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("客户风险规则序号=",v_client_risk_rule_id);
            end if;
            leave label_pro;
        end if;

    else

        /* [获取表记录变量][风控证券_风控_层次计算结果表][{风险计算值串}][@风险计算值串#][{机构编号} = @机构编号# and {触发阶段类型} = @触发阶段类型# and {客户风险规则序号} = @客户风险规则序号#][908][@客户风险规则序号#] */
        select risk_rule_calc_str into v_risk_rule_calc_str from db_rksecu.tb_rkserk_stage_calc where co_no = v_co_no and trig_stage_type = v_trig_stage_type and client_risk_rule_id = v_client_risk_rule_id limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "rksecuA.4.60.908";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("客户风险规则序号=",v_client_risk_rule_id);
            end if;
            leave label_pro;
        end if;

    end if;
    #第一个风险要素

    /* set @风险要素# = SUBSTRING_INDEX(SUBSTRING_INDEX(@风险要素串#,';',1),';',-1); */
    set v_risk_param = SUBSTRING_INDEX(SUBSTRING_INDEX(v_risk_param_str,';',1),';',-1);

    /* if length(@风险要素#)> 0 and SUBSTRING_INDEX(SUBSTRING_INDEX(@风险计算值串#,';',1),';',-1) <> '?'  then */
    if length(v_risk_param)> 0 and SUBSTRING_INDEX(SUBSTRING_INDEX(v_risk_rule_calc_str,';',1),';',-1) <> '?'  then

        /* set @计算值# = SUBSTRING_INDEX(SUBSTRING_INDEX(@风险计算值串#,';',1),';',-1); */
        set v_calc_value = SUBSTRING_INDEX(SUBSTRING_INDEX(v_risk_rule_calc_str,';',1),';',-1);

        /* if @风险要素# = "合计市值" then */
        if v_risk_param = "合计市值" then

            /* set @临时_分子值# = @计算值#; */
            set v_tmp_numer_value = v_calc_value;

        /* elseif @风险要素# = "合计成本" then */
        elseif v_risk_param = "合计成本" then

            /* set @临时_分子值# = @计算值#; */
            set v_tmp_numer_value = v_calc_value;
        else

            /* set @风险规则代码#= replace(@风险规则代码#,concat("[",@风险要素#,"]"),@计算值#); */
            set v_risk_rule_code= replace(v_risk_rule_code,concat("[",v_risk_param,"]"),v_calc_value);
        end if;
    end if;
    #第二个风险要素

    /* set @风险要素# = SUBSTRING_INDEX(SUBSTRING_INDEX(@风险要素串#,';',2),';',-1); */
    set v_risk_param = SUBSTRING_INDEX(SUBSTRING_INDEX(v_risk_param_str,';',2),';',-1);

    /* if length(@风险要素#)> 0 and SUBSTRING_INDEX(SUBSTRING_INDEX(@风险计算值串#,';',2),';',-1) <> '?' then */
    if length(v_risk_param)> 0 and SUBSTRING_INDEX(SUBSTRING_INDEX(v_risk_rule_calc_str,';',2),';',-1) <> '?' then

        /* set @计算值# = SUBSTRING_INDEX(SUBSTRING_INDEX(@风险计算值串#,';',2),';',-1); */
        set v_calc_value = SUBSTRING_INDEX(SUBSTRING_INDEX(v_risk_rule_calc_str,';',2),';',-1);

        /* if @风险要素# = "同类证券总市值" then */
        if v_risk_param = "同类证券总市值" then

            /* set @临时_分母值# = @计算值#; */
            set v_tmp_dino_value = v_calc_value;

        /* elseif @风险要素# <> "单位净值" then */
        elseif v_risk_param <> "单位净值" then

            /* set @分母值# = @计算值#; */
            set v_dino_value = v_calc_value;

            /* set @风险规则代码#= replace(@风险规则代码#,concat("[",@风险要素#,"]"),@计算值#); */
            set v_risk_rule_code= replace(v_risk_rule_code,concat("[",v_risk_param,"]"),v_calc_value);
        else

            /* set @风险规则代码#= replace(@风险规则代码#,concat("[",@风险要素#,"]"),@计算值#); */
            set v_risk_rule_code= replace(v_risk_rule_code,concat("[",v_risk_param,"]"),v_calc_value);
        end if;
    end if;
    #第三个风险要素

    /* set @风险要素# = SUBSTRING_INDEX(SUBSTRING_INDEX(@风险要素串#,';',3),';',-1); */
    set v_risk_param = SUBSTRING_INDEX(SUBSTRING_INDEX(v_risk_param_str,';',3),';',-1);

    /* if length(@风险要素#)> 0 and SUBSTRING_INDEX(SUBSTRING_INDEX(@风险计算值串#,';',3),';',-1) <> '?' then */
    if length(v_risk_param)> 0 and SUBSTRING_INDEX(SUBSTRING_INDEX(v_risk_rule_calc_str,';',3),';',-1) <> '?' then

        /* set @计算值# = SUBSTRING_INDEX(SUBSTRING_INDEX(@风险计算值串#,';',3),';',-1); */
        set v_calc_value = SUBSTRING_INDEX(SUBSTRING_INDEX(v_risk_rule_calc_str,';',3),';',-1);

        /* set @风险规则代码#= replace(@风险规则代码#,concat("[",@风险要素#,"]"),@计算值#); */
        set v_risk_rule_code= replace(v_risk_rule_code,concat("[",v_risk_param,"]"),v_calc_value);
    end if;

    /* set @检测序号# = LOCATE("[n]",@风险规则代码#); */
    set v_test_id = LOCATE("[n]",v_risk_rule_code);
    #替换第一个[n]

    /* if @检测序号# > 0 then */
    if v_test_id > 0 then

        /* set @分子值# = SUBSTRING_INDEX(SUBSTRING_INDEX(@风险规则值串1#,';',1),';',-1); */
        set v_numer_value = SUBSTRING_INDEX(SUBSTRING_INDEX(v_risk_rule_value_str1,';',1),';',-1);

        /* set @风险规则代码# = INSERT(@风险规则代码#,@检测序号#,3,@分子值#); */
        set v_risk_rule_code = INSERT(v_risk_rule_code,v_test_id,3,v_numer_value);
    end if;

    /* set @检测序号# = LOCATE("[n]",@风险规则代码#); */
    set v_test_id = LOCATE("[n]",v_risk_rule_code);
    #替换第二个[n]

    /* if @检测序号# > 0 then */
    if v_test_id > 0 then

        /* set @分子值# = SUBSTRING_INDEX(SUBSTRING_INDEX(@风险规则值串1#,';',2),';',-1); */
        set v_numer_value = SUBSTRING_INDEX(SUBSTRING_INDEX(v_risk_rule_value_str1,';',2),';',-1);

        /* set @风险规则代码# = INSERT(@风险规则代码#,@检测序号#,3,@分子值#); */
        set v_risk_rule_code = INSERT(v_risk_rule_code,v_test_id,3,v_numer_value);
    end if;

    /* set @检测序号# = LOCATE("[n]",@风险规则代码#); */
    set v_test_id = LOCATE("[n]",v_risk_rule_code);
    #替换第三个[n]

    /* if @检测序号# > 0 then */
    if v_test_id > 0 then

        /* set @分子值# = SUBSTRING_INDEX(SUBSTRING_INDEX(@风险规则值串1#,';',3),';',-1); */
        set v_numer_value = SUBSTRING_INDEX(SUBSTRING_INDEX(v_risk_rule_value_str1,';',3),';',-1);

        /* set @风险规则代码# = INSERT(@风险规则代码#,@检测序号#,3,@分子值#); */
        set v_risk_rule_code = INSERT(v_risk_rule_code,v_test_id,3,v_numer_value);
    end if;
    #如果风险要素不在风险要素串中，则为需要计算的风险要素，根据具体的风险要素名称来进行处理

    /* set @风险要素值# = 0; */
    set v_risk_param_value = 0;

    /* set @估值价格# = 0; */
    set v_evalu_price = 0;

    /* set @临时_市场编号# = @市场编号#; */
    set v_tmp_exch_no = v_exch_no;

    /* set @相关性# = 《相关性-相关》; */
    set v_is_relative = 1;
    #产品单独特殊处理

    /* if @产品编号# <> 0 then */
    if v_pd_no <> 0 then

        /* set @产品编号串# = concat(@产品编号#,";"); */
        set v_pd_no_str = concat(v_pd_no,";");
    end if;

    /* if @触发阶段类型# = 《触发阶段类型-交易端》 then */
    if v_trig_stage_type = 2 then

        /* [获取表记录变量语句][风控证券_风控_预订单信息表][sum(case when {订单方向} = 1 then {订单数量} else -{订单数量} end),sum((case when {订单方向} = 1 then {订单数量} else -{订单数量} end) * {订单价格}),sum({全部费用}),sum({订单数量}),sum({订单数量}*{订单价格})][@变动数量#,@变动金额#,@全部费用#,@临时_变动数量#,@临时_变动金额#][instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0  ] */
        select sum(case when order_dir = 1 then order_qty else -order_qty end),sum((case when order_dir = 1 then order_qty else -order_qty end) * order_price),sum(all_fee),sum(order_qty),sum(order_qty*order_price) into v_occur_qty,v_occur_amt,v_all_fee,v_tmp_occur_qty,v_tmp_occur_amt from db_rksecu.tb_rkserk_preorder where instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0   limit 1;


    /* elseif @触发阶段类型# = 《触发阶段类型-指令端》 then */
    elseif v_trig_stage_type = 1 then

        /* [获取表记录变量语句][风控证券_风控_预指令信息表][sum(case when {指令方向} = 1 then {指令数量} else -{指令数量} end),sum((case when {指令方向} = 1 then {指令数量} else -{指令数量} end) * {指令实际限价}),sum({全部费用}),sum({指令数量}),sum({指令数量}*{指令实际限价})][@变动数量#,@变动金额#,@全部费用#,@临时_变动数量#,@临时_变动金额#][instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0  ] */
        select sum(case when comm_dir = 1 then comm_qty else -comm_qty end),sum((case when comm_dir = 1 then comm_qty else -comm_qty end) * limit_actual_price),sum(all_fee),sum(comm_qty),sum(comm_qty*limit_actual_price) into v_occur_qty,v_occur_amt,v_all_fee,v_tmp_occur_qty,v_tmp_occur_amt from db_rksecu.tb_rkserk_precommand where instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0   limit 1;

    end if;
    #单笔交易金额和数量，跳出

    /* if instr(@风险规则代码#,"[单笔交易数量]")>0  or instr(@风险规则代码#,"[单笔交易额度]")>0 then */
    if instr(v_risk_rule_code,"[单笔交易数量]")>0  or instr(v_risk_rule_code,"[单笔交易额度]")>0 then

          /* set @相关性#  = 《相关性-不相关》; */
          set v_is_relative  = 0;
    end if;

    /* if instr(@风险规则代码#,"[持仓数量]")>0 then */
    if instr(v_risk_rule_code,"[持仓数量]")>0 then

      /* if (@触发方向# =《触发方向-大于》 or @触发方向# =《触发方向-大于等于》  and @变动数量#> 0) or (@触发方向# =《触发方向-小于》 or @触发方向# =《触发方向-小于等于》  and @变动数量#< 0) then */
      if (v_trig_type =1 or v_trig_type =2  and v_occur_qty> 0) or (v_trig_type =3 or v_trig_type =4  and v_occur_qty< 0) then

          /* set @相关性#  = 《相关性-相关》; */
          set v_is_relative  = 1;
      else

          /* set @相关性#  = 《相关性-不相关》; */
          set v_is_relative  = 0;

          /* [检查正常返回][@相关性#  = 《相关性-不相关》] */
          if v_is_relative  = 0 then
              leave label_pro;
          end if;

      end if;

      /* 调用【原子_风控证券_计算_计算单证券持仓数量】*/
      call db_rksecu.pra_rksecc_CalcStockPositionHoldingEquities(
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
          v_exch_no,
          v_stock_code,
          v_trig_stage_type,
          v_compli_calc_level,
          v_trig_type,
          v_error_code,
          v_error_info,
          v_posi_qty);
      if v_error_code = "1" then
          SET v_error_code = "rksecuA.4.60.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券持仓数量出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* SET @临时_持仓数量# = @持仓数量#; */
      SET v_tmp_posi_qty = v_posi_qty;

      /* 调用【原子_风控证券_计算_计算单证券大宗交易数量】*/
      call db_rksecu.pra_rksecc_CalcStockBlockTradeHoldingQty(
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
          v_exch_no,
          v_stock_code_no,
          v_error_code,
          v_error_info,
          v_posi_qty);
      if v_error_code = "1" then
          SET v_error_code = "rksecuA.4.60.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券大宗交易数量出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* SET @持仓数量# = @持仓数量# + @临时_持仓数量#; */
      SET v_posi_qty = v_posi_qty + v_tmp_posi_qty;

      /* set @风险要素值# = round((@持仓数量# + @变动数量#),0); */
      set v_risk_param_value = round((v_posi_qty + v_occur_qty),0);

      /* set @风险规则代码# = replace(@风险规则代码#,"[持仓数量]",@风险要素值#); */
      set v_risk_rule_code = replace(v_risk_rule_code,"[持仓数量]",v_risk_param_value);

        /* set @分子值# = @风险要素值#; */
        set v_numer_value = v_risk_param_value;
    end if;
    #单证券成本

    /* if instr(@风险规则代码#,"[单证券成本]")>0 then */
    if instr(v_risk_rule_code,"[单证券成本]")>0 then

        /* 调用【原子_风控证券_计算_获取证券估值价格】*/
        call db_rksecu.pra_rksecc_GetStockValuationPrice(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_error_code,
            v_error_info,
            v_evalu_price);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券估值价格出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @单券成本# = (@变动金额# + @全部费用#)  * (case when @市场编号# = 3 or @市场编号# = 4 then @买入参考汇率# else 1 end); */
        set v_per_secu_cost_amt = (v_occur_amt + v_all_fee)  * (case when v_exch_no = 3 or v_exch_no = 4 then v_buy_ref_rate else 1 end);

        /* if (@触发方向# =《触发方向-大于》 or @触发方向# =《触发方向-大于等于》  and @单券成本#> 0) or (@触发方向# =《触发方向-小于》 or @触发方向# =《触发方向-小于等于》  and @单券成本#< 0) then */
        if (v_trig_type =1 or v_trig_type =2  and v_per_secu_cost_amt> 0) or (v_trig_type =3 or v_trig_type =4  and v_per_secu_cost_amt< 0) then

            /* set @相关性#  = 《相关性-相关》; */
            set v_is_relative  = 1;
        else

            /* set @相关性#  = 《相关性-不相关》; */
            set v_is_relative  = 0;

            /* [检查正常返回][@相关性#  = 《相关性-不相关》] */
            if v_is_relative  = 0 then
                leave label_pro;
            end if;

        end if;

        /* 调用【原子_风控证券_计算_计算单证券持仓成本】*/
        call db_rksecu.pra_rksecc_CalcStockPositionHoldingCost(
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
            v_exch_no,
            v_stock_code,
            v_trig_stage_type,
            v_compli_calc_level,
            v_trig_type,
            v_buy_ref_rate,
            v_error_code,
            v_error_info,
            v_posi_cost);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券持仓成本出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @风险要素值# = round((@持仓成本# + @单券成本#),2); */
        set v_risk_param_value = round((v_posi_cost + v_per_secu_cost_amt),2);

        /* set @风险规则代码# = replace(@风险规则代码#,"[单证券成本]",@风险要素值#); */
        set v_risk_rule_code = replace(v_risk_rule_code,"[单证券成本]",v_risk_param_value);

        /* set @分子值# = @风险要素值#; */
        set v_numer_value = v_risk_param_value;
    end if;
    #合计成本

    /* if instr(@风险规则代码#,"[合计成本]")>0 then */
    if instr(v_risk_rule_code,"[合计成本]")>0 then

        /* set @单券成本# = (@变动金额# + @全部费用#)  * (case when @市场编号# = 3 or @市场编号# = 4 then @买入参考汇率# else 1 end); */
        set v_per_secu_cost_amt = (v_occur_amt + v_all_fee)  * (case when v_exch_no = 3 or v_exch_no = 4 then v_buy_ref_rate else 1 end);

        /* if (@触发方向# =《触发方向-大于》 or @触发方向# =《触发方向-大于等于》  and @单券成本#> 0) or (@触发方向# =《触发方向-小于》 or @触发方向# =《触发方向-小于等于》  and @单券成本#< 0) then */
        if (v_trig_type =1 or v_trig_type =2  and v_per_secu_cost_amt> 0) or (v_trig_type =3 or v_trig_type =4  and v_per_secu_cost_amt< 0) then

            /* set @相关性#  = 《相关性-相关》; */
            set v_is_relative  = 1;
        else

            /* set @相关性#  = 《相关性-不相关》; */
            set v_is_relative  = 0;

            /* [检查正常返回][@相关性#  = 《相关性-不相关》] */
            if v_is_relative  = 0 then
                leave label_pro;
            end if;

        end if;
        #[原子_风控证券_计算_计算单证券持仓成本]

        /* set @风险要素值# = round((@临时_分子值# + @单券成本#),2); */
        set v_risk_param_value = round((v_tmp_numer_value + v_per_secu_cost_amt),2);

        /* set @分子值# = @风险要素值#; */
        set v_numer_value = v_risk_param_value;

        /* set @风险规则代码# = replace(@风险规则代码#,"[合计成本]",@风险要素值#); */
        set v_risk_rule_code = replace(v_risk_rule_code,"[合计成本]",v_risk_param_value);
    end if;
    #单证券市值

    /* if instr(@风险规则代码#,"[单证券市值]")>0 then */
    if instr(v_risk_rule_code,"[单证券市值]")>0 then

        /* if (@触发方向# =《触发方向-大于》 or @触发方向# =《触发方向-大于等于》  and @变动数量#> 0) or (@触发方向# =《触发方向-小于》 or @触发方向# =《触发方向-小于等于》  and @变动数量#< 0) then */
        if (v_trig_type =1 or v_trig_type =2  and v_occur_qty> 0) or (v_trig_type =3 or v_trig_type =4  and v_occur_qty< 0) then

            /* set @相关性#  = 《相关性-相关》; */
            set v_is_relative  = 1;
        else

            /* set @相关性#  = 《相关性-不相关》; */
            set v_is_relative  = 0;

            /* [检查正常返回][@相关性#  = 《相关性-不相关》] */
            if v_is_relative  = 0 then
                leave label_pro;
            end if;

        end if;

        /* set @买入参考汇率# = (@买入参考汇率#+@卖出参考汇率#)/2; */
        set v_buy_ref_rate = (v_buy_ref_rate+v_sell_ref_rate)/2;

        /* 调用【原子_风控证券_计算_计算单证券持仓数量】*/
        call db_rksecu.pra_rksecc_CalcStockPositionHoldingEquities(
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
            v_exch_no,
            v_stock_code,
            v_trig_stage_type,
            v_compli_calc_level,
            v_trig_type,
            v_error_code,
            v_error_info,
            v_posi_qty);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券持仓数量出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* 调用【原子_风控证券_计算_获取证券估值价格】*/
        call db_rksecu.pra_rksecc_GetStockValuationPrice(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_error_code,
            v_error_info,
            v_evalu_price);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券估值价格出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* SET @持仓市值#=(@持仓数量#+ @变动数量#) * @估值价格#; */
        SET v_posi_market_value=(v_posi_qty+ v_occur_qty) * v_evalu_price;

        /* SET @临时_持仓市值# = @持仓市值#; */
        SET v_tmp_posi_market_value = v_posi_market_value;

        /* 调用【原子_风控证券_计算_计算单证券大宗交易市值】*/
        call db_rksecu.pra_rksecc_CalcStockBlockTradeHoldingEquities(
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
            v_exch_no,
            v_stock_code_no,
            v_error_code,
            v_error_info,
            v_posi_market_value);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券大宗交易市值出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* SET @持仓市值#=@临时_持仓市值# + @持仓市值#; */
        SET v_posi_market_value=v_tmp_posi_market_value + v_posi_market_value;

        /* set @风险要素值# = round((case when @市场编号# = 3 or @市场编号# = 4 then @持仓市值# * @买入参考汇率# else @持仓市值# end),2); */
        set v_risk_param_value = round((case when v_exch_no = 3 or v_exch_no = 4 then v_posi_market_value * v_buy_ref_rate else v_posi_market_value end),2);

        /* set @风险规则代码# = replace(@风险规则代码#,"[单证券市值]",@风险要素值#); */
        set v_risk_rule_code = replace(v_risk_rule_code,"[单证券市值]",v_risk_param_value);

        /* set @分子值# = @风险要素值#; */
        set v_numer_value = v_risk_param_value;
    end if;
    #合计市值

    /* if instr(@风险规则代码#,"[合计市值]")>0 then */
    if instr(v_risk_rule_code,"[合计市值]")>0 then

        /* if (@触发方向# =《触发方向-大于》 or @触发方向# =《触发方向-大于等于》  and @变动数量#> 0) or (@触发方向# =《触发方向-小于》 or @触发方向# =《触发方向-小于等于》  and @变动数量#< 0) then */
        if (v_trig_type =1 or v_trig_type =2  and v_occur_qty> 0) or (v_trig_type =3 or v_trig_type =4  and v_occur_qty< 0) then

            /* set @相关性#  = 《相关性-相关》; */
            set v_is_relative  = 1;
        else

            /* set @相关性#  = 《相关性-不相关》; */
            set v_is_relative  = 0;

            /* [检查正常返回][@相关性#  = 《相关性-不相关》] */
            if v_is_relative  = 0 then
                leave label_pro;
            end if;

        end if;

        /* 调用【原子_风控证券_计算_获取证券估值价格】*/
        call db_rksecu.pra_rksecc_GetStockValuationPrice(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_error_code,
            v_error_info,
            v_evalu_price);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券估值价格出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


               /* set @买入参考汇率# = (@买入参考汇率#+@卖出参考汇率#)/2; */
               set v_buy_ref_rate = (v_buy_ref_rate+v_sell_ref_rate)/2;

               /* set @变动市值# = @变动数量#*@估值价格#; */
               set v_occur_market_value = v_occur_qty*v_evalu_price;

               /* if @现金资产标志# = 2 then */
               if v_cash_asset_flag = 2 then

                  /* set  @持仓市值# = @临时_分子值# - (case when @市场编号# = 3 or @市场编号# = 4 then @变动市值# * @买入参考汇率# else @变动市值# end); */
                  set  v_posi_market_value = v_tmp_numer_value - (case when v_exch_no = 3 or v_exch_no = 4 then v_occur_market_value * v_buy_ref_rate else v_occur_market_value end);
               else

                   /* set  @持仓市值# = @临时_分子值# + (case when @市场编号# = 3 or @市场编号# = 4 then @变动市值# * @买入参考汇率# else @变动市值# end); */
                   set  v_posi_market_value = v_tmp_numer_value + (case when v_exch_no = 3 or v_exch_no = 4 then v_occur_market_value * v_buy_ref_rate else v_occur_market_value end);
               end if;

          /* set @风险要素值# = round(@持仓市值#,2); */
          set v_risk_param_value = round(v_posi_market_value,2);

          /* set @风险规则代码# = replace(@风险规则代码#,"[合计市值]",@风险要素值#); */
          set v_risk_rule_code = replace(v_risk_rule_code,"[合计市值]",v_risk_param_value);

          /* set @分子值# = @风险要素值#; */
          set v_numer_value = v_risk_param_value;
    end if;
    #同类证券总市值

    /* if instr(@风险规则代码#,"[同类证券总市值]")>0 then */
    if instr(v_risk_rule_code,"[同类证券总市值]")>0 then

        /* 调用【原子_风控证券_计算_获取证券估值价格】*/
        call db_rksecu.pra_rksecc_GetStockValuationPrice(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_error_code,
            v_error_info,
            v_evalu_price);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券估值价格出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @买入参考汇率# = (@买入参考汇率#+@卖出参考汇率#)/2; */
        set v_buy_ref_rate = (v_buy_ref_rate+v_sell_ref_rate)/2;

        /* set @变动市值# = @变动数量#*@估值价格#; */
        set v_occur_market_value = v_occur_qty*v_evalu_price;

        /* if @现金资产标志# = 2 then */
        if v_cash_asset_flag = 2 then

           /* set  @持仓市值# = @临时_分母值# - (case when @市场编号# = 3 or @市场编号# = 4 then @变动市值# * @买入参考汇率# else @变动市值# end); */
           set  v_posi_market_value = v_tmp_dino_value - (case when v_exch_no = 3 or v_exch_no = 4 then v_occur_market_value * v_buy_ref_rate else v_occur_market_value end);
        else

            /* set  @持仓市值# = @临时_分母值# + (case when @市场编号# = 3 or @市场编号# = 4 then @变动市值# * @买入参考汇率# else @变动市值# end); */
            set  v_posi_market_value = v_tmp_dino_value + (case when v_exch_no = 3 or v_exch_no = 4 then v_occur_market_value * v_buy_ref_rate else v_occur_market_value end);
        end if;

        /* set @风险要素值# = round(@持仓市值#,2); */
        set v_risk_param_value = round(v_posi_market_value,2);

        /* set @风险规则代码# = replace(@风险规则代码#,"[同类证券总市值]",@风险要素值#); */
        set v_risk_rule_code = replace(v_risk_rule_code,"[同类证券总市值]",v_risk_param_value);

        /* set @分母值# = @风险要素值#; */
        set v_dino_value = v_risk_param_value;
    end if;
    #流通股本

    /* if instr(@风险规则代码#,"[流通股本]")>0 then */
    if instr(v_risk_rule_code,"[流通股本]")>0 then

        /* 调用【原子_风控证券_计算_获取证券信息】*/
        call db_rksecu.pra_rksecc_GetStockInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_error_code,
            v_error_info,
            v_total_stock_issue,
            v_circl_stock_capit,
            v_stock_type,
            v_last_price,
            v_pre_close_price,
            v_today_open_price,
            v_strike_amt);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @风险要素值# = round(@流通股本#,2); */
        set v_risk_param_value = round(v_circl_stock_capit,2);

        /* set @风险规则代码# = replace(@风险规则代码#,"[流通股本]",@风险要素值#); */
        set v_risk_rule_code = replace(v_risk_rule_code,"[流通股本]",v_risk_param_value);

        /* set @分母值# = @风险要素值#; */
        set v_dino_value = v_risk_param_value;
    end if;
    #总股本

    /* if instr(@风险规则代码#,"[总股本]")>0 then */
    if instr(v_risk_rule_code,"[总股本]")>0 then

        /* 调用【原子_风控证券_计算_获取证券信息】*/
        call db_rksecu.pra_rksecc_GetStockInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_stock_code,
            v_error_code,
            v_error_info,
            v_total_stock_issue,
            v_circl_stock_capit,
            v_stock_type,
            v_last_price,
            v_pre_close_price,
            v_today_open_price,
            v_strike_amt);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @风险要素值# = round(@总股本#,2); */
        set v_risk_param_value = round(v_total_stock_issue,2);

        /* set @风险规则代码# = replace(@风险规则代码#,"[总股本]",@风险要素值#); */
        set v_risk_rule_code = replace(v_risk_rule_code,"[总股本]",v_risk_param_value);

        /* set @分母值# = @风险要素值#; */
        set v_dino_value = v_risk_param_value;
    end if;
    #昨日总净值

    /* if instr(@风险规则代码#,"[昨日总净值]")>0 then */
    if instr(v_risk_rule_code,"[昨日总净值]")>0 then

        /* 调用【原子_风控证券_计算_获取昨日净资产】*/
        call db_rksecu.pra_rksecc_GetProductPreNetAsset(
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
            v_compli_calc_level,
            v_error_code,
            v_error_info,
            v_nav_asset);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取昨日净资产出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @风险要素值# = round(@净资产#,2); */
        set v_risk_param_value = round(v_nav_asset,2);

        /* set @风险规则代码# = replace(@风险规则代码#,"[净资产]",@风险要素值#); */
        set v_risk_rule_code = replace(v_risk_rule_code,"[净资产]",v_risk_param_value);

        /* set @分母值# = @风险要素值#; */
        set v_dino_value = v_risk_param_value;
    end if;
    #汇总交易额度

    /* if instr(@风险规则代码#,"[汇总交易额度]")>0  then */
    if instr(v_risk_rule_code,"[汇总交易额度]")>0  then

        /* if (@触发方向# =《触发方向-大于》 or @触发方向# =《触发方向-大于等于》  and @临时_变动金额#> 0) or (@触发方向# =《触发方向-小于》 or @触发方向# =《触发方向-小于等于》  and @临时_变动金额#< 0) then */
        if (v_trig_type =1 or v_trig_type =2  and v_tmp_occur_amt> 0) or (v_trig_type =3 or v_trig_type =4  and v_tmp_occur_amt< 0) then

            /* set @相关性#  = 《相关性-相关》; */
            set v_is_relative  = 1;
        else

            /* set @相关性#  = 《相关性-不相关》; */
            set v_is_relative  = 0;

            /* [检查正常返回][@相关性#  = 《相关性-不相关》] */
            if v_is_relative  = 0 then
                leave label_pro;
            end if;

        end if;

        /* 调用【原子_风控证券_计算_计算当前交易金额】*/
        call db_rksecu.pra_rksecc_CalcCurrentTradingAmt(
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
            v_compli_calc_level,
            v_trig_stage_type,
            v_buy_ref_rate,
            v_error_code,
            v_error_info,
            v_trade_amt);
        if v_error_code = "1" then
            SET v_error_code = "rksecuA.4.60.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算当前交易金额出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @风险要素值# = round((@交易金额#+@临时_变动金额#),2); */
        set v_risk_param_value = round((v_trade_amt+v_tmp_occur_amt),2);

        /* set @风险规则代码# = replace(@风险规则代码#,"[汇总交易额度]",@风险要素值#); */
        set v_risk_rule_code = replace(v_risk_rule_code,"[汇总交易额度]",v_risk_param_value);

        /* set @分子值# = @风险要素值#; */
        set v_numer_value = v_risk_param_value;
    end if;
    #关联单证券成本

    /* if instr(@风险规则代码#,"[关联单证券成本]")>0 then */
    if instr(v_risk_rule_code,"[关联单证券成本]")>0 then

        /* set @临时_证券代码# = @证券代码#; */
        set v_tmp_stock_code = v_stock_code;

        /* set @临时_市场编号# = @市场编号#; */
        set v_tmp_exch_no = v_exch_no;

        /* set @单券成本# = (@变动金额# + @全部费用#)  * (case when @市场编号# = 3 or @市场编号# = 4 then @买入参考汇率# else 1 end); */
        set v_per_secu_cost_amt = (v_occur_amt + v_all_fee)  * (case when v_exch_no = 3 or v_exch_no = 4 then v_buy_ref_rate else 1 end);

        /* if (@触发方向# =《触发方向-大于》 or @触发方向# =《触发方向-大于等于》  and @单券成本#> 0) or (@触发方向# =《触发方向-小于》 or @触发方向# =《触发方向-小于等于》  and @单券成本#< 0) then */
        if (v_trig_type =1 or v_trig_type =2  and v_per_secu_cost_amt> 0) or (v_trig_type =3 or v_trig_type =4  and v_per_secu_cost_amt< 0) then

            /* set @相关性#  = 《相关性-相关》; */
            set v_is_relative  = 1;
        else

            /* set @相关性#  = 《相关性-不相关》; */
            set v_is_relative  = 0;

            /* [检查正常返回][@相关性#  = 《相关性-不相关》] */
            if v_is_relative  = 0 then
                leave label_pro;
            end if;

        end if;

        /* if @市场编号# = 1 or @市场编号# = 2 then */
        if v_exch_no = 1 or v_exch_no = 2 then

          /* 调用【原子_风控证券_计算_计算单证券持仓成本】*/
          call db_rksecu.pra_rksecc_CalcStockPositionHoldingCost(
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
              v_exch_no,
              v_stock_code,
              v_trig_stage_type,
              v_compli_calc_level,
              v_trig_type,
              v_buy_ref_rate,
              v_error_code,
              v_error_info,
              v_posi_cost);
          if v_error_code = "1" then
              SET v_error_code = "rksecuA.4.60.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券持仓成本出现错误！',v_mysql_message);
              end if;
              leave label_pro;
          elseif v_error_code <> "0" then
              leave label_pro;
          end if;


          /* set @风险要素值# = round((@持仓成本# + @单券成本#),3); */
          set v_risk_param_value = round((v_posi_cost + v_per_secu_cost_amt),3);

          /* 调用【原子_风控证券_维度_获取H股代码关系】*/
          call db_rksecu.pra_rksedm_GetHstockCode(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_exch_no,
              v_stock_code,
              v_error_code,
              v_error_info,
              v_hk_stock_code);
          if v_error_code = "1" then
              SET v_error_code = "rksecuA.4.60.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_维度_获取H股代码关系出现错误！',v_mysql_message);
              end if;
              leave label_pro;
          elseif v_error_code <> "0" then
              leave label_pro;
          end if;


          /* set @证券代码# = @港股代码#; */
          set v_stock_code = v_hk_stock_code;

          /* set @市场编号# = 3; */
          set v_exch_no = 3;

          /* 调用【原子_风控证券_计算_计算单证券持仓成本】*/
          call db_rksecu.pra_rksecc_CalcStockPositionHoldingCost(
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
              v_exch_no,
              v_stock_code,
              v_trig_stage_type,
              v_compli_calc_level,
              v_trig_type,
              v_buy_ref_rate,
              v_error_code,
              v_error_info,
              v_posi_cost);
          if v_error_code = "1" then
              SET v_error_code = "rksecuA.4.60.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券持仓成本出现错误！',v_mysql_message);
              end if;
              leave label_pro;
          elseif v_error_code <> "0" then
              leave label_pro;
          end if;


          /* set @风险要素值# = round(@持仓成本# + @风险要素值#,2); */
          set v_risk_param_value = round(v_posi_cost + v_risk_param_value,2);
        else

          /* 调用【原子_风控证券_计算_计算单证券持仓成本】*/
          call db_rksecu.pra_rksecc_CalcStockPositionHoldingCost(
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
              v_exch_no,
              v_stock_code,
              v_trig_stage_type,
              v_compli_calc_level,
              v_trig_type,
              v_buy_ref_rate,
              v_error_code,
              v_error_info,
              v_posi_cost);
          if v_error_code = "1" then
              SET v_error_code = "rksecuA.4.60.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券持仓成本出现错误！',v_mysql_message);
              end if;
              leave label_pro;
          elseif v_error_code <> "0" then
              leave label_pro;
          end if;


          /* set @风险要素值# =round((@持仓成本# + @单券成本#),2); */
          set v_risk_param_value =round((v_posi_cost + v_per_secu_cost_amt),2);

          /* set @港股代码# = @证券代码#; */
          set v_hk_stock_code = v_stock_code;

          /* 调用【原子_风控证券_维度_获取A股代码关系】*/
          call db_rksecu.pra_rksedm_GetAstockCode(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_hk_stock_code,
              v_error_code,
              v_error_info,
              v_stock_code,
              v_exch_no);
          if v_error_code = "1" then
              SET v_error_code = "rksecuA.4.60.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_维度_获取A股代码关系出现错误！',v_mysql_message);
              end if;
              leave label_pro;
          elseif v_error_code <> "0" then
              leave label_pro;
          end if;


          /* 调用【原子_风控证券_计算_计算单证券持仓成本】*/
          call db_rksecu.pra_rksecc_CalcStockPositionHoldingCost(
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
              v_exch_no,
              v_stock_code,
              v_trig_stage_type,
              v_compli_calc_level,
              v_trig_type,
              v_buy_ref_rate,
              v_error_code,
              v_error_info,
              v_posi_cost);
          if v_error_code = "1" then
              SET v_error_code = "rksecuA.4.60.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券持仓成本出现错误！',v_mysql_message);
              end if;
              leave label_pro;
          elseif v_error_code <> "0" then
              leave label_pro;
          end if;


          /* set @风险要素值# = round((@持仓成本#) + @风险要素值#,2); */
          set v_risk_param_value = round((v_posi_cost) + v_risk_param_value,2);
        end if;

        /* set @证券代码# = @临时_证券代码#; */
        set v_stock_code = v_tmp_stock_code;

        /* set @市场编号# = @临时_市场编号#; */
        set v_exch_no = v_tmp_exch_no;

        /* set @风险规则代码# = replace(@风险规则代码#,"[关联单证券成本]",@风险要素值#); */
        set v_risk_rule_code = replace(v_risk_rule_code,"[关联单证券成本]",v_risk_param_value);

        /* set @分子值# = @风险要素值#; */
        set v_numer_value = v_risk_param_value;
    end if;
    #同反向

    /* if instr(@风险规则代码#,"[日内对敲]")>0 or instr(@风险规则代码#,"[日内反向]")>0 or instr(@风险规则代码#,"[挂单对敲]")>0 or instr(@风险规则代码#,"[挂单反向]")>0 then */
    if instr(v_risk_rule_code,"[日内对敲]")>0 or instr(v_risk_rule_code,"[日内反向]")>0 or instr(v_risk_rule_code,"[挂单对敲]")>0 or instr(v_risk_rule_code,"[挂单反向]")>0 then

        /* if @市场编号# = 1 or @市场编号# = 2 then */
        if v_exch_no = 1 or v_exch_no = 2 then

            /* 调用【原子_风控证券_计算_联合汇总获取反向交易合规】*/
            call db_rksecu.pra_rksecc_SumGetStockReverseTradeCompliance(
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
                v_exch_no,
                v_stock_code_no,
                v_trig_stage_type,
                v_compli_calc_level,
                v_risk_rule_code,
                v_union_flag,
                v_row_id_str,
                v_error_code,
                v_error_info,
                v_record_count);
            if v_error_code = "1" then
                SET v_error_code = "rksecuA.4.60.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_联合汇总获取反向交易合规出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        else

            /* 调用【原子_风控证券_计算_获取港股证券代码编号】*/
            call db_rksecu.pra_rksecc_GetHKStockCodeNo(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_exch_no,
                v_stock_code,
                v_error_code,
                v_error_info,
                v_sh_hk_stock_code_no,
                v_sz_hk_stock_code_no);
            if v_error_code = "1" then
                SET v_error_code = "rksecuA.4.60.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取港股证券代码编号出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* if @触发阶段类型# = 《触发阶段类型-交易端》 then */
            if v_trig_stage_type = 2 then

                /* [获取表记录变量语句][风控证券_风控_预订单信息表][group_concat(distinct({记录序号}) separator ';')][@记录序号串#][{订单批号} = @订单批号# and {机构编号} = @机构编号# and (instr(concat(";",@产品编号串#),concat(";",{产品编号},";")) > 0 or @产品编号串# = -1 or @产品编号串# = " ") and (instr(concat(";",@交易组编号串#),concat(";",{交易组编号},";"))>0 or @交易组编号串# = "-1" or @交易组编号串# = " ") and instr(concat(";",@订单方向串#),concat(";",{订单方向},";"))>0 and  {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#)] */
                select group_concat(distinct(row_id) separator ';') into v_row_id_str from db_rksecu.tb_rkserk_preorder where order_batch_no = v_order_batch_no and co_no = v_co_no and (instr(concat(";",v_pd_no_str),concat(";",pd_no,";")) > 0 or v_pd_no_str = -1 or v_pd_no_str = " ") and (instr(concat(";",v_exch_group_no_str),concat(";",exch_group_no,";"))>0 or v_exch_group_no_str = "-1" or v_exch_group_no_str = " ") and instr(concat(";",v_order_dir_str),concat(";",order_dir,";"))>0 and  stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) limit 1;


            /* elseif @触发阶段类型# = 《触发阶段类型-指令端》 then */
            elseif v_trig_stage_type = 1 then

                /* [获取表记录变量语句][风控证券_风控_预指令信息表][group_concat(distinct({记录序号}) separator ';')][@记录序号串#][{指令批号} = @订单批号# and {机构编号} = @机构编号# and (instr(concat(";",@产品编号串#),concat(";",{产品编号},";")) > 0 or @产品编号串# = -1 or @产品编号串# = " ") and (instr(concat(";",@交易组编号串#),concat(";",{交易组编号},";"))>0 or @交易组编号串# = "-1" or @交易组编号串# = " ") and instr(concat(";",@订单方向串#),concat(";",{指令方向},";"))>0 and  {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#)] */
                select group_concat(distinct(row_id) separator ';') into v_row_id_str from db_rksecu.tb_rkserk_precommand where comm_batch_no = v_order_batch_no and co_no = v_co_no and (instr(concat(";",v_pd_no_str),concat(";",pd_no,";")) > 0 or v_pd_no_str = -1 or v_pd_no_str = " ") and (instr(concat(";",v_exch_group_no_str),concat(";",exch_group_no,";"))>0 or v_exch_group_no_str = "-1" or v_exch_group_no_str = " ") and instr(concat(";",v_order_dir_str),concat(";",comm_dir,";"))>0 and  stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) limit 1;

            end if;

            /* 调用【原子_风控证券_计算_联合汇总获取反向交易合规】*/
            call db_rksecu.pra_rksecc_SumGetStockReverseTradeCompliance(
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
                v_exch_no,
                v_stock_code_no,
                v_trig_stage_type,
                v_compli_calc_level,
                v_risk_rule_code,
                v_union_flag,
                v_row_id_str,
                v_error_code,
                v_error_info,
                v_record_count);
            if v_error_code = "1" then
                SET v_error_code = "rksecuA.4.60.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_联合汇总获取反向交易合规出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

         end if;

        /* if @记录个数# = 0 then */
        if v_record_count = 0 then

            /* set @相关性# = 《相关性-不相关》; */
            set v_is_relative = 0;

            /* [检查正常返回][@相关性#  = 《相关性-不相关》] */
            if v_is_relative  = 0 then
                leave label_pro;
            end if;

        else

            /* set @风险规则代码# = replace(@风险规则代码#,"[日内对敲]",@记录个数#); */
            set v_risk_rule_code = replace(v_risk_rule_code,"[日内对敲]",v_record_count);

            /* set @风险规则代码# = replace(@风险规则代码#,"[日内反向]",@记录个数#); */
            set v_risk_rule_code = replace(v_risk_rule_code,"[日内反向]",v_record_count);

            /* set @风险规则代码# = replace(@风险规则代码#,"[挂单对敲]",@记录个数#); */
            set v_risk_rule_code = replace(v_risk_rule_code,"[挂单对敲]",v_record_count);

            /* set @风险规则代码# = replace(@风险规则代码#,"[挂单反向]",@记录个数#); */
            set v_risk_rule_code = replace(v_risk_rule_code,"[挂单反向]",v_record_count);
        end if;
    end if;
    END;

    SET p_risk_rule_code = v_risk_rule_code;
    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_risk_param_value = v_risk_param_value;
    SET p_numer_value = v_numer_value;
    SET p_is_relative = v_is_relative;
    SET p_dino_value = v_dino_value;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_交易检查联合汇总客户风险
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_CheckSumSecuClientRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_CheckSumSecuClientRisk(
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
    IN p_compli_trig_id bigint,
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_compli_rules_remark varchar(255),
    OUT p_risk_rule_action varchar(32),
    OUT p_risk_param_value varchar(255),
    OUT p_risk_rule_value_str varchar(255),
    OUT p_trig_type int,
    OUT p_numer_value decimal(18,4),
    OUT p_dino_value decimal(18,4),
    OUT p_risk_rule_type int,
    OUT p_client_risk_rule_id int
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
    declare v_compli_trig_id bigint;
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_compli_rules_remark varchar(255);
    declare v_risk_rule_action varchar(32);
    declare v_risk_param_value varchar(255);
    declare v_risk_rule_value_str varchar(255);
    declare v_trig_type int;
    declare v_numer_value decimal(18,4);
    declare v_dino_value decimal(18,4);
    declare v_risk_rule_type int;
    declare v_client_risk_rule_id int;
    declare v_mach_time int;
    declare v_exch_no int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
    declare v_split_str varchar(4);
    declare v_tmp_stock_code_no_str varchar(4096);
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_target_stock_code_no_str varchar(4096);
    declare v_tmp_pd_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_risk_param_value_str varchar(1024);
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
    declare v_model_id bigint;
    declare v_risk_item_id int;
    declare v_risk_rule_id int;
    declare v_risk_rule_name varchar(64);
    declare v_risk_rule_code varchar(2048);
    declare v_risk_param_str varchar(2048);
    declare v_union_flag int;
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
    declare v_record_count int;
    declare v_cash_asset_flag int;
    declare v_row_id_str varchar(2048);
    declare v_risk_splice_str varchar(255);
    declare v_risk_loop_count int;
    declare v_tmp_risk_rule_code varchar(2048);
    declare v_is_relative int;
    declare v_tmp_risk_rule_action varchar(32);
    declare v_remark_info varchar(255);
    declare v_order_dir int;
    declare v_risk_rule_calc_str varchar(255);
    declare v_query_row_id bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_compli_rules_remark = " ";
    SET v_risk_rule_action = " ";
    SET v_risk_param_value = " ";
    SET v_risk_rule_value_str = " ";
    SET v_trig_type = 0;
    SET v_numer_value = 0;
    SET v_dino_value = 0;
    SET v_risk_rule_type = 0;
    SET v_client_risk_rule_id = 0;
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_exch_no = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;
    SET v_split_str = " ";
    SET v_tmp_stock_code_no_str = " ";
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_target_stock_code_no_str = " ";
    SET v_tmp_pd_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_risk_param_value_str = " ";
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
    SET v_model_id = 0;
    SET v_risk_item_id = 0;
    SET v_risk_rule_id = 0;
    SET v_risk_rule_name = " ";
    SET v_risk_rule_code = " ";
    SET v_risk_param_str = " ";
    SET v_union_flag = 0;
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
    SET v_record_count = 0;
    SET v_cash_asset_flag = 0;
    SET v_row_id_str = " ";
    SET v_risk_splice_str = " ";
    SET v_risk_loop_count = 0;
    SET v_tmp_risk_rule_code = " ";
    SET v_is_relative = 0;
    SET v_tmp_risk_rule_action = " ";
    SET v_remark_info = " ";
    SET v_order_dir = 0;
    SET v_risk_rule_calc_str = " ";
    SET v_query_row_id = 0;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @市场编号# = 3; */
    set v_exch_no = 3;

    /* 调用【原子_风控证券_计算_获取港股汇率】*/
    call db_rksecu.pra_rksecc_GetHKRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_buy_ref_rate,
        v_sell_ref_rate,
        v_settle_buy_rate,
        v_settle_sell_rate);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.4.61.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取港股汇率出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @分隔符# = ";"; */
    set v_split_str = ";";

    /* if @触发阶段类型# = 《触发阶段类型-交易端》 then */
    if v_trig_stage_type = 2 then

        /* [获取表记录变量语句][风控证券_风控_预订单信息表][group_concat(distinct({证券代码编号}) separator ';')][@临时_证券代码编号串#][{订单批号} = @订单批号# and {机构编号} = @机构编号#] */
        select group_concat(distinct(stock_code_no) separator ';') into v_tmp_stock_code_no_str from db_rksecu.tb_rkserk_preorder where order_batch_no = v_order_batch_no and co_no = v_co_no limit 1;


        /* [获取表记录变量语句][风控证券_风控_预订单信息表][{产品编号},{交易组编号}][@产品编号#,@交易组编号#][{记录序号} = @记录序号#] */
        select pd_no,exch_group_no into v_pd_no,v_exch_group_no from db_rksecu.tb_rkserk_preorder where row_id = v_row_id limit 1;


    /* elseif @触发阶段类型# = 《触发阶段类型-指令端》 then */
    elseif v_trig_stage_type = 1 then

        /* [获取表记录变量语句][风控证券_风控_预指令信息表][group_concat(distinct({证券代码编号}) separator ';')][@临时_证券代码编号串#][{指令批号} = @订单批号# and {机构编号} = @机构编号#] */
        select group_concat(distinct(stock_code_no) separator ';') into v_tmp_stock_code_no_str from db_rksecu.tb_rkserk_precommand where comm_batch_no = v_order_batch_no and co_no = v_co_no limit 1;


        /* [获取表记录变量语句][风控证券_风控_预指令信息表][{产品编号},{交易组编号}][@产品编号#,@交易组编号#][{记录序号} = @记录序号#] */
        select pd_no,exch_group_no into v_pd_no,v_exch_group_no from db_rksecu.tb_rkserk_precommand where row_id = v_row_id limit 1;

    end if;

    /* set @临时_证券代码编号串# = concat(@临时_证券代码编号串#,";"); */
    set v_tmp_stock_code_no_str = concat(v_tmp_stock_code_no_str,";");

    /* set @目标证券代码编号串# = @临时_证券代码编号串#; */
    set v_target_stock_code_no_str = v_tmp_stock_code_no_str;

    /* set @临时_产品编号# = @产品编号#; */
    set v_tmp_pd_no = v_pd_no;

    /* while LOCATE(@分隔符#,@临时_证券代码编号串#)<>0   do */
    while LOCATE(v_split_str,v_tmp_stock_code_no_str)<>0   do

        /* set @证券代码编号#=cast(substring(@临时_证券代码编号串#,1,LOCATE(@分隔符#,@临时_证券代码编号串#)-1) as SIGNED); */
        set v_stock_code_no=cast(substring(v_tmp_stock_code_no_str,1,LOCATE(v_split_str,v_tmp_stock_code_no_str)-1) as SIGNED);

        /* [获取表记录变量语句][风控证券_计算_证券信息表][{证券代码},{市场编号}][@证券代码#,@市场编号#][{证券代码编号}=@证券代码编号#] */
        select stock_code,exch_no into v_stock_code,v_exch_no from db_rksecu.tb_rksecc_secu_stock_info where stock_code_no=v_stock_code_no limit 1;


        /* set @风险要素值串# = concat(";","证券代码=", @证券代码#, ";"); */
        set v_risk_param_value_str = concat(";","证券代码=", v_stock_code, ";");

        /* [声明游标][风控证券_风控_客户风险规则表][字段][{机构编号} = @机构编号# and instr({触发阶段类型串}, @触发阶段类型#)>0  and {启用标志} = 《启用标志-启用》 and  {联合标志} =《联合标志-联合控制》  and  ({风险规则类别} <> 《风险规则类别-黑白名单合规》 and {风险规则类别} <> 《风险规则类别-交易价格合规》)  and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when     {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end)][cursor_rkserk_client_riskparam] */
        cursor_rkserk_client_riskparam:BEGIN
        DECLARE v_cursor_done int default false;
        DECLARE cursor_rkserk_client_riskparam CURSOR FOR
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no_str, exch_group_no_str, exch_no_str, order_dir_str, 
            dime_id, trig_stage_type_str, compli_calc_level, unit_nav_flag, 
            trig_type, model_id, risk_item_id, compli_rules_remark, 
            risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
            risk_param_str, union_flag, risk_rule_value_str1, risk_rule_action1, 
            risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
            risk_rule_value_str4, risk_rule_action4, corrsp_plug, begin_time, 
            end_time, rule_flag, templ_flag, compli_trig_result_type 
            from db_rksecu.tb_rkserk_secu_client_risk_rule 
            where co_no = v_co_no and instr(trig_stage_type_str, v_trig_stage_type)>0  and rule_flag = 1 and  union_flag =2  and  (risk_rule_type <> 1 and risk_rule_type <> 9)  and (case when begin_time>end_time then (v_mach_time between begin_time and 240000 or v_mach_time between 0 and end_time)  when     end_time>begin_time then (v_mach_time between begin_time and end_time) else begin_time = end_time end);
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


        /* [打开游标][字段变量][cursor_rkserk_client_riskparam][loop_rkserk_client_riskparam] */
        open cursor_rkserk_client_riskparam;
        loop_rkserk_client_riskparam: LOOP
        fetch cursor_rkserk_client_riskparam into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_co_no, 
            v_pd_no_str, v_exch_group_no_str, v_exch_no_str, v_order_dir_str, 
            v_dime_id, v_trig_stage_type_str, v_compli_calc_level, v_unit_nav_flag, 
            v_trig_type, v_model_id, v_risk_item_id, v_compli_rules_remark, 
            v_risk_rule_id, v_risk_rule_type, v_risk_rule_name, v_risk_rule_code, 
            v_risk_param_str, v_union_flag, v_risk_rule_value_str1, v_risk_rule_action1, 
            v_risk_rule_value_str2, v_risk_rule_action2, v_risk_rule_value_str3, v_risk_rule_action3, 
            v_risk_rule_value_str4, v_risk_rule_action4, v_corrsp_plug, v_begin_time, 
            v_end_time, v_rule_flag, v_templ_flag, v_compli_trig_result_type;
            IF v_cursor_done THEN
                LEAVE loop_rkserk_client_riskparam;
            END IF;


            /* set @客户风险规则序号# =  @记录序号#; */
            set v_client_risk_rule_id =  v_row_id;
            #证券相关性判断

            /* 调用【原子_风控证券_维度_维度获取计算范围】*/
            call db_rksecu.pra_rksedm_GetCalcRangeByDimeId(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_dime_id,
                v_pd_no_str,
                v_exch_group_no_str,
                v_order_dir_str,
                v_trig_type,
                v_stock_code_no,
                v_order_batch_no,
                v_trig_stage_type,
                v_error_code,
                v_error_info,
                v_record_count,
                v_cash_asset_flag);
            if v_error_code = "1" then
                SET v_error_code = "rksecuA.4.61.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_维度_维度获取计算范围出现错误！',v_mysql_message);
                end if;
                close cursor_rkserk_client_riskparam;
                leave label_pro;
            elseif v_error_code <> "0" then
                close cursor_rkserk_client_riskparam;
                leave label_pro;
            end if;


            /* if  @记录个数# = 0  then */
            if  v_record_count = 0  then
                ITERATE  loop_rkserk_client_riskparam;
            end if;

            /* if  @产品编号串# <> -1 and @产品编号串# <> " " and (instr(concat(";",@产品编号串#),concat(";",@产品编号#,";")) <= 0) then */
            if  v_pd_no_str <> -1 and v_pd_no_str <> " " and (instr(concat(";",v_pd_no_str),concat(";",v_pd_no,";")) <= 0) then
                ITERATE  loop_rkserk_client_riskparam;
            end if;

            /* if  @交易组编号串# <> -1 and @交易组编号串# <> " " and (instr(concat(";",@交易组编号串#),concat(";",@交易组编号#,";")) <= 0) then */
            if  v_exch_group_no_str <> -1 and v_exch_group_no_str <> " " and (instr(concat(";",v_exch_group_no_str),concat(";",v_exch_group_no,";")) <= 0) then
                ITERATE  loop_rkserk_client_riskparam;
            end if;

            /* if @触发阶段类型# = 《触发阶段类型-交易端》 then */
            if v_trig_stage_type = 2 then

                /* [获取表记录变量语句][风控证券_风控_预订单信息表][group_concat(distinct({记录序号}) separator ';')][@记录序号串#][{订单批号} = @订单批号# and {机构编号} = @机构编号# and (instr(concat(";",@产品编号串#),concat(";",{产品编号},";")) > 0 or @产品编号串# = -1 or @产品编号串# = " ") and (instr(concat(";",@交易组编号串#),concat(";",{交易组编号},";"))>0 or @交易组编号串# = "-1" or @交易组编号串# = " ") and instr(concat(";",@订单方向串#),concat(";",{订单方向},";"))>0 and  {证券代码编号}  =  @证券代码编号#  ] */
                select group_concat(distinct(row_id) separator ';') into v_row_id_str from db_rksecu.tb_rkserk_preorder where order_batch_no = v_order_batch_no and co_no = v_co_no and (instr(concat(";",v_pd_no_str),concat(";",pd_no,";")) > 0 or v_pd_no_str = -1 or v_pd_no_str = " ") and (instr(concat(";",v_exch_group_no_str),concat(";",exch_group_no,";"))>0 or v_exch_group_no_str = "-1" or v_exch_group_no_str = " ") and instr(concat(";",v_order_dir_str),concat(";",order_dir,";"))>0 and  stock_code_no  =  v_stock_code_no   limit 1;


            /* elseif @触发阶段类型# = 《触发阶段类型-指令端》 then */
            elseif v_trig_stage_type = 1 then

                /* [获取表记录变量语句][风控证券_风控_预指令信息表][group_concat(distinct({记录序号}) separator ';')][@记录序号串#][{指令批号} = @订单批号# and {机构编号} = @机构编号# and (instr(concat(";",@产品编号串#),concat(";",{产品编号},";")) > 0 or @产品编号串# = -1 or @产品编号串# = " ") and (instr(concat(";",@交易组编号串#),concat(";",{交易组编号},";"))>0 or @交易组编号串# = "-1" or @交易组编号串# = " ") and instr(concat(";",@订单方向串#),concat(";",{指令方向},";"))>0 and  {证券代码编号}  =  @证券代码编号#  ] */
                select group_concat(distinct(row_id) separator ';') into v_row_id_str from db_rksecu.tb_rkserk_precommand where comm_batch_no = v_order_batch_no and co_no = v_co_no and (instr(concat(";",v_pd_no_str),concat(";",pd_no,";")) > 0 or v_pd_no_str = -1 or v_pd_no_str = " ") and (instr(concat(";",v_exch_group_no_str),concat(";",exch_group_no,";"))>0 or v_exch_group_no_str = "-1" or v_exch_group_no_str = " ") and instr(concat(";",v_order_dir_str),concat(";",comm_dir,";"))>0 and  stock_code_no  =  v_stock_code_no   limit 1;

            end if;

            /* if isnull(@记录序号串#) or length(@记录序号串#) = 0  then */
            if isnull(v_row_id_str) or length(v_row_id_str) = 0  then
                ITERATE  loop_rkserk_client_riskparam;
            end if;

            /* set @风控拼接值串# = @风险要素串#; */
            set v_risk_splice_str = v_risk_param_str;

            /* set @风控循环次数# = 0; */
            set v_risk_loop_count = 0;

            /* set @合规触发结果# = 0; */
            set v_compli_trig_result_type = 0;

            /* set @临时_风险规则代码# = @风险规则代码#; */
            set v_tmp_risk_rule_code = v_risk_rule_code;

            /* set @产品编号# = 0; */
            set v_pd_no = 0;

            /* 调用【原子_风控证券_风控_获取联合汇总计算风险要素值】*/
            call db_rksecu.pra_rkserk_GetSumCaclRiskParamValue(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_stock_code_no,
                v_stock_code,
                v_exch_no,
                v_trig_type,
                v_trig_stage_type,
                v_compli_calc_level,
                v_risk_param_str,
                v_row_id_str,
                v_risk_rule_code,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_union_flag,
                v_risk_rule_type,
                v_order_batch_no,
                v_pd_no_str,
                v_exch_group_no_str,
                v_order_dir_str,
                v_client_risk_rule_id,
                v_risk_rule_value_str1,
                v_cash_asset_flag,
                v_pd_no,
                v_error_code,
                v_error_info,
                v_risk_param_value,
                v_numer_value,
                v_is_relative,
                v_dino_value);
            if v_error_code = "1" then
                SET v_error_code = "rksecuA.4.61.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取联合汇总计算风险要素值出现错误！',v_mysql_message);
                end if;
                close cursor_rkserk_client_riskparam;
                leave label_pro;
            elseif v_error_code <> "0" then
                close cursor_rkserk_client_riskparam;
                leave label_pro;
            end if;


            /* if @相关性# = 《相关性-不相关》 then */
            if v_is_relative = 0 then
                ITERATE  loop_rkserk_client_riskparam;
            end if;

            /* set @临时_风险采取行为# = 0; */
            set v_tmp_risk_rule_action = 0;
            loop_rule_value:loop
              #循环4次判断是否满足预警条件

              /* set @风控循环次数# = @风控循环次数# + 1; */
              set v_risk_loop_count = v_risk_loop_count + 1;

              /* if @风控循环次数# = 1 then */
              if v_risk_loop_count = 1 then

                 /* set @风险规则值串# =  @风险规则值串1#; */
                 set v_risk_rule_value_str =  v_risk_rule_value_str1;

                 /* set @风险采取行为# =  @风险采取行为1#; */
                 set v_risk_rule_action =  v_risk_rule_action1;

              /* elseif @风控循环次数# = 2 then */
              elseif v_risk_loop_count = 2 then

                 /* set @风险规则值串# =  @风险规则值串2#; */
                 set v_risk_rule_value_str =  v_risk_rule_value_str2;

                 /* set @风险采取行为# =  @风险采取行为2#; */
                 set v_risk_rule_action =  v_risk_rule_action2;

              /* elseif @风控循环次数# = 3 then */
              elseif v_risk_loop_count = 3 then

                 /* set @风险规则值串# =  @风险规则值串3#; */
                 set v_risk_rule_value_str =  v_risk_rule_value_str3;

                 /* set @风险采取行为# =  @风险采取行为3#; */
                 set v_risk_rule_action =  v_risk_rule_action3;

              /* elseif @风控循环次数# = 4 then */
              elseif v_risk_loop_count = 4 then

                 /* set @风险规则值串# =  @风险规则值串4#; */
                 set v_risk_rule_value_str =  v_risk_rule_value_str4;

                 /* set @风险采取行为# =  @风险采取行为4#; */
                 set v_risk_rule_action =  v_risk_rule_action4;
              else
                 leave loop_rule_value;
              end if;

              /* if @风险采取行为# = " "  then */
              if v_risk_rule_action = " "  then
                ITERATE loop_rule_value;
              end if;

              /* if right(@风险规则值串#, 1) <> ";" and @风险规则值串# <> " " then */
              if right(v_risk_rule_value_str, 1) <> ";" and v_risk_rule_value_str <> " " then

                /* set @风险规则值串# = concat(@风险规则值串#, ";"); */
                set v_risk_rule_value_str = concat(v_risk_rule_value_str, ";");
              end if;

             /* set @风险规则代码# = replace(@风险规则代码#,"[n]",@风险规则值串#); */
             set v_risk_rule_code = replace(v_risk_rule_code,"[n]",v_risk_rule_value_str);

             /* set @风险规则代码# = replace(@风险规则代码#,";",""); */
             set v_risk_rule_code = replace(v_risk_rule_code,";","");
                #如果风险规则代码替换完成，则检查代码中是否还有宏，如果没有宏，则执行，否则报错

              /* if instr(@风险规则代码#, "[") > 0 or instr(@风险规则代码#, "]") > 0 then */
              if instr(v_risk_rule_code, "[") > 0 or instr(v_risk_rule_code, "]") > 0 then

                 /* [报错不回滚][905][@风险规则代码#] */
                     SET v_error_code = "rksecuA.4.61.905";
                     SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
                     close cursor_rkserk_client_riskparam;
                     leave label_pro;

              else
                set @v_result_value = 0;
                #执行风险规则代码，如果为1，则报错返回，风险限制

                /* [执行语句返回值][@风险规则代码#][@返回值#] */
                set @tmp_sql = concat("select ", v_risk_rule_code, " into @v_result_value");
                PREPARE stmt from @tmp_sql;
                EXECUTE stmt;
                set @tmp_sql = '';
                DEALLOCATE PREPARE stmt;

                if @v_result_value = 1 then

                  /* set @合规触发结果# = 1; */
                  set v_compli_trig_result_type = 1;

                  /* if @风险采取行为# > @临时_风险采取行为#  then */
                  if v_risk_rule_action > v_tmp_risk_rule_action  then

                     /* set @临时_风险采取行为# = @风险采取行为#; */
                     set v_tmp_risk_rule_action = v_risk_rule_action;
                  end if;
                end if;
              end if;
            end loop loop_rule_value;
            #将触发结果计入流水表

            /* if @合规触发结果# = 1 then */
            if v_compli_trig_result_type = 1 then

              /* set @客户风险规则序号# = @记录序号#; */
              set v_client_risk_rule_id = v_row_id;

              /* set @风险采取行为# = @临时_风险采取行为#; */
              set v_risk_rule_action = v_tmp_risk_rule_action;

              /* set @备注信息# = concat( "交易触警!",@风险要素值串#,@临时_风险规则代码#,";",@风险规则代码#); */
              set v_remark_info = concat( "交易触警!",v_risk_param_value_str,v_tmp_risk_rule_code,";",v_risk_rule_code);

              /* set @产品编号# = 0; */
              set v_pd_no = 0;

              /* set @交易组编号# = 0; */
              set v_exch_group_no = 0;

              /* set @订单方向# = 0; */
              set v_order_dir = 0;

              /* set @风险计算值串# = " "; */
              set v_risk_rule_calc_str = " ";

              /* [插入表记录][风控证券_风控_客户风险触警流水表][字段][字段变量][1][@客户风险规则序号#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_rksecu.tbjour_rkserk_secu_client_risk_trig(
                  create_date, create_time, update_date, 
                  update_time, update_times, client_risk_rule_id, risk_item_id, 
                  compli_trig_id, co_no, pd_no, exch_group_no, 
                  order_dir, dime_id, stock_code_no, trig_stage_type, 
                  compli_calc_level, unit_nav_flag, trig_type, compli_rules_remark, 
                  risk_rule_action, risk_rule_type, risk_rule_value_str, risk_rule_calc_str, 
                  remark_info, opor_no, pd_no_str) 
              value( 
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_client_risk_rule_id, v_risk_item_id, 
                  v_compli_trig_id, v_co_no, v_pd_no, v_exch_group_no, 
                  v_order_dir, v_dime_id, v_stock_code_no, v_trig_stage_type, 
                  v_compli_calc_level, v_unit_nav_flag, v_trig_type, v_compli_rules_remark, 
                  v_risk_rule_action, v_risk_rule_type, v_risk_rule_value_str, v_risk_rule_calc_str, 
                  v_remark_info, v_opor_no, v_pd_no_str);
              if v_error_code = "1" then
                          
                  SET v_error_code = "rksecuA.4.61.1";
                  SET v_error_info =  CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
                  close cursor_rkserk_client_riskparam;
                  leave label_pro;
              end if;


              /* [检查正常返回][@风险采取行为# = 4] */
              if v_risk_rule_action = 4 then
                  close cursor_rkserk_client_riskparam;
                  leave label_pro;
              end if;

            end if;

        /* [关闭游标][cursor_rkserk_client_riskparam] */
            IF v_cursor_done THEN
                set v_cursor_done = false;
            END IF;
        END LOOP;
        close cursor_rkserk_client_riskparam;
        end cursor_rkserk_client_riskparam;


        /* set @临时_证券代码编号串#=substring(@临时_证券代码编号串#,LOCATE(@分隔符#,@临时_证券代码编号串#)+1); */
        set v_tmp_stock_code_no_str=substring(v_tmp_stock_code_no_str,LOCATE(v_split_str,v_tmp_stock_code_no_str)+1);
    end while;
    #2-处理产品级的单独控制，需要把交易组的数据进行汇总出来

    /* set @临时_证券代码编号串# =@目标证券代码编号串# ; */
    set v_tmp_stock_code_no_str =v_target_stock_code_no_str ;

    /* while LOCATE(@分隔符#,@临时_证券代码编号串#)<>0   do */
    while LOCATE(v_split_str,v_tmp_stock_code_no_str)<>0   do

        /* set @证券代码编号#=cast(substring(@临时_证券代码编号串#,1,LOCATE(@分隔符#,@临时_证券代码编号串#)-1) as SIGNED); */
        set v_stock_code_no=cast(substring(v_tmp_stock_code_no_str,1,LOCATE(v_split_str,v_tmp_stock_code_no_str)-1) as SIGNED);

        /* [获取表记录变量语句][风控证券_计算_证券信息表][{证券代码},{市场编号}][@证券代码#,@市场编号#][{证券代码编号}=@证券代码编号#] */
        select stock_code,exch_no into v_stock_code,v_exch_no from db_rksecu.tb_rksecc_secu_stock_info where stock_code_no=v_stock_code_no limit 1;


        /* set @风险要素值串# = concat(";","证券代码=", @证券代码#, ";"); */
        set v_risk_param_value_str = concat(";","证券代码=", v_stock_code, ";");

        /* [声明游标][风控证券_风控_客户风险规则表][字段][{机构编号} = @机构编号# and instr({触发阶段类型串}, @触发阶段类型#)>0  and {启用标志} = 《启用标志-启用》 and  {联合标志} =《联合标志-单独控制》 and  {合规计算层级} = 《合规计算层级-产品级》 and  ({风险规则类别} <> 《风险规则类别-黑白名单合规》 and {风险规则类别} <> 《风险规则类别-交易价格合规》)  and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when     {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end)][cursor_rkserk_client_riskparam] */
        cursor_rkserk_client_riskparam:BEGIN
        DECLARE v_cursor_done int default false;
        DECLARE cursor_rkserk_client_riskparam CURSOR FOR
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no_str, exch_group_no_str, exch_no_str, order_dir_str, 
            dime_id, trig_stage_type_str, compli_calc_level, unit_nav_flag, 
            trig_type, model_id, risk_item_id, compli_rules_remark, 
            risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
            risk_param_str, union_flag, risk_rule_value_str1, risk_rule_action1, 
            risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
            risk_rule_value_str4, risk_rule_action4, corrsp_plug, begin_time, 
            end_time, rule_flag, templ_flag, compli_trig_result_type 
            from db_rksecu.tb_rkserk_secu_client_risk_rule 
            where co_no = v_co_no and instr(trig_stage_type_str, v_trig_stage_type)>0  and rule_flag = 1 and  union_flag =1 and  compli_calc_level = 2 and  (risk_rule_type <> 1 and risk_rule_type <> 9)  and (case when begin_time>end_time then (v_mach_time between begin_time and 240000 or v_mach_time between 0 and end_time)  when     end_time>begin_time then (v_mach_time between begin_time and end_time) else begin_time = end_time end);
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


        /* [打开游标][字段变量][cursor_rkserk_client_riskparam][loop_rkserk_client_riskparam] */
        open cursor_rkserk_client_riskparam;
        loop_rkserk_client_riskparam: LOOP
        fetch cursor_rkserk_client_riskparam into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_co_no, 
            v_pd_no_str, v_exch_group_no_str, v_exch_no_str, v_order_dir_str, 
            v_dime_id, v_trig_stage_type_str, v_compli_calc_level, v_unit_nav_flag, 
            v_trig_type, v_model_id, v_risk_item_id, v_compli_rules_remark, 
            v_risk_rule_id, v_risk_rule_type, v_risk_rule_name, v_risk_rule_code, 
            v_risk_param_str, v_union_flag, v_risk_rule_value_str1, v_risk_rule_action1, 
            v_risk_rule_value_str2, v_risk_rule_action2, v_risk_rule_value_str3, v_risk_rule_action3, 
            v_risk_rule_value_str4, v_risk_rule_action4, v_corrsp_plug, v_begin_time, 
            v_end_time, v_rule_flag, v_templ_flag, v_compli_trig_result_type;
            IF v_cursor_done THEN
                LEAVE loop_rkserk_client_riskparam;
            END IF;


            /* set @客户风险规则序号# =  @记录序号#; */
            set v_client_risk_rule_id =  v_row_id;

            /* set @查询记录序号# = 0; */
            set v_query_row_id = 0;

            /* if  @产品编号串# <> -1 and @产品编号串# <> " " and (instr(concat(";",@产品编号串#),concat(";",@临时_产品编号#,";")) <= 0) then */
            if  v_pd_no_str <> -1 and v_pd_no_str <> " " and (instr(concat(";",v_pd_no_str),concat(";",v_tmp_pd_no,";")) <= 0) then
                ITERATE  loop_rkserk_client_riskparam;
            end if;

            /* if @产品编号串# = -1 then */
            if v_pd_no_str = -1 then

                /* if @触发阶段类型# = 《触发阶段类型-交易端》 then */
                if v_trig_stage_type = 2 then

                    /* [获取表记录变量语句][风控证券_风控_预订单信息表][group_concat(distinct({产品编号}) separator ';')][@产品编号串#][{订单批号} = @订单批号# and {机构编号} = @机构编号#] */
                    select group_concat(distinct(pd_no) separator ';') into v_pd_no_str from db_rksecu.tb_rkserk_preorder where order_batch_no = v_order_batch_no and co_no = v_co_no limit 1;


                /* elseif @触发阶段类型# = 《触发阶段类型-指令端》 then */
                elseif v_trig_stage_type = 1 then

                    /* [获取表记录变量语句][风控证券_风控_预指令信息表][group_concat(distinct({产品编号}) separator ';')][@产品编号串#][{指令批号} = @订单批号# and {机构编号} = @机构编号#] */
                    select group_concat(distinct(pd_no) separator ';') into v_pd_no_str from db_rksecu.tb_rkserk_precommand where comm_batch_no = v_order_batch_no and co_no = v_co_no limit 1;

                end if;
            else

                /* set @产品编号串# = concat(@临时_产品编号#,";"); */
                set v_pd_no_str = concat(v_tmp_pd_no,";");
            end if;
            #遍历产品
            loop_product:loop

                /* set @查询记录序号# = @查询记录序号#+1; */
                set v_query_row_id = v_query_row_id+1;

                /* set @产品编号#=SUBSTRING_INDEX(SUBSTRING_INDEX(@产品编号串#,';',@查询记录序号#),';',-1); */
                set v_pd_no=SUBSTRING_INDEX(SUBSTRING_INDEX(v_pd_no_str,';',v_query_row_id),';',-1);

                /* if  @产品编号# <= 0  then */
                if  v_pd_no <= 0  then
                     leave loop_product;
                end if;
            #证券相关性判断

            /* 调用【原子_风控证券_维度_维度获取计算范围】*/
            call db_rksecu.pra_rksedm_GetCalcRangeByDimeId(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_dime_id,
                v_pd_no_str,
                v_exch_group_no_str,
                v_order_dir_str,
                v_trig_type,
                v_stock_code_no,
                v_order_batch_no,
                v_trig_stage_type,
                v_error_code,
                v_error_info,
                v_record_count,
                v_cash_asset_flag);
            if v_error_code = "1" then
                SET v_error_code = "rksecuA.4.61.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_维度_维度获取计算范围出现错误！',v_mysql_message);
                end if;
                close cursor_rkserk_client_riskparam;
                leave label_pro;
            elseif v_error_code <> "0" then
                close cursor_rkserk_client_riskparam;
                leave label_pro;
            end if;


            /* if  @记录个数# = 0  then */
            if  v_record_count = 0  then
                ITERATE loop_product;
            end if;

            /* if @触发阶段类型# = 《触发阶段类型-交易端》 then */
            if v_trig_stage_type = 2 then

                /* [获取表记录变量语句][风控证券_风控_预订单信息表][group_concat(distinct({记录序号}) separator ';')][@记录序号串#][{订单批号} = @订单批号# and {机构编号} = @机构编号# and {产品编号} =@产品编号#   and instr(concat(";",@订单方向串#),concat(";",{订单方向},";"))>0 and  {证券代码编号}  =  @证券代码编号#  ] */
                select group_concat(distinct(row_id) separator ';') into v_row_id_str from db_rksecu.tb_rkserk_preorder where order_batch_no = v_order_batch_no and co_no = v_co_no and pd_no =v_pd_no   and instr(concat(";",v_order_dir_str),concat(";",order_dir,";"))>0 and  stock_code_no  =  v_stock_code_no   limit 1;


            /* elseif @触发阶段类型# = 《触发阶段类型-指令端》 then */
            elseif v_trig_stage_type = 1 then

                /* [获取表记录变量语句][风控证券_风控_预指令信息表][group_concat(distinct({记录序号}) separator ';')][@记录序号串#][{指令批号} = @订单批号# and {机构编号} = @机构编号# and  {产品编号} =@产品编号#  and instr(concat(";",@订单方向串#),concat(";",{指令方向},";"))>0 and  {证券代码编号}  =  @证券代码编号#  ] */
                select group_concat(distinct(row_id) separator ';') into v_row_id_str from db_rksecu.tb_rkserk_precommand where comm_batch_no = v_order_batch_no and co_no = v_co_no and  pd_no =v_pd_no  and instr(concat(";",v_order_dir_str),concat(";",comm_dir,";"))>0 and  stock_code_no  =  v_stock_code_no   limit 1;

            end if;

            /* if isnull(@记录序号串#) or length(@记录序号串#) = 0  then */
            if isnull(v_row_id_str) or length(v_row_id_str) = 0  then
                ITERATE loop_product;
            end if;

            /* set @风控拼接值串# = @风险要素串#; */
            set v_risk_splice_str = v_risk_param_str;

            /* set @风控循环次数# = 0; */
            set v_risk_loop_count = 0;

            /* set @合规触发结果# = 0; */
            set v_compli_trig_result_type = 0;

            /* set @临时_风险规则代码# = @风险规则代码#; */
            set v_tmp_risk_rule_code = v_risk_rule_code;

            /* 调用【原子_风控证券_风控_获取联合汇总计算风险要素值】*/
            call db_rksecu.pra_rkserk_GetSumCaclRiskParamValue(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_stock_code_no,
                v_stock_code,
                v_exch_no,
                v_trig_type,
                v_trig_stage_type,
                v_compli_calc_level,
                v_risk_param_str,
                v_row_id_str,
                v_risk_rule_code,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_union_flag,
                v_risk_rule_type,
                v_order_batch_no,
                v_pd_no_str,
                v_exch_group_no_str,
                v_order_dir_str,
                v_client_risk_rule_id,
                v_risk_rule_value_str1,
                v_cash_asset_flag,
                v_pd_no,
                v_error_code,
                v_error_info,
                v_risk_param_value,
                v_numer_value,
                v_is_relative,
                v_dino_value);
            if v_error_code = "1" then
                SET v_error_code = "rksecuA.4.61.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_风控_获取联合汇总计算风险要素值出现错误！',v_mysql_message);
                end if;
                close cursor_rkserk_client_riskparam;
                leave label_pro;
            elseif v_error_code <> "0" then
                close cursor_rkserk_client_riskparam;
                leave label_pro;
            end if;


            /* if @相关性# = 《相关性-不相关》 then */
            if v_is_relative = 0 then
                ITERATE loop_product;
            end if;

            /* set @临时_风险采取行为# = 0; */
            set v_tmp_risk_rule_action = 0;
            loop_rule_value:loop
              #循环4次判断是否满足预警条件

              /* set @风控循环次数# = @风控循环次数# + 1; */
              set v_risk_loop_count = v_risk_loop_count + 1;

              /* if @风控循环次数# = 1 then */
              if v_risk_loop_count = 1 then

                 /* set @风险规则值串# =  @风险规则值串1#; */
                 set v_risk_rule_value_str =  v_risk_rule_value_str1;

                 /* set @风险采取行为# =  @风险采取行为1#; */
                 set v_risk_rule_action =  v_risk_rule_action1;

              /* elseif @风控循环次数# = 2 then */
              elseif v_risk_loop_count = 2 then

                 /* set @风险规则值串# =  @风险规则值串2#; */
                 set v_risk_rule_value_str =  v_risk_rule_value_str2;

                 /* set @风险采取行为# =  @风险采取行为2#; */
                 set v_risk_rule_action =  v_risk_rule_action2;

              /* elseif @风控循环次数# = 3 then */
              elseif v_risk_loop_count = 3 then

                 /* set @风险规则值串# =  @风险规则值串3#; */
                 set v_risk_rule_value_str =  v_risk_rule_value_str3;

                 /* set @风险采取行为# =  @风险采取行为3#; */
                 set v_risk_rule_action =  v_risk_rule_action3;

              /* elseif @风控循环次数# = 4 then */
              elseif v_risk_loop_count = 4 then

                 /* set @风险规则值串# =  @风险规则值串4#; */
                 set v_risk_rule_value_str =  v_risk_rule_value_str4;

                 /* set @风险采取行为# =  @风险采取行为4#; */
                 set v_risk_rule_action =  v_risk_rule_action4;
              else
                 leave loop_rule_value;
              end if;

              /* if @风险采取行为# = " "  then */
              if v_risk_rule_action = " "  then
                ITERATE loop_rule_value;
              end if;

              /* if right(@风险规则值串#, 1) <> ";" and @风险规则值串# <> " " then */
              if right(v_risk_rule_value_str, 1) <> ";" and v_risk_rule_value_str <> " " then

                /* set @风险规则值串# = concat(@风险规则值串#, ";"); */
                set v_risk_rule_value_str = concat(v_risk_rule_value_str, ";");
              end if;

             /* set @风险规则代码# = replace(@风险规则代码#,"[n]",@风险规则值串#); */
             set v_risk_rule_code = replace(v_risk_rule_code,"[n]",v_risk_rule_value_str);

             /* set @风险规则代码# = replace(@风险规则代码#,";",""); */
             set v_risk_rule_code = replace(v_risk_rule_code,";","");
                #如果风险规则代码替换完成，则检查代码中是否还有宏，如果没有宏，则执行，否则报错

              /* if instr(@风险规则代码#, "[") > 0 or instr(@风险规则代码#, "]") > 0 then */
              if instr(v_risk_rule_code, "[") > 0 or instr(v_risk_rule_code, "]") > 0 then

                 /* [报错不回滚][905][@风险规则代码#] */
                     SET v_error_code = "rksecuA.4.61.905";
                     SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
                     close cursor_rkserk_client_riskparam;
                     leave label_pro;

              else
                set @v_result_value = 0;
                #执行风险规则代码，如果为1，则报错返回，风险限制

                /* [执行语句返回值][@风险规则代码#][@返回值#] */
                set @tmp_sql = concat("select ", v_risk_rule_code, " into @v_result_value");
                PREPARE stmt from @tmp_sql;
                EXECUTE stmt;
                set @tmp_sql = '';
                DEALLOCATE PREPARE stmt;

                if @v_result_value = 1 then

                  /* set @合规触发结果# = 1; */
                  set v_compli_trig_result_type = 1;

                  /* if @风险采取行为# > @临时_风险采取行为#  then */
                  if v_risk_rule_action > v_tmp_risk_rule_action  then

                     /* set @临时_风险采取行为# = @风险采取行为#; */
                     set v_tmp_risk_rule_action = v_risk_rule_action;
                  end if;
                end if;
              end if;
            end loop loop_rule_value;
            #将触发结果计入流水表

            /* if @合规触发结果# = 1 then */
            if v_compli_trig_result_type = 1 then

              /* set @客户风险规则序号# = @记录序号#; */
              set v_client_risk_rule_id = v_row_id;

              /* set @风险采取行为# = @临时_风险采取行为#; */
              set v_risk_rule_action = v_tmp_risk_rule_action;

              /* set @备注信息# = concat( "交易触警!",@风险要素值串#,@临时_风险规则代码#,";",@风险规则代码#); */
              set v_remark_info = concat( "交易触警!",v_risk_param_value_str,v_tmp_risk_rule_code,";",v_risk_rule_code);

              /* set @产品编号# = 0; */
              set v_pd_no = 0;

              /* set @交易组编号# = 0; */
              set v_exch_group_no = 0;

              /* set @订单方向# = 0; */
              set v_order_dir = 0;

              /* set @风险计算值串# = " "; */
              set v_risk_rule_calc_str = " ";

              /* [插入表记录][风控证券_风控_客户风险触警流水表][字段][字段变量][1][@客户风险规则序号#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_rksecu.tbjour_rkserk_secu_client_risk_trig(
                  create_date, create_time, update_date, 
                  update_time, update_times, client_risk_rule_id, risk_item_id, 
                  compli_trig_id, co_no, pd_no, exch_group_no, 
                  order_dir, dime_id, stock_code_no, trig_stage_type, 
                  compli_calc_level, unit_nav_flag, trig_type, compli_rules_remark, 
                  risk_rule_action, risk_rule_type, risk_rule_value_str, risk_rule_calc_str, 
                  remark_info, opor_no, pd_no_str) 
              value( 
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_client_risk_rule_id, v_risk_item_id, 
                  v_compli_trig_id, v_co_no, v_pd_no, v_exch_group_no, 
                  v_order_dir, v_dime_id, v_stock_code_no, v_trig_stage_type, 
                  v_compli_calc_level, v_unit_nav_flag, v_trig_type, v_compli_rules_remark, 
                  v_risk_rule_action, v_risk_rule_type, v_risk_rule_value_str, v_risk_rule_calc_str, 
                  v_remark_info, v_opor_no, v_pd_no_str);
              if v_error_code = "1" then
                          
                  SET v_error_code = "rksecuA.4.61.1";
                  SET v_error_info =  CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
                  close cursor_rkserk_client_riskparam;
                  leave label_pro;
              end if;


              /* [检查正常返回][@风险采取行为# = 4] */
              if v_risk_rule_action = 4 then
                  close cursor_rkserk_client_riskparam;
                  leave label_pro;
              end if;

            end if;
            end loop loop_product;

        /* [关闭游标][cursor_rkserk_client_riskparam] */
            IF v_cursor_done THEN
                set v_cursor_done = false;
            END IF;
        END LOOP;
        close cursor_rkserk_client_riskparam;
        end cursor_rkserk_client_riskparam;


        /* set @临时_证券代码编号串#=substring(@临时_证券代码编号串#,LOCATE(@分隔符#,@临时_证券代码编号串#)+1); */
        set v_tmp_stock_code_no_str=substring(v_tmp_stock_code_no_str,LOCATE(v_split_str,v_tmp_stock_code_no_str)+1);
    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_compli_rules_remark = v_compli_rules_remark;
    SET p_risk_rule_action = v_risk_rule_action;
    SET p_risk_param_value = v_risk_param_value;
    SET p_risk_rule_value_str = v_risk_rule_value_str;
    SET p_trig_type = v_trig_type;
    SET p_numer_value = v_numer_value;
    SET p_dino_value = v_dino_value;
    SET p_risk_rule_type = v_risk_rule_type;
    SET p_client_risk_rule_id = v_client_risk_rule_id;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_新增预订单信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tb_rkserk_Addpreorder;;
DELIMITER ;;
CREATE PROCEDURE pra_tb_rkserk_Addpreorder(
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][风控证券_风控_预订单信息表][字段][字段变量][1][@订单批号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rkserk_preorder(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, exch_crncy_type, 
        stock_code_no, stock_code, order_dir, order_price, 
        order_qty, all_fee, order_batch_no) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_no, v_exch_crncy_type, 
        v_stock_code_no, v_stock_code, v_order_dir, v_order_price, 
        v_order_qty, v_all_fee, v_order_batch_no);
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.62.1";
        SET v_error_info =  CONCAT(concat("订单批号=",v_order_batch_no),"#",v_mysql_message);
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

# 原子_风控证券_风控_删除预订单信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tb_rkserk_Delpreorder;;
DELIMITER ;;
CREATE PROCEDURE pra_tb_rkserk_Delpreorder(
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
    

    /* [删除表记录][风控证券_风控_预订单信息表][{订单批号}=@订单批号#][3][@订单批号#] */
    delete from db_rksecu.tb_rkserk_preorder 
        where order_batch_no=v_order_batch_no;
    if v_error_code = 1 then
                
        SET v_error_code = "rksecuA.4.63.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单批号=",v_order_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单批号=",v_order_batch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_风控_新增预指令信息表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkserk_Addprecommand;;
DELIMITER ;;
CREATE PROCEDURE pra_rkserk_Addprecommand(
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][风控证券_风控_预指令信息表][字段][字段变量][1][@指令批号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rkserk_precommand(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, exch_crncy_type, 
        stock_code_no, stock_code, comm_dir, limit_actual_price, 
        comm_qty, all_fee, comm_batch_no) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_no, v_exch_crncy_type, 
        v_stock_code_no, v_stock_code, v_comm_dir, v_limit_actual_price, 
        v_comm_qty, v_all_fee, v_comm_batch_no);
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.4.65.1";
        SET v_error_info =  CONCAT(concat("指令批号=",v_comm_batch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


