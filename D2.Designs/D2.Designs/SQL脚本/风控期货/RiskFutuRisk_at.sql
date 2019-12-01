DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_风控_增加客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfurk_AddFutuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfurk_AddFutuClientRiskRule(
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
    declare v_record_count int;
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
    SET v_record_count = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录数量][风控期货_风控_客户风险规则表][@记录个数#][{机构编号} = @机构编号#  and {风险条目序号} = @风险条目序号# and {产品编号} = @产品编号# and {交易组编号} = @交易组编号# and {模板序号} = @模板序号#] */
    select count(1) into v_record_count from db_rkfutu.tb_rkfurk_client_risk_rule where co_no = v_co_no  and risk_item_id = v_risk_item_id and pd_no = v_pd_no and exch_group_no = v_exch_group_no and model_id = v_model_id;


    /* [检查报错返回][@记录个数# > 0 ][907][@风险条目序号#] */
    if v_record_count > 0  then
        
        SET v_error_code = "rkfutuA.3.1.907";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("风险条目序号=",v_risk_item_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("风险条目序号=",v_risk_item_id);
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

    /* set @更新次数# = @更新次数#; */
    set v_update_times = v_update_times;

    /* set @风险计算值串# = " "; */
    set v_risk_rule_calc_str = " ";

    /* if @模板序号# = 0 then */
    if v_model_id = 0 then
        #将记录序号和其他唯一索引字段都加在条件中，以防记录序号和相关数据不匹配

        /* [获取表记录变量][风控期货_公用_风险条目表][字段][字段变量][{机构编号}＝@机构编号# and {记录序号}=@风险条目序号#][4][@风险条目序号#] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            risk_item_name, exch_no, contrc_type, order_dir_str, 
            trig_stage_type, compli_calc_level, unit_nav_flag, trig_type, 
            risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
            risk_param_str, risk_rule_value_str, corrsp_plug, risk_rule_action, 
            begin_time, end_time, rule_flag into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_co_no, 
            v_risk_item_name, v_exch_no, v_contrc_type, v_order_dir_str, 
            v_trig_stage_type, v_compli_calc_level, v_unit_nav_flag, v_trig_type, 
            v_risk_rule_id, v_risk_rule_type, v_risk_rule_name, v_risk_rule_code, 
            v_risk_param_str, v_risk_rule_value_str, v_corrsp_plug, v_risk_rule_action, 
            v_begin_time, v_end_time, v_rule_flag from db_rkfutu.tb_rkfupb_risk_item where co_no=v_co_no and row_id=v_risk_item_id limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "rkfutuA.3.1.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("风险条目序号=",v_risk_item_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("风险条目序号=",v_risk_item_id);
            end if;
            leave label_pro;
        end if;


        /* set @风险条目序号# = @记录序号#; */
        set v_risk_item_id = v_row_id;

        /* set @模板名称# = " "; */
        set v_model_name = " ";
        #[检查报错返回][@启用标志# = 《启用标志-不启用》][3]["所选择的风险条目未启用！请先启用风险条目再添加！"]

        /* [插入表记录][风控期货_风控_客户风险规则表][字段][字段变量][5][@风险条目序号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_rkfutu.tb_rkfurk_client_risk_rule(
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, asset_acco_no, model_id, model_name, 
            risk_item_id, risk_item_name, exch_no, contrc_type, 
            order_dir_str, trig_stage_type, compli_calc_level, unit_nav_flag, 
            trig_type, risk_rule_id, risk_rule_type, risk_rule_name, 
            risk_rule_code, risk_param_str, risk_rule_value_str, risk_rule_calc_str, 
            corrsp_plug, risk_rule_action, begin_time, end_time, 
            rule_flag) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_asset_acco_no, v_model_id, v_model_name, 
            v_risk_item_id, v_risk_item_name, v_exch_no, v_contrc_type, 
            v_order_dir_str, v_trig_stage_type, v_compli_calc_level, v_unit_nav_flag, 
            v_trig_type, v_risk_rule_id, v_risk_rule_type, v_risk_rule_name, 
            v_risk_rule_code, v_risk_param_str, v_risk_rule_value_str, v_risk_rule_calc_str, 
            v_corrsp_plug, v_risk_rule_action, v_begin_time, v_end_time, 
            v_rule_flag);
        if v_error_code = "1" then
                    
            SET v_error_code = "rkfutuA.3.1.5";
            SET v_error_info =  CONCAT(concat("风险条目序号=",v_risk_item_id),"#",v_mysql_message);
            leave label_pro;
        end if;

    else

       /* insert into ~风控期货_风控_客户风险规则表^ ({创建时间},{创建日期},{更新日期},{更新时间},{更新次数},{机构编号},{产品编号},{交易组编号},{资产账户编号},{模板序号},{模板名称},{风险条目序号},{风险条目名称},{市场编号},{合约类型},{订单方向串},{触发阶段类型},{合规计算层级},{单位净值标志},{触发方向},{风险规则序号},{风险规则类别},{风险规则名称},{风险规则代码},{风险规则值串},{风险要素串},{对应插件},{风险采取行为},{开始时间},{结束时间},{启用标志}) select @创建时间#,@创建日期#,@更新日期#,@更新时间#,@更新次数#,@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#,@模板序号#,c.{模板名称},b.{记录序号},b.{风险条目名称},b.{市场编号},b.{合约类型},b.{订单方向串},b.{触发阶段类型},b.{合规计算层级},b.{单位净值标志},b.{触发方向},b.{风险规则序号},b.{风险规则类别},b.{风险规则名称},b.{风险规则代码},b.{风险规则值串},b.{风险要素串},b.{对应插件},b.{风险采取行为},b.{开始时间},b.{结束时间},b.{启用标志} from  ~风控期货_公用_风险模板条目表^ a,~风控期货_公用_风险条目表^ b,  ~风控期货_公用_风险模板表^ c where a.{机构编号}=@机构编号# and a.{模板序号}= @模板序号# and a.{风险条目序号} = b.{记录序号} and a.{模板序号} = c.{记录序号};
 */
       insert into db_rkfutu.tb_rkfurk_client_risk_rule (create_time,create_date,update_date,update_time,update_times,co_no,pd_no,exch_group_no,asset_acco_no,model_id,model_name,risk_item_id,risk_item_name,exch_no,contrc_type,order_dir_str,trig_stage_type,compli_calc_level,unit_nav_flag,trig_type,risk_rule_id,risk_rule_type,risk_rule_name,risk_rule_code,risk_rule_value_str,risk_param_str,corrsp_plug,risk_rule_action,begin_time,end_time,rule_flag) select v_create_time,v_create_date,v_update_date,v_update_time,v_update_times,v_co_no,v_pd_no,v_exch_group_no,v_asset_acco_no,v_model_id,c.model_name,b.row_id,b.risk_item_name,b.exch_no,b.contrc_type,b.order_dir_str,b.trig_stage_type,b.compli_calc_level,b.unit_nav_flag,b.trig_type,b.risk_rule_id,b.risk_rule_type,b.risk_rule_name,b.risk_rule_code,b.risk_rule_value_str,b.risk_param_str,b.corrsp_plug,b.risk_rule_action,b.begin_time,b.end_time,b.rule_flag from  db_rkfutu.tb_rkfupb_futu_risk_model_item a,db_rkfutu.tb_rkfupb_risk_item b,  db_rkfutu.tb_rkfupb_risk_model c where a.co_no=v_co_no and a.model_id= v_model_id and a.risk_item_id = b.row_id and a.model_id = c.row_id;
       
    end if;

    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;


    /* [获取表记录变量语句][风控期货_风控_客户风险规则表][字段][字段变量][{记录序号} = @记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, model_id, 
        model_name, risk_item_id, risk_item_name, exch_no, 
        contrc_type, order_dir_str, trig_stage_type, compli_calc_level, 
        unit_nav_flag, trig_type, risk_rule_id, risk_rule_type, 
        risk_rule_name, risk_rule_code, risk_param_str, risk_rule_value_str, 
        risk_rule_calc_str, corrsp_plug, risk_rule_action, begin_time, 
        end_time, rule_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_model_id, 
        v_model_name, v_risk_item_id, v_risk_item_name, v_exch_no, 
        v_contrc_type, v_order_dir_str, v_trig_stage_type, v_compli_calc_level, 
        v_unit_nav_flag, v_trig_type, v_risk_rule_id, v_risk_rule_type, 
        v_risk_rule_name, v_risk_rule_code, v_risk_param_str, v_risk_rule_value_str, 
        v_risk_rule_calc_str, v_corrsp_plug, v_risk_rule_action, v_begin_time, 
        v_end_time, v_rule_flag from db_rkfutu.tb_rkfurk_client_risk_rule where row_id = v_row_id limit 1;

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

# 原子_风控期货_风控_删除客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfurk_DeleteFutuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfurk_DeleteFutuClientRiskRule(
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
    
    #删除时，要么删除一个模板下的所有条目，要么删除非模板的条目，不允许单独删除模板下的部分条目

    /* if @模板序号# = 0  then */
    if v_model_id = 0  then

        /* [删除表记录][风控期货_风控_客户风险规则表][{机构编号}=@机构编号# and {模板序号} =0 and (@产品编号#=" " or {产品编号}=@产品编号#) and (@交易组编号#=" " or {交易组编号}=@交易组编号#) and (@资产账户编号#=" " or {资产账户编号}=@资产账户编号#) and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",{风险条目序号},";")) > 0)][3][@风险条目序号串#] */
        delete from db_rkfutu.tb_rkfurk_client_risk_rule 
            where co_no=v_co_no and model_id =0 and (v_pd_no=" " or pd_no=v_pd_no) and (v_exch_group_no=" " or exch_group_no=v_exch_group_no) and (v_asset_acco_no=" " or asset_acco_no=v_asset_acco_no) and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",risk_item_id,";")) > 0);
        if v_error_code = 1 then
                    
            SET v_error_code = "rkfutuA.3.2.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("风险条目序号串=",v_risk_item_id_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("风险条目序号串=",v_risk_item_id_str);
            end if;
            leave label_pro;
        end if;

    else

        /* [删除表记录][风控期货_风控_客户风险规则表][{机构编号}=@机构编号# and (@产品编号#=" " or {产品编号}=@产品编号#) and (@交易组编号#=" " or {交易组编号}=@交易组编号#) and (@资产账户编号#=" " or {资产账户编号}=@资产账户编号#) and {模板序号} =@模板序号# ][3][@风险条目序号串#] */
        delete from db_rkfutu.tb_rkfurk_client_risk_rule 
            where co_no=v_co_no and (v_pd_no=" " or pd_no=v_pd_no) and (v_exch_group_no=" " or exch_group_no=v_exch_group_no) and (v_asset_acco_no=" " or asset_acco_no=v_asset_acco_no) and model_id =v_model_id ;
        if v_error_code = 1 then
                    
            SET v_error_code = "rkfutuA.3.2.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("风险条目序号串=",v_risk_item_id_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("风险条目序号串=",v_risk_item_id_str);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_风控_查询客户风险规则记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfurk_QueryFutuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfurk_QueryFutuClientRiskRule(
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
    

    /* [获取表记录][风控期货_风控_客户风险规则表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@模板序号#=0 or {模板序号}=@模板序号#) and (@风险条目序号串#=" " or instr(@风险条目序号串#, concat(";",{风险条目序号},";")) > 0) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@合约类型#=0 or {合约类型}=@合约类型#) and (@订单方向串#=" " or instr({订单方向串},@订单方向串#)>0) and (@风险规则序号#=0 or {风险规则序号}=@风险规则序号#) and (@风险规则类别串#=" " or instr(@风险规则类别串#, concat(";",{风险规则类别},";")) > 0) and (@风险规则名称#=" " or {风险规则名称}=@风险规则名称#) and (@对应插件#=" " or {对应插件}=@对应插件#) and ({启用标志} = @启用标志# or @启用标志# = 0) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, model_id, 
        model_name, risk_item_id, risk_item_name, exch_no, 
        contrc_type, order_dir_str, trig_stage_type, compli_calc_level, 
        unit_nav_flag, trig_type, risk_rule_id, risk_rule_type, 
        risk_rule_name, risk_rule_code, risk_param_str, risk_rule_value_str, 
        risk_rule_calc_str, corrsp_plug, risk_rule_action, begin_time, 
        end_time, rule_flag from db_rkfutu.tb_rkfurk_client_risk_rule where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_model_id=0 or model_id=v_model_id) and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",risk_item_id,";")) > 0) and (v_exch_no=0 or exch_no=v_exch_no) and (v_contrc_type=0 or contrc_type=v_contrc_type) and (v_order_dir_str=" " or instr(order_dir_str,v_order_dir_str)>0) and (v_risk_rule_id=0 or risk_rule_id=v_risk_rule_id) and (v_risk_rule_type_str=" " or instr(v_risk_rule_type_str, concat(";",risk_rule_type,";")) > 0) and (v_risk_rule_name=" " or risk_rule_name=v_risk_rule_name) and (v_corrsp_plug=" " or corrsp_plug=v_corrsp_plug) and (rule_flag = v_rule_flag or v_rule_flag = 0) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, model_id, 
        model_name, risk_item_id, risk_item_name, exch_no, 
        contrc_type, order_dir_str, trig_stage_type, compli_calc_level, 
        unit_nav_flag, trig_type, risk_rule_id, risk_rule_type, 
        risk_rule_name, risk_rule_code, risk_param_str, risk_rule_value_str, 
        risk_rule_calc_str, corrsp_plug, risk_rule_action, begin_time, 
        end_time, rule_flag from db_rkfutu.tb_rkfurk_client_risk_rule where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_model_id=0 or model_id=v_model_id) and (v_risk_item_id_str=" " or instr(v_risk_item_id_str, concat(";",risk_item_id,";")) > 0) and (v_exch_no=0 or exch_no=v_exch_no) and (v_contrc_type=0 or contrc_type=v_contrc_type) and (v_order_dir_str=" " or instr(order_dir_str,v_order_dir_str)>0) and (v_risk_rule_id=0 or risk_rule_id=v_risk_rule_id) and (v_risk_rule_type_str=" " or instr(v_risk_rule_type_str, concat(";",risk_rule_type,";")) > 0) and (v_risk_rule_name=" " or risk_rule_name=v_risk_rule_name) and (v_corrsp_plug=" " or corrsp_plug=v_corrsp_plug) and (rule_flag = v_rule_flag or v_rule_flag = 0) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_风控_获取客户风险要素
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfurk_GetFutuClientRiskParam;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfurk_GetFutuClientRiskParam(
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
    declare v_tmp_risk_param_str varchar(2048);
    declare v_target_risk_param varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_tmp_risk_param_str = " ";
    SET v_target_risk_param = " ";

    
    label_pro:BEGIN
    

    /* set @临时_风险要素串# = ""; */
    set v_tmp_risk_param_str = "";

    /* set @目标风险要素# = ""; */
    set v_target_risk_param = "";

    /* [声明游标][风控期货_风控_客户风险规则表][{风险要素串}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and ({市场编号} = 0 or {市场编号} = @市场编号#) and ({合约类型} = 0 or {合约类型} = @合约类型#) and ({订单方向串} = 0 or {订单方向串} = @订单方向串#)][cursor_rkfurk_client_riskparam] */
    cursor_rkfurk_client_riskparam:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_rkfurk_client_riskparam CURSOR FOR
        select risk_param_str 
        from db_rkfutu.tb_rkfurk_client_risk_rule 
        where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and (exch_no = 0 or exch_no = v_exch_no) and (contrc_type = 0 or contrc_type = v_contrc_type) and (order_dir_str = 0 or order_dir_str = v_order_dir_str);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@风险要素串#][cursor_rkfurk_client_riskparam][loop_rkfurk_client_riskparam] */
    open cursor_rkfurk_client_riskparam;
    loop_rkfurk_client_riskparam: LOOP
    fetch cursor_rkfurk_client_riskparam into v_risk_param_str;
        IF v_cursor_done THEN
            LEAVE loop_rkfurk_client_riskparam;
        END IF;


        /* set @风险要素串# = trim(@风险要素串#); */
        set v_risk_param_str = trim(v_risk_param_str);
        #如果左边第一个字符是分号，则要删除分号

        /* if left(@风险要素串#, 1) = ";" then */
        if left(v_risk_param_str, 1) = ";" then

            /* set @风险要素串# = substring(@风险要素串#, instr(@风险要素串#, ";") + 1); */
            set v_risk_param_str = substring(v_risk_param_str, instr(v_risk_param_str, ";") + 1);
        end if;
        #如果右边没有分号，则添加

        /* if right(@风险要素串#, 1) <> ";" then */
        if right(v_risk_param_str, 1) <> ";" then

            /* set @风险要素串# = concat(@风险要素串#, ";"); */
            set v_risk_param_str = concat(v_risk_param_str, ";");
        end if;
        #循环截取风险要素串中的风险要素，检查在临时风险要素串中是否存在，不存在添加，存在则不再添加
        loop_label:loop

            /* if instr(@风险要素串#, ";")  - 1> 0 then */
            if instr(v_risk_param_str, ";")  - 1> 0 then

                /* set @目标风险要素# = trim(left(@风险要素串#, instr(@风险要素串#, ";") - 1)); */
                set v_target_risk_param = trim(left(v_risk_param_str, instr(v_risk_param_str, ";") - 1));
                #如果输出的风险要素串中不存在，则添加

                /* if instr(concat(";", @临时_风险要素串#), concat(";", @目标风险要素#, ";")) = 0 then */
                if instr(concat(";", v_tmp_risk_param_str), concat(";", v_target_risk_param, ";")) = 0 then

                    /* set @临时_风险要素串# = concat(@临时_风险要素串#, @目标风险要素#, ";"); */
                    set v_tmp_risk_param_str = concat(v_tmp_risk_param_str, v_target_risk_param, ";");
                end if;

                /* set @风险要素串# = substring(@风险要素串#, instr(@风险要素串#, ";") + 1); */
                set v_risk_param_str = substring(v_risk_param_str, instr(v_risk_param_str, ";") + 1);
            else
                leave loop_label;
            end if;
        end loop;

    /* [关闭游标][cursor_rkfurk_client_riskparam] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_rkfurk_client_riskparam;
    end cursor_rkfurk_client_riskparam;


    /* set @风险要素串# = @临时_风险要素串#; */
    set v_risk_param_str = v_tmp_risk_param_str;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_risk_param_str = v_risk_param_str;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_风控_获取基础风险要素值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfurk_GetFutuBaseRiskParamValue;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfurk_GetFutuBaseRiskParamValue(
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
        #再取风险要素串中左边到分号的字符串，即指定风险要素的串

        /* set @临时_风险要素值串# =  left(@临时_风险要素值串#, instr(@临时_风险要素值串#, ";") - 1); */
        set v_tmp_risk_param_value_str =  left(v_tmp_risk_param_value_str, instr(v_tmp_risk_param_value_str, ";") - 1);
        #再取风险要素串中等号右边的值

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
use db_rkfutu;;

# 原子_风控期货_风控_获取计算风险要素值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfurk_GetFutuCaclRiskParamValue;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfurk_GetFutuCaclRiskParamValue(
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
    IN p_contrc_code varchar(6),
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
    declare v_contrc_code varchar(6);
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_contrc_code_no int;
    declare v_contrc_name varchar(64);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_step_price decimal(16,9);
    declare v_hold_qty decimal(18,2);
    declare v_main_flag int;
    declare v_contrc_unit int;
    declare v_last_price decimal(16,9);
    declare v_buy_price_1 decimal(16,9);
    declare v_sell_price_1 decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_posi_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_order_dir_str varchar(1024);
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_contrc_code = p_contrc_code;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_contrc_code_no = 0;
    SET v_contrc_name = " ";
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_step_price = 0;
    SET v_hold_qty = 0;
    SET v_main_flag = 0;
    SET v_contrc_unit = 0;
    SET v_last_price = 0;
    SET v_buy_price_1 = 0;
    SET v_sell_price_1 = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;
    SET v_posi_qty = 0;
    SET v_rece_margin = 0;
    SET v_order_dir_str = " ";
    SET v_risk_rule_code = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_风控期货_计算_获取期货信息】*/
    call db_rkfutu.pra_rkfucc_GetContrcInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_contrc_code,
        v_error_code,
        v_error_info,
        v_contrc_code_no,
        v_contrc_name,
        v_contrc_type,
        v_asset_type,
        v_step_price,
        v_hold_qty,
        v_main_flag,
        v_contrc_unit,
        v_last_price,
        v_buy_price_1,
        v_sell_price_1,
        v_up_limit_price,
        v_down_limit_price,
        v_pre_settle_price,
        v_sett_price);
    if v_error_code = "1" then
        SET v_error_code = "rkfutuA.3.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_计算_获取期货信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #如果风险要素不在风险要素串中，则为需要计算的风险要素，根据具体的风险要素名称来进行处理

    /* if @目标风险要素# =  "单合约持仓数量" then */
    if v_target_risk_param =  "单合约持仓数量" then

      /* 调用【原子_风控期货_计算_计算单期货持仓数量】*/
      call db_rkfutu.pra_rkfucc_CalcContrcPosition(
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
          v_contrc_code_no,
          v_error_code,
          v_error_info,
          v_posi_qty);
      if v_error_code = "1" then
          SET v_error_code = "rkfutuA.3.6.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_计算_计算单期货持仓数量出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* set @风险要素值# = round(@持仓数量# + @订单数量#,3); */
      set v_risk_param_value = round(v_posi_qty + v_order_qty,3);

    /* elseif @目标风险要素# =  "单合约保证金" then */
    elseif v_target_risk_param =  "单合约保证金" then

      /* 调用【原子_风控期货_计算_计算单期货单合约保证金】*/
      call db_rkfutu.pra_rkfucc_CalcContrcMargin(
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
          v_contrc_code_no,
          v_error_code,
          v_error_info,
          v_rece_margin);
      if v_error_code = "1" then
          SET v_error_code = "rkfutuA.3.6.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_计算_计算单期货单合约保证金出现错误！',v_mysql_message);
          end if;
          leave label_pro;
      elseif v_error_code <> "0" then
          leave label_pro;
      end if;


      /* set @风险要素值# = round(@应收保证金# + ((case when @订单方向# = 1 then @订单数量# * @订单价格# when @订单方向# = 2 then -1 * @订单数量# * @订单价格# else 0 end) + @全部费用#),3); */
      set v_risk_param_value = round(v_rece_margin + ((case when v_order_dir = 1 then v_order_qty * v_order_price when v_order_dir = 2 then -1 * v_order_qty * v_order_price else 0 end) + v_all_fee),3);

    /* elseif @目标风险要素# =  "订单数量" then */
    elseif v_target_risk_param =  "订单数量" then

      /* set @风险要素值# = round(@订单数量#,3); */
      set v_risk_param_value = round(v_order_qty,3);

    /* elseif @目标风险要素# =  "订单方向" then */
    elseif v_target_risk_param =  "订单方向" then

      /* set @风险要素值# = round(@订单方向#,3); */
      set v_risk_param_value = round(v_order_dir,3);

    /* elseif @目标风险要素# =  "订单价格" then */
    elseif v_target_risk_param =  "订单价格" then

      /* set @风险要素值# = round(@订单价格#,3); */
      set v_risk_param_value = round(v_order_price,3);

    /* elseif (@目标风险要素# =  "对手价" or @目标风险要素# =  "最小价差"  or @目标风险要素# =  "涨停价" or @目标风险要素# =  "跌停价" or @目标风险要素# =  "最新价")  then */
    elseif (v_target_risk_param =  "对手价" or v_target_risk_param =  "最小价差"  or v_target_risk_param =  "涨停价" or v_target_risk_param =  "跌停价" or v_target_risk_param =  "最新价")  then

      /* if @目标风险要素# =  "对手价" then */
      if v_target_risk_param =  "对手价" then

        /* if @订单方向串# = 1 then */
        if v_order_dir_str = 1 then

          /* set @风险要素值# = round(@卖一价#,3); */
          set v_risk_param_value = round(v_sell_price_1,3);
        else

          /* set @风险要素值# = round(@买一价#,3); */
          set v_risk_param_value = round(v_buy_price_1,3);
        end if;

      /* elseif @目标风险要素# =  "涨停价" then */
      elseif v_target_risk_param =  "涨停价" then

        /* set @风险要素值# = round(@涨停价#,3); */
        set v_risk_param_value = round(v_up_limit_price,3);

      /* elseif @目标风险要素# =  "跌停价" then */
      elseif v_target_risk_param =  "跌停价" then

        /* set @风险要素值# = round(@跌停价#,3); */
        set v_risk_param_value = round(v_down_limit_price,3);

      /* elseif @目标风险要素# = "最新价" then */
      elseif v_target_risk_param = "最新价" then

        /* set @风险要素值# = round(@最新价#,3); */
        set v_risk_param_value = round(v_last_price,3);

      /* elseif @目标风险要素# = "最小价差" then */
      elseif v_target_risk_param = "最小价差" then

        /* set @风险要素值# = round(@最小价差#,3); */
        set v_risk_param_value = round(v_step_price,3);
      end if;

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
          SET v_error_code = "rkfutuA.3.6.905";
          SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
          leave label_pro;

    end if;
    END;

    SET p_risk_param_value = v_risk_param_value;
    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_风控_试算检查客户风险
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfurk_CheckCalcFutuClientRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfurk_CheckCalcFutuClientRisk(
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
    IN p_compli_trig_id bigint,
    IN p_risk_param_value_str varchar(1024),
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
    declare v_compli_trig_id bigint;
    declare v_risk_param_value_str varchar(1024);
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
    declare v_model_id bigint;
    declare v_model_name varchar(64);
    declare v_risk_item_id int;
    declare v_risk_item_name varchar(64);
    declare v_order_dir_str varchar(1024);
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
    declare v_risk_splice_str varchar(255);
    declare v_compli_trig_result_type int;
    declare v_target_risk_param varchar(255);
    declare v_risk_param_value varchar(255);
    declare v_client_risk_rule_id int;
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
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_risk_param_value_str = p_risk_param_value_str;
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
    SET v_model_id = 0;
    SET v_model_name = " ";
    SET v_risk_item_id = 0;
    SET v_risk_item_name = " ";
    SET v_order_dir_str = " ";
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
    SET v_risk_splice_str = " ";
    SET v_compli_trig_result_type = 0;
    SET v_target_risk_param = " ";
    SET v_risk_param_value = " ";
    SET v_client_risk_rule_id = 0;
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @风控允许标志# = 0; */
    set v_risk_pre_flag = 0;

    /* set @临时_风险要素值串# = @风险要素值串#; */
    set v_tmp_risk_param_value_str = v_risk_param_value_str;

    /* [声明游标][风控期货_风控_客户风险规则表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and ({市场编号} = @市场编号# or {市场编号} = 0)and ({合约类型}=@合约类型# or {合约类型} = 0 ) and (instr(concat(";",{订单方向串}),concat(";",@订单方向#,";"))>0 or @订单方向# = 0) and {启用标志} = 《启用标志-启用》 and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end)][cursor_rkfurk_client_riskparam] */
    cursor_rkfurk_client_riskparam:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_rkfurk_client_riskparam CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, model_id, 
        model_name, risk_item_id, risk_item_name, exch_no, 
        contrc_type, order_dir_str, trig_stage_type, compli_calc_level, 
        unit_nav_flag, trig_type, risk_rule_id, risk_rule_type, 
        risk_rule_name, risk_rule_code, risk_param_str, risk_rule_value_str, 
        risk_rule_calc_str, corrsp_plug, risk_rule_action, begin_time, 
        end_time, rule_flag 
        from db_rkfutu.tb_rkfurk_client_risk_rule 
        where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and (exch_no = v_exch_no or exch_no = 0)and (contrc_type=v_contrc_type or contrc_type = 0 ) and (instr(concat(";",order_dir_str),concat(";",v_order_dir,";"))>0 or v_order_dir = 0) and rule_flag = 1 and (case when begin_time>end_time then (v_mach_time between begin_time and 240000 or v_mach_time between 0 and end_time)  when end_time>begin_time then (v_mach_time between begin_time and end_time) else begin_time = end_time end);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_rkfurk_client_riskparam][loop_rkfurk_client_riskparam] */
    open cursor_rkfurk_client_riskparam;
    loop_rkfurk_client_riskparam: LOOP
    fetch cursor_rkfurk_client_riskparam into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_model_id, 
        v_model_name, v_risk_item_id, v_risk_item_name, v_exch_no, 
        v_contrc_type, v_order_dir_str, v_trig_stage_type, v_compli_calc_level, 
        v_unit_nav_flag, v_trig_type, v_risk_rule_id, v_risk_rule_type, 
        v_risk_rule_name, v_risk_rule_code, v_risk_param_str, v_risk_rule_value_str, 
        v_risk_rule_calc_str, v_corrsp_plug, v_risk_rule_action, v_begin_time, 
        v_end_time, v_rule_flag;
        IF v_cursor_done THEN
            LEAVE loop_rkfurk_client_riskparam;
        END IF;


       /* [检查报错返回][@风险计算值串# = " "][908][@风险计算值串#] */
       if v_risk_rule_calc_str = " " then
           
           SET v_error_code = "rkfutuA.3.7.908";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("风险计算值串=",v_risk_rule_calc_str),"#",v_mysql_message);
           else
               SET v_error_info = concat("风险计算值串=",v_risk_rule_calc_str);
           end if;
           close cursor_rkfurk_client_riskparam;
           leave label_pro;
       end if;


        /* set @风控拼接值串# = @风险要素串#; */
        set v_risk_splice_str = v_risk_param_str;

        /* set @风险要素值串# = @临时_风险要素值串#; */
        set v_risk_param_value_str = v_tmp_risk_param_value_str;

        /* 调用【原子_风控期货_风控_风险要素值串拼接】*/
        call db_rkfutu.pra_rkfurk_JointRiskParamValueStr(
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
            v_rece_margin,
            v_risk_param_value_str,
            v_risk_rule_calc_str,
            v_risk_param_str,
            v_order_dir_str,
            v_order_price,
            v_order_qty,
            v_all_fee,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rkfutuA.3.7.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_风险要素值串拼接出现错误！',v_mysql_message);
            end if;
            close cursor_rkfurk_client_riskparam;
            leave label_pro;
        elseif v_error_code <> "0" then
            close cursor_rkfurk_client_riskparam;
            leave label_pro;
        end if;


        /* set @合规触发结果# = 0; */
        set v_compli_trig_result_type = 0;
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
                      SET v_error_code = "rkfutuA.3.7.905";
                      SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
                      close cursor_rkfurk_client_riskparam;
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

                      /* 调用【原子_风控期货_风控_获取计算风险要素值】*/
                      call db_rkfutu.pra_rkfurk_GetFutuCaclRiskParamValue(
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
                          v_contrc_code,
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
                          v_error_code,
                          v_error_info);
                      if v_error_code = "1" then
                          SET v_error_code = "rkfutuA.3.7.999";
                          if v_mysql_message <> "" then
                               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_获取计算风险要素值出现错误！',v_mysql_message);
                          end if;
                          close cursor_rkfurk_client_riskparam;
                          leave label_pro;
                      elseif v_error_code <> "0" then
                          close cursor_rkfurk_client_riskparam;
                          leave label_pro;
                      end if;

                  else

                      /* 调用【原子_风控期货_风控_获取基础风险要素值】*/
                      call db_rkfutu.pra_rkfurk_GetFutuBaseRiskParamValue(
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
                          SET v_error_code = "rkfutuA.3.7.999";
                          if v_mysql_message <> "" then
                               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_获取基础风险要素值出现错误！',v_mysql_message);
                          end if;
                          close cursor_rkfurk_client_riskparam;
                          leave label_pro;
                      elseif v_error_code <> "0" then
                          close cursor_rkfurk_client_riskparam;
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
                      SET v_error_code = "rkfutuA.3.7.905";
                      SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
                      close cursor_rkfurk_client_riskparam;
                      leave label_pro;

              end if;
              leave loop_label;
          end if;
        end loop;
            #如果风险规则代码替换完成，则检查代码中是否还有宏，如果没有宏，则执行，否则报错

        /* if instr(@风险规则代码#, "[") > 0 or instr(@风险规则代码#, "]") > 0 then */
        if instr(v_risk_rule_code, "[") > 0 or instr(v_risk_rule_code, "]") > 0 then

           /* [报错不回滚][905][@风险规则代码#] */
               SET v_error_code = "rkfutuA.3.7.905";
               SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
               close cursor_rkfurk_client_riskparam;
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

            /* set @客户风险规则序号# = @记录序号#; */
            set v_client_risk_rule_id = v_row_id;

            /* 调用【原子_风控期货_风控_风险要素值串替换】*/
            call db_rkfutu.pra_rkfurk_ReplaceRiskParamValueStr(
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
                SET v_error_code = "rkfutuA.3.7.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_风险要素值串替换出现错误！',v_mysql_message);
                end if;
                close cursor_rkfurk_client_riskparam;
                leave label_pro;
            elseif v_error_code <> "0" then
                close cursor_rkfurk_client_riskparam;
                leave label_pro;
            end if;


            /* if instr(@风险要素串#,"黑名单;")>0 then */
            if instr(v_risk_param_str,"黑名单;")>0 then

               /* set @风险要素值串# = concat("合约代码",@合约代码#,"在黑名单范围内!"); */
               set v_risk_param_value_str = concat("合约代码",v_contrc_code,"在黑名单范围内!");

            /* elseif instr(@风险规则名称#,"偏离对手价")>0 then */
            elseif instr(v_risk_rule_name,"偏离对手价")>0 then

               /* set @风险要素值串# = concat("合约代码",@合约代码#,"委托价格:",@订单价格#,",偏离对手价",substr(@风险规则值串#,1,instr(@风险规则值串#,";")-1),"个最小变动价位"); */
               set v_risk_param_value_str = concat("合约代码",v_contrc_code,"委托价格:",v_order_price,",偏离对手价",substr(v_risk_rule_value_str,1,instr(v_risk_rule_value_str,";")-1),"个最小变动价位");

            /* elseif instr(@风险规则名称#,"超出对手价")>0 then */
            elseif instr(v_risk_rule_name,"超出对手价")>0 then

               /* set @风险要素值串# = concat("合约代码",@合约代码#,"委托价格:",@订单价格#,",超出对手价",substr(@风险规则值串#,1,instr(@风险规则值串#,";")-1),"个最小变动价位"); */
               set v_risk_param_value_str = concat("合约代码",v_contrc_code,"委托价格:",v_order_price,",超出对手价",substr(v_risk_rule_value_str,1,instr(v_risk_rule_value_str,";")-1),"个最小变动价位");
            end if;

            /* set @备注信息# = concat( "风险试算触警!",@风险要素值串#); */
            set v_remark_info = concat( "风险试算触警!",v_risk_param_value_str);

            /* [插入表记录][风控期货_风控_客户风险触警流水表][字段][字段变量][1][@客户风险规则序号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_rkfutu.tbjour_rkfurk_futu_client_risk_trig(
                create_date, create_time, update_date, 
                update_time, update_times, client_risk_rule_id, compli_trig_id, 
                co_no, pd_no, exch_group_no, order_dir_str, 
                exch_no, contrc_type, contrc_code, trig_stage_type, 
                compli_calc_level, unit_nav_flag, trig_type, risk_item_name, 
                risk_rule_action, risk_rule_type, risk_rule_value_str, risk_rule_calc_str, 
                remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_client_risk_rule_id, v_compli_trig_id, 
                v_co_no, v_pd_no, v_exch_group_no, v_order_dir_str, 
                v_exch_no, v_contrc_type, v_contrc_code, v_trig_stage_type, 
                v_compli_calc_level, v_unit_nav_flag, v_trig_type, v_risk_item_name, 
                v_risk_rule_action, v_risk_rule_type, v_risk_rule_value_str, v_risk_rule_calc_str, 
                v_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "rkfutuA.3.7.1";
                SET v_error_info =  CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
                close cursor_rkfurk_client_riskparam;
                leave label_pro;
            end if;

          end if;
        end if;

    /* [关闭游标][cursor_rkfurk_client_riskparam] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_rkfurk_client_riskparam;
    end cursor_rkfurk_client_riskparam;

    #白名单需要循环后检查

    /* if @风控允许标志# =0 then */
    if v_risk_pre_flag =0 then

        /* [获取表记录变量语句][风控期货_风控_客户风险规则表][字段][字段变量][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and ({市场编号} = @市场编号# or {市场编号} = 0)and ({合约类型}=@合约类型# or {合约类型} = 0) and (instr(concat(";",{订单方向串}),concat(";",@订单方向#,";"))>0 or @订单方向# = 0) and {启用标志} = 《启用标志-启用》 and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end) and instr({风险要素串},"白名单")>0] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no, exch_group_no, asset_acco_no, model_id, 
            model_name, risk_item_id, risk_item_name, exch_no, 
            contrc_type, order_dir_str, trig_stage_type, compli_calc_level, 
            unit_nav_flag, trig_type, risk_rule_id, risk_rule_type, 
            risk_rule_name, risk_rule_code, risk_param_str, risk_rule_value_str, 
            risk_rule_calc_str, corrsp_plug, risk_rule_action, begin_time, 
            end_time, rule_flag into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_model_id, 
            v_model_name, v_risk_item_id, v_risk_item_name, v_exch_no, 
            v_contrc_type, v_order_dir_str, v_trig_stage_type, v_compli_calc_level, 
            v_unit_nav_flag, v_trig_type, v_risk_rule_id, v_risk_rule_type, 
            v_risk_rule_name, v_risk_rule_code, v_risk_param_str, v_risk_rule_value_str, 
            v_risk_rule_calc_str, v_corrsp_plug, v_risk_rule_action, v_begin_time, 
            v_end_time, v_rule_flag from db_rkfutu.tb_rkfurk_client_risk_rule where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and (exch_no = v_exch_no or exch_no = 0)and (contrc_type=v_contrc_type or contrc_type = 0) and (instr(concat(";",order_dir_str),concat(";",v_order_dir,";"))>0 or v_order_dir = 0) and rule_flag = 1 and (case when begin_time>end_time then (v_mach_time between begin_time and 240000 or v_mach_time between 0 and end_time)  when end_time>begin_time then (v_mach_time between begin_time and end_time) else begin_time = end_time end) and instr(risk_param_str,"白名单")>0 limit 1;

        if found_rows() > 0 then

          /* set @备注信息# = concat( "风险试算触警! 合约代码",@合约代码#,"不在白名单内!"); */
          set v_remark_info = concat( "风险试算触警! 合约代码",v_contrc_code,"不在白名单内!");

          /* set @合规触发结果# = 1; */
          set v_compli_trig_result_type = 1;

          /* set @客户风险规则序号# = @记录序号#; */
          set v_client_risk_rule_id = v_row_id;

          /* set @风险计算值串# = concat("0",substr(@风险计算值串#,2)); */
          set v_risk_rule_calc_str = concat("0",substr(v_risk_rule_calc_str,2));

          /* [插入表记录][风控期货_风控_客户风险触警流水表][字段][字段变量][1][@客户风险规则序号#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_rkfutu.tbjour_rkfurk_futu_client_risk_trig(
              create_date, create_time, update_date, 
              update_time, update_times, client_risk_rule_id, compli_trig_id, 
              co_no, pd_no, exch_group_no, order_dir_str, 
              exch_no, contrc_type, contrc_code, trig_stage_type, 
              compli_calc_level, unit_nav_flag, trig_type, risk_item_name, 
              risk_rule_action, risk_rule_type, risk_rule_value_str, risk_rule_calc_str, 
              remark_info) 
          value( 
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_client_risk_rule_id, v_compli_trig_id, 
              v_co_no, v_pd_no, v_exch_group_no, v_order_dir_str, 
              v_exch_no, v_contrc_type, v_contrc_code, v_trig_stage_type, 
              v_compli_calc_level, v_unit_nav_flag, v_trig_type, v_risk_item_name, 
              v_risk_rule_action, v_risk_rule_type, v_risk_rule_value_str, v_risk_rule_calc_str, 
              v_remark_info);
          if v_error_code = "1" then
                      
              SET v_error_code = "rkfutuA.3.7.1";
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
use db_rkfutu;;

# 原子_风控期货_风控_客户风险触警流水查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfurk_QueryFutuClientRiskTrig;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfurk_QueryFutuClientRiskTrig(
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
    

    /* [获取表记录][风控期货_风控_客户风险触警流水表][字段][{创建日期}=@创建日期# and {机构编号}=@机构编号# and ({风险采取行为}=@风险采取行为# or @风险采取行为# = " ") and ({风险规则类别}=@风险规则类别# or @风险规则类别# = 0) and  (@产品编号#=0 or {产品编号} = @产品编号#) and (@交易组编号#=0 or {交易组编号} = @交易组编号#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, client_risk_rule_id, 
        compli_trig_id, co_no, pd_no, exch_group_no, 
        order_dir_str, exch_no, contrc_type, contrc_code, 
        trig_stage_type, compli_calc_level, unit_nav_flag, trig_type, 
        risk_item_name, risk_rule_action, risk_rule_type, risk_rule_value_str, 
        risk_rule_calc_str, remark_info from db_rkfutu.tbjour_rkfurk_futu_client_risk_trig where create_date=v_create_date and co_no=v_co_no and (risk_rule_action=v_risk_rule_action or v_risk_rule_action = " ") and (risk_rule_type=v_risk_rule_type or v_risk_rule_type = 0) and  (v_pd_no=0 or pd_no = v_pd_no) and (v_exch_group_no=0 or exch_group_no = v_exch_group_no);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, client_risk_rule_id, 
        compli_trig_id, co_no, pd_no, exch_group_no, 
        order_dir_str, exch_no, contrc_type, contrc_code, 
        trig_stage_type, compli_calc_level, unit_nav_flag, trig_type, 
        risk_item_name, risk_rule_action, risk_rule_type, risk_rule_value_str, 
        risk_rule_calc_str, remark_info from db_rkfutu.tbjour_rkfurk_futu_client_risk_trig where create_date=v_create_date and co_no=v_co_no and (risk_rule_action=v_risk_rule_action or v_risk_rule_action = " ") and (risk_rule_type=v_risk_rule_type or v_risk_rule_type = 0) and  (v_pd_no=0 or pd_no = v_pd_no) and (v_exch_group_no=0 or exch_group_no = v_exch_group_no) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_风控_模板查询客户产品交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfurk_QueryPdExchGroupByModel;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfurk_QueryPdExchGroupByModel(
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
    

    /* [获取表记录][风控期货_风控_客户风险规则表][ distinct {产品编号},{交易组编号}][{机构编号}=@机构编号# and {模板序号}=@模板序号# and (@风险规则类别串#=" " or instr(@风险规则类别串#, concat(";",{风险规则类别},";")) > 0) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select  distinct pd_no,exch_group_no from db_rkfutu.tb_rkfurk_client_risk_rule where co_no=v_co_no and model_id=v_model_id and (v_risk_rule_type_str=" " or instr(v_risk_rule_type_str, concat(";",risk_rule_type,";")) > 0) order by row_id;
    else
        select  distinct pd_no,exch_group_no from db_rkfutu.tb_rkfurk_client_risk_rule where co_no=v_co_no and model_id=v_model_id and (v_risk_rule_type_str=" " or instr(v_risk_rule_type_str, concat(";",risk_rule_type,";")) > 0) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_风控_获取最大的合规触警流水序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfurk_GetMaxComplianceTriggerId;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfurk_GetMaxComplianceTriggerId(
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

    /* [插入重复更新][风控期货_风控_合规触警流水序号表][字段][字段变量][{合规触警序号} = {合规触警序号} + 1 ][1][@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rkfutu.tb_rkfurk_compliancetrigger_id (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, compli_trig_id) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_compli_trig_id) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, compli_trig_id = compli_trig_id + 1 ;
    if v_error_code = "1" then
                
        SET v_error_code = "rkfutuA.3.10.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][风控期货_风控_合规触警流水序号表][{合规触警序号}][@合规触警序号#][{机构编号}=@机构编号#][4][@合规触警序号#] */
    select compli_trig_id into v_compli_trig_id from db_rkfutu.tb_rkfurk_compliancetrigger_id where co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "rkfutuA.3.10.4";
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

      /* [更新表记录][风控期货_风控_合规触警流水序号表][{合规触警序号} = @合规触警序号#][{机构编号} = @机构编号#][2][@机构编号#] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_rkfutu.tb_rkfurk_compliancetrigger_id set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, compli_trig_id = v_compli_trig_id where co_no = v_co_no;
      if v_error_code = "1" then
                  
          SET v_error_code = "rkfutuA.3.10.2";
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
use db_rkfutu;;

# 原子_风控期货_风控_获取指定序号合规触警流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfurk_GetComplianceTriggerByTriggerId;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfurk_GetComplianceTriggerByTriggerId(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][风控期货_风控_客户风险触警流水表][{客户风险规则序号},{产品编号},{交易组编号},{合规规则说明},max({风险采取行为}),{风险规则值串},{风险计算值串},{备注信息},{客户风险规则序号}][{机构编号}= @机构编号# and {触发阶段类型} = @触发阶段类型# and {合规触警序号} = @合规触警序号# group by {客户风险规则序号},{合约代码编号}][@指定行数#] */
    if v_row_count = -1 then
        select client_risk_rule_id,pd_no,exch_group_no,compli_rules_remark,max(risk_rule_action),risk_rule_value_str,risk_rule_calc_str,remark_info,client_risk_rule_id from db_rkfutu.tbjour_rkfurk_futu_client_risk_trig where co_no= v_co_no and trig_stage_type = v_trig_stage_type and compli_trig_id = v_compli_trig_id group by client_risk_rule_id,contrc_code_no;
    else
        select client_risk_rule_id,pd_no,exch_group_no,compli_rules_remark,max(risk_rule_action),risk_rule_value_str,risk_rule_calc_str,remark_info,client_risk_rule_id from db_rkfutu.tbjour_rkfurk_futu_client_risk_trig where co_no= v_co_no and trig_stage_type = v_trig_stage_type and compli_trig_id = v_compli_trig_id group by client_risk_rule_id,contrc_code_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_风控_风险要素值串拼接
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfurk_JointRiskParamValueStr;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfurk_JointRiskParamValueStr(
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
    IN p_rece_margin decimal(18,4),
    INOUT p_risk_param_value_str varchar(1024),
    IN p_risk_rule_calc_str varchar(255),
    IN p_risk_param_str varchar(2048),
    IN p_order_dir_str varchar(1024),
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_lngsht_type int;
    declare v_rece_margin decimal(18,4);
    declare v_risk_param_value_str varchar(1024);
    declare v_risk_rule_calc_str varchar(255);
    declare v_risk_param_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_risk_deal_str varchar(255);
    declare v_risk_deal_str varchar(255);
    declare v_trade_occur_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_rece_margin = p_rece_margin;
    SET v_risk_param_value_str = p_risk_param_value_str;
    SET v_risk_rule_calc_str = p_risk_rule_calc_str;
    SET v_risk_param_str = p_risk_param_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_all_fee = p_all_fee;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_risk_deal_str = " ";
    SET v_risk_deal_str = " ";
    SET v_trade_occur_amt = 0;

    
    label_pro:BEGIN
    
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

        /* if @临时_风控处理值串# = "合计保证金" then */
        if v_tmp_risk_deal_str = "合计保证金" then

           /* if @组合编码#<>" " then */
           if v_comb_code<>" " then

             /* 调用【原子_风控期货_计算_计算实收保证金】*/
             call db_rkfutu.pra_rkfucc_CalcRealMarginByExection(
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
                 v_rece_margin,
                 v_error_code,
                 v_error_info,
                 v_trade_occur_amt);
             if v_error_code = "1" then
                 SET v_error_code = "rkfutuA.3.12.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_计算_计算实收保证金出现错误！',v_mysql_message);
                 end if;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 leave label_pro;
             end if;

           end if;

           /* set  @风控处理值串# = round((@风控处理值串# + @交易变动金额#),3); */
           set  v_risk_deal_str = round((v_risk_deal_str + v_trade_occur_amt),3);
        end if;

        /* if @临时_风控处理值串# = "可用金额" then */
        if v_tmp_risk_deal_str = "可用金额" then

           /* if @组合编码#<>" " then */
           if v_comb_code<>" " then

             /* 调用【原子_风控期货_计算_计算实收保证金】*/
             call db_rkfutu.pra_rkfucc_CalcRealMarginByExection(
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
                 v_rece_margin,
                 v_error_code,
                 v_error_info,
                 v_trade_occur_amt);
             if v_error_code = "1" then
                 SET v_error_code = "rkfutuA.3.12.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_计算_计算实收保证金出现错误！',v_mysql_message);
                 end if;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 leave label_pro;
             end if;

           end if;

           /* set  @风控处理值串# = round((@风控处理值串# + @交易变动金额# + @全部费用#),3); */
           set  v_risk_deal_str = round((v_risk_deal_str + v_trade_occur_amt + v_all_fee),3);
        end if;

         /* if @临时_风控处理值串# = "交易总手数" then */
         if v_tmp_risk_deal_str = "交易总手数" then

            /* set  @风控处理值串# = round((@风控处理值串# + @订单数量#),0); */
            set  v_risk_deal_str = round((v_risk_deal_str + v_order_qty),0);
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
use db_rkfutu;;

# 原子_风控期货_风控_风险要素值串替换
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfurk_ReplaceRiskParamValueStr;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfurk_ReplaceRiskParamValueStr(
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

      /* set @风险要素值串# = concat(@风险要素值串#,round(@风控处理值串# / @临时_风控处理值串#  * 100,3),"%"); */
      set v_risk_param_value_str = concat(v_risk_param_value_str,round(v_risk_deal_str / v_tmp_risk_deal_str  * 100,3),"%");
    else

      /* set @风控处理值串# = substr(@风险计算值串#,1,instr(@风险计算值串#,";")-1); */
      set v_risk_deal_str = substr(v_risk_rule_calc_str,1,instr(v_risk_rule_calc_str,";")-1);

      /* if instr(@风险规则名称#, "数量")>0 then */
      if instr(v_risk_rule_name, "数量")>0 then

        /* set @风控处理值串#= round(@风控处理值串#,0); */
        set v_risk_deal_str= round(v_risk_deal_str,0);
      else

        /* set @风控处理值串#= round(@风控处理值串#,3); */
        set v_risk_deal_str= round(v_risk_deal_str,3);
      end if;

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
    END;

    SET p_risk_param_value_str = v_risk_param_value_str;
    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_风控_交易检查客户风险
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfurk_CheckFutuClientRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfurk_CheckFutuClientRisk(
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
    IN p_compli_trig_id bigint,
    IN p_risk_param_value_str varchar(1024),
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
    declare v_compli_trig_id bigint;
    declare v_risk_param_value_str varchar(1024);
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
    declare v_model_id bigint;
    declare v_model_name varchar(64);
    declare v_risk_item_id int;
    declare v_risk_item_name varchar(64);
    declare v_order_dir_str varchar(1024);
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
    declare v_risk_splice_str varchar(255);
    declare v_tmp_risk_rule_value_str varchar(255);
    declare v_compli_trig_result_type int;
    declare v_target_risk_param varchar(255);
    declare v_risk_param_value varchar(255);
    declare v_client_risk_rule_id int;
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
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_risk_param_value_str = p_risk_param_value_str;
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
    SET v_model_id = 0;
    SET v_model_name = " ";
    SET v_risk_item_id = 0;
    SET v_risk_item_name = " ";
    SET v_order_dir_str = " ";
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
    SET v_risk_splice_str = " ";
    SET v_tmp_risk_rule_value_str = " ";
    SET v_compli_trig_result_type = 0;
    SET v_target_risk_param = " ";
    SET v_risk_param_value = " ";
    SET v_client_risk_rule_id = 0;
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @风控允许标志# = 0; */
    set v_risk_pre_flag = 0;

    /* set @临时_风险要素值串# = @风险要素值串#; */
    set v_tmp_risk_param_value_str = v_risk_param_value_str;

    /* [声明游标][风控期货_风控_客户风险规则表][字段][{机构编号}=@机构编号# and ({产品编号}=@产品编号# or {产品编号} = -1) and ({交易组编号}=@交易组编号# or {交易组编号} = -1 or {交易组编号} = 0) and ({市场编号} = @市场编号# or {市场编号} = 0)and ({合约类型}=@合约类型# or {合约类型} = 0 ) and (instr(concat(";",{订单方向串}),concat(";",@订单方向#,";"))>0 or @订单方向# = 0) and {启用标志} = 《启用标志-启用》 and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end)][cursor_rkfurk_client_riskparam] */
    cursor_rkfurk_client_riskparam:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_rkfurk_client_riskparam CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, asset_acco_no, model_id, 
        model_name, risk_item_id, risk_item_name, exch_no, 
        contrc_type, order_dir_str, trig_stage_type, compli_calc_level, 
        unit_nav_flag, trig_type, risk_rule_id, risk_rule_type, 
        risk_rule_name, risk_rule_code, risk_param_str, risk_rule_value_str, 
        risk_rule_calc_str, corrsp_plug, risk_rule_action, begin_time, 
        end_time, rule_flag 
        from db_rkfutu.tb_rkfurk_client_risk_rule 
        where co_no=v_co_no and (pd_no=v_pd_no or pd_no = -1) and (exch_group_no=v_exch_group_no or exch_group_no = -1 or exch_group_no = 0) and (exch_no = v_exch_no or exch_no = 0)and (contrc_type=v_contrc_type or contrc_type = 0 ) and (instr(concat(";",order_dir_str),concat(";",v_order_dir,";"))>0 or v_order_dir = 0) and rule_flag = 1 and (case when begin_time>end_time then (v_mach_time between begin_time and 240000 or v_mach_time between 0 and end_time)  when end_time>begin_time then (v_mach_time between begin_time and end_time) else begin_time = end_time end);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_rkfurk_client_riskparam][loop_rkfurk_client_riskparam] */
    open cursor_rkfurk_client_riskparam;
    loop_rkfurk_client_riskparam: LOOP
    fetch cursor_rkfurk_client_riskparam into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_model_id, 
        v_model_name, v_risk_item_id, v_risk_item_name, v_exch_no, 
        v_contrc_type, v_order_dir_str, v_trig_stage_type, v_compli_calc_level, 
        v_unit_nav_flag, v_trig_type, v_risk_rule_id, v_risk_rule_type, 
        v_risk_rule_name, v_risk_rule_code, v_risk_param_str, v_risk_rule_value_str, 
        v_risk_rule_calc_str, v_corrsp_plug, v_risk_rule_action, v_begin_time, 
        v_end_time, v_rule_flag;
        IF v_cursor_done THEN
            LEAVE loop_rkfurk_client_riskparam;
        END IF;


       /* [检查报错返回][@风险计算值串# = " "][908][@风险计算值串#] */
       if v_risk_rule_calc_str = " " then
           
           SET v_error_code = "rkfutuA.3.14.908";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("风险计算值串=",v_risk_rule_calc_str),"#",v_mysql_message);
           else
               SET v_error_info = concat("风险计算值串=",v_risk_rule_calc_str);
           end if;
           close cursor_rkfurk_client_riskparam;
           leave label_pro;
       end if;


        /* set @风控拼接值串# = @风险要素串#; */
        set v_risk_splice_str = v_risk_param_str;

        /* set @风险要素值串# = @临时_风险要素值串#; */
        set v_risk_param_value_str = v_tmp_risk_param_value_str;

        /* set @临时_风险规则值串# = @风险规则值串#; */
        set v_tmp_risk_rule_value_str = v_risk_rule_value_str;

        /* 调用【原子_风控期货_风控_风险要素值串拼接】*/
        call db_rkfutu.pra_rkfurk_JointRiskParamValueStr(
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
            v_rece_margin,
            v_risk_param_value_str,
            v_risk_rule_calc_str,
            v_risk_param_str,
            v_order_dir_str,
            v_order_price,
            v_order_qty,
            v_all_fee,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "rkfutuA.3.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_风险要素值串拼接出现错误！',v_mysql_message);
            end if;
            close cursor_rkfurk_client_riskparam;
            leave label_pro;
        elseif v_error_code <> "0" then
            close cursor_rkfurk_client_riskparam;
            leave label_pro;
        end if;


        /* set @合规触发结果# = 0; */
        set v_compli_trig_result_type = 0;
        #对于15,16进行特殊处理,由于n值需要重复两遍

        /* if @风险规则序号# = 15  or @风险规则序号# = 16 then */
        if v_risk_rule_id = 15  or v_risk_rule_id = 16 then

          /* if CHAR_LENGTH(@风险规则值串#) = 2 then */
          if CHAR_LENGTH(v_risk_rule_value_str) = 2 then

            /* set @风险规则值串# = concat(@风险规则值串#,@风险规则值串#); */
            set v_risk_rule_value_str = concat(v_risk_rule_value_str,v_risk_rule_value_str);
          end if;
        end if;
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
                      SET v_error_code = "rkfutuA.3.14.905";
                      SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
                      close cursor_rkfurk_client_riskparam;
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

                      /* 调用【原子_风控期货_风控_获取计算风险要素值】*/
                      call db_rkfutu.pra_rkfurk_GetFutuCaclRiskParamValue(
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
                          v_contrc_code,
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
                          v_error_code,
                          v_error_info);
                      if v_error_code = "1" then
                          SET v_error_code = "rkfutuA.3.14.999";
                          if v_mysql_message <> "" then
                               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_获取计算风险要素值出现错误！',v_mysql_message);
                          end if;
                          close cursor_rkfurk_client_riskparam;
                          leave label_pro;
                      elseif v_error_code <> "0" then
                          close cursor_rkfurk_client_riskparam;
                          leave label_pro;
                      end if;

                  else

                      /* 调用【原子_风控期货_风控_获取基础风险要素值】*/
                      call db_rkfutu.pra_rkfurk_GetFutuBaseRiskParamValue(
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
                          SET v_error_code = "rkfutuA.3.14.999";
                          if v_mysql_message <> "" then
                               SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_获取基础风险要素值出现错误！',v_mysql_message);
                          end if;
                          close cursor_rkfurk_client_riskparam;
                          leave label_pro;
                      elseif v_error_code <> "0" then
                          close cursor_rkfurk_client_riskparam;
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
                      SET v_error_code = "rkfutuA.3.14.905";
                      SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
                      close cursor_rkfurk_client_riskparam;
                      leave label_pro;

              end if;
              leave loop_label;
          end if;
        end loop;
            #如果风险规则代码替换完成，则检查代码中是否还有宏，如果没有宏，则执行，否则报错

        /* if instr(@风险规则代码#, "[") > 0 or instr(@风险规则代码#, "]") > 0 then */
        if instr(v_risk_rule_code, "[") > 0 or instr(v_risk_rule_code, "]") > 0 then

           /* [报错不回滚][905][@风险规则代码#] */
               SET v_error_code = "rkfutuA.3.14.905";
               SET v_error_info = concat("风险规则代码=",v_risk_rule_code);
               close cursor_rkfurk_client_riskparam;
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

            /* set @客户风险规则序号# = @记录序号#; */
            set v_client_risk_rule_id = v_row_id;

            /* set @风险规则值串# = @临时_风险规则值串#; */
            set v_risk_rule_value_str = v_tmp_risk_rule_value_str;

            /* set @风险要素值串# = @临时_风险要素值串#; */
            set v_risk_param_value_str = v_tmp_risk_param_value_str;

            /* 调用【原子_风控期货_风控_风险要素值串替换】*/
            call db_rkfutu.pra_rkfurk_ReplaceRiskParamValueStr(
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
                SET v_error_code = "rkfutuA.3.14.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控期货_风控_风险要素值串替换出现错误！',v_mysql_message);
                end if;
                close cursor_rkfurk_client_riskparam;
                leave label_pro;
            elseif v_error_code <> "0" then
                close cursor_rkfurk_client_riskparam;
                leave label_pro;
            end if;


            /* if instr(@风险要素串#,"黑名单;")>0 then */
            if instr(v_risk_param_str,"黑名单;")>0 then

               /* set @风险要素值串# = concat("合约代码",@合约代码#,"在黑名单范围内!"); */
               set v_risk_param_value_str = concat("合约代码",v_contrc_code,"在黑名单范围内!");

            /* elseif instr(@风险规则名称#,"偏离对手价")>0 then */
            elseif instr(v_risk_rule_name,"偏离对手价")>0 then

               /* set @风险要素值串# = concat("合约代码",@合约代码#,"; 委托价格:",round(@订单价格#,3),"; 偏离对手价",substr(@风险规则值串#,1,instr(@风险规则值串#,";")-1),"个最小变动价位"); */
               set v_risk_param_value_str = concat("合约代码",v_contrc_code,"; 委托价格:",round(v_order_price,3),"; 偏离对手价",substr(v_risk_rule_value_str,1,instr(v_risk_rule_value_str,";")-1),"个最小变动价位");

            /* elseif instr(@风险规则名称#,"超出对手价")>0 then */
            elseif instr(v_risk_rule_name,"超出对手价")>0 then

               /* set @风险要素值串# = concat("合约代码",@合约代码#,"; 委托价格:",round(@订单价格#,3),"; 超出对手价",substr(@风险规则值串#,1,instr(@风险规则值串#,";")-1),"个最小变动价位"); */
               set v_risk_param_value_str = concat("合约代码",v_contrc_code,"; 委托价格:",round(v_order_price,3),"; 超出对手价",substr(v_risk_rule_value_str,1,instr(v_risk_rule_value_str,";")-1),"个最小变动价位");
            end if;

            /* set @备注信息# = concat( "交易触警!",@风险要素值串#); */
            set v_remark_info = concat( "交易触警!",v_risk_param_value_str);

            /* [插入表记录][风控期货_风控_客户风险触警流水表][字段][字段变量][1][@客户风险规则序号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_rkfutu.tbjour_rkfurk_futu_client_risk_trig(
                create_date, create_time, update_date, 
                update_time, update_times, client_risk_rule_id, compli_trig_id, 
                co_no, pd_no, exch_group_no, order_dir_str, 
                exch_no, contrc_type, contrc_code, trig_stage_type, 
                compli_calc_level, unit_nav_flag, trig_type, risk_item_name, 
                risk_rule_action, risk_rule_type, risk_rule_value_str, risk_rule_calc_str, 
                remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_client_risk_rule_id, v_compli_trig_id, 
                v_co_no, v_pd_no, v_exch_group_no, v_order_dir_str, 
                v_exch_no, v_contrc_type, v_contrc_code, v_trig_stage_type, 
                v_compli_calc_level, v_unit_nav_flag, v_trig_type, v_risk_item_name, 
                v_risk_rule_action, v_risk_rule_type, v_risk_rule_value_str, v_risk_rule_calc_str, 
                v_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "rkfutuA.3.14.1";
                SET v_error_info =  CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
                close cursor_rkfurk_client_riskparam;
                leave label_pro;
            end if;


             /* if @风险采取行为# = 5 and @开平方向# =1  then */
             if v_risk_rule_action = 5 and v_contrc_dir =1  then
                #报错信息特殊处理,前台报错取错误信息字段

                /* SET @错误编码# = "rkfutuA.3.14.906"; */
                SET v_error_code = "rkfutuA.3.14.906";

                /* SET @错误信息# = concat("触发风控! ",@风险条目名称# ," |", @备注信息#); */
                SET v_error_info = concat("触发风控! ",v_risk_item_name ," |", v_remark_info);

             /* elseif @风险采取行为# = 6 and (@开平方向# =2 or @开平方向# =3)  then */
             elseif v_risk_rule_action = 6 and (v_contrc_dir =2 or v_contrc_dir =3)  then

                /* SET @错误编码# = "rkfutuA.3.14.906"; */
                SET v_error_code = "rkfutuA.3.14.906";

                /* SET @错误信息# = concat("触发风控! ",@风险条目名称# ," |", @备注信息#); */
                SET v_error_info = concat("触发风控! ",v_risk_item_name ," |", v_remark_info);

             /* elseif @风险采取行为# = 7   then */
             elseif v_risk_rule_action = 7   then

                /* SET @错误编码# = "rkfutuA.3.14.906"; */
                SET v_error_code = "rkfutuA.3.14.906";

                /* SET @错误信息# = concat("触发风控! ",@风险条目名称# ," |", @备注信息#); */
                SET v_error_info = concat("触发风控! ",v_risk_item_name ," |", v_remark_info);
             end if;
             close cursor_rkfurk_client_riskparam;
             leave label_pro;
          end if;
        end if;

    /* [关闭游标][cursor_rkfurk_client_riskparam] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_rkfurk_client_riskparam;
    end cursor_rkfurk_client_riskparam;

    #白名单需要循环后检查

    /* if @风控允许标志# =0 then */
    if v_risk_pre_flag =0 then

        /* [获取表记录变量语句][风控期货_风控_客户风险规则表][字段][字段变量][{机构编号}=@机构编号# and ({产品编号}=@产品编号# or {产品编号} = -1) and ({交易组编号}=@交易组编号# or {交易组编号} = -1 or {交易组编号} = 0 ) and ({市场编号} = @市场编号# or {市场编号} = 0)and ({合约类型}=@合约类型# or {合约类型} = 0) and (instr(concat(";",{订单方向串}),concat(";",@订单方向#,";"))>0 or @订单方向# = 0) and {启用标志} = 《启用标志-启用》 and (case when {开始时间}>{结束时间} then (@机器时间# between {开始时间} and 240000 or @机器时间# between 0 and {结束时间})  when {结束时间}>{开始时间} then (@机器时间# between {开始时间} and {结束时间}) else {开始时间} = {结束时间} end) and instr({风险要素串},"白名单")>0] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no, exch_group_no, asset_acco_no, model_id, 
            model_name, risk_item_id, risk_item_name, exch_no, 
            contrc_type, order_dir_str, trig_stage_type, compli_calc_level, 
            unit_nav_flag, trig_type, risk_rule_id, risk_rule_type, 
            risk_rule_name, risk_rule_code, risk_param_str, risk_rule_value_str, 
            risk_rule_calc_str, corrsp_plug, risk_rule_action, begin_time, 
            end_time, rule_flag into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_model_id, 
            v_model_name, v_risk_item_id, v_risk_item_name, v_exch_no, 
            v_contrc_type, v_order_dir_str, v_trig_stage_type, v_compli_calc_level, 
            v_unit_nav_flag, v_trig_type, v_risk_rule_id, v_risk_rule_type, 
            v_risk_rule_name, v_risk_rule_code, v_risk_param_str, v_risk_rule_value_str, 
            v_risk_rule_calc_str, v_corrsp_plug, v_risk_rule_action, v_begin_time, 
            v_end_time, v_rule_flag from db_rkfutu.tb_rkfurk_client_risk_rule where co_no=v_co_no and (pd_no=v_pd_no or pd_no = -1) and (exch_group_no=v_exch_group_no or exch_group_no = -1 or exch_group_no = 0 ) and (exch_no = v_exch_no or exch_no = 0)and (contrc_type=v_contrc_type or contrc_type = 0) and (instr(concat(";",order_dir_str),concat(";",v_order_dir,";"))>0 or v_order_dir = 0) and rule_flag = 1 and (case when begin_time>end_time then (v_mach_time between begin_time and 240000 or v_mach_time between 0 and end_time)  when end_time>begin_time then (v_mach_time between begin_time and end_time) else begin_time = end_time end) and instr(risk_param_str,"白名单")>0 limit 1;

        if found_rows() > 0 then

          /* set @备注信息# = concat( "风险试算触警! 合约代码",@合约代码#,"不在白名单内!"); */
          set v_remark_info = concat( "风险试算触警! 合约代码",v_contrc_code,"不在白名单内!");

          /* set @合规触发结果# = 1; */
          set v_compli_trig_result_type = 1;

          /* set @客户风险规则序号# = @记录序号#; */
          set v_client_risk_rule_id = v_row_id;

          /* set @风险计算值串# = concat("0",substr(@风险计算值串#,2)); */
          set v_risk_rule_calc_str = concat("0",substr(v_risk_rule_calc_str,2));

          /* [插入表记录][风控期货_风控_客户风险触警流水表][字段][字段变量][1][@客户风险规则序号#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_rkfutu.tbjour_rkfurk_futu_client_risk_trig(
              create_date, create_time, update_date, 
              update_time, update_times, client_risk_rule_id, compli_trig_id, 
              co_no, pd_no, exch_group_no, order_dir_str, 
              exch_no, contrc_type, contrc_code, trig_stage_type, 
              compli_calc_level, unit_nav_flag, trig_type, risk_item_name, 
              risk_rule_action, risk_rule_type, risk_rule_value_str, risk_rule_calc_str, 
              remark_info) 
          value( 
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_client_risk_rule_id, v_compli_trig_id, 
              v_co_no, v_pd_no, v_exch_group_no, v_order_dir_str, 
              v_exch_no, v_contrc_type, v_contrc_code, v_trig_stage_type, 
              v_compli_calc_level, v_unit_nav_flag, v_trig_type, v_risk_item_name, 
              v_risk_rule_action, v_risk_rule_type, v_risk_rule_value_str, v_risk_rule_calc_str, 
              v_remark_info);
          if v_error_code = "1" then
                      
              SET v_error_code = "rkfutuA.3.14.1";
              SET v_error_info =  CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
              leave label_pro;
          end if;


             /* if @风险采取行为# = 5 and @开平方向# =1  then */
             if v_risk_rule_action = 5 and v_contrc_dir =1  then

                /* SET @错误编码# = "rkfutuA.3.14.906"; */
                SET v_error_code = "rkfutuA.3.14.906";

                /* SET @错误信息# = concat("触发风控! ",@风险条目名称# ," |", @备注信息#); */
                SET v_error_info = concat("触发风控! ",v_risk_item_name ," |", v_remark_info);

             /* elseif @风险采取行为# = 6 and (@开平方向# =2 or @开平方向# =3)  then */
             elseif v_risk_rule_action = 6 and (v_contrc_dir =2 or v_contrc_dir =3)  then

                /* SET @错误编码# = "rkfutuA.3.14.906"; */
                SET v_error_code = "rkfutuA.3.14.906";

                /* SET @错误信息# = concat("触发风控! ",@风险条目名称# ," |", @备注信息#); */
                SET v_error_info = concat("触发风控! ",v_risk_item_name ," |", v_remark_info);

             /* elseif @风险采取行为# = 7   then */
             elseif v_risk_rule_action = 7   then

                /* SET @错误编码# = "rkfutuA.3.14.906"; */
                SET v_error_code = "rkfutuA.3.14.906";

                /* SET @错误信息# = concat("触发风控! ",@风险条目名称# ," |", @备注信息#); */
                SET v_error_info = concat("触发风控! ",v_risk_item_name ," |", v_remark_info);
             end if;
             leave label_pro;
        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_风控_客户风险触警历史流水查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfurk_QueryHisFutuClientRiskTrig;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfurk_QueryHisFutuClientRiskTrig(
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
    declare v_create_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_风控期货_风控_客户风险触警流水表][字段][{创建日期}=@创建日期# and {机构编号}=@机构编号# and ({风险采取行为}=@风险采取行为# or @风险采取行为# = " ") and ({风险规则类别}=@风险规则类别# or @风险规则类别# = 0) and  (@产品编号#=0 or {产品编号} = @产品编号#) and (@交易组编号#=0 or {交易组编号} = @交易组编号#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, client_risk_rule_id, 
        compli_trig_id, co_no, pd_no, exch_group_no, 
        order_dir_str, exch_no, contrc_type, contrc_code, 
        trig_stage_type, compli_calc_level, unit_nav_flag, trig_type, 
        risk_item_name, risk_rule_action, risk_rule_type, risk_rule_value_str, 
        risk_rule_calc_str, remark_info from db_rkfutu_his.tbjour_rkfurk_futu_client_risk_trig_his where create_date=v_create_date and co_no=v_co_no and (risk_rule_action=v_risk_rule_action or v_risk_rule_action = " ") and (risk_rule_type=v_risk_rule_type or v_risk_rule_type = 0) and  (v_pd_no=0 or pd_no = v_pd_no) and (v_exch_group_no=0 or exch_group_no = v_exch_group_no);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, client_risk_rule_id, 
        compli_trig_id, co_no, pd_no, exch_group_no, 
        order_dir_str, exch_no, contrc_type, contrc_code, 
        trig_stage_type, compli_calc_level, unit_nav_flag, trig_type, 
        risk_item_name, risk_rule_action, risk_rule_type, risk_rule_value_str, 
        risk_rule_calc_str, remark_info from db_rkfutu_his.tbjour_rkfurk_futu_client_risk_trig_his where create_date=v_create_date and co_no=v_co_no and (risk_rule_action=v_risk_rule_action or v_risk_rule_action = " ") and (risk_rule_type=v_risk_rule_type or v_risk_rule_type = 0) and  (v_pd_no=0 or pd_no = v_pd_no) and (v_exch_group_no=0 or exch_group_no = v_exch_group_no) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


