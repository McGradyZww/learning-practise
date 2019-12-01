DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_计算估值产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_calcPdFee;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_calcPdFee(
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
    declare v_evalu_date int;
    declare v_nav_asset decimal(18,4);
    declare v_total_asset decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = date_format(curdate(),'%Y%m%d');
    SET v_nav_asset = 0;
    SET v_total_asset = 0;

    
    label_pro:BEGIN
    

     /* set @机构编号#=@操作员机构编号#; */
     set v_co_no=v_opor_co_no;

     /* set @估值日期#=date_format(curdate(),'%Y%m%d'); */
     set v_evalu_date=date_format(curdate(),'%Y%m%d');

    /* 调用【原子_平台估值_估值汇总_获取产品上日资产】*/
    call db_eva.pra_evatotal_getProductPreNet(
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
        v_error_code,
        v_error_info,
        v_nav_asset,
        v_total_asset);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品上日资产出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_平台估值_估值汇总_计算估值产品费用】*/
    call db_eva.pra_evatotal_calcPdFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_nav_asset,
        v_total_asset,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品费用出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_计算估值产品利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_calcPdRate;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_calcPdRate(
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
    declare v_evalu_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

     /* set @机构编号#=@操作员机构编号#; */
     set v_co_no=v_opor_co_no;

     /* set @估值日期#=date_format(curdate(),'%Y%m%d'); */
     set v_evalu_date=date_format(curdate(),'%Y%m%d');

    /* 调用【原子_平台估值_估值汇总_计算估值产品利息】*/
    call db_eva.pra_evatotal_calcPdRate(
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
        SET v_error_code = "evaT.3.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品利息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_平台估值_估值汇总_统计估值产品利息】*/
    call db_eva.pra_evatotal_sumPdRate(
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
        SET v_error_code = "evaT.3.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_统计估值产品利息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_平台估值_估值汇总_计算债券当日利息】*/
    call db_eva.pra_evatotal_calcBondInterest(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算债券当日利息出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_生成估值产品资产信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_createPdAssetInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_createPdAssetInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
    declare v_pd_begin_share decimal(18,2);
    declare v_pd_curr_share decimal(18,2);
    declare v_target_pd_code varchar(8);
    declare v_is_auto_push varchar(2);
    declare v_unit_evalu int;
    declare v_sync_total_rece_payab int;
    declare v_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_begin_share = 0;
    SET v_pd_curr_share = 0;
    SET v_target_pd_code = " ";
    SET v_is_auto_push = "0";
    SET v_unit_evalu = 0;
    SET v_sync_total_rece_payab = 0;
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

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
            SET v_error_code = "evaT.3.3.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取估值产品信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

             /* 调用【原子_平台估值_估值汇总_生成估值产品资产信息】*/
             call db_eva.pra_evatotal_createPdAseetInfo(
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
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.3.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品资产信息出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;

         else

             /* 调用【原子_平台估值_估值汇总_推算产品货基期初数量】*/
             call db_eva.pra_evatotal_calcPdMFBeginQty(
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
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.3.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_推算产品货基期初数量出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;


             /* 调用【原子_平台估值_估值汇总_生成估值产品历史资产信息】*/
             call db_eva.pra_evatotal_createHisPdAseetInfo(
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
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.3.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品历史资产信息出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;

        end if;

        /* 调用【原子_平台估值_估值汇总_生成估值产品累计净值】*/
        call db_eva.pra_evatotal_createPdTotalNet(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.3.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品累计净值出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

      #生成单元估值

        /* if  @单元估值# =1 then */
        if  v_unit_evalu =1 then

             /* set @交易组编号#=0; */
             set v_exch_group_no=0;

            /* [声明游标][平台估值_基础参数_估值产品交易组信息表][{交易组编号}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组状态}=《交易组状态-正常》][cursor_eva_product_exgp] */
            cursor_eva_product_exgp:BEGIN
            DECLARE v_cursor_done int default false;
            DECLARE cursor_eva_product_exgp CURSOR FOR
                select exch_group_no 
                from db_eva.tb_evabasic_exch_group_info 
                where co_no=v_co_no and pd_no=v_pd_no and exch_group_status="1";
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@交易组编号#][cursor_eva_product_exgp][loop_eva_product_exgp] */
            open cursor_eva_product_exgp;
            loop_eva_product_exgp: LOOP
            fetch cursor_eva_product_exgp into v_exch_group_no;
                IF v_cursor_done THEN
                    LEAVE loop_eva_product_exgp;
                END IF;


              /* if @估值日期# = @查询日期# then */
              if v_evalu_date = v_query_date then

                /* 调用【原子_平台估值_估值汇总_生成估值产品交易组资产信息】*/
                call db_eva.pra_evatotal_createPdExgpAseetInfo(
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
                    v_evalu_date,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "evaT.3.3.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品交易组资产信息出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    close cursor_eva_product_exgp;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    close cursor_eva_product_exgp;
                    leave label_pro;
                end if;

               else

                /* 调用【原子_平台估值_估值汇总_生成估值产品交易组历史资产信息】*/
                call db_eva.pra_evatotal_createHisPdExgpAseetInfo(
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
                    v_evalu_date,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "evaT.3.3.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品交易组历史资产信息出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    close cursor_eva_product_exgp;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    close cursor_eva_product_exgp;
                    leave label_pro;
                end if;

              end if;

            /* [关闭游标][cursor_eva_product_exgp] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_eva_product_exgp;
            end cursor_eva_product_exgp;

       end if;
    #生成子基金估值

            /* [声明游标][平台估值_基础参数_产品关系表][{产品编号}][{机构编号}=@机构编号# and {母产品编号}=@产品编号#][cursor_eva_product_mom] */
            cursor_eva_product_mom:BEGIN
            DECLARE v_cursor_done int default false;
            DECLARE cursor_eva_product_mom CURSOR FOR
                select pd_no 
                from db_eva.tb_evabasic_pd_relation 
                where co_no=v_co_no and mum_pd_no=v_pd_no;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@产品编号#][cursor_eva_product_mom][loop_eva_product_mom] */
            open cursor_eva_product_mom;
            loop_eva_product_mom: LOOP
            fetch cursor_eva_product_mom into v_pd_no;
                IF v_cursor_done THEN
                    LEAVE loop_eva_product_mom;
                END IF;


              /* if @估值日期# = @查询日期# then */
              if v_evalu_date = v_query_date then

                  /* 调用【原子_平台估值_估值汇总_生成估值产品资产信息】*/
                  call db_eva.pra_evatotal_createPdAseetInfo(
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
                      v_error_code,
                      v_error_info);
                  if v_error_code = "1" then
                      SET v_error_code = "evaT.3.3.999";
                      if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品资产信息出现错误！',v_mysql_message);
                      end if;
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  elseif v_error_code <> "0" then
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  end if;

               else

                  /* 调用【原子_平台估值_估值汇总_生成估值产品历史资产信息】*/
                  call db_eva.pra_evatotal_createHisPdAseetInfo(
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
                      v_error_code,
                      v_error_info);
                  if v_error_code = "1" then
                      SET v_error_code = "evaT.3.3.999";
                      if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品历史资产信息出现错误！',v_mysql_message);
                      end if;
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  elseif v_error_code <> "0" then
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  end if;

              end if;

            /* [关闭游标][cursor_eva_product_mom] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_eva_product_mom;
            end cursor_eva_product_mom;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_查询估值产品资产信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdAssetInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdAssetInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
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
    declare v_pd_no_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@产品编号串#] */
    set v_pd_no_str = concat(";", v_pd_no_str,";");


    /* 调用【原子_平台估值_估值汇总_查询估值产品资产信息】*/
    call db_eva.pra_evatotal_queryPdAssetInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no_str,
        v_pd_no_rights_str,
        v_begin_date,
        v_end_date,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品资产信息出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_查询估值产品应收应付汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdFeeRateTotal;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdFeeRateTotal(
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

    /* 调用【原子_平台估值_估值汇总_查询估值产品应收应付汇总】*/
    call db_eva.pra_evatotal_queryPdFeeRateTotal(
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
        SET v_error_code = "evaT.3.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品应收应付汇总出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_新增估值产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_addPdFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_addPdFeeAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_fee_type int,
    IN p_crncy_type varchar(3),
    IN p_begin_amt decimal(18,4),
    IN p_curr_amt decimal(18,4),
    IN p_pd_net_asset decimal(18,4),
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
    declare v_crncy_type varchar(3);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_pd_net_asset decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_begin_amt = p_begin_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_pd_net_asset = p_pd_net_asset;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

            /* 调用【原子_平台估值_估值汇总_新增估值产品费用】*/
            call db_eva.pra_evatotal_addPdFeeAmt(
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
                v_pd_fee_type,
                v_crncy_type,
                v_begin_amt,
                v_curr_amt,
                v_pd_net_asset,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.6.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增估值产品费用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        else

            /* 调用【原子_平台估值_估值汇总_新增估值产品历史费用】*/
            call db_eva.pra_evatotal_addPdHisFeeAmt(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_evalu_date,
                v_co_no,
                v_pd_no,
                v_pd_fee_type,
                v_crncy_type,
                v_begin_amt,
                v_curr_amt,
                v_pd_net_asset,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.6.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增估值产品历史费用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_修改估值产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_modiPdFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_modiPdFeeAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_fee_type int,
    IN p_crncy_type varchar(3),
    IN p_begin_amt decimal(18,4),
    IN p_curr_amt decimal(18,4),
    IN p_pd_net_asset decimal(18,4),
    IN p_confirm_apply decimal(18,4),
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
    declare v_crncy_type varchar(3);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_pd_net_asset decimal(18,4);
    declare v_confirm_apply decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_begin_amt = p_begin_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_pd_net_asset = p_pd_net_asset;
    SET v_confirm_apply = p_confirm_apply;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

            /* 调用【原子_平台估值_估值汇总_修改估值产品费用】*/
            call db_eva.pra_evatotal_modiPdFeeAmt(
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
                v_pd_fee_type,
                v_crncy_type,
                v_begin_amt,
                v_curr_amt,
                v_pd_net_asset,
                v_confirm_apply,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.7.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_修改估值产品费用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

         else

            /* 调用【原子_平台估值_估值汇总_修改估值产品历史费用】*/
            call db_eva.pra_evatotal_modiPdHisFeeAmt(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_evalu_date,
                v_co_no,
                v_pd_no,
                v_pd_fee_type,
                v_crncy_type,
                v_begin_amt,
                v_curr_amt,
                v_pd_net_asset,
                v_confirm_apply,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.7.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_修改估值产品历史费用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

         end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_删除估值产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_delPdFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_delPdFeeAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_fee_type int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
    declare v_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

           /* 调用【原子_平台估值_估值汇总_删除估值产品费用】*/
           call db_eva.pra_evatotal_delPdFeeAmt(
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
               v_pd_fee_type,
               v_crncy_type,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.8.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_删除估值产品费用出现错误！',v_mysql_message);
               end if;
               leave label_pro;
           elseif v_error_code <> "0" then
               leave label_pro;
           end if;

        else

           /* 调用【原子_平台估值_估值汇总_删除估值产品历史费用】*/
           call db_eva.pra_evatotal_delPdHisFeeAmt(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_evalu_date,
               v_co_no,
               v_pd_no,
               v_pd_fee_type,
               v_crncy_type,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.8.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_删除估值产品历史费用出现错误！',v_mysql_message);
               end if;
               leave label_pro;
           elseif v_error_code <> "0" then
               leave label_pro;
           end if;

        end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_查询估值产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdFeeAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_fee_type int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

             /* 调用【原子_平台估值_估值汇总_查询估值产品费用】*/
             call db_eva.pra_evatotal_queryPdFeeAmt(
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
                 v_pd_fee_type,
                 v_row_id,
                 v_row_count,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.9.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品费用出现错误！',v_mysql_message);
                 end if;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 leave label_pro;
             end if;

         else

             /* 调用【原子_平台估值_估值汇总_查询估值产品历史费用】*/
             call db_eva.pra_evatotal_queryPdHisFeeAmt(
                 v_opor_co_no,
                 v_opor_no,
                 v_oper_mac,
                 v_oper_ip_addr,
                 v_oper_info,
                 v_oper_way,
                 v_func_code,
                 v_evalu_date,
                 v_co_no,
                 v_pd_no,
                 v_pd_fee_type,
                 v_row_id,
                 v_row_count,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.9.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品历史费用出现错误！',v_mysql_message);
                 end if;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 leave label_pro;
             end if;

         end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_新增估值产品利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_addPdInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_addPdInterestAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco varchar(16),
    IN p_crncy_type varchar(3),
    IN p_begin_amt decimal(18,4),
    IN p_curr_amt decimal(18,4),
    IN p_intrst_base_amt decimal(18,4),
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_begin_amt = p_begin_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_intrst_base_amt = p_intrst_base_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

            /* 调用【原子_平台估值_估值汇总_新增估值产品利息】*/
            call db_eva.pra_evatotal_addPdInterestAmt(
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
                v_crncy_type,
                v_begin_amt,
                v_curr_amt,
                v_intrst_base_amt,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.10.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增估值产品利息出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        else

            /* 调用【原子_平台估值_估值汇总_新增估值产品历史利息】*/
            call db_eva.pra_evatotal_addPdHisInterestAmt(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_evalu_date,
                v_co_no,
                v_pd_no,
                v_asset_acco,
                v_crncy_type,
                v_begin_amt,
                v_curr_amt,
                v_intrst_base_amt,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.10.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增估值产品历史利息出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

       end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_修改估值产品利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_modiPdInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_modiPdInterestAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco varchar(16),
    IN p_crncy_type varchar(3),
    IN p_begin_amt decimal(18,4),
    IN p_curr_amt decimal(18,4),
    IN p_intrst_base_amt decimal(18,4),
    IN p_confirm_apply decimal(18,4),
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_confirm_apply decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_begin_amt = p_begin_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_intrst_base_amt = p_intrst_base_amt;
    SET v_confirm_apply = p_confirm_apply;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

             /* 调用【原子_平台估值_估值汇总_修改估值产品利息】*/
             call db_eva.pra_evatotal_modiPdInterestAmt(
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
                 v_crncy_type,
                 v_begin_amt,
                 v_curr_amt,
                 v_intrst_base_amt,
                 v_confirm_apply,
                 v_remark_info,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.11.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_修改估值产品利息出现错误！',v_mysql_message);
                 end if;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 leave label_pro;
             end if;

        else

             /* 调用【原子_平台估值_估值汇总_修改估值产品历史利息】*/
             call db_eva.pra_evatotal_modiPdHisInterestAmt(
                 v_opor_co_no,
                 v_opor_no,
                 v_oper_mac,
                 v_oper_ip_addr,
                 v_oper_info,
                 v_oper_way,
                 v_func_code,
                 v_evalu_date,
                 v_co_no,
                 v_pd_no,
                 v_asset_acco,
                 v_crncy_type,
                 v_begin_amt,
                 v_curr_amt,
                 v_intrst_base_amt,
                 v_confirm_apply,
                 v_remark_info,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.11.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_修改估值产品历史利息出现错误！',v_mysql_message);
                 end if;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 leave label_pro;
             end if;

       end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_删除估值产品利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_delPdInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_delPdInterestAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_evalu_date int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_evalu_date int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

            /* 调用【原子_平台估值_估值汇总_删除估值产品利息】*/
            call db_eva.pra_evatotal_delPdInterestAmt(
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
                v_crncy_type,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.12.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_删除估值产品利息出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

         else

            /* 调用【原子_平台估值_估值汇总_删除估值产品历史利息】*/
            call db_eva.pra_evatotal_delPdHisInterestAmt(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_evalu_date,
                v_co_no,
                v_pd_no,
                v_asset_acco,
                v_crncy_type,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.12.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_删除估值产品历史利息出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_查询估值产品利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdInterestAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco = p_asset_acco;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

           /* 调用【原子_平台估值_估值汇总_查询估值产品利息】*/
           call db_eva.pra_evatotal_queryPdInterestAmt(
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
               v_row_id,
               v_row_count,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.13.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品利息出现错误！',v_mysql_message);
               end if;
               leave label_pro;
           elseif v_error_code <> "0" then
               leave label_pro;
           end if;

         else

           /* 调用【原子_平台估值_估值汇总_查询估值产品历史利息】*/
           call db_eva.pra_evatotal_queryPdHisInterestAmt(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_evalu_date,
               v_co_no,
               v_pd_no,
               v_asset_acco,
               v_row_id,
               v_row_count,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.13.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品历史利息出现错误！',v_mysql_message);
               end if;
               leave label_pro;
           elseif v_error_code <> "0" then
               leave label_pro;
           end if;

         end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_计算估值产品历史费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_calcPdHisFee;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_calcPdHisFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_nav_asset decimal(18,4);
    declare v_total_asset decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_nav_asset = 0;
    SET v_total_asset = 0;

    
    label_pro:BEGIN
    

     /* set @机构编号#=@操作员机构编号#; */
     set v_co_no=v_opor_co_no;

    /* 调用【原子_平台估值_估值汇总_获取产品上日资产】*/
    call db_eva.pra_evatotal_getProductPreNet(
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
        v_error_code,
        v_error_info,
        v_nav_asset,
        v_total_asset);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品上日资产出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_平台估值_估值汇总_计算估值产品历史费用】*/
    call db_eva.pra_evatotal_calcPdHisFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_nav_asset,
        v_evalu_date,
        v_total_asset,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品历史费用出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_计算估值产品历史利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_calcPdHisRate;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_calcPdHisRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_evalu_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

     /* set @机构编号#=@操作员机构编号#; */
     set v_co_no=v_opor_co_no;

    /* 调用【原子_平台估值_估值汇总_计算估值产品历史利息】*/
    call db_eva.pra_evatotal_calcPdHisRate(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.15.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品历史利息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_平台估值_估值汇总_统计估值产品历史利息】*/
    call db_eva.pra_evatotal_sumPdHisRate(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.15.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_统计估值产品历史利息出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_生成估值产品历史资产信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_createPdHisAssetInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_createPdHisAssetInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_begin_share decimal(18,2);
    declare v_pd_curr_share decimal(18,2);
    declare v_target_pd_code varchar(8);
    declare v_is_auto_push varchar(2);
    declare v_unit_evalu int;
    declare v_sync_total_rece_payab int;
    declare v_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_begin_share = 0;
    SET v_pd_curr_share = 0;
    SET v_target_pd_code = " ";
    SET v_is_auto_push = "0";
    SET v_unit_evalu = 0;
    SET v_sync_total_rece_payab = 0;
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_平台估值_估值汇总_生成估值产品历史资产信息】*/
    call db_eva.pra_evatotal_createHisPdAseetInfo(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.16.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品历史资产信息出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* 调用【原子_平台估值_估值汇总_生成估值产品累计净值】*/
    call db_eva.pra_evatotal_createPdTotalNet(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.16.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品累计净值出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


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
        SET v_error_code = "evaT.3.16.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取估值产品信息出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;

      #生成单元估值

        /* if  @单元估值# =1 then */
        if  v_unit_evalu =1 then

             /* set @交易组编号#=0; */
             set v_exch_group_no=0;

            /* [声明游标][平台估值_基础参数_估值产品交易组信息表][{交易组编号}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组状态}=《交易组状态-正常》][cursor_eva_product_exgp] */
            cursor_eva_product_exgp:BEGIN
            DECLARE v_cursor_done int default false;
            DECLARE cursor_eva_product_exgp CURSOR FOR
                select exch_group_no 
                from db_eva.tb_evabasic_exch_group_info 
                where co_no=v_co_no and pd_no=v_pd_no and exch_group_status="1";
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@交易组编号#][cursor_eva_product_exgp][loop_eva_product_exgp] */
            open cursor_eva_product_exgp;
            loop_eva_product_exgp: LOOP
            fetch cursor_eva_product_exgp into v_exch_group_no;
                IF v_cursor_done THEN
                    LEAVE loop_eva_product_exgp;
                END IF;


                /* 调用【原子_平台估值_估值汇总_生成估值产品交易组历史资产信息】*/
                call db_eva.pra_evatotal_createHisPdExgpAseetInfo(
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
                    v_evalu_date,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "evaT.3.16.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品交易组历史资产信息出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    close cursor_eva_product_exgp;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    close cursor_eva_product_exgp;
                    leave label_pro;
                end if;


            /* [关闭游标][cursor_eva_product_exgp] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_eva_product_exgp;
            end cursor_eva_product_exgp;

       end if;
    #生成子基金估值

            /* [声明游标][平台估值_基础参数_产品关系表][{产品编号}][{机构编号}=@机构编号# and {母产品编号}=@产品编号#][cursor_eva_product_mom] */
            cursor_eva_product_mom:BEGIN
            DECLARE v_cursor_done int default false;
            DECLARE cursor_eva_product_mom CURSOR FOR
                select pd_no 
                from db_eva.tb_evabasic_pd_relation 
                where co_no=v_co_no and mum_pd_no=v_pd_no;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@产品编号#][cursor_eva_product_mom][loop_eva_product_mom] */
            open cursor_eva_product_mom;
            loop_eva_product_mom: LOOP
            fetch cursor_eva_product_mom into v_pd_no;
                IF v_cursor_done THEN
                    LEAVE loop_eva_product_mom;
                END IF;


                  /* 调用【原子_平台估值_估值汇总_生成估值产品历史资产信息】*/
                  call db_eva.pra_evatotal_createHisPdAseetInfo(
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
                      v_error_code,
                      v_error_info);
                  if v_error_code = "1" then
                      SET v_error_code = "evaT.3.16.999";
                      if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品历史资产信息出现错误！',v_mysql_message);
                      end if;
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  elseif v_error_code <> "0" then
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  end if;


            /* [关闭游标][cursor_eva_product_mom] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_eva_product_mom;
            end cursor_eva_product_mom;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_估值产品历史资产数据重算
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_calcPdHisAssetInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_calcPdHisAssetInfo(
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sys_date int;
    declare v_pd_begin_share decimal(18,2);
    declare v_pd_curr_share decimal(18,2);
    declare v_target_pd_code varchar(8);
    declare v_is_auto_push varchar(2);
    declare v_unit_evalu int;
    declare v_sync_total_rece_payab int;
    declare v_evalu_date int;
    declare v_nav_asset decimal(18,4);
    declare v_total_asset decimal(18,4);
    declare v_config_no bigint;
    declare v_config_value varchar(2048);
    declare v_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sys_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_begin_share = 0;
    SET v_pd_curr_share = 0;
    SET v_target_pd_code = " ";
    SET v_is_auto_push = "0";
    SET v_unit_evalu = 0;
    SET v_sync_total_rece_payab = 0;
    SET v_evalu_date = date_format(curdate(),'%Y%m%d');
    SET v_nav_asset = 0;
    SET v_total_asset = 0;
    SET v_config_no = 0;
    SET v_config_value = " ";
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* set  @系统日期#=date_format(curdate(),'%Y%m%d'); */
    set  v_sys_date=date_format(curdate(),'%Y%m%d');

     /* if @结束日期#>@系统日期# then */
     if v_end_date>v_sys_date then

        /* set @结束日期#=@系统日期#; */
        set v_end_date=v_sys_date;
    end if;

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
        SET v_error_code = "evaT.3.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取估值产品信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


     /* while @开始日期# <=@结束日期# do */
     while v_begin_date <=v_end_date do

       /* set @估值日期# = @开始日期#; */
       set v_evalu_date = v_begin_date;

    /* if @估值日期#<@系统日期# then */
    if v_evalu_date<v_sys_date then

        /* 调用【原子_平台估值_业务数据_更新估值产品汇率】*/
        call db_eva.pra_evadata_updatePdExRate(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_更新估值产品汇率出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_获取产品上日资产】*/
        call db_eva.pra_evatotal_getProductPreNet(
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
            v_error_code,
            v_error_info,
            v_nav_asset,
            v_total_asset);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品上日资产出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       #计算子基金持仓份额

        /* set @配置编号#=1003; */
        set v_config_no=1003;

        /* set @配置值#=0; */
        set v_config_value=0;

        /* 调用【原子_平台估值_基础参数_获取产品特殊配置】*/
        call db_eva.pra_evabasic_GetPdSpecialConfig(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_config_no,
            v_error_code,
            v_error_info,
            v_config_value);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取产品特殊配置出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @配置值#=1 then */
        if v_config_value=1 then

           /* 调用【原子_平台估值_业务数据_计算子基金持仓变动】*/
           call db_eva.pra_evadata_calcChildPdShare(
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
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.17.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_计算子基金持仓变动出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               leave label_pro;
           end if;

         end if;

        /* 调用【原子_平台估值_估值汇总_更新产品银行账户历史变动】*/
        call db_eva.pra_evatotal_updatePdHisBankAmt(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_更新产品银行账户历史变动出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_计算估值产品历史费用】*/
        call db_eva.pra_evatotal_calcPdHisFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_nav_asset,
            v_evalu_date,
            v_total_asset,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品历史费用出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_计算估值产品历史利息】*/
        call db_eva.pra_evatotal_calcPdHisRate(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品历史利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_统计估值产品历史利息】*/
        call db_eva.pra_evatotal_sumPdHisRate(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_统计估值产品历史利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_获取产品货基收益】*/
        call db_eva.pra_evatotal_getProductMFYield(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品货基收益出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_推算产品货基期初数量】*/
        call db_eva.pra_evatotal_calcPdMFBeginQty(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_推算产品货基期初数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_计算债券历史利息】*/
        call db_eva.pra_evatotal_calcBondHisInterest(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算债券历史利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_更新产品历史份额】*/
        call db_eva.pra_evatotal_updatePdHisShare(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_更新产品历史份额出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_生成估值产品历史资产信息】*/
        call db_eva.pra_evatotal_createHisPdAseetInfo(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品历史资产信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

      #生成单元估值

        /* if  @单元估值# =1 then */
        if  v_unit_evalu =1 then

            /* set @交易组编号#=0; */
            set v_exch_group_no=0;

            /* [声明游标][平台估值_基础参数_估值产品交易组信息表][{交易组编号}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组状态}=《交易组状态-正常》][cursor_eva_product_exgp] */
            cursor_eva_product_exgp:BEGIN
            DECLARE v_cursor_done int default false;
            DECLARE cursor_eva_product_exgp CURSOR FOR
                select exch_group_no 
                from db_eva.tb_evabasic_exch_group_info 
                where co_no=v_co_no and pd_no=v_pd_no and exch_group_status="1";
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@交易组编号#][cursor_eva_product_exgp][loop_eva_product_exgp] */
            open cursor_eva_product_exgp;
            loop_eva_product_exgp: LOOP
            fetch cursor_eva_product_exgp into v_exch_group_no;
                IF v_cursor_done THEN
                    LEAVE loop_eva_product_exgp;
                END IF;


             /* 调用【原子_平台估值_估值汇总_获取产品交易组上日资产】*/
             call db_eva.pra_evatotal_getProductExgpPreNet(
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
                 v_evalu_date,
                 v_error_code,
                 v_error_info,
                 v_nav_asset);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.17.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品交易组上日资产出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             end if;


             /* 调用【原子_平台估值_估值汇总_计算估值产品交易组历史费用】*/
             call db_eva.pra_evatotal_calcPdExgpHisFee(
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
                 v_nav_asset,
                 v_evalu_date,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.17.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品交易组历史费用出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             end if;


             /* 调用【原子_平台估值_估值汇总_计算估值产品交易组历史利息】*/
             call db_eva.pra_evatotal_calcPdExgpHisRate(
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
                 v_evalu_date,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.17.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品交易组历史利息出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             end if;


             /* 调用【原子_平台估值_估值汇总_统计估值产品交易组历史利息】*/
             call db_eva.pra_evatotal_sumPdExgpHisRate(
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
                 v_evalu_date,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.17.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_统计估值产品交易组历史利息出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             end if;


             /* 调用【原子_平台估值_估值汇总_生成估值产品交易组历史资产信息】*/
             call db_eva.pra_evatotal_createHisPdExgpAseetInfo(
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
                 v_evalu_date,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.17.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品交易组历史资产信息出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             end if;


            /* [关闭游标][cursor_eva_product_exgp] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_eva_product_exgp;
            end cursor_eva_product_exgp;

       end if;
    #生成子基金估值

            /* [声明游标][平台估值_基础参数_产品关系表][{产品编号}][{机构编号}=@机构编号# and {母产品编号}=@产品编号#][cursor_eva_product_mom] */
            cursor_eva_product_mom:BEGIN
            DECLARE v_cursor_done int default false;
            DECLARE cursor_eva_product_mom CURSOR FOR
                select pd_no 
                from db_eva.tb_evabasic_pd_relation 
                where co_no=v_co_no and mum_pd_no=v_pd_no;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@产品编号#][cursor_eva_product_mom][loop_eva_product_mom] */
            open cursor_eva_product_mom;
            loop_eva_product_mom: LOOP
            fetch cursor_eva_product_mom into v_pd_no;
                IF v_cursor_done THEN
                    LEAVE loop_eva_product_mom;
                END IF;


                  /* 调用【原子_平台估值_估值汇总_生成估值产品历史资产信息】*/
                  call db_eva.pra_evatotal_createHisPdAseetInfo(
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
                      v_error_code,
                      v_error_info);
                  if v_error_code = "1" then
                      SET v_error_code = "evaT.3.17.999";
                      if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品历史资产信息出现错误！',v_mysql_message);
                      end if;
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  elseif v_error_code <> "0" then
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  end if;


            /* [关闭游标][cursor_eva_product_mom] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_eva_product_mom;
            end cursor_eva_product_mom;


    /* elseif @估值日期#=@系统日期# then */
    elseif v_evalu_date=v_sys_date then

         /* 调用【原子_平台估值_估值汇总_获取产品上日资产】*/
         call db_eva.pra_evatotal_getProductPreNet(
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
             v_error_code,
             v_error_info,
             v_nav_asset,
             v_total_asset);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.17.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品上日资产出现错误！',v_mysql_message);
             end if;
             ROLLBACK;
             leave label_pro;
         elseif v_error_code <> "0" then
             ROLLBACK;
             leave label_pro;
         end if;

       #计算子基金持仓份额

        /* set @配置编号#=1003; */
        set v_config_no=1003;

        /* set @配置值#=0; */
        set v_config_value=0;

        /* 调用【原子_平台估值_基础参数_获取产品特殊配置】*/
        call db_eva.pra_evabasic_GetPdSpecialConfig(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_config_no,
            v_error_code,
            v_error_info,
            v_config_value);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取产品特殊配置出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @配置值#=1 then */
        if v_config_value=1 then

           /* 调用【原子_平台估值_业务数据_计算子基金持仓变动】*/
           call db_eva.pra_evadata_calcChildPdShare(
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
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.17.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_计算子基金持仓变动出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               leave label_pro;
           end if;

         end if;

         /* 调用【原子_平台估值_估值汇总_更新产品银行账户历史变动】*/
         call db_eva.pra_evatotal_updatePdHisBankAmt(
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
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.17.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_更新产品银行账户历史变动出现错误！',v_mysql_message);
             end if;
             ROLLBACK;
             leave label_pro;
         elseif v_error_code <> "0" then
             ROLLBACK;
             leave label_pro;
         end if;


         /* 调用【原子_平台估值_估值汇总_更新产品费用利息期初金额】*/
         call db_eva.pra_evatotal_updatePdFeeRateBeginAmt(
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
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.17.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_更新产品费用利息期初金额出现错误！',v_mysql_message);
             end if;
             ROLLBACK;
             leave label_pro;
         elseif v_error_code <> "0" then
             ROLLBACK;
             leave label_pro;
         end if;


         /* 调用【原子_平台估值_估值汇总_计算估值产品费用】*/
         call db_eva.pra_evatotal_calcPdFee(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_co_no,
             v_pd_no,
             v_nav_asset,
             v_total_asset,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.17.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品费用出现错误！',v_mysql_message);
             end if;
             ROLLBACK;
             leave label_pro;
         elseif v_error_code <> "0" then
             ROLLBACK;
             leave label_pro;
         end if;


        /* 调用【原子_平台估值_估值汇总_计算估值产品利息】*/
        call db_eva.pra_evatotal_calcPdRate(
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
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_统计估值产品利息】*/
        call db_eva.pra_evatotal_sumPdRate(
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
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_统计估值产品利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_计算债券当日利息】*/
        call db_eva.pra_evatotal_calcBondInterest(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算债券当日利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_推算产品货基期初数量】*/
        call db_eva.pra_evatotal_calcPdMFBeginQty(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_推算产品货基期初数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_生成估值产品资产信息】*/
        call db_eva.pra_evatotal_createPdAseetInfo(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品资产信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

      #生成单元估值

          /* if  @单元估值# =1 then */
          if  v_unit_evalu =1 then

            /* set @交易组编号#=0; */
            set v_exch_group_no=0;

               /* [声明游标][平台估值_基础参数_估值产品交易组信息表][{交易组编号}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组状态}=《交易组状态-正常》][cursor_eva_product_exgp] */
               cursor_eva_product_exgp:BEGIN
               DECLARE v_cursor_done int default false;
               DECLARE cursor_eva_product_exgp CURSOR FOR
                   select exch_group_no 
                   from db_eva.tb_evabasic_exch_group_info 
                   where co_no=v_co_no and pd_no=v_pd_no and exch_group_status="1";
               DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


               /* [打开游标][@交易组编号#][cursor_eva_product_exgp][loop_eva_product_exgp] */
               open cursor_eva_product_exgp;
               loop_eva_product_exgp: LOOP
               fetch cursor_eva_product_exgp into v_exch_group_no;
                   IF v_cursor_done THEN
                       LEAVE loop_eva_product_exgp;
                   END IF;


               /* 调用【原子_平台估值_估值汇总_获取产品交易组上日资产】*/
               call db_eva.pra_evatotal_getProductExgpPreNet(
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
                   v_evalu_date,
                   v_error_code,
                   v_error_info,
                   v_nav_asset);
               if v_error_code = "1" then
                   SET v_error_code = "evaT.3.17.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品交易组上日资产出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               end if;


               /* 调用【原子_平台估值_估值汇总_计算估值产品交易组费用】*/
               call db_eva.pra_evatotal_calcPdExgpFee(
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
                   v_nav_asset,
                   v_error_code,
                   v_error_info);
               if v_error_code = "1" then
                   SET v_error_code = "evaT.3.17.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品交易组费用出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               end if;


               /* 调用【原子_平台估值_估值汇总_计算估值产品交易组利息】*/
               call db_eva.pra_evatotal_calcPdExgpRate(
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
                   v_error_code,
                   v_error_info);
               if v_error_code = "1" then
                   SET v_error_code = "evaT.3.17.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品交易组利息出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               end if;


               /* 调用【原子_平台估值_估值汇总_统计估值产品交易组利息】*/
               call db_eva.pra_evatotal_sumPdExgpRate(
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
                   v_error_code,
                   v_error_info);
               if v_error_code = "1" then
                   SET v_error_code = "evaT.3.17.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_统计估值产品交易组利息出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               end if;


               /* 调用【原子_平台估值_估值汇总_生成估值产品交易组资产信息】*/
               call db_eva.pra_evatotal_createPdExgpAseetInfo(
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
                   v_evalu_date,
                   v_error_code,
                   v_error_info);
               if v_error_code = "1" then
                   SET v_error_code = "evaT.3.17.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品交易组资产信息出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               end if;


            /* [关闭游标][cursor_eva_product_exgp] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_eva_product_exgp;
            end cursor_eva_product_exgp;

       end if;
        #生成子基金估值

            /* [声明游标][平台估值_基础参数_产品关系表][{产品编号}][{机构编号}=@机构编号# and {母产品编号}=@产品编号#][cursor_eva_product_mom] */
            cursor_eva_product_mom:BEGIN
            DECLARE v_cursor_done int default false;
            DECLARE cursor_eva_product_mom CURSOR FOR
                select pd_no 
                from db_eva.tb_evabasic_pd_relation 
                where co_no=v_co_no and mum_pd_no=v_pd_no;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@产品编号#][cursor_eva_product_mom][loop_eva_product_mom] */
            open cursor_eva_product_mom;
            loop_eva_product_mom: LOOP
            fetch cursor_eva_product_mom into v_pd_no;
                IF v_cursor_done THEN
                    LEAVE loop_eva_product_mom;
                END IF;


                  /* 调用【原子_平台估值_估值汇总_生成估值产品资产信息】*/
                  call db_eva.pra_evatotal_createPdAseetInfo(
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
                      v_error_code,
                      v_error_info);
                  if v_error_code = "1" then
                      SET v_error_code = "evaT.3.17.999";
                      if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品资产信息出现错误！',v_mysql_message);
                      end if;
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  elseif v_error_code <> "0" then
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  end if;


            /* [关闭游标][cursor_eva_product_mom] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_eva_product_mom;
            end cursor_eva_product_mom;

    end if;

        /* 调用【原子_平台估值_估值汇总_生成估值产品累计净值】*/
        call db_eva.pra_evatotal_createPdTotalNet(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品累计净值出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


      /* set  @开始日期#=DATE_FORMAT(DATE_ADD(@开始日期#,INTERVAL 1 DAY),'%Y%m%d'); */
      set  v_begin_date=DATE_FORMAT(DATE_ADD(v_begin_date,INTERVAL 1 DAY),'%Y%m%d');
    end while;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_新增估值产品费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_addPdFeeJour;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_addPdFeeJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_fee_type int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @初始化日期#=@估值日期#; */
         set v_init_date=v_evalu_date;

        /* 调用【原子_平台估值_估值汇总_新增估值产品费用流水】*/
        call db_eva.pra_evatotal_addPdFeeJour(
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
            v_pd_fee_type,
            v_crncy_type,
            v_occur_amt,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.18.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增估值产品费用流水出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_修改估值产品费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_modiPdFeeJour;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_modiPdFeeJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_fee_type int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @初始化日期#=@估值日期#; */
         set v_init_date=v_evalu_date;

         /* 调用【原子_平台估值_估值汇总_修改估值产品费用流水】*/
         call db_eva.pra_evatotal_modiPdFeeJour(
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
             v_pd_fee_type,
             v_crncy_type,
             v_occur_amt,
             v_remark_info,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.19.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_修改估值产品费用流水出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_删除估值产品费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_delPdFeeJour;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_delPdFeeJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_fee_type int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
    declare v_crncy_type varchar(3);
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

          /* set @初始化日期#=@估值日期#; */
          set v_init_date=v_evalu_date;

         /* 调用【原子_平台估值_估值汇总_删除估值产品费用流水】*/
         call db_eva.pra_evatotal_delPdFeeJour(
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
             v_pd_fee_type,
             v_crncy_type,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.20.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_删除估值产品费用流水出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_查询估值产品费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdFeeJour;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdFeeJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_fee_type int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @初始化日期#=@估值日期#; */
         set v_init_date=v_evalu_date;

         /* 调用【原子_平台估值_估值汇总_查询估值产品费用流水】*/
         call db_eva.pra_evatotal_queryPdFeeJour(
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
             v_pd_fee_type,
             v_row_id,
             v_row_count,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.21.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品费用流水出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_新增估值产品利息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_addPdInterestJour;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_addPdInterestJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_rate_type int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_rate_type int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_rate_type = p_pd_rate_type;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @初始化日期#=@估值日期#; */
         set v_init_date=v_evalu_date;

        /* 调用【原子_平台估值_估值汇总_新增估值产品利息流水】*/
        call db_eva.pra_evatotal_addPdInterestJour(
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
            v_pd_rate_type,
            v_crncy_type,
            v_occur_amt,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增估值产品利息流水出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_修改估值产品利息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_modiPdInterestJour;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_modiPdInterestJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_rate_type int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_rate_type int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_rate_type = p_pd_rate_type;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @初始化日期#=@估值日期#; */
         set v_init_date=v_evalu_date;

         /* 调用【原子_平台估值_估值汇总_修改估值产品利息流水】*/
         call db_eva.pra_evatotal_modiPdInterestJour(
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
             v_pd_rate_type,
             v_crncy_type,
             v_occur_amt,
             v_remark_info,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.23.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_修改估值产品利息流水出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_删除估值产品利息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_delPdInterestJour;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_delPdInterestJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_rate_type int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_rate_type int;
    declare v_crncy_type varchar(3);
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_rate_type = p_pd_rate_type;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @初始化日期#=@估值日期#; */
         set v_init_date=v_evalu_date;

         /* 调用【原子_平台估值_估值汇总_删除估值产品利息流水】*/
         call db_eva.pra_evatotal_delPdInterestJour(
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
             v_pd_rate_type,
             v_crncy_type,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.24.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_删除估值产品利息流水出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_查询估值产品利息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdInterestJour;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdInterestJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_rate_type int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_rate_type int;
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_rate_type = p_pd_rate_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

          /* set @初始化日期#=@估值日期#; */
          set v_init_date=v_evalu_date;

         /* 调用【原子_平台估值_估值汇总_查询估值产品利息流水】*/
         call db_eva.pra_evatotal_queryPdInterestJour(
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
             v_pd_rate_type,
             v_row_id,
             v_row_count,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.25.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品利息流水出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_新增外部估值科目数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_addPdFinaValue;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_addPdFinaValue(
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
    IN p_fina_acco_code varchar(64),
    IN p_fina_acco_name varchar(64),
    IN p_amount varchar(32),
    IN p_unit_cost varchar(32),
    IN p_prime_cost varchar(32),
    IN p_cost_net_ratio varchar(32),
    IN p_market_price varchar(32),
    IN p_market_value varchar(32),
    IN p_market_net_ratio varchar(32),
    IN p_evalu_add_str varchar(64),
    IN p_stop_info varchar(32),
    IN p_rights_info varchar(255),
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
    declare v_fina_acco_code varchar(64);
    declare v_fina_acco_name varchar(64);
    declare v_amount varchar(32);
    declare v_unit_cost varchar(32);
    declare v_prime_cost varchar(32);
    declare v_cost_net_ratio varchar(32);
    declare v_market_price varchar(32);
    declare v_market_value varchar(32);
    declare v_market_net_ratio varchar(32);
    declare v_evalu_add_str varchar(64);
    declare v_stop_info varchar(32);
    declare v_rights_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_eva_check_type int;
    declare v_config_str varchar(2048);
    declare v_eva_pd_curr_share varchar(32);
    declare v_eva_nav_asset varchar(32);
    declare v_eva_unit_nav varchar(32);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_fina_acco_code = p_fina_acco_code;
    SET v_fina_acco_name = p_fina_acco_name;
    SET v_amount = p_amount;
    SET v_unit_cost = p_unit_cost;
    SET v_prime_cost = p_prime_cost;
    SET v_cost_net_ratio = p_cost_net_ratio;
    SET v_market_price = p_market_price;
    SET v_market_value = p_market_value;
    SET v_market_net_ratio = p_market_net_ratio;
    SET v_evalu_add_str = p_evalu_add_str;
    SET v_stop_info = p_stop_info;
    SET v_rights_info = p_rights_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_eva_check_type = 0;
    SET v_config_str = " ";
    SET v_eva_pd_curr_share = " ";
    SET v_eva_nav_asset = " ";
    SET v_eva_unit_nav = " ";

    
    label_pro:BEGIN
    

         /* [事务开始] */
         START TRANSACTION;

         #set @机构编号#=@操作员机构编号#;

         /* 调用【原子_平台估值_估值汇总_新增外部估值科目数据】*/
         call db_eva.pra_evatotal_addPdFinaValue(
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
             v_fina_acco_code,
             v_fina_acco_name,
             v_amount,
             v_unit_cost,
             v_prime_cost,
             v_cost_net_ratio,
             v_market_price,
             v_market_value,
             v_market_net_ratio,
             v_evalu_add_str,
             v_stop_info,
             v_rights_info,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.26.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增外部估值科目数据出现错误！',v_mysql_message);
             end if;
             ROLLBACK;
             leave label_pro;
         elseif v_error_code <> "0" then
             ROLLBACK;
             leave label_pro;
         end if;


         /* 调用【原子_平台估值_基础参数_获取估值产品科目汇总信息】*/
         call db_eva.pra_evabasic_getEvaFinaTotalInfo(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_co_no,
             v_pd_no,
             v_fina_acco_code,
             v_error_code,
             v_error_info,
             v_eva_check_type,
             v_config_str);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.26.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取估值产品科目汇总信息出现错误！',v_mysql_message);
             end if;
             ROLLBACK;
             leave label_pro;
         elseif v_error_code <> "0" then
             ROLLBACK;
             leave label_pro;
         end if;


         /* set @估值表产品当前份额#=" "; */
         set v_eva_pd_curr_share=" ";

         /* set @估值表净资产#=" "; */
         set v_eva_nav_asset=" ";

         /* set @估值表单位净值#=" "; */
         set v_eva_unit_nav=" ";

         /* if @估值核对类型# = 6 then */
         if v_eva_check_type = 6 then

             /* set @估值表单位净值#=@科目名称#; */
             set v_eva_unit_nav=v_fina_acco_name;

             /* 调用【原子_平台估值_估值汇总_新增外部估值资产信息】*/
             call db_eva.pra_evatotal_addPdFinaAssetInfo(
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
                 v_eva_pd_curr_share,
                 v_eva_nav_asset,
                 v_eva_unit_nav,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.26.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增外部估值资产信息出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;

         end if;

         /* if @估值核对类型# = 7 then */
         if v_eva_check_type = 7 then

             /* set @估值表产品当前份额#=@数量#; */
             set v_eva_pd_curr_share=v_amount;

             /* 调用【原子_平台估值_估值汇总_新增外部估值资产信息】*/
             call db_eva.pra_evatotal_addPdFinaAssetInfo(
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
                 v_eva_pd_curr_share,
                 v_eva_nav_asset,
                 v_eva_unit_nav,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.26.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增外部估值资产信息出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;

         end if;

         /* if @估值核对类型# = 8 then */
         if v_eva_check_type = 8 then

             /* set @估值表净资产#=@市值#; */
             set v_eva_nav_asset=v_market_value;

             /* 调用【原子_平台估值_估值汇总_新增外部估值资产信息】*/
             call db_eva.pra_evatotal_addPdFinaAssetInfo(
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
                 v_eva_pd_curr_share,
                 v_eva_nav_asset,
                 v_eva_unit_nav,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.26.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增外部估值资产信息出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_查询外部估值科目数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdFinaValue;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdFinaValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
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
    declare v_evalu_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* 调用【原子_平台估值_估值汇总_查询外部估值科目数据】*/
         call db_eva.pra_evatotal_queryPdFinaValue(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_evalu_date,
             v_co_no,
             v_pd_no,
             v_row_id,
             v_row_count,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.27.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询外部估值科目数据出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_查询外部估值数据核对结果
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdFinaCheckResult;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdFinaCheckResult(
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

         /* 调用【原子_平台估值_估值汇总_查询外部估值数据核对结果】*/
         call db_eva.pra_evatotal_queryPdFinaCheckResult(
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
             SET v_error_code = "evaT.3.28.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询外部估值数据核对结果出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_查询外部估值费用核对结果
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdFinaFeeResult;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdFinaFeeResult(
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

         /* 调用【原子_平台估值_估值汇总_查询外部估值费用核对结果】*/
         call db_eva.pra_evatotal_queryPdFinaFeeResult(
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
             SET v_error_code = "evaT.3.29.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询外部估值费用核对结果出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_查询外部估值利息核对结果
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdFinaInterestResult;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdFinaInterestResult(
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

         /* 调用【原子_平台估值_估值汇总_查询外部估值利息核对结果】*/
         call db_eva.pra_evatotal_queryPdFinaInterestResult(
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
             SET v_error_code = "evaT.3.30.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询外部估值利息核对结果出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_查询估值产品增值税明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdVatDetail;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdVatDetail(
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
    

    /* 调用【原子_平台估值_估值汇总_查询估值产品增值税明细】*/
    call db_eva.pra_evatotal_queryPdVatDetail(
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
        SET v_error_code = "evaT.3.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品增值税明细出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_查询产品估值核对数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdCompareValue;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdCompareValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_evalu_date int,
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
    declare v_evalu_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_平台估值_估值汇总_生成产品估值核对数据】*/
    call db_eva.pra_evatotal_createPdFinaValue(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.32.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成产品估值核对数据出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


    /* 调用【原子_平台估值_估值汇总_查询产品估值核对数据】*/
    call db_eva.pra_evatotal_queryPdCompareValue(
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
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.32.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询产品估值核对数据出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_更新估值产品核对数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_updatePdCompareValue;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_updatePdCompareValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_fina_acco_code varchar(64),
    IN p_fina_acco_name varchar(64),
    IN p_market_value varchar(32),
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_fina_acco_code varchar(64);
    declare v_fina_acco_name varchar(64);
    declare v_market_value varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_eva_check_type int;
    declare v_config_str varchar(2048);
    declare v_curr_amt decimal(18,4);
    declare v_asset_acco varchar(16);
    declare v_pd_acco_type int;
    declare v_crncy_type varchar(3);
    declare v_curr_qty decimal(18,2);
    declare v_stock_name varchar(64);
    declare v_pd_fee_type int;
    declare v_begin_amt decimal(18,4);
    declare v_pd_net_asset decimal(18,4);
    declare v_confirm_apply decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_intrst_base_amt decimal(18,4);
    declare v_evalu_share decimal(18,2);
    declare v_occur_share decimal(18,2);
    declare v_init_date int;
    declare v_occur_amt decimal(18,4);
    declare v_arrive_date int;
    declare v_occur_dir int;
    declare v_share_oper int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_fina_acco_code = p_fina_acco_code;
    SET v_fina_acco_name = p_fina_acco_name;
    SET v_market_value = p_market_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_eva_check_type = 0;
    SET v_config_str = " ";
    SET v_curr_amt = 0;
    SET v_asset_acco = " ";
    SET v_pd_acco_type = 0;
    SET v_crncy_type = "CNY";
    SET v_curr_qty = 0;
    SET v_stock_name = " ";
    SET v_pd_fee_type = 0;
    SET v_begin_amt = 0;
    SET v_pd_net_asset = 0;
    SET v_confirm_apply = 0;
    SET v_remark_info = " ";
    SET v_intrst_base_amt = 0;
    SET v_evalu_share = 0;
    SET v_occur_share = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_occur_amt = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_occur_dir = 0;
    SET v_share_oper = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_平台估值_基础参数_获取估值产品科目信息】*/
    call db_eva.pra_evabasic_getEvaFinaInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_fina_acco_code,
        v_error_code,
        v_error_info,
        v_eva_check_type,
        v_config_str);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.33.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取估值产品科目信息出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;


         /* if @估值核对类型# = 1 then */
         if v_eva_check_type = 1 then

             /* set @当前金额#=@市值#; */
             set v_curr_amt=v_market_value;

             /* set @资产账户#=@参数配置串#; */
             set v_asset_acco=v_config_str;

             /* set @产品账户类型#=0; */
             set v_pd_acco_type=0;

             /* set @本币币种#="CNY"; */
             set v_crncy_type="CNY";

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
                 SET v_error_code = "evaT.3.33.999";
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

         /* if @估值核对类型# = 2 then */
         if v_eva_check_type = 2 then

             /* set @当前数量#=@市值#; */
             set v_curr_qty=v_market_value;

             /* set @证券名称#=@科目名称#; */
             set v_stock_name=v_fina_acco_name;

             /* 调用【原子_平台估值_业务数据_更新估值产品历史证券持仓数量】*/
             call db_eva.pra_evadata_UpdatePdHisSecuPosiAmount(
                 v_opor_co_no,
                 v_opor_no,
                 v_oper_mac,
                 v_oper_ip_addr,
                 v_oper_info,
                 v_oper_way,
                 v_func_code,
                 v_co_no,
                 v_pd_no,
                 v_stock_name,
                 v_curr_qty,
                 v_evalu_date,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.33.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_更新估值产品历史证券持仓数量出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;

         end if;

         /* if @估值核对类型# = 10 then */
         if v_eva_check_type = 10 then

             /* set @当前数量#=@市值#; */
             set v_curr_qty=v_market_value;

             /* 调用【原子_平台估值_业务数据_更新产品历史持仓产品份额】*/
             call db_eva.pra_evadata_UpdatePdHisShare(
                 v_opor_co_no,
                 v_opor_no,
                 v_oper_mac,
                 v_oper_ip_addr,
                 v_oper_info,
                 v_oper_way,
                 v_func_code,
                 v_co_no,
                 v_pd_no,
                 v_curr_qty,
                 v_evalu_date,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.33.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_更新产品历史持仓产品份额出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;

         end if;

         /* if @估值核对类型# = 3 then */
         if v_eva_check_type = 3 then

             /* set @当前金额#=@市值#; */
             set v_curr_amt=v_market_value;

             /* set @产品费用类型#=@参数配置串#; */
             set v_pd_fee_type=v_config_str;

             /* set @本币币种#="CNY"; */
             set v_crncy_type="CNY";

             /* set @期初金额#=0; */
             set v_begin_amt=0;

             /* set @产品净资产#=0; */
             set v_pd_net_asset=0;

             /* set @确认金额#=0; */
             set v_confirm_apply=0;

             /* set @备注信息#='估值表更新'; */
             set v_remark_info='估值表更新';

             /* 调用【原子_平台估值_估值汇总_修改估值产品历史费用】*/
             call db_eva.pra_evatotal_modiPdHisFeeAmt(
                 v_opor_co_no,
                 v_opor_no,
                 v_oper_mac,
                 v_oper_ip_addr,
                 v_oper_info,
                 v_oper_way,
                 v_func_code,
                 v_evalu_date,
                 v_co_no,
                 v_pd_no,
                 v_pd_fee_type,
                 v_crncy_type,
                 v_begin_amt,
                 v_curr_amt,
                 v_pd_net_asset,
                 v_confirm_apply,
                 v_remark_info,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.33.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_修改估值产品历史费用出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;

         end if;

         /* if @估值核对类型# = 4 then */
         if v_eva_check_type = 4 then

             /* set @当前金额#=@市值#; */
             set v_curr_amt=v_market_value;

             /* set @资产账户#=@参数配置串#; */
             set v_asset_acco=v_config_str;

             /* set @本币币种#='CNY'; */
             set v_crncy_type='CNY';

             /* set @期初金额#=0; */
             set v_begin_amt=0;

             /* set @利息积数#=0; */
             set v_intrst_base_amt=0;

             /* set @确认金额#=0; */
             set v_confirm_apply=0;

             /* set @备注信息#='估值表更新'; */
             set v_remark_info='估值表更新';

             /* 调用【原子_平台估值_估值汇总_修改估值产品历史利息】*/
             call db_eva.pra_evatotal_modiPdHisInterestAmt(
                 v_opor_co_no,
                 v_opor_no,
                 v_oper_mac,
                 v_oper_ip_addr,
                 v_oper_info,
                 v_oper_way,
                 v_func_code,
                 v_evalu_date,
                 v_co_no,
                 v_pd_no,
                 v_asset_acco,
                 v_crncy_type,
                 v_begin_amt,
                 v_curr_amt,
                 v_intrst_base_amt,
                 v_confirm_apply,
                 v_remark_info,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.33.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_修改估值产品历史利息出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;

         end if;

         /* if @估值核对类型# = 9 then */
         if v_eva_check_type = 9 then

             /* set @估值份额#=@市值#; */
             set v_evalu_share=v_market_value;

             /* 调用【原子_平台估值_基础参数_获取估值产品份额差额】*/
             call db_eva.pra_evabasic_getPdShareDiff(
                 v_opor_co_no,
                 v_opor_no,
                 v_oper_mac,
                 v_oper_ip_addr,
                 v_oper_info,
                 v_oper_way,
                 v_func_code,
                 v_evalu_date,
                 v_co_no,
                 v_pd_no,
                 v_evalu_share,
                 v_error_code,
                 v_error_info,
                 v_occur_share);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.33.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取估值产品份额差额出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;


               /* if @变动份额# <>0 then */
               if v_occur_share <>0 then
                 #[原子_平台估值_基础参数_删除估值产品份额同步流水]

                 /* set @初始化日期#=@估值日期#; */
                 set v_init_date=v_evalu_date;

                 /* set @变动金额#=0; */
                 set v_occur_amt=0;

                 /* set @到账日期#=@估值日期#; */
                 set v_arrive_date=v_evalu_date;

                 /* set @备注信息#='自动同步份额'; */
                 set v_remark_info='自动同步份额';

                 /* if @变动份额#> 0 then */
                 if v_occur_share> 0 then

                        /* set @变动方向#=《变动方向-增加》; */
                        set v_occur_dir=1;

                        /* set @份额操作#=《份额操作-申购》; */
                        set v_share_oper=1;
                     else

                        /* set @变动方向#=《变动方向-减少》; */
                        set v_occur_dir=2;

                        /* set @份额操作#=《份额操作-赎回》; */
                        set v_share_oper=2;

                        /* set @变动份额#=abs(@变动份额#); */
                        set v_occur_share=abs(v_occur_share);
                   end if;

                /* 调用【原子_平台估值_基础参数_增加估值产品份额流水】*/
                call db_eva.pra_evabasic_addPdShareJour(
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
                    v_occur_dir,
                    v_share_oper,
                    v_occur_share,
                    v_occur_amt,
                    v_arrive_date,
                    v_remark_info,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "evaT.3.33.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_增加估值产品份额流水出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

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

# 事务_平台估值_估值汇总_获取估值产品推送数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_getEvaPdPushData;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_getEvaPdPushData(
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
    OUT p_init_date int,
    OUT p_evalu_nav_asset decimal(18,4),
    OUT p_evalu_share decimal(18,2),
    OUT p_total_rece_amt decimal(18,4),
    OUT p_total_payab_amt decimal(18,4),
    OUT p_last_init_date int,
    OUT p_begin_evalu_nav_asset decimal(18,4)
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
    declare v_init_date int;
    declare v_evalu_nav_asset decimal(18,4);
    declare v_evalu_share decimal(18,2);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_last_init_date int;
    declare v_begin_evalu_nav_asset decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_evalu_nav_asset = 0;
    SET v_evalu_share = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_evalu_nav_asset = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_平台估值_估值汇总_获取估值产品推送数据】*/
    call db_eva.pra_evatotal_getEvaPdPushData(
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
        v_init_date,
        v_evalu_nav_asset,
        v_evalu_share,
        v_total_rece_amt,
        v_total_payab_amt,
        v_last_init_date,
        v_begin_evalu_nav_asset);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取估值产品推送数据出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_evalu_nav_asset = v_evalu_nav_asset;
    SET p_evalu_share = v_evalu_share;
    SET p_total_rece_amt = v_total_rece_amt;
    SET p_total_payab_amt = v_total_payab_amt;
    SET p_last_init_date = v_last_init_date;
    SET p_begin_evalu_nav_asset = v_begin_evalu_nav_asset;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_新增估值产品累计净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_addPdTotalNet;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_addPdTotalNet(
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
    IN p_nav_asset decimal(18,4),
    IN p_pd_curr_share decimal(18,2),
    IN p_unit_nav decimal(18,4),
    IN p_cash_coeffi decimal(18,12),
    IN p_share_coeffi decimal(18,12),
    IN p_total_unit_nav decimal(18,4),
    IN p_net_prefee_coeffi decimal(18,12),
    IN p_pre_fee_share_net_total decimal(18,4),
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
    declare v_nav_asset decimal(18,4);
    declare v_pd_curr_share decimal(18,2);
    declare v_unit_nav decimal(18,4);
    declare v_cash_coeffi decimal(18,12);
    declare v_share_coeffi decimal(18,12);
    declare v_total_unit_nav decimal(18,4);
    declare v_net_prefee_coeffi decimal(18,12);
    declare v_pre_fee_share_net_total decimal(18,4);
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
    SET v_nav_asset = p_nav_asset;
    SET v_pd_curr_share = p_pd_curr_share;
    SET v_unit_nav = p_unit_nav;
    SET v_cash_coeffi = p_cash_coeffi;
    SET v_share_coeffi = p_share_coeffi;
    SET v_total_unit_nav = p_total_unit_nav;
    SET v_net_prefee_coeffi = p_net_prefee_coeffi;
    SET v_pre_fee_share_net_total = p_pre_fee_share_net_total;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

     /* [事务开始] */
     START TRANSACTION;


         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* 调用【原子_平台估值_估值汇总_新增估值产品累计净值】*/
         call db_eva.pra_evatotal_addPdTotalNet(
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
             v_nav_asset,
             v_pd_curr_share,
             v_unit_nav,
             v_cash_coeffi,
             v_share_coeffi,
             v_total_unit_nav,
             v_net_prefee_coeffi,
             v_pre_fee_share_net_total,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.35.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增估值产品累计净值出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_修改估值产品累计净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_modiPdTotalNet;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_modiPdTotalNet(
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
    IN p_nav_asset decimal(18,4),
    IN p_pd_curr_share decimal(18,2),
    IN p_unit_nav decimal(18,4),
    IN p_cash_coeffi decimal(18,12),
    IN p_share_coeffi decimal(18,12),
    IN p_total_unit_nav decimal(18,4),
    IN p_net_prefee_coeffi decimal(18,12),
    IN p_pre_fee_share_net_total decimal(18,4),
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
    declare v_nav_asset decimal(18,4);
    declare v_pd_curr_share decimal(18,2);
    declare v_unit_nav decimal(18,4);
    declare v_cash_coeffi decimal(18,12);
    declare v_share_coeffi decimal(18,12);
    declare v_total_unit_nav decimal(18,4);
    declare v_net_prefee_coeffi decimal(18,12);
    declare v_pre_fee_share_net_total decimal(18,4);
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
    SET v_nav_asset = p_nav_asset;
    SET v_pd_curr_share = p_pd_curr_share;
    SET v_unit_nav = p_unit_nav;
    SET v_cash_coeffi = p_cash_coeffi;
    SET v_share_coeffi = p_share_coeffi;
    SET v_total_unit_nav = p_total_unit_nav;
    SET v_net_prefee_coeffi = p_net_prefee_coeffi;
    SET v_pre_fee_share_net_total = p_pre_fee_share_net_total;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

      /* [事务开始] */
      START TRANSACTION;


         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* 调用【原子_平台估值_估值汇总_修改估值产品累计净值】*/
         call db_eva.pra_evatotal_modiPdTotalNet(
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
             v_nav_asset,
             v_pd_curr_share,
             v_unit_nav,
             v_cash_coeffi,
             v_share_coeffi,
             v_total_unit_nav,
             v_net_prefee_coeffi,
             v_pre_fee_share_net_total,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.36.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_修改估值产品累计净值出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_删除估值产品累计净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_delPdTotalNet;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_delPdTotalNet(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* 调用【原子_平台估值_估值汇总_删除估值产品累计净值】*/
         call db_eva.pra_evatotal_delPdTotalNet(
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
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.37.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_删除估值产品累计净值出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_查询估值产品累计净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdTotalNet;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdTotalNet(
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

         /* 调用【原子_平台估值_估值汇总_查询估值产品累计净值】*/
         call db_eva.pra_evatotal_queryPdTotalNet(
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
             SET v_error_code = "evaT.3.38.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品累计净值出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_估值产品累计净值重算
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_calcPdTotalNet;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_calcPdTotalNet(
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_evalu_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_evalu_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* [事务开始] */
    START TRANSACTION;


     /* while @开始日期# <=@结束日期# do */
     while v_begin_date <=v_end_date do

       /* set @估值日期# = @开始日期#; */
       set v_evalu_date = v_begin_date;

        /* 调用【原子_平台估值_估值汇总_生成估值产品累计净值】*/
        call db_eva.pra_evatotal_createPdTotalNet(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.39.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品累计净值出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


      /* set  @开始日期#=DATE_FORMAT(DATE_ADD(@开始日期#,INTERVAL 1 DAY),'%Y%m%d'); */
      set  v_begin_date=DATE_FORMAT(DATE_ADD(v_begin_date,INTERVAL 1 DAY),'%Y%m%d');
    end while;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_导入产品增值税成交流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_importPdVatTrans;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_importPdVatTrans(
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
    IN p_order_dir int,
    IN p_stock_code varchar(6),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_order_dir int;
    declare v_stock_code varchar(6);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_no varchar(64);
    declare v_strike_time int;
    declare v_cost_price decimal(16,9);
    declare v_offset_qty decimal(18,2);
    declare v_deal_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_order_dir = p_order_dir;
    SET v_stock_code = p_stock_code;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_all_fee = p_all_fee;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_no = " ";
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_cost_price = 0;
    SET v_offset_qty = 0;
    SET v_deal_flag = 0;

    
    label_pro:BEGIN
    

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* set @成交编号#=0; */
    set v_strike_no=0;

    /* set @成交时间#=0; */
    set v_strike_time=0;

    /* set @成本价#=0; */
    set v_cost_price=0;

    /* set @冲抵数量#=0; */
    set v_offset_qty=0;

    /* set @处理标志#=0; */
    set v_deal_flag=0;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_平台估值_估值汇总_新增产品增值税成交流水】*/
        call db_eva.pra_evatotal_addPdVatTrans(
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
            v_order_dir,
            v_strike_no,
            v_strike_time,
            v_stock_code,
            v_strike_price,
            v_strike_qty,
            v_strike_amt,
            v_all_fee,
            v_cost_price,
            v_offset_qty,
            v_deal_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.40.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增产品增值税成交流水出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_删除产品增值税成交时间段
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_delPdVatTransData;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_delPdVatTransData(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_平台估值_估值汇总_删除产品增值税成交流水】*/
        call db_eva.pra_evatotal_delPdVatTrans(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.41.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_删除产品增值税成交流水出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_计算产品增值税
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_calcPdVat;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_calcPdVat(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sys_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sys_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* set @系统日期#=date_format(curdate(),'%Y%m%d'); */
    set v_sys_date=date_format(curdate(),'%Y%m%d');

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_平台估值_估值汇总_获取持仓从估值表】*/
        call db_eva.pra_evatotal_getPdPosiByValTable(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.42.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取持仓从估值表出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


         /* if @估值日期#=@系统日期# then */
         if v_evalu_date=v_sys_date then

             /* 调用【原子_平台估值_业务数据_同步估值产品增值税证券成交】*/
             call db_eva.pra_evadata_SyncPdVatTrans(
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
                 SET v_error_code = "evaT.3.42.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步估值产品增值税证券成交出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 leave label_pro;
             end if;

        end if;

        /* 调用【原子_平台估值_估值汇总_生成产品增值税成交汇总】*/
        call db_eva.pra_evatotal_createPdVatTransTotal(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.42.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成产品增值税成交汇总出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_计算产品增值税】*/
        call db_eva.pra_evatotal_calcPdVat(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.42.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算产品增值税出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_删除估值产品增值税成交流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_delPdVatTrans;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_delPdVatTrans(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_date int;
    declare v_end_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_end_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @开始日期#=@估值日期#; */
         set v_begin_date=v_evalu_date;

         /* set @结束日期#=@估值日期#; */
         set v_end_date=v_evalu_date;

         /* 调用【原子_平台估值_估值汇总_删除产品增值税成交流水】*/
         call db_eva.pra_evatotal_delPdVatTrans(
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
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.43.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_删除产品增值税成交流水出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_删除估值产品增值税成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_delPdVatTransJour;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_delPdVatTransJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* 调用【原子_平台估值_估值汇总_删除产品增值税成交明细】*/
         call db_eva.pra_evatotal_delPdVatTransJour(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_evalu_date,
             v_co_no,
             v_pd_no,
             v_row_id,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.44.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_删除产品增值税成交明细出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_查询估值产品增值税成交汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdVatTransTotal;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdVatTransTotal(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_evalu_date int,
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
    declare v_evalu_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* 调用【原子_平台估值_估值汇总_查询产品增值税成交汇总】*/
         call db_eva.pra_evatotal_queryPdVatTransTotal(
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
             v_row_id,
             v_row_count,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.45.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询产品增值税成交汇总出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_查询估值产品增值税成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdVatTransJour;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdVatTransJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_evalu_date int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_evalu_date int;
    declare v_stock_code varchar(6);
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
    SET v_evalu_date = p_evalu_date;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* 调用【原子_平台估值_估值汇总_查询产品增值税成交明细】*/
         call db_eva.pra_evatotal_queryPdVatTransJour(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_evalu_date,
             v_co_no,
             v_pd_no,
             v_stock_code,
             v_row_id,
             v_row_count,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.46.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询产品增值税成交明细出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_修改估值产品资产信息备注
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_modiPdAssetRemark;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_modiPdAssetRemark(
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
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* 调用【原子_平台估值_估值汇总_修改估值产品资产信息备注】*/
         call db_eva.pra_evatotal_modiPdAssetRemark(
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
             v_remark_info,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.47.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_修改估值产品资产信息备注出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_查询产品估值表单位净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdFinaNet;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdFinaNet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
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
    declare v_evalu_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* 调用【原子_平台估值_估值汇总_查询产品估值表单位净值】*/
         call db_eva.pra_evatotal_queryPdFinaNet(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_evalu_date,
             v_co_no,
             v_pd_no,
             v_row_id,
             v_row_count,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.48.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询产品估值表单位净值出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_查询估值产品交易组资产信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdExgpAssetInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdExgpAssetInfo(
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
    declare v_exch_group_no int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_平台估值_估值汇总_查询估值产品交易组资产信息】*/
    call db_eva.pra_evatotal_queryPdExgpAssetInfo(
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
        v_begin_date,
        v_end_date,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.49.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品交易组资产信息出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_新增估值产品交易组费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_addPdExgpFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_addPdExgpFeeAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pd_fee_type int,
    IN p_crncy_type varchar(3),
    IN p_begin_amt decimal(18,4),
    IN p_curr_amt decimal(18,4),
    IN p_pd_net_asset decimal(18,4),
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pd_fee_type int;
    declare v_crncy_type varchar(3);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_pd_net_asset decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_begin_amt = p_begin_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_pd_net_asset = p_pd_net_asset;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

            /* 调用【原子_平台估值_估值汇总_新增估值产品交易组费用】*/
            call db_eva.pra_evatotal_addPdExgpFeeAmt(
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
                v_pd_fee_type,
                v_crncy_type,
                v_begin_amt,
                v_curr_amt,
                v_pd_net_asset,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.50.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增估值产品交易组费用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        else

            /* 调用【原子_平台估值_估值汇总_新增估值产品交易组历史费用】*/
            call db_eva.pra_evatotal_addPdExgpHisFeeAmt(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_evalu_date,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_pd_fee_type,
                v_crncy_type,
                v_begin_amt,
                v_curr_amt,
                v_pd_net_asset,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.50.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增估值产品交易组历史费用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_修改估值产品交易组费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_modiPdExgpFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_modiPdExgpFeeAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pd_fee_type int,
    IN p_crncy_type varchar(3),
    IN p_begin_amt decimal(18,4),
    IN p_curr_amt decimal(18,4),
    IN p_pd_net_asset decimal(18,4),
    IN p_confirm_apply decimal(18,4),
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pd_fee_type int;
    declare v_crncy_type varchar(3);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_pd_net_asset decimal(18,4);
    declare v_confirm_apply decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_begin_amt = p_begin_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_pd_net_asset = p_pd_net_asset;
    SET v_confirm_apply = p_confirm_apply;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

            /* 调用【原子_平台估值_估值汇总_修改估值产品交易组费用】*/
            call db_eva.pra_evatotal_modiPdExgpFeeAmt(
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
                v_pd_fee_type,
                v_crncy_type,
                v_begin_amt,
                v_curr_amt,
                v_pd_net_asset,
                v_confirm_apply,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.51.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_修改估值产品交易组费用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

         else

            /* 调用【原子_平台估值_估值汇总_修改估值产品交易组历史费用】*/
            call db_eva.pra_evatotal_modiPdExgpHisFeeAmt(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_evalu_date,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_pd_fee_type,
                v_crncy_type,
                v_begin_amt,
                v_curr_amt,
                v_pd_net_asset,
                v_confirm_apply,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.51.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_修改估值产品交易组历史费用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

         end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_删除估值产品交易组费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_delPdExgpFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_delPdExgpFeeAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pd_fee_type int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pd_fee_type int;
    declare v_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

           /* 调用【原子_平台估值_估值汇总_删除估值产品交易组费用】*/
           call db_eva.pra_evatotal_delPdExgpFeeAmt(
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
               v_pd_fee_type,
               v_crncy_type,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.52.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_删除估值产品交易组费用出现错误！',v_mysql_message);
               end if;
               leave label_pro;
           elseif v_error_code <> "0" then
               leave label_pro;
           end if;

        else

           /* 调用【原子_平台估值_估值汇总_删除估值产品交易组历史费用】*/
           call db_eva.pra_evatotal_delPdExgpHisFeeAmt(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_evalu_date,
               v_co_no,
               v_pd_no,
               v_exch_group_no,
               v_pd_fee_type,
               v_crncy_type,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.52.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_删除估值产品交易组历史费用出现错误！',v_mysql_message);
               end if;
               leave label_pro;
           elseif v_error_code <> "0" then
               leave label_pro;
           end if;

        end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_查询估值产品交易组费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdExgpFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdExgpFeeAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_pd_fee_type int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pd_fee_type int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

             /* 调用【原子_平台估值_估值汇总_查询估值产品交易组费用】*/
             call db_eva.pra_evatotal_queryPdExgpFeeAmt(
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
                 v_pd_fee_type,
                 v_row_id,
                 v_row_count,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.53.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品交易组费用出现错误！',v_mysql_message);
                 end if;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 leave label_pro;
             end if;

         else

             /* 调用【原子_平台估值_估值汇总_查询估值产品交易组历史费用】*/
             call db_eva.pra_evatotal_queryPdExgpHisFeeAmt(
                 v_opor_co_no,
                 v_opor_no,
                 v_oper_mac,
                 v_oper_ip_addr,
                 v_oper_info,
                 v_oper_way,
                 v_func_code,
                 v_evalu_date,
                 v_co_no,
                 v_pd_no,
                 v_exch_group_no,
                 v_pd_fee_type,
                 v_row_id,
                 v_row_count,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.53.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品交易组历史费用出现错误！',v_mysql_message);
                 end if;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 leave label_pro;
             end if;

         end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_新增估值产品交易组利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_addPdExgpInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_addPdExgpInterestAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco varchar(16),
    IN p_crncy_type varchar(3),
    IN p_begin_amt decimal(18,4),
    IN p_curr_amt decimal(18,4),
    IN p_intrst_base_amt decimal(18,4),
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_begin_amt = p_begin_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_intrst_base_amt = p_intrst_base_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

            /* 调用【原子_平台估值_估值汇总_新增估值产品交易组利息】*/
            call db_eva.pra_evatotal_addPdExgpInterestAmt(
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
                v_asset_acco,
                v_crncy_type,
                v_begin_amt,
                v_curr_amt,
                v_intrst_base_amt,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.54.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增估值产品交易组利息出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        else

            /* 调用【原子_平台估值_估值汇总_新增估值产品交易组历史利息】*/
            call db_eva.pra_evatotal_addPdExgpHisInterestAmt(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_evalu_date,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco,
                v_crncy_type,
                v_begin_amt,
                v_curr_amt,
                v_intrst_base_amt,
                v_remark_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.54.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_新增估值产品交易组历史利息出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

       end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_修改估值产品交易组利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_modiPdExgpInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_modiPdExgpInterestAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco varchar(16),
    IN p_crncy_type varchar(3),
    IN p_begin_amt decimal(18,4),
    IN p_curr_amt decimal(18,4),
    IN p_intrst_base_amt decimal(18,4),
    IN p_confirm_apply decimal(18,4),
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_confirm_apply decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_begin_amt = p_begin_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_intrst_base_amt = p_intrst_base_amt;
    SET v_confirm_apply = p_confirm_apply;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

             /* 调用【原子_平台估值_估值汇总_修改估值产品交易组利息】*/
             call db_eva.pra_evatotal_modiPdExgpInterestAmt(
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
                 v_asset_acco,
                 v_crncy_type,
                 v_begin_amt,
                 v_curr_amt,
                 v_intrst_base_amt,
                 v_confirm_apply,
                 v_remark_info,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.55.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_修改估值产品交易组利息出现错误！',v_mysql_message);
                 end if;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 leave label_pro;
             end if;

        else

             /* 调用【原子_平台估值_估值汇总_修改估值产品交易组历史利息】*/
             call db_eva.pra_evatotal_modiPdExgpHisInterestAmt(
                 v_opor_co_no,
                 v_opor_no,
                 v_oper_mac,
                 v_oper_ip_addr,
                 v_oper_info,
                 v_oper_way,
                 v_func_code,
                 v_evalu_date,
                 v_co_no,
                 v_pd_no,
                 v_exch_group_no,
                 v_asset_acco,
                 v_crncy_type,
                 v_begin_amt,
                 v_curr_amt,
                 v_intrst_base_amt,
                 v_confirm_apply,
                 v_remark_info,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.55.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_修改估值产品交易组历史利息出现错误！',v_mysql_message);
                 end if;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 leave label_pro;
             end if;

       end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_删除估值产品交易组利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_delPdExgpInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_delPdExgpInterestAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_evalu_date int,
    IN p_pd_no int,
    IN p_exch_group_no int,
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
    declare v_co_no int;
    declare v_evalu_date int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

            /* 调用【原子_平台估值_估值汇总_删除估值产品交易组利息】*/
            call db_eva.pra_evatotal_delPdExgpInterestAmt(
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
                v_asset_acco,
                v_crncy_type,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.56.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_删除估值产品交易组利息出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

         else

            /* 调用【原子_平台估值_估值汇总_删除估值产品交易组历史利息】*/
            call db_eva.pra_evatotal_delPdExgpHisInterestAmt(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_evalu_date,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco,
                v_crncy_type,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.56.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_删除估值产品交易组历史利息出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_查询估值产品交易组利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdExgpInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdExgpInterestAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_evalu_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco varchar(16);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco = p_asset_acco;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

         /* set @机构编号#=@操作员机构编号#; */
         set v_co_no=v_opor_co_no;

         /* set @查询日期#=date_format(curdate(),'%Y%m%d'); */
         set v_query_date=date_format(curdate(),'%Y%m%d');

         /* if @估值日期# = 0 then */
         if v_evalu_date = 0 then

          /* set @估值日期#=@查询日期#; */
          set v_evalu_date=v_query_date;
         end if;

        /* set @初始化日期#=@估值日期#; */
        set v_init_date=v_evalu_date;

        /* if @估值日期# = @查询日期# then */
        if v_evalu_date = v_query_date then

           /* 调用【原子_平台估值_估值汇总_查询估值产品交易组利息】*/
           call db_eva.pra_evatotal_queryPdExgpInterestAmt(
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
               v_asset_acco,
               v_row_id,
               v_row_count,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.57.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品交易组利息出现错误！',v_mysql_message);
               end if;
               leave label_pro;
           elseif v_error_code <> "0" then
               leave label_pro;
           end if;

         else

           /* 调用【原子_平台估值_估值汇总_查询估值产品交易组历史利息】*/
           call db_eva.pra_evatotal_queryPdExgpHisInterestAmt(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_evalu_date,
               v_co_no,
               v_pd_no,
               v_exch_group_no,
               v_asset_acco,
               v_row_id,
               v_row_count,
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.57.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品交易组历史利息出现错误！',v_mysql_message);
               end if;
               leave label_pro;
           elseif v_error_code <> "0" then
               leave label_pro;
           end if;

         end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_查询估值产品交易组净资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_queryPdExgpNet;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_queryPdExgpNet(
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
    

    /* 调用【原子_平台估值_估值汇总_查询估值产品交易组净资产】*/
    call db_eva.pra_evatotal_queryPdExgpNet(
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
        SET v_error_code = "evaT.3.58.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_查询估值产品交易组净资产出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_估值产品更新后数据重算
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_calcPdUpdateAssetInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_calcPdUpdateAssetInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_date int;
    declare v_end_date int;
    declare v_sys_date int;
    declare v_pd_begin_share decimal(18,2);
    declare v_pd_curr_share decimal(18,2);
    declare v_target_pd_code varchar(8);
    declare v_is_auto_push varchar(2);
    declare v_unit_evalu int;
    declare v_sync_total_rece_payab int;
    declare v_nav_asset decimal(18,4);
    declare v_total_asset decimal(18,4);
    declare v_config_no bigint;
    declare v_config_value varchar(2048);
    declare v_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_end_date = date_format(curdate(),'%Y%m%d');
    SET v_sys_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_begin_share = 0;
    SET v_pd_curr_share = 0;
    SET v_target_pd_code = " ";
    SET v_is_auto_push = "0";
    SET v_unit_evalu = 0;
    SET v_sync_total_rece_payab = 0;
    SET v_nav_asset = 0;
    SET v_total_asset = 0;
    SET v_config_no = 0;
    SET v_config_value = " ";
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* set @开始日期#=DATE_FORMAT(DATE_ADD(@估值日期#,INTERVAL 1 DAY),'%Y%m%d'); */
    set v_begin_date=DATE_FORMAT(DATE_ADD(v_evalu_date,INTERVAL 1 DAY),'%Y%m%d');

    /* set @结束日期#=date_format(curdate(),'%Y%m%d'); */
    set v_end_date=date_format(curdate(),'%Y%m%d');

    /* set @系统日期#=date_format(curdate(),'%Y%m%d'); */
    set v_sys_date=date_format(curdate(),'%Y%m%d');

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
        SET v_error_code = "evaT.3.59.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取估值产品信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


     /* while @开始日期# <=@结束日期# do */
     while v_begin_date <=v_end_date do

       /* set @估值日期# = @开始日期#; */
       set v_evalu_date = v_begin_date;

    /* if @估值日期#<@系统日期# then */
    if v_evalu_date<v_sys_date then

        /* 调用【原子_平台估值_业务数据_更新估值产品汇率】*/
        call db_eva.pra_evadata_updatePdExRate(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_更新估值产品汇率出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_获取产品上日资产】*/
        call db_eva.pra_evatotal_getProductPreNet(
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
            v_error_code,
            v_error_info,
            v_nav_asset,
            v_total_asset);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品上日资产出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       #计算子基金持仓份额

        /* set @配置编号#=1003; */
        set v_config_no=1003;

        /* set @配置值#=0; */
        set v_config_value=0;

        /* 调用【原子_平台估值_基础参数_获取产品特殊配置】*/
        call db_eva.pra_evabasic_GetPdSpecialConfig(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_config_no,
            v_error_code,
            v_error_info,
            v_config_value);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取产品特殊配置出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @配置值#=1 then */
        if v_config_value=1 then

           /* 调用【原子_平台估值_业务数据_计算子基金持仓变动】*/
           call db_eva.pra_evadata_calcChildPdShare(
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
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.59.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_计算子基金持仓变动出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               leave label_pro;
           end if;

         end if;

        /* 调用【原子_平台估值_估值汇总_更新产品银行账户历史变动】*/
        call db_eva.pra_evatotal_updatePdHisBankAmt(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_更新产品银行账户历史变动出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_计算估值产品历史费用】*/
        call db_eva.pra_evatotal_calcPdHisFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_nav_asset,
            v_evalu_date,
            v_total_asset,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品历史费用出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_计算估值产品历史利息】*/
        call db_eva.pra_evatotal_calcPdHisRate(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品历史利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_统计估值产品历史利息】*/
        call db_eva.pra_evatotal_sumPdHisRate(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_统计估值产品历史利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_获取产品货基收益】*/
        call db_eva.pra_evatotal_getProductMFYield(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品货基收益出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_推算产品货基期初数量】*/
        call db_eva.pra_evatotal_calcPdMFBeginQty(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_推算产品货基期初数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_计算债券历史利息】*/
        call db_eva.pra_evatotal_calcBondHisInterest(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算债券历史利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_更新产品历史份额】*/
        call db_eva.pra_evatotal_updatePdHisShare(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_更新产品历史份额出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_生成估值产品历史资产信息】*/
        call db_eva.pra_evatotal_createHisPdAseetInfo(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品历史资产信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

      #生成单元估值

        /* if  @单元估值# =1 then */
        if  v_unit_evalu =1 then

            /* set @交易组编号#=0; */
            set v_exch_group_no=0;

            /* [声明游标][平台估值_基础参数_估值产品交易组信息表][{交易组编号}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组状态}=《交易组状态-正常》][cursor_eva_product_exgp] */
            cursor_eva_product_exgp:BEGIN
            DECLARE v_cursor_done int default false;
            DECLARE cursor_eva_product_exgp CURSOR FOR
                select exch_group_no 
                from db_eva.tb_evabasic_exch_group_info 
                where co_no=v_co_no and pd_no=v_pd_no and exch_group_status="1";
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@交易组编号#][cursor_eva_product_exgp][loop_eva_product_exgp] */
            open cursor_eva_product_exgp;
            loop_eva_product_exgp: LOOP
            fetch cursor_eva_product_exgp into v_exch_group_no;
                IF v_cursor_done THEN
                    LEAVE loop_eva_product_exgp;
                END IF;


             /* 调用【原子_平台估值_估值汇总_获取产品交易组上日资产】*/
             call db_eva.pra_evatotal_getProductExgpPreNet(
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
                 v_evalu_date,
                 v_error_code,
                 v_error_info,
                 v_nav_asset);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.59.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品交易组上日资产出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             end if;


             /* 调用【原子_平台估值_估值汇总_计算估值产品交易组历史费用】*/
             call db_eva.pra_evatotal_calcPdExgpHisFee(
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
                 v_nav_asset,
                 v_evalu_date,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.59.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品交易组历史费用出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             end if;


             /* 调用【原子_平台估值_估值汇总_计算估值产品交易组历史利息】*/
             call db_eva.pra_evatotal_calcPdExgpHisRate(
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
                 v_evalu_date,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.59.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品交易组历史利息出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             end if;


             /* 调用【原子_平台估值_估值汇总_统计估值产品交易组历史利息】*/
             call db_eva.pra_evatotal_sumPdExgpHisRate(
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
                 v_evalu_date,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.59.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_统计估值产品交易组历史利息出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             end if;


             /* 调用【原子_平台估值_估值汇总_生成估值产品交易组历史资产信息】*/
             call db_eva.pra_evatotal_createHisPdExgpAseetInfo(
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
                 v_evalu_date,
                 v_error_code,
                 v_error_info);
             if v_error_code = "1" then
                 SET v_error_code = "evaT.3.59.999";
                 if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品交易组历史资产信息出现错误！',v_mysql_message);
                 end if;
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             elseif v_error_code <> "0" then
                 ROLLBACK;
                 close cursor_eva_product_exgp;
                 leave label_pro;
             end if;


            /* [关闭游标][cursor_eva_product_exgp] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_eva_product_exgp;
            end cursor_eva_product_exgp;

       end if;
    #生成子基金估值

            /* [声明游标][平台估值_基础参数_产品关系表][{产品编号}][{机构编号}=@机构编号# and {母产品编号}=@产品编号#][cursor_eva_product_mom] */
            cursor_eva_product_mom:BEGIN
            DECLARE v_cursor_done int default false;
            DECLARE cursor_eva_product_mom CURSOR FOR
                select pd_no 
                from db_eva.tb_evabasic_pd_relation 
                where co_no=v_co_no and mum_pd_no=v_pd_no;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@产品编号#][cursor_eva_product_mom][loop_eva_product_mom] */
            open cursor_eva_product_mom;
            loop_eva_product_mom: LOOP
            fetch cursor_eva_product_mom into v_pd_no;
                IF v_cursor_done THEN
                    LEAVE loop_eva_product_mom;
                END IF;


                  /* 调用【原子_平台估值_估值汇总_生成估值产品历史资产信息】*/
                  call db_eva.pra_evatotal_createHisPdAseetInfo(
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
                      v_error_code,
                      v_error_info);
                  if v_error_code = "1" then
                      SET v_error_code = "evaT.3.59.999";
                      if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品历史资产信息出现错误！',v_mysql_message);
                      end if;
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  elseif v_error_code <> "0" then
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  end if;


            /* [关闭游标][cursor_eva_product_mom] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_eva_product_mom;
            end cursor_eva_product_mom;


    /* elseif @估值日期#=@系统日期# then */
    elseif v_evalu_date=v_sys_date then

         /* 调用【原子_平台估值_估值汇总_获取产品上日资产】*/
         call db_eva.pra_evatotal_getProductPreNet(
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
             v_error_code,
             v_error_info,
             v_nav_asset,
             v_total_asset);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.59.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品上日资产出现错误！',v_mysql_message);
             end if;
             ROLLBACK;
             leave label_pro;
         elseif v_error_code <> "0" then
             ROLLBACK;
             leave label_pro;
         end if;

       #计算子基金持仓份额

        /* set @配置编号#=1003; */
        set v_config_no=1003;

        /* set @配置值#=0; */
        set v_config_value=0;

        /* 调用【原子_平台估值_基础参数_获取产品特殊配置】*/
        call db_eva.pra_evabasic_GetPdSpecialConfig(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_config_no,
            v_error_code,
            v_error_info,
            v_config_value);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取产品特殊配置出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @配置值#=1 then */
        if v_config_value=1 then

           /* 调用【原子_平台估值_业务数据_计算子基金持仓变动】*/
           call db_eva.pra_evadata_calcChildPdShare(
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
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.59.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_计算子基金持仓变动出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               leave label_pro;
           end if;

         end if;

         /* 调用【原子_平台估值_估值汇总_更新产品银行账户历史变动】*/
         call db_eva.pra_evatotal_updatePdHisBankAmt(
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
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.59.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_更新产品银行账户历史变动出现错误！',v_mysql_message);
             end if;
             ROLLBACK;
             leave label_pro;
         elseif v_error_code <> "0" then
             ROLLBACK;
             leave label_pro;
         end if;


         /* 调用【原子_平台估值_估值汇总_更新产品费用利息期初金额】*/
         call db_eva.pra_evatotal_updatePdFeeRateBeginAmt(
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
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.59.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_更新产品费用利息期初金额出现错误！',v_mysql_message);
             end if;
             ROLLBACK;
             leave label_pro;
         elseif v_error_code <> "0" then
             ROLLBACK;
             leave label_pro;
         end if;


         /* 调用【原子_平台估值_估值汇总_计算估值产品费用】*/
         call db_eva.pra_evatotal_calcPdFee(
             v_opor_co_no,
             v_opor_no,
             v_oper_mac,
             v_oper_ip_addr,
             v_oper_info,
             v_oper_way,
             v_func_code,
             v_co_no,
             v_pd_no,
             v_nav_asset,
             v_total_asset,
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.59.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品费用出现错误！',v_mysql_message);
             end if;
             ROLLBACK;
             leave label_pro;
         elseif v_error_code <> "0" then
             ROLLBACK;
             leave label_pro;
         end if;


        /* 调用【原子_平台估值_估值汇总_计算估值产品利息】*/
        call db_eva.pra_evatotal_calcPdRate(
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
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_统计估值产品利息】*/
        call db_eva.pra_evatotal_sumPdRate(
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
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_统计估值产品利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_计算债券当日利息】*/
        call db_eva.pra_evatotal_calcBondInterest(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算债券当日利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_推算产品货基期初数量】*/
        call db_eva.pra_evatotal_calcPdMFBeginQty(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_推算产品货基期初数量出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_生成估值产品资产信息】*/
        call db_eva.pra_evatotal_createPdAseetInfo(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品资产信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

      #生成单元估值

          /* if  @单元估值# =1 then */
          if  v_unit_evalu =1 then

            /* set @交易组编号#=0; */
            set v_exch_group_no=0;

               /* [声明游标][平台估值_基础参数_估值产品交易组信息表][{交易组编号}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组状态}=《交易组状态-正常》][cursor_eva_product_exgp] */
               cursor_eva_product_exgp:BEGIN
               DECLARE v_cursor_done int default false;
               DECLARE cursor_eva_product_exgp CURSOR FOR
                   select exch_group_no 
                   from db_eva.tb_evabasic_exch_group_info 
                   where co_no=v_co_no and pd_no=v_pd_no and exch_group_status="1";
               DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


               /* [打开游标][@交易组编号#][cursor_eva_product_exgp][loop_eva_product_exgp] */
               open cursor_eva_product_exgp;
               loop_eva_product_exgp: LOOP
               fetch cursor_eva_product_exgp into v_exch_group_no;
                   IF v_cursor_done THEN
                       LEAVE loop_eva_product_exgp;
                   END IF;


               /* 调用【原子_平台估值_估值汇总_获取产品交易组上日资产】*/
               call db_eva.pra_evatotal_getProductExgpPreNet(
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
                   v_evalu_date,
                   v_error_code,
                   v_error_info,
                   v_nav_asset);
               if v_error_code = "1" then
                   SET v_error_code = "evaT.3.59.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品交易组上日资产出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               end if;


               /* 调用【原子_平台估值_估值汇总_计算估值产品交易组费用】*/
               call db_eva.pra_evatotal_calcPdExgpFee(
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
                   v_nav_asset,
                   v_error_code,
                   v_error_info);
               if v_error_code = "1" then
                   SET v_error_code = "evaT.3.59.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品交易组费用出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               end if;


               /* 调用【原子_平台估值_估值汇总_计算估值产品交易组利息】*/
               call db_eva.pra_evatotal_calcPdExgpRate(
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
                   v_error_code,
                   v_error_info);
               if v_error_code = "1" then
                   SET v_error_code = "evaT.3.59.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品交易组利息出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               end if;


               /* 调用【原子_平台估值_估值汇总_统计估值产品交易组利息】*/
               call db_eva.pra_evatotal_sumPdExgpRate(
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
                   v_error_code,
                   v_error_info);
               if v_error_code = "1" then
                   SET v_error_code = "evaT.3.59.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_统计估值产品交易组利息出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               end if;


               /* 调用【原子_平台估值_估值汇总_生成估值产品交易组资产信息】*/
               call db_eva.pra_evatotal_createPdExgpAseetInfo(
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
                   v_evalu_date,
                   v_error_code,
                   v_error_info);
               if v_error_code = "1" then
                   SET v_error_code = "evaT.3.59.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品交易组资产信息出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   close cursor_eva_product_exgp;
                   leave label_pro;
               end if;


            /* [关闭游标][cursor_eva_product_exgp] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_eva_product_exgp;
            end cursor_eva_product_exgp;

       end if;
        #生成子基金估值

            /* [声明游标][平台估值_基础参数_产品关系表][{产品编号}][{机构编号}=@机构编号# and {母产品编号}=@产品编号#][cursor_eva_product_mom] */
            cursor_eva_product_mom:BEGIN
            DECLARE v_cursor_done int default false;
            DECLARE cursor_eva_product_mom CURSOR FOR
                select pd_no 
                from db_eva.tb_evabasic_pd_relation 
                where co_no=v_co_no and mum_pd_no=v_pd_no;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@产品编号#][cursor_eva_product_mom][loop_eva_product_mom] */
            open cursor_eva_product_mom;
            loop_eva_product_mom: LOOP
            fetch cursor_eva_product_mom into v_pd_no;
                IF v_cursor_done THEN
                    LEAVE loop_eva_product_mom;
                END IF;


                  /* 调用【原子_平台估值_估值汇总_生成估值产品资产信息】*/
                  call db_eva.pra_evatotal_createPdAseetInfo(
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
                      v_error_code,
                      v_error_info);
                  if v_error_code = "1" then
                      SET v_error_code = "evaT.3.59.999";
                      if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品资产信息出现错误！',v_mysql_message);
                      end if;
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  elseif v_error_code <> "0" then
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  end if;


            /* [关闭游标][cursor_eva_product_mom] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_eva_product_mom;
            end cursor_eva_product_mom;

    end if;

        /* 调用【原子_平台估值_估值汇总_生成估值产品累计净值】*/
        call db_eva.pra_evatotal_createPdTotalNet(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.59.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品累计净值出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


      /* set  @开始日期#=DATE_FORMAT(DATE_ADD(@开始日期#,INTERVAL 1 DAY),'%Y%m%d'); */
      set  v_begin_date=DATE_FORMAT(DATE_ADD(v_begin_date,INTERVAL 1 DAY),'%Y%m%d');
    end while;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_估值系统数据归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_dataToHis;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_dataToHis(
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
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_平台估值_估值汇总_估值系统数据归档】*/
    call db_eva.pra_evatotal_dataToHis(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.101.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_估值系统数据归档出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_估值系统初始化
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_systemInit;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_systemInit(
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
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_平台估值_估值汇总_估值系统初始化】*/
    call db_eva.pra_evatotal_systemInit(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "evaT.3.102.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_估值系统初始化出现错误！',v_mysql_message);
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

# 事务_平台估值_估值汇总_估值系统自动估值定时任务
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_autoEvaTask;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_autoEvaTask(
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pd_no int;
    declare v_pd_begin_share decimal(18,2);
    declare v_pd_curr_share decimal(18,2);
    declare v_target_pd_code varchar(8);
    declare v_task_status varchar(2);
    declare v_is_auto_push varchar(2);
    declare v_is_sync_netvalue int;
    declare v_unit_evalu int;
    declare v_hk_asset_calc_rate int;
    declare v_sync_total_rece_payab int;
    declare v_remark_info varchar(255);
    declare v_nav_asset decimal(18,4);
    declare v_total_asset decimal(18,4);
    declare v_config_no bigint;
    declare v_config_value varchar(2048);
    declare v_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pd_no = 0;
    SET v_pd_begin_share = 0;
    SET v_pd_curr_share = 0;
    SET v_target_pd_code = " ";
    SET v_task_status = "0";
    SET v_is_auto_push = "0";
    SET v_is_sync_netvalue = 0;
    SET v_unit_evalu = 0;
    SET v_hk_asset_calc_rate = 0;
    SET v_sync_total_rece_payab = 0;
    SET v_remark_info = " ";
    SET v_nav_asset = 0;
    SET v_total_asset = 0;
    SET v_config_no = 0;
    SET v_config_value = " ";
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* set @估值日期#=date_format(curdate(),'%Y%m%d'); */
    set v_evalu_date=date_format(curdate(),'%Y%m%d');

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* [声明游标][平台估值_基础参数_估值产品基本信息表][字段][{机构编号}=@机构编号# and {任务状态}=《任务状态-运行》][cursor_eva_product] */
    cursor_eva_product:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_product CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_begin_share, pd_curr_share, target_pd_code, 
        task_status, is_auto_push, is_sync_netvalue, unit_evalu, 
        hk_asset_calc_rate, sync_total_rece_payab, remark_info 
        from db_eva.tb_evabasic_product_info 
        where co_no=v_co_no and task_status="1";
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_eva_product][loop_eva_product] */
    open cursor_eva_product;
    loop_eva_product: LOOP
    fetch cursor_eva_product into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_pd_begin_share, v_pd_curr_share, v_target_pd_code, 
        v_task_status, v_is_auto_push, v_is_sync_netvalue, v_unit_evalu, 
        v_hk_asset_calc_rate, v_sync_total_rece_payab, v_remark_info;
        IF v_cursor_done THEN
            LEAVE loop_eva_product;
        END IF;


    /* [事务开始] */
    START TRANSACTION;


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
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取估值产品信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
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
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步估值产品证券账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
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
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步估值产品证券持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_业务数据_同步估值产品大宗交易】*/
        call db_eva.pra_evadata_SyncPdBlockTrade(
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
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步估值产品大宗交易出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_业务数据_更新估值产品持仓根据场外交易】*/
        call db_eva.pra_evadata_updatePdPosiByTransOut(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_更新估值产品持仓根据场外交易出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        end if;


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
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_更新估值产品证券行情出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_业务数据_计算估值产品场外交易公允价值】*/
        call db_eva.pra_evadata_calcPdTransOutValue(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_计算估值产品场外交易公允价值出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_更新产品银行账户历史变动】*/
        call db_eva.pra_evatotal_updatePdHisBankAmt(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_更新产品银行账户历史变动出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        end if;


         /* 调用【原子_平台估值_估值汇总_更新产品费用利息期初金额】*/
         call db_eva.pra_evatotal_updatePdFeeRateBeginAmt(
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
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.103.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_更新产品费用利息期初金额出现错误！',v_mysql_message);
             end if;
             ROLLBACK;
             close cursor_eva_product;
             leave label_pro;
         elseif v_error_code <> "0" then
             ROLLBACK;
             close cursor_eva_product;
             leave label_pro;
         end if;


        /* 调用【原子_平台估值_估值汇总_获取产品上日资产】*/
        call db_eva.pra_evatotal_getProductPreNet(
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
            v_error_code,
            v_error_info,
            v_nav_asset,
            v_total_asset);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品上日资产出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_计算估值产品费用】*/
        call db_eva.pra_evatotal_calcPdFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_nav_asset,
            v_total_asset,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品费用出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_计算估值产品利息】*/
        call db_eva.pra_evatotal_calcPdRate(
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
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_统计估值产品利息】*/
        call db_eva.pra_evatotal_sumPdRate(
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
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_统计估值产品利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_计算债券当日利息】*/
        call db_eva.pra_evatotal_calcBondInterest(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算债券当日利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        end if;

        #计算增值税

        /* set @配置编号#=1001; */
        set v_config_no=1001;

        /* set @配置值#=0; */
        set v_config_value=0;

        /* 调用【原子_平台估值_基础参数_获取产品特殊配置】*/
        call db_eva.pra_evabasic_GetPdSpecialConfig(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_config_no,
            v_error_code,
            v_error_info,
            v_config_value);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取产品特殊配置出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        end if;


        /* if @配置值#=1 then */
        if v_config_value=1 then

           /* 调用【事务_平台估值_估值汇总_计算产品增值税】*/
           call db_eva.prt_evatotal_calcPdVat(
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
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.103.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程事务_平台估值_估值汇总_计算产品增值税出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               close cursor_eva_product;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               close cursor_eva_product;
               leave label_pro;
           end if;

         end if;
       #同步ta份额流水

        /* set @配置编号#=1002; */
        set v_config_no=1002;

        /* set @配置值#=0; */
        set v_config_value=0;

        /* 调用【原子_平台估值_基础参数_获取产品特殊配置】*/
        call db_eva.pra_evabasic_GetPdSpecialConfig(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_config_no,
            v_error_code,
            v_error_info,
            v_config_value);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取产品特殊配置出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        end if;


        /* if @配置值#=1 then */
        if v_config_value=1 then

           /* 调用【原子_平台估值_业务数据_同步产品份额变动】*/
           call db_eva.pra_evadata_syncPdShareJour(
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
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.103.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步产品份额变动出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               close cursor_eva_product;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               close cursor_eva_product;
               leave label_pro;
           end if;

         end if;

        /* 调用【原子_平台估值_估值汇总_生成估值产品资产信息】*/
        call db_eva.pra_evatotal_createPdAseetInfo(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品资产信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_生成估值产品累计净值】*/
        call db_eva.pra_evatotal_createPdTotalNet(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.103.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品累计净值出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            close cursor_eva_product;
            leave label_pro;
        end if;


         /* if @单元估值#= 1 then */
         if v_unit_evalu= 1 then

            /* 调用【原子_平台估值_基础参数_获取估值产品交易组信息】*/
            call db_eva.pra_evabasic_getEvaExgpInfo(
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
                SET v_error_code = "evaT.3.103.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取估值产品交易组信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product;
                leave label_pro;
            end if;


            /* set @交易组编号#=0; */
            set v_exch_group_no=0;

            /* [声明游标][平台估值_基础参数_估值产品交易组信息表][{交易组编号}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组状态}=《交易组状态-正常》][cursor_eva_product_exgp] */
            cursor_eva_product_exgp:BEGIN
            DECLARE v_cursor_done int default false;
            DECLARE cursor_eva_product_exgp CURSOR FOR
                select exch_group_no 
                from db_eva.tb_evabasic_exch_group_info 
                where co_no=v_co_no and pd_no=v_pd_no and exch_group_status="1";
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@交易组编号#][cursor_eva_product_exgp][loop_eva_product_exgp] */
            open cursor_eva_product_exgp;
            loop_eva_product_exgp: LOOP
            fetch cursor_eva_product_exgp into v_exch_group_no;
                IF v_cursor_done THEN
                    LEAVE loop_eva_product_exgp;
                END IF;


            /* 调用【原子_平台估值_业务数据_同步估值产品交易组证券账户资金】*/
            call db_eva.pra_evadata_SyncPdExgpAccoCapit(
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
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.103.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步估值产品交易组证券账户资金出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_业务数据_同步估值产品交易组证券持仓】*/
            call db_eva.pra_evadata_SyncPdExgpSecuPosi(
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
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.103.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步估值产品交易组证券持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_业务数据_更新估值产品交易组证券行情】*/
            call db_eva.pra_evadata_updateExgpSecuPrice(
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
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.103.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_更新估值产品交易组证券行情出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_估值汇总_更新产品交易组费用利息期初金额】*/
            call db_eva.pra_evatotal_updatePdExgpFeeRateBeginAmt(
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
                v_evalu_date,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.103.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_更新产品交易组费用利息期初金额出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_估值汇总_获取产品交易组上日资产】*/
            call db_eva.pra_evatotal_getProductExgpPreNet(
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
                v_evalu_date,
                v_error_code,
                v_error_info,
                v_nav_asset);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.103.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品交易组上日资产出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_估值汇总_计算估值产品交易组费用】*/
            call db_eva.pra_evatotal_calcPdExgpFee(
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
                v_nav_asset,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.103.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品交易组费用出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_估值汇总_计算估值产品交易组利息】*/
            call db_eva.pra_evatotal_calcPdExgpRate(
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
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.103.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品交易组利息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_估值汇总_统计估值产品交易组利息】*/
            call db_eva.pra_evatotal_sumPdExgpRate(
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
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.103.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_统计估值产品交易组利息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_估值汇总_生成估值产品交易组资产信息】*/
            call db_eva.pra_evatotal_createPdExgpAseetInfo(
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
                v_evalu_date,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.103.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品交易组资产信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* [关闭游标][cursor_eva_product_exgp] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_eva_product_exgp;
            end cursor_eva_product_exgp;

        end if;

    /* [事务结束] */
    COMMIT;


    /* [关闭游标][cursor_eva_product] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_product;
    end cursor_eva_product;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_单产品获取数据估值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_singleEvaTask;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_singleEvaTask(
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
    declare v_evalu_date int;
    declare v_pd_begin_share decimal(18,2);
    declare v_pd_curr_share decimal(18,2);
    declare v_target_pd_code varchar(8);
    declare v_is_auto_push varchar(2);
    declare v_unit_evalu int;
    declare v_sync_total_rece_payab int;
    declare v_config_no bigint;
    declare v_config_value varchar(2048);
    declare v_nav_asset decimal(18,4);
    declare v_total_asset decimal(18,4);
    declare v_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = date_format(curdate(),'%Y%m%d');
    SET v_pd_begin_share = 0;
    SET v_pd_curr_share = 0;
    SET v_target_pd_code = " ";
    SET v_is_auto_push = "0";
    SET v_unit_evalu = 0;
    SET v_sync_total_rece_payab = 0;
    SET v_config_no = 0;
    SET v_config_value = " ";
    SET v_nav_asset = 0;
    SET v_total_asset = 0;
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* set @估值日期#=date_format(curdate(),'%Y%m%d'); */
    set v_evalu_date=date_format(curdate(),'%Y%m%d');

    /* [事务开始] */
    START TRANSACTION;


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
            SET v_error_code = "evaT.3.104.999";
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
            SET v_error_code = "evaT.3.104.999";
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
            SET v_error_code = "evaT.3.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步估值产品证券持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_业务数据_同步估值产品大宗交易】*/
        call db_eva.pra_evadata_SyncPdBlockTrade(
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
            SET v_error_code = "evaT.3.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步估值产品大宗交易出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_业务数据_更新估值产品持仓根据场外交易】*/
        call db_eva.pra_evadata_updatePdPosiByTransOut(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_更新估值产品持仓根据场外交易出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


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
            SET v_error_code = "evaT.3.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_更新估值产品证券行情出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

       #计算子基金持仓份额

        /* set @配置编号#=1003; */
        set v_config_no=1003;

        /* set @配置值#=0; */
        set v_config_value=0;

        /* 调用【原子_平台估值_基础参数_获取产品特殊配置】*/
        call db_eva.pra_evabasic_GetPdSpecialConfig(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_config_no,
            v_error_code,
            v_error_info,
            v_config_value);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取产品特殊配置出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @配置值#=1 then */
        if v_config_value=1 then

           /* 调用【原子_平台估值_业务数据_计算子基金持仓变动】*/
           call db_eva.pra_evadata_calcChildPdShare(
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
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.104.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_计算子基金持仓变动出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               leave label_pro;
           end if;

         end if;

        /* 调用【原子_平台估值_业务数据_计算估值产品场外交易公允价值】*/
        call db_eva.pra_evadata_calcPdTransOutValue(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_计算估值产品场外交易公允价值出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_更新产品银行账户历史变动】*/
        call db_eva.pra_evatotal_updatePdHisBankAmt(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_更新产品银行账户历史变动出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


         /* 调用【原子_平台估值_估值汇总_更新产品费用利息期初金额】*/
         call db_eva.pra_evatotal_updatePdFeeRateBeginAmt(
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
             v_error_code,
             v_error_info);
         if v_error_code = "1" then
             SET v_error_code = "evaT.3.104.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_更新产品费用利息期初金额出现错误！',v_mysql_message);
             end if;
             ROLLBACK;
             leave label_pro;
         elseif v_error_code <> "0" then
             ROLLBACK;
             leave label_pro;
         end if;


        /* 调用【原子_平台估值_估值汇总_获取产品上日资产】*/
        call db_eva.pra_evatotal_getProductPreNet(
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
            v_error_code,
            v_error_info,
            v_nav_asset,
            v_total_asset);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品上日资产出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_计算估值产品费用】*/
        call db_eva.pra_evatotal_calcPdFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_nav_asset,
            v_total_asset,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品费用出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_计算估值产品利息】*/
        call db_eva.pra_evatotal_calcPdRate(
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
            SET v_error_code = "evaT.3.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_统计估值产品利息】*/
        call db_eva.pra_evatotal_sumPdRate(
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
            SET v_error_code = "evaT.3.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_统计估值产品利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_计算债券当日利息】*/
        call db_eva.pra_evatotal_calcBondInterest(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算债券当日利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #计算增值税

        /* set @配置编号#=1001; */
        set v_config_no=1001;

        /* set @配置值#=0; */
        set v_config_value=0;

           /* 调用【原子_平台估值_基础参数_获取产品特殊配置】*/
           call db_eva.pra_evabasic_GetPdSpecialConfig(
               v_opor_co_no,
               v_opor_no,
               v_oper_mac,
               v_oper_ip_addr,
               v_oper_info,
               v_oper_way,
               v_func_code,
               v_co_no,
               v_pd_no,
               v_config_no,
               v_error_code,
               v_error_info,
               v_config_value);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.104.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取产品特殊配置出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               leave label_pro;
           end if;


        /* if @配置值#=1 then */
        if v_config_value=1 then

           /* 调用【事务_平台估值_估值汇总_计算产品增值税】*/
           call db_eva.prt_evatotal_calcPdVat(
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
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.104.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程事务_平台估值_估值汇总_计算产品增值税出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               leave label_pro;
           end if;

         end if;
       #同步ta份额流水

        /* set @配置编号#=1002; */
        set v_config_no=1002;

        /* set @配置值#=0; */
        set v_config_value=0;

        /* 调用【原子_平台估值_基础参数_获取产品特殊配置】*/
        call db_eva.pra_evabasic_GetPdSpecialConfig(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_config_no,
            v_error_code,
            v_error_info,
            v_config_value);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取产品特殊配置出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* if @配置值#=1 then */
        if v_config_value=1 then

           /* 调用【原子_平台估值_业务数据_同步产品份额变动】*/
           call db_eva.pra_evadata_syncPdShareJour(
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
               v_error_code,
               v_error_info);
           if v_error_code = "1" then
               SET v_error_code = "evaT.3.104.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步产品份额变动出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               leave label_pro;
           end if;

         end if;

        /* 调用【原子_平台估值_估值汇总_生成估值产品资产信息】*/
        call db_eva.pra_evatotal_createPdAseetInfo(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品资产信息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_平台估值_估值汇总_生成估值产品累计净值】*/
        call db_eva.pra_evatotal_createPdTotalNet(
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
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "evaT.3.104.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品累计净值出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


         /* if @单元估值#= 1 then */
         if v_unit_evalu= 1 then

            /* 调用【原子_平台估值_基础参数_获取估值产品交易组信息】*/
            call db_eva.pra_evabasic_getEvaExgpInfo(
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
                SET v_error_code = "evaT.3.104.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_基础参数_获取估值产品交易组信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @交易组编号#=0; */
            set v_exch_group_no=0;

            /* [声明游标][平台估值_基础参数_估值产品交易组信息表][{交易组编号}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组状态}=《交易组状态-正常》][cursor_eva_product_exgp] */
            cursor_eva_product_exgp:BEGIN
            DECLARE v_cursor_done int default false;
            DECLARE cursor_eva_product_exgp CURSOR FOR
                select exch_group_no 
                from db_eva.tb_evabasic_exch_group_info 
                where co_no=v_co_no and pd_no=v_pd_no and exch_group_status="1";
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@交易组编号#][cursor_eva_product_exgp][loop_eva_product_exgp] */
            open cursor_eva_product_exgp;
            loop_eva_product_exgp: LOOP
            fetch cursor_eva_product_exgp into v_exch_group_no;
                IF v_cursor_done THEN
                    LEAVE loop_eva_product_exgp;
                END IF;


            /* 调用【原子_平台估值_业务数据_同步估值产品交易组证券账户资金】*/
            call db_eva.pra_evadata_SyncPdExgpAccoCapit(
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
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.104.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步估值产品交易组证券账户资金出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_业务数据_同步估值产品交易组证券持仓】*/
            call db_eva.pra_evadata_SyncPdExgpSecuPosi(
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
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.104.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_同步估值产品交易组证券持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_业务数据_更新估值产品交易组证券行情】*/
            call db_eva.pra_evadata_updateExgpSecuPrice(
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
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.104.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_更新估值产品交易组证券行情出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_估值汇总_更新产品交易组费用利息期初金额】*/
            call db_eva.pra_evatotal_updatePdExgpFeeRateBeginAmt(
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
                v_evalu_date,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.104.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_更新产品交易组费用利息期初金额出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_估值汇总_获取产品交易组上日资产】*/
            call db_eva.pra_evatotal_getProductExgpPreNet(
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
                v_evalu_date,
                v_error_code,
                v_error_info,
                v_nav_asset);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.104.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取产品交易组上日资产出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_估值汇总_计算估值产品交易组费用】*/
            call db_eva.pra_evatotal_calcPdExgpFee(
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
                v_nav_asset,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.104.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品交易组费用出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_估值汇总_计算估值产品交易组利息】*/
            call db_eva.pra_evatotal_calcPdExgpRate(
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
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.104.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_计算估值产品交易组利息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_估值汇总_统计估值产品交易组利息】*/
            call db_eva.pra_evatotal_sumPdExgpRate(
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
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.104.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_统计估值产品交易组利息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* 调用【原子_平台估值_估值汇总_生成估值产品交易组资产信息】*/
            call db_eva.pra_evatotal_createPdExgpAseetInfo(
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
                v_evalu_date,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "evaT.3.104.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品交易组资产信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                close cursor_eva_product_exgp;
                leave label_pro;
            end if;


            /* [关闭游标][cursor_eva_product_exgp] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_eva_product_exgp;
            end cursor_eva_product_exgp;

        end if;
          #生成子基金估值

            /* [声明游标][平台估值_基础参数_产品关系表][{产品编号}][{机构编号}=@机构编号# and {母产品编号}=@产品编号#][cursor_eva_product_mom] */
            cursor_eva_product_mom:BEGIN
            DECLARE v_cursor_done int default false;
            DECLARE cursor_eva_product_mom CURSOR FOR
                select pd_no 
                from db_eva.tb_evabasic_pd_relation 
                where co_no=v_co_no and mum_pd_no=v_pd_no;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@产品编号#][cursor_eva_product_mom][loop_eva_product_mom] */
            open cursor_eva_product_mom;
            loop_eva_product_mom: LOOP
            fetch cursor_eva_product_mom into v_pd_no;
                IF v_cursor_done THEN
                    LEAVE loop_eva_product_mom;
                END IF;


                  /* 调用【原子_平台估值_估值汇总_生成估值产品资产信息】*/
                  call db_eva.pra_evatotal_createPdAseetInfo(
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
                      v_error_code,
                      v_error_info);
                  if v_error_code = "1" then
                      SET v_error_code = "evaT.3.104.999";
                      if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_生成估值产品资产信息出现错误！',v_mysql_message);
                      end if;
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  elseif v_error_code <> "0" then
                      ROLLBACK;
                      close cursor_eva_product_mom;
                      leave label_pro;
                  end if;


            /* [关闭游标][cursor_eva_product_mom] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_eva_product_mom;
            end cursor_eva_product_mom;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 事务_平台估值_估值汇总_估值系统节假日补算
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_evatotal_calcHoliday;;
DELIMITER ;;
CREATE PROCEDURE prt_evatotal_calcHoliday(
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
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_init_date int;
    declare v_begin_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_end_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @结束日期#=date_format(curdate(),'%Y%m%d'); */
    set v_end_date=date_format(curdate(),'%Y%m%d');

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;

    /* [声明游标两表关联][历史_平台估值_估值汇总_估值产品资产信息表][平台估值_基础参数_估值产品基本信息表][a.{产品编号},max(a.{初始化日期})][a.{机构编号}=b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{机构编号}=@机构编号# and b.{任务状态}=《任务状态-运行》 group by a.{产品编号}][cursor_eva_product] */
    cursor_eva_product:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_product CURSOR FOR
        select a.pd_no,max(a.init_date) 
        from db_eva_his.tb_evatotal_product_asset_info_his a,db_eva.tb_evabasic_product_info b  
        where a.co_no=b.co_no and a.pd_no=b.pd_no and a.co_no=v_co_no and b.task_status="1" group by a.pd_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@产品编号#,@初始化日期#][cursor_eva_product][loop_eva_product] */
    open cursor_eva_product;
    loop_eva_product: LOOP
    fetch cursor_eva_product into v_pd_no,v_init_date;
        IF v_cursor_done THEN
            LEAVE loop_eva_product;
        END IF;


    /* [事务开始] */
    START TRANSACTION;


       /* set @开始日期# = date_format(DATE_ADD(@初始化日期#,INTERVAL 1 DAY),'%Y%m%d'); */
       set v_begin_date = date_format(DATE_ADD(v_init_date,INTERVAL 1 DAY),'%Y%m%d');

      /* 调用【事务_平台估值_估值汇总_估值产品历史资产数据重算】*/
      call db_eva.prt_evatotal_calcPdHisAssetInfo(
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
          v_error_code,
          v_error_info);
      if v_error_code = "1" then
          SET v_error_code = "evaT.3.105.999";
          if v_mysql_message <> "" then
               SET v_error_info = CONCAT(v_error_info,"#",'调用过程事务_平台估值_估值汇总_估值产品历史资产数据重算出现错误！',v_mysql_message);
          end if;
          ROLLBACK;
          close cursor_eva_product;
          leave label_pro;
      elseif v_error_code <> "0" then
          ROLLBACK;
          close cursor_eva_product;
          leave label_pro;
      end if;


    /* [事务结束] */
    COMMIT;


    /* [关闭游标][cursor_eva_product] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_product;
    end cursor_eva_product;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


