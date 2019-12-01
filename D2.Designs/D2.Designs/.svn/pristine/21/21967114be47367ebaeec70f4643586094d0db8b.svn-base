DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_新增负债变动流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_InsertDebtOccurJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_InsertDebtOccurJour(
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
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_debt_type int,
    IN p_order_dir int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_amt decimal(18,4),
    IN p_return_capit_jour_nor int,
    IN p_curr_row_id bigint,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_order_dir int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_return_capit_jour_nor int;
    declare v_curr_row_id bigint;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_busi_flag int;
    declare v_record_valid_flag int;
    declare v_occur_end_amt decimal(18,4);
    declare v_occur_end_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_debt_type = p_debt_type;
    SET v_order_dir = p_order_dir;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_amt = p_occur_amt;
    SET v_return_capit_jour_nor = p_return_capit_jour_nor;
    SET v_curr_row_id = p_curr_row_id;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_busi_flag = 0;
    SET v_record_valid_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_occur_end_qty = 0;
    SET v_strike_price = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

      /* if @订单方向#=《订单方向-融资买入》  then */
      if v_order_dir=5  then

           /* set @业务标志#=《业务标志-融资借款》; */
           set v_busi_flag=4001001;

           /* set @操作信息#="业务标志-融资借款"; */
           set v_oper_info="业务标志-融资借款";

      /* elseif @订单方向#=《订单方向-卖出》   then */
      elseif v_order_dir=2   then

           /* set @业务标志#=《业务标志-卖出还款》; */
           set v_busi_flag=4001002;

           /* set  @操作信息#="业务标志-卖出还款"; */
           set  v_oper_info="业务标志-卖出还款";

      /* elseif @订单方向#=《订单方向-卖券还款》   then */
      elseif v_order_dir=7   then

           /* set @业务标志#=《业务标志-卖券还款》; */
           set v_busi_flag=4001003;

           /* set  @操作信息#="业务标志-卖券还款"; */
           set  v_oper_info="业务标志-卖券还款";

      /* elseif @订单方向#=《订单方向-直接还款》   then */
      elseif v_order_dir=14   then

           /* set @业务标志#=《业务标志-直接还款》; */
           set v_busi_flag=4001004;

           /* set  @操作信息#="业务标志-直接还款"; */
           set  v_oper_info="业务标志-直接还款";

      /* elseif @订单方向#=《订单方向-融券卖出》   then */
      elseif v_order_dir=6   then

           /* set @业务标志#=《业务标志-融券借券》; */
           set v_busi_flag=4002001;

           /* set  @操作信息#="业务标志-融券借券"; */
           set  v_oper_info="业务标志-融券借券";

      /* elseif @订单方向#=《订单方向-买券还券》   then */
      elseif v_order_dir=8   then

           /* set @业务标志#=《业务标志-买券还券》; */
           set v_busi_flag=4002002;

           /* set  @操作信息#="业务标志-买券还券"; */
           set  v_oper_info="业务标志-买券还券";

      /* elseif @订单方向#=《订单方向-直接还券》   then */
      elseif v_order_dir=15   then

           /* set @业务标志#=《业务标志-直接还券》; */
           set v_busi_flag=4002003;

           /* set  @操作信息#="业务标志-直接还券"; */
           set  v_oper_info="业务标志-直接还券";
      end if;

       /* set @备注信息#=concat(@操作信息#,@备注信息#); */
       set v_remark_info=concat(v_oper_info,v_remark_info);

    /* set @记录有效标志#=《记录有效标志-有效》; */
    set v_record_valid_flag=1;

    /* set @变动后金额#=0; */
    set v_occur_end_amt=0;

    /* set @变动后数量#=0; */
    set v_occur_end_qty=0;

    /* select IFNULL(sum({负债数量}),0) ,IFNULL(sum({负债金额}),0) into @变动后数量#, @变动后金额#  from ~产品证券_融资融券_交易组负债明细表^ where {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {证券代码编号}=@证券代码编号# and {市场编号}={市场编号}; */
    select IFNULL(sum(debt_qty),0) ,IFNULL(sum(debt_amt),0) into v_occur_end_qty, v_occur_end_amt  from db_pdsecu.tb_pdsecr_exgp_debtdetail where pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_code_no=v_stock_code_no and exch_no=exch_no;

    /* set @成交价格#=0; */
    set v_strike_price=0;

    /* [插入表记录][产品证券_融资融券_负债变动流水表][字段][字段变量][1][@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@业务标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsecr_debt_occur_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_code, stock_type, 
        asset_type, debt_type, busi_flag, occur_qty, 
        occur_amt, occur_end_qty, occur_end_amt, strike_price, 
        record_valid_flag, curr_row_id, return_capit_jour_nor, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_code, v_stock_type, 
        v_asset_type, v_debt_type, v_busi_flag, v_occur_qty, 
        v_occur_amt, v_occur_end_qty, v_occur_end_amt, v_strike_price, 
        v_record_valid_flag, v_curr_row_id, v_return_capit_jour_nor, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.22.1.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","业务标志=",v_busi_flag),"#",v_mysql_message);
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
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_获取负债变动流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_GetDebtOccurJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_GetDebtOccurJour(
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
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_debt_type int,
    OUT p_busi_flag int,
    OUT p_occur_qty decimal(18,2),
    OUT p_occur_amt decimal(18,4),
    OUT p_occur_end_qty decimal(18,2),
    OUT p_occur_end_amt decimal(18,4),
    OUT p_curr_row_id bigint,
    OUT p_return_capit_jour_nor int,
    OUT p_remark_info varchar(255),
    OUT p_create_date int,
    OUT p_create_time int
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_busi_flag int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_occur_end_qty decimal(18,2);
    declare v_occur_end_amt decimal(18,4);
    declare v_curr_row_id bigint;
    declare v_return_capit_jour_nor int;
    declare v_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_strike_price decimal(16,9);
    declare v_record_valid_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_debt_type = 0;
    SET v_busi_flag = 0;
    SET v_occur_qty = 0;
    SET v_occur_amt = 0;
    SET v_occur_end_qty = 0;
    SET v_occur_end_amt = 0;
    SET v_curr_row_id = 0;
    SET v_return_capit_jour_nor = 0;
    SET v_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_strike_price = 0;
    SET v_record_valid_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_融资融券_负债变动流水表][字段][字段变量][{记录序号}=@记录序号#][1][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_type, asset_type, debt_type, busi_flag, 
        occur_qty, occur_amt, occur_end_qty, occur_end_amt, 
        strike_price, record_valid_flag, curr_row_id, return_capit_jour_nor, 
        remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_stock_code, 
        v_stock_type, v_asset_type, v_debt_type, v_busi_flag, 
        v_occur_qty, v_occur_amt, v_occur_end_qty, v_occur_end_amt, 
        v_strike_price, v_record_valid_flag, v_curr_row_id, v_return_capit_jour_nor, 
        v_remark_info from db_pdsecu.tb_pdsecr_debt_occur_jour where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.22.2.1";
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
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_debt_type = v_debt_type;
    SET p_busi_flag = v_busi_flag;
    SET p_occur_qty = v_occur_qty;
    SET p_occur_amt = v_occur_amt;
    SET p_occur_end_qty = v_occur_end_qty;
    SET p_occur_end_amt = v_occur_end_amt;
    SET p_curr_row_id = v_curr_row_id;
    SET p_return_capit_jour_nor = v_return_capit_jour_nor;
    SET p_remark_info = v_remark_info;
    SET p_create_date = v_create_date;
    SET p_create_time = v_create_time;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_更新获取负债变动流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_UpdateGetDebtOccurJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_UpdateGetDebtOccurJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_record_valid_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_debt_type int,
    OUT p_busi_flag int,
    OUT p_occur_qty decimal(18,2),
    OUT p_occur_amt decimal(18,4),
    OUT p_occur_end_qty decimal(18,2),
    OUT p_occur_end_amt decimal(18,4),
    OUT p_curr_row_id bigint,
    OUT p_return_capit_jour_nor int,
    OUT p_remark_info varchar(255),
    OUT p_create_date int,
    OUT p_create_time int
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
    declare v_record_valid_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_busi_flag int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_occur_end_qty decimal(18,2);
    declare v_occur_end_amt decimal(18,4);
    declare v_curr_row_id bigint;
    declare v_return_capit_jour_nor int;
    declare v_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_strike_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_record_valid_flag = p_record_valid_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_debt_type = 0;
    SET v_busi_flag = 0;
    SET v_occur_qty = 0;
    SET v_occur_amt = 0;
    SET v_occur_end_qty = 0;
    SET v_occur_end_amt = 0;
    SET v_curr_row_id = 0;
    SET v_return_capit_jour_nor = 0;
    SET v_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_strike_price = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_融资融券_负债变动流水表][字段][字段变量][{记录序号}=@记录序号#][1][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_type, asset_type, debt_type, busi_flag, 
        occur_qty, occur_amt, occur_end_qty, occur_end_amt, 
        strike_price, record_valid_flag, curr_row_id, return_capit_jour_nor, 
        remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_stock_code, 
        v_stock_type, v_asset_type, v_debt_type, v_busi_flag, 
        v_occur_qty, v_occur_amt, v_occur_end_qty, v_occur_end_amt, 
        v_strike_price, v_record_valid_flag, v_curr_row_id, v_return_capit_jour_nor, 
        v_remark_info from db_pdsecu.tb_pdsecr_debt_occur_jour where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.22.3.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_融资融券_负债变动流水表][{记录有效标志}=@记录有效标志#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsecr_debt_occur_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, record_valid_flag=v_record_valid_flag where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.22.3.2";
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
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_debt_type = v_debt_type;
    SET p_busi_flag = v_busi_flag;
    SET p_occur_qty = v_occur_qty;
    SET p_occur_amt = v_occur_amt;
    SET p_occur_end_qty = v_occur_end_qty;
    SET p_occur_end_amt = v_occur_end_amt;
    SET p_curr_row_id = v_curr_row_id;
    SET p_return_capit_jour_nor = v_return_capit_jour_nor;
    SET p_remark_info = v_remark_info;
    SET p_create_date = v_create_date;
    SET p_create_time = v_create_time;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_增加资产账户负债流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_InsertAsacDebtJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_InsertAsacDebtJour(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_debt_type int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_fee decimal(18,4),
    IN p_order_no int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_debt_intrst_rate decimal(18,12),
    IN p_debt_amt decimal(18,4),
    IN p_debt_qty decimal(18,2),
    IN p_debt_fee decimal(18,4),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_order_no int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_debt_intrst_rate decimal(18,12);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_fee decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_interest_update_date int;
    declare v_debt_return_date int;
    declare v_defer_times int;
    declare v_debt_end_date int;
    declare v_orign_debt_end_date int;
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_debt_status int;
    declare v_debt_interest decimal(18,4);
    declare v_begin_debt_amt decimal(18,4);
    declare v_begin_debt_qty decimal(18,2);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_debt_type = p_debt_type;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_fee = p_strike_fee;
    SET v_order_no = p_order_no;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_debt_intrst_rate = p_debt_intrst_rate;
    SET v_debt_amt = p_debt_amt;
    SET v_debt_qty = p_debt_qty;
    SET v_debt_fee = p_debt_fee;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_interest_update_date = 0;
    SET v_debt_return_date = 0;
    SET v_defer_times = 0;
    SET v_debt_end_date = 0;
    SET v_orign_debt_end_date = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_intrst_base_amt = 0;
    SET v_debt_status = 0;
    SET v_debt_interest = 0;
    SET v_begin_debt_amt = 0;
    SET v_begin_debt_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @利息积数更改日期#= @初始化日期#; */
    set v_interest_update_date= v_init_date;

    /* set @负债归还日期#= 0; */
    set v_debt_return_date= 0;

    /* set @展期次数#=0; */
    set v_defer_times=0;

    /* set @负债截止日期#= date_format(date_add(NOW(),INTERVAL 6 MONTH),'%Y%m%d'); */
    set v_debt_end_date= date_format(date_add(NOW(),INTERVAL 6 MONTH),'%Y%m%d');

    /* set @原负债截止日期#=@负债截止日期#; */
    set v_orign_debt_end_date=v_debt_end_date;

    /* set @已归还金额#=0; */
    set v_debt_return_amt=0;

    /* set @已归还数量#=0; */
    set v_debt_return_qty=0;

    /* set @归还利息金额#=0; */
    set v_return_interest_amt=0;

    /* set @利息积数#=0; */
    set v_intrst_base_amt=0;

    /* set @负债状态#= 《负债状态-未归还》; */
    set v_debt_status= 1;

    /* set @负债利息#=0; */
    set v_debt_interest=0;

    /* set @期初负债金额#=@负债金额#; */
    set v_begin_debt_amt=v_debt_amt;

    /* set @期初负债数量#=@负债数量#; */
    set v_begin_debt_qty=v_debt_qty;

    /* [插入重复更新][产品证券_融资融券_资产账户负债明细表][字段][字段变量][{成交数量}={成交数量}+@成交数量#,{成交金额}={成交金额}+@成交金额#,{成交费用}={成交费用}+@成交费用#,{期初负债数量}={期初负债数量}+@期初负债数量#,{期初负债金额}={期初负债金额}+@期初负债金额#,{负债数量}={负债数量}+@负债数量#,{负债金额}={负债金额}+@负债金额#,{负债费用}={负债费用}+@负债费用#][1][@机构编号#,@资产账户编号#,@产品编号#,@订单编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsecr_asac_debtdetail (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, opor_no, 
        co_no, pd_no, asset_acco_no, pass_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_type, asset_type, debt_type, strike_qty, 
        strike_amt, strike_fee, order_no, report_no, 
        order_date, order_time, order_dir, order_price, 
        order_qty, debt_intrst_rate, begin_debt_amt, begin_debt_qty, 
        debt_amt, debt_qty, debt_fee, debt_interest, 
        intrst_base_amt, debt_return_amt, debt_return_qty, return_interest_amt, 
        interest_update_date, debt_end_date, orign_debt_end_date, defer_times, 
        debt_return_date, debt_status, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_opor_no, 
        v_co_no, v_pd_no, v_asset_acco_no, v_pass_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_stock_code, 
        v_stock_type, v_asset_type, v_debt_type, v_strike_qty, 
        v_strike_amt, v_strike_fee, v_order_no, v_report_no, 
        v_order_date, v_order_time, v_order_dir, v_order_price, 
        v_order_qty, v_debt_intrst_rate, v_begin_debt_amt, v_begin_debt_qty, 
        v_debt_amt, v_debt_qty, v_debt_fee, v_debt_interest, 
        v_intrst_base_amt, v_debt_return_amt, v_debt_return_qty, v_return_interest_amt, 
        v_interest_update_date, v_debt_end_date, v_orign_debt_end_date, v_defer_times, 
        v_debt_return_date, v_debt_status, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, strike_qty=strike_qty+v_strike_qty,strike_amt=strike_amt+v_strike_amt,strike_fee=strike_fee+v_strike_fee,begin_debt_qty=begin_debt_qty+v_begin_debt_qty,begin_debt_amt=begin_debt_amt+v_begin_debt_amt,debt_qty=debt_qty+v_debt_qty,debt_amt=debt_amt+v_debt_amt,debt_fee=debt_fee+v_debt_fee;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.22.4.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","资产账户编号=",v_asset_acco_no,",","产品编号=",v_pd_no,",","订单编号=",v_order_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","资产账户编号=",v_asset_acco_no,",","产品编号=",v_pd_no,",","订单编号=",v_order_no,",","证券代码编号=",v_stock_code_no);
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
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_增加交易组负债流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_InsertExgpDebtJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_InsertExgpDebtJour(
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
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_debt_type int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_fee decimal(18,4),
    IN p_order_no int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_debt_intrst_rate decimal(18,12),
    IN p_debt_amt decimal(18,4),
    IN p_debt_qty decimal(18,2),
    IN p_debt_fee decimal(18,4),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_order_no int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_debt_intrst_rate decimal(18,12);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_fee decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_interest_update_date int;
    declare v_debt_return_date int;
    declare v_defer_times int;
    declare v_debt_end_date int;
    declare v_orign_debt_end_date int;
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_debt_status int;
    declare v_debt_interest decimal(18,4);
    declare v_begin_debt_amt decimal(18,4);
    declare v_begin_debt_qty decimal(18,2);
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_curr_row_id bigint;
    declare v_return_capit_jour_nor int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_debt_type = p_debt_type;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_fee = p_strike_fee;
    SET v_order_no = p_order_no;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_debt_intrst_rate = p_debt_intrst_rate;
    SET v_debt_amt = p_debt_amt;
    SET v_debt_qty = p_debt_qty;
    SET v_debt_fee = p_debt_fee;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_interest_update_date = 0;
    SET v_debt_return_date = 0;
    SET v_defer_times = 0;
    SET v_debt_end_date = 0;
    SET v_orign_debt_end_date = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_intrst_base_amt = 0;
    SET v_debt_status = 0;
    SET v_debt_interest = 0;
    SET v_begin_debt_amt = 0;
    SET v_begin_debt_qty = 0;
    SET v_occur_qty = 0;
    SET v_occur_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_curr_row_id = 0;
    SET v_return_capit_jour_nor = 0;

    
    label_pro:BEGIN
    

    /* set @利息积数更改日期#= @初始化日期#; */
    set v_interest_update_date= v_init_date;

    /* set @负债归还日期#= 0; */
    set v_debt_return_date= 0;

    /* set @展期次数#=0; */
    set v_defer_times=0;

    /* set @负债截止日期#= date_format(date_add(NOW(),INTERVAL 6 MONTH),'%Y%m%d'); */
    set v_debt_end_date= date_format(date_add(NOW(),INTERVAL 6 MONTH),'%Y%m%d');

    /* set @原负债截止日期#=@负债截止日期#; */
    set v_orign_debt_end_date=v_debt_end_date;

    /* set @已归还金额#=0; */
    set v_debt_return_amt=0;

    /* set @已归还数量#=0; */
    set v_debt_return_qty=0;

    /* set @归还利息金额#=0; */
    set v_return_interest_amt=0;

    /* set @利息积数#=0; */
    set v_intrst_base_amt=0;

    /* set @负债状态#= 《负债状态-未归还》; */
    set v_debt_status= 1;

    /* set @负债利息#=0; */
    set v_debt_interest=0;

    /* set @期初负债金额#=@负债金额#; */
    set v_begin_debt_amt=v_debt_amt;

    /* set @期初负债数量#=@负债数量#; */
    set v_begin_debt_qty=v_debt_qty;

    /* set @变动数量#=@负债数量#; */
    set v_occur_qty=v_debt_qty;

    /* set  @变动金额#=@负债金额#; */
    set  v_occur_amt=v_debt_amt;

    /* [插入重复更新][产品证券_融资融券_交易组负债明细表][字段][字段变量][{成交数量}={成交数量}+@成交数量#,{成交金额}={成交金额}+@成交金额#,{成交费用}={成交费用}+@成交费用#,{期初负债数量}={期初负债数量}+@期初负债数量#,{期初负债金额}={期初负债金额}+@期初负债金额#,{负债数量}={负债数量}+@负债数量#,{负债金额}={负债金额}+@负债金额#,{负债费用}={负债费用}+@负债费用#][1][@机构编号#,@资产账户编号#,@交易组编号#,@订单编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsecr_exgp_debtdetail (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, opor_no, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, exch_no, stock_acco_no, stock_code_no, 
        stock_code, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_intrst_rate, begin_debt_amt, 
        begin_debt_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, interest_update_date, debt_end_date, orign_debt_end_date, 
        defer_times, debt_return_date, debt_status, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_opor_no, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_pass_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
        v_stock_code, v_stock_type, v_asset_type, v_debt_type, 
        v_strike_qty, v_strike_amt, v_strike_fee, v_order_no, 
        v_report_no, v_order_date, v_order_time, v_order_dir, 
        v_order_price, v_order_qty, v_debt_intrst_rate, v_begin_debt_amt, 
        v_begin_debt_qty, v_debt_amt, v_debt_qty, v_debt_fee, 
        v_debt_interest, v_intrst_base_amt, v_debt_return_amt, v_debt_return_qty, 
        v_return_interest_amt, v_interest_update_date, v_debt_end_date, v_orign_debt_end_date, 
        v_defer_times, v_debt_return_date, v_debt_status, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, strike_qty=strike_qty+v_strike_qty,strike_amt=strike_amt+v_strike_amt,strike_fee=strike_fee+v_strike_fee,begin_debt_qty=begin_debt_qty+v_begin_debt_qty,begin_debt_amt=begin_debt_amt+v_begin_debt_amt,debt_qty=debt_qty+v_debt_qty,debt_amt=debt_amt+v_debt_amt,debt_fee=debt_fee+v_debt_fee;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.22.5.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","订单编号=",v_order_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","订单编号=",v_order_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][产品证券_融资融券_交易组负债明细表][{记录序号}][@当前记录序号#][{订单编号}=@订单编号# and {证券代码编号}=@证券代码编号# and {初始化日期}=@初始化日期#] */
    select row_id into v_curr_row_id from db_pdsecu.tb_pdsecr_exgp_debtdetail where order_no=v_order_no and stock_code_no=v_stock_code_no and init_date=v_init_date limit 1;


    /* set @还款资金流水号#=0; */
    set v_return_capit_jour_nor=0;

    /* 调用【原子_产品证券_融资融券清算接口_新增负债变动流水】*/
    call db_pdsecu.pra_pdsecrlif_InsertDebtOccurJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_code,
        v_stock_type,
        v_asset_type,
        v_debt_type,
        v_order_dir,
        v_occur_qty,
        v_occur_amt,
        v_return_capit_jour_nor,
        v_curr_row_id,
        v_remark_info,
        v_error_code,
        v_error_info,
        v_row_id);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.22.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_新增负债变动流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_回滚清算负债明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_UndoDebtJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_UndoDebtJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_debt_type int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_amt decimal(18,4),
    IN p_curr_row_id bigint,
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
    declare v_debt_type int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_curr_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_order_no int;
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
    SET v_debt_type = p_debt_type;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_amt = p_occur_amt;
    SET v_curr_row_id = p_curr_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_order_no = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

        /* [表记录变量不检验][产品证券_融资融券_交易组负债明细表][{记录序号},{订单编号}][@记录序号#, @订单编号#][{记录序号} = @当前记录序号# and {负债类型}=@负债类型#] */
        select row_id,order_no into v_row_id, v_order_no from db_pdsecu.tb_pdsecr_exgp_debtdetail where row_id = v_curr_row_id and debt_type=v_debt_type limit 1;

        if FOUND_ROWS() = 0 then
            leave label_pro;
        end if;

        /* if @负债类型#=《负债类型-融券》 then */
        if v_debt_type=2 then

            /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债数量}={负债数量}-@变动数量#,{负债金额}={负债金额}-@变动金额#][{记录序号}=@记录序号#][1][@记录序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty=debt_qty-v_occur_qty,debt_amt=debt_amt-v_occur_amt where row_id=v_row_id;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.22.6.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("记录序号=",v_row_id);
                end if;
                leave label_pro;
            end if;


            /* delete from ~产品证券_融资融券_交易组负债明细表^  where {记录序号}=@记录序号# and {负债数量}=0; */
            delete from db_pdsecu.tb_pdsecr_exgp_debtdetail  where row_id=v_row_id and debt_qty=0;

           /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债数量}={负债数量}-@变动数量#,{负债金额}={负债金额}-@变动金额#][{订单编号}=@订单编号# and {初始化日期}=@初始化日期#][1][@订单编号#] */
           set v_update_date = date_format(curdate(),'%Y%m%d');
           set v_update_time = date_format(curtime(),'%H%i%s');
           update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty=debt_qty-v_occur_qty,debt_amt=debt_amt-v_occur_amt where order_no=v_order_no and init_date=v_init_date;
           if v_error_code = "1" then
                       
               SET v_error_code = "pdsecuA.22.6.1";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("订单编号=",v_order_no),"#",v_mysql_message);
               else
                   SET v_error_info = concat("订单编号=",v_order_no);
               end if;
               leave label_pro;
           end if;


           /* delete from ~产品证券_融资融券_资产账户负债明细表^  where  {订单编号}=@订单编号# and {初始化日期}=@初始化日期#  and {负债数量}=0; */
           delete from db_pdsecu.tb_pdsecr_asac_debtdetail  where  order_no=v_order_no and init_date=v_init_date  and debt_qty=0;

        /* elseif @负债类型#=《负债类型-融资》 then */
        elseif v_debt_type=1 then

            /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债数量}={负债数量}-@变动数量#,{负债金额}={负债金额}-@变动金额#][{记录序号}=@记录序号#][1][@记录序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty=debt_qty-v_occur_qty,debt_amt=debt_amt-v_occur_amt where row_id=v_row_id;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.22.6.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("记录序号=",v_row_id);
                end if;
                leave label_pro;
            end if;


            /* delete from ~产品证券_融资融券_交易组负债明细表^  where {记录序号}=@记录序号# and {负债金额}=0; */
            delete from db_pdsecu.tb_pdsecr_exgp_debtdetail  where row_id=v_row_id and debt_amt=0;

           /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债数量}={负债数量}-@变动数量#,{负债金额}={负债金额}-@变动金额#][{订单编号}=@订单编号# and {初始化日期}=@初始化日期#][1][@订单编号#] */
           set v_update_date = date_format(curdate(),'%Y%m%d');
           set v_update_time = date_format(curtime(),'%H%i%s');
           update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_qty=debt_qty-v_occur_qty,debt_amt=debt_amt-v_occur_amt where order_no=v_order_no and init_date=v_init_date;
           if v_error_code = "1" then
                       
               SET v_error_code = "pdsecuA.22.6.1";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("订单编号=",v_order_no),"#",v_mysql_message);
               else
                   SET v_error_info = concat("订单编号=",v_order_no);
               end if;
               leave label_pro;
           end if;


           /* delete from ~产品证券_融资融券_资产账户负债明细表^  where  {订单编号}=@订单编号# and {初始化日期}=@初始化日期#  and {负债金额}=0; */
           delete from db_pdsecu.tb_pdsecr_asac_debtdetail  where  order_no=v_order_no and init_date=v_init_date  and debt_amt=0;
        end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_资产账户还券处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_AsacStockRetuDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_AsacStockRetuDebt(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_debt_type int,
    IN p_order_dir int,
    IN p_return_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_occur_qty decimal(18,2)
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_debt_type int;
    declare v_order_dir int;
    declare v_return_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_occur_qty decimal(18,2);
    declare v_mach_date int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pass_no int;
    declare v_asset_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_order_no int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_debt_intrst_rate decimal(18,12);
    declare v_begin_debt_amt decimal(18,4);
    declare v_begin_debt_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_interest_update_date int;
    declare v_debt_end_date int;
    declare v_orign_debt_end_date int;
    declare v_defer_times int;
    declare v_debt_return_date int;
    declare v_debt_status int;
    declare v_remark_info varchar(255);
    declare v_occur_amt decimal(18,4);
    declare v_amt_ratio decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_debt_type = p_debt_type;
    SET v_order_dir = p_order_dir;
    SET v_return_qty = p_return_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_occur_qty = 0;
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pass_no = 0;
    SET v_asset_type = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_fee = 0;
    SET v_order_no = 0;
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_debt_intrst_rate = 0;
    SET v_begin_debt_amt = 0;
    SET v_begin_debt_qty = 0;
    SET v_debt_amt = 0;
    SET v_debt_qty = 0;
    SET v_debt_fee = 0;
    SET v_debt_interest = 0;
    SET v_intrst_base_amt = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_interest_update_date = 0;
    SET v_debt_end_date = 0;
    SET v_orign_debt_end_date = 0;
    SET v_defer_times = 0;
    SET v_debt_return_date = 0;
    SET v_debt_status = 0;
    SET v_remark_info = " ";
    SET v_occur_amt = 0;
    SET v_amt_ratio = 0;

    
    label_pro:BEGIN
    

     /* [获取机器日期][@机器日期#] */
     select date_format(curdate(),'%Y%m%d') into v_mach_date;

    #还券按负债到期时间从前往后、同一日期的按负债金额从小到大进行归还

    /* [声明游标][产品证券_融资融券_资产账户负债明细表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {资产账户编号}=@资产账户编号# and ({市场编号} = @市场编号#) and ({证券代码编号}=@证券代码编号# ) and {负债类型}=@负债类型#   and {负债状态}<>《负债状态-已归还》   order by {负债截止日期},{期初负债金额},{初始化日期},{记录序号}][cursor_debtjour] */
    cursor_debtjour:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_debtjour CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        pass_no, exch_no, stock_acco_no, stock_code_no, 
        stock_code, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_intrst_rate, begin_debt_amt, 
        begin_debt_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, interest_update_date, debt_end_date, orign_debt_end_date, 
        defer_times, debt_return_date, debt_status, remark_info 
        from db_pdsecu.tb_pdsecr_asac_debtdetail 
        where co_no=v_co_no and pd_no=v_pd_no  and asset_acco_no=v_asset_acco_no and (exch_no = v_exch_no) and (stock_code_no=v_stock_code_no ) and debt_type=v_debt_type   and debt_status<>2   order by debt_end_date,begin_debt_amt,init_date,row_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_debtjour][loop_debtjour] */
    open cursor_debtjour;
    loop_debtjour: LOOP
    fetch cursor_debtjour into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_opor_no, v_co_no, v_pd_no, v_asset_acco_no, 
        v_pass_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
        v_stock_code, v_stock_type, v_asset_type, v_debt_type, 
        v_strike_qty, v_strike_amt, v_strike_fee, v_order_no, 
        v_report_no, v_order_date, v_order_time, v_order_dir, 
        v_order_price, v_order_qty, v_debt_intrst_rate, v_begin_debt_amt, 
        v_begin_debt_qty, v_debt_amt, v_debt_qty, v_debt_fee, 
        v_debt_interest, v_intrst_base_amt, v_debt_return_amt, v_debt_return_qty, 
        v_return_interest_amt, v_interest_update_date, v_debt_end_date, v_orign_debt_end_date, 
        v_defer_times, v_debt_return_date, v_debt_status, v_remark_info;
        IF v_cursor_done THEN
            LEAVE loop_debtjour;
        END IF;


        /* if @归还数量#<= 0 then */
        if v_return_qty<= 0 then
          LEAVE loop_debtjour;
        end if;

       /* set @负债金额#=@负债金额#-@已归还金额#; */
       set v_debt_amt=v_debt_amt-v_debt_return_amt;

       /* set @负债数量#= @负债数量#-@已归还数量#; */
       set v_debt_qty= v_debt_qty-v_debt_return_qty;

      /* set @负债利息#=@负债利息#-@归还利息金额#; */
      set v_debt_interest=v_debt_interest-v_return_interest_amt;
      #还券数量足够,进行本金全部返还，由于当前金额不足可能利息返还造成可用为负

       /* if (@归还数量#  >= @负债数量#)  then */
       if (v_return_qty  >= v_debt_qty)  then

          /* set @负债状态#=《负债状态-已归还》; */
          set v_debt_status=2;

          /* set  @变动数量#=@负债数量#; */
          set  v_occur_qty=v_debt_qty;

          /* set  @变动金额#=@负债金额#; */
          set  v_occur_amt=v_debt_amt;

          /* set @归还利息金额#=@归还利息金额#+@负债利息#; */
          set v_return_interest_amt=v_return_interest_amt+v_debt_interest;
          #set @利息积数#= 0;

          /* set @负债归还日期#= @初始化日期#; */
          set v_debt_return_date= v_init_date;

          /* set @负债利息#= 0; */
          set v_debt_interest= 0;
       else
         #部分还券，金额按比例返还

          /* set @金额比例#= @归还数量#/@负债数量#; */
          set v_amt_ratio= v_return_qty/v_debt_qty;

          /* set  @变动数量#=@归还数量#; */
          set  v_occur_qty=v_return_qty;

          /* set  @变动金额#=@负债金额#*@金额比例#; */
          set  v_occur_amt=v_debt_amt*v_amt_ratio;

          /* set @归还利息金额#=@归还利息金额#+@负债利息#*@金额比例#; */
          set v_return_interest_amt=v_return_interest_amt+v_debt_interest*v_amt_ratio;

          /* set  @负债状态#=《负债状态-未归还》; */
          set  v_debt_status=1;
        end if;

          /* set @已归还金额#= @已归还金额#+@变动金额#; */
          set v_debt_return_amt= v_debt_return_amt+v_occur_amt;

          /* set @已归还数量#= @已归还数量#+@变动数量#; */
          set v_debt_return_qty= v_debt_return_qty+v_occur_qty;

          /* set  @负债数量#= @负债数量#-@变动数量#; */
          set  v_debt_qty= v_debt_qty-v_occur_qty;

          /* set  @负债金额#= @负债金额#-@变动金额#; */
          set  v_debt_amt= v_debt_amt-v_occur_amt;

        /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债状态}=@负债状态#,{已归还金额}=@已归还金额#,{已归还数量}=@已归还数量#,{负债归还日期}=@负债归还日期#,{归还利息金额}=@归还利息金额#][{记录序号}=@记录序号#][1][@记录序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_status=v_debt_status,debt_return_amt=v_debt_return_amt,debt_return_qty=v_debt_return_qty,debt_return_date=v_debt_return_date,return_interest_amt=v_return_interest_amt where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.22.7.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
            end if;
            close cursor_debtjour;
            leave label_pro;
        end if;


        /* set @归还数量#= @归还数量#-@变动数量#; */
        set v_return_qty= v_return_qty-v_occur_qty;

    /* [关闭游标][cursor_debtjour] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_debtjour;
    end cursor_debtjour;


    /* set @变动数量#= @归还数量#; */
    set v_occur_qty= v_return_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_occur_qty = v_occur_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_交易组还券处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_ExgpStockRetuDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_ExgpStockRetuDebt(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_debt_type int,
    IN p_order_dir int,
    IN p_return_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_occur_qty decimal(18,2)
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_debt_type int;
    declare v_order_dir int;
    declare v_return_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_occur_qty decimal(18,2);
    declare v_mach_date int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pass_no int;
    declare v_stock_code varchar(6);
    declare v_asset_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_order_no int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_debt_intrst_rate decimal(18,12);
    declare v_begin_debt_amt decimal(18,4);
    declare v_begin_debt_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_interest_update_date int;
    declare v_debt_end_date int;
    declare v_orign_debt_end_date int;
    declare v_defer_times int;
    declare v_debt_return_date int;
    declare v_debt_status int;
    declare v_remark_info varchar(255);
    declare v_occur_amt decimal(18,4);
    declare v_amt_ratio decimal(18,12);
    declare v_return_capit_jour_nor int;
    declare v_curr_row_id bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_debt_type = p_debt_type;
    SET v_order_dir = p_order_dir;
    SET v_return_qty = p_return_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_occur_qty = 0;
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pass_no = 0;
    SET v_stock_code = " ";
    SET v_asset_type = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_fee = 0;
    SET v_order_no = 0;
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_debt_intrst_rate = 0;
    SET v_begin_debt_amt = 0;
    SET v_begin_debt_qty = 0;
    SET v_debt_amt = 0;
    SET v_debt_qty = 0;
    SET v_debt_fee = 0;
    SET v_debt_interest = 0;
    SET v_intrst_base_amt = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_interest_update_date = 0;
    SET v_debt_end_date = 0;
    SET v_orign_debt_end_date = 0;
    SET v_defer_times = 0;
    SET v_debt_return_date = 0;
    SET v_debt_status = 0;
    SET v_remark_info = " ";
    SET v_occur_amt = 0;
    SET v_amt_ratio = 0;
    SET v_return_capit_jour_nor = 0;
    SET v_curr_row_id = 0;

    
    label_pro:BEGIN
    

     /* [获取机器日期][@机器日期#] */
     select date_format(curdate(),'%Y%m%d') into v_mach_date;

    #还券按负债到期时间从前往后、同一日期的按负债金额从小到大进行归还

    /* [声明游标][产品证券_融资融券_交易组负债明细表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and ({市场编号} = @市场编号# or {市场编号} = 0) and ({证券代码编号}=@证券代码编号# or {证券代码编号} = 0 ) and {负债类型}=@负债类型#   and {负债状态}<>《负债状态-已归还》  order by {负债截止日期},{期初负债金额},{初始化日期},{记录序号}][cursor_debtjour] */
    cursor_debtjour:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_debtjour CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        exch_group_no, pass_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        debt_type, strike_qty, strike_amt, strike_fee, 
        order_no, report_no, order_date, order_time, 
        order_dir, order_price, order_qty, debt_intrst_rate, 
        begin_debt_amt, begin_debt_qty, debt_amt, debt_qty, 
        debt_fee, debt_interest, intrst_base_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt, interest_update_date, debt_end_date, 
        orign_debt_end_date, defer_times, debt_return_date, debt_status, 
        remark_info 
        from db_pdsecu.tb_pdsecr_exgp_debtdetail 
        where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and (exch_no = v_exch_no or exch_no = 0) and (stock_code_no=v_stock_code_no or stock_code_no = 0 ) and debt_type=v_debt_type   and debt_status<>2  order by debt_end_date,begin_debt_amt,init_date,row_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_debtjour][loop_debtjour] */
    open cursor_debtjour;
    loop_debtjour: LOOP
    fetch cursor_debtjour into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_opor_no, v_co_no, v_pd_no, v_asset_acco_no, 
        v_exch_group_no, v_pass_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_stock_type, v_asset_type, 
        v_debt_type, v_strike_qty, v_strike_amt, v_strike_fee, 
        v_order_no, v_report_no, v_order_date, v_order_time, 
        v_order_dir, v_order_price, v_order_qty, v_debt_intrst_rate, 
        v_begin_debt_amt, v_begin_debt_qty, v_debt_amt, v_debt_qty, 
        v_debt_fee, v_debt_interest, v_intrst_base_amt, v_debt_return_amt, 
        v_debt_return_qty, v_return_interest_amt, v_interest_update_date, v_debt_end_date, 
        v_orign_debt_end_date, v_defer_times, v_debt_return_date, v_debt_status, 
        v_remark_info;
        IF v_cursor_done THEN
            LEAVE loop_debtjour;
        END IF;


        /* if @归还数量#<= 0 then */
        if v_return_qty<= 0 then
          LEAVE loop_debtjour;
        end if;

       /* set @负债金额#=@负债金额#-@已归还金额#; */
       set v_debt_amt=v_debt_amt-v_debt_return_amt;

       /* set @负债数量#= @负债数量#-@已归还数量#; */
       set v_debt_qty= v_debt_qty-v_debt_return_qty;

       /* set @负债利息#=@负债利息#-@归还利息金额#; */
       set v_debt_interest=v_debt_interest-v_return_interest_amt;
      #还券数量足够,进行本金全部返还，由于当前金额不足可能利息返还造成可用为负？

       /* if (@归还数量#  >= @负债数量#)  then */
       if (v_return_qty  >= v_debt_qty)  then

          /* set @负债状态#=《负债状态-已归还》; */
          set v_debt_status=2;

          /* set  @变动数量#=@负债数量#; */
          set  v_occur_qty=v_debt_qty;

          /* set  @变动金额#=@负债金额#; */
          set  v_occur_amt=v_debt_amt;

          /* set @归还利息金额#=@归还利息金额#+@负债利息#; */
          set v_return_interest_amt=v_return_interest_amt+v_debt_interest;
          #set @利息积数#= 0;

          /* set @负债归还日期#= @初始化日期#; */
          set v_debt_return_date= v_init_date;

          /* set @负债利息#= 0; */
          set v_debt_interest= 0;
       else
         #部分还券，金额按比例返还

          /* set @金额比例#= @归还数量#/@负债数量#; */
          set v_amt_ratio= v_return_qty/v_debt_qty;

          /* set  @变动数量#=@归还数量#; */
          set  v_occur_qty=v_return_qty;

          /* set  @变动金额#=@负债金额#*@金额比例#; */
          set  v_occur_amt=v_debt_amt*v_amt_ratio;

          /* set  @负债状态#=《负债状态-未归还》; */
          set  v_debt_status=1;

          /* set @归还利息金额#=@归还利息金额#+@负债利息#*@金额比例#; */
          set v_return_interest_amt=v_return_interest_amt+v_debt_interest*v_amt_ratio;
        end if;

          /* set @已归还金额#= @已归还金额#+@变动金额#; */
          set v_debt_return_amt= v_debt_return_amt+v_occur_amt;

          /* set @已归还数量#= @已归还数量#+@变动数量#; */
          set v_debt_return_qty= v_debt_return_qty+v_occur_qty;

          /* set  @负债数量#= @负债数量#-@变动数量#; */
          set  v_debt_qty= v_debt_qty-v_occur_qty;

          /* set  @负债金额#= @负债金额#-@变动金额#; */
          set  v_debt_amt= v_debt_amt-v_occur_amt;

        /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债状态}=@负债状态#,{已归还金额}=@已归还金额#,{已归还数量}=@已归还数量#,{负债归还日期}=@负债归还日期#,{归还利息金额}=@归还利息金额#][{记录序号}=@记录序号#][1][@记录序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_status=v_debt_status,debt_return_amt=v_debt_return_amt,debt_return_qty=v_debt_return_qty,debt_return_date=v_debt_return_date,return_interest_amt=v_return_interest_amt where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.22.8.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
            end if;
            close cursor_debtjour;
            leave label_pro;
        end if;


        /* set @归还数量#= @归还数量#-@变动数量#; */
        set v_return_qty= v_return_qty-v_occur_qty;

        /* set @变动数量#=-@变动数量#; */
        set v_occur_qty=-v_occur_qty;

        /* set @变动金额#=-@变动金额#; */
        set v_occur_amt=-v_occur_amt;

        /* set  @备注信息#="清算还券处理"; */
        set  v_remark_info="清算还券处理";

        /* set @还款资金流水号#=0; */
        set v_return_capit_jour_nor=0;

        /* set @当前记录序号#=@记录序号#; */
        set v_curr_row_id=v_row_id;

        /* 调用【原子_产品证券_融资融券清算接口_新增负债变动流水】*/
        call db_pdsecu.pra_pdsecrlif_InsertDebtOccurJour(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_stock_type,
            v_asset_type,
            v_debt_type,
            v_order_dir,
            v_occur_qty,
            v_occur_amt,
            v_return_capit_jour_nor,
            v_curr_row_id,
            v_remark_info,
            v_error_code,
            v_error_info,
            v_row_id);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuA.22.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_新增负债变动流水出现错误！',v_mysql_message);
            end if;
            close cursor_debtjour;
            leave label_pro;
        elseif v_error_code <> "0" then
            close cursor_debtjour;
            leave label_pro;
        end if;


    /* [关闭游标][cursor_debtjour] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_debtjour;
    end cursor_debtjour;


    /* set @变动数量#= @归还数量#; */
    set v_occur_qty= v_return_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_occur_qty = v_occur_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_资产账户还款处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_AsacCapitRetuDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_AsacCapitRetuDebt(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_debt_type int,
    IN p_return_amt decimal(18,4),
    IN p_order_dir int,
    IN p_fina_return_type int,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_occur_amt decimal(18,4),
    OUT p_total_amt decimal(18,4)
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_debt_type int;
    declare v_return_amt decimal(18,4);
    declare v_order_dir int;
    declare v_fina_return_type int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_occur_amt decimal(18,4);
    declare v_total_amt decimal(18,4);
    declare v_mach_date int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_arrive_date int;
    declare v_oper_remark_info varchar(255);
    declare v_tmp_busi_flag int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pass_no int;
    declare v_stock_code varchar(6);
    declare v_asset_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_order_no int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_debt_intrst_rate decimal(18,12);
    declare v_begin_debt_amt decimal(18,4);
    declare v_begin_debt_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_interest_update_date int;
    declare v_debt_end_date int;
    declare v_orign_debt_end_date int;
    declare v_defer_times int;
    declare v_debt_return_date int;
    declare v_debt_status int;
    declare v_occur_qty decimal(18,2);
    declare v_amt_ratio decimal(18,12);
    declare v_exch_group_no int;
    declare v_busi_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_debt_type = p_debt_type;
    SET v_return_amt = p_return_amt;
    SET v_order_dir = p_order_dir;
    SET v_fina_return_type = p_fina_return_type;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_occur_amt = 0;
    SET v_total_amt = 0;
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_oper_remark_info = " ";
    SET v_tmp_busi_flag = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pass_no = 0;
    SET v_stock_code = " ";
    SET v_asset_type = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_fee = 0;
    SET v_order_no = 0;
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_debt_intrst_rate = 0;
    SET v_begin_debt_amt = 0;
    SET v_begin_debt_qty = 0;
    SET v_debt_amt = 0;
    SET v_debt_qty = 0;
    SET v_debt_fee = 0;
    SET v_debt_interest = 0;
    SET v_intrst_base_amt = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_interest_update_date = 0;
    SET v_debt_end_date = 0;
    SET v_orign_debt_end_date = 0;
    SET v_defer_times = 0;
    SET v_debt_return_date = 0;
    SET v_debt_status = 0;
    SET v_occur_qty = 0;
    SET v_amt_ratio = 0;
    SET v_exch_group_no = 0;
    SET v_busi_flag = 0;

    
    label_pro:BEGIN
    

     /* [获取机器日期][@机器日期#] */
     select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* set @本币币种# = 《本币币种-人民币》; */
    set v_crncy_type = "CNY";

    /* set @交易币种# = 《本币币种-人民币》; */
    set v_exch_crncy_type = "CNY";

    /* set @到账日期#=@初始化日期#; */
    set v_arrive_date=v_init_date;

    /* set @操作备注#=@备注信息#; */
    set v_oper_remark_info=v_remark_info;

    /* set @总金额#=0; */
    set v_total_amt=0;

     /* if @订单方向#=《订单方向-融资买入》 then */
     if v_order_dir=5 then

          /* set @临时_业务标志#=《业务标志-融资借款》; */
          set v_tmp_busi_flag=4001001;

     /* elseif @订单方向#=《订单方向-卖出》   then */
     elseif v_order_dir=2   then

           /* set @临时_业务标志#=《业务标志-卖出还款》; */
           set v_tmp_busi_flag=4001002;

     /* elseif @订单方向#=《订单方向-卖券还款》   then */
     elseif v_order_dir=7   then

           /* set @临时_业务标志#=《业务标志-卖券还款》; */
           set v_tmp_busi_flag=4001003;

     /* elseif @订单方向#=《订单方向-直接还款》   then */
     elseif v_order_dir=14   then

           /* set @临时_业务标志#=《业务标志-直接还款》; */
           set v_tmp_busi_flag=4001004;
      end if;
    #还券按负债到期时间从前往后、同一日期的按负债金额从小到大进行归还

    /* [声明游标][产品证券_融资融券_资产账户负债明细表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {资产账户编号}=@资产账户编号#  and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号# ) and {负债类型}=@负债类型# and {负债状态}<>《负债状态-已归还》  order by {负债截止日期},{负债金额},{订单编号},{记录序号}][cursor_debtjour] */
    cursor_debtjour:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_debtjour CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        pass_no, exch_no, stock_acco_no, stock_code_no, 
        stock_code, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_intrst_rate, begin_debt_amt, 
        begin_debt_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, interest_update_date, debt_end_date, orign_debt_end_date, 
        defer_times, debt_return_date, debt_status, remark_info 
        from db_pdsecu.tb_pdsecr_asac_debtdetail 
        where co_no=v_co_no and pd_no=v_pd_no  and asset_acco_no=v_asset_acco_no  and (v_stock_code_no=0 or stock_code_no=v_stock_code_no ) and debt_type=v_debt_type and debt_status<>2  order by debt_end_date,debt_amt,order_no,row_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_debtjour][loop_debtjour] */
    open cursor_debtjour;
    loop_debtjour: LOOP
    fetch cursor_debtjour into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_opor_no, v_co_no, v_pd_no, v_asset_acco_no, 
        v_pass_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
        v_stock_code, v_stock_type, v_asset_type, v_debt_type, 
        v_strike_qty, v_strike_amt, v_strike_fee, v_order_no, 
        v_report_no, v_order_date, v_order_time, v_order_dir, 
        v_order_price, v_order_qty, v_debt_intrst_rate, v_begin_debt_amt, 
        v_begin_debt_qty, v_debt_amt, v_debt_qty, v_debt_fee, 
        v_debt_interest, v_intrst_base_amt, v_debt_return_amt, v_debt_return_qty, 
        v_return_interest_amt, v_interest_update_date, v_debt_end_date, v_orign_debt_end_date, 
        v_defer_times, v_debt_return_date, v_debt_status, v_remark_info;
        IF v_cursor_done THEN
            LEAVE loop_debtjour;
        END IF;


        /* if @归还金额#<= 0 then */
        if v_return_amt<= 0 then
          LEAVE loop_debtjour;
        end if;

       /* set @变动金额#=0; */
       set v_occur_amt=0;

       /* set @负债金额#=@负债金额#-@已归还金额#; */
       set v_debt_amt=v_debt_amt-v_debt_return_amt;

       /* set @负债数量#= @负债数量#-@已归还数量#; */
       set v_debt_qty= v_debt_qty-v_debt_return_qty;

      /* set @负债利息#=@负债利息#-@归还利息金额#; */
      set v_debt_interest=v_debt_interest-v_return_interest_amt;
      #按照利随本清的方式归还利息

       /* if @负债金额#+@负债利息#>0 then */
       if v_debt_amt+v_debt_interest>0 then

          /* if @归还金额#  >= (@负债金额#+@负债利息#)  then */
          if v_return_amt  >= (v_debt_amt+v_debt_interest)  then

               /* set @负债状态#=《负债状态-已归还》; */
               set v_debt_status=2;

               /* set  @变动数量#=@负债数量#; */
               set  v_occur_qty=v_debt_qty;

               /* set  @变动金额#=@负债金额#+@负债利息#; */
               set  v_occur_amt=v_debt_amt+v_debt_interest;

               /* set @归还利息金额#=@归还利息金额#+@负债利息#; */
               set v_return_interest_amt=v_return_interest_amt+v_debt_interest;
              # set @利息积数#= 0;

               /* set @负债归还日期#= @初始化日期#; */
               set v_debt_return_date= v_init_date;

               /* set @负债利息#= 0; */
               set v_debt_interest= 0;

               /* set @利息积数更改日期#= @初始化日期#; */
               set v_interest_update_date= v_init_date;

               /* set @已归还金额#= @已归还金额#+@负债金额#; */
               set v_debt_return_amt= v_debt_return_amt+v_debt_amt;

               /* set @已归还数量#= @已归还数量#+@负债数量#; */
               set v_debt_return_qty= v_debt_return_qty+v_debt_qty;

               /* set  @负债数量#= 0; */
               set  v_debt_qty= 0;

               /* set  @负债金额#= 0; */
               set  v_debt_amt= 0;
         else
              #部分还款，金额按比例返还,按照利随本清的方式归还利息

              /* set  @金额比例#= @归还金额#/(@负债金额#+@负债利息#); */
              set  v_amt_ratio= v_return_amt/(v_debt_amt+v_debt_interest);

              /* set  @变动数量#=FLOOR(@负债数量#*@金额比例#); */
              set  v_occur_qty=FLOOR(v_debt_qty*v_amt_ratio);

              /* set  @变动金额#=(@负债金额#+@负债利息#)*@金额比例#; */
              set  v_occur_amt=(v_debt_amt+v_debt_interest)*v_amt_ratio;

              /* set  @负债状态#=《负债状态-未归还》; */
              set  v_debt_status=1;

              /* set @归还利息金额#=@归还利息金额#+@负债利息#*@金额比例#; */
              set v_return_interest_amt=v_return_interest_amt+v_debt_interest*v_amt_ratio;

              /* set @已归还金额#= @已归还金额#+@负债金额#*@金额比例#; */
              set v_debt_return_amt= v_debt_return_amt+v_debt_amt*v_amt_ratio;

              /* set @已归还数量#= @已归还数量#+@变动数量#; */
              set v_debt_return_qty= v_debt_return_qty+v_occur_qty;

              /* set  @负债数量#= @负债数量#-@变动数量#; */
              set  v_debt_qty= v_debt_qty-v_occur_qty;

              /* set  @负债金额#= @负债金额#-@负债金额#*@金额比例#; */
              set  v_debt_amt= v_debt_amt-v_debt_amt*v_amt_ratio;

              /* set  @负债利息#=@负债利息#-@负债利息#*@金额比例#; */
              set  v_debt_interest=v_debt_interest-v_debt_interest*v_amt_ratio;
          end if;

          /* [更新表记录][产品证券_融资融券_资产账户负债明细表][{负债状态}=@负债状态#,{已归还金额}=@已归还金额#,{已归还数量}=@已归还数量#,{负债归还日期}=@负债归还日期#,{归还利息金额}=@归还利息金额#,{利息积数}=@利息积数#,{利息积数更改日期}=@利息积数更改日期#][{记录序号}=@记录序号#][1][@记录序号#] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_pdsecu.tb_pdsecr_asac_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_status=v_debt_status,debt_return_amt=v_debt_return_amt,debt_return_qty=v_debt_return_qty,debt_return_date=v_debt_return_date,return_interest_amt=v_return_interest_amt,intrst_base_amt=v_intrst_base_amt,interest_update_date=v_interest_update_date where row_id=v_row_id;
          if v_error_code = "1" then
                      
              SET v_error_code = "pdsecuA.22.9.1";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
              else
                  SET v_error_info = concat("记录序号=",v_row_id);
              end if;
              close cursor_debtjour;
              leave label_pro;
          end if;


           /* set @总金额#= @总金额# +@变动金额#; */
           set v_total_amt= v_total_amt +v_occur_amt;

           /* set @归还金额#= @归还金额#-@变动金额#; */
           set v_return_amt= v_return_amt-v_occur_amt;

           /* set @变动金额#=-@变动金额#; */
           set v_occur_amt=-v_occur_amt;
         #反冲资金，由于入账处理的时候统一全部已经加上了，卖出、卖券还款要先归还同合约的负债，这里要减回来

           /* set @备注信息#=concat(@操作备注#,"  证券代码编号=",@证券代码编号#," 还款金额=",@变动金额#," 资产账户编号=",@资产账户编号#); */
           set v_remark_info=concat(v_oper_remark_info,"  证券代码编号=",v_stock_code_no," 还款金额=",v_occur_amt," 资产账户编号=",v_asset_acco_no);

           /* set @交易组编号#=0; */
           set v_exch_group_no=0;

           /* set @业务标志#=@临时_业务标志#; */
           set v_busi_flag=v_tmp_busi_flag;

           /* if @订单方向#<>《订单方向-直接还款》 then */
           if v_order_dir<>14 then

             /* 调用【原子_产品证券_清算接口_资产账户资金入账】*/
             call db_pdsecu.pra_pdsepubif_AsacCapitalRecorded(
                 v_opor_co_no,
                 v_opor_no,
                 v_oper_mac,
                 v_oper_ip_addr,
                 v_oper_info,
                 v_oper_way,
                 v_func_code,
                 v_init_date,
                 v_co_no,
                 v_pd_no,
                 v_exch_group_no,
                 v_asset_acco_no,
                 v_exch_no,
                 v_busi_flag,
                 v_arrive_date,
                 v_crncy_type,
                 v_exch_crncy_type,
                 v_occur_amt,
                 v_remark_info,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "pdsecuA.22.9.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_资产账户资金入账出现错误！',v_mysql_message);
                 end if;
                 close cursor_debtjour;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 close cursor_debtjour;
                 leave label_pro;
             end if;

           end if;
       end if;

    /* [关闭游标][cursor_debtjour] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_debtjour;
    end cursor_debtjour;


    /* set @变动金额#= @归还金额#; */
    set v_occur_amt= v_return_amt;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_occur_amt = v_occur_amt;
    SET p_total_amt = v_total_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_交易组还款处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_ExgpCapitRetuDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_ExgpCapitRetuDebt(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_debt_type int,
    IN p_return_amt decimal(18,4),
    IN p_order_dir int,
    IN p_fina_return_type int,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_occur_amt decimal(18,4),
    OUT p_total_amt decimal(18,4)
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_debt_type int;
    declare v_return_amt decimal(18,4);
    declare v_order_dir int;
    declare v_fina_return_type int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_occur_amt decimal(18,4);
    declare v_total_amt decimal(18,4);
    declare v_mach_date int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_arrive_date int;
    declare v_oper_remark_info varchar(255);
    declare v_tmp_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pass_no int;
    declare v_stock_code varchar(6);
    declare v_asset_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_order_no int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_debt_intrst_rate decimal(18,12);
    declare v_begin_debt_amt decimal(18,4);
    declare v_begin_debt_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_fee decimal(18,4);
    declare v_debt_interest decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_interest_update_date int;
    declare v_debt_end_date int;
    declare v_orign_debt_end_date int;
    declare v_defer_times int;
    declare v_debt_return_date int;
    declare v_debt_status int;
    declare v_occur_qty decimal(18,2);
    declare v_amt_ratio decimal(18,12);
    declare v_busi_flag int;
    declare v_curr_row_id bigint;
    declare v_entry_money_jour_no bigint;
    declare v_return_capit_jour_nor int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_debt_type = p_debt_type;
    SET v_return_amt = p_return_amt;
    SET v_order_dir = p_order_dir;
    SET v_fina_return_type = p_fina_return_type;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_occur_amt = 0;
    SET v_total_amt = 0;
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_oper_remark_info = " ";
    SET v_tmp_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pass_no = 0;
    SET v_stock_code = " ";
    SET v_asset_type = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_fee = 0;
    SET v_order_no = 0;
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_debt_intrst_rate = 0;
    SET v_begin_debt_amt = 0;
    SET v_begin_debt_qty = 0;
    SET v_debt_amt = 0;
    SET v_debt_qty = 0;
    SET v_debt_fee = 0;
    SET v_debt_interest = 0;
    SET v_intrst_base_amt = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_interest_update_date = 0;
    SET v_debt_end_date = 0;
    SET v_orign_debt_end_date = 0;
    SET v_defer_times = 0;
    SET v_debt_return_date = 0;
    SET v_debt_status = 0;
    SET v_occur_qty = 0;
    SET v_amt_ratio = 0;
    SET v_busi_flag = 0;
    SET v_curr_row_id = 0;
    SET v_entry_money_jour_no = 0;
    SET v_return_capit_jour_nor = 0;

    
    label_pro:BEGIN
    

     /* [获取机器日期][@机器日期#] */
     select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* set @本币币种# = 《本币币种-人民币》; */
    set v_crncy_type = "CNY";

    /* set @交易币种# = 《本币币种-人民币》; */
    set v_exch_crncy_type = "CNY";

    /* set @到账日期#=@初始化日期#; */
    set v_arrive_date=v_init_date;

    /* set @操作备注#=@备注信息#; */
    set v_oper_remark_info=v_remark_info;

     /* if @订单方向#=《订单方向-融资买入》  then */
     if v_order_dir=5  then

          /* set @临时_业务标志#=《业务标志-融资借款》; */
          set v_tmp_busi_flag=4001001;

     /* elseif @订单方向#=《订单方向-卖出》   then */
     elseif v_order_dir=2   then

           /* set @临时_业务标志#=《业务标志-卖出还款》; */
           set v_tmp_busi_flag=4001002;

     /* elseif @订单方向#=《订单方向-卖券还款》   then */
     elseif v_order_dir=7   then

           /* set @临时_业务标志#=《业务标志-卖券还款》; */
           set v_tmp_busi_flag=4001003;

     /* elseif @订单方向#=《订单方向-直接还款》   then */
     elseif v_order_dir=14   then

           /* set @临时_业务标志#=《业务标志-直接还款》; */
           set v_tmp_busi_flag=4001004;
      end if;

    /* set @总金额#=0; */
    set v_total_amt=0;

    /* set @入账状态# = 《入账状态-已入账》; */
    set v_entry_status = "1";
    #还券按负债到期时间从前往后、同一日期的按负债金额从小到大进行归还

    /* [声明游标][产品证券_融资融券_交易组负债明细表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {资产账户编号}=@资产账户编号#  and {交易组编号}=@交易组编号#  and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号# ) and {负债类型}=@负债类型# and {负债状态}<>《负债状态-已归还》  order by {负债截止日期},{负债金额},{订单编号},{记录序号}][cursor_debtjour] */
    cursor_debtjour:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_debtjour CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        exch_group_no, pass_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        debt_type, strike_qty, strike_amt, strike_fee, 
        order_no, report_no, order_date, order_time, 
        order_dir, order_price, order_qty, debt_intrst_rate, 
        begin_debt_amt, begin_debt_qty, debt_amt, debt_qty, 
        debt_fee, debt_interest, intrst_base_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt, interest_update_date, debt_end_date, 
        orign_debt_end_date, defer_times, debt_return_date, debt_status, 
        remark_info 
        from db_pdsecu.tb_pdsecr_exgp_debtdetail 
        where co_no=v_co_no and pd_no=v_pd_no  and asset_acco_no=v_asset_acco_no  and exch_group_no=v_exch_group_no  and (v_stock_code_no=0 or stock_code_no=v_stock_code_no ) and debt_type=v_debt_type and debt_status<>2  order by debt_end_date,debt_amt,order_no,row_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_debtjour][loop_debtjour] */
    open cursor_debtjour;
    loop_debtjour: LOOP
    fetch cursor_debtjour into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_opor_no, v_co_no, v_pd_no, v_asset_acco_no, 
        v_exch_group_no, v_pass_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_stock_type, v_asset_type, 
        v_debt_type, v_strike_qty, v_strike_amt, v_strike_fee, 
        v_order_no, v_report_no, v_order_date, v_order_time, 
        v_order_dir, v_order_price, v_order_qty, v_debt_intrst_rate, 
        v_begin_debt_amt, v_begin_debt_qty, v_debt_amt, v_debt_qty, 
        v_debt_fee, v_debt_interest, v_intrst_base_amt, v_debt_return_amt, 
        v_debt_return_qty, v_return_interest_amt, v_interest_update_date, v_debt_end_date, 
        v_orign_debt_end_date, v_defer_times, v_debt_return_date, v_debt_status, 
        v_remark_info;
        IF v_cursor_done THEN
            LEAVE loop_debtjour;
        END IF;


        /* if @归还金额#<= 0 then */
        if v_return_amt<= 0 then
          LEAVE loop_debtjour;
        end if;

       /* set @变动金额#=0; */
       set v_occur_amt=0;

       /* set @负债金额#=@负债金额#-@已归还金额#; */
       set v_debt_amt=v_debt_amt-v_debt_return_amt;

       /* set @负债数量#= @负债数量#-@已归还数量#; */
       set v_debt_qty= v_debt_qty-v_debt_return_qty;

      /* set @负债利息#=@负债利息#-@归还利息金额#; */
      set v_debt_interest=v_debt_interest-v_return_interest_amt;
      #按照利随本清的方式归还利息

       /* if @负债金额#+@负债利息#>0 then */
       if v_debt_amt+v_debt_interest>0 then

          /* if @归还金额#  >= (@负债金额#+@负债利息#)  then */
          if v_return_amt  >= (v_debt_amt+v_debt_interest)  then

               /* set @负债状态#=《负债状态-已归还》; */
               set v_debt_status=2;

               /* set  @变动数量#=@负债数量#; */
               set  v_occur_qty=v_debt_qty;

               /* set  @变动金额#=@负债金额#+@负债利息#; */
               set  v_occur_amt=v_debt_amt+v_debt_interest;

               /* set @归还利息金额#=@归还利息金额#+@负债利息#; */
               set v_return_interest_amt=v_return_interest_amt+v_debt_interest;
            #   set @利息积数#= 0;

               /* set @负债归还日期#= @初始化日期#; */
               set v_debt_return_date= v_init_date;

               /* set @负债利息#= 0; */
               set v_debt_interest= 0;

               /* set @利息积数更改日期#= @初始化日期#; */
               set v_interest_update_date= v_init_date;

               /* set @已归还金额#= @已归还金额#+@负债金额#; */
               set v_debt_return_amt= v_debt_return_amt+v_debt_amt;

               /* set @已归还数量#= @已归还数量#+@负债数量#; */
               set v_debt_return_qty= v_debt_return_qty+v_debt_qty;

               /* set  @负债数量#= 0; */
               set  v_debt_qty= 0;

               /* set  @负债金额#= 0; */
               set  v_debt_amt= 0;
         else
              #部分还款，金额按比例返还,按照利随本清的方式归还利息

              /* set  @金额比例#= @归还金额#/(@负债金额#+@负债利息#); */
              set  v_amt_ratio= v_return_amt/(v_debt_amt+v_debt_interest);

              /* set  @变动数量#=FLOOR(@负债数量#*@金额比例#); */
              set  v_occur_qty=FLOOR(v_debt_qty*v_amt_ratio);

              /* set  @变动金额#=(@负债金额#+@负债利息#)*@金额比例#; */
              set  v_occur_amt=(v_debt_amt+v_debt_interest)*v_amt_ratio;

              /* set  @负债状态#=《负债状态-未归还》; */
              set  v_debt_status=1;

              /* set @归还利息金额#=@归还利息金额#+@负债利息#*@金额比例#; */
              set v_return_interest_amt=v_return_interest_amt+v_debt_interest*v_amt_ratio;

              /* set @已归还金额#= @已归还金额#+@负债金额#*@金额比例#; */
              set v_debt_return_amt= v_debt_return_amt+v_debt_amt*v_amt_ratio;

              /* set @已归还数量#= @已归还数量#+@变动数量#; */
              set v_debt_return_qty= v_debt_return_qty+v_occur_qty;

              /* set  @负债数量#= @负债数量#-@变动数量#; */
              set  v_debt_qty= v_debt_qty-v_occur_qty;

              /* set  @负债金额#= @负债金额#-@负债金额#*@金额比例#; */
              set  v_debt_amt= v_debt_amt-v_debt_amt*v_amt_ratio;

              /* set  @负债利息#=@负债利息#-@负债利息#*@金额比例#; */
              set  v_debt_interest=v_debt_interest-v_debt_interest*v_amt_ratio;
          end if;

          /* [更新表记录][产品证券_融资融券_交易组负债明细表][{负债状态}=@负债状态#,{已归还金额}=@已归还金额#,{已归还数量}=@已归还数量#,{负债归还日期}=@负债归还日期#,{归还利息金额}=@归还利息金额#,{利息积数}=@利息积数#,{利息积数更改日期}=@利息积数更改日期#][{记录序号}=@记录序号#][1][@记录序号#] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_pdsecu.tb_pdsecr_exgp_debtdetail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, debt_status=v_debt_status,debt_return_amt=v_debt_return_amt,debt_return_qty=v_debt_return_qty,debt_return_date=v_debt_return_date,return_interest_amt=v_return_interest_amt,intrst_base_amt=v_intrst_base_amt,interest_update_date=v_interest_update_date where row_id=v_row_id;
          if v_error_code = "1" then
                      
              SET v_error_code = "pdsecuA.22.10.1";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
              else
                  SET v_error_info = concat("记录序号=",v_row_id);
              end if;
              close cursor_debtjour;
              leave label_pro;
          end if;


           /* set @总金额# = @总金额# + @变动金额#; */
           set v_total_amt = v_total_amt + v_occur_amt;

           /* set @归还金额#= @归还金额#-@变动金额#; */
           set v_return_amt= v_return_amt-v_occur_amt;

           /* set @变动金额#=-@变动金额#; */
           set v_occur_amt=-v_occur_amt;

           /* set  @变动数量#=-@变动数量#; */
           set  v_occur_qty=-v_occur_qty;

         /* if @订单方向#<>《订单方向-直接还款》 then */
         if v_order_dir<>14 then
         #反冲资金，由于入账处理的时候统一全部已经加上了，卖出、卖券还款要先归还同合约的负债，这里要减回来

           /* set @备注信息#=concat(@操作备注#,"  证券代码编号=",@证券代码编号#," 还款金额=",@变动金额#," 交易组编号=",@交易组编号#," 资产账户编号=",@资产账户编号#); */
           set v_remark_info=concat(v_oper_remark_info,"  证券代码编号=",v_stock_code_no," 还款金额=",v_occur_amt," 交易组编号=",v_exch_group_no," 资产账户编号=",v_asset_acco_no);

           /* set @业务标志#=@临时_业务标志#; */
           set v_busi_flag=v_tmp_busi_flag;

           /* set @当前记录序号#=@记录序号#; */
           set v_curr_row_id=v_row_id;

           /* 调用【原子_产品证券_清算接口_交易组资金入账】*/
           call db_pdsecu.pra_pdsepubif_ExgpCapitalRecorded(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_init_date,
               v_co_no,
               v_pd_no,
               v_asset_acco_no,
               v_exch_group_no,
               v_exch_no,
               v_busi_flag,
               v_crncy_type,
               v_exch_crncy_type,
               v_occur_amt,
               v_arrive_date,
               v_remark_info,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "pdsecuA.22.10.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_交易组资金入账出现错误！',v_mysql_message);
               end if;
               close cursor_debtjour;
               leave label_pro;
           elseif v_error_code <> "0" then
               close cursor_debtjour;
               leave label_pro;
           end if;


           /* 调用【原子_产品证券_清算接口_新增资金入账流水】*/
           call db_pdsecu.pra_pdsepubif_InsertCapitalEntryJour(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_init_date,
               v_co_no,
               v_pd_no,
               v_exch_group_no,
               v_asset_acco_no,
               v_exch_no,
               v_crncy_type,
               v_exch_crncy_type,
               v_busi_flag,
               v_occur_amt,
               v_arrive_date,
               v_order_no,
               v_entry_status,
               v_error_code,
               v_error_info,
               v_entry_money_jour_no);
           if v_error_code = "1" then
               SET v_error_code = "pdsecuA.22.10.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_新增资金入账流水出现错误！',v_mysql_message);
               end if;
               close cursor_debtjour;
               leave label_pro;
           elseif v_error_code <> "0" then
               close cursor_debtjour;
               leave label_pro;
           end if;


            /* set @还款资金流水号# = @入账资金流水号#; */
            set v_return_capit_jour_nor = v_entry_money_jour_no;
         end if;

           /* 调用【原子_产品证券_融资融券清算接口_新增负债变动流水】*/
           call db_pdsecu.pra_pdsecrlif_InsertDebtOccurJour(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_init_date,
               v_co_no,
               v_pd_no,
               v_exch_group_no,
               v_asset_acco_no,
               v_exch_no,
               v_stock_acco_no,
               v_stock_code_no,
               v_stock_code,
               v_stock_type,
               v_asset_type,
               v_debt_type,
               v_order_dir,
               v_occur_qty,
               v_occur_amt,
               v_return_capit_jour_nor,
               v_curr_row_id,
               v_remark_info,
               v_error_code,
               v_error_info,
               v_row_id);
           if v_error_code = "1" then
               SET v_error_code = "pdsecuA.22.10.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_新增负债变动流水出现错误！',v_mysql_message);
               end if;
               close cursor_debtjour;
               leave label_pro;
           elseif v_error_code <> "0" then
               close cursor_debtjour;
               leave label_pro;
           end if;

       end if;

    /* [关闭游标][cursor_debtjour] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_debtjour;
    end cursor_debtjour;


    /* set @变动金额#= @归还金额#; */
    set v_occur_amt= v_return_amt;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_occur_amt = v_occur_amt;
    SET p_total_amt = v_total_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_融券卖出所得资金更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_UpdateLoanCapitalDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_UpdateLoanCapitalDebt(
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
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_occur_amt decimal(18,4),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
    declare v_crncy_type varchar(3);
    declare v_entry_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_crncy_type = "CNY";
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;

    /* set @本币币种#=《本币币种-人民币》; */
    set v_crncy_type="CNY";
    #处理交易组资金入账

    /* 调用【原子_产品证券_融资融券清算接口_更新资产账户融券卖出所得资金】*/
    call db_pdsecu.pra_pdsecrlif_UpdateAsacCapitalLoan(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_crncy_type,
        v_occur_amt,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.22.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_更新资产账户融券卖出所得资金出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #处理资产账户资金入账

    /* 调用【原子_产品证券_融资融券清算接口_更新交易组融券卖出所得资金】*/
    call db_pdsecu.pra_pdsecrlif_UpdateExgpCapitalLoan(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_crncy_type,
        v_occur_amt,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.22.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_更新交易组融券卖出所得资金出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @入账状态# = 《入账状态-已入账》; */
    set v_entry_status = "1";
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_更新资产账户融券卖出所得资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_UpdateAsacCapitalLoan;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_UpdateAsacCapitalLoan(
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
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_menu_no int;
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_pre_settle_amt decimal(18,4);
    declare v_loan_sell_amt decimal(18,4);
    declare v_debt_type int;
    declare v_begin_amt decimal(18,4);
    declare v_debt_interest_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_menu_no = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_remark_info = " ";
    SET v_pre_settle_amt = 0;
    SET v_loan_sell_amt = 0;
    SET v_debt_type = 0;
    SET v_begin_amt = 0;
    SET v_debt_interest_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* set @操作菜单# =0; */
    set v_oper_menu_no =0;

    /* set @变动后金额# = 0; */
    set v_occur_end_amt = 0;

    /* set @操作备注# = @备注信息#; */
    set v_oper_remark_info = v_remark_info;

    /* set @待交收金额# = 0; */
    set v_pre_settle_amt = 0;

    /* set @融券卖出金额# = @变动金额#; */
    set v_loan_sell_amt = v_occur_amt;
    #处理资产账户资金入账

    /* set @负债类型#=《负债类型-融券》; */
    set v_debt_type=2;

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @负债利息金额# = 0; */
    set v_debt_interest_amt = 0;

    /* set @负债类型#=《负债类型-融券》; */
    set v_debt_type=2;

    /* [插入重复更新][产品证券_融资融券_资产账户资金负债表][字段][字段变量][{融券卖出金额}={融券卖出金额}+@变动金额#][2][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsecr_asac_capitdebt (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, begin_amt, loan_sell_amt, 
        debt_interest_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_crncy_type, v_begin_amt, v_loan_sell_amt, 
        v_debt_interest_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, loan_sell_amt=loan_sell_amt+v_occur_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.22.12.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_融资融券_资产账户资金负债表][字段][字段变量][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        loan_sell_amt, debt_interest_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_crncy_type, v_begin_amt, 
        v_loan_sell_amt, v_debt_interest_amt from db_pdsecu.tb_pdsecr_asac_capitdebt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.22.12.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    #负的或者没有负债的要更新为0

     /* [更新表记录][产品证券_融资融券_资产账户资金负债表][{融券卖出金额}=0 ][{记录序号}=@记录序号# and ({融券卖出金额}<0 or {资产账户编号} not in (select  {资产账户编号}  from ~产品证券_融资融券_资产账户负债明细表^ where {机构编号}=@机构编号# and {资产账户编号}=@资产账户编号# and {负债类型}=@负债类型# and {负债状态}<>《负债状态-已归还》 ))][1][@记录序号#] */
     set v_update_date = date_format(curdate(),'%Y%m%d');
     set v_update_time = date_format(curtime(),'%H%i%s');
     update db_pdsecu.tb_pdsecr_asac_capitdebt set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, loan_sell_amt=0  where row_id=v_row_id and (loan_sell_amt<0 or asset_acco_no not in (select  asset_acco_no  from db_pdsecu.tb_pdsecr_asac_debtdetail where co_no=v_co_no and asset_acco_no=v_asset_acco_no and debt_type=v_debt_type and debt_status<>2 ));
     if v_error_code = "1" then
                 
         SET v_error_code = "pdsecuA.22.12.1";
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

# 原子_产品证券_融资融券清算接口_更新交易组融券卖出所得资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_UpdateExgpCapitalLoan;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_UpdateExgpCapitalLoan(
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
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_menu_no int;
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_pre_settle_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_loan_sell_amt decimal(18,4);
    declare v_debt_type int;
    declare v_begin_amt decimal(18,4);
    declare v_debt_interest_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_oper_func_code varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_menu_no = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_remark_info = " ";
    SET v_pre_settle_amt = 0;
    SET v_curr_amt = 0;
    SET v_loan_sell_amt = 0;
    SET v_debt_type = 0;
    SET v_begin_amt = 0;
    SET v_debt_interest_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @操作菜单# =0; */
    set v_oper_menu_no =0;

    /* set @变动后金额# = 0; */
    set v_occur_end_amt = 0;

    /* set @操作备注# = @备注信息#; */
    set v_oper_remark_info = v_remark_info;

    /* set @待交收金额# = 0; */
    set v_pre_settle_amt = 0;

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;

    /* set @融券卖出金额# = @变动金额#; */
    set v_loan_sell_amt = v_occur_amt;
    #处理交易组资金入账

    /* set @负债类型#=《负债类型-融券》; */
    set v_debt_type=2;

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @负债利息金额# = 0; */
    set v_debt_interest_amt = 0;

    /* [插入重复更新][产品证券_融资融券_交易组资金负债表][字段][字段变量][{融券卖出金额}={融券卖出金额}+@变动金额#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsecr_exgp_capitdebt (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, crncy_type, begin_amt, 
        loan_sell_amt, debt_interest_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
        v_loan_sell_amt, v_debt_interest_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, loan_sell_amt=loan_sell_amt+v_occur_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.22.13.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_融资融券_交易组资金负债表][字段][字段变量][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, loan_sell_amt, debt_interest_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
        v_begin_amt, v_loan_sell_amt, v_debt_interest_amt from db_pdsecu.tb_pdsecr_exgp_capitdebt where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.22.13.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    #负的或者没有负债的要更新为0

     /* [更新表记录][产品证券_融资融券_交易组资金负债表][{融券卖出金额}=0 ][{记录序号}=@记录序号# and ({融券卖出金额}<0 or {交易组编号} not in (select {交易组编号} from ~产品证券_融资融券_交易组负债明细表^ where {机构编号}=@机构编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号#   and {负债类型}=@负债类型# and {负债状态} <>《负债状态-已归还》 ))][1][@记录序号#] */
     set v_update_date = date_format(curdate(),'%Y%m%d');
     set v_update_time = date_format(curtime(),'%H%i%s');
     update db_pdsecu.tb_pdsecr_exgp_capitdebt set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, loan_sell_amt=0  where row_id=v_row_id and (loan_sell_amt<0 or exch_group_no not in (select exch_group_no from db_pdsecu.tb_pdsecr_exgp_debtdetail where co_no=v_co_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no   and debt_type=v_debt_type and debt_status <>2 ));
     if v_error_code = "1" then
                 
         SET v_error_code = "pdsecuA.22.13.1";
         if v_mysql_message <> "" then
             SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
         else
             SET v_error_info = concat("记录序号=",v_row_id);
         end if;
         leave label_pro;
     end if;


    /* set @变动后金额# = @融券卖出金额#; */
    set v_occur_end_amt = v_loan_sell_amt;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_持仓负债入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_PosiDebtRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_PosiDebtRecorded(
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
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_debt_type int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_amt decimal(18,4),
    IN p_busi_flag int,
    IN p_arrive_date int,
    IN p_order_no int,
    IN p_entry_oper int,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_posi_debt_jour_no int
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_arrive_date int;
    declare v_order_no int;
    declare v_entry_oper int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_posi_debt_jour_no int;
    declare v_begin_trade_date int;
    declare v_entry_status varchar(2);
    declare v_debt_interest_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_debt_type = p_debt_type;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_amt = p_occur_amt;
    SET v_busi_flag = p_busi_flag;
    SET v_arrive_date = p_arrive_date;
    SET v_order_no = p_order_no;
    SET v_entry_oper = p_entry_oper;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_posi_debt_jour_no = 0;
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_entry_status = "0";
    SET v_debt_interest_amt = 0;

    
    label_pro:BEGIN
    

    /* set @上市日期# = @到账日期#; */
    set v_begin_trade_date = v_arrive_date;

    /* set @入账状态# = 《入账状态-已入账》; */
    set v_entry_status = "1";
    #处理交易组持仓入账

    /* 调用【原子_产品证券_融资融券清算接口_交易组持仓负债入账】*/
    call db_pdsecu.pra_pdsecrlif_ExgpPosiDebtRecorded(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_arrive_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_code,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_debt_type,
        v_occur_qty,
        v_occur_amt,
        v_busi_flag,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.22.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_交易组持仓负债入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #处理资产账户持仓入账

    /* 调用【原子_产品证券_融资融券清算接口_资产账户持仓负债入账】*/
    call db_pdsecu.pra_pdsecrlif_AsacPosiDebtRecorded(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_arrive_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_stock_code,
        v_stock_type,
        v_asset_type,
        v_debt_type,
        v_occur_qty,
        v_occur_amt,
        v_busi_flag,
        v_remark_info,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuA.22.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_资产账户持仓负债入账出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @负债利息金额# = 0; */
    set v_debt_interest_amt = 0;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_posi_debt_jour_no = v_entry_posi_debt_jour_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_交易组持仓负债入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_ExgpPosiDebtRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_ExgpPosiDebtRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_arrive_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_debt_type int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_amt decimal(18,4),
    IN p_busi_flag int,
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
    declare v_init_date int;
    declare v_arrive_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_menu_no int;
    declare v_occur_end_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_invest_type int;
    declare v_begin_debt_qty decimal(18,2);
    declare v_begin_debt_amt decimal(18,4);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_debt_interest_amt decimal(18,4);
    declare v_curr_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_curr_debt_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_arrive_date = p_arrive_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_debt_type = p_debt_type;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_amt = p_occur_amt;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_menu_no = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_remark_info = " ";
    SET v_invest_type = 0;
    SET v_begin_debt_qty = 0;
    SET v_begin_debt_amt = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_debt_interest_amt = 0;
    SET v_curr_qty = 0;
    SET v_cost_amt = 0;
    SET v_curr_debt_qty = 0;

    
    label_pro:BEGIN
    

    /* set @操作菜单# =0; */
    set v_oper_menu_no =0;

    /* set @变动后数量# = 0; */
    set v_occur_end_qty = 0;

    /* set @操作备注# = @备注信息#; */
    set v_oper_remark_info = v_remark_info;

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @期初负债数量# = 0; */
    set v_begin_debt_qty = 0;

    /* set @期初负债金额# = 0; */
    set v_begin_debt_amt = 0;

    /* set @持仓核对差额#= 0; */
    set v_posi_qty_check_diff= 0;

    /* set @负债利息金额#= 0; */
    set v_debt_interest_amt= 0;

    /* set @当前数量# = @变动数量#; */
    set v_curr_qty = v_occur_qty;

    /* set @成本金额#=@变动金额#; */
    set v_cost_amt=v_occur_amt;

    /* set @当前负债数量# = @变动数量#; */
    set v_curr_debt_qty = v_occur_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_资产账户持仓负债入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_AsacPosiDebtRecorded;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_AsacPosiDebtRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_arrive_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_debt_type int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_amt decimal(18,4),
    IN p_busi_flag int,
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
    declare v_init_date int;
    declare v_arrive_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_menu_no int;
    declare v_occur_end_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_invest_type int;
    declare v_begin_debt_qty decimal(18,2);
    declare v_begin_debt_amt decimal(18,4);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_debt_interest_amt decimal(18,4);
    declare v_curr_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_curr_debt_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_arrive_date = p_arrive_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_debt_type = p_debt_type;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_amt = p_occur_amt;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_menu_no = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_remark_info = " ";
    SET v_invest_type = 0;
    SET v_begin_debt_qty = 0;
    SET v_begin_debt_amt = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_debt_interest_amt = 0;
    SET v_curr_qty = 0;
    SET v_cost_amt = 0;
    SET v_curr_debt_qty = 0;

    
    label_pro:BEGIN
    

    /* set @操作菜单# =0; */
    set v_oper_menu_no =0;

    /* set @变动后数量# = 0; */
    set v_occur_end_qty = 0;

    /* set @操作备注# = @备注信息#; */
    set v_oper_remark_info = v_remark_info;

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @期初负债数量# = 0; */
    set v_begin_debt_qty = 0;

    /* set @期初负债金额# = 0; */
    set v_begin_debt_amt = 0;

    /* set @持仓核对差额#= 0; */
    set v_posi_qty_check_diff= 0;

    /* set @负债利息金额#= 0; */
    set v_debt_interest_amt= 0;

    /* set @当前数量# = @变动数量#; */
    set v_curr_qty = v_occur_qty;

    /* set @成本金额#=@变动金额#; */
    set v_cost_amt=v_occur_amt;

    /* set @当前负债数量# = @变动数量#; */
    set v_curr_debt_qty = v_occur_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_汇总交易组持仓负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_UpdateSumExgpPosiDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_UpdateSumExgpPosiDebt(
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
    declare v_mach_date int;
    declare v_begin_debt_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_begin_debt_amt decimal(18,4);
    declare v_invest_type int;
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_table_name varchar(64);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_interest decimal(18,4);
    declare v_curr_debt_amt decimal(18,4);
    declare v_curr_debt_qty decimal(18,2);
    declare v_debt_interest_amt decimal(18,4);
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_debt_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_begin_debt_amt = 0;
    SET v_invest_type = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_table_name = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_debt_type = 0;
    SET v_debt_amt = 0;
    SET v_debt_qty = 0;
    SET v_debt_interest = 0;
    SET v_curr_debt_amt = 0;
    SET v_curr_debt_qty = 0;
    SET v_debt_interest_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

     /* [获取机器日期][@机器日期#] */
     select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* set @期初负债数量#=0; */
    set v_begin_debt_qty=0;

    /* set @持仓核对差额#=0; */
    set v_posi_qty_check_diff=0;

    /* set @期初负债金额#=0; */
    set v_begin_debt_amt=0;

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set  @已归还金额#=0; */
    set  v_debt_return_amt=0;

    /* set  @已归还数量#=0; */
    set  v_debt_return_qty=0;

    /* set  @归还利息金额#=0; */
    set  v_return_interest_amt=0;
    #[更新表记录][产品证券_融资融券_交易组持仓负债表][{当前负债金额}=0,{当前负债数量}=0,{已归还金额}=0,{已归还数量}=0,{}][1=1][1][@期初负债数量#]

    /* set @数据表名称# = "~产品证券_融资融券_交易组持仓负债表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_exgp_posidebt";

    /* [删除表记录][产品证券_融资融券_交易组持仓负债表][1=1][3][@数据表名称#] */
    delete from db_pdsecu.tb_pdsecr_exgp_posidebt 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.22.24.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [声明游标][产品证券_融资融券_交易组负债明细表][{机构编号},{产品编号},{资产账户编号},{交易组编号},{市场编号},{证券代码编号},{股东代码编号},{证券代码},{证券类型},{资产类型},{负债类型},sum({负债金额}) as {负债金额},sum({负债数量}) as {负债数量},sum({负债利息}) as {负债利息},sum({已归还金额}) as {已归还金额},sum({已归还数量}) as {已归还数量},sum({归还利息金额}) as {归还利息金额} ][{负债状态}<>《负债状态-已归还》 group by {机构编号},{产品编号},{资产账户编号},{交易组编号},{市场编号},{证券代码编号},{股东代码编号},{负债类型}][cursor_debtjour] */
    cursor_debtjour:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_debtjour CURSOR FOR
        select co_no,pd_no,asset_acco_no,exch_group_no,exch_no,stock_code_no,stock_acco_no,stock_code,stock_type,asset_type,debt_type,sum(debt_amt) as debt_amt,sum(debt_qty) as debt_qty,sum(debt_interest) as debt_interest,sum(debt_return_amt) as debt_return_amt,sum(debt_return_qty) as debt_return_qty,sum(return_interest_amt) as return_interest_amt  
        from db_pdsecu.tb_pdsecr_exgp_debtdetail 
        where debt_status<>2 group by co_no,pd_no,asset_acco_no,exch_group_no,exch_no,stock_code_no,stock_acco_no,debt_type;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@机构编号#,@产品编号#,@资产账户编号#,@交易组编号#,@市场编号#,@证券代码编号#,@股东代码编号#,@证券代码#,@证券类型#,@资产类型#,@负债类型#,@负债金额#,@负债数量# ,@负债利息#,@已归还金额#,@已归还数量#,@归还利息金额#][cursor_debtjour][loop_debtjour] */
    open cursor_debtjour;
    loop_debtjour: LOOP
    fetch cursor_debtjour into v_co_no,v_pd_no,v_asset_acco_no,v_exch_group_no,v_exch_no,v_stock_code_no,v_stock_acco_no,v_stock_code,v_stock_type,v_asset_type,v_debt_type,v_debt_amt,v_debt_qty ,v_debt_interest,v_debt_return_amt,v_debt_return_qty,v_return_interest_amt;
        IF v_cursor_done THEN
            LEAVE loop_debtjour;
        END IF;


           /* set @当前负债金额#=@负债金额#; */
           set v_curr_debt_amt=v_debt_amt;

           /* set @当前负债数量#=@负债数量#; */
           set v_curr_debt_qty=v_debt_qty;

          /* set @负债利息金额#=@负债利息#; */
          set v_debt_interest_amt=v_debt_interest;

          /* [插入重复更新][产品证券_融资融券_交易组持仓负债表][字段][字段变量][{当前负债金额}=@负债金额#,{当前负债数量}=@当前负债数量#,{负债利息金额}=@负债利息金额#,{已归还金额}=@已归还金额#,{已归还数量}=@已归还数量#,{归还利息金额}=@归还利息金额#][2][@资产账户编号#,@负债类型#,@证券代码编号#,@市场编号#,@股东代码编号#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_pdsecu.tb_pdsecr_exgp_posidebt (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
              stock_code_no, stock_code, stock_type, asset_type, 
              invest_type, debt_type, begin_debt_qty, curr_debt_qty, 
              posi_qty_check_diff, begin_debt_amt, curr_debt_amt, debt_interest_amt, 
              debt_return_amt, debt_return_qty, return_interest_amt) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
              v_stock_code_no, v_stock_code, v_stock_type, v_asset_type, 
              v_invest_type, v_debt_type, v_begin_debt_qty, v_curr_debt_qty, 
              v_posi_qty_check_diff, v_begin_debt_amt, v_curr_debt_amt, v_debt_interest_amt, 
              v_debt_return_amt, v_debt_return_qty, v_return_interest_amt) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_debt_amt=v_debt_amt,curr_debt_qty=v_curr_debt_qty,debt_interest_amt=v_debt_interest_amt,debt_return_amt=v_debt_return_amt,debt_return_qty=v_debt_return_qty,return_interest_amt=v_return_interest_amt;
          if v_error_code = "1" then
                      
              SET v_error_code = "pdsecuA.22.24.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","负债类型=",v_debt_type,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
              else
                  SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","负债类型=",v_debt_type,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no,",","股东代码编号=",v_stock_acco_no);
              end if;
              close cursor_debtjour;
              leave label_pro;
          end if;


    /* [关闭游标][cursor_debtjour] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_debtjour;
    end cursor_debtjour;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_融资融券清算接口_汇总资产账户持仓负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecrlif_UpdateSumAsacPosiDebt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecrlif_UpdateSumAsacPosiDebt(
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
    declare v_mach_date int;
    declare v_begin_debt_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_begin_debt_amt decimal(18,4);
    declare v_invest_type int;
    declare v_debt_return_amt decimal(18,4);
    declare v_debt_return_qty decimal(18,2);
    declare v_return_interest_amt decimal(18,4);
    declare v_table_name varchar(64);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_interest decimal(18,4);
    declare v_curr_debt_amt decimal(18,4);
    declare v_curr_debt_qty decimal(18,2);
    declare v_debt_interest_amt decimal(18,4);
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_mach_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_debt_qty = 0;
    SET v_posi_qty_check_diff = 0;
    SET v_begin_debt_amt = 0;
    SET v_invest_type = 0;
    SET v_debt_return_amt = 0;
    SET v_debt_return_qty = 0;
    SET v_return_interest_amt = 0;
    SET v_table_name = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_debt_type = 0;
    SET v_debt_amt = 0;
    SET v_debt_qty = 0;
    SET v_debt_interest = 0;
    SET v_curr_debt_amt = 0;
    SET v_curr_debt_qty = 0;
    SET v_debt_interest_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

     /* [获取机器日期][@机器日期#] */
     select date_format(curdate(),'%Y%m%d') into v_mach_date;


    /* set @期初负债数量#=0; */
    set v_begin_debt_qty=0;

    /* set @持仓核对差额#=0; */
    set v_posi_qty_check_diff=0;

    /* set @期初负债金额#=0; */
    set v_begin_debt_amt=0;

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set  @已归还金额#=0; */
    set  v_debt_return_amt=0;

    /* set  @已归还数量#=0; */
    set  v_debt_return_qty=0;

    /* set  @归还利息金额#=0; */
    set  v_return_interest_amt=0;
    #[更新表记录][产品证券_融资融券_资产账户持仓负债表][{当前负债金额}=0,{当前负债数量}=0][1=1][1][@期初负债数量#]

    /* set @数据表名称# = "~产品证券_融资融券_资产账户持仓负债表^"; */
    set v_table_name = "db_pdsecu.tb_pdsecr_asac_posidebt";

    /* [删除表记录][产品证券_融资融券_资产账户持仓负债表][1=1][3][@数据表名称#] */
    delete from db_pdsecu.tb_pdsecr_asac_posidebt 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.22.25.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [声明游标][产品证券_融资融券_资产账户负债明细表][{机构编号},{产品编号},{资产账户编号},{市场编号},{证券代码编号},{股东代码编号},{证券代码},{证券类型},{资产类型},{负债类型},sum({负债金额}) as {负债金额},sum({负债数量}) as {负债数量},sum({负债利息}) as {负债利息},sum({已归还金额}) as {已归还金额},sum({已归还数量}) as {已归还数量},sum({归还利息金额}) as {归还利息金额}  ][{负债状态}<>《负债状态-已归还》 group by {机构编号},{产品编号},{资产账户编号},{市场编号},{证券代码编号},{股东代码编号},{负债类型}][cursor_debtjour] */
    cursor_debtjour:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_debtjour CURSOR FOR
        select co_no,pd_no,asset_acco_no,exch_no,stock_code_no,stock_acco_no,stock_code,stock_type,asset_type,debt_type,sum(debt_amt) as debt_amt,sum(debt_qty) as debt_qty,sum(debt_interest) as debt_interest,sum(debt_return_amt) as debt_return_amt,sum(debt_return_qty) as debt_return_qty,sum(return_interest_amt) as return_interest_amt   
        from db_pdsecu.tb_pdsecr_asac_debtdetail 
        where debt_status<>2 group by co_no,pd_no,asset_acco_no,exch_no,stock_code_no,stock_acco_no,debt_type;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@机构编号#,@产品编号#,@资产账户编号#,@市场编号#,@证券代码编号#,@股东代码编号#,@证券代码#,@证券类型#,@资产类型#,@负债类型#,@负债金额#,@负债数量# ,@负债利息#,@已归还金额#,@已归还数量#,@归还利息金额#][cursor_debtjour][loop_debtjour] */
    open cursor_debtjour;
    loop_debtjour: LOOP
    fetch cursor_debtjour into v_co_no,v_pd_no,v_asset_acco_no,v_exch_no,v_stock_code_no,v_stock_acco_no,v_stock_code,v_stock_type,v_asset_type,v_debt_type,v_debt_amt,v_debt_qty ,v_debt_interest,v_debt_return_amt,v_debt_return_qty,v_return_interest_amt;
        IF v_cursor_done THEN
            LEAVE loop_debtjour;
        END IF;


           /* set @当前负债金额#=@负债金额#; */
           set v_curr_debt_amt=v_debt_amt;

           /* set @当前负债数量#=@负债数量#; */
           set v_curr_debt_qty=v_debt_qty;

          /* set @负债利息金额#=@负债利息#; */
          set v_debt_interest_amt=v_debt_interest;

          /* [插入重复更新][产品证券_融资融券_资产账户持仓负债表][字段][字段变量][{当前负债金额}=@负债金额#,{当前负债数量}=@当前负债数量#,{负债利息金额}=@负债利息金额#,{已归还金额}=@已归还金额#,{已归还数量}=@已归还数量#,{归还利息金额}=@归还利息金额#][1][@资产账户编号#,@负债类型#,@证券代码编号#,@市场编号#,@股东代码编号#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_pdsecu.tb_pdsecr_asac_posidebt (
              create_date, create_time, update_date, 
              update_time, update_times, co_no, pd_no, 
              asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
              stock_code, stock_type, asset_type, invest_type, 
              debt_type, begin_debt_qty, curr_debt_qty, posi_qty_check_diff, 
              begin_debt_amt, curr_debt_amt, debt_interest_amt, debt_return_amt, 
              debt_return_qty, return_interest_amt) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_co_no, v_pd_no, 
              v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
              v_stock_code, v_stock_type, v_asset_type, v_invest_type, 
              v_debt_type, v_begin_debt_qty, v_curr_debt_qty, v_posi_qty_check_diff, 
              v_begin_debt_amt, v_curr_debt_amt, v_debt_interest_amt, v_debt_return_amt, 
              v_debt_return_qty, v_return_interest_amt) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_debt_amt=v_debt_amt,curr_debt_qty=v_curr_debt_qty,debt_interest_amt=v_debt_interest_amt,debt_return_amt=v_debt_return_amt,debt_return_qty=v_debt_return_qty,return_interest_amt=v_return_interest_amt;
          if v_error_code = "1" then
                      
              SET v_error_code = "pdsecuA.22.25.1";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","负债类型=",v_debt_type,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
              else
                  SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","负债类型=",v_debt_type,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no,",","股东代码编号=",v_stock_acco_no);
              end if;
              close cursor_debtjour;
              leave label_pro;
          end if;


    /* [关闭游标][cursor_debtjour] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_debtjour;
    end cursor_debtjour;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


