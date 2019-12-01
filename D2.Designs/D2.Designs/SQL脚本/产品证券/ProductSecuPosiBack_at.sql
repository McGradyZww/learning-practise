DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_获取内部证券持仓记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_GetInSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_GetInSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_curr_qty decimal(18,2),
    OUT p_avail_qty decimal(18,2),
    OUT p_out_impawn_qty decimal(18,2)
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_out_impawn_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_posi_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_curr_qty = 0;
    SET v_avail_qty = 0;
    SET v_out_impawn_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_posi_qty = 0;

    
    label_pro:BEGIN
    
    #新增修改:只内部核对投资类型表示为二级市场的持仓数据,modify by hgk,20180730

    /* if @查询记录序号# = 0 then */
    if v_query_row_id = 0 then

        /* truncate table ~产品证券_持仓_内部资产账户持仓核对表^; */
        truncate table db_pdsecu.tb_pdsepo_asac_posi_check;

        /* insert into ~产品证券_持仓_内部资产账户持仓核对表^  ({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{当前数量},{可用数量}) select @创建日期#,@创建时间#,@更新日期#,@更新时间#,1,@初始化日期#,a.{机构编号},a.{产品编号},a.{资产账户编号},a.{市场编号},a.{股东代码编号},a.{证券代码编号},a.{当前数量},a.{当前数量}+a.{待交收数量}+a.{持仓核对差额} from ~产品证券_持仓_资产账户持仓表^ a where (a.{资产账户编号},a.{股东代码编号},a.{证券代码编号}) not in (select {资产账户编号},{股东代码编号},{证券代码编号}  from ~产品证券_持仓_外部资产账户持仓表^ where {初始化日期}=@初始化日期#) and a.{投资类型}=1 and a.{证券类型}<>《证券类型-回购标准券》 and (a.{资产账户编号},a.{股东代码编号},a.{证券代码编号}) not in (select {资产账户编号},{股东代码编号},{证券代码编号}  from ~产品证券_持仓_外部资产账户债券质押表^ where {初始化日期}=@初始化日期#) and (a.{当前数量}<>0 or a.{待交收数量}<>0 or a.{持仓核对差额}<>0 or IFNULL((select {持仓数量} from ~产品证券_持仓_交易资产账户持仓表^ b where b.{资产账户编号}=a.{资产账户编号} and b.{股东代码编号}=a.{股东代码编号} and b.{证券代码编号}=a.{证券代码编号}),0)<>0)  order by a.{资产账户编号},a.{股东代码编号},a.{证券代码编号}; */
        insert into db_pdsecu.tb_pdsepo_asac_posi_check  (create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,curr_qty,avail_qty) select v_create_date,v_create_time,v_update_date,v_update_time,1,v_init_date,a.co_no,a.pd_no,a.asset_acco_no,a.exch_no,a.stock_acco_no,a.stock_code_no,a.curr_qty,a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff from db_pdsecu.tb_pdsepo_asac_posi a where (a.asset_acco_no,a.stock_acco_no,a.stock_code_no) not in (select asset_acco_no,stock_acco_no,stock_code_no  from db_pdsecu.tb_pdsepo_out_asac_posi where init_date=v_init_date) and a.invest_type=1 and a.stock_type<>27 and (a.asset_acco_no,a.stock_acco_no,a.stock_code_no) not in (select asset_acco_no,stock_acco_no,stock_code_no  from db_pdsecu.tb_pdsepo_out_asac_bond_pledge where init_date=v_init_date) and (a.curr_qty<>0 or a.pre_settle_qty<>0 or a.posi_qty_check_diff<>0 or IFNULL((select posi_qty from db_pdsecu.tb_pdsepo_trd_asac_posi b where b.asset_acco_no=a.asset_acco_no and b.stock_acco_no=a.stock_acco_no and b.stock_code_no=a.stock_code_no),0)<>0)  order by a.asset_acco_no,a.stock_acco_no,a.stock_code_no;
    #债券回购单独核对，外部持仓记回购代码，内部记的是标准券代码。Modify by wjp20190628

      /* insert into ~产品证券_持仓_内部资产账户持仓核对表^  ({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{当前数量},{可用数量}) 
select @创建日期#,@创建时间#,@更新日期#,@更新时间#,1,@初始化日期#,a.{机构编号},a.{产品编号},a.{资产账户编号},a.{市场编号},a.{股东代码编号},a.{证券代码编号},a.{当前数量},a.{当前数量}+a.{待交收数量}+a.{持仓核对差额} from ~产品证券_持仓_资产账户持仓表^ a where (a.{资产账户编号},a.{股东代码编号}) not in (select c.{资产账户编号},c.{股东代码编号}  from ~产品证券_持仓_外部资产账户持仓表^ c where c.{初始化日期}=@初始化日期# and if(a.{市场编号}=1,c.{证券代码} in ("204001","204002","204003","204007","204014","204028","204091","204182"),c.{证券代码} in ("131810","131811","131800","131801","131802","131803","131805","131806","131809"))) and a.{投资类型}=1 and a.{证券类型}=《证券类型-回购标准券》  and (a.{当前数量}<>0 or a.{待交收数量}<>0 or a.{持仓核对差额}<>0 or IFNULL((select {持仓数量} from ~产品证券_持仓_交易资产账户持仓表^ b where b.{资产账户编号}=a.{资产账户编号} and b.{股东代码编号}=a.{股东代码编号} and b.{证券代码编号}=a.{证券代码编号}),0)<>0)  order by a.{资产账户编号},a.{股东代码编号},a.{证券代码编号}; */
      insert into db_pdsecu.tb_pdsepo_asac_posi_check  (create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,curr_qty,avail_qty) 
      select v_create_date,v_create_time,v_update_date,v_update_time,1,v_init_date,a.co_no,a.pd_no,a.asset_acco_no,a.exch_no,a.stock_acco_no,a.stock_code_no,a.curr_qty,a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff from db_pdsecu.tb_pdsepo_asac_posi a where (a.asset_acco_no,a.stock_acco_no) not in (select c.asset_acco_no,c.stock_acco_no  from db_pdsecu.tb_pdsepo_out_asac_posi c where c.init_date=v_init_date and if(a.exch_no=1,c.stock_code in ("204001","204002","204003","204007","204014","204028","204091","204182"),c.stock_code in ("131810","131811","131800","131801","131802","131803","131805","131806","131809"))) and a.invest_type=1 and a.stock_type=27  and (a.curr_qty<>0 or a.pre_settle_qty<>0 or a.posi_qty_check_diff<>0 or IFNULL((select posi_qty from db_pdsecu.tb_pdsepo_trd_asac_posi b where b.asset_acco_no=a.asset_acco_no and b.stock_acco_no=a.stock_acco_no and b.stock_code_no=a.stock_code_no),0)<>0)  order by a.asset_acco_no,a.stock_acco_no,a.stock_code_no;
    end if;

    /* [获取表记录变量][产品证券_持仓_内部资产账户持仓核对表][{记录序号},{机构编号},{产品编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{当前数量},{可用数量}][@记录序号#,@机构编号#,@产品编号#,@资产账户编号#,@市场编号#,@股东代码编号#,@证券代码编号#,@当前数量#,@可用数量#][{记录序号} > @查询记录序号# order by {记录序号}][4][@查询记录序号#] */
    select row_id,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,curr_qty,avail_qty into v_row_id,v_co_no,v_pd_no,v_asset_acco_no,v_exch_no,v_stock_acco_no,v_stock_code_no,v_curr_qty,v_avail_qty from db_pdsecu.tb_pdsepo_asac_posi_check where row_id > v_query_row_id order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.9.1.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][产品证券_持仓_交易资产账户持仓表][{持仓数量}][@持仓数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
    select posi_qty into v_posi_qty from db_pdsecu.tb_pdsepo_trd_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;


    /* set @可用数量#=@可用数量#+@持仓数量#; */
    set v_avail_qty=v_avail_qty+v_posi_qty;

    /* [获取表记录变量语句][产品证券_持仓_外部资产账户债券质押表][{外部可用数量}][@外部质押数量#][{初始化日期}=@初始化日期# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
    select out_enable_qty into v_out_impawn_qty from db_pdsecu.tb_pdsepo_out_asac_bond_pledge where init_date=v_init_date and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_curr_qty = v_curr_qty;
    SET p_avail_qty = v_avail_qty;
    SET p_out_impawn_qty = v_out_impawn_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_转入内部证券持仓核对记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_AddInSecuPosiCkeck;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_AddInSecuPosiCkeck(
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
    IN p_default_exch_group_no int,
    IN p_asac_busi_config_str varchar(64),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_curr_qty decimal(18,2),
    IN p_avail_qty decimal(18,2),
    IN p_out_impawn_qty decimal(18,2),
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
    declare v_default_exch_group_no int;
    declare v_asac_busi_config_str varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_out_impawn_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_deal_flag int;
    declare v_remark_info varchar(255);
    declare v_asset_sync_flag int;
    declare v_add_pledge_to_bond int;
    declare v_record_count int;
    declare v_crncy_type varchar(3);
    declare v_exch_group_no int;
    declare v_out_cost_price decimal(16,9);
    declare v_acco_curr_qty decimal(18,2);
    declare v_acco_avail_qty decimal(18,2);
    declare v_out_curr_qty decimal(18,2);
    declare v_out_enable_qty decimal(18,2);
    declare v_acco_curr_qty_diff decimal(18,2);
    declare v_acco_avail_qty_diff decimal(18,2);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_curr_qty = p_curr_qty;
    SET v_avail_qty = p_avail_qty;
    SET v_out_impawn_qty = p_out_impawn_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_deal_flag = 0;
    SET v_remark_info = " ";
    SET v_asset_sync_flag = 0;
    SET v_add_pledge_to_bond = 0;
    SET v_record_count = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_group_no = 0;
    SET v_out_cost_price = 0;
    SET v_acco_curr_qty = 0;
    SET v_acco_avail_qty = 0;
    SET v_out_curr_qty = 0;
    SET v_out_enable_qty = 0;
    SET v_acco_curr_qty_diff = 0;
    SET v_acco_avail_qty_diff = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @处理标志# = 《处理标志-内部数据》; */
    set v_deal_flag = 3;

    /* set @备注信息# = "内部数据转入"; */
    set v_remark_info = "内部数据转入";

    /* set @资产是否同步#=cast(substring(@资产账户业务控制配置串#, 12, 1) as SIGNED); */
    set v_asset_sync_flag=cast(substring(v_asac_busi_config_str, 12, 1) as SIGNED);

    /* set @质押数量累加到债券数量#=cast(substring(@资产账户业务控制配置串#, 19, 1) as SIGNED); */
    set v_add_pledge_to_bond=cast(substring(v_asac_busi_config_str, 19, 1) as SIGNED);

    /* [获取表记录数量][产品证券_资金_交易组资金表][@记录个数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select count(1) into v_record_count from db_pdsecu.tb_pdseca_exgp_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;


    /* if @记录个数#=1 then */
    if v_record_count=1 then

        /* [获取表记录变量][产品证券_资金_交易组资金表][{交易组编号}][@交易组编号#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
        select exch_group_no into v_exch_group_no from db_pdsecu.tb_pdseca_exgp_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.9.2.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;

    else

        /* set @交易组编号# = @默认交易组编号#; */
        set v_exch_group_no = v_default_exch_group_no;
    end if;

    /* set @外部成本价# = 0; */
    set v_out_cost_price = 0;

    /* set @账户当前数量# = @当前数量#; */
    set v_acco_curr_qty = v_curr_qty;

    /* set @账户可用数量# = @可用数量#; */
    set v_acco_avail_qty = v_avail_qty;

    /* set @外部当前数量# = 0; */
    set v_out_curr_qty = 0;

    /* set @外部可用数量# = 0; */
    set v_out_enable_qty = 0;

    /* set @账户当前数量差额#= @外部当前数量#-@账户当前数量#+@外部质押数量#; */
    set v_acco_curr_qty_diff= v_out_curr_qty-v_acco_curr_qty+v_out_impawn_qty;

    /* if @质押数量累加到债券数量#<>1 then */
    if v_add_pledge_to_bond<>1 then

        /* set @账户当前数量差额#=@账户当前数量差额#-@外部质押数量#; */
        set v_acco_curr_qty_diff=v_acco_curr_qty_diff-v_out_impawn_qty;
    end if;

    /* set @账户可用数量差额#=@外部可用数量#-@账户可用数量#-@账户当前数量差额#; */
    set v_acco_avail_qty_diff=v_out_enable_qty-v_acco_avail_qty-v_acco_curr_qty_diff;
    #新做的修改,为了避免在内部核对的过程中报盘已经把数据搂回来了,先检查表中是否有记录存在

    /* [获取表记录数量][产品证券_持仓_内外资产账户持仓差异表][@记录个数#][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {股东代码}=@股东代码# and {证券代码}=@证券代码#] */
    select count(1) into v_record_count from db_pdsecu.tb_pdsepo_asac_posi_diff where init_date=v_init_date and pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and stock_acco=v_stock_acco and stock_code=v_stock_code;


    /* if @记录个数#=0 then */
    if v_record_count=0 then

        /* [插入重复更新][产品证券_持仓_内外资产账户持仓差异表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {交易组编号}=@交易组编号#, {股东代码编号}=@股东代码编号#, {证券代码编号}=@证券代码编号#, {证券名称}=@证券名称#, {账户当前数量}=@账户当前数量#, {账户可用数量}=@账户可用数量# , {外部质押数量}=@外部质押数量#, {账户当前数量差额}=@账户当前数量差额#, {账户可用数量差额}=@账户可用数量差额#, {处理标志}=@处理标志#, {资产是否同步}=@资产是否同步#, {备注信息}=@备注信息#][1][@初始化日期#,@通道编号#,@外部账号#,@股东代码#,@市场编号#,@证券代码#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_asac_posi_diff (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, asset_acco_no, exch_group_no, pass_no, 
            out_acco, exch_no, stock_acco_no, stock_acco, 
            stock_code_no, stock_code, stock_name, stock_type, 
            asset_type, out_cost_price, acco_curr_qty, acco_avail_qty, 
            out_curr_qty, out_enable_qty, acco_curr_qty_diff, acco_avail_qty_diff, 
            out_impawn_qty, deal_flag, asset_sync_flag, remark_info) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_exch_group_no, v_pass_no, 
            v_out_acco, v_exch_no, v_stock_acco_no, v_stock_acco, 
            v_stock_code_no, v_stock_code, v_stock_name, v_stock_type, 
            v_asset_type, v_out_cost_price, v_acco_curr_qty, v_acco_avail_qty, 
            v_out_curr_qty, v_out_enable_qty, v_acco_curr_qty_diff, v_acco_avail_qty_diff, 
            v_out_impawn_qty, v_deal_flag, v_asset_sync_flag, v_remark_info) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, exch_group_no=v_exch_group_no, stock_acco_no=v_stock_acco_no, stock_code_no=v_stock_code_no, stock_name=v_stock_name, acco_curr_qty=v_acco_curr_qty, acco_avail_qty=v_acco_avail_qty , out_impawn_qty=v_out_impawn_qty, acco_curr_qty_diff=v_acco_curr_qty_diff, acco_avail_qty_diff=v_acco_avail_qty_diff, deal_flag=v_deal_flag, asset_sync_flag=v_asset_sync_flag, remark_info=v_remark_info;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.9.2.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","股东代码=",v_stock_acco,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","股东代码=",v_stock_acco,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_查询资产账户内外持仓差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_QuerySecuPosiDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_QuerySecuPosiDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_asset_acco_no int,
    IN p_stock_code_str varchar(4096),
    IN p_exch_no_str varchar(2048),
    IN p_is_contain int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_deal_flag_query_str varchar(2048),
    IN p_filter_diff_cond int,
    IN p_asset_sync_flag int,
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
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_asset_acco_no int;
    declare v_stock_code_str varchar(4096);
    declare v_exch_no_str varchar(2048);
    declare v_is_contain int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_deal_flag_query_str varchar(2048);
    declare v_filter_diff_cond int;
    declare v_asset_sync_flag int;
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
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_str = p_stock_code_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_is_contain = p_is_contain;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_deal_flag_query_str = p_deal_flag_query_str;
    SET v_filter_diff_cond = p_filter_diff_cond;
    SET v_asset_sync_flag = p_asset_sync_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_内外资产账户持仓差异表][字段][(@机构编号串#="; ;" or instr(@机构编号串#, concat(";",{机构编号},";"))>0) and (@产品编号串#="; ;" or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@市场编号串#="; ;" or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (((@证券代码串#="; ;" or instr(@证券代码串#, concat(";",{证券代码},";"))>0) and @是否包含#=1) or ((@证券代码串#="; ;" or instr(@证券代码串#, concat(";",{证券代码},";"))=0) and @是否包含#=0)) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@处理标志查询串#="; ;" or instr(@处理标志查询串#,concat(";",{处理标志},";"))>0) and (@过滤差额条件#=《过滤差额条件-不过滤》 or (@过滤差额条件#=《过滤差额条件-只显示差额不为0》 and ({账户当前数量差额}<>0 or {账户可用数量差额}<>0)) or (@过滤差额条件#=《过滤差额条件-只显示差额为0》 and ({账户当前数量差额}=0 and {账户可用数量差额}=0))) and (@资产是否同步#=0 or {资产是否同步}=@资产是否同步#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_name, 
        stock_type, asset_type, out_cost_price, acco_curr_qty, 
        acco_avail_qty, out_curr_qty, out_enable_qty, acco_curr_qty_diff, 
        acco_avail_qty_diff, out_impawn_qty, deal_flag, asset_sync_flag, 
        remark_info from db_pdsecu.tb_pdsepo_asac_posi_diff where (v_co_no_str="; ;" or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_no_str="; ;" or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))>0) and v_is_contain=1) or ((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))=0) and v_is_contain=0)) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_qty_diff<>0 or acco_avail_qty_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_qty_diff=0 and acco_avail_qty_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_name, 
        stock_type, asset_type, out_cost_price, acco_curr_qty, 
        acco_avail_qty, out_curr_qty, out_enable_qty, acco_curr_qty_diff, 
        acco_avail_qty_diff, out_impawn_qty, deal_flag, asset_sync_flag, 
        remark_info from db_pdsecu.tb_pdsepo_asac_posi_diff where (v_co_no_str="; ;" or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_no_str="; ;" or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))>0) and v_is_contain=1) or ((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))=0) and v_is_contain=0)) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_qty_diff<>0 or acco_avail_qty_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_qty_diff=0 and acco_avail_qty_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_处理资产账户内外持仓差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_DealSecuPosiDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_DealSecuPosiDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_sync_deal_type int,
    IN p_menu_no int,
    IN p_valid_flag int,
    IN p_busi_config_str varchar(64),
    IN p_deal_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_occur_qty decimal(18,2),
    OUT p_asset_sync_flag int,
    OUT p_asac_posi_id bigint,
    OUT p_asac_stock_type int,
    OUT p_asac_asset_type int,
    OUT p_asac_invest_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_pre_settle_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_posi_qty_check_diff decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
    OUT p_asac_update_times int,
    OUT p_exgp_posi_id bigint,
    OUT p_exch_group_stock_type int,
    OUT p_exch_group_asset_type int,
    OUT p_exgp_invest_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_pre_settle_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_posi_qty_check_diff decimal(18,2),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
    OUT p_exch_group_update_times int
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
    declare v_sync_deal_type int;
    declare v_menu_no int;
    declare v_valid_flag int;
    declare v_busi_config_str varchar(64);
    declare v_deal_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_asset_sync_flag int;
    declare v_asac_posi_id bigint;
    declare v_asac_stock_type int;
    declare v_asac_asset_type int;
    declare v_asac_invest_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_pre_settle_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_posi_qty_check_diff decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_asac_update_times int;
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
    declare v_exch_group_asset_type int;
    declare v_exgp_invest_type int;
    declare v_exch_group_begin_qty decimal(18,2);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_exgp_pre_settle_qty decimal(18,2);
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_posi_qty_check_diff decimal(18,2);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_exch_group_update_times int;
    declare v_config_value varchar(2048);
    declare v_add_pledge_to_bond int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_out_cost_price decimal(16,9);
    declare v_acco_curr_qty decimal(18,2);
    declare v_acco_avail_qty decimal(18,2);
    declare v_out_curr_qty decimal(18,2);
    declare v_out_enable_qty decimal(18,2);
    declare v_acco_curr_qty_diff decimal(18,2);
    declare v_acco_avail_qty_diff decimal(18,2);
    declare v_out_impawn_qty decimal(18,2);
    declare v_deal_flag int;
    declare v_remark_info varchar(255);
    declare v_tmp_remark_info varchar(255);
    declare v_tmp_deal_flag int;
    declare v_default_exch_group_no int;
    declare v_invest_type int;
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_tmp_posi_qty decimal(18,2);
    declare v_tmp_cost_amt decimal(18,4);
    declare v_cost_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_occur_end_qty decimal(18,2);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_tmp_row_id bigint;
    declare v_query_row_id bigint;
    declare v_jour_after_occur_info varchar(2048);
    declare v_posi_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_tmp_curr_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_sync_deal_type = p_sync_deal_type;
    SET v_menu_no = p_menu_no;
    SET v_valid_flag = p_valid_flag;
    SET v_busi_config_str = p_busi_config_str;
    SET v_deal_info = p_deal_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_occur_qty = 0;
    SET v_asset_sync_flag = 0;
    SET v_asac_posi_id = 0;
    SET v_asac_stock_type = 0;
    SET v_asac_asset_type = 0;
    SET v_asac_invest_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_pre_settle_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_posi_qty_check_diff = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_asac_update_times = 0;
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
    SET v_exch_group_asset_type = 0;
    SET v_exgp_invest_type = 0;
    SET v_exch_group_begin_qty = 0;
    SET v_exgp_curr_qty = 0;
    SET v_exgp_pre_settle_qty = 0;
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_posi_qty_check_diff = 0;
    SET v_exgp_cost_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_exch_group_update_times = 0;
    SET v_config_value = " ";
    SET v_add_pledge_to_bond = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_stock_name = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_out_cost_price = 0;
    SET v_acco_curr_qty = 0;
    SET v_acco_avail_qty = 0;
    SET v_out_curr_qty = 0;
    SET v_out_enable_qty = 0;
    SET v_acco_curr_qty_diff = 0;
    SET v_acco_avail_qty_diff = 0;
    SET v_out_impawn_qty = 0;
    SET v_deal_flag = 0;
    SET v_remark_info = " ";
    SET v_tmp_remark_info = " ";
    SET v_tmp_deal_flag = 0;
    SET v_default_exch_group_no = 0;
    SET v_invest_type = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_tmp_posi_qty = 0;
    SET v_tmp_cost_amt = 0;
    SET v_cost_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_occur_end_qty = 0;
    SET v_exgp_avail_qty = 0;
    SET v_tmp_row_id = 0;
    SET v_query_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_posi_qty = 0;
    SET v_avail_qty = 0;
    SET v_tmp_curr_qty = 0;

    
    label_pro:BEGIN
    

    /* set @配置值#=substring(@业务控制配置串#,18,1); */
    set v_config_value=substring(v_busi_config_str,18,1);

    /* set @质押数量累加到债券数量#=cast(substring(@业务控制配置串#, 19, 1) as SIGNED); */
    set v_add_pledge_to_bond=cast(substring(v_busi_config_str, 19, 1) as SIGNED);

    /* [锁定获取表记录变量][产品证券_持仓_内外资产账户持仓差异表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_name, 
        stock_type, asset_type, out_cost_price, acco_curr_qty, 
        acco_avail_qty, out_curr_qty, out_enable_qty, acco_curr_qty_diff, 
        acco_avail_qty_diff, out_impawn_qty, deal_flag, asset_sync_flag, 
        remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_pass_no, v_out_acco, v_exch_no, v_stock_acco_no, 
        v_stock_acco, v_stock_code_no, v_stock_code, v_stock_name, 
        v_stock_type, v_asset_type, v_out_cost_price, v_acco_curr_qty, 
        v_acco_avail_qty, v_out_curr_qty, v_out_enable_qty, v_acco_curr_qty_diff, 
        v_acco_avail_qty_diff, v_out_impawn_qty, v_deal_flag, v_asset_sync_flag, 
        v_remark_info from db_pdsecu.tb_pdsepo_asac_posi_diff where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.9.4.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @临时_备注信息# = @备注信息#; */
    set v_tmp_remark_info = v_remark_info;

    /* set @临时_处理标志# = @处理标志#; */
    set v_tmp_deal_flag = v_deal_flag;

    /* set @默认交易组编号#=@交易组编号#; */
    set v_default_exch_group_no=v_exch_group_no;

    /* set @投资类型#=1; */
    set v_invest_type=1;
    #场外市场暂不同步。

    /* [检查正常返回][@市场编号# <>《市场编号-上海证券交易所》  and   @市场编号# <>《市场编号-深圳证券交易所》  and  @市场编号# <>《市场编号-沪港通证券交易所》  and @市场编号# <>《市场编号-深港通证券交易所》 ] */
    if v_exch_no <>1  and   v_exch_no <>2  and  v_exch_no <>3  and v_exch_no <>4  then
        leave label_pro;
    end if;


    /* [检查报错返回][@处理标志# = 《处理标志-已处理》][14][@处理标志#] */
    if v_deal_flag = 1 then
        
        SET v_error_code = "pdsecuA.9.4.14";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("处理标志=",v_deal_flag),"#",v_mysql_message);
        else
            SET v_error_info = concat("处理标志=",v_deal_flag);
        end if;
        leave label_pro;
    end if;


    /* [检查正常返回][@资产是否同步#=《资产是否同步-不同步资金不同步持仓》 or @资产是否同步#=《资产是否同步-同步资金不同步持仓》] */
    if v_asset_sync_flag=2 or v_asset_sync_flag=3 then
        leave label_pro;
    end if;

    #有效标志为0,说明是已兑付债券,不处理这条数据

    /* if @有效标志#=0 then */
    if v_valid_flag=0 then

      /* set @处理标志# = 《处理标志-不处理》; */
      set v_deal_flag = 5;

      /* set @备注信息#="该债券已兑付！"; */
      set v_remark_info="该债券已兑付！";

      /* [更新表记录][产品证券_持仓_内外资产账户持仓差异表][{处理标志}=@处理标志#,{备注信息}=@备注信息#][{记录序号}=@记录序号#][2][@记录序号#] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_pdsecu.tb_pdsepo_asac_posi_diff set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=v_deal_flag,remark_info=v_remark_info where row_id=v_row_id;
      if v_error_code = "1" then
                  
          SET v_error_code = "pdsecuA.9.4.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
          else
              SET v_error_info = concat("记录序号=",v_row_id);
          end if;
          leave label_pro;
      end if;

    end if;

    /* [检查正常返回][@有效标志#=0] */
    if v_valid_flag=0 then
        leave label_pro;
    end if;


    /* set @持仓核对差额#=@账户可用数量差额#; */
    set v_posi_qty_check_diff=v_acco_avail_qty_diff;

    /* set @变动数量# = @账户当前数量差额#; */
    set v_occur_qty = v_acco_curr_qty_diff;

    /* set @处理标志# = 《处理标志-已处理》; */
    set v_deal_flag = 1;
    #自动同步时，传入备注已区别手工同步

    /* if @处理信息#=" " then */
    if v_deal_info=" " then

        /* set @备注信息#="数据已成功同步！"; */
        set v_remark_info="数据已成功同步！";
    else

        /* set @备注信息#=@处理信息#; */
        set v_remark_info=v_deal_info;
    end if;

    /* if @变动数量# > (0) then */
    if v_occur_qty > (0) then

        /* set @业务标志#=《业务标志-同步持仓蓝补》; */
        set v_busi_flag=1103004;
    else

        /* set @业务标志#=《业务标志-同步持仓红冲》; */
        set v_busi_flag=1103003;
    end if;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注#=concat("系统自动同步外部持仓数据！","|","期初数量差额"); */
    set v_oper_remark_info=concat("系统自动同步外部持仓数据！","|","期初数量差额");
    #if @变动数量# <> 0 or @账户可用数量差额#<>0 or @同步处理方式# = 2 then

    /* if @同步处理方式# = 2 then */
    if v_sync_deal_type = 2 then

        /* set @期初数量# = 0; */
        set v_begin_qty = 0;

        /* set @当前数量# = @变动数量#; */
        set v_curr_qty = v_occur_qty;

        /* set @待交收数量# = 0; */
        set v_pre_settle_qty = 0;

        /* set @冻结数量# = 0; */
        set v_frozen_qty = 0;

        /* set @解冻数量# = 0; */
        set v_unfroz_qty = 0;

        /* set @实现盈亏# = 0; */
        set v_realize_pandl = 0;

        /* set @利息成本金额# = 0; */
        set v_intrst_cost_amt = 0;

        /* set @利息收益# = 0; */
        set v_intrst_pandl = 0;

        /* [获取表记录变量语句][产品证券_持仓_交易库交易组持仓表][{持仓数量},{成本金额}][@临时_持仓数量#,@临时_成本金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
        select posi_qty,cost_amt into v_tmp_posi_qty,v_tmp_cost_amt from db_pdsecu.tb_pdsepo_trd_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;


        /* set @成本金额# = (@变动数量#+@持仓核对差额#+@临时_持仓数量#)*@外部成本价#-@临时_成本金额#; */
        set v_cost_amt = (v_occur_qty+v_posi_qty_check_diff+v_tmp_posi_qty)*v_out_cost_price-v_tmp_cost_amt;

        /* [获取流水变动][{成本金额},{外部成本价}][@成本金额#,@外部成本价#] */
        set v_jour_occur_field = concat("成本金额","|","外部成本价","|");
        set v_jour_occur_info = concat(v_cost_amt,"|",v_out_cost_price,"|");


        /* if @变动数量# <> 0 then */
        if v_occur_qty <> 0 then

            /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{当前数量}={当前数量}+@变动数量#,{持仓核对差额}={持仓核对差额}+@持仓核对差额#][1][@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_exgp_posi (
                create_date, create_time, update_date, 
                update_time, update_times, co_no, pd_no, 
                exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
                stock_code_no, stock_type, asset_type, invest_type, 
                begin_qty, curr_qty, pre_settle_qty, frozen_qty, 
                unfroz_qty, posi_qty_check_diff, cost_amt, realize_pandl, 
                intrst_cost_amt, intrst_pandl) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_co_no, v_pd_no, 
                v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
                v_stock_code_no, v_stock_type, v_asset_type, v_invest_type, 
                v_begin_qty, v_curr_qty, v_pre_settle_qty, v_frozen_qty, 
                v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, 
                v_intrst_cost_amt, v_intrst_pandl) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=curr_qty+v_occur_qty,posi_qty_check_diff=posi_qty_check_diff+v_posi_qty_check_diff;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.9.4.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;


            /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量},{当前数量}+{待交收数量}+{持仓核对差额}][@变动后数量#,@交易组持仓序号#,@交易组证券类型#,@交易组资产类型#,@交易组投资类型#,@交易组期初数量#,@交易组当前数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组持仓核对差额#,@交易组实现盈亏#,@交易组利息成本金额#,@交易组利息收益#,@交易组更新次数#,@交易组待交收数量#,@交易组可用数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
            select curr_qty,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty,curr_qty+pre_settle_qty+posi_qty_check_diff into v_occur_end_qty,v_exgp_posi_id,v_exch_group_stock_type,v_exch_group_asset_type,v_exgp_invest_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_posi_qty_check_diff,v_exgp_realize_pandl,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_exch_group_update_times,v_exgp_pre_settle_qty,v_exgp_avail_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.9.4.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;

        else

            /* set @变动后数量# = 0; */
            set v_occur_end_qty = 0;

            /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{持仓核对差额}={持仓核对差额}+@持仓核对差额#][1][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_exgp_posi (
                create_date, create_time, update_date, 
                update_time, update_times, co_no, pd_no, 
                exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
                stock_code_no, stock_type, asset_type, invest_type, 
                begin_qty, curr_qty, pre_settle_qty, frozen_qty, 
                unfroz_qty, posi_qty_check_diff, cost_amt, realize_pandl, 
                intrst_cost_amt, intrst_pandl) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_co_no, v_pd_no, 
                v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
                v_stock_code_no, v_stock_type, v_asset_type, v_invest_type, 
                v_begin_qty, v_curr_qty, v_pre_settle_qty, v_frozen_qty, 
                v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, 
                v_intrst_cost_amt, v_intrst_pandl) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, posi_qty_check_diff=posi_qty_check_diff+v_posi_qty_check_diff;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.9.4.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;


            /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{当前数量},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量},{当前数量}+{待交收数量}+{持仓核对差额}][@变动后数量#,@交易组持仓序号#,@交易组证券类型#,@交易组资产类型#,@交易组投资类型#,@交易组期初数量#,@交易组当前数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组持仓核对差额#,@交易组实现盈亏#,@交易组利息成本金额#,@交易组利息收益#,@交易组更新次数#,@交易组待交收数量#,@交易组可用数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
            select curr_qty,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty,curr_qty+pre_settle_qty+posi_qty_check_diff into v_occur_end_qty,v_exgp_posi_id,v_exch_group_stock_type,v_exch_group_asset_type,v_exgp_invest_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_posi_qty_check_diff,v_exgp_realize_pandl,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_exch_group_update_times,v_exgp_pre_settle_qty,v_exgp_avail_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;

        end if;

        /* set  @临时_记录序号#=@记录序号#; */
        set  v_tmp_row_id=v_row_id;
        #如果有配置同步的时候更新成本金额,那么同时更新同一资产账户下的非默认交易组的具有该持仓的成本金额

        /* if @配置值#=1 then */
        if v_config_value=1 then

            /* set @查询记录序号#=0; */
            set v_query_row_id=0;
            loop_label:loop

                /* set @记录序号#=0; */
                set v_row_id=0;

                /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{记录序号},{股东代码编号},{交易组编号}][@记录序号#,@股东代码编号#,@交易组编号#][{资产账户编号}=@资产账户编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型# and {记录序号}>@查询记录序号#] */
                select row_id,stock_acco_no,exch_group_no into v_row_id,v_stock_acco_no,v_exch_group_no from db_pdsecu.tb_pdsepo_exgp_posi where asset_acco_no=v_asset_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type and row_id>v_query_row_id limit 1;


                /* if @记录序号#=0 then */
                if v_row_id=0 then
                    leave loop_label;
                end if;

                /* set @查询记录序号#=@记录序号#; */
                set v_query_row_id=v_row_id;

                /* set @临时_持仓数量#=0; */
                set v_tmp_posi_qty=0;

                /* set @临时_成本金额#=0; */
                set v_tmp_cost_amt=0;

                /* [获取表记录变量语句][产品证券_持仓_交易库交易组持仓表][{持仓数量},{成本金额}][@临时_持仓数量#,@临时_成本金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
                select posi_qty,cost_amt into v_tmp_posi_qty,v_tmp_cost_amt from db_pdsecu.tb_pdsepo_trd_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;


                /* [更新表记录][产品证券_持仓_交易组持仓表][{成本金额}=({当前数量}+{待交收数量}+{持仓核对差额}+@临时_持仓数量#)*@外部成本价#-@临时_成本金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][2][@资产账户编号#,@交易组编号#,@证券代码编号#,@投资类型#] */
                set v_update_date = date_format(curdate(),'%Y%m%d');
                set v_update_time = date_format(curtime(),'%H%i%s');
                update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cost_amt=(curr_qty+pre_settle_qty+posi_qty_check_diff+v_tmp_posi_qty)*v_out_cost_price-v_tmp_cost_amt where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type;
                if v_error_code = "1" then
                            
                    SET v_error_code = "pdsecuA.9.4.2";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
                    end if;
                    leave label_pro;
                end if;

            end loop;
        end if;

        /* set @记录序号#=@临时_记录序号#; */
        set v_row_id=v_tmp_row_id;

        /* set @交易组编号#=@默认交易组编号#; */
        set v_exch_group_no=v_default_exch_group_no;

        /* [获取表记录变量][产品证券_持仓_交易组持仓表][{成本金额},{成本金额}][@成本金额#,@交易组成本金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
        select cost_amt,cost_amt into v_cost_amt,v_exgp_cost_amt from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.9.4.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
            end if;
            leave label_pro;
        end if;


        /* [获取流水后信息][@成本金额#,@外部成本价#] */
        set v_jour_after_occur_info = concat(v_cost_amt,"|",v_out_cost_price,"|");


        /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_exgp_posi_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, exch_no, 
            stock_acco_no, stock_code_no, busi_flag, occur_qty, 
            occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
            invest_type) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
            v_stock_acco_no, v_stock_code_no, v_busi_flag, v_occur_qty, 
            v_occur_end_qty, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, 
            v_invest_type);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.9.4.5";
            SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;

        #获取交易库中的持仓数量

        /* set @临时_成本金额#=0; */
        set v_tmp_cost_amt=0;

        /* [获取表记录变量语句][产品证券_持仓_交易资产账户持仓表][{持仓数量},{成本金额}][@持仓数量#,@临时_成本金额#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
        select posi_qty,cost_amt into v_posi_qty,v_tmp_cost_amt from db_pdsecu.tb_pdsepo_trd_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;


        /* set @可用数量#=0; */
        set v_avail_qty=0;

        /* set @变动数量#=@账户当前数量差额#; */
        set v_occur_qty=v_acco_curr_qty_diff;

        /* set @成本金额# = (@变动数量#+@持仓核对差额#+@持仓数量#)*@外部成本价#-@临时_成本金额#; */
        set v_cost_amt = (v_occur_qty+v_posi_qty_check_diff+v_posi_qty)*v_out_cost_price-v_tmp_cost_amt;

        /* if @变动数量# <> 0 then */
        if v_occur_qty <> 0 then

            /* [插入重复更新][产品证券_持仓_资产账户持仓表][字段][字段变量][{持仓核对差额}={持仓核对差额}+@持仓核对差额#,{当前数量}={当前数量}+@变动数量#][1][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_asac_posi (
                create_date, create_time, update_date, 
                update_time, update_times, co_no, pd_no, 
                asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
                stock_type, asset_type, invest_type, begin_qty, 
                curr_qty, pre_settle_qty, frozen_qty, unfroz_qty, 
                posi_qty_check_diff, cost_amt, realize_pandl, intrst_cost_amt, 
                intrst_pandl) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_co_no, v_pd_no, 
                v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
                v_stock_type, v_asset_type, v_invest_type, v_begin_qty, 
                v_curr_qty, v_pre_settle_qty, v_frozen_qty, v_unfroz_qty, 
                v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, v_intrst_cost_amt, 
                v_intrst_pandl) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, posi_qty_check_diff=posi_qty_check_diff+v_posi_qty_check_diff,curr_qty=curr_qty+v_occur_qty;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.9.4.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;


            /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{当前数量},{当前数量},{当前数量}+{待交收数量}+{持仓核对差额},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@变动后数量#,@当前数量#,@可用数量#,@资产账户持仓序号#,@资产账户证券类型#,@资产账户资产类型#,@资产账户投资类型#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户持仓核对差额#,@资产账户实现盈亏#,@资产账户利息成本金额#,@资产账户利息收益#,@资产账户更新次数#,@资产账户待交收数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
            select curr_qty,curr_qty,curr_qty+pre_settle_qty+posi_qty_check_diff,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_occur_end_qty,v_curr_qty,v_avail_qty,v_asac_posi_id,v_asac_stock_type,v_asac_asset_type,v_asac_invest_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_posi_qty_check_diff,v_asac_realize_pandl,v_asac_intrst_cost_amt,v_asac_intrst_pandl,v_asac_update_times,v_asac_pre_settle_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.9.4.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;

        else

            /* set @变动后数量# = 0; */
            set v_occur_end_qty = 0;

            /* set @可用数量# = 0; */
            set v_avail_qty = 0;

            /* [插入重复更新][产品证券_持仓_资产账户持仓表][字段][字段变量][{持仓核对差额}={持仓核对差额}+@持仓核对差额#][1][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_asac_posi (
                create_date, create_time, update_date, 
                update_time, update_times, co_no, pd_no, 
                asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
                stock_type, asset_type, invest_type, begin_qty, 
                curr_qty, pre_settle_qty, frozen_qty, unfroz_qty, 
                posi_qty_check_diff, cost_amt, realize_pandl, intrst_cost_amt, 
                intrst_pandl) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_co_no, v_pd_no, 
                v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
                v_stock_type, v_asset_type, v_invest_type, v_begin_qty, 
                v_curr_qty, v_pre_settle_qty, v_frozen_qty, v_unfroz_qty, 
                v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, v_intrst_cost_amt, 
                v_intrst_pandl) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, posi_qty_check_diff=posi_qty_check_diff+v_posi_qty_check_diff;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.9.4.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;


            /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][{当前数量},{当前数量},{当前数量}+{待交收数量}+{持仓核对差额},{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{持仓核对差额},{实现盈亏},{利息成本金额},{利息收益},{更新次数},{待交收数量}][@变动后数量#,@当前数量#,@可用数量#,@资产账户持仓序号#,@资产账户证券类型#,@资产账户资产类型#,@资产账户投资类型#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户持仓核对差额#,@资产账户实现盈亏#,@资产账户利息成本金额#,@资产账户利息收益#,@资产账户更新次数#,@资产账户待交收数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
            select curr_qty,curr_qty,curr_qty+pre_settle_qty+posi_qty_check_diff,row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,realize_pandl,intrst_cost_amt,intrst_pandl,update_times,pre_settle_qty into v_occur_end_qty,v_curr_qty,v_avail_qty,v_asac_posi_id,v_asac_stock_type,v_asac_asset_type,v_asac_invest_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_posi_qty_check_diff,v_asac_realize_pandl,v_asac_intrst_cost_amt,v_asac_intrst_pandl,v_asac_update_times,v_asac_pre_settle_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;

        end if;
        #如果有配置同步的时候更新成本金额,那么同时更新该资产账户具有该持仓的成本金额

        /* if @配置值#=1 then */
        if v_config_value=1 then

            /* [更新表记录][产品证券_持仓_资产账户持仓表][{成本金额}=({当前数量}+{待交收数量}+{持仓核对差额}+@持仓数量#)*@外部成本价#-@临时_成本金额#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][2][@资产账户编号#,@证券代码编号#,@投资类型#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cost_amt=(curr_qty+pre_settle_qty+posi_qty_check_diff+v_posi_qty)*v_out_cost_price-v_tmp_cost_amt where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.9.4.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;

        end if;

        /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{成本金额},{成本金额}][@成本金额#,@资产账户成本金额#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
        select cost_amt,cost_amt into v_cost_amt,v_asac_cost_amt from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.9.4.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
            end if;
            leave label_pro;
        end if;


        /* [获取流水后信息][@成本金额#,@外部成本价#] */
        set v_jour_after_occur_info = concat(v_cost_amt,"|",v_out_cost_price,"|");


        /* [插入表记录][产品证券_持仓_资产账户持仓流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_asac_posi_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, asset_acco_no, exch_no, stock_acco_no, 
            stock_code_no, busi_flag, occur_qty, occur_end_qty, 
            jour_occur_field, jour_after_occur_info, oper_remark_info, invest_type) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
            v_stock_code_no, v_busi_flag, v_occur_qty, v_occur_end_qty, 
            v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, v_invest_type);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.9.4.5";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* set @操作备注#=concat("系统自动同步外部持仓数据！","|","持仓数量差额"); */
        set v_oper_remark_info=concat("系统自动同步外部持仓数据！","|","持仓数量差额");

        /* set @流水变动字段#=" "; */
        set v_jour_occur_field=" ";

        /* set @流水后信息#=" "; */
        set v_jour_after_occur_info=" ";

        /* set @变动数量#=@账户可用数量差额#; */
        set v_occur_qty=v_acco_avail_qty_diff;

        /* set @变动后数量#=@交易组可用数量#+@临时_持仓数量#; */
        set v_occur_end_qty=v_exgp_avail_qty+v_tmp_posi_qty;

        /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_exgp_posi_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, exch_no, 
            stock_acco_no, stock_code_no, busi_flag, occur_qty, 
            occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
            invest_type) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
            v_stock_acco_no, v_stock_code_no, v_busi_flag, v_occur_qty, 
            v_occur_end_qty, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, 
            v_invest_type);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.9.4.5";
            SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* set @变动后数量#=@可用数量#+@持仓数量#; */
        set v_occur_end_qty=v_avail_qty+v_posi_qty;

        /* [插入表记录][产品证券_持仓_资产账户持仓流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdsepo_asac_posi_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, asset_acco_no, exch_no, stock_acco_no, 
            stock_code_no, busi_flag, occur_qty, occur_end_qty, 
            jour_occur_field, jour_after_occur_info, oper_remark_info, invest_type) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
            v_stock_code_no, v_busi_flag, v_occur_qty, v_occur_end_qty, 
            v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, v_invest_type);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.9.4.5";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
            leave label_pro;
        end if;

        #获取大宗交易数据进行当前对比,新修改,20180822

        /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][{当前数量}][@临时_当前数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=3] */
        select curr_qty into v_tmp_curr_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=3 limit 1;


        /* set @账户当前数量# = @当前数量#+@临时_当前数量#; */
        set v_acco_curr_qty = v_curr_qty+v_tmp_curr_qty;

        /* set @账户可用数量# = @可用数量#+@持仓数量#+@临时_当前数量#; */
        set v_acco_avail_qty = v_avail_qty+v_posi_qty+v_tmp_curr_qty;

        /* set @账户当前数量差额#=@外部当前数量#-(@当前数量#+@临时_当前数量#)+@外部质押数量#; */
        set v_acco_curr_qty_diff=v_out_curr_qty-(v_curr_qty+v_tmp_curr_qty)+v_out_impawn_qty;
        #新修改

        /* if @质押数量累加到债券数量#<>1 then */
        if v_add_pledge_to_bond<>1 then

            /* set @账户当前数量差额#=@账户当前数量差额#-@外部质押数量#; */
            set v_acco_curr_qty_diff=v_acco_curr_qty_diff-v_out_impawn_qty;
        end if;

        /* set @账户可用数量差额#=@外部可用数量#-@账户可用数量#-@账户当前数量差额#+@外部质押数量#; */
        set v_acco_avail_qty_diff=v_out_enable_qty-v_acco_avail_qty-v_acco_curr_qty_diff+v_out_impawn_qty;

        /* if @账户当前数量差额# <> 0 then */
        if v_acco_curr_qty_diff <> 0 then

            /* set @处理标志# = @临时_处理标志#; */
            set v_deal_flag = v_tmp_deal_flag;

            /* set @备注信息# = @临时_备注信息#; */
            set v_remark_info = v_tmp_remark_info;
        end if;
    end if;

    /* [更新表记录][产品证券_持仓_内外资产账户持仓差异表][{账户当前数量}=@账户当前数量#,{账户可用数量}=@账户可用数量#,{账户当前数量差额}=@账户当前数量差额#,{账户可用数量差额}=@账户可用数量差额#,{处理标志}=@处理标志#,{备注信息}=@备注信息#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi_diff set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, acco_curr_qty=v_acco_curr_qty,acco_avail_qty=v_acco_avail_qty,acco_curr_qty_diff=v_acco_curr_qty_diff,acco_avail_qty_diff=v_acco_avail_qty_diff,deal_flag=v_deal_flag,remark_info=v_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.4.2";
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
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_occur_qty = v_occur_qty;
    SET p_asset_sync_flag = v_asset_sync_flag;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_stock_type = v_asac_stock_type;
    SET p_asac_asset_type = v_asac_asset_type;
    SET p_asac_invest_type = v_asac_invest_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_pre_settle_qty = v_asac_pre_settle_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_posi_qty_check_diff = v_asac_posi_qty_check_diff;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_asac_update_times = v_asac_update_times;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exch_group_stock_type = v_exch_group_stock_type;
    SET p_exch_group_asset_type = v_exch_group_asset_type;
    SET p_exgp_invest_type = v_exgp_invest_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_pre_settle_qty = v_exgp_pre_settle_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_posi_qty_check_diff = v_exgp_posi_qty_check_diff;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_exch_group_update_times = v_exch_group_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_转入估值外部证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_AddEvaluOutSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_AddEvaluOutSecuPosi(
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
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_out_cost_price decimal(16,9),
    IN p_out_curr_qty decimal(18,2),
    IN p_out_enable_qty decimal(18,2),
    IN p_out_frozen_qty decimal(18,2),
    IN p_out_unfroz_qty decimal(18,2),
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
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_out_cost_price decimal(16,9);
    declare v_out_curr_qty decimal(18,2);
    declare v_out_enable_qty decimal(18,2);
    declare v_out_frozen_qty decimal(18,2);
    declare v_out_unfroz_qty decimal(18,2);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_out_cost_price = p_out_cost_price;
    SET v_out_curr_qty = p_out_curr_qty;
    SET v_out_enable_qty = p_out_enable_qty;
    SET v_out_frozen_qty = p_out_frozen_qty;
    SET v_out_unfroz_qty = p_out_unfroz_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][产品证券_持仓_估值外部资产账户持仓表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {股东代码编号}=@股东代码编号#, {证券代码编号}=@证券代码编号#, {证券名称}=@证券名称#, {外部成本价}=@外部成本价#, {外部当前数量}=@外部当前数量#, {外部可用数量}=@外部可用数量#, {外部冻结数量}=@外部冻结数量#, {外部解冻数量}=@外部解冻数量#][1][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@股东代码#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_evalu_out_asac_posi (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, out_acco, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_name, out_cost_price, out_curr_qty, 
        out_enable_qty, out_frozen_qty, out_unfroz_qty) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_no, v_stock_acco_no, v_stock_acco, v_stock_code_no, 
        v_stock_code, v_stock_name, v_out_cost_price, v_out_curr_qty, 
        v_out_enable_qty, v_out_frozen_qty, v_out_unfroz_qty) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, stock_acco_no=v_stock_acco_no, stock_code_no=v_stock_code_no, stock_name=v_stock_name, out_cost_price=v_out_cost_price, out_curr_qty=v_out_curr_qty, out_enable_qty=v_out_enable_qty, out_frozen_qty=v_out_frozen_qty, out_unfroz_qty=v_out_unfroz_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.5.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_查询估值外部证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_QueryEvaluOutSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_QueryEvaluOutSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][产品证券_持仓_估值外部资产账户持仓表][字段][{初始化日期}=@初始化日期# and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号串#="; ;" or instr(@产品编号串#, concat(";",{产品编号},";"))>0)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, stock_name, out_cost_price, 
        out_curr_qty, out_enable_qty, out_frozen_qty, out_unfroz_qty from db_pdsecu.tb_pdsepo_evalu_out_asac_posi where init_date=v_init_date and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_查询外部证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_QueryOutSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_QueryOutSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
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
    declare v_pd_no_str varchar(2048);
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_外部资产账户持仓表][字段][@初始化日期#>={初始化日期} and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号串#="; ;" or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and {资产账户编号}>0 and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, stock_name, out_cost_price, 
        out_curr_qty, out_enable_qty, out_frozen_qty, out_unfroz_qty from db_pdsecu.tb_pdsepo_out_asac_posi where v_init_date>=init_date and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and asset_acco_no>0 and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, stock_name, out_cost_price, 
        out_curr_qty, out_enable_qty, out_frozen_qty, out_unfroz_qty from db_pdsecu.tb_pdsepo_out_asac_posi where v_init_date>=init_date and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and asset_acco_no>0 and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_获取资产账户内外持仓差异数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_GetSecuPosiDiffData;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_GetSecuPosiDiffData(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_no int,
    OUT p_stock_code_no int,
    OUT p_asset_acco_no int,
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
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_asset_acco_no int;
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
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_asset_acco_no = 0;
    SET v_out_acco = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_持仓_内外资产账户持仓差异表][{市场编号},{证券代码编号},{资产账户编号},{外部账号}][@市场编号#,@证券代码编号#,@资产账户编号#,@外部账号#][{记录序号}=@记录序号#][4][@记录序号#] */
    select exch_no,stock_code_no,asset_acco_no,out_acco into v_exch_no,v_stock_code_no,v_asset_acco_no,v_out_acco from db_pdsecu.tb_pdsepo_asac_posi_diff where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.9.8.4";
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
    SET p_exch_no = v_exch_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_out_acco = v_out_acco;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_获取外部数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_GetOutPosiData;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_GetOutPosiData(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_row_id bigint,
    OUT p_init_date int,
    OUT p_target_co_no int,
    OUT p_target_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_name varchar(64),
    OUT p_out_cost_price decimal(16,9),
    OUT p_out_curr_qty decimal(18,2),
    OUT p_out_enable_qty decimal(18,2)
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
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_row_id bigint;
    declare v_init_date int;
    declare v_target_co_no int;
    declare v_target_pd_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_out_cost_price decimal(16,9);
    declare v_out_curr_qty decimal(18,2);
    declare v_out_enable_qty decimal(18,2);
    declare v_tmp_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_out_frozen_qty decimal(18,2);
    declare v_out_unfroz_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_target_co_no = 0;
    SET v_target_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_stock_name = " ";
    SET v_out_cost_price = 0;
    SET v_out_curr_qty = 0;
    SET v_out_enable_qty = 0;
    SET v_tmp_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_out_frozen_qty = 0;
    SET v_out_unfroz_qty = 0;

    
    label_pro:BEGIN
    

    /* set @临时_记录序号#=@记录序号#; */
    set v_tmp_row_id=v_row_id;

    /* set @记录序号#=0; */
    set v_row_id=0;

    /* [获取表记录变量语句][产品证券_持仓_外部资产账户持仓表][字段][字段变量][{初始化日期}<>0 and ({机构编号}=@机构编号# or @机构编号#=0) and ({产品编号}=@产品编号# or @产品编号#=0) and {资产账户编号}<>0 and {记录序号}>@临时_记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, stock_name, out_cost_price, 
        out_curr_qty, out_enable_qty, out_frozen_qty, out_unfroz_qty into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_no, v_stock_acco_no, v_stock_acco, 
        v_stock_code_no, v_stock_code, v_stock_name, v_out_cost_price, 
        v_out_curr_qty, v_out_enable_qty, v_out_frozen_qty, v_out_unfroz_qty from db_pdsecu.tb_pdsepo_out_asac_posi where init_date<>0 and (co_no=v_co_no or v_co_no=0) and (pd_no=v_pd_no or v_pd_no=0) and asset_acco_no<>0 and row_id>v_tmp_row_id limit 1;

    #回购代码需累计，再与内部标准券做比较。

    /* if @市场编号# = 《市场编号-上海证券交易所》 and @证券代码# in ("204001","204002","204003","204007","204014","204028","204091","204182") then */
    if v_exch_no = 1 and v_stock_code in ("204001","204002","204003","204007","204014","204028","204091","204182") then

         /* [获取表记录变量语句][产品证券_持仓_外部资产账户持仓表][SUM({外部当前数量}),SUM({外部可用数量})][@外部当前数量#,@外部可用数量#][{初始化日期}=@初始化日期# and  {通道编号}=@通道编号# and  {外部账号}=@外部账号# and  {市场编号}=@市场编号# and {股东代码}=@股东代码# and {证券代码} in ("204001","204002","204003","204007","204014","204028","204091","204182")] */
         select SUM(out_curr_qty),SUM(out_enable_qty) into v_out_curr_qty,v_out_enable_qty from db_pdsecu.tb_pdsepo_out_asac_posi where init_date=v_init_date and  pass_no=v_pass_no and  out_acco=v_out_acco and  exch_no=v_exch_no and stock_acco=v_stock_acco and stock_code in ("204001","204002","204003","204007","204014","204028","204091","204182") limit 1;


    /* elseif @市场编号# = 《市场编号-深圳证券交易所》 and @证券代码# in ("131810","131811","131800","131801","131802","131803","131805","131806","131809") then */
    elseif v_exch_no = 2 and v_stock_code in ("131810","131811","131800","131801","131802","131803","131805","131806","131809") then

         /* [获取表记录变量语句][产品证券_持仓_外部资产账户持仓表][SUM({外部当前数量}),SUM({外部可用数量})][@外部当前数量#,@外部可用数量#][{初始化日期}=@初始化日期# and  {通道编号}=@通道编号# and  {外部账号}=@外部账号# and  {市场编号}=@市场编号# and {股东代码}=@股东代码# and {证券代码} in ("131810","131811","131800","131801","131802","131803","131805","131806","131809")] */
         select SUM(out_curr_qty),SUM(out_enable_qty) into v_out_curr_qty,v_out_enable_qty from db_pdsecu.tb_pdsepo_out_asac_posi where init_date=v_init_date and  pass_no=v_pass_no and  out_acco=v_out_acco and  exch_no=v_exch_no and stock_acco=v_stock_acco and stock_code in ("131810","131811","131800","131801","131802","131803","131805","131806","131809") limit 1;

    end if;

    /* set @目标机构编号#=@机构编号#; */
    set v_target_co_no=v_co_no;

    /* set @目标产品编号#=@产品编号#; */
    set v_target_pd_no=v_pd_no;

    /* set @当前记录序号#=@记录序号#; */
    set v_curr_row_id=v_row_id;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_row_id = v_curr_row_id;
    SET p_init_date = v_init_date;
    SET p_target_co_no = v_target_co_no;
    SET p_target_pd_no = v_target_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_name = v_stock_name;
    SET p_out_cost_price = v_out_cost_price;
    SET p_out_curr_qty = v_out_curr_qty;
    SET p_out_enable_qty = v_out_enable_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_同步内外差异
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_SynchronizedDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_SynchronizedDiff(
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
    IN p_exch_group_no int,
    IN p_asac_busi_config_str varchar(64),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_out_cost_price decimal(16,9),
    IN p_out_curr_qty decimal(18,2),
    IN p_out_enable_qty decimal(18,2),
    IN p_curr_qty decimal(18,2),
    IN p_avail_qty decimal(18,2),
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
    declare v_exch_group_no int;
    declare v_asac_busi_config_str varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_out_cost_price decimal(16,9);
    declare v_out_curr_qty decimal(18,2);
    declare v_out_enable_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_acco_curr_qty decimal(18,2);
    declare v_acco_avail_qty decimal(18,2);
    declare v_deal_flag int;
    declare v_asset_sync_flag int;
    declare v_add_pledge_to_bond int;
    declare v_remark_info varchar(255);
    declare v_acco_curr_qty_diff decimal(18,2);
    declare v_acco_avail_qty_diff decimal(18,2);
    declare v_out_impawn_qty decimal(18,2);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_out_cost_price = p_out_cost_price;
    SET v_out_curr_qty = p_out_curr_qty;
    SET v_out_enable_qty = p_out_enable_qty;
    SET v_curr_qty = p_curr_qty;
    SET v_avail_qty = p_avail_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_acco_curr_qty = 0;
    SET v_acco_avail_qty = 0;
    SET v_deal_flag = 0;
    SET v_asset_sync_flag = 0;
    SET v_add_pledge_to_bond = 0;
    SET v_remark_info = " ";
    SET v_acco_curr_qty_diff = 0;
    SET v_acco_avail_qty_diff = 0;
    SET v_out_impawn_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @账户当前数量#=@当前数量#; */
    set v_acco_curr_qty=v_curr_qty;

    /* set @账户可用数量#=@可用数量#; */
    set v_acco_avail_qty=v_avail_qty;

    /* if @外部当前数量# = 0 then */
    if v_out_curr_qty = 0 then

        /* set @处理标志# = 《处理标志-内部数据》; */
        set v_deal_flag = 3;
    else

        /* set @处理标志# = 《处理标志-未处理》; */
        set v_deal_flag = 2;
    end if;

    /* set @资产是否同步#=cast(substring(@资产账户业务控制配置串#, 12, 1) as SIGNED); */
    set v_asset_sync_flag=cast(substring(v_asac_busi_config_str, 12, 1) as SIGNED);

    /* set @质押数量累加到债券数量#=cast(substring(@资产账户业务控制配置串#, 19, 1) as SIGNED); */
    set v_add_pledge_to_bond=cast(substring(v_asac_busi_config_str, 19, 1) as SIGNED);

    /* if (@市场编号#=《市场编号-上海证券交易所》 and @证券代码#='888880') or (@市场编号#=《市场编号-深圳证券交易所》 and @证券代码#='131990') then */
    if (v_exch_no=1 and v_stock_code='888880') or (v_exch_no=2 and v_stock_code='131990') then

        /* set @处理标志# = 《处理标志-内部数据》; */
        set v_deal_flag = 3;
    end if;

    /* set @备注信息# = "外部数据转入"; */
    set v_remark_info = "外部数据转入";

    /* set @账户当前数量差额#=@外部当前数量# - @账户当前数量#; */
    set v_acco_curr_qty_diff=v_out_curr_qty - v_acco_curr_qty;

    /* set @账户可用数量差额#=@外部可用数量# - @账户可用数量#-@账户当前数量差额#; */
    set v_acco_avail_qty_diff=v_out_enable_qty - v_acco_avail_qty-v_acco_curr_qty_diff;

    /* set @外部质押数量# = 0; */
    set v_out_impawn_qty = 0;

    /* [插入重复更新][产品证券_持仓_内外资产账户持仓差异表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {交易组编号}=@交易组编号#, {股东代码编号}=@股东代码编号#, {证券代码编号}=@证券代码编号#, {证券名称}=@证券名称#, {外部成本价}=@外部成本价#, {账户当前数量}=@账户当前数量#, {账户可用数量}=@账户可用数量#, {外部当前数量}=@外部当前数量#, {外部可用数量}=@外部可用数量#, {账户当前数量差额}=@账户当前数量差额#+{外部质押数量}, {账户可用数量差额}=@账户可用数量差额#, {处理标志}=@处理标志#, {资产是否同步}=@资产是否同步#, {备注信息}=@备注信息#][1][@初始化日期#,@通道编号#,@外部账号#,@股东代码#,@市场编号#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_posi_diff (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, stock_name, stock_type, 
        asset_type, out_cost_price, acco_curr_qty, acco_avail_qty, 
        out_curr_qty, out_enable_qty, acco_curr_qty_diff, acco_avail_qty_diff, 
        out_impawn_qty, deal_flag, asset_sync_flag, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_pass_no, 
        v_out_acco, v_exch_no, v_stock_acco_no, v_stock_acco, 
        v_stock_code_no, v_stock_code, v_stock_name, v_stock_type, 
        v_asset_type, v_out_cost_price, v_acco_curr_qty, v_acco_avail_qty, 
        v_out_curr_qty, v_out_enable_qty, v_acco_curr_qty_diff, v_acco_avail_qty_diff, 
        v_out_impawn_qty, v_deal_flag, v_asset_sync_flag, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, exch_group_no=v_exch_group_no, stock_acco_no=v_stock_acco_no, stock_code_no=v_stock_code_no, stock_name=v_stock_name, out_cost_price=v_out_cost_price, acco_curr_qty=v_acco_curr_qty, acco_avail_qty=v_acco_avail_qty, out_curr_qty=v_out_curr_qty, out_enable_qty=v_out_enable_qty, acco_curr_qty_diff=v_acco_curr_qty_diff+out_impawn_qty, acco_avail_qty_diff=v_acco_avail_qty_diff, deal_flag=v_deal_flag, asset_sync_flag=v_asset_sync_flag, remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.10.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","股东代码=",v_stock_acco,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","股东代码=",v_stock_acco,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;

    #质押数量不累加到债券数量上的话 , 那么账户当前数量差额不应该包括外部质押数量

    /* if @质押数量累加到债券数量#<>1 then */
    if v_add_pledge_to_bond<>1 then

        /* [更新表记录][产品证券_持仓_内外资产账户持仓差异表][ {账户当前数量差额}=@账户当前数量差额#-{外部质押数量}][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号}=@外部账号# and {股东代码}=@股东代码# and {市场编号}=@市场编号# and {证券代码}=@证券代码#][2][@初始化日期#,@通道编号#,@外部账号#,@股东代码#,@市场编号#,@证券代码#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdsepo_asac_posi_diff set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1,  acco_curr_qty_diff=v_acco_curr_qty_diff-out_impawn_qty where init_date=v_init_date and pass_no=v_pass_no and out_acco=v_out_acco and stock_acco=v_stock_acco and exch_no=v_exch_no and stock_code=v_stock_code;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.9.10.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","股东代码=",v_stock_acco,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","股东代码=",v_stock_acco,",","市场编号=",v_exch_no,",","证券代码=",v_stock_code);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_获取内部债券质押记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_GetInBondPledge;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_GetInBondPledge(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_curr_qty decimal(18,2),
    OUT p_avail_qty decimal(18,2)
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
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
    SET v_init_date = p_init_date;
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_curr_qty = 0;
    SET v_avail_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* if @查询记录序号# = 0 then */
    if v_query_row_id = 0 then

        /* truncate table ~产品证券_持仓_内部资产账户债券质押核对表^; */
        truncate table db_pdsecu.tb_pdsepo_asac_bond_pledge_check;

        /* insert into ~产品证券_持仓_内部资产账户债券质押核对表^ ({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{当前数量},{可用数量})  select @创建日期#,@创建时间#,@更新日期#,@更新时间#,1,@初始化日期#,{机构编号},{产品编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{当前数量},{当前数量} from ~产品证券_持仓_资产账户债券质押表^ where ({资产账户编号},{股东代码编号},{证券代码编号}) not in (select {资产账户编号},{股东代码编号},{证券代码编号} from ~产品证券_持仓_外部资产账户债券质押表^ where {初始化日期}=@初始化日期#) and {当前数量}<>0 order by {资产账户编号},{股东代码编号},{证券代码编号}; */
        insert into db_pdsecu.tb_pdsepo_asac_bond_pledge_check (create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,curr_qty,avail_qty)  select v_create_date,v_create_time,v_update_date,v_update_time,1,v_init_date,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,curr_qty,curr_qty from db_pdsecu.tb_pdsepo_asac_bond_pledge where (asset_acco_no,stock_acco_no,stock_code_no) not in (select asset_acco_no,stock_acco_no,stock_code_no from db_pdsecu.tb_pdsepo_out_asac_bond_pledge where init_date=v_init_date) and curr_qty<>0 order by asset_acco_no,stock_acco_no,stock_code_no;
    end if;

    /* [获取表记录变量][产品证券_持仓_内部资产账户债券质押核对表][{记录序号},{机构编号},{产品编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{当前数量},{可用数量}][@记录序号#,@机构编号#,@产品编号#,@资产账户编号#,@市场编号#,@股东代码编号#,@证券代码编号#,@当前数量#,@可用数量#][{记录序号} > @查询记录序号# order by {记录序号}][4][@查询记录序号#] */
    select row_id,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,curr_qty,avail_qty into v_row_id,v_co_no,v_pd_no,v_asset_acco_no,v_exch_no,v_stock_acco_no,v_stock_code_no,v_curr_qty,v_avail_qty from db_pdsecu.tb_pdsepo_asac_bond_pledge_check where row_id > v_query_row_id order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.9.11.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_curr_qty = v_curr_qty;
    SET p_avail_qty = v_avail_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_转入内部债券质押核对记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_AddInBondPledgeCkeck;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_AddInBondPledgeCkeck(
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
    IN p_default_exch_group_no int,
    IN p_asac_busi_config_str varchar(64),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_name varchar(64),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_curr_qty decimal(18,2),
    IN p_avail_qty decimal(18,2),
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
    declare v_default_exch_group_no int;
    declare v_asac_busi_config_str varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_deal_flag int;
    declare v_remark_info varchar(255);
    declare v_asset_sync_flag int;
    declare v_record_count int;
    declare v_crncy_type varchar(3);
    declare v_exch_group_no int;
    declare v_out_cost_price decimal(16,9);
    declare v_acco_curr_qty decimal(18,2);
    declare v_acco_avail_qty decimal(18,2);
    declare v_out_begin_qty decimal(18,2);
    declare v_out_curr_qty decimal(18,2);
    declare v_out_enable_qty decimal(18,2);
    declare v_acco_avail_qty_diff decimal(18,2);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_name = p_stock_name;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_curr_qty = p_curr_qty;
    SET v_avail_qty = p_avail_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_deal_flag = 0;
    SET v_remark_info = " ";
    SET v_asset_sync_flag = 0;
    SET v_record_count = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_group_no = 0;
    SET v_out_cost_price = 0;
    SET v_acco_curr_qty = 0;
    SET v_acco_avail_qty = 0;
    SET v_out_begin_qty = 0;
    SET v_out_curr_qty = 0;
    SET v_out_enable_qty = 0;
    SET v_acco_avail_qty_diff = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @处理标志# = 《处理标志-内部数据》; */
    set v_deal_flag = 3;

    /* set @备注信息# = "内部数据转入"; */
    set v_remark_info = "内部数据转入";

    /* set @资产是否同步#=cast(substring(@资产账户业务控制配置串#, 12, 1) as SIGNED); */
    set v_asset_sync_flag=cast(substring(v_asac_busi_config_str, 12, 1) as SIGNED);

    /* [获取表记录数量][产品证券_资金_交易组资金表][@记录个数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select count(1) into v_record_count from db_pdsecu.tb_pdseca_exgp_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;


    /* if @记录个数#=1 then */
    if v_record_count=1 then

        /* [获取表记录变量][产品证券_资金_交易组资金表][{交易组编号}][@交易组编号#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
        select exch_group_no into v_exch_group_no from db_pdsecu.tb_pdseca_exgp_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.9.12.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;

    else

        /* set @交易组编号# = @默认交易组编号#; */
        set v_exch_group_no = v_default_exch_group_no;
    end if;

    /* set @外部成本价# = 0; */
    set v_out_cost_price = 0;

    /* set @账户当前数量# = @当前数量#; */
    set v_acco_curr_qty = v_curr_qty;

    /* set @账户可用数量# = @可用数量#; */
    set v_acco_avail_qty = v_avail_qty;

    /* set @外部期初数量# = 0; */
    set v_out_begin_qty = 0;

    /* set @外部当前数量# = 0; */
    set v_out_curr_qty = 0;

    /* set @外部可用数量# = 0; */
    set v_out_enable_qty = 0;

    /* set @账户可用数量差额#=@外部可用数量#-@账户当前数量#; */
    set v_acco_avail_qty_diff=v_out_enable_qty-v_acco_curr_qty;

    /* [插入重复更新][产品证券_持仓_内外资产账户债券质押差异表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {交易组编号}=@交易组编号#, {股东代码编号}=@股东代码编号#, {证券代码编号}=@证券代码编号#, {证券名称}=@证券名称#, {账户当前数量}=@账户当前数量#, {账户可用数量}=@账户可用数量#, {账户可用数量差额}={外部可用数量}-@账户可用数量#, {处理标志}=@处理标志#, {资产是否同步}=@资产是否同步#, {备注信息}=@备注信息#][1][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@股东代码#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_bond_pledge_diff (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, pass_no, 
        out_acco, exch_no, stock_acco_no, stock_acco, 
        stock_code_no, stock_code, stock_name, stock_type, 
        asset_type, acco_curr_qty, acco_avail_qty, out_begin_qty, 
        out_curr_qty, out_enable_qty, acco_avail_qty_diff, deal_flag, 
        asset_sync_flag, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_pass_no, 
        v_out_acco, v_exch_no, v_stock_acco_no, v_stock_acco, 
        v_stock_code_no, v_stock_code, v_stock_name, v_stock_type, 
        v_asset_type, v_acco_curr_qty, v_acco_avail_qty, v_out_begin_qty, 
        v_out_curr_qty, v_out_enable_qty, v_acco_avail_qty_diff, v_deal_flag, 
        v_asset_sync_flag, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, exch_group_no=v_exch_group_no, stock_acco_no=v_stock_acco_no, stock_code_no=v_stock_code_no, stock_name=v_stock_name, acco_curr_qty=v_acco_curr_qty, acco_avail_qty=v_acco_avail_qty, acco_avail_qty_diff=out_enable_qty-v_acco_avail_qty, deal_flag=v_deal_flag, asset_sync_flag=v_asset_sync_flag, remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.12.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","股东代码=",v_stock_acco,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_查询资产账户内外债券质押差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_QueryBondPledgeDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_QueryBondPledgeDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no_str varchar(2048),
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_deal_flag_query_str varchar(2048),
    IN p_filter_diff_cond int,
    IN p_asset_sync_flag int,
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
    declare v_co_no_str varchar(2048);
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_deal_flag_query_str varchar(2048);
    declare v_filter_diff_cond int;
    declare v_asset_sync_flag int;
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
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_deal_flag_query_str = p_deal_flag_query_str;
    SET v_filter_diff_cond = p_filter_diff_cond;
    SET v_asset_sync_flag = p_asset_sync_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_内外资产账户债券质押差异表][字段][(@机构编号串#="; ;" or instr(@机构编号串#, concat(";",{机构编号},";"))>0) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@处理标志查询串#="; ;" or instr(@处理标志查询串#,concat(";",{处理标志},";"))>0) and (@过滤差额条件#=《过滤差额条件-不过滤》 or (@过滤差额条件#=《过滤差额条件-只显示差额不为0》 and {账户可用数量差额}<>0) or (@过滤差额条件#=《过滤差额条件-只显示差额为0》 and {账户可用数量差额}=0)) and (@资产是否同步#=0 or {资产是否同步}=@资产是否同步#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_name, 
        stock_type, asset_type, acco_curr_qty, acco_avail_qty, 
        out_begin_qty, out_curr_qty, out_enable_qty, acco_avail_qty_diff, 
        deal_flag, asset_sync_flag, remark_info from db_pdsecu.tb_pdsepo_asac_bond_pledge_diff where (v_co_no_str="; ;" or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and acco_avail_qty_diff<>0) or (v_filter_diff_cond=3 and acco_avail_qty_diff=0)) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_name, 
        stock_type, asset_type, acco_curr_qty, acco_avail_qty, 
        out_begin_qty, out_curr_qty, out_enable_qty, acco_avail_qty_diff, 
        deal_flag, asset_sync_flag, remark_info from db_pdsecu.tb_pdsepo_asac_bond_pledge_diff where (v_co_no_str="; ;" or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and acco_avail_qty_diff<>0) or (v_filter_diff_cond=3 and acco_avail_qty_diff=0)) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_处理资产账户内外债券质押差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_DealBondPledgeDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_DealBondPledgeDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_menu_no int,
    IN p_sh_standard_stock_code_no int,
    IN p_sz_standard_stock_code_no int,
    IN p_impawn_ratio decimal(18,12),
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
    declare v_menu_no int;
    declare v_sh_standard_stock_code_no int;
    declare v_sz_standard_stock_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_impawn_ratio decimal(18,12);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_acco_curr_qty decimal(18,2);
    declare v_acco_avail_qty decimal(18,2);
    declare v_out_begin_qty decimal(18,2);
    declare v_out_curr_qty decimal(18,2);
    declare v_out_enable_qty decimal(18,2);
    declare v_acco_avail_qty_diff decimal(18,2);
    declare v_deal_flag int;
    declare v_asset_sync_flag int;
    declare v_remark_info varchar(255);
    declare v_tmp_remark_info varchar(255);
    declare v_tmp_deal_flag int;
    declare v_invest_type int;
    declare v_occur_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_put_impawn_qty decimal(18,2);
    declare v_tmp_unfroz_qty decimal(18,2);
    declare v_get_impawn_qty decimal(18,2);
    declare v_tmp_put_impawn_qty decimal(18,2);
    declare v_tmp_get_impawn_qty decimal(18,2);
    declare v_tmp_occur_qty decimal(18,2);
    declare v_tmp_stock_code_no int;
    declare v_tmp_stock_type int;
    declare v_tmp_asset_type int;
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_occur_end_qty decimal(18,2);
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
    SET v_row_id = p_row_id;
    SET v_menu_no = p_menu_no;
    SET v_sh_standard_stock_code_no = p_sh_standard_stock_code_no;
    SET v_sz_standard_stock_code_no = p_sz_standard_stock_code_no;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_impawn_ratio = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_stock_name = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_acco_curr_qty = 0;
    SET v_acco_avail_qty = 0;
    SET v_out_begin_qty = 0;
    SET v_out_curr_qty = 0;
    SET v_out_enable_qty = 0;
    SET v_acco_avail_qty_diff = 0;
    SET v_deal_flag = 0;
    SET v_asset_sync_flag = 0;
    SET v_remark_info = " ";
    SET v_tmp_remark_info = " ";
    SET v_tmp_deal_flag = 0;
    SET v_invest_type = 0;
    SET v_occur_qty = 0;
    SET v_busi_flag = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_put_impawn_qty = 0;
    SET v_tmp_unfroz_qty = 0;
    SET v_get_impawn_qty = 0;
    SET v_tmp_put_impawn_qty = 0;
    SET v_tmp_get_impawn_qty = 0;
    SET v_tmp_occur_qty = 0;
    SET v_tmp_stock_code_no = 0;
    SET v_tmp_stock_type = 0;
    SET v_tmp_asset_type = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_occur_end_qty = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* set @临时_质押比例#=@质押比例#; */
    set v_tmp_impawn_ratio=v_impawn_ratio;

    /* [锁定获取表记录变量][产品证券_持仓_内外资产账户债券质押差异表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_name, 
        stock_type, asset_type, acco_curr_qty, acco_avail_qty, 
        out_begin_qty, out_curr_qty, out_enable_qty, acco_avail_qty_diff, 
        deal_flag, asset_sync_flag, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_pass_no, v_out_acco, v_exch_no, v_stock_acco_no, 
        v_stock_acco, v_stock_code_no, v_stock_code, v_stock_name, 
        v_stock_type, v_asset_type, v_acco_curr_qty, v_acco_avail_qty, 
        v_out_begin_qty, v_out_curr_qty, v_out_enable_qty, v_acco_avail_qty_diff, 
        v_deal_flag, v_asset_sync_flag, v_remark_info from db_pdsecu.tb_pdsepo_asac_bond_pledge_diff where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.9.14.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @临时_备注信息# = @备注信息#; */
    set v_tmp_remark_info = v_remark_info;

    /* set @临时_处理标志# = @处理标志#; */
    set v_tmp_deal_flag = v_deal_flag;

    /* set @质押比例#=@临时_质押比例#; */
    set v_impawn_ratio=v_tmp_impawn_ratio;

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [检查报错返回][@处理标志# = 《处理标志-已处理》][14][@处理标志#] */
    if v_deal_flag = 1 then
        
        SET v_error_code = "pdsecuA.9.14.14";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("处理标志=",v_deal_flag),"#",v_mysql_message);
        else
            SET v_error_info = concat("处理标志=",v_deal_flag);
        end if;
        leave label_pro;
    end if;


    /* [检查正常返回][@资产是否同步#=《资产是否同步-不同步资金不同步持仓》 or @资产是否同步#=《资产是否同步-同步资金不同步持仓》] */
    if v_asset_sync_flag=2 or v_asset_sync_flag=3 then
        leave label_pro;
    end if;


    /* set @处理标志# = 《处理标志-已处理》; */
    set v_deal_flag = 1;

    /* set @备注信息#="数据已成功同步！"; */
    set v_remark_info="数据已成功同步！";

    /* if @账户可用数量差额#=0 then */
    if v_acco_avail_qty_diff=0 then

      /* [更新表记录][产品证券_持仓_内外资产账户债券质押差异表][{处理标志}=@处理标志#,{备注信息}=@备注信息#][{记录序号}=@记录序号#][2][@记录序号#] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_pdsecu.tb_pdsepo_asac_bond_pledge_diff set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=v_deal_flag,remark_info=v_remark_info where row_id=v_row_id;
      if v_error_code = "1" then
                  
          SET v_error_code = "pdsecuA.9.14.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
          else
              SET v_error_info = concat("记录序号=",v_row_id);
          end if;
          leave label_pro;
      end if;

    end if;

    /* [检查正常返回][@账户可用数量差额#=0] */
    if v_acco_avail_qty_diff=0 then
        leave label_pro;
    end if;


    /* set @变动数量# = @账户可用数量差额#; */
    set v_occur_qty = v_acco_avail_qty_diff;

    /* if @变动数量# > 0 then */
    if v_occur_qty > 0 then

        /* set @业务标志#=《业务标志-债券质押》; */
        set v_busi_flag=2002003;
    else

        /* set @业务标志#=《业务标志-债券转回质押》; */
        set v_busi_flag=2002004;
    end if;

    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* set @当前数量# = @变动数量#; */
    set v_curr_qty = v_occur_qty;

    /* if @变动数量#>0 then */
    if v_occur_qty>0 then

        /* set @提交质押数量#=@变动数量#; */
        set v_put_impawn_qty=v_occur_qty;

        /* set @临时_解冻数量#=@变动数量#*@质押比例#; */
        set v_tmp_unfroz_qty=v_occur_qty*v_impawn_ratio;
    else

        /* set @转回质押数量#=-1 * @变动数量#; */
        set v_get_impawn_qty=-1 * v_occur_qty;

        /* set @临时_解冻数量#=@变动数量#*@质押比例#; */
        set v_tmp_unfroz_qty=v_occur_qty*v_impawn_ratio;
    end if;

    /* set @临时_提交质押数量# = @提交质押数量#; */
    set v_tmp_put_impawn_qty = v_put_impawn_qty;

    /* set @临时_转回质押数量# = @转回质押数量#; */
    set v_tmp_get_impawn_qty = v_get_impawn_qty;

    /* [插入重复更新][产品证券_持仓_交易组债券质押表][字段][字段变量][{当前数量}={当前数量}+@变动数量#, {提交质押数量}={提交质押数量}+@提交质押数量#,{转回质押数量}={转回质押数量}+@转回质押数量#][1][@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_exgp_bond_pledge (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, begin_qty, curr_qty, put_impawn_qty, 
        get_impawn_qty) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_begin_qty, v_curr_qty, v_put_impawn_qty, 
        v_get_impawn_qty) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=curr_qty+v_occur_qty, put_impawn_qty=put_impawn_qty+v_put_impawn_qty,get_impawn_qty=get_impawn_qty+v_get_impawn_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.14.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* set @临时_变动数量#=@变动数量#; */
    set v_tmp_occur_qty=v_occur_qty;

    /* set @临时_证券代码编号#=@证券代码编号#; */
    set v_tmp_stock_code_no=v_stock_code_no;

    /* set @临时_证券类型#=@证券类型#; */
    set v_tmp_stock_type=v_stock_type;

    /* set @临时_资产类型#=@资产类型#; */
    set v_tmp_asset_type=v_asset_type;

    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* set @当前数量# = 0; */
    set v_curr_qty = 0;

    /* set @待交收数量# = 0; */
    set v_pre_settle_qty = 0;

    /* set @冻结数量# = @变动数量#; */
    set v_frozen_qty = v_occur_qty;

    /* set @解冻数量# = 0; */
    set v_unfroz_qty = 0;

    /* set @成本金额# = 0; */
    set v_cost_amt = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利息成本金额# = 0; */
    set v_intrst_cost_amt = 0;

    /* set @利息收益# = 0; */
    set v_intrst_pandl = 0;

    /* set @持仓核对差额#=0; */
    set v_posi_qty_check_diff=0;

    /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{冻结数量}={冻结数量}+@变动数量#][1][@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_exgp_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, invest_type, 
        begin_qty, curr_qty, pre_settle_qty, frozen_qty, 
        unfroz_qty, posi_qty_check_diff, cost_amt, realize_pandl, 
        intrst_cost_amt, intrst_pandl) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_type, v_asset_type, v_invest_type, 
        v_begin_qty, v_curr_qty, v_pre_settle_qty, v_frozen_qty, 
        v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, 
        v_intrst_cost_amt, v_intrst_pandl) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, frozen_qty=frozen_qty+v_occur_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.14.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{冻结数量}][@变动后数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    select frozen_qty into v_occur_end_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.9.14.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* set @流水变动字段# = " "; */
    set v_jour_occur_field = " ";

    /* set @流水后信息# = " "; */
    set v_jour_after_occur_info = " ";

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "系统自动同步外部质押数据！"; */
    set v_oper_remark_info = "系统自动同步外部质押数据！";

    /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_exgp_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
        invest_type) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_busi_flag, v_occur_qty, 
        v_occur_end_qty, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, 
        v_invest_type);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.14.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #标准券对应变化

    /* if @市场编号#=1 then */
    if v_exch_no=1 then

        /* set @证券代码编号#=@上海标准券证券代码编号#; */
        set v_stock_code_no=v_sh_standard_stock_code_no;

    /* elseif @市场编号#=2 then */
    elseif v_exch_no=2 then

        /* set @证券代码编号#=@深圳标准券证券代码编号#; */
        set v_stock_code_no=v_sz_standard_stock_code_no;
    end if;

    /* set @变动数量#=@临时_解冻数量#; */
    set v_occur_qty=v_tmp_unfroz_qty;

    /* set @冻结数量#=0; */
    set v_frozen_qty=0;

    /* set @解冻数量#=@临时_解冻数量#; */
    set v_unfroz_qty=v_tmp_unfroz_qty;

    /* set @证券类型#=27; */
    set v_stock_type=27;

    /* set @资产类型#=43; */
    set v_asset_type=43;

    /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{解冻数量}={解冻数量}+@解冻数量#][1][@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_exgp_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, invest_type, 
        begin_qty, curr_qty, pre_settle_qty, frozen_qty, 
        unfroz_qty, posi_qty_check_diff, cost_amt, realize_pandl, 
        intrst_cost_amt, intrst_pandl) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_type, v_asset_type, v_invest_type, 
        v_begin_qty, v_curr_qty, v_pre_settle_qty, v_frozen_qty, 
        v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, 
        v_intrst_cost_amt, v_intrst_pandl) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, unfroz_qty=unfroz_qty+v_unfroz_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.14.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{解冻数量}][@变动后数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    select unfroz_qty into v_occur_end_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.9.14.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_exgp_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
        invest_type) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_busi_flag, v_occur_qty, 
        v_occur_end_qty, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, 
        v_invest_type);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.14.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @变动数量#=@临时_变动数量#; */
    set v_occur_qty=v_tmp_occur_qty;

    /* set @证券类型#=@临时_证券类型#; */
    set v_stock_type=v_tmp_stock_type;

    /* set @资产类型#=@临时_资产类型#; */
    set v_asset_type=v_tmp_asset_type;

    /* set @证券代码编号#=@临时_证券代码编号#; */
    set v_stock_code_no=v_tmp_stock_code_no;

    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* set @当前数量# = @变动数量#; */
    set v_curr_qty = v_occur_qty;

    /* set @提交质押数量# = @临时_提交质押数量#; */
    set v_put_impawn_qty = v_tmp_put_impawn_qty;

    /* set @转回质押数量# = @临时_转回质押数量#; */
    set v_get_impawn_qty = v_tmp_get_impawn_qty;

    /* [插入重复更新][产品证券_持仓_资产账户债券质押表][字段][字段变量][{当前数量}={当前数量}+@变动数量#,{提交质押数量}={提交质押数量}+@提交质押数量#,{转回质押数量}={转回质押数量}+@转回质押数量#][1][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_bond_pledge (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        begin_qty, curr_qty, put_impawn_qty, get_impawn_qty) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
        v_begin_qty, v_curr_qty, v_put_impawn_qty, v_get_impawn_qty) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=curr_qty+v_occur_qty,put_impawn_qty=put_impawn_qty+v_put_impawn_qty,get_impawn_qty=get_impawn_qty+v_get_impawn_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.14.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户债券质押表][{当前数量}][@账户当前数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][4][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    select curr_qty into v_acco_curr_qty from db_pdsecu.tb_pdsepo_asac_bond_pledge where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.9.14.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* set @当前数量# = 0; */
    set v_curr_qty = 0;

    /* set @待交收数量# = 0; */
    set v_pre_settle_qty = 0;

    /* set @冻结数量# = @变动数量#; */
    set v_frozen_qty = v_occur_qty;

    /* set @解冻数量# = 0; */
    set v_unfroz_qty = 0;

    /* set @成本金额# = 0; */
    set v_cost_amt = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利息成本金额# = 0; */
    set v_intrst_cost_amt = 0;

    /* set @利息收益# = 0; */
    set v_intrst_pandl = 0;

    /* [插入重复更新][产品证券_持仓_资产账户持仓表][字段][字段变量][{冻结数量}={冻结数量}+@变动数量#][1][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        stock_type, asset_type, invest_type, begin_qty, 
        curr_qty, pre_settle_qty, frozen_qty, unfroz_qty, 
        posi_qty_check_diff, cost_amt, realize_pandl, intrst_cost_amt, 
        intrst_pandl) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
        v_stock_type, v_asset_type, v_invest_type, v_begin_qty, 
        v_curr_qty, v_pre_settle_qty, v_frozen_qty, v_unfroz_qty, 
        v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, v_intrst_cost_amt, 
        v_intrst_pandl) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, frozen_qty=frozen_qty+v_occur_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.14.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{冻结数量}][@变动后数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    select frozen_qty into v_occur_end_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.9.14.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* set @流水变动字段# = " "; */
    set v_jour_occur_field = " ";

    /* set @流水后信息# = " "; */
    set v_jour_after_occur_info = " ";

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "系统自动同步外部质押数据！"; */
    set v_oper_remark_info = "系统自动同步外部质押数据！";

    /* [插入表记录][产品证券_持仓_资产账户持仓流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, busi_flag, occur_qty, occur_end_qty, 
        jour_occur_field, jour_after_occur_info, oper_remark_info, invest_type) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_busi_flag, v_occur_qty, v_occur_end_qty, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, v_invest_type);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.14.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #标准券对应变化

    /* if @市场编号#=1 then */
    if v_exch_no=1 then

        /* set @证券代码编号#=@上海标准券证券代码编号#; */
        set v_stock_code_no=v_sh_standard_stock_code_no;

    /* elseif @市场编号#=2 then */
    elseif v_exch_no=2 then

        /* set @证券代码编号#=@深圳标准券证券代码编号#; */
        set v_stock_code_no=v_sz_standard_stock_code_no;
    end if;

    /* set @变动数量#=@临时_解冻数量#; */
    set v_occur_qty=v_tmp_unfroz_qty;

    /* set @冻结数量#=0; */
    set v_frozen_qty=0;

    /* set @解冻数量#=@临时_解冻数量#; */
    set v_unfroz_qty=v_tmp_unfroz_qty;

    /* set @证券类型#=27; */
    set v_stock_type=27;

    /* set @资产类型#=43; */
    set v_asset_type=43;

    /* [插入重复更新][产品证券_持仓_资产账户持仓表][字段][字段变量][{解冻数量}={解冻数量}+@解冻数量#][1][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        stock_type, asset_type, invest_type, begin_qty, 
        curr_qty, pre_settle_qty, frozen_qty, unfroz_qty, 
        posi_qty_check_diff, cost_amt, realize_pandl, intrst_cost_amt, 
        intrst_pandl) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
        v_stock_type, v_asset_type, v_invest_type, v_begin_qty, 
        v_curr_qty, v_pre_settle_qty, v_frozen_qty, v_unfroz_qty, 
        v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, v_intrst_cost_amt, 
        v_intrst_pandl) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, unfroz_qty=unfroz_qty+v_unfroz_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.14.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{解冻数量}][@变动后数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    select unfroz_qty into v_occur_end_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.9.14.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [插入表记录][产品证券_持仓_资产账户持仓流水表][字段][字段变量][5][@资产账户编号#, @股东代码编号#, @证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_asac_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, busi_flag, occur_qty, occur_end_qty, 
        jour_occur_field, jour_after_occur_info, oper_remark_info, invest_type) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_busi_flag, v_occur_qty, v_occur_end_qty, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info, v_invest_type);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.14.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @账户可用数量# = @账户当前数量#; */
    set v_acco_avail_qty = v_acco_curr_qty;

    /* set @账户可用数量差额# = @外部可用数量# - @账户可用数量#; */
    set v_acco_avail_qty_diff = v_out_enable_qty - v_acco_avail_qty;

    /* if @账户可用数量差额#<>0 then */
    if v_acco_avail_qty_diff<>0 then

        /* set @处理标志# = @临时_处理标志#; */
        set v_deal_flag = v_tmp_deal_flag;

        /* set @备注信息# = @临时_备注信息#; */
        set v_remark_info = v_tmp_remark_info;
    end if;

    /* [更新表记录][产品证券_持仓_内外资产账户债券质押差异表][{账户当前数量}=@账户当前数量#,{账户可用数量}=@账户可用数量#,{账户可用数量差额}=@账户可用数量差额#,{处理标志}=@处理标志#,{备注信息}=@备注信息#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_bond_pledge_diff set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, acco_curr_qty=v_acco_curr_qty,acco_avail_qty=v_acco_avail_qty,acco_avail_qty_diff=v_acco_avail_qty_diff,deal_flag=v_deal_flag,remark_info=v_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.14.2";
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
use db_pdsecu;;

# 原子_产品证券_持仓运维_获取资产账户内外债券质押差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_GetBondPledgeDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_GetBondPledgeDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_co_no int,
    OUT p_asset_acco_no int,
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
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_co_no int;
    declare v_asset_acco_no int;
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
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_co_no = 0;
    SET v_asset_acco_no = 0;
    SET v_out_acco = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_持仓_内外资产账户债券质押差异表][{证券代码编号},{机构编号},{资产账户编号},{外部账号}][@证券代码编号#,@机构编号#,@资产账户编号#,@外部账号#][{记录序号}=@记录序号#][4][@记录序号#] */
    select stock_code_no,co_no,asset_acco_no,out_acco into v_stock_code_no,v_co_no,v_asset_acco_no,v_out_acco from db_pdsecu.tb_pdsepo_asac_bond_pledge_diff where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.9.15.4";
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
    SET p_stock_code_no = v_stock_code_no;
    SET p_co_no = v_co_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_out_acco = v_out_acco;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_同步债券质押差异数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_SynchronizedBondPledgeDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_SynchronizedBondPledgeDiff(
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_row_id bigint;
    declare v_row_id bigint;
    declare v_out_enable_qty decimal(18,2);
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_curr_qty decimal(18,2);
    declare v_posi_qty decimal(18,2);
    declare v_acco_avail_qty decimal(18,2);
    declare v_acco_avail_qty_diff decimal(18,2);
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_row_id = 0;
    SET v_row_id = 0;
    SET v_out_enable_qty = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_curr_qty = 0;
    SET v_posi_qty = 0;
    SET v_acco_avail_qty = 0;
    SET v_acco_avail_qty_diff = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @查询记录序号#=0; */
    set v_query_row_id=0;
    loop_label:loop

        /* set @记录序号#=0; */
        set v_row_id=0;

        /* [获取表记录变量语句][产品证券_持仓_内外资产账户债券质押差异表][{记录序号},{外部可用数量},{资产账户编号},{股东代码编号},{证券代码编号}][@记录序号#,@外部可用数量#,@资产账户编号#,@股东代码编号#,@证券代码编号#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {记录序号}>@查询记录序号#] */
        select row_id,out_enable_qty,asset_acco_no,stock_acco_no,stock_code_no into v_row_id,v_out_enable_qty,v_asset_acco_no,v_stock_acco_no,v_stock_code_no from db_pdsecu.tb_pdsepo_asac_bond_pledge_diff where co_no=v_co_no and pd_no=v_pd_no and row_id>v_query_row_id limit 1;


        /* if @记录序号#=0 then */
        if v_row_id=0 then
            leave loop_label;
        end if;

        /* set @当前数量#=0; */
        set v_curr_qty=0;

        /* [获取表记录变量语句][产品证券_持仓_资产账户债券质押表][{当前数量}][@当前数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
        select curr_qty into v_curr_qty from db_pdsecu.tb_pdsepo_asac_bond_pledge where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;


        /* set @持仓数量#=0; */
        set v_posi_qty=0;

        /* [获取表记录变量语句][产品证券_持仓_交易库资产账户债券质押表][{持仓数量}][@持仓数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
        select posi_qty into v_posi_qty from db_pdsecu.tb_pdsepo_trd_asac_bond_pledge where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1;


        /* set @账户可用数量# = @当前数量#+@持仓数量#; */
        set v_acco_avail_qty = v_curr_qty+v_posi_qty;

        /* set @账户可用数量差额#=@外部可用数量#-@账户可用数量#; */
        set v_acco_avail_qty_diff=v_out_enable_qty-v_acco_avail_qty;

        /* [更新表记录][产品证券_持仓_内外资产账户债券质押差异表][{账户可用数量}=@账户可用数量#,{账户可用数量差额}=@账户可用数量差额#][{记录序号}=@记录序号#][2][@记录序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdsepo_asac_bond_pledge_diff set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, acco_avail_qty=v_acco_avail_qty,acco_avail_qty_diff=v_acco_avail_qty_diff where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.9.16.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
            end if;
            leave label_pro;
        end if;


        /* set @查询记录序号#=@记录序号#; */
        set v_query_row_id=v_row_id;
    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_清除外部持仓记录差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_ClearOutPosiRecordDiffRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_ClearOutPosiRecordDiffRecord(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][产品证券_持仓_外部资产账户持仓表][{机构编号}=@机构编号# and ({产品编号}=@产品编号# or @产品编号#=0) and {资产账户编号}<>0 and {初始化日期}<>0][3][@机构编号#,@产品编号#] */
    delete from db_pdsecu.tb_pdsepo_out_asac_posi 
        where co_no=v_co_no and (pd_no=v_pd_no or v_pd_no=0) and asset_acco_no<>0 and init_date<>0;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.9.17.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_持仓_内外资产账户持仓差异表][{机构编号}=@机构编号# and ({产品编号}=@产品编号# or @产品编号#=0) and {资产账户编号}<>0 and {初始化日期}<>0][3][@机构编号#,@产品编号#] */
    delete from db_pdsecu.tb_pdsepo_asac_posi_diff 
        where co_no=v_co_no and (pd_no=v_pd_no or v_pd_no=0) and asset_acco_no<>0 and init_date<>0;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.9.17.3";
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


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_获取债券质押信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_GetBondImpawnInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_GetBondImpawnInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_exch_no int,
    OUT p_stock_code_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_exch_no int;
    declare v_stock_code_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* if @查询记录序号#=0 then */
    if v_query_row_id=0 then

      /* truncate table ~产品证券_持仓_债券质押比例表^; */
      truncate table db_pdsecu.tb_pdsepo_bond_impawn_ratio;
    end if;

    /* [获取表记录变量][产品证券_持仓_交易组债券质押表][{记录序号},{证券代码编号},{市场编号}][@记录序号#,@证券代码编号#,@市场编号#][{记录序号}>@查询记录序号# and {当前数量}>0][4][@查询记录序号#] */
    select row_id,stock_code_no,exch_no into v_row_id,v_stock_code_no,v_exch_no from db_pdsecu.tb_pdsepo_exgp_bond_pledge where row_id>v_query_row_id and curr_qty>0 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.9.31.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_exch_no = v_exch_no;
    SET p_stock_code_no = v_stock_code_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_更新债券质押比例
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_UpdateBondImpawnRatio;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_UpdateBondImpawnRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_impawn_ratio decimal(18,12),
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
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][产品证券_持仓_债券质押比例表][字段][字段变量][{标的代码编号}=@标的代码编号#,{质押比例}=@质押比例#][1][@市场编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_bond_impawn_ratio (
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, stock_code_no, 
        target_code_no, impawn_ratio) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_stock_code_no, 
        v_target_code_no, v_impawn_ratio) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, target_code_no=v_target_code_no,impawn_ratio=v_impawn_ratio;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.9.32.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_重算债券质押标准券数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_ReCalcBondImpawnQty;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_ReCalcBondImpawnQty(
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
    

    /* UPDATE ~产品证券_持仓_交易组持仓表^ a,
 (
 SELECT
  sum(
   a.{当前数量} * b.{质押比例}
  ) AS {当前数量},
  a.{交易组编号},
  a.{资产账户编号},
  a.{股东代码编号},
  a.{市场编号},
  b.{标的代码编号}
 FROM
  ~产品证券_持仓_交易组债券质押表^ a,
  ~产品证券_持仓_债券质押比例表^ b
 WHERE
  a.{市场编号}= b.{市场编号}
 AND a.{证券代码编号} = b.{证券代码编号}
 AND a.{当前数量} > 0
 GROUP BY
  a.{交易组编号},
  a.{资产账户编号},
  a.{股东代码编号},
  a.{市场编号},
  b.{标的代码编号}
) b
SET a.{解冻数量} = b.{当前数量}
WHERE
 a.{市场编号} = b.{市场编号}
AND a.{投资类型} = 1
AND a.{交易组编号} = b.{交易组编号}
AND a.{资产账户编号} = b.{资产账户编号}
AND a.{股东代码编号} = b.{股东代码编号}
AND a.{证券代码编号} = b.{标的代码编号};
 */
    UPDATE db_pdsecu.tb_pdsepo_exgp_posi a,
     (
     SELECT
      sum(
       a.curr_qty * b.impawn_ratio
      ) AS curr_qty,
      a.exch_group_no,
      a.asset_acco_no,
      a.stock_acco_no,
      a.exch_no,
      b.target_code_no
     FROM
      db_pdsecu.tb_pdsepo_exgp_bond_pledge a,
      db_pdsecu.tb_pdsepo_bond_impawn_ratio b
     WHERE
      a.exch_no= b.exch_no
     AND a.stock_code_no = b.stock_code_no
     AND a.curr_qty > 0
     GROUP BY
      a.exch_group_no,
      a.asset_acco_no,
      a.stock_acco_no,
      a.exch_no,
      b.target_code_no
    ) b
    SET a.unfroz_qty = b.curr_qty
    WHERE
     a.exch_no = b.exch_no
    AND a.invest_type = 1
    AND a.exch_group_no = b.exch_group_no
    AND a.asset_acco_no = b.asset_acco_no
    AND a.stock_acco_no = b.stock_acco_no
    AND a.stock_code_no = b.target_code_no;
    

    /* UPDATE ~产品证券_持仓_资产账户持仓表^ a,
 (
 SELECT
  sum(
   a.{当前数量} * b.{质押比例}
  ) AS {当前数量},
  a.{资产账户编号},
  a.{股东代码编号},
  a.{市场编号},
  b.{标的代码编号}
 FROM
  ~产品证券_持仓_资产账户债券质押表^ a,
  ~产品证券_持仓_债券质押比例表^ b
 WHERE
  a.{市场编号}= b.{市场编号}
 AND a.{证券代码编号} = b.{证券代码编号}
 AND a.{当前数量} > 0
 GROUP BY
  a.{资产账户编号},
  a.{股东代码编号},
  a.{市场编号},
  b.{标的代码编号}
) b
set a.{解冻数量} = b.{当前数量}
WHERE
 a.{市场编号} = b.{市场编号}
AND a.{资产账户编号} = b.{资产账户编号}
AND a.{投资类型} = 1
AND a.{股东代码编号} = b.{股东代码编号}
AND a.{证券代码编号} = b.{标的代码编号}; */
    UPDATE db_pdsecu.tb_pdsepo_asac_posi a,
     (
     SELECT
      sum(
       a.curr_qty * b.impawn_ratio
      ) AS curr_qty,
      a.asset_acco_no,
      a.stock_acco_no,
      a.exch_no,
      b.target_code_no
     FROM
      db_pdsecu.tb_pdsepo_asac_bond_pledge a,
      db_pdsecu.tb_pdsepo_bond_impawn_ratio b
     WHERE
      a.exch_no= b.exch_no
     AND a.stock_code_no = b.stock_code_no
     AND a.curr_qty > 0
     GROUP BY
      a.asset_acco_no,
      a.stock_acco_no,
      a.exch_no,
      b.target_code_no
    ) b
    set a.unfroz_qty = b.curr_qty
    WHERE
     a.exch_no = b.exch_no
    AND a.asset_acco_no = b.asset_acco_no
    AND a.invest_type = 1
    AND a.stock_acco_no = b.stock_acco_no
    AND a.stock_code_no = b.target_code_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_查询资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_QueryAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_QueryAsacPosi(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_资产账户持仓表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},@初始化日期# as {初始化日期},{机构编号},{产品编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{投资类型},{期初数量},{当前数量}+{待交收数量}+{持仓核对差额} as {当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][(@机构编号# = 0 or {机构编号} = @机构编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,v_init_date as init_date,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,invest_type,begin_qty,curr_qty+pre_settle_qty+posi_qty_check_diff as curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl from db_pdsecu.tb_pdsepo_asac_posi where (v_co_no = 0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,v_init_date as init_date,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,invest_type,begin_qty,curr_qty+pre_settle_qty+posi_qty_check_diff as curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl from db_pdsecu.tb_pdsepo_asac_posi where (v_co_no = 0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_查询历史资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_QueryAsacPosi_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_QueryAsacPosi_His(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_历史资产账户持仓表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{投资类型},{期初数量},{当前数量}+{待交收数量}+{持仓核对差额} as {当前数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][({初始化日期} between @开始日期# and @结束日期#) and (@机构编号# = 0 or {机构编号} = @机构编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,init_date,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,invest_type,begin_qty,curr_qty+pre_settle_qty+posi_qty_check_diff as curr_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl from db_pdsecu_his.tb_pdsepo_asac_posi_his where (init_date between v_begin_date and v_end_date) and (v_co_no = 0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,init_date,co_no,pd_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,invest_type,begin_qty,curr_qty+pre_settle_qty+posi_qty_check_diff as curr_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl from db_pdsecu_his.tb_pdsepo_asac_posi_his where (init_date between v_begin_date and v_end_date) and (v_co_no = 0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_查询资产账户持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_QueryAsacPosiJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_QueryAsacPosiJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_asset_acco_no_str varchar(2048),
    IN p_busi_flag_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
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
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_asset_acco_no_str varchar(2048);
    declare v_busi_flag_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
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
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_busi_flag_str = p_busi_flag_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_资产账户持仓流水表][字段][{初始化日期}<=@初始化日期# and  (@机构编号串#="; ;" or  instr(@机构编号串#,concat(";",{机构编号},";"))>0) and (@产品编号串# = "; ;" or  instr(@产品编号串#,concat(";",{产品编号},";"))>0)  and (@资产账户编号串# = "; ;" or instr(@资产账户编号串#,concat(";",{资产账户编号},";"))>0) and (@业务标志串# = "; ;" or  instr(@业务标志串#,concat(";",{业务标志},";"))>0) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
        invest_type from db_pdsecu.tb_pdsepo_asac_posi_jour where init_date<=v_init_date and  (v_co_no_str="; ;" or  instr(v_co_no_str,concat(";",co_no,";"))>0) and (v_pd_no_str = "; ;" or  instr(v_pd_no_str,concat(";",pd_no,";"))>0)  and (v_asset_acco_no_str = "; ;" or instr(v_asset_acco_no_str,concat(";",asset_acco_no,";"))>0) and (v_busi_flag_str = "; ;" or  instr(v_busi_flag_str,concat(";",busi_flag,";"))>0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
        invest_type from db_pdsecu.tb_pdsepo_asac_posi_jour where init_date<=v_init_date and  (v_co_no_str="; ;" or  instr(v_co_no_str,concat(";",co_no,";"))>0) and (v_pd_no_str = "; ;" or  instr(v_pd_no_str,concat(";",pd_no,";"))>0)  and (v_asset_acco_no_str = "; ;" or instr(v_asset_acco_no_str,concat(";",asset_acco_no,";"))>0) and (v_busi_flag_str = "; ;" or  instr(v_busi_flag_str,concat(";",busi_flag,";"))>0) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_查询历史资产账户持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_QueryAsacPosiJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_QueryAsacPosiJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_asset_acco_no_str varchar(2048),
    IN p_busi_flag_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no_str varchar(4096),
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
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_asset_acco_no_str varchar(2048);
    declare v_busi_flag_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no_str varchar(4096);
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
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_busi_flag_str = p_busi_flag_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品证券_持仓_资产账户持仓流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and  (@机构编号串#="; ;" or  instr(@机构编号串#,concat(";",{机构编号},";"))>0) and (@产品编号串# = "; ;" or  instr(@产品编号串#,concat(";",{产品编号},";"))>0)  and (@资产账户编号串# = "; ;" or instr(@资产账户编号串#,concat(";",{资产账户编号},";"))>0) and (@业务标志串# = "; ;" or  instr(@业务标志串#,concat(";",{业务标志},";"))>0)  and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
        invest_type from db_pdsecu_his.tb_pdsepo_asac_posi_jour_his where (init_date between v_begin_date and v_end_date) and  (v_co_no_str="; ;" or  instr(v_co_no_str,concat(";",co_no,";"))>0) and (v_pd_no_str = "; ;" or  instr(v_pd_no_str,concat(";",pd_no,";"))>0)  and (v_asset_acco_no_str = "; ;" or instr(v_asset_acco_no_str,concat(";",asset_acco_no,";"))>0) and (v_busi_flag_str = "; ;" or  instr(v_busi_flag_str,concat(";",busi_flag,";"))>0)  and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info, 
        invest_type from db_pdsecu_his.tb_pdsepo_asac_posi_jour_his where (init_date between v_begin_date and v_end_date) and  (v_co_no_str="; ;" or  instr(v_co_no_str,concat(";",co_no,";"))>0) and (v_pd_no_str = "; ;" or  instr(v_pd_no_str,concat(";",pd_no,";"))>0)  and (v_asset_acco_no_str = "; ;" or instr(v_asset_acco_no_str,concat(";",asset_acco_no,";"))>0) and (v_busi_flag_str = "; ;" or  instr(v_busi_flag_str,concat(";",busi_flag,";"))>0)  and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_查询资产账户内外持仓差异记录(自动同步)
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_QuerySecuPosiDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_QuerySecuPosiDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_asset_acco_no int,
    IN p_stock_code_str varchar(4096),
    IN p_exch_no_str varchar(2048),
    IN p_is_contain int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_deal_flag_query_str varchar(2048),
    IN p_filter_diff_cond int,
    IN p_asset_sync_flag int,
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
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_asset_acco_no int;
    declare v_stock_code_str varchar(4096);
    declare v_exch_no_str varchar(2048);
    declare v_is_contain int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_deal_flag_query_str varchar(2048);
    declare v_filter_diff_cond int;
    declare v_asset_sync_flag int;
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
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_str = p_stock_code_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_is_contain = p_is_contain;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_deal_flag_query_str = p_deal_flag_query_str;
    SET v_filter_diff_cond = p_filter_diff_cond;
    SET v_asset_sync_flag = p_asset_sync_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_内外资产账户持仓差异表][字段][(@机构编号串#="; ;" or instr(@机构编号串#, concat(";",{机构编号},";"))>0) and (@产品编号串#="; ;" or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@市场编号串#="; ;" or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (((@证券代码串#="; ;" or instr(@证券代码串#, concat(";",{证券代码},";"))>0) and @是否包含#=1) or ((@证券代码串#="; ;" or instr(@证券代码串#, concat(";",{证券代码},";"))=0) and @是否包含#=0)) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@处理标志查询串#="; ;" or instr(@处理标志查询串#,concat(";",{处理标志},";"))>0) and (@过滤差额条件#=《过滤差额条件-不过滤》 or (@过滤差额条件#=《过滤差额条件-只显示差额不为0》 and ({账户当前数量差额}<>0 or {账户可用数量差额}<>0)) or (@过滤差额条件#=《过滤差额条件-只显示差额为0》 and ({账户当前数量差额}=0 and {账户可用数量差额}=0))) and (@资产是否同步#=0 or {资产是否同步}=@资产是否同步#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_name, 
        stock_type, asset_type, out_cost_price, acco_curr_qty, 
        acco_avail_qty, out_curr_qty, out_enable_qty, acco_curr_qty_diff, 
        acco_avail_qty_diff, out_impawn_qty, deal_flag, asset_sync_flag, 
        remark_info from db_pdsecu.tb_pdsepo_asac_posi_diff where (v_co_no_str="; ;" or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_no_str="; ;" or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))>0) and v_is_contain=1) or ((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))=0) and v_is_contain=0)) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_qty_diff<>0 or acco_avail_qty_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_qty_diff=0 and acco_avail_qty_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_name, 
        stock_type, asset_type, out_cost_price, acco_curr_qty, 
        acco_avail_qty, out_curr_qty, out_enable_qty, acco_curr_qty_diff, 
        acco_avail_qty_diff, out_impawn_qty, deal_flag, asset_sync_flag, 
        remark_info from db_pdsecu.tb_pdsepo_asac_posi_diff where (v_co_no_str="; ;" or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_no_str="; ;" or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))>0) and v_is_contain=1) or ((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))=0) and v_is_contain=0)) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_qty_diff<>0 or acco_avail_qty_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_qty_diff=0 and acco_avail_qty_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_查询通道内外持仓差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_QueryChannelSecuPosiDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_QueryChannelSecuPosiDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_asset_acco_no int,
    IN p_stock_code_str varchar(4096),
    IN p_exch_no_str varchar(2048),
    IN p_is_contain int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_deal_flag_query_str varchar(2048),
    IN p_query_pass_no int,
    IN p_filter_diff_cond int,
    IN p_asset_sync_flag int,
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
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_asset_acco_no int;
    declare v_stock_code_str varchar(4096);
    declare v_exch_no_str varchar(2048);
    declare v_is_contain int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_deal_flag_query_str varchar(2048);
    declare v_query_pass_no int;
    declare v_filter_diff_cond int;
    declare v_asset_sync_flag int;
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
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_str = p_stock_code_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_is_contain = p_is_contain;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_deal_flag_query_str = p_deal_flag_query_str;
    SET v_query_pass_no = p_query_pass_no;
    SET v_filter_diff_cond = p_filter_diff_cond;
    SET v_asset_sync_flag = p_asset_sync_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_内外资产账户持仓差异表][{记录序号},{初始化日期},{机构编号},{产品编号},{资产账户编号},{交易组编号},{通道编号},{外部账号},{市场编号},{股东代码编号},{股东代码},{证券代码编号},{证券代码},{证券名称},{外部成本价},{账户当前数量},{账户可用数量},{外部当前数量},{外部可用数量},{账户当前数量差额},{账户可用数量差额},{账户当前数量差额}+{账户可用数量差额} AS {系统可用数量差额},{外部质押数量},{处理标志},{资产是否同步},{备注信息}][(@机构编号串#="; ;" or instr(@机构编号串#, concat(";",{机构编号},";"))>0) and (@产品编号串#="; ;" or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@市场编号串#="; ;" or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (((@证券代码串#="; ;" or instr(@证券代码串#, concat(";",{证券代码},";"))>0) and @是否包含#=1) or ((@证券代码串#="; ;" or instr(@证券代码串#, concat(";",{证券代码},";"))=0) and @是否包含#=0)) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@处理标志查询串#="; ;" or instr(@处理标志查询串#,concat(";",{处理标志},";"))>0) and (@过滤差额条件#=《过滤差额条件-不过滤》 or (@过滤差额条件#=《过滤差额条件-只显示差额不为0》 and ({账户当前数量差额}<>0 or {账户可用数量差额}<>0)) or (@过滤差额条件#=《过滤差额条件-只显示差额为0》 and ({账户当前数量差额}=0 and {账户可用数量差额}=0))) and (@资产是否同步#=0 or {资产是否同步}=@资产是否同步#) and  (@查询通道编号#=0 or {通道编号} like concat(@查询通道编号#,"%")) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,init_date,co_no,pd_no,asset_acco_no,exch_group_no,pass_no,out_acco,exch_no,stock_acco_no,stock_acco,stock_code_no,stock_code,stock_name,out_cost_price,acco_curr_qty,acco_avail_qty,out_curr_qty,out_enable_qty,acco_curr_qty_diff,acco_avail_qty_diff,acco_curr_qty_diff+acco_avail_qty_diff AS sys_avail_qty_diff,out_impawn_qty,deal_flag,asset_sync_flag,remark_info from db_pdsecu.tb_pdsepo_asac_posi_diff where (v_co_no_str="; ;" or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_no_str="; ;" or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))>0) and v_is_contain=1) or ((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))=0) and v_is_contain=0)) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_qty_diff<>0 or acco_avail_qty_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_qty_diff=0 and acco_avail_qty_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and  (v_query_pass_no=0 or pass_no like concat(v_query_pass_no,"%")) and row_id>v_row_id order by row_id;
    else
        select row_id,init_date,co_no,pd_no,asset_acco_no,exch_group_no,pass_no,out_acco,exch_no,stock_acco_no,stock_acco,stock_code_no,stock_code,stock_name,out_cost_price,acco_curr_qty,acco_avail_qty,out_curr_qty,out_enable_qty,acco_curr_qty_diff,acco_avail_qty_diff,acco_curr_qty_diff+acco_avail_qty_diff AS sys_avail_qty_diff,out_impawn_qty,deal_flag,asset_sync_flag,remark_info from db_pdsecu.tb_pdsepo_asac_posi_diff where (v_co_no_str="; ;" or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_no_str="; ;" or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))>0) and v_is_contain=1) or ((v_stock_code_str="; ;" or instr(v_stock_code_str, concat(";",stock_code,";"))=0) and v_is_contain=0)) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_qty_diff<>0 or acco_avail_qty_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_qty_diff=0 and acco_avail_qty_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and  (v_query_pass_no=0 or pass_no like concat(v_query_pass_no,"%")) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_持仓运维_查询所有交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepobk_QueryAllExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepobk_QueryAllExgpPosi(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_type_str varchar(2048),
    IN p_stock_code_no_str varchar(4096),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_stock_acco_str varchar(2048),
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_type_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_stock_acco_str varchar(2048);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_stock_acco_str = p_stock_acco_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品证券_持仓_交易组持仓表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{证券类型},{投资类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][(@机构编号# = 0 or {机构编号} = @机构编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#)  and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and instr(@股东代码串#, concat(";", {股东代码编号}, ";")) = 0 and (@证券代码编号串# = "; ;" or instr(@证券代码编号串#, concat(";", {证券代码编号}, ";")) > 0) and (@证券类型串# = "; ;" or instr(@证券类型串#, concat(";", {证券类型}, ";")) > 0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type,invest_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where (v_co_no = 0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and instr(v_stock_acco_str, concat(";", stock_acco_no, ";")) = 0 and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and row_id>v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type,invest_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where (v_co_no = 0 or co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no)  and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and instr(v_stock_acco_str, concat(";", stock_acco_no, ";")) = 0 and (v_stock_code_no_str = "; ;" or instr(v_stock_code_no_str, concat(";", stock_code_no, ";")) > 0) and (v_stock_type_str = "; ;" or instr(v_stock_type_str, concat(";", stock_type, ";")) > 0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


