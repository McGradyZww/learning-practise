DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_报盘_更新订单回报状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurp_UpdateOrderRspStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurp_UpdateOrderRspStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_rsp_id bigint,
    IN p_order_id bigint,
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
    declare v_rsp_id bigint;
    declare v_order_id bigint;
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
    SET v_rsp_id = p_rsp_id;
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #更新订单反馈表

    /* [更新表记录][交易期货_报盘_订单回报表][{处理状态}=《处理状态-成功》,{订单序号}=@订单序号#][{记录序号}=@回报序号#][2][@回报序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfurp_orderrsp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_status="1",order_id=v_order_id where row_id=v_rsp_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.5.2.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("回报序号=",v_rsp_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("回报序号=",v_rsp_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_报盘_检查订单重复回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurp_CheckOrderRspDup;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurp_CheckOrderRspDup(
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
    IN p_pass_no int,
    IN p_futu_acco varchar(16),
    IN p_contrc_type int,
    IN p_contrc_code varchar(6),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_id bigint,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_rsp_info varchar(255),
    IN p_order_rsp_status varchar(2),
    IN p_rsp_status varchar(2),
    IN p_out_acco varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_rsp_no int
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
    declare v_pass_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_type int;
    declare v_contrc_code varchar(6);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_rsp_info varchar(255);
    declare v_order_rsp_status varchar(2);
    declare v_rsp_status varchar(2);
    declare v_out_acco varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_rsp_no int;
    declare v_deal_status varchar(2);
    declare v_sett_flag int;
    declare v_record_count int;
    declare v_rsp_date int;
    declare v_rsp_time int;
    declare v_record_valid_flag int;
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
    SET v_pass_no = p_pass_no;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_code = p_contrc_code;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_id = p_order_id;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_rsp_info = p_rsp_info;
    SET v_order_rsp_status = p_order_rsp_status;
    SET v_rsp_status = p_rsp_status;
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_rsp_no = 0;
    SET v_deal_status = "0";
    SET v_sett_flag = 0;
    SET v_record_count = 0;
    SET v_rsp_date = date_format(curdate(),'%Y%m%d');
    SET v_rsp_time = date_format(curtime(),'%H%i%s');
    SET v_record_valid_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @处理状态#="0"; */
    set v_deal_status="0";

    /* set @清算结算标志#=0; */
    set v_sett_flag=0;

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* set @回报日期# = @初始化日期#; */
    set v_rsp_date = v_init_date;

    /* [获取机器时间][@回报时间#] */
    select date_format(curtime(),'%H%i%s') into v_rsp_time;


    /* if @订单回报状态# = 《订单回报状态-已报废单》 then */
    if v_order_rsp_status = "3" then
      #已报废单，记录到回报表，需要处理申报编号，不然已报已经插入回报表了

        /* set @回报信息# = concat("原申报号：",@申报编号#,"。废单原因：",@回报信息#); */
        set v_rsp_info = concat("原申报号：",v_report_no,"。废单原因：",v_rsp_info);

        /* set @申报编号# = concat("P_", @申报编号#); */
        set v_report_no = concat("P_", v_report_no);
    end if;

    /* set @记录有效标志# = 《记录有效标志-有效》; */
    set v_record_valid_flag = 1;

    /* [获取表记录数量][交易期货_报盘_订单回报表][@记录个数#][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#] */
    select count(1) into v_record_count from db_tdfutu.tb_tdfurp_orderrsp where pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and report_date=v_report_date and report_no=v_report_no;


    /* if @记录个数# = 0 then */
    if v_record_count = 0 then

      /* [插入表记录][交易期货_报盘_订单回报表][字段][字段变量][1][@订单序号#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfurp_orderrsp(
          create_date, create_time, update_date, 
          update_time, update_times, init_date, co_no, 
          pd_no, exch_group_no, asset_acco_no, pass_no, 
          out_acco, exch_no, futu_acco, contrc_code, 
          report_date, report_time, report_no, order_date, 
          order_id, order_dir, contrc_dir, hedge_type, 
          order_price, order_qty, rsp_status, rsp_info, 
          deal_status, sett_flag) 
      value( 
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_init_date, v_co_no, 
          v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
          v_out_acco, v_exch_no, v_futu_acco, v_contrc_code, 
          v_report_date, v_report_time, v_report_no, v_order_date, 
          v_order_id, v_order_dir, v_contrc_dir, v_hedge_type, 
          v_order_price, v_order_qty, v_rsp_status, v_rsp_info, 
          v_deal_status, v_sett_flag);
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.5.3.1";
          SET v_error_info =  CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
          leave label_pro;
      end if;


      /* [获取记录序号][@回报编号#] */
      select LAST_INSERT_ID() into v_rsp_no;

    else

      /* [报错返回][751][@订单序号#] */
          
          SET v_error_code = "tdfutuA.5.3.751";
          SET v_error_info = concat("订单序号=",v_order_id);
          leave label_pro;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_rsp_no = v_rsp_no;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_报盘_更新订单回报记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurp_UpdateOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurp_UpdateOrderRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_rsp_no int,
    IN p_out_acco varchar(32),
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_id bigint,
    IN p_trade_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_report_fee decimal(18,4),
    IN p_wtdraw_fee decimal(18,4),
    IN p_wtdraw_qty decimal(18,2),
    IN p_order_status varchar(2),
    IN p_rece_margin decimal(18,4),
    IN p_rsp_info varchar(255),
    IN p_strike_all_fee decimal(18,4),
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
    declare v_rsp_no int;
    declare v_out_acco varchar(32);
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_id bigint;
    declare v_trade_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_order_status varchar(2);
    declare v_rece_margin decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_strike_all_fee decimal(18,4);
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
    SET v_rsp_no = p_rsp_no;
    SET v_out_acco = p_out_acco;
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_id = p_order_id;
    SET v_trade_fee = p_trade_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_report_fee = p_report_fee;
    SET v_wtdraw_fee = p_wtdraw_fee;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_order_status = p_order_status;
    SET v_rece_margin = p_rece_margin;
    SET v_rsp_info = p_rsp_info;
    SET v_strike_all_fee = p_strike_all_fee;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #更新订单表

    /* if @订单状态# <> "0" then */
    if v_order_status <> "0" then

      /* [更新表记录][交易期货_交易_订单表][{申报日期}=@申报日期#,{申报时间}=@申报时间#,{申报编号}=@申报编号#,{撤单数量}=@撤单数量#,{交易佣金}=@交易佣金#,{其他佣金}=@其他佣金#,{申报费用}=@申报费用#,{撤单费用}=@撤单费用#,{订单状态}=@订单状态#,{应收保证金}=@应收保证金#,{成交全部费用}={成交全部费用}+@成交全部费用#,{交易费用}= {交易费用} +@交易费用#,{回报信息}=@回报信息#][{记录序号}=@订单序号#][2][@订单序号#] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_tdfutu.tb_tdfutd_order set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, report_date=v_report_date,report_time=v_report_time,report_no=v_report_no,wtdraw_qty=v_wtdraw_qty,trade_commis=v_trade_commis,other_commis=v_other_commis,report_fee=v_report_fee,wtdraw_fee=v_wtdraw_fee,order_status=v_order_status,rece_margin=v_rece_margin,strike_all_fee=strike_all_fee+v_strike_all_fee,trade_fee= trade_fee +v_trade_fee,rsp_info=v_rsp_info where row_id=v_order_id;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.5.4.2";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
          else
              SET v_error_info = concat("订单序号=",v_order_id);
          end if;
          leave label_pro;
      end if;


      /* [获取表记录变量语句][交易期货_交易_订单表][{更新次数}][@更新次数#][{记录序号}=@订单序号#] */
      select update_times into v_update_times from db_tdfutu.tb_tdfutd_order where row_id=v_order_id limit 1;

    end if;
    #更新订单回报表

    /* [更新表记录][交易期货_报盘_订单回报表][{处理状态}=《处理状态-成功》][{订单序号}=@订单序号#][2][@订单序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfurp_orderrsp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_status="1" where order_id=v_order_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.5.4.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_报盘_检查补单订单重复回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurp_CheckMissOrderRspDup;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurp_CheckMissOrderRspDup(
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
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_order_dir int,
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_rsp_info varchar(255),
    IN p_rsp_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_rsp_id bigint,
    OUT p_order_date int,
    OUT p_order_id bigint,
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_qty decimal(18,2),
    OUT p_order_oper_way varchar(2),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_order_dir int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_rsp_info varchar(255);
    declare v_rsp_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_rsp_id bigint;
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_order_oper_way varchar(2);
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_deal_status varchar(2);
    declare v_sett_flag int;
    declare v_oper_func_code varchar(16);
    declare v_crncy_type varchar(3);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_asset_type int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_order_batch_no int;
    declare v_order_time int;
    declare v_order_status varchar(2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_trade_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_margin_ratio decimal(18,12);
    declare v_compli_trig_id bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_order_dir = p_order_dir;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_rsp_info = p_rsp_info;
    SET v_rsp_status = p_rsp_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_rsp_id = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_id = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_order_oper_way = " ";
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_deal_status = "0";
    SET v_sett_flag = 0;
    SET v_oper_func_code = " ";
    SET v_crncy_type = "CNY";
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_asset_type = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_order_batch_no = 0;
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_status = "0";
    SET v_wtdraw_qty = 0;
    SET v_strike_price = 0;
    SET v_trade_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_strike_all_fee = 0;
    SET v_rece_margin = 0;
    SET v_trade_occur_amt = 0;
    SET v_comb_code = " ";
    SET v_margin_ratio = 0;
    SET v_compli_trig_id = 0;

    
    label_pro:BEGIN
    

    /* set @记录序号# = 0; */
    set v_row_id = 0;

    /* [获取表记录变量语句][交易期货_报盘_订单回报表][字段][字段变量][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#][751][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, rsp_status, 
        rsp_info, deal_status, sett_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_exch_no, v_futu_acco, 
        v_contrc_code, v_report_date, v_report_time, v_report_no, 
        v_order_date, v_order_id, v_order_dir, v_contrc_dir, 
        v_hedge_type, v_order_price, v_order_qty, v_rsp_status, 
        v_rsp_info, v_deal_status, v_sett_flag from db_tdfutu.tb_tdfurp_orderrsp where pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and report_date=v_report_date and report_no=v_report_no limit 1;


    /* if @记录序号# = 0 then */
    if v_row_id = 0 then

        /* set @处理状态#=《处理状态-未处理》; */
        set v_deal_status="0";

        /* set @清算结算标志#="0"; */
        set v_sett_flag="0";

        /* [插入表记录][交易期货_报盘_订单回报表][字段][字段变量][1][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdfutu.tb_tdfurp_orderrsp(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, exch_no, futu_acco, contrc_code, 
            report_date, report_time, report_no, order_date, 
            order_id, order_dir, contrc_dir, hedge_type, 
            order_price, order_qty, rsp_status, rsp_info, 
            deal_status, sett_flag) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
            v_out_acco, v_exch_no, v_futu_acco, v_contrc_code, 
            v_report_date, v_report_time, v_report_no, v_order_date, 
            v_order_id, v_order_dir, v_contrc_dir, v_hedge_type, 
            v_order_price, v_order_qty, v_rsp_status, v_rsp_info, 
            v_deal_status, v_sett_flag);
        if v_error_code = "1" then
                    
            SET v_error_code = "tdfutuA.5.5.1";
            SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* [获取记录序号][@回报序号#] */
        select LAST_INSERT_ID() into v_rsp_id;


    /* elseif @处理状态#=《处理状态-失败》 then */
    elseif v_deal_status="2" then

        /* [报错返回][761][@处理状态#, @通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
            
            SET v_error_code = "tdfutuA.5.5.761";
            SET v_error_info = concat("处理状态=",v_deal_status,","," 通道编号=", v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no);
            leave label_pro;


    /* elseif @处理状态#=《处理状态-成功》 then */
    elseif v_deal_status="1" then

        /* [获取表记录变量][交易期货_交易_订单表][字段][字段变量][{通道编号}=@通道编号# and {外部账号}=@外部账号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#][4][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, crncy_type, exch_no, futu_acco_no, 
            futu_acco, contrc_code_no, contrc_code, asset_type, 
            contrc_type, contrc_unit, external_no, comm_id, 
            comm_batch_no, comm_opor, report_date, report_time, 
            report_no, order_batch_no, order_date, order_time, 
            order_dir, contrc_dir, hedge_type, order_price, 
            order_qty, order_status, wtdraw_qty, strike_qty, 
            strike_price, strike_amt, trade_fee, trade_commis, 
            other_commis, strike_commis, strike_other_commis, report_fee, 
            wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
            comb_code, margin_ratio, rsp_info, compli_trig_id, 
            sett_flag, order_oper_way into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_opor_co_no, 
            v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
            v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
            v_out_acco, v_crncy_type, v_exch_no, v_futu_acco_no, 
            v_futu_acco, v_contrc_code_no, v_contrc_code, v_asset_type, 
            v_contrc_type, v_contrc_unit, v_external_no, v_comm_id, 
            v_comm_batch_no, v_comm_opor, v_report_date, v_report_time, 
            v_report_no, v_order_batch_no, v_order_date, v_order_time, 
            v_order_dir, v_contrc_dir, v_hedge_type, v_order_price, 
            v_order_qty, v_order_status, v_wtdraw_qty, v_strike_qty, 
            v_strike_price, v_strike_amt, v_trade_fee, v_trade_commis, 
            v_other_commis, v_strike_commis, v_strike_other_commis, v_report_fee, 
            v_wtdraw_fee, v_strike_all_fee, v_rece_margin, v_trade_occur_amt, 
            v_comb_code, v_margin_ratio, v_rsp_info, v_compli_trig_id, 
            v_sett_flag, v_order_oper_way from db_tdfutu.tb_tdfutd_order where pass_no=v_pass_no and out_acco=v_out_acco and exch_no=v_exch_no and report_date=v_report_date and report_no=v_report_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdfutuA.5.5.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no);
            end if;
            leave label_pro;
        end if;


        /* set @订单序号# = @记录序号#; */
        set v_order_id = v_row_id;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_rsp_id = v_rsp_id;
    SET p_order_date = v_order_date;
    SET p_order_id = v_order_id;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_qty = v_strike_qty;
    SET p_order_oper_way = v_order_oper_way;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_报盘_新增成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurp_AddStrikeRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurp_AddStrikeRecord(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_rsp_no int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_exch_no int,
    IN p_crncy_type varchar(3),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_comm_id bigint,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_order_id bigint,
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_hedge_type int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_amt decimal(18,4),
    IN p_strike_fee decimal(18,4),
    IN p_strike_margin decimal(18,4),
    IN p_close_pandl decimal(18,4),
    IN p_strike_occur_amt decimal(18,4),
    IN p_order_oper_way varchar(2),
    IN p_rsp_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_id bigint,
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
    declare v_busi_opor_no int;
    declare v_rsp_no int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_exch_no int;
    declare v_crncy_type varchar(3);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_comm_id bigint;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_order_id bigint;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_strike_margin decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_strike_occur_amt decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_rsp_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_id bigint;
    declare v_update_times int;
    declare v_mach_time int;
    declare v_comm_batch_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_tmp_update_times int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_rsp_no = p_rsp_no;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_exch_no = p_exch_no;
    SET v_crncy_type = p_crncy_type;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_comm_id = p_comm_id;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_order_id = p_order_id;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_hedge_type = p_hedge_type;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_fee = p_strike_fee;
    SET v_strike_margin = p_strike_margin;
    SET v_close_pandl = p_close_pandl;
    SET v_strike_occur_amt = p_strike_occur_amt;
    SET v_order_oper_way = p_order_oper_way;
    SET v_rsp_info = p_rsp_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_id = 0;
    SET v_update_times = 1;
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_comm_batch_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @指令批号#=0; */
    set v_comm_batch_no=0;

    /* set @操作员编号#=@业务操作员编号#; */
    set v_opor_no=v_busi_opor_no;

    /* [插入表记录][交易期货_报盘_成交表][字段][字段变量][1][@成交日期#,@成交编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdfutu.tb_tdfurp_execution(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_no, 
        futu_acco_no, contrc_code_no, contrc_code, contrc_type, 
        contrc_unit, comm_id, comm_batch_no, strike_date, 
        strike_time, strike_no, report_date, report_no, 
        order_date, order_time, order_id, order_dir, 
        contrc_dir, hedge_type, order_price, order_qty, 
        strike_qty, strike_price, strike_amt, strike_fee, 
        close_pandl, strike_margin, order_oper_way) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_crncy_type, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_contrc_code, v_contrc_type, 
        v_contrc_unit, v_comm_id, v_comm_batch_no, v_strike_date, 
        v_strike_time, v_strike_no, v_report_date, v_report_no, 
        v_order_date, v_order_time, v_order_id, v_order_dir, 
        v_contrc_dir, v_hedge_type, v_order_price, v_order_qty, 
        v_strike_qty, v_strike_price, v_strike_amt, v_strike_fee, 
        v_close_pandl, v_strike_margin, v_order_oper_way);
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.5.21.1";
        SET v_error_info =  CONCAT(concat("成交日期=",v_strike_date,",","成交编号=",v_strike_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @临时_更新次数#=@更新次数#; */
    set v_tmp_update_times=v_update_times;

    /* [获取记录序号][@成交序号#] */
    select LAST_INSERT_ID() into v_strike_id;

    #更新成交回报表

    /* [更新表记录][交易期货_报盘_成交回报表][{初始化日期}=@初始化日期#,{处理状态}=《处理状态-成功》,{回报信息}=concat(@回报信息#,",成交处理时间:",@机器时间#)][{记录序号}=@回报编号#][2][@回报编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdfutu.tb_tdfurp_executionrsp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_init_date,deal_status="1",rsp_info=concat(v_rsp_info,",成交处理时间:",v_mach_time) where row_id=v_rsp_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdfutuA.5.21.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("回报编号=",v_rsp_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("回报编号=",v_rsp_no);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数#=@临时_更新次数#; */
    set v_update_times=v_tmp_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_id = v_strike_id;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_报盘_检查成交回报获取订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurp_CheckStrikeRspGetOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurp_CheckStrikeRspGetOrderInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_out_acco varchar(32),
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_contrc_dir int,
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_order_dir int,
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_rsp_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_order_date int,
    OUT p_order_id bigint,
    OUT p_rsp_time int,
    OUT p_rsp_no int,
    OUT p_comb_code varchar(6),
    OUT p_comm_id bigint,
    OUT p_comm_batch_no int,
    OUT p_order_qty decimal(18,2),
    OUT p_hedge_type int
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
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_out_acco varchar(32);
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_contrc_dir int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_rsp_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_order_date int;
    declare v_order_id bigint;
    declare v_rsp_time int;
    declare v_rsp_no int;
    declare v_comb_code varchar(6);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_qty decimal(18,2);
    declare v_hedge_type int;
    declare v_row_id bigint;
    declare v_deal_status varchar(2);
    declare v_sett_flag int;
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
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_out_acco = p_out_acco;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_dir = p_contrc_dir;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_order_dir = p_order_dir;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_rsp_info = p_rsp_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_id = 0;
    SET v_rsp_time = date_format(curtime(),'%H%i%s');
    SET v_rsp_no = 0;
    SET v_comb_code = " ";
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_order_qty = 0;
    SET v_hedge_type = 0;
    SET v_row_id = 0;
    SET v_deal_status = "0";
    SET v_sett_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #获取订单信息

    /* [获取机器时间][@回报时间#] */
    select date_format(curtime(),'%H%i%s') into v_rsp_time;


    /* [获取表记录变量][交易期货_交易_订单表][{记录序号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{交易编码编号},{合约代码编号},{合约类型},{合约乘数},{订单日期},{组合编码},{指令序号},{指令批号},{订单数量},{套保标志}][@订单序号#,@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@合约类型#,@合约乘数#,@订单日期#,@组合编码#,@指令序号#,@指令批号#,@订单数量#,@套保标志#][{通道编号}=@通道编号# and {外部账号} = @外部账号# and {市场编号} = @市场编号# and {申报日期} = @申报日期# and {申报编号} = @申报编号#][4][@通道编号#,@外部账号#,@市场编号#,@申报日期#,@申报编号#,@成交编号#] */
    select row_id,co_no,pd_no,exch_group_no,asset_acco_no,futu_acco_no,contrc_code_no,contrc_type,contrc_unit,order_date,comb_code,comm_id,comm_batch_no,order_qty,hedge_type into v_order_id,v_co_no,v_pd_no,v_exch_group_no,v_asset_acco_no,v_futu_acco_no,v_contrc_code_no,v_contrc_type,v_contrc_unit,v_order_date,v_comb_code,v_comm_id,v_comm_batch_no,v_order_qty,v_hedge_type from db_tdfutu.tb_tdfutd_order where pass_no=v_pass_no and out_acco = v_out_acco and exch_no = v_exch_no and report_date = v_report_date and report_no = v_report_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.5.24.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no,",","成交编号=",v_strike_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no,",","成交编号=",v_strike_no);
        end if;
        leave label_pro;
    end if;


    /* set  @成交金额#=@成交价格#*@成交数量#*@合约乘数#; */
    set  v_strike_amt=v_strike_price*v_strike_qty*v_contrc_unit;

    /* [获取表记录变量语句][交易期货_报盘_成交回报表][IFNULL({记录序号},0),{处理状态}][@记录序号#,@处理状态#][{市场编号}=@市场编号# and {成交日期}=@成交日期# and {成交编号}=@成交编号#] */
    select IFNULL(row_id,0),deal_status into v_row_id,v_deal_status from db_tdfutu.tb_tdfurp_executionrsp where exch_no=v_exch_no and strike_date=v_strike_date and strike_no=v_strike_no limit 1;


    /* if @记录序号# = 0 then */
    if v_row_id = 0 then

      /* set @处理状态#=《处理状态-未处理》; */
      set v_deal_status="0";

      /* set @清算结算标志#=《清算结算标志-未处理》; */
      set v_sett_flag=2;

      /* [插入表记录][交易期货_报盘_成交回报表][字段][字段变量][1][@成交日期#,@成交编号#,@市场编号#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_tdfutu.tb_tdfurp_executionrsp(
          create_date, create_time, update_date, 
          update_time, update_times, init_date, co_no, 
          pd_no, exch_group_no, asset_acco_no, pass_no, 
          out_acco, exch_no, futu_acco, contrc_code, 
          report_date, report_no, strike_date, strike_time, 
          strike_no, order_dir, contrc_dir, hedge_type, 
          strike_price, strike_qty, strike_amt, rsp_info, 
          deal_status, sett_flag) 
      value( 
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_init_date, v_co_no, 
          v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
          v_out_acco, v_exch_no, v_futu_acco, v_contrc_code, 
          v_report_date, v_report_no, v_strike_date, v_strike_time, 
          v_strike_no, v_order_dir, v_contrc_dir, v_hedge_type, 
          v_strike_price, v_strike_qty, v_strike_amt, v_rsp_info, 
          v_deal_status, v_sett_flag);
      if v_error_code = "1" then
                  
          SET v_error_code = "tdfutuA.5.24.1";
          SET v_error_info =  CONCAT(concat("成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","市场编号=",v_exch_no),"#",v_mysql_message);
          leave label_pro;
      end if;


      /* [获取记录序号][@回报编号#] */
      select LAST_INSERT_ID() into v_rsp_no;

    else

      /* [检查报错返回][@处理状态# = 《处理状态-成功》][767][@市场编号#,@成交日期#,@成交编号#] */
      if v_deal_status = "1" then
          
          SET v_error_code = "tdfutuA.5.24.767";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no),"#",v_mysql_message);
          else
              SET v_error_info = concat("市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no);
          end if;
          leave label_pro;
      end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_order_date = v_order_date;
    SET p_order_id = v_order_id;
    SET p_rsp_time = v_rsp_time;
    SET p_rsp_no = v_rsp_no;
    SET p_comb_code = v_comb_code;
    SET p_comm_id = v_comm_id;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_order_qty = v_order_qty;
    SET p_hedge_type = v_hedge_type;

END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_报盘_查询订单回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurp_QueryOrderRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurp_QueryOrderRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_order_dir_str varchar(1024),
    IN p_rsp_status_str varchar(64),
    IN p_deal_status_str varchar(64),
    IN p_row_count int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_order_dir_str varchar(1024);
    declare v_rsp_status_str varchar(64);
    declare v_deal_status_str varchar(64);
    declare v_row_count int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_rsp_status_str = p_rsp_status_str;
    SET v_deal_status_str = p_deal_status_str;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_报盘_订单回报表][字段][(@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@交易编码#=" " or {交易编码}=@交易编码#) and (@合约代码#=" " or {合约代码}=@合约代码#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@回报状态串#=" " or instr(@回报状态串#,concat(";",{回报状态},";"))>0) and (@处理状态串#=" " or instr(@处理状态串#,concat(";",{处理状态},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#,concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, rsp_status, 
        rsp_info, deal_status, sett_flag from db_tdfutu.tb_tdfurp_orderrsp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_rsp_status_str=" " or instr(v_rsp_status_str,concat(";",rsp_status,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, contrc_dir, 
        hedge_type, order_price, order_qty, rsp_status, 
        rsp_info, deal_status, sett_flag from db_tdfutu.tb_tdfurp_orderrsp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_rsp_status_str=" " or instr(v_rsp_status_str,concat(";",rsp_status,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_报盘_查询成交回报
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurp_QueryStrikeRsp;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurp_QueryStrikeRsp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_order_dir_str varchar(1024),
    IN p_deal_status_str varchar(64),
    IN p_row_count int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_order_dir_str varchar(1024);
    declare v_deal_status_str varchar(64);
    declare v_row_count int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_deal_status_str = p_deal_status_str;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_报盘_成交回报表][字段][(@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@交易编码#=" " or {交易编码}=@交易编码#) and (@合约代码#=" " or {合约代码}=@合约代码#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@处理状态串#=" " or instr(@处理状态串#,concat(";",{处理状态},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#,concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, contrc_dir, 
        hedge_type, strike_price, strike_qty, strike_amt, 
        rsp_info, deal_status, sett_flag from db_tdfutu.tb_tdfurp_executionrsp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, contrc_dir, 
        hedge_type, strike_price, strike_qty, strike_amt, 
        rsp_info, deal_status, sett_flag from db_tdfutu.tb_tdfurp_executionrsp where (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_deal_status_str=" " or instr(v_deal_status_str,concat(";",deal_status,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_报盘_查询成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurp_QueryStrikeDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurp_QueryStrikeDetail(
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
    IN p_contrc_code_no int,
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_contrc_code_no int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录][交易期货_报盘_成交表][{记录序号},
{操作员编号} as {查询操作员编号},
{初始化日期},
{机构编号},
{产品编号},
{交易组编号},
{资产账户编号},
{通道编号},
{外部账号},
{本币币种},
{市场编号},
{交易编码编号},
{合约代码编号},
{合约代码},
{合约类型},
{合约乘数},
{指令序号},
{指令批号},
{成交日期},
{成交时间},
{成交编号},
{申报日期},
{申报编号},
{订单日期},
{订单时间},
{订单序号},
{订单方向},
{开平方向},
{套保标志},
{订单价格},
{订单数量},
{成交数量},
{成交价格},
{成交金额},
{成交费用},
{平仓盈亏},
{成交保证金},
{订单操作方式},
{更新次数}][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#,concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,
    opor_no as query_opor_no,
    init_date,
    co_no,
    pd_no,
    exch_group_no,
    asset_acco_no,
    pass_no,
    out_acco,
    crncy_type,
    exch_no,
    futu_acco_no,
    contrc_code_no,
    contrc_code,
    contrc_type,
    contrc_unit,
    comm_id,
    comm_batch_no,
    strike_date,
    strike_time,
    strike_no,
    report_date,
    report_no,
    order_date,
    order_time,
    order_id,
    order_dir,
    contrc_dir,
    hedge_type,
    order_price,
    order_qty,
    strike_qty,
    strike_price,
    strike_amt,
    strike_fee,
    close_pandl,
    strike_margin,
    order_oper_way,
    update_times from db_tdfutu.tb_tdfurp_execution where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id,
    opor_no as query_opor_no,
    init_date,
    co_no,
    pd_no,
    exch_group_no,
    asset_acco_no,
    pass_no,
    out_acco,
    crncy_type,
    exch_no,
    futu_acco_no,
    contrc_code_no,
    contrc_code,
    contrc_type,
    contrc_unit,
    comm_id,
    comm_batch_no,
    strike_date,
    strike_time,
    strike_no,
    report_date,
    report_no,
    order_date,
    order_time,
    order_id,
    order_dir,
    contrc_dir,
    hedge_type,
    order_price,
    order_qty,
    strike_qty,
    strike_price,
    strike_amt,
    strike_fee,
    close_pandl,
    strike_margin,
    order_oper_way,
    update_times from db_tdfutu.tb_tdfurp_execution where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_报盘_查询成交明细历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurp_QueryStrikeDetailHis;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurp_QueryStrikeDetailHis(
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
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_no int,
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_no int;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_交易期货_报盘_成交表][字段][({订单日期} between @开始日期# and @结束日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@机构编号权限串#=" " or instr(@机构编号权限串#,concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, crncy_type, 
        exch_no, futu_acco_no, contrc_code_no, contrc_code, 
        contrc_type, contrc_unit, comm_id, comm_batch_no, 
        strike_date, strike_time, strike_no, report_date, 
        report_no, order_date, order_time, order_id, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, strike_qty, strike_price, strike_amt, 
        strike_fee, close_pandl, strike_margin, order_oper_way from db_tdfutu_his.tb_tdfurp_execution_his where (order_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, crncy_type, 
        exch_no, futu_acco_no, contrc_code_no, contrc_code, 
        contrc_type, contrc_unit, comm_id, comm_batch_no, 
        strike_date, strike_time, strike_no, report_date, 
        report_no, order_date, order_time, order_id, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, strike_qty, strike_price, strike_amt, 
        strike_fee, close_pandl, strike_margin, order_oper_way from db_tdfutu_his.tb_tdfurp_execution_his where (order_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",exch_no,";"))>0) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",order_dir,";"))>0) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str,concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdfutu;;

# 原子_交易期货_报盘_获取订单信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdfurp_GetOrderInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdfurp_GetOrderInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_futu_acco_no int,
    OUT p_futu_acco varchar(16),
    OUT p_contrc_code_no int,
    OUT p_contrc_code varchar(6),
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_contrc_dir int,
    OUT p_hedge_type int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_qty decimal(18,2),
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_rece_margin decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_order_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_futu_acco_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_contrc_dir int;
    declare v_hedge_type int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_qty decimal(18,2);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_rece_margin decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_asset_type int;
    declare v_external_no bigint;
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_comm_opor int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_batch_no int;
    declare v_order_status varchar(2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_trade_fee decimal(18,4);
    declare v_strike_commis decimal(18,4);
    declare v_strike_other_commis decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_strike_all_fee decimal(18,4);
    declare v_trade_occur_amt decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_rsp_info varchar(255);
    declare v_compli_trig_id bigint;
    declare v_sett_flag int;
    declare v_order_oper_way varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_order_id = p_order_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_futu_acco_no = 0;
    SET v_futu_acco = " ";
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_contrc_dir = 0;
    SET v_hedge_type = 0;
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_qty = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_comb_code = " ";
    SET v_rece_margin = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_asset_type = 0;
    SET v_external_no = 0;
    SET v_comm_id = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_opor = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_batch_no = 0;
    SET v_order_status = "0";
    SET v_strike_price = 0;
    SET v_strike_amt = 0;
    SET v_trade_fee = 0;
    SET v_strike_commis = 0;
    SET v_strike_other_commis = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_strike_all_fee = 0;
    SET v_trade_occur_amt = 0;
    SET v_margin_ratio = 0;
    SET v_rsp_info = " ";
    SET v_compli_trig_id = 0;
    SET v_sett_flag = 0;
    SET v_order_oper_way = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易期货_交易_订单表][字段][字段变量][{记录序号}=@订单序号#][4][@订单序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, asset_type, 
        contrc_type, contrc_unit, external_no, comm_id, 
        comm_batch_no, comm_opor, report_date, report_time, 
        report_no, order_batch_no, order_date, order_time, 
        order_dir, contrc_dir, hedge_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_qty, 
        strike_price, strike_amt, trade_fee, trade_commis, 
        other_commis, strike_commis, strike_other_commis, report_fee, 
        wtdraw_fee, strike_all_fee, rece_margin, trade_occur_amt, 
        comb_code, margin_ratio, rsp_info, compli_trig_id, 
        sett_flag, order_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_no, v_futu_acco_no, 
        v_futu_acco, v_contrc_code_no, v_contrc_code, v_asset_type, 
        v_contrc_type, v_contrc_unit, v_external_no, v_comm_id, 
        v_comm_batch_no, v_comm_opor, v_report_date, v_report_time, 
        v_report_no, v_order_batch_no, v_order_date, v_order_time, 
        v_order_dir, v_contrc_dir, v_hedge_type, v_order_price, 
        v_order_qty, v_order_status, v_wtdraw_qty, v_strike_qty, 
        v_strike_price, v_strike_amt, v_trade_fee, v_trade_commis, 
        v_other_commis, v_strike_commis, v_strike_other_commis, v_report_fee, 
        v_wtdraw_fee, v_strike_all_fee, v_rece_margin, v_trade_occur_amt, 
        v_comb_code, v_margin_ratio, v_rsp_info, v_compli_trig_id, 
        v_sett_flag, v_order_oper_way from db_tdfutu.tb_tdfutd_order where row_id=v_order_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdfutuA.5.124.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单序号=",v_order_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单序号=",v_order_id);
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
    SET p_crncy_type = v_crncy_type;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_futu_acco = v_futu_acco;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_contrc_dir = v_contrc_dir;
    SET p_hedge_type = v_hedge_type;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_qty = v_order_qty;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_comb_code = v_comb_code;
    SET p_rece_margin = v_rece_margin;

END;;


