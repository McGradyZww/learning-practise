DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_更新交易组历史资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_UpdateExchGroupAssetHis;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_UpdateExchGroupAssetHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_target_exch_group_no int,
    IN p_occur_qty decimal(18,2),
    IN p_begin_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_menu_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_target_exch_group_no int;
    declare v_occur_qty decimal(18,2);
    declare v_begin_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_tmp_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_begin_NAV decimal(18,4);
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_stock_cash_asset decimal(18,4);
    declare v_cash_asset decimal(18,4);
    declare v_total_cash_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_futu_cash_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_total_realiz_pandl decimal(18,4);
    declare v_tmp_begin_date int;
    declare v_many_days_total_asset decimal(18,4);
    declare v_stat_days int;
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_total_fina_debt decimal(18,4);
    declare v_total_loan_debt decimal(18,4);
    declare v_init_date int;
    declare v_last_init_date int;
    declare v_pre_close_price decimal(16,9);
    declare v_tmp_init_date int;
    declare v_nav_asset decimal(18,4);
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
    SET v_menu_no = p_menu_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_target_exch_group_no = p_target_exch_group_no;
    SET v_occur_qty = p_occur_qty;
    SET v_begin_date = p_begin_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_tmp_exch_group_no = 0;
    SET v_crncy_type = "CNY";
    SET v_begin_NAV = 0;
    SET v_begin_evalu_nav_asset = 0;
    SET v_evalu_nav_asset = 0;
    SET v_stock_cash_asset = 0;
    SET v_cash_asset = 0;
    SET v_total_cash_asset = 0;
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_repo_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_fund_asset = 0;
    SET v_futu_cash_asset = 0;
    SET v_futu_asset = 0;
    SET v_other_asset = 0;
    SET v_total_realiz_pandl = 0;
    SET v_tmp_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_many_days_total_asset = 0;
    SET v_stat_days = 0;
    SET v_money_fund_asset = 0;
    SET v_not_money_fund_asset = 0;
    SET v_total_fina_debt = 0;
    SET v_total_loan_debt = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pre_close_price = 0;
    SET v_tmp_init_date = date_format(curdate(),'%Y%m%d');
    SET v_nav_asset = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @临时_交易组编号#=@交易组编号#; */
    set v_tmp_exch_group_no=v_exch_group_no;

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @期初净资产# = 0; */
    set v_begin_NAV = 0;

    /* set @期初估值净资产# = 0; */
    set v_begin_evalu_nav_asset = 0;

    /* set @估值净资产# = 0; */
    set v_evalu_nav_asset = 0;

    /* set @证券现金资产#=0; */
    set v_stock_cash_asset=0;

    /* set @现金资产# = 0; */
    set v_cash_asset = 0;

    /* set @总现金资产# = 0; */
    set v_total_cash_asset = 0;

    /* set @股票资产#=0; */
    set v_stock_asset=0;

    /* set @债券资产#=0; */
    set v_bond_asset=0;

    /* set @回购资产#=0; */
    set v_repo_asset=0;

    /* set @港股通资产#=0; */
    set v_hk_thrgh_stock_asset=0;

    /* set @基金资产#=0; */
    set v_fund_asset=0;

    /* set @期货现金资产# = 0; */
    set v_futu_cash_asset = 0;

    /* set @期货资产# = 0; */
    set v_futu_asset = 0;

    /* set @其他资产# = 0; */
    set v_other_asset = 0;

    /* set @累计实现收益#=0; */
    set v_total_realiz_pandl=0;

    /* set @临时_开始日期#=@开始日期#; */
    set v_tmp_begin_date=v_begin_date;

    /* set @多日总资产# = 0; */
    set v_many_days_total_asset = 0;

    /* set @统计天数# = 0; */
    set v_stat_days = 0;

    /* set @货币基金资产#=0; */
    set v_money_fund_asset=0;

    /* set @非货币基金资产#=0; */
    set v_not_money_fund_asset=0;

    /* set @总融资负债#=0; */
    set v_total_fina_debt=0;

    /* set @总融券负债#=0; */
    set v_total_loan_debt=0;
    #开始日期为当天的,那就不继续

    /* [获取表记录变量][公共_基础_系统信息表][{初始化日期}][@初始化日期#][1=1][4]["获取系统初始化日期错误 !"] */
    select init_date into v_init_date from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.55.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("获取系统初始化日期错误 !","#",v_mysql_message);
        else
            SET v_error_info = "获取系统初始化日期错误 !";
        end if;
        leave label_pro;
    end if;


    /* [检查正常返回][@开始日期#=@初始化日期#] */
    if v_begin_date=v_init_date then
        leave label_pro;
    end if;


    /* 调用【原子_公共_公共接口_获取上一交易日期】*/
    call db_pub.pra_pubif_GetPreTradeDate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_last_init_date);
    if v_error_code = "1" then
        SET v_error_code = "pubA.24.55.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取上一交易日期出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@证券代码编号#][{市场编号}=@市场编号# and {证券代码}=@证券代码#][4][@市场编号#,@证券代码#] */
    select stock_code_no into v_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.55.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;

    #开始日期为上一交易日之前的交易日

    /* if @上日初始化日期# <> @开始日期# then */
    if v_last_init_date <> v_begin_date then
        loop_label:loop

            /* set @初始化日期#=0; */
            set v_init_date=0;

            /* set @昨收盘价#=0; */
            set v_pre_close_price=0;
            #因为当日获取到的初始化日期是后一日的初始化日期,所以需要两次处理

            /* [获取表记录变量语句][公共_证券基础数据_历史证券行情表][{初始化日期},{昨收盘价}][@初始化日期#,@昨收盘价#][{证券代码编号}=@证券代码编号# and {初始化日期}>@开始日期# order by {初始化日期}] */
            select init_date,pre_close_price into v_init_date,v_pre_close_price from db_pub_his.tb_basesedt_stock_quot_his where stock_code_no=v_stock_code_no and init_date>v_begin_date order by init_date limit 1;


            /* if @初始化日期#<>0 then */
            if v_init_date<>0 then

                /* set @临时_初始化日期#=@初始化日期#; */
                set v_tmp_init_date=v_init_date;

                /* set @初始化日期# =@开始日期#; */
                set v_init_date =v_begin_date;
                #变动数量为正,所以计算的基金资产也是正的,对于源交易组来说,要减去,对于目标交易组来说,要加上
                #先更新源交易组的历史资产

                /* set @基金资产#=-1*@变动数量#*@昨收盘价#; */
                set v_fund_asset=-1*v_occur_qty*v_pre_close_price;

                /* set @净资产# = @现金资产# + @股票资产# + @基金资产# + @债券资产# + @回购资产# + @港股通资产#; */
                set v_nav_asset = v_cash_asset + v_stock_asset + v_fund_asset + v_bond_asset + v_repo_asset + v_hk_thrgh_stock_asset;

                /* set @交易组编号#=@临时_交易组编号#; */
                set v_exch_group_no=v_tmp_exch_group_no;

                /* [插入重复更新][公共_用户_历史交易组资产表][字段][字段变量][{基金资产}={基金资产}+@基金资产#,{净资产}={净资产}+@净资产#][2][@初始化日期#,@交易组编号#] */
                set v_create_date = date_format(curdate(),'%Y%m%d');
                set v_create_time = date_format(curtime(),'%H%i%s');
                set v_update_date = v_create_date;
                set v_update_time = v_create_time;
                set v_update_times = 1;
                insert into db_pub_his.tb_user_exch_group_asset_his (
                    create_date, create_time, update_date, 
                    update_time, update_times, init_date, co_no, 
                    pd_no, exch_group_no, crncy_type, begin_NAV, 
                    nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
                    stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
                    bond_asset, futu_asset, repo_asset, other_asset, 
                    hk_thrgh_stock_asset, total_realiz_pandl, many_days_total_asset, stat_days, 
                    begin_evalu_nav_asset, evalu_nav_asset, total_fina_debt, total_loan_debt) 
                values(
                    v_create_date, v_create_time, v_update_date, 
                    v_update_time, v_update_times, v_init_date, v_co_no, 
                    v_pd_no, v_exch_group_no, v_crncy_type, v_begin_NAV, 
                    v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
                    v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
                    v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
                    v_hk_thrgh_stock_asset, v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, 
                    v_begin_evalu_nav_asset, v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt) 
                ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, fund_asset=fund_asset+v_fund_asset,nav_asset=nav_asset+v_nav_asset;
                if v_error_code = "1" then
                            
                    SET v_error_code = "pubA.24.55.2";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no);
                    end if;
                    leave label_pro;
                end if;

                #再更新目标交易组的历史资产

                /* set @基金资产#=-1*@基金资产#; */
                set v_fund_asset=-1*v_fund_asset;

                /* set @交易组编号#=@目标交易组编号#; */
                set v_exch_group_no=v_target_exch_group_no;

                /* set @净资产# = @现金资产# + @股票资产# + @基金资产# + @债券资产# + @回购资产# + @港股通资产#; */
                set v_nav_asset = v_cash_asset + v_stock_asset + v_fund_asset + v_bond_asset + v_repo_asset + v_hk_thrgh_stock_asset;

                /* [插入重复更新][公共_用户_历史交易组资产表][字段][字段变量][{基金资产}={基金资产}+@基金资产#,{净资产}={净资产}+@净资产#][2][@初始化日期#,@交易组编号#] */
                set v_create_date = date_format(curdate(),'%Y%m%d');
                set v_create_time = date_format(curtime(),'%H%i%s');
                set v_update_date = v_create_date;
                set v_update_time = v_create_time;
                set v_update_times = 1;
                insert into db_pub_his.tb_user_exch_group_asset_his (
                    create_date, create_time, update_date, 
                    update_time, update_times, init_date, co_no, 
                    pd_no, exch_group_no, crncy_type, begin_NAV, 
                    nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
                    stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
                    bond_asset, futu_asset, repo_asset, other_asset, 
                    hk_thrgh_stock_asset, total_realiz_pandl, many_days_total_asset, stat_days, 
                    begin_evalu_nav_asset, evalu_nav_asset, total_fina_debt, total_loan_debt) 
                values(
                    v_create_date, v_create_time, v_update_date, 
                    v_update_time, v_update_times, v_init_date, v_co_no, 
                    v_pd_no, v_exch_group_no, v_crncy_type, v_begin_NAV, 
                    v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
                    v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
                    v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
                    v_hk_thrgh_stock_asset, v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, 
                    v_begin_evalu_nav_asset, v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt) 
                ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, fund_asset=fund_asset+v_fund_asset,nav_asset=nav_asset+v_nav_asset;
                if v_error_code = "1" then
                            
                    SET v_error_code = "pubA.24.55.2";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no);
                    end if;
                    leave label_pro;
                end if;


                /* set @开始日期#=@临时_初始化日期#; */
                set v_begin_date=v_tmp_init_date;
            else
                leave loop_label;
            end if;
        end loop;
    end if;

    /* [获取表记录变量][公共_证券基础数据_证券行情表][{昨收盘价}][@昨收盘价#][{证券代码编号}=@证券代码编号#][4][@证券代码编号#] */
    select pre_close_price into v_pre_close_price from db_pub.tb_basesedt_stock_quot where stock_code_no=v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.55.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* set @初始化日期# = @上日初始化日期#; */
    set v_init_date = v_last_init_date;

    /* set @基金资产#=-1*@变动数量#*@昨收盘价#; */
    set v_fund_asset=-1*v_occur_qty*v_pre_close_price;

    /* set @净资产# = @现金资产# + @股票资产# + @基金资产# + @债券资产# + @回购资产# + @港股通资产#; */
    set v_nav_asset = v_cash_asset + v_stock_asset + v_fund_asset + v_bond_asset + v_repo_asset + v_hk_thrgh_stock_asset;

    /* set @交易组编号#=@临时_交易组编号#; */
    set v_exch_group_no=v_tmp_exch_group_no;

    /* [插入重复更新][公共_用户_历史交易组资产表][字段][字段变量][{基金资产}={基金资产}+@基金资产#,{净资产}={净资产}+@净资产#][2][@初始化日期#,@交易组编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub_his.tb_user_exch_group_asset_his (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, crncy_type, begin_NAV, 
        nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
        stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
        bond_asset, futu_asset, repo_asset, other_asset, 
        hk_thrgh_stock_asset, total_realiz_pandl, many_days_total_asset, stat_days, 
        begin_evalu_nav_asset, evalu_nav_asset, total_fina_debt, total_loan_debt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_crncy_type, v_begin_NAV, 
        v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
        v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
        v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
        v_hk_thrgh_stock_asset, v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, 
        v_begin_evalu_nav_asset, v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, fund_asset=fund_asset+v_fund_asset,nav_asset=nav_asset+v_nav_asset;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.24.55.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    #再更新目标交易组的历史资产

    /* set @基金资产#=-1*@基金资产#; */
    set v_fund_asset=-1*v_fund_asset;

    /* set @交易组编号#=@目标交易组编号#; */
    set v_exch_group_no=v_target_exch_group_no;

    /* set @净资产# = @现金资产# + @股票资产# + @基金资产# + @债券资产# + @回购资产# + @港股通资产#; */
    set v_nav_asset = v_cash_asset + v_stock_asset + v_fund_asset + v_bond_asset + v_repo_asset + v_hk_thrgh_stock_asset;

    /* [插入重复更新][公共_用户_历史交易组资产表][字段][字段变量][{基金资产}={基金资产}+@基金资产#,{净资产}={净资产}+@净资产#][2][@初始化日期#,@交易组编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub_his.tb_user_exch_group_asset_his (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, crncy_type, begin_NAV, 
        nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
        stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
        bond_asset, futu_asset, repo_asset, other_asset, 
        hk_thrgh_stock_asset, total_realiz_pandl, many_days_total_asset, stat_days, 
        begin_evalu_nav_asset, evalu_nav_asset, total_fina_debt, total_loan_debt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_crncy_type, v_begin_NAV, 
        v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
        v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
        v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
        v_hk_thrgh_stock_asset, v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, 
        v_begin_evalu_nav_asset, v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, fund_asset=fund_asset+v_fund_asset,nav_asset=nav_asset+v_nav_asset;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.24.55.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_更新交易组份额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_UpdateExgpShare;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_UpdateExgpShare(
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
    IN p_occur_share decimal(18,2),
    IN p_menu_no int,
    IN p_oper_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_code varchar(32),
    OUT p_exch_group_name varchar(64),
    OUT p_exch_group_status varchar(2),
    OUT p_exch_group_begin_NAV decimal(18,4),
    OUT p_exch_group_pd_share decimal(18,2),
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
    declare v_occur_share decimal(18,2);
    declare v_menu_no int;
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_code varchar(32);
    declare v_exch_group_name varchar(64);
    declare v_exch_group_status varchar(2);
    declare v_exch_group_begin_NAV decimal(18,4);
    declare v_exch_group_pd_share decimal(18,2);
    declare v_update_times int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_tmp_update_times int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_occur_share = p_occur_share;
    SET v_menu_no = p_menu_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_code = " ";
    SET v_exch_group_name = " ";
    SET v_exch_group_status = "0";
    SET v_exch_group_begin_NAV = 0;
    SET v_exch_group_pd_share = 0;
    SET v_update_times = 1;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_jour_after_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_交易组信息表][{交易组产品份额}][@交易组产品份额#][{交易组编号}=@交易组编号#][4][@交易组编号#] */
    select exch_group_pd_share into v_exch_group_pd_share from db_pub.tb_user_exch_group_info where exch_group_no=v_exch_group_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.56.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][(@交易组产品份额#+@变动份额#)<0][84][@交易组编号#] */
    if (v_exch_group_pd_share+v_occur_share)<0 then
        
        SET v_error_code = "pubA.24.56.84";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_用户_交易组信息表][{交易组产品份额}={交易组产品份额}+@变动份额#][{交易组编号}=@交易组编号#][2][@交易组编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_exch_group_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, exch_group_pd_share=exch_group_pd_share+v_occur_share where exch_group_no=v_exch_group_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.24.56.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_用户_交易组信息表][{交易组编码},{交易组名称},{交易组状态},{期初净资产},{交易组产品份额},{更新次数}][@交易组编码#,@交易组名称#,@交易组状态#,@交易组期初净资产#,@交易组产品份额#,@临时_更新次数#][{交易组编号}=@交易组编号#][4][@交易组编号#] */
    select exch_group_code,exch_group_name,exch_group_status,begin_NAV,exch_group_pd_share,update_times into v_exch_group_code,v_exch_group_name,v_exch_group_status,v_exch_group_begin_NAV,v_exch_group_pd_share,v_tmp_update_times from db_pub.tb_user_exch_group_info where exch_group_no=v_exch_group_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.56.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单#=@菜单编号#; */
    set v_oper_menu_no=v_menu_no;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* [获取流水变动][{交易组产品份额}][@交易组产品份额#] */
    set v_jour_occur_field = concat("交易组产品份额","|");
    set v_jour_occur_info = concat(v_exch_group_pd_share,"|");


    /* [获取流水后信息][@交易组产品份额#] */
    set v_jour_after_occur_info = concat(v_exch_group_pd_share,"|");


    /* [插入表记录][公共_用户_交易组信息流水表][字段][字段变量][1][@初始化日期#,@机构编号#,@交易组编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_exch_group_info_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.24.56.1";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","机构编号=",v_co_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #份额流水变动单独记录,20180625

    /* if @变动份额#<> 0 then */
    if v_occur_share<> 0 then

        /* set @流水变动字段#=@变动份额#; */
        set v_jour_occur_field=v_occur_share;

        /* set @流水后信息#=@交易组产品份额#; */
        set v_jour_after_occur_info=v_exch_group_pd_share;

        /* set @操作备注#="份额变动"; */
        set v_oper_remark_info="份额变动";

        /* [插入表记录][公共_用户_交易组信息流水表][字段][字段变量][1][@初始化日期#,@机构编号#,@交易组编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_info_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, exch_group_no, jour_occur_field, jour_after_occur_info, 
            oper_remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_jour_occur_field, v_jour_after_occur_info, 
            v_oper_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.24.56.1";
            SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","机构编号=",v_co_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;

    /* set @更新次数# = @临时_更新次数#; */
    set v_update_times = v_tmp_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_code = v_exch_group_code;
    SET p_exch_group_name = v_exch_group_name;
    SET p_exch_group_status = v_exch_group_status;
    SET p_exch_group_begin_NAV = v_exch_group_begin_NAV;
    SET p_exch_group_pd_share = v_exch_group_pd_share;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_更新交易组资产估值份额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_UpdateExgpAssetShare;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_UpdateExgpAssetShare(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_evalu_share decimal(18,2),
    IN p_evalu_nav_asset decimal(18,4),
    IN p_begin_evalu_nav_asset decimal(18,4),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no int
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
    declare v_evalu_share decimal(18,2);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no int;
    declare v_record_count int;
    declare v_tmp_exch_group_no int;
    declare v_exch_group_pd_share decimal(18,2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_co_no int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
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
    SET v_pd_no = p_pd_no;
    SET v_evalu_share = p_evalu_share;
    SET v_evalu_nav_asset = p_evalu_nav_asset;
    SET v_begin_evalu_nav_asset = p_begin_evalu_nav_asset;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_record_count = 0;
    SET v_tmp_exch_group_no = 0;
    SET v_exch_group_pd_share = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_co_no = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_jour_after_occur_info = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

        /* set @记录个数# = 0; */
        set v_record_count = 0;

        /* [获取表记录变量语句][公共_用户_交易组信息表][count(*)][@记录个数#][{产品编号} = @产品编号#  and  {交易组状态}<>《交易组状态-注销》] */
        select count(*) into v_record_count from db_pub.tb_user_exch_group_info where pd_no = v_pd_no  and  exch_group_status<>"3" limit 1;


        /* if @记录个数# = 1 then */
        if v_record_count = 1 then

            /* [获取表记录变量语句][公共_用户_交易组信息表][{交易组编号}][@交易组编号#][{产品编号} = @产品编号#  and  {交易组状态}<>《交易组状态-注销》] */
            select exch_group_no into v_exch_group_no from db_pub.tb_user_exch_group_info where pd_no = v_pd_no  and  exch_group_status<>"3" limit 1;


             /* set @临时_交易组编号# =@交易组编号#; */
             set v_tmp_exch_group_no =v_exch_group_no;

        /* elseif @记录个数# > 1 then */
        elseif v_record_count > 1 then

            /* [获取表记录变量语句][公共_用户_交易组信息表][min({交易组编号})][@临时_交易组编号#][{产品编号} = @产品编号#  and  {交易组状态}<>《交易组状态-注销》] */
            select min(exch_group_no) into v_tmp_exch_group_no from db_pub.tb_user_exch_group_info where pd_no = v_pd_no  and  exch_group_status<>"3" limit 1;

        end if;
    #产品下所有交易组份额 均等于 产品级的

    /* if @估值份额# <> 0   then */
    if v_evalu_share <> 0   then

        /* if @记录个数# = 1  then */
        if v_record_count = 1  then

             /* [获取表记录变量][公共_用户_交易组信息表][{交易组产品份额}][@交易组产品份额#][{交易组编号}=@交易组编号#][4][@交易组编号#] */
             select exch_group_pd_share into v_exch_group_pd_share from db_pub.tb_user_exch_group_info where exch_group_no=v_exch_group_no limit 1;
             if FOUND_ROWS() = 0 then
                         
                 SET v_error_code = "pubA.24.57.4";
                 if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
                 else
                     SET v_error_info = concat("交易组编号=",v_exch_group_no);
                 end if;
                 leave label_pro;
             end if;


             /* [更新表记录][公共_用户_交易组信息表][{交易组产品份额}=@估值份额#][{交易组编号}=@交易组编号#][2][@交易组编号#] */
             set v_update_date = date_format(curdate(),'%Y%m%d');
             set v_update_time = date_format(curtime(),'%H%i%s');
             update db_pub.tb_user_exch_group_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, exch_group_pd_share=v_evalu_share where exch_group_no=v_exch_group_no;
             if v_error_code = "1" then
                         
                 SET v_error_code = "pubA.24.57.2";
                 if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
                 else
                     SET v_error_info = concat("交易组编号=",v_exch_group_no);
                 end if;
                 leave label_pro;
             end if;


             /* set @机构编号#=left(@交易组编号#,4); */
             set v_co_no=left(v_exch_group_no,4);

             /* set @操作菜单#=@菜单编号#; */
             set v_oper_menu_no=v_menu_no;

             /* set @操作功能#=@功能编码#; */
             set v_oper_func_code=v_func_code;

             /* [获取流水变动][{交易组产品份额}][@估值份额#] */
             set v_jour_occur_field = concat("交易组产品份额","|");
             set v_jour_occur_info = concat(v_evalu_share,"|");


             /* [获取流水后信息][@估值份额#] */
             set v_jour_after_occur_info = concat(v_evalu_share,"|");


             /* set @操作备注#="估值更新交易组份额 !"; */
             set v_oper_remark_info="估值更新交易组份额 !";

             /* [插入表记录][公共_用户_交易组信息流水表][字段][字段变量][1][@交易组编号#,@初始化日期#] */
             set v_create_date = date_format(curdate(),'%Y%m%d');
             set v_create_time = date_format(curtime(),'%H%i%s');
             set v_update_date = v_create_date;
             set v_update_time = v_create_time;
             set v_update_times = 1;
             insert into db_pub.tb_user_exch_group_info_jour(
                 create_date, create_time, update_date, 
                 update_time, update_times, opor_co_no, opor_no, 
                 oper_mac, oper_ip_addr, oper_info, oper_way, 
                 oper_menu_no, oper_func_code, init_date, co_no, 
                 pd_no, exch_group_no, jour_occur_field, jour_after_occur_info, 
                 oper_remark_info) 
             value( 
                 v_create_date, v_create_time, v_update_date, 
                 v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                 v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                 v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                 v_pd_no, v_exch_group_no, v_jour_occur_field, v_jour_after_occur_info, 
                 v_oper_remark_info);
             if v_error_code = "1" then
                         
                 SET v_error_code = "pubA.24.57.1";
                 SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","初始化日期=",v_init_date),"#",v_mysql_message);
                 leave label_pro;
             end if;


             /* if @交易组产品份额#<>@估值份额# then */
             if v_exch_group_pd_share<>v_evalu_share then

                 /* set @操作备注#="份额变动"; */
                 set v_oper_remark_info="份额变动";

                 /* set @流水变动字段#=@估值份额#-@交易组产品份额#; */
                 set v_jour_occur_field=v_evalu_share-v_exch_group_pd_share;

                 /* set @流水后信息#=@估值份额#; */
                 set v_jour_after_occur_info=v_evalu_share;

                /* [插入表记录][公共_用户_交易组信息流水表][字段][字段变量][1][@交易组编号#,@初始化日期#] */
                set v_create_date = date_format(curdate(),'%Y%m%d');
                set v_create_time = date_format(curtime(),'%H%i%s');
                set v_update_date = v_create_date;
                set v_update_time = v_create_time;
                set v_update_times = 1;
                insert into db_pub.tb_user_exch_group_info_jour(
                    create_date, create_time, update_date, 
                    update_time, update_times, opor_co_no, opor_no, 
                    oper_mac, oper_ip_addr, oper_info, oper_way, 
                    oper_menu_no, oper_func_code, init_date, co_no, 
                    pd_no, exch_group_no, jour_occur_field, jour_after_occur_info, 
                    oper_remark_info) 
                value( 
                    v_create_date, v_create_time, v_update_date, 
                    v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                    v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                    v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                    v_pd_no, v_exch_group_no, v_jour_occur_field, v_jour_after_occur_info, 
                    v_oper_remark_info);
                if v_error_code = "1" then
                            
                    SET v_error_code = "pubA.24.57.1";
                    SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","初始化日期=",v_init_date),"#",v_mysql_message);
                    leave label_pro;
                end if;

             end if;

        /* elseif  @记录个数# > 1  then */
        elseif  v_record_count > 1  then

             /* [声明游标][公共_用户_交易组信息表][{交易组编号},{交易组产品份额}][{产品编号}=@产品编号#][cursor_exgpno] */
             cursor_exgpno:BEGIN
             DECLARE v_cursor_done int default false;
             DECLARE cursor_exgpno CURSOR FOR
                 select exch_group_no,exch_group_pd_share 
                 from db_pub.tb_user_exch_group_info 
                 where pd_no=v_pd_no;
             DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


             /* [打开游标][@交易组编号#,@交易组产品份额#][cursor_exgpno][loop_exgpno] */
             open cursor_exgpno;
             loop_exgpno: LOOP
             fetch cursor_exgpno into v_exch_group_no,v_exch_group_pd_share;
                 IF v_cursor_done THEN
                     LEAVE loop_exgpno;
                 END IF;


                  /* [更新表记录][公共_用户_交易组信息表][{交易组产品份额}=@估值份额#][{交易组编号}=@交易组编号#][2][@交易组编号#] */
                  set v_update_date = date_format(curdate(),'%Y%m%d');
                  set v_update_time = date_format(curtime(),'%H%i%s');
                  update db_pub.tb_user_exch_group_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, exch_group_pd_share=v_evalu_share where exch_group_no=v_exch_group_no;
                  if v_error_code = "1" then
                              
                      SET v_error_code = "pubA.24.57.2";
                      if v_mysql_message <> "" then
                          SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
                      else
                          SET v_error_info = concat("交易组编号=",v_exch_group_no);
                      end if;
                      close cursor_exgpno;
                      leave label_pro;
                  end if;


                  /* set @机构编号#=left(@交易组编号#,4); */
                  set v_co_no=left(v_exch_group_no,4);

                  /* set @操作菜单#=@菜单编号#; */
                  set v_oper_menu_no=v_menu_no;

                  /* set @操作功能#=@功能编码#; */
                  set v_oper_func_code=v_func_code;

                 /* [获取流水变动][{交易组产品份额}][@估值份额#] */
                 set v_jour_occur_field = concat("交易组产品份额","|");
                 set v_jour_occur_info = concat(v_evalu_share,"|");


                 /* [获取流水后信息][@估值份额#] */
                 set v_jour_after_occur_info = concat(v_evalu_share,"|");


                 /* set @操作备注#="估值更新交易组份额 !"; */
                 set v_oper_remark_info="估值更新交易组份额 !";

                 /* [插入表记录][公共_用户_交易组信息流水表][字段][字段变量][1][@交易组编号#,@初始化日期#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_pub.tb_user_exch_group_info_jour(
                     create_date, create_time, update_date, 
                     update_time, update_times, opor_co_no, opor_no, 
                     oper_mac, oper_ip_addr, oper_info, oper_way, 
                     oper_menu_no, oper_func_code, init_date, co_no, 
                     pd_no, exch_group_no, jour_occur_field, jour_after_occur_info, 
                     oper_remark_info) 
                 value( 
                     v_create_date, v_create_time, v_update_date, 
                     v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                     v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                     v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                     v_pd_no, v_exch_group_no, v_jour_occur_field, v_jour_after_occur_info, 
                     v_oper_remark_info);
                 if v_error_code = "1" then
                             
                     SET v_error_code = "pubA.24.57.1";
                     SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","初始化日期=",v_init_date),"#",v_mysql_message);
                     close cursor_exgpno;
                     leave label_pro;
                 end if;


                 /* if @交易组产品份额#<>@估值份额# then */
                 if v_exch_group_pd_share<>v_evalu_share then

                     /* set @操作备注#="份额变动"; */
                     set v_oper_remark_info="份额变动";

                     /* set @流水变动字段#=@估值份额#-@交易组产品份额#; */
                     set v_jour_occur_field=v_evalu_share-v_exch_group_pd_share;

                     /* set @流水后信息#=@估值份额#; */
                     set v_jour_after_occur_info=v_evalu_share;

                    /* [插入表记录][公共_用户_交易组信息流水表][字段][字段变量][1][@交易组编号#,@初始化日期#] */
                    set v_create_date = date_format(curdate(),'%Y%m%d');
                    set v_create_time = date_format(curtime(),'%H%i%s');
                    set v_update_date = v_create_date;
                    set v_update_time = v_create_time;
                    set v_update_times = 1;
                    insert into db_pub.tb_user_exch_group_info_jour(
                        create_date, create_time, update_date, 
                        update_time, update_times, opor_co_no, opor_no, 
                        oper_mac, oper_ip_addr, oper_info, oper_way, 
                        oper_menu_no, oper_func_code, init_date, co_no, 
                        pd_no, exch_group_no, jour_occur_field, jour_after_occur_info, 
                        oper_remark_info) 
                    value( 
                        v_create_date, v_create_time, v_update_date, 
                        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                        v_pd_no, v_exch_group_no, v_jour_occur_field, v_jour_after_occur_info, 
                        v_oper_remark_info);
                    if v_error_code = "1" then
                                
                        SET v_error_code = "pubA.24.57.1";
                        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","初始化日期=",v_init_date),"#",v_mysql_message);
                        close cursor_exgpno;
                        leave label_pro;
                    end if;

                end if;

             /* [关闭游标][cursor_exgpno] */
                 IF v_cursor_done THEN
                     set v_cursor_done = false;
                 END IF;
             END LOOP;
             close cursor_exgpno;
             end cursor_exgpno;

        end if;
    end if;
    #产品下只有一个交易组时更新。 modify by wjp

    /* if @估值净资产# <> 0  and @记录个数# =1  then */
    if v_evalu_nav_asset <> 0  and v_record_count =1  then

          /* [更新表记录][公共_用户_交易组资产表][{估值净资产}=@估值净资产#][{交易组编号}=@交易组编号#  and {产品编号}=@产品编号#][2][@产品编号#,@交易组编号#,"更新估值净资产"] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_pub.tb_user_exch_group_asset set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, evalu_nav_asset=v_evalu_nav_asset where exch_group_no=v_exch_group_no  and pd_no=v_pd_no;
          if v_error_code = "1" then
                      
              SET v_error_code = "pubA.24.57.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","更新估值净资产"),"#",v_mysql_message);
              else
                  SET v_error_info = concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","更新估值净资产");
              end if;
              leave label_pro;
          end if;

    end if;

    /* if @期初估值净资产# <> 0 and @记录个数# =1   then */
    if v_begin_evalu_nav_asset <> 0 and v_record_count =1   then

          /* [更新表记录][公共_用户_交易组资产表][{期初估值净资产}=@期初估值净资产#][{交易组编号}=@交易组编号#  and {产品编号}=@产品编号#][2][@产品编号#,@交易组编号#,"更新估值净资产"] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_pub.tb_user_exch_group_asset set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_evalu_nav_asset=v_begin_evalu_nav_asset where exch_group_no=v_exch_group_no  and pd_no=v_pd_no;
          if v_error_code = "1" then
                      
              SET v_error_code = "pubA.24.57.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","更新估值净资产"),"#",v_mysql_message);
              else
                  SET v_error_info = concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","更新估值净资产");
              end if;
              leave label_pro;
          end if;

    end if;
    #交易组编号供更新 应收应付使用。

    /* set @交易组编号# =@临时_交易组编号#; */
    set v_exch_group_no =v_tmp_exch_group_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_判断债券是否兑付
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_CheckIfBondPaid;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_CheckIfBondPaid(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_valid_flag int
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
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_valid_flag int;
    declare v_last_trade_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_valid_flag = 0;
    SET v_last_trade_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    
    #有效标志为1,说明债券还未到期,有效标志为0,说明债券已兑付

    /* set @最后交易日#=0; */
    set v_last_trade_date=0;

    /* set @有效标志#=1; */
    set v_valid_flag=1;

    /* [获取表记录变量语句][公共_证券基础数据_债券属性信息表][{最后交易日}][@最后交易日#][@市场编号#={市场编号} and @证券代码编号#={证券代码编号}] */
    select last_trade_date into v_last_trade_date from db_pub.tb_basesedt_bond_info where v_exch_no=exch_no and v_stock_code_no=stock_code_no limit 1;


    /* if (@最后交易日# < @初始化日期# and @最后交易日#<>0) then */
    if (v_last_trade_date < v_init_date and v_last_trade_date<>0) then

      /* set @有效标志#=0; */
      set v_valid_flag=0;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_valid_flag = v_valid_flag;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取已兑付债券
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetPaidBonds;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetPaidBonds(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_str varchar(4096)
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
    declare v_stock_code_str varchar(4096);
    declare v_tmp_row_id bigint;
    declare v_row_id bigint;
    declare v_stock_code varchar(6);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code_str = " ";
    SET v_tmp_row_id = 0;
    SET v_row_id = 0;
    SET v_stock_code = " ";

    
    label_pro:BEGIN
    

    /* set @证券代码串#=";"; */
    set v_stock_code_str=";";

    /* set @临时_记录序号#=0; */
    set v_tmp_row_id=0;
    loop_label:loop

      /* set @记录序号#=0; */
      set v_row_id=0;

      /* [获取表记录变量][公共_证券基础数据_债券属性信息表][{记录序号},{证券代码}][@记录序号#,@证券代码#][{最后交易日}<>0 and {最后交易日}<@初始化日期# and {记录序号}>@临时_记录序号# order by {记录序号}][4][@初始化日期#] */
      select row_id,stock_code into v_row_id,v_stock_code from db_pub.tb_basesedt_bond_info where last_trade_date<>0 and last_trade_date<v_init_date and row_id>v_tmp_row_id order by row_id limit 1;
      if FOUND_ROWS() = 0 then
                  
          SET v_error_code = "pubA.24.59.4";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
          else
              SET v_error_info = concat("初始化日期=",v_init_date);
          end if;
          leave label_pro;
      end if;


      /* set @临时_记录序号#=@记录序号#; */
      set v_tmp_row_id=v_row_id;

      /* if @记录序号#=0 then */
      if v_row_id=0 then
        leave loop_label;
      end if;

      /* set @证券代码串#=concat(@证券代码串#,";"); */
      set v_stock_code_str=concat(v_stock_code_str,";");
    end loop;

    /* set @证券代码串#=concat(@证券代码串#,";"); */
    set v_stock_code_str=concat(v_stock_code_str,";");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_str = v_stock_code_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取保证金优惠组合编码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetCombinationCode;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetCombinationCode(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_contrc_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comb_code varchar(6),
    OUT p_comb_type int
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
    declare v_contrc_type int;
    declare v_contrc_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comb_code varchar(6);
    declare v_comb_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_code = p_contrc_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comb_code = " ";
    SET v_comb_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_期货基础数据_期货组合保证金参数表][{组合编码}][@组合编码#][{市场编号}=@市场编号# and ({参与代码}=@合约代码# or {参与代码}=@合约类型#) order by {优先级}][4][@市场编号#,@合约代码#,@合约类型#] */
    select comb_code into v_comb_code from db_pub.tb_basefudt_futu_group_margin_config where exch_no=v_exch_no and (partic_code=v_contrc_code or partic_code=v_contrc_type) order by prior_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.64.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code,",","合约类型=",v_contrc_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code,",","合约类型=",v_contrc_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comb_code = v_comb_code;
    SET p_comb_type = v_comb_type;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取资产更新交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetExchGroupInfoByAssetUpdate;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetExchGroupInfoByAssetUpdate(
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
    OUT p_row_id_str varchar(2048),
    OUT p_co_no_str varchar(2048),
    OUT p_pd_no_str varchar(2048),
    OUT p_exch_group_no_str varchar(2048)
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
    declare v_row_id_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id_str = " ";
    SET v_co_no_str = " ";
    SET v_pd_no_str = " ";
    SET v_exch_group_no_str = " ";

    
    label_pro:BEGIN
    

    /* set @记录序号串# = " "; */
    set v_row_id_str = " ";

    /* set @机构编号串# = " "; */
    set v_co_no_str = " ";

    /* set @产品编号串# = " "; */
    set v_pd_no_str = " ";

    /* set @交易组编号串# = " "; */
    set v_exch_group_no_str = " ";

    /* SELECT
    GROUP_CONCAT(a.{记录序号} SEPARATOR ";"),
    GROUP_CONCAT(a.{机构编号} SEPARATOR ";"),
    GROUP_CONCAT(a.{产品编号} SEPARATOR ";"),
    GROUP_CONCAT(a.{交易组编号} SEPARATOR ";")  INTO 
    @记录序号串#,
    @机构编号串#,
    @产品编号串#,
    @交易组编号串#
FROM
 (
    SELECT
    {记录序号},
    {机构编号},
    {产品编号},
    {交易组编号}
    FROM
    ~公共_用户_交易组信息表^
    WHERE
        {记录序号} > @查询记录序号#
        AND {交易组状态} <> "3"
        ORDER BY
        {记录序号}
        LIMIT 100
) AS a; */
    SELECT
        GROUP_CONCAT(a.row_id SEPARATOR ";"),
        GROUP_CONCAT(a.co_no SEPARATOR ";"),
        GROUP_CONCAT(a.pd_no SEPARATOR ";"),
        GROUP_CONCAT(a.exch_group_no SEPARATOR ";")  INTO 
        v_row_id_str,
        v_co_no_str,
        v_pd_no_str,
        v_exch_group_no_str
    FROM
     (
        SELECT
        row_id,
        co_no,
        pd_no,
        exch_group_no
        FROM
        db_pub.tb_user_exch_group_info
        WHERE
            row_id > v_query_row_id
            AND exch_group_status <> "3"
            ORDER BY
            row_id
            LIMIT 100
    ) AS a;

    /* set @记录序号串# = concat(ifnull(@记录序号串#," "),";"); */
    set v_row_id_str = concat(ifnull(v_row_id_str," "),";");

    /* set @机构编号串# = concat(ifnull(@机构编号串#," "),";"); */
    set v_co_no_str = concat(ifnull(v_co_no_str," "),";");

    /* set @产品编号串# = concat(ifnull(@产品编号串#," "),";"); */
    set v_pd_no_str = concat(ifnull(v_pd_no_str," "),";");

    /* set @交易组编号串# = concat(ifnull(@交易组编号串#," "),";"); */
    set v_exch_group_no_str = concat(ifnull(v_exch_group_no_str," "),";");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id_str = v_row_id_str;
    SET p_co_no_str = v_co_no_str;
    SET p_pd_no_str = v_pd_no_str;
    SET p_exch_group_no_str = v_exch_group_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_更新交易组证券资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_UpdateExchGroupSecuAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_UpdateExchGroupSecuAsset(
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
    IN p_stock_cash_asset decimal(18,4),
    IN p_futu_cash_asset decimal(18,4),
    IN p_futu_asset decimal(18,4),
    IN p_stock_asset decimal(18,4),
    IN p_fund_asset decimal(18,4),
    IN p_money_fund_asset decimal(18,4),
    IN p_not_money_fund_asset decimal(18,4),
    IN p_bond_asset decimal(18,4),
    IN p_repo_asset decimal(18,4),
    IN p_hk_thrgh_stock_asset decimal(18,4),
    IN p_futu_long_market_value decimal(18,4),
    IN p_futu_short_market_value decimal(18,4),
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
    declare v_stock_cash_asset decimal(18,4);
    declare v_futu_cash_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_NAV decimal(18,4);
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_total_cash_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_total_fina_debt decimal(18,4);
    declare v_total_loan_debt decimal(18,4);
    declare v_total_realiz_pandl decimal(18,4);
    declare v_many_days_total_asset decimal(18,4);
    declare v_stat_days int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_stock_cash_asset = p_stock_cash_asset;
    SET v_futu_cash_asset = p_futu_cash_asset;
    SET v_futu_asset = p_futu_asset;
    SET v_stock_asset = p_stock_asset;
    SET v_fund_asset = p_fund_asset;
    SET v_money_fund_asset = p_money_fund_asset;
    SET v_not_money_fund_asset = p_not_money_fund_asset;
    SET v_bond_asset = p_bond_asset;
    SET v_repo_asset = p_repo_asset;
    SET v_hk_thrgh_stock_asset = p_hk_thrgh_stock_asset;
    SET v_futu_long_market_value = p_futu_long_market_value;
    SET v_futu_short_market_value = p_futu_short_market_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_NAV = 0;
    SET v_begin_evalu_nav_asset = 0;
    SET v_evalu_nav_asset = 0;
    SET v_nav_asset = 0;
    SET v_total_cash_asset = 0;
    SET v_other_asset = 0;
    SET v_total_fina_debt = 0;
    SET v_total_loan_debt = 0;
    SET v_total_realiz_pandl = 0;
    SET v_many_days_total_asset = 0;
    SET v_stat_days = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @期初净资产# = 0; */
    set v_begin_NAV = 0;

    /* set @期初估值净资产# = 0; */
    set v_begin_evalu_nav_asset = 0;

    /* set @估值净资产# = 0; */
    set v_evalu_nav_asset = 0;

    /* set @净资产# = @证券现金资产# + @期货现金资产#+ @期货资产#  + @股票资产# + @基金资产# + @债券资产# + @回购资产# + @港股通资产#; */
    set v_nav_asset = v_stock_cash_asset + v_futu_cash_asset+ v_futu_asset  + v_stock_asset + v_fund_asset + v_bond_asset + v_repo_asset + v_hk_thrgh_stock_asset;

    /* set @总现金资产# = @证券现金资产# + @期货现金资产#; */
    set v_total_cash_asset = v_stock_cash_asset + v_futu_cash_asset;
    #set @期货资产# = 0;

    /* set @其他资产# = 0; */
    set v_other_asset = 0;

    /* set @总融资负债#=0; */
    set v_total_fina_debt=0;

    /* set @总融券负债#=0; */
    set v_total_loan_debt=0;

    /* set @累计实现收益#=0; */
    set v_total_realiz_pandl=0;

    /* set @多日总资产#=0; */
    set v_many_days_total_asset=0;

    /* set @统计天数#=0; */
    set v_stat_days=0;
    #现金资产 分成 证券和期货Modify by wjp 20181019

    /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{总现金资产}=@总现金资产#,{净资产}=@期货资产#+{其他资产}+@总现金资产#+@股票资产#+@基金资产#+@债券资产#+@回购资产#+@港股通资产#,{证券现金资产}=@证券现金资产#,{期货现金资产}=@期货现金资产#,{期货资产}=@期货资产#,{股票资产}=@股票资产#,{基金资产}=@基金资产#,{货币基金资产}=@货币基金资产#,{非货币基金资产}=@非货币基金资产#,{债券资产}=@债券资产#,{回购资产}=@回购资产#,{港股通资产}=@港股通资产#,{期货多头市值}=@期货多头市值#,{期货空头市值}=@期货空头市值#][1][@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_exch_group_asset (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, crncy_type, begin_NAV, nav_asset, 
        total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
        fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
        futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
        total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
        evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
        futu_short_market_value) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
        v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
        v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
        v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
        v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
        v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
        v_futu_short_market_value) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_cash_asset=v_total_cash_asset,nav_asset=v_futu_asset+other_asset+v_total_cash_asset+v_stock_asset+v_fund_asset+v_bond_asset+v_repo_asset+v_hk_thrgh_stock_asset,stock_cash_asset=v_stock_cash_asset,futu_cash_asset=v_futu_cash_asset,futu_asset=v_futu_asset,stock_asset=v_stock_asset,fund_asset=v_fund_asset,money_fund_asset=v_money_fund_asset,not_money_fund_asset=v_not_money_fund_asset,bond_asset=v_bond_asset,repo_asset=v_repo_asset,hk_thrgh_stock_asset=v_hk_thrgh_stock_asset,futu_long_market_value=v_futu_long_market_value,futu_short_market_value=v_futu_short_market_value;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.24.61.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    #[插入重复更新][公共_用户_交易组资产表][字段][字段变量][{总现金资产}=@证券现金资产#+{期货现金资产},{净资产}={期货现金资产}+{期货资产}+{其他资产}+@现金资产#+@股票资产#+@基金资产#+@债券资产#+@回购资产#+@港股通资产#,{证券现金资产}=@现金资产#,{股票资产}=@股票资产#,{基金资产}=@基金资产#,{债券资产}=@债券资产#,{回购资产}=@回购资产#,{港股通资产}=@港股通资产#][1][@交易组编号#,@本币币种#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_更新交易组期货资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_UpdateExchGroupFutuAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_UpdateExchGroupFutuAsset(
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
    IN p_cash_asset decimal(18,4),
    IN p_futu_asset decimal(18,4),
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
    declare v_cash_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_NAV decimal(18,4);
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_futu_cash_asset decimal(18,4);
    declare v_total_cash_asset decimal(18,4);
    declare v_stock_cash_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_total_fina_debt decimal(18,4);
    declare v_total_loan_debt decimal(18,4);
    declare v_total_realiz_pandl decimal(18,4);
    declare v_many_days_total_asset decimal(18,4);
    declare v_stat_days int;
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_cash_asset = p_cash_asset;
    SET v_futu_asset = p_futu_asset;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_NAV = 0;
    SET v_begin_evalu_nav_asset = 0;
    SET v_evalu_nav_asset = 0;
    SET v_nav_asset = 0;
    SET v_futu_cash_asset = 0;
    SET v_total_cash_asset = 0;
    SET v_stock_cash_asset = 0;
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_other_asset = 0;
    SET v_total_fina_debt = 0;
    SET v_total_loan_debt = 0;
    SET v_total_realiz_pandl = 0;
    SET v_many_days_total_asset = 0;
    SET v_stat_days = 0;
    SET v_money_fund_asset = 0;
    SET v_not_money_fund_asset = 0;
    SET v_futu_long_market_value = 0;
    SET v_futu_short_market_value = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @期初净资产# = 0; */
    set v_begin_NAV = 0;

    /* set @期初估值净资产# = 0; */
    set v_begin_evalu_nav_asset = 0;

    /* set @估值净资产# = 0; */
    set v_evalu_nav_asset = 0;

    /* set @净资产# = @现金资产# + @期货资产#; */
    set v_nav_asset = v_cash_asset + v_futu_asset;

    /* set @期货现金资产# = @现金资产#; */
    set v_futu_cash_asset = v_cash_asset;

    /* set @总现金资产# = @现金资产#; */
    set v_total_cash_asset = v_cash_asset;

    /* set @证券现金资产# = 0; */
    set v_stock_cash_asset = 0;

    /* set @股票资产# = 0; */
    set v_stock_asset = 0;

    /* set @债券资产# = 0; */
    set v_bond_asset = 0;

    /* set @基金资产# = 0; */
    set v_fund_asset = 0;

    /* set @回购资产# = 0; */
    set v_repo_asset = 0;

    /* set @港股通资产# = 0; */
    set v_hk_thrgh_stock_asset = 0;

    /* set @其他资产# = 0; */
    set v_other_asset = 0;

    /* set @总融资负债#=0; */
    set v_total_fina_debt=0;

    /* set @总融券负债#=0; */
    set v_total_loan_debt=0;

    /* set @累计实现收益#=0; */
    set v_total_realiz_pandl=0;

    /* set @多日总资产#=0; */
    set v_many_days_total_asset=0;

    /* set @统计天数#=0; */
    set v_stat_days=0;

    /* set @货币基金资产#=0; */
    set v_money_fund_asset=0;

    /* set @非货币基金资产#=0; */
    set v_not_money_fund_asset=0;

    /* set @期货多头市值# = 0; */
    set v_futu_long_market_value = 0;

    /* set @期货空头市值# = 0; */
    set v_futu_short_market_value = 0;

    /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{总现金资产}={证券现金资产}+@期货现金资产#,{净资产}={证券现金资产}+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{港股通资产}+{其他资产}+@期货现金资产#+@期货资产#-{总融资负债}-{总融券负债},{期货现金资产}=@期货现金资产#,{期货资产}=@期货资产#][1][@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pub.tb_user_exch_group_asset (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, crncy_type, begin_NAV, nav_asset, 
        total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
        fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
        futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
        total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
        evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
        futu_short_market_value) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
        v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
        v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
        v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
        v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
        v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
        v_futu_short_market_value) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_cash_asset=stock_cash_asset+v_futu_cash_asset,nav_asset=stock_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+hk_thrgh_stock_asset+other_asset+v_futu_cash_asset+v_futu_asset-total_fina_debt-total_loan_debt,futu_cash_asset=v_futu_cash_asset,futu_asset=v_futu_asset;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.24.66.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_更新默认交易组允许投资市场和证券类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_UpdateDefautExchGpAllowExchAndStockType;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_UpdateDefautExchGpAllowExchAndStockType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_allow_exch varchar(64),
    IN p_allow_stock_type varchar(2048),
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
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
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
    SET v_pd_no = p_pd_no;
    SET v_allow_exch = p_allow_exch;
    SET v_allow_stock_type = p_allow_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][公共_用户_交易组信息表][{允许投资市场}=@允许投资市场#,{允许操作证券类型}=@允许操作证券类型#][{产品编号}=@产品编号# and {默认组标志}=《默认组标志-是》][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_exch_group_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, allow_exch=v_allow_exch,allow_stock_type=v_allow_stock_type where pd_no=v_pd_no and default_group_flag=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.24.62.2";
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

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取代码编号合约代码属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetCodeNoContrcCodeProp;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetCodeNoContrcCodeProp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_no int,
    OUT p_contrc_code varchar(6),
    OUT p_contrc_name varchar(64),
    OUT p_contrc_type int,
    OUT p_margin_pref int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_expire_date int,
    OUT p_begin_deli_date int,
    OUT p_end_deli_date int,
    OUT p_deli_price decimal(16,9)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_contrc_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_contrc_type int;
    declare v_margin_pref int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_expire_date int;
    declare v_begin_deli_date int;
    declare v_end_deli_date int;
    declare v_deli_price decimal(16,9);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pinyin_short varchar(16);
    declare v_asset_type int;
    declare v_par_value decimal(16,9);
    declare v_contrc_unit int;
    declare v_report_unit int;
    declare v_min_unit int;
    declare v_max_qty decimal(18,2);
    declare v_min_qty decimal(18,2);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_fee_set varchar(2048);
    declare v_is_order_dir_flag int;
    declare v_valid_flag int;
    declare v_contrc_limit_flag int;
    declare v_posi_type int;
    declare v_deli_year int;
    declare v_deli_month int;
    declare v_begin_trade_date int;
    declare v_open_order_type int;
    declare v_step_price decimal(16,9);
    declare v_hold_qty decimal(18,2);
    declare v_main_flag int;
    declare v_time_stamp int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_name = " ";
    SET v_contrc_type = 0;
    SET v_margin_pref = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_expire_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_deli_date = date_format(curdate(),'%Y%m%d');
    SET v_end_deli_date = date_format(curdate(),'%Y%m%d');
    SET v_deli_price = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pinyin_short = " ";
    SET v_asset_type = 0;
    SET v_par_value = 0;
    SET v_contrc_unit = 0;
    SET v_report_unit = 0;
    SET v_min_unit = 0;
    SET v_max_qty = 0;
    SET v_min_qty = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_fee_set = " ";
    SET v_is_order_dir_flag = 0;
    SET v_valid_flag = 0;
    SET v_contrc_limit_flag = 0;
    SET v_posi_type = 0;
    SET v_deli_year = 0;
    SET v_deli_month = 0;
    SET v_begin_trade_date = date_format(curdate(),'%Y%m%d');
    SET v_open_order_type = 0;
    SET v_step_price = 0;
    SET v_hold_qty = 0;
    SET v_main_flag = 0;
    SET v_time_stamp = unix_timestamp();

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_期货基础数据_合约代码信息表][字段][字段变量][{合约代码编号}=@合约代码编号#][4][@合约代码编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, contrc_code_no, 
        exch_no, contrc_code, contrc_name, pinyin_short, 
        contrc_type, asset_type, par_value, contrc_unit, 
        report_unit, min_unit, max_qty, min_qty, 
        crncy_type, exch_crncy_type, capit_reback_days, posi_reback_days, 
        fee_set, is_order_dir_flag, valid_flag, contrc_limit_flag, 
        margin_pref, posi_type, deli_year, deli_month, 
        begin_trade_date, expire_date, begin_deli_date, end_deli_date, 
        open_order_type, step_price, hold_qty, main_flag, 
        time_stamp into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_contrc_code_no, 
        v_exch_no, v_contrc_code, v_contrc_name, v_pinyin_short, 
        v_contrc_type, v_asset_type, v_par_value, v_contrc_unit, 
        v_report_unit, v_min_unit, v_max_qty, v_min_qty, 
        v_crncy_type, v_exch_crncy_type, v_capit_reback_days, v_posi_reback_days, 
        v_fee_set, v_is_order_dir_flag, v_valid_flag, v_contrc_limit_flag, 
        v_margin_pref, v_posi_type, v_deli_year, v_deli_month, 
        v_begin_trade_date, v_expire_date, v_begin_deli_date, v_end_deli_date, 
        v_open_order_type, v_step_price, v_hold_qty, v_main_flag, 
        v_time_stamp from db_pub.tb_basefudt_futu_contrc_info where contrc_code_no=v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.65.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_no = v_exch_no;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_name = v_contrc_name;
    SET p_contrc_type = v_contrc_type;
    SET p_margin_pref = v_margin_pref;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_expire_date = v_expire_date;
    SET p_begin_deli_date = v_begin_deli_date;
    SET p_end_deli_date = v_end_deli_date;
    SET p_deli_price = v_deli_price;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_检查港股通交收日期更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_CheckHKSettleDateUpdate;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_CheckHKSettleDateUpdate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_T1_settle_date int,
    OUT p_T2_settle_date int
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
    declare v_record_count int;
    declare v_T1_settle_date int;
    declare v_T2_settle_date int;
    declare v_exch_no int;
    declare v_no_settle_date_str varchar(2048);
    declare v_settle_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_record_count = 0;
    SET v_T1_settle_date = 0;
    SET v_T2_settle_date = 0;
    SET v_exch_no = 0;
    SET v_no_settle_date_str = " ";
    SET v_settle_date = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* set @市场编号# = 《市场编号-沪港通证券交易所》; */
    set v_exch_no = 3;

    /* [获取表记录变量][公共_基础_市场信息表][{非交收日期串}][@非交收日期串#][{市场编号}=@市场编号#][4][@市场编号#] */
    select no_settle_date_str into v_no_settle_date_str from db_pub.tb_base_exch_info where exch_no=v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.67.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* if instr(@非交收日期串#,@初始化日期#)>0 then */
    if instr(v_no_settle_date_str,v_init_date)>0 then

        /* [获取表记录数量][公共_基础_港股通交收日设置流水表][@记录个数#][{交收日期}=@初始化日期# and {设置方式}=1] */
        select count(1) into v_record_count from db_pub.tb_base_hk_settle_date_jour where settle_date=v_init_date and set_type=1;


        /* if @记录个数#>0 then */
        if v_record_count>0 then

            /* 调用【原子_公共_公共接口_获取下一港股通交收日期】*/
            call db_pub.pra_pubif_GetNextHKSettleDate(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_exch_no,
                v_error_code,
                v_error_info,
                v_settle_date);
            if v_error_code = "1" then
                SET v_error_code = "pubA.24.67.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取下一港股通交收日期出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @T1交收日期# = @交收日期#; */
            set v_T1_settle_date = v_settle_date;

            /* set @初始化日期# = @交收日期#; */
            set v_init_date = v_settle_date;

            /* 调用【原子_公共_公共接口_获取下一港股通交收日期】*/
            call db_pub.pra_pubif_GetNextHKSettleDate(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_exch_no,
                v_error_code,
                v_error_info,
                v_settle_date);
            if v_error_code = "1" then
                SET v_error_code = "pubA.24.67.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_公共接口_获取下一港股通交收日期出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @T2交收日期# = @交收日期#; */
            set v_T2_settle_date = v_settle_date;
        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_T1_settle_date = v_T1_settle_date;
    SET p_T2_settle_date = v_T2_settle_date;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取下一港股通交收日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetNextHKSettleDate;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetNextHKSettleDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_settle_date int
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
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_settle_date int;
    declare v_fixed_date int;
    declare v_no_settle_date_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_settle_date = 0;
    SET v_fixed_date = 0;
    SET v_no_settle_date_str = " ";

    
    label_pro:BEGIN
    

    /* set @指定日期# = date_format(date_add(@初始化日期#, interval 1 day), '%Y%m%d'); */
    set v_fixed_date = date_format(date_add(v_init_date, interval 1 day), '%Y%m%d');

    /* [获取表记录变量][公共_基础_市场信息表][{非交收日期串}][@非交收日期串#][{市场编号} = @市场编号#][1][@市场编号#] */
    select no_settle_date_str into v_no_settle_date_str from db_pub.tb_base_exch_info where exch_no = v_exch_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.68.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    loop_label:loop

        /* if dayofweek(@指定日期#) <> 7 and dayofweek(@指定日期#) <> 1 and instr(@非交收日期串#, concat(";", @指定日期#, ";")) = 0 then */
        if dayofweek(v_fixed_date) <> 7 and dayofweek(v_fixed_date) <> 1 and instr(v_no_settle_date_str, concat(";", v_fixed_date, ";")) = 0 then
            leave loop_label;
        else

            /* set @指定日期# = date_format(date_add(@指定日期#, interval 1 day), '%Y%m%d'); */
            set v_fixed_date = date_format(date_add(v_fixed_date, interval 1 day), '%Y%m%d');
        end if;
    end loop;

    /* set @交收日期# = @指定日期#; */
    set v_settle_date = v_fixed_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_settle_date = v_settle_date;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取港股通汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetHKExchRate;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetHKExchRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_settle_sell_rate decimal(18,12)
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
    declare v_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_settle_sell_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_settle_sell_rate = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_港股通汇率表][{卖出结算汇率}][@卖出结算汇率#][{初始化日期}<=@初始化日期# and {市场编号}=@市场编号# and {外币币种}=《本币币种-港币》 and {本币币种}=《本币币种-人民币》 and {买入结算汇率}<>0 and {卖出结算汇率}<>0 order by {初始化日期} desc][4][@市场编号#,@初始化日期#] */
    select settle_sell_rate into v_settle_sell_rate from db_pub.tb_base_hk_exch_rate where init_date<=v_init_date and exch_no=v_exch_no and for_crncy_type="HKD" and crncy_type="CNY" and settle_buy_rate<>0 and settle_sell_rate<>0 order by init_date desc limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.71.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_settle_sell_rate = v_settle_sell_rate;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取通道编号信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetChannelNoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetChannelNoInfo(
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
    OUT p_hk_cash_avail_date_type int
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
    declare v_hk_cash_avail_date_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_hk_cash_avail_date_type = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_通道信息表][{港股通资金可用日期}][@港股通资金可用日期#][{通道编号}=@通道编号#][4][@通道编号#] */
    select hk_cash_avail_date_type into v_hk_cash_avail_date_type from db_pub.tb_base_channel_info where pass_no=v_pass_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.72.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_hk_cash_avail_date_type = v_hk_cash_avail_date_type;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取系统配置值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetSysConfigValue;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetSysConfigValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_config_index int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_config_value varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_config_index int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_config_value varchar(2048);
    declare v_sys_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_config_index = p_config_index;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_config_value = " ";
    SET v_sys_config_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{系统控制配置串}][@系统控制配置串#][1=1][4][" "] */
    select sys_config_str into v_sys_config_str from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.73.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* set @配置值#=substring(@系统控制配置串#,@配置位#,1); */
    set v_config_value=substring(v_sys_config_str,v_config_index,1);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_config_value = v_config_value;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取标准券证券代码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetStockCodeNo;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetStockCodeNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_sh_standard_stock_code_no int,
    OUT p_sz_standard_stock_code_no int
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
    declare v_sh_standard_stock_code_no int;
    declare v_sz_standard_stock_code_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_sh_standard_stock_code_no = 0;
    SET v_sz_standard_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@上海标准券证券代码编号#][{市场编号}=1 and {证券代码}="888880"][4][" "] */
    select stock_code_no into v_sh_standard_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=1 and stock_code="888880" limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.74.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{证券代码编号}][@深圳标准券证券代码编号#][{市场编号}=2 and {证券代码}="131990"][4][" "] */
    select stock_code_no into v_sz_standard_stock_code_no from db_pub.tb_basesedt_stock_code_info where exch_no=2 and stock_code="131990" limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.74.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_sh_standard_stock_code_no = v_sh_standard_stock_code_no;
    SET p_sz_standard_stock_code_no = v_sz_standard_stock_code_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取港股参考汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetReferenceRate;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetReferenceRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12),
    OUT p_sys_config_str varchar(64)
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
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_sys_config_str varchar(64);
    declare v_exch_no int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_sys_config_str = " ";
    SET v_exch_no = 0;
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* set @市场编号#=3; */
    set v_exch_no=3;

    /* [获取表记录变量语句][公共_基础_港股通汇率表][{记录序号},{买入参考汇率},{卖出参考汇率}][@记录序号#,@买入参考汇率#,@卖出参考汇率#][{市场编号} = @市场编号# and {初始化日期} = @初始化日期#] */
    select row_id,buy_ref_rate,sell_ref_rate into v_row_id,v_buy_ref_rate,v_sell_ref_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date = v_init_date limit 1;


    /* if @记录序号#=0 then */
    if v_row_id=0 then

        /* set @买入参考汇率#=1; */
        set v_buy_ref_rate=1;

        /* set @卖出参考汇率#=1; */
        set v_sell_ref_rate=1;
    end if;

    /* [获取表记录变量][公共_基础_系统信息表][{系统控制配置串}][@系统控制配置串#][1=1][4][" "] */
    select sys_config_str into v_sys_config_str from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.75.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;
    SET p_sys_config_str = v_sys_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取债券质押比例
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetImpawnRatio;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetImpawnRatio(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_impawn_ratio decimal(18,12)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_impawn_ratio decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_impawn_ratio = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_证券基础数据_债券属性信息表][{质押比例}][@质押比例#][{证券代码编号} = @证券代码编号#] */
    select impawn_ratio into v_impawn_ratio from db_pub.tb_basesedt_bond_info where stock_code_no = v_stock_code_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_impawn_ratio = v_impawn_ratio;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取上一交易日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetPreTradeDate;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetPreTradeDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_last_init_date int
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
    declare v_last_init_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* select max(init_date) into @上日初始化日期# from db_pub_his.tb_user_exch_group_asset_his; */
    select max(init_date) into v_last_init_date from db_pub_his.tb_user_exch_group_asset_his;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_last_init_date = v_last_init_date;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取交易组权重值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetExgpWeightValue;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetExgpWeightValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_weight_value_str varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_group_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_weight_value_str varchar(255);
    declare v_exch_group_no int;
    declare v_weight_value decimal(18,4);
    declare v_exch_group_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_weight_value_str = " ";
    SET v_exch_group_no = 0;
    SET v_weight_value = 0;
    SET v_exch_group_status = "0";

    
    label_pro:BEGIN
    

    /* set @权重串#=""; */
    set v_weight_value_str="";
    loop_label:loop

        /* set @交易组编号#=substring_index(@交易组编号串#,";",1); */
        set v_exch_group_no=substring_index(v_exch_group_no_str,";",1);

        /* [获取表记录变量][公共_用户_交易组信息表][{权重值},{交易组状态}][@权重值#,@交易组状态#][{交易组编号}=@交易组编号#][4][@交易组编号#] */
        select weight_value,exch_group_status into v_weight_value,v_exch_group_status from db_pub.tb_user_exch_group_info where exch_group_no=v_exch_group_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pubA.24.78.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no);
            end if;
            leave label_pro;
        end if;

        #如果交易组状态为冻结或者注销,那么权重值赋0

        /* if @交易组状态#=2 or @交易组状态#=3 then */
        if v_exch_group_status=2 or v_exch_group_status=3 then

            /* set @权重值#=0; */
            set v_weight_value=0;
        end if;

        /* set @权重串#=concat(@权重串#,";",@权重值#); */
        set v_weight_value_str=concat(v_weight_value_str,";",v_weight_value);

        /* set @交易组编号串#=substring(@交易组编号串#,10); */
        set v_exch_group_no_str=substring(v_exch_group_no_str,10);

        /* if @交易组编号串#=";" then */
        if v_exch_group_no_str=";" then
            leave loop_label;
        end if;
    end loop;

    /* set @权重串#=concat(@权重串#,";;"); */
    set v_weight_value_str=concat(v_weight_value_str,";;");

    /* set @权重串#=substring(@权重串#,2); */
    set v_weight_value_str=substring(v_weight_value_str,2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_weight_value_str = v_weight_value_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_更新港股通结算汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_UpdateHKSettleRate;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_UpdateHKSettleRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_sh_hk_settle_buy_rate decimal(18,12),
    IN p_sh_hk_settle_sell_rate decimal(18,12),
    IN p_sz_hk_settle_buy_rate decimal(18,12),
    IN p_sz_hksettle_sell_rate decimal(18,12),
    IN p_pboc_rate decimal(18,12),
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
    declare v_sh_hk_settle_buy_rate decimal(18,12);
    declare v_sh_hk_settle_sell_rate decimal(18,12);
    declare v_sz_hk_settle_buy_rate decimal(18,12);
    declare v_sz_hksettle_sell_rate decimal(18,12);
    declare v_pboc_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
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
    SET v_sh_hk_settle_buy_rate = p_sh_hk_settle_buy_rate;
    SET v_sh_hk_settle_sell_rate = p_sh_hk_settle_sell_rate;
    SET v_sz_hk_settle_buy_rate = p_sz_hk_settle_buy_rate;
    SET v_sz_hksettle_sell_rate = p_sz_hksettle_sell_rate;
    SET v_pboc_rate = p_pboc_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_市场信息表][{初始化日期}][@初始化日期#][{市场编号}=3][4]["沪港通交易所不能获取初始化日期 !"] */
    select init_date into v_init_date from db_pub.tb_base_exch_info where exch_no=3 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.79.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("沪港通交易所不能获取初始化日期 !","#",v_mysql_message);
        else
            SET v_error_info = "沪港通交易所不能获取初始化日期 !";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_基础_港股通汇率表][{买入结算汇率}=@沪港通买入结算汇率#,{卖出结算汇率}=@沪港通卖出结算汇率#,{中国人行汇率}=@中国人行汇率#][{初始化日期}=@初始化日期# and {市场编号}=3][2]["沪港通的当日汇率记录不存在 !"] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_hk_exch_rate set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, settle_buy_rate=v_sh_hk_settle_buy_rate,settle_sell_rate=v_sh_hk_settle_sell_rate,pboc_rate=v_pboc_rate where init_date=v_init_date and exch_no=3;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.24.79.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("沪港通的当日汇率记录不存在 !","#",v_mysql_message);
        else
            SET v_error_info = "沪港通的当日汇率记录不存在 !";
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][公共_基础_港股通汇率表][{买入结算汇率}=@深港通买入结算汇率#,{卖出结算汇率}=@深港通卖出结算汇率#,{中国人行汇率}=@中国人行汇率#][{初始化日期}=@初始化日期# and {市场编号}=4][2]["深港通的当日汇率记录不存在 !"] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_base_hk_exch_rate set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, settle_buy_rate=v_sz_hk_settle_buy_rate,settle_sell_rate=v_sz_hksettle_sell_rate,pboc_rate=v_pboc_rate where init_date=v_init_date and exch_no=4;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.24.79.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("深港通的当日汇率记录不存在 !","#",v_mysql_message);
        else
            SET v_error_info = "深港通的当日汇率记录不存在 !";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_更新资产获取交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_UpdateAssetGetExgpInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_UpdateAssetGetExgpInfo(
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
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int
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
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_用户_交易组信息表][{记录序号},{机构编号},{产品编号},{交易组编号}][@记录序号#,@机构编号#,@产品编号#,@交易组编号#][{记录序号}>@查询记录序号# and {交易组状态}<>"3" order by {记录序号}] */
    select row_id,co_no,pd_no,exch_group_no into v_row_id,v_co_no,v_pd_no,v_exch_group_no from db_pub.tb_user_exch_group_info where row_id>v_query_row_id and exch_group_status<>"3" order by row_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取基金交易到账日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetFundTradeArriveDate;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetFundTradeArriveDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_arrive_date int
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
    declare v_arrive_date int;
    declare v_init_date int;
    declare v_record_count int;
    declare v_tmp_init_date int;
    declare v_no_exch_date_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_record_count = 0;
    SET v_tmp_init_date = date_format(curdate(),'%Y%m%d');
    SET v_no_exch_date_str = " ";

    
    label_pro:BEGIN
    
    #到账日期取基金赎回的最长确认日期,14个交易日

    /* [获取表记录变量][公共_基础_系统信息表][{初始化日期}][@初始化日期#][1=1][4][" "] */
    select init_date into v_init_date from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.81.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* set @记录个数#=0; */
    set v_record_count=0;
    loop_label:loop

        /* set @临时_初始化日期# = DATE_FORMAT(ADDDATE(@初始化日期#,1),"%Y%m%d"); */
        set v_tmp_init_date = DATE_FORMAT(ADDDATE(v_init_date,1),"%Y%m%d");

        /* if dayofweek(@临时_初始化日期#) <> 7 and dayofweek(@临时_初始化日期#) <> 1 and instr(@非交易日期串#, concat(";", @临时_初始化日期#, ";")) = 0 then */
        if dayofweek(v_tmp_init_date) <> 7 and dayofweek(v_tmp_init_date) <> 1 and instr(v_no_exch_date_str, concat(";", v_tmp_init_date, ";")) = 0 then

            /* set @记录个数#=@记录个数#+1; */
            set v_record_count=v_record_count+1;

            /* set @初始化日期#=@临时_初始化日期#; */
            set v_init_date=v_tmp_init_date;

            /* if @记录个数#=14 then */
            if v_record_count=14 then
                leave loop_label;
            end if;
        else

            /* set @初始化日期# = @临时_初始化日期#; */
            set v_init_date = v_tmp_init_date;
        end if;
    end loop;

    /* set @到账日期#=@初始化日期#; */
    set v_arrive_date=v_init_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_arrive_date = v_arrive_date;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取交易组默认标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetExgpDefaultFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetExgpDefaultFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_default_group_flag int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_default_group_flag int;
    declare v_exch_group_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_default_group_flag = 0;
    SET v_exch_group_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_交易组信息表][{默认组标志},{交易组状态}][@默认组标志#,@交易组状态#][{交易组编号}=@交易组编号#][4][@交易组编号#] */
    select default_group_flag,exch_group_status into v_default_group_flag,v_exch_group_status from db_pub.tb_user_exch_group_info where exch_group_no=v_exch_group_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.82.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@交易组状态#="3"][72][@交易组编号#] */
    if v_exch_group_status="3" then
        
        SET v_error_code = "pubA.24.82.72";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_default_group_flag = v_default_group_flag;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_初始化交易组资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_InitExgpAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_InitExgpAsset(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #交易组资产表 期初估值净资产=估值净资产 modify by wjp

    /* [更新表记录][公共_用户_交易组资产表][{期初净资产}={净资产},{期初估值净资产}={估值净资产}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pub.tb_user_exch_group_asset set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_NAV=nav_asset,begin_evalu_nav_asset=evalu_nav_asset where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pubA.24.83.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取机构控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetCompanyControlStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetCompanyControlStr(
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
    OUT p_co_busi_config_str varchar(64)
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
    declare v_co_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_co_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_机构信息表][{业务控制配置串}][@机构业务控制配置串#][{机构编号}=@机构编号#][4][@机构编号#] */
    select busi_config_str into v_co_busi_config_str from db_pub.tb_base_co_info where co_no=v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.84.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取证券代码信息行情汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetStockCodeInfoQuotRate;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetStockCodeInfoQuotRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_exch_no int,
    OUT p_stock_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_last_price decimal(16,9),
    OUT p_fair_price decimal(16,9),
    OUT p_net_price_flag int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_settle_buy_rate decimal(18,12),
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
    declare v_query_row_id bigint;
    declare v_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_last_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_crncy_type varchar(3);
    declare v_stock_code varchar(6);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_exch_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_last_price = 0;
    SET v_fair_price = 0;
    SET v_net_price_flag = 0;
    SET v_bond_accr_intrst = 0;
    SET v_settle_buy_rate = 0;
    SET v_crncy_type = "CNY";
    SET v_stock_code = " ";

    
    label_pro:BEGIN
    

    /* set @最新价# = 0; */
    set v_last_price = 0;

    /* set @公允价格# =0; */
    set v_fair_price =0;

    /* set @净价标志# = 1; */
    set v_net_price_flag = 1;

    /* set @债券计提利息# = 0; */
    set v_bond_accr_intrst = 0;

    /* set @买入结算汇率# =1; */
    set v_settle_buy_rate =1;

    /* [获取表记录变量][公共_证券基础数据_证券代码信息表][{记录序号},{市场编号},{证券代码},{证券代码编号},{证券类型},{资产类型},{本币币种}][@记录序号#,@市场编号#,@证券代码#,@证券代码编号#,@证券类型#,@资产类型#,@本币币种#][{记录序号}>@查询记录序号# order by {记录序号}][4][@查询记录序号#] */
    select row_id,exch_no,stock_code,stock_code_no,stock_type,asset_type,crncy_type into v_row_id,v_exch_no,v_stock_code,v_stock_code_no,v_stock_type,v_asset_type,v_crncy_type from db_pub.tb_basesedt_stock_code_info where row_id>v_query_row_id order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.106.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][公共_证券基础数据_证券行情表][{最新价},{公允价格}][@最新价#,@公允价格#][{证券代码编号}=@证券代码编号#] */
    select last_price,fair_price into v_last_price,v_fair_price from db_pub.tb_basesedt_stock_quot where stock_code_no=v_stock_code_no limit 1;

    if FOUND_ROWS() = 0 then
        leave label_pro;
    end if;

    /* if @证券类型#>20 and @证券类型#<50 then */
    if v_stock_type>20 and v_stock_type<50 then

        /* [获取表记录变量语句][公共_证券基础数据_债券属性信息表][{净价标志},{债券计提利息}][@净价标志#,@债券计提利息#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
        select net_price_flag,bond_accr_intrst into v_net_price_flag,v_bond_accr_intrst from db_pub.tb_basesedt_bond_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;

    end if;

    /* if @市场编号# = 《市场编号-沪港通证券交易所》 or @市场编号# = 《市场编号-深港通证券交易所》 then */
    if v_exch_no = 3 or v_exch_no = 4 then

        /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率}][@买入结算汇率#][{初始化日期}<=@初始化日期# and {市场编号}=@市场编号# and {外币币种}=《本币币种-港币》 and {本币币种}=《本币币种-人民币》 and {买入结算汇率}<>0 and {卖出结算汇率}<>0 order by {初始化日期} desc] */
        select settle_buy_rate into v_settle_buy_rate from db_pub.tb_base_hk_exch_rate where init_date<=v_init_date and exch_no=v_exch_no and for_crncy_type="HKD" and crncy_type="CNY" and settle_buy_rate<>0 and settle_sell_rate<>0 order by init_date desc limit 1;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_exch_no = v_exch_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_last_price = v_last_price;
    SET p_fair_price = v_fair_price;
    SET p_net_price_flag = v_net_price_flag;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_settle_buy_rate = v_settle_buy_rate;
    SET p_crncy_type = v_crncy_type;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取合约编号行情价格
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetContrcNoQuotPrice;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetContrcNoQuotPrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_last_price decimal(16,9)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_contrc_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pre_settle_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pre_settle_price = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_last_price = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_期货基础数据_期货行情表][{昨结算价},{涨停价},{跌停价},{最新价}][@昨结算价#,@涨停价#,@跌停价#,@最新价#][{合约代码编号}=@合约代码编号#] */
    select pre_settle_price,up_limit_price,down_limit_price,last_price into v_pre_settle_price,v_up_limit_price,v_down_limit_price,v_last_price from db_pub.tb_basefudt_futu_quot where contrc_code_no=v_contrc_code_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_last_price = v_last_price;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_同步资产计算所需证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_SyncStockCodeInfoByAssetCalc;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_SyncStockCodeInfoByAssetCalc(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
    declare v_pboc_rate decimal(18,12);
    declare v_tmp_settle_buy_rate decimal(18,12);
    declare v_tmp_settle_sell_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;
    SET v_pboc_rate = 0;
    SET v_tmp_settle_buy_rate = 0;
    SET v_tmp_settle_sell_rate = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率},{中国人行汇率}][@买入结算汇率#,@卖出结算汇率#,@中国人行汇率#][{市场编号}=《市场编号-沪港通证券交易所》 and {外币币种}=《本币币种-港币》 and {本币币种}=《本币币种-人民币》 and {买入结算汇率}<>0 and {卖出结算汇率}<>0 order by {初始化日期} desc] */
    select settle_buy_rate,settle_sell_rate,pboc_rate into v_settle_buy_rate,v_settle_sell_rate,v_pboc_rate from db_pub.tb_base_hk_exch_rate where exch_no=3 and for_crncy_type="HKD" and crncy_type="CNY" and settle_buy_rate<>0 and settle_sell_rate<>0 order by init_date desc limit 1;


    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@临时_买入结算汇率#,@临时_卖出结算汇率#][{市场编号}=《市场编号-深港通证券交易所》 and {外币币种}=《本币币种-港币》 and {本币币种}=《本币币种-人民币》  and {买入结算汇率}<>0 and {卖出结算汇率}<>0 order by {初始化日期} desc] */
    select settle_buy_rate,settle_sell_rate into v_tmp_settle_buy_rate,v_tmp_settle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no=4 and for_crncy_type="HKD" and crncy_type="CNY"  and settle_buy_rate<>0 and settle_sell_rate<>0 order by init_date desc limit 1;


    /* if @指定行数# = -1 then */
    if v_row_count = -1 then

     /* select 
 a.{记录序号},
 a.{市场编号},
 a.{证券代码编号},
 a.{证券类型},
 a.{资产类型},
 a.{本币币种},
 if(a.{公允价格}<>0,a.{公允价格},ifnull(b.{最新价},0)) as {最新价},
 a.{公允价格},
 ifnull(c.{净价标志},1) as {净价标志},
 ifnull(if(a.{公允价格}<>0 or c.{净价标志}=《净价标志-全价》 or c.{债券利率类型}=《债券利率类型-零息》 or c.{付息标志}=1,0,c.{债券计提利息}),0) as {债券计提利息},
 case when a.{市场编号} = 《市场编号-沪港通证券交易所》 then @买入结算汇率# when a.{市场编号} = 《市场编号-深港通证券交易所》 then @临时_买入结算汇率# else 1 end as {买入结算汇率},
 case when a.{市场编号} = 《市场编号-沪港通证券交易所》 then @卖出结算汇率# when a.{市场编号} = 《市场编号-深港通证券交易所》 then @临时_卖出结算汇率# else 1 end as {卖出结算汇率},
 @中国人行汇率# as {中国人行汇率}
   from ~公共_证券基础数据_证券代码信息表^ a
 inner JOIN ~公共_证券基础数据_证券行情表^ b on a.{证券代码编号} = b.{证券代码编号} and b.{最新价}<>0
 LEFT JOIN ~公共_证券基础数据_债券属性信息表^ c on a.{证券代码编号} = c.{证券代码编号}
 where 
 a.{证券类型} not in (《证券类型-债券回购》,《证券类型-债券质押》,《证券类型-指数》)
 AND a.{记录序号}>@记录序号#
 order by
 a.{记录序号}; */
     select 
      a.row_id,
      a.exch_no,
      a.stock_code_no,
      a.stock_type,
      a.asset_type,
      a.crncy_type,
      if(a.fair_price<>0,a.fair_price,ifnull(b.last_price,0)) as last_price,
      a.fair_price,
      ifnull(c.net_price_flag,1) as net_price_flag,
      ifnull(if(a.fair_price<>0 or c.net_price_flag=2 or c.bond_rate_type=3 or c.pay_intrst_flag=1,0,c.bond_accr_intrst),0) as bond_accr_intrst,
      case when a.exch_no = 3 then v_settle_buy_rate when a.exch_no = 4 then v_tmp_settle_buy_rate else 1 end as settle_buy_rate,
      case when a.exch_no = 3 then v_settle_sell_rate when a.exch_no = 4 then v_tmp_settle_sell_rate else 1 end as settle_sell_rate,
      v_pboc_rate as pboc_rate
        from db_pub.tb_basesedt_stock_code_info a
      inner JOIN db_pub.tb_basesedt_stock_quot b on a.stock_code_no = b.stock_code_no and b.last_price<>0
      LEFT JOIN db_pub.tb_basesedt_bond_info c on a.stock_code_no = c.stock_code_no
      where 
      a.stock_type not in (26,28,81)
      AND a.row_id>v_row_id
      order by
      a.row_id;
    else

     /* select 
 a.{记录序号},
 a.{市场编号},
 a.{证券代码编号},
 a.{证券类型},
 a.{资产类型},
 a.{本币币种},
 if(a.{公允价格}<>0,a.{公允价格},ifnull(b.{最新价},0)) as {最新价},
 a.{公允价格},
 ifnull(c.{净价标志},1) as {净价标志},
 ifnull(if(a.{公允价格}<>0 or c.{净价标志}=《净价标志-全价》 or c.{债券利率类型}=《债券利率类型-零息》 or c.{付息标志}=1,0,c.{债券计提利息}),0) as {债券计提利息},
 case when a.{市场编号} = 《市场编号-沪港通证券交易所》 then @买入结算汇率# when a.{市场编号} = 《市场编号-深港通证券交易所》 then @临时_买入结算汇率# else 1 end as {买入结算汇率},
 case when a.{市场编号} = 《市场编号-沪港通证券交易所》 then @卖出结算汇率# when a.{市场编号} = 《市场编号-深港通证券交易所》 then @临时_卖出结算汇率# else 1 end as {卖出结算汇率},
 @中国人行汇率# as {中国人行汇率}
 from ~公共_证券基础数据_证券代码信息表^ a
 inner JOIN ~公共_证券基础数据_证券行情表^ b on a.{证券代码编号} = b.{证券代码编号} and b.{最新价}<>0
 LEFT JOIN ~公共_证券基础数据_债券属性信息表^ c on a.{证券代码编号} = c.{证券代码编号}
 where 
 a.{证券类型} not in (《证券类型-债券回购》,《证券类型-债券质押》,《证券类型-指数》)
 AND a.{记录序号}>@记录序号#
 order by
 a.{记录序号}
 limit @指定行数#; */
     select 
      a.row_id,
      a.exch_no,
      a.stock_code_no,
      a.stock_type,
      a.asset_type,
      a.crncy_type,
      if(a.fair_price<>0,a.fair_price,ifnull(b.last_price,0)) as last_price,
      a.fair_price,
      ifnull(c.net_price_flag,1) as net_price_flag,
      ifnull(if(a.fair_price<>0 or c.net_price_flag=2 or c.bond_rate_type=3 or c.pay_intrst_flag=1,0,c.bond_accr_intrst),0) as bond_accr_intrst,
      case when a.exch_no = 3 then v_settle_buy_rate when a.exch_no = 4 then v_tmp_settle_buy_rate else 1 end as settle_buy_rate,
      case when a.exch_no = 3 then v_settle_sell_rate when a.exch_no = 4 then v_tmp_settle_sell_rate else 1 end as settle_sell_rate,
      v_pboc_rate as pboc_rate
      from db_pub.tb_basesedt_stock_code_info a
      inner JOIN db_pub.tb_basesedt_stock_quot b on a.stock_code_no = b.stock_code_no and b.last_price<>0
      LEFT JOIN db_pub.tb_basesedt_bond_info c on a.stock_code_no = c.stock_code_no
      where 
      a.stock_type not in (26,28,81)
      AND a.row_id>v_row_id
      order by
      a.row_id
      limit v_row_count;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取币种汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetCrncyRate;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetCrncyRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_issue_co int,
    IN p_crncy_type varchar(3),
    IN p_for_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_spot_exch_buy_rate decimal(18,12),
    OUT p_spot_exch_sale_rate decimal(18,12),
    OUT p_china_bank_convert_rate decimal(18,12)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_issue_co int;
    declare v_crncy_type varchar(3);
    declare v_for_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_spot_exch_buy_rate decimal(18,12);
    declare v_spot_exch_sale_rate decimal(18,12);
    declare v_china_bank_convert_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_issue_co = p_issue_co;
    SET v_crncy_type = p_crncy_type;
    SET v_for_crncy_type = p_for_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_spot_exch_buy_rate = 0;
    SET v_spot_exch_sale_rate = 0;
    SET v_china_bank_convert_rate = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_币种汇率表][{现汇买入价},{现汇卖出价},{中行折算价}][@现汇买入价#,@现汇卖出价#,@中行折算价#][{发布机构} =@发布机构#  and {外币币种}= @外币币种# and {本币币种}=@本币币种# and {中行折算价}<>0][4][@发布机构#,@本币币种#,@外币币种#] */
    select spot_exch_buy_rate,spot_exch_sale_rate,china_bank_convert_rate into v_spot_exch_buy_rate,v_spot_exch_sale_rate,v_china_bank_convert_rate from db_pub.tb_base_crncy_exch_rate where issue_co =v_issue_co  and for_crncy_type= v_for_crncy_type and crncy_type=v_crncy_type and china_bank_convert_rate<>0 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.211.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("发布机构=",v_issue_co,",","本币币种=",v_crncy_type,",","外币币种=",v_for_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("发布机构=",v_issue_co,",","本币币种=",v_crncy_type,",","外币币种=",v_for_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_spot_exch_buy_rate = v_spot_exch_buy_rate;
    SET p_spot_exch_sale_rate = v_spot_exch_sale_rate;
    SET p_china_bank_convert_rate = v_china_bank_convert_rate;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_查询期货合约行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_QueryFutuContrcQuot;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_QueryFutuContrcQuot(
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
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# =-1; */
    set v_row_count =-1;
    #[获取表记录][公共_期货基础数据_期货行情表][{合约代码编号},round({最新价},2)][1=1][@指定行数#]

    /* [获取表记录][公共_期货基础数据_期货行情表][{合约代码编号},{最新价}][1=1][@指定行数#] */
    if v_row_count = -1 then
        select contrc_code_no,last_price from db_pub.tb_basefudt_futu_quot where 1=1;
    else
        select contrc_code_no,last_price from db_pub.tb_basefudt_futu_quot where 1=1 limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_同步资产计算所需证券代码信息串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_SyncStockCodeInfoByAssetCalcStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_SyncStockCodeInfoByAssetCalcStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_row_count int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_row_id bigint,
    OUT p_sync_field1 varchar(10000),
    OUT p_sync_field2 varchar(10000),
    OUT p_sync_field3 varchar(10000),
    OUT p_sync_field4 varchar(10000),
    OUT p_sync_field5 varchar(10000),
    OUT p_sync_field6 varchar(10000),
    OUT p_sync_field7 varchar(10000),
    OUT p_sync_field8 varchar(10000),
    OUT p_sync_field9 varchar(10000),
    OUT p_sync_field10 varchar(10000),
    OUT p_sync_field11 varchar(10000),
    OUT p_sync_field12 varchar(10000),
    OUT p_sync_field13 varchar(10000)
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
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_row_id bigint;
    declare v_sync_field1 varchar(10000);
    declare v_sync_field2 varchar(10000);
    declare v_sync_field3 varchar(10000);
    declare v_sync_field4 varchar(10000);
    declare v_sync_field5 varchar(10000);
    declare v_sync_field6 varchar(10000);
    declare v_sync_field7 varchar(10000);
    declare v_sync_field8 varchar(10000);
    declare v_sync_field9 varchar(10000);
    declare v_sync_field10 varchar(10000);
    declare v_sync_field11 varchar(10000);
    declare v_sync_field12 varchar(10000);
    declare v_sync_field13 varchar(10000);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
    declare v_pboc_rate decimal(18,12);
    declare v_tmp_settle_buy_rate decimal(18,12);
    declare v_tmp_settle_sell_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_row_id = 0;
    SET v_sync_field1 = " ";
    SET v_sync_field2 = " ";
    SET v_sync_field3 = " ";
    SET v_sync_field4 = " ";
    SET v_sync_field5 = " ";
    SET v_sync_field6 = " ";
    SET v_sync_field7 = " ";
    SET v_sync_field8 = " ";
    SET v_sync_field9 = " ";
    SET v_sync_field10 = " ";
    SET v_sync_field11 = " ";
    SET v_sync_field12 = " ";
    SET v_sync_field13 = " ";
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;
    SET v_pboc_rate = 0;
    SET v_tmp_settle_buy_rate = 0;
    SET v_tmp_settle_sell_rate = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率},{中国人行汇率}][@买入结算汇率#,@卖出结算汇率#,@中国人行汇率#][{市场编号}=《市场编号-沪港通证券交易所》 and {外币币种}=《本币币种-港币》 and {本币币种}=《本币币种-人民币》 and {买入结算汇率}<>0 and {卖出结算汇率}<>0 order by {初始化日期} desc] */
    select settle_buy_rate,settle_sell_rate,pboc_rate into v_settle_buy_rate,v_settle_sell_rate,v_pboc_rate from db_pub.tb_base_hk_exch_rate where exch_no=3 and for_crncy_type="HKD" and crncy_type="CNY" and settle_buy_rate<>0 and settle_sell_rate<>0 order by init_date desc limit 1;


    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@临时_买入结算汇率#,@临时_卖出结算汇率#][{市场编号}=《市场编号-深港通证券交易所》 and {外币币种}=《本币币种-港币》 and {本币币种}=《本币币种-人民币》  and {买入结算汇率}<>0 and {卖出结算汇率}<>0 order by {初始化日期} desc] */
    select settle_buy_rate,settle_sell_rate into v_tmp_settle_buy_rate,v_tmp_settle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no=4 and for_crncy_type="HKD" and crncy_type="CNY"  and settle_buy_rate<>0 and settle_sell_rate<>0 order by init_date desc limit 1;


    /* set @当前记录序号#=0; */
    set v_curr_row_id=0;

    /* set @同步字段1#=" "; */
    set v_sync_field1=" ";

    /* set @同步字段2#=" "; */
    set v_sync_field2=" ";
     select

     /* GROUP_CONCAT(t1.{记录序号}), */
     GROUP_CONCAT(t1.row_id),

     /* GROUP_CONCAT(t1.{市场编号}), */
     GROUP_CONCAT(t1.exch_no),

     /* GROUP_CONCAT(t1.{证券代码编号}), */
     GROUP_CONCAT(t1.stock_code_no),

     /* GROUP_CONCAT(t1.{证券类型}), */
     GROUP_CONCAT(t1.stock_type),

     /* GROUP_CONCAT(t1.{资产类型}), */
     GROUP_CONCAT(t1.asset_type),

     /* GROUP_CONCAT(t1.{本币币种}), */
     GROUP_CONCAT(t1.crncy_type),

     /* GROUP_CONCAT(t1.{最新价}), */
     GROUP_CONCAT(t1.last_price),

     /* GROUP_CONCAT(t1.{公允价格}), */
     GROUP_CONCAT(t1.fair_price),

     /* GROUP_CONCAT(t1.{净价标志}), */
     GROUP_CONCAT(t1.net_price_flag),

     /* GROUP_CONCAT(t1.{债券计提利息}), */
     GROUP_CONCAT(t1.bond_accr_intrst),

     /* GROUP_CONCAT(t1.{买入结算汇率}), */
     GROUP_CONCAT(t1.settle_buy_rate),

     /* GROUP_CONCAT(t1.{卖出结算汇率}), */
     GROUP_CONCAT(t1.settle_sell_rate),

     /* GROUP_CONCAT(t1.{中国人行汇率}) */
     GROUP_CONCAT(t1.pboc_rate)
     into

     /* @同步字段1#,@同步字段2#,@同步字段3#,@同步字段4#,@同步字段5#,@同步字段6#,@同步字段7#,@同步字段8#,@同步字段9#,@同步字段10#,@同步字段11#,@同步字段12#,@同步字段13# */
     v_sync_field1,v_sync_field2,v_sync_field3,v_sync_field4,v_sync_field5,v_sync_field6,v_sync_field7,v_sync_field8,v_sync_field9,v_sync_field10,v_sync_field11,v_sync_field12,v_sync_field13
     from
     (select

     /* a.{记录序号}, */
     a.row_id,

     /* a.{市场编号}, */
     a.exch_no,

     /* a.{证券代码编号}, */
     a.stock_code_no,

     /* a.{证券类型}, */
     a.stock_type,

     /* a.{资产类型}, */
     a.asset_type,

     /* a.{本币币种}, */
     a.crncy_type,

     /* if(a.{公允价格}<>0,a.{公允价格},ifnull(b.{最新价},0)) as {最新价}, */
     if(a.fair_price<>0,a.fair_price,ifnull(b.last_price,0)) as last_price,

     /* a.{公允价格}, */
     a.fair_price,

     /* ifnull(c.{净价标志},1) as {净价标志}, */
     ifnull(c.net_price_flag,1) as net_price_flag,

     /* ifnull(if(a.{公允价格}<>0 or c.{净价标志}=《净价标志-全价》 or c.{债券利率类型}=《债券利率类型-零息》 or c.{付息标志}=1,0,c.{债券计提利息}),0) as {债券计提利息}, */
     ifnull(if(a.fair_price<>0 or c.net_price_flag=2 or c.bond_rate_type=3 or c.pay_intrst_flag=1,0,c.bond_accr_intrst),0) as bond_accr_intrst,

     /* case when a.{市场编号} = 《市场编号-沪港通证券交易所》 then @买入结算汇率# when a.{市场编号} = 《市场编号-深港通证券交易所》 then @临时_买入结算汇率# else 1 end as {买入结算汇率}, */
     case when a.exch_no = 3 then v_settle_buy_rate when a.exch_no = 4 then v_tmp_settle_buy_rate else 1 end as settle_buy_rate,

     /* case when a.{市场编号} = 《市场编号-沪港通证券交易所》 then @卖出结算汇率# when a.{市场编号} = 《市场编号-深港通证券交易所》 then @临时_卖出结算汇率# else 1 end as {卖出结算汇率}, */
     case when a.exch_no = 3 then v_settle_sell_rate when a.exch_no = 4 then v_tmp_settle_sell_rate else 1 end as settle_sell_rate,

     /* @中国人行汇率# as {中国人行汇率} */
     v_pboc_rate as pboc_rate

       /* from ~公共_证券基础数据_证券代码信息表^ a */
       from db_pub.tb_basesedt_stock_code_info a

     /* inner JOIN ~公共_证券基础数据_证券行情表^ b on a.{证券代码编号} = b.{证券代码编号} and b.{最新价}<>0 */
     inner JOIN db_pub.tb_basesedt_stock_quot b on a.stock_code_no = b.stock_code_no and b.last_price<>0

     /* LEFT JOIN ~公共_证券基础数据_债券属性信息表^ c on a.{证券代码编号} = c.{证券代码编号} */
     LEFT JOIN db_pub.tb_basesedt_bond_info c on a.stock_code_no = c.stock_code_no
     where

     /* a.{证券类型} not in (《证券类型-债券回购》,《证券类型-债券质押》,《证券类型-指数》) */
     a.stock_type not in (26,28,81)

     /* AND a.{记录序号}>@记录序号# */
     AND a.row_id>v_row_id
     order by

     /* a.{记录序号} limit @指定行数#)AS t1; */
     a.row_id limit v_row_count)AS t1;

    /* set @当前记录序号#=ifnull(substring_index(@同步字段1#,",",-1),0); */
    set v_curr_row_id=ifnull(substring_index(v_sync_field1,",",-1),0);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_row_id = v_curr_row_id;
    SET p_sync_field1 = v_sync_field1;
    SET p_sync_field2 = v_sync_field2;
    SET p_sync_field3 = v_sync_field3;
    SET p_sync_field4 = v_sync_field4;
    SET p_sync_field5 = v_sync_field5;
    SET p_sync_field6 = v_sync_field6;
    SET p_sync_field7 = v_sync_field7;
    SET p_sync_field8 = v_sync_field8;
    SET p_sync_field9 = v_sync_field9;
    SET p_sync_field10 = v_sync_field10;
    SET p_sync_field11 = v_sync_field11;
    SET p_sync_field12 = v_sync_field12;
    SET p_sync_field13 = v_sync_field13;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_更新指定交易组资产估值份额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_UpdateAppointedExgpAssetShare;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_UpdateAppointedExgpAssetShare(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_evalu_share decimal(18,2),
    IN p_evalu_nav_asset decimal(18,4),
    IN p_begin_evalu_nav_asset decimal(18,4),
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
    declare v_pd_no int;
    declare v_evalu_share decimal(18,2);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_exch_group_no int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_exch_group_pd_share decimal(18,2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_co_no int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
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
    SET v_pd_no = p_pd_no;
    SET v_evalu_share = p_evalu_share;
    SET v_evalu_nav_asset = p_evalu_nav_asset;
    SET v_begin_evalu_nav_asset = p_begin_evalu_nav_asset;
    SET v_exch_group_no = p_exch_group_no;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_exch_group_pd_share = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_co_no = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_jour_after_occur_info = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_用户_交易组信息表][{交易组产品份额}][@临时_交易组产品份额#][{交易组编号}=@交易组编号#][4][@交易组编号#] */
    select exch_group_pd_share into v_tmp_exch_group_pd_share from db_pub.tb_user_exch_group_info where exch_group_no=v_exch_group_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.24.214.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* if @估值份额# <> 0   then */
    if v_evalu_share <> 0   then

        /* [更新表记录][公共_用户_交易组信息表][{交易组产品份额}=@估值份额#][{交易组编号}=@交易组编号#][2][@交易组编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pub.tb_user_exch_group_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, exch_group_pd_share=v_evalu_share where exch_group_no=v_exch_group_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.24.214.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no);
            end if;
            leave label_pro;
        end if;


        /* set @机构编号#=left(@交易组编号#,4); */
        set v_co_no=left(v_exch_group_no,4);

        /* set @操作菜单#=@菜单编号#; */
        set v_oper_menu_no=v_menu_no;

        /* set @操作功能#=@功能编码#; */
        set v_oper_func_code=v_func_code;

        /* [获取流水变动][{交易组产品份额}][@估值份额#] */
        set v_jour_occur_field = concat("交易组产品份额","|");
        set v_jour_occur_info = concat(v_evalu_share,"|");


        /* [获取流水后信息][@估值份额#] */
        set v_jour_after_occur_info = concat(v_evalu_share,"|");


        /* set @操作备注#="估值更新指定交易组份额 !"; */
        set v_oper_remark_info="估值更新指定交易组份额 !";

       /* [插入表记录][公共_用户_交易组信息流水表][字段][字段变量][1][@交易组编号#,@初始化日期#] */
       set v_create_date = date_format(curdate(),'%Y%m%d');
       set v_create_time = date_format(curtime(),'%H%i%s');
       set v_update_date = v_create_date;
       set v_update_time = v_create_time;
       set v_update_times = 1;
       insert into db_pub.tb_user_exch_group_info_jour(
           create_date, create_time, update_date, 
           update_time, update_times, opor_co_no, opor_no, 
           oper_mac, oper_ip_addr, oper_info, oper_way, 
           oper_menu_no, oper_func_code, init_date, co_no, 
           pd_no, exch_group_no, jour_occur_field, jour_after_occur_info, 
           oper_remark_info) 
       value( 
           v_create_date, v_create_time, v_update_date, 
           v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
           v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
           v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
           v_pd_no, v_exch_group_no, v_jour_occur_field, v_jour_after_occur_info, 
           v_oper_remark_info);
       if v_error_code = "1" then
                   
           SET v_error_code = "pubA.24.214.1";
           SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","初始化日期=",v_init_date),"#",v_mysql_message);
           leave label_pro;
       end if;


        /* if @临时_交易组产品份额#<>@估值份额# then */
        if v_tmp_exch_group_pd_share<>v_evalu_share then

            /* set @操作备注#="份额变动"; */
            set v_oper_remark_info="份额变动";

            /* set @流水变动字段#=@估值份额#-@临时_交易组产品份额#; */
            set v_jour_occur_field=v_evalu_share-v_tmp_exch_group_pd_share;

            /* set @流水后信息#=@估值份额#; */
            set v_jour_after_occur_info=v_evalu_share;

            /* [插入表记录][公共_用户_交易组信息流水表][字段][字段变量][1][@交易组编号#,@初始化日期#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pub.tb_user_exch_group_info_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, exch_group_no, jour_occur_field, jour_after_occur_info, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_jour_occur_field, v_jour_after_occur_info, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pubA.24.214.1";
                SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","初始化日期=",v_init_date),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;
    end if;
    #更新默认交易组 估值净资产2字段 modify by wjp

    /* if @估值净资产# <> 0 then */
    if v_evalu_nav_asset <> 0 then

          /* [更新表记录][公共_用户_交易组资产表][{估值净资产}=@估值净资产#][{交易组编号}=@交易组编号#  and {产品编号}=@产品编号#][2][@产品编号#,@交易组编号#,"更新估值净资产"] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_pub.tb_user_exch_group_asset set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, evalu_nav_asset=v_evalu_nav_asset where exch_group_no=v_exch_group_no  and pd_no=v_pd_no;
          if v_error_code = "1" then
                      
              SET v_error_code = "pubA.24.214.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","更新估值净资产"),"#",v_mysql_message);
              else
                  SET v_error_info = concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","更新估值净资产");
              end if;
              leave label_pro;
          end if;

    end if;

    /* if @期初估值净资产# <> 0 then */
    if v_begin_evalu_nav_asset <> 0 then

          /* [更新表记录][公共_用户_交易组资产表][{期初估值净资产}=@期初估值净资产#][{交易组编号}=@交易组编号#  and {产品编号}=@产品编号#][2][@产品编号#,@交易组编号#,"更新估值净资产"] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_pub.tb_user_exch_group_asset set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_evalu_nav_asset=v_begin_evalu_nav_asset where exch_group_no=v_exch_group_no  and pd_no=v_pd_no;
          if v_error_code = "1" then
                      
              SET v_error_code = "pubA.24.214.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","更新估值净资产"),"#",v_mysql_message);
              else
                  SET v_error_info = concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","更新估值净资产");
              end if;
              leave label_pro;
          end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取同步资金所需交易组编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetSyncAsacCaptExgpNo;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetSyncAsacCaptExgpNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_default_exch_group_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no int
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
    declare v_default_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no int;
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
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [获取表记录数量][公共_用户_交易组信息表][@记录个数#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组状态}=《交易组状态-正常》] */
    select count(1) into v_record_count from db_pub.tb_user_exch_group_info where co_no=v_co_no and pd_no=v_pd_no and exch_group_status="1";


    /* if @记录个数# > 1  then */
    if v_record_count > 1  then

       /* set @交易组编号# = 0; */
       set v_exch_group_no = 0;
    else

       /* set @交易组编号# = @默认交易组编号#; */
       set v_exch_group_no = v_default_exch_group_no;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取同步资金所需交易组编号串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetSyncAsacCaptExgpNoStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetSyncAsacCaptExgpNoStr(
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
    OUT p_error_info varchar(255),
    OUT p_exch_group_no_str varchar(2048)
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
    declare v_exch_group_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no_str = " ";

    
    label_pro:BEGIN
    

    /* set @交易组编号串#=" "; */
    set v_exch_group_no_str=" ";

    /* if @交易组编号#=0 then */
    if v_exch_group_no=0 then

        /* select GROUP_CONCAT({交易组编号} ORDER BY {记录序号} SEPARATOR ';') into @交易组编号串# from ~公共_用户_交易组信息表^ where {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组状态}=《交易组状态-正常》; */
        select GROUP_CONCAT(exch_group_no ORDER BY row_id SEPARATOR ';') into v_exch_group_no_str from db_pub.tb_user_exch_group_info where co_no=v_co_no and pd_no=v_pd_no and exch_group_status="1";
    end if;

    /* set @交易组编号串#=concat(@交易组编号串#,";;"); */
    set v_exch_group_no_str=concat(v_exch_group_no_str,";;");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no_str = v_exch_group_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取当日上市申购代码串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetCurDayBeginTradeAppStockStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetCurDayBeginTradeAppStockStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_trade_date int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no_str varchar(4096),
    OUT p_trade_code_no_str varchar(4096)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_begin_trade_date int;
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no_str varchar(4096);
    declare v_trade_code_no_str varchar(4096);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no_str = " ";
    SET v_trade_code_no_str = " ";

    
    label_pro:BEGIN
    
        #select GROUP_CONCAT({证券代码编号}  SEPARATOR ';') into @证券代码编号串# from ~公共_证券基础数据_证券新股代码信息表^ where {市场编号}=@市场编号# and {上市日期}=@上市日期#;

    /* set @证券代码编号串#=" "; */
    set v_stock_code_no_str=" ";

    /* set @交易代码编号串#=" "; */
    set v_trade_code_no_str=" ";

        /* select GROUP_CONCAT(a.{证券代码编号}  SEPARATOR ';'),GROUP_CONCAT(b.{证券代码编号}  SEPARATOR ';') into @证券代码编号串#,@交易代码编号串#  from ~公共_证券基础数据_证券新股代码信息表^  a, ~公共_证券基础数据_证券代码信息表^ b  where a.{市场编号}=@市场编号# and a.{上市日期}=@上市日期#  and  a.{市场编号}=b.{市场编号} and a.{交易代码}=b.{证券代码}; */
        select GROUP_CONCAT(a.stock_code_no  SEPARATOR ';'),GROUP_CONCAT(b.stock_code_no  SEPARATOR ';') into v_stock_code_no_str,v_trade_code_no_str  from db_pub.tb_basesedt_new_stock_code_info  a, db_pub.tb_basesedt_stock_code_info b  where a.exch_no=v_exch_no and a.begin_trade_date=v_begin_trade_date  and  a.exch_no=b.exch_no and a.trade_code=b.stock_code;

    /* set @证券代码编号串#=IFNULL(@证券代码编号串#," "); */
    set v_stock_code_no_str=IFNULL(v_stock_code_no_str," ");

    /* set @证券代码编号串#=concat(";",@证券代码编号串#,";"); */
    set v_stock_code_no_str=concat(";",v_stock_code_no_str,";");

    /* set @交易代码编号串#=IFNULL(@交易代码编号串#," "); */
    set v_trade_code_no_str=IFNULL(v_trade_code_no_str," ");

    /* set @交易代码编号串#=concat(";",@交易代码编号串#,";"); */
    set v_trade_code_no_str=concat(";",v_trade_code_no_str,";");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no_str = v_stock_code_no_str;
    SET p_trade_code_no_str = v_trade_code_no_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_获取产品下交易组权重值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_GetExgpWeightValueOfPd;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_GetExgpWeightValueOfPd(
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
    OUT p_exch_group_no_str varchar(2048),
    OUT p_weight_value_str varchar(255)
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
    declare v_exch_group_no_str varchar(2048);
    declare v_weight_value_str varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no_str = " ";
    SET v_weight_value_str = " ";

    
    label_pro:BEGIN
    

    /* set @交易组编号串#=""; */
    set v_exch_group_no_str="";

    /* set @权重串#=""; */
    set v_weight_value_str="";

        /* select GROUP_CONCAT({交易组编号} ORDER BY {记录序号} SEPARATOR ';'),GROUP_CONCAT({权重值} ORDER BY {记录序号} SEPARATOR ';') into @交易组编号串#,@权重串# from ~公共_用户_交易组信息表^ where {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组状态}=《交易组状态-正常》; */
        select GROUP_CONCAT(exch_group_no ORDER BY row_id SEPARATOR ';'),GROUP_CONCAT(weight_value ORDER BY row_id SEPARATOR ';') into v_exch_group_no_str,v_weight_value_str from db_pub.tb_user_exch_group_info where co_no=v_co_no and pd_no=v_pd_no and exch_group_status="1";

    /* set @交易组编号串#=concat(@交易组编号串#,";;"); */
    set v_exch_group_no_str=concat(v_exch_group_no_str,";;");

    /* set @权重串#=concat(@权重串#,";;"); */
    set v_weight_value_str=concat(v_weight_value_str,";;");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no_str = v_exch_group_no_str;
    SET p_weight_value_str = v_weight_value_str;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_根据产品查询交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_QueryExgpInfoByPd;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_QueryExgpInfoByPd(
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

    /* [获取表记录][公共_用户_交易组信息表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{交易组编号},{机构编号},{交易组编码},{交易组名称},{交易组状态},{产品编号},{交易组产品份额},{期初净资产} AS {交易组期初净资产},{更新次数}][{机构编号}=@机构编号#  and (@产品编号# = 0 or {产品编号}=@产品编号#)  and  {交易组状态}=《交易组状态-正常》  order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,exch_group_no,co_no,exch_group_code,exch_group_name,exch_group_status,pd_no,exch_group_pd_share,begin_NAV AS exch_group_begin_NAV,update_times from db_pub.tb_user_exch_group_info where co_no=v_co_no  and (v_pd_no = 0 or pd_no=v_pd_no)  and  exch_group_status="1"  order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,exch_group_no,co_no,exch_group_code,exch_group_name,exch_group_status,pd_no,exch_group_pd_share,begin_NAV AS exch_group_begin_NAV,update_times from db_pub.tb_user_exch_group_info where co_no=v_co_no  and (v_pd_no = 0 or pd_no=v_pd_no)  and  exch_group_status="1"  order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_公共接口_更新系统状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pubif_UpdateSysStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_pubif_UpdateSysStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_sys_status varchar(2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_update_times int,
    OUT p_old_sys_status varchar(2)
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
    declare v_sys_status varchar(2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_times int;
    declare v_old_sys_status varchar(2);
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
    SET v_sys_status = p_sys_status;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;
    SET v_old_sys_status = "0";
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
    

    /* [获取流水变动][{系统状态}][@系统状态#] */
    set v_jour_occur_field = concat("系统状态","|");
    set v_jour_occur_info = concat(v_sys_status,"|");


    /* [获取表记录变量语句][公共_基础_系统信息表][{系统状态},{更新次数}][@原系统状态#,@更新次数#][1=1] */
    select sys_status,update_times into v_old_sys_status,v_update_times from db_pub.tb_base_sys_info where 1=1 limit 1;


    /* if @系统状态# <> @原系统状态#  then */
    if v_sys_status <> v_old_sys_status  then

       /* [更新表记录][公共_基础_系统信息表][{系统状态}=@系统状态#][1=1][2][" "] */
       set v_update_date = date_format(curdate(),'%Y%m%d');
       set v_update_time = date_format(curtime(),'%H%i%s');
       update db_pub.tb_base_sys_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sys_status=v_sys_status where 1=1;
       if v_error_code = "1" then
                   
           SET v_error_code = "pubA.24.220.2";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(" ","#",v_mysql_message);
           else
               SET v_error_info = " ";
           end if;
           leave label_pro;
       end if;


       /* [获取流水后信息][@系统状态#] */
       set v_jour_after_occur_info = concat(v_sys_status,"|");


       /* set @操作菜单# = @菜单编号#; */
       set v_oper_menu_no = v_menu_no;

       /* set @操作功能# = @功能编码#; */
       set v_oper_func_code = v_func_code;

       /* [插入表记录][公共_基础_系统信息流水表][字段][字段变量][5][" "] */
       set v_create_date = date_format(curdate(),'%Y%m%d');
       set v_create_time = date_format(curtime(),'%H%i%s');
       set v_update_date = v_create_date;
       set v_update_time = v_create_time;
       set v_update_times = 1;
       insert into db_pub.tb_base_sys_info_jour(
           create_date, create_time, update_date, 
           update_time, update_times, opor_co_no, opor_no, 
           oper_mac, oper_ip_addr, oper_info, oper_way, 
           oper_menu_no, oper_func_code, init_date, jour_occur_field, 
           jour_after_occur_info, oper_remark_info) 
       value( 
           v_create_date, v_create_time, v_update_date, 
           v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
           v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
           v_oper_menu_no, v_oper_func_code, v_init_date, v_jour_occur_field, 
           v_jour_after_occur_info, v_oper_remark_info);
       if v_error_code = "1" then
                   
           SET v_error_code = "pubA.24.220.5";
           SET v_error_info =  CONCAT(" ","#",v_mysql_message);
           leave label_pro;
       end if;

    end if;

    /* [获取表记录变量语句][公共_基础_系统信息表][{更新次数}][@更新次数#][1=1] */
    select update_times into v_update_times from db_pub.tb_base_sys_info where 1=1 limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_update_times = v_update_times;
    SET p_old_sys_status = v_old_sys_status;

END;;


