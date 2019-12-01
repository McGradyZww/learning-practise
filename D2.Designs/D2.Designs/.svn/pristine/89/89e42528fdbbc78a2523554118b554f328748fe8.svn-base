DELIMITER ;;
use db_prod;;

# 原子_产品_账户运维_查询全部产品
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdaccobk_QueryAllProduct;;
DELIMITER ;;
CREATE PROCEDURE pra_pdaccobk_QueryAllProduct(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_status varchar(2),
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
    declare v_pd_status varchar(2);
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
    SET v_pd_status = p_pd_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数#=-1; */
    set v_row_count=-1;

    /* [获取表记录两表关联][产品_账户_产品信息表][产品_账户_产品限制信息表][a.{产品编号},a.{机构编号},a.{产品编码},a.{产品名称},b.{产品状态}][a.{产品编号}=b.{产品编号} and (@机构编号#= 0 or a.{机构编号}=@机构编号#) and (@产品编号#=0 or a.{产品编号}=@产品编号#) and (@产品状态#= " " or b.{产品状态}=@产品状态#)][@指定行数#] */
    if v_row_count = -1 then
        select a.pd_no,a.co_no,a.pd_code,a.pd_name,b.pd_status from db_prod.tb_pdacco_pd_info a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and (v_co_no= 0 or a.co_no=v_co_no) and (v_pd_no=0 or a.pd_no=v_pd_no) and (v_pd_status= " " or b.pd_status=v_pd_status);
    else
        select a.pd_no,a.co_no,a.pd_code,a.pd_name,b.pd_status from db_prod.tb_pdacco_pd_info a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and (v_co_no= 0 or a.co_no=v_co_no) and (v_pd_no=0 or a.pd_no=v_pd_no) and (v_pd_status= " " or b.pd_status=v_pd_status) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户运维_查询全部资产账户
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdaccobk_QueryAllAssetAcco;;
DELIMITER ;;
CREATE PROCEDURE pra_pdaccobk_QueryAllAssetAcco(
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
    IN p_asset_acco_status varchar(2),
    IN p_out_acco varchar(32),
    IN p_pd_name varchar(64),
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
    declare v_asset_acco_status varchar(2);
    declare v_out_acco varchar(32);
    declare v_pd_name varchar(64);
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
    SET v_asset_acco_status = p_asset_acco_status;
    SET v_out_acco = p_out_acco;
    SET v_pd_name = p_pd_name;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #[获取表全记录][产品_账户_资产账户信息表][{机构编号},{产品编号},{资产账户编号},{资产账户},{资产账户名称},{资产账户状态}][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@资产账户状态#=" " or {资产账户状态}=@资产账户状态#)]

    /* select a.*,c.out_acco from tb_pdacco_asset_acco a,tb_pdacco_pd_info b,tb_pdacco_asset_acco_ch c where a.pd_no=b.pd_no and a.asset_acco_no=c.asset_acco_no and (@机构编号#=0 or a.{机构编号}=@机构编号#) and (@产品编号#=0 or a.{产品编号}=@产品编号#) and (@资产账户编号#=0 or a.{资产账户编号}=@资产账户编号#) and (@资产账户状态#=" " or a.{资产账户状态}=@资产账户状态#) and (@产品名称#=" " or b.{产品名称} like concat("%",@产品名称#,"%")) and (@外部账号#=" " or c.{外部账号}=@外部账号#); */
    select a.*,c.out_acco from tb_pdacco_asset_acco a,tb_pdacco_pd_info b,tb_pdacco_asset_acco_ch c where a.pd_no=b.pd_no and a.asset_acco_no=c.asset_acco_no and (v_co_no=0 or a.co_no=v_co_no) and (v_pd_no=0 or a.pd_no=v_pd_no) and (v_asset_acco_no=0 or a.asset_acco_no=v_asset_acco_no) and (v_asset_acco_status=" " or a.asset_acco_status=v_asset_acco_status) and (v_pd_name=" " or b.pd_name like concat("%",v_pd_name,"%")) and (v_out_acco=" " or c.out_acco=v_out_acco);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户运维_查询产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdaccobk_QueryProductInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdaccobk_QueryProductInfo(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @机构编号# = 0 then */
    if v_co_no = 0 then

        /* set @机构编号# = @操作员机构编号#; */
        set v_co_no = v_opor_co_no;
    end if;

    /* [获取表记录两表关联][产品_账户_产品信息表][产品_账户_产品限制信息表][a.{记录序号},a.{产品编号},a.{机构编号},a.{产品编码},a.{产品名称},a.{产品全称},a.{产品管理人},a.{成立日期},a.{产品类型},a.{募集币种},a.{本币币种},a.{原始资产},a.{原始金额},a.{产品总份额},a.{当前份额},a.{昨日份额},a.{历史最高单位净值},a.{昨日净值},a.{境内托管人全名},a.{境内托管账户},a.{境内托管账户名},a.{预警线},a.{平仓线},a.{目标仓位},a.{beta系数},a.{自定义产品分类},a.{索引值},a.{备注信息},b.{成本计算方式},b.{允许投资市场},b.{允许操作证券类型},b.{业务控制配置串},b.{指令审批操作员},b.{市价冻结浮动比例},b.{禁止订单方向},b.{产品状态}][a.{产品编号}=b.{产品编号} and a.{机构编号}=@机构编号# and (@产品编号# = 0 or a.{产品编号}=@产品编号#) and (@产品类型# = 0 or a.{产品类型}=@产品类型#) and (@产品状态串# = "; ;" or instr(@产品状态串#, concat(";",b.{产品状态},";")) > 0) and a.{记录序号} > @记录序号# order by a.{记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select a.row_id,a.pd_no,a.co_no,a.pd_code,a.pd_name,a.pd_flname,a.pd_manager,a.found_date,a.pd_type,a.apply_currency,a.crncy_type,a.first_asset,a.first_amt,a.pd_all_share,a.curr_share,a.pre_share,a.his_max_per_nav,a.pre_nav,a.coust_full_name,a.coust_acco,a.coust_acco_name,a.warn_posi_value,a.close_posi_value,a.target_posi_ratio,a.beta_coeffi,a.custom_pd_class,a.index_value,a.remark_info,b.cost_calc_type,b.allow_exch,b.allow_stock_type,b.busi_config_str,b.comm_appr_oper,b.market_price_ratio,b.forbid_order_dir,b.pd_status from db_prod.tb_pdacco_pd_info a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and a.co_no=v_co_no and (v_pd_no = 0 or a.pd_no=v_pd_no) and (v_pd_type = 0 or a.pd_type=v_pd_type) and (v_pd_status_str = "; ;" or instr(v_pd_status_str, concat(";",b.pd_status,";")) > 0) and a.row_id > v_row_id order by a.row_id;
    else
        select a.row_id,a.pd_no,a.co_no,a.pd_code,a.pd_name,a.pd_flname,a.pd_manager,a.found_date,a.pd_type,a.apply_currency,a.crncy_type,a.first_asset,a.first_amt,a.pd_all_share,a.curr_share,a.pre_share,a.his_max_per_nav,a.pre_nav,a.coust_full_name,a.coust_acco,a.coust_acco_name,a.warn_posi_value,a.close_posi_value,a.target_posi_ratio,a.beta_coeffi,a.custom_pd_class,a.index_value,a.remark_info,b.cost_calc_type,b.allow_exch,b.allow_stock_type,b.busi_config_str,b.comm_appr_oper,b.market_price_ratio,b.forbid_order_dir,b.pd_status from db_prod.tb_pdacco_pd_info a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and a.co_no=v_co_no and (v_pd_no = 0 or a.pd_no=v_pd_no) and (v_pd_type = 0 or a.pd_type=v_pd_type) and (v_pd_status_str = "; ;" or instr(v_pd_status_str, concat(";",b.pd_status,";")) > 0) and a.row_id > v_row_id order by a.row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户运维_修改产品业务控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdaccobk_UpdateProdBusiConfigStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pdaccobk_UpdateProdBusiConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
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
    declare v_co_no int;
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
    SET v_co_no = 0;
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


    /* [锁定获取表记录变量][产品_账户_产品限制信息表][{机构编号},{业务控制配置串}][@机构编号#,@业务控制配置串#][{产品编号}=@产品编号#][4][@产品编号#] */
    select co_no,busi_config_str into v_co_no,v_busi_config_str from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.5.5.4";
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
                
        SET v_error_code = "prodA.5.5.2";
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
                
        SET v_error_code = "prodA.5.5.5";
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

# 原子_产品_账户运维_查询资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdaccobk_QueryAssetAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdaccobk_QueryAssetAccoInfo(
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
    declare v_asset_acco_no int;
    declare v_asset_acco_status_str varchar(64);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_asset_acco_status_str = p_asset_acco_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_账户_资产账户信息表][字段][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@资产账户状态串# = "; ;" or instr(@资产账户状态串#, concat(";",{资产账户状态},";"))>0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, asset_acco_no, 
        co_no, pd_no, asset_acco, asset_acco_name, 
        asset_acco_type, trade_pwd, asset_acco_status, busi_config_str, 
        market_price_ratio, allow_exch, allow_stock_type, split_fee_typr_str, 
        busi_limit_str, exter_comm_flag, remark_info, busi_depart, 
        abolish_date from db_prod.tb_pdacco_asset_acco where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_asset_acco_status_str = "; ;" or instr(v_asset_acco_status_str, concat(";",asset_acco_status,";"))>0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, asset_acco_no, 
        co_no, pd_no, asset_acco, asset_acco_name, 
        asset_acco_type, trade_pwd, asset_acco_status, busi_config_str, 
        market_price_ratio, allow_exch, allow_stock_type, split_fee_typr_str, 
        busi_limit_str, exter_comm_flag, remark_info, busi_depart, 
        abolish_date from db_prod.tb_pdacco_asset_acco where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_asset_acco_status_str = "; ;" or instr(v_asset_acco_status_str, concat(";",asset_acco_status,";"))>0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户运维_修改资产账户业务控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdaccobk_UpdateAseetAccoBusiConfigStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pdaccobk_UpdateAseetAccoBusiConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
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
    declare v_pd_no int;
    declare v_asset_acco_no int;
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
    declare v_co_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
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
    SET v_co_no = 0;
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


    /* [锁定获取表记录变量][产品_账户_资产账户信息表][{机构编号},{业务控制配置串}][@机构编号#,@业务控制配置串#][{产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#][4][@产品编号#,@资产账户编号#] */
    select co_no,busi_config_str into v_co_no,v_busi_config_str from db_prod.tb_pdacco_asset_acco where pd_no=v_pd_no and asset_acco_no=v_asset_acco_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.5.7.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* set @业务控制配置串# = concat(left(@业务控制配置串#, @配置位#-1), left(@配置值#,1), right(@业务控制配置串#,LENGTH(@业务控制配置串#)-@配置位#)); */
    set v_busi_config_str = concat(left(v_busi_config_str, v_config_index-1), left(v_config_value,1), right(v_busi_config_str,LENGTH(v_busi_config_str)-v_config_index));

    /* [更新表记录][产品_账户_资产账户信息表][{业务控制配置串}=@业务控制配置串#][{产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#][2][@产品编号#,@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_asset_acco set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, busi_config_str=v_busi_config_str where pd_no=v_pd_no and asset_acco_no=v_asset_acco_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.5.7.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@配置位#,@配置值#,@业务控制配置串#] */
    set v_jour_after_occur_info = concat(v_config_index,"|",v_config_value,"|",v_busi_config_str,"|");


    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品_账户_资产账户信息流水表][字段][字段变量][5][@产品编号#] */
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
                
        SET v_error_code = "prodA.5.7.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取表记录变量语句][产品_账户_资产账户信息表][{业务控制配置串},{更新次数}][@业务控制配置串#,@更新次数#][{产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#] */
    select busi_config_str,update_times into v_busi_config_str,v_update_times from db_prod.tb_pdacco_asset_acco where pd_no=v_pd_no and asset_acco_no=v_asset_acco_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_config_str = v_busi_config_str;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户运维_查询证券同步所需资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdaccobk_QueryAssetAccoInfoBySecuSync;;
DELIMITER ;;
CREATE PROCEDURE pra_pdaccobk_QueryAssetAccoInfoBySecuSync(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_pass_no int,
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
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_pass_no int;
    declare v_online_status int;
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
    SET v_pass_no = p_pass_no;
    SET v_online_status = p_online_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [变量补分隔符][@产品编号串#] */
    set v_pd_no_str = concat(";", v_pd_no_str,";");


    /* [获取表记录两表关联][产品_账户_资产账户通道信息表][产品_账户_资产账户信息表][b.{记录序号},b.{机构编号},b.{产品编号},b.{资产账户编号},b.{资产账户},a.{通道编号},a.{外部账号},a.{在线状态}][(@机构编号#=0 or b.{机构编号}=@机构编号#) and (@产品编号串#="; ;" or instr(@产品编号串#, concat(";",b.{产品编号},";"))>0) and b.{资产账户状态}=《资产账户状态-正常》 and b.{资产账户编号}=a.{资产账户编号} and ((@通道编号#=0 or a.{通道编号}=@通道编号#) and a.{通道编号}<>0) and (@在线状态#=0 or a.{在线状态}=@在线状态#)][@指定行数#] */
    if v_row_count = -1 then
        select b.row_id,b.co_no,b.pd_no,b.asset_acco_no,b.asset_acco,a.pass_no,a.out_acco,a.online_status from db_prod.tb_pdacco_asset_acco_ch a,db_prod.tb_pdacco_asset_acco b where (v_co_no=0 or b.co_no=v_co_no) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",b.pd_no,";"))>0) and b.asset_acco_status="1" and b.asset_acco_no=a.asset_acco_no and ((v_pass_no=0 or a.pass_no=v_pass_no) and a.pass_no<>0) and (v_online_status=0 or a.online_status=v_online_status);
    else
        select b.row_id,b.co_no,b.pd_no,b.asset_acco_no,b.asset_acco,a.pass_no,a.out_acco,a.online_status from db_prod.tb_pdacco_asset_acco_ch a,db_prod.tb_pdacco_asset_acco b where (v_co_no=0 or b.co_no=v_co_no) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",b.pd_no,";"))>0) and b.asset_acco_status="1" and b.asset_acco_no=a.asset_acco_no and ((v_pass_no=0 or a.pass_no=v_pass_no) and a.pass_no<>0) and (v_online_status=0 or a.online_status=v_online_status) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户运维_更新产品估值资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdaccobk_UpdateProdEvaluAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdaccobk_UpdateProdEvaluAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_crncy_type varchar(3),
    IN p_evalu_nav_asset decimal(18,4),
    IN p_begin_evalu_nav_asset decimal(18,4),
    IN p_evalu_share decimal(18,2),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_cash_id bigint,
    OUT p_co_no int,
    OUT p_pd_first_amt decimal(18,4),
    OUT p_pd_curr_amt decimal(18,4),
    OUT p_pd_dist_amt decimal(18,4),
    OUT p_pd_auth_amt decimal(18,4),
    OUT p_pd_amt_check_diff decimal(18,4),
    OUT p_pd_pre_settle_amt decimal(18,4),
    OUT p_pd_total_cash_divide decimal(18,4),
    OUT p_pd_total_pre_fee decimal(18,4),
    OUT p_pd_total_rece_amt decimal(18,4),
    OUT p_pd_total_payab_amt decimal(18,4),
    OUT p_pd_intrst_cacl_amt decimal(18,4),
    OUT p_pd_pre_entry_intrst_amt decimal(18,4),
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
    declare v_crncy_type varchar(3);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_evalu_share decimal(18,2);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_cash_id bigint;
    declare v_co_no int;
    declare v_pd_first_amt decimal(18,4);
    declare v_pd_curr_amt decimal(18,4);
    declare v_pd_dist_amt decimal(18,4);
    declare v_pd_auth_amt decimal(18,4);
    declare v_pd_amt_check_diff decimal(18,4);
    declare v_pd_pre_settle_amt decimal(18,4);
    declare v_pd_total_cash_divide decimal(18,4);
    declare v_pd_total_pre_fee decimal(18,4);
    declare v_pd_total_rece_amt decimal(18,4);
    declare v_pd_total_payab_amt decimal(18,4);
    declare v_pd_intrst_cacl_amt decimal(18,4);
    declare v_pd_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_pd_all_share decimal(18,2);
    declare v_curr_share decimal(18,2);
    declare v_tmp_curr_share decimal(18,2);
    declare v_occur_share decimal(18,2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_total_rece_amt_diff decimal(18,4);
    declare v_row_id bigint;
    declare v_tmp_total_rece_amt decimal(18,4);
    declare v_tmp_total_payab_amt decimal(18,4);
    declare v_total_payab_amt_diff decimal(18,4);
    declare v_tmp_update_times int;
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_pd_code varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_crncy_type = p_crncy_type;
    SET v_evalu_nav_asset = p_evalu_nav_asset;
    SET v_begin_evalu_nav_asset = p_begin_evalu_nav_asset;
    SET v_evalu_share = p_evalu_share;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_cash_id = 0;
    SET v_co_no = 0;
    SET v_pd_first_amt = 0;
    SET v_pd_curr_amt = 0;
    SET v_pd_dist_amt = 0;
    SET v_pd_auth_amt = 0;
    SET v_pd_amt_check_diff = 0;
    SET v_pd_pre_settle_amt = 0;
    SET v_pd_total_cash_divide = 0;
    SET v_pd_total_pre_fee = 0;
    SET v_pd_total_rece_amt = 0;
    SET v_pd_total_payab_amt = 0;
    SET v_pd_intrst_cacl_amt = 0;
    SET v_pd_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_pd_all_share = 0;
    SET v_curr_share = 0;
    SET v_tmp_curr_share = 0;
    SET v_occur_share = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_total_rece_amt_diff = 0;
    SET v_row_id = 0;
    SET v_tmp_total_rece_amt = 0;
    SET v_tmp_total_payab_amt = 0;
    SET v_total_payab_amt_diff = 0;
    SET v_tmp_update_times = 1;
    SET v_busi_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_pd_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{估值份额},{产品总份额},{当前份额},{累计应收金额},{累计应付金额}][@估值份额#,@产品总份额#,@当前份额#,@累计应收金额#,@累计应付金额#] */
    set v_jour_occur_field = concat("估值份额","|","产品总份额","|","当前份额","|","累计应收金额","|","累计应付金额","|");
    set v_jour_occur_info = concat(v_evalu_share,"|",v_pd_all_share,"|",v_curr_share,"|",v_total_rece_amt,"|",v_total_payab_amt,"|");


    /* set @本币币种# = 《本币币种-人民币》; */
    set v_crncy_type = "CNY";

    /* [获取表记录变量][产品_账户_产品信息表][{当前份额}][@临时_当前份额#][{产品编号}=@产品编号#][4][@产品编号#] */
    select curr_share into v_tmp_curr_share from db_prod.tb_pdacco_pd_info where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.5.21.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @变动份额#=@估值份额#-@临时_当前份额#; */
    set v_occur_share=v_evalu_share-v_tmp_curr_share;

    /* if @估值份额# <> 0 then */
    if v_evalu_share <> 0 then

        /* [更新表记录][产品_账户_产品信息表][{估值份额}=@估值份额#,{产品总份额}=@估值份额#,{当前份额}=@估值份额#][{产品编号}=@产品编号#][2][@产品编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_prod.tb_pdacco_pd_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, evalu_share=v_evalu_share,pd_all_share=v_evalu_share,curr_share=v_evalu_share where pd_no=v_pd_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.5.21.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][产品_账户_产品信息表][{机构编号},{估值份额},{产品总份额},{当前份额}][@机构编号#,@估值份额#,@产品总份额#,@当前份额#][{产品编号}=@产品编号#][4][@产品编号#] */
        select co_no,evalu_share,pd_all_share,curr_share into v_co_no,v_evalu_share,v_pd_all_share,v_curr_share from db_prod.tb_pdacco_pd_info where pd_no=v_pd_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.5.21.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no);
            end if;
            leave label_pro;
        end if;


        /* [获取流水后信息][@估值份额#,@产品总份额#,@当前份额#,@累计应收金额#,@累计应付金额#] */
        set v_jour_after_occur_info = concat(v_evalu_share,"|",v_pd_all_share,"|",v_curr_share,"|",v_total_rece_amt,"|",v_total_payab_amt,"|");


        /* set @操作菜单# = @菜单编号#; */
        set v_oper_menu_no = v_menu_no;

        /* set @操作功能# = @功能编码#; */
        set v_oper_func_code = v_func_code;

        /* set @操作备注# = "更新产品估值资产"; */
        set v_oper_remark_info = "更新产品估值资产";

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
                   
           SET v_error_code = "prodA.5.21.5";
           SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
           leave label_pro;
       end if;

    end if;

    /* [获取流水变动][{累计应收金额差额}][@累计应收金额差额#] */
    set v_jour_occur_field = concat("累计应收金额差额","|");
    set v_jour_occur_info = concat(v_total_rece_amt_diff,"|");


    /* [获取表记录变量][产品_资金_产品资金表][{记录序号},{累计应收金额},{累计应付金额}][@记录序号#,@临时_累计应收金额#,@临时_累计应付金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select row_id,total_rece_amt,total_payab_amt into v_row_id,v_tmp_total_rece_amt,v_tmp_total_payab_amt from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.5.21.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @累计应收金额差额#=@累计应收金额#-@临时_累计应收金额#; */
    set v_total_rece_amt_diff=v_total_rece_amt-v_tmp_total_rece_amt;

    /* set @累计应付金额差额#=@累计应付金额#-@临时_累计应付金额#; */
    set v_total_payab_amt_diff=v_total_payab_amt-v_tmp_total_payab_amt;

    /* [更新表记录][产品_资金_产品资金表][{累计应收金额}=@累计应收金额#,{累计应付金额}=@累计应付金额#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdcapit_pd_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, total_rece_amt=v_total_rece_amt,total_payab_amt=v_total_payab_amt where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.5.21.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{记录序号},{原始金额},{当前金额},{产品已分配金额},{产品已授权金额},{金额核对差额},{待交收金额},{累计派现金额},{累计计提费用},{累计应收金额},{累计应付金额},{预计利息},{待入账利息},{更新次数}][@记录序号#,@产品原始金额#,@产品当前金额#,@产品已分配金额#,@产品已授权金额#,@产品金额核对差额#,@产品待交收金额#,@产品累计派现金额#,@产品累计计提费用#,@产品累计应收金额#,@产品累计应付金额#,@产品预计利息#,@产品待入账利息#,@临时_更新次数#][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id,first_amt,curr_amt,pd_dist_amt,pd_auth_amt,amt_check_diff,pre_settle_amt,total_cash_divide,total_pre_fee,total_rece_amt,total_payab_amt,intrst_cacl_amt,pre_entry_intrst_amt,update_times into v_row_id,v_pd_first_amt,v_pd_curr_amt,v_pd_dist_amt,v_pd_auth_amt,v_pd_amt_check_diff,v_pd_pre_settle_amt,v_pd_total_cash_divide,v_pd_total_pre_fee,v_pd_total_rece_amt,v_pd_total_payab_amt,v_pd_intrst_cacl_amt,v_pd_pre_entry_intrst_amt,v_tmp_update_times from db_prod.tb_pdcapit_pd_capit where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.5.21.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@累计应收金额差额#] */
    set v_jour_after_occur_info = concat(v_total_rece_amt_diff,"|");


    /* set @业务标志# = 《业务标志-应收应付调整》; */
    set v_busi_flag = 1011007;

    /* set @变动金额#=@累计应收金额差额#; */
    set v_occur_amt=v_total_rece_amt_diff;

    /* set @变动后金额# = @累计应收金额#; */
    set v_occur_end_amt = v_total_rece_amt;

    /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@产品编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_pd_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, crncy_type, busi_flag, occur_amt, 
        occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
        v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.5.21.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水变动][{累计应付金额差额}][@累计应付金额差额#] */
    set v_jour_occur_field = concat("累计应付金额差额","|");
    set v_jour_occur_info = concat(v_total_payab_amt_diff,"|");


    /* [获取流水后信息][@累计应付金额差额#] */
    set v_jour_after_occur_info = concat(v_total_payab_amt_diff,"|");


    /* set @变动金额#=@累计应付金额差额#; */
    set v_occur_amt=v_total_payab_amt_diff;

    /* set @变动后金额# = @累计应付金额#; */
    set v_occur_end_amt = v_total_payab_amt;

    /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@产品编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_pd_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, crncy_type, busi_flag, occur_amt, 
        occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
        v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.5.21.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* if @变动份额#<>0 then */
    if v_occur_share<>0 then

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
                    
            SET v_error_code = "prodA.5.21.5";
            SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编码=",v_pd_code),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;
    #更新估值净资产 modify by wjp

    /* if @估值净资产#<>0  then */
    if v_evalu_nav_asset<>0  then

        /* [更新表记录][产品_资金_产品资产表][{估值净资产}=@估值净资产#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][2][@产品编号#,"更新期初估值净资产"] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_prod.tb_pdcapit_pd_asset set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, evalu_nav_asset=v_evalu_nav_asset where pd_no=v_pd_no and crncy_type=v_crncy_type;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.5.21.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","更新期初估值净资产"),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","更新期初估值净资产");
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @期初估值净资产#<>0  then */
    if v_begin_evalu_nav_asset<>0  then

        /* [更新表记录][产品_资金_产品资产表][{期初估值净资产}=@期初估值净资产#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][2][@产品编号#,"更新期初估值净资产"] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_prod.tb_pdcapit_pd_asset set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_evalu_nav_asset=v_begin_evalu_nav_asset where pd_no=v_pd_no and crncy_type=v_crncy_type;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.5.21.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","更新期初估值净资产"),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","更新期初估值净资产");
            end if;
            leave label_pro;
        end if;

    end if;
    #set @期初估值净资产# = 0;
    #set @期初净资产# = 0;
    #set @净资产# = 0;
    #set @现金资产# = 0;
    #set @股票资产# = 0;
    #set @基金资产# = 0;
    #set @债券资产# = 0;
    #set @期货资产# = 0;
    #set @回购资产# = 0;
    #set @其他资产# = 0;
    #set @港股通资产# = 0;
    #[插入重复更新][产品_资金_产品资产表][字段][字段变量][{估值净资产}=@估值净资产#][1][@产品编号#,@本币币种#]

    /* set @更新次数# =@临时_更新次数#; */
    set v_update_times =v_tmp_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_cash_id = v_pd_cash_id;
    SET p_co_no = v_co_no;
    SET p_pd_first_amt = v_pd_first_amt;
    SET p_pd_curr_amt = v_pd_curr_amt;
    SET p_pd_dist_amt = v_pd_dist_amt;
    SET p_pd_auth_amt = v_pd_auth_amt;
    SET p_pd_amt_check_diff = v_pd_amt_check_diff;
    SET p_pd_pre_settle_amt = v_pd_pre_settle_amt;
    SET p_pd_total_cash_divide = v_pd_total_cash_divide;
    SET p_pd_total_pre_fee = v_pd_total_pre_fee;
    SET p_pd_total_rece_amt = v_pd_total_rece_amt;
    SET p_pd_total_payab_amt = v_pd_total_payab_amt;
    SET p_pd_intrst_cacl_amt = v_pd_intrst_cacl_amt;
    SET p_pd_pre_entry_intrst_amt = v_pd_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户运维_设置资产账户通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdaccobk_SetAssetAccoChannel;;
DELIMITER ;;
CREATE PROCEDURE pra_pdaccobk_SetAssetAccoChannel(
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
    IN p_pass_no int,
    IN p_pass_type int,
    IN p_out_acco varchar(32),
    IN p_config_str varchar(2048),
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
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_pass_type int;
    declare v_out_acco varchar(32);
    declare v_config_str varchar(2048);
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_trade_pwd varchar(64);
    declare v_comm_pwd varchar(64);
    declare v_online_status int;
    declare v_pwd_check_status int;
    declare v_read_flag int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_record_count int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_pass_type = p_pass_type;
    SET v_out_acco = p_out_acco;
    SET v_config_str = p_config_str;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_trade_pwd = " ";
    SET v_comm_pwd = " ";
    SET v_online_status = 0;
    SET v_pwd_check_status = 0;
    SET v_read_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_record_count = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量]; */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "资产账户编号", "|", "通道编号", "|", "通道类型", "|", "外部账号", "|", "参数配置串", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_pass_no, "|", v_pass_type, "|", v_out_acco, "|", v_config_str, "|", v_remark_info, "|", v_menu_no, "|");


    /* set @交易密码# = " "; */
    set v_trade_pwd = " ";

    /* set @通讯密码# = " "; */
    set v_comm_pwd = " ";

    /* set @在线状态# = 《在线状态-离线》; */
    set v_online_status = 2;
    #modify by wjp 201801008

    /* set @密码验证状态# = 《密码验证状态-未验证》; */
    set v_pwd_check_status = 1;

    /* set @已读标记# = 《已读标记-未读》; */
    set v_read_flag = 0;

    /* [插入重复更新][产品_账户_资产账户通道信息表][字段][字段变量][{通道编号}=@通道编号#, {通道类型}=@通道类型#, {外部账号}=@外部账号#, {参数配置串}=@参数配置串#, {备注信息}=@备注信息#][1][@机构编号#,@产品编号#,@资产账户编号#,@通道编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_asset_acco_ch (
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, co_no, 
        pd_no, asset_acco_no, pass_type, out_acco, 
        trade_pwd, comm_pwd, online_status, config_str, 
        remark_info, pwd_check_status, read_flag) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_type, v_out_acco, 
        v_trade_pwd, v_comm_pwd, v_online_status, v_config_str, 
        v_remark_info, v_pwd_check_status, v_read_flag) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pass_no=v_pass_no, pass_type=v_pass_type, out_acco=v_out_acco, config_str=v_config_str, remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.5.71.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;


    /* [获取影响行数][@记录个数#] */
    SET v_record_count=ROW_COUNT();


    /* if @记录个数#>0 then */
    if v_record_count>0 then

        /* [获取流水后信息][字段变量]; */
        set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_pass_no, "|", v_pass_type, "|", v_out_acco, "|", v_config_str, "|", v_remark_info, "|", v_menu_no, "|");


        /* set @操作菜单# = @菜单编号#; */
        set v_oper_menu_no = v_menu_no;

        /* set @操作功能# = @功能编码#; */
        set v_oper_func_code = v_func_code;

        /* set @操作备注# = "设置资产账户通道信息"; */
        set v_oper_remark_info = "设置资产账户通道信息";

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
                    
            SET v_error_code = "prodA.5.71.5";
            SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","通道编号=",v_pass_no),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户运维_查询全部资产账户通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdaccobk_QueryAssetAccoChannel;;
DELIMITER ;;
CREATE PROCEDURE pra_pdaccobk_QueryAssetAccoChannel(
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
    IN p_pass_no int,
    IN p_pd_name varchar(64),
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
    declare v_pass_no int;
    declare v_pd_name varchar(64);
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
    SET v_pass_no = p_pass_no;
    SET v_pd_name = p_pd_name;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #[获取表全记录][产品_账户_资产账户通道信息表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@通道编号# = 0 or {通道编号}=@通道编号#)]

    /* select a.* from tb_pdacco_asset_acco_ch a,tb_pdacco_pd_info b where a.pd_no=b.pd_no  and (@机构编号#=0 or a.{机构编号}=@机构编号#) and (@产品编号#=0 or a.{产品编号}=@产品编号#) and (@资产账户编号#=0 or a.{资产账户编号}=@资产账户编号#) and (@通道编号# = 0 or a.{通道编号}=@通道编号#) and (@产品名称#=" " or b.{产品名称} like concat("%",@产品名称#,"%")); */
    select a.* from tb_pdacco_asset_acco_ch a,tb_pdacco_pd_info b where a.pd_no=b.pd_no  and (v_co_no=0 or a.co_no=v_co_no) and (v_pd_no=0 or a.pd_no=v_pd_no) and (v_asset_acco_no=0 or a.asset_acco_no=v_asset_acco_no) and (v_pass_no = 0 or a.pass_no=v_pass_no) and (v_pd_name=" " or b.pd_name like concat("%",v_pd_name,"%"));
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户运维_更新资产账户状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdaccobk_UpdateAssetAccoStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_pdaccobk_UpdateAssetAccoStatus(
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
    declare v_asset_acco_no int;
    declare v_asset_acco_status varchar(2);
    declare v_oper_remark_info varchar(255);
    declare v_remark_info varchar(255);
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
    SET v_remark_info = p_remark_info;
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
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "资产账户编号", "|", "资产账户状态", "|", "操作备注", "|", "备注信息", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_asset_acco_status, "|", v_oper_remark_info, "|", v_remark_info, "|", v_menu_no, "|");


    /* if @资产账户状态#  <> 《资产账户状态-注销》 then */
    if v_asset_acco_status  <> "3" then

          /* [更新表记录][产品_账户_资产账户信息表][{资产账户状态}=@资产账户状态#][{产品编号}=@产品编号# and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)][2][@产品编号#,@资产账户编号#] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_prod.tb_pdacco_asset_acco set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, asset_acco_status=v_asset_acco_status where pd_no=v_pd_no and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no);
          if v_error_code = "1" then
                      
              SET v_error_code = "prodA.5.75.2";
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
                      
              SET v_error_code = "prodA.5.75.2";
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
                    
            SET v_error_code = "prodA.5.75.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;


        /* [获取流水后信息][字段变量]; */
        set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_asset_acco_status, "|", v_oper_remark_info, "|", v_remark_info, "|", v_menu_no, "|");


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
                    
            SET v_error_code = "prodA.5.75.5";
            SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;
    #备注信息更新，供运维端显示。

    /* if @资产账户状态# = 《资产账户状态-冻结》 or   @资产账户状态# = 《资产账户状态-正常》 then */
    if v_asset_acco_status = "2" or   v_asset_acco_status = "1" then

          /* [更新表记录][产品_账户_资产账户通道信息表][{备注信息}=@备注信息#][{产品编号}=@产品编号# and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)][2][@产品编号#,@资产账户编号#] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_prod.tb_pdacco_asset_acco_ch set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remark_info=v_remark_info where pd_no=v_pd_no and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no);
          if v_error_code = "1" then
                      
              SET v_error_code = "prodA.5.75.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
              else
                  SET v_error_info = concat("产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
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

# 原子_产品_账户运维_查询符合资产帐户类型的产品
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdaccobk_QueryProductAccordToAsacType;;
DELIMITER ;;
CREATE PROCEDURE pra_pdaccobk_QueryProductAccordToAsacType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_status varchar(2),
    IN p_asset_acco_type_str varchar(64),
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
    declare v_pd_status varchar(2);
    declare v_asset_acco_type_str varchar(64);
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
    SET v_pd_status = p_pd_status;
    SET v_asset_acco_type_str = p_asset_acco_type_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #过滤出 含有某种类型资产账户的 产品

    /* SELECT a.{产品编号},a.{机构编号},a.{产品编码},a.{产品名称},b.{产品状态} FROM ~产品_账户_产品信息表^ a, ~产品_账户_产品限制信息表^ b WHERE a.{产品编号}=b.{产品编号} AND (@机构编号#= 0 or a.{机构编号}=@机构编号#) AND (@产品编号#=0 or a.{产品编号}=@产品编号#) AND (@产品状态#= " " or b.{产品状态}=@产品状态#) AND a.{产品编号} IN (SELECT c.{产品编号} FROM tb_pdacco_asset_acco c WHERE instr(@资产账户类型串#,concat(";",c.{资产账户类型},";"))>0 AND c.{资产账户状态} <>《资产账户状态-注销》 AND (@机构编号#= 0 or c.{机构编号}=@机构编号#)); */
    SELECT a.pd_no,a.co_no,a.pd_code,a.pd_name,b.pd_status FROM db_prod.tb_pdacco_pd_info a, db_prod.tb_pdacco_pd_limit b WHERE a.pd_no=b.pd_no AND (v_co_no= 0 or a.co_no=v_co_no) AND (v_pd_no=0 or a.pd_no=v_pd_no) AND (v_pd_status= " " or b.pd_status=v_pd_status) AND a.pd_no IN (SELECT c.pd_no FROM tb_pdacco_asset_acco c WHERE instr(v_asset_acco_type_str,concat(";",c.asset_acco_type,";"))>0 AND c.asset_acco_status <>"3" AND (v_co_no= 0 or c.co_no=v_co_no));
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户运维_修改产品禁止订单方向
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdaccobk_UpdatePdForbidOrderDir;;
DELIMITER ;;
CREATE PROCEDURE pra_pdaccobk_UpdatePdForbidOrderDir(
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
    IN p_forbid_order_dir varchar(64),
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
    declare v_forbid_order_dir varchar(64);
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_forbid_order_dir = p_forbid_order_dir;
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

    
    label_pro:BEGIN
    
    #[检查正常返回][@禁止订单方向#=" "]

    /* [获取流水变动][{禁止订单方向}][@禁止订单方向#]; */
    set v_jour_occur_field = concat("禁止订单方向","|");
    set v_jour_occur_info = concat(v_forbid_order_dir,"|");


    /* [更新表记录][产品_账户_产品限制信息表][{禁止订单方向}=@禁止订单方向#][{产品编号}=@产品编号#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_pd_limit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, forbid_order_dir=v_forbid_order_dir where pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.5.77.2";
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
                
        SET v_error_code = "prodA.5.77.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户运维_查询产品限制信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdaccobk_QueryProductLimit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdaccobk_QueryProductLimit(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_账户_产品限制信息表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{机构编号},{产品编号},{成本计算方式},{允许投资市场},{允许操作证券类型},{业务控制配置串},{指令审批操作员},{市价冻结浮动比例},{禁止订单方向},{产品状态},{指令不限价浮动比例}," " as {备注信息}][(@机构编号# = 0 or {机构编号}=@机构编号#) and ({产品编号}=@产品编号#) and  {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,cost_calc_type,allow_exch,allow_stock_type,busi_config_str,comm_appr_oper,market_price_ratio,forbid_order_dir,pd_status,comm_no_limit_price_ratio," " as remark_info from db_prod.tb_pdacco_pd_limit where (v_co_no = 0 or co_no=v_co_no) and (pd_no=v_pd_no) and  row_id > v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,cost_calc_type,allow_exch,allow_stock_type,busi_config_str,comm_appr_oper,market_price_ratio,forbid_order_dir,pd_status,comm_no_limit_price_ratio," " as remark_info from db_prod.tb_pdacco_pd_limit where (v_co_no = 0 or co_no=v_co_no) and (pd_no=v_pd_no) and  row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_账户运维_设置资产账户通道表已读标记
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdaccobk_SetAssetAccoChReadFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_pdaccobk_SetAssetAccoChReadFlag(
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
    declare v_read_flag int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_read_flag = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @已读标记# = 《已读标记-已读》; */
    set v_read_flag = 1;

    /* [更新表记录][产品_账户_资产账户通道信息表][{已读标记}=@已读标记#][ {资产账户编号}=@资产账户编号#][2][@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_asset_acco_ch set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, read_flag=v_read_flag where  asset_acco_no=v_asset_acco_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.5.79.2";
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


