DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_基础数据同步_查询公司行为表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsebasync_QueryCompanyActionTable;;
DELIMITER ;;
CREATE PROCEDURE prt_clsebasync_QueryCompanyActionTable(
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
    

    /* 调用【原子_清算证券_基础数据同步_查询公司行为表】*/
    call db_clsecu.pra_clsebasync_QueryCompanyActionTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clsecuT.4.101.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_基础数据同步_查询公司行为表出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_基础数据同步_更新公司行为表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsebasync_UpdateCompanyActionTable;;
DELIMITER ;;
CREATE PROCEDURE prt_clsebasync_UpdateCompanyActionTable(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_crncy_type varchar(3),
    IN p_par_value decimal(16,9),
    IN p_divi_cacl_num int,
    IN p_divi_amt decimal(18,4),
    IN p_divi_qty decimal(18,2),
    IN p_equity_trans_qty decimal(18,2),
    IN p_rights_issue_qty decimal(18,2),
    IN p_placement_price decimal(16,9),
    IN p_notice_date int,
    IN p_reg_date int,
    IN p_ex_date int,
    IN p_arrive_date int,
    IN p_begin_trade_date int,
    IN p_deal_flag int,
    IN p_busi_flag int,
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
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_par_value decimal(16,9);
    declare v_divi_cacl_num int;
    declare v_divi_amt decimal(18,4);
    declare v_divi_qty decimal(18,2);
    declare v_equity_trans_qty decimal(18,2);
    declare v_rights_issue_qty decimal(18,2);
    declare v_placement_price decimal(16,9);
    declare v_notice_date int;
    declare v_reg_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_deal_flag int;
    declare v_busi_flag int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_crncy_type = p_crncy_type;
    SET v_par_value = p_par_value;
    SET v_divi_cacl_num = p_divi_cacl_num;
    SET v_divi_amt = p_divi_amt;
    SET v_divi_qty = p_divi_qty;
    SET v_equity_trans_qty = p_equity_trans_qty;
    SET v_rights_issue_qty = p_rights_issue_qty;
    SET v_placement_price = p_placement_price;
    SET v_notice_date = p_notice_date;
    SET v_reg_date = p_reg_date;
    SET v_ex_date = p_ex_date;
    SET v_arrive_date = p_arrive_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_deal_flag = p_deal_flag;
    SET v_busi_flag = p_busi_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_清算证券_基础数据同步_更新公司行为表】*/
    call db_clsecu.pra_clsebasync_UpdateCompanyActionTable(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_crncy_type,
        v_par_value,
        v_divi_cacl_num,
        v_divi_amt,
        v_divi_qty,
        v_equity_trans_qty,
        v_rights_issue_qty,
        v_placement_price,
        v_notice_date,
        v_reg_date,
        v_ex_date,
        v_arrive_date,
        v_begin_trade_date,
        v_deal_flag,
        v_busi_flag,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "clsecuT.4.102.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_基础数据同步_更新公司行为表出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_基础数据同步_更新公司行为信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsebasync_UpdateCompanyActionInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_clsebasync_UpdateCompanyActionInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no_str varchar(4096),
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
    IN p_par_value_str varchar(4096),
    IN p_stock_name_str varchar(2048),
    IN p_divi_amt_str varchar(4096),
    IN p_divi_qty_str varchar(4096),
    IN p_equity_trans_qty_str varchar(4096),
    IN p_notice_date_str varchar(4096),
    IN p_reg_date_str varchar(4096),
    IN p_ex_date_str varchar(4096),
    IN p_arrive_date_str varchar(4096),
    IN p_begin_trade_date_str varchar(4096),
    IN p_split_str varchar(4),
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_par_value_str varchar(4096);
    declare v_stock_name_str varchar(2048);
    declare v_divi_amt_str varchar(4096);
    declare v_divi_qty_str varchar(4096);
    declare v_equity_trans_qty_str varchar(4096);
    declare v_notice_date_str varchar(4096);
    declare v_reg_date_str varchar(4096);
    declare v_ex_date_str varchar(4096);
    declare v_arrive_date_str varchar(4096);
    declare v_begin_trade_date_str varchar(4096);
    declare v_split_str varchar(4);
    declare v_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_stock_name varchar(64);
    declare v_tmp_divi_amt decimal(18,4);
    declare v_tmp_divi_qty decimal(18,2);
    declare v_tmp_equity_trans_qty decimal(18,2);
    declare v_tmp_notice_date int;
    declare v_tmp_reg_date int;
    declare v_tmp_ex_date int;
    declare v_tmp_begin_trade_date int;
    declare v_tmp_arrive_date int;
    declare v_crncy_type varchar(3);
    declare v_divi_cacl_num int;
    declare v_divi_amt decimal(18,4);
    declare v_divi_qty decimal(18,2);
    declare v_equity_trans_qty decimal(18,2);
    declare v_rights_issue_qty decimal(18,2);
    declare v_placement_price decimal(16,9);
    declare v_notice_date int;
    declare v_reg_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_par_value_str = p_par_value_str;
    SET v_stock_name_str = p_stock_name_str;
    SET v_divi_amt_str = p_divi_amt_str;
    SET v_divi_qty_str = p_divi_qty_str;
    SET v_equity_trans_qty_str = p_equity_trans_qty_str;
    SET v_notice_date_str = p_notice_date_str;
    SET v_reg_date_str = p_reg_date_str;
    SET v_ex_date_str = p_ex_date_str;
    SET v_arrive_date_str = p_arrive_date_str;
    SET v_begin_trade_date_str = p_begin_trade_date_str;
    SET v_split_str = p_split_str;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;
    SET v_stock_name = " ";
    SET v_tmp_divi_amt = 0;
    SET v_tmp_divi_qty = 0;
    SET v_tmp_equity_trans_qty = 0;
    SET v_tmp_notice_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_ex_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_tmp_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_divi_cacl_num = 0;
    SET v_divi_amt = 0;
    SET v_divi_qty = 0;
    SET v_equity_trans_qty = 0;
    SET v_rights_issue_qty = 0;
    SET v_placement_price = 0;
    SET v_notice_date = date_format(curdate(),'%Y%m%d');
    SET v_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_ex_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_busi_flag = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* while LOCATE(@分隔符#,@证券代码编号串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_no_str)<>0   do

          /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
          set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

          /* set @证券代码编号#=cast(substring(@证券代码编号串#,1,LOCATE(@分隔符#,@证券代码编号串#)-1) as SIGNED); */
          set v_stock_code_no=cast(substring(v_stock_code_no_str,1,LOCATE(v_split_str,v_stock_code_no_str)-1) as SIGNED);

          /* set @证券类型#=cast(substring(@证券类型串#,1,LOCATE(@分隔符#,@证券类型串#)-1) as SIGNED); */
          set v_stock_type=cast(substring(v_stock_type_str,1,LOCATE(v_split_str,v_stock_type_str)-1) as SIGNED);

          /* set @资产类型#=cast(substring(@资产类型串#,1,LOCATE(@分隔符#,@资产类型串#)-1) as SIGNED); */
          set v_asset_type=cast(substring(v_asset_type_str,1,LOCATE(v_split_str,v_asset_type_str)-1) as SIGNED);

          /* set @票面面值#=cast(substring(@票面面值串#,1,LOCATE(@分隔符#,@票面面值串#)-1) as decimal(16,9)); */
          set v_par_value=cast(substring(v_par_value_str,1,LOCATE(v_split_str,v_par_value_str)-1) as decimal(16,9));

          /* set @证券名称#=substring(@证券名称串#,1,LOCATE(@分隔符#,@证券名称串#)-1); */
          set v_stock_name=substring(v_stock_name_str,1,LOCATE(v_split_str,v_stock_name_str)-1);

          /* set @临时_分红金额#=cast(substring(@分红金额串#,1,LOCATE(@分隔符#,@分红金额串#)-1) as decimal(18,4)); */
          set v_tmp_divi_amt=cast(substring(v_divi_amt_str,1,LOCATE(v_split_str,v_divi_amt_str)-1) as decimal(18,4));

          /* set @临时_红股数量#=cast(substring(@红股数量串#,1,LOCATE(@分隔符#,@红股数量串#)-1) as decimal(18,2)); */
          set v_tmp_divi_qty=cast(substring(v_divi_qty_str,1,LOCATE(v_split_str,v_divi_qty_str)-1) as decimal(18,2));

          /* set @临时_转赠数量#=cast(substring(@转赠数量串#,1,LOCATE(@分隔符#,@转赠数量串#)-1) as decimal(18,2)); */
          set v_tmp_equity_trans_qty=cast(substring(v_equity_trans_qty_str,1,LOCATE(v_split_str,v_equity_trans_qty_str)-1) as decimal(18,2));

          /* set @临时_公告日期#=cast(substring(@公告日期串#,1,LOCATE(@分隔符#,@公告日期串#)-1) as SIGNED); */
          set v_tmp_notice_date=cast(substring(v_notice_date_str,1,LOCATE(v_split_str,v_notice_date_str)-1) as SIGNED);

          /* set @临时_登记日期#=cast(substring(@登记日期串#,1,LOCATE(@分隔符#,@登记日期串#)-1) as SIGNED); */
          set v_tmp_reg_date=cast(substring(v_reg_date_str,1,LOCATE(v_split_str,v_reg_date_str)-1) as SIGNED);

          /* set @临时_除权日期#=cast(substring(@除权日期串#,1,LOCATE(@分隔符#,@除权日期串#)-1) as SIGNED); */
          set v_tmp_ex_date=cast(substring(v_ex_date_str,1,LOCATE(v_split_str,v_ex_date_str)-1) as SIGNED);

          /* set @临时_上市日期#=cast(substring(@上市日期串#,1,LOCATE(@分隔符#,@上市日期串#)-1) as SIGNED); */
          set v_tmp_begin_trade_date=cast(substring(v_begin_trade_date_str,1,LOCATE(v_split_str,v_begin_trade_date_str)-1) as SIGNED);

          /* set @临时_到账日期#=cast(substring(@到账日期串#,1,LOCATE(@分隔符#,@到账日期串#)-1) as SIGNED); */
          set v_tmp_arrive_date=cast(substring(v_arrive_date_str,1,LOCATE(v_split_str,v_arrive_date_str)-1) as SIGNED);

          /* set @本币币种#="CNY"; */
          set v_crncy_type="CNY";

          /* set @行为单位#=10; */
          set v_divi_cacl_num=10;

          /* set @分红金额#= ifnull(@临时_分红金额#,0); */
          set v_divi_amt= ifnull(v_tmp_divi_amt,0);

          /* set @红股数量#= ifnull(@临时_红股数量#,0); */
          set v_divi_qty= ifnull(v_tmp_divi_qty,0);

          /* set @转赠数量#= ifnull(@临时_转赠数量#,0); */
          set v_equity_trans_qty= ifnull(v_tmp_equity_trans_qty,0);

          /* set @配股数量#=0; */
          set v_rights_issue_qty=0;

          /* set @配股价格#=0; */
          set v_placement_price=0;

          /* set @公告日期#= ifnull(DATE_FORMAT(@临时_公告日期#, "%Y%m%d"),0); */
          set v_notice_date= ifnull(DATE_FORMAT(v_tmp_notice_date, "%Y%m%d"),0);

          /* if @登记日期# = 0  then */
          if v_reg_date = 0  then

               /* set @登记日期# = @初始化日期#; */
               set v_reg_date = v_init_date;
          else

               /* set @登记日期#= DATE_FORMAT(@临时_登记日期#, "%Y%m%d"); */
               set v_reg_date= DATE_FORMAT(v_tmp_reg_date, "%Y%m%d");
          end if;

          /* set @除权日期#= DATE_FORMAT(@临时_除权日期#, "%Y%m%d"); */
          set v_ex_date= DATE_FORMAT(v_tmp_ex_date, "%Y%m%d");

          /* set @到账日期#= IFNULL(DATE_FORMAT(@临时_到账日期#, "%Y%m%d"), DATE_FORMAT(@临时_上市日期#, "%Y%m%d")); */
          set v_arrive_date= IFNULL(DATE_FORMAT(v_tmp_arrive_date, "%Y%m%d"), DATE_FORMAT(v_tmp_begin_trade_date, "%Y%m%d"));

          /* set @上市日期#= ifnull(DATE_FORMAT(@临时_上市日期#, "%Y%m%d"), DATE_FORMAT(@临时_到账日期#, "%Y%m%d")); */
          set v_begin_trade_date= ifnull(DATE_FORMAT(v_tmp_begin_trade_date, "%Y%m%d"), DATE_FORMAT(v_tmp_arrive_date, "%Y%m%d"));

          /* set @业务标志# = 《业务标志-公司行为红股红利》; */
          set v_busi_flag = 2001027;

          /* 调用【原子_清算证券_结算_增加公司行为记录】*/
          call db_clsecu.pra_clsest_AddCoAction(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_exch_no,
              v_stock_code_no,
              v_stock_type,
              v_asset_type,
              v_crncy_type,
              v_par_value,
              v_divi_cacl_num,
              v_divi_amt,
              v_divi_qty,
              v_equity_trans_qty,
              v_rights_issue_qty,
              v_placement_price,
              v_notice_date,
              v_reg_date,
              v_ex_date,
              v_arrive_date,
              v_begin_trade_date,
              v_busi_flag,
              v_error_code,
              v_error_info);
          if v_error_code = "1" then
              SET v_error_code = "clsecuT.4.103.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_结算_增加公司行为记录出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;


          /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
          set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

          /* set @证券代码编号串#=substring(@证券代码编号串#,LOCATE(@分隔符#,@证券代码编号串#)+1); */
          set v_stock_code_no_str=substring(v_stock_code_no_str,LOCATE(v_split_str,v_stock_code_no_str)+1);

          /* set @证券类型串#=substring(@证券类型串#,LOCATE(@分隔符#,@证券类型串#)+1); */
          set v_stock_type_str=substring(v_stock_type_str,LOCATE(v_split_str,v_stock_type_str)+1);

          /* set @资产类型串#=substring(@资产类型串#,LOCATE(@分隔符#,@资产类型串#)+1); */
          set v_asset_type_str=substring(v_asset_type_str,LOCATE(v_split_str,v_asset_type_str)+1);

          /* set @票面面值串#=substring(@票面面值串#,LOCATE(@分隔符#,@票面面值串#)+1); */
          set v_par_value_str=substring(v_par_value_str,LOCATE(v_split_str,v_par_value_str)+1);

          /* set @证券名称串#=substring(@证券名称串#,LOCATE(@分隔符#,@证券名称串#)+1); */
          set v_stock_name_str=substring(v_stock_name_str,LOCATE(v_split_str,v_stock_name_str)+1);

          /* set @分红金额串#=substring(@分红金额串#,LOCATE(@分隔符#,@分红金额串#)+1); */
          set v_divi_amt_str=substring(v_divi_amt_str,LOCATE(v_split_str,v_divi_amt_str)+1);

          /* set @红股数量串#=substring(@红股数量串#,LOCATE(@分隔符#,@红股数量串#)+1); */
          set v_divi_qty_str=substring(v_divi_qty_str,LOCATE(v_split_str,v_divi_qty_str)+1);

          /* set @转赠数量串#=substring(@转赠数量串#,LOCATE(@分隔符#,@转赠数量串#)+1); */
          set v_equity_trans_qty_str=substring(v_equity_trans_qty_str,LOCATE(v_split_str,v_equity_trans_qty_str)+1);

          /* set @公告日期串#=substring(@公告日期串#,LOCATE(@分隔符#,@公告日期串#)+1); */
          set v_notice_date_str=substring(v_notice_date_str,LOCATE(v_split_str,v_notice_date_str)+1);

          /* set @登记日期串#=substring(@登记日期串#,LOCATE(@分隔符#,@登记日期串#)+1); */
          set v_reg_date_str=substring(v_reg_date_str,LOCATE(v_split_str,v_reg_date_str)+1);

          /* set @除权日期串#=substring(@除权日期串#,LOCATE(@分隔符#,@除权日期串#)+1); */
          set v_ex_date_str=substring(v_ex_date_str,LOCATE(v_split_str,v_ex_date_str)+1);

          /* set @到账日期串#=substring(@到账日期串#,LOCATE(@分隔符#,@到账日期串#)+1); */
          set v_arrive_date_str=substring(v_arrive_date_str,LOCATE(v_split_str,v_arrive_date_str)+1);

          /* set @上市日期串#=substring(@上市日期串#,LOCATE(@分隔符#,@上市日期串#)+1); */
          set v_begin_trade_date_str=substring(v_begin_trade_date_str,LOCATE(v_split_str,v_begin_trade_date_str)+1);
    end while;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_基础数据同步_更新债券兑付信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsebasync_UpdateBondCashInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_clsebasync_UpdateBondCashInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no_str varchar(4096),
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
    IN p_par_value_str varchar(4096),
    IN p_stock_name_str varchar(2048),
    IN p_redem_start_date_str varchar(4096),
    IN p_redem_pay_price_str varchar(4096),
    IN p_init_date int,
    IN p_split_str varchar(4),
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_par_value_str varchar(4096);
    declare v_stock_name_str varchar(2048);
    declare v_redem_start_date_str varchar(4096);
    declare v_redem_pay_price_str varchar(4096);
    declare v_init_date int;
    declare v_split_str varchar(4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_stock_name varchar(64);
    declare v_tmp_divi_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_divi_cacl_num int;
    declare v_divi_amt decimal(18,4);
    declare v_divi_qty decimal(18,2);
    declare v_equity_trans_qty decimal(18,2);
    declare v_rights_issue_qty decimal(18,2);
    declare v_placement_price decimal(16,9);
    declare v_notice_date int;
    declare v_reg_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_par_value_str = p_par_value_str;
    SET v_stock_name_str = p_stock_name_str;
    SET v_redem_start_date_str = p_redem_start_date_str;
    SET v_redem_pay_price_str = p_redem_pay_price_str;
    SET v_init_date = p_init_date;
    SET v_split_str = p_split_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;
    SET v_stock_name = " ";
    SET v_tmp_divi_amt = 0;
    SET v_crncy_type = "CNY";
    SET v_divi_cacl_num = 0;
    SET v_divi_amt = 0;
    SET v_divi_qty = 0;
    SET v_equity_trans_qty = 0;
    SET v_rights_issue_qty = 0;
    SET v_placement_price = 0;
    SET v_notice_date = date_format(curdate(),'%Y%m%d');
    SET v_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_ex_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_busi_flag = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* while LOCATE(@分隔符#,@证券代码编号串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_no_str)<>0   do

          /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
          set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

          /* set @证券代码编号#=cast(substring(@证券代码编号串#,1,LOCATE(@分隔符#,@证券代码编号串#)-1) as SIGNED); */
          set v_stock_code_no=cast(substring(v_stock_code_no_str,1,LOCATE(v_split_str,v_stock_code_no_str)-1) as SIGNED);

          /* set @证券类型#=cast(substring(@证券类型串#,1,LOCATE(@分隔符#,@证券类型串#)-1) as SIGNED); */
          set v_stock_type=cast(substring(v_stock_type_str,1,LOCATE(v_split_str,v_stock_type_str)-1) as SIGNED);

          /* set @资产类型#=cast(substring(@资产类型串#,1,LOCATE(@分隔符#,@资产类型串#)-1) as SIGNED); */
          set v_asset_type=cast(substring(v_asset_type_str,1,LOCATE(v_split_str,v_asset_type_str)-1) as SIGNED);

          /* set @票面面值#=cast(substring(@票面面值串#,1,LOCATE(@分隔符#,@票面面值串#)-1) as decimal(16,9)); */
          set v_par_value=cast(substring(v_par_value_str,1,LOCATE(v_split_str,v_par_value_str)-1) as decimal(16,9));

          /* set @证券名称#=substring(@证券名称串#,1,LOCATE(@分隔符#,@证券名称串#)-1); */
          set v_stock_name=substring(v_stock_name_str,1,LOCATE(v_split_str,v_stock_name_str)-1);

          /* set @临时_分红金额#=cast(substring(@兑付本息和串#,1,LOCATE(@分隔符#,@兑付本息和串#)-1) as decimal(18,4)); */
          set v_tmp_divi_amt=cast(substring(v_redem_pay_price_str,1,LOCATE(v_split_str,v_redem_pay_price_str)-1) as decimal(18,4));

          /* set @本币币种#= "CNY"; */
          set v_crncy_type= "CNY";

          /* set @行为单位#= 1; */
          set v_divi_cacl_num= 1;

          /* set @分红金额#= ifnull(@临时_分红金额#,0); */
          set v_divi_amt= ifnull(v_tmp_divi_amt,0);

          /* set @红股数量#= -1; */
          set v_divi_qty= -1;

          /* set @转赠数量#= 0; */
          set v_equity_trans_qty= 0;

          /* set @配股数量#= 0; */
          set v_rights_issue_qty= 0;

          /* set @配股价格#= 0; */
          set v_placement_price= 0;

          /* set @公告日期#= @初始化日期#; */
          set v_notice_date= v_init_date;

          /* set @登记日期#= @初始化日期#; */
          set v_reg_date= v_init_date;

          /* set @除权日期#= @初始化日期#; */
          set v_ex_date= v_init_date;

          /* set @到账日期#= @初始化日期#; */
          set v_arrive_date= v_init_date;

          /* set @上市日期#= @初始化日期#; */
          set v_begin_trade_date= v_init_date;

          /* set @业务标志# = 《业务标志-公司行为红股红利》; */
          set v_busi_flag = 2001027;

          /* 调用【原子_清算证券_结算_增加公司行为记录】*/
          call db_clsecu.pra_clsest_AddCoAction(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_exch_no,
              v_stock_code_no,
              v_stock_type,
              v_asset_type,
              v_crncy_type,
              v_par_value,
              v_divi_cacl_num,
              v_divi_amt,
              v_divi_qty,
              v_equity_trans_qty,
              v_rights_issue_qty,
              v_placement_price,
              v_notice_date,
              v_reg_date,
              v_ex_date,
              v_arrive_date,
              v_begin_trade_date,
              v_busi_flag,
              v_error_code,
              v_error_info);
          if v_error_code = "1" then
              SET v_error_code = "clsecuT.4.104.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_结算_增加公司行为记录出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;


          /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
          set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

          /* set @证券代码编号串#=substring(@证券代码编号串#,LOCATE(@分隔符#,@证券代码编号串#)+1); */
          set v_stock_code_no_str=substring(v_stock_code_no_str,LOCATE(v_split_str,v_stock_code_no_str)+1);

          /* set @证券类型串#=substring(@证券类型串#,LOCATE(@分隔符#,@证券类型串#)+1); */
          set v_stock_type_str=substring(v_stock_type_str,LOCATE(v_split_str,v_stock_type_str)+1);

          /* set @资产类型串#=substring(@资产类型串#,LOCATE(@分隔符#,@资产类型串#)+1); */
          set v_asset_type_str=substring(v_asset_type_str,LOCATE(v_split_str,v_asset_type_str)+1);

          /* set @票面面值串#=substring(@票面面值串#,LOCATE(@分隔符#,@票面面值串#)+1); */
          set v_par_value_str=substring(v_par_value_str,LOCATE(v_split_str,v_par_value_str)+1);

          /* set @证券名称串#=substring(@证券名称串#,LOCATE(@分隔符#,@证券名称串#)+1); */
          set v_stock_name_str=substring(v_stock_name_str,LOCATE(v_split_str,v_stock_name_str)+1);

          /* set @兑付本息和串#=substring(@兑付本息和串#,LOCATE(@分隔符#,@兑付本息和串#)+1); */
          set v_redem_pay_price_str=substring(v_redem_pay_price_str,LOCATE(v_split_str,v_redem_pay_price_str)+1);
    end while;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 事务_清算证券_基础数据同步_更新债券兑息信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clsebasync_UpdateBondInterePaymentInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_clsebasync_UpdateBondInterePaymentInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no_str varchar(4096),
    IN p_stock_type_str varchar(2048),
    IN p_asset_type_str varchar(2048),
    IN p_par_value_str varchar(4096),
    IN p_stock_name_str varchar(2048),
    IN p_intere_start_date_str varchar(4096),
    IN p_interest_str varchar(4096),
    IN p_interest_taxed_str varchar(4096),
    IN p_init_date int,
    IN p_split_str varchar(4),
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
    declare v_asset_type_str varchar(2048);
    declare v_par_value_str varchar(4096);
    declare v_stock_name_str varchar(2048);
    declare v_intere_start_date_str varchar(4096);
    declare v_interest_str varchar(4096);
    declare v_interest_taxed_str varchar(4096);
    declare v_init_date int;
    declare v_split_str varchar(4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_stock_name varchar(64);
    declare v_intrst_pre_tax decimal(18,12);
    declare v_intrst_after_tax decimal(18,12);
    declare v_placement_price decimal(16,9);
    declare v_tmp_divi_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_divi_cacl_num int;
    declare v_divi_amt decimal(18,4);
    declare v_divi_qty decimal(18,2);
    declare v_equity_trans_qty decimal(18,2);
    declare v_rights_issue_qty decimal(18,2);
    declare v_notice_date int;
    declare v_reg_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_asset_type_str = p_asset_type_str;
    SET v_par_value_str = p_par_value_str;
    SET v_stock_name_str = p_stock_name_str;
    SET v_intere_start_date_str = p_intere_start_date_str;
    SET v_interest_str = p_interest_str;
    SET v_interest_taxed_str = p_interest_taxed_str;
    SET v_init_date = p_init_date;
    SET v_split_str = p_split_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;
    SET v_stock_name = " ";
    SET v_intrst_pre_tax = 0;
    SET v_intrst_after_tax = 0;
    SET v_placement_price = 0;
    SET v_tmp_divi_amt = 0;
    SET v_crncy_type = "CNY";
    SET v_divi_cacl_num = 0;
    SET v_divi_amt = 0;
    SET v_divi_qty = 0;
    SET v_equity_trans_qty = 0;
    SET v_rights_issue_qty = 0;
    SET v_notice_date = date_format(curdate(),'%Y%m%d');
    SET v_reg_date = date_format(curdate(),'%Y%m%d');
    SET v_ex_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_busi_flag = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* while LOCATE(@分隔符#,@证券代码编号串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_no_str)<>0   do

          /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
          set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

          /* set @证券代码编号#=cast(substring(@证券代码编号串#,1,LOCATE(@分隔符#,@证券代码编号串#)-1) as SIGNED); */
          set v_stock_code_no=cast(substring(v_stock_code_no_str,1,LOCATE(v_split_str,v_stock_code_no_str)-1) as SIGNED);

          /* set @证券类型#=cast(substring(@证券类型串#,1,LOCATE(@分隔符#,@证券类型串#)-1) as SIGNED); */
          set v_stock_type=cast(substring(v_stock_type_str,1,LOCATE(v_split_str,v_stock_type_str)-1) as SIGNED);

          /* set @资产类型#=cast(substring(@资产类型串#,1,LOCATE(@分隔符#,@资产类型串#)-1) as SIGNED); */
          set v_asset_type=cast(substring(v_asset_type_str,1,LOCATE(v_split_str,v_asset_type_str)-1) as SIGNED);

          /* set @票面面值#=cast(substring(@票面面值串#,1,LOCATE(@分隔符#,@票面面值串#)-1) as decimal(16,9)); */
          set v_par_value=cast(substring(v_par_value_str,1,LOCATE(v_split_str,v_par_value_str)-1) as decimal(16,9));

          /* set @证券名称#=substring(@证券名称串#,1,LOCATE(@分隔符#,@证券名称串#)-1); */
          set v_stock_name=substring(v_stock_name_str,1,LOCATE(v_split_str,v_stock_name_str)-1);

          /* set @百元面值含税利息#=cast(substring(@含税利息额串#,1,LOCATE(@分隔符#,@含税利息额串#)-1) as decimal(18,4)); */
          set v_intrst_pre_tax=cast(substring(v_interest_str,1,LOCATE(v_split_str,v_interest_str)-1) as decimal(18,4));

          /* set @百元面值扣税利息#=cast(substring(@扣税利息额串#,1,LOCATE(@分隔符#,@扣税利息额串#)-1) as decimal(18,4)); */
          set v_intrst_after_tax=cast(substring(v_interest_taxed_str,1,LOCATE(v_split_str,v_interest_taxed_str)-1) as decimal(18,4));

          /* set @配股价格#= 0; */
          set v_placement_price= 0;

          /* set @临时_分红金额#=ifnull(@百元面值扣税利息#,@百元面值含税利息#); */
          set v_tmp_divi_amt=ifnull(v_intrst_after_tax,v_intrst_pre_tax);

          /* set @本币币种#= "CNY"; */
          set v_crncy_type= "CNY";

          /* set @行为单位#= 1; */
          set v_divi_cacl_num= 1;

          /* set @分红金额#= ifnull(@临时_分红金额#,0); */
          set v_divi_amt= ifnull(v_tmp_divi_amt,0);

          /* set @红股数量#= 0; */
          set v_divi_qty= 0;

          /* set @转赠数量#= 0; */
          set v_equity_trans_qty= 0;

          /* set @配股数量#= 0; */
          set v_rights_issue_qty= 0;

          /* set @公告日期#= @初始化日期#; */
          set v_notice_date= v_init_date;

          /* set @登记日期#= @初始化日期#; */
          set v_reg_date= v_init_date;

          /* set @除权日期#= @初始化日期#; */
          set v_ex_date= v_init_date;

          /* set @到账日期#= @初始化日期#; */
          set v_arrive_date= v_init_date;

          /* set @上市日期#= @初始化日期#; */
          set v_begin_trade_date= v_init_date;

          /* set @业务标志# = 《业务标志-公司行为红股红利》; */
          set v_busi_flag = 2001027;

          /* 调用【原子_清算证券_结算_增加公司行为记录】*/
          call db_clsecu.pra_clsest_AddCoAction(
              v_opor_co_no,
              v_opor_no,
              v_oper_mac,
              v_oper_ip_addr,
              v_oper_info,
              v_oper_way,
              v_func_code,
              v_exch_no,
              v_stock_code_no,
              v_stock_type,
              v_asset_type,
              v_crncy_type,
              v_par_value,
              v_divi_cacl_num,
              v_divi_amt,
              v_divi_qty,
              v_equity_trans_qty,
              v_rights_issue_qty,
              v_placement_price,
              v_notice_date,
              v_reg_date,
              v_ex_date,
              v_arrive_date,
              v_begin_trade_date,
              v_busi_flag,
              v_error_code,
              v_error_info);
          if v_error_code = "1" then
              SET v_error_code = "clsecuT.4.105.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_清算证券_结算_增加公司行为记录出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;


          /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
          set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

          /* set @证券代码编号串#=substring(@证券代码编号串#,LOCATE(@分隔符#,@证券代码编号串#)+1); */
          set v_stock_code_no_str=substring(v_stock_code_no_str,LOCATE(v_split_str,v_stock_code_no_str)+1);

          /* set @证券类型串#=substring(@证券类型串#,LOCATE(@分隔符#,@证券类型串#)+1); */
          set v_stock_type_str=substring(v_stock_type_str,LOCATE(v_split_str,v_stock_type_str)+1);

          /* set @资产类型串#=substring(@资产类型串#,LOCATE(@分隔符#,@资产类型串#)+1); */
          set v_asset_type_str=substring(v_asset_type_str,LOCATE(v_split_str,v_asset_type_str)+1);

          /* set @票面面值串#=substring(@票面面值串#,LOCATE(@分隔符#,@票面面值串#)+1); */
          set v_par_value_str=substring(v_par_value_str,LOCATE(v_split_str,v_par_value_str)+1);

          /* set @证券名称串#=substring(@证券名称串#,LOCATE(@分隔符#,@证券名称串#)+1); */
          set v_stock_name_str=substring(v_stock_name_str,LOCATE(v_split_str,v_stock_name_str)+1);

          /* set @含税利息额串#=substring(@含税利息额串#,LOCATE(@分隔符#,@含税利息额串#)+1); */
          set v_interest_str=substring(v_interest_str,LOCATE(v_split_str,v_interest_str)+1);

          /* set @扣税利息额串#=substring(@扣税利息额串#,LOCATE(@分隔符#,@扣税利息额串#)+1); */
          set v_interest_taxed_str=substring(v_interest_taxed_str,LOCATE(v_split_str,v_interest_taxed_str)+1);
    end while;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


