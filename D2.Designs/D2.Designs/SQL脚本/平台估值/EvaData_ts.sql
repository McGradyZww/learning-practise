DELIMITER ;;
use db_eva;;

# 事务_平台估值_业务数据_同步估值产品证券资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_SyncPdAccoAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_SyncPdAccoAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_begin_share decimal(18,2);
    declare v_pd_curr_share decimal(18,2);
    declare v_target_pd_code varchar(8);
    declare v_is_auto_push varchar(2);
    declare v_unit_evalu int;
    declare v_sync_total_rece_payab int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_co_no = 0;
    SET v_pd_begin_share = 0;
    SET v_pd_curr_share = 0;
    SET v_target_pd_code = " ";
    SET v_is_auto_push = "0";
    SET v_unit_evalu = 0;
    SET v_sync_total_rece_payab = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @机构编号#=@操作员机构编号#; */
        set v_co_no=v_opor_co_no;

        /* 调用【原子_平台估值_基础参数_获取估值产品信息】*/
        call db_eva.pra_evabasic_GetEvaPdInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_error_code,
            v_error_info,
            v_pd_begin_share,
            v_pd_curr_share,
            v_target_pd_code,
            v_is_auto_push,
            v_unit_evalu,
            v_sync_total_rece_payab);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取估值产品信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_业务数据_同步估值产品证券账户资金】*/
        call db_eva.pra_evadata_SyncPdAccoCapit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_target_pd_code,
            v_sync_total_rece_payab,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步估值产品证券账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_业务数据_同步估值产品证券持仓】*/
        call db_eva.pra_evadata_SyncPdSecuPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_target_pd_code,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步估值产品证券持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_业务数据_同步估值产品债券回购】*/
        call db_eva.pra_evadata_SyncPdBondRepo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_target_pd_code,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步估值产品债券回购出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_业务数据_同步估值产品证券成交】*/
        call db_eva.pra_evadata_SyncPdExecution(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_target_pd_code,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步估值产品证券成交出现错误！',v_mysql_message);
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
use db_eva;;

# 事务_平台估值_业务数据_更新估值产品证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_updateSecuPrice;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_updateSecuPrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @机构编号#=@操作员机构编号#; */
        set v_co_no=v_opor_co_no;

        /* 调用【原子_平台估值_业务数据_更新估值产品证券行情】*/
        call db_eva.pra_evadata_updateSecuPrice(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_更新估值产品证券行情出现错误！',v_mysql_message);
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
use db_eva;;

# 事务_平台估值_业务数据_新增估值产品证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_AddPdSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_AddPdSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_evalu_date int,
    IN p_asset_acco varchar(16),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_curr_qty decimal(18,2),
    IN p_curr_cost_amt decimal(18,4),
    IN p_last_price decimal(16,9),
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
    declare v_evalu_date int;
    declare v_asset_acco varchar(16);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_curr_qty decimal(18,2);
    declare v_curr_cost_amt decimal(18,4);
    declare v_last_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_asset_acco = p_asset_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_curr_qty = p_curr_qty;
    SET v_curr_cost_amt = p_curr_cost_amt;
    SET v_last_price = p_last_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
    set v_query_date=date_format(curdate(),'%Y%m%d');

    /* [事务开始] */
    START TRANSACTION;


        /* set @机构编号#=@操作员机构编号#; */
        set v_co_no=v_opor_co_no;

         /* if @估值日期# =0 then */
         if v_evalu_date =0 then

             /* set @估值日期#=@查询日期#; */
             set v_evalu_date=v_query_date;
         end if;

        /* if  @估值日期# = @查询日期#  then */
        if  v_evalu_date = v_query_date  then

            /* 调用【原子_平台估值_业务数据_新增估值产品证券持仓】*/
            call db_eva.pra_evadata_AddPdSecuPosi(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_pd_no,
                v_asset_acco,
                v_exch_no,
                v_stock_acco,
                v_stock_code,
                v_curr_qty,
                v_curr_cost_amt,
                v_last_price,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.2.11.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_新增估值产品证券持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

         else

           /* 调用【原子_平台估值_业务数据_新增估值产品历史证券持仓】*/
           call db_eva.pra_evadata_AddPdHisSecuPosi(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_co_no,
               v_pd_no,
               v_asset_acco,
               v_exch_no,
               v_stock_acco,
               v_stock_code,
               v_curr_qty,
               v_curr_cost_amt,
               v_last_price,
               v_evalu_date,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.2.11.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_新增估值产品历史证券持仓出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               leave label_pro;
           end if;

      end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_业务数据_修改估值产品证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_ModiPdSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_ModiPdSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_evalu_date int,
    IN p_asset_acco varchar(16),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_curr_qty decimal(18,2),
    IN p_curr_cost_amt decimal(18,4),
    IN p_last_price decimal(16,9),
    IN p_exch_rate decimal(18,12),
    IN p_intrst_pandl decimal(18,4),
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
    declare v_evalu_date int;
    declare v_asset_acco varchar(16);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_curr_qty decimal(18,2);
    declare v_curr_cost_amt decimal(18,4);
    declare v_last_price decimal(16,9);
    declare v_exch_rate decimal(18,12);
    declare v_intrst_pandl decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_asset_acco = p_asset_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_curr_qty = p_curr_qty;
    SET v_curr_cost_amt = p_curr_cost_amt;
    SET v_last_price = p_last_price;
    SET v_exch_rate = p_exch_rate;
    SET v_intrst_pandl = p_intrst_pandl;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
    set v_query_date=date_format(curdate(),'%Y%m%d');

    /* [事务开始] */
    START TRANSACTION;


         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

         /* if @估值日期# = @查询日期# then */
         if v_evalu_date = v_query_date then

            /* 调用【原子_平台估值_业务数据_修改估值产品证券持仓】*/
            call db_eva.pra_evadata_ModiPdSecuPosi(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_pd_no,
                v_asset_acco,
                v_exch_no,
                v_stock_acco,
                v_stock_code,
                v_curr_qty,
                v_curr_cost_amt,
                v_last_price,
                v_exch_rate,
                v_intrst_pandl,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.2.12.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_修改估值产品证券持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

         else

           /* 调用【原子_平台估值_业务数据_修改估值产品历史证券持仓】*/
           call db_eva.pra_evadata_ModiPdHisSecuPosi(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_co_no,
               v_pd_no,
               v_asset_acco,
               v_exch_no,
               v_stock_acco,
               v_stock_code,
               v_curr_qty,
               v_curr_cost_amt,
               v_last_price,
               v_exch_rate,
               v_evalu_date,
               v_intrst_pandl,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.2.12.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_修改估值产品历史证券持仓出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               leave label_pro;
           end if;

         end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_业务数据_删除估值产品证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_DelPdSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_DelPdSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_evalu_date int,
    IN p_asset_acco varchar(16),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
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
    declare v_pd_no int;
    declare v_evalu_date int;
    declare v_asset_acco varchar(16);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_asset_acco = p_asset_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
    set v_query_date=date_format(curdate(),'%Y%m%d');

    /* [事务开始] */
    START TRANSACTION;


        /* set @机构编号#=@操作员机构编号#; */
        set v_co_no=v_opor_co_no;

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

       /* if @估值日期# = @查询日期# then */
       if v_evalu_date = v_query_date then

        /* 调用【原子_平台估值_业务数据_删除估值产品证券持仓】*/
        call db_eva.pra_evadata_DelPdSecuPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_asset_acco,
            v_exch_no,
            v_stock_acco,
            v_stock_code,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_删除估值产品证券持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        else

        /* 调用【原子_平台估值_业务数据_删除估值产品历史证券持仓】*/
        call db_eva.pra_evadata_DelPdHisSecuPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_asset_acco,
            v_exch_no,
            v_stock_acco,
            v_stock_code,
            v_evalu_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_删除估值产品历史证券持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

      end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_业务数据_查询估值产品证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_QueryPdSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_QueryPdSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_evalu_date int,
    IN p_asset_acco varchar(16),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
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
    declare v_evalu_date int;
    declare v_asset_acco varchar(16);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_asset_acco = p_asset_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
    set v_query_date=date_format(curdate(),'%Y%m%d');

    /* [事务开始] */
    START TRANSACTION;


        /* set @机构编号#=@操作员机构编号#; */
        set v_co_no=v_opor_co_no;

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

       /* if @估值日期# = @查询日期# then */
       if v_evalu_date = v_query_date then

        /* 调用【原子_平台估值_业务数据_查询估值产品证券持仓】*/
        call db_eva.pra_evadata_QueryPdSecuPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_asset_acco,
            v_exch_no,
            v_stock_acco,
            v_stock_code,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_查询估值产品证券持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        else

        /* 调用【原子_平台估值_业务数据_查询估值产品历史证券持仓】*/
        call db_eva.pra_evadata_QueryPdHisSecuPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_evalu_date,
            v_asset_acco,
            v_exch_no,
            v_stock_acco,
            v_stock_code,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_查询估值产品历史证券持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_业务数据_查询估值产品交易组证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_QueryPdExgpSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_QueryPdExgpSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_evalu_date int,
    IN p_asset_acco varchar(16),
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
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
    declare v_evalu_date int;
    declare v_asset_acco varchar(16);
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_asset_acco = p_asset_acco;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
    set v_query_date=date_format(curdate(),'%Y%m%d');

    /* [事务开始] */
    START TRANSACTION;


        /* set @机构编号#=@操作员机构编号#; */
        set v_co_no=v_opor_co_no;

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

       /* if @估值日期# = @查询日期# then */
       if v_evalu_date = v_query_date then

        /* 调用【原子_平台估值_业务数据_查询估值产品交易组证券持仓】*/
        call db_eva.pra_evadata_QueryPdExgpSecuPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_asset_acco,
            v_exch_group_no,
            v_exch_no,
            v_stock_acco,
            v_stock_code,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.15.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_查询估值产品交易组证券持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        else

        /* 调用【原子_平台估值_业务数据_查询估值产品交易组历史证券持仓】*/
        call db_eva.pra_evadata_QueryPdExgpHisSecuPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_evalu_date,
            v_asset_acco,
            v_exch_group_no,
            v_exch_no,
            v_stock_acco,
            v_stock_code,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.15.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_查询估值产品交易组历史证券持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_业务数据_查询估值产品期货持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_QueryPdFupoPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_QueryPdFupoPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_evalu_date int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_lngsht_type int,
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
    declare v_evalu_date int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_lngsht_type int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
    set v_query_date=date_format(curdate(),'%Y%m%d');

    /* [事务开始] */
    START TRANSACTION;


        /* set @机构编号#=@操作员机构编号#; */
        set v_co_no=v_opor_co_no;

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

       /* if @估值日期# = @查询日期# then */
       if v_evalu_date = v_query_date then

        /* 调用【原子_平台估值_业务数据_查询估值产品期货持仓】*/
        call db_eva.pra_evadata_QueryPdFupoPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_exch_no,
            v_lngsht_type,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_查询估值产品期货持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        else

        /* 调用【原子_平台估值_业务数据_查询估值产品历史期货持仓】*/
        call db_eva.pra_evadata_QueryPdHisFupoPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_evalu_date,
            v_asset_acco_no,
            v_exch_no,
            v_lngsht_type,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_查询估值产品历史期货持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_业务数据_查询估值产品大宗持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_QueryPdSecuBlockPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_QueryPdSecuBlockPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_pd_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

        /* set @机构编号#=@操作员机构编号#; */
        set v_co_no=v_opor_co_no;

       /* 调用【原子_平台估值_业务数据_查询估值产品大宗持仓】*/
       call db_eva.pra_evadata_QueryPdSecuBlockPosi(
           v_opor_co_no,
           v_opor_no,
           v_oper_mac,
           v_oper_ip_addr,
           v_oper_info,
           v_oper_way,
           v_func_code,
           v_co_no,
           v_pd_no,
           v_row_id,
           v_row_count,
           v_error_code,
           v_error_info);
       if v_error_code = "1" then
           SET v_error_code = "evaT.2.17.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_查询估值产品大宗持仓出现错误！',v_mysql_message);
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
use db_eva;;

# 事务_平台估值_业务数据_新增估值产品账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_AddPdAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_AddPdAccoCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_evalu_date int,
    IN p_pd_acco_type int,
    IN p_asset_acco varchar(16),
    IN p_crncy_type varchar(3),
    IN p_curr_amt decimal(18,4),
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
    declare v_evalu_date int;
    declare v_pd_acco_type int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_pd_acco_type = p_pd_acco_type;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_curr_amt = p_curr_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
    set v_query_date=date_format(curdate(),'%Y%m%d');

    /* [事务开始] */
    START TRANSACTION;


         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

       /* if @估值日期# = @查询日期# then */
       if v_evalu_date = v_query_date then

        /* 调用【原子_平台估值_业务数据_新增估值产品账户资金】*/
        call db_eva.pra_evadata_AddPdAccoCapit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_pd_acco_type,
            v_asset_acco,
            v_crncy_type,
            v_curr_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_新增估值产品账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       else

        /* 调用【原子_平台估值_业务数据_新增估值产品历史账户资金】*/
        call db_eva.pra_evadata_AddPdHisAccoCapit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_pd_acco_type,
            v_asset_acco,
            v_crncy_type,
            v_curr_amt,
            v_evalu_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_新增估值产品历史账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_业务数据_修改估值产品账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_ModiPdAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_ModiPdAccoCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_evalu_date int,
    IN p_pd_acco_type int,
    IN p_asset_acco varchar(16),
    IN p_crncy_type varchar(3),
    IN p_curr_amt decimal(18,4),
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
    declare v_evalu_date int;
    declare v_pd_acco_type int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_pd_acco_type = p_pd_acco_type;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_curr_amt = p_curr_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
    set v_query_date=date_format(curdate(),'%Y%m%d');

    /* [事务开始] */
    START TRANSACTION;


         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

       /* if @估值日期# = @查询日期# then */
       if v_evalu_date = v_query_date then

        /* 调用【原子_平台估值_业务数据_修改估值产品账户资金】*/
        call db_eva.pra_evadata_ModiPdAccoCapit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_pd_acco_type,
            v_asset_acco,
            v_crncy_type,
            v_curr_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_修改估值产品账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       else

        /* 调用【原子_平台估值_业务数据_修改估值产品历史账户资金】*/
        call db_eva.pra_evadata_ModiPdHisAccoCapit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_pd_acco_type,
            v_asset_acco,
            v_crncy_type,
            v_curr_amt,
            v_evalu_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_修改估值产品历史账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_业务数据_删除估值产品账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_DelPdAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_DelPdAccoCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_evalu_date int,
    IN p_pd_acco_type int,
    IN p_asset_acco varchar(16),
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
    declare v_pd_no int;
    declare v_evalu_date int;
    declare v_pd_acco_type int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_pd_acco_type = p_pd_acco_type;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
    set v_query_date=date_format(curdate(),'%Y%m%d');

    /* [事务开始] */
    START TRANSACTION;


         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

       /* if @估值日期# = @查询日期# then */
       if v_evalu_date = v_query_date then

        /* 调用【原子_平台估值_业务数据_删除估值产品账户资金】*/
        call db_eva.pra_evadata_DelPdAccoCapit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_pd_acco_type,
            v_asset_acco,
            v_crncy_type,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_删除估值产品账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       else

        /* 调用【原子_平台估值_业务数据_删除估值产品历史账户资金】*/
        call db_eva.pra_evadata_DelPdHisAccoCapit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_pd_acco_type,
            v_asset_acco,
            v_crncy_type,
            v_evalu_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_删除估值产品历史账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_业务数据_查询估值产品账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_QueryPdAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_QueryPdAccoCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_evalu_date int,
    IN p_pd_acco_type int,
    IN p_asset_acco varchar(16),
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
    declare v_evalu_date int;
    declare v_pd_acco_type int;
    declare v_asset_acco varchar(16);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_pd_acco_type = p_pd_acco_type;
    SET v_asset_acco = p_asset_acco;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
    set v_query_date=date_format(curdate(),'%Y%m%d');

    /* [事务开始] */
    START TRANSACTION;


        /* set @机构编号#=@操作员机构编号#; */
        set v_co_no=v_opor_co_no;

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

       /* if @估值日期# = @查询日期# then */
       if v_evalu_date = v_query_date then

        /* 调用【原子_平台估值_业务数据_查询估值产品账户资金】*/
        call db_eva.pra_evadata_QueryPdAccoCapit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_pd_acco_type,
            v_asset_acco,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.24.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_查询估值产品账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       else

        /* 调用【原子_平台估值_业务数据_查询估值产品历史账户资金】*/
        call db_eva.pra_evadata_QueryPdHisAccoCapit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_evalu_date,
            v_pd_acco_type,
            v_asset_acco,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.24.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_查询估值产品历史账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_业务数据_查询估值产品交易组账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_QueryPdExgpAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_QueryPdExgpAccoCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_evalu_date int,
    IN p_pd_acco_type int,
    IN p_asset_acco varchar(16),
    IN p_exch_group_no int,
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
    declare v_evalu_date int;
    declare v_pd_acco_type int;
    declare v_asset_acco varchar(16);
    declare v_exch_group_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_pd_acco_type = p_pd_acco_type;
    SET v_asset_acco = p_asset_acco;
    SET v_exch_group_no = p_exch_group_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
    set v_query_date=date_format(curdate(),'%Y%m%d');

    /* [事务开始] */
    START TRANSACTION;


        /* set @机构编号#=@操作员机构编号#; */
        set v_co_no=v_opor_co_no;

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

       /* if @估值日期# = @查询日期# then */
       if v_evalu_date = v_query_date then

        /* 调用【原子_平台估值_业务数据_查询估值产品交易组账户资金】*/
        call db_eva.pra_evadata_QueryPdExgpAccoCapit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_pd_acco_type,
            v_asset_acco,
            v_exch_group_no,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.25.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_查询估值产品交易组账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       else

        /* 调用【原子_平台估值_业务数据_查询估值产品交易组历史账户资金】*/
        call db_eva.pra_evadata_QueryPdExgpHisAccoCapit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_evalu_date,
            v_pd_acco_type,
            v_asset_acco,
            v_exch_group_no,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.25.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_查询估值产品交易组历史账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_业务数据_导入估值产品证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_ImportPdSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_ImportPdSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_pd_name varchar(64),
    IN p_evalu_date int,
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
    declare v_pd_name varchar(64);
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pd_name = p_pd_name;
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @机构编号#=@操作员机构编号#; */
        set v_co_no=v_opor_co_no;

        /* 调用【原子_平台估值_业务数据_导入估值产品证券持仓】*/
        call db_eva.pra_evadata_ImportPdSecuPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_pd_name,
            v_evalu_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.31.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_导入估值产品证券持仓出现错误！',v_mysql_message);
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
use db_eva;;

# 事务_平台估值_业务数据_新增估值产品银行流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_AddPdBankJour;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_AddPdBankJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_asset_acco varchar(16),
    IN p_occur_dir int,
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
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_occur_dir int;
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco = p_asset_acco;
    SET v_occur_dir = p_occur_dir;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


          /* set @机构编号#=@操作员机构编号#; */
          set v_co_no=v_opor_co_no;

           /* 调用【原子_平台估值_业务数据_新增估值产品银行流水】*/
           call db_eva.pra_evadata_AddPdBankJour(
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
               v_asset_acco,
               v_occur_dir,
               v_occur_amt,
               v_remark_info,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.2.41.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_新增估值产品银行流水出现错误！',v_mysql_message);
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
use db_eva;;

# 事务_平台估值_业务数据_修改估值产品银行流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_ModiPdBankJour;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_ModiPdBankJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_pd_no int,
    IN p_asset_acco varchar(16),
    IN p_occur_dir int,
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
    declare v_row_id bigint;
    declare v_init_date int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_occur_dir int;
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco = p_asset_acco;
    SET v_occur_dir = p_occur_dir;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* 调用【原子_平台估值_业务数据_修改估值产品银行流水】*/
         call db_eva.pra_evadata_ModiPdBankJour(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_row_id,
             v_init_date,
             v_co_no,
             v_pd_no,
             v_asset_acco,
             v_occur_dir,
             v_occur_amt,
             v_remark_info,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.2.42.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_修改估值产品银行流水出现错误！',v_mysql_message);
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
use db_eva;;

# 事务_平台估值_业务数据_删除估值产品银行流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_DelPdBankJour;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_DelPdBankJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_pd_no int,
    IN p_asset_acco varchar(16),
    IN p_occur_dir int,
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
    declare v_init_date int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_occur_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = p_init_date;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco = p_asset_acco;
    SET v_occur_dir = p_occur_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @机构编号#=@操作员机构编号#; */
        set v_co_no=v_opor_co_no;

        /* 调用【原子_平台估值_业务数据_删除估值产品银行流水】*/
        call db_eva.pra_evadata_DelPdBankJour(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_co_no,
            v_pd_no,
            v_asset_acco,
            v_occur_dir,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.43.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_删除估值产品银行流水出现错误！',v_mysql_message);
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
use db_eva;;

# 事务_平台估值_业务数据_查询估值产品银行流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_QueryPdBankJour;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_QueryPdBankJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_asset_acco = " ";

    
    label_pro:BEGIN
    

        /* set @机构编号#=@操作员机构编号#; */
        set v_co_no=v_opor_co_no;

        /* set @资产账户#=" "; */
        set v_asset_acco=" ";

        /* 调用【原子_平台估值_业务数据_查询估值产品银行流水】*/
        call db_eva.pra_evadata_QueryPdBankJour(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_asset_acco,
            v_begin_date,
            v_end_date,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.44.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_查询估值产品银行流水出现错误！',v_mysql_message);
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
use db_eva;;

# 事务_平台估值_业务数据_新增估值产品场外交易
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_AddPdTransOut;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_AddPdTransOut(
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
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_expire_date int,
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
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_expire_date int;
    declare v_remark_info varchar(255);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_expire_date = p_expire_date;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


          /* set @机构编号#=@操作员机构编号#; */
          set v_co_no=v_opor_co_no;

           /* 调用【原子_平台估值_业务数据_新增估值产品场外交易】*/
           call db_eva.pra_evadata_AddPdTransOut(
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
               v_exch_no,
               v_stock_type,
               v_stock_code,
               v_order_dir,
               v_strike_qty,
               v_strike_price,
               v_expire_date,
               v_remark_info,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.2.51.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_新增估值产品场外交易出现错误！',v_mysql_message);
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
use db_eva;;

# 事务_平台估值_业务数据_修改估值产品场外交易
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_ModiPdTransOut;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_ModiPdTransOut(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_expire_date int,
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
    declare v_row_id bigint;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_expire_date int;
    declare v_remark_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_expire_date = p_expire_date;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* 调用【原子_平台估值_业务数据_修改估值产品场外交易】*/
         call db_eva.pra_evadata_ModiPdTransOut(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_row_id,
             v_init_date,
             v_co_no,
             v_pd_no,
             v_exch_no,
             v_stock_type,
             v_stock_code,
             v_order_dir,
             v_strike_qty,
             v_strike_price,
             v_expire_date,
             v_remark_info,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.2.52.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_修改估值产品场外交易出现错误！',v_mysql_message);
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
use db_eva;;

# 事务_平台估值_业务数据_删除估值产品场外交易
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_DelPdTransOut;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_DelPdTransOut(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
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
    declare v_row_id bigint;
    declare v_init_date int;
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
    SET v_row_id = p_row_id;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @机构编号#=@操作员机构编号#; */
        set v_co_no=v_opor_co_no;

        /* 调用【原子_平台估值_业务数据_删除估值产品场外交易】*/
        call db_eva.pra_evadata_DelPdTransOut(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_co_no,
            v_pd_no,
            v_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.53.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_删除估值产品场外交易出现错误！',v_mysql_message);
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
use db_eva;;

# 事务_平台估值_业务数据_查询估值产品场外交易
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evadata_QueryPdTransOut;;
DELIMITER ;;
CREATE PROCEDURE prt_evadata_QueryPdTransOut(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

        /* set @机构编号#=@操作员机构编号#; */
        set v_co_no=v_opor_co_no;

        /* 调用【原子_平台估值_业务数据_查询估值产品场外交易】*/
        call db_eva.pra_evadata_QueryPdTransOut(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_begin_date,
            v_end_date,
            v_row_id,
            v_row_count,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.2.54.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_查询估值产品场外交易出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


