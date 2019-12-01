DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取机构业务记录编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetCoBusiRecordNo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetCoBusiRecordNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_record_no_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_no bigint
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
    declare v_record_no_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_no bigint;
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
    SET v_record_no_type = p_record_no_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #如果不区分机构的编号类型，需要重置机构编号为0

    /* if @编号类型# = 《编号类型-银行账户编号》 then */
    if v_record_no_type = 5 then

        /* set @机构编号# = 0; */
        set v_co_no = 0;
    end if;
    #当前编号，除机构编号外，其他都从0开始

    /* set @当前编号# = 1; */
    set v_curr_no = 1;

    /* [插入重复更新][产品_账户_机构业务记录编号表][字段][字段变量][{当前编号} = {当前编号} + 1][1][@机构编号#, @编号类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_co_busi_record_no (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, record_no_type, 
        curr_no) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_record_no_type, 
        v_curr_no) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_no = curr_no + 1;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.901.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 编号类型=", v_record_no_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 编号类型=", v_record_no_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][产品_账户_机构业务记录编号表][{当前编号}][@当前编号#][{机构编号} = @机构编号# and {编号类型} = @编号类型#] */
    select curr_no into v_curr_no from db_prod.tb_pdacco_co_busi_record_no where co_no = v_co_no and record_no_type = v_record_no_type limit 1;

    #当前编号不区分机构的直接输出，其他按规则输出

    /* if @编号类型# <> 《编号类型-银行账户编号》 then */
    if v_record_no_type <> 5 then

        /* set @当前编号# = @机构编号# * 10000 + @当前编号#; */
        set v_curr_no = v_co_no * 10000 + v_curr_no;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_no = v_curr_no;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_新增产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_AddProductInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_AddProductInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_pd_name varchar(64),
    IN p_pd_flname varchar(255),
    IN p_fund_reg_code varchar(16),
    IN p_pd_manager varchar(32),
    IN p_found_date int,
    IN p_pd_type int,
    IN p_apply_currency varchar(3),
    IN p_crncy_type varchar(3),
    IN p_first_asset decimal(18,4),
    IN p_first_amt decimal(18,4),
    IN p_pd_all_share decimal(18,2),
    IN p_curr_share decimal(18,2),
    IN p_pre_share decimal(18,2),
    IN p_his_max_per_nav decimal(18,4),
    IN p_pre_nav decimal(18,4),
    IN p_coust_full_name varchar(255),
    IN p_coust_acco varchar(16),
    IN p_coust_acco_name varchar(64),
    IN p_warn_posi_value decimal(18,4),
    IN p_close_posi_value decimal(18,4),
    IN p_target_posi_ratio decimal(18,4),
    IN p_beta_coeffi decimal(18,12),
    IN p_custom_pd_class varchar(255),
    IN p_remark_info varchar(255),
    IN p_index_value int,
    IN p_menu_no int,
    IN p_pd_qty_max int,
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
    declare v_pd_no int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
    declare v_pd_name varchar(64);
    declare v_pd_flname varchar(255);
    declare v_fund_reg_code varchar(16);
    declare v_pd_manager varchar(32);
    declare v_found_date int;
    declare v_pd_type int;
    declare v_apply_currency varchar(3);
    declare v_crncy_type varchar(3);
    declare v_first_asset decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_pd_all_share decimal(18,2);
    declare v_curr_share decimal(18,2);
    declare v_pre_share decimal(18,2);
    declare v_his_max_per_nav decimal(18,4);
    declare v_pre_nav decimal(18,4);
    declare v_coust_full_name varchar(255);
    declare v_coust_acco varchar(16);
    declare v_coust_acco_name varchar(64);
    declare v_warn_posi_value decimal(18,4);
    declare v_close_posi_value decimal(18,4);
    declare v_target_posi_ratio decimal(18,4);
    declare v_beta_coeffi decimal(18,12);
    declare v_custom_pd_class varchar(255);
    declare v_remark_info varchar(255);
    declare v_index_value int;
    declare v_menu_no int;
    declare v_pd_qty_max int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_NAV decimal(18,4);
    declare v_evalu_share decimal(18,2);
    declare v_pre_evalu_share decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);

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
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_pd_name = p_pd_name;
    SET v_pd_flname = p_pd_flname;
    SET v_fund_reg_code = p_fund_reg_code;
    SET v_pd_manager = p_pd_manager;
    SET v_found_date = p_found_date;
    SET v_pd_type = p_pd_type;
    SET v_apply_currency = p_apply_currency;
    SET v_crncy_type = p_crncy_type;
    SET v_first_asset = p_first_asset;
    SET v_first_amt = p_first_amt;
    SET v_pd_all_share = p_pd_all_share;
    SET v_curr_share = p_curr_share;
    SET v_pre_share = p_pre_share;
    SET v_his_max_per_nav = p_his_max_per_nav;
    SET v_pre_nav = p_pre_nav;
    SET v_coust_full_name = p_coust_full_name;
    SET v_coust_acco = p_coust_acco;
    SET v_coust_acco_name = p_coust_acco_name;
    SET v_warn_posi_value = p_warn_posi_value;
    SET v_close_posi_value = p_close_posi_value;
    SET v_target_posi_ratio = p_target_posi_ratio;
    SET v_beta_coeffi = p_beta_coeffi;
    SET v_custom_pd_class = p_custom_pd_class;
    SET v_remark_info = p_remark_info;
    SET v_index_value = p_index_value;
    SET v_menu_no = p_menu_no;
    SET v_pd_qty_max = p_pd_qty_max;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_NAV = 0;
    SET v_evalu_share = 0;
    SET v_pre_evalu_share = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* select count(1) into @记录个数# from ~产品_账户_产品信息表^ a,~产品_账户_产品限制信息表^ b where a.{产品编号}=b.{产品编号} and a.{机构编号}=@机构编号# and b.{产品状态}<>"3"; */
    select count(1) into v_record_count from db_prod.tb_pdacco_pd_info a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and a.co_no=v_co_no and b.pd_status<>"3";
    #[获取表记录数量][产品_账户_产品信息表][@记录个数#][{机构编号}=@机构编号# and {产品编码} <> " "]

    /* [检查报错返回][@记录个数#>=@产品数量上限# and @产品数量上限#<>0][30][@机构编号#] */
    if v_record_count>=v_pd_qty_max and v_pd_qty_max<>0 then
        
        SET v_error_code = "prodA.1.1.30";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "产品编号", "|", "机构编号", "|", "产品编码", "|", "产品名称", "|", "产品全称", "|", "基金备案编号", "|", "产品管理人", "|", "成立日期", "|", "产品类型", "|", "募集币种", "|", "本币币种", "|", "原始资产", "|", "原始金额", "|", "产品总份额", "|", "当前份额", "|", "昨日份额", "|", "历史最高单位净值", "|", "昨日净值", "|", "境内托管人全名", "|", "境内托管账户", "|", "境内托管账户名", "|", "预警线", "|", "平仓线", "|", "目标仓位", "|", "beta系数", "|", "自定义产品分类", "|", "备注信息", "|", "索引值", "|", "菜单编号", "|", "产品数量上限", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_pd_no, "|", v_co_no, "|", v_pd_code, "|", v_pd_name, "|", v_pd_flname, "|", v_fund_reg_code, "|", v_pd_manager, "|", v_found_date, "|", v_pd_type, "|", v_apply_currency, "|", v_crncy_type, "|", v_first_asset, "|", v_first_amt, "|", v_pd_all_share, "|", v_curr_share, "|", v_pre_share, "|", v_his_max_per_nav, "|", v_pre_nav, "|", v_coust_full_name, "|", v_coust_acco, "|", v_coust_acco_name, "|", v_warn_posi_value, "|", v_close_posi_value, "|", v_target_posi_ratio, "|", v_beta_coeffi, "|", v_custom_pd_class, "|", v_remark_info, "|", v_index_value, "|", v_menu_no, "|", v_pd_qty_max, "|");


    /* set @期初净资产# = 0; */
    set v_begin_NAV = 0;

    /* set @估值份额# = 0; */
    set v_evalu_share = 0;

    /* set @昨日估值份额# = 0; */
    set v_pre_evalu_share = 0;

    /* [插入表记录][产品_账户_产品信息表][字段][字段变量][1][@机构编号#,@产品编码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_info(
        create_date, create_time, update_date, 
        update_time, update_times, pd_no, co_no, 
        pd_code, pd_name, pd_flname, fund_reg_code, 
        pd_manager, found_date, pd_type, apply_currency, 
        crncy_type, first_asset, first_amt, pd_all_share, 
        curr_share, pre_share, his_max_per_nav, pre_nav, 
        begin_NAV, evalu_share, pre_evalu_share, coust_full_name, 
        coust_acco, coust_acco_name, warn_posi_value, close_posi_value, 
        target_posi_ratio, beta_coeffi, custom_pd_class, index_value, 
        remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pd_no, v_co_no, 
        v_pd_code, v_pd_name, v_pd_flname, v_fund_reg_code, 
        v_pd_manager, v_found_date, v_pd_type, v_apply_currency, 
        v_crncy_type, v_first_asset, v_first_amt, v_pd_all_share, 
        v_curr_share, v_pre_share, v_his_max_per_nav, v_pre_nav, 
        v_begin_NAV, v_evalu_share, v_pre_evalu_share, v_coust_full_name, 
        v_coust_acco, v_coust_acco_name, v_warn_posi_value, v_close_posi_value, 
        v_target_posi_ratio, v_beta_coeffi, v_custom_pd_class, v_index_value, 
        v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.1.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编码=",v_pd_code),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量]; */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_pd_no, "|", v_co_no, "|", v_pd_code, "|", v_pd_name, "|", v_pd_flname, "|", v_fund_reg_code, "|", v_pd_manager, "|", v_found_date, "|", v_pd_type, "|", v_apply_currency, "|", v_crncy_type, "|", v_first_asset, "|", v_first_amt, "|", v_pd_all_share, "|", v_curr_share, "|", v_pre_share, "|", v_his_max_per_nav, "|", v_pre_nav, "|", v_coust_full_name, "|", v_coust_acco, "|", v_coust_acco_name, "|", v_warn_posi_value, "|", v_close_posi_value, "|", v_target_posi_ratio, "|", v_beta_coeffi, "|", v_custom_pd_class, "|", v_remark_info, "|", v_index_value, "|", v_menu_no, "|", v_pd_qty_max, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增产品信息"; */
    set v_oper_remark_info = "新增产品信息";

    /* [插入表记录][产品_账户_产品信息流水表][字段][字段变量][5][@机构编号#,@产品编码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.1.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编码=",v_pd_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    #新增单一的记录份额变动流水,20180625

    /* set @流水变动字段#=@当前份额#; */
    set v_jour_occur_field=v_curr_share;

    /* set @流水后信息#=@当前份额#; */
    set v_jour_after_occur_info=v_curr_share;

    /* set @操作备注#="份额变动"; */
    set v_oper_remark_info="份额变动";

    /* [插入表记录][产品_账户_产品信息流水表][字段][字段变量][5][@机构编号#,@产品编码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.1.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编码=",v_pd_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_修改产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_ModiProductInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_ModiProductInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_co_no int,
    IN p_pd_code varchar(32),
    IN p_pd_name varchar(64),
    IN p_pd_flname varchar(255),
    IN p_fund_reg_code varchar(16),
    IN p_pd_manager varchar(32),
    IN p_found_date int,
    IN p_pd_type int,
    IN p_apply_currency varchar(3),
    IN p_crncy_type varchar(3),
    IN p_first_asset decimal(18,4),
    IN p_first_amt decimal(18,4),
    IN p_pd_all_share decimal(18,2),
    IN p_curr_share decimal(18,2),
    IN p_pre_share decimal(18,2),
    IN p_his_max_per_nav decimal(18,4),
    IN p_pre_nav decimal(18,4),
    IN p_coust_full_name varchar(255),
    IN p_coust_acco varchar(16),
    IN p_coust_acco_name varchar(64),
    IN p_warn_posi_value decimal(18,4),
    IN p_close_posi_value decimal(18,4),
    IN p_target_posi_ratio decimal(18,4),
    IN p_beta_coeffi decimal(18,12),
    IN p_custom_pd_class varchar(255),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_init_date int;
    declare v_pd_no int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
    declare v_pd_name varchar(64);
    declare v_pd_flname varchar(255);
    declare v_fund_reg_code varchar(16);
    declare v_pd_manager varchar(32);
    declare v_found_date int;
    declare v_pd_type int;
    declare v_apply_currency varchar(3);
    declare v_crncy_type varchar(3);
    declare v_first_asset decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_pd_all_share decimal(18,2);
    declare v_curr_share decimal(18,2);
    declare v_pre_share decimal(18,2);
    declare v_his_max_per_nav decimal(18,4);
    declare v_pre_nav decimal(18,4);
    declare v_coust_full_name varchar(255);
    declare v_coust_acco varchar(16);
    declare v_coust_acco_name varchar(64);
    declare v_warn_posi_value decimal(18,4);
    declare v_close_posi_value decimal(18,4);
    declare v_target_posi_ratio decimal(18,4);
    declare v_beta_coeffi decimal(18,12);
    declare v_custom_pd_class varchar(255);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_tmp_curr_share decimal(18,2);
    declare v_pd_update_times int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_pd_code = p_pd_code;
    SET v_pd_name = p_pd_name;
    SET v_pd_flname = p_pd_flname;
    SET v_fund_reg_code = p_fund_reg_code;
    SET v_pd_manager = p_pd_manager;
    SET v_found_date = p_found_date;
    SET v_pd_type = p_pd_type;
    SET v_apply_currency = p_apply_currency;
    SET v_crncy_type = p_crncy_type;
    SET v_first_asset = p_first_asset;
    SET v_first_amt = p_first_amt;
    SET v_pd_all_share = p_pd_all_share;
    SET v_curr_share = p_curr_share;
    SET v_pre_share = p_pre_share;
    SET v_his_max_per_nav = p_his_max_per_nav;
    SET v_pre_nav = p_pre_nav;
    SET v_coust_full_name = p_coust_full_name;
    SET v_coust_acco = p_coust_acco;
    SET v_coust_acco_name = p_coust_acco_name;
    SET v_warn_posi_value = p_warn_posi_value;
    SET v_close_posi_value = p_close_posi_value;
    SET v_target_posi_ratio = p_target_posi_ratio;
    SET v_beta_coeffi = p_beta_coeffi;
    SET v_custom_pd_class = p_custom_pd_class;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_tmp_curr_share = 0;
    SET v_pd_update_times = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "产品编号", "|", "机构编号", "|", "产品编码", "|", "产品名称", "|", "产品全称", "|", "基金备案编号", "|", "产品管理人", "|", "成立日期", "|", "产品类型", "|", "募集币种", "|", "本币币种", "|", "原始资产", "|", "原始金额", "|", "产品总份额", "|", "当前份额", "|", "昨日份额", "|", "历史最高单位净值", "|", "昨日净值", "|", "境内托管人全名", "|", "境内托管账户", "|", "境内托管账户名", "|", "预警线", "|", "平仓线", "|", "目标仓位", "|", "beta系数", "|", "自定义产品分类", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_pd_no, "|", v_co_no, "|", v_pd_code, "|", v_pd_name, "|", v_pd_flname, "|", v_fund_reg_code, "|", v_pd_manager, "|", v_found_date, "|", v_pd_type, "|", v_apply_currency, "|", v_crncy_type, "|", v_first_asset, "|", v_first_amt, "|", v_pd_all_share, "|", v_curr_share, "|", v_pre_share, "|", v_his_max_per_nav, "|", v_pre_nav, "|", v_coust_full_name, "|", v_coust_acco, "|", v_coust_acco_name, "|", v_warn_posi_value, "|", v_close_posi_value, "|", v_target_posi_ratio, "|", v_beta_coeffi, "|", v_custom_pd_class, "|", v_remark_info, "|", v_menu_no, "|");


    /* [获取表记录变量][产品_账户_产品信息表][{当前份额},{更新次数}][@临时_当前份额#,@产品更新次数#][{产品编号}=@产品编号#][4][@产品编号#] */
    select curr_share,update_times into v_tmp_curr_share,v_pd_update_times from db_prod.tb_pdacco_pd_info where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.2.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品_账户_产品信息表][{产品名称}=@产品名称#,{产品全称}=@产品全称#,{基金备案编号}=@基金备案编号#,{产品管理人}=@产品管理人#,{成立日期}=@成立日期#,{产品类型}=@产品类型#,{募集币种}=@募集币种#,{本币币种}=@本币币种#,{原始资产}=@原始资产#,{原始金额}=@原始金额#,{产品总份额}=@产品总份额#,{当前份额}=@当前份额#,{昨日份额}=@昨日份额#,{历史最高单位净值}=@历史最高单位净值#,{昨日净值}=@昨日净值#,{境内托管人全名}=@境内托管人全名#,{境内托管账户}=@境内托管账户#,{境内托管账户名}=@境内托管账户名#,{预警线}=@预警线#,{平仓线}=@平仓线#,{目标仓位}=@目标仓位#,{beta系数}=@beta系数#,{自定义产品分类}=@自定义产品分类#,{备注信息}=@备注信息#][{产品编号}=@产品编号#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_pd_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_name=v_pd_name,pd_flname=v_pd_flname,fund_reg_code=v_fund_reg_code,pd_manager=v_pd_manager,found_date=v_found_date,pd_type=v_pd_type,apply_currency=v_apply_currency,crncy_type=v_crncy_type,first_asset=v_first_asset,first_amt=v_first_amt,pd_all_share=v_pd_all_share,curr_share=v_curr_share,pre_share=v_pre_share,his_max_per_nav=v_his_max_per_nav,pre_nav=v_pre_nav,coust_full_name=v_coust_full_name,coust_acco=v_coust_acco,coust_acco_name=v_coust_acco_name,warn_posi_value=v_warn_posi_value,close_posi_value=v_close_posi_value,target_posi_ratio=v_target_posi_ratio,beta_coeffi=v_beta_coeffi,custom_pd_class=v_custom_pd_class,remark_info=v_remark_info where pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.2.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #[获取表记录变量][产品_账户_产品信息表][{更新次数}][@产品更新次数#][{产品编号}=@产品编号#][4][@产品编号#]

    /* set @产品更新次数#=@产品更新次数#+1; */
    set v_pd_update_times=v_pd_update_times+1;

    /* [获取流水后信息][字段变量]; */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_pd_no, "|", v_co_no, "|", v_pd_code, "|", v_pd_name, "|", v_pd_flname, "|", v_fund_reg_code, "|", v_pd_manager, "|", v_found_date, "|", v_pd_type, "|", v_apply_currency, "|", v_crncy_type, "|", v_first_asset, "|", v_first_amt, "|", v_pd_all_share, "|", v_curr_share, "|", v_pre_share, "|", v_his_max_per_nav, "|", v_pre_nav, "|", v_coust_full_name, "|", v_coust_acco, "|", v_coust_acco_name, "|", v_warn_posi_value, "|", v_close_posi_value, "|", v_target_posi_ratio, "|", v_beta_coeffi, "|", v_custom_pd_class, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改产品信息"; */
    set v_oper_remark_info = "修改产品信息";

    /* [插入表记录][产品_账户_产品信息流水表][字段][字段变量][5][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.2.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #新增单一的记录份额变动流水,20180625

    /* if @当前份额#<>@临时_当前份额# then */
    if v_curr_share<>v_tmp_curr_share then

        /* set @流水变动字段#=@当前份额#-@临时_当前份额#; */
        set v_jour_occur_field=v_curr_share-v_tmp_curr_share;

        /* set @流水后信息#=@当前份额#; */
        set v_jour_after_occur_info=v_curr_share;

        /* set @操作备注#="份额变动"; */
        set v_oper_remark_info="份额变动";

        /* [插入表记录][产品_账户_产品信息流水表][字段][字段变量][5][@机构编号#,@产品编码#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdacco_pd_info_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.1.2.5";
            SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编码=",v_pd_code),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;

    /* set @更新次数# = @产品更新次数#; */
    set v_update_times = v_pd_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryProductInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryProductInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_type int,
    IN p_pd_status_str varchar(64),
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
    declare v_pd_type int;
    declare v_pd_status_str varchar(64);
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
    SET v_pd_type = p_pd_type;
    SET v_pd_status_str = p_pd_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录两表关联][产品_账户_产品信息表][产品_账户_产品限制信息表][a.{记录序号},a.{创建日期},a.{创建时间},a.{更新日期},a.{更新时间},a.{产品编号},a.{机构编号},a.{产品编码},a.{产品名称},a.{产品全称},a.{基金备案编号},a.{产品管理人},a.{成立日期},a.{产品类型},a.{募集币种},a.{本币币种},a.{原始资产},a.{原始金额},a.{产品总份额},a.{当前份额},a.{昨日份额},a.{历史最高单位净值},a.{昨日净值},a.{境内托管人全名},a.{境内托管账户},a.{境内托管账户名},a.{预警线},a.{平仓线},a.{目标仓位},a.{beta系数},a.{自定义产品分类},a.{备注信息},a.{索引值},b.{产品状态}][a.{产品编号}=b.{产品编号} and  (@机构编号# = 0 or a.{机构编号}=@机构编号#) and (@产品编号# = 0 or a.{产品编号}=@产品编号#) and (@产品类型# = 0 or a.{产品类型}=@产品类型#) and (@产品编号权限串#=' ' or instr(@产品编号权限串#, concat(";",a.{产品编号},";")) > 0) and (@产品状态串# = "; ;" or instr(@产品状态串#, concat(";",b.{产品状态},";")) > 0) and a.{记录序号} > @记录序号# order by a.{记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select a.row_id,a.create_date,a.create_time,a.update_date,a.update_time,a.pd_no,a.co_no,a.pd_code,a.pd_name,a.pd_flname,a.fund_reg_code,a.pd_manager,a.found_date,a.pd_type,a.apply_currency,a.crncy_type,a.first_asset,a.first_amt,a.pd_all_share,a.curr_share,a.pre_share,a.his_max_per_nav,a.pre_nav,a.coust_full_name,a.coust_acco,a.coust_acco_name,a.warn_posi_value,a.close_posi_value,a.target_posi_ratio,a.beta_coeffi,a.custom_pd_class,a.remark_info,a.index_value,b.pd_status from db_prod.tb_pdacco_pd_info a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and  (v_co_no = 0 or a.co_no=v_co_no) and (v_pd_no = 0 or a.pd_no=v_pd_no) and (v_pd_type = 0 or a.pd_type=v_pd_type) and (v_pd_no_rights_str=' ' or instr(v_pd_no_rights_str, concat(";",a.pd_no,";")) > 0) and (v_pd_status_str = "; ;" or instr(v_pd_status_str, concat(";",b.pd_status,";")) > 0) and a.row_id > v_row_id order by a.row_id;
    else
        select a.row_id,a.create_date,a.create_time,a.update_date,a.update_time,a.pd_no,a.co_no,a.pd_code,a.pd_name,a.pd_flname,a.fund_reg_code,a.pd_manager,a.found_date,a.pd_type,a.apply_currency,a.crncy_type,a.first_asset,a.first_amt,a.pd_all_share,a.curr_share,a.pre_share,a.his_max_per_nav,a.pre_nav,a.coust_full_name,a.coust_acco,a.coust_acco_name,a.warn_posi_value,a.close_posi_value,a.target_posi_ratio,a.beta_coeffi,a.custom_pd_class,a.remark_info,a.index_value,b.pd_status from db_prod.tb_pdacco_pd_info a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and  (v_co_no = 0 or a.co_no=v_co_no) and (v_pd_no = 0 or a.pd_no=v_pd_no) and (v_pd_type = 0 or a.pd_type=v_pd_type) and (v_pd_no_rights_str=' ' or instr(v_pd_no_rights_str, concat(";",a.pd_no,";")) > 0) and (v_pd_status_str = "; ;" or instr(v_pd_status_str, concat(";",b.pd_status,";")) > 0) and a.row_id > v_row_id order by a.row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询历史产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryProductInfo_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryProductInfo_His(
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
    IN p_pd_type int,
    IN p_pd_status_str varchar(64),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_type int;
    declare v_pd_status_str varchar(64);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_type = p_pd_type;
    SET v_pd_status_str = p_pd_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录两表关联][产品_账户_历史产品信息表][产品_账户_产品限制信息表][a.{初始化日期},a.{产品编号},a.{机构编号},a.{产品编码},a.{产品名称},a.{产品全称},a.{基金备案编号},a.{产品管理人},a.{成立日期},a.{产品类型},a.{募集币种},a.{本币币种},a.{原始资产},a.{原始金额},a.{产品总份额},a.{当前份额},a.{昨日份额},a.{历史最高单位净值},a.{昨日净值},a.{境内托管人全名},a.{境内托管账户},a.{境内托管账户名},a.{备注信息},a.{索引值},b.{产品状态}][a.{产品编号}=b.{产品编号} and ({初始化日期} between @开始日期# and @结束日期#) and a.{机构编号}=@机构编号# and (@产品类型# = 0 or a.{产品类型}=@产品类型#) and instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0 and (@产品状态串# = "; ;" or instr(@产品状态串#, b.{产品状态}) > 0) and a.{记录序号} > @记录序号# order by a.{记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select a.init_date,a.pd_no,a.co_no,a.pd_code,a.pd_name,a.pd_flname,a.fund_reg_code,a.pd_manager,a.found_date,a.pd_type,a.apply_currency,a.crncy_type,a.first_asset,a.first_amt,a.pd_all_share,a.curr_share,a.pre_share,a.his_max_per_nav,a.pre_nav,a.coust_full_name,a.coust_acco,a.coust_acco_name,a.remark_info,a.index_value,b.pd_status from db_prod_his.tb_pdacco_pd_info_his a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and (init_date between v_begin_date and v_end_date) and a.co_no=v_co_no and (v_pd_type = 0 or a.pd_type=v_pd_type) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_pd_status_str = "; ;" or instr(v_pd_status_str, b.pd_status) > 0) and a.row_id > v_row_id order by a.row_id;
    else
        select a.init_date,a.pd_no,a.co_no,a.pd_code,a.pd_name,a.pd_flname,a.fund_reg_code,a.pd_manager,a.found_date,a.pd_type,a.apply_currency,a.crncy_type,a.first_asset,a.first_amt,a.pd_all_share,a.curr_share,a.pre_share,a.his_max_per_nav,a.pre_nav,a.coust_full_name,a.coust_acco,a.coust_acco_name,a.remark_info,a.index_value,b.pd_status from db_prod_his.tb_pdacco_pd_info_his a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and (init_date between v_begin_date and v_end_date) and a.co_no=v_co_no and (v_pd_type = 0 or a.pd_type=v_pd_type) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_pd_status_str = "; ;" or instr(v_pd_status_str, b.pd_status) > 0) and a.row_id > v_row_id order by a.row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询产品信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryProductInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryProductInfoJour(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_账户_产品信息流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_prod.tb_pdacco_pd_info_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_prod.tb_pdacco_pd_info_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询历史产品信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryProductInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryProductInfoJour_His(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品_账户_产品信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_prod_his.tb_pdacco_pd_info_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_prod_his.tb_pdacco_pd_info_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_更新产品状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_UpdateProductStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_UpdateProductStatus(
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
    IN p_pd_status varchar(2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_cost_calc_type int,
    OUT p_pd_market_price_ratio decimal(18,12),
    OUT p_pd_comm_no_limit_price_ratio decimal(18,12),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_status varchar(2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_cost_calc_type int;
    declare v_pd_market_price_ratio decimal(18,12);
    declare v_pd_comm_no_limit_price_ratio decimal(18,12);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_abolish_date int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_pd_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_pd_status = p_pd_status;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_cost_calc_type = 0;
    SET v_pd_market_price_ratio = 0;
    SET v_pd_comm_no_limit_price_ratio = 0;
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_abolish_date = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_pd_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取流水变动][{产品状态}][@产品状态#] */
    set v_jour_occur_field = concat("产品状态","|");
    set v_jour_occur_info = concat(v_pd_status,"|");


    /* if @产品状态# <> 《产品状态-注销》 then */
    if v_pd_status <> "3" then

        /* set @注销日期# = 0; */
        set v_abolish_date = 0;
    else

        /* set @注销日期# = @初始化日期#; */
        set v_abolish_date = v_init_date;
    end if;

    /* [更新表记录][产品_账户_产品限制信息表][{产品状态}=@产品状态#,{注销日期}=@注销日期#][{产品编号}=@产品编号#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_pd_limit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_status=v_pd_status,abolish_date=v_abolish_date where pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.8.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_产品限制信息表][{成本计算方式},{市价冻结浮动比例},{指令不限价浮动比例},{更新次数}][@产品成本计算方式#,@产品市价冻结浮动比例#,@产品指令不限价浮动比例#,@产品更新次数#][{产品编号}=@产品编号#][4][@产品编号#] */
    select cost_calc_type,market_price_ratio,comm_no_limit_price_ratio,update_times into v_pd_cost_calc_type,v_pd_market_price_ratio,v_pd_comm_no_limit_price_ratio,v_pd_update_times from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.8.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@产品状态#]; */
    set v_jour_after_occur_info = concat(v_pd_status,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品_账户_产品信息流水表][字段][字段变量][5][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.8.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @产品更新次数#; */
    set v_update_times = v_pd_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_cost_calc_type = v_pd_cost_calc_type;
    SET p_pd_market_price_ratio = v_pd_market_price_ratio;
    SET p_pd_comm_no_limit_price_ratio = v_pd_comm_no_limit_price_ratio;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_更新产品份额变动量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_UpdateProductShareOcurr;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_UpdateProductShareOcurr(
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
    IN p_occur_share decimal(18,2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_code varchar(32),
    OUT p_pd_name varchar(64),
    OUT p_pd_type int,
    OUT p_pd_apply_currency varchar(3),
    OUT p_pd_crncy_type varchar(3),
    OUT p_pd_first_asset decimal(18,4),
    OUT p_pd_all_share decimal(18,2),
    OUT p_pd_curr_share decimal(18,2),
    OUT p_pd_pre_share decimal(18,2),
    OUT p_pd_his_max_per_nav decimal(18,4),
    OUT p_pd_pre_nav decimal(18,4),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_occur_share decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_code varchar(32);
    declare v_pd_name varchar(64);
    declare v_pd_type int;
    declare v_pd_apply_currency varchar(3);
    declare v_pd_crncy_type varchar(3);
    declare v_pd_first_asset decimal(18,4);
    declare v_pd_all_share decimal(18,2);
    declare v_pd_curr_share decimal(18,2);
    declare v_pd_pre_share decimal(18,2);
    declare v_pd_his_max_per_nav decimal(18,4);
    declare v_pd_pre_nav decimal(18,4);
    declare v_update_times int;
    declare v_curr_share decimal(18,2);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_pd_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_occur_share = p_occur_share;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_code = " ";
    SET v_pd_name = " ";
    SET v_pd_type = 0;
    SET v_pd_apply_currency = "CNY";
    SET v_pd_crncy_type = "CNY";
    SET v_pd_first_asset = 0;
    SET v_pd_all_share = 0;
    SET v_pd_curr_share = 0;
    SET v_pd_pre_share = 0;
    SET v_pd_his_max_per_nav = 0;
    SET v_pd_pre_nav = 0;
    SET v_update_times = 1;
    SET v_curr_share = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_pd_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_产品信息表][{当前份额}][@当前份额#][{产品编号}=@产品编号#][2][@产品编号#] */
    select curr_share into v_curr_share from db_prod.tb_pdacco_pd_info where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.9.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@当前份额#+@变动份额#<0][84][@当前份额#,@变动份额#] */
    if v_curr_share+v_occur_share<0 then
        
        SET v_error_code = "prodA.1.9.84";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("当前份额=",v_curr_share,",","变动份额=",v_occur_share),"#",v_mysql_message);
        else
            SET v_error_info = concat("当前份额=",v_curr_share,",","变动份额=",v_occur_share);
        end if;
        leave label_pro;
    end if;


    /* [获取流水变动][{变动份额},{产品总份额},{当前份额}][@变动份额#,@产品总份额#,@当前份额#] */
    set v_jour_occur_field = concat("变动份额","|","产品总份额","|","当前份额","|");
    set v_jour_occur_info = concat(v_occur_share,"|",v_pd_all_share,"|",v_curr_share,"|");


    /* [更新表记录][产品_账户_产品信息表][{当前份额}={当前份额}+@变动份额#,{产品总份额}={产品总份额}+@变动份额#][{产品编号}=@产品编号#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_pd_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_share=curr_share+v_occur_share,pd_all_share=pd_all_share+v_occur_share where pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.9.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_产品信息表][{产品总份额},{当前份额},{产品编码},{产品名称},{产品类型},{募集币种},{本币币种},{原始资产},{产品总份额},{当前份额},{昨日份额},{历史最高单位净值},{昨日净值},{更新次数}][@产品总份额#,@当前份额#,@产品编码#,@产品名称#,@产品类型#,@产品募集币种#,@产品本币币种#,@产品原始资产#,@产品总份额#,@产品当前份额#,@产品昨日份额#,@产品历史最高单位净值#,@产品昨日净值#,@产品更新次数#][{产品编号}=@产品编号#][2][@产品编号#] */
    select pd_all_share,curr_share,pd_code,pd_name,pd_type,apply_currency,crncy_type,first_asset,pd_all_share,curr_share,pre_share,his_max_per_nav,pre_nav,update_times into v_pd_all_share,v_curr_share,v_pd_code,v_pd_name,v_pd_type,v_pd_apply_currency,v_pd_crncy_type,v_pd_first_asset,v_pd_all_share,v_pd_curr_share,v_pd_pre_share,v_pd_his_max_per_nav,v_pd_pre_nav,v_pd_update_times from db_prod.tb_pdacco_pd_info where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.9.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@变动份额#,@产品总份额#,@当前份额#] */
    set v_jour_after_occur_info = concat(v_occur_share,"|",v_pd_all_share,"|",v_curr_share,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品_账户_产品信息流水表][字段][字段变量][5][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.9.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #单独对当前份额这个字段记录流水,20180625

     /* set @流水变动字段#=@变动份额#; */
     set v_jour_occur_field=v_occur_share;

    /* set @流水后信息#=@当前份额#; */
    set v_jour_after_occur_info=v_curr_share;

    /* set @操作备注#="份额变动"; */
    set v_oper_remark_info="份额变动";

    /* [插入表记录][产品_账户_产品信息流水表][字段][字段变量][5][@机构编号#,@产品编码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.9.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编码=",v_pd_code),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @产品更新次数#; */
    set v_update_times = v_pd_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_code = v_pd_code;
    SET p_pd_name = v_pd_name;
    SET p_pd_type = v_pd_type;
    SET p_pd_apply_currency = v_pd_apply_currency;
    SET p_pd_crncy_type = v_pd_crncy_type;
    SET p_pd_first_asset = v_pd_first_asset;
    SET p_pd_all_share = v_pd_all_share;
    SET p_pd_curr_share = v_pd_curr_share;
    SET p_pd_pre_share = v_pd_pre_share;
    SET p_pd_his_max_per_nav = v_pd_his_max_per_nav;
    SET p_pd_pre_nav = v_pd_pre_nav;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_检查产品存在
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_CheckProductExists;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_CheckProductExists(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_code varchar(32),
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
    declare v_pd_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;

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
    SET v_pd_code = p_pd_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [记录已存在][产品_账户_产品信息表][@记录个数#][{机构编号}=@机构编号# and {产品编码}=@产品编码#][104][@机构编号#,@产品编码#] */
    select count(1) into v_record_count from db_prod.tb_pdacco_pd_info where co_no=v_co_no and pd_code=v_pd_code limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "prodA.1.11.104";
        SET v_error_info = concat("机构编号=",v_co_no,",","产品编码=",v_pd_code);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询全部产品列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryAllProductList;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryAllProductList(
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
    declare v_co_no int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录两表关联][产品_账户_产品信息表][产品_账户_产品限制信息表][a.{产品编号},a.{机构编号},a.{产品编码},a.{产品名称},b.{产品状态}][a.{产品编号}=b.{产品编号} and a.{机构编号}=@机构编号#][@指定行数#] */
    if v_row_count = -1 then
        select a.pd_no,a.co_no,a.pd_code,a.pd_name,b.pd_status from db_prod.tb_pdacco_pd_info a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and a.co_no=v_co_no;
    else
        select a.pd_no,a.co_no,a.pd_code,a.pd_name,b.pd_status from db_prod.tb_pdacco_pd_info a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and a.co_no=v_co_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询可见产品列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryRightsProductList;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryRightsProductList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_pd_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
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
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录两表关联][产品_账户_产品信息表][产品_账户_产品限制信息表][a.{产品编号},a.{机构编号},a.{产品编码},a.{产品名称},a.{产品全称},b.{产品状态},b.{业务控制配置串} as {产品业务控制配置串},b.{指令不限价浮动比例}][a.{产品编号}=b.{产品编号} and a.{机构编号}=@机构编号# and instr(@产品编号权限串#, concat(";", a.{产品编号},";")) > 0 and b.{产品状态}=《产品状态-正常》][@指定行数#] */
    if v_row_count = -1 then
        select a.pd_no,a.co_no,a.pd_code,a.pd_name,a.pd_flname,b.pd_status,b.busi_config_str as pd_busi_config_str,b.comm_no_limit_price_ratio from db_prod.tb_pdacco_pd_info a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and a.co_no=v_co_no and instr(v_pd_no_rights_str, concat(";", a.pd_no,";")) > 0 and b.pd_status="1";
    else
        select a.pd_no,a.co_no,a.pd_code,a.pd_name,a.pd_flname,b.pd_status,b.busi_config_str as pd_busi_config_str,b.comm_no_limit_price_ratio from db_prod.tb_pdacco_pd_info a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and a.co_no=v_co_no and instr(v_pd_no_rights_str, concat(";", a.pd_no,";")) > 0 and b.pd_status="1" limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询产品历史最高单位净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryProductHisHighUnitNetValue;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryProductHisHighUnitNetValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_crncy_type varchar(3),
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
    declare v_crncy_type varchar(3);
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
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_账户_产品信息表][{机构编号},{产品编号},{产品编码},{产品名称},{历史最高单位净值},{本币币种}][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@本币币种# = " " or {本币币种} = @本币币种#)  and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select co_no,pd_no,pd_code,pd_name,his_max_per_nav,crncy_type from db_prod.tb_pdacco_pd_info where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_crncy_type = " " or crncy_type = v_crncy_type)  and row_id > v_row_id order by row_id;
    else
        select co_no,pd_no,pd_code,pd_name,his_max_per_nav,crncy_type from db_prod.tb_pdacco_pd_info where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_crncy_type = " " or crncy_type = v_crncy_type)  and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_新增产品限制信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_AddProductLimit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_AddProductLimit(
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
    IN p_cost_calc_type int,
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_busi_config_str varchar(64),
    IN p_comm_appr_oper int,
    IN p_market_price_ratio decimal(18,12),
    IN p_forbid_order_dir varchar(64),
    IN p_comm_no_limit_price_ratio decimal(18,12),
    IN p_menu_no int,
    IN p_hk_asset_calc_rate int,
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
    declare v_cost_calc_type int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_config_str varchar(64);
    declare v_comm_appr_oper int;
    declare v_market_price_ratio decimal(18,12);
    declare v_forbid_order_dir varchar(64);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_menu_no int;
    declare v_hk_asset_calc_rate int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_abolish_date int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_row_id bigint;
    declare v_pd_status varchar(2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);

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
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_busi_config_str = p_busi_config_str;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_forbid_order_dir = p_forbid_order_dir;
    SET v_comm_no_limit_price_ratio = p_comm_no_limit_price_ratio;
    SET v_menu_no = p_menu_no;
    SET v_hk_asset_calc_rate = p_hk_asset_calc_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_abolish_date = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_row_id = 0;
    SET v_pd_status = "0";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* set @注销日期# = 0; */
    set v_abolish_date = 0;

    /* if @成本计算方式# = 0 then */
    if v_cost_calc_type = 0 then

        /* set @成本计算方式# = 《成本计算方式-盈亏冲减成本》; */
        set v_cost_calc_type = 1;
    end if;

    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "成本计算方式", "|", "允许投资市场", "|", "允许操作证券类型", "|", "业务控制配置串", "|", "指令审批操作员", "|", "市价冻结浮动比例", "|", "禁止订单方向", "|", "指令不限价浮动比例", "|", "菜单编号", "|", "港股通资产计算采用汇率", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_cost_calc_type, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_busi_config_str, "|", v_comm_appr_oper, "|", v_market_price_ratio, "|", v_forbid_order_dir, "|", v_comm_no_limit_price_ratio, "|", v_menu_no, "|", v_hk_asset_calc_rate, "|");


    /* [获取表记录变量][产品_账户_产品信息表][{记录序号}][@记录序号#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][4][@机构编号#,@产品编号#] */
    select row_id into v_row_id from db_prod.tb_pdacco_pd_info where co_no=v_co_no and pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.21.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @业务控制配置串# = concat(left(@业务控制配置串#, 23),@港股通资产计算采用汇率#,right(@业务控制配置串#,LENGTH(@业务控制配置串#)-24)); */
    set v_busi_config_str = concat(left(v_busi_config_str, 23),v_hk_asset_calc_rate,right(v_busi_config_str,LENGTH(v_busi_config_str)-24));

    /* set @产品状态# = 《产品状态-正常》; */
    set v_pd_status = "1";

    /* [插入表记录][产品_账户_产品限制信息表][字段][字段变量][1][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_limit(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        cost_calc_type, allow_exch, allow_stock_type, busi_config_str, 
        comm_appr_oper, market_price_ratio, forbid_order_dir, pd_status, 
        comm_no_limit_price_ratio, abolish_date) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_cost_calc_type, v_allow_exch, v_allow_stock_type, v_busi_config_str, 
        v_comm_appr_oper, v_market_price_ratio, v_forbid_order_dir, v_pd_status, 
        v_comm_no_limit_price_ratio, v_abolish_date);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.21.1";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量]; */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_cost_calc_type, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_busi_config_str, "|", v_comm_appr_oper, "|", v_market_price_ratio, "|", v_forbid_order_dir, "|", v_comm_no_limit_price_ratio, "|", v_menu_no, "|", v_hk_asset_calc_rate, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增产品限制信息"; */
    set v_oper_remark_info = "新增产品限制信息";

    /* [插入表记录][产品_账户_产品限制信息流水表][字段][字段变量][5][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_limit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.21.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_修改产品限制信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_ModiProductLimit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_ModiProductLimit(
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
    IN p_cost_calc_type int,
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_comm_appr_oper int,
    IN p_market_price_ratio decimal(18,12),
    IN p_forbid_order_dir varchar(64),
    IN p_comm_no_limit_price_ratio decimal(18,12),
    IN p_menu_no int,
    IN p_hk_asset_calc_rate int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_status varchar(2),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_cost_calc_type int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_comm_appr_oper int;
    declare v_market_price_ratio decimal(18,12);
    declare v_forbid_order_dir varchar(64);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_menu_no int;
    declare v_hk_asset_calc_rate int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_status varchar(2);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_busi_config_str varchar(64);
    declare v_update_date int;
    declare v_update_time int;
    declare v_pd_market_price_ratio decimal(18,12);
    declare v_pd_comm_no_limit_price_ratio decimal(18,12);
    declare v_pd_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_forbid_order_dir = p_forbid_order_dir;
    SET v_comm_no_limit_price_ratio = p_comm_no_limit_price_ratio;
    SET v_menu_no = p_menu_no;
    SET v_hk_asset_calc_rate = p_hk_asset_calc_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_status = "0";
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_busi_config_str = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_pd_market_price_ratio = 0;
    SET v_pd_comm_no_limit_price_ratio = 0;
    SET v_pd_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "成本计算方式", "|", "允许投资市场", "|", "允许操作证券类型", "|", "指令审批操作员", "|", "市价冻结浮动比例", "|", "禁止订单方向", "|", "指令不限价浮动比例", "|", "菜单编号", "|", "港股通资产计算采用汇率", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_cost_calc_type, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_comm_appr_oper, "|", v_market_price_ratio, "|", v_forbid_order_dir, "|", v_comm_no_limit_price_ratio, "|", v_menu_no, "|", v_hk_asset_calc_rate, "|");


    /* [获取表记录变量][产品_账户_产品限制信息表][{业务控制配置串}][@业务控制配置串#][{产品编号}=@产品编号#][4][@产品编号#] */
    select busi_config_str into v_busi_config_str from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.22.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @业务控制配置串# = concat(left(@业务控制配置串#, 23),@港股通资产计算采用汇率#,right(@业务控制配置串#,LENGTH(@业务控制配置串#)-24)); */
    set v_busi_config_str = concat(left(v_busi_config_str, 23),v_hk_asset_calc_rate,right(v_busi_config_str,LENGTH(v_busi_config_str)-24));

    /* [更新表记录][产品_账户_产品限制信息表][{成本计算方式}=@成本计算方式#, {允许投资市场}=@允许投资市场#, {允许操作证券类型}=@允许操作证券类型#, {指令审批操作员}=@指令审批操作员#, {市价冻结浮动比例}=@市价冻结浮动比例#, {禁止订单方向}=@禁止订单方向#, {指令不限价浮动比例}=@指令不限价浮动比例#,{业务控制配置串}=@业务控制配置串#][{产品编号}=@产品编号#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_pd_limit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cost_calc_type=v_cost_calc_type, allow_exch=v_allow_exch, allow_stock_type=v_allow_stock_type, comm_appr_oper=v_comm_appr_oper, market_price_ratio=v_market_price_ratio, forbid_order_dir=v_forbid_order_dir, comm_no_limit_price_ratio=v_comm_no_limit_price_ratio,busi_config_str=v_busi_config_str where pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_产品限制信息表][{产品状态},{市价冻结浮动比例},{指令不限价浮动比例},{更新次数}][@产品状态#,@产品市价冻结浮动比例#,@产品指令不限价浮动比例#,@产品更新次数#][{产品编号}=@产品编号#][4][@产品编号#] */
    select pd_status,market_price_ratio,comm_no_limit_price_ratio,update_times into v_pd_status,v_pd_market_price_ratio,v_pd_comm_no_limit_price_ratio,v_pd_update_times from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.22.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量]; */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_cost_calc_type, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_comm_appr_oper, "|", v_market_price_ratio, "|", v_forbid_order_dir, "|", v_comm_no_limit_price_ratio, "|", v_menu_no, "|", v_hk_asset_calc_rate, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改产品限制信息"; */
    set v_oper_remark_info = "修改产品限制信息";

    /* [插入表记录][产品_账户_产品限制信息流水表][字段][字段变量][5][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_limit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.22.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @产品更新次数#; */
    set v_update_times = v_pd_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_status = v_pd_status;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询产品限制信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryProductLimit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryProductLimit(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_账户_产品限制信息表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{机构编号},{产品编号},{成本计算方式},{允许投资市场},{允许操作证券类型},{业务控制配置串},{指令审批操作员},{市价冻结浮动比例},{禁止订单方向},{产品状态},{指令不限价浮动比例}," " as {备注信息}][(@机构编号# = 0 or {机构编号}=@机构编号#) and ({产品编号}=@产品编号#) and (@产品编号权限串# = " " or instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,cost_calc_type,allow_exch,allow_stock_type,busi_config_str,comm_appr_oper,market_price_ratio,forbid_order_dir,pd_status,comm_no_limit_price_ratio," " as remark_info from db_prod.tb_pdacco_pd_limit where (v_co_no = 0 or co_no=v_co_no) and (pd_no=v_pd_no) and (v_pd_no_rights_str = " " or instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,cost_calc_type,allow_exch,allow_stock_type,busi_config_str,comm_appr_oper,market_price_ratio,forbid_order_dir,pd_status,comm_no_limit_price_ratio," " as remark_info from db_prod.tb_pdacco_pd_limit where (v_co_no = 0 or co_no=v_co_no) and (pd_no=v_pd_no) and (v_pd_no_rights_str = " " or instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询产品限制信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryProductLimitJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryProductLimitJour(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_账户_产品限制信息流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_prod.tb_pdacco_pd_limit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_prod.tb_pdacco_pd_limit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询历史产品限制信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryProductLimitJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryProductLimitJour_His(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品_账户_产品限制信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_prod_his.tb_pdacco_pd_limit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_prod_his.tb_pdacco_pd_limit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_修改产品业务控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_UpdateProdBusiConfigStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_UpdateProdBusiConfigStr(
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
    IN p_config_index int,
    IN p_config_value varchar(2048),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_busi_config_str varchar(64),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_config_index int;
    declare v_config_value varchar(2048);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_config_str varchar(64);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_config_index = p_config_index;
    SET v_config_value = p_config_value;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_config_str = " ";
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取流水变动][{配置位},{配置值},{业务控制配置串}][@配置位#,@配置值#,@业务控制配置串#] */
    set v_jour_occur_field = concat("配置位","|","配置值","|","业务控制配置串","|");
    set v_jour_occur_info = concat(v_config_index,"|",v_config_value,"|",v_busi_config_str,"|");


    /* [锁定获取表记录变量][产品_账户_产品限制信息表][{业务控制配置串}][@业务控制配置串#][{产品编号}=@产品编号#][4][@产品编号#] */
    select busi_config_str into v_busi_config_str from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.27.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @业务控制配置串# = concat(left(@业务控制配置串#, @配置位#-1), left(@配置值#,1), right(@业务控制配置串#,LENGTH(@业务控制配置串#)-@配置位#)); */
    set v_busi_config_str = concat(left(v_busi_config_str, v_config_index-1), left(v_config_value,1), right(v_busi_config_str,LENGTH(v_busi_config_str)-v_config_index));

    /* [更新表记录][产品_账户_产品限制信息表][{业务控制配置串}=@业务控制配置串#][{产品编号}=@产品编号#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_pd_limit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, busi_config_str=v_busi_config_str where pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.27.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@配置位#,@配置值#,@业务控制配置串#] */
    set v_jour_after_occur_info = concat(v_config_index,"|",v_config_value,"|",v_busi_config_str,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品_账户_产品限制信息流水表][字段][字段变量][5][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_limit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.27.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取表记录变量语句][产品_账户_产品限制信息表][{业务控制配置串},{更新次数}][@业务控制配置串#,@更新次数#][{产品编号}=@产品编号#] */
    select busi_config_str,update_times into v_busi_config_str,v_update_times from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_config_str = v_busi_config_str;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_修改产品禁止订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_UpdatePdForbidOrderDir;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_UpdatePdForbidOrderDir(
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
    IN p_order_dir_str varchar(1024),
    IN p_menu_no int,
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
    declare v_order_dir_str varchar(1024);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_forbid_order_dir varchar(64);
    declare v_tmp_order_dir_str varchar(1024);
    declare v_count_num int;
    declare v_tmp_count_num int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_forbid_order_dir = " ";
    SET v_tmp_order_dir_str = " ";
    SET v_count_num = 0;
    SET v_tmp_count_num = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [检查正常返回][@订单方向串#=" "] */
    if v_order_dir_str=" " then
        leave label_pro;
    end if;


    /* [获取流水变动][{禁止订单方向}][@禁止订单方向#]; */
    set v_jour_occur_field = concat("禁止订单方向","|");
    set v_jour_occur_info = concat(v_forbid_order_dir,"|");


    /* [锁定获取表记录变量][产品_账户_产品限制信息表][{禁止订单方向}][@禁止订单方向#][{产品编号}=@产品编号#][4][@产品编号#] */
    select forbid_order_dir into v_forbid_order_dir from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.28.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* if @禁止订单方向#=" " then */
    if v_forbid_order_dir=" " then

      /* set @禁止订单方向#=@订单方向串#; */
      set v_forbid_order_dir=v_order_dir_str;
    else

      /* if instr(@订单方向串#,";")=0 then */
      if instr(v_order_dir_str,";")=0 then

        /* if instr(concat(";",@禁止订单方向#,";") , concat(";",@订单方向串#,";"))=0 then */
        if instr(concat(";",v_forbid_order_dir,";") , concat(";",v_order_dir_str,";"))=0 then

          /* set @禁止订单方向#=concat(@禁止订单方向#,";",@订单方向串#); */
          set v_forbid_order_dir=concat(v_forbid_order_dir,";",v_order_dir_str);
        end if;
      else
        loop_label:loop

          /* set @临时_订单方向串#=substring_index(@订单方向串#,";",1); */
          set v_tmp_order_dir_str=substring_index(v_order_dir_str,";",1);

          /* if instr(concat(";",@禁止订单方向#,";") , concat(";",@临时_订单方向串#,";"))=0 then */
          if instr(concat(";",v_forbid_order_dir,";") , concat(";",v_tmp_order_dir_str,";"))=0 then

            /* set @禁止订单方向#=concat(@禁止订单方向#,";",@临时_订单方向串#); */
            set v_forbid_order_dir=concat(v_forbid_order_dir,";",v_tmp_order_dir_str);
          end if;

          /* set @计数值#=INSTR(@订单方向串#,";"); */
          set v_count_num=INSTR(v_order_dir_str,";");

          /* if @计数值#=0 then */
          if v_count_num=0 then

            /* set @临时_计数值#=1; */
            set v_tmp_count_num=1;
          end if;

          /* set @订单方向串#=substring(@订单方向串#,@计数值#+1); */
          set v_order_dir_str=substring(v_order_dir_str,v_count_num+1);

          /* if @临时_计数值#=1 then */
          if v_tmp_count_num=1 then
            leave loop_label;
          end if;
        end loop;
      end if;
    end if;

    /* [更新表记录][产品_账户_产品限制信息表][{禁止订单方向}=@禁止订单方向#][{产品编号}=@产品编号#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_pd_limit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, forbid_order_dir=v_forbid_order_dir where pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.28.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@禁止订单方向#]; */
    set v_jour_after_occur_info = concat(v_forbid_order_dir,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改产品禁止订单方向"; */
    set v_oper_remark_info = "修改产品禁止订单方向";

    /* [插入表记录][产品_账户_产品限制信息流水表][字段][字段变量][5][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_limit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.28.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_修改产品允许订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_UpdatePdAllowOrderDir;;
DELIMITER ;;
CREATE PROCEDURE pra_UpdatePdAllowOrderDir(
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
    IN p_order_dir_str varchar(1024),
    IN p_menu_no int,
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
    declare v_order_dir_str varchar(1024);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_forbid_order_dir varchar(64);
    declare v_tmp_forbid_order_dir varchar(64);
    declare v_tmp_order_dir_str varchar(1024);
    declare v_count_num int;
    declare v_tmp_count_num int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_forbid_order_dir = " ";
    SET v_tmp_forbid_order_dir = " ";
    SET v_tmp_order_dir_str = " ";
    SET v_count_num = 0;
    SET v_tmp_count_num = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [检查正常返回][@订单方向串#=" "] */
    if v_order_dir_str=" " then
        leave label_pro;
    end if;


    /* [获取流水变动][{禁止订单方向}][@禁止订单方向#]; */
    set v_jour_occur_field = concat("禁止订单方向","|");
    set v_jour_occur_info = concat(v_forbid_order_dir,"|");


    /* [锁定获取表记录变量][产品_账户_产品限制信息表][{禁止订单方向}][@禁止订单方向#][{产品编号}=@产品编号#][4][@产品编号#] */
    select forbid_order_dir into v_forbid_order_dir from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.29.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [检查正常返回][@禁止订单方向#=" "] */
    if v_forbid_order_dir=" " then
        leave label_pro;
    end if;


    /* if instr(@禁止订单方向#,";")=0 then */
    if instr(v_forbid_order_dir,";")=0 then

      /* if instr(concat(";",@订单方向串#,";") , concat(";",@禁止订单方向#,";"))>0 then */
      if instr(concat(";",v_order_dir_str,";") , concat(";",v_forbid_order_dir,";"))>0 then

        /* set @禁止订单方向#=" "; */
        set v_forbid_order_dir=" ";
      end if;
    else
      loop_label:loop

        /* set @临时_禁止订单方向#=substring_index(@禁止订单方向#,";",1); */
        set v_tmp_forbid_order_dir=substring_index(v_forbid_order_dir,";",1);

        /* if instr(concat(";",@订单方向串#,";") , concat(";",@临时_禁止订单方向#,";"))=0 then */
        if instr(concat(";",v_order_dir_str,";") , concat(";",v_tmp_forbid_order_dir,";"))=0 then

          /* if @临时_订单方向串#=" " then */
          if v_tmp_order_dir_str=" " then

            /* set @临时_订单方向串#=@临时_禁止订单方向#; */
            set v_tmp_order_dir_str=v_tmp_forbid_order_dir;
          else

            /* set @临时_订单方向串#=concat(@临时_订单方向串#,";",@临时_禁止订单方向#); */
            set v_tmp_order_dir_str=concat(v_tmp_order_dir_str,";",v_tmp_forbid_order_dir);
          end if;
        end if;

        /* set @计数值#=INSTR(@禁止订单方向#,";"); */
        set v_count_num=INSTR(v_forbid_order_dir,";");

        /* if @计数值#=0 then */
        if v_count_num=0 then

          /* set @临时_计数值#=1; */
          set v_tmp_count_num=1;
        end if;

        /* set @禁止订单方向#=substring(@禁止订单方向#,@计数值#+1); */
        set v_forbid_order_dir=substring(v_forbid_order_dir,v_count_num+1);

        /* if @临时_计数值#=1 then */
        if v_tmp_count_num=1 then

          /* set @禁止订单方向#=@临时_订单方向串#; */
          set v_forbid_order_dir=v_tmp_order_dir_str;
          leave loop_label;
        end if;
      end loop;
    end if;

    /* [更新表记录][产品_账户_产品限制信息表][{禁止订单方向}=@禁止订单方向#][{产品编号}=@产品编号#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_pd_limit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, forbid_order_dir=v_forbid_order_dir where pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.29.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@禁止订单方向#]; */
    set v_jour_after_occur_info = concat(v_forbid_order_dir,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改产品允许订单方向"; */
    set v_oper_remark_info = "修改产品允许订单方向";

    /* [插入表记录][产品_账户_产品限制信息流水表][字段][字段变量][5][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_limit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.29.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_检查银行账户存在
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_CheckBankAccoExists;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_CheckBankAccoExists(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_bank_code varchar(32),
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
    declare v_bank_code varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;

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
    SET v_bank_code = p_bank_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [记录已存在][产品_账户_银行账户信息表][@记录个数#][{产品编号}=@产品编号# and {银行代码}=@银行代码#][114][@产品编号#,@银行代码#] */
    select count(1) into v_record_count from db_prod.tb_pdacco_bank_acco where pd_no=v_pd_no and bank_code=v_bank_code limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "prodA.1.30.114";
        SET v_error_info = concat("产品编号=",v_pd_no,",","银行代码=",v_bank_code);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_新增银行账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_AddBankAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_AddBankAccoInfo(
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
    IN p_bank_acco_no int,
    IN p_bank_code varchar(32),
    IN p_bank_name varchar(64),
    IN p_bank_acco varchar(16),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_bank_acco_no int;
    declare v_bank_code varchar(32);
    declare v_bank_name varchar(64);
    declare v_bank_acco varchar(16);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);

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
    SET v_bank_acco_no = p_bank_acco_no;
    SET v_bank_code = p_bank_code;
    SET v_bank_name = p_bank_name;
    SET v_bank_acco = p_bank_acco;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "银行账户编号", "|", "银行代码", "|", "银行名称", "|", "银行账户", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_bank_acco_no, "|", v_bank_code, "|", v_bank_name, "|", v_bank_acco, "|", v_remark_info, "|", v_menu_no, "|");


    /* [插入表记录][产品_账户_银行账户信息表][字段][字段变量][1][@产品编号#,@银行代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_bank_acco(
        create_date, create_time, update_date, 
        update_time, update_times, bank_acco_no, co_no, 
        pd_no, bank_code, bank_name, bank_acco, 
        remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_bank_acco_no, v_co_no, 
        v_pd_no, v_bank_code, v_bank_name, v_bank_acco, 
        v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.31.1";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","银行代码=",v_bank_code),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量]; */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_bank_acco_no, "|", v_bank_code, "|", v_bank_name, "|", v_bank_acco, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增银行账户信息"; */
    set v_oper_remark_info = "新增银行账户信息";

    /* [插入表记录][产品_账户_银行账户信息流水表][字段][字段变量][5][@产品编号#,@银行代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_bank_acco_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, bank_acco_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_bank_acco_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.31.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","银行代码=",v_bank_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_修改银行账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_ModiBankAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_ModiBankAccoInfo(
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
    IN p_bank_acco_no int,
    IN p_bank_name varchar(64),
    IN p_bank_acco varchar(16),
    IN p_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_bank_acco_no int;
    declare v_bank_name varchar(64);
    declare v_bank_acco varchar(16);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_bank_code varchar(32);
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_bank_acco_no = p_bank_acco_no;
    SET v_bank_name = p_bank_name;
    SET v_bank_acco = p_bank_acco;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_bank_code = " ";
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "银行账户编号", "|", "银行名称", "|", "银行账户", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_bank_acco_no, "|", v_bank_name, "|", v_bank_acco, "|", v_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][产品_账户_银行账户信息表][{银行名称}=@银行名称#, {银行账户}=@银行账户#, {备注信息}=@备注信息#][{产品编号}=@产品编号# and {银行账户编号}=@银行账户编号#][2][@产品编号#,@银行账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_bank_acco set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, bank_name=v_bank_name, bank_acco=v_bank_acco, remark_info=v_remark_info where pd_no=v_pd_no and bank_acco_no=v_bank_acco_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.32.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","银行账户编号=",v_bank_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","银行账户编号=",v_bank_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_银行账户信息表][{银行代码}][@银行代码#][{产品编号}=@产品编号# and {银行账户编号}=@银行账户编号#][4][@产品编号#,@银行账户编号#] */
    select bank_code into v_bank_code from db_prod.tb_pdacco_bank_acco where pd_no=v_pd_no and bank_acco_no=v_bank_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.32.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","银行账户编号=",v_bank_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","银行账户编号=",v_bank_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量]; */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_bank_acco_no, "|", v_bank_name, "|", v_bank_acco, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改银行账户信息"; */
    set v_oper_remark_info = "修改银行账户信息";

    /* [插入表记录][产品_账户_银行账户信息流水表][字段][字段变量][5][@产品编号#,@银行账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_bank_acco_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, bank_acco_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_bank_acco_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.32.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","银行账户编号=",v_bank_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_删除银行账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_DeleteBankAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_DeleteBankAccoInfo(
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
    IN p_bank_acco_no int,
    IN p_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_bank_acco_no int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_bank_code varchar(32);
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_bank_acco_no = p_bank_acco_no;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_bank_code = " ";
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @流水变动字段# = " "; */
    set v_jour_occur_field = " ";

    /* set @流水变动信息# = " " ; */
    set v_jour_occur_info = " " ;

    /* [获取表记录变量][产品_账户_银行账户信息表][{银行代码}][@银行代码#][{产品编号}=@产品编号# and {银行账户编号}=@银行账户编号#][4][@产品编号#,@银行账户编号#] */
    select bank_code into v_bank_code from db_prod.tb_pdacco_bank_acco where pd_no=v_pd_no and bank_acco_no=v_bank_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","银行账户编号=",v_bank_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","银行账户编号=",v_bank_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_账户_银行账户信息表][{产品编号}=@产品编号# and {银行账户编号}=@银行账户编号#][3][@产品编号#,@银行账户编号#] */
    delete from db_prod.tb_pdacco_bank_acco 
        where pd_no=v_pd_no and bank_acco_no=v_bank_acco_no;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.1.33.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","银行账户编号=",v_bank_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","银行账户编号=",v_bank_acco_no);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# = " " ; */
    set v_jour_after_occur_info = " " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "删除银行账户信息"; */
    set v_oper_remark_info = "删除银行账户信息";

    /* [插入表记录][产品_账户_银行账户信息流水表][字段][字段变量][5][@产品编号#,@银行账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_bank_acco_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, bank_acco_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_bank_acco_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.33.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","银行账户编号=",v_bank_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询银行账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryBankAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryBankAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_bank_acco_no_str varchar(64),
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
    declare v_bank_acco_no_str varchar(64);
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
    SET v_bank_acco_no_str = p_bank_acco_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_账户_银行账户信息表][字段][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@银行账户编号串# = "; ;" or instr(@银行账户编号串#, concat(";",{银行账户编号},";"))>0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, bank_acco_no, 
        co_no, pd_no, bank_code, bank_name, 
        bank_acco, remark_info from db_prod.tb_pdacco_bank_acco where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_bank_acco_no_str = "; ;" or instr(v_bank_acco_no_str, concat(";",bank_acco_no,";"))>0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, bank_acco_no, 
        co_no, pd_no, bank_code, bank_name, 
        bank_acco, remark_info from db_prod.tb_pdacco_bank_acco where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_bank_acco_no_str = "; ;" or instr(v_bank_acco_no_str, concat(";",bank_acco_no,";"))>0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询银行账户信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryBankAccoInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryBankAccoInfoJour(
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
    IN p_bank_acco_no_str varchar(64),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_bank_acco_no_str varchar(64);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_bank_acco_no_str = p_bank_acco_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_账户_银行账户信息流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@银行账户编号串# = "; ;" or instr(@银行账户编号串#, concat(";",{银行账户编号},";"))>0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, bank_acco_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_prod.tb_pdacco_bank_acco_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_bank_acco_no_str = "; ;" or instr(v_bank_acco_no_str, concat(";",bank_acco_no,";"))>0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, bank_acco_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_prod.tb_pdacco_bank_acco_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_bank_acco_no_str = "; ;" or instr(v_bank_acco_no_str, concat(";",bank_acco_no,";"))>0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询历史银行账户信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryBankAccoInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryBankAccoInfoJour_His(
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
    IN p_bank_acco_no_str varchar(64),
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
    declare v_bank_acco_no_str varchar(64);
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
    SET v_bank_acco_no_str = p_bank_acco_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品_账户_银行账户信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@银行账户编号串# = "; ;" or instr(@银行账户编号串#, concat(";",{银行账户编号},";"))>0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, bank_acco_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_prod_his.tb_pdacco_bank_acco_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_bank_acco_no_str = "; ;" or instr(v_bank_acco_no_str, concat(";",bank_acco_no,";"))>0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, bank_acco_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_prod_his.tb_pdacco_bank_acco_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_bank_acco_no_str = "; ;" or instr(v_bank_acco_no_str, concat(";",bank_acco_no,";"))>0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取银行账户编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetBankAccoNo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetBankAccoNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_bank_code varchar(32),
    IN p_bank_name varchar(64),
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_bank_acco_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_bank_code varchar(32);
    declare v_bank_name varchar(64);
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_bank_acco_no int;

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
    SET v_bank_code = p_bank_code;
    SET v_bank_name = p_bank_name;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_bank_acco_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_银行账户信息表][{银行账户编号}][@银行账户编号#][{银行代码}=@银行代码# and {银行名称}=@银行名称# and {产品编号}=@产品编号#][4][@产品编号#,@银行代码#,@银行名称#] */
    select bank_acco_no into v_bank_acco_no from db_prod.tb_pdacco_bank_acco where bank_code=v_bank_code and bank_name=v_bank_name and pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.37.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","银行代码=",v_bank_code,",","银行名称=",v_bank_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","银行代码=",v_bank_code,",","银行名称=",v_bank_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_bank_acco_no = v_bank_acco_no;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_检查资产账户存在
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_CheckAssetAccoExists;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_CheckAssetAccoExists(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_asset_acco varchar(16),
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
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;

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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco = p_asset_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [记录已存在][产品_账户_资产账户信息表][@记录个数#][{机构编号}=@操作员机构编号# and {资产账户}=@资产账户#][124][@操作员机构编号#,@产品编号#,@资产账户#] */
    select count(1) into v_record_count from db_prod.tb_pdacco_asset_acco where co_no=v_opor_co_no and asset_acco=v_asset_acco limit 1;
    if v_record_count > 0 then
                
        SET v_error_code = "prodA.1.40.124";
        SET v_error_info = concat("操作员机构编号=",v_opor_co_no,",","产品编号=",v_pd_no,",","资产账户=",v_asset_acco);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_新增资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_AddAssetAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_AddAssetAccoInfo(
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
    IN p_asset_acco_no int,
    IN p_asset_acco varchar(16),
    IN p_asset_acco_name varchar(64),
    IN p_asset_acco_type int,
    IN p_out_acco varchar(32),
    IN p_trade_pwd varchar(64),
    IN p_comm_pwd varchar(64),
    IN p_market_price_ratio decimal(18,12),
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_split_fee_typr_str varchar(64),
    IN p_busi_limit_str varchar(2048),
    IN p_exter_comm_flag int,
    IN p_sh_hk_trader_type int,
    IN p_sz_hk_trader_type int,
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    IN p_max_acco_count int,
    IN p_busi_depart varchar(255),
    IN p_syn_update_cost_amt int,
    IN p_exch_group_no int,
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
    declare v_asset_acco_no int;
    declare v_asset_acco varchar(16);
    declare v_asset_acco_name varchar(64);
    declare v_asset_acco_type int;
    declare v_out_acco varchar(32);
    declare v_trade_pwd varchar(64);
    declare v_comm_pwd varchar(64);
    declare v_market_price_ratio decimal(18,12);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_split_fee_typr_str varchar(64);
    declare v_busi_limit_str varchar(2048);
    declare v_exter_comm_flag int;
    declare v_sh_hk_trader_type int;
    declare v_sz_hk_trader_type int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_max_acco_count int;
    declare v_busi_depart varchar(255);
    declare v_syn_update_cost_amt int;
    declare v_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_hk_cash_avail_date_type int;
    declare v_add_pledge_to_bond int;
    declare v_busi_config_str varchar(64);
    declare v_asset_acco_status varchar(2);
    declare v_abolish_date int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_pass_no int;
    declare v_pass_type int;
    declare v_online_status int;
    declare v_config_str varchar(2048);
    declare v_pwd_check_status int;
    declare v_read_flag int;

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_asset_acco = p_asset_acco;
    SET v_asset_acco_name = p_asset_acco_name;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_out_acco = p_out_acco;
    SET v_trade_pwd = p_trade_pwd;
    SET v_comm_pwd = p_comm_pwd;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_split_fee_typr_str = p_split_fee_typr_str;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_sh_hk_trader_type = p_sh_hk_trader_type;
    SET v_sz_hk_trader_type = p_sz_hk_trader_type;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_max_acco_count = p_max_acco_count;
    SET v_busi_depart = p_busi_depart;
    SET v_syn_update_cost_amt = p_syn_update_cost_amt;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_hk_cash_avail_date_type = 0;
    SET v_add_pledge_to_bond = 0;
    SET v_busi_config_str = " ";
    SET v_asset_acco_status = "0";
    SET v_abolish_date = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_pass_no = 0;
    SET v_pass_type = 0;
    SET v_online_status = 0;
    SET v_config_str = " ";
    SET v_pwd_check_status = 0;
    SET v_read_flag = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* [获取表记录数量][产品_账户_资产账户信息表][@记录个数#][{机构编号}=@机构编号# and {资产账户} <> " " and {资产账户状态}<>"3"] */
    select count(1) into v_record_count from db_prod.tb_pdacco_asset_acco where co_no=v_co_no and asset_acco <> " " and asset_acco_status<>"3";


    /* [检查报错返回][@记录个数#>=@账户数量上限# and @账户数量上限#<>0][31][@机构编号#] */
    if v_record_count>=v_max_acco_count and v_max_acco_count<>0 then
        
        SET v_error_code = "prodA.1.41.31";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "资产账户编号", "|", "资产账户", "|", "资产账户名称", "|", "资产账户类型", "|", "外部账号", "|", "交易密码", "|", "通讯密码", "|", "市价冻结浮动比例", "|", "允许投资市场", "|", "允许操作证券类型", "|", "分笔费用类型串", "|", "业务限制串", "|", "体外指令标志", "|", "沪港通交易方式", "|", "深港通交易方式", "|", "备注信息", "|", "菜单编号", "|", "账户数量上限", "|", "营业部", "|", "持仓同步是否更新成本金额", "|", "交易组编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_asset_acco, "|", v_asset_acco_name, "|", v_asset_acco_type, "|", v_out_acco, "|", v_trade_pwd, "|", v_comm_pwd, "|", v_market_price_ratio, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_split_fee_typr_str, "|", v_busi_limit_str, "|", v_exter_comm_flag, "|", v_sh_hk_trader_type, "|", v_sz_hk_trader_type, "|", v_remark_info, "|", v_menu_no, "|", v_max_acco_count, "|", v_busi_depart, "|", v_syn_update_cost_amt, "|", v_exch_group_no, "|");


    /* set @港股通资金可用日期#=5; */
    set v_hk_cash_avail_date_type=5;

    /* set @质押数量累加到债券数量#=1; */
    set v_add_pledge_to_bond=1;

    /* [获取表记录变量][产品_账户_产品限制信息表][{业务控制配置串}][@业务控制配置串#][{产品编号}=@产品编号#][4][@产品编号#] */
    select busi_config_str into v_busi_config_str from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.41.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @业务控制配置串# = concat(left(@业务控制配置串#, 14), @沪港通交易方式#,@深港通交易方式#,substring(@业务控制配置串#,17,1),@持仓同步是否更新成本金额#,@质押数量累加到债券数量#,0,@港股通资金可用日期#,right(@业务控制配置串#,LENGTH(@业务控制配置串#)-21)); */
    set v_busi_config_str = concat(left(v_busi_config_str, 14), v_sh_hk_trader_type,v_sz_hk_trader_type,substring(v_busi_config_str,17,1),v_syn_update_cost_amt,v_add_pledge_to_bond,0,v_hk_cash_avail_date_type,right(v_busi_config_str,LENGTH(v_busi_config_str)-21));

    /* set @资产账户状态# =《资产账户状态-正常》; */
    set v_asset_acco_status ="1";

    /* set @注销日期# =0; */
    set v_abolish_date =0;

    /* [插入表记录][产品_账户_资产账户信息表][字段][字段变量][1][@产品编号#,@资产账户#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_asset_acco(
        create_date, create_time, update_date, 
        update_time, update_times, asset_acco_no, co_no, 
        pd_no, asset_acco, asset_acco_name, asset_acco_type, 
        trade_pwd, asset_acco_status, busi_config_str, market_price_ratio, 
        allow_exch, allow_stock_type, split_fee_typr_str, busi_limit_str, 
        exter_comm_flag, remark_info, busi_depart, abolish_date) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_asset_acco_no, v_co_no, 
        v_pd_no, v_asset_acco, v_asset_acco_name, v_asset_acco_type, 
        v_trade_pwd, v_asset_acco_status, v_busi_config_str, v_market_price_ratio, 
        v_allow_exch, v_allow_stock_type, v_split_fee_typr_str, v_busi_limit_str, 
        v_exter_comm_flag, v_remark_info, v_busi_depart, v_abolish_date);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.41.1";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","资产账户=",v_asset_acco),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量]; */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_asset_acco, "|", v_asset_acco_name, "|", v_asset_acco_type, "|", v_out_acco, "|", v_trade_pwd, "|", v_comm_pwd, "|", v_market_price_ratio, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_split_fee_typr_str, "|", v_busi_limit_str, "|", v_exter_comm_flag, "|", v_sh_hk_trader_type, "|", v_sz_hk_trader_type, "|", v_remark_info, "|", v_menu_no, "|", v_max_acco_count, "|", v_busi_depart, "|", v_syn_update_cost_amt, "|", v_exch_group_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增资产账户信息"; */
    set v_oper_remark_info = "新增资产账户信息";

    /* [插入表记录][产品_账户_资产账户信息流水表][字段][字段变量][5][@机构编号#,@产品编号#,@资产账户#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_asset_acco_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.41.5";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户=",v_asset_acco),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @通道编号# = 0; */
    set v_pass_no = 0;

    /* set @通道类型# = 0; */
    set v_pass_type = 0;

    /* set @在线状态# = 《在线状态-离线》; */
    set v_online_status = 2;

    /* set @参数配置串# = " "; */
    set v_config_str = " ";
    #set @备注信息# = " ";
    #modify by wjp 20181008

    /* set @密码验证状态# = 《密码验证状态-未验证》; */
    set v_pwd_check_status = 1;

    /* set @已读标记# = 《已读标记-未读》; */
    set v_read_flag = 0;

    /* [获取流水变动][{外部账号},{通道编号},{通道类型},{在线状态},{参数配置串},{备注信息}][@外部账号#,@通道编号#,@通道类型#,@在线状态#,@参数配置串#,@备注信息#]; */
    set v_jour_occur_field = concat("外部账号","|","通道编号","|","通道类型","|","在线状态","|","参数配置串","|","备注信息","|");
    set v_jour_occur_info = concat(v_out_acco,"|",v_pass_no,"|",v_pass_type,"|",v_online_status,"|",v_config_str,"|",v_remark_info,"|");


    /* [插入表记录][产品_账户_资产账户通道信息表][字段][字段变量][1][@资产账户编号#,@外部账号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_asset_acco_ch(
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, co_no, 
        pd_no, asset_acco_no, pass_type, out_acco, 
        trade_pwd, comm_pwd, online_status, config_str, 
        remark_info, pwd_check_status, read_flag) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_type, v_out_acco, 
        v_trade_pwd, v_comm_pwd, v_online_status, v_config_str, 
        v_remark_info, v_pwd_check_status, v_read_flag);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.41.1";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][@外部账号#,@通道编号#,@通道类型#,@在线状态#,@参数配置串#,@备注信息#]; */
    set v_jour_after_occur_info = concat(v_out_acco,"|",v_pass_no,"|",v_pass_type,"|",v_online_status,"|",v_config_str,"|",v_remark_info,"|");


    /* [插入表记录][产品_账户_资产账户通道信息流水表][字段][字段变量][5][@产品编号#,@资产账户编号#,@通道编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_asset_acco_ch_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.41.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","通道编号=",v_pass_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #设置默认交易组

    /* if @交易组编号# > 0 then */
    if v_exch_group_no > 0 then

        /* [插入重复更新][产品_账户_资产账户默认交易组信息表][字段][字段变量][{交易组编号} = @交易组编号#][1][@资产账户编号#, @交易组编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdacco_asset_acco_default_exgp (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            asset_acco_no, exch_group_no) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_asset_acco_no, v_exch_group_no) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, exch_group_no = v_exch_group_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.1.41.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 交易组编号=", v_exch_group_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 交易组编号=", v_exch_group_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_修改资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_ModiAssetAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_ModiAssetAccoInfo(
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
    IN p_asset_acco_no int,
    IN p_asset_acco varchar(16),
    IN p_asset_acco_name varchar(64),
    IN p_asset_acco_type int,
    IN p_market_price_ratio decimal(18,12),
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_split_fee_typr_str varchar(64),
    IN p_busi_limit_str varchar(2048),
    IN p_exter_comm_flag int,
    IN p_sh_hk_trader_type int,
    IN p_sz_hk_trader_type int,
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    IN p_busi_depart varchar(255),
    IN p_syn_update_cost_amt int,
    IN p_exch_group_no int,
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
    declare v_asset_acco_no int;
    declare v_asset_acco varchar(16);
    declare v_asset_acco_name varchar(64);
    declare v_asset_acco_type int;
    declare v_market_price_ratio decimal(18,12);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_split_fee_typr_str varchar(64);
    declare v_busi_limit_str varchar(2048);
    declare v_exter_comm_flag int;
    declare v_sh_hk_trader_type int;
    declare v_sz_hk_trader_type int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_busi_depart varchar(255);
    declare v_syn_update_cost_amt int;
    declare v_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_row_id bigint;
    declare v_busi_config_str varchar(64);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_asset_acco = p_asset_acco;
    SET v_asset_acco_name = p_asset_acco_name;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_split_fee_typr_str = p_split_fee_typr_str;
    SET v_busi_limit_str = p_busi_limit_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_sh_hk_trader_type = p_sh_hk_trader_type;
    SET v_sz_hk_trader_type = p_sz_hk_trader_type;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_busi_depart = p_busi_depart;
    SET v_syn_update_cost_amt = p_syn_update_cost_amt;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_row_id = 0;
    SET v_busi_config_str = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "资产账户编号", "|", "资产账户", "|", "资产账户名称", "|", "资产账户类型", "|", "市价冻结浮动比例", "|", "允许投资市场", "|", "允许操作证券类型", "|", "分笔费用类型串", "|", "业务限制串", "|", "体外指令标志", "|", "沪港通交易方式", "|", "深港通交易方式", "|", "备注信息", "|", "菜单编号", "|", "营业部", "|", "持仓同步是否更新成本金额", "|", "交易组编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_asset_acco, "|", v_asset_acco_name, "|", v_asset_acco_type, "|", v_market_price_ratio, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_split_fee_typr_str, "|", v_busi_limit_str, "|", v_exter_comm_flag, "|", v_sh_hk_trader_type, "|", v_sz_hk_trader_type, "|", v_remark_info, "|", v_menu_no, "|", v_busi_depart, "|", v_syn_update_cost_amt, "|", v_exch_group_no, "|");


    /* [获取表记录变量][产品_账户_资产账户信息表][{记录序号},{业务控制配置串}][@记录序号#,@业务控制配置串#][{产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {资产账户}=@资产账户#][4][@产品编号#,@资产账户编号#,@资产账户#] */
    select row_id,busi_config_str into v_row_id,v_busi_config_str from db_prod.tb_pdacco_asset_acco where pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and asset_acco=v_asset_acco limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.42.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","资产账户=",v_asset_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","资产账户=",v_asset_acco);
        end if;
        leave label_pro;
    end if;


    /* set @业务控制配置串# = concat(left(@业务控制配置串#, 14), @沪港通交易方式#,@深港通交易方式#,substring(@业务控制配置串#,17,1),@持仓同步是否更新成本金额#,right(@业务控制配置串#,LENGTH(@业务控制配置串#)-18)); */
    set v_busi_config_str = concat(left(v_busi_config_str, 14), v_sh_hk_trader_type,v_sz_hk_trader_type,substring(v_busi_config_str,17,1),v_syn_update_cost_amt,right(v_busi_config_str,LENGTH(v_busi_config_str)-18));

    /* [更新表记录][产品_账户_资产账户信息表][{资产账户名称}=@资产账户名称#, {资产账户类型}=@资产账户类型#, {市价冻结浮动比例}=@市价冻结浮动比例#, {允许投资市场}=@允许投资市场#,  {允许操作证券类型}=@允许操作证券类型#,  {分笔费用类型串}=@分笔费用类型串#, {体外指令标志}=@体外指令标志#, {业务限制串}=@业务限制串#,{业务控制配置串}=@业务控制配置串#, {备注信息}=@备注信息#,{营业部}=@营业部#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_asset_acco set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, asset_acco_name=v_asset_acco_name, asset_acco_type=v_asset_acco_type, market_price_ratio=v_market_price_ratio, allow_exch=v_allow_exch,  allow_stock_type=v_allow_stock_type,  split_fee_typr_str=v_split_fee_typr_str, exter_comm_flag=v_exter_comm_flag, busi_limit_str=v_busi_limit_str,busi_config_str=v_busi_config_str, remark_info=v_remark_info,busi_depart=v_busi_depart where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.42.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    #新增修改:同步更新资产账户通道信息表的备注信息

    /* [更新表记录][产品_账户_资产账户通道信息表][{备注信息}=@备注信息#][{资产账户编号}=@资产账户编号# and {产品编号}=@产品编号#][2][@资产账户编号#,@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_asset_acco_ch set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remark_info=v_remark_info where asset_acco_no=v_asset_acco_no and pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.42.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量]; */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_asset_acco, "|", v_asset_acco_name, "|", v_asset_acco_type, "|", v_market_price_ratio, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_split_fee_typr_str, "|", v_busi_limit_str, "|", v_exter_comm_flag, "|", v_sh_hk_trader_type, "|", v_sz_hk_trader_type, "|", v_remark_info, "|", v_menu_no, "|", v_busi_depart, "|", v_syn_update_cost_amt, "|", v_exch_group_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改资产账户信息"; */
    set v_oper_remark_info = "修改资产账户信息";

    /* [插入表记录][产品_账户_资产账户信息流水表][字段][字段变量][5][@产品编号#,@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_asset_acco_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.42.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #设置默认交易组

    /* if @交易组编号# > 0 then */
    if v_exch_group_no > 0 then

        /* [插入重复更新][产品_账户_资产账户默认交易组信息表][字段][字段变量][{交易组编号} = @交易组编号#][1][@资产账户编号#, @交易组编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdacco_asset_acco_default_exgp (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            asset_acco_no, exch_group_no) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_asset_acco_no, v_exch_group_no) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, exch_group_no = v_exch_group_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.1.42.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 交易组编号=", v_exch_group_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 交易组编号=", v_exch_group_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_删除资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_DeleteAssetAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_DeleteAssetAccoInfo(
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
    IN p_asset_acco_no int,
    IN p_menu_no int,
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
    declare v_asset_acco_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_table_row_id bigint;
    declare v_asset_acco varchar(16);
    declare v_asset_acco_name varchar(64);
    declare v_asset_acco_type int;
    declare v_trade_pwd varchar(64);
    declare v_asset_acco_status varchar(2);
    declare v_busi_config_str varchar(64);
    declare v_market_price_ratio decimal(18,12);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_split_fee_typr_str varchar(64);
    declare v_busi_limit_str varchar(2048);
    declare v_exter_comm_flag int;
    declare v_remark_info varchar(255);
    declare v_busi_depart varchar(255);
    declare v_abolish_date int;
    declare v_table_field_value varchar(10000);
    declare v_table_uni_index_value varchar(10000);
    declare v_table_name varchar(64);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_remark_info varchar(255);

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_table_row_id = 0;
    SET v_asset_acco = " ";
    SET v_asset_acco_name = " ";
    SET v_asset_acco_type = 0;
    SET v_trade_pwd = " ";
    SET v_asset_acco_status = "0";
    SET v_busi_config_str = " ";
    SET v_market_price_ratio = 0;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_split_fee_typr_str = " ";
    SET v_busi_limit_str = " ";
    SET v_exter_comm_flag = 0;
    SET v_remark_info = " ";
    SET v_busi_depart = " ";
    SET v_abolish_date = 0;
    SET v_table_field_value = " ";
    SET v_table_uni_index_value = " ";
    SET v_table_name = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* set @流水变动字段# = " "; */
    set v_jour_occur_field = " ";

    /* set @流水变动信息# = " "; */
    set v_jour_occur_info = " ";

    /* [获取表记录变量][产品_账户_资产账户信息表][{记录序号},{资产账户编号},{机构编号},{产品编号},{资产账户},{资产账户名称},{资产账户类型},{交易密码},{资产账户状态},{业务控制配置串},{市价冻结浮动比例},{允许投资市场},{允许操作证券类型},{分笔费用类型串},{业务限制串},{体外指令标志},{备注信息},{营业部},{注销日期}][@表记录序号#,@资产账户编号#,@机构编号#,@产品编号#,@资产账户#,@资产账户名称#,@资产账户类型#,@交易密码#,@资产账户状态#,@业务控制配置串#,@市价冻结浮动比例#,@允许投资市场#,@允许操作证券类型#,@分笔费用类型串#,@业务限制串#,@体外指令标志#,@备注信息#,@营业部#,@注销日期#][{产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#][4][@产品编号#,@资产账户编号#] */
    select row_id,asset_acco_no,co_no,pd_no,asset_acco,asset_acco_name,asset_acco_type,trade_pwd,asset_acco_status,busi_config_str,market_price_ratio,allow_exch,allow_stock_type,split_fee_typr_str,busi_limit_str,exter_comm_flag,remark_info,busi_depart,abolish_date into v_table_row_id,v_asset_acco_no,v_co_no,v_pd_no,v_asset_acco,v_asset_acco_name,v_asset_acco_type,v_trade_pwd,v_asset_acco_status,v_busi_config_str,v_market_price_ratio,v_allow_exch,v_allow_stock_type,v_split_fee_typr_str,v_busi_limit_str,v_exter_comm_flag,v_remark_info,v_busi_depart,v_abolish_date from db_prod.tb_pdacco_asset_acco where pd_no=v_pd_no and asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.43.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    #删除流水记录

    /* set @表字段值# =  concat("|资产账户编号:",@资产账户编号#,"|机构编号:",@机构编号#,"|产品编号:",@产品编号#,"|资产账户:",@资产账户#,"|资产账户名称:",@资产账户名称#,"|资产账户类型:",@资产账户类型#,"|交易密码:",@交易密码#,"|资产账户状态:",@资产账户状态#,"|业务控制配置串:",@业务控制配置串#,"|市价冻结浮动比例:",@市价冻结浮动比例#,"|允许投资市场:",@允许投资市场#,"|允许操作证券类型:",@允许操作证券类型#,"|分笔费用类型串:",@分笔费用类型串#,"|业务限制串:",@业务限制串#,"|体外指令标志:",@体外指令标志#,"|备注信息:",@备注信息#,"|营业部:",@营业部#,"|注销日期:",@注销日期#); */
    set v_table_field_value =  concat("|资产账户编号:",v_asset_acco_no,"|机构编号:",v_co_no,"|产品编号:",v_pd_no,"|资产账户:",v_asset_acco,"|资产账户名称:",v_asset_acco_name,"|资产账户类型:",v_asset_acco_type,"|交易密码:",v_trade_pwd,"|资产账户状态:",v_asset_acco_status,"|业务控制配置串:",v_busi_config_str,"|市价冻结浮动比例:",v_market_price_ratio,"|允许投资市场:",v_allow_exch,"|允许操作证券类型:",v_allow_stock_type,"|分笔费用类型串:",v_split_fee_typr_str,"|业务限制串:",v_busi_limit_str,"|体外指令标志:",v_exter_comm_flag,"|备注信息:",v_remark_info,"|营业部:",v_busi_depart,"|注销日期:",v_abolish_date);

    /* set @表唯一索引值# = concat("|机构编号:",@机构编号#,"|资产账户:",@资产账户#); */
    set v_table_uni_index_value = concat("|机构编号:",v_co_no,"|资产账户:",v_asset_acco);

    /* set @数据表名称# = "tb_pdacco_asset_acco"; */
    set v_table_name = "tb_pdacco_asset_acco";

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品_账户_产品库删除流水表][字段][字段变量][5][@数据表名称#, @表记录序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_prod_delete_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, table_name, 
        table_row_id, table_field_value, table_uni_index_value) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_table_name, 
        v_table_row_id, v_table_field_value, v_table_uni_index_value);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.43.5";
        SET v_error_info =  CONCAT(concat("数据表名称=",v_table_name,","," 表记录序号=", v_table_row_id),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [删除表记录][产品_账户_资产账户信息表][{产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#][3][@产品编号#,@资产账户编号#] */
    delete from db_prod.tb_pdacco_asset_acco 
        where pd_no=v_pd_no and asset_acco_no=v_asset_acco_no;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.1.43.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# = " " ; */
    set v_jour_after_occur_info = " " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "删除资产账户信息"; */
    set v_oper_remark_info = "删除资产账户信息";

    /* [插入表记录][产品_账户_资产账户信息流水表][字段][字段变量][5][@产品编号#,@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_asset_acco_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.43.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryAssetAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryAssetAccoInfo(
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
    IN p_asset_acco_status_str varchar(64),
    IN p_asset_acco_type int,
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
    declare v_asset_acco_status_str varchar(64);
    declare v_asset_acco_type int;
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
    SET v_asset_acco_status_str = p_asset_acco_status_str;
    SET v_asset_acco_type = p_asset_acco_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    if v_row_count = -1 then
            select a.row_id,a.create_date,a.create_time,a.update_date,a.update_time,a.co_no,a.pd_no,a.asset_acco_no,a.asset_acco,a.asset_acco_name,a.asset_acco_type,b.pass_no,b.out_acco,a.trade_pwd,a.asset_acco_status,a.busi_config_str,a.market_price_ratio,a.allow_exch,a.allow_stock_type,a.split_fee_typr_str,a.busi_limit_str,a.exter_comm_flag,a.remark_info,a.busi_depart,c.exch_group_no from db_prod.tb_pdacco_asset_acco a LEFT JOIN db_prod.tb_pdacco_asset_acco_default_exgp c on  a.asset_acco_no = c.asset_acco_no,db_prod.tb_pdacco_asset_acco_ch b where a.asset_acco_no=b.asset_acco_no  and (v_co_no = 0 or a.co_no=v_co_no) and (v_pd_no = 0 or a.pd_no=v_pd_no) and (v_pd_no_rights_str = ' ' or instr(v_pd_no_rights_str, concat(";",a.pd_no,";")) > 0) and (v_asset_acco_no = 0 or a.asset_acco_no=v_asset_acco_no) and (v_asset_acco_status_str = "; ;" or instr(v_asset_acco_status_str, concat(";",a.asset_acco_status,";"))>0) and (v_asset_acco_type = 0 or asset_acco_type = v_asset_acco_type) and a.row_id > v_row_id order by a.row_id;
        else
            select a.row_id,a.create_date,a.create_time,a.update_date,a.update_time,a.co_no,a.pd_no,a.asset_acco_no,a.asset_acco,a.asset_acco_name,a.asset_acco_type,b.pass_no,b.out_acco,a.trade_pwd,a.asset_acco_status,a.busi_config_str,a.market_price_ratio,a.allow_exch,a.allow_stock_type,a.split_fee_typr_str,a.busi_limit_str,a.exter_comm_flag,a.remark_info,a.busi_depart,c.exch_group_no from db_prod.tb_pdacco_asset_acco a LEFT JOIN db_prod.tb_pdacco_asset_acco_default_exgp c on  a.asset_acco_no = c.asset_acco_no,db_prod.tb_pdacco_asset_acco_ch b where a.asset_acco_no=b.asset_acco_no and (v_co_no = 0 or a.co_no=v_co_no) and (v_pd_no = 0 or a.pd_no=v_pd_no) and (v_pd_no_rights_str = ' ' or instr(v_pd_no_rights_str, concat(";",a.pd_no,";")) > 0) and (v_asset_acco_no = 0 or a.asset_acco_no=v_asset_acco_no) and (v_asset_acco_status_str = "; ;" or instr(v_asset_acco_status_str, concat(";",a.asset_acco_status,";"))>0) and (v_asset_acco_type = 0 or asset_acco_type = v_asset_acco_type) and a.row_id > v_row_id order by a.row_id limit v_row_count;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询资产账户信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryAssetAccoInfoJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryAssetAccoInfoJour(
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
    IN p_asset_acco_no int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_账户_资产账户信息流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_prod.tb_pdacco_asset_acco_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_prod.tb_pdacco_asset_acco_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询历史资产账户信息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryAssetAccoInfoJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryAssetAccoInfoJour_His(
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
    IN p_asset_acco_no int,
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
    declare v_asset_acco_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品_账户_资产账户信息流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_prod_his.tb_pdacco_asset_acco_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_prod_his.tb_pdacco_asset_acco_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_更新资产账户状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_UpdateAssetAccoStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_UpdateAssetAccoStatus(
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
    IN p_asset_acco_no int,
    IN p_asset_acco_status varchar(2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_asset_acco_no int;
    declare v_asset_acco_status varchar(2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_abolish_date int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_asset_acco_status = p_asset_acco_status;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_abolish_date = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "资产账户编号", "|", "资产账户状态", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_asset_acco_status, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* if @资产账户状态#  <> 《资产账户状态-注销》 then */
    if v_asset_acco_status  <> "3" then

          /* [更新表记录][产品_账户_资产账户信息表][{资产账户状态}=@资产账户状态#][{产品编号}=@产品编号# and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)][2][@产品编号#,@资产账户编号#] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_prod.tb_pdacco_asset_acco set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, asset_acco_status=v_asset_acco_status where pd_no=v_pd_no and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no);
          if v_error_code = "1" then
                      
              SET v_error_code = "prodA.1.47.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
              else
                  SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
              end if;
              leave label_pro;
          end if;

    else

          /* set  @注销日期# = @初始化日期#; */
          set  v_abolish_date = v_init_date;

          /* [更新表记录][产品_账户_资产账户信息表][{资产账户状态}=@资产账户状态#,{注销日期}=@注销日期#][{产品编号}=@产品编号# and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)][2][@产品编号#,@资产账户编号#] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_prod.tb_pdacco_asset_acco set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, asset_acco_status=v_asset_acco_status,abolish_date=v_abolish_date where pd_no=v_pd_no and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no);
          if v_error_code = "1" then
                      
              SET v_error_code = "prodA.1.47.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
              else
                  SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
              end if;
              leave label_pro;
          end if;

    end if;

    /* if @资产账户编号# <> 0 then */
    if v_asset_acco_no <> 0 then

        /* [获取表记录变量][产品_账户_资产账户信息表][{资产账户状态}][@资产账户状态#][{产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#][4][@产品编号#,@资产账户编号#] */
        select asset_acco_status into v_asset_acco_status from db_prod.tb_pdacco_asset_acco where pd_no=v_pd_no and asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.1.47.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;


        /* [获取流水后信息][字段变量]; */
        set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_asset_acco_status, "|", v_oper_remark_info, "|", v_menu_no, "|");


        /* set @操作菜单# = @菜单编号#; */
        set v_oper_menu_no = v_menu_no;

        /* set @操作功能# = @功能编码#; */
        set v_oper_func_code = v_func_code;

        /* [插入表记录][产品_账户_资产账户信息流水表][字段][字段变量][5][@产品编号#,@资产账户编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdacco_asset_acco_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, asset_acco_no, jour_occur_field, jour_after_occur_info, 
            oper_remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_jour_occur_field, v_jour_after_occur_info, 
            v_oper_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.1.47.5";
            SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_修改资产账户密码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_UpdateAssetAccoPwd;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_UpdateAssetAccoPwd(
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
    IN p_asset_acco_no int,
    IN p_trade_pwd varchar(64),
    IN p_comm_pwd varchar(64),
    IN p_menu_no int,
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
    declare v_asset_acco_no int;
    declare v_trade_pwd varchar(64);
    declare v_comm_pwd varchar(64);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_read_flag int;
    declare v_out_acco varchar(32);
    declare v_pass_no int;

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_trade_pwd = p_trade_pwd;
    SET v_comm_pwd = p_comm_pwd;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_read_flag = 0;
    SET v_out_acco = " ";
    SET v_pass_no = 0;

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "资产账户编号", "|", "交易密码", "|", "通讯密码", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_trade_pwd, "|", v_comm_pwd, "|", v_menu_no, "|");


    /* [更新表记录][产品_账户_资产账户信息表][{交易密码}=@交易密码#][{产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#][2][@产品编号#,@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_asset_acco set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, trade_pwd=v_trade_pwd where pd_no=v_pd_no and asset_acco_no=v_asset_acco_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.50.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_资产账户信息表][{交易密码}][@交易密码#][{产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#][4][@产品编号#,@资产账户编号#] */
    select trade_pwd into v_trade_pwd from db_prod.tb_pdacco_asset_acco where pd_no=v_pd_no and asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.50.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量]; */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_trade_pwd, "|", v_comm_pwd, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改资产账户密码"; */
    set v_oper_remark_info = "修改资产账户密码";

    /* [插入表记录][产品_账户_资产账户信息流水表][字段][字段变量][5][@产品编号#,@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_asset_acco_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.50.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #修改密码时置为已读。

    /* set @已读标记# = 《已读标记-未读》; */
    set v_read_flag = 0;

    /* [获取流水变动][{外部账号},{通道编号},{交易密码},{通讯密码}][@外部账号#,@通道编号#,@交易密码#,@通讯密码#]; */
    set v_jour_occur_field = concat("外部账号","|","通道编号","|","交易密码","|","通讯密码","|");
    set v_jour_occur_info = concat(v_out_acco,"|",v_pass_no,"|",v_trade_pwd,"|",v_comm_pwd,"|");


    /* [更新表记录][产品_账户_资产账户通道信息表][{交易密码}=@交易密码#,{通讯密码}=@通讯密码#,{已读标记}=@已读标记#][{资产账户编号}=@资产账户编号#][2][@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_asset_acco_ch set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, trade_pwd=v_trade_pwd,comm_pwd=v_comm_pwd,read_flag=v_read_flag where asset_acco_no=v_asset_acco_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.50.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@外部账号#,@通道编号#,@交易密码#,@通讯密码#]; */
    set v_jour_after_occur_info = concat(v_out_acco,"|",v_pass_no,"|",v_trade_pwd,"|",v_comm_pwd,"|");


    /* [插入表记录][产品_账户_资产账户通道信息流水表][字段][字段变量][5][@产品编号#,@资产账户编号#,@通道编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_asset_acco_ch_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.50.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","通道编号=",v_pass_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询资产账户列表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryAssetAccoList;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryAssetAccoList(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no_str varchar(2048),
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
    declare v_pd_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_count int;
    declare v_co_no int;
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;
    SET v_co_no = 0;
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* [获取表记录][产品_账户_资产账户信息表][字段][{机构编号}=@机构编号# and (@产品编号串#="; ;" or instr(@产品编号串#, concat(";", {产品编号}, ";")) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, asset_acco_no, 
        co_no, pd_no, asset_acco, asset_acco_name, 
        asset_acco_type, trade_pwd, asset_acco_status, busi_config_str, 
        market_price_ratio, allow_exch, allow_stock_type, split_fee_typr_str, 
        busi_limit_str, exter_comm_flag, remark_info, busi_depart, 
        abolish_date from db_prod.tb_pdacco_asset_acco where co_no=v_co_no and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";", pd_no, ";")) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, asset_acco_no, 
        co_no, pd_no, asset_acco, asset_acco_name, 
        asset_acco_type, trade_pwd, asset_acco_status, busi_config_str, 
        market_price_ratio, allow_exch, allow_stock_type, split_fee_typr_str, 
        busi_limit_str, exter_comm_flag, remark_info, busi_depart, 
        abolish_date from db_prod.tb_pdacco_asset_acco where co_no=v_co_no and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";", pd_no, ";")) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_更新资产账户在线状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_UpdateAssetAccountOnlineStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_UpdateAssetAccountOnlineStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_online_status int,
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
    declare v_out_acco varchar(32);
    declare v_online_status int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_online_status = p_online_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #获取主键再更新，避免死锁

    /* [获取表记录变量][产品_账户_资产账户通道信息表][{记录序号}][@记录序号#][{通道编号}=@通道编号# and {外部账号}=@外部账号#][4][@通道编号#,@外部账号#] */
    select row_id into v_row_id from db_prod.tb_pdacco_asset_acco_ch where pass_no=v_pass_no and out_acco=v_out_acco limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.52.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品_账户_资产账户通道信息表][{在线状态}=@在线状态#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_asset_acco_ch set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, online_status=v_online_status where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.52.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询资产账户通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryAssetAccoChannel;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryAssetAccoChannel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_asset_acco_no int,
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
    declare v_pd_no int;
    declare v_asset_acco_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_账户_资产账户通道信息表][字段][{机构编号}=@操作员机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#)  and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        co_no, pd_no, asset_acco_no, pass_type, 
        out_acco, trade_pwd, comm_pwd, online_status, 
        config_str, remark_info, pwd_check_status, read_flag from db_prod.tb_pdacco_asset_acco_ch where co_no=v_opor_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no)  and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        co_no, pd_no, asset_acco_no, pass_type, 
        out_acco, trade_pwd, comm_pwd, online_status, 
        config_str, remark_info, pwd_check_status, read_flag from db_prod.tb_pdacco_asset_acco_ch where co_no=v_opor_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no)  and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取产品最大单位净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetPdMaxPerNav;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetPdMaxPerNav(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_part_nav decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_begin_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_part_nav decimal(18,4);
    declare v_pre_nav decimal(18,4);
    declare v_curr_share decimal(18,2);
    declare v_nav_asset decimal(18,4);
    declare v_tmp_pre_nav decimal(18,4);

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
    SET v_pd_no = p_pd_no;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_part_nav = 0;
    SET v_pre_nav = 0;
    SET v_curr_share = 0;
    SET v_nav_asset = 0;
    SET v_tmp_pre_nav = 0;

    
    label_pro:BEGIN
    

    /* set @昨日净值#=0; */
    set v_pre_nav=0;

    /* select max({昨日净值}) into @昨日净值# from ~产品_账户_历史产品信息表^ where {产品编号}=@产品编号# and {初始化日期}>@开始日期#; */
    select max(pre_nav) into v_pre_nav from db_prod_his.tb_pdacco_pd_info_his where pd_no=v_pd_no and init_date>v_begin_date;

    /* set @当前份额#=0; */
    set v_curr_share=0;

    /* set @净资产#=0; */
    set v_nav_asset=0;

    /* set @临时_昨日净值#=0; */
    set v_tmp_pre_nav=0;

    /* [获取表记录变量语句][产品_账户_产品信息表][{当前份额},{昨日净值}][@当前份额#,@临时_昨日净值#][{产品编号}=@产品编号#] */
    select curr_share,pre_nav into v_curr_share,v_tmp_pre_nav from db_prod.tb_pdacco_pd_info where pd_no=v_pd_no limit 1;


    /* [获取表记录变量语句][产品_资金_产品资产表][{净资产}][@净资产#][{产品编号}=@产品编号# and {本币币种}="CNY"] */
    select nav_asset into v_nav_asset from db_prod.tb_pdcapit_pd_asset where pd_no=v_pd_no and crncy_type="CNY" limit 1;


    /* set @产品单位净值#=round(IFNULL((@净资产#/@当前份额#),0),4); */
    set v_pd_part_nav=round(IFNULL((v_nav_asset/v_curr_share),0),4);

    /* set @产品单位净值#=GREATEST(@昨日净值#,@临时_昨日净值#,@产品单位净值#); */
    set v_pd_part_nav=GREATEST(v_pre_nav,v_tmp_pre_nav,v_pd_part_nav);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_part_nav = v_pd_part_nav;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取产品最大净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetPdMaxNav;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetPdMaxNav(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_nav_asset decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_begin_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_nav_asset decimal(18,4);
    declare v_tmp_nav_asset decimal(18,4);

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
    SET v_pd_no = p_pd_no;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_nav_asset = 0;
    SET v_tmp_nav_asset = 0;

    
    label_pro:BEGIN
    

    /* set @净资产#=0; */
    set v_nav_asset=0;

    /* select max({净资产}) into @净资产# from ~产品_资金_历史产品资产表^ where {产品编号}=@产品编号# and {本币币种}="CNY" and {初始化日期}>=@开始日期#; */
    select max(nav_asset) into v_nav_asset from db_prod_his.tb_pdcapit_pd_asset_his where pd_no=v_pd_no and crncy_type="CNY" and init_date>=v_begin_date;

    /* set @临时_净资产#=0; */
    set v_tmp_nav_asset=0;

    /* [获取表记录变量语句][产品_资金_产品资产表][{净资产}][@临时_净资产#][{产品编号}=@产品编号# and {本币币种}="CNY"] */
    select nav_asset into v_tmp_nav_asset from db_prod.tb_pdcapit_pd_asset where pd_no=v_pd_no and crncy_type="CNY" limit 1;


    /* set @净资产#=GREATEST(@净资产#,@临时_净资产#); */
    set v_nav_asset=GREATEST(v_nav_asset,v_tmp_nav_asset);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_nav_asset = v_nav_asset;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_归档产品账户数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_BackUpProdAccoData;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_BackUpProdAccoData(
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
    

    /* [数据归历史][产品_账户_产品信息流水表][字段][{初始化日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_prod_his.tb_pdacco_pd_info_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info 
        from db_prod.tb_pdacco_pd_info_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.101.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_账户_产品信息流水表][{初始化日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_prod.tb_pdacco_pd_info_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.1.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品_账户_产品限制信息流水表][字段][{初始化日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_prod_his.tb_pdacco_pd_limit_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info 
        from db_prod.tb_pdacco_pd_limit_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.101.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_账户_产品限制信息流水表][{初始化日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_prod.tb_pdacco_pd_limit_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.1.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_账户_历史产品信息表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_prod_his.tb_pdacco_pd_info_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.1.101.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品_账户_产品信息表][字段][302][@初始化日期#] */
    insert into db_prod_his.tb_pdacco_pd_info_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, pd_no, co_no, 
        pd_code, pd_name, pd_flname, fund_reg_code, 
        pd_manager, found_date, pd_type, apply_currency, 
        crncy_type, first_asset, first_amt, pd_all_share, 
        curr_share, pre_share, his_max_per_nav, pre_nav, 
        begin_NAV, evalu_share, pre_evalu_share, coust_full_name, 
        coust_acco, coust_acco_name, warn_posi_value, close_posi_value, 
        target_posi_ratio, beta_coeffi, custom_pd_class, index_value, 
        remark_info) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, pd_no, co_no, 
        pd_code, pd_name, pd_flname, fund_reg_code, 
        pd_manager, found_date, pd_type, apply_currency, 
        crncy_type, first_asset, first_amt, pd_all_share, 
        curr_share, pre_share, his_max_per_nav, pre_nav, 
        begin_NAV, evalu_share, pre_evalu_share, coust_full_name, 
        coust_acco, coust_acco_name, warn_posi_value, close_posi_value, 
        target_posi_ratio, beta_coeffi, custom_pd_class, index_value, 
        remark_info 
        from db_prod.tb_pdacco_pd_info;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.101.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_账户_历史产品限制信息表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_prod_his.tb_pdacco_pd_limit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.1.101.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品_账户_产品限制信息表][字段][302][@初始化日期#] */
    insert into db_prod_his.tb_pdacco_pd_limit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        cost_calc_type, allow_exch, allow_stock_type, busi_config_str, 
        comm_appr_oper, market_price_ratio, forbid_order_dir, pd_status, 
        comm_no_limit_price_ratio, abolish_date) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        cost_calc_type, allow_exch, allow_stock_type, busi_config_str, 
        comm_appr_oper, market_price_ratio, forbid_order_dir, pd_status, 
        comm_no_limit_price_ratio, abolish_date 
        from db_prod.tb_pdacco_pd_limit;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.101.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品_账户_银行账户信息流水表][字段][{初始化日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_prod_his.tb_pdacco_bank_acco_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, bank_acco_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, bank_acco_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_prod.tb_pdacco_bank_acco_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.101.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_账户_银行账户信息流水表][{初始化日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_prod.tb_pdacco_bank_acco_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.1.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品_账户_资产账户信息流水表][字段][{初始化日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_prod_his.tb_pdacco_asset_acco_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_prod.tb_pdacco_asset_acco_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.101.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_账户_资产账户信息流水表][{初始化日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_prod.tb_pdacco_asset_acco_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.1.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品_账户_资产账户通道信息流水表][字段][{初始化日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_prod_his.tb_pdacco_asset_acco_ch_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        jour_occur_field, jour_after_occur_info, oper_remark_info 
        from db_prod.tb_pdacco_asset_acco_ch_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.101.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_账户_资产账户通道信息流水表][{初始化日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_prod.tb_pdacco_asset_acco_ch_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.1.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品_账户_产品关系流水表][字段][{初始化日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_prod_his.tb_pdacco_pd_relation_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, mum_pd_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, mum_pd_no, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_prod.tb_pdacco_pd_relation_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.101.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_账户_产品关系流水表][{初始化日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_prod.tb_pdacco_pd_relation_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.1.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品_账户_产品库删除流水表][字段][{初始化日期}<=@初始化日期#][301i][@初始化日期#] */
    insert into db_prod_his.tb_pdacco_prod_delete_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        table_name, table_row_id, table_field_value, table_uni_index_value) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        table_name, table_row_id, table_field_value, table_uni_index_value 
        from db_prod.tb_pdacco_prod_delete_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.101.301i";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_账户_产品库删除流水表][{初始化日期}<=@初始化日期#][302i][@初始化日期#] */
    delete from db_prod.tb_pdacco_prod_delete_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.1.101.302i";
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
use db_prod;;

# 原子_产品_账户_检查产品状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_CheckProductStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_CheckProductStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_pd_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_pd_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_tmp_pd_status varchar(2);

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
    SET v_pd_no = p_pd_no;
    SET v_pd_status = p_pd_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_tmp_pd_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_产品限制信息表][{产品状态},{机构编号}][@临时_产品状态#,@机构编号#][{产品编号}=@产品编号#][4][@产品编号#] */
    select pd_status,co_no into v_tmp_pd_status,v_co_no from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.301.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #产品状态检查

    /* [检查报错返回][@产品状态# = 0 and @临时_产品状态# = 《产品状态-冻结》][101][@产品编号#,@产品状态#,@临时_产品状态#] */
    if v_pd_status = 0 and v_tmp_pd_status = "2" then
        
        SET v_error_code = "prodA.1.301.101";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@产品状态# = 0 and @临时_产品状态# = 《产品状态-注销》][102][@产品编号#,@产品状态#,@临时_产品状态#] */
    if v_pd_status = 0 and v_tmp_pd_status = "3" then
        
        SET v_error_code = "prodA.1.301.102";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status);
        end if;
        leave label_pro;
    end if;

    #冻结产品检查

    /* [检查报错返回][@产品状态# = 《产品状态-冻结》 and @临时_产品状态# = 《产品状态-冻结》][101][@产品编号#,@产品状态#,@临时_产品状态#] */
    if v_pd_status = "2" and v_tmp_pd_status = "2" then
        
        SET v_error_code = "prodA.1.301.101";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@产品状态# = 《产品状态-冻结》 and @临时_产品状态# = 《产品状态-注销》][102][@产品编号#,@产品状态#,@临时_产品状态#] */
    if v_pd_status = "2" and v_tmp_pd_status = "3" then
        
        SET v_error_code = "prodA.1.301.102";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status);
        end if;
        leave label_pro;
    end if;

    #恢复产品检查

    /* [检查报错返回][@产品状态# = 《产品状态-正常》 and @临时_产品状态# = 《产品状态-正常》][103][@产品编号#,@产品状态#,@临时_产品状态#] */
    if v_pd_status = "1" and v_tmp_pd_status = "1" then
        
        SET v_error_code = "prodA.1.301.103";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@产品状态# = 《产品状态-正常》 and @临时_产品状态# = 《产品状态-注销》][102][@产品编号#,@产品状态#,@临时_产品状态#] */
    if v_pd_status = "1" and v_tmp_pd_status = "3" then
        
        SET v_error_code = "prodA.1.301.102";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status);
        end if;
        leave label_pro;
    end if;

    #注销产品检查

    /* [检查报错返回][@产品状态# = 《产品状态-注销》 and @临时_产品状态# = 《产品状态-冻结》][101][@产品编号#,@产品状态#,@临时_产品状态#] */
    if v_pd_status = "3" and v_tmp_pd_status = "2" then
        
        SET v_error_code = "prodA.1.301.101";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@产品状态# = 《产品状态-注销》 and @临时_产品状态# = 《产品状态-注销》][102][@产品编号#,@产品状态#,@临时_产品状态#] */
    if v_pd_status = "3" and v_tmp_pd_status = "3" then
        
        SET v_error_code = "prodA.1.301.102";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status,",","临时_产品状态=",v_tmp_pd_status);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_检查资产账户状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_CheckAssetAccoStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_CheckAssetAccoStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_asset_acco_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_asset_acco_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_tmp_pd_status varchar(2);
    declare v_tmp_asset_acco_status varchar(2);

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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_asset_acco_status = p_asset_acco_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_tmp_pd_status = "0";
    SET v_tmp_asset_acco_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_产品限制信息表][{机构编号},{产品状态}][@机构编号#,@临时_产品状态#][{产品编号}=@产品编号#][4][@产品编号#] */
    select co_no,pd_status into v_co_no,v_tmp_pd_status from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.302.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #产品状态检查

    /* [检查报错返回][@临时_产品状态# = 《产品状态-冻结》][101][@产品编号#] */
    if v_tmp_pd_status = "2" then
        
        SET v_error_code = "prodA.1.302.101";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@临时_产品状态# = 《产品状态-注销》][102][@产品编号#] */
    if v_tmp_pd_status = "3" then
        
        SET v_error_code = "prodA.1.302.102";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_资产账户信息表][{资产账户状态}][@临时_资产账户状态#][{产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#][4][@产品编号#,@资产账户编号#] */
    select asset_acco_status into v_tmp_asset_acco_status from db_prod.tb_pdacco_asset_acco where pd_no=v_pd_no and asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.302.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    #资产账户状态检查

    /* [检查报错返回][@资产账户状态# = 0 and @临时_资产账户状态# = 《资产账户状态-冻结》][121][@资产账户编号#,@资产账户状态#,@临时_资产账户状态#] */
    if v_asset_acco_status = 0 and v_tmp_asset_acco_status = "2" then
        
        SET v_error_code = "prodA.1.302.121";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status,",","临时_资产账户状态=",v_tmp_asset_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status,",","临时_资产账户状态=",v_tmp_asset_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@资产账户状态# = 0 and @临时_资产账户状态# = 《资产账户状态-注销》][122][@资产账户编号#,@资产账户状态#,@临时_资产账户状态#] */
    if v_asset_acco_status = 0 and v_tmp_asset_acco_status = "3" then
        
        SET v_error_code = "prodA.1.302.122";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status,",","临时_资产账户状态=",v_tmp_asset_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status,",","临时_资产账户状态=",v_tmp_asset_acco_status);
        end if;
        leave label_pro;
    end if;

    #冻结资产账户检查

    /* [检查报错返回][@资产账户状态# = 《资产账户状态-冻结》 and @临时_资产账户状态# = 《资产账户状态-冻结》][121][@产品编号#,@资产账户编号#] */
    if v_asset_acco_status = "2" and v_tmp_asset_acco_status = "2" then
        
        SET v_error_code = "prodA.1.302.121";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@资产账户状态# = 《资产账户状态-冻结》 and @临时_资产账户状态# = 《资产账户状态-注销》][122][@产品编号#,@资产账户编号#] */
    if v_asset_acco_status = "2" and v_tmp_asset_acco_status = "3" then
        
        SET v_error_code = "prodA.1.302.122";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    #恢复资产账户检查

    /* [检查报错返回][@资产账户状态# = 《资产账户状态-正常》 and @临时_资产账户状态# = 《资产账户状态-正常》][123][@产品编号#,@资产账户编号#] */
    if v_asset_acco_status = "1" and v_tmp_asset_acco_status = "1" then
        
        SET v_error_code = "prodA.1.302.123";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@资产账户状态# = 《资产账户状态-正常》 and @临时_资产账户状态# = 《资产账户状态-注销》][122][@产品编号#,@资产账户编号#] */
    if v_asset_acco_status = "1" and v_tmp_asset_acco_status = "3" then
        
        SET v_error_code = "prodA.1.302.122";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    #注销资产账户检查

    /* [检查报错返回][@资产账户状态# = 《资产账户状态-注销》 and @临时_资产账户状态# = 《资产账户状态-冻结》][121][@产品编号#,@资产账户编号#] */
    if v_asset_acco_status = "3" and v_tmp_asset_acco_status = "2" then
        
        SET v_error_code = "prodA.1.302.121";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@资产账户状态# = 《资产账户状态-注销》 and @临时_资产账户状态# = 《资产账户状态-注销》][122][@产品编号#,@资产账户编号#] */
    if v_asset_acco_status = "3" and v_tmp_asset_acco_status = "3" then
        
        SET v_error_code = "prodA.1.302.122";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取产品本币币种
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetProductMoneyType;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetProductMoneyType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_crncy_type varchar(3)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);

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
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_产品信息表][{本币币种}][@本币币种#][{产品编号}=@产品编号#][4][@产品编号#] */
    select crncy_type into v_crncy_type from db_prod.tb_pdacco_pd_info where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.303.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_crncy_type = v_crncy_type;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取产品份额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetProductShare;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetProductShare(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_share decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_share decimal(18,2);

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
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_share = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_产品信息表][{产品总份额}][@产品份额#][{产品编号}=@产品编号#][4][@产品编号#] */
    select pd_all_share into v_pd_share from db_prod.tb_pdacco_pd_info where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.304.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_share = v_pd_share;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_更新产品份额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_UpdateProductShare;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_UpdateProductShare(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_pd_share decimal(18,2),
    IN p_menu_no int,
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
    declare v_pd_no int;
    declare v_pd_share decimal(18,2);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_curr_share decimal(18,2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_curr_share decimal(18,2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_pd_code varchar(32);
    declare v_pd_name varchar(64);
    declare v_pd_flname varchar(255);
    declare v_fund_reg_code varchar(16);
    declare v_pd_manager varchar(32);
    declare v_found_date int;
    declare v_pd_type int;
    declare v_apply_currency varchar(3);
    declare v_crncy_type varchar(3);
    declare v_first_asset decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_pd_all_share decimal(18,2);
    declare v_pre_share decimal(18,2);
    declare v_his_max_per_nav decimal(18,4);
    declare v_pre_nav decimal(18,4);
    declare v_begin_NAV decimal(18,4);
    declare v_evalu_share decimal(18,2);
    declare v_pre_evalu_share decimal(18,2);
    declare v_coust_full_name varchar(255);
    declare v_coust_acco varchar(16);
    declare v_coust_acco_name varchar(64);
    declare v_warn_posi_value decimal(18,4);
    declare v_close_posi_value decimal(18,4);
    declare v_target_posi_ratio decimal(18,4);
    declare v_beta_coeffi decimal(18,12);
    declare v_custom_pd_class varchar(255);
    declare v_index_value int;
    declare v_remark_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);

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
    SET v_pd_no = p_pd_no;
    SET v_pd_share = p_pd_share;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_curr_share = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_curr_share = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_pd_code = " ";
    SET v_pd_name = " ";
    SET v_pd_flname = " ";
    SET v_fund_reg_code = " ";
    SET v_pd_manager = " ";
    SET v_found_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_type = 0;
    SET v_apply_currency = "CNY";
    SET v_crncy_type = "CNY";
    SET v_first_asset = 0;
    SET v_first_amt = 0;
    SET v_pd_all_share = 0;
    SET v_pre_share = 0;
    SET v_his_max_per_nav = 0;
    SET v_pre_nav = 0;
    SET v_begin_NAV = 0;
    SET v_evalu_share = 0;
    SET v_pre_evalu_share = 0;
    SET v_coust_full_name = " ";
    SET v_coust_acco = " ";
    SET v_coust_acco_name = " ";
    SET v_warn_posi_value = 0;
    SET v_close_posi_value = 0;
    SET v_target_posi_ratio = 0;
    SET v_beta_coeffi = 0;
    SET v_custom_pd_class = " ";
    SET v_index_value = 0;
    SET v_remark_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    
    #这个功能原本就是对当前份额的变动,现在就是修改了流水记录,20180625
    #set @当前份额# = @产品份额#;
    #[获取流水变动][{当前份额}][@当前份额#];

    /* [获取表记录变量][产品_账户_产品信息表][{当前份额}][@临时_当前份额#][{产品编号}=@产品编号#][4][@产品编号#] */
    select curr_share into v_tmp_curr_share from db_prod.tb_pdacco_pd_info where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.305.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品_账户_产品信息表][{当前份额}=@当前份额#][{产品编号}=@产品编号#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_pd_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_share=v_curr_share where pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.305.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_产品信息表][字段][字段变量][{产品编号}=@产品编号#][4][@产品编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, pd_no, 
        co_no, pd_code, pd_name, pd_flname, 
        fund_reg_code, pd_manager, found_date, pd_type, 
        apply_currency, crncy_type, first_asset, first_amt, 
        pd_all_share, curr_share, pre_share, his_max_per_nav, 
        pre_nav, begin_NAV, evalu_share, pre_evalu_share, 
        coust_full_name, coust_acco, coust_acco_name, warn_posi_value, 
        close_posi_value, target_posi_ratio, beta_coeffi, custom_pd_class, 
        index_value, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_pd_no, 
        v_co_no, v_pd_code, v_pd_name, v_pd_flname, 
        v_fund_reg_code, v_pd_manager, v_found_date, v_pd_type, 
        v_apply_currency, v_crncy_type, v_first_asset, v_first_amt, 
        v_pd_all_share, v_curr_share, v_pre_share, v_his_max_per_nav, 
        v_pre_nav, v_begin_NAV, v_evalu_share, v_pre_evalu_share, 
        v_coust_full_name, v_coust_acco, v_coust_acco_name, v_warn_posi_value, 
        v_close_posi_value, v_target_posi_ratio, v_beta_coeffi, v_custom_pd_class, 
        v_index_value, v_remark_info from db_prod.tb_pdacco_pd_info where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.305.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #[获取流水后信息][@当前份额#];

    /* set @流水变动字段#=@产品份额#-@临时_当前份额#; */
    set v_jour_occur_field=v_pd_share-v_tmp_curr_share;

    /* set @流水后信息#=@当前份额#; */
    set v_jour_after_occur_info=v_curr_share;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;
    #set @操作备注# = "更新产品当前份额";

    /* set @操作备注#="份额变动"; */
    set v_oper_remark_info="份额变动";

    /* [插入表记录][产品_账户_产品信息流水表][字段][字段变量][5][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.305.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_资产账户编号获取外部账号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_AssetAccoNoGetOutAcco;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_AssetAccoNoGetOutAcco(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;
    declare v_out_acco varchar(32);

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_资产账户通道信息表][{通道编号},{外部账号}][@通道编号#,@外部账号#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
    select pass_no,out_acco into v_pass_no,v_out_acco from db_prod.tb_pdacco_asset_acco_ch where asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.306.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_外部账号获取资产账户编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_OutAccoGetAssetAccoNo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_OutAccoGetAssetAccoNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int
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
    declare v_out_acco varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;

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
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_资产账户通道信息表][{机构编号},{产品编号},{资产账户编号}][@机构编号#,@产品编号#,@资产账户编号#][{通道编号}=@通道编号# and {外部账号}=@外部账号#][4][@通道编号#,@外部账号#] */
    select co_no,pd_no,asset_acco_no into v_co_no,v_pd_no,v_asset_acco_no from db_prod.tb_pdacco_asset_acco_ch where pass_no=v_pass_no and out_acco=v_out_acco limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.307.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取资产账户分笔费用类型串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetAssetAccoSplitFareStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetAssetAccoSplitFareStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_split_fee_typr_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_split_fee_typr_str varchar(64);

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_split_fee_typr_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_资产账户信息表][{分笔费用类型串}][@分笔费用类型串#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
    select split_fee_typr_str into v_split_fee_typr_str from db_prod.tb_pdacco_asset_acco where asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.308.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_split_fee_typr_str = v_split_fee_typr_str;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取产品业务控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetProdConfigStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetProdConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_busi_config_str varchar(64),
    IN p_pd_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_busi_config_str varchar(64);
    declare v_pd_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_config_str varchar(64);

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
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_pd_busi_config_str = p_pd_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_config_str = " ";

    
    label_pro:BEGIN
    
    #业务控制串位规则：1指令资金校验2指令持仓校验3交易资金校验4交易持仓校验5指令审批设置6审批通过自动下单7市价冻结方式8红利入账成本盈亏计算方式9清算入账类型10新股分配方式11补单回报处理方式12资产是否同步13成本重置标志

    #先比较机构与产品，以确定产品的业务控制配置串

    /* set @业务控制配置串# = ""; */
    set v_busi_config_str = "";
    #产品业务控制配置串，第1位处理

    /* if substring(@产品业务控制配置串#, 1, 1) = 《指令资金校验-不设置》 then */
    if substring(v_pd_busi_config_str, 1, 1) = 3 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 1, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 1, 1));
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 1, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 1, 1));
    end if;
    #产品业务控制配置串，第2位处理

    /* if substring(@产品业务控制配置串#, 2, 1) = 《指令持仓校验-不设置》 then */
    if substring(v_pd_busi_config_str, 2, 1) = 3 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 2, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 2, 1));
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 2, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 2, 1));
    end if;
    #产品业务控制配置串，第3位处理

    /* if substring(@产品业务控制配置串#, 3, 1) = 《交易资金校验-不设置》 then */
    if substring(v_pd_busi_config_str, 3, 1) = 3 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 3, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 3, 1));
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 3, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 3, 1));
    end if;
    #产品业务控制配置串，第4位处理

    /* if substring(@产品业务控制配置串#, 4, 1) = 《交易持仓校验-不设置》 then */
    if substring(v_pd_busi_config_str, 4, 1) = 3 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 4, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 4, 1));
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 4, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 4, 1));
    end if;
    #产品业务控制配置串，第5位处理

    /* if substring(@产品业务控制配置串#, 5, 1) = 《指令审批设置-不设置》 then */
    if substring(v_pd_busi_config_str, 5, 1) = 3 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 5, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 5, 1));
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 5, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 5, 1));
    end if;
    #产品业务控制配置串，第6位处理

    /* if substring(@产品业务控制配置串#, 6, 1) = 《审批通过自动下单-不设置》 then */
    if substring(v_pd_busi_config_str, 6, 1) = 3 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 6, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 6, 1));
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 6, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 6, 1));
    end if;
    #产品业务控制配置串，第7位处理

    /* if substring(@产品业务控制配置串#, 7, 1) = 《市价冻结方式-不设置》 then */
    if substring(v_pd_busi_config_str, 7, 1) = 4 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 7, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 7, 1));
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 7, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 7, 1));
    end if;
    #产品业务控制配置串，第8位处理，直接取机构级

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 8, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 8, 1));
    #产品业务控制配置串，第9位处理，直接取机构级

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 9, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 9, 1));
    #产品业务控制配置串，第10位处理，直接取机构级

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 10, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 10, 1));
    #产品业务控制配置串，第11位处理

    /* if substring(@产品业务控制配置串#, 11, 1) = 《补单回报处理方式-不设置》 then */
    if substring(v_pd_busi_config_str, 11, 1) = 3 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 11, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 11, 1));
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 11, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 11, 1));
    end if;
    #产品业务控制配置串，第12位处理，直接取机构级,

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 12, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 12, 1));
    #产品业务控制配置串，第13位处理，直接取机构级,

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 13, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 13, 1));
    #产品业务控制配置串，第14位处理，直接取机构级,

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 14, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 14, 1));
    #产品业务控制配置串，第15位处理，直接取机构级,

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 15, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 15, 1));
    #产品业务控制配置串，第16位处理，直接取机构级,

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@机构业务控制配置串#, 16, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_co_busi_config_str, 16, 1));
    #以比较后生成的产品业务控制配置串替代原变量

    /* set @业务控制配置串# = concat(@业务控制配置串#, right(@产品业务控制配置串#, length(@产品业务控制配置串#) - 16)); */
    set v_busi_config_str = concat(v_busi_config_str, right(v_pd_busi_config_str, length(v_pd_busi_config_str) - 16));
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_config_str = v_busi_config_str;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取交易组业务控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetExgpConfigStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetExgpConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_busi_config_str varchar(64),
    IN p_pd_busi_config_str varchar(64),
    IN p_exgp_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_busi_config_str varchar(64);
    declare v_pd_busi_config_str varchar(64);
    declare v_exgp_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_config_str varchar(64);

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
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_pd_busi_config_str = p_pd_busi_config_str;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_获取产品业务控制配置串】*/
    call db_prod.pra_pdacco_GetProdConfigStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_busi_config_str,
        v_pd_busi_config_str,
        v_error_code,
        v_error_info,
        v_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "prodA.1.310.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取产品业务控制配置串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @产品业务控制配置串# = @业务控制配置串#; */
    set v_pd_busi_config_str = v_busi_config_str;
    #再比较交易组与产品，以确定交易组的业务控制配置串

    /* set @业务控制配置串# = ""; */
    set v_busi_config_str = "";
    #交易组业务控制配置串，第1位处理，直接取产品级，如果不设置则默认为是

    /* if substring(@产品业务控制配置串#, 1, 1) = 《指令资金校验-不设置》 then */
    if substring(v_pd_busi_config_str, 1, 1) = 3 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, 《指令资金校验-是》); */
        set v_busi_config_str = concat(v_busi_config_str, 1);
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 1, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 1, 1));
    end if;
    #交易组业务控制配置串，第2位处理，直接取产品级，如果不设置则默认为是

    /* if substring(@产品业务控制配置串#, 2, 1) = 《指令持仓校验-不设置》 then */
    if substring(v_pd_busi_config_str, 2, 1) = 3 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, 《指令持仓校验-是》); */
        set v_busi_config_str = concat(v_busi_config_str, 1);
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 2, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 2, 1));
    end if;
    #交易组业务控制配置串，第3位处理，直接取产品级，如果不设置则默认为是

    /* if substring(@产品业务控制配置串#, 3, 1) = 《交易资金校验-不设置》 then */
    if substring(v_pd_busi_config_str, 3, 1) = 3 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, 《交易资金校验-是》); */
        set v_busi_config_str = concat(v_busi_config_str, 1);
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 3, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 3, 1));
    end if;
    #交易组业务控制配置串，第4位处理，直接取产品级，如果不设置则默认为是

    /* if substring(@产品业务控制配置串#, 4, 1) = 《交易持仓校验-不设置》 then */
    if substring(v_pd_busi_config_str, 4, 1) = 3 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, 《交易持仓校验-是》); */
        set v_busi_config_str = concat(v_busi_config_str, 1);
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 4, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 4, 1));
    end if;
    #交易组业务控制配置串，第5位直接取产品业务控制配置串第5位，以保存系统对指令审批设置的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 5, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 5, 1));
    #交易组业务控制配置串，第6位直接取产品业务控制配置串第6位，以保存系统对审批通过自动下单的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 6, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 6, 1));
    #交易组业务控制配置串，第7位处理，直接取产品级，如果不设置则默认为最新价

    /* if substring(@产品业务控制配置串#, 7, 1) = 《市价冻结方式-不设置》 then */
    if substring(v_pd_busi_config_str, 7, 1) = 4 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, 《市价冻结方式-最新价》); */
        set v_busi_config_str = concat(v_busi_config_str, 2);
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 7, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 7, 1));
    end if;
    #交易组业务控制配置串，第8位直接取产品业务控制配置串第8位，以保存系统对红利入账成本盈亏计算方式的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 8, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 8, 1));
    #交易组业务控制配置串，第9位直接取产品业务控制配置串第9位，以保存系统对清算入账类型的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 9, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 9, 1));
    #交易组业务控制配置串，第10位直接取产品业务控制配置串第10位，以保存系统对新股分配方式的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 10, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 10, 1));
    #交易组业务控制配置串，第11位直接取产品业务控制配置串第11位，以保存系统对补单回报处理方式的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 11, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 11, 1));
    #交易组业务控制配置串，第12位直接取产品业务控制配置串第12位，以保存系统对资产账户资产是否同步的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 12, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 12, 1));
    #交易组业务控制配置串，第13位直接取产品业务控制配置串第13位，以保存系统对成本重置标志的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 13, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 13, 1));
    #交易组业务控制配置串，第14位直接取产品业务控制配置串第14位，以保存系统对证券是否接收系统外证券订单的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 14, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 14, 1));
    #交易组业务控制配置串，第15位直接取产品业务控制配置串第15位，以保存系统对沪港通交易方式的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 15, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 15, 1));
    #交易组业务控制配置串，第16位直接取产品业务控制配置串第16位，以保存系统对深港通交易方式的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 16, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 16, 1));
    #补上后续其他位的串

    /* set @业务控制配置串# = concat(@业务控制配置串#, right(@交易组业务控制配置串#, length(@交易组业务控制配置串#) - 16)); */
    set v_busi_config_str = concat(v_busi_config_str, right(v_exgp_busi_config_str, length(v_exgp_busi_config_str) - 16));
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_config_str = v_busi_config_str;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取资产账户业务控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetAsacConfigStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetAsacConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_busi_config_str varchar(64),
    IN p_pd_busi_config_str varchar(64),
    IN p_asac_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_co_busi_config_str varchar(64);
    declare v_pd_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_config_str varchar(64);

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
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_pd_busi_config_str = p_pd_busi_config_str;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_账户_获取产品业务控制配置串】*/
    call db_prod.pra_pdacco_GetProdConfigStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_busi_config_str,
        v_pd_busi_config_str,
        v_error_code,
        v_error_info,
        v_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "prodA.1.311.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取产品业务控制配置串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @产品业务控制配置串# = @业务控制配置串#; */
    set v_pd_busi_config_str = v_busi_config_str;
    #再比较资产账户与产品，以确定资产账户的业务控制配置串

    /* set @业务控制配置串# = ""; */
    set v_busi_config_str = "";
    #资产账户业务控制配置串，第1位处理，直接取产品级，如果不设置则默认为是

    /* if substring(@产品业务控制配置串#, 1, 1) = 《指令资金校验-不设置》 then */
    if substring(v_pd_busi_config_str, 1, 1) = 3 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, 《指令资金校验-是》); */
        set v_busi_config_str = concat(v_busi_config_str, 1);
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 1, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 1, 1));
    end if;
    #资产账户业务控制配置串，第2位处理，直接取产品级，如果不设置则默认为是

    /* if substring(@产品业务控制配置串#, 2, 1) = 《指令持仓校验-不设置》 then */
    if substring(v_pd_busi_config_str, 2, 1) = 3 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, 《指令持仓校验-是》); */
        set v_busi_config_str = concat(v_busi_config_str, 1);
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 2, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 2, 1));
    end if;
    #资产账户业务控制配置串，第3位处理，直接取产品级，如果不设置则默认为是

    /* if substring(@产品业务控制配置串#, 3, 1) = 《交易资金校验-不设置》 then */
    if substring(v_pd_busi_config_str, 3, 1) = 3 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, 《交易资金校验-是》); */
        set v_busi_config_str = concat(v_busi_config_str, 1);
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 3, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 3, 1));
    end if;
    #资产账户业务控制配置串，第4位处理，直接取产品级，如果不设置则默认为是

    /* if substring(@产品业务控制配置串#, 4, 1) = 《交易持仓校验-不设置》 then */
    if substring(v_pd_busi_config_str, 4, 1) = 3 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, 《交易持仓校验-是》); */
        set v_busi_config_str = concat(v_busi_config_str, 1);
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 4, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 4, 1));
    end if;
    #资产账户业务控制配置串，第5位直接取产品业务控制配置串第5位，以保存系统对指令审批设置的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 5, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 5, 1));
    #资产账户业务控制配置串，第6位直接取产品业务控制配置串第6位，以保存系统对审批通过自动下单的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 6, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 6, 1));
    #资产账户业务控制配置串，第7位处理，直接取产品级，如果不设置则默认为最新价

    /* if substring(@产品业务控制配置串#, 7, 1) = 《市价冻结方式-不设置》 then */
    if substring(v_pd_busi_config_str, 7, 1) = 4 then

        /* set @业务控制配置串# = concat(@业务控制配置串#, 《市价冻结方式-最新价》); */
        set v_busi_config_str = concat(v_busi_config_str, 2);
    else

        /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 7, 1)); */
        set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 7, 1));
    end if;
    #资产账户业务控制配置串，第8位直接取产品业务控制配置串第8位，以保存系统对红利入账成本盈亏计算方式的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 8, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 8, 1));
    #资产账户业务控制配置串，第9位直接取产品业务控制配置串第9位，以保存系统对清算入账类型的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 9, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 9, 1));
    #资产账户业务控制配置串，第10位直接取产品业务控制配置串第10位，以保存系统对新股分配方式的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 10, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 10, 1));
    #资产账户业务控制配置串，第11位直接取资产账户业务控制配置串第11位，以保存系统对资产账户补单回报处理方式的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@资产账户业务控制配置串#, 11, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_asac_busi_config_str, 11, 1));
    #资产账户业务控制配置串，第12位直接取资产账户业务控制配置串第12位，以保存系统对资产账户资产是否同步的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@资产账户业务控制配置串#, 12, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_asac_busi_config_str, 12, 1));
    #资产账户业务控制配置串，第13位直接取产品业务控制配置串第13位，以保存系统对成本重置标志的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@产品业务控制配置串#, 13, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_pd_busi_config_str, 13, 1));
    #资产账户业务控制配置串，第14位直接取资产账户业务控制配置串第14位，以保存系统对证券是否接收系统外证券订单的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@资产账户业务控制配置串#, 14, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_asac_busi_config_str, 14, 1));
    #资产账户业务控制配置串，第15位直接取资产账户业务控制配置串第15位，以保存系统对沪港通交易方式的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@资产账户业务控制配置串#, 15, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_asac_busi_config_str, 15, 1));
    #资产账户业务控制配置串，第16位直接取资产账户业务控制配置串第16位，以保存系统对沪港通交易方式的配置

    /* set @业务控制配置串# = concat(@业务控制配置串#, substring(@资产账户业务控制配置串#, 16, 1)); */
    set v_busi_config_str = concat(v_busi_config_str, substring(v_asac_busi_config_str, 16, 1));
    #补上后续其他位的串

    /* set @业务控制配置串# = concat(@业务控制配置串#, right(@资产账户业务控制配置串#, length(@资产账户业务控制配置串#) - 16)); */
    set v_busi_config_str = concat(v_busi_config_str, right(v_asac_busi_config_str, length(v_asac_busi_config_str) - 16));
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_config_str = v_busi_config_str;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取外部账号资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetOutAccoAssetAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetOutAccoAssetAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_busi_config_str varchar(64)
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
    declare v_out_acco varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_busi_config_str varchar(64);
    declare v_asset_acco_status varchar(2);
    declare v_pd_status varchar(2);

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
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_busi_config_str = " ";
    SET v_asset_acco_status = "0";
    SET v_pd_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_资产账户通道信息表][{机构编号},{产品编号},{资产账户编号}][@机构编号#,@产品编号#,@资产账户编号#][{通道编号}=@通道编号# and {外部账号}=@外部账号#][4][@通道编号#,@外部账号#] */
    select co_no,pd_no,asset_acco_no into v_co_no,v_pd_no,v_asset_acco_no from db_prod.tb_pdacco_asset_acco_ch where pass_no=v_pass_no and out_acco=v_out_acco limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.312.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_资产账户信息表][{业务控制配置串},{资产账户状态}][@业务控制配置串#,@资产账户状态#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#][4][@机构编号#,@产品编号#,@资产账户编号#] */
    select busi_config_str,asset_acco_status into v_busi_config_str,v_asset_acco_status from db_prod.tb_pdacco_asset_acco where co_no=v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.312.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@资产账户状态# = 《资产账户状态-冻结》][121][@资产账户编号#,@资产账户状态#] */
    if v_asset_acco_status = "2" then
        
        SET v_error_code = "prodA.1.312.121";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@资产账户状态# = 《资产账户状态-注销》][122][@资产账户编号#,@资产账户状态#] */
    if v_asset_acco_status = "3" then
        
        SET v_error_code = "prodA.1.312.122";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_产品限制信息表][{产品状态}][@产品状态#][{产品编号}=@产品编号#][4][@产品编号#] */
    select pd_status into v_pd_status from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.312.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@产品状态# = 《产品状态-冻结》][101][@产品编号#,@产品状态#] */
    if v_pd_status = "2" then
        
        SET v_error_code = "prodA.1.312.101";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@产品状态# = 《产品状态-注销》][102][@产品编号#,@产品状态#] */
    if v_pd_status = "3" then
        
        SET v_error_code = "prodA.1.312.102";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_busi_config_str = v_busi_config_str;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取资产账户编号外部账号信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetAccoNoOutAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetAccoNoOutAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_busi_config_str varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_busi_config_str varchar(64);
    declare v_pd_no int;
    declare v_asset_acco_status varchar(2);
    declare v_pd_status varchar(2);

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_busi_config_str = " ";
    SET v_pd_no = 0;
    SET v_asset_acco_status = "0";
    SET v_pd_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_资产账户通道信息表][{通道编号},{外部账号}][@通道编号#,@外部账号#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
    select pass_no,out_acco into v_pass_no,v_out_acco from db_prod.tb_pdacco_asset_acco_ch where asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.313.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_资产账户信息表][{产品编号},{业务控制配置串},{资产账户状态}][@产品编号#,@业务控制配置串#,@资产账户状态#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
    select pd_no,busi_config_str,asset_acco_status into v_pd_no,v_busi_config_str,v_asset_acco_status from db_prod.tb_pdacco_asset_acco where asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.313.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@资产账户状态# = 《资产账户状态-冻结》][121][@资产账户编号#,@资产账户状态#] */
    if v_asset_acco_status = "2" then
        
        SET v_error_code = "prodA.1.313.121";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@资产账户状态# = 《资产账户状态-注销》][122][@资产账户编号#,@资产账户状态#] */
    if v_asset_acco_status = "3" then
        
        SET v_error_code = "prodA.1.313.122";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_产品限制信息表][{产品状态}][@产品状态#][{产品编号}=@产品编号#][4][@产品编号#] */
    select pd_status into v_pd_status from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.313.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@产品状态# = 《产品状态-冻结》][101][@产品编号#,@产品状态#] */
    if v_pd_status = "2" then
        
        SET v_error_code = "prodA.1.313.101";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@产品状态# = 《产品状态-注销》][102][@产品编号#,@产品状态#] */
    if v_pd_status = "3" then
        
        SET v_error_code = "prodA.1.313.102";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_busi_config_str = v_busi_config_str;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取通道资产账户编号串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetAssetAccoNoStrByChannel;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetAssetAccoNoStrByChannel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asset_acco_no_str varchar(2048)
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
    declare v_asset_acco_no_str varchar(2048);

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
    SET v_asset_acco_no_str = " ";

    
    label_pro:BEGIN
    

    /* select group_concat(a.{资产账户编号} SEPARATOR ";") into @资产账户编号串# from ~产品_账户_资产账户通道信息表^ a, ~产品_账户_资产账户信息表^ b where a.{通道编号} = @通道编号# and a.{资产账户编号}=b.{资产账户编号} and b.{资产账户状态}=《资产账户状态-正常》; */
    select group_concat(a.asset_acco_no SEPARATOR ";") into v_asset_acco_no_str from db_prod.tb_pdacco_asset_acco_ch a, db_prod.tb_pdacco_asset_acco b where a.pass_no = v_pass_no and a.asset_acco_no=b.asset_acco_no and b.asset_acco_status="1";

    /* set @资产账户编号串# = ifnull(@资产账户编号串#," "); */
    set v_asset_acco_no_str = ifnull(v_asset_acco_no_str," ");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asset_acco_no_str = v_asset_acco_no_str;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_资产账户编号获取资产账户
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_AssetAccoNoGetAssetAcco;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_AssetAccoNoGetAssetAcco(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asset_acco varchar(16)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco varchar(16);

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_资产账户信息表][{资产账户}][@资产账户#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
    select asset_acco into v_asset_acco from db_prod.tb_pdacco_asset_acco where asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.315.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asset_acco = v_asset_acco;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询报盘所需资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryAssetAccoByTrans;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryAssetAccoByTrans(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_asset_acco_no_str varchar(2048),
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
    declare v_asset_acco_no_str varchar(2048);
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
    SET v_pass_no = p_pass_no;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录两表关联][产品_账户_资产账户通道信息表][产品_账户_资产账户信息表][@通道编号# as {通道编号},a.{资产账户编号},b.{资产账户},a.{外部账号},a.{通讯密码},a.{交易密码},a.{参数配置串},b.{业务控制配置串} as {资产账户业务控制配置串}][{通道编号}=@通道编号# and a.{资产账户编号}=b.{资产账户编号} and instr(@资产账户编号串#,concat(";",a.{资产账户编号},";"))>0 order by a.{资产账户编号}][@指定行数#] */
    if v_row_count = -1 then
        select v_pass_no as pass_no,a.asset_acco_no,b.asset_acco,a.out_acco,a.comm_pwd,a.trade_pwd,a.config_str,b.busi_config_str as asac_busi_config_str from db_prod.tb_pdacco_asset_acco_ch a,db_prod.tb_pdacco_asset_acco b where pass_no=v_pass_no and a.asset_acco_no=b.asset_acco_no and instr(v_asset_acco_no_str,concat(";",a.asset_acco_no,";"))>0 order by a.asset_acco_no;
    else
        select v_pass_no as pass_no,a.asset_acco_no,b.asset_acco,a.out_acco,a.comm_pwd,a.trade_pwd,a.config_str,b.busi_config_str as asac_busi_config_str from db_prod.tb_pdacco_asset_acco_ch a,db_prod.tb_pdacco_asset_acco b where pass_no=v_pass_no and a.asset_acco_no=b.asset_acco_no and instr(v_asset_acco_no_str,concat(";",a.asset_acco_no,";"))>0 order by a.asset_acco_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询产品份额变动流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryProdShareOccurJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryProdShareOccurJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][产品_账户_产品信息流水表][{初始化日期},create_time,{机构编号},{产品编号},{操作员编号},{流水变动字段},{流水后信息}][{机构编号}=@机构编号# and (@产品编号#={产品编号} or @产品编号#=0) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and {初始化日期}<>0 and {操作备注}="份额变动" order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select init_date,create_time,co_no,pd_no,opor_no,jour_occur_field,jour_after_occur_info from db_prod.tb_pdacco_pd_info_jour where co_no=v_co_no and (v_pd_no=pd_no or v_pd_no=0) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and init_date<>0 and oper_remark_info="份额变动" order by row_id;
    else
        select init_date,create_time,co_no,pd_no,opor_no,jour_occur_field,jour_after_occur_info from db_prod.tb_pdacco_pd_info_jour where co_no=v_co_no and (v_pd_no=pd_no or v_pd_no=0) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and init_date<>0 and oper_remark_info="份额变动" order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询产品份额变动流水历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryProdShareOccurJourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryProdShareOccurJourHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_no_rights_str varchar(2048),
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
    declare v_pd_no int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_pd_no = p_pd_no;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][历史_产品_账户_产品信息流水表][{初始化日期},create_time,{机构编号},{产品编号},{操作员编号},{流水变动字段},{流水后信息}][{机构编号}=@机构编号# and (@产品编号#={产品编号} or @产品编号#=0) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and {初始化日期}>=@开始日期# and {初始化日期}<=@结束日期# and {操作备注}="份额变动" order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select init_date,create_time,co_no,pd_no,opor_no,jour_occur_field,jour_after_occur_info from db_prod_his.tb_pdacco_pd_info_jour_his where co_no=v_co_no and (v_pd_no=pd_no or v_pd_no=0) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and init_date>=v_begin_date and init_date<=v_end_date and oper_remark_info="份额变动" order by row_id;
    else
        select init_date,create_time,co_no,pd_no,opor_no,jour_occur_field,jour_after_occur_info from db_prod_his.tb_pdacco_pd_info_jour_his where co_no=v_co_no and (v_pd_no=pd_no or v_pd_no=0) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and init_date>=v_begin_date and init_date<=v_end_date and oper_remark_info="份额变动" order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_修改产品限制信息风控版
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_ModiProductLimitForRK;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_ModiProductLimitForRK(
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
    IN p_cost_calc_type int,
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
    IN p_comm_appr_oper int,
    IN p_market_price_ratio decimal(18,12),
    IN p_forbid_order_dir varchar(64),
    IN p_comm_no_limit_price_ratio decimal(18,12),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_status varchar(2),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_cost_calc_type int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_comm_appr_oper int;
    declare v_market_price_ratio decimal(18,12);
    declare v_forbid_order_dir varchar(64);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_status varchar(2);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_pd_market_price_ratio decimal(18,12);
    declare v_pd_comm_no_limit_price_ratio decimal(18,12);
    declare v_pd_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_market_price_ratio = p_market_price_ratio;
    SET v_forbid_order_dir = p_forbid_order_dir;
    SET v_comm_no_limit_price_ratio = p_comm_no_limit_price_ratio;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_status = "0";
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_pd_market_price_ratio = 0;
    SET v_pd_comm_no_limit_price_ratio = 0;
    SET v_pd_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "成本计算方式", "|", "允许投资市场", "|", "允许操作证券类型", "|", "指令审批操作员", "|", "市价冻结浮动比例", "|", "禁止订单方向", "|", "指令不限价浮动比例", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_cost_calc_type, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_comm_appr_oper, "|", v_market_price_ratio, "|", v_forbid_order_dir, "|", v_comm_no_limit_price_ratio, "|", v_menu_no, "|");


    /* [更新表记录][产品_账户_产品限制信息表][{成本计算方式}=@成本计算方式#, {允许投资市场}=@允许投资市场#, {允许操作证券类型}=@允许操作证券类型#, {指令审批操作员}=@指令审批操作员#, {市价冻结浮动比例}=@市价冻结浮动比例#, {禁止订单方向}=@禁止订单方向#, {指令不限价浮动比例}=@指令不限价浮动比例#][{产品编号}=@产品编号#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_pd_limit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cost_calc_type=v_cost_calc_type, allow_exch=v_allow_exch, allow_stock_type=v_allow_stock_type, comm_appr_oper=v_comm_appr_oper, market_price_ratio=v_market_price_ratio, forbid_order_dir=v_forbid_order_dir, comm_no_limit_price_ratio=v_comm_no_limit_price_ratio where pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.504.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_产品限制信息表][{产品状态},{市价冻结浮动比例},{指令不限价浮动比例},{更新次数}][@产品状态#,@产品市价冻结浮动比例#,@产品指令不限价浮动比例#,@产品更新次数#][{产品编号}=@产品编号#][4][@产品编号#] */
    select pd_status,market_price_ratio,comm_no_limit_price_ratio,update_times into v_pd_status,v_pd_market_price_ratio,v_pd_comm_no_limit_price_ratio,v_pd_update_times from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.504.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量]; */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_cost_calc_type, "|", v_allow_exch, "|", v_allow_stock_type, "|", v_comm_appr_oper, "|", v_market_price_ratio, "|", v_forbid_order_dir, "|", v_comm_no_limit_price_ratio, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "修改产品限制信息"; */
    set v_oper_remark_info = "修改产品限制信息";

    /* [插入表记录][产品_账户_产品限制信息流水表][字段][字段变量][5][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_limit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.504.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @产品更新次数#; */
    set v_update_times = v_pd_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_status = v_pd_status;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_修改产品工作流信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_ModiPdWorkflowInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_ModiPdWorkflowInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_workflow_type int,
    IN p_pd_no int,
    IN p_workflow_num int,
    IN p_opor_no_str varchar(2048),
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
    declare v_workflow_type int;
    declare v_pd_no int;
    declare v_workflow_num int;
    declare v_opor_no_str varchar(2048);
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
    SET v_workflow_type = p_workflow_type;
    SET v_pd_no = p_pd_no;
    SET v_workflow_num = p_workflow_num;
    SET v_opor_no_str = p_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][产品_账户_产品工作流信息表][字段][字段变量][1][@机构编号#,@产品编号#,@工作流模式#,@工作流顺序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_workflow(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, workflow_type, 
        pd_no, workflow_num, opor_no_str) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_workflow_type, 
        v_pd_no, v_workflow_num, v_opor_no_str);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.80.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","工作流模式=",v_workflow_type,",","工作流顺序号=",v_workflow_num),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询产品工作流信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryPdWorkflowInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryPdWorkflowInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][产品_账户_产品工作流信息表][字段][instr(@产品编号权限串#,concat(";",{产品编号},";"))>0][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        workflow_type, pd_no, workflow_num, opor_no_str from db_prod.tb_pdacco_pd_workflow where instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        workflow_type, pd_no, workflow_num, opor_no_str from db_prod.tb_pdacco_pd_workflow where instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询账户同步信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryAccoSyncInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryAccoSyncInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_row_id bigint,
    IN p_co_no int,
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
    declare v_pd_no int;
    declare v_row_id bigint;
    declare v_co_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_co_no = p_co_no;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录两表关联][产品_账户_资产账户信息表][产品_账户_资产账户通道信息表][a.{记录序号},b.{资产账户编号},b.{外部账号},a.{产品编号},a.{机构编号},a.{资产账户类型},a.{资产账户状态},b.{密码验证状态},b.{在线状态},b.{通道编号},a.{允许投资市场},a.{允许操作证券类型}][a.{资产账户编号}=b.{资产账户编号} and a.{机构编号}=@机构编号# and (@产品编号# = 0 or a.{产品编号}=@产品编号#) and instr(@产品编号权限串#, concat(";",a.{产品编号},";")) > 0 and a.{记录序号} > @记录序号# order by a.{记录序号} ][@指定行数#] */
    if v_row_count = -1 then
        select a.row_id,b.asset_acco_no,b.out_acco,a.pd_no,a.co_no,a.asset_acco_type,a.asset_acco_status,b.pwd_check_status,b.online_status,b.pass_no,a.allow_exch,a.allow_stock_type from db_prod.tb_pdacco_asset_acco a,db_prod.tb_pdacco_asset_acco_ch b where a.asset_acco_no=b.asset_acco_no and a.co_no=v_co_no and (v_pd_no = 0 or a.pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",a.pd_no,";")) > 0 and a.row_id > v_row_id order by a.row_id ;
    else
        select a.row_id,b.asset_acco_no,b.out_acco,a.pd_no,a.co_no,a.asset_acco_type,a.asset_acco_status,b.pwd_check_status,b.online_status,b.pass_no,a.allow_exch,a.allow_stock_type from db_prod.tb_pdacco_asset_acco a,db_prod.tb_pdacco_asset_acco_ch b where a.asset_acco_no=b.asset_acco_no and a.co_no=v_co_no and (v_pd_no = 0 or a.pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",a.pd_no,";")) > 0 and a.row_id > v_row_id order by a.row_id  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取资产账户密码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetAssetAccoPwd;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetAssetAccoPwd(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_pwd varchar(64),
    OUT p_comm_pwd varchar(64)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_pwd varchar(64);
    declare v_comm_pwd varchar(64);

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_pwd = " ";
    SET v_comm_pwd = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_资产账户通道信息表][{交易密码},{通讯密码}][@交易密码#,@通讯密码#][{资产账户编号}=@资产账户编号# and {密码验证状态}=《密码验证状态-已验证》][4][@资产账户编号#] */
    select trade_pwd,comm_pwd into v_trade_pwd,v_comm_pwd from db_prod.tb_pdacco_asset_acco_ch where asset_acco_no=v_asset_acco_no and pwd_check_status=2 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.83.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_pwd = v_trade_pwd;
    SET p_comm_pwd = v_comm_pwd;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取产品工作流信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetPdWorkflowInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetPdWorkflowInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_co_no int,
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
    declare v_pd_no int;
    declare v_co_no int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][产品_账户_产品工作流信息表][{工作流模式},{工作流顺序号},{操作员编号串}][ {机构编号}=@机构编号# and (@产品编号#={产品编号} or @产品编号#=0) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0][@指定行数#] */
    if v_row_count = -1 then
        select workflow_type,workflow_num,opor_no_str from db_prod.tb_pdacco_pd_workflow where  co_no=v_co_no and (v_pd_no=pd_no or v_pd_no=0) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0;
    else
        select workflow_type,workflow_num,opor_no_str from db_prod.tb_pdacco_pd_workflow where  co_no=v_co_no and (v_pd_no=pd_no or v_pd_no=0) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_更新资产账户密码验证状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_UpdateAssetAccoPwdCheckStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_UpdateAssetAccoPwdCheckStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_pwd_check_status int,
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
    declare v_out_acco varchar(32);
    declare v_pwd_check_status int;
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_pwd_check_status = p_pwd_check_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品_账户_资产账户通道信息表][{密码验证状态}=@密码验证状态#][{通道编号}=@通道编号# and {外部账号}=@外部账号#][2][@通道编号#,@外部账号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_asset_acco_ch set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pwd_check_status=v_pwd_check_status where pass_no=v_pass_no and out_acco=v_out_acco;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.85.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_删除产品工作流信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_DeletePdWorkflowInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_DeletePdWorkflowInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_co_no int,
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
    declare v_pd_no int;
    declare v_co_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;

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
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [获取表记录数量][产品_账户_产品工作流信息表][@记录个数#][{机构编号}=@机构编号# and {产品编号}=@产品编号#] */
    select count(1) into v_record_count from db_prod.tb_pdacco_pd_workflow where co_no=v_co_no and pd_no=v_pd_no;


    /* if @记录个数# >0  then */
    if v_record_count >0  then

           /* [删除表记录][产品_账户_产品工作流信息表][{产品编号}=@产品编号# and {机构编号}=@机构编号#][3][@产品编号#,@机构编号#] */
           delete from db_prod.tb_pdacco_pd_workflow 
               where pd_no=v_pd_no and co_no=v_co_no;
           if v_error_code = 1 then
                       
               SET v_error_code = "prodA.1.86.3";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","机构编号=",v_co_no),"#",v_mysql_message);
               else
                   SET v_error_info = concat("产品编号=",v_pd_no,",","机构编号=",v_co_no);
               end if;
               leave label_pro;
           end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_更新开盘检查流程
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_UpdateOpenCheckFlow;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_UpdateOpenCheckFlow(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_execute_type int,
    IN p_init_step int,
    IN p_exec_date int,
    IN p_begin_time int,
    IN p_open_execute_type int,
    IN p_open_execute_result int,
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
    declare v_execute_type int;
    declare v_init_step int;
    declare v_exec_date int;
    declare v_begin_time int;
    declare v_open_execute_type int;
    declare v_open_execute_result int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_mach_time int;
    declare v_exec_time int;
    declare v_update_date int;
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_execute_type = p_execute_type;
    SET v_init_step = p_init_step;
    SET v_exec_date = p_exec_date;
    SET v_begin_time = p_begin_time;
    SET v_open_execute_type = p_open_execute_type;
    SET v_open_execute_result = p_open_execute_result;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_exec_time = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @执行时间# = @机器时间#; */
    set v_exec_time = v_mach_time;

    /* set @执行日期#=@更新日期#; */
    set v_exec_date=v_update_date;

    /* [插入重复更新][产品_账户_开盘检查流程表][字段][字段变量][{执行方式}=@执行方式#,{初始化步骤}=@初始化步骤#,{开始时间}=@开始时间#,{执行日期}=@更新日期#,{执行时间}=@执行时间#,{开盘检查执行状态}=@开盘检查执行状态#,{开盘检查执行结果}=@开盘检查执行结果#,{备注信息}=@备注信息#][2][@初始化步骤#,@执行日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_open_check_flow (
        create_date, create_time, update_date, 
        update_time, update_times, execute_type, init_step, 
        begin_time, exec_date, exec_time, open_execute_type, 
        open_execute_result, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_execute_type, v_init_step, 
        v_begin_time, v_exec_date, v_exec_time, v_open_execute_type, 
        v_open_execute_result, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, execute_type=v_execute_type,init_step=v_init_step,begin_time=v_begin_time,exec_date=v_update_date,exec_time=v_exec_time,open_execute_type=v_open_execute_type,open_execute_result=v_open_execute_result,remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.87.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化步骤=",v_init_step,",","执行日期=",v_exec_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化步骤=",v_init_step,",","执行日期=",v_exec_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询开盘检查流程
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryOpenCheckFlow;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryOpenCheckFlow(
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
    

    /* select {执行方式},{初始化步骤},{开始时间},{执行日期},{执行时间},{开盘检查执行状态},{开盘检查执行结果},{备注信息} from ~产品_账户_开盘检查流程表^ a where a.{执行日期}=(select max({执行日期}) from  ~产品_账户_开盘检查流程表^ where a.{初始化步骤}={初始化步骤}) order by {初始化步骤}; */
    select execute_type,init_step,begin_time,exec_date,exec_time,open_execute_type,open_execute_result,remark_info from db_prod.tb_pdacco_open_check_flow a where a.exec_date=(select max(exec_date) from  db_prod.tb_pdacco_open_check_flow where a.init_step=init_step) order by init_step;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取开盘检查流程
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetOpenCheckFlow;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetOpenCheckFlow(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_step int,
    IN p_exec_date int,
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
    declare v_init_step int;
    declare v_exec_date int;
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
    SET v_init_step = p_init_step;
    SET v_exec_date = p_exec_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][产品_账户_开盘检查流程表][{执行方式},{初始化步骤},{开始时间},{执行日期},{执行时间},{开盘检查执行状态},{开盘检查执行结果},{备注信息}][{初始化步骤} = @初始化步骤# and {执行日期} = @执行日期#] */
    select execute_type,init_step,begin_time,exec_date,exec_time,open_execute_type,open_execute_result,remark_info from db_prod.tb_pdacco_open_check_flow where init_step = v_init_step and exec_date = v_exec_date;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询收盘作业流程
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryCloseCheckFlow;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryCloseCheckFlow(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_flow_business int,
    IN p_exec_date int,
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
    declare v_flow_business int;
    declare v_exec_date int;
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
    SET v_flow_business = p_flow_business;
    SET v_exec_date = p_exec_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if (@流程业务# = 0 and @执行日期# = 0) then */
    if (v_flow_business = 0 and v_exec_date = 0) then

            /* select {操作员编号},{执行方式},{流程业务},{开始时间},{执行日期},{执行时间},{收盘作业执行状态},{异常处理方式} from ~产品_账户_收盘作业流程表^ a where a.{执行日期}=(select max({执行日期}) from  ~产品_账户_收盘作业流程表^ where a.{流程业务}={流程业务}) order by {流程业务}; */
            select opor_no,execute_type,flow_business,begin_time,exec_date,exec_time,close_execute_type,error_deal_type from db_prod.tb_pdacco_close_check_flow a where a.exec_date=(select max(exec_date) from  db_prod.tb_pdacco_close_check_flow where a.flow_business=flow_business) order by flow_business;
    else

           /* [获取表全记录][产品_账户_收盘作业流程表][{操作员编号},{执行方式},{流程业务},{开始时间},{执行日期},{执行时间},{收盘作业执行状态},{异常处理方式}][{流程业务} = @流程业务# and {执行日期} = @执行日期#]; */
           select opor_no,execute_type,flow_business,begin_time,exec_date,exec_time,close_execute_type,error_deal_type from db_prod.tb_pdacco_close_check_flow where flow_business = v_flow_business and exec_date = v_exec_date;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_更新收盘作业流程
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_UpdateCloseCheckFlow;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_UpdateCloseCheckFlow(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_execute_type int,
    IN p_flow_business int,
    IN p_exec_date int,
    IN p_begin_time int,
    IN p_close_execute_type int,
    IN p_error_deal_type int,
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
    declare v_execute_type int;
    declare v_flow_business int;
    declare v_exec_date int;
    declare v_begin_time int;
    declare v_close_execute_type int;
    declare v_error_deal_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_mach_time int;
    declare v_exec_time int;
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
    SET v_execute_type = p_execute_type;
    SET v_flow_business = p_flow_business;
    SET v_exec_date = p_exec_date;
    SET v_begin_time = p_begin_time;
    SET v_close_execute_type = p_close_execute_type;
    SET v_error_deal_type = p_error_deal_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_exec_time = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @执行时间# = @机器时间#; */
    set v_exec_time = v_mach_time;

    /* [插入重复更新][产品_账户_收盘作业流程表][字段][字段变量][{操作员编号}=@操作员编号#,{执行方式}=@执行方式#,{流程业务}=@流程业务#,{开始时间}=@开始时间#,{执行日期}=@执行日期#,{执行时间}=@执行时间#,{收盘作业执行状态}=@收盘作业执行状态#][2][@流程业务#,@执行日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_close_check_flow (
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, flow_business, 
        execute_type, begin_time, exec_date, exec_time, 
        close_execute_type, error_deal_type) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_flow_business, 
        v_execute_type, v_begin_time, v_exec_date, v_exec_time, 
        v_close_execute_type, v_error_deal_type) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, opor_no=v_opor_no,execute_type=v_execute_type,flow_business=v_flow_business,begin_time=v_begin_time,exec_date=v_exec_date,exec_time=v_exec_time,close_execute_type=v_close_execute_type;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.91.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流程业务=",v_flow_business,",","执行日期=",v_exec_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("流程业务=",v_flow_business,",","执行日期=",v_exec_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_新增产品关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_AddProductRelation;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_AddProductRelation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_co_no int,
    IN p_mum_pd_no int,
    IN p_menu_no int,
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
    declare v_pd_no int;
    declare v_co_no int;
    declare v_mum_pd_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);

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
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_mum_pd_no = p_mum_pd_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "产品编号", "|", "机构编号", "|", "母产品编号", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_pd_no, "|", v_co_no, "|", v_mum_pd_no, "|", v_menu_no, "|");


    /* [插入表记录][产品_账户_产品关系表][字段][字段变量][1][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_relation(
        create_date, create_time, update_date, 
        update_time, update_times, pd_no, co_no, 
        mum_pd_no) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pd_no, v_co_no, 
        v_mum_pd_no);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.99.1";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量]; */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_pd_no, "|", v_co_no, "|", v_mum_pd_no, "|", v_menu_no, "|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "新增产品关系"; */
    set v_oper_remark_info = "新增产品关系";

    /* [插入表记录][产品_账户_产品关系流水表][字段][字段变量][1][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_relation_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, mum_pd_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_mum_pd_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.99.1";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_删除产品关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_DeleteProductRelation;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_DeleteProductRelation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_co_no int,
    IN p_mum_pd_no int,
    IN p_menu_no int,
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
    declare v_pd_no int;
    declare v_co_no int;
    declare v_mum_pd_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_table_row_id bigint;
    declare v_table_field_value varchar(10000);
    declare v_table_uni_index_value varchar(10000);
    declare v_table_name varchar(64);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_remark_info varchar(255);

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
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_mum_pd_no = p_mum_pd_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_table_row_id = 0;
    SET v_table_field_value = " ";
    SET v_table_uni_index_value = " ";
    SET v_table_name = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "产品编号", "|", "机构编号", "|", "母产品编号", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_pd_no, "|", v_co_no, "|", v_mum_pd_no, "|", v_menu_no, "|");


    /* [获取表记录变量][产品_账户_产品关系表][{记录序号}][@表记录序号#][{产品编号}=@产品编号# and {母产品编号}=@母产品编号#][4][@产品编号#,@母产品编号#] */
    select row_id into v_table_row_id from db_prod.tb_pdacco_pd_relation where pd_no=v_pd_no and mum_pd_no=v_mum_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.102.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","母产品编号=",v_mum_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","母产品编号=",v_mum_pd_no);
        end if;
        leave label_pro;
    end if;

    #删除流水记录

    /* set @表字段值# =  concat("|机构编号:",@机构编号#,"|产品编号:",@产品编号#,"|母产品编号:",@母产品编号#); */
    set v_table_field_value =  concat("|机构编号:",v_co_no,"|产品编号:",v_pd_no,"|母产品编号:",v_mum_pd_no);

    /* set @表唯一索引值# = concat("|产品编号:",@产品编号#,"|母产品编号:",@母产品编号#); */
    set v_table_uni_index_value = concat("|产品编号:",v_pd_no,"|母产品编号:",v_mum_pd_no);

    /* set @数据表名称# = "tb_pdacco_pd_relation"; */
    set v_table_name = "tb_pdacco_pd_relation";

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品_账户_产品库删除流水表][字段][字段变量][5][@数据表名称#, @表记录序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_prod_delete_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, table_name, 
        table_row_id, table_field_value, table_uni_index_value) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_table_name, 
        v_table_row_id, v_table_field_value, v_table_uni_index_value);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.102.5";
        SET v_error_info =  CONCAT(concat("数据表名称=",v_table_name,","," 表记录序号=", v_table_row_id),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [删除表记录][产品_账户_产品关系表][{产品编号}=@产品编号# and {母产品编号}=@母产品编号#][3][@产品编号#,@母产品编号#] */
    delete from db_prod.tb_pdacco_pd_relation 
        where pd_no=v_pd_no and mum_pd_no=v_mum_pd_no;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.1.102.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","母产品编号=",v_mum_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","母产品编号=",v_mum_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# = " " ; */
    set v_jour_after_occur_info = " " ;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "删除产品关系"; */
    set v_oper_remark_info = "删除产品关系";

    /* [插入表记录][产品_账户_产品关系流水表][字段][字段变量][1][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_pd_relation_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, mum_pd_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_mum_pd_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.102.1";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询产品关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryProductRelation;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryProductRelation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_co_no int,
    IN p_mum_pd_no int,
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
    declare v_pd_no int;
    declare v_co_no int;
    declare v_mum_pd_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_co_no = p_co_no;
    SET v_mum_pd_no = p_mum_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

          /* [获取表记录][产品_账户_产品关系表][字段][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@母产品编号# = 0 or {母产品编号}=@母产品编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
          if v_row_count = -1 then
              select row_id, create_date, create_time, 
              update_date, update_time, update_times, pd_no, 
              co_no, mum_pd_no from db_prod.tb_pdacco_pd_relation where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_mum_pd_no = 0 or mum_pd_no=v_mum_pd_no) and row_id > v_row_id order by row_id;
          else
              select row_id, create_date, create_time, 
              update_date, update_time, update_times, pd_no, 
              co_no, mum_pd_no from db_prod.tb_pdacco_pd_relation where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_mum_pd_no = 0 or mum_pd_no=v_mum_pd_no) and row_id > v_row_id order by row_id limit v_row_count;
          end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_获取注销资产账户串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_GetCancelAssetAccoStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_GetCancelAssetAccoStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asset_acco_no_str varchar(2048)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_no_str varchar(2048);
    declare v_mach_date int;

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_no_str = " ";
    SET v_mach_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@机器日期#] */
    select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* SELECT GROUP_CONCAT({资产账户编号} SEPARATOR ";")  into @资产账户编号串# FROM  ~产品_账户_资产账户信息表^ WHERE {机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and {资产账户状态}=《资产账户状态-注销》 and {注销日期}<@机器日期#; */
    SELECT GROUP_CONCAT(asset_acco_no SEPARATOR ";")  into v_asset_acco_no_str FROM  db_prod.tb_pdacco_asset_acco WHERE co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and asset_acco_status="3" and abolish_date<v_mach_date;

    /* set @资产账户编号串#=concat(";",@资产账户编号串#,";"); */
    set v_asset_acco_no_str=concat(";",v_asset_acco_no_str,";");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asset_acco_no_str = v_asset_acco_no_str;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_外部账号获取资产账户通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_OutAccoGetAssetAccoChannel;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_OutAccoGetAssetAccoChannel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_out_acco varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pass_no int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_out_acco varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;

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
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_资产账户通道信息表][{通道编号},{机构编号},{产品编号},{资产账户编号}][@通道编号# ,@机构编号#,@产品编号#,@资产账户编号#][{外部账号}=@外部账号#][4][@外部账号#] */
    select pass_no,co_no,pd_no,asset_acco_no into v_pass_no ,v_co_no,v_pd_no,v_asset_acco_no from db_prod.tb_pdacco_asset_acco_ch where out_acco=v_out_acco limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.1.105.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pass_no = v_pass_no;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_新增融资融券配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_AddSecuMargTradConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_AddSecuMargTradConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_pd_no int,
    IN p_fina_return_type int,
    IN p_sell_auto_back_debt int,
    IN p_fina_limit_max decimal(18,4),
    IN p_loan_limit_max decimal(18,4),
    IN p_fina_year_intrst_rate decimal(18,12),
    IN p_secu_loan_year_intrst_rate decimal(18,12),
    IN p_close_posi_keep_guarantee_ratio decimal(18,12),
    IN p_fill_posi_keep_guarantee_ratio decimal(18,12),
    IN p_extract_guarantee_ratio decimal(18,12),
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
    declare v_asset_acco_no int;
    declare v_pd_no int;
    declare v_fina_return_type int;
    declare v_sell_auto_back_debt int;
    declare v_fina_limit_max decimal(18,4);
    declare v_loan_limit_max decimal(18,4);
    declare v_fina_year_intrst_rate decimal(18,12);
    declare v_secu_loan_year_intrst_rate decimal(18,12);
    declare v_close_posi_keep_guarantee_ratio decimal(18,12);
    declare v_fill_posi_keep_guarantee_ratio decimal(18,12);
    declare v_extract_guarantee_ratio decimal(18,12);
    declare v_remark_info varchar(255);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pd_no = p_pd_no;
    SET v_fina_return_type = p_fina_return_type;
    SET v_sell_auto_back_debt = p_sell_auto_back_debt;
    SET v_fina_limit_max = p_fina_limit_max;
    SET v_loan_limit_max = p_loan_limit_max;
    SET v_fina_year_intrst_rate = p_fina_year_intrst_rate;
    SET v_secu_loan_year_intrst_rate = p_secu_loan_year_intrst_rate;
    SET v_close_posi_keep_guarantee_ratio = p_close_posi_keep_guarantee_ratio;
    SET v_fill_posi_keep_guarantee_ratio = p_fill_posi_keep_guarantee_ratio;
    SET v_extract_guarantee_ratio = p_extract_guarantee_ratio;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][产品_账户_融资融券配置表][字段][字段变量][1][@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_fina_loan_config(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, asset_acco_no, 
        pd_no, fina_return_type, sell_auto_back_debt, fina_limit_max, 
        loan_limit_max, fina_year_intrst_rate, secu_loan_year_intrst_rate, close_posi_keep_guarantee_ratio, 
        fill_posi_keep_guarantee_ratio, extract_guarantee_ratio, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_asset_acco_no, 
        v_pd_no, v_fina_return_type, v_sell_auto_back_debt, v_fina_limit_max, 
        v_loan_limit_max, v_fina_year_intrst_rate, v_secu_loan_year_intrst_rate, v_close_posi_keep_guarantee_ratio, 
        v_fill_posi_keep_guarantee_ratio, v_extract_guarantee_ratio, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.106.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
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
use db_prod;;

# 原子_产品_账户_修改融资融券配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_ModiSecuMargTradConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_ModiSecuMargTradConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_pd_no int,
    IN p_fina_return_type int,
    IN p_sell_auto_back_debt int,
    IN p_fina_limit_max decimal(18,4),
    IN p_loan_limit_max decimal(18,4),
    IN p_fina_year_intrst_rate decimal(18,12),
    IN p_secu_loan_year_intrst_rate decimal(18,12),
    IN p_close_posi_keep_guarantee_ratio decimal(18,12),
    IN p_fill_posi_keep_guarantee_ratio decimal(18,12),
    IN p_extract_guarantee_ratio decimal(18,12),
    IN p_remark_info varchar(255),
    IN p_row_id bigint,
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
    declare v_asset_acco_no int;
    declare v_pd_no int;
    declare v_fina_return_type int;
    declare v_sell_auto_back_debt int;
    declare v_fina_limit_max decimal(18,4);
    declare v_loan_limit_max decimal(18,4);
    declare v_fina_year_intrst_rate decimal(18,12);
    declare v_secu_loan_year_intrst_rate decimal(18,12);
    declare v_close_posi_keep_guarantee_ratio decimal(18,12);
    declare v_fill_posi_keep_guarantee_ratio decimal(18,12);
    declare v_extract_guarantee_ratio decimal(18,12);
    declare v_remark_info varchar(255);
    declare v_row_id bigint;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pd_no = p_pd_no;
    SET v_fina_return_type = p_fina_return_type;
    SET v_sell_auto_back_debt = p_sell_auto_back_debt;
    SET v_fina_limit_max = p_fina_limit_max;
    SET v_loan_limit_max = p_loan_limit_max;
    SET v_fina_year_intrst_rate = p_fina_year_intrst_rate;
    SET v_secu_loan_year_intrst_rate = p_secu_loan_year_intrst_rate;
    SET v_close_posi_keep_guarantee_ratio = p_close_posi_keep_guarantee_ratio;
    SET v_fill_posi_keep_guarantee_ratio = p_fill_posi_keep_guarantee_ratio;
    SET v_extract_guarantee_ratio = p_extract_guarantee_ratio;
    SET v_remark_info = p_remark_info;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][产品_账户_融资融券配置表][字段][字段变量][{机构编号}=@机构编号#,{融资年利率}=@融资年利率#,{融券年利率}=@融券年利率#,{资产账户编号}=@资产账户编号#,{产品编号}=@产品编号#,{卖券还款方式}=@卖券还款方式#,{卖出自动还款} = @卖出自动还款#,{融资额度上限}=@融资额度上限#,{融券额度上限}=@融券额度上限#,{平仓维持担保比例}=@平仓维持担保比例#,{补仓维持担保比例}=@补仓维持担保比例#,{提取担保比例}=@提取担保比例#,{备注信息}=@备注信息#][2][@记录序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_fina_loan_config (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, asset_acco_no, 
        pd_no, fina_return_type, sell_auto_back_debt, fina_limit_max, 
        loan_limit_max, fina_year_intrst_rate, secu_loan_year_intrst_rate, close_posi_keep_guarantee_ratio, 
        fill_posi_keep_guarantee_ratio, extract_guarantee_ratio, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_asset_acco_no, 
        v_pd_no, v_fina_return_type, v_sell_auto_back_debt, v_fina_limit_max, 
        v_loan_limit_max, v_fina_year_intrst_rate, v_secu_loan_year_intrst_rate, v_close_posi_keep_guarantee_ratio, 
        v_fill_posi_keep_guarantee_ratio, v_extract_guarantee_ratio, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no,fina_year_intrst_rate=v_fina_year_intrst_rate,secu_loan_year_intrst_rate=v_secu_loan_year_intrst_rate,asset_acco_no=v_asset_acco_no,pd_no=v_pd_no,fina_return_type=v_fina_return_type,sell_auto_back_debt = v_sell_auto_back_debt,fina_limit_max=v_fina_limit_max,loan_limit_max=v_loan_limit_max,close_posi_keep_guarantee_ratio=v_close_posi_keep_guarantee_ratio,fill_posi_keep_guarantee_ratio=v_fill_posi_keep_guarantee_ratio,extract_guarantee_ratio=v_extract_guarantee_ratio,remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.107.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_删除融资融券配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_DelSecuMargTradConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_DelSecuMargTradConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][产品_账户_融资融券配置表][{记录序号}=@记录序号#][3][@记录序号#] */
    delete from db_prod.tb_pdacco_fina_loan_config 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.1.108.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询融资融券配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QuerySecuMargTradConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QuerySecuMargTradConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_pd_no int,
    IN p_sort_type int,
    IN p_row_count int,
    IN p_row_id bigint,
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
    declare v_asset_acco_no int;
    declare v_pd_no int;
    declare v_sort_type int;
    declare v_row_count int;
    declare v_row_id bigint;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pd_no = p_pd_no;
    SET v_sort_type = p_sort_type;
    SET v_row_count = p_row_count;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][产品_账户_融资融券配置表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#)  and {记录序号}>@记录序号# order by {记录序号} ][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            asset_acco_no, pd_no, fina_return_type, sell_auto_back_debt, 
            fina_limit_max, loan_limit_max, fina_year_intrst_rate, secu_loan_year_intrst_rate, 
            close_posi_keep_guarantee_ratio, fill_posi_keep_guarantee_ratio, extract_guarantee_ratio, remark_info from db_prod.tb_pdacco_fina_loan_config where (v_co_no = 0 or co_no=v_co_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and row_id>v_row_id order by row_id ;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            asset_acco_no, pd_no, fina_return_type, sell_auto_back_debt, 
            fina_limit_max, loan_limit_max, fina_year_intrst_rate, secu_loan_year_intrst_rate, 
            close_posi_keep_guarantee_ratio, fill_posi_keep_guarantee_ratio, extract_guarantee_ratio, remark_info from db_prod.tb_pdacco_fina_loan_config where (v_co_no = 0 or co_no=v_co_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and row_id>v_row_id order by row_id  limit v_row_count;
        end if;

    else

        /* [获取表记录][产品_账户_融资融券配置表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#)  and {记录序号}>@记录序号# order by {记录序号} desc ][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            asset_acco_no, pd_no, fina_return_type, sell_auto_back_debt, 
            fina_limit_max, loan_limit_max, fina_year_intrst_rate, secu_loan_year_intrst_rate, 
            close_posi_keep_guarantee_ratio, fill_posi_keep_guarantee_ratio, extract_guarantee_ratio, remark_info from db_prod.tb_pdacco_fina_loan_config where (v_co_no = 0 or co_no=v_co_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and row_id>v_row_id order by row_id desc ;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            asset_acco_no, pd_no, fina_return_type, sell_auto_back_debt, 
            fina_limit_max, loan_limit_max, fina_year_intrst_rate, secu_loan_year_intrst_rate, 
            close_posi_keep_guarantee_ratio, fill_posi_keep_guarantee_ratio, extract_guarantee_ratio, remark_info from db_prod.tb_pdacco_fina_loan_config where (v_co_no = 0 or co_no=v_co_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and row_id>v_row_id order by row_id desc  limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_查询资产账户默认交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_QueryAccoDefaultExgp;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_QueryAccoDefaultExgp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_pd_no int,
    IN p_sort_type int,
    IN p_row_count int,
    IN p_row_id bigint,
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
    declare v_asset_acco_no int;
    declare v_pd_no int;
    declare v_sort_type int;
    declare v_row_count int;
    declare v_row_id bigint;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pd_no = p_pd_no;
    SET v_sort_type = p_sort_type;
    SET v_row_count = p_row_count;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][产品_账户_资产账户默认交易组信息表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#)  and {记录序号}>@记录序号# order by {记录序号} ][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no, asset_acco_no, exch_group_no from db_prod.tb_pdacco_asset_acco_default_exgp where (v_co_no = 0 or co_no=v_co_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and row_id>v_row_id order by row_id ;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no, asset_acco_no, exch_group_no from db_prod.tb_pdacco_asset_acco_default_exgp where (v_co_no = 0 or co_no=v_co_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and row_id>v_row_id order by row_id  limit v_row_count;
        end if;

    else

        /* [获取表记录][产品_账户_资产账户默认交易组信息表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#)  and {记录序号}>@记录序号# order by {记录序号} desc ][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no, asset_acco_no, exch_group_no from db_prod.tb_pdacco_asset_acco_default_exgp where (v_co_no = 0 or co_no=v_co_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and row_id>v_row_id order by row_id desc ;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, co_no, 
            pd_no, asset_acco_no, exch_group_no from db_prod.tb_pdacco_asset_acco_default_exgp where (v_co_no = 0 or co_no=v_co_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and row_id>v_row_id order by row_id desc  limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_设置资产账户默认交易组关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_SetAccoDefaultExgpRelation;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_SetAccoDefaultExgpRelation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
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
    declare v_asset_acco_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][产品_账户_资产账户默认交易组信息表][字段][字段变量][{交易组编号} = @交易组编号#][1][@资产账户编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_asset_acco_default_exgp (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_group_no) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, exch_group_no = v_exch_group_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.111.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_删除资产账户默认交易组关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_DeleteAccoDefaultExgpRelation;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_DeleteAccoDefaultExgpRelation(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
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
    declare v_asset_acco_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][产品_账户_资产账户默认交易组信息表][{机构编号}=@机构编号# and {资产账户编号}=@资产账户编号#][3][@机构编号#,@资产账户编号#] */
    delete from db_prod.tb_pdacco_asset_acco_default_exgp 
        where co_no=v_co_no and asset_acco_no=v_asset_acco_no;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.1.112.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_报盘回写通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_TransWriteInPassInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_TransWriteInPassInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_offer_server_name varchar(64),
    IN p_offer_server_ip varchar(64),
    IN p_mac_addr varchar(32),
    IN p_offer_name varchar(32),
    IN p_software_start_time int,
    IN p_pass_no int,
    IN p_pass_status varchar(2),
    IN p_bkup_field_1 varchar(32),
    IN p_bkup_field_2 int,
    IN p_bkup_field_3 decimal(18,12),
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
    declare v_offer_server_name varchar(64);
    declare v_offer_server_ip varchar(64);
    declare v_mac_addr varchar(32);
    declare v_offer_name varchar(32);
    declare v_software_start_time int;
    declare v_pass_no int;
    declare v_pass_status varchar(2);
    declare v_bkup_field_1 varchar(32);
    declare v_bkup_field_2 int;
    declare v_bkup_field_3 decimal(18,12);
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
    SET v_offer_server_name = p_offer_server_name;
    SET v_offer_server_ip = p_offer_server_ip;
    SET v_mac_addr = p_mac_addr;
    SET v_offer_name = p_offer_name;
    SET v_software_start_time = p_software_start_time;
    SET v_pass_no = p_pass_no;
    SET v_pass_status = p_pass_status;
    SET v_bkup_field_1 = p_bkup_field_1;
    SET v_bkup_field_2 = p_bkup_field_2;
    SET v_bkup_field_3 = p_bkup_field_3;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][产品_账户_报盘回写通道信息表][字段][字段变量][{报盘服务器名称}=@报盘服务器名称#,{报盘服务器IP}=@报盘服务器IP#,{MAC地址}=@MAC地址#,{报盘标识}=@报盘标识#,{程序启动时间}=@程序启动时间#,{通道编号}=@通道编号#,{通道状态}=@通道状态#][1][@通道编号#,@报盘标识#,@MAC地址#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_trans_chanel_info_writein (
        create_date, create_time, update_date, 
        update_time, update_times, offer_server_name, offer_server_ip, 
        mac_addr, offer_name, software_start_time, pass_no, 
        pass_status, bkup_field_1, bkup_field_2, bkup_field_3) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_offer_server_name, v_offer_server_ip, 
        v_mac_addr, v_offer_name, v_software_start_time, v_pass_no, 
        v_pass_status, v_bkup_field_1, v_bkup_field_2, v_bkup_field_3) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, offer_server_name=v_offer_server_name,offer_server_ip=v_offer_server_ip,mac_addr=v_mac_addr,offer_name=v_offer_name,software_start_time=v_software_start_time,pass_no=v_pass_no,pass_status=v_pass_status;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.113.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","报盘标识=",v_offer_name,",","MAC地址=",v_mac_addr),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","报盘标识=",v_offer_name,",","MAC地址=",v_mac_addr);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户_修改产品索引值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdacco_ModiProductIndexValue;;
DELIMITER ;;
CREATE PROCEDURE pra_pdacco_ModiProductIndexValue(
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
    IN p_index_value int,
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
    declare v_index_value int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_index_value = p_index_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品_账户_产品信息表][{索引值}=@索引值#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@机构编号#,@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_pd_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, index_value=v_index_value where co_no=v_co_no and pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.1.114.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


