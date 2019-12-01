DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_获取股东代码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_GetStockAccoNo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_GetStockAccoNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_acco_no int
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
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_账户_证券账户信息表][{股东代码编号}][@股东代码编号#][{资产账户编号} = @资产账户编号# and {市场编号} = @市场编号# and {股东代码} = @股东代码#][4][@资产账户编号#, @市场编号#, @股东代码#] */
    select stock_acco_no into v_stock_acco_no from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no = v_asset_acco_no and exch_no = v_exch_no and stock_acco = v_stock_acco limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.4.1.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 市场编号=", v_exch_no,","," 股东代码=", v_stock_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 市场编号=", v_exch_no,","," 股东代码=", v_stock_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_no = v_stock_acco_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_获取股东代码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_GetStockAcco;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_GetStockAcco(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_no int,
    OUT p_stock_acco varchar(16)
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
    declare v_stock_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_stock_acco = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_账户_证券账户信息表][{市场编号}, {股东代码}][@市场编号#, @股东代码#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号#][9][@资产账户编号#,@股东代码编号#] */
    select exch_no, stock_acco into v_exch_no, v_stock_acco from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.4.2.9";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco = v_stock_acco;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_判断交易组能否注销
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_CheckIFExchGroupCancel;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_CheckIFExchGroupCancel(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int
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
    declare v_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_invest_type int;
    declare v_co_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_pre_settle_amt decimal(18,4);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_invest_type = 0;
    SET v_co_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_row_id = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_pre_settle_amt = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";
    #循环获取市场编号分别为1,2,3,4对应的股东代码编号和资产账户编号

    /* set @市场编号#=1; */
    set v_exch_no=1;
    loop_label:loop

      /* [获取表记录变量语句][产品证券_账户_证券账户信息表][{记录序号},{资产账户编号},{股东代码编号}][@记录序号#,@资产账户编号#,@股东代码编号#][{产品编号}=@产品编号# and {机构编号}=@机构编号# and {市场编号}=@市场编号#] */
      select row_id,asset_acco_no,stock_acco_no into v_row_id,v_asset_acco_no,v_stock_acco_no from db_pdsecu.tb_pdseac_secu_acco where pd_no=v_pd_no and co_no=v_co_no and exch_no=v_exch_no limit 1;


      /* if @记录序号#<>0 then */
      if v_row_id<>0 then
        #先校验资金是否有待交收金额

        /* [获取表记录变量语句][产品证券_资金_交易组资金表][{记录序号},{待交收金额}][@记录序号#,@待交收金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
        select row_id,pre_settle_amt into v_row_id,v_pre_settle_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

           #如果有待交收金额,则不允许注销交易组

          /* if (@记录序号#<>0 and @待交收金额#<>0) then */
          if (v_row_id<>0 and v_pre_settle_amt<>0) then

            /* set @记录个数#=1; */
            set v_record_count=1;
            leave loop_label;
          end if;
        #然后校验持仓是否有待交收数量和冻结数量

        /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][sum({记录序号}),sum({待交收数量}),sum({冻结数量}),sum({解冻数量})][@记录序号#,@待交收数量#,@冻结数量#,@解冻数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}<>" " and {投资类型}=@投资类型#] */
        select sum(row_id),sum(pre_settle_qty),sum(frozen_qty),sum(unfroz_qty) into v_row_id,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no<>" " and invest_type=v_invest_type limit 1;

        #若有待交收数量或者冻结数量,则不允许注销交易组

        /* if (@记录序号#<>0 and (@待交收数量#<>0 or @冻结数量#<>0 or @解冻数量#<>0)) then */
        if (v_row_id<>0 and (v_pre_settle_qty<>0 or v_frozen_qty<>0 or v_unfroz_qty<>0)) then

            /* set @记录个数#=1; */
            set v_record_count=1;
            leave loop_label;
          end if;

         /* set @市场编号#=@市场编号#+1; */
         set v_exch_no=v_exch_no+1;

         /* if @市场编号#>4 then */
         if v_exch_no>4 then
            leave loop_label;
          end if;
      else
        leave loop_label;
      end if;
    end loop loop_label;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_注销交易组转移持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_TransferPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_TransferPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_default_exch_group_no int,
    IN p_exch_group_no int,
    IN p_menu_no int,
    IN p_asset_acco_no_str varchar(2048),
    IN p_default_exch_group_no_str varchar(2048),
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
    declare v_default_exch_group_no int;
    declare v_exch_group_no int;
    declare v_menu_no int;
    declare v_asset_acco_no_str varchar(2048);
    declare v_default_exch_group_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_exch_group_no int;
    declare v_co_no int;
    declare v_crncy_type varchar(3);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_curr_row_id bigint;
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_tmp_row_id bigint;
    declare v_invest_type int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_occur_end_qty decimal(18,2);
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_posi_id bigint;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_strike_date int;
    declare v_release_date int;
    declare v_deal_status varchar(2);
    declare v_occur_price decimal(16,9);
    declare v_occur_end_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_menu_no = p_menu_no;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_default_exch_group_no_str = p_default_exch_group_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_exch_group_no = 0;
    SET v_co_no = 0;
    SET v_crncy_type = "CNY";
    SET v_posi_qty_check_diff = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_curr_row_id = 0;
    SET v_row_id = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_tmp_row_id = 0;
    SET v_invest_type = 0;
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_occur_end_qty = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_posi_id = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_fair_price = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_release_date = 0;
    SET v_deal_status = "0";
    SET v_occur_price = 0;
    SET v_occur_end_price = 0;

    
    label_pro:BEGIN
    
    #转移持仓
    #set @市场编号#=4;

    /* set @临时_交易组编号#=@交易组编号#; */
    set v_tmp_exch_group_no=v_exch_group_no;

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @持仓核对差额#=0; */
    set v_posi_qty_check_diff=0;
    #set @投资类型#=1;

    /* [检查报错返回][length(@资产账户编号串#)<>length(@默认交易组编号串#)][1][concat("资产账户编号串:",@资产账户编号串#," 与 默认交易组编号串:",@默认交易组编号串#,"长度不一致！")] */
    if length(v_asset_acco_no_str)<>length(v_default_exch_group_no_str) then
        
        SET v_error_code = "pdsecuA.4.4.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号串:",v_asset_acco_no_str," 与 默认交易组编号串:",v_default_exch_group_no_str,"长度不一致！"),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号串:",v_asset_acco_no_str," 与 默认交易组编号串:",v_default_exch_group_no_str,"长度不一致！");
        end if;
        leave label_pro;
    end if;


    /* [获取流水变动][{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
    set v_jour_occur_field = concat("期初数量","|","当前数量","|","待交收数量","|","冻结数量","|","解冻数量","|","成本金额","|","实现盈亏","|","利息成本金额","|","利息收益","|");
    set v_jour_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");

    #循环获取市场编号分别为1,2,3,4对应的股东代码编号和资产账户编号

    /* set @交易组编号#=@临时_交易组编号#; */
    set v_exch_group_no=v_tmp_exch_group_no;

    /* set @当前记录序号#=0; */
    set v_curr_row_id=0;
    out_loop:loop

      /* set @记录序号#=0; */
      set v_row_id=0;

      /* [获取表记录变量语句][产品证券_账户_证券账户信息表][{记录序号},{资产账户编号},{股东代码编号}][@记录序号#,@资产账户编号#,@股东代码编号#][{产品编号}=@产品编号# and {机构编号}=@机构编号# and {市场编号}<=4 and {记录序号}>@当前记录序号# order by {记录序号}] */
      select row_id,asset_acco_no,stock_acco_no into v_row_id,v_asset_acco_no,v_stock_acco_no from db_pdsecu.tb_pdseac_secu_acco where pd_no=v_pd_no and co_no=v_co_no and exch_no<=4 and row_id>v_curr_row_id order by row_id limit 1;


      /* if @记录序号#<>0 then */
      if v_row_id<>0 then

        /* set @当前记录序号#=@记录序号#; */
        set v_curr_row_id=v_row_id;
        #然后校验持仓表中是否有该注销交易组对应的记录,若有则将默认交易组对应的持仓表记录插入(可能含有多条持仓)

        /* set @临时_记录序号#=0; */
        set v_tmp_row_id=0;
      #根据资产账户找其默认的交易组，Modify by wjp20190212

        /* [检查报错返回][locate(@资产账户编号#,@资产账户编号串#)=0][2][concat("该资产账户未维护默认交易组关系",@资产账户编号#)] */
        if locate(v_asset_acco_no,v_asset_acco_no_str)=0 then
            
            SET v_error_code = "pdsecuA.4.4.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("该资产账户未维护默认交易组关系",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("该资产账户未维护默认交易组关系",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;


        /* set @默认交易组编号#=cast(substring_index(substring(@默认交易组编号串#,locate(concat(";",@资产账户编号#,";"),@资产账户编号串#)+1),";",1) as SIGNED); */
        set v_default_exch_group_no=cast(substring_index(substring(v_default_exch_group_no_str,locate(concat(";",v_asset_acco_no,";"),v_asset_acco_no_str)+1),";",1) as SIGNED);
        inner_loop:loop

          /* set @交易组编号#=@临时_交易组编号#; */
          set v_exch_group_no=v_tmp_exch_group_no;

          /* set @记录序号#=0; */
          set v_row_id=0;

          /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{记录序号},{投资类型},{市场编号},{证券代码编号},{证券类型},{资产类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@记录序号#,@投资类型#,@市场编号#,@证券代码编号#,@证券类型#,@资产类型#,@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}<>0 and ({投资类型}=《投资类型-二级市场交易性金融资产》 or {投资类型}=《投资类型-大宗交易》)  and {记录序号}>@临时_记录序号# order by {记录序号}] */
          select row_id,invest_type,exch_no,stock_code_no,stock_type,asset_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl into v_row_id,v_invest_type,v_exch_no,v_stock_code_no,v_stock_type,v_asset_type,v_begin_qty,v_curr_qty,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty,v_cost_amt,v_realize_pandl,v_intrst_cost_amt,v_intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no<>0 and (invest_type=1 or invest_type=3)  and row_id>v_tmp_row_id order by row_id limit 1;


          /* if @记录序号#<>0  then */
          if v_row_id<>0  then

            /* [更新表记录][产品证券_持仓_交易组持仓表][{期初数量}=0,{当前数量}=0,{待交收数量}=0,{冻结数量}=0,{解冻数量}=0,{成本金额}=0,{实现盈亏}=0,{利息成本金额}=0,{利息收益}=0][{记录序号}=@记录序号#][2][@记录序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=0,curr_qty=0,pre_settle_qty=0,frozen_qty=0,unfroz_qty=0,cost_amt=0,realize_pandl=0,intrst_cost_amt=0,intrst_pandl=0 where row_id=v_row_id;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.4.4.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("记录序号=",v_row_id);
                end if;
                leave label_pro;
            end if;


            /* set @变动数量#=@当前数量#; */
            set v_occur_qty=v_curr_qty;

            /* set @交易组编号#=@默认交易组编号#; */
            set v_exch_group_no=v_default_exch_group_no;

            /* set @临时_记录序号#=@记录序号#; */
            set v_tmp_row_id=v_row_id;

            /* set @记录序号#=0; */
            set v_row_id=0;

            /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{记录序号}][@记录序号#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {投资类型}=@投资类型#] */
            select row_id into v_row_id from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and exch_no=v_exch_no and invest_type=v_invest_type limit 1;


              /* if @记录序号#<>0 then */
              if v_row_id<>0 then

                 /* if (@当前数量#+@期初数量#+@待交收数量#+@冻结数量#+@解冻数量#)<>0 then */
                 if (v_curr_qty+v_begin_qty+v_pre_settle_qty+v_frozen_qty+v_unfroz_qty)<>0 then

                   /* [更新表记录][产品证券_持仓_交易组持仓表][{期初数量}={期初数量}+@期初数量#,{当前数量}={当前数量}+@当前数量#,{待交收数量}={待交收数量}+@待交收数量#,{冻结数量}={冻结数量}+@冻结数量#,{解冻数量}={解冻数量}+@解冻数量#,{成本金额}={成本金额}+@成本金额#,{实现盈亏}={实现盈亏}+@实现盈亏#,{利息成本金额}={利息成本金额}+@利息成本金额#,{利息收益}={利息收益}+@利息收益#][{记录序号}=@记录序号#][2][@记录序号#] */
                   set v_update_date = date_format(curdate(),'%Y%m%d');
                   set v_update_time = date_format(curtime(),'%H%i%s');
                   update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=begin_qty+v_begin_qty,curr_qty=curr_qty+v_curr_qty,pre_settle_qty=pre_settle_qty+v_pre_settle_qty,frozen_qty=frozen_qty+v_frozen_qty,unfroz_qty=unfroz_qty+v_unfroz_qty,cost_amt=cost_amt+v_cost_amt,realize_pandl=realize_pandl+v_realize_pandl,intrst_cost_amt=intrst_cost_amt+v_intrst_cost_amt,intrst_pandl=intrst_pandl+v_intrst_pandl where row_id=v_row_id;
                   if v_error_code = "1" then
                               
                       SET v_error_code = "pdsecuA.4.4.2";
                       if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                       else
                           SET v_error_info = concat("记录序号=",v_row_id);
                       end if;
                       leave label_pro;
                   end if;


                   /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量}][@当前数量#][{记录序号}=@记录序号#][4][@记录序号#] */
                   select curr_qty into v_curr_qty from db_pdsecu.tb_pdsepo_exgp_posi where row_id=v_row_id limit 1;
                   if FOUND_ROWS() = 0 then
                               
                       SET v_error_code = "pdsecuA.4.4.4";
                       if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                       else
                           SET v_error_info = concat("记录序号=",v_row_id);
                       end if;
                       leave label_pro;
                   end if;

                 end if;
              else

                /* [插入表记录][产品证券_持仓_交易组持仓表][字段][字段变量][1][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
                set v_create_date = date_format(curdate(),'%Y%m%d');
                set v_create_time = date_format(curtime(),'%H%i%s');
                set v_update_date = v_create_date;
                set v_update_time = v_create_time;
                set v_update_times = 1;
                insert into db_pdsecu.tb_pdsepo_exgp_posi(
                    create_date, create_time, update_date, 
                    update_time, update_times, co_no, pd_no, 
                    exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
                    stock_code_no, stock_type, asset_type, invest_type, 
                    begin_qty, curr_qty, pre_settle_qty, frozen_qty, 
                    unfroz_qty, posi_qty_check_diff, cost_amt, realize_pandl, 
                    intrst_cost_amt, intrst_pandl) 
                value( 
                    v_create_date, v_create_time, v_update_date, 
                    v_update_time, v_update_times, v_co_no, v_pd_no, 
                    v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
                    v_stock_code_no, v_stock_type, v_asset_type, v_invest_type, 
                    v_begin_qty, v_curr_qty, v_pre_settle_qty, v_frozen_qty, 
                    v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, 
                    v_intrst_cost_amt, v_intrst_pandl);
                if v_error_code = "1" then
                            
                    SET v_error_code = "pdsecuA.4.4.1";
                    SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                    leave label_pro;
                end if;


                /* [获取记录序号][@记录序号#] */
                select LAST_INSERT_ID() into v_row_id;


                /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量}][@当前数量#][{记录序号}=@记录序号#][4][@记录序号#] */
                select curr_qty into v_curr_qty from db_pdsecu.tb_pdsepo_exgp_posi where row_id=v_row_id limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pdsecuA.4.4.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("记录序号=",v_row_id);
                    end if;
                    leave label_pro;
                end if;

              end if;

              /* set @变动后数量# = @当前数量#; */
              set v_occur_end_qty = v_curr_qty;

              /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {投资类型}=@投资类型#] */
              select begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl into v_begin_qty,v_curr_qty,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty,v_cost_amt,v_realize_pandl,v_intrst_cost_amt,v_intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and exch_no=v_exch_no and invest_type=v_invest_type limit 1;


              /* [获取流水后信息][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
              set v_jour_after_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


              /* set @业务标志# = 《业务标志-持仓转入》; */
              set v_busi_flag = 1104004;

              /* set @操作菜单# = @菜单编号#; */
              set v_oper_menu_no = v_menu_no;

              /* set @操作功能# = @功能编码#; */
              set v_oper_func_code = v_func_code;

              /* set @操作备注#="注销交易组持仓转入"; */
              set v_oper_remark_info="注销交易组持仓转入";

              /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
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
                          
                  SET v_error_code = "pdsecuA.4.4.1";
                  SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                  leave label_pro;
              end if;


              /* set @变动数量#=-1*@变动数量#; */
              set v_occur_qty=-1*v_occur_qty;

              /* set @变动后数量# = 0; */
              set v_occur_end_qty = 0;

              /* set @交易组编号#=@临时_交易组编号#; */
              set v_exch_group_no=v_tmp_exch_group_no;

              /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {投资类型}=@投资类型#] */
              select begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl into v_begin_qty,v_curr_qty,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty,v_cost_amt,v_realize_pandl,v_intrst_cost_amt,v_intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and exch_no=v_exch_no and invest_type=v_invest_type limit 1;


              /* [获取流水后信息][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
              set v_jour_after_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


              /* set @业务标志# = 《业务标志-持仓划转》; */
              set v_busi_flag = 1104003;

              /* set @操作备注#="注销交易组持仓划出"; */
              set v_oper_remark_info="注销交易组持仓划出";

              /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
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
                          
                  SET v_error_code = "pdsecuA.4.4.1";
                  SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                  leave label_pro;
              end if;

          else
            leave inner_loop;
          end if;
        end loop inner_loop;
      else
        leave out_loop;
      end if;
    end loop out_loop;
    #将交易组下大宗交易的持仓转移  到默认交易组 ,持仓序号不变。

    /* set @交易组编号# = @临时_交易组编号#; */
    set v_exch_group_no = v_tmp_exch_group_no;
    #set @操作备注#="注销交易组持仓转移";

    /* [声明游标][产品证券_持仓_大宗交易持仓表][字段][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号#][cursor_blockposi] */
    cursor_blockposi:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_blockposi CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, posi_id, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, strike_qty, 
        strike_price, fair_price, strike_date, release_date, 
        deal_status 
        from db_pdsecu.tb_pdsepo_block_trade_posi 
        where co_no = v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_blockposi][loop_blockposi] */
    open cursor_blockposi;
    loop_blockposi: LOOP
    fetch cursor_blockposi into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_posi_id, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_strike_qty, 
        v_strike_price, v_fair_price, v_strike_date, v_release_date, 
        v_deal_status;
        IF v_cursor_done THEN
            LEAVE loop_blockposi;
        END IF;


           /* [更新表记录][产品证券_持仓_大宗交易持仓表][{成交数量}=0,{成交价格}=0,{公允价格}=0,{成交日期}=0,{解禁日期}=0][{持仓序号}=@持仓序号# and {机构编号}=@机构编号# and {资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号#][2][@持仓序号#,@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#] */
           set v_update_date = date_format(curdate(),'%Y%m%d');
           set v_update_time = date_format(curtime(),'%H%i%s');
           update db_pdsecu.tb_pdsepo_block_trade_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_qty=0,strike_price=0,fair_price=0,strike_date=0,release_date=0 where posi_id=v_posi_id and co_no=v_co_no and asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no;
           if v_error_code = "1" then
                       
               SET v_error_code = "pdsecuA.4.4.2";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("持仓序号=",v_posi_id,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
               else
                   SET v_error_info = concat("持仓序号=",v_posi_id,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
               end if;
               close cursor_blockposi;
               leave label_pro;
           end if;

           #根据资产账户找其默认的交易组，Modify by wjp20190212

           /* [检查报错返回][locate(@资产账户编号#,@资产账户编号串#)=0][2][concat("该资产账户未维护默认交易组关系",@资产账户编号#)] */
           if locate(v_asset_acco_no,v_asset_acco_no_str)=0 then
               
               SET v_error_code = "pdsecuA.4.4.2";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("该资产账户未维护默认交易组关系",v_asset_acco_no),"#",v_mysql_message);
               else
                   SET v_error_info = concat("该资产账户未维护默认交易组关系",v_asset_acco_no);
               end if;
               close cursor_blockposi;
               leave label_pro;
           end if;


            /* set @默认交易组编号#=cast(substring_index(substring(@默认交易组编号串#,locate(concat(";",@资产账户编号#,";"),@资产账户编号串#)+1),";",1) as SIGNED); */
            set v_default_exch_group_no=cast(substring_index(substring(v_default_exch_group_no_str,locate(concat(";",v_asset_acco_no,";"),v_asset_acco_no_str)+1),";",1) as SIGNED);

            /* set @操作备注#="注销交易组持仓划出"; */
            set v_oper_remark_info="注销交易组持仓划出";

            /* set @变动数量#= -1*@成交数量#; */
            set v_occur_qty= -1*v_strike_qty;

            /* set @变动价格#= -1*@成交价格#; */
            set v_occur_price= -1*v_strike_price;

            /* set @变动后数量# = 0; */
            set v_occur_end_qty = 0;

            /* set @变动后价格# = 0; */
            set v_occur_end_price = 0;

            /* set @流水变动字段# = "|公允价格|成交日期|解禁日期"; */
            set v_jour_occur_field = "|公允价格|成交日期|解禁日期";

            /* set @流水后信息# = "|0|0|0"; */
            set v_jour_after_occur_info = "|0|0|0";

            /* [插入表记录][产品证券_持仓_大宗交易持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_block_trade_posi_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, exch_group_no, asset_acco_no, exch_no, 
                stock_acco_no, stock_code_no, occur_qty, occur_end_qty, 
                occur_price, occur_end_price, jour_occur_field, jour_after_occur_info, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
                v_stock_acco_no, v_stock_code_no, v_occur_qty, v_occur_end_qty, 
                v_occur_price, v_occur_end_price, v_jour_occur_field, v_jour_after_occur_info, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.4.4.1";
                SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                close cursor_blockposi;
                leave label_pro;
            end if;


            /* set @交易组编号# = @默认交易组编号#; */
            set v_exch_group_no = v_default_exch_group_no;

            /* set @变动数量#= @成交数量#; */
            set v_occur_qty= v_strike_qty;

            /* set @变动价格#= @成交价格#; */
            set v_occur_price= v_strike_price;

            /* set @变动后数量#= @成交数量#; */
            set v_occur_end_qty= v_strike_qty;

            /* set @变动后价格#= @成交价格#; */
            set v_occur_end_price= v_strike_price;

            /* set @流水变动字段# = "|公允价格|成交日期|解禁日期"; */
            set v_jour_occur_field = "|公允价格|成交日期|解禁日期";

            /* set @持仓序号# =0; */
            set v_posi_id =0;

            /* [插入表记录][产品证券_持仓_大宗交易持仓表][字段][字段变量][1][@机构编号#,@产品编号#,@市场编号#,@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_block_trade_posi(
                create_date, create_time, update_date, 
                update_time, update_times, posi_id, co_no, 
                pd_no, asset_acco_no, exch_group_no, exch_no, 
                stock_acco_no, stock_code_no, strike_qty, strike_price, 
                fair_price, strike_date, release_date, deal_status) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_posi_id, v_co_no, 
                v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
                v_stock_acco_no, v_stock_code_no, v_strike_qty, v_strike_price, 
                v_fair_price, v_strike_date, v_release_date, v_deal_status);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.4.4.1";
                SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","市场编号=",v_exch_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                close cursor_blockposi;
                leave label_pro;
            end if;


            /* [获取记录序号][@记录序号#] */
            select LAST_INSERT_ID() into v_row_id;


            /* [更新表记录][产品证券_持仓_大宗交易持仓表][{持仓序号}=@记录序号#][{记录序号}=@记录序号# and {机构编号}=@机构编号#  and {产品编号}=@产品编号# and {市场编号} =@市场编号# and {资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {成交日期}=@成交日期#][2][@机构编号#,@产品编号#,@市场编号#,@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_block_trade_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, posi_id=v_row_id where row_id=v_row_id and co_no=v_co_no  and pd_no=v_pd_no and exch_no =v_exch_no and asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and strike_date=v_strike_date;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.4.4.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","市场编号=",v_exch_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","市场编号=",v_exch_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
                end if;
                close cursor_blockposi;
                leave label_pro;
            end if;


            /* [获取表记录变量][产品证券_持仓_大宗交易持仓表][{持仓序号},{更新次数},{股东代码编号},{证券代码编号},{成交数量},{成交价格},{公允价格},{解禁日期},{处理状态}][@持仓序号#,@更新次数#,@股东代码编号#,@证券代码编号#,@成交数量#,@成交价格#,@公允价格#,@解禁日期#,@处理状态#][{持仓序号}=@记录序号#][4][@记录序号#] */
            select posi_id,update_times,stock_acco_no,stock_code_no,strike_qty,strike_price,fair_price,release_date,deal_status into v_posi_id,v_update_times,v_stock_acco_no,v_stock_code_no,v_strike_qty,v_strike_price,v_fair_price,v_release_date,v_deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where posi_id=v_row_id limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.4.4.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("记录序号=",v_row_id);
                end if;
                close cursor_blockposi;
                leave label_pro;
            end if;


            /* set @流水后信息# = concat("|",@公允价格#,"|",@成交日期#,"|",@解禁日期#); */
            set v_jour_after_occur_info = concat("|",v_fair_price,"|",v_strike_date,"|",v_release_date);

            /* set @操作备注#="注销交易组持仓转入"; */
            set v_oper_remark_info="注销交易组持仓转入";

            /* [插入表记录][产品证券_持仓_大宗交易持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_block_trade_posi_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, exch_group_no, asset_acco_no, exch_no, 
                stock_acco_no, stock_code_no, occur_qty, occur_end_qty, 
                occur_price, occur_end_price, jour_occur_field, jour_after_occur_info, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
                v_stock_acco_no, v_stock_code_no, v_occur_qty, v_occur_end_qty, 
                v_occur_price, v_occur_end_price, v_jour_occur_field, v_jour_after_occur_info, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.4.4.1";
                SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                close cursor_blockposi;
                leave label_pro;
            end if;


    /* [关闭游标][cursor_blockposi] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_blockposi;
    end cursor_blockposi;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_注销交易组转移资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_TransferCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_TransferCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_default_exch_group_no int,
    IN p_exch_group_no int,
    IN p_menu_no int,
    IN p_asset_acco_no_str varchar(2048),
    IN p_default_exch_group_no_str varchar(2048),
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
    declare v_default_exch_group_no int;
    declare v_exch_group_no int;
    declare v_menu_no int;
    declare v_asset_acco_no_str varchar(2048);
    declare v_default_exch_group_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_exch_group_no int;
    declare v_co_no int;
    declare v_crncy_type varchar(3);
    declare v_asset_acco_str varchar(2048);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_curr_row_id bigint;
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
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
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_menu_no = p_menu_no;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_default_exch_group_no_str = p_default_exch_group_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_exch_group_no = 0;
    SET v_co_no = 0;
    SET v_crncy_type = "CNY";
    SET v_asset_acco_str = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_curr_row_id = 0;
    SET v_row_id = 0;
    SET v_asset_acco_no = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_occur_end_amt = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    
    #转移资金

    /* set @临时_交易组编号#=@交易组编号#; */
    set v_tmp_exch_group_no=v_exch_group_no;

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @资产账户串#=" "; */
    set v_asset_acco_str=" ";

    /* [检查报错返回][length(@资产账户编号串#)<>length(@默认交易组编号串#)][1][concat("资产账户编号串:",@资产账户编号串#," 与 默认交易组编号串:",@默认交易组编号串#,"长度不一致！")] */
    if length(v_asset_acco_no_str)<>length(v_default_exch_group_no_str) then
        
        SET v_error_code = "pdsecuA.4.5.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号串:",v_asset_acco_no_str," 与 默认交易组编号串:",v_default_exch_group_no_str,"长度不一致！"),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号串:",v_asset_acco_no_str," 与 默认交易组编号串:",v_default_exch_group_no_str,"长度不一致！");
        end if;
        leave label_pro;
    end if;


    /* [获取流水变动][{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{红冲蓝补金额},{实现盈亏},{利率},{利息积数},{待入账利息}][@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#] */
    set v_jour_occur_field = concat("期初金额","|","当前金额","|","冻结金额","|","解冻金额","|","待交收金额","|","沪深可用调整金额","|","港股通可用调整金额","|","金额核对差额","|","T日当日港股买入金额","|","T日当日港股卖出金额","|","T1日当日港股买入金额","|","T1日当日港股卖出金额","|","累计应收金额","|","累计应付金额","|","红冲蓝补金额","|","实现盈亏","|","利率","|","利息积数","|","待入账利息","|");
    set v_jour_occur_info = concat(v_begin_amt,"|",v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|",v_pre_settle_amt,"|",v_shsz_avail_change_amt,"|",v_hk_avail_change_amt,"|",v_amt_check_diff,"|",v_T_hk_buy_total_amt,"|",v_T_hk_sell_total_amt,"|",v_T1_hk_buy_total_amt,"|",v_T1_hk_sell_total_amt,"|",v_total_rece_amt,"|",v_total_payab_amt,"|",v_total_change_amt,"|",v_realize_pandl,"|",v_intrst_rate,"|",v_intrst_base_amt,"|",v_pre_entry_intrst_amt,"|");

    #循环获取唯一股东代码编号

    /* set @交易组编号#=@临时_交易组编号#; */
    set v_exch_group_no=v_tmp_exch_group_no;

    /* set @当前记录序号#=0; */
    set v_curr_row_id=0;
    out_loop:loop

      /* set @记录序号#=0; */
      set v_row_id=0;

      /* [获取表记录变量语句][产品证券_账户_证券账户信息表][{记录序号},{资产账户编号}][@记录序号#,@资产账户编号#][{产品编号}=@产品编号# and {机构编号}=@机构编号# and {市场编号}<=4 and {记录序号}>@当前记录序号# order by {记录序号}] */
      select row_id,asset_acco_no into v_row_id,v_asset_acco_no from db_pdsecu.tb_pdseac_secu_acco where pd_no=v_pd_no and co_no=v_co_no and exch_no<=4 and row_id>v_curr_row_id order by row_id limit 1;


      /* if @记录序号#<>0 then */
      if v_row_id<>0 then

        /* set @当前记录序号#=@记录序号#; */
        set v_curr_row_id=v_row_id;

        /* set @记录序号#=0; */
        set v_row_id=0;
        #先校验资金表中是否有该注销交易组对应的记录,若有则将默认交易组对应的资金表记录插入

        /* set @交易组编号#=@临时_交易组编号#; */
        set v_exch_group_no=v_tmp_exch_group_no;

        /* [获取表记录变量语句][产品证券_资金_交易组资金表][{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{红冲蓝补金额},{实现盈亏},{利率},{利息积数},{待入账利息}][@记录序号#,@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
        select row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_rece_amt,total_payab_amt,total_change_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt into v_row_id,v_begin_amt,v_curr_amt,v_frozen_amt,v_unfroz_amt,v_pre_settle_amt,v_shsz_avail_change_amt,v_hk_avail_change_amt,v_amt_check_diff,v_T_hk_buy_total_amt,v_T_hk_sell_total_amt,v_T1_hk_buy_total_amt,v_T1_hk_sell_total_amt,v_total_rece_amt,v_total_payab_amt,v_total_change_amt,v_realize_pandl,v_intrst_rate,v_intrst_base_amt,v_pre_entry_intrst_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


          /* if (@记录序号#<>0 and locate(@资产账户编号#,@资产账户串#)=0) then */
          if (v_row_id<>0 and locate(v_asset_acco_no,v_asset_acco_str)=0) then
      #根据资产账户找其默认的交易组，Modify by wjp20190212

            /* [检查报错返回][locate(@资产账户编号#,@资产账户编号串#)=0][2][concat("该资产账户未维护默认交易组关系",@资产账户编号#)] */
            if locate(v_asset_acco_no,v_asset_acco_no_str)=0 then
                
                SET v_error_code = "pdsecuA.4.5.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("该资产账户未维护默认交易组关系",v_asset_acco_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("该资产账户未维护默认交易组关系",v_asset_acco_no);
                end if;
                leave label_pro;
            end if;


            /* set @默认交易组编号#=cast(substring_index(substring(@默认交易组编号串#,locate(concat(";",@资产账户编号#,";"),@资产账户编号串#)+1),";",1) as SIGNED); */
            set v_default_exch_group_no=cast(substring_index(substring(v_default_exch_group_no_str,locate(concat(";",v_asset_acco_no,";"),v_asset_acco_no_str)+1),";",1) as SIGNED);

            /* [更新表记录][产品证券_资金_交易组资金表][{期初金额}=0,{当前金额}=0,{冻结金额}=0,{解冻金额}=0,{待交收金额}=0,{沪深可用调整金额}=0,{港股通可用调整金额}=0,{金额核对差额}=0,{T日当日港股买入金额}=0,{T日当日港股卖出金额}=0,{T1日当日港股买入金额}=0,{T1日当日港股卖出金额}=0,{累计应收金额}=0,{累计应付金额}=0,{红冲蓝补金额}=0,{实现盈亏}=0,{利率}=0,{利息积数}=0,{待入账利息}=0][{记录序号}=@记录序号#][2][@记录序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt=0,curr_amt=0,frozen_amt=0,unfroz_amt=0,pre_settle_amt=0,shsz_avail_change_amt=0,hk_avail_change_amt=0,amt_check_diff=0,T_hk_buy_total_amt=0,T_hk_sell_total_amt=0,T1_hk_buy_total_amt=0,T1_hk_sell_total_amt=0,total_rece_amt=0,total_payab_amt=0,total_change_amt=0,realize_pandl=0,intrst_rate=0,intrst_base_amt=0,pre_entry_intrst_amt=0 where row_id=v_row_id;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.4.5.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("记录序号=",v_row_id);
                end if;
                leave label_pro;
            end if;


            /* set @交易组编号#=@默认交易组编号#; */
            set v_exch_group_no=v_default_exch_group_no;

            /* set @记录序号#=0; */
            set v_row_id=0;

            /* set @变动金额#=@当前金额#; */
            set v_occur_amt=v_curr_amt;

            /* [获取表记录变量语句][产品证券_资金_交易组资金表][{记录序号}][@记录序号#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
            select row_id into v_row_id from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


            /* if @记录序号#>0 then */
            if v_row_id>0 then

              /* [更新表记录][产品证券_资金_交易组资金表][{期初金额}={期初金额}+@期初金额#,{当前金额}={当前金额}+@当前金额#,{冻结金额}={冻结金额}+@冻结金额#,{解冻金额}={解冻金额}+@解冻金额#,{待交收金额}={待交收金额}+@待交收金额#,{沪深可用调整金额}={沪深可用调整金额}+@沪深可用调整金额#,{港股通可用调整金额}={港股通可用调整金额}+@港股通可用调整金额#,{金额核对差额}={金额核对差额}+@金额核对差额#,{T日当日港股买入金额}={T日当日港股买入金额}+@T日当日港股买入金额#,{T日当日港股卖出金额}={T日当日港股卖出金额}+@T日当日港股卖出金额#,{T1日当日港股买入金额}={T1日当日港股买入金额}+@T1日当日港股买入金额#,{T1日当日港股卖出金额}={T1日当日港股卖出金额}+@T1日当日港股卖出金额#,{累计应收金额}={累计应收金额}+@累计应收金额#,{累计应付金额}={累计应付金额}+@累计应付金额#,{红冲蓝补金额}={红冲蓝补金额}+@红冲蓝补金额#,{实现盈亏}={实现盈亏}+@实现盈亏#,{利息积数}={利息积数}+@利息积数#,{待入账利息}={待入账利息}+@待入账利息#][{记录序号}=@记录序号#][2][@记录序号#] */
              set v_update_date = date_format(curdate(),'%Y%m%d');
              set v_update_time = date_format(curtime(),'%H%i%s');
              update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt=begin_amt+v_begin_amt,curr_amt=curr_amt+v_curr_amt,frozen_amt=frozen_amt+v_frozen_amt,unfroz_amt=unfroz_amt+v_unfroz_amt,pre_settle_amt=pre_settle_amt+v_pre_settle_amt,shsz_avail_change_amt=shsz_avail_change_amt+v_shsz_avail_change_amt,hk_avail_change_amt=hk_avail_change_amt+v_hk_avail_change_amt,amt_check_diff=amt_check_diff+v_amt_check_diff,T_hk_buy_total_amt=T_hk_buy_total_amt+v_T_hk_buy_total_amt,T_hk_sell_total_amt=T_hk_sell_total_amt+v_T_hk_sell_total_amt,T1_hk_buy_total_amt=T1_hk_buy_total_amt+v_T1_hk_buy_total_amt,T1_hk_sell_total_amt=T1_hk_sell_total_amt+v_T1_hk_sell_total_amt,total_rece_amt=total_rece_amt+v_total_rece_amt,total_payab_amt=total_payab_amt+v_total_payab_amt,total_change_amt=total_change_amt+v_total_change_amt,realize_pandl=realize_pandl+v_realize_pandl,intrst_base_amt=intrst_base_amt+v_intrst_base_amt,pre_entry_intrst_amt=pre_entry_intrst_amt+v_pre_entry_intrst_amt where row_id=v_row_id;
              if v_error_code = "1" then
                          
                  SET v_error_code = "pdsecuA.4.5.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("记录序号=",v_row_id);
                  end if;
                  leave label_pro;
              end if;


              /* [获取表记录变量][产品证券_资金_交易组资金表][{当前金额}][@当前金额#][{记录序号}=@记录序号#][4][@记录序号#] */
              select curr_amt into v_curr_amt from db_pdsecu.tb_pdseca_exgp_capit where row_id=v_row_id limit 1;
              if FOUND_ROWS() = 0 then
                          
                  SET v_error_code = "pdsecuA.4.5.4";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("记录序号=",v_row_id);
                  end if;
                  leave label_pro;
              end if;

            else

              /* [插入表记录][产品证券_资金_交易组资金表][字段][字段变量][1][@交易组编号#,@资产账户编号#,@本币币种#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_pdsecu.tb_pdseca_exgp_capit(
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  asset_acco_no, exch_group_no, crncy_type, begin_amt, 
                  curr_amt, frozen_amt, unfroz_amt, pre_settle_amt, 
                  shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, 
                  T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, 
                  total_payab_amt, total_change_amt, realize_pandl, intrst_rate, 
                  intrst_base_amt, pre_entry_intrst_amt) 
              value( 
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
                  v_curr_amt, v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, 
                  v_shsz_avail_change_amt, v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, 
                  v_T_hk_sell_total_amt, v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, 
                  v_total_payab_amt, v_total_change_amt, v_realize_pandl, v_intrst_rate, 
                  v_intrst_base_amt, v_pre_entry_intrst_amt);
              if v_error_code = "1" then
                          
                  SET v_error_code = "pdsecuA.4.5.1";
                  SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                  leave label_pro;
              end if;


              /* [获取记录序号][@记录序号#] */
              select LAST_INSERT_ID() into v_row_id;


              /* [获取表记录变量][产品证券_资金_交易组资金表][{当前金额}][@当前金额#][{记录序号}=@记录序号#][4][@记录序号#] */
              select curr_amt into v_curr_amt from db_pdsecu.tb_pdseca_exgp_capit where row_id=v_row_id limit 1;
              if FOUND_ROWS() = 0 then
                          
                  SET v_error_code = "pdsecuA.4.5.4";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("记录序号=",v_row_id);
                  end if;
                  leave label_pro;
              end if;

            end if;

           /* set @变动后金额# = @当前金额#; */
           set v_occur_end_amt = v_curr_amt;

           /* [获取流水后信息][@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#] */
           set v_jour_after_occur_info = concat(v_begin_amt,"|",v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|",v_pre_settle_amt,"|",v_shsz_avail_change_amt,"|",v_hk_avail_change_amt,"|",v_amt_check_diff,"|",v_T_hk_buy_total_amt,"|",v_T_hk_sell_total_amt,"|",v_T1_hk_buy_total_amt,"|",v_T1_hk_sell_total_amt,"|",v_total_rece_amt,"|",v_total_payab_amt,"|",v_total_change_amt,"|",v_realize_pandl,"|",v_intrst_rate,"|",v_intrst_base_amt,"|",v_pre_entry_intrst_amt,"|");


           /* set @业务标志# = 《业务标志-资金转入》; */
           set v_busi_flag = 1005002;

           /* set @操作菜单# = @菜单编号#; */
           set v_oper_menu_no = v_menu_no;

           /* set @操作功能# = @功能编码#; */
           set v_oper_func_code = v_func_code;

           /* set @操作备注#="资金转移"; */
           set v_oper_remark_info="资金转移";

           /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][1][@交易组编号#,@本币币种#,@资产账户编号#] */
           set v_create_date = date_format(curdate(),'%Y%m%d');
           set v_create_time = date_format(curtime(),'%H%i%s');
           set v_update_date = v_create_date;
           set v_update_time = v_create_time;
           set v_update_times = 1;
           insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
               create_date, create_time, update_date, 
               update_time, update_times, opor_co_no, opor_no, 
               oper_mac, oper_ip_addr, oper_info, oper_way, 
               oper_menu_no, oper_func_code, init_date, co_no, 
               pd_no, asset_acco_no, exch_group_no, crncy_type, 
               busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
               jour_after_occur_info, oper_remark_info) 
           value( 
               v_create_date, v_create_time, v_update_date, 
               v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
               v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
               v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
               v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
               v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
               v_jour_after_occur_info, v_oper_remark_info);
           if v_error_code = "1" then
                       
               SET v_error_code = "pdsecuA.4.5.1";
               SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
               leave label_pro;
           end if;


           /* set @变动金额#=-1*@变动金额#; */
           set v_occur_amt=-1*v_occur_amt;

           /* set @业务标志# = 《业务标志-资金划转》; */
           set v_busi_flag = 1005001;

           /* set @交易组编号#=@临时_交易组编号#; */
           set v_exch_group_no=v_tmp_exch_group_no;

           /* set @变动后金额#=0; */
           set v_occur_end_amt=0;

           /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][1][@交易组编号#,@本币币种#,@资产账户编号#] */
           set v_create_date = date_format(curdate(),'%Y%m%d');
           set v_create_time = date_format(curtime(),'%H%i%s');
           set v_update_date = v_create_date;
           set v_update_time = v_create_time;
           set v_update_times = 1;
           insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
               create_date, create_time, update_date, 
               update_time, update_times, opor_co_no, opor_no, 
               oper_mac, oper_ip_addr, oper_info, oper_way, 
               oper_menu_no, oper_func_code, init_date, co_no, 
               pd_no, asset_acco_no, exch_group_no, crncy_type, 
               busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
               jour_after_occur_info, oper_remark_info) 
           value( 
               v_create_date, v_create_time, v_update_date, 
               v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
               v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
               v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
               v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
               v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
               v_jour_after_occur_info, v_oper_remark_info);
           if v_error_code = "1" then
                       
               SET v_error_code = "pdsecuA.4.5.1";
               SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
               leave label_pro;
           end if;

         end if;

       /* set @资产账户串#=concat(@资产账户串#,";",@资产账户编号#); */
       set v_asset_acco_str=concat(v_asset_acco_str,";",v_asset_acco_no);
      else
        leave out_loop;
      end if;
    end loop out_loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_检查股东账户状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_CheckStockAccoStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_CheckStockAccoStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_record_count int;
    declare v_stock_acco_status varchar(2);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_limit_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_record_count = 0;
    SET v_stock_acco_status = "0";
    SET v_allow_stock_type = " ";
    SET v_busi_limit_str = " ";

    
    label_pro:BEGIN
    
    #获取股东代码编号和股东代码状态
    #[获取表记录变量][产品证券_账户_证券账户信息表][{股东代码编号},{股东代码},{股东代码状态},{允许操作证券类型},{业务限制串}][@股东代码编号#,@股东代码#,@股东代码状态#,@允许操作证券类型#,@业务限制串#][{资产账户编号} = @资产账户编号# and {市场编号} = @市场编号#][4][@资产账户编号#,@市场编号#]

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [获取表记录变量语句][产品证券_账户_证券账户信息表][count(1),min({股东代码编号})][@记录个数#,@股东代码编号#][{资产账户编号} = @资产账户编号# and {市场编号} = @市场编号# and {股东代码状态}=《股东代码状态-正常》] */
    select count(1),min(stock_acco_no) into v_record_count,v_stock_acco_no from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no = v_asset_acco_no and exch_no = v_exch_no and stock_acco_status="1" limit 1;

    #如果股东代码状态非正常，报错返回

    /* [检查报错返回][@记录个数# = 0][146][@股东代码状态#,@股东代码编号#] */
    if v_record_count = 0 then
        
        SET v_error_code = "pdsecuA.4.101.146";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("股东代码状态=",v_stock_acco_status,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("股东代码状态=",v_stock_acco_status,",","股东代码编号=",v_stock_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_账户_证券账户信息表][{股东代码},{股东代码状态},{允许操作证券类型},{业务限制串}][@股东代码#,@股东代码状态#,@允许操作证券类型#,@业务限制串#][{资产账户编号} = @资产账户编号# and {市场编号} = @市场编号# and {股东代码编号}=@股东代码编号#][145][@资产账户编号#,@市场编号#,@股东代码编号#] */
    select stock_acco,stock_acco_status,allow_stock_type,busi_limit_str into v_stock_acco,v_stock_acco_status,v_allow_stock_type,v_busi_limit_str from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no = v_asset_acco_no and exch_no = v_exch_no and stock_acco_no=v_stock_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.4.101.145";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码编号=",v_stock_acco_no);
        end if;
        leave label_pro;
    end if;

    #检查业务限制
    #如果传入的证券类型有值，检查是否可操作

    /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][147][@证券类型#,@允许操作证券类型#] */
    if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
        
        SET v_error_code = "pdsecuA.4.101.147";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
        end if;
        leave label_pro;
    end if;

    #如果传入的指令方向有值，检查是否有相应业务限制

    /* if @订单方向# = 《订单方向-新股申购》 then */
    if v_order_dir = 11 then

        /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制打新》) > 0][148][@业务限制串#] */
        if instr(v_busi_limit_str, 1) > 0 then
            
            SET v_error_code = "pdsecuA.4.101.148";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# = 《订单方向-融资回购》 then */
    if v_order_dir = 3 then

        /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制融资回购》) > 0][149][@业务限制串#] */
        if instr(v_busi_limit_str, 2) > 0 then
            
            SET v_error_code = "pdsecuA.4.101.149";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# = 《订单方向-融券回购》 then */
    if v_order_dir = 4 then

        /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制融券回购》) > 0][150][@业务限制串#] */
        if instr(v_busi_limit_str, 3) > 0 then
            
            SET v_error_code = "pdsecuA.4.101.150";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_检查账户状态持仓可用数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_CheckStockAccoStatusAvailAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_CheckStockAccoStatusAvailAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_avail_qty decimal(18,2),
    OUT p_asac_avail_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_stock_acco_status varchar(2);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_limit_str varchar(2048);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_invest_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_avail_qty = 0;
    SET v_asac_avail_qty = 0;
    SET v_stock_acco_status = "0";
    SET v_allow_stock_type = " ";
    SET v_busi_limit_str = " ";
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_invest_type = 0;

    
    label_pro:BEGIN
    
    #获取股东代码编号和股东代码状态

    /* [获取表记录变量][产品证券_账户_证券账户信息表][{股东代码编号},{股东代码状态},{允许操作证券类型},{业务限制串}][@股东代码编号#,@股东代码状态#,@允许操作证券类型#,@业务限制串#][{资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号#][9][@资产账户编号#,@股东代码编号#] */
    select stock_acco_no,stock_acco_status,allow_stock_type,busi_limit_str into v_stock_acco_no,v_stock_acco_status,v_allow_stock_type,v_busi_limit_str from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.4.102.9";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no);
        end if;
        leave label_pro;
    end if;

    #如果股东代码状态非正常，报错返回

    /* [检查报错返回][@股东代码状态# <> 《股东代码状态-正常》][146][@股东代码状态#] */
    if v_stock_acco_status <> "1" then
        
        SET v_error_code = "pdsecuA.4.102.146";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("股东代码状态=",v_stock_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("股东代码状态=",v_stock_acco_status);
        end if;
        leave label_pro;
    end if;

    #检查业务限制
    #如果传入的证券类型有值，检查是否可操作

    /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][147][@证券类型#,@允许操作证券类型#] */
    if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
        
        SET v_error_code = "pdsecuA.4.102.147";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
        end if;
        leave label_pro;
    end if;

    #如果传入的指令方向有值，检查是否有相应业务限制

    /* if @订单方向# = 《订单方向-新股申购》 then */
    if v_order_dir = 11 then

        /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制打新》) = 0][148][@业务限制串#] */
        if instr(v_busi_limit_str, 1) = 0 then
            
            SET v_error_code = "pdsecuA.4.102.148";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# = 《订单方向-融资回购》 then */
    if v_order_dir = 3 then

        /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制融资回购》) = 0][149][@业务限制串#] */
        if instr(v_busi_limit_str, 2) = 0 then
            
            SET v_error_code = "pdsecuA.4.102.149";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# = 《订单方向-融券回购》 then */
    if v_order_dir = 4 then

        /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制融券回购》) = 0][150][@业务限制串#] */
        if instr(v_busi_limit_str, 3) = 0 then
            
            SET v_error_code = "pdsecuA.4.102.150";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

    end if;
    #如果资产账户编号不为0，则检查资产账户相关数据

    /* set @资产账户可用数量# = 0; */
    set v_asac_avail_qty = 0;

    /* if @资产账户编号# <> 0 then */
    if v_asset_acco_no <> 0 then

        /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][{当前数量}+{待交收数量},{冻结数量},{解冻数量}][@当前数量#,@冻结数量#,@解冻数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and @投资类型# = 1] */
        select curr_qty+pre_settle_qty,frozen_qty,unfroz_qty into v_curr_qty,v_frozen_qty,v_unfroz_qty from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and v_invest_type = 1 limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @资产账户可用数量# = @当前数量# - @冻结数量# + @解冻数量#; */
            set v_asac_avail_qty = v_curr_qty - v_frozen_qty + v_unfroz_qty;
        end if;
    end if;
    #如果交易组编号不为0，则检查交易组相关数据

    /* set @交易组可用数量# = 0; */
    set v_exgp_avail_qty = 0;

    /* if @交易组编号# <> 0 then */
    if v_exch_group_no <> 0 then

        /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{当前数量}+{待交收数量},{冻结数量},{解冻数量}][@当前数量#,@冻结数量#,@解冻数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and @投资类型# = 1] */
        select curr_qty+pre_settle_qty,frozen_qty,unfroz_qty into v_curr_qty,v_frozen_qty,v_unfroz_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and v_invest_type = 1 limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @交易组可用数量# = @当前数量# - @冻结数量# + @解冻数量#; */
            set v_exgp_avail_qty = v_curr_qty - v_frozen_qty + v_unfroz_qty;
        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_avail_qty = v_exgp_avail_qty;
    SET p_asac_avail_qty = v_asac_avail_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_处理银证转账资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_DealBankTransferCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_DealBankTransferCapit(
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
    IN p_occur_amt decimal(18,4),
    IN p_busi_flag int,
    IN p_crncy_type varchar(3),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_cash_id bigint,
    OUT p_asac_begin_amt decimal(18,4),
    OUT p_asac_curr_amt decimal(18,4),
    OUT p_asac_frozen_amt decimal(18,4),
    OUT p_asac_unfroz_amt decimal(18,4),
    OUT p_asac_pre_settle_amt decimal(18,4),
    OUT p_asac_shsz_avail_change_amt decimal(18,4),
    OUT p_asac_hk_avail_change_amt decimal(18,4),
    OUT p_asac_amt_check_diff decimal(18,4),
    OUT p_asac_T_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T_hk_sell_total_amt decimal(18,4),
    OUT p_asac_T1_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T1_hk_sell_total_amt decimal(18,4),
    OUT p_asac_total_rece_amt decimal(18,4),
    OUT p_asac_total_payab_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_rate decimal(18,4),
    OUT p_asac_intrst_base_amt decimal(18,4),
    OUT p_asac_pre_entry_intrst_amt decimal(18,4),
    OUT p_update_times int,
    OUT p_exgp_cash_id bigint,
    OUT p_exgp_begin_amt decimal(18,4),
    OUT p_exgp_curr_amt decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exgp_pre_settle_amt decimal(18,4),
    OUT p_exgp_shsz_avail_change_amt decimal(18,4),
    OUT p_exgp_hk_avail_change_amt decimal(18,4),
    OUT p_exgp_amt_check_diff decimal(18,4),
    OUT p_exgp_T_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exch_group_total_rece_amt decimal(18,4),
    OUT p_exch_group_total_payab_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exch_group_intrst_rate decimal(18,4),
    OUT p_exch_group_intrst_base_amt decimal(18,4),
    OUT p_exch_group_pre_entry_intrst_amt decimal(18,4),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_default_exch_group_no int;
    declare v_occur_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_crncy_type varchar(3);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_cash_id bigint;
    declare v_asac_begin_amt decimal(18,4);
    declare v_asac_curr_amt decimal(18,4);
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_pre_settle_amt decimal(18,4);
    declare v_asac_shsz_avail_change_amt decimal(18,4);
    declare v_asac_hk_avail_change_amt decimal(18,4);
    declare v_asac_amt_check_diff decimal(18,4);
    declare v_asac_T_hk_buy_total_amt decimal(18,4);
    declare v_asac_T_hk_sell_total_amt decimal(18,4);
    declare v_asac_T1_hk_buy_total_amt decimal(18,4);
    declare v_asac_T1_hk_sell_total_amt decimal(18,4);
    declare v_asac_total_rece_amt decimal(18,4);
    declare v_asac_total_payab_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_rate decimal(18,4);
    declare v_asac_intrst_base_amt decimal(18,4);
    declare v_asac_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_exgp_cash_id bigint;
    declare v_exgp_begin_amt decimal(18,4);
    declare v_exgp_curr_amt decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exgp_pre_settle_amt decimal(18,4);
    declare v_exgp_shsz_avail_change_amt decimal(18,4);
    declare v_exgp_hk_avail_change_amt decimal(18,4);
    declare v_exgp_amt_check_diff decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
    declare v_exch_group_update_times int;
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_tmp_occur_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_exch_group_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_end_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_occur_amt = p_occur_amt;
    SET v_busi_flag = p_busi_flag;
    SET v_crncy_type = p_crncy_type;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_cash_id = 0;
    SET v_asac_begin_amt = 0;
    SET v_asac_curr_amt = 0;
    SET v_asac_frozen_amt = 0;
    SET v_asac_unfroz_amt = 0;
    SET v_asac_pre_settle_amt = 0;
    SET v_asac_shsz_avail_change_amt = 0;
    SET v_asac_hk_avail_change_amt = 0;
    SET v_asac_amt_check_diff = 0;
    SET v_asac_T_hk_buy_total_amt = 0;
    SET v_asac_T_hk_sell_total_amt = 0;
    SET v_asac_T1_hk_buy_total_amt = 0;
    SET v_asac_T1_hk_sell_total_amt = 0;
    SET v_asac_total_rece_amt = 0;
    SET v_asac_total_payab_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_rate = 0;
    SET v_asac_intrst_base_amt = 0;
    SET v_asac_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;
    SET v_exgp_cash_id = 0;
    SET v_exgp_begin_amt = 0;
    SET v_exgp_curr_amt = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exgp_pre_settle_amt = 0;
    SET v_exgp_shsz_avail_change_amt = 0;
    SET v_exgp_hk_avail_change_amt = 0;
    SET v_exgp_amt_check_diff = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exch_group_intrst_rate = 0;
    SET v_exch_group_intrst_base_amt = 0;
    SET v_exch_group_pre_entry_intrst_amt = 0;
    SET v_exch_group_update_times = 0;
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_oper_remark_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_tmp_occur_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_exch_group_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_end_amt = 0;

    
    label_pro:BEGIN
    

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;

    /* set @冻结金额# = 0; */
    set v_frozen_amt = 0;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @待交收金额# = 0; */
    set v_pre_settle_amt = 0;

    /* set @沪深可用调整金额# = 0; */
    set v_shsz_avail_change_amt = 0;

    /* set @港股通可用调整金额# = 0; */
    set v_hk_avail_change_amt = 0;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @T日当日港股买入金额#=0; */
    set v_T_hk_buy_total_amt=0;

    /* set @T日当日港股卖出金额#=0; */
    set v_T_hk_sell_total_amt=0;

    /* set @T1日当日港股买入金额#=0; */
    set v_T1_hk_buy_total_amt=0;

    /* set @T1日当日港股卖出金额#=0; */
    set v_T1_hk_sell_total_amt=0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @红冲蓝补金额# = 0; */
    set v_total_change_amt = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利率# = 0; */
    set v_intrst_rate = 0;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* set @操作备注#="银证转账资金变动 !"; */
    set v_oper_remark_info="银证转账资金变动 !";

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @临时_变动金额#=@变动金额#; */
    set v_tmp_occur_amt=v_occur_amt;

    /* set @流水变动字段#=" "; */
    set v_jour_occur_field=" ";

    /* set @流水后信息#=" "; */
    set v_jour_after_occur_info=" ";

    /* set @交易组编号#=@默认交易组编号#; */
    set v_exch_group_no=v_default_exch_group_no;

    /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#][2][@交易组编号#,@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_exgp_capit (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, pre_settle_amt, 
        shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, 
        T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, 
        total_payab_amt, total_change_amt, realize_pandl, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
        v_curr_amt, v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, 
        v_shsz_avail_change_amt, v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, 
        v_T_hk_sell_total_amt, v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, 
        v_total_payab_amt, v_total_change_amt, v_realize_pandl, v_intrst_rate, 
        v_intrst_base_amt, v_pre_entry_intrst_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.4.103.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{更新次数}][@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组港股通可用调整金额#,@交易组金额核对差额#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}="CNY"][4][@交易组编号#,@资产账户编号#] */
    select row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_hk_avail_change_amt,v_exgp_amt_check_diff,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type="CNY" limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.4.103.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* set @变动后金额#=@交易组当前金额#; */
    set v_occur_end_amt=v_exgp_curr_amt;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
        v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.4.103.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    #新增对资产账户的资金处理

    /* set @变动金额#=@临时_变动金额#; */
    set v_occur_amt=v_tmp_occur_amt;

    /* [插入重复更新][产品证券_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#][2][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_asac_capit (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, pre_settle_amt, shsz_avail_change_amt, 
        hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, T_hk_sell_total_amt, 
        T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, total_payab_amt, 
        total_change_amt, realize_pandl, intrst_rate, intrst_base_amt, 
        pre_entry_intrst_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_crncy_type, v_begin_amt, v_curr_amt, 
        v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, v_shsz_avail_change_amt, 
        v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, v_T_hk_sell_total_amt, 
        v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, v_total_payab_amt, 
        v_total_change_amt, v_realize_pandl, v_intrst_rate, v_intrst_base_amt, 
        v_pre_entry_intrst_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.4.103.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{更新次数}][@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户港股通可用调整金额#,@资产账户金额核对差额#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}="CNY"][4][@资产账户编号#] */
    select row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_hk_avail_change_amt,v_asac_amt_check_diff,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type="CNY" limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.4.103.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* set @变动后金额#=@资产账户当前金额#; */
    set v_occur_end_amt=v_asac_curr_amt;

    /* [插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_asac_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, crncy_type, busi_flag, 
        occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_crncy_type, v_busi_flag, 
        v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.4.103.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asac_cash_id = v_asac_cash_id;
    SET p_asac_begin_amt = v_asac_begin_amt;
    SET p_asac_curr_amt = v_asac_curr_amt;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_pre_settle_amt = v_asac_pre_settle_amt;
    SET p_asac_shsz_avail_change_amt = v_asac_shsz_avail_change_amt;
    SET p_asac_hk_avail_change_amt = v_asac_hk_avail_change_amt;
    SET p_asac_amt_check_diff = v_asac_amt_check_diff;
    SET p_asac_T_hk_buy_total_amt = v_asac_T_hk_buy_total_amt;
    SET p_asac_T_hk_sell_total_amt = v_asac_T_hk_sell_total_amt;
    SET p_asac_T1_hk_buy_total_amt = v_asac_T1_hk_buy_total_amt;
    SET p_asac_T1_hk_sell_total_amt = v_asac_T1_hk_sell_total_amt;
    SET p_asac_total_rece_amt = v_asac_total_rece_amt;
    SET p_asac_total_payab_amt = v_asac_total_payab_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_rate = v_asac_intrst_rate;
    SET p_asac_intrst_base_amt = v_asac_intrst_base_amt;
    SET p_asac_pre_entry_intrst_amt = v_asac_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;
    SET p_exgp_cash_id = v_exgp_cash_id;
    SET p_exgp_begin_amt = v_exgp_begin_amt;
    SET p_exgp_curr_amt = v_exgp_curr_amt;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exgp_pre_settle_amt = v_exgp_pre_settle_amt;
    SET p_exgp_shsz_avail_change_amt = v_exgp_shsz_avail_change_amt;
    SET p_exgp_hk_avail_change_amt = v_exgp_hk_avail_change_amt;
    SET p_exgp_amt_check_diff = v_exgp_amt_check_diff;
    SET p_exgp_T_hk_buy_total_amt = v_exgp_T_hk_buy_total_amt;
    SET p_exgp_T_hk_sell_total_amt = v_exgp_T_hk_sell_total_amt;
    SET p_exgp_T1_hk_buy_total_amt = v_exgp_T1_hk_buy_total_amt;
    SET p_exgp_T1_hk_sell_total_amt = v_exgp_T1_hk_sell_total_amt;
    SET p_exch_group_total_rece_amt = v_exch_group_total_rece_amt;
    SET p_exch_group_total_payab_amt = v_exch_group_total_payab_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exch_group_intrst_rate = v_exch_group_intrst_rate;
    SET p_exch_group_intrst_base_amt = v_exch_group_intrst_base_amt;
    SET p_exch_group_pre_entry_intrst_amt = v_exch_group_pre_entry_intrst_amt;
    SET p_exch_group_update_times = v_exch_group_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_查询获取交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_GetExgpCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_GetExgpCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_cash_id bigint,
    OUT p_exch_group_no int,
    OUT p_exgp_begin_amt decimal(18,4),
    OUT p_exgp_curr_amt decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exgp_pre_settle_amt decimal(18,4),
    OUT p_exgp_shsz_avail_change_amt decimal(18,4),
    OUT p_exgp_hk_avail_change_amt decimal(18,4),
    OUT p_exgp_amt_check_diff decimal(18,4),
    OUT p_exgp_T_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exch_group_total_rece_amt decimal(18,4),
    OUT p_exch_group_total_payab_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exch_group_intrst_rate decimal(18,4),
    OUT p_exch_group_intrst_base_amt decimal(18,4),
    OUT p_exch_group_pre_entry_intrst_amt decimal(18,4),
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
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_cash_id bigint;
    declare v_exch_group_no int;
    declare v_exgp_begin_amt decimal(18,4);
    declare v_exgp_curr_amt decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exgp_pre_settle_amt decimal(18,4);
    declare v_exgp_shsz_avail_change_amt decimal(18,4);
    declare v_exgp_hk_avail_change_amt decimal(18,4);
    declare v_exgp_amt_check_diff decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_cash_id = 0;
    SET v_exch_group_no = 0;
    SET v_exgp_begin_amt = 0;
    SET v_exgp_curr_amt = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exgp_pre_settle_amt = 0;
    SET v_exgp_shsz_avail_change_amt = 0;
    SET v_exgp_hk_avail_change_amt = 0;
    SET v_exgp_amt_check_diff = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exch_group_intrst_rate = 0;
    SET v_exch_group_intrst_base_amt = 0;
    SET v_exch_group_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][产品证券_资金_交易组资金表][{记录序号},{交易组编号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{更新次数}][@交易组资金序号#,@交易组编号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组港股通可用调整金额#,@交易组金额核对差额#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@更新次数#][{产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {记录序号}>@查询记录序号#] */
    select row_id,exch_group_no,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_exgp_cash_id,v_exch_group_no,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_hk_avail_change_amt,v_exgp_amt_check_diff,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_update_times from db_pdsecu.tb_pdseca_exgp_capit where pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and row_id>v_query_row_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_cash_id = v_exgp_cash_id;
    SET p_exch_group_no = v_exch_group_no;
    SET p_exgp_begin_amt = v_exgp_begin_amt;
    SET p_exgp_curr_amt = v_exgp_curr_amt;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exgp_pre_settle_amt = v_exgp_pre_settle_amt;
    SET p_exgp_shsz_avail_change_amt = v_exgp_shsz_avail_change_amt;
    SET p_exgp_hk_avail_change_amt = v_exgp_hk_avail_change_amt;
    SET p_exgp_amt_check_diff = v_exgp_amt_check_diff;
    SET p_exgp_T_hk_buy_total_amt = v_exgp_T_hk_buy_total_amt;
    SET p_exgp_T_hk_sell_total_amt = v_exgp_T_hk_sell_total_amt;
    SET p_exgp_T1_hk_buy_total_amt = v_exgp_T1_hk_buy_total_amt;
    SET p_exgp_T1_hk_sell_total_amt = v_exgp_T1_hk_sell_total_amt;
    SET p_exch_group_total_rece_amt = v_exch_group_total_rece_amt;
    SET p_exch_group_total_payab_amt = v_exch_group_total_payab_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exch_group_intrst_rate = v_exch_group_intrst_rate;
    SET p_exch_group_intrst_base_amt = v_exch_group_intrst_base_amt;
    SET p_exch_group_pre_entry_intrst_amt = v_exch_group_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_获取大宗交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_GetBlockTradeposi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_GetBlockTradeposi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_posi_id bigint,
    OUT p_asset_acco_no int,
    OUT p_exch_group_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_fair_price decimal(16,9),
    OUT p_strike_date int,
    OUT p_release_date int,
    OUT p_deal_status varchar(2)
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_posi_id bigint;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_strike_date int;
    declare v_release_date int;
    declare v_deal_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_posi_id = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_fair_price = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_release_date = 0;
    SET v_deal_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_持仓_大宗交易持仓表][{记录序号},{持仓序号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{成交数量},{成交价格},{公允价格},{成交日期},{解禁日期},{处理状态}][@记录序号#,@持仓序号#,@交易组编号#,@资产账户编号#,@市场编号#,@股东代码编号#,@证券代码编号#,@成交数量#,@成交价格#,@公允价格#,@成交日期#,@解禁日期#,@处理状态#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {记录序号}>@查询记录序号# order by {记录序号}][4][@机构编号#,@产品编号#] */
    select row_id,posi_id,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,strike_qty,strike_price,fair_price,strike_date,release_date,deal_status into v_row_id,v_posi_id,v_exch_group_no,v_asset_acco_no,v_exch_no,v_stock_acco_no,v_stock_code_no,v_strike_qty,v_strike_price,v_fair_price,v_strike_date,v_release_date,v_deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where co_no = v_co_no and pd_no = v_pd_no and row_id>v_query_row_id order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.4.105.4";
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
    SET p_row_id = v_row_id;
    SET p_posi_id = v_posi_id;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_price = v_strike_price;
    SET p_fair_price = v_fair_price;
    SET p_strike_date = v_strike_date;
    SET p_release_date = v_release_date;
    SET p_deal_status = v_deal_status;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_更新大宗交易持仓公允价格
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_GetBlockTradeposiFairPrice;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_GetBlockTradeposiFairPrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_posi_id bigint,
    IN p_fair_price decimal(16,9),
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
    declare v_posi_id bigint;
    declare v_fair_price decimal(16,9);
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
    SET v_posi_id = p_posi_id;
    SET v_fair_price = p_fair_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_持仓_大宗交易持仓表][{公允价格}=@公允价格#][{持仓序号}=@持仓序号#][2][@持仓序号#,@公允价格#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_block_trade_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, fair_price=v_fair_price where posi_id=v_posi_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.4.106.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("持仓序号=",v_posi_id,",","公允价格=",v_fair_price),"#",v_mysql_message);
        else
            SET v_error_info = concat("持仓序号=",v_posi_id,",","公允价格=",v_fair_price);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_注销交易组回退资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_CancelExchGroupRollBackAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_CancelExchGroupRollBackAsacCapital(
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
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asset_acco_str varchar(2048),
    OUT p_curr_amt decimal(18,4),
    OUT p_amt_check_diff decimal(18,4),
    OUT p_total_rece_amt decimal(18,4),
    OUT p_total_payab_amt decimal(18,4),
    OUT p_total_change_amt decimal(18,4)
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
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_str varchar(2048);
    declare v_curr_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_tmp_curr_amt decimal(18,4);
    declare v_tmp_amt_check_diff decimal(18,4);
    declare v_tmp_total_rece_amt decimal(18,4);
    declare v_tmp_total_payab_amt decimal(18,4);
    declare v_tmp_total_change_amt decimal(18,4);
    declare v_curr_row_id bigint;
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_begin_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_str = " ";
    SET v_curr_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;
    SET v_crncy_type = "CNY";
    SET v_tmp_curr_amt = 0;
    SET v_tmp_amt_check_diff = 0;
    SET v_tmp_total_rece_amt = 0;
    SET v_tmp_total_payab_amt = 0;
    SET v_tmp_total_change_amt = 0;
    SET v_curr_row_id = 0;
    SET v_row_id = 0;
    SET v_asset_acco_no = 0;
    SET v_begin_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #转移资金

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @资产账户串#=" "; */
    set v_asset_acco_str=" ";

    /* set @临时_当前金额# = 0; */
    set v_tmp_curr_amt = 0;

    /* set @临时_金额核对差额# = 0; */
    set v_tmp_amt_check_diff = 0;

    /* set @临时_累计应收金额# = 0; */
    set v_tmp_total_rece_amt = 0;

    /* set @临时_累计应付金额# = 0; */
    set v_tmp_total_payab_amt = 0;

    /* set @临时_红冲蓝补金额# = 0; */
    set v_tmp_total_change_amt = 0;
    #循环获取唯一股东代码编号

    /* set @当前记录序号#=0; */
    set v_curr_row_id=0;
    out_loop:loop

      /* set @记录序号#=0; */
      set v_row_id=0;

      /* [获取表记录变量语句][产品证券_账户_证券账户信息表][{记录序号},{资产账户编号}][@记录序号#,@资产账户编号#][{产品编号}=@产品编号# and {机构编号}=@机构编号# and {市场编号}<=4 and {记录序号}>@当前记录序号# order by {记录序号}] */
      select row_id,asset_acco_no into v_row_id,v_asset_acco_no from db_pdsecu.tb_pdseac_secu_acco where pd_no=v_pd_no and co_no=v_co_no and exch_no<=4 and row_id>v_curr_row_id order by row_id limit 1;


      /* if @记录序号#<>0 then */
      if v_row_id<>0 then

        /* set @当前记录序号#=@记录序号#; */
        set v_curr_row_id=v_row_id;

        /* set @记录序号#=0; */
        set v_row_id=0;
        #先校验资金表中是否有该注销交易组对应的记录,若有则回退对应资产账户的资金。

        /* [获取表记录变量语句][产品证券_资金_交易组资金表][{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{红冲蓝补金额},{实现盈亏},{利率},{利息积数},{待入账利息}][@记录序号#,@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#][{机构编号}=@机构编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
        select row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_rece_amt,total_payab_amt,total_change_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt into v_row_id,v_begin_amt,v_curr_amt,v_frozen_amt,v_unfroz_amt,v_pre_settle_amt,v_shsz_avail_change_amt,v_hk_avail_change_amt,v_amt_check_diff,v_T_hk_buy_total_amt,v_T_hk_sell_total_amt,v_T1_hk_buy_total_amt,v_T1_hk_sell_total_amt,v_total_rece_amt,v_total_payab_amt,v_total_change_amt,v_realize_pandl,v_intrst_rate,v_intrst_base_amt,v_pre_entry_intrst_amt from db_pdsecu.tb_pdseca_exgp_capit where co_no=v_co_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


        /* [获取流水变动][{当前金额},{金额核对差额},{累计应收金额},{累计应付金额}][@当前金额#,@金额核对差额#,@累计应收金额#,@累计应付金额#] */
        set v_jour_occur_field = concat("当前金额","|","金额核对差额","|","累计应收金额","|","累计应付金额","|");
        set v_jour_occur_info = concat(v_curr_amt,"|",v_amt_check_diff,"|",v_total_rece_amt,"|",v_total_payab_amt,"|");


          /* if (@记录序号#<>0 and locate(@资产账户编号#,@资产账户串#)=0) then */
          if (v_row_id<>0 and locate(v_asset_acco_no,v_asset_acco_str)=0) then

            /* [更新表记录][产品证券_资金_交易组资金表][{期初金额}=0,{当前金额}=0,{冻结金额}=0,{解冻金额}=0,{待交收金额}=0,{沪深可用调整金额}=0,{港股通可用调整金额}=0,{金额核对差额}=0,{T日当日港股买入金额}=0,{T日当日港股卖出金额}=0,{T1日当日港股买入金额}=0,{T1日当日港股卖出金额}=0,{累计应收金额}=0,{累计应付金额}=0,{红冲蓝补金额}=0,{实现盈亏}=0,{利率}=0,{利息积数}=0,{待入账利息}=0][{记录序号}=@记录序号#][2][@记录序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt=0,curr_amt=0,frozen_amt=0,unfroz_amt=0,pre_settle_amt=0,shsz_avail_change_amt=0,hk_avail_change_amt=0,amt_check_diff=0,T_hk_buy_total_amt=0,T_hk_sell_total_amt=0,T1_hk_buy_total_amt=0,T1_hk_sell_total_amt=0,total_rece_amt=0,total_payab_amt=0,total_change_amt=0,realize_pandl=0,intrst_rate=0,intrst_base_amt=0,pre_entry_intrst_amt=0 where row_id=v_row_id;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.4.107.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("记录序号=",v_row_id);
                end if;
                leave label_pro;
            end if;


            /* set @记录序号#=0; */
            set v_row_id=0;

            /* set @变动金额#=@当前金额#; */
            set v_occur_amt=v_curr_amt;

            /* set @临时_当前金额# = @临时_当前金额# + @当前金额#; */
            set v_tmp_curr_amt = v_tmp_curr_amt + v_curr_amt;

            /* set @临时_金额核对差额# = @临时_金额核对差额# + @金额核对差额#; */
            set v_tmp_amt_check_diff = v_tmp_amt_check_diff + v_amt_check_diff;

            /* set @临时_累计应收金额# = @临时_累计应收金额# + @累计应收金额#; */
            set v_tmp_total_rece_amt = v_tmp_total_rece_amt + v_total_rece_amt;

            /* set @临时_累计应付金额# = @临时_累计应付金额# + @累计应付金额#; */
            set v_tmp_total_payab_amt = v_tmp_total_payab_amt + v_total_payab_amt;

            /* set @临时_红冲蓝补金额# = @临时_红冲蓝补金额# + @红冲蓝补金额#; */
            set v_tmp_total_change_amt = v_tmp_total_change_amt + v_total_change_amt;

            /* [获取表记录变量语句][产品证券_资金_资产账户资金表][{记录序号}][@记录序号#][{机构编号}=@机构编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
            select row_id into v_row_id from db_pdsecu.tb_pdseca_asac_capit where co_no=v_co_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


            /* if @记录序号#>0 then */
            if v_row_id>0 then

              /* [更新表记录][产品证券_资金_资产账户资金表][{当前金额}={当前金额}-@当前金额#,{金额核对差额}={金额核对差额}-@金额核对差额#,{累计应收金额}={累计应收金额} - @累计应收金额#,{累计应付金额}={累计应付金额} - @累计应付金额#,{红冲蓝补金额}={红冲蓝补金额}-@红冲蓝补金额#][{记录序号}=@记录序号#][2][@记录序号#] */
              set v_update_date = date_format(curdate(),'%Y%m%d');
              set v_update_time = date_format(curtime(),'%H%i%s');
              update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt-v_curr_amt,amt_check_diff=amt_check_diff-v_amt_check_diff,total_rece_amt=total_rece_amt - v_total_rece_amt,total_payab_amt=total_payab_amt - v_total_payab_amt,total_change_amt=total_change_amt-v_total_change_amt where row_id=v_row_id;
              if v_error_code = "1" then
                          
                  SET v_error_code = "pdsecuA.4.107.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("记录序号=",v_row_id);
                  end if;
                  leave label_pro;
              end if;


              /* [获取表记录变量][产品证券_资金_资产账户资金表][{当前金额},{金额核对差额},{累计应收金额},{累计应付金额},{红冲蓝补金额}][@当前金额#,@金额核对差额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#][{记录序号}=@记录序号#][4][@记录序号#] */
              select curr_amt,amt_check_diff,total_rece_amt,total_payab_amt,total_change_amt into v_curr_amt,v_amt_check_diff,v_total_rece_amt,v_total_payab_amt,v_total_change_amt from db_pdsecu.tb_pdseca_asac_capit where row_id=v_row_id limit 1;
              if FOUND_ROWS() = 0 then
                          
                  SET v_error_code = "pdsecuA.4.107.4";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("记录序号=",v_row_id);
                  end if;
                  leave label_pro;
              end if;

            end if;

           /* set @变动后金额# = @当前金额#; */
           set v_occur_end_amt = v_curr_amt;

           /* [获取流水后信息][@当前金额#,@金额核对差额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#] */
           set v_jour_after_occur_info = concat(v_curr_amt,"|",v_amt_check_diff,"|",v_total_rece_amt,"|",v_total_payab_amt,"|",v_total_change_amt,"|");


           /* set @业务标志# = 《业务标志-资金回退》; */
           set v_busi_flag = 1005003;

           /* set @操作菜单# = @菜单编号#; */
           set v_oper_menu_no = v_menu_no;

           /* set @操作功能# = @功能编码#; */
           set v_oper_func_code = v_func_code;

           /* set @操作备注#="注销交易组资金回退"; */
           set v_oper_remark_info="注销交易组资金回退";

           /* [插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][1][@本币币种#,@资产账户编号#] */
           set v_create_date = date_format(curdate(),'%Y%m%d');
           set v_create_time = date_format(curtime(),'%H%i%s');
           set v_update_date = v_create_date;
           set v_update_time = v_create_time;
           set v_update_times = 1;
           insert into db_pdsecu.tb_pdseca_asac_capit_jour(
               create_date, create_time, update_date, 
               update_time, update_times, opor_co_no, opor_no, 
               oper_mac, oper_ip_addr, oper_info, oper_way, 
               oper_menu_no, oper_func_code, init_date, co_no, 
               pd_no, asset_acco_no, crncy_type, busi_flag, 
               occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
               oper_remark_info) 
           value( 
               v_create_date, v_create_time, v_update_date, 
               v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
               v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
               v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
               v_pd_no, v_asset_acco_no, v_crncy_type, v_busi_flag, 
               v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
               v_oper_remark_info);
           if v_error_code = "1" then
                       
               SET v_error_code = "pdsecuA.4.107.1";
               SET v_error_info =  CONCAT(concat("本币币种=",v_crncy_type,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
               leave label_pro;
           end if;


           /* [获取表记录变量语句][产品证券_资金_交易组资金表][{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{红冲蓝补金额},{实现盈亏},{利率},{利息积数},{待入账利息}][@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#][{机构编号}=@机构编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
           select begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_rece_amt,total_payab_amt,total_change_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt into v_begin_amt,v_curr_amt,v_frozen_amt,v_unfroz_amt,v_pre_settle_amt,v_shsz_avail_change_amt,v_hk_avail_change_amt,v_amt_check_diff,v_T_hk_buy_total_amt,v_T_hk_sell_total_amt,v_T1_hk_buy_total_amt,v_T1_hk_sell_total_amt,v_total_rece_amt,v_total_payab_amt,v_total_change_amt,v_realize_pandl,v_intrst_rate,v_intrst_base_amt,v_pre_entry_intrst_amt from db_pdsecu.tb_pdseca_exgp_capit where co_no=v_co_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


           /* [获取流水变动][{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{红冲蓝补金额},{实现盈亏},{利率},{利息积数},{待入账利息}][@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#] */
           set v_jour_occur_field = concat("期初金额","|","当前金额","|","冻结金额","|","解冻金额","|","待交收金额","|","沪深可用调整金额","|","港股通可用调整金额","|","金额核对差额","|","T日当日港股买入金额","|","T日当日港股卖出金额","|","T1日当日港股买入金额","|","T1日当日港股卖出金额","|","累计应收金额","|","累计应付金额","|","红冲蓝补金额","|","实现盈亏","|","利率","|","利息积数","|","待入账利息","|");
           set v_jour_occur_info = concat(v_begin_amt,"|",v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|",v_pre_settle_amt,"|",v_shsz_avail_change_amt,"|",v_hk_avail_change_amt,"|",v_amt_check_diff,"|",v_T_hk_buy_total_amt,"|",v_T_hk_sell_total_amt,"|",v_T1_hk_buy_total_amt,"|",v_T1_hk_sell_total_amt,"|",v_total_rece_amt,"|",v_total_payab_amt,"|",v_total_change_amt,"|",v_realize_pandl,"|",v_intrst_rate,"|",v_intrst_base_amt,"|",v_pre_entry_intrst_amt,"|");


           /* [获取流水后信息][@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#] */
           set v_jour_after_occur_info = concat(v_begin_amt,"|",v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|",v_pre_settle_amt,"|",v_shsz_avail_change_amt,"|",v_hk_avail_change_amt,"|",v_amt_check_diff,"|",v_T_hk_buy_total_amt,"|",v_T_hk_sell_total_amt,"|",v_T1_hk_buy_total_amt,"|",v_T1_hk_sell_total_amt,"|",v_total_rece_amt,"|",v_total_payab_amt,"|",v_total_change_amt,"|",v_realize_pandl,"|",v_intrst_rate,"|",v_intrst_base_amt,"|",v_pre_entry_intrst_amt,"|");


           /* set @变动金额#=-1*@变动金额#; */
           set v_occur_amt=-1*v_occur_amt;

           /* set @变动后金额#=0; */
           set v_occur_end_amt=0;

           /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][1][@交易组编号#,@本币币种#,@资产账户编号#] */
           set v_create_date = date_format(curdate(),'%Y%m%d');
           set v_create_time = date_format(curtime(),'%H%i%s');
           set v_update_date = v_create_date;
           set v_update_time = v_create_time;
           set v_update_times = 1;
           insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
               create_date, create_time, update_date, 
               update_time, update_times, opor_co_no, opor_no, 
               oper_mac, oper_ip_addr, oper_info, oper_way, 
               oper_menu_no, oper_func_code, init_date, co_no, 
               pd_no, asset_acco_no, exch_group_no, crncy_type, 
               busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
               jour_after_occur_info, oper_remark_info) 
           value( 
               v_create_date, v_create_time, v_update_date, 
               v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
               v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
               v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
               v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
               v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
               v_jour_after_occur_info, v_oper_remark_info);
           if v_error_code = "1" then
                       
               SET v_error_code = "pdsecuA.4.107.1";
               SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
               leave label_pro;
           end if;

         end if;

       /* set @资产账户串#=concat(@资产账户串#,";",@资产账户编号#); */
       set v_asset_acco_str=concat(v_asset_acco_str,";",v_asset_acco_no);
      else
        leave out_loop;
      end if;
    end loop out_loop;

    /* set @当前金额# = @临时_当前金额#; */
    set v_curr_amt = v_tmp_curr_amt;

    /* set @金额核对差额# = @临时_金额核对差额#; */
    set v_amt_check_diff = v_tmp_amt_check_diff;

    /* set @累计应收金额# = @临时_累计应收金额#; */
    set v_total_rece_amt = v_tmp_total_rece_amt;

    /* set @累计应付金额# = @临时_累计应付金额#; */
    set v_total_payab_amt = v_tmp_total_payab_amt;

    /* set @红冲蓝补金额# = @临时_红冲蓝补金额#; */
    set v_total_change_amt = v_tmp_total_change_amt;

    /* set @资产账户串#=concat(@资产账户串#,";"); */
    set v_asset_acco_str=concat(v_asset_acco_str,";");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asset_acco_str = v_asset_acco_str;
    SET p_curr_amt = v_curr_amt;
    SET p_amt_check_diff = v_amt_check_diff;
    SET p_total_rece_amt = v_total_rece_amt;
    SET p_total_payab_amt = v_total_payab_amt;
    SET p_total_change_amt = v_total_change_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_注销交易组回退资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_CancelExchGroupRollBackAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_CancelExchGroupRollBackAsacPosi(
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
    declare v_exch_group_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_invest_type int;
    declare v_curr_row_id bigint;
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_tmp_row_id bigint;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_end_qty decimal(18,2);
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_posi_qty_check_diff = 0;
    SET v_invest_type = 0;
    SET v_curr_row_id = 0;
    SET v_row_id = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_tmp_row_id = 0;
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_qty = 0;
    SET v_occur_end_qty = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #转移持仓

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @持仓核对差额#=0; */
    set v_posi_qty_check_diff=0;

    /* set @投资类型#=1; */
    set v_invest_type=1;
    #循环获取市场编号分别为1,2,3,4对应的股东代码编号和资产账户编号

    /* set @当前记录序号#=0; */
    set v_curr_row_id=0;
    out_loop:loop

      /* set @记录序号#=0; */
      set v_row_id=0;

      /* [获取表记录变量语句][产品证券_账户_证券账户信息表][{记录序号},{资产账户编号},{股东代码编号}][@记录序号#,@资产账户编号#,@股东代码编号#][{产品编号}=@产品编号# and {机构编号}=@机构编号# and {市场编号}<=4 and {记录序号}>@当前记录序号# order by {记录序号}] */
      select row_id,asset_acco_no,stock_acco_no into v_row_id,v_asset_acco_no,v_stock_acco_no from db_pdsecu.tb_pdseac_secu_acco where pd_no=v_pd_no and co_no=v_co_no and exch_no<=4 and row_id>v_curr_row_id order by row_id limit 1;


      /* if @记录序号#<>0 then */
      if v_row_id<>0 then

        /* set @当前记录序号#=@记录序号#; */
        set v_curr_row_id=v_row_id;
        #然后校验持仓表中是否有该注销交易组对应的记录,若有则将对应的资产账户持仓回退。(可能含有多条持仓)

        /* set @临时_记录序号#=0; */
        set v_tmp_row_id=0;
        inner_loop:loop

          /* set @记录序号#=0; */
          set v_row_id=0;

          /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{记录序号},{市场编号},{证券代码编号},{证券类型},{资产类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@记录序号#,@市场编号#,@证券代码编号#,@证券类型#,@资产类型#,@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#][{机构编号}=@机构编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}<>0 and {投资类型}=@投资类型# and {记录序号}>@临时_记录序号# order by {记录序号}] */
          select row_id,exch_no,stock_code_no,stock_type,asset_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl into v_row_id,v_exch_no,v_stock_code_no,v_stock_type,v_asset_type,v_begin_qty,v_curr_qty,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty,v_cost_amt,v_realize_pandl,v_intrst_cost_amt,v_intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where co_no=v_co_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no<>0 and invest_type=v_invest_type and row_id>v_tmp_row_id order by row_id limit 1;


          /* [获取流水变动][{当前数量},{成本金额},{实现盈亏},{持仓核对差额}][@当前数量#,@成本金额#,@实现盈亏#,@持仓核对差额#] */
          set v_jour_occur_field = concat("当前数量","|","成本金额","|","实现盈亏","|","持仓核对差额","|");
          set v_jour_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_posi_qty_check_diff,"|");


          /* if @记录序号#<>0  then */
          if v_row_id<>0  then

            /* [更新表记录][产品证券_持仓_交易组持仓表][{期初数量}=0,{当前数量}=0,{待交收数量}=0,{冻结数量}=0,{解冻数量}=0,{成本金额}=0,{实现盈亏}=0,{利息成本金额}=0,{利息收益}=0][{记录序号}=@记录序号#][2][@记录序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=0,curr_qty=0,pre_settle_qty=0,frozen_qty=0,unfroz_qty=0,cost_amt=0,realize_pandl=0,intrst_cost_amt=0,intrst_pandl=0 where row_id=v_row_id;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.4.108.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("记录序号=",v_row_id);
                end if;
                leave label_pro;
            end if;


            /* set @变动数量#=@当前数量#; */
            set v_occur_qty=v_curr_qty;

            /* set @临时_记录序号#=@记录序号#; */
            set v_tmp_row_id=v_row_id;

            /* set @记录序号#=0; */
            set v_row_id=0;

            /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][{记录序号}][@记录序号#][{机构编号}=@机构编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {投资类型}=@投资类型#] */
            select row_id into v_row_id from db_pdsecu.tb_pdsepo_asac_posi where co_no=v_co_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and exch_no=v_exch_no and invest_type=v_invest_type limit 1;


              /* if @记录序号#<>0 then */
              if v_row_id<>0 then

                 /* if (@当前数量#+@期初数量#+@待交收数量#+@冻结数量#+@解冻数量#)<>0 then */
                 if (v_curr_qty+v_begin_qty+v_pre_settle_qty+v_frozen_qty+v_unfroz_qty)<>0 then

                   /* [更新表记录][产品证券_持仓_资产账户持仓表][{当前数量}={当前数量} - @当前数量#,{成本金额}={成本金额}-@成本金额#,{实现盈亏}={实现盈亏}-@实现盈亏#,{持仓核对差额}={持仓核对差额}-@持仓核对差额#][{记录序号}=@记录序号#][2][@记录序号#] */
                   set v_update_date = date_format(curdate(),'%Y%m%d');
                   set v_update_time = date_format(curtime(),'%H%i%s');
                   update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty - v_curr_qty,cost_amt=cost_amt-v_cost_amt,realize_pandl=realize_pandl-v_realize_pandl,posi_qty_check_diff=posi_qty_check_diff-v_posi_qty_check_diff where row_id=v_row_id;
                   if v_error_code = "1" then
                               
                       SET v_error_code = "pdsecuA.4.108.2";
                       if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                       else
                           SET v_error_info = concat("记录序号=",v_row_id);
                       end if;
                       leave label_pro;
                   end if;


                   /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{当前数量},{成本金额},{实现盈亏},{持仓核对差额}][@当前数量#,@成本金额#,@实现盈亏#,@持仓核对差额#][{记录序号}=@记录序号#][4][@记录序号#] */
                   select curr_qty,cost_amt,realize_pandl,posi_qty_check_diff into v_curr_qty,v_cost_amt,v_realize_pandl,v_posi_qty_check_diff from db_pdsecu.tb_pdsepo_asac_posi where row_id=v_row_id limit 1;
                   if FOUND_ROWS() = 0 then
                               
                       SET v_error_code = "pdsecuA.4.108.4";
                       if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                       else
                           SET v_error_info = concat("记录序号=",v_row_id);
                       end if;
                       leave label_pro;
                   end if;

                 end if;
              end if;

              /* set @变动后数量# = @当前数量#; */
              set v_occur_end_qty = v_curr_qty;

              /* [获取流水后信息][@当前数量#,@成本金额#,@实现盈亏#,@持仓核对差额#] */
              set v_jour_after_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_posi_qty_check_diff,"|");


              /* set @业务标志# = 《业务标志-持仓回退》; */
              set v_busi_flag = 1104005;

              /* set @操作菜单# = @菜单编号#; */
              set v_oper_menu_no = v_menu_no;

              /* set @操作功能# = @功能编码#; */
              set v_oper_func_code = v_func_code;

              /* set @操作备注#="注销交易组持仓回退"; */
              set v_oper_remark_info="注销交易组持仓回退";

              /* [插入表记录][产品证券_持仓_资产账户持仓流水表][字段][字段变量][1][@初始化日期#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
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
                          
                  SET v_error_code = "pdsecuA.4.108.1";
                  SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                  leave label_pro;
              end if;


              /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{市场编号},{证券代码编号},{证券类型},{资产类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@市场编号#,@证券代码编号#,@证券类型#,@资产类型#,@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#][{记录序号}=@临时_记录序号#] */
              select exch_no,stock_code_no,stock_type,asset_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl into v_exch_no,v_stock_code_no,v_stock_type,v_asset_type,v_begin_qty,v_curr_qty,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty,v_cost_amt,v_realize_pandl,v_intrst_cost_amt,v_intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where row_id=v_tmp_row_id limit 1;


              /* [获取流水变动][{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
              set v_jour_occur_field = concat("期初数量","|","当前数量","|","待交收数量","|","冻结数量","|","解冻数量","|","成本金额","|","实现盈亏","|","利息成本金额","|","利息收益","|");
              set v_jour_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


              /* [获取流水后信息][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
              set v_jour_after_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


              /* set @变动数量#=-1*@变动数量#; */
              set v_occur_qty=-1*v_occur_qty;

              /* set @变动后数量# = 0; */
              set v_occur_end_qty = 0;

              /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
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
                          
                  SET v_error_code = "pdsecuA.4.108.1";
                  SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                  leave label_pro;
              end if;

          else
            leave inner_loop;
          end if;
        end loop inner_loop;
      else
        leave out_loop;
      end if;
    end loop out_loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_查询交易组资金信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_QueryExgpCapitInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_QueryExgpCapitInfo(
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
    IN p_crncy_type varchar(3),
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
    declare v_crncy_type varchar(3);
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
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][产品证券_资金_交易组资金表][{资产账户编号},{记录序号} as {交易组资金序号},{交易组编号},{期初金额} as {交易组期初金额},{当前金额} as {交易组当前金额},{冻结金额} as {交易组冻结金额},{解冻金额}  as {交易组解冻金额},{待交收金额} as {交易组待交收金额},{沪深可用调整金额} as {交易组沪深可用调整金额},{港股通可用调整金额} as {交易组港股通可用调整金额},{金额核对差额} as {交易组金额核对差额},{T日当日港股买入金额} as {交易组T日当日港股买入金额},{T日当日港股卖出金额} as {交易组T日当日港股卖出金额},{T1日当日港股买入金额} as {交易组T1日当日港股买入金额},{T1日当日港股卖出金额} as {交易组T1日当日港股卖出金额},{累计应收金额} as {交易组累计应收金额},{累计应付金额} as {交易组累计应付金额},{实现盈亏} as {交易组实现盈亏},{利率} as {交易组利率},{利息积数} as {交易组利息积数},{待入账利息} as {交易组待入账利息},{更新次数}][{机构编号}=@机构编号# and {交易组编号}=@交易组编号# and {产品编号}=@产品编号# and {本币币种}=@本币币种#][@指定行数#] */
    if v_row_count = -1 then
        select asset_acco_no,row_id as exgp_cash_id,exch_group_no,begin_amt as exgp_begin_amt,curr_amt as exgp_curr_amt,frozen_amt as exgp_frozen_amt,unfroz_amt  as exgp_unfroz_amt,pre_settle_amt as exgp_pre_settle_amt,shsz_avail_change_amt as exgp_shsz_avail_change_amt,hk_avail_change_amt as exgp_hk_avail_change_amt,amt_check_diff as exgp_amt_check_diff,T_hk_buy_total_amt as exgp_T_hk_buy_total_amt,T_hk_sell_total_amt as exgp_T_hk_sell_total_amt,T1_hk_buy_total_amt as exgp_T1_hk_buy_total_amt,T1_hk_sell_total_amt as exgp_T1_hk_sell_total_amt,total_rece_amt as exch_group_total_rece_amt,total_payab_amt as exch_group_total_payab_amt,realize_pandl as exgp_realize_pandl,intrst_rate as exch_group_intrst_rate,intrst_base_amt as exch_group_intrst_base_amt,pre_entry_intrst_amt as exch_group_pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_exgp_capit where co_no=v_co_no and exch_group_no=v_exch_group_no and pd_no=v_pd_no and crncy_type=v_crncy_type;
    else
        select asset_acco_no,row_id as exgp_cash_id,exch_group_no,begin_amt as exgp_begin_amt,curr_amt as exgp_curr_amt,frozen_amt as exgp_frozen_amt,unfroz_amt  as exgp_unfroz_amt,pre_settle_amt as exgp_pre_settle_amt,shsz_avail_change_amt as exgp_shsz_avail_change_amt,hk_avail_change_amt as exgp_hk_avail_change_amt,amt_check_diff as exgp_amt_check_diff,T_hk_buy_total_amt as exgp_T_hk_buy_total_amt,T_hk_sell_total_amt as exgp_T_hk_sell_total_amt,T1_hk_buy_total_amt as exgp_T1_hk_buy_total_amt,T1_hk_sell_total_amt as exgp_T1_hk_sell_total_amt,total_rece_amt as exch_group_total_rece_amt,total_payab_amt as exch_group_total_payab_amt,realize_pandl as exgp_realize_pandl,intrst_rate as exch_group_intrst_rate,intrst_base_amt as exch_group_intrst_base_amt,pre_entry_intrst_amt as exch_group_pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_exgp_capit where co_no=v_co_no and exch_group_no=v_exch_group_no and pd_no=v_pd_no and crncy_type=v_crncy_type limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_查询交易组持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_QueryExgpPosiInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_QueryExgpPosiInfo(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][产品证券_持仓_交易组持仓表][{资产账户编号},{记录序号} as {交易组持仓序号},{交易组编号},{市场编号},{股东代码编号},{证券代码编号},{证券类型} as {交易组证券类型},{资产类型} as {交易组资产类型},{投资类型} as {交易组投资类型},{期初数量} as {交易组期初数量},{当前数量} as {交易组当前数量},{待交收数量} as {交易组待交收数量},{冻结数量} as {交易组冻结数量},{解冻数量} as {交易组解冻数量},{持仓核对差额} as {交易组持仓核对差额},{成本金额} as {交易组成本金额},{实现盈亏} as {交易组实现盈亏},{利息成本金额} as {交易组利息成本金额},{利息收益} as {交易组利息收益},{更新次数}][{机构编号}=@机构编号# and {交易组编号}=@交易组编号# and {产品编号}=@产品编号#][@指定行数#] */
    if v_row_count = -1 then
        select asset_acco_no,row_id as exgp_posi_id,exch_group_no,exch_no,stock_acco_no,stock_code_no,stock_type as exch_group_stock_type,asset_type as exch_group_asset_type,invest_type as exgp_invest_type,begin_qty as exch_group_begin_qty,curr_qty as exgp_curr_qty,pre_settle_qty as exgp_pre_settle_qty,frozen_qty as exgp_frozen_qty,unfroz_qty as exgp_unfroz_qty,posi_qty_check_diff as exgp_posi_qty_check_diff,cost_amt as exgp_cost_amt,realize_pandl as exgp_realize_pandl,intrst_cost_amt as exgp_intrst_cost_amt,intrst_pandl as exgp_intrst_pandl,update_times from db_pdsecu.tb_pdsepo_exgp_posi where co_no=v_co_no and exch_group_no=v_exch_group_no and pd_no=v_pd_no;
    else
        select asset_acco_no,row_id as exgp_posi_id,exch_group_no,exch_no,stock_acco_no,stock_code_no,stock_type as exch_group_stock_type,asset_type as exch_group_asset_type,invest_type as exgp_invest_type,begin_qty as exch_group_begin_qty,curr_qty as exgp_curr_qty,pre_settle_qty as exgp_pre_settle_qty,frozen_qty as exgp_frozen_qty,unfroz_qty as exgp_unfroz_qty,posi_qty_check_diff as exgp_posi_qty_check_diff,cost_amt as exgp_cost_amt,realize_pandl as exgp_realize_pandl,intrst_cost_amt as exgp_intrst_cost_amt,intrst_pandl as exgp_intrst_pandl,update_times from db_pdsecu.tb_pdsepo_exgp_posi where co_no=v_co_no and exch_group_no=v_exch_group_no and pd_no=v_pd_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_查询资产账户资金信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_QueryAsacCapitInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_QueryAsacCapitInfo(
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
    IN p_asset_acco_str varchar(2048),
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
    declare v_asset_acco_str varchar(2048);
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
    SET v_crncy_type = p_crncy_type;
    SET v_asset_acco_str = p_asset_acco_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][产品证券_资金_资产账户资金表][{资产账户编号},{记录序号} as {资产账户资金序号},{期初金额} as {资产账户期初金额},{当前金额} as {资产账户当前金额},{冻结金额} as {资产账户冻结金额},{解冻金额} as {资产账户解冻金额},{待交收金额} as {资产账户待交收金额},{沪深可用调整金额} as {资产账户沪深可用调整金额},{港股通可用调整金额} as {资产账户港股通可用调整金额},{金额核对差额} as {资产账户金额核对差额},{T日当日港股买入金额} as {资产账户T日当日港股买入金额},{T日当日港股卖出金额} as {资产账户T日当日港股卖出金额},{T1日当日港股买入金额} as {资产账户T1日当日港股买入金额},{T1日当日港股卖出金额} as {资产账户T1日当日港股卖出金额},{累计应收金额} as {资产账户累计应收金额},{累计应付金额} as {资产账户累计应付金额},{实现盈亏} as {资产账户实现盈亏},{利率} as {资产账户利率},{利息积数} as {资产账户利息积数},{待入账利息} as {资产账户待入账利息},{更新次数}][{机构编号}=@机构编号# and instr(@资产账户串#, concat(";",{资产账户编号},";"))>0 and {产品编号}=@产品编号# and {本币币种}=@本币币种#][@指定行数#] */
    if v_row_count = -1 then
        select asset_acco_no,row_id as asac_cash_id,begin_amt as asac_begin_amt,curr_amt as asac_curr_amt,frozen_amt as asac_frozen_amt,unfroz_amt as asac_unfroz_amt,pre_settle_amt as asac_pre_settle_amt,shsz_avail_change_amt as asac_shsz_avail_change_amt,hk_avail_change_amt as asac_hk_avail_change_amt,amt_check_diff as asac_amt_check_diff,T_hk_buy_total_amt as asac_T_hk_buy_total_amt,T_hk_sell_total_amt as asac_T_hk_sell_total_amt,T1_hk_buy_total_amt as asac_T1_hk_buy_total_amt,T1_hk_sell_total_amt as asac_T1_hk_sell_total_amt,total_rece_amt as asac_total_rece_amt,total_payab_amt as asac_total_payab_amt,realize_pandl as asac_realize_pandl,intrst_rate as asac_intrst_rate,intrst_base_amt as asac_intrst_base_amt,pre_entry_intrst_amt as asac_pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_asac_capit where co_no=v_co_no and instr(v_asset_acco_str, concat(";",asset_acco_no,";"))>0 and pd_no=v_pd_no and crncy_type=v_crncy_type;
    else
        select asset_acco_no,row_id as asac_cash_id,begin_amt as asac_begin_amt,curr_amt as asac_curr_amt,frozen_amt as asac_frozen_amt,unfroz_amt as asac_unfroz_amt,pre_settle_amt as asac_pre_settle_amt,shsz_avail_change_amt as asac_shsz_avail_change_amt,hk_avail_change_amt as asac_hk_avail_change_amt,amt_check_diff as asac_amt_check_diff,T_hk_buy_total_amt as asac_T_hk_buy_total_amt,T_hk_sell_total_amt as asac_T_hk_sell_total_amt,T1_hk_buy_total_amt as asac_T1_hk_buy_total_amt,T1_hk_sell_total_amt as asac_T1_hk_sell_total_amt,total_rece_amt as asac_total_rece_amt,total_payab_amt as asac_total_payab_amt,realize_pandl as asac_realize_pandl,intrst_rate as asac_intrst_rate,intrst_base_amt as asac_intrst_base_amt,pre_entry_intrst_amt as asac_pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_asac_capit where co_no=v_co_no and instr(v_asset_acco_str, concat(";",asset_acco_no,";"))>0 and pd_no=v_pd_no and crncy_type=v_crncy_type limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_查询资产账户持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_QueryAsacPosiInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_QueryAsacPosiInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_str varchar(2048),
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
    declare v_asset_acco_str varchar(2048);
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
    SET v_asset_acco_str = p_asset_acco_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][产品证券_持仓_资产账户持仓表][{资产账户编号},{记录序号} as {资产账户持仓序号},{市场编号},{股东代码编号},{证券代码编号},{证券类型} as {资产账户证券类型},{资产类型} as {资产账户资产类型},{投资类型} as {资产账户投资类型},{期初数量} as {资产账户期初数量},{当前数量} as {资产账户当前数量},{待交收数量} as {资产账户待交收数量},{冻结数量} as {资产账户冻结数量},{解冻数量} as {资产账户解冻数量},{持仓核对差额} as {资产账户持仓核对差额},{成本金额} as {资产账户成本金额},{实现盈亏} as {资产账户实现盈亏},{利息成本金额} as {资产账户利息成本金额},{利息收益} as {资产账户利息收益},{更新次数}][{机构编号}=@机构编号# and instr(@资产账户串#, concat(";",{资产账户编号},";"))>0 and {产品编号}=@产品编号#][@指定行数#] */
    if v_row_count = -1 then
        select asset_acco_no,row_id as asac_posi_id,exch_no,stock_acco_no,stock_code_no,stock_type as asac_stock_type,asset_type as asac_asset_type,invest_type as asac_invest_type,begin_qty as asac_begin_qty,curr_qty as asac_curr_qty,pre_settle_qty as asac_pre_settle_qty,frozen_qty as asac_frozen_qty,unfroz_qty as asac_unfroz_qty,posi_qty_check_diff as asac_posi_qty_check_diff,cost_amt as asac_cost_amt,realize_pandl as asac_realize_pandl,intrst_cost_amt as asac_intrst_cost_amt,intrst_pandl as asac_intrst_pandl,update_times from db_pdsecu.tb_pdsepo_asac_posi where co_no=v_co_no and instr(v_asset_acco_str, concat(";",asset_acco_no,";"))>0 and pd_no=v_pd_no;
    else
        select asset_acco_no,row_id as asac_posi_id,exch_no,stock_acco_no,stock_code_no,stock_type as asac_stock_type,asset_type as asac_asset_type,invest_type as asac_invest_type,begin_qty as asac_begin_qty,curr_qty as asac_curr_qty,pre_settle_qty as asac_pre_settle_qty,frozen_qty as asac_frozen_qty,unfroz_qty as asac_unfroz_qty,posi_qty_check_diff as asac_posi_qty_check_diff,cost_amt as asac_cost_amt,realize_pandl as asac_realize_pandl,intrst_cost_amt as asac_intrst_cost_amt,intrst_pandl as asac_intrst_pandl,update_times from db_pdsecu.tb_pdsepo_asac_posi where co_no=v_co_no and instr(v_asset_acco_str, concat(";",asset_acco_no,";"))>0 and pd_no=v_pd_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_查询交易组大宗持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_QueryExgpBlockTradePosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_QueryExgpBlockTradePosi(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][产品证券_持仓_大宗交易持仓表][字段][{机构编号}=@机构编号# and {交易组编号}=@交易组编号# and {产品编号}=@产品编号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, posi_id, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, strike_qty, 
        strike_price, fair_price, strike_date, release_date, 
        deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where co_no=v_co_no and exch_group_no=v_exch_group_no and pd_no=v_pd_no;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, posi_id, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, strike_qty, 
        strike_price, fair_price, strike_date, release_date, 
        deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where co_no=v_co_no and exch_group_no=v_exch_group_no and pd_no=v_pd_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_获取注销股东代码串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_GetCancelStockAccoStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_GetCancelStockAccoStr(
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
    OUT p_stock_acco_str varchar(2048)
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
    declare v_stock_acco_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_acco_str = " ";

    
    label_pro:BEGIN
    

    /* SELECT GROUP_CONCAT({股东代码编号} SEPARATOR ";")  into @股东代码串# FROM  ~产品证券_账户_证券账户信息表^ WHERE {机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and {股东代码状态}=《股东代码状态-注销》; */
    SELECT GROUP_CONCAT(stock_acco_no SEPARATOR ";")  into v_stock_acco_str FROM  db_pdsecu.tb_pdseac_secu_acco WHERE co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and stock_acco_status="3";

    /* set @股东代码串#=concat(";",@股东代码串#,";"); */
    set v_stock_acco_str=concat(";",v_stock_acco_str,";");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_str = v_stock_acco_str;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_查询默认交易组大宗持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_QueryDefaultExgpBlockTradePosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_QueryDefaultExgpBlockTradePosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_default_exch_group_no_str varchar(2048),
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
    declare v_default_exch_group_no_str varchar(2048);
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
    SET v_default_exch_group_no_str = p_default_exch_group_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][产品证券_持仓_大宗交易持仓表][字段][{机构编号}=@机构编号# and instr(@默认交易组编号串#, concat(";",{交易组编号},";"))>0 and {产品编号}=@产品编号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, posi_id, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, strike_qty, 
        strike_price, fair_price, strike_date, release_date, 
        deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where co_no=v_co_no and instr(v_default_exch_group_no_str, concat(";",exch_group_no,";"))>0 and pd_no=v_pd_no;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, posi_id, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, strike_qty, 
        strike_price, fair_price, strike_date, release_date, 
        deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where co_no=v_co_no and instr(v_default_exch_group_no_str, concat(";",exch_group_no,";"))>0 and pd_no=v_pd_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_估值更新大宗交易持仓公允价格
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_EvaUpdateBlockTradeposiFairPrice;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_EvaUpdateBlockTradeposiFairPrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_fair_price decimal(16,9),
    IN p_init_date int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_fair_price decimal(16,9);
    declare v_init_date int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_remark_info varchar(255);
    declare v_tmp_fair_price decimal(16,9);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_posi_id bigint;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_stock_acco_no int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_date int;
    declare v_release_date int;
    declare v_deal_status varchar(2);
    declare v_occur_qty decimal(18,2);
    declare v_occur_end_qty decimal(18,2);
    declare v_occur_price decimal(16,9);
    declare v_occur_end_price decimal(16,9);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_fair_price = p_fair_price;
    SET v_init_date = p_init_date;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_remark_info = " ";
    SET v_tmp_fair_price = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_posi_id = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_stock_acco_no = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_release_date = 0;
    SET v_deal_status = "0";
    SET v_occur_qty = 0;
    SET v_occur_end_qty = 0;
    SET v_occur_price = 0;
    SET v_occur_end_price = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    
    #同个产品下同支票 只计算一个公允价 set @成交日期# = @初始化日期#;

    /* set @操作备注#="估值更新公允价格"; */
    set v_oper_remark_info="估值更新公允价格";

    /* set @临时_公允价格#=@公允价格#; */
    set v_tmp_fair_price=v_fair_price;
    #[声明游标][产品证券_持仓_大宗交易持仓表][字段][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {成交日期}=@成交日期#][cursor_blockposi]

    /* [声明游标][产品证券_持仓_大宗交易持仓表][字段][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号#][cursor_blockposi] */
    cursor_blockposi:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_blockposi CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, posi_id, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, strike_qty, 
        strike_price, fair_price, strike_date, release_date, 
        deal_status 
        from db_pdsecu.tb_pdsepo_block_trade_posi 
        where co_no = v_co_no and pd_no=v_pd_no and exch_no=v_exch_no and stock_code_no=v_stock_code_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_blockposi][loop_blockposi] */
    open cursor_blockposi;
    loop_blockposi: LOOP
    fetch cursor_blockposi into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_posi_id, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_strike_qty, 
        v_strike_price, v_fair_price, v_strike_date, v_release_date, 
        v_deal_status;
        IF v_cursor_done THEN
            LEAVE loop_blockposi;
        END IF;


         /* [更新表记录][产品证券_持仓_大宗交易持仓表][{公允价格}=@临时_公允价格#][{持仓序号}=@持仓序号#][2][@持仓序号#,@临时_公允价格#] */
         set v_update_date = date_format(curdate(),'%Y%m%d');
         set v_update_time = date_format(curtime(),'%H%i%s');
         update db_pdsecu.tb_pdsepo_block_trade_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, fair_price=v_tmp_fair_price where posi_id=v_posi_id;
         if v_error_code = "1" then
                     
             SET v_error_code = "pdsecuA.4.116.2";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("持仓序号=",v_posi_id,",","临时_公允价格=",v_tmp_fair_price),"#",v_mysql_message);
             else
                 SET v_error_info = concat("持仓序号=",v_posi_id,",","临时_公允价格=",v_tmp_fair_price);
             end if;
             close cursor_blockposi;
             leave label_pro;
         end if;


          /* set @变动数量# = 0; */
          set v_occur_qty = 0;

          /* set @变动后数量# = @成交数量#; */
          set v_occur_end_qty = v_strike_qty;

          /* set @变动价格# = 0; */
          set v_occur_price = 0;

          /* set @变动后价格# = @成交价格#; */
          set v_occur_end_price = v_strike_price;

          /* set @流水变动字段# = "公允价格"; */
          set v_jour_occur_field = "公允价格";

          /* set @流水后信息# = concat(@临时_公允价格#,"|"); */
          set v_jour_after_occur_info = concat(v_tmp_fair_price,"|");

          /* set @操作菜单# = @菜单编号#; */
          set v_oper_menu_no = v_menu_no;

          /* set @操作功能# = @功能编码#; */
          set v_oper_func_code = v_func_code;

          /* [插入表记录][产品证券_持仓_大宗交易持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_pdsecu.tb_pdsepo_block_trade_posi_jour(
              create_date, create_time, update_date, 
              update_time, update_times, opor_co_no, opor_no, 
              oper_mac, oper_ip_addr, oper_info, oper_way, 
              oper_menu_no, oper_func_code, init_date, co_no, 
              pd_no, exch_group_no, asset_acco_no, exch_no, 
              stock_acco_no, stock_code_no, occur_qty, occur_end_qty, 
              occur_price, occur_end_price, jour_occur_field, jour_after_occur_info, 
              oper_remark_info) 
          value( 
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
              v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
              v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
              v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
              v_stock_acco_no, v_stock_code_no, v_occur_qty, v_occur_end_qty, 
              v_occur_price, v_occur_end_price, v_jour_occur_field, v_jour_after_occur_info, 
              v_oper_remark_info);
          if v_error_code = "1" then
                      
              SET v_error_code = "pdsecuA.4.116.1";
              SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
              close cursor_blockposi;
              leave label_pro;
          end if;


    /* [关闭游标][cursor_blockposi] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_blockposi;
    end cursor_blockposi;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_查询产品大宗持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_QueryProdBlockTradePosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_QueryProdBlockTradePosi(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;
    #[获取表记录][产品证券_持仓_大宗交易持仓表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号# and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#)][@指定行数#]

    /* [获取表记录][产品证券_持仓_大宗交易持仓表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, posi_id, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, strike_qty, 
        strike_price, fair_price, strike_date, release_date, 
        deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where co_no=v_co_no and pd_no=v_pd_no;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, posi_id, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, strike_qty, 
        strike_price, fair_price, strike_date, release_date, 
        deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where co_no=v_co_no and pd_no=v_pd_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_判断交易组在途业务
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_CheckExgpOnWayBusiness;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_CheckExgpOnWayBusiness(
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
    OUT p_record_count int
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
    declare v_record_count int;
    declare v_invest_type int;
    declare v_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_pre_settle_amt decimal(18,4);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_record_count = 0;
    SET v_invest_type = 0;
    SET v_crncy_type = "CNY";
    SET v_row_id = 0;
    SET v_pre_settle_amt = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";
        #先校验资金是否有待交收金额

        /* [获取表记录变量语句][产品证券_资金_交易组资金表][{记录序号},{待交收金额}][@记录序号#,@待交收金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
        select row_id,pre_settle_amt into v_row_id,v_pre_settle_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

           #如果有待交收金额,则不允许注销交易组

          /* if (@记录序号#<>0 and @待交收金额#<>0) then */
          if (v_row_id<>0 and v_pre_settle_amt<>0) then

            /* set @记录个数#= @记录个数#+1; */
            set v_record_count= v_record_count+1;
          end if;
        #然后校验持仓是否有待交收数量和冻结数量

         /* set @记录序号#=0; */
         set v_row_id=0;

        /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][sum({记录序号}),sum({待交收数量}),sum({冻结数量}),sum({解冻数量})][@记录序号#,@待交收数量#,@冻结数量#,@解冻数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号#  and {证券代码编号}<>" " and {投资类型}=@投资类型#] */
        select sum(row_id),sum(pre_settle_qty),sum(frozen_qty),sum(unfroz_qty) into v_row_id,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no  and stock_code_no<>" " and invest_type=v_invest_type limit 1;

        #若有待交收数量或者冻结数量,则不允许注销交易组

        /* if (@记录序号#<>0 and (@待交收数量#<>0 or @冻结数量#<>0 or @解冻数量#<>0)) then */
        if (v_row_id<>0 and (v_pre_settle_qty<>0 or v_frozen_qty<>0 or v_unfroz_qty<>0)) then

            /* set @记录个数#= @记录个数#+1; */
            set v_record_count= v_record_count+1;
          end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_转移交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_TransferExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_TransferExgpPosi(
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
    IN p_exch_group_no int,
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
    declare v_default_exch_group_no int;
    declare v_exch_group_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_posi_qty_check_diff decimal(18,2);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_tmp_row_id bigint;
    declare v_row_id bigint;
    declare v_stock_acco_no int;
    declare v_invest_type int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_occur_end_qty decimal(18,2);
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_posi_id bigint;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_strike_date int;
    declare v_release_date int;
    declare v_deal_status varchar(2);
    declare v_occur_price decimal(16,9);
    declare v_occur_end_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_exch_group_no = 0;
    SET v_crncy_type = "CNY";
    SET v_posi_qty_check_diff = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_tmp_row_id = 0;
    SET v_row_id = 0;
    SET v_stock_acco_no = 0;
    SET v_invest_type = 0;
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_occur_end_qty = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_posi_id = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_fair_price = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_release_date = 0;
    SET v_deal_status = "0";
    SET v_occur_price = 0;
    SET v_occur_end_price = 0;

    
    label_pro:BEGIN
    
    #转移持仓  @默认交易组# 为原来的， @交易组编号# 为新默认交易组。

    /* set @临时_交易组编号#=@交易组编号#; */
    set v_tmp_exch_group_no=v_exch_group_no;
    #set @机构编号#=@操作员机构编号#;

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @持仓核对差额#=0; */
    set v_posi_qty_check_diff=0;
    #set @投资类型#=1;

    /* [获取流水变动][{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
    set v_jour_occur_field = concat("期初数量","|","当前数量","|","待交收数量","|","冻结数量","|","解冻数量","|","成本金额","|","实现盈亏","|","利息成本金额","|","利息收益","|");
    set v_jour_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");

        #然后校验持仓表中是否有该注销交易组对应的记录,若有则将默认交易组对应的持仓表记录插入(可能含有多条持仓)

        /* set @临时_记录序号#=0; */
        set v_tmp_row_id=0;
        inner_loop:loop

          /* set @交易组编号#=@临时_交易组编号#; */
          set v_exch_group_no=v_tmp_exch_group_no;

          /* set @记录序号#=0; */
          set v_row_id=0;

          /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{记录序号},{股东代码编号},{投资类型},{市场编号},{证券代码编号},{证券类型},{资产类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@记录序号#,@股东代码编号#,@投资类型#,@市场编号#,@证券代码编号#,@证券类型#,@资产类型#,@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#][{交易组编号}=@默认交易组编号#  and {资产账户编号}=@资产账户编号# and {证券代码编号}<>0 and ({投资类型}=《投资类型-二级市场交易性金融资产》 or {投资类型}=《投资类型-大宗交易》)  and {记录序号}>@临时_记录序号# order by {记录序号}] */
          select row_id,stock_acco_no,invest_type,exch_no,stock_code_no,stock_type,asset_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl into v_row_id,v_stock_acco_no,v_invest_type,v_exch_no,v_stock_code_no,v_stock_type,v_asset_type,v_begin_qty,v_curr_qty,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty,v_cost_amt,v_realize_pandl,v_intrst_cost_amt,v_intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_default_exch_group_no  and asset_acco_no=v_asset_acco_no and stock_code_no<>0 and (invest_type=1 or invest_type=3)  and row_id>v_tmp_row_id order by row_id limit 1;


          /* if @记录序号#<>0  then */
          if v_row_id<>0  then

            /* [更新表记录][产品证券_持仓_交易组持仓表][{期初数量}=0,{当前数量}=0,{待交收数量}=0,{冻结数量}=0,{解冻数量}=0,{成本金额}=0,{实现盈亏}=0,{利息成本金额}=0,{利息收益}=0][{记录序号}=@记录序号#][2][@记录序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=0,curr_qty=0,pre_settle_qty=0,frozen_qty=0,unfroz_qty=0,cost_amt=0,realize_pandl=0,intrst_cost_amt=0,intrst_pandl=0 where row_id=v_row_id;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.4.119.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("记录序号=",v_row_id);
                end if;
                leave label_pro;
            end if;


            /* set @变动数量#=@当前数量#; */
            set v_occur_qty=v_curr_qty;

            /* set @交易组编号#=@临时_交易组编号#; */
            set v_exch_group_no=v_tmp_exch_group_no;

            /* set @临时_记录序号#=@记录序号#; */
            set v_tmp_row_id=v_row_id;

            /* set @记录序号#=0; */
            set v_row_id=0;

            /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{记录序号}][@记录序号#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {投资类型}=@投资类型#] */
            select row_id into v_row_id from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and exch_no=v_exch_no and invest_type=v_invest_type limit 1;


              /* if @记录序号#<>0 then */
              if v_row_id<>0 then

                 /* if (@当前数量#+@期初数量#+@待交收数量#+@冻结数量#+@解冻数量#)<>0 then */
                 if (v_curr_qty+v_begin_qty+v_pre_settle_qty+v_frozen_qty+v_unfroz_qty)<>0 then

                   /* [更新表记录][产品证券_持仓_交易组持仓表][{期初数量}={期初数量}+@期初数量#,{当前数量}={当前数量}+@当前数量#,{待交收数量}={待交收数量}+@待交收数量#,{冻结数量}={冻结数量}+@冻结数量#,{解冻数量}={解冻数量}+@解冻数量#,{成本金额}={成本金额}+@成本金额#,{实现盈亏}={实现盈亏}+@实现盈亏#,{利息成本金额}={利息成本金额}+@利息成本金额#,{利息收益}={利息收益}+@利息收益#][{记录序号}=@记录序号#][2][@记录序号#] */
                   set v_update_date = date_format(curdate(),'%Y%m%d');
                   set v_update_time = date_format(curtime(),'%H%i%s');
                   update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=begin_qty+v_begin_qty,curr_qty=curr_qty+v_curr_qty,pre_settle_qty=pre_settle_qty+v_pre_settle_qty,frozen_qty=frozen_qty+v_frozen_qty,unfroz_qty=unfroz_qty+v_unfroz_qty,cost_amt=cost_amt+v_cost_amt,realize_pandl=realize_pandl+v_realize_pandl,intrst_cost_amt=intrst_cost_amt+v_intrst_cost_amt,intrst_pandl=intrst_pandl+v_intrst_pandl where row_id=v_row_id;
                   if v_error_code = "1" then
                               
                       SET v_error_code = "pdsecuA.4.119.2";
                       if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                       else
                           SET v_error_info = concat("记录序号=",v_row_id);
                       end if;
                       leave label_pro;
                   end if;


                   /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量}][@当前数量#][{记录序号}=@记录序号#][4][@记录序号#] */
                   select curr_qty into v_curr_qty from db_pdsecu.tb_pdsepo_exgp_posi where row_id=v_row_id limit 1;
                   if FOUND_ROWS() = 0 then
                               
                       SET v_error_code = "pdsecuA.4.119.4";
                       if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                       else
                           SET v_error_info = concat("记录序号=",v_row_id);
                       end if;
                       leave label_pro;
                   end if;

                 end if;
              else

                /* [插入表记录][产品证券_持仓_交易组持仓表][字段][字段变量][1][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
                set v_create_date = date_format(curdate(),'%Y%m%d');
                set v_create_time = date_format(curtime(),'%H%i%s');
                set v_update_date = v_create_date;
                set v_update_time = v_create_time;
                set v_update_times = 1;
                insert into db_pdsecu.tb_pdsepo_exgp_posi(
                    create_date, create_time, update_date, 
                    update_time, update_times, co_no, pd_no, 
                    exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
                    stock_code_no, stock_type, asset_type, invest_type, 
                    begin_qty, curr_qty, pre_settle_qty, frozen_qty, 
                    unfroz_qty, posi_qty_check_diff, cost_amt, realize_pandl, 
                    intrst_cost_amt, intrst_pandl) 
                value( 
                    v_create_date, v_create_time, v_update_date, 
                    v_update_time, v_update_times, v_co_no, v_pd_no, 
                    v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
                    v_stock_code_no, v_stock_type, v_asset_type, v_invest_type, 
                    v_begin_qty, v_curr_qty, v_pre_settle_qty, v_frozen_qty, 
                    v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, v_realize_pandl, 
                    v_intrst_cost_amt, v_intrst_pandl);
                if v_error_code = "1" then
                            
                    SET v_error_code = "pdsecuA.4.119.1";
                    SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                    leave label_pro;
                end if;


                /* [获取记录序号][@记录序号#] */
                select LAST_INSERT_ID() into v_row_id;


                /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量}][@当前数量#][{记录序号}=@记录序号#][4][@记录序号#] */
                select curr_qty into v_curr_qty from db_pdsecu.tb_pdsepo_exgp_posi where row_id=v_row_id limit 1;
                if FOUND_ROWS() = 0 then
                            
                    SET v_error_code = "pdsecuA.4.119.4";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("记录序号=",v_row_id);
                    end if;
                    leave label_pro;
                end if;

              end if;

              /* set @变动后数量# = @当前数量#; */
              set v_occur_end_qty = v_curr_qty;

              /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {投资类型}=@投资类型#] */
              select begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl into v_begin_qty,v_curr_qty,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty,v_cost_amt,v_realize_pandl,v_intrst_cost_amt,v_intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and exch_no=v_exch_no and invest_type=v_invest_type limit 1;


              /* [获取流水后信息][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
              set v_jour_after_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


              /* set @业务标志# = 《业务标志-持仓转入》; */
              set v_busi_flag = 1104004;

              /* set @操作菜单# = @菜单编号#; */
              set v_oper_menu_no = v_menu_no;

              /* set @操作功能# = @功能编码#; */
              set v_oper_func_code = v_func_code;

              /* set @操作备注#="变更默认交易组持仓转入"; */
              set v_oper_remark_info="变更默认交易组持仓转入";

              /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
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
                          
                  SET v_error_code = "pdsecuA.4.119.1";
                  SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                  leave label_pro;
              end if;


              /* set @变动数量#=-1*@变动数量#; */
              set v_occur_qty=-1*v_occur_qty;

              /* set @变动后数量# = 0; */
              set v_occur_end_qty = 0;

              /* set @交易组编号#=@默认交易组编号#; */
              set v_exch_group_no=v_default_exch_group_no;

              /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {投资类型}=@投资类型#] */
              select begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl into v_begin_qty,v_curr_qty,v_pre_settle_qty,v_frozen_qty,v_unfroz_qty,v_cost_amt,v_realize_pandl,v_intrst_cost_amt,v_intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and exch_no=v_exch_no and invest_type=v_invest_type limit 1;


              /* [获取流水后信息][@期初数量#,@当前数量#,@待交收数量#,@冻结数量#,@解冻数量#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
              set v_jour_after_occur_info = concat(v_begin_qty,"|",v_curr_qty,"|",v_pre_settle_qty,"|",v_frozen_qty,"|",v_unfroz_qty,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


              /* set @业务标志# = 《业务标志-持仓划转》; */
              set v_busi_flag = 1104003;

              /* set @操作备注#="变更默认交易组持仓划出"; */
              set v_oper_remark_info="变更默认交易组持仓划出";

              /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
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
                          
                  SET v_error_code = "pdsecuA.4.119.1";
                  SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                  leave label_pro;
              end if;

          else
            leave inner_loop;
          end if;
        end loop inner_loop;
    #将原默认交易组下大宗交易的持仓转移  到新默认交易组 ,持仓序号不变。

    /* set @交易组编号# = @临时_交易组编号#; */
    set v_exch_group_no = v_tmp_exch_group_no;

    /* [声明游标][产品证券_持仓_大宗交易持仓表][字段][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {交易组编号}=@默认交易组编号#][cursor_blockposi] */
    cursor_blockposi:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_blockposi CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, posi_id, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code_no, strike_qty, 
        strike_price, fair_price, strike_date, release_date, 
        deal_status 
        from db_pdsecu.tb_pdsepo_block_trade_posi 
        where co_no = v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and exch_group_no=v_default_exch_group_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_blockposi][loop_blockposi] */
    open cursor_blockposi;
    loop_blockposi: LOOP
    fetch cursor_blockposi into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_posi_id, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_strike_qty, 
        v_strike_price, v_fair_price, v_strike_date, v_release_date, 
        v_deal_status;
        IF v_cursor_done THEN
            LEAVE loop_blockposi;
        END IF;


            /* set @交易组编号# = @默认交易组编号#; */
            set v_exch_group_no = v_default_exch_group_no;

           /* [更新表记录][产品证券_持仓_大宗交易持仓表][{成交数量}=0,{成交价格}=0,{公允价格}=0,{成交日期}=0,{解禁日期}=0][{持仓序号}=@持仓序号# and {机构编号}=@机构编号# and {资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号#][2][@持仓序号#,@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#] */
           set v_update_date = date_format(curdate(),'%Y%m%d');
           set v_update_time = date_format(curtime(),'%H%i%s');
           update db_pdsecu.tb_pdsepo_block_trade_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_qty=0,strike_price=0,fair_price=0,strike_date=0,release_date=0 where posi_id=v_posi_id and co_no=v_co_no and asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no;
           if v_error_code = "1" then
                       
               SET v_error_code = "pdsecuA.4.119.2";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("持仓序号=",v_posi_id,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
               else
                   SET v_error_info = concat("持仓序号=",v_posi_id,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
               end if;
               close cursor_blockposi;
               leave label_pro;
           end if;


            /* set @操作备注#="变更默认交易组持仓划出"; */
            set v_oper_remark_info="变更默认交易组持仓划出";

            /* set @变动数量#= -1*@成交数量#; */
            set v_occur_qty= -1*v_strike_qty;

            /* set @变动价格#= -1*@成交价格#; */
            set v_occur_price= -1*v_strike_price;

            /* set @变动后数量# = 0; */
            set v_occur_end_qty = 0;

            /* set @变动后价格# = 0; */
            set v_occur_end_price = 0;

            /* set @流水变动字段# = "|公允价格|成交日期|解禁日期"; */
            set v_jour_occur_field = "|公允价格|成交日期|解禁日期";

            /* set @流水后信息# = "|0|0|0"; */
            set v_jour_after_occur_info = "|0|0|0";

            /* [插入表记录][产品证券_持仓_大宗交易持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_block_trade_posi_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, exch_group_no, asset_acco_no, exch_no, 
                stock_acco_no, stock_code_no, occur_qty, occur_end_qty, 
                occur_price, occur_end_price, jour_occur_field, jour_after_occur_info, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
                v_stock_acco_no, v_stock_code_no, v_occur_qty, v_occur_end_qty, 
                v_occur_price, v_occur_end_price, v_jour_occur_field, v_jour_after_occur_info, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.4.119.1";
                SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                close cursor_blockposi;
                leave label_pro;
            end if;


            /* set @交易组编号# = @临时_交易组编号#; */
            set v_exch_group_no = v_tmp_exch_group_no;

            /* set @变动数量#= @成交数量#; */
            set v_occur_qty= v_strike_qty;

            /* set @变动价格#= @成交价格#; */
            set v_occur_price= v_strike_price;

            /* set @变动后数量#= @成交数量#; */
            set v_occur_end_qty= v_strike_qty;

            /* set @变动后价格#= @成交价格#; */
            set v_occur_end_price= v_strike_price;

            /* set @流水变动字段# = "|公允价格|成交日期|解禁日期"; */
            set v_jour_occur_field = "|公允价格|成交日期|解禁日期";

            /* set @持仓序号# =0; */
            set v_posi_id =0;

            /* [插入表记录][产品证券_持仓_大宗交易持仓表][字段][字段变量][1][@机构编号#,@产品编号#,@市场编号#,@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_block_trade_posi(
                create_date, create_time, update_date, 
                update_time, update_times, posi_id, co_no, 
                pd_no, asset_acco_no, exch_group_no, exch_no, 
                stock_acco_no, stock_code_no, strike_qty, strike_price, 
                fair_price, strike_date, release_date, deal_status) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_posi_id, v_co_no, 
                v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
                v_stock_acco_no, v_stock_code_no, v_strike_qty, v_strike_price, 
                v_fair_price, v_strike_date, v_release_date, v_deal_status);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.4.119.1";
                SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","市场编号=",v_exch_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                close cursor_blockposi;
                leave label_pro;
            end if;


            /* [获取记录序号][@记录序号#] */
            select LAST_INSERT_ID() into v_row_id;


            /* [更新表记录][产品证券_持仓_大宗交易持仓表][{持仓序号}=@记录序号#][{记录序号}=@记录序号# and {机构编号}=@机构编号#  and {产品编号}=@产品编号# and {市场编号} =@市场编号# and {资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {成交日期}=@成交日期#][2][@机构编号#,@产品编号#,@市场编号#,@资产账户编号#,@交易组编号#,@股东代码编号#,@证券代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_block_trade_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, posi_id=v_row_id where row_id=v_row_id and co_no=v_co_no  and pd_no=v_pd_no and exch_no =v_exch_no and asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and strike_date=v_strike_date;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.4.119.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","市场编号=",v_exch_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","市场编号=",v_exch_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
                end if;
                close cursor_blockposi;
                leave label_pro;
            end if;


            /* [获取表记录变量][产品证券_持仓_大宗交易持仓表][{持仓序号},{更新次数},{股东代码编号},{证券代码编号},{成交数量},{成交价格},{公允价格},{解禁日期},{处理状态}][@持仓序号#,@更新次数#,@股东代码编号#,@证券代码编号#,@成交数量#,@成交价格#,@公允价格#,@解禁日期#,@处理状态#][{持仓序号}=@记录序号#][4][@记录序号#] */
            select posi_id,update_times,stock_acco_no,stock_code_no,strike_qty,strike_price,fair_price,release_date,deal_status into v_posi_id,v_update_times,v_stock_acco_no,v_stock_code_no,v_strike_qty,v_strike_price,v_fair_price,v_release_date,v_deal_status from db_pdsecu.tb_pdsepo_block_trade_posi where posi_id=v_row_id limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.4.119.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("记录序号=",v_row_id);
                end if;
                close cursor_blockposi;
                leave label_pro;
            end if;


            /* set @流水后信息# = concat("|",@公允价格#,"|",@成交日期#,"|",@解禁日期#); */
            set v_jour_after_occur_info = concat("|",v_fair_price,"|",v_strike_date,"|",v_release_date);

            /* set @操作备注#="变更默认交易组持仓转入"; */
            set v_oper_remark_info="变更默认交易组持仓转入";

            /* [插入表记录][产品证券_持仓_大宗交易持仓流水表][字段][字段变量][1][@初始化日期#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdsepo_block_trade_posi_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, exch_group_no, asset_acco_no, exch_no, 
                stock_acco_no, stock_code_no, occur_qty, occur_end_qty, 
                occur_price, occur_end_price, jour_occur_field, jour_after_occur_info, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
                v_stock_acco_no, v_stock_code_no, v_occur_qty, v_occur_end_qty, 
                v_occur_price, v_occur_end_price, v_jour_occur_field, v_jour_after_occur_info, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.4.119.1";
                SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                close cursor_blockposi;
                leave label_pro;
            end if;


    /* [关闭游标][cursor_blockposi] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_blockposi;
    end cursor_blockposi;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_公共接口_转移交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepubif_TransferExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepubif_TransferExgpCapital(
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
    IN p_exch_group_no int,
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
    declare v_default_exch_group_no int;
    declare v_exch_group_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_row_id bigint;
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
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
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_exch_group_no = 0;
    SET v_crncy_type = "CNY";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_row_id = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_occur_end_amt = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    
    #转移资金

    /* set @临时_交易组编号#=@交易组编号#; */
    set v_tmp_exch_group_no=v_exch_group_no;
    #set @机构编号#=@操作员机构编号#;

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* [获取流水变动][{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{红冲蓝补金额},{实现盈亏},{利率},{利息积数},{待入账利息}][@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#] */
    set v_jour_occur_field = concat("期初金额","|","当前金额","|","冻结金额","|","解冻金额","|","待交收金额","|","沪深可用调整金额","|","港股通可用调整金额","|","金额核对差额","|","T日当日港股买入金额","|","T日当日港股卖出金额","|","T1日当日港股买入金额","|","T1日当日港股卖出金额","|","累计应收金额","|","累计应付金额","|","红冲蓝补金额","|","实现盈亏","|","利率","|","利息积数","|","待入账利息","|");
    set v_jour_occur_info = concat(v_begin_amt,"|",v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|",v_pre_settle_amt,"|",v_shsz_avail_change_amt,"|",v_hk_avail_change_amt,"|",v_amt_check_diff,"|",v_T_hk_buy_total_amt,"|",v_T_hk_sell_total_amt,"|",v_T1_hk_buy_total_amt,"|",v_T1_hk_sell_total_amt,"|",v_total_rece_amt,"|",v_total_payab_amt,"|",v_total_change_amt,"|",v_realize_pandl,"|",v_intrst_rate,"|",v_intrst_base_amt,"|",v_pre_entry_intrst_amt,"|");


        /* set @记录序号#=0; */
        set v_row_id=0;
        #先校验资金表中是否有原默认交易组对应的记录,若有则将默认交易组对应的资金表记录插入

         /* set @交易组编号#=@默认交易组编号#; */
         set v_exch_group_no=v_default_exch_group_no;

        /* [获取表记录变量语句][产品证券_资金_交易组资金表][{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{红冲蓝补金额},{实现盈亏},{利率},{利息积数},{待入账利息}][@记录序号#,@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
        select row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_rece_amt,total_payab_amt,total_change_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt into v_row_id,v_begin_amt,v_curr_amt,v_frozen_amt,v_unfroz_amt,v_pre_settle_amt,v_shsz_avail_change_amt,v_hk_avail_change_amt,v_amt_check_diff,v_T_hk_buy_total_amt,v_T_hk_sell_total_amt,v_T1_hk_buy_total_amt,v_T1_hk_sell_total_amt,v_total_rece_amt,v_total_payab_amt,v_total_change_amt,v_realize_pandl,v_intrst_rate,v_intrst_base_amt,v_pre_entry_intrst_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


          /* if @记录序号#<>0 then */
          if v_row_id<>0 then

            /* [更新表记录][产品证券_资金_交易组资金表][{期初金额}=0,{当前金额}=0,{冻结金额}=0,{解冻金额}=0,{待交收金额}=0,{沪深可用调整金额}=0,{港股通可用调整金额}=0,{金额核对差额}=0,{T日当日港股买入金额}=0,{T日当日港股卖出金额}=0,{T1日当日港股买入金额}=0,{T1日当日港股卖出金额}=0,{累计应收金额}=0,{累计应付金额}=0,{红冲蓝补金额}=0,{实现盈亏}=0,{利率}=0,{利息积数}=0,{待入账利息}=0][{记录序号}=@记录序号#][2][@记录序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt=0,curr_amt=0,frozen_amt=0,unfroz_amt=0,pre_settle_amt=0,shsz_avail_change_amt=0,hk_avail_change_amt=0,amt_check_diff=0,T_hk_buy_total_amt=0,T_hk_sell_total_amt=0,T1_hk_buy_total_amt=0,T1_hk_sell_total_amt=0,total_rece_amt=0,total_payab_amt=0,total_change_amt=0,realize_pandl=0,intrst_rate=0,intrst_base_amt=0,pre_entry_intrst_amt=0 where row_id=v_row_id;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.4.120.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("记录序号=",v_row_id);
                end if;
                leave label_pro;
            end if;


            /* set @交易组编号#=@临时_交易组编号#; */
            set v_exch_group_no=v_tmp_exch_group_no;

            /* set @记录序号#=0; */
            set v_row_id=0;

            /* set @变动金额#=@当前金额#; */
            set v_occur_amt=v_curr_amt;

            /* [获取表记录变量语句][产品证券_资金_交易组资金表][{记录序号}][@记录序号#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
            select row_id into v_row_id from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


            /* if @记录序号#>0 then */
            if v_row_id>0 then

              /* [更新表记录][产品证券_资金_交易组资金表][{期初金额}={期初金额}+@期初金额#,{当前金额}={当前金额}+@当前金额#,{冻结金额}={冻结金额}+@冻结金额#,{解冻金额}={解冻金额}+@解冻金额#,{待交收金额}={待交收金额}+@待交收金额#,{沪深可用调整金额}={沪深可用调整金额}+@沪深可用调整金额#,{港股通可用调整金额}={港股通可用调整金额}+@港股通可用调整金额#,{金额核对差额}={金额核对差额}+@金额核对差额#,{T日当日港股买入金额}={T日当日港股买入金额}+@T日当日港股买入金额#,{T日当日港股卖出金额}={T日当日港股卖出金额}+@T日当日港股卖出金额#,{T1日当日港股买入金额}={T1日当日港股买入金额}+@T1日当日港股买入金额#,{T1日当日港股卖出金额}={T1日当日港股卖出金额}+@T1日当日港股卖出金额#,{累计应收金额}={累计应收金额}+@累计应收金额#,{累计应付金额}={累计应付金额}+@累计应付金额#,{红冲蓝补金额}={红冲蓝补金额}+@红冲蓝补金额#,{实现盈亏}={实现盈亏}+@实现盈亏#,{利息积数}={利息积数}+@利息积数#,{待入账利息}={待入账利息}+@待入账利息#][{记录序号}=@记录序号#][2][@记录序号#] */
              set v_update_date = date_format(curdate(),'%Y%m%d');
              set v_update_time = date_format(curtime(),'%H%i%s');
              update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt=begin_amt+v_begin_amt,curr_amt=curr_amt+v_curr_amt,frozen_amt=frozen_amt+v_frozen_amt,unfroz_amt=unfroz_amt+v_unfroz_amt,pre_settle_amt=pre_settle_amt+v_pre_settle_amt,shsz_avail_change_amt=shsz_avail_change_amt+v_shsz_avail_change_amt,hk_avail_change_amt=hk_avail_change_amt+v_hk_avail_change_amt,amt_check_diff=amt_check_diff+v_amt_check_diff,T_hk_buy_total_amt=T_hk_buy_total_amt+v_T_hk_buy_total_amt,T_hk_sell_total_amt=T_hk_sell_total_amt+v_T_hk_sell_total_amt,T1_hk_buy_total_amt=T1_hk_buy_total_amt+v_T1_hk_buy_total_amt,T1_hk_sell_total_amt=T1_hk_sell_total_amt+v_T1_hk_sell_total_amt,total_rece_amt=total_rece_amt+v_total_rece_amt,total_payab_amt=total_payab_amt+v_total_payab_amt,total_change_amt=total_change_amt+v_total_change_amt,realize_pandl=realize_pandl+v_realize_pandl,intrst_base_amt=intrst_base_amt+v_intrst_base_amt,pre_entry_intrst_amt=pre_entry_intrst_amt+v_pre_entry_intrst_amt where row_id=v_row_id;
              if v_error_code = "1" then
                          
                  SET v_error_code = "pdsecuA.4.120.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("记录序号=",v_row_id);
                  end if;
                  leave label_pro;
              end if;


              /* [获取表记录变量][产品证券_资金_交易组资金表][{当前金额}][@当前金额#][{记录序号}=@记录序号#][4][@记录序号#] */
              select curr_amt into v_curr_amt from db_pdsecu.tb_pdseca_exgp_capit where row_id=v_row_id limit 1;
              if FOUND_ROWS() = 0 then
                          
                  SET v_error_code = "pdsecuA.4.120.4";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("记录序号=",v_row_id);
                  end if;
                  leave label_pro;
              end if;

            else

              /* [插入表记录][产品证券_资金_交易组资金表][字段][字段变量][1][@交易组编号#,@资产账户编号#,@本币币种#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_pdsecu.tb_pdseca_exgp_capit(
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  asset_acco_no, exch_group_no, crncy_type, begin_amt, 
                  curr_amt, frozen_amt, unfroz_amt, pre_settle_amt, 
                  shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, 
                  T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, 
                  total_payab_amt, total_change_amt, realize_pandl, intrst_rate, 
                  intrst_base_amt, pre_entry_intrst_amt) 
              value( 
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
                  v_curr_amt, v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, 
                  v_shsz_avail_change_amt, v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, 
                  v_T_hk_sell_total_amt, v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, 
                  v_total_payab_amt, v_total_change_amt, v_realize_pandl, v_intrst_rate, 
                  v_intrst_base_amt, v_pre_entry_intrst_amt);
              if v_error_code = "1" then
                          
                  SET v_error_code = "pdsecuA.4.120.1";
                  SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                  leave label_pro;
              end if;


              /* [获取记录序号][@记录序号#] */
              select LAST_INSERT_ID() into v_row_id;


              /* [获取表记录变量][产品证券_资金_交易组资金表][{当前金额}][@当前金额#][{记录序号}=@记录序号#][4][@记录序号#] */
              select curr_amt into v_curr_amt from db_pdsecu.tb_pdseca_exgp_capit where row_id=v_row_id limit 1;
              if FOUND_ROWS() = 0 then
                          
                  SET v_error_code = "pdsecuA.4.120.4";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("记录序号=",v_row_id);
                  end if;
                  leave label_pro;
              end if;

            end if;

           /* set @变动后金额# = @当前金额#; */
           set v_occur_end_amt = v_curr_amt;

           /* [获取流水后信息][@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#] */
           set v_jour_after_occur_info = concat(v_begin_amt,"|",v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|",v_pre_settle_amt,"|",v_shsz_avail_change_amt,"|",v_hk_avail_change_amt,"|",v_amt_check_diff,"|",v_T_hk_buy_total_amt,"|",v_T_hk_sell_total_amt,"|",v_T1_hk_buy_total_amt,"|",v_T1_hk_sell_total_amt,"|",v_total_rece_amt,"|",v_total_payab_amt,"|",v_total_change_amt,"|",v_realize_pandl,"|",v_intrst_rate,"|",v_intrst_base_amt,"|",v_pre_entry_intrst_amt,"|");


           /* set @业务标志# = 《业务标志-资金转入》; */
           set v_busi_flag = 1005002;

           /* set @操作菜单# = @菜单编号#; */
           set v_oper_menu_no = v_menu_no;

           /* set @操作功能# = @功能编码#; */
           set v_oper_func_code = v_func_code;

           /* set @操作备注#="变更默认交易组资金转移"; */
           set v_oper_remark_info="变更默认交易组资金转移";

           /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][1][@交易组编号#,@本币币种#,@资产账户编号#] */
           set v_create_date = date_format(curdate(),'%Y%m%d');
           set v_create_time = date_format(curtime(),'%H%i%s');
           set v_update_date = v_create_date;
           set v_update_time = v_create_time;
           set v_update_times = 1;
           insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
               create_date, create_time, update_date, 
               update_time, update_times, opor_co_no, opor_no, 
               oper_mac, oper_ip_addr, oper_info, oper_way, 
               oper_menu_no, oper_func_code, init_date, co_no, 
               pd_no, asset_acco_no, exch_group_no, crncy_type, 
               busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
               jour_after_occur_info, oper_remark_info) 
           value( 
               v_create_date, v_create_time, v_update_date, 
               v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
               v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
               v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
               v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
               v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
               v_jour_after_occur_info, v_oper_remark_info);
           if v_error_code = "1" then
                       
               SET v_error_code = "pdsecuA.4.120.1";
               SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
               leave label_pro;
           end if;


           /* set @变动金额#=-1*@变动金额#; */
           set v_occur_amt=-1*v_occur_amt;

           /* set @业务标志# = 《业务标志-资金划转》; */
           set v_busi_flag = 1005001;

           /* set @交易组编号#=@默认交易组编号#; */
           set v_exch_group_no=v_default_exch_group_no;

           /* set @变动后金额#=0; */
           set v_occur_end_amt=0;

           /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][1][@交易组编号#,@本币币种#,@资产账户编号#] */
           set v_create_date = date_format(curdate(),'%Y%m%d');
           set v_create_time = date_format(curtime(),'%H%i%s');
           set v_update_date = v_create_date;
           set v_update_time = v_create_time;
           set v_update_times = 1;
           insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
               create_date, create_time, update_date, 
               update_time, update_times, opor_co_no, opor_no, 
               oper_mac, oper_ip_addr, oper_info, oper_way, 
               oper_menu_no, oper_func_code, init_date, co_no, 
               pd_no, asset_acco_no, exch_group_no, crncy_type, 
               busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
               jour_after_occur_info, oper_remark_info) 
           value( 
               v_create_date, v_create_time, v_update_date, 
               v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
               v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
               v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
               v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
               v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
               v_jour_after_occur_info, v_oper_remark_info);
           if v_error_code = "1" then
                       
               SET v_error_code = "pdsecuA.4.120.1";
               SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
               leave label_pro;
           end if;

         end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


