DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_计算估值产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_calcPdFee;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_calcPdFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_nav_asset decimal(18,4),
    IN p_total_asset decimal(18,4),
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
    declare v_nav_asset decimal(18,4);
    declare v_total_asset decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_remark_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_pd_fee_type int;
    declare v_pd_fee_rate decimal(18,12);
    declare v_pd_fee_circle int;
    declare v_min_fee decimal(18,4);
    declare v_fina_acco_code varchar(64);
    declare v_calc_fee_date_str varchar(4096);
    declare v_eva_calc_type int;
    declare v_begin_amt decimal(18,4);
    declare v_evalu_date int;
    declare v_payab_amt decimal(18,4);
    declare v_cash_bala decimal(18,4);
    declare v_acco_cash decimal(18,4);
    declare v_stock_market_value decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_accumulative_receivable decimal(18,4);
    declare v_accumulative_payable decimal(18,4);
    declare v_apply_amt decimal(18,4);
    declare v_redemp_amt decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_out_total_asset decimal(18,4);
    declare v_last_init_date int;
    declare v_inteval_days int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_nav_asset = p_nav_asset;
    SET v_total_asset = p_total_asset;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_remark_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pd_fee_type = 0;
    SET v_pd_fee_rate = 0;
    SET v_pd_fee_circle = 0;
    SET v_min_fee = 0;
    SET v_fina_acco_code = " ";
    SET v_calc_fee_date_str = " ";
    SET v_eva_calc_type = 0;
    SET v_begin_amt = 0;
    SET v_evalu_date = date_format(curdate(),'%Y%m%d');
    SET v_payab_amt = 0;
    SET v_cash_bala = 0;
    SET v_acco_cash = 0;
    SET v_stock_market_value = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_accumulative_receivable = 0;
    SET v_accumulative_payable = 0;
    SET v_apply_amt = 0;
    SET v_redemp_amt = 0;
    SET v_futu_asset = 0;
    SET v_out_total_asset = 0;
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');
    SET v_inteval_days = 0;

    
    label_pro:BEGIN
    

    /* set @备注信息#=' '; */
    set v_remark_info=' ';
    #初始化估值产品费用表当前金额

    /* [更新表记录][平台估值_估值汇总_估值产品费用表][{当前金额} = {期初金额}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {手工标志}=0][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evatotal_pd_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = begin_amt where co_no=v_co_no and pd_no=v_pd_no and manual_flag=0;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.1.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #对估值产品费用表里的记录游标循环处理

    /* [声明游标][平台估值_基础参数_估值产品费率表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号#][cursor_eva_product_fee] */
    cursor_eva_product_fee:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_product_fee CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_fee_type, pd_fee_rate, pd_fee_circle, 
        min_fee, fina_acco_code, calc_fee_date_str, eva_calc_type, 
        remark_info 
        from db_eva.tb_evabasic_product_fee 
        where co_no=v_co_no and pd_no=v_pd_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_eva_product_fee][loop_eva_product_fee] */
    open cursor_eva_product_fee;
    loop_eva_product_fee: LOOP
    fetch cursor_eva_product_fee into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_pd_fee_type, v_pd_fee_rate, v_pd_fee_circle, 
        v_min_fee, v_fina_acco_code, v_calc_fee_date_str, v_eva_calc_type, 
        v_remark_info;
        IF v_cursor_done THEN
            LEAVE loop_eva_product_fee;
        END IF;


    /* if @扣费日期串#=" " then */
    if v_calc_fee_date_str=" " then
         #获取上一日费用初始值

         /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品费用表][{当前金额}-{确认金额},{备注信息}][@期初金额#,@备注信息#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型# and {初始化日期}<@估值日期# order by {初始化日期} desc] */
         select curr_amt-confirm_apply,remark_info into v_begin_amt,v_remark_info from db_eva_his.tb_evatotal_pd_fee_total_his where co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type and init_date<v_evalu_date order by init_date desc limit 1;


         /* set @应付金额# = round(@净资产# * @产品费用费率#/@产品计费周期#,2); */
         set v_payab_amt = round(v_nav_asset * v_pd_fee_rate/v_pd_fee_circle,2);

         /* if @最低费用#>@应付金额# then */
         if v_min_fee>v_payab_amt then

            /* set @应付金额#=@最低费用#; */
            set v_payab_amt=v_min_fee;
          end if;

        /* [更新表记录][平台估值_估值汇总_估值产品费用表][{当前金额} = @期初金额# + @应付金额#,{期初金额}=@期初金额#,{产品净资产}=@净资产#,{备注信息}=@备注信息#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型# and {手工标志}=0][2][concat("更新估值产品费用表记录错误！【机构编号】=", @机构编号#,"【产品编号】=",@产品编号#,"【产品费用类型】=",@产品费用类型#)] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_eva.tb_evatotal_pd_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = v_begin_amt + v_payab_amt,begin_amt=v_begin_amt,pd_net_asset=v_nav_asset,remark_info=v_remark_info where co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type and manual_flag=0;
        if v_error_code = "1" then
                    
            SET v_error_code = "evaA.3.1.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type);
            end if;
            close cursor_eva_product_fee;
            leave label_pro;
        end if;


         /* if @产品费用类型# =《产品费用类型-应交税金》 then */
         if v_pd_fee_type =21 then

            /* [获取表记录变量语句][平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}),0)][@现金余额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and  {产品账户类型} =《产品账户类型-银行账户》] */
            select ifnull(sum(curr_amt),0) into v_cash_bala from db_eva.tb_evadata_pd_acco_capit where co_no=v_co_no and pd_no=v_pd_no  and  pd_acco_type =1 limit 1;

            #取产品账户资金

            /* [获取表记录变量语句][平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}), 0)][@账户余额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {产品账户类型} in (《产品账户类型-证券账户》,《产品账户类型-期货账户》)] */
            select ifnull(sum(curr_amt), 0) into v_acco_cash from db_eva.tb_evadata_pd_acco_capit where co_no=v_co_no and pd_no=v_pd_no  and pd_acco_type in (2,3) limit 1;

           #取股票资产

            /* if @机构编号#=6808 then */
            if v_co_no=6808 then

            /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*{最新价}*{汇率}), 0)][@股票市值#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {证券类型} in（《证券类型-股票》,《证券类型-申购》)] */
            select ifnull(sum(curr_qty*last_price*exch_rate), 0) into v_stock_market_value from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no  and stock_type in(1,2) limit 1;

            else

            /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*round({最新价}*{汇率},2)), 0)][@股票市值#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {证券类型} in（《证券类型-股票》,《证券类型-申购》)] */
            select ifnull(sum(curr_qty*round(last_price*exch_rate,2)), 0) into v_stock_market_value from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no  and stock_type in(1,2) limit 1;

            end if;
           #取基金资产

           /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*{最新价}), 0)][@基金资产#][ {机构编号}=@机构编号# and {产品编号}=@产品编号#  and {证券类型} in (《证券类型-ETF基金》,《证券类型-货币ETF基金》,《证券类型-封闭式基金》,《证券类型-分级基金》,《证券类型-普通货币基金》,《证券类型-黄金ETF基金》,《证券类型-普通开放式基金》,《证券类型-债券ETF基金》)] */
           select ifnull(sum(curr_qty*last_price), 0) into v_fund_asset from db_eva.tb_evadata_pd_secu_posi where  co_no=v_co_no and pd_no=v_pd_no  and stock_type in (52,57,51,54,63,60,62,64) limit 1;

           #取债券资产

           /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*{最新价}), 0)][@债券资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {证券类型}  in (《证券类型-公司债》,《证券类型-企业债》,《证券类型-可转债》,《证券类型-可交换公司债》,《证券类型-回购标准券》,《证券类型-债券申购》)] */
           select ifnull(sum(curr_qty*last_price), 0) into v_bond_asset from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no  and stock_type  in (23,22,24,41,27,32) limit 1;

            #取累计应收

            /* [获取表记录变量语句][平台估值_估值汇总_估值产品利息表][ifnull(sum({当前金额}-{确认金额}), 0)][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#] */
            select ifnull(sum(curr_amt-confirm_apply), 0) into v_accumulative_receivable from db_eva.tb_evatotal_pd_interest_total where co_no=v_co_no and pd_no=v_pd_no limit 1;

            #保障基金账户作为应收

            /* [获取表记录变量语句][平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}),0)+@累计应收额#][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and  {产品账户类型} =《产品账户类型-金融资产账户》] */
            select ifnull(sum(curr_amt),0)+v_accumulative_receivable into v_accumulative_receivable from db_eva.tb_evadata_pd_acco_capit where co_no=v_co_no and pd_no=v_pd_no  and  pd_acco_type =11 limit 1;

            #债券利息作为应收

           /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][ifnull(sum({利息收益}),0)+@累计应收额#][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {证券类型}  in (《证券类型-公司债》,《证券类型-企业债》,《证券类型-可交换公司债》,《证券类型-回购标准券》)] */
           select ifnull(sum(intrst_pandl),0)+v_accumulative_receivable into v_accumulative_receivable from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no  and stock_type  in (23,22,41,27) limit 1;

            #取累计应付

            /* [获取表记录变量语句][平台估值_估值汇总_估值产品费用表][ifnull(sum({当前金额}-{确认金额}),0)][@累计应付额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# ] */
            select ifnull(sum(curr_amt-confirm_apply),0) into v_accumulative_payable from db_eva.tb_evatotal_pd_fee_total where co_no=v_co_no and pd_no=v_pd_no  limit 1;

            #应付暂存账户作为应付

            /* [获取表记录变量语句][平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}),0)+@累计应付额#][@累计应付额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and  {产品账户类型} =《产品账户类型-应付暂存账户》] */
            select ifnull(sum(curr_amt),0)+v_accumulative_payable into v_accumulative_payable from db_eva.tb_evadata_pd_acco_capit where co_no=v_co_no and pd_no=v_pd_no  and  pd_acco_type =12 limit 1;

            #份额增加作为申购应收金额

           /* [获取表记录变量语句][平台估值_基础参数_估值产品份额流水表][ifnull(sum({变动金额}),0)][@申购应收金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {份额操作}=《份额操作-申购》 and @估值日期# >= {初始化日期} and @估值日期# ={到账日期}] */
           select ifnull(sum(occur_amt),0) into v_apply_amt from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and pd_no=v_pd_no  and share_oper=1 and v_evalu_date >= init_date and v_evalu_date =arrive_date limit 1;

            #份额减少作为赎回应付金额

           /* [获取表记录变量语句][平台估值_基础参数_估值产品份额流水表][ifnull(sum({变动金额}),0)][@赎回应付金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {份额操作}=《份额操作-赎回》 and @估值日期# >= {初始化日期} and  @估值日期# ={到账日期}] */
           select ifnull(sum(occur_amt),0) into v_redemp_amt from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and pd_no=v_pd_no  and share_oper=2 and v_evalu_date >= init_date and  v_evalu_date =arrive_date limit 1;


           /* set @期货资产#=0; */
           set v_futu_asset=0;

           /* [获取表记录变量语句][平台估值_业务数据_估值产品期货持仓表][ifnull(sum((case {多空类型} when 《多空类型-空头》 then {昨结算价} - {结算价} else {结算价} -{昨结算价} end)*{当前数量}*{合约乘数}), 0)][@期货资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号#] */
           select ifnull(sum((case lngsht_type when 2 then pre_settle_price - sett_price else sett_price -pre_settle_price end)*curr_qty*contrc_unit), 0) into v_futu_asset from db_eva.tb_evadata_pd_fupo_posi where co_no=v_co_no and pd_no=v_pd_no limit 1;


            /* set @外部总资产#=@现金余额#+@账户余额#+@股票市值#+@基金资产#+@债券资产#+@期货资产#-@申购应收金额#+@赎回应付金额#; */
            set v_out_total_asset=v_cash_bala+v_acco_cash+v_stock_market_value+v_fund_asset+v_bond_asset+v_futu_asset-v_apply_amt+v_redemp_amt;

            /* set @应付金额# = round(（@外部总资产#-@总资产#)/1.03*0.03,2); */
            set v_payab_amt = round((v_out_total_asset-v_total_asset)/1.03*0.03,2);

           /* [更新表记录][平台估值_估值汇总_估值产品费用表][{当前金额} = case when (@期初金额# + @应付金额#)>0 then @期初金额# + @应付金额# else 0 end,{期初金额}=@期初金额#,{产品净资产}=@外部总资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型# and {手工标志}=0][2][concat("更新估值产品费用表记录错误！【机构编号】=", @机构编号#,"【产品编号】=",@产品编号#,"【产品费用类型】=",@产品费用类型#)] */
           set v_update_date = date_format(curdate(),'%Y%m%d');
           set v_update_time = date_format(curtime(),'%H%i%s');
           update db_eva.tb_evatotal_pd_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = case when (v_begin_amt + v_payab_amt)>0 then v_begin_amt + v_payab_amt else 0 end,begin_amt=v_begin_amt,pd_net_asset=v_out_total_asset where co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type and manual_flag=0;
           if v_error_code = "1" then
                       
               SET v_error_code = "evaA.3.1.2";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type),"#",v_mysql_message);
               else
                   SET v_error_info = concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type);
               end if;
               close cursor_eva_product_fee;
               leave label_pro;
           end if;

        end if;
    else

        /* if (instr(@扣费日期串#,@估值日期#)>0) then */
        if (instr(v_calc_fee_date_str,v_evalu_date)>0) then
         #获取上一日费用初始值

         /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品费用表][{当前金额}-{确认金额},{初始化日期}][@期初金额#,@上日初始化日期#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型# and {初始化日期}<@估值日期#  and {当前金额}>0 order by {初始化日期} desc] */
         select curr_amt-confirm_apply,init_date into v_begin_amt,v_last_init_date from db_eva_his.tb_evatotal_pd_fee_total_his where co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type and init_date<v_evalu_date  and curr_amt>0 order by init_date desc limit 1;

         #计算上次到现在已经过了多少天

         /* set  @间隔天数#=datediff(@估值日期#,@上日初始化日期#); */
         set  v_inteval_days=datediff(v_evalu_date,v_last_init_date);

          /* if @净值计算方式#=《净值计算方式-前日净资产》 then */
          if v_eva_calc_type=1 then

             /* set @应付金额# = round(@净资产# * @产品费用费率#/@产品计费周期#*@间隔天数#,2); */
             set v_payab_amt = round(v_nav_asset * v_pd_fee_rate/v_pd_fee_circle*v_inteval_days,2);

             /* [更新表记录][平台估值_估值汇总_估值产品费用表][{当前金额} = @期初金额# + @应付金额#,{期初金额}=@期初金额#,{产品净资产}=@净资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型# and {手工标志}=0][2][concat("更新估值产品费用表记录错误！【机构编号】=", @机构编号#,"【产品编号】=",@产品编号#,"【产品费用类型】=",@产品费用类型#)] */
             set v_update_date = date_format(curdate(),'%Y%m%d');
             set v_update_time = date_format(curtime(),'%H%i%s');
             update db_eva.tb_evatotal_pd_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = v_begin_amt + v_payab_amt,begin_amt=v_begin_amt,pd_net_asset=v_nav_asset where co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type and manual_flag=0;
             if v_error_code = "1" then
                         
                 SET v_error_code = "evaA.3.1.2";
                 if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type),"#",v_mysql_message);
                 else
                     SET v_error_info = concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type);
                 end if;
                 close cursor_eva_product_fee;
                 leave label_pro;
             end if;


          /* elseif @净值计算方式#=《净值计算方式-当日资产》 then */
          elseif v_eva_calc_type=2 then

            /* 调用【原子_平台估值_估值汇总_获取估值产品总资产】*/
            call db_eva.pra_evatotal_getPdTotalAseet(
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
                v_total_asset);
            if v_error_code = "1" then
                SET v_error_code = "evaA.3.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取估值产品总资产出现错误！',v_mysql_message);
                end if;
                close cursor_eva_product_fee;
                leave label_pro;
            elseif v_error_code <> "0" then
                close cursor_eva_product_fee;
                leave label_pro;
            end if;


            /* set @应付金额# = round(@总资产# * @产品费用费率#/@产品计费周期#*@间隔天数#,2); */
            set v_payab_amt = round(v_total_asset * v_pd_fee_rate/v_pd_fee_circle*v_inteval_days,2);

            /* [更新表记录][平台估值_估值汇总_估值产品费用表][{当前金额} = @期初金额# + @应付金额#,{期初金额}=@期初金额#,{产品净资产}=@总资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型# and {手工标志}=0][2][concat("更新估值产品费用表记录错误！【机构编号】=", @机构编号#,"【产品编号】=",@产品编号#,"【产品费用类型】=",@产品费用类型#)] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_eva.tb_evatotal_pd_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = v_begin_amt + v_payab_amt,begin_amt=v_begin_amt,pd_net_asset=v_total_asset where co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type and manual_flag=0;
            if v_error_code = "1" then
                        
                SET v_error_code = "evaA.3.1.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type);
                end if;
                close cursor_eva_product_fee;
                leave label_pro;
            end if;

           end if;
       else

          /* [更新表记录][平台估值_估值汇总_估值产品费用表][{当前金额} = 0,{期初金额}=0,{产品净资产}=@净资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型# and {手工标志}=0][2][concat("更新估值产品费用表记录错误！【机构编号】=", @机构编号#,"【产品编号】=",@产品编号#,"【产品费用类型】=",@产品费用类型#)] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_eva.tb_evatotal_pd_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = 0,begin_amt=0,pd_net_asset=v_nav_asset where co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type and manual_flag=0;
          if v_error_code = "1" then
                      
              SET v_error_code = "evaA.3.1.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type);
              end if;
              close cursor_eva_product_fee;
              leave label_pro;
          end if;

       end if;
    end if;

    /* [关闭游标][cursor_eva_product_fee] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_product_fee;
    end cursor_eva_product_fee;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_计算估值产品利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_calcPdRate;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_calcPdRate(
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
    

     /* update ~平台估值_业务数据_估值产品账户资金表^ a,~平台估值_基础参数_估值产品利率表^ b set a.{预计利息}=GREATEST(round(a.{当前金额}*b.{利率}/b.{产品计费周期},2),b.{最低利息}) where a.{机构编号} = b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{资产账户} =b.{资产账户} and a.{机构编号} = @机构编号# and a.{产品编号} = @产品编号#; */
     update db_eva.tb_evadata_pd_acco_capit a,db_eva.tb_evabasic_product_rate b set a.intrst_cacl_amt=GREATEST(round(a.curr_amt*b.intrst_rate/b.pd_fee_circle,2),b.min_interest) where a.co_no = b.co_no and a.pd_no=b.pd_no and a.asset_acco =b.asset_acco and a.co_no = v_co_no and a.pd_no = v_pd_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_统计估值产品利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_sumPdRate;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_sumPdRate(
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
    declare v_asset_acco varchar(16);
    declare v_begin_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);
    declare v_evalu_date int;
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
    SET v_asset_acco = " ";
    SET v_begin_amt = 0;
    SET v_intrst_cacl_amt = 0;
    SET v_evalu_date = date_format(curdate(),'%Y%m%d');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [声明游标][平台估值_基础参数_估值产品利率表][{资产账户}][{机构编号}=@机构编号# and {产品编号}=@产品编号#][cursor_eva_product_rate] */
    cursor_eva_product_rate:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_product_rate CURSOR FOR
        select asset_acco 
        from db_eva.tb_evabasic_product_rate 
        where co_no=v_co_no and pd_no=v_pd_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@资产账户#][cursor_eva_product_rate][loop_eva_product_rate] */
    open cursor_eva_product_rate;
    loop_eva_product_rate: LOOP
    fetch cursor_eva_product_rate into v_asset_acco;
        IF v_cursor_done THEN
            LEAVE loop_eva_product_rate;
        END IF;


         /* set @期初金额#=0; */
         set v_begin_amt=0;

         /* set @预计利息#=0; */
         set v_intrst_cacl_amt=0;
        #获取上日初始值

        /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品利息表][{当前金额}-{确认金额}][@期初金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@估值日期# and {资产账户}=@资产账户# order by {初始化日期} desc] */
        select curr_amt-confirm_apply into v_begin_amt from db_eva_his.tb_evatotal_pd_interest_total_his where co_no=v_co_no and pd_no=v_pd_no and init_date<v_evalu_date and asset_acco=v_asset_acco order by init_date desc limit 1;

       #初始化估值产品利息表当前金额

       /* [更新表记录][平台估值_估值汇总_估值产品利息表][{当前金额} = @期初金额#,{期初金额}=@期初金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户}=@资产账户# and {手工标志}=0][2][@产品编号#] */
       set v_update_date = date_format(curdate(),'%Y%m%d');
       set v_update_time = date_format(curtime(),'%H%i%s');
       update db_eva.tb_evatotal_pd_interest_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = v_begin_amt,begin_amt=v_begin_amt where co_no=v_co_no and pd_no=v_pd_no and asset_acco=v_asset_acco and manual_flag=0;
       if v_error_code = "1" then
                   
           SET v_error_code = "evaA.3.3.2";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
           else
               SET v_error_info = concat("产品编号=",v_pd_no);
           end if;
           close cursor_eva_product_rate;
           leave label_pro;
       end if;


    /* [关闭游标][cursor_eva_product_rate] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_product_rate;
    end cursor_eva_product_rate;


    /* update ~平台估值_估值汇总_估值产品利息表^ a ,~平台估值_业务数据_估值产品账户资金表^ b set a.{当前金额} = a.{当前金额} + b.{预计利息} where a.{机构编号} = b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{资产账户} =b.{资产账户} and a.{机构编号} = @机构编号# and a.{产品编号} = @产品编号# and a.{手工标志}=0; */
    update db_eva.tb_evatotal_pd_interest_total a ,db_eva.tb_evadata_pd_acco_capit b set a.curr_amt = a.curr_amt + b.intrst_cacl_amt where a.co_no = b.co_no and a.pd_no=b.pd_no and a.asset_acco =b.asset_acco and a.co_no = v_co_no and a.pd_no = v_pd_no and a.manual_flag=0;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_获取产品上日资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_getProductPreNet;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_getProductPreNet(
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
    OUT p_error_info varchar(255),
    OUT p_nav_asset decimal(18,4),
    OUT p_total_asset decimal(18,4)
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
    

    /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品资产信息表][ifnull({净资产},0),ifnull({总资产},0)][@净资产#,@总资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@估值日期# order by {初始化日期} desc] */
    select ifnull(nav_asset,0),ifnull(total_asset,0) into v_nav_asset,v_total_asset from db_eva_his.tb_evatotal_product_asset_info_his where co_no=v_co_no and pd_no=v_pd_no and init_date<v_evalu_date order by init_date desc limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_nav_asset = v_nav_asset;
    SET p_total_asset = v_total_asset;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_生成估值产品资产信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_createPdAseetInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_createPdAseetInfo(
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
    declare v_init_date int;
    declare v_total_unit_nav decimal(18,4);
    declare v_total_cash_divide decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_pd_curr_share decimal(18,2);
    declare v_config_value varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_cash_bala decimal(18,4);
    declare v_acco_cash decimal(18,4);
    declare v_stock_market_value decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_accumulative_receivable decimal(18,4);
    declare v_accumulative_payable decimal(18,4);
    declare v_apply_amt decimal(18,4);
    declare v_redemp_amt decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_option_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_total_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_unit_nav decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_cash_coeffi decimal(18,12);
    declare v_share_coeffi decimal(18,12);
    declare v_net_prefee_coeffi decimal(18,12);
    declare v_pre_fee_share_net_total decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_total_unit_nav = 0;
    SET v_total_cash_divide = 0;
    SET v_remark_info = " ";
    SET v_pd_curr_share = 0;
    SET v_config_value = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_cash_bala = 0;
    SET v_acco_cash = 0;
    SET v_stock_market_value = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_accumulative_receivable = 0;
    SET v_accumulative_payable = 0;
    SET v_apply_amt = 0;
    SET v_redemp_amt = 0;
    SET v_futu_asset = 0;
    SET v_option_asset = 0;
    SET v_other_asset = 0;
    SET v_total_asset = 0;
    SET v_nav_asset = 0;
    SET v_unit_nav = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_cash_coeffi = 0;
    SET v_share_coeffi = 0;
    SET v_net_prefee_coeffi = 0;
    SET v_pre_fee_share_net_total = 0;

    
    label_pro:BEGIN
    

           /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
           set v_init_date=date_format(curdate(),'%Y%m%d');

           /* set @累计单位净值#=0; */
           set v_total_unit_nav=0;

           /* set @累计派现金额#=0; */
           set v_total_cash_divide=0;

           /* set @备注信息#=''; */
           set v_remark_info='';
            #统计获取产品历史份额

            /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品资产信息表][ifnull({产品当前份额},0)][@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@估值日期# order by {初始化日期} desc][4][@产品编号#] */
            select ifnull(pd_curr_share,0) into v_pd_curr_share from db_eva_his.tb_evatotal_product_asset_info_his where co_no=v_co_no and pd_no=v_pd_no and init_date<v_evalu_date order by init_date desc limit 1;

            #[获取表记录变量语句][估值产品基本信息表][{产品当前份额}][@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][13030502][@产品编号#]
            #1005配置项直接从估值表取份额

           /* set @配置值#=0; */
           set v_config_value=0;

           /* [获取表记录变量语句][平台估值_基础参数_产品特殊配置表][{配置值}][@配置值#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {配置编号}=1005][4][@产品编号#] */
           select config_value into v_config_value from db_eva.tb_evabasic_pd_special_config where co_no=v_co_no and pd_no=v_pd_no and config_no=1005 limit 1;


           /* set @配置值#=ifnull(@配置值#,0); */
           set v_config_value=ifnull(v_config_value,0);

           /* if @配置值#=1 then */
           if v_config_value=1 then

               /* [获取表记录变量语句][平台估值_估值汇总_估值产品估值表资产项目表][replace({估值表产品当前份额},',','')][@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<=@估值日期# order by {初始化日期} desc][4][@产品编号#] */
               select replace(eva_pd_curr_share,',','') into v_pd_curr_share from db_eva.tb_evatotal_pd_fina_asset_info where co_no=v_co_no and pd_no=v_pd_no and init_date<=v_evalu_date order by init_date desc limit 1;

           end if;
           #更新期初份额

            /* [更新表记录][平台估值_基础参数_估值产品基本信息表][{产品期初份额} = @产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@产品编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_eva.tb_evabasic_product_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_begin_share = v_pd_curr_share where co_no=v_co_no and pd_no=v_pd_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "evaA.3.5.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("产品编号=",v_pd_no);
                end if;
                leave label_pro;
            end if;

            #如果没有就取当前份额

            /* if @产品当前份额#=0 then */
            if v_pd_curr_share=0 then

            /* [获取表记录变量语句][平台估值_基础参数_估值产品基本信息表][{产品当前份额}][@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][4][@产品编号#] */
            select pd_curr_share into v_pd_curr_share from db_eva.tb_evabasic_product_info where co_no=v_co_no and pd_no=v_pd_no limit 1;

            end if;
            #获取当日份额变动

            /* [获取表记录变量语句][平台估值_基础参数_估值产品份额流水表][ifnull(sum(case {变动方向} when 《变动方向-增加》 then {变动份额} else -1*{变动份额} end ),0)+@产品当前份额#][@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#][4][@产品编号#] */
            select ifnull(sum(case occur_dir when 1 then occur_share else -1*occur_share end ),0)+v_pd_curr_share into v_pd_curr_share from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date limit 1;

           #更新当前份额

            /* [更新表记录][平台估值_基础参数_估值产品基本信息表][{产品当前份额} = @产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@产品编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_eva.tb_evabasic_product_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_curr_share = v_pd_curr_share where co_no=v_co_no and pd_no=v_pd_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "evaA.3.5.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("产品编号=",v_pd_no);
                end if;
                leave label_pro;
            end if;

            #取产品现金余额

            /* [获取表记录变量语句][平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}),0)][@现金余额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and  {产品账户类型} =《产品账户类型-银行账户》] */
            select ifnull(sum(curr_amt),0) into v_cash_bala from db_eva.tb_evadata_pd_acco_capit where co_no=v_co_no and pd_no=v_pd_no  and  pd_acco_type =1 limit 1;

            #取产品账户资金

            /* [获取表记录变量语句][平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}), 0)][@账户余额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {产品账户类型} in (《产品账户类型-证券账户》,《产品账户类型-期货账户》)] */
            select ifnull(sum(curr_amt), 0) into v_acco_cash from db_eva.tb_evadata_pd_acco_capit where co_no=v_co_no and pd_no=v_pd_no  and pd_acco_type in (2,3) limit 1;

           #取股票资产

            /* if @机构编号#=6808 then */
            if v_co_no=6808 then

            /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*{最新价}*{汇率}), 0)][@股票市值#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {证券类型} in（《证券类型-股票》,《证券类型-申购》)] */
            select ifnull(sum(curr_qty*last_price*exch_rate), 0) into v_stock_market_value from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no  and stock_type in(1,2) limit 1;

            else

            /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*round({最新价}*{汇率},2)), 0)][@股票市值#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {证券类型} in（《证券类型-股票》,《证券类型-申购》)] */
            select ifnull(sum(curr_qty*round(last_price*exch_rate,2)), 0) into v_stock_market_value from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no  and stock_type in(1,2) limit 1;

            end if;
           #取基金资产

           /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*{最新价}), 0)][@基金资产#][ {机构编号}=@机构编号# and {产品编号}=@产品编号#  and {证券类型} in (《证券类型-ETF基金》,《证券类型-货币ETF基金》,《证券类型-封闭式基金》,《证券类型-分级基金》,《证券类型-普通货币基金》,《证券类型-黄金ETF基金》,《证券类型-普通开放式基金》,《证券类型-债券ETF基金》)] */
           select ifnull(sum(curr_qty*last_price), 0) into v_fund_asset from db_eva.tb_evadata_pd_secu_posi where  co_no=v_co_no and pd_no=v_pd_no  and stock_type in (52,57,51,54,63,60,62,64) limit 1;

           #取债券资产

           /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*{最新价}), 0)][@债券资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {证券类型}  in (《证券类型-公司债》,《证券类型-企业债》,《证券类型-可转债》,《证券类型-可交换公司债》,《证券类型-回购标准券》,《证券类型-债券申购》)] */
           select ifnull(sum(curr_qty*last_price), 0) into v_bond_asset from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no  and stock_type  in (23,22,24,41,27,32) limit 1;

            #取累计应收

            /* [获取表记录变量语句][平台估值_估值汇总_估值产品利息表][ifnull(sum({当前金额}-{确认金额}), 0)][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#] */
            select ifnull(sum(curr_amt-confirm_apply), 0) into v_accumulative_receivable from db_eva.tb_evatotal_pd_interest_total where co_no=v_co_no and pd_no=v_pd_no limit 1;

            #保障基金账户作为应收

            /* [获取表记录变量语句][平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}),0)+@累计应收额#][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and  {产品账户类型} =《产品账户类型-金融资产账户》] */
            select ifnull(sum(curr_amt),0)+v_accumulative_receivable into v_accumulative_receivable from db_eva.tb_evadata_pd_acco_capit where co_no=v_co_no and pd_no=v_pd_no  and  pd_acco_type =11 limit 1;

            #债券利息作为应收

           /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][ifnull(sum({利息收益}),0)+@累计应收额#][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {证券类型}  in (《证券类型-公司债》,《证券类型-企业债》,《证券类型-可交换公司债》,《证券类型-回购标准券》)] */
           select ifnull(sum(intrst_pandl),0)+v_accumulative_receivable into v_accumulative_receivable from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no  and stock_type  in (23,22,41,27) limit 1;

            #取累计应付

            /* [获取表记录变量语句][平台估值_估值汇总_估值产品费用表][ifnull(sum({当前金额}-{确认金额}),0)][@累计应付额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# ] */
            select ifnull(sum(curr_amt-confirm_apply),0) into v_accumulative_payable from db_eva.tb_evatotal_pd_fee_total where co_no=v_co_no and pd_no=v_pd_no  limit 1;

            #应付暂存账户作为应付

            /* [获取表记录变量语句][平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}),0)+@累计应付额#][@累计应付额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and  {产品账户类型} =《产品账户类型-应付暂存账户》] */
            select ifnull(sum(curr_amt),0)+v_accumulative_payable into v_accumulative_payable from db_eva.tb_evadata_pd_acco_capit where co_no=v_co_no and pd_no=v_pd_no  and  pd_acco_type =12 limit 1;

            #份额增加作为申购应收金额

           /* [获取表记录变量语句][平台估值_基础参数_估值产品份额流水表][ifnull(sum({变动金额}),0)][@申购应收金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {份额操作}=《份额操作-申购》 and @估值日期# >= {初始化日期} and @估值日期# <{到账日期}] */
           select ifnull(sum(occur_amt),0) into v_apply_amt from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and pd_no=v_pd_no  and share_oper=1 and v_evalu_date >= init_date and v_evalu_date <arrive_date limit 1;

            #份额减少作为赎回应付金额

           /* [获取表记录变量语句][平台估值_基础参数_估值产品份额流水表][ifnull(sum({变动金额}),0)][@赎回应付金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {份额操作}=《份额操作-赎回》 and @估值日期# >= {初始化日期} and  @估值日期# <{到账日期}] */
           select ifnull(sum(occur_amt),0) into v_redemp_amt from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and pd_no=v_pd_no  and share_oper=2 and v_evalu_date >= init_date and  v_evalu_date <arrive_date limit 1;


           /* set @期货资产#=0; */
           set v_futu_asset=0;

           /* [获取表记录变量语句][平台估值_业务数据_估值产品期货持仓表][ifnull(sum((case {多空类型} when 《多空类型-空头》 then {昨结算价} - {结算价} else {结算价} -{昨结算价} end)*{当前数量}*{合约乘数}), 0)][@期货资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号#] */
           select ifnull(sum((case lngsht_type when 2 then pre_settle_price - sett_price else sett_price -pre_settle_price end)*curr_qty*contrc_unit), 0) into v_futu_asset from db_eva.tb_evadata_pd_fupo_posi where co_no=v_co_no and pd_no=v_pd_no limit 1;


           /* set @期权资产#=0; */
           set v_option_asset=0;

           /* set @其他资产#=0; */
           set v_other_asset=0;

            /* set @总资产#=@现金余额#+@账户余额#+@股票市值#+@基金资产#+@债券资产#+@期货资产#+@期权资产#+@其他资产#; */
            set v_total_asset=v_cash_bala+v_acco_cash+v_stock_market_value+v_fund_asset+v_bond_asset+v_futu_asset+v_option_asset+v_other_asset;

            /* set @净资产#=@总资产#+@累计应收额#-@累计应付额#+@申购应收金额#-@赎回应付金额#; */
            set v_nav_asset=v_total_asset+v_accumulative_receivable-v_accumulative_payable+v_apply_amt-v_redemp_amt;

            /* set @单位净值#=ifnull(round(@净资产#/@产品当前份额#, 4), 0); */
            set v_unit_nav=ifnull(round(v_nav_asset/v_pd_curr_share, 4), 0);

            /* [插入重复更新][平台估值_估值汇总_估值产品资产信息表][字段][字段变量][{产品当前份额}=@产品当前份额#,{总资产}=@总资产#,{净资产}=@净资产#,{现金余额}=@现金余额#,{账户余额}=@账户余额#,{股票市值}=@股票市值#,{基金资产}=@基金资产#,{债券资产}=@债券资产#,{期货资产}=@期货资产#,{累计应付额}=@累计应付额#,{累计应收额}=@累计应收额#,{申购应收金额}=@申购应收金额#,{赎回应付金额}=@赎回应付金额#,{单位净值}=@单位净值#,{累计派现金额}=@累计派现金额#,{累计单位净值}=@累计单位净值#][2]["更新估值产品资产信息记录错误！"] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_eva.tb_evatotal_product_asset_info (
                create_date, create_time, update_date, 
                update_time, update_times, init_date, co_no, 
                pd_no, pd_curr_share, total_asset, nav_asset, 
                cash_bala, acco_cash, stock_market_value, fund_asset, 
                bond_asset, futu_asset, option_asset, other_asset, 
                accumulative_receivable, accumulative_payable, apply_amt, redemp_amt, 
                unit_nav, total_cash_divide, total_unit_nav, remark_info) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_init_date, v_co_no, 
                v_pd_no, v_pd_curr_share, v_total_asset, v_nav_asset, 
                v_cash_bala, v_acco_cash, v_stock_market_value, v_fund_asset, 
                v_bond_asset, v_futu_asset, v_option_asset, v_other_asset, 
                v_accumulative_receivable, v_accumulative_payable, v_apply_amt, v_redemp_amt, 
                v_unit_nav, v_total_cash_divide, v_total_unit_nav, v_remark_info) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pd_curr_share=v_pd_curr_share,total_asset=v_total_asset,nav_asset=v_nav_asset,cash_bala=v_cash_bala,acco_cash=v_acco_cash,stock_market_value=v_stock_market_value,fund_asset=v_fund_asset,bond_asset=v_bond_asset,futu_asset=v_futu_asset,accumulative_payable=v_accumulative_payable,accumulative_receivable=v_accumulative_receivable,apply_amt=v_apply_amt,redemp_amt=v_redemp_amt,unit_nav=v_unit_nav,total_cash_divide=v_total_cash_divide,total_unit_nav=v_total_unit_nav;
            if v_error_code = "1" then
                        
                SET v_error_code = "evaA.3.5.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT("更新估值产品资产信息记录错误！","#",v_mysql_message);
                else
                    SET v_error_info = "更新估值产品资产信息记录错误！";
                end if;
                leave label_pro;
            end if;


            /* set @现金分红系数#=0; */
            set v_cash_coeffi=0;

            /* set @份额分红系数#=1; */
            set v_share_coeffi=1;

            /* set @费前累计净值系数#=1; */
            set v_net_prefee_coeffi=1;

            /* set @累计单位净值#=@单位净值#; */
            set v_total_unit_nav=v_unit_nav;

            /* set @费前累计净值#=@单位净值#; */
            set v_pre_fee_share_net_total=v_unit_nav;

            /* [插入重复更新][平台估值_估值汇总_估值产品累计净值计算表][字段][字段变量][{产品当前份额}=@产品当前份额#,{净资产}=@净资产#,{单位净值}=@单位净值#][2]["更新估值产品累计净值错误！"] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_eva.tb_evatotal_pd_totalnet_calc (
                create_date, create_time, update_date, 
                update_time, update_times, init_date, co_no, 
                pd_no, nav_asset, pd_curr_share, unit_nav, 
                cash_coeffi, share_coeffi, total_unit_nav, net_prefee_coeffi, 
                pre_fee_share_net_total) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_init_date, v_co_no, 
                v_pd_no, v_nav_asset, v_pd_curr_share, v_unit_nav, 
                v_cash_coeffi, v_share_coeffi, v_total_unit_nav, v_net_prefee_coeffi, 
                v_pre_fee_share_net_total) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pd_curr_share=v_pd_curr_share,nav_asset=v_nav_asset,unit_nav=v_unit_nav;
            if v_error_code = "1" then
                        
                SET v_error_code = "evaA.3.5.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT("更新估值产品累计净值错误！","#",v_mysql_message);
                else
                    SET v_error_info = "更新估值产品累计净值错误！";
                end if;
                leave label_pro;
            end if;


           /* update ~平台估值_业务数据_估值产品证券持仓表^ a,~平台估值_基础参数_产品关系表^ b set a.{最新价} = @单位净值# where a.{机构编号} = b.{机构编号} and a.{产品编号}=b.{产品编号} and b.{机构编号} =@机构编号# and b.{母产品编号} = @产品编号# and a.{初始化日期}=@估值日期#; */
           update db_eva.tb_evadata_pd_secu_posi a,db_eva.tb_evabasic_pd_relation b set a.last_price = v_unit_nav where a.co_no = b.co_no and a.pd_no=b.pd_no and b.co_no =v_co_no and b.mum_pd_no = v_pd_no and a.init_date=v_evalu_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品资产信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdAssetInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdAssetInfo(
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
    

    /* select a.{更新日期},a.{更新时间},a.{初始化日期},a.{机构编号},a.{产品编号},a.{产品当前份额},c.{估值表产品当前份额},a.{总资产},a.{净资产},c.{估值表净资产},a.{现金余额},a.{账户余额},b.{账户余额} as {上日账户余额},a.{股票市值},a.{基金资产},a.{债券资产},a.{期货资产},a.{期权资产},a.{其他资产},a.{累计应收额},a.{累计应付额},a.{申购应收金额},a.{赎回应付金额},a.{单位净值},c.{估值表单位净值},a.{累计派现金额},a.{累计单位净值},a.{备注信息},ifnull((a.{单位净值}-b.{单位净值})/b.{单位净值},0) as {当日收益率}  from (select * from ~历史_平台估值_估值汇总_估值产品资产信息表^ where {机构编号}=@机构编号# and (@产品编号串# = "; ;" or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and instr(@产品编号权限串#, concat(";",{产品编号},";"))>0 and {初始化日期} between @开始日期# and @结束日期# union select * from ~平台估值_估值汇总_估值产品资产信息表^ where {机构编号}=@机构编号# and (@产品编号串# = "; ;" or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and instr(@产品编号权限串#, concat(";",{产品编号},";"))>0  and {初始化日期} between @开始日期# and @结束日期# order by {初始化日期}) a left join ~历史_平台估值_估值汇总_估值产品资产信息表^ b  on a.{机构编号}=b.{机构编号} and a.{产品编号}=b.{产品编号} and DATE_FORMAT(DATE_SUB(a.{初始化日期},INTERVAL 1 DAY),'%Y%m%d')=b.{初始化日期} left join ~平台估值_估值汇总_估值产品估值表资产项目表^ c on a.{机构编号}=c.{机构编号} and a.{产品编号}=c.{产品编号} and a.{初始化日期}=c.{初始化日期}; */
    select a.update_date,a.update_time,a.init_date,a.co_no,a.pd_no,a.pd_curr_share,c.eva_pd_curr_share,a.total_asset,a.nav_asset,c.eva_nav_asset,a.cash_bala,a.acco_cash,b.acco_cash as pre_acco_cash,a.stock_market_value,a.fund_asset,a.bond_asset,a.futu_asset,a.option_asset,a.other_asset,a.accumulative_receivable,a.accumulative_payable,a.apply_amt,a.redemp_amt,a.unit_nav,c.eva_unit_nav,a.total_cash_divide,a.total_unit_nav,a.remark_info,ifnull((a.unit_nav-b.unit_nav)/b.unit_nav,0) as daily_pandl_ratio  from (select * from db_eva_his.tb_evatotal_product_asset_info_his where co_no=v_co_no and (v_pd_no_str = "; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0 and init_date between v_begin_date and v_end_date union select * from db_eva.tb_evatotal_product_asset_info where co_no=v_co_no and (v_pd_no_str = "; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0  and init_date between v_begin_date and v_end_date order by init_date) a left join db_eva_his.tb_evatotal_product_asset_info_his b  on a.co_no=b.co_no and a.pd_no=b.pd_no and DATE_FORMAT(DATE_SUB(a.init_date,INTERVAL 1 DAY),'%Y%m%d')=b.init_date left join db_eva.tb_evatotal_pd_fina_asset_info c on a.co_no=c.co_no and a.pd_no=c.pd_no and a.init_date=c.init_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品应收应付汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdFeeRateTotal;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdFeeRateTotal(
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
    

    /* SELECT a.{初始化日期},a.{产品编号},SUM((CASE {产品费用类型} WHEN 《产品费用类型-基金管理费》 THEN a.{当前金额} ELSE 0 END)) AS {产品管理费},SUM((CASE {产品费用类型} WHEN 《产品费用类型-托管费》 THEN a.{当前金额} ELSE 0 END)) AS {产品托管费},SUM((CASE {产品费用类型} WHEN 《产品费用类型-运营服务费》 THEN a.{当前金额} ELSE 0 END)) AS {产品服务费},SUM((CASE {产品费用类型} WHEN 《产品费用类型-投资顾问费》 THEN a.{当前金额} ELSE 0 END)) AS {产品投资顾问费},0 AS {产品其他费},SUM(b.{当前金额}) AS {预计利息},sum(b.{利息积数}) as {利息积数} FROM ~历史_平台估值_估值汇总_估值产品费用表^ a LEFT JOIN ~历史_平台估值_估值汇总_估值产品利息表^ b ON a.{初始化日期}=b.{初始化日期} AND a.{机构编号} =b.{机构编号} and a.{产品编号} =b.{产品编号}  WHERE a.{机构编号} = @机构编号# and a.{初始化日期} between @开始日期# and @结束日期# and a.{产品编号} = @产品编号#; */
    SELECT a.init_date,a.pd_no,SUM((CASE pd_fee_type WHEN 1 THEN a.curr_amt ELSE 0 END)) AS pd_manage_fee,SUM((CASE pd_fee_type WHEN 2 THEN a.curr_amt ELSE 0 END)) AS pd_trustee_fee,SUM((CASE pd_fee_type WHEN 3 THEN a.curr_amt ELSE 0 END)) AS pd_service_fee,SUM((CASE pd_fee_type WHEN 6 THEN a.curr_amt ELSE 0 END)) AS pd_cons_fee,0 AS pd_other_fee,SUM(b.curr_amt) AS intrst_cacl_amt,sum(b.intrst_base_amt) as intrst_base_amt FROM db_eva_his.tb_evatotal_pd_fee_total_his a LEFT JOIN db_eva_his.tb_evatotal_pd_interest_total_his b ON a.init_date=b.init_date AND a.co_no =b.co_no and a.pd_no =b.pd_no  WHERE a.co_no = v_co_no and a.init_date between v_begin_date and v_end_date and a.pd_no = v_pd_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_新增估值产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_addPdFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_addPdFeeAmt(
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
    declare v_init_date int;
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
    declare v_confirm_apply decimal(18,4);
    declare v_manual_flag int;
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
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_begin_amt = p_begin_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_pd_net_asset = p_pd_net_asset;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_confirm_apply = 0;
    SET v_manual_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* set @确认金额#=0; */
    set v_confirm_apply=0;

    /* set @手工标志#=1; */
    set v_manual_flag=1;

    /* [插入重复更新][平台估值_估值汇总_估值产品费用表][字段][字段变量][{期初金额}=@期初金额#,{当前金额}=@当前金额#,{产品净资产}=@产品净资产#,{确认金额}=@确认金额#,{备注信息}=@备注信息#,{手工标志}=@手工标志#][1][@备注信息#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evatotal_pd_fee_total (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, pd_fee_type, crncy_type, begin_amt, 
        curr_amt, pd_net_asset, confirm_apply, remark_info, 
        manual_flag) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_pd_fee_type, v_crncy_type, v_begin_amt, 
        v_curr_amt, v_pd_net_asset, v_confirm_apply, v_remark_info, 
        v_manual_flag) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, begin_amt=v_begin_amt,curr_amt=v_curr_amt,pd_net_asset=v_pd_net_asset,confirm_apply=v_confirm_apply,remark_info=v_remark_info,manual_flag=v_manual_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.8.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("备注信息=",v_remark_info),"#",v_mysql_message);
        else
            SET v_error_info = concat("备注信息=",v_remark_info);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_修改估值产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_modiPdFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_modiPdFeeAmt(
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
    declare v_init_date int;
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
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_begin_amt = p_begin_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_pd_net_asset = p_pd_net_asset;
    SET v_confirm_apply = p_confirm_apply;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* [更新表记录][平台估值_估值汇总_估值产品费用表][{当前金额}=@当前金额#,{产品净资产}=@产品净资产#,{确认金额}=@确认金额#,{备注信息}=@备注信息#,{手工标志}=1][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型# and {本币币种}=@本币币种#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evatotal_pd_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=v_curr_amt,pd_net_asset=v_pd_net_asset,confirm_apply=v_confirm_apply,remark_info=v_remark_info,manual_flag=1 where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.9.2";
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
use db_eva;;

# 原子_平台估值_估值汇总_删除估值产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_delPdFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_delPdFeeAmt(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
    declare v_crncy_type varchar(3);
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
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* [删除表记录][平台估值_估值汇总_估值产品费用表][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型# and {本币币种}=@本币币种#][3][@产品编号#] */
    delete from db_eva.tb_evatotal_pd_fee_total 
        where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type and crncy_type=v_crncy_type;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.10.3";
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
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdFeeAmt(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_估值汇总_估值产品费用表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@产品费用类型# =0 or {产品费用类型}=@产品费用类型#) and (@本币币种# =0 or {本币币种}=@本币币种#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_fee_type, crncy_type, 
        begin_amt, curr_amt, pd_net_asset, confirm_apply, 
        remark_info, manual_flag from db_eva.tb_evatotal_pd_fee_total where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_pd_fee_type =0 or pd_fee_type=v_pd_fee_type) and (v_crncy_type =0 or crncy_type=v_crncy_type);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_fee_type, crncy_type, 
        begin_amt, curr_amt, pd_net_asset, confirm_apply, 
        remark_info, manual_flag from db_eva.tb_evatotal_pd_fee_total where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_pd_fee_type =0 or pd_fee_type=v_pd_fee_type) and (v_crncy_type =0 or crncy_type=v_crncy_type) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_新增估值产品利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_addPdInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_addPdInterestAmt(
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
    declare v_init_date int;
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
    declare v_confirm_apply decimal(18,4);
    declare v_manual_flag int;
    declare v_pd_rate_type int;
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
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_begin_amt = p_begin_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_intrst_base_amt = p_intrst_base_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_confirm_apply = 0;
    SET v_manual_flag = 0;
    SET v_pd_rate_type = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* set @确认金额#=0; */
    set v_confirm_apply=0;

    /* set @手工标志#=1; */
    set v_manual_flag=1;

    /* set @产品利率类型#=0; */
    set v_pd_rate_type=0;

    /* [插入重复更新][平台估值_估值汇总_估值产品利息表][字段][字段变量][{期初金额}=@期初金额#,{当前金额}=@当前金额#,{利息积数}=@利息积数#,{备注信息}=@备注信息#,{手工标志}=@手工标志#][1][@备注信息#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evatotal_pd_interest_total (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, pd_rate_type, asset_acco, crncy_type, 
        begin_amt, curr_amt, intrst_base_amt, confirm_apply, 
        remark_info, manual_flag) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_pd_rate_type, v_asset_acco, v_crncy_type, 
        v_begin_amt, v_curr_amt, v_intrst_base_amt, v_confirm_apply, 
        v_remark_info, v_manual_flag) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, begin_amt=v_begin_amt,curr_amt=v_curr_amt,intrst_base_amt=v_intrst_base_amt,remark_info=v_remark_info,manual_flag=v_manual_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.12.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("备注信息=",v_remark_info),"#",v_mysql_message);
        else
            SET v_error_info = concat("备注信息=",v_remark_info);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_修改估值产品利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_modiPdInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_modiPdInterestAmt(
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
    declare v_init_date int;
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
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_begin_amt = p_begin_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_intrst_base_amt = p_intrst_base_amt;
    SET v_confirm_apply = p_confirm_apply;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* [更新表记录][平台估值_估值汇总_估值产品利息表][{当前金额}=@当前金额#,{利息积数}=@利息积数#,{确认金额}=@确认金额#,{备注信息}=@备注信息#,{手工标志}=1][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户}=@资产账户# and {本币币种}=@本币币种#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evatotal_pd_interest_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=v_curr_amt,intrst_base_amt=v_intrst_base_amt,confirm_apply=v_confirm_apply,remark_info=v_remark_info,manual_flag=1 where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and asset_acco=v_asset_acco and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.13.2";
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
use db_eva;;

# 原子_平台估值_估值汇总_删除估值产品利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_delPdInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_delPdInterestAmt(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
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
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* [删除表记录][平台估值_估值汇总_估值产品利息表][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户}=@资产账户# and {本币币种}=@本币币种#][3][@产品编号#] */
    delete from db_eva.tb_evatotal_pd_interest_total 
        where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and asset_acco=v_asset_acco and crncy_type=v_crncy_type;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.14.3";
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
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdInterestAmt(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco = p_asset_acco;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_估值汇总_估值产品利息表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@资产账户# =" " or {资产账户}=@资产账户#) and (@本币币种# =0 or {本币币种}=@本币币种#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_rate_type, asset_acco, 
        crncy_type, begin_amt, curr_amt, intrst_base_amt, 
        confirm_apply, remark_info, manual_flag from db_eva.tb_evatotal_pd_interest_total where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco =" " or asset_acco=v_asset_acco) and (v_crncy_type =0 or crncy_type=v_crncy_type);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_rate_type, asset_acco, 
        crncy_type, begin_amt, curr_amt, intrst_base_amt, 
        confirm_apply, remark_info, manual_flag from db_eva.tb_evatotal_pd_interest_total where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco =" " or asset_acco=v_asset_acco) and (v_crncy_type =0 or crncy_type=v_crncy_type) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_生成估值产品历史资产信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_createHisPdAseetInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_createHisPdAseetInfo(
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
    declare v_init_date int;
    declare v_total_cash_divide decimal(18,4);
    declare v_total_unit_nav decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_pd_curr_share decimal(18,2);
    declare v_config_value varchar(2048);
    declare v_cash_bala decimal(18,4);
    declare v_acco_cash decimal(18,4);
    declare v_stock_market_value decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_accumulative_receivable decimal(18,4);
    declare v_accumulative_payable decimal(18,4);
    declare v_apply_amt decimal(18,4);
    declare v_redemp_amt decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_option_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_total_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_unit_nav decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_cash_coeffi decimal(18,12);
    declare v_share_coeffi decimal(18,12);
    declare v_net_prefee_coeffi decimal(18,12);
    declare v_pre_fee_share_net_total decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_total_cash_divide = 0;
    SET v_total_unit_nav = 0;
    SET v_remark_info = " ";
    SET v_pd_curr_share = 0;
    SET v_config_value = " ";
    SET v_cash_bala = 0;
    SET v_acco_cash = 0;
    SET v_stock_market_value = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_accumulative_receivable = 0;
    SET v_accumulative_payable = 0;
    SET v_apply_amt = 0;
    SET v_redemp_amt = 0;
    SET v_futu_asset = 0;
    SET v_option_asset = 0;
    SET v_other_asset = 0;
    SET v_total_asset = 0;
    SET v_nav_asset = 0;
    SET v_unit_nav = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_cash_coeffi = 0;
    SET v_share_coeffi = 0;
    SET v_net_prefee_coeffi = 0;
    SET v_pre_fee_share_net_total = 0;

    
    label_pro:BEGIN
    

            /* set @初始化日期#=@估值日期#; */
            set v_init_date=v_evalu_date;

            /* set @累计派现金额#=0; */
            set v_total_cash_divide=0;

            /* set @累计单位净值#=0; */
            set v_total_unit_nav=0;

            /* set @备注信息#=''; */
            set v_remark_info='';
            #统计获取产品历史份额

            /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品资产信息表][{产品当前份额}][@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@初始化日期# order by {初始化日期} desc][4][@产品编号#] */
            select pd_curr_share into v_pd_curr_share from db_eva_his.tb_evatotal_product_asset_info_his where co_no=v_co_no and pd_no=v_pd_no and init_date<v_init_date order by init_date desc limit 1;

            #如果没有就取当前份额

            /* if @产品当前份额#=0 then */
            if v_pd_curr_share=0 then

            /* [获取表记录变量语句][平台估值_基础参数_估值产品基本信息表][{产品当前份额}][@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][4][@产品编号#] */
            select pd_curr_share into v_pd_curr_share from db_eva.tb_evabasic_product_info where co_no=v_co_no and pd_no=v_pd_no limit 1;

            end if;
            #获取当日份额变动

            /* [获取表记录变量语句][平台估值_基础参数_估值产品份额流水表][ifnull(sum(case {变动方向} when 《变动方向-增加》 then {变动份额} else -1*{变动份额} end ),0)+@产品当前份额#][@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#][4][@产品编号#] */
            select ifnull(sum(case occur_dir when 1 then occur_share else -1*occur_share end ),0)+v_pd_curr_share into v_pd_curr_share from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date limit 1;

            #1005配置项直接从估值表取份额

           /* set @配置值#=0; */
           set v_config_value=0;

           /* [获取表记录变量语句][平台估值_基础参数_产品特殊配置表][{配置值}][@配置值#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {配置编号}=1005][4][@产品编号#] */
           select config_value into v_config_value from db_eva.tb_evabasic_pd_special_config where co_no=v_co_no and pd_no=v_pd_no and config_no=1005 limit 1;


           /* set @配置值#=ifnull(@配置值#,0); */
           set v_config_value=ifnull(v_config_value,0);

           /* if @配置值#=1 then */
           if v_config_value=1 then

               /* [获取表记录变量语句][平台估值_估值汇总_估值产品估值表资产项目表][replace({估值表产品当前份额},',','')][@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<=@估值日期# order by {初始化日期} desc][4][@产品编号#] */
               select replace(eva_pd_curr_share,',','') into v_pd_curr_share from db_eva.tb_evatotal_pd_fina_asset_info where co_no=v_co_no and pd_no=v_pd_no and init_date<=v_evalu_date order by init_date desc limit 1;

           end if;
            #取产品现金余额

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}),0)][@现金余额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {初始化日期}=@初始化日期# and  {产品账户类型} =《产品账户类型-银行账户》] */
            select ifnull(sum(curr_amt),0) into v_cash_bala from db_eva_his.tb_evadata_pd_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no  and init_date=v_init_date and  pd_acco_type =1 limit 1;

            #取产品账户资金

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}), 0)][@账户余额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {产品账户类型} in (《产品账户类型-证券账户》,《产品账户类型-期货账户》)] */
            select ifnull(sum(curr_amt), 0) into v_acco_cash from db_eva_his.tb_evadata_pd_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and pd_acco_type in (2,3) limit 1;

           #取股票资产

             /* if @机构编号#=6808 then */
             if v_co_no=6808 then

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*{最新价}*{汇率}), 0)][@股票市值#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {证券类型} in(《证券类型-股票》,《证券类型-申购》)] */
            select ifnull(sum(curr_qty*last_price*exch_rate), 0) into v_stock_market_value from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and stock_type in(1,2) limit 1;

             else

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*round({最新价}*{汇率},2)), 0)][@股票市值#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {证券类型} in(《证券类型-股票》,《证券类型-申购》)] */
            select ifnull(sum(curr_qty*round(last_price*exch_rate,2)), 0) into v_stock_market_value from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and stock_type in(1,2) limit 1;

            end if;
           #取基金资产

           /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][ifnull(SUM(({当前数量}+round({当前数量}*{利息收益}/10000,0))*{最新价}),0)][@基金资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {证券类型} in (《证券类型-ETF基金》,《证券类型-货币ETF基金》,《证券类型-普通开放式基金》,《证券类型-黄金ETF基金》,《证券类型-封闭式基金》,《证券类型-分级基金》,《证券类型-普通货币基金》,《证券类型-债券ETF基金》)] */
           select ifnull(SUM((curr_qty+round(curr_qty*intrst_pandl/10000,0))*last_price),0) into v_fund_asset from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and stock_type in (52,57,62,60,51,54,63,64) limit 1;

           #取债券资产

           /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][ifnull(sum(({当前数量})*{最新价}), 0)][@债券资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {证券类型} in (《证券类型-公司债》,《证券类型-企业债》,《证券类型-可转债》,《证券类型-可交换公司债》,《证券类型-回购标准券》,《证券类型-债券申购》)] */
           select ifnull(sum((curr_qty)*last_price), 0) into v_bond_asset from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and stock_type in (23,22,24,41,27,32) limit 1;

            #取累计应收

            /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品利息表][ifnull(sum({当前金额}-{确认金额}), 0)][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期#] */
            select ifnull(sum(curr_amt-confirm_apply), 0) into v_accumulative_receivable from db_eva_his.tb_evatotal_pd_interest_total_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date limit 1;

            #保障基金账户作为应收

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}),0)+@累计应收额#][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {初始化日期}=@初始化日期# and  {产品账户类型} =《产品账户类型-金融资产账户》] */
            select ifnull(sum(curr_amt),0)+v_accumulative_receivable into v_accumulative_receivable from db_eva_his.tb_evadata_pd_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no  and init_date=v_init_date and  pd_acco_type =11 limit 1;

            #债券利息作为应收

           /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][ifnull(sum({利息收益}),0)+@累计应收额#][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期#  and {证券类型}  in (《证券类型-公司债》,《证券类型-企业债》,《证券类型-可交换公司债》,《证券类型-回购标准券》)] */
           select ifnull(sum(intrst_pandl),0)+v_accumulative_receivable into v_accumulative_receivable from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date  and stock_type  in (23,22,41,27) limit 1;

            #取累计应付

            /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品费用表][ifnull(sum({当前金额}-{确认金额}),0)][@累计应付额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期#] */
            select ifnull(sum(curr_amt-confirm_apply),0) into v_accumulative_payable from db_eva_his.tb_evatotal_pd_fee_total_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date limit 1;

            #应付暂存账户作为应付

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}),0)+@累计应付额#][@累计应付额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {初始化日期}=@初始化日期# and  {产品账户类型} =《产品账户类型-应付暂存账户》] */
            select ifnull(sum(curr_amt),0)+v_accumulative_payable into v_accumulative_payable from db_eva_his.tb_evadata_pd_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no  and init_date=v_init_date and  pd_acco_type =12 limit 1;

            #份额增加作为申购应付金额

           /* [获取表记录变量语句][平台估值_基础参数_估值产品份额流水表][ifnull(sum({变动金额}),0)][@申购应收金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {份额操作}=《份额操作-申购》 and @初始化日期# >= {初始化日期} and  @初始化日期# <{到账日期}] */
           select ifnull(sum(occur_amt),0) into v_apply_amt from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and pd_no=v_pd_no  and share_oper=1 and v_init_date >= init_date and  v_init_date <arrive_date limit 1;

            #份额减少作为赎回应付金额

           /* [获取表记录变量语句][平台估值_基础参数_估值产品份额流水表][ifnull(sum({变动金额}),0)][@赎回应付金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {份额操作}=《份额操作-赎回》 and @初始化日期# >= {初始化日期} and @初始化日期#<{到账日期}] */
           select ifnull(sum(occur_amt),0) into v_redemp_amt from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and pd_no=v_pd_no  and share_oper=2 and v_init_date >= init_date and v_init_date<arrive_date limit 1;


           /* set @期货资产#=0; */
           set v_futu_asset=0;

           /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品期货持仓表][ifnull(sum((case {多空类型} when 《多空类型-空头》 then {昨结算价} - {结算价} else {结算价} -{昨结算价} end)*{当前数量}*{合约乘数}), 0)][@期货资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {初始化日期}=@初始化日期#] */
           select ifnull(sum((case lngsht_type when 2 then pre_settle_price - sett_price else sett_price -pre_settle_price end)*curr_qty*contrc_unit), 0) into v_futu_asset from db_eva_his.tb_evadata_pd_fupo_posi_his where co_no=v_co_no and pd_no=v_pd_no  and init_date=v_init_date limit 1;


           /* set @期权资产#=0; */
           set v_option_asset=0;

           /* set @其他资产#=0; */
           set v_other_asset=0;

            /* set @总资产#=@现金余额#+@账户余额#+@股票市值#+@基金资产#+@债券资产#+@期货资产#+@期权资产#+@其他资产#; */
            set v_total_asset=v_cash_bala+v_acco_cash+v_stock_market_value+v_fund_asset+v_bond_asset+v_futu_asset+v_option_asset+v_other_asset;

            /* set @净资产#=@总资产#+@累计应收额#-@累计应付额#+@申购应收金额#-@赎回应付金额#; */
            set v_nav_asset=v_total_asset+v_accumulative_receivable-v_accumulative_payable+v_apply_amt-v_redemp_amt;

            /* set @单位净值#=ifnull(round(@净资产#/@产品当前份额#, 4), 0); */
            set v_unit_nav=ifnull(round(v_nav_asset/v_pd_curr_share, 4), 0);

            /* [插入重复更新][历史_平台估值_估值汇总_估值产品资产信息表][字段][字段变量][{产品当前份额}=@产品当前份额#,{总资产}=@总资产#,{净资产}=@净资产#,{现金余额}=@现金余额#,{账户余额}=@账户余额#,{股票市值}=@股票市值#,{基金资产}=@基金资产#,{债券资产}=@债券资产#,{期货资产}=@期货资产#,{累计应付额}=@累计应付额#,{累计应收额}=@累计应收额#,{申购应收金额}=@申购应收金额#,{赎回应付金额}=@赎回应付金额#,{单位净值}=@单位净值#,{累计派现金额}=@累计派现金额#,{累计单位净值}=@累计单位净值#][1]["更新估值产品资产信息记录错误！"] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_eva_his.tb_evatotal_product_asset_info_his (
                create_date, create_time, update_date, 
                update_time, update_times, init_date, co_no, 
                pd_no, pd_curr_share, total_asset, nav_asset, 
                cash_bala, acco_cash, stock_market_value, fund_asset, 
                bond_asset, futu_asset, option_asset, other_asset, 
                accumulative_receivable, accumulative_payable, apply_amt, redemp_amt, 
                unit_nav, total_cash_divide, total_unit_nav, remark_info) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_init_date, v_co_no, 
                v_pd_no, v_pd_curr_share, v_total_asset, v_nav_asset, 
                v_cash_bala, v_acco_cash, v_stock_market_value, v_fund_asset, 
                v_bond_asset, v_futu_asset, v_option_asset, v_other_asset, 
                v_accumulative_receivable, v_accumulative_payable, v_apply_amt, v_redemp_amt, 
                v_unit_nav, v_total_cash_divide, v_total_unit_nav, v_remark_info) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pd_curr_share=v_pd_curr_share,total_asset=v_total_asset,nav_asset=v_nav_asset,cash_bala=v_cash_bala,acco_cash=v_acco_cash,stock_market_value=v_stock_market_value,fund_asset=v_fund_asset,bond_asset=v_bond_asset,futu_asset=v_futu_asset,accumulative_payable=v_accumulative_payable,accumulative_receivable=v_accumulative_receivable,apply_amt=v_apply_amt,redemp_amt=v_redemp_amt,unit_nav=v_unit_nav,total_cash_divide=v_total_cash_divide,total_unit_nav=v_total_unit_nav;
            if v_error_code = "1" then
                        
                SET v_error_code = "evaA.3.16.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT("更新估值产品资产信息记录错误！","#",v_mysql_message);
                else
                    SET v_error_info = "更新估值产品资产信息记录错误！";
                end if;
                leave label_pro;
            end if;


            /* set @现金分红系数#=0; */
            set v_cash_coeffi=0;

            /* set @份额分红系数#=1; */
            set v_share_coeffi=1;

            /* set @费前累计净值系数#=1; */
            set v_net_prefee_coeffi=1;

            /* set @累计单位净值#=@单位净值#; */
            set v_total_unit_nav=v_unit_nav;

            /* set @费前累计净值#=@单位净值#; */
            set v_pre_fee_share_net_total=v_unit_nav;

            /* [插入重复更新][平台估值_估值汇总_估值产品累计净值计算表][字段][字段变量][{产品当前份额}=@产品当前份额#,{净资产}=@净资产#,{单位净值}=@单位净值#][2]["更新估值产品累计净值错误！"] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_eva.tb_evatotal_pd_totalnet_calc (
                create_date, create_time, update_date, 
                update_time, update_times, init_date, co_no, 
                pd_no, nav_asset, pd_curr_share, unit_nav, 
                cash_coeffi, share_coeffi, total_unit_nav, net_prefee_coeffi, 
                pre_fee_share_net_total) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_init_date, v_co_no, 
                v_pd_no, v_nav_asset, v_pd_curr_share, v_unit_nav, 
                v_cash_coeffi, v_share_coeffi, v_total_unit_nav, v_net_prefee_coeffi, 
                v_pre_fee_share_net_total) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pd_curr_share=v_pd_curr_share,nav_asset=v_nav_asset,unit_nav=v_unit_nav;
            if v_error_code = "1" then
                        
                SET v_error_code = "evaA.3.16.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT("更新估值产品累计净值错误！","#",v_mysql_message);
                else
                    SET v_error_info = "更新估值产品累计净值错误！";
                end if;
                leave label_pro;
            end if;


           /* update ~历史_平台估值_业务数据_估值产品证券持仓表^ a,~平台估值_基础参数_产品关系表^ b set a.{最新价} = @单位净值# where a.{机构编号} = b.{机构编号} and a.{产品编号}=b.{产品编号} and b.{机构编号} =@机构编号# and b.{母产品编号} = @产品编号# and a.{初始化日期}=@估值日期#; */
           update db_eva_his.tb_evadata_pd_secu_posi_his a,db_eva.tb_evabasic_pd_relation b set a.last_price = v_unit_nav where a.co_no = b.co_no and a.pd_no=b.pd_no and b.co_no =v_co_no and b.mum_pd_no = v_pd_no and a.init_date=v_evalu_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_计算估值产品历史费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_calcPdHisFee;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_calcPdHisFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_nav_asset decimal(18,4),
    IN p_evalu_date int,
    IN p_total_asset decimal(18,4),
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
    declare v_nav_asset decimal(18,4);
    declare v_evalu_date int;
    declare v_total_asset decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_init_date int;
    declare v_curr_amt decimal(18,4);
    declare v_pd_net_asset decimal(18,4);
    declare v_confirm_apply decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_last_init_date int;
    declare v_remark_info varchar(255);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pd_fee_type int;
    declare v_pd_fee_rate decimal(18,12);
    declare v_pd_fee_circle int;
    declare v_min_fee decimal(18,4);
    declare v_fina_acco_code varchar(64);
    declare v_calc_fee_date_str varchar(4096);
    declare v_eva_calc_type int;
    declare v_manual_flag int;
    declare v_payab_amt decimal(18,4);
    declare v_cash_bala decimal(18,4);
    declare v_acco_cash decimal(18,4);
    declare v_stock_market_value decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_accumulative_receivable decimal(18,4);
    declare v_accumulative_payable decimal(18,4);
    declare v_apply_amt decimal(18,4);
    declare v_redemp_amt decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_out_total_asset decimal(18,4);
    declare v_inteval_days int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_nav_asset = p_nav_asset;
    SET v_evalu_date = p_evalu_date;
    SET v_total_asset = p_total_asset;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_curr_amt = 0;
    SET v_pd_net_asset = 0;
    SET v_confirm_apply = 0;
    SET v_begin_amt = 0;
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');
    SET v_remark_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pd_fee_type = 0;
    SET v_pd_fee_rate = 0;
    SET v_pd_fee_circle = 0;
    SET v_min_fee = 0;
    SET v_fina_acco_code = " ";
    SET v_calc_fee_date_str = " ";
    SET v_eva_calc_type = 0;
    SET v_manual_flag = 0;
    SET v_payab_amt = 0;
    SET v_cash_bala = 0;
    SET v_acco_cash = 0;
    SET v_stock_market_value = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_accumulative_receivable = 0;
    SET v_accumulative_payable = 0;
    SET v_apply_amt = 0;
    SET v_redemp_amt = 0;
    SET v_futu_asset = 0;
    SET v_out_total_asset = 0;
    SET v_inteval_days = 0;

    
    label_pro:BEGIN
    

    /* set @本币币种#=《本币币种-人民币》; */
    set v_crncy_type="CNY";

    /* set @初始化日期#=@估值日期#; */
    set v_init_date=v_evalu_date;

    /* set @当前金额#=0; */
    set v_curr_amt=0;

    /* set @产品净资产#=@净资产#; */
    set v_pd_net_asset=v_nav_asset;

    /* set @确认金额#=0; */
    set v_confirm_apply=0;

    /* set @期初金额#=0; */
    set v_begin_amt=0;

    /* set @上日初始化日期#=0; */
    set v_last_init_date=0;

    /* set @备注信息#=' '; */
    set v_remark_info=' ';
    #对估值产品费用表里的记录游标循环处理

    /* [声明游标][平台估值_基础参数_估值产品费率表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号#][cursor_eva_product_fee] */
    cursor_eva_product_fee:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_product_fee CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_fee_type, pd_fee_rate, pd_fee_circle, 
        min_fee, fina_acco_code, calc_fee_date_str, eva_calc_type, 
        remark_info 
        from db_eva.tb_evabasic_product_fee 
        where co_no=v_co_no and pd_no=v_pd_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_eva_product_fee][loop_eva_product_fee] */
    open cursor_eva_product_fee;
    loop_eva_product_fee: LOOP
    fetch cursor_eva_product_fee into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_pd_fee_type, v_pd_fee_rate, v_pd_fee_circle, 
        v_min_fee, v_fina_acco_code, v_calc_fee_date_str, v_eva_calc_type, 
        v_remark_info;
        IF v_cursor_done THEN
            LEAVE loop_eva_product_fee;
        END IF;


         /* set @手工标志#=0; */
         set v_manual_flag=0;
        #获取自动计算值

        /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品费用表][{手工标志}][@手工标志#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {产品费用类型}=@产品费用类型#] */
        select manual_flag into v_manual_flag from db_eva_his.tb_evatotal_pd_fee_total_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and pd_fee_type=v_pd_fee_type limit 1;


    /* if  @手工标志#=0 then */
    if  v_manual_flag=0 then

        /* if @扣费日期串#=" " then */
        if v_calc_fee_date_str=" " then

            /* set @期初金额#=0; */
            set v_begin_amt=0;
           #获取上日初始值

           /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品费用表][{当前金额}-{确认金额},{备注信息}][@期初金额#,@备注信息#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@估值日期# and {产品费用类型}=@产品费用类型# order by {初始化日期} desc] */
           select curr_amt-confirm_apply,remark_info into v_begin_amt,v_remark_info from db_eva_his.tb_evatotal_pd_fee_total_his where co_no=v_co_no and pd_no=v_pd_no and init_date<v_evalu_date and pd_fee_type=v_pd_fee_type order by init_date desc limit 1;

          #初始化历史估值产品费用表当前金额

          /* [插入重复更新][历史_平台估值_估值汇总_估值产品费用表][字段][字段变量][{当前金额} = @期初金额#,{期初金额}=@期初金额#][1][@产品编号#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_eva_his.tb_evatotal_pd_fee_total_his (
              create_date, create_time, update_date, 
              update_time, update_times, init_date, co_no, 
              pd_no, pd_fee_type, crncy_type, begin_amt, 
              curr_amt, pd_net_asset, confirm_apply, remark_info, 
              manual_flag) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_init_date, v_co_no, 
              v_pd_no, v_pd_fee_type, v_crncy_type, v_begin_amt, 
              v_curr_amt, v_pd_net_asset, v_confirm_apply, v_remark_info, 
              v_manual_flag) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt = v_begin_amt,begin_amt=v_begin_amt;
          if v_error_code = "1" then
                      
              SET v_error_code = "evaA.3.17.1";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
              else
                  SET v_error_info = concat("产品编号=",v_pd_no);
              end if;
              close cursor_eva_product_fee;
              leave label_pro;
          end if;


         /* set @应付金额# = round(@净资产# * @产品费用费率#/@产品计费周期#,2); */
         set v_payab_amt = round(v_nav_asset * v_pd_fee_rate/v_pd_fee_circle,2);

         /* if @最低费用#>@应付金额# then */
         if v_min_fee>v_payab_amt then

            /* set @应付金额#=@最低费用#; */
            set v_payab_amt=v_min_fee;
          end if;

        /* [插入重复更新][历史_平台估值_估值汇总_估值产品费用表][字段][字段变量][{当前金额} = {当前金额} + @应付金额#,{产品净资产}=@净资产#,{备注信息}=@备注信息#][1][concat("更新历史估值产品费用表记录错误！【机构编号】=", @机构编号#,"【产品编号】=",@产品编号#,"【产品费用类型】=",@产品费用类型#)] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_eva_his.tb_evatotal_pd_fee_total_his (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, pd_fee_type, crncy_type, begin_amt, 
            curr_amt, pd_net_asset, confirm_apply, remark_info, 
            manual_flag) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_pd_fee_type, v_crncy_type, v_begin_amt, 
            v_curr_amt, v_pd_net_asset, v_confirm_apply, v_remark_info, 
            v_manual_flag) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt = curr_amt + v_payab_amt,pd_net_asset=v_nav_asset,remark_info=v_remark_info;
        if v_error_code = "1" then
                    
            SET v_error_code = "evaA.3.17.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("更新历史估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("更新历史估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type);
            end if;
            close cursor_eva_product_fee;
            leave label_pro;
        end if;


       /* if @产品费用类型#=《产品费用类型-应交税金》 then */
       if v_pd_fee_type=21 then

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}),0)][@现金余额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {初始化日期}=@初始化日期# and  {产品账户类型} =《产品账户类型-银行账户》] */
            select ifnull(sum(curr_amt),0) into v_cash_bala from db_eva_his.tb_evadata_pd_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no  and init_date=v_init_date and  pd_acco_type =1 limit 1;

            #取产品账户资金

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}), 0)][@账户余额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {产品账户类型} in (《产品账户类型-证券账户》,《产品账户类型-期货账户》)] */
            select ifnull(sum(curr_amt), 0) into v_acco_cash from db_eva_his.tb_evadata_pd_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and pd_acco_type in (2,3) limit 1;

           #取股票资产

             /* if @机构编号#=6808 then */
             if v_co_no=6808 then

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*{最新价}*{汇率}), 0)][@股票市值#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {证券类型} in(《证券类型-股票》,《证券类型-申购》)] */
            select ifnull(sum(curr_qty*last_price*exch_rate), 0) into v_stock_market_value from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and stock_type in(1,2) limit 1;

             else

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*round({最新价}*{汇率},2)), 0)][@股票市值#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {证券类型} in(《证券类型-股票》,《证券类型-申购》)] */
            select ifnull(sum(curr_qty*round(last_price*exch_rate,2)), 0) into v_stock_market_value from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and stock_type in(1,2) limit 1;

            end if;
           #取基金资产

           /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][ifnull(SUM(({当前数量}+round({当前数量}*{利息收益}/10000,0))*{最新价}),0)][@基金资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {证券类型} in (《证券类型-ETF基金》,《证券类型-货币ETF基金》,《证券类型-普通开放式基金》,《证券类型-黄金ETF基金》,《证券类型-封闭式基金》,《证券类型-分级基金》,《证券类型-普通货币基金》,《证券类型-债券ETF基金》)] */
           select ifnull(SUM((curr_qty+round(curr_qty*intrst_pandl/10000,0))*last_price),0) into v_fund_asset from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and stock_type in (52,57,62,60,51,54,63,64) limit 1;

           #取债券资产

           /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][ifnull(sum(({当前数量})*{最新价}), 0)][@债券资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {证券类型} in (《证券类型-公司债》,《证券类型-企业债》,《证券类型-可转债》,《证券类型-可交换公司债》,《证券类型-回购标准券》,《证券类型-债券申购》)] */
           select ifnull(sum((curr_qty)*last_price), 0) into v_bond_asset from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and stock_type in (23,22,24,41,27,32) limit 1;

            #取累计应收

            /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品利息表][ifnull(sum({当前金额}-{确认金额}), 0)][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期#] */
            select ifnull(sum(curr_amt-confirm_apply), 0) into v_accumulative_receivable from db_eva_his.tb_evatotal_pd_interest_total_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date limit 1;

            #保障基金账户作为应收

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}),0)+@累计应收额#][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {初始化日期}=@初始化日期# and  {产品账户类型} =《产品账户类型-金融资产账户》] */
            select ifnull(sum(curr_amt),0)+v_accumulative_receivable into v_accumulative_receivable from db_eva_his.tb_evadata_pd_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no  and init_date=v_init_date and  pd_acco_type =11 limit 1;

            #债券利息作为应收

           /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][ifnull(sum({利息收益}),0)+@累计应收额#][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期#  and {证券类型}  in (《证券类型-公司债》,《证券类型-企业债》,《证券类型-可交换公司债》,《证券类型-回购标准券》)] */
           select ifnull(sum(intrst_pandl),0)+v_accumulative_receivable into v_accumulative_receivable from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date  and stock_type  in (23,22,41,27) limit 1;

            #取累计应付

            /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品费用表][ifnull(sum({当前金额}-{确认金额}),0)][@累计应付额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期#] */
            select ifnull(sum(curr_amt-confirm_apply),0) into v_accumulative_payable from db_eva_his.tb_evatotal_pd_fee_total_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date limit 1;

            #应付暂存账户作为应付

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}),0)+@累计应付额#][@累计应付额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {初始化日期}=@初始化日期# and  {产品账户类型} =《产品账户类型-应付暂存账户》] */
            select ifnull(sum(curr_amt),0)+v_accumulative_payable into v_accumulative_payable from db_eva_his.tb_evadata_pd_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no  and init_date=v_init_date and  pd_acco_type =12 limit 1;

            #份额增加作为申购应付金额

           /* [获取表记录变量语句][平台估值_基础参数_估值产品份额流水表][ifnull(sum({变动金额}),0)][@申购应收金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {份额操作}=《份额操作-申购》 and @初始化日期# >= {初始化日期} and  @初始化日期# ={到账日期}] */
           select ifnull(sum(occur_amt),0) into v_apply_amt from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and pd_no=v_pd_no  and share_oper=1 and v_init_date >= init_date and  v_init_date =arrive_date limit 1;

            #份额减少作为赎回应付金额

           /* [获取表记录变量语句][平台估值_基础参数_估值产品份额流水表][ifnull(sum({变动金额}),0)][@赎回应付金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {份额操作}=《份额操作-赎回》 and @初始化日期# >= {初始化日期} and @初始化日期#={到账日期}] */
           select ifnull(sum(occur_amt),0) into v_redemp_amt from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and pd_no=v_pd_no  and share_oper=2 and v_init_date >= init_date and v_init_date=arrive_date limit 1;


           /* set @期货资产#=0; */
           set v_futu_asset=0;

           /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品期货持仓表][ifnull(sum((case {多空类型} when 《多空类型-空头》 then {昨结算价} - {结算价} else {结算价} -{昨结算价} end)*{当前数量}*{合约乘数}), 0)][@期货资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {初始化日期}=@初始化日期#] */
           select ifnull(sum((case lngsht_type when 2 then pre_settle_price - sett_price else sett_price -pre_settle_price end)*curr_qty*contrc_unit), 0) into v_futu_asset from db_eva_his.tb_evadata_pd_fupo_posi_his where co_no=v_co_no and pd_no=v_pd_no  and init_date=v_init_date limit 1;


            /* set @外部总资产#=@现金余额#+@账户余额#+@股票市值#+@基金资产#+@债券资产#+@期货资产#-@申购应收金额#+@赎回应付金额#; */
            set v_out_total_asset=v_cash_bala+v_acco_cash+v_stock_market_value+v_fund_asset+v_bond_asset+v_futu_asset-v_apply_amt+v_redemp_amt;

            /* set @应付金额# = round(（@外部总资产#-@总资产#)/1.03*0.03,2); */
            set v_payab_amt = round((v_out_total_asset-v_total_asset)/1.03*0.03,2);

           /* [插入重复更新][历史_平台估值_估值汇总_估值产品费用表][字段][字段变量][{当前金额} = case when ({当前金额} + @应付金额#)>0 then {当前金额} + @应付金额# else 0 end,{产品净资产}=@外部总资产#,{备注信息}=@备注信息#][1][concat("更新历史估值产品费用表记录错误！【机构编号】=", @机构编号#,"【产品编号】=",@产品编号#,"【产品费用类型】=",@产品费用类型#)] */
           set v_create_date = date_format(curdate(),'%Y%m%d');
           set v_create_time = date_format(curtime(),'%H%i%s');
           set v_update_date = v_create_date;
           set v_update_time = v_create_time;
           set v_update_times = 1;
           insert into db_eva_his.tb_evatotal_pd_fee_total_his (
               create_date, create_time, update_date, 
               update_time, update_times, init_date, co_no, 
               pd_no, pd_fee_type, crncy_type, begin_amt, 
               curr_amt, pd_net_asset, confirm_apply, remark_info, 
               manual_flag) 
           values(
               v_create_date, v_create_time, v_update_date, 
               v_update_time, v_update_times, v_init_date, v_co_no, 
               v_pd_no, v_pd_fee_type, v_crncy_type, v_begin_amt, 
               v_curr_amt, v_pd_net_asset, v_confirm_apply, v_remark_info, 
               v_manual_flag) 
           ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt = case when (curr_amt + v_payab_amt)>0 then curr_amt + v_payab_amt else 0 end,pd_net_asset=v_out_total_asset,remark_info=v_remark_info;
           if v_error_code = "1" then
                       
               SET v_error_code = "evaA.3.17.1";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("更新历史估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type),"#",v_mysql_message);
               else
                   SET v_error_info = concat("更新历史估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type);
               end if;
               close cursor_eva_product_fee;
               leave label_pro;
           end if;

          end if;
      else

        /* if (instr(@扣费日期串#,@估值日期#)>0) then */
        if (instr(v_calc_fee_date_str,v_evalu_date)>0) then
         #获取上一日费用初始值

         /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品费用表][{当前金额}-{确认金额},{初始化日期}][@期初金额#,@上日初始化日期#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型# and {初始化日期}<@估值日期#  and {当前金额}>0 order by {初始化日期} desc] */
         select curr_amt-confirm_apply,init_date into v_begin_amt,v_last_init_date from db_eva_his.tb_evatotal_pd_fee_total_his where co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type and init_date<v_evalu_date  and curr_amt>0 order by init_date desc limit 1;

         #计算上次到现在已经过了多少天

         /* set  @间隔天数#=datediff(@估值日期#,@上日初始化日期#); */
         set  v_inteval_days=datediff(v_evalu_date,v_last_init_date);

         /* if @净值计算方式#=《净值计算方式-前日净资产》 then */
         if v_eva_calc_type=1 then

             /* set @应付金额# = round(@净资产# * @产品费用费率#/@产品计费周期#*@间隔天数#,2); */
             set v_payab_amt = round(v_nav_asset * v_pd_fee_rate/v_pd_fee_circle*v_inteval_days,2);

             /* [更新表记录][历史_平台估值_估值汇总_估值产品费用表][{当前金额} = @期初金额# + @应付金额#,{期初金额}=@期初金额#,{产品净资产}=@净资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {产品费用类型}=@产品费用类型# and {手工标志}=0][2][concat("更新估值产品费用表记录错误！【机构编号】=", @机构编号#,"【产品编号】=",@产品编号#,"【产品费用类型】=",@产品费用类型#)] */
             set v_update_date = date_format(curdate(),'%Y%m%d');
             set v_update_time = date_format(curtime(),'%H%i%s');
             update db_eva_his.tb_evatotal_pd_fee_total_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = v_begin_amt + v_payab_amt,begin_amt=v_begin_amt,pd_net_asset=v_nav_asset where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and pd_fee_type=v_pd_fee_type and manual_flag=0;
             if v_error_code = "1" then
                         
                 SET v_error_code = "evaA.3.17.2";
                 if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type),"#",v_mysql_message);
                 else
                     SET v_error_info = concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type);
                 end if;
                 close cursor_eva_product_fee;
                 leave label_pro;
             end if;


          /* elseif @净值计算方式#=《净值计算方式-当日资产》 then */
          elseif v_eva_calc_type=2 then

            /* 调用【原子_平台估值_估值汇总_获取估值产品历史总资产】*/
            call db_eva.pra_evatotal_getHisPdTotalAseet(
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
                v_total_asset);
            if v_error_code = "1" then
                SET v_error_code = "evaA.3.17.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_估值汇总_获取估值产品历史总资产出现错误！',v_mysql_message);
                end if;
                close cursor_eva_product_fee;
                leave label_pro;
            elseif v_error_code <> "0" then
                close cursor_eva_product_fee;
                leave label_pro;
            end if;


            /* set @应付金额# = round(@总资产# * @产品费用费率#/@产品计费周期#*@间隔天数#,2); */
            set v_payab_amt = round(v_total_asset * v_pd_fee_rate/v_pd_fee_circle*v_inteval_days,2);

            /* [更新表记录][历史_平台估值_估值汇总_估值产品费用表][{当前金额} = @期初金额# + @应付金额#,{期初金额}=@期初金额#,{产品净资产}=@总资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {产品费用类型}=@产品费用类型# and {手工标志}=0][2][concat("更新估值产品费用表记录错误！【机构编号】=", @机构编号#,"【产品编号】=",@产品编号#,"【产品费用类型】=",@产品费用类型#)] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_eva_his.tb_evatotal_pd_fee_total_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = v_begin_amt + v_payab_amt,begin_amt=v_begin_amt,pd_net_asset=v_total_asset where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and pd_fee_type=v_pd_fee_type and manual_flag=0;
            if v_error_code = "1" then
                        
                SET v_error_code = "evaA.3.17.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type);
                end if;
                close cursor_eva_product_fee;
                leave label_pro;
            end if;

       end if;
       else

          /* [更新表记录][历史_平台估值_估值汇总_估值产品费用表][{当前金额} = 0,{期初金额}=0,{产品净资产}=@净资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {产品费用类型}=@产品费用类型# and {手工标志}=0][2][concat("更新估值产品费用表记录错误！【机构编号】=", @机构编号#,"【产品编号】=",@产品编号#,"【产品费用类型】=",@产品费用类型#)] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_eva_his.tb_evatotal_pd_fee_total_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = 0,begin_amt=0,pd_net_asset=v_nav_asset where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and pd_fee_type=v_pd_fee_type and manual_flag=0;
          if v_error_code = "1" then
                      
              SET v_error_code = "evaA.3.17.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("更新估值产品费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【产品费用类型】=",v_pd_fee_type);
              end if;
              close cursor_eva_product_fee;
              leave label_pro;
          end if;

       end if;
     end if;
    end if;

    /* [关闭游标][cursor_eva_product_fee] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_product_fee;
    end cursor_eva_product_fee;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_计算估值产品历史利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_calcPdHisRate;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_calcPdHisRate(
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
    

    /* update ~历史_平台估值_业务数据_估值产品账户资金表^ a,~平台估值_基础参数_估值产品利率表^ b set a.{预计利息}=GREATEST(round(a.{期初金额}*b.{利率}/b.{产品计费周期},2),b.{最低利息}) where a.{机构编号} = b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{资产账户} =b.{资产账户} and a.{机构编号} = @机构编号# and a.{产品编号} = @产品编号# and a.{初始化日期}=@估值日期#; */
    update db_eva_his.tb_evadata_pd_acco_capit_his a,db_eva.tb_evabasic_product_rate b set a.intrst_cacl_amt=GREATEST(round(a.begin_amt*b.intrst_rate/b.pd_fee_circle,2),b.min_interest) where a.co_no = b.co_no and a.pd_no=b.pd_no and a.asset_acco =b.asset_acco and a.co_no = v_co_no and a.pd_no = v_pd_no and a.init_date=v_evalu_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_统计估值产品历史利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_sumPdHisRate;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_sumPdHisRate(
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
    declare v_init_date int;
    declare v_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
    declare v_confirm_apply decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pd_rate_type int;
    declare v_asset_acco varchar(16);
    declare v_begin_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);
    declare v_manual_flag int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_remark_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_curr_amt = 0;
    SET v_confirm_apply = 0;
    SET v_intrst_base_amt = 0;
    SET v_pd_rate_type = 0;
    SET v_asset_acco = " ";
    SET v_begin_amt = 0;
    SET v_intrst_cacl_amt = 0;
    SET v_manual_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* set @初始化日期#=@估值日期#; */
    set v_init_date=v_evalu_date;

    /* set @本币币种#=《本币币种-人民币》; */
    set v_crncy_type="CNY";

    /* set @当前金额#=0; */
    set v_curr_amt=0;

    /* set @确认金额#=0; */
    set v_confirm_apply=0;

    /* set @利息积数#=0; */
    set v_intrst_base_amt=0;

    /* set @产品利率类型#=0; */
    set v_pd_rate_type=0;

    /* [声明游标][平台估值_基础参数_估值产品利率表][{资产账户}][{机构编号}=@机构编号# and {产品编号}=@产品编号#][cursor_eva_product_rate] */
    cursor_eva_product_rate:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_product_rate CURSOR FOR
        select asset_acco 
        from db_eva.tb_evabasic_product_rate 
        where co_no=v_co_no and pd_no=v_pd_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@资产账户#][cursor_eva_product_rate][loop_eva_product_rate] */
    open cursor_eva_product_rate;
    loop_eva_product_rate: LOOP
    fetch cursor_eva_product_rate into v_asset_acco;
        IF v_cursor_done THEN
            LEAVE loop_eva_product_rate;
        END IF;


         /* set @期初金额#=0; */
         set v_begin_amt=0;

         /* set @预计利息#=0; */
         set v_intrst_cacl_amt=0;
        #获取上日初始值

        /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品利息表][{当前金额}-{确认金额}][@期初金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@估值日期# and {资产账户}=@资产账户# order by {初始化日期} desc] */
        select curr_amt-confirm_apply into v_begin_amt from db_eva_his.tb_evatotal_pd_interest_total_his where co_no=v_co_no and pd_no=v_pd_no and init_date<v_evalu_date and asset_acco=v_asset_acco order by init_date desc limit 1;


        /* set @手工标志#=0; */
        set v_manual_flag=0;
        #获取手工标志

        /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品利息表][{手工标志}][@手工标志#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {资产账户}=@资产账户#] */
        select manual_flag into v_manual_flag from db_eva_his.tb_evatotal_pd_interest_total_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and asset_acco=v_asset_acco limit 1;


       /* if @手工标志#=0 then */
       if v_manual_flag=0 then
       #初始化历史估值产品利息表当前金额

       /* [插入重复更新][历史_平台估值_估值汇总_估值产品利息表][字段][字段变量][{当前金额} = @期初金额#,{期初金额}=@期初金额#][1][@产品编号#] */
       set v_create_date = date_format(curdate(),'%Y%m%d');
       set v_create_time = date_format(curtime(),'%H%i%s');
       set v_update_date = v_create_date;
       set v_update_time = v_create_time;
       set v_update_times = 1;
       insert into db_eva_his.tb_evatotal_pd_interest_total_his (
           create_date, create_time, update_date, 
           update_time, update_times, init_date, co_no, 
           pd_no, pd_rate_type, asset_acco, crncy_type, 
           begin_amt, curr_amt, intrst_base_amt, confirm_apply, 
           remark_info, manual_flag) 
       values(
           v_create_date, v_create_time, v_update_date, 
           v_update_time, v_update_times, v_init_date, v_co_no, 
           v_pd_no, v_pd_rate_type, v_asset_acco, v_crncy_type, 
           v_begin_amt, v_curr_amt, v_intrst_base_amt, v_confirm_apply, 
           v_remark_info, v_manual_flag) 
       ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt = v_begin_amt,begin_amt=v_begin_amt;
       if v_error_code = "1" then
                   
           SET v_error_code = "evaA.3.19.1";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
           else
               SET v_error_info = concat("产品编号=",v_pd_no);
           end if;
           close cursor_eva_product_rate;
           leave label_pro;
       end if;

       #获取当日利息金额

        /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品账户资金表][ifnull({预计利息},0)][@预计利息#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {资产账户}=@资产账户#] */
        select ifnull(intrst_cacl_amt,0) into v_intrst_cacl_amt from db_eva_his.tb_evadata_pd_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and asset_acco=v_asset_acco limit 1;

       #更新当前金额

        /* [插入重复更新][历史_平台估值_估值汇总_估值产品利息表][字段][字段变量][{当前金额} = {当前金额} + @预计利息#][1][concat("更新历史估值产品利息表记录错误！【机构编号】=", @机构编号#,"【产品编号】=",@产品编号#,"【资产账户】=",@资产账户#)] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_eva_his.tb_evatotal_pd_interest_total_his (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, pd_rate_type, asset_acco, crncy_type, 
            begin_amt, curr_amt, intrst_base_amt, confirm_apply, 
            remark_info, manual_flag) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_pd_rate_type, v_asset_acco, v_crncy_type, 
            v_begin_amt, v_curr_amt, v_intrst_base_amt, v_confirm_apply, 
            v_remark_info, v_manual_flag) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt = curr_amt + v_intrst_cacl_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "evaA.3.19.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("更新历史估值产品利息表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【资产账户】=",v_asset_acco),"#",v_mysql_message);
            else
                SET v_error_info = concat("更新历史估值产品利息表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【资产账户】=",v_asset_acco);
            end if;
            close cursor_eva_product_rate;
            leave label_pro;
        end if;

        end if;

    /* [关闭游标][cursor_eva_product_rate] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_product_rate;
    end cursor_eva_product_rate;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_新增估值产品历史费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_addPdHisFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_addPdHisFeeAmt(
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
    declare v_init_date int;
    declare v_confirm_apply decimal(18,4);
    declare v_manual_flag int;
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_confirm_apply = 0;
    SET v_manual_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @初始化日期#=@估值日期#; */
    set v_init_date=v_evalu_date;

    /* set @确认金额#=0; */
    set v_confirm_apply=0;

    /* set @手工标志#=1; */
    set v_manual_flag=1;

    /* [插入重复更新][历史_平台估值_估值汇总_估值产品费用表][字段][字段变量][{期初金额}=@期初金额#,{当前金额}=@当前金额#,{产品净资产}=@产品净资产#,{备注信息}=@备注信息#,{手工标志}=@手工标志#][1][@备注信息#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva_his.tb_evatotal_pd_fee_total_his (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, pd_fee_type, crncy_type, begin_amt, 
        curr_amt, pd_net_asset, confirm_apply, remark_info, 
        manual_flag) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_pd_fee_type, v_crncy_type, v_begin_amt, 
        v_curr_amt, v_pd_net_asset, v_confirm_apply, v_remark_info, 
        v_manual_flag) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, begin_amt=v_begin_amt,curr_amt=v_curr_amt,pd_net_asset=v_pd_net_asset,remark_info=v_remark_info,manual_flag=v_manual_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.20.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("备注信息=",v_remark_info),"#",v_mysql_message);
        else
            SET v_error_info = concat("备注信息=",v_remark_info);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_修改估值产品历史费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_modiPdHisFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_modiPdHisFeeAmt(
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
    declare v_fee_note text;
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
    SET v_fee_note = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* if @备注信息# = '估值表更新' then */
    if v_remark_info = '估值表更新' then

       /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品费用表][{备注信息}][@费用备注#][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型# and {本币币种}=@本币币种#][2][@产品编号#] */
       select remark_info into v_fee_note from db_eva_his.tb_evatotal_pd_fee_total_his where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type and crncy_type=v_crncy_type limit 1;


           /* if @费用备注# <> ' ' then */
           if v_fee_note <> ' ' then

           /* set @备注信息#=@费用备注#; */
           set v_remark_info=v_fee_note;
        end  if;
    end if;

    /* [更新表记录][历史_平台估值_估值汇总_估值产品费用表][{当前金额}=@当前金额#,{产品净资产}=@产品净资产#,{确认金额}=@确认金额#,{备注信息}=@备注信息#,{手工标志}=1][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型# and {本币币种}=@本币币种#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva_his.tb_evatotal_pd_fee_total_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=v_curr_amt,pd_net_asset=v_pd_net_asset,confirm_apply=v_confirm_apply,remark_info=v_remark_info,manual_flag=1 where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.21.2";
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
use db_eva;;

# 原子_平台估值_估值汇总_删除估值产品历史费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_delPdHisFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_delPdHisFeeAmt(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [删除表记录][历史_平台估值_估值汇总_估值产品费用表][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型# and {本币币种}=@本币币种#][3][@产品编号#] */
    delete from db_eva_his.tb_evatotal_pd_fee_total_his 
        where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type and crncy_type=v_crncy_type;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.22.3";
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
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品历史费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdHisFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdHisFeeAmt(
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_平台估值_估值汇总_估值产品费用表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and {初始化日期}=@估值日期# and (@产品费用类型# =0 or {产品费用类型}=@产品费用类型#) and (@本币币种# =0 or {本币币种}=@本币币种#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_fee_type, crncy_type, 
        begin_amt, curr_amt, pd_net_asset, confirm_apply, 
        remark_info, manual_flag from db_eva_his.tb_evatotal_pd_fee_total_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and init_date=v_evalu_date and (v_pd_fee_type =0 or pd_fee_type=v_pd_fee_type) and (v_crncy_type =0 or crncy_type=v_crncy_type);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_fee_type, crncy_type, 
        begin_amt, curr_amt, pd_net_asset, confirm_apply, 
        remark_info, manual_flag from db_eva_his.tb_evatotal_pd_fee_total_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and init_date=v_evalu_date and (v_pd_fee_type =0 or pd_fee_type=v_pd_fee_type) and (v_crncy_type =0 or crncy_type=v_crncy_type) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_新增估值产品历史利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_addPdHisInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_addPdHisInterestAmt(
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
    declare v_init_date int;
    declare v_confirm_apply decimal(18,4);
    declare v_manual_flag int;
    declare v_pd_rate_type int;
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_confirm_apply = 0;
    SET v_manual_flag = 0;
    SET v_pd_rate_type = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @初始化日期#=@估值日期#; */
    set v_init_date=v_evalu_date;

    /* set @确认金额#=0; */
    set v_confirm_apply=0;

    /* set @手工标志#=1; */
    set v_manual_flag=1;

    /* set @产品利率类型#=0; */
    set v_pd_rate_type=0;

    /* [插入重复更新][历史_平台估值_估值汇总_估值产品利息表][字段][字段变量][{期初金额}=@期初金额#,{当前金额}=@当前金额#,{利息积数}=@利息积数#,{备注信息}=@备注信息#,{手工标志}=@手工标志#][1][@备注信息#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva_his.tb_evatotal_pd_interest_total_his (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, pd_rate_type, asset_acco, crncy_type, 
        begin_amt, curr_amt, intrst_base_amt, confirm_apply, 
        remark_info, manual_flag) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_pd_rate_type, v_asset_acco, v_crncy_type, 
        v_begin_amt, v_curr_amt, v_intrst_base_amt, v_confirm_apply, 
        v_remark_info, v_manual_flag) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, begin_amt=v_begin_amt,curr_amt=v_curr_amt,intrst_base_amt=v_intrst_base_amt,remark_info=v_remark_info,manual_flag=v_manual_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.24.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("备注信息=",v_remark_info),"#",v_mysql_message);
        else
            SET v_error_info = concat("备注信息=",v_remark_info);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_修改估值产品历史利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_modiPdHisInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_modiPdHisInterestAmt(
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][历史_平台估值_估值汇总_估值产品利息表][{当前金额}=@当前金额#,{利息积数}=@利息积数#,{确认金额}=@确认金额#,{备注信息}=@备注信息#,{手工标志}=1][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户}=@资产账户# and {本币币种}=@本币币种#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva_his.tb_evatotal_pd_interest_total_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=v_curr_amt,intrst_base_amt=v_intrst_base_amt,confirm_apply=v_confirm_apply,remark_info=v_remark_info,manual_flag=1 where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no and asset_acco=v_asset_acco and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.25.2";
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
use db_eva;;

# 原子_平台估值_估值汇总_删除估值产品历史利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_delPdHisInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_delPdHisInterestAmt(
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
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][历史_平台估值_估值汇总_估值产品利息表][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户}=@资产账户# and {本币币种}=@本币币种#][3][@产品编号#] */
    delete from db_eva_his.tb_evatotal_pd_interest_total_his 
        where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no and asset_acco=v_asset_acco and crncy_type=v_crncy_type;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.26.3";
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
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品历史利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdHisInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdHisInterestAmt(
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco = p_asset_acco;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_平台估值_估值汇总_估值产品利息表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and {初始化日期}=@估值日期# and (@资产账户# =" " or {资产账户}=@资产账户#) and (@本币币种# =0 or {本币币种}=@本币币种#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_rate_type, asset_acco, 
        crncy_type, begin_amt, curr_amt, intrst_base_amt, 
        confirm_apply, remark_info, manual_flag from db_eva_his.tb_evatotal_pd_interest_total_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and init_date=v_evalu_date and (v_asset_acco =" " or asset_acco=v_asset_acco) and (v_crncy_type =0 or crncy_type=v_crncy_type);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_rate_type, asset_acco, 
        crncy_type, begin_amt, curr_amt, intrst_base_amt, 
        confirm_apply, remark_info, manual_flag from db_eva_his.tb_evatotal_pd_interest_total_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and init_date=v_evalu_date and (v_asset_acco =" " or asset_acco=v_asset_acco) and (v_crncy_type =0 or crncy_type=v_crncy_type) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_更新产品费用利息期初金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_updatePdFeeRateBeginAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_updatePdFeeRateBeginAmt(
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
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pd_fee_type int;
    declare v_pd_fee_rate decimal(18,12);
    declare v_pd_fee_circle int;
    declare v_min_fee decimal(18,4);
    declare v_fina_acco_code varchar(64);
    declare v_calc_fee_date_str varchar(4096);
    declare v_eva_calc_type int;
    declare v_remark_info varchar(255);
    declare v_begin_amt decimal(18,4);
    declare v_evalu_deal_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pd_fee_type = 0;
    SET v_pd_fee_rate = 0;
    SET v_pd_fee_circle = 0;
    SET v_min_fee = 0;
    SET v_fina_acco_code = " ";
    SET v_calc_fee_date_str = " ";
    SET v_eva_calc_type = 0;
    SET v_remark_info = " ";
    SET v_begin_amt = 0;
    SET v_evalu_deal_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    
    #对估值产品费用表里的记录游标循环处理

    /* [声明游标][平台估值_基础参数_估值产品费率表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号#][cursor_eva_product_fee] */
    cursor_eva_product_fee:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_product_fee CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_fee_type, pd_fee_rate, pd_fee_circle, 
        min_fee, fina_acco_code, calc_fee_date_str, eva_calc_type, 
        remark_info 
        from db_eva.tb_evabasic_product_fee 
        where co_no=v_co_no and pd_no=v_pd_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_eva_product_fee][loop_eva_product_fee] */
    open cursor_eva_product_fee;
    loop_eva_product_fee: LOOP
    fetch cursor_eva_product_fee into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_pd_fee_type, v_pd_fee_rate, v_pd_fee_circle, 
        v_min_fee, v_fina_acco_code, v_calc_fee_date_str, v_eva_calc_type, 
        v_remark_info;
        IF v_cursor_done THEN
            LEAVE loop_eva_product_fee;
        END IF;

        #获取上日初始值

        /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品费用表][{当前金额}-{确认金额}][@期初金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@估值日期# and {产品费用类型}=@产品费用类型# order by {初始化日期} desc] */
        select curr_amt-confirm_apply into v_begin_amt from db_eva_his.tb_evatotal_pd_fee_total_his where co_no=v_co_no and pd_no=v_pd_no and init_date<v_evalu_date and pd_fee_type=v_pd_fee_type order by init_date desc limit 1;

       #初始化估值产品费用表期初金额

       /* [更新表记录][平台估值_估值汇总_估值产品费用表][{当前金额} = @期初金额#,{期初金额}=@期初金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {产品费用类型}=@产品费用类型# and {手工标志}=0][2][@产品编号#] */
       set v_update_date = date_format(curdate(),'%Y%m%d');
       set v_update_time = date_format(curtime(),'%H%i%s');
       update db_eva.tb_evatotal_pd_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = v_begin_amt,begin_amt=v_begin_amt where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and pd_fee_type=v_pd_fee_type and manual_flag=0;
       if v_error_code = "1" then
                   
           SET v_error_code = "evaA.3.28.2";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
           else
               SET v_error_info = concat("产品编号=",v_pd_no);
           end if;
           close cursor_eva_product_fee;
           leave label_pro;
       end if;


    /* [关闭游标][cursor_eva_product_fee] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_product_fee;
    end cursor_eva_product_fee;

    #初始化估值产品利息表当前金额

    /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品利息表][{初始化日期}][@估值处理日期#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@估值日期#  order by {初始化日期} desc] */
    select init_date into v_evalu_deal_date from db_eva_his.tb_evatotal_pd_interest_total_his where co_no=v_co_no and pd_no=v_pd_no and init_date<v_evalu_date  order by init_date desc limit 1;


    /* update ~平台估值_估值汇总_估值产品利息表^ a,~历史_平台估值_估值汇总_估值产品利息表^ b set a.{期初金额}= b.{当前金额}-b.{确认金额},a.{当前金额}=b.{当前金额}-b.{确认金额} where a.{机构编号} = b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{资产账户} =b.{资产账户} and a.{机构编号} = @机构编号# and a.{产品编号} = @产品编号# and a.{初始化日期}=@估值日期# and a.{手工标志}=0 and b.{初始化日期}=@估值处理日期#; */
    update db_eva.tb_evatotal_pd_interest_total a,db_eva_his.tb_evatotal_pd_interest_total_his b set a.begin_amt= b.curr_amt-b.confirm_apply,a.curr_amt=b.curr_amt-b.confirm_apply where a.co_no = b.co_no and a.pd_no=b.pd_no and a.asset_acco =b.asset_acco and a.co_no = v_co_no and a.pd_no = v_pd_no and a.init_date=v_evalu_date and a.manual_flag=0 and b.init_date=v_evalu_deal_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_获取产品货基收益
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_getProductMFYield;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_getProductMFYield(
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
    
    #update tb_eva_pd_secu_posi_his a,db_dc.tb_basesedt_mf_yield_perfor b set a.{利息收益} = case when b.{每万元当日收益}<>0 then b.{每万元当日收益} else a.{利息收益} end  where a.{市场编号} = b.{市场编号} and a.{证券代码} = b.{证券代码} and a.{机构编号} =@机构编号# and a.{产品编号} = @产品编号# and a.{初始化日期}=b.{交易日期} and a.{初始化日期}=@估值日期#;
    #update tb_eva_pd_secu_posi_his a,db_dc.tb_basesedt_mf_yield_perfor_his b set a.{利息收益} = case when b.{每万元当日收益}<>0 then b.{每万元当日收益} else a.{利息收益} end where a.{市场编号} = b.{市场编号} and a.{证券代码} = b.{证券代码} and a.{机构编号} =@机构编号# and a.{产品编号} = @产品编号# and a.{初始化日期}=b.{交易日期} and a.{初始化日期}=@估值日期#;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_计算债券当日利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_calcBondInterest;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_calcBondInterest(
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
    declare v_intrst_ratio decimal(18,12);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_asset_acco varchar(16);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_type int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_invest_type int;
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_curr_cost_amt decimal(18,4);
    declare v_last_price decimal(16,9);
    declare v_exch_rate decimal(18,12);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_repl_qty decimal(18,2);
    declare v_evalu_data_source int;
    declare v_bond_accr_intrst decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_intrst_ratio = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_asset_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_type = 0;
    SET v_stock_code = " ";
    SET v_stock_name = " ";
    SET v_invest_type = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_curr_cost_amt = 0;
    SET v_last_price = 0;
    SET v_exch_rate = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_repl_qty = 0;
    SET v_evalu_data_source = 0;
    SET v_bond_accr_intrst = 0;

    
    label_pro:BEGIN
    

    /* set @年利率#=0; */
    set v_intrst_ratio=0;
    #对估值产品持仓表里的记录游标循环处理

    /* [声明游标][平台估值_业务数据_估值产品证券持仓表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {证券类型} in (《证券类型-公司债》,《证券类型-企业债》,《证券类型-可交换公司债》)][cursor_eva_product_bond] */
    cursor_eva_product_bond:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_product_bond CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco, exch_no, 
        stock_acco, stock_type, stock_code, stock_name, 
        invest_type, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, curr_cost_amt, last_price, exch_rate, 
        realize_pandl, intrst_cost_amt, intrst_pandl, repl_qty, 
        evalu_data_source 
        from db_eva.tb_evadata_pd_secu_posi 
        where co_no=v_co_no and pd_no=v_pd_no and stock_type in (23,22,41);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_eva_product_bond][loop_eva_product_bond] */
    open cursor_eva_product_bond;
    loop_eva_product_bond: LOOP
    fetch cursor_eva_product_bond into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco, v_exch_no, 
        v_stock_acco, v_stock_type, v_stock_code, v_stock_name, 
        v_invest_type, v_begin_qty, v_curr_qty, v_frozen_qty, 
        v_unfroz_qty, v_curr_cost_amt, v_last_price, v_exch_rate, 
        v_realize_pandl, v_intrst_cost_amt, v_intrst_pandl, v_repl_qty, 
        v_evalu_data_source;
        IF v_cursor_done THEN
            LEAVE loop_eva_product_bond;
        END IF;

       #[获取表记录变量语句][db_dc.tb_basedt_bond_info][{票面面值},{年利率},{计息天数}][@票面面值#,@年利率#,@计息天数#][{证券代码}=@证券代码#]

       /* select {债券计提利息} into @债券计提利息# from db_dc.tb_basesedt_bond_info where {证券代码}=@证券代码# limit 1; */
       select bond_accr_intrst into v_bond_accr_intrst from db_dc.tb_basesedt_bond_info where stock_code=v_stock_code limit 1;
       #计算当日债券利息

       /* [更新表记录][平台估值_业务数据_估值产品证券持仓表][{利息收益} = round({当前数量}*@债券计提利息#,2)][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {证券代码}=@证券代码#][2][@产品编号#] */
       set v_update_date = date_format(curdate(),'%Y%m%d');
       set v_update_time = date_format(curtime(),'%H%i%s');
       update db_eva.tb_evadata_pd_secu_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, intrst_pandl = round(curr_qty*v_bond_accr_intrst,2) where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and stock_code=v_stock_code;
       if v_error_code = "1" then
                   
           SET v_error_code = "evaA.3.30.2";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
           else
               SET v_error_info = concat("产品编号=",v_pd_no);
           end if;
           close cursor_eva_product_bond;
           leave label_pro;
       end if;


    /* [关闭游标][cursor_eva_product_bond] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_product_bond;
    end cursor_eva_product_bond;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_计算债券历史利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_calcBondHisInterest;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_calcBondHisInterest(
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
    declare v_intrst_ratio decimal(18,12);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_asset_acco varchar(16);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_type int;
    declare v_stock_code varchar(6);
    declare v_stock_name varchar(64);
    declare v_invest_type int;
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_curr_cost_amt decimal(18,4);
    declare v_last_price decimal(16,9);
    declare v_exch_rate decimal(18,12);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_repl_qty decimal(18,2);
    declare v_evalu_data_source int;
    declare v_par_value decimal(16,9);
    declare v_intrst_days int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_intrst_ratio = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_asset_acco = " ";
    SET v_exch_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_type = 0;
    SET v_stock_code = " ";
    SET v_stock_name = " ";
    SET v_invest_type = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_curr_cost_amt = 0;
    SET v_last_price = 0;
    SET v_exch_rate = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_repl_qty = 0;
    SET v_evalu_data_source = 0;
    SET v_par_value = 0;
    SET v_intrst_days = 0;

    
    label_pro:BEGIN
    

    /* set @年利率#=0; */
    set v_intrst_ratio=0;
    #对估值产品持仓表里的记录游标循环处理

    /* [声明游标][历史_平台估值_业务数据_估值产品证券持仓表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {证券类型} in (《证券类型-公司债》,《证券类型-企业债》,《证券类型-可交换公司债》)][cursor_eva_product_bond] */
    cursor_eva_product_bond:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_product_bond CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco, exch_no, 
        stock_acco, stock_type, stock_code, stock_name, 
        invest_type, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, curr_cost_amt, last_price, exch_rate, 
        realize_pandl, intrst_cost_amt, intrst_pandl, repl_qty, 
        evalu_data_source 
        from db_eva_his.tb_evadata_pd_secu_posi_his 
        where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and stock_type in (23,22,41);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_eva_product_bond][loop_eva_product_bond] */
    open cursor_eva_product_bond;
    loop_eva_product_bond: LOOP
    fetch cursor_eva_product_bond into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco, v_exch_no, 
        v_stock_acco, v_stock_type, v_stock_code, v_stock_name, 
        v_invest_type, v_begin_qty, v_curr_qty, v_frozen_qty, 
        v_unfroz_qty, v_curr_cost_amt, v_last_price, v_exch_rate, 
        v_realize_pandl, v_intrst_cost_amt, v_intrst_pandl, v_repl_qty, 
        v_evalu_data_source;
        IF v_cursor_done THEN
            LEAVE loop_eva_product_bond;
        END IF;


        /* set @利息收益#=0; */
        set v_intrst_pandl=0;
        #获取上日初始值

        /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][{利息收益}][@利息收益#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {证券代码}=@证券代码# and {初始化日期}<@估值日期#  order by {初始化日期} desc] */
        select intrst_pandl into v_intrst_pandl from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and stock_code=v_stock_code and init_date<v_evalu_date  order by init_date desc limit 1;

       # [获取表记录变量语句][db_dc.tb_basesedt_bond_info][{票面面值},{年利率},{计息天数}][@票面面值#,@年利率#,@计息天数#][{证券代码}=@证券代码#]

        /* select {票面面值},{年利率},{计息天数} into @票面面值#,@年利率#,@计息天数# from db_dc.tb_basesedt_bond_info where {证券代码}=@证券代码# limit 1; */
        select par_value,intrst_ratio,intrst_days into v_par_value,v_intrst_ratio,v_intrst_days from db_dc.tb_basesedt_bond_info where stock_code=v_stock_code limit 1;
       #计算当日债券利息

       /* [更新表记录][历史_平台估值_业务数据_估值产品证券持仓表][{利息收益} = @利息收益#+round({当前数量}*@票面面值#*@年利率#/100/@计息天数#,2)][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {证券代码}=@证券代码#][2][@产品编号#] */
       set v_update_date = date_format(curdate(),'%Y%m%d');
       set v_update_time = date_format(curtime(),'%H%i%s');
       update db_eva_his.tb_evadata_pd_secu_posi_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, intrst_pandl = v_intrst_pandl+round(curr_qty*v_par_value*v_intrst_ratio/100/v_intrst_days,2) where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and stock_code=v_stock_code;
       if v_error_code = "1" then
                   
           SET v_error_code = "evaA.3.31.2";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
           else
               SET v_error_info = concat("产品编号=",v_pd_no);
           end if;
           close cursor_eva_product_bond;
           leave label_pro;
       end if;


    /* [关闭游标][cursor_eva_product_bond] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_product_bond;
    end cursor_eva_product_bond;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_新增估值产品费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_addPdFeeJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_addPdFeeJour(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][平台估值_估值汇总_估值产品费用流水表][字段][字段变量][{变动金额}=@变动金额#,{备注信息}=@备注信息#][1][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evatotal_product_fee_jour (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, pd_fee_type, crncy_type, occur_amt, 
        remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_pd_fee_type, v_crncy_type, v_occur_amt, 
        v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, occur_amt=v_occur_amt,remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.32.1";
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
use db_eva;;

# 原子_平台估值_估值汇总_修改估值产品费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_modiPdFeeJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_modiPdFeeJour(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][平台估值_估值汇总_估值产品费用流水表][{变动金额}=@变动金额#,{备注信息}=@备注信息#][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型# and {本币币种}=@本币币种#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evatotal_product_fee_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, occur_amt=v_occur_amt,remark_info=v_remark_info where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.33.2";
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
use db_eva;;

# 原子_平台估值_估值汇总_删除估值产品费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_delPdFeeJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_delPdFeeJour(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
    declare v_crncy_type varchar(3);
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
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_估值汇总_估值产品费用流水表][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=@产品费用类型# and {本币币种}=@本币币种#][3][@产品编号#] */
    delete from db_eva.tb_evatotal_product_fee_jour 
        where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=v_pd_fee_type and crncy_type=v_crncy_type;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.34.3";
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
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品费用流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdFeeJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdFeeJour(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_fee_type int;
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
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_估值汇总_估值产品费用流水表][字段][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#  and (@产品费用类型# =0 or {产品费用类型}=@产品费用类型#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_fee_type, crncy_type, 
        occur_amt, remark_info from db_eva.tb_evatotal_product_fee_jour where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no  and (v_pd_fee_type =0 or pd_fee_type=v_pd_fee_type);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_fee_type, crncy_type, 
        occur_amt, remark_info from db_eva.tb_evatotal_product_fee_jour where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no  and (v_pd_fee_type =0 or pd_fee_type=v_pd_fee_type) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_新增估值产品利息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_addPdInterestJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_addPdInterestJour(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_rate_type int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_pd_rate_type = p_pd_rate_type;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][平台估值_估值汇总_估值产品利息流水表][字段][字段变量][{变动金额}=@变动金额#,{备注信息}=@备注信息#][1][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evatotal_pd_interest_jour (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, pd_rate_type, crncy_type, occur_amt, 
        remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_pd_rate_type, v_crncy_type, v_occur_amt, 
        v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, occur_amt=v_occur_amt,remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.36.1";
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
use db_eva;;

# 原子_平台估值_估值汇总_修改估值产品利息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_modiPdInterestJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_modiPdInterestJour(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_rate_type int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_pd_rate_type = p_pd_rate_type;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][平台估值_估值汇总_估值产品利息流水表][{变动金额}=@变动金额#,{备注信息}=@备注信息#][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品利率类型}=@产品利率类型# and {本币币种}=@本币币种#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evatotal_pd_interest_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, occur_amt=v_occur_amt,remark_info=v_remark_info where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and pd_rate_type=v_pd_rate_type and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.37.2";
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
use db_eva;;

# 原子_平台估值_估值汇总_删除估值产品利息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_delPdInterestJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_delPdInterestJour(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_rate_type int;
    declare v_crncy_type varchar(3);
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
    SET v_pd_rate_type = p_pd_rate_type;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_估值汇总_估值产品利息流水表][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品利率类型}=@产品利率类型# and {本币币种}=@本币币种#][3][@产品编号#] */
    delete from db_eva.tb_evatotal_pd_interest_jour 
        where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and pd_rate_type=v_pd_rate_type and crncy_type=v_crncy_type;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.38.3";
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
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品利息流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdInterestJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdInterestJour(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_rate_type int;
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
    SET v_pd_rate_type = p_pd_rate_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_估值汇总_估值产品利息流水表][字段][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#  and (@产品利率类型# =0 or {产品利率类型}=@产品利率类型#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_rate_type, crncy_type, 
        occur_amt, remark_info from db_eva.tb_evatotal_pd_interest_jour where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no  and (v_pd_rate_type =0 or pd_rate_type=v_pd_rate_type);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_rate_type, crncy_type, 
        occur_amt, remark_info from db_eva.tb_evatotal_pd_interest_jour where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no  and (v_pd_rate_type =0 or pd_rate_type=v_pd_rate_type) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_更新产品历史份额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_updatePdHisShare;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_updatePdHisShare(
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_begin_share = 0;
    SET v_pd_curr_share = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
        #获取上日初始值

        /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品资产信息表][{产品当前份额}][@产品期初份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@估值日期# order by {初始化日期} desc] */
        select pd_curr_share into v_pd_begin_share from db_eva_his.tb_evatotal_product_asset_info_his where co_no=v_co_no and pd_no=v_pd_no and init_date<v_evalu_date order by init_date desc limit 1;

        #获取当日份额变动

        /* [获取表记录变量语句][平台估值_基础参数_估值产品份额流水表][ifnull(sum(case {变动方向} when 《变动方向-增加》 then {变动份额} else -1*{变动份额} end ),0)+@产品期初份额#][@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#][13030502][@产品编号#] */
        select ifnull(sum(case occur_dir when 1 then occur_share else -1*occur_share end ),0)+v_pd_begin_share into v_pd_curr_share from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date limit 1;

       #初始化估值产品资产信息表份额

       /* [更新表记录][历史_平台估值_估值汇总_估值产品资产信息表][{产品当前份额} = @产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#][2][@产品编号#] */
       set v_update_date = date_format(curdate(),'%Y%m%d');
       set v_update_time = date_format(curtime(),'%H%i%s');
       update db_eva_his.tb_evatotal_product_asset_info_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_curr_share = v_pd_curr_share where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date;
       if v_error_code = "1" then
                   
           SET v_error_code = "evaA.3.40.2";
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
use db_eva;;

# 原子_平台估值_估值汇总_更新产品银行账户历史变动
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_updatePdHisBankAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_updatePdHisBankAmt(
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
    declare v_init_date int;
    declare v_last_tradeday int;
    declare v_pd_acco_type int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_evalu_data_source int;
    declare v_begin_amt decimal(18,4);
    declare v_occur_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_last_tradeday = 0;
    SET v_pd_acco_type = 0;
    SET v_asset_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_evalu_data_source = 0;
    SET v_begin_amt = 0;
    SET v_occur_amt = 0;
    SET v_curr_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_intrst_base_amt = 0;
    SET v_intrst_cacl_amt = 0;

    
    label_pro:BEGIN
    

    /* set @系统日期#=date_format(curdate(),'%Y%m%d'); */
    set v_sys_date=date_format(curdate(),'%Y%m%d');

    /* set @初始化日期#=@估值日期#; */
    set v_init_date=v_evalu_date;

    /* set @上一交易日#=date_format(date_sub(@估值日期#,interval 1 day),'%Y%m%d'); */
    set v_last_tradeday=date_format(date_sub(v_evalu_date,interval 1 day),'%Y%m%d');
    #对估值产品资金表里的记录游标循环处理

      /* [声明游标][历史_平台估值_业务数据_估值产品账户资金表][{产品账户类型},{资产账户},{本币币种},{估值数据来源}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@上一交易日# and {产品账户类型} in （《产品账户类型-银行账户》,《产品账户类型-金融资产账户》,《产品账户类型-应付暂存账户》) order by {初始化日期} desc][cursor_eva_product_bank] */
      cursor_eva_product_bank:BEGIN
      DECLARE v_cursor_done int default false;
      DECLARE cursor_eva_product_bank CURSOR FOR
          select pd_acco_type,asset_acco,crncy_type,evalu_data_source 
          from db_eva_his.tb_evadata_pd_acco_capit_his 
          where co_no=v_co_no and pd_no=v_pd_no and init_date=v_last_tradeday and pd_acco_type in (1,11,12) order by init_date desc;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


      /* [打开游标][@产品账户类型#,@资产账户#,@本币币种#,@估值数据来源#][cursor_eva_product_bank][loop_eva_product_bank] */
      open cursor_eva_product_bank;
      loop_eva_product_bank: LOOP
      fetch cursor_eva_product_bank into v_pd_acco_type,v_asset_acco,v_crncy_type,v_evalu_data_source;
          IF v_cursor_done THEN
              LEAVE loop_eva_product_bank;
          END IF;

        #获取上日初始值

        /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品账户资金表][{当前金额}][@期初金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户}=@资产账户#  and {产品账户类型}=@产品账户类型# and {初始化日期}=@上一交易日# order by {初始化日期} desc] */
        select curr_amt into v_begin_amt from db_eva_his.tb_evadata_pd_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no and asset_acco=v_asset_acco  and pd_acco_type=v_pd_acco_type and init_date=v_last_tradeday order by init_date desc limit 1;

        #获取当日资金变动

        /* [获取表记录变量语句][平台估值_业务数据_估值产品银行流水表][ifnull(sum(case {变动方向} when 《变动方向-增加》 then {变动金额} else -1*{变动金额} end ),0)][@变动金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户}=@资产账户# and {初始化日期}=@估值日期#][13030502][@产品编号#] */
        select ifnull(sum(case occur_dir when 1 then occur_amt else -1*occur_amt end ),0) into v_occur_amt from db_eva.tb_evadata_product_bank_jour where co_no=v_co_no and pd_no=v_pd_no and asset_acco=v_asset_acco and init_date=v_evalu_date limit 1;


     /* set @当前金额# = @期初金额#+@变动金额#; */
     set v_curr_amt = v_begin_amt+v_occur_amt;

      /* if @估值日期#<@系统日期# then */
      if v_evalu_date<v_sys_date then
       #初始化估值产品账户资金表

        /* [插入重复更新][历史_平台估值_业务数据_估值产品账户资金表][字段][字段变量][{期初金额}=@期初金额#,{当前金额} = @当前金额#][2]["更新估值产品账户资金记录错误！"] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_eva_his.tb_evadata_pd_acco_capit_his (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, pd_acco_type, asset_acco, crncy_type, 
            begin_amt, curr_amt, frozen_amt, unfroz_amt, 
            intrst_base_amt, intrst_cacl_amt, evalu_data_source) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_pd_acco_type, v_asset_acco, v_crncy_type, 
            v_begin_amt, v_curr_amt, v_frozen_amt, v_unfroz_amt, 
            v_intrst_base_amt, v_intrst_cacl_amt, v_evalu_data_source) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, begin_amt=v_begin_amt,curr_amt = v_curr_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "evaA.3.41.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("更新估值产品账户资金记录错误！","#",v_mysql_message);
            else
                SET v_error_info = "更新估值产品账户资金记录错误！";
            end if;
            close cursor_eva_product_bank;
            leave label_pro;
        end if;

        #[更新表记录][历史_平台估值_业务数据_估值产品账户资金表][{期初金额}=@期初金额#,{当前金额} = @期初金额#+@变动金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and  {产品账户类型}=《产品账户类型-银行账户》 and {资产账户}=@资产账户# and {初始化日期}=@估值日期#][2][@产品编号#]
      else

        /* [插入重复更新][平台估值_业务数据_估值产品账户资金表][字段][字段变量][{期初金额}=@期初金额#,{当前金额} = @当前金额#][2]["更新估值产品账户资金记录错误！"] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_eva.tb_evadata_pd_acco_capit (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, pd_acco_type, asset_acco, crncy_type, 
            begin_amt, curr_amt, frozen_amt, unfroz_amt, 
            intrst_base_amt, intrst_cacl_amt, evalu_data_source) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_pd_acco_type, v_asset_acco, v_crncy_type, 
            v_begin_amt, v_curr_amt, v_frozen_amt, v_unfroz_amt, 
            v_intrst_base_amt, v_intrst_cacl_amt, v_evalu_data_source) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, begin_amt=v_begin_amt,curr_amt = v_curr_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "evaA.3.41.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("更新估值产品账户资金记录错误！","#",v_mysql_message);
            else
                SET v_error_info = "更新估值产品账户资金记录错误！";
            end if;
            close cursor_eva_product_bank;
            leave label_pro;
        end if;

      end if;

      /* [关闭游标][cursor_eva_product_bank] */
          IF v_cursor_done THEN
              set v_cursor_done = false;
          END IF;
      END LOOP;
      close cursor_eva_product_bank;
      end cursor_eva_product_bank;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_推算产品货基期初数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_calcPdMFBeginQty;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_calcPdMFBeginQty(
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
    declare v_stock_code varchar(6);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_intrst_pandl decimal(18,4);
    declare v_repl_qty decimal(18,2);
    declare v_occur_qty decimal(18,2);
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sys_date = date_format(curdate(),'%Y%m%d');
    SET v_stock_code = " ";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_intrst_pandl = 0;
    SET v_repl_qty = 0;
    SET v_occur_qty = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

        /* set @系统日期#=date_format(curdate(),'%Y%m%d'); */
        set v_sys_date=date_format(curdate(),'%Y%m%d');

            /* [声明游标][历史_平台估值_业务数据_估值产品证券持仓表][{证券代码},{期初数量},{当前数量},{利息收益},{替代数量}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=REPLACE(DATE_ADD(@估值日期#,INTERVAL -1 DAY),'-','') and {证券类型} in (《证券类型-ETF基金》,《证券类型-货币ETF基金》,《证券类型-封闭式基金》)][cursor_mffund] */
            cursor_mffund:BEGIN
            DECLARE v_cursor_done int default false;
            DECLARE cursor_mffund CURSOR FOR
                select stock_code,begin_qty,curr_qty,intrst_pandl,repl_qty 
                from db_eva_his.tb_evadata_pd_secu_posi_his 
                where co_no=v_co_no and pd_no=v_pd_no and init_date=REPLACE(DATE_ADD(v_evalu_date,INTERVAL -1 DAY),'-','') and stock_type in (52,57,51);
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@证券代码#,@期初数量#,@当前数量#,@利息收益#,@替代数量#][cursor_mffund][loop_mffund] */
            open cursor_mffund;
            loop_mffund: LOOP
            fetch cursor_mffund into v_stock_code,v_begin_qty,v_curr_qty,v_intrst_pandl,v_repl_qty;
                IF v_cursor_done THEN
                    LEAVE loop_mffund;
                END IF;


             /* if @替代数量# =0 then */
             if v_repl_qty =0 then

                  /* set @替代数量#=@当前数量#; */
                  set v_repl_qty=v_curr_qty;
             end if;

             /* if @替代数量# =0 then */
             if v_repl_qty =0 then

               /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][{当前数量}][@替代数量#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {证券代码}=@证券代码# and {初始化日期}=@估值日期#] */
               select curr_qty into v_repl_qty from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and stock_code=v_stock_code and init_date=v_evalu_date limit 1;

             end if;

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品成交表][ifnull(sum(case when {订单方向} in (《订单方向-买入》) then {成交数量} when {订单方向} in (《订单方向-卖出》) then -1*{成交数量} else 0 end),0)][@变动数量#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {证券代码}=@证券代码# and {成交日期}=@估值日期#] */
            select ifnull(sum(case when order_dir in (1) then strike_qty when order_dir in (2) then -1*strike_qty else 0 end),0) into v_occur_qty from db_eva_his.tb_evadata_pd_execution_his where co_no=v_co_no and pd_no=v_pd_no and stock_code=v_stock_code and strike_date=v_evalu_date limit 1;


            /* if @估值日期#<@系统日期# then */
            if v_evalu_date<v_sys_date then

            /* [更新表记录][历史_平台估值_业务数据_估值产品证券持仓表][{替代数量}=@替代数量#+@变动数量#+round(@替代数量#*@利息收益#/10000,0)][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {证券代码}=@证券代码# and {初始化日期} = @估值日期#][2]["证券持仓表"] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_eva_his.tb_evadata_pd_secu_posi_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, repl_qty=v_repl_qty+v_occur_qty+round(v_repl_qty*v_intrst_pandl/10000,0) where co_no = v_co_no and pd_no = v_pd_no and stock_code=v_stock_code and init_date = v_evalu_date;
            if v_error_code = "1" then
                        
                SET v_error_code = "evaA.3.42.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT("证券持仓表","#",v_mysql_message);
                else
                    SET v_error_info = "证券持仓表";
                end if;
                close cursor_mffund;
                leave label_pro;
            end if;

            else

            /* [更新表记录][平台估值_业务数据_估值产品证券持仓表][{替代数量}=@替代数量#+@变动数量#+round(@替代数量#*@利息收益#/10000,0)][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {证券代码}=@证券代码# and {初始化日期} = @估值日期#][2]["证券持仓表"] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_eva.tb_evadata_pd_secu_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, repl_qty=v_repl_qty+v_occur_qty+round(v_repl_qty*v_intrst_pandl/10000,0) where co_no = v_co_no and pd_no = v_pd_no and stock_code=v_stock_code and init_date = v_evalu_date;
            if v_error_code = "1" then
                        
                SET v_error_code = "evaA.3.42.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT("证券持仓表","#",v_mysql_message);
                else
                    SET v_error_info = "证券持仓表";
                end if;
                close cursor_mffund;
                leave label_pro;
            end if;

            end if;

            /* [关闭游标][cursor_mffund] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_mffund;
            end cursor_mffund;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_计算产品增值税
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_calcPdVat;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_calcPdVat(
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
    declare v_vat_loan decimal(18,4);
    declare v_calc_pay decimal(18,4);
    declare v_vat_pay_offset decimal(18,4);
    declare v_vat_pay_add decimal(18,4);
    declare v_vat_estimate_add decimal(18,4);
    declare v_vat_rate decimal(18,12);
    declare v_vat_add_rate decimal(18,12);
    declare v_last_init_date int;
    declare v_record_count int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pre_calc_pay decimal(18,4);
    declare v_pre_vat_pay_offset decimal(18,4);
    declare v_pre_vat_estimate_offset decimal(18,4);
    declare v_order_dir int;
    declare v_stock_code varchar(6);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_begin_qty decimal(18,2);
    declare v_offset_qty decimal(18,2);
    declare v_calc_value decimal(18,4);
    declare v_vat_transfer decimal(18,4);
    declare v_calc_estimate decimal(18,4);
    declare v_vat_estimate_offset decimal(18,4);
    declare v_vat_estimate decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_init_date int;
    declare v_curr_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_vat_loan = 0;
    SET v_calc_pay = 0;
    SET v_vat_pay_offset = 0;
    SET v_vat_pay_add = 0;
    SET v_vat_estimate_add = 0;
    SET v_vat_rate = 0;
    SET v_vat_add_rate = 0;
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');
    SET v_record_count = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pre_calc_pay = 0;
    SET v_pre_vat_pay_offset = 0;
    SET v_pre_vat_estimate_offset = 0;
    SET v_order_dir = 0;
    SET v_stock_code = " ";
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_begin_qty = 0;
    SET v_offset_qty = 0;
    SET v_calc_value = 0;
    SET v_vat_transfer = 0;
    SET v_calc_estimate = 0;
    SET v_vat_estimate_offset = 0;
    SET v_vat_estimate = 0;
    SET v_begin_amt = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_curr_amt = 0;

    
    label_pro:BEGIN
    
       #只能计算20180101之后的增值税

        /* if @估值日期#<20180101 then */
        if v_evalu_date<20180101 then
              leave label_pro;
        end if;

    /* set @系统日期#=date_format(curdate(),'%Y%m%d'); */
    set v_sys_date=date_format(curdate(),'%Y%m%d');

    /* set @贷款增值税#=0; */
    set v_vat_loan=0;

    /* set @转让计提金额#=0; */
    set v_calc_pay=0;

    /* set @转让抵扣额#=0; */
    set v_vat_pay_offset=0;

    /* set @转让增值税附加税#=0; */
    set v_vat_pay_add=0;

    /* set @预估增值税附加税#=0; */
    set v_vat_estimate_add=0;

    /* [获取表记录变量语句][平台估值_基础参数_估值产品增值税率表][{增值税率},{增值税附加税率}][@增值税率#,@增值税附加税率#][{机构编号}=@机构编号# and {产品编号}=@产品编号#] */
    select vat_rate,vat_add_rate into v_vat_rate,v_vat_add_rate from db_eva.tb_evabasic_pd_vat_config where co_no=v_co_no and pd_no=v_pd_no limit 1;

    #[删除表记录][平台估值_业务数据_估值产品证券持仓成本增值税表][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#][3][@产品编号#]

    /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓成本增值税表][{初始化日期}][@上日初始化日期#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@估值日期# order by {初始化日期} desc] */
    select init_date into v_last_init_date from db_eva.tb_evadata_pd_vat_cost where co_no=v_co_no and pd_no=v_pd_no and init_date<v_evalu_date order by init_date desc limit 1;


    /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓成本增值税表][count(*)][@记录个数#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#] */
    select count(*) into v_record_count from db_eva.tb_evadata_pd_vat_cost where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date limit 1;


    /* if @记录个数# =0 then */
    if v_record_count =0 then

    /* [读取插入表记录][平台估值_业务数据_估值产品证券持仓成本增值税表][平台估值_业务数据_估值产品证券持仓成本增值税表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{市场编号},{证券类型},{证券代码},{当前数量},{当前成本金额},{最新价},{成本价},{实现盈亏},{冲抵数量},{处理标志}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@估值日期#,{机构编号},{产品编号},{市场编号},{证券类型},{证券代码},{当前数量},{当前成本金额},{最新价},{成本价},{实现盈亏},{冲抵数量},{处理标志}][{初始化日期}=@上日初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#][1][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evadata_pd_vat_cost (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_no,stock_type,stock_code,curr_qty,curr_cost_amt,last_price,cost_price,realize_pandl,offset_qty,deal_flag) 
        select 
        v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_evalu_date,co_no,pd_no,exch_no,stock_type,stock_code,curr_qty,curr_cost_amt,last_price,cost_price,realize_pandl,offset_qty,deal_flag 
        from db_eva.tb_evadata_pd_vat_cost 
        where init_date=v_last_init_date and co_no=v_co_no and pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.43.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #当日卖出扣减数量

       /* UPDATE ~平台估值_业务数据_估值产品证券持仓成本增值税表^ a,~平台估值_估值汇总_估值产品增值税成交汇总表^ b  SET a.{当前数量}=a.{当前数量}-b.{成交数量},a.{当前成本金额}=a.{当前成本金额}*(a.{当前数量}-b.{成交数量})/a.{当前数量}  WHERE a.{机构编号}=b.{机构编号} AND a.{产品编号}=b.{产品编号} AND a.{初始化日期}=b.{初始化日期} AND a.{证券代码}=b.{证券代码} and b.{订单方向}=《订单方向-卖出》 AND a.{机构编号}=@机构编号# AND a.{产品编号}=@产品编号# AND a.{初始化日期}=@估值日期#; */
       UPDATE db_eva.tb_evadata_pd_vat_cost a,db_eva.tb_evatotal_pd_vat_transtotal b  SET a.curr_qty=a.curr_qty-b.strike_qty,a.curr_cost_amt=a.curr_cost_amt*(a.curr_qty-b.strike_qty)/a.curr_qty  WHERE a.co_no=b.co_no AND a.pd_no=b.pd_no AND a.init_date=b.init_date AND a.stock_code=b.stock_code and b.order_dir=2 AND a.co_no=v_co_no AND a.pd_no=v_pd_no AND a.init_date=v_evalu_date;
    #卖光了成本和成本价置0

    /* [更新表记录][平台估值_业务数据_估值产品证券持仓成本增值税表][{当前成本金额}=0,{成本价}=0][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {当前数量}=0][5][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evadata_pd_vat_cost set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_cost_amt=0,cost_price=0 where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no and curr_qty=0;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.43.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #当日买入新增

    /* [读取插入表记录][平台估值_业务数据_估值产品证券持仓成本增值税表][平台估值_估值汇总_估值产品增值税成交汇总表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{市场编号},{证券类型},{证券代码},{当前数量},{当前成本金额},{最新价},{成本价},{实现盈亏},{冲抵数量},{处理标志}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@估值日期#,{机构编号},{产品编号},0,0,{证券代码},{成交数量},{成交金额},0,0,0,0,0][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {订单方向}=《订单方向-买入》][4][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evadata_pd_vat_cost (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_no,stock_type,stock_code,curr_qty,curr_cost_amt,last_price,cost_price,realize_pandl,offset_qty,deal_flag) 
        select 
        v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_evalu_date,co_no,pd_no,0,0,stock_code,strike_qty,strike_amt,0,0,0,0,0 
        from db_eva.tb_evatotal_pd_vat_transtotal 
        where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no and order_dir=1;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.43.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


         /* if @估值日期#=@系统日期# then */
         if v_evalu_date=v_sys_date then

             /* UPDATE ~平台估值_业务数据_估值产品证券持仓成本增值税表^ a,~平台估值_业务数据_估值产品证券持仓表^ b  SET a.{最新价}=b.{最新价},a.{实现盈亏}=a.{当前数量}*b.{最新价}-a.{当前成本金额}  WHERE a.{机构编号}=b.{机构编号} AND a.{产品编号}=b.{产品编号} AND a.{初始化日期}=b.{初始化日期} AND a.{证券代码}=b.{证券代码} AND a.{机构编号}=@机构编号# AND a.{产品编号}=@产品编号# AND a.{初始化日期}=@估值日期#; */
             UPDATE db_eva.tb_evadata_pd_vat_cost a,db_eva.tb_evadata_pd_secu_posi b  SET a.last_price=b.last_price,a.realize_pandl=a.curr_qty*b.last_price-a.curr_cost_amt  WHERE a.co_no=b.co_no AND a.pd_no=b.pd_no AND a.init_date=b.init_date AND a.stock_code=b.stock_code AND a.co_no=v_co_no AND a.pd_no=v_pd_no AND a.init_date=v_evalu_date;
          else

             /* UPDATE ~平台估值_业务数据_估值产品证券持仓成本增值税表^ a,~历史_平台估值_业务数据_估值产品证券持仓表^ b  SET  a.{最新价}=b.{最新价},a.{实现盈亏}=a.{当前数量}*b.{最新价}-a.{当前成本金额}  WHERE a.{机构编号}=b.{机构编号} AND a.{产品编号}=b.{产品编号} AND a.{初始化日期}=b.{初始化日期} AND a.{证券代码}=b.{证券代码} AND a.{机构编号}=@机构编号# AND a.{产品编号}=@产品编号# AND a.{初始化日期}=@估值日期#; */
             UPDATE db_eva.tb_evadata_pd_vat_cost a,db_eva_his.tb_evadata_pd_secu_posi_his b  SET  a.last_price=b.last_price,a.realize_pandl=a.curr_qty*b.last_price-a.curr_cost_amt  WHERE a.co_no=b.co_no AND a.pd_no=b.pd_no AND a.init_date=b.init_date AND a.stock_code=b.stock_code AND a.co_no=v_co_no AND a.pd_no=v_pd_no AND a.init_date=v_evalu_date;
         end if;
    end if;
    #更新成交表成本字段

    /* UPDATE ~平台估值_估值汇总_估值产品增值税成交汇总表^ a,~平台估值_业务数据_估值产品证券持仓成本增值税表^ b  SET a.{成本价}=b.{当前成本金额}/b.{当前数量}  WHERE a.{机构编号}=b.{机构编号} AND a.{产品编号}=b.{产品编号} AND a.{初始化日期}=b.{初始化日期} AND a.{证券代码}=b.{证券代码} AND a.{订单方向}=《订单方向-卖出》 AND a.{机构编号}=@机构编号# AND a.{产品编号}=@产品编号# AND a.{初始化日期}=@估值日期# and b.{当前数量}>0; */
    UPDATE db_eva.tb_evatotal_pd_vat_transtotal a,db_eva.tb_evadata_pd_vat_cost b  SET a.cost_price=b.curr_cost_amt/b.curr_qty  WHERE a.co_no=b.co_no AND a.pd_no=b.pd_no AND a.init_date=b.init_date AND a.stock_code=b.stock_code AND a.order_dir=2 AND a.co_no=v_co_no AND a.pd_no=v_pd_no AND a.init_date=v_evalu_date and b.curr_qty>0;
    #如果卖光了要从前一天持仓取成本

    /* UPDATE ~平台估值_估值汇总_估值产品增值税成交汇总表^ a,~平台估值_业务数据_估值产品证券持仓成本增值税表^ b  SET a.{成本价}=b.{当前成本金额}/b.{当前数量},a.{处理标志}=1  WHERE a.{机构编号}=b.{机构编号} AND a.{产品编号}=b.{产品编号}  AND a.{证券代码}=b.{证券代码} AND a.{订单方向}=《订单方向-卖出》 AND a.{机构编号}=@机构编号# AND a.{产品编号}=@产品编号# AND a.{初始化日期}=@估值日期# and b.{初始化日期}=@上日初始化日期# and a.{成本价}=0; */
    UPDATE db_eva.tb_evatotal_pd_vat_transtotal a,db_eva.tb_evadata_pd_vat_cost b  SET a.cost_price=b.curr_cost_amt/b.curr_qty,a.deal_flag=1  WHERE a.co_no=b.co_no AND a.pd_no=b.pd_no  AND a.stock_code=b.stock_code AND a.order_dir=2 AND a.co_no=v_co_no AND a.pd_no=v_pd_no AND a.init_date=v_evalu_date and b.init_date=v_last_init_date and a.cost_price=0;
    #上日转让抵扣金额

    /* [获取表记录变量语句][平台估值_估值汇总_估值产品增值税计算表][{转让计提金额},{转让抵扣额},{预估抵扣额}][@上日转让计提金额#,@上日转让抵扣额#,@上日预估抵扣额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@上日初始化日期#] */
    select calc_pay,vat_pay_offset,vat_estimate_offset into v_pre_calc_pay,v_pre_vat_pay_offset,v_pre_vat_estimate_offset from db_eva.tb_evatotal_pd_vat_calc where co_no=v_co_no and pd_no=v_pd_no and init_date=v_last_init_date limit 1;

    #转让增值税

    /* [获取表记录变量语句][平台估值_估值汇总_估值产品增值税成交汇总表][ifnull(round(sum({成交金额}+{全部费用}-round({成本价}*{成交数量},2)),2),0)][@转让计提金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {订单方向}=《订单方向-卖出》] */
    select ifnull(round(sum(strike_amt+all_fee-round(cost_price*strike_qty,2)),2),0) into v_calc_pay from db_eva.tb_evatotal_pd_vat_transtotal where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and order_dir=2 limit 1;


    /* if @上日预估抵扣额#>0 then */
    if v_pre_vat_estimate_offset>0 then
    #更新17年底抵扣金额需要考虑

    /* UPDATE ~平台估值_估值汇总_估值产品增值税成交汇总表^ a,~平台估值_业务数据_估值产品证券持仓成本增值税表^ b  SET a.{期初数量}=b.{当前数量},a.{冲抵数量}=a.{成交数量},a.{实现盈亏}=b.{实现盈亏}  WHERE a.{机构编号}=b.{机构编号} AND a.{产品编号}=b.{产品编号}  AND a.{证券代码}=b.{证券代码} AND a.{订单方向}=《订单方向-卖出》 AND a.{机构编号}=@机构编号# AND a.{产品编号}=@产品编号# AND a.{初始化日期}=@估值日期# and b.{初始化日期}=20171231 and b.{实现盈亏}>0; */
    UPDATE db_eva.tb_evatotal_pd_vat_transtotal a,db_eva.tb_evadata_pd_vat_cost b  SET a.begin_qty=b.curr_qty,a.offset_qty=a.strike_qty,a.realize_pandl=b.realize_pandl  WHERE a.co_no=b.co_no AND a.pd_no=b.pd_no  AND a.stock_code=b.stock_code AND a.order_dir=2 AND a.co_no=v_co_no AND a.pd_no=v_pd_no AND a.init_date=v_evalu_date and b.init_date=20171231 and b.realize_pandl>0;
    end if;
    #循环计算抵扣数量

    /* [声明游标][平台估值_估值汇总_估值产品增值税成交汇总表][{订单方向},{证券代码},{成交数量},{成交金额},{期初数量}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#][cursor_stock_code] */
    cursor_stock_code:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_stock_code CURSOR FOR
        select order_dir,stock_code,strike_qty,strike_amt,begin_qty 
        from db_eva.tb_evatotal_pd_vat_transtotal 
        where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@订单方向#,@证券代码#,@成交数量#,@成交金额#,@期初数量#][cursor_stock_code][loop_stock_code] */
            open cursor_stock_code;
            loop_stock_code: LOOP
            fetch cursor_stock_code into v_order_dir,v_stock_code,v_strike_qty,v_strike_amt,v_begin_qty;
                IF v_cursor_done THEN
                    LEAVE loop_stock_code;
                END IF;


            /* if @订单方向#=《订单方向-卖出》 then */
            if v_order_dir=2 then

                 /* [获取表记录变量语句][平台估值_估值汇总_估值产品增值税成交汇总表][{冲抵数量}][@冲抵数量#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {证券代码}=@证券代码# and {初始化日期}<@估值日期# order by {初始化日期} desc] */
                 select offset_qty into v_offset_qty from db_eva.tb_evatotal_pd_vat_transtotal where co_no=v_co_no and pd_no=v_pd_no and stock_code=v_stock_code and init_date<v_evalu_date order by init_date desc limit 1;


                 /* if (@成交数量#>@期初数量#-@冲抵数量# and @期初数量#>0) then */
                 if (v_strike_qty>v_begin_qty-v_offset_qty and v_begin_qty>0) then

                     /* set @成交数量#=@期初数量#-@冲抵数量#; */
                     set v_strike_qty=v_begin_qty-v_offset_qty;

                     /* [更新表记录][平台估值_估值汇总_估值产品增值税成交汇总表][{冲抵数量}=@成交数量#][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {证券代码}=@证券代码#][2][@产品编号#,@证券代码#] */
                     set v_update_date = date_format(curdate(),'%Y%m%d');
                     set v_update_time = date_format(curtime(),'%H%i%s');
                     update db_eva.tb_evatotal_pd_vat_transtotal set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, offset_qty=v_strike_qty where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no and stock_code=v_stock_code;
                     if v_error_code = "1" then
                                 
                         SET v_error_code = "evaA.3.43.2";
                         if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","证券代码=",v_stock_code),"#",v_mysql_message);
                         else
                             SET v_error_info = concat("产品编号=",v_pd_no,",","证券代码=",v_stock_code);
                         end if;
                         close cursor_stock_code;
                         leave label_pro;
                     end if;

                 end if;
             end if;

    /* [关闭游标][cursor_stock_code] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_stock_code;
    end cursor_stock_code;

    #计算转让抵扣金额

    /* [获取表记录变量语句][平台估值_估值汇总_估值产品增值税成交汇总表][ifnull(round(sum({冲抵数量}*{实现盈亏}/{期初数量}),2),0)][@转让抵扣额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {订单方向}=《订单方向-卖出》] */
    select ifnull(round(sum(offset_qty*realize_pandl/begin_qty),2),0) into v_vat_pay_offset from db_eva.tb_evatotal_pd_vat_transtotal where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and order_dir=2 limit 1;


    /* set @计算值#=@转让抵扣额#; */
    set v_calc_value=v_vat_pay_offset;
    #上日转让抵扣金额
    #[获取表记录变量语句][平台估值_估值汇总_估值产品增值税计算表][{转让计提金额},{转让抵扣额},{预估抵扣额}][@上日转让计提金额#,@上日转让抵扣额#,@上日预估抵扣额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@上日初始化日期#]

    /* set @转让计提金额#=round(@转让计提金额#+@上日转让计提金额#,2); */
    set v_calc_pay=round(v_calc_pay+v_pre_calc_pay,2);

    /* set @转让抵扣额#=round(@转让抵扣额#+@上日转让抵扣额#,2); */
    set v_vat_pay_offset=round(v_vat_pay_offset+v_pre_vat_pay_offset,2);

    /* set @转让增值税#=round((@转让计提金额#-@转让抵扣额#)/(1+@增值税率#)*@增值税率#,2); */
    set v_vat_transfer=round((v_calc_pay-v_vat_pay_offset)/(1+v_vat_rate)*v_vat_rate,2);

    /* set @转让增值税附加税#=round(@转让增值税#*@增值税附加税率#,2); */
    set v_vat_pay_add=round(v_vat_transfer*v_vat_add_rate,2);
    #预估增值税

    /* if @估值日期#<=@系统日期# then */
    if v_evalu_date<=v_sys_date then

    /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓成本增值税表][ifnull(round(sum({实现盈亏}),2),0)][@预估计提金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#] */
    select ifnull(round(sum(realize_pandl),2),0) into v_calc_estimate from db_eva.tb_evadata_pd_vat_cost where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date limit 1;


    /* if @估值日期#=20180102 then */
    if v_evalu_date=20180102 then

    /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓成本增值税表][ifnull(round(sum({实现盈亏}),2),0)][@上日预估抵扣额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=20171231 and {实现盈亏}>0 and {证券代码} in (select {证券代码} from ~平台估值_业务数据_估值产品证券持仓成本增值税表^ where {机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#)] */
    select ifnull(round(sum(realize_pandl),2),0) into v_pre_vat_estimate_offset from db_eva.tb_evadata_pd_vat_cost where co_no=v_co_no and pd_no=v_pd_no and init_date=20171231 and realize_pandl>0 and stock_code in (select stock_code from db_eva.tb_evadata_pd_vat_cost where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date) limit 1;

    end if;

    /* set @预估抵扣额#=round(@上日预估抵扣额#-@计算值#,2); */
    set v_vat_estimate_offset=round(v_pre_vat_estimate_offset-v_calc_value,2);

    /* set @预估增值税#=round((@预估计提金额#-@预估抵扣额#+case when (@转让计提金额#-@转让抵扣额#)<0 then @转让计提金额#-@转让抵扣额# else 0 end )/(1+@增值税率#)*@增值税率#,2); */
    set v_vat_estimate=round((v_calc_estimate-v_vat_estimate_offset+case when (v_calc_pay-v_vat_pay_offset)<0 then v_calc_pay-v_vat_pay_offset else 0 end )/(1+v_vat_rate)*v_vat_rate,2);

    /* set @预估增值税附加税#=round(@预估增值税#*@增值税附加税率#,2); */
    set v_vat_estimate_add=round(v_vat_estimate*v_vat_add_rate,2);
    else

    /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓成本增值税表][ifnull(sum({实现盈亏}),0)][@预估计提金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#] */
    select ifnull(sum(realize_pandl),0) into v_calc_estimate from db_eva.tb_evadata_pd_vat_cost where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date limit 1;


    /* set @预估增值税#=round((@预估计提金额#)/(1+@增值税率#)*@增值税率#,2); */
    set v_vat_estimate=round((v_calc_estimate)/(1+v_vat_rate)*v_vat_rate,2);
    end if;

    /* [获取表记录变量语句][平台估值_估值汇总_估值产品增值税计算表][ifnull({转让增值税},0)][@期初金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@估值日期# order by {初始化日期} desc] */
    select ifnull(vat_transfer,0) into v_begin_amt from db_eva.tb_evatotal_pd_vat_calc where co_no=v_co_no and pd_no=v_pd_no and init_date<v_evalu_date order by init_date desc limit 1;


    /* set @初始化日期#=@估值日期#; */
    set v_init_date=v_evalu_date;
    #更新结果

    /* [插入重复更新][平台估值_估值汇总_估值产品增值税计算表][字段][字段变量][{转让计提金额}=@转让计提金额#,{转让抵扣额}=@转让抵扣额#,{转让增值税}=@转让增值税#,{转让增值税附加税}=@转让增值税附加税#,{预估计提金额}=@预估计提金额#,{预估抵扣额}=@预估抵扣额#,{预估增值税}=@预估增值税#,{预估增值税附加税}=@预估增值税附加税#][6][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evatotal_pd_vat_calc (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, vat_loan, calc_pay, vat_pay_offset, 
        vat_transfer, vat_pay_add, calc_estimate, vat_estimate_offset, 
        vat_estimate, vat_estimate_add) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_vat_loan, v_calc_pay, v_vat_pay_offset, 
        v_vat_transfer, v_vat_pay_add, v_calc_estimate, v_vat_estimate_offset, 
        v_vat_estimate, v_vat_estimate_add) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, calc_pay=v_calc_pay,vat_pay_offset=v_vat_pay_offset,vat_transfer=v_vat_transfer,vat_pay_add=v_vat_pay_add,calc_estimate=v_calc_estimate,vat_estimate_offset=v_vat_estimate_offset,vat_estimate=v_vat_estimate,vat_estimate_add=v_vat_estimate_add;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.43.6";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* if @估值日期# = @系统日期# then */
    if v_evalu_date = v_sys_date then

       /* set @当前金额#=@转让增值税#+@转让增值税附加税#+@预估增值税#+@预估增值税附加税#; */
       set v_curr_amt=v_vat_transfer+v_vat_pay_add+v_vat_estimate+v_vat_estimate_add;

       /* [更新表记录][平台估值_估值汇总_估值产品费用表][{当前金额}=@当前金额#][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=《产品费用类型-应交税金》][2][@产品编号#] */
       set v_update_date = date_format(curdate(),'%Y%m%d');
       set v_update_time = date_format(curtime(),'%H%i%s');
       update db_eva.tb_evatotal_pd_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=v_curr_amt where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=21;
       if v_error_code = "1" then
                   
           SET v_error_code = "evaA.3.43.2";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
           else
               SET v_error_info = concat("产品编号=",v_pd_no);
           end if;
           leave label_pro;
       end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_获取持仓从估值表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_getPdPosiByValTable;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_getPdPosiByValTable(
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
    declare v_record_count int;
    declare v_fina_acco_code varchar(64);
    declare v_config_str varchar(2048);
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_fina_acco_code = " ";
    SET v_config_str = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][平台估值_估值汇总_估值产品外部估值项目表][count(*)][@记录个数#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#] */
    select count(*) into v_record_count from db_eva.tb_evatotal_pd_asset_check where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date limit 1;


    /* set @记录个数#=ifnull(@记录个数#,0); */
    set v_record_count=ifnull(v_record_count,0);

    /* if @记录个数#>0 then */
    if v_record_count>0 then

    /* [删除表记录][平台估值_业务数据_估值产品证券持仓成本增值税表][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期} = @估值日期#][3][@产品编号#] */
    delete from db_eva.tb_evadata_pd_vat_cost 
        where co_no=v_co_no and pd_no=v_pd_no and init_date = v_evalu_date;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.44.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [声明游标][平台估值_基础参数_估值科目表][{科目代码},{参数配置串}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {估值核对类型}=《估值核对类型-增值税》][cursor_fina_code] */
    cursor_fina_code:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_fina_code CURSOR FOR
        select fina_acco_code,config_str 
        from db_eva.tb_evabasic_account_name 
        where co_no=v_co_no and pd_no=v_pd_no and eva_check_type=5;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@科目代码#,@参数配置串#][cursor_fina_code][loop_fina_code] */
            open cursor_fina_code;
            loop_fina_code: LOOP
            fetch cursor_fina_code into v_fina_acco_code,v_config_str;
                IF v_cursor_done THEN
                    LEAVE loop_fina_code;
                END IF;


            /* [读取插入表记录][平台估值_业务数据_估值产品证券持仓成本增值税表][平台估值_估值汇总_估值产品外部估值项目表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{市场编号},{证券类型},{证券代码},{当前数量},{当前成本金额},{最新价},{成本价},{实现盈亏},{冲抵数量},{处理标志}][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},@参数配置串#,0,REPLACE({科目代码},@科目代码#,''),{数量},{成本},{市价},{单位成本},case when {估值增值串} = ' ' then 0 else REPLACE({估值增值串},',','') end,0,0][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {科目代码} like concat(@科目代码#,'%') and {科目代码}<>@科目代码#][1][@产品编号#,@估值日期#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_eva.tb_evadata_pd_vat_cost (
                create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_no,stock_type,stock_code,curr_qty,curr_cost_amt,last_price,cost_price,realize_pandl,offset_qty,deal_flag) 
                select 
                create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,v_config_str,0,REPLACE(fina_acco_code,v_fina_acco_code,''),amount,prime_cost,market_price,unit_cost,case when evalu_add_str = ' ' then 0 else REPLACE(evalu_add_str,',','') end,0,0 
                from db_eva.tb_evatotal_pd_asset_check 
                where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and fina_acco_code like concat(v_fina_acco_code,'%') and fina_acco_code<>v_fina_acco_code;
            if v_error_code = "1" then
                        
                SET v_error_code = "evaA.3.44.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","估值日期=",v_evalu_date),"#",v_mysql_message);
                else
                    SET v_error_info = concat("产品编号=",v_pd_no,",","估值日期=",v_evalu_date);
                end if;
                close cursor_fina_code;
                leave label_pro;
            end if;


    /* [关闭游标][cursor_fina_code] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_fina_code;
    end cursor_fina_code;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_新增产品增值税成交流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_addPdVatTrans;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_addPdVatTrans(
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
    IN p_strike_no varchar(64),
    IN p_strike_time int,
    IN p_stock_code varchar(6),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_all_fee decimal(18,4),
    IN p_cost_price decimal(16,9),
    IN p_offset_qty decimal(18,2),
    IN p_deal_flag int,
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
    declare v_strike_no varchar(64);
    declare v_strike_time int;
    declare v_stock_code varchar(6);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_cost_price decimal(16,9);
    declare v_offset_qty decimal(18,2);
    declare v_deal_flag int;
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
    SET v_order_dir = p_order_dir;
    SET v_strike_no = p_strike_no;
    SET v_strike_time = p_strike_time;
    SET v_stock_code = p_stock_code;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_all_fee = p_all_fee;
    SET v_cost_price = p_cost_price;
    SET v_offset_qty = p_offset_qty;
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][平台估值_估值汇总_估值产品增值税成交计算表][字段][字段变量][1][@产品编号#,@初始化日期#,@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evatotal_pd_vat_transcalc(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, order_dir, strike_no, strike_time, 
        stock_code, strike_price, strike_qty, strike_amt, 
        all_fee, cost_price, offset_qty, deal_flag) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_order_dir, v_strike_no, v_strike_time, 
        v_stock_code, v_strike_price, v_strike_qty, v_strike_amt, 
        v_all_fee, v_cost_price, v_offset_qty, v_deal_flag);
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.45.1";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","初始化日期=",v_init_date,",","证券代码=",v_stock_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_删除产品增值税成交流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_delPdVatTrans;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_delPdVatTrans(
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
    

    /* [删除表记录][平台估值_估值汇总_估值产品增值税成交计算表][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期} between @开始日期# and @结束日期#][3][@产品编号#] */
    delete from db_eva.tb_evatotal_pd_vat_transcalc 
        where co_no=v_co_no and pd_no=v_pd_no and init_date between v_begin_date and v_end_date;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.46.3";
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
use db_eva;;

# 原子_平台估值_估值汇总_生成产品增值税成交汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_createPdVatTransTotal;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_createPdVatTransTotal(
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_估值汇总_估值产品增值税成交汇总表][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期} = @估值日期#][3][@产品编号#] */
    delete from db_eva.tb_evatotal_pd_vat_transtotal 
        where co_no=v_co_no and pd_no=v_pd_no and init_date = v_evalu_date;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.47.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [读取插入表记录][平台估值_估值汇总_估值产品增值税成交汇总表][平台估值_估值汇总_估值产品增值税成交计算表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{订单方向},{证券代码},{成交数量},{成交金额},{全部费用},{成本价},{冲抵数量},{实现盈亏},{期初数量},{处理标志}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@估值日期#,@机构编号#,@产品编号#,{订单方向},{证券代码},sum(abs({成交数量})),sum(abs({成交金额})),sum(abs({全部费用})),0,0,0,0,0][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#  group by {订单方向},{证券代码}][1][@产品编号#,@估值日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evatotal_pd_vat_transtotal (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,order_dir,stock_code,strike_qty,strike_amt,all_fee,cost_price,offset_qty,realize_pandl,begin_qty,deal_flag) 
        select 
        v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_evalu_date,v_co_no,v_pd_no,order_dir,stock_code,sum(abs(strike_qty)),sum(abs(strike_amt)),sum(abs(all_fee)),0,0,0,0,0 
        from db_eva.tb_evatotal_pd_vat_transcalc 
        where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date  group by order_dir,stock_code;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.47.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","估值日期=",v_evalu_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","估值日期=",v_evalu_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_查询产品增值税成交汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdVatTransTotal;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdVatTransTotal(
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
    

    /* [获取表记录][平台估值_估值汇总_估值产品增值税成交汇总表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, order_dir, stock_code, 
        strike_qty, strike_amt, all_fee, cost_price, 
        offset_qty, realize_pandl, begin_qty, deal_flag from db_eva.tb_evatotal_pd_vat_transtotal where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, order_dir, stock_code, 
        strike_qty, strike_amt, all_fee, cost_price, 
        offset_qty, realize_pandl, begin_qty, deal_flag from db_eva.tb_evatotal_pd_vat_transtotal where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_删除产品增值税成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_delPdVatTransJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_delPdVatTransJour(
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
    

    /* [删除表记录][平台估值_估值汇总_估值产品增值税成交计算表][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {记录序号}=@记录序号#][3][@产品编号#] */
    delete from db_eva.tb_evatotal_pd_vat_transcalc 
        where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no and row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.49.3";
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
use db_eva;;

# 原子_平台估值_估值汇总_查询产品增值税成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdVatTransJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdVatTransJour(
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
    declare v_evalu_date int;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_估值汇总_估值产品增值税成交计算表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and (@证券代码# = '' or {证券代码}=@证券代码#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, order_dir, strike_no, 
        strike_time, stock_code, strike_price, strike_qty, 
        strike_amt, all_fee, cost_price, offset_qty, 
        deal_flag from db_eva.tb_evatotal_pd_vat_transcalc where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and (v_stock_code = '' or stock_code=v_stock_code);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, order_dir, strike_no, 
        strike_time, stock_code, strike_price, strike_qty, 
        strike_amt, all_fee, cost_price, offset_qty, 
        deal_flag from db_eva.tb_evatotal_pd_vat_transcalc where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and (v_stock_code = '' or stock_code=v_stock_code) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_新增外部估值科目数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_addPdFinaValue;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_addPdFinaValue(
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
    declare v_evalu_add_value decimal(18,4);
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
    SET v_evalu_add_value = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @估值增值#=0; */
    set v_evalu_add_value=0;

    /* [插入重复更新][平台估值_估值汇总_估值产品外部估值项目表][字段][字段变量][{科目名称}=@科目名称#,{数量}=@数量#,{单位成本}=@单位成本#,{成本}=@成本#,{成本占净值}=@成本占净值#,{市价}=@市价#,{市值}=@市值#,{市值占净值}=@市值占净值#,{估值增值串}=@估值增值串#,{停牌信息}=@停牌信息#,{权益信息}=@权益信息#][1][@科目名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evatotal_pd_asset_check (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, fina_acco_code, fina_acco_name, amount, 
        unit_cost, prime_cost, cost_net_ratio, market_price, 
        market_value, market_net_ratio, evalu_add_value, evalu_add_str, 
        stop_info, rights_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_fina_acco_code, v_fina_acco_name, v_amount, 
        v_unit_cost, v_prime_cost, v_cost_net_ratio, v_market_price, 
        v_market_value, v_market_net_ratio, v_evalu_add_value, v_evalu_add_str, 
        v_stop_info, v_rights_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, fina_acco_name=v_fina_acco_name,amount=v_amount,unit_cost=v_unit_cost,prime_cost=v_prime_cost,cost_net_ratio=v_cost_net_ratio,market_price=v_market_price,market_value=v_market_value,market_net_ratio=v_market_net_ratio,evalu_add_str=v_evalu_add_str,stop_info=v_stop_info,rights_info=v_rights_info;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.51.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("科目名称=",v_fina_acco_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("科目名称=",v_fina_acco_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_查询外部估值科目数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdFinaValue;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdFinaValue(
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
    

    /* [获取表记录][平台估值_估值汇总_估值产品外部估值项目表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and {初始化日期}=@估值日期# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, fina_acco_code, fina_acco_name, 
        amount, unit_cost, prime_cost, cost_net_ratio, 
        market_price, market_value, market_net_ratio, evalu_add_value, 
        evalu_add_str, stop_info, rights_info from db_eva.tb_evatotal_pd_asset_check where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and init_date=v_evalu_date order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, fina_acco_code, fina_acco_name, 
        amount, unit_cost, prime_cost, cost_net_ratio, 
        market_price, market_value, market_net_ratio, evalu_add_value, 
        evalu_add_str, stop_info, rights_info from db_eva.tb_evatotal_pd_asset_check where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and init_date=v_evalu_date order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_查询外部估值数据核对结果
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdFinaCheckResult;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdFinaCheckResult(
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
    

    /* select a.{初始化日期},a.{机构编号},a.{产品编号},a.{产品当前份额},sum(case when b.{产品当前份额配置串}=c.{科目代码} then c.{市值} else 0 end) as {产品当前份额标准},a.{总资产},sum(case when b.{总资产配置串}=c.{科目代码} then c.{市值} else 0 end) as {总资产标准}, a.{净资产},sum(case when b.{净资产配置串}=c.{科目代码} then c.{市值} else 0 end) as {净资产标准},a.{现金余额},sum(case when b.{现金余额配置串}=c.{科目代码} then c.{市值} else 0 end) as {现金余额标准},a.{账户余额},sum(case when b.{账户余额配置串}=c.{科目代码} then c.{市值} else 0 end) as {账户余额标准},a.{股票市值},sum(case when b.{股票市值配置串}=c.{科目代码} then c.{市值} else 0 end) as {股票市值标准},a.{基金资产},sum(case when b.{基金资产配置串}=c.{科目代码} then c.{市值} else 0 end) as {基金资产标准},a.{债券资产},sum(case when b.{债券资产配置串}=c.{科目代码} then c.{市值} else 0 end) as {债券资产标准},a.{期货资产},sum(case when b.{期货资产配置串}=c.{科目代码} then c.{市值} else 0 end) as {期货资产标准},a.{期权资产},sum(case when b.{期权资产配置串}=c.{科目代码} then c.{市值} else 0 end) as {期权资产标准},a.{其他资产},sum(case when b.{其他资产配置串}=c.{科目代码} then c.{市值} else 0 end) as {其他资产标准},a.{累计应收额},sum(case when b.{累计应收额配置串}=c.{科目代码} then c.{市值} else 0 end) as {累计应收额标准},a.{累计应付额},sum(case when b.{累计应付额配置串}=c.{科目代码} then c.{市值} else 0 end) as {累计应付额标准},a.{单位净值},sum(case when b.{单位净值配置串}=c.{科目代码} then c.{市值} else 0 end) as {单位净值标准} from ~历史_平台估值_估值汇总_估值产品资产信息表^ a,~平台估值_基础参数_估值产品核对配置表^ b,~平台估值_估值汇总_估值产品外部估值项目表^ c where a.{机构编号}=b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{机构编号}=c.{机构编号} and a.{产品编号}=c.{产品编号} and a.{初始化日期}=c.{初始化日期} and a.{机构编号}=@机构编号# and (@产品编号#=0 or a.{产品编号}=@产品编号#) and a.{初始化日期} between @开始日期# and @结束日期# group by c.{机构编号},c.{产品编号},c.{初始化日期}; */
    select a.init_date,a.co_no,a.pd_no,a.pd_curr_share,sum(case when b.pd_curr_share_str=c.fina_acco_code then c.market_value else 0 end) as pd_curr_share_std,a.total_asset,sum(case when b.eva_total_asset_str=c.fina_acco_code then c.market_value else 0 end) as total_asset_std, a.nav_asset,sum(case when b.eva_nav_asset_str=c.fina_acco_code then c.market_value else 0 end) as nav_asset_std,a.cash_bala,sum(case when b.eva_cash_bala_str=c.fina_acco_code then c.market_value else 0 end) as cash_bala_std,a.acco_cash,sum(case when b.eva_acco_cash_str=c.fina_acco_code then c.market_value else 0 end) as acco_cash_std,a.stock_market_value,sum(case when b.eva_stock_market_value_str=c.fina_acco_code then c.market_value else 0 end) as stock_market_value_std,a.fund_asset,sum(case when b.eva_fund_asset_str=c.fina_acco_code then c.market_value else 0 end) as fund_asset_std,a.bond_asset,sum(case when b.eva_bond_asset_str=c.fina_acco_code then c.market_value else 0 end) as bond_asset_std,a.futu_asset,sum(case when b.eva_futu_asset_str=c.fina_acco_code then c.market_value else 0 end) as futu_asset_std,a.option_asset,sum(case when b.eva_option_asset_str=c.fina_acco_code then c.market_value else 0 end) as option_asset_std,a.other_asset,sum(case when b.eva_other_asset_str=c.fina_acco_code then c.market_value else 0 end) as other_asset_std,a.accumulative_receivable,sum(case when b.accumulative_receivable_str=c.fina_acco_code then c.market_value else 0 end) as accumulative_receivable_std,a.accumulative_payable,sum(case when b.accumulative_payable_str=c.fina_acco_code then c.market_value else 0 end) as accumulative_payable_std,a.unit_nav,sum(case when b.unit_nav_str=c.fina_acco_code then c.market_value else 0 end) as unit_nav_std from db_eva_his.tb_evatotal_product_asset_info_his a,db_eva.tb_evabasic_product_check_config b,db_eva.tb_evatotal_pd_asset_check c where a.co_no=b.co_no and a.pd_no=b.pd_no and a.co_no=c.co_no and a.pd_no=c.pd_no and a.init_date=c.init_date and a.co_no=v_co_no and (v_pd_no=0 or a.pd_no=v_pd_no) and a.init_date between v_begin_date and v_end_date group by c.co_no,c.pd_no,c.init_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_查询外部估值费用核对结果
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdFinaFeeResult;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdFinaFeeResult(
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
    

    /* select a.{初始化日期},a.{机构编号},a.{产品编号},a.{产品费用类型},a.{本币币种},a.{当前金额},c.{市值} from ~历史_平台估值_估值汇总_估值产品费用表^ a,~平台估值_基础参数_估值产品费率表^ b,~平台估值_估值汇总_估值产品外部估值项目表^ c where a.{机构编号}=b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{机构编号}=c.{机构编号} and a.{产品编号}=c.{产品编号} and a.{初始化日期}=c.{初始化日期} and a.{产品费用类型}=b.{产品费用类型} and b.{科目代码}=c.{科目代码} and a.{机构编号}=@机构编号# and (@产品编号#=0 or a.{产品编号}=@产品编号#) and a.{初始化日期} between @开始日期# and @结束日期# ; */
    select a.init_date,a.co_no,a.pd_no,a.pd_fee_type,a.crncy_type,a.curr_amt,c.market_value from db_eva_his.tb_evatotal_pd_fee_total_his a,db_eva.tb_evabasic_product_fee b,db_eva.tb_evatotal_pd_asset_check c where a.co_no=b.co_no and a.pd_no=b.pd_no and a.co_no=c.co_no and a.pd_no=c.pd_no and a.init_date=c.init_date and a.pd_fee_type=b.pd_fee_type and b.fina_acco_code=c.fina_acco_code and a.co_no=v_co_no and (v_pd_no=0 or a.pd_no=v_pd_no) and a.init_date between v_begin_date and v_end_date ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_查询外部估值利息核对结果
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdFinaInterestResult;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdFinaInterestResult(
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
    

    /* select a.{初始化日期},a.{机构编号},a.{产品编号},a.{资产账户},a.{本币币种},a.{当前金额},c.{市值} from ~历史_平台估值_估值汇总_估值产品利息表^ a,~平台估值_基础参数_估值产品利率表^ b,~平台估值_估值汇总_估值产品外部估值项目表^ c where a.{机构编号}=b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{机构编号}=c.{机构编号} and a.{产品编号}=c.{产品编号} and a.{初始化日期}=c.{初始化日期} and a.{资产账户}=b.{资产账户} and b.{科目代码}=c.{科目代码} and a.{机构编号}=@机构编号# and (@产品编号#=0 or a.{产品编号}=@产品编号#) and a.{初始化日期} between @开始日期# and @结束日期# ; */
    select a.init_date,a.co_no,a.pd_no,a.asset_acco,a.crncy_type,a.curr_amt,c.market_value from db_eva_his.tb_evatotal_pd_interest_total_his a,db_eva.tb_evabasic_product_rate b,db_eva.tb_evatotal_pd_asset_check c where a.co_no=b.co_no and a.pd_no=b.pd_no and a.co_no=c.co_no and a.pd_no=c.pd_no and a.init_date=c.init_date and a.asset_acco=b.asset_acco and b.fina_acco_code=c.fina_acco_code and a.co_no=v_co_no and (v_pd_no=0 or a.pd_no=v_pd_no) and a.init_date between v_begin_date and v_end_date ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品增值税明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdVatDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdVatDetail(
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
    

    /* [获取表记录][平台估值_估值汇总_估值产品增值税计算表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#)  and  {初始化日期} between @开始日期# and @结束日期#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, vat_loan, calc_pay, 
        vat_pay_offset, vat_transfer, vat_pay_add, calc_estimate, 
        vat_estimate_offset, vat_estimate, vat_estimate_add from db_eva.tb_evatotal_pd_vat_calc where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no)  and  init_date between v_begin_date and v_end_date;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, vat_loan, calc_pay, 
        vat_pay_offset, vat_transfer, vat_pay_add, calc_estimate, 
        vat_estimate_offset, vat_estimate, vat_estimate_add from db_eva.tb_evatotal_pd_vat_calc where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no)  and  init_date between v_begin_date and v_end_date limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_获取估值产品推送数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_getEvaPdPushData;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_getEvaPdPushData(
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
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* [获取表记录变量语句][平台估值_估值汇总_估值产品资产信息表][{净资产},{产品当前份额},{现金余额}+{累计应收额}+{申购应收金额},{累计应付额}+{赎回应付金额}][@估值净资产#,@估值份额#,@累计应收金额#,@累计应付金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期#][4][@机构编号#, @产品编号#] */
    select nav_asset,pd_curr_share,cash_bala+accumulative_receivable+apply_amt,accumulative_payable+redemp_amt into v_evalu_nav_asset,v_evalu_share,v_total_rece_amt,v_total_payab_amt from db_eva.tb_evatotal_product_asset_info where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date limit 1;


    /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品资产信息表][{初始化日期},{净资产}][@上日初始化日期#,@期初估值净资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@初始化日期# order by {初始化日期} desc][4][@机构编号#, @产品编号#] */
    select init_date,nav_asset into v_last_init_date,v_begin_evalu_nav_asset from db_eva_his.tb_evatotal_product_asset_info_his where co_no=v_co_no and pd_no=v_pd_no and init_date<v_init_date order by init_date desc limit 1;

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

# 原子_平台估值_估值汇总_获取估值产品总资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_getPdTotalAseet;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_getPdTotalAseet(
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
    OUT p_error_info varchar(255),
    OUT p_total_asset decimal(18,4)
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
    declare v_total_asset decimal(18,4);
    declare v_init_date int;
    declare v_cash_bala decimal(18,4);
    declare v_acco_cash decimal(18,4);
    declare v_stock_market_value decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_option_asset decimal(18,4);
    declare v_other_asset decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_total_asset = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_cash_bala = 0;
    SET v_acco_cash = 0;
    SET v_stock_market_value = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_futu_asset = 0;
    SET v_option_asset = 0;
    SET v_other_asset = 0;

    
    label_pro:BEGIN
    

           /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
           set v_init_date=date_format(curdate(),'%Y%m%d');

           /* set @总资产#=0; */
           set v_total_asset=0;
            #取产品现金余额

            /* [获取表记录变量语句][平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}),0)][@现金余额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and  {产品账户类型} =《产品账户类型-银行账户》] */
            select ifnull(sum(curr_amt),0) into v_cash_bala from db_eva.tb_evadata_pd_acco_capit where co_no=v_co_no and pd_no=v_pd_no  and  pd_acco_type =1 limit 1;

            #取产品账户资金

            /* [获取表记录变量语句][平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}), 0)][@账户余额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {产品账户类型} in (《产品账户类型-证券账户》,《产品账户类型-期货账户》)] */
            select ifnull(sum(curr_amt), 0) into v_acco_cash from db_eva.tb_evadata_pd_acco_capit where co_no=v_co_no and pd_no=v_pd_no  and pd_acco_type in (2,3) limit 1;

           #取股票资产

            /* if @机构编号#=6808 then */
            if v_co_no=6808 then

            /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*{最新价}*{汇率}), 0)][@股票市值#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {证券类型} in（《证券类型-股票》,《证券类型-申购》)] */
            select ifnull(sum(curr_qty*last_price*exch_rate), 0) into v_stock_market_value from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no  and stock_type in(1,2) limit 1;

            else

            /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*round({最新价}*{汇率},2)), 0)][@股票市值#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {证券类型} in（《证券类型-股票》,《证券类型-申购》)] */
            select ifnull(sum(curr_qty*round(last_price*exch_rate,2)), 0) into v_stock_market_value from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no  and stock_type in(1,2) limit 1;

            end if;
           #取基金资产

           /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*{最新价}), 0)][@基金资产#][ {机构编号}=@机构编号# and {产品编号}=@产品编号#  and {证券类型} in (《证券类型-ETF基金》,《证券类型-货币ETF基金》,《证券类型-封闭式基金》,《证券类型-分级基金》,《证券类型-普通货币基金》,《证券类型-黄金ETF基金》,《证券类型-普通开放式基金》)] */
           select ifnull(sum(curr_qty*last_price), 0) into v_fund_asset from db_eva.tb_evadata_pd_secu_posi where  co_no=v_co_no and pd_no=v_pd_no  and stock_type in (52,57,51,54,63,60,62) limit 1;

           #取债券资产

           /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*{最新价}), 0)][@债券资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {证券类型}  in (《证券类型-公司债》,《证券类型-企业债》,《证券类型-可转债》,《证券类型-可交换公司债》,《证券类型-回购标准券》)] */
           select ifnull(sum(curr_qty*last_price), 0) into v_bond_asset from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no  and stock_type  in (23,22,24,41,27) limit 1;


           /* set @期货资产#=0; */
           set v_futu_asset=0;

           /* set @期权资产#=0; */
           set v_option_asset=0;

           /* set @其他资产#=0; */
           set v_other_asset=0;

           /* set @总资产#=@现金余额#+@账户余额#+@股票市值#+@基金资产#+@债券资产#+@期货资产#+@期权资产#+@其他资产#; */
           set v_total_asset=v_cash_bala+v_acco_cash+v_stock_market_value+v_fund_asset+v_bond_asset+v_futu_asset+v_option_asset+v_other_asset;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_total_asset = v_total_asset;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_获取估值产品历史总资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_getHisPdTotalAseet;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_getHisPdTotalAseet(
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
    OUT p_error_info varchar(255),
    OUT p_total_asset decimal(18,4)
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
    declare v_total_asset decimal(18,4);
    declare v_init_date int;
    declare v_cash_bala decimal(18,4);
    declare v_acco_cash decimal(18,4);
    declare v_stock_market_value decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_option_asset decimal(18,4);
    declare v_other_asset decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_total_asset = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_cash_bala = 0;
    SET v_acco_cash = 0;
    SET v_stock_market_value = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_futu_asset = 0;
    SET v_option_asset = 0;
    SET v_other_asset = 0;

    
    label_pro:BEGIN
    

            /* set @初始化日期#=@估值日期#; */
            set v_init_date=v_evalu_date;
            #取产品现金余额

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}),0)][@现金余额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {初始化日期}=@初始化日期# and  {产品账户类型} =《产品账户类型-银行账户》] */
            select ifnull(sum(curr_amt),0) into v_cash_bala from db_eva_his.tb_evadata_pd_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no  and init_date=v_init_date and  pd_acco_type =1 limit 1;

            #取产品账户资金

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品账户资金表][ifnull(sum({当前金额}), 0)][@账户余额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {产品账户类型} in (《产品账户类型-证券账户》,《产品账户类型-期货账户》)] */
            select ifnull(sum(curr_amt), 0) into v_acco_cash from db_eva_his.tb_evadata_pd_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and pd_acco_type in (2,3) limit 1;

           #取股票资产

             /* if @机构编号#=6808 then */
             if v_co_no=6808 then

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*{最新价}*{汇率}), 0)][@股票市值#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {证券类型} in(《证券类型-股票》,《证券类型-申购》)] */
            select ifnull(sum(curr_qty*last_price*exch_rate), 0) into v_stock_market_value from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and stock_type in(1,2) limit 1;

             else

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*round({最新价}*{汇率},2)), 0)][@股票市值#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {证券类型} in(《证券类型-股票》,《证券类型-申购》)] */
            select ifnull(sum(curr_qty*round(last_price*exch_rate,2)), 0) into v_stock_market_value from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and stock_type in(1,2) limit 1;

            end if;
           #取基金资产

           /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][ifnull(SUM(({当前数量}+round({当前数量}*{利息收益}/10000,0))*{最新价}),0)][@基金资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {证券类型} in (《证券类型-ETF基金》,《证券类型-货币ETF基金》,《证券类型-普通开放式基金》,《证券类型-黄金ETF基金》,《证券类型-封闭式基金》,《证券类型-分级基金》,《证券类型-普通货币基金》)] */
           select ifnull(SUM((curr_qty+round(curr_qty*intrst_pandl/10000,0))*last_price),0) into v_fund_asset from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and stock_type in (52,57,62,60,51,54,63) limit 1;

           #取债券资产

           /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][ifnull(sum({当前数量}*{最新价}), 0)][@债券资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {证券类型} in (《证券类型-公司债》,《证券类型-企业债》,《证券类型-可转债》,《证券类型-可交换公司债》,《证券类型-回购标准券》)] */
           select ifnull(sum(curr_qty*last_price), 0) into v_bond_asset from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and stock_type in (23,22,24,41,27) limit 1;


           /* set @期货资产#=0; */
           set v_futu_asset=0;

           /* set @期权资产#=0; */
           set v_option_asset=0;

           /* set @其他资产#=0; */
           set v_other_asset=0;

            /* set @总资产#=@现金余额#+@账户余额#+@股票市值#+@基金资产#+@债券资产#+@期货资产#+@期权资产#+@其他资产#; */
            set v_total_asset=v_cash_bala+v_acco_cash+v_stock_market_value+v_fund_asset+v_bond_asset+v_futu_asset+v_option_asset+v_other_asset;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_total_asset = v_total_asset;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品交易组净资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdExgpNet;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdExgpNet(
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
    declare v_init_date int;
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* set @交易组编号#=0; */
    set v_exch_group_no=0;

    /* [获取表记录][平台估值_估值汇总_估值产品交易组资产信息表][字段][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and @交易组编号#=0][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, pd_curr_share, 
        total_asset, nav_asset, cash_bala, acco_cash, 
        stock_market_value, fund_asset, bond_asset, futu_asset, 
        option_asset, other_asset, accumulative_receivable, accumulative_payable, 
        apply_amt, redemp_amt, unit_nav, total_cash_divide, 
        total_unit_nav, remark_info from db_eva.tb_evatotal_product_exgp_asset_info where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and v_exch_group_no=0;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, pd_curr_share, 
        total_asset, nav_asset, cash_bala, acco_cash, 
        stock_market_value, fund_asset, bond_asset, futu_asset, 
        option_asset, other_asset, accumulative_receivable, accumulative_payable, 
        apply_amt, redemp_amt, unit_nav, total_cash_divide, 
        total_unit_nav, remark_info from db_eva.tb_evatotal_product_exgp_asset_info where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and v_exch_group_no=0 limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_生成产品估值核对数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_createPdFinaValue;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_createPdFinaValue(
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
    declare v_fina_acco_code varchar(64);
    declare v_fina_acco_name varchar(64);
    declare v_eva_check_type int;
    declare v_config_str varchar(2048);
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_fina_acco_code = " ";
    SET v_fina_acco_name = " ";
    SET v_eva_check_type = 0;
    SET v_config_str = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #先删除上次核对结果

    /* [删除表记录][平台估值_估值汇总_估值产品估值核对项目表][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#][3][@产品编号#] */
    delete from db_eva.tb_evatotal_pd_fina_value 
        where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.61.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


            /* [声明游标][平台估值_基础参数_估值科目表][{科目代码},{科目名称},{估值核对类型},{参数配置串}][{机构编号}=@机构编号# and {产品编号}=@产品编号#][cursor_fina_code] */
            cursor_fina_code:BEGIN
            DECLARE v_cursor_done int default false;
            DECLARE cursor_fina_code CURSOR FOR
                select fina_acco_code,fina_acco_name,eva_check_type,config_str 
                from db_eva.tb_evabasic_account_name 
                where co_no=v_co_no and pd_no=v_pd_no;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


            /* [打开游标][@科目代码#,@科目名称#,@估值核对类型#,@参数配置串#][cursor_fina_code][loop_fina_code] */
            open cursor_fina_code;
            loop_fina_code: LOOP
            fetch cursor_fina_code into v_fina_acco_code,v_fina_acco_name,v_eva_check_type,v_config_str;
                IF v_cursor_done THEN
                    LEAVE loop_fina_code;
                END IF;


             /* if @估值核对类型# =1 then */
             if v_eva_check_type =1 then

                 /* [读取插入表记录][平台估值_估值汇总_估值产品估值核对项目表][历史_平台估值_业务数据_估值产品账户资金表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{科目代码},{科目名称},{估值核对类型},{数量},{成本},{市价},{市值}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,{初始化日期},{机构编号},{产品编号},@科目代码#,@科目名称#,@估值核对类型#,0,0,0,{当前金额}][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#  and {资产账户}=@参数配置串# and {本币币种}=《本币币种-人民币》 ][1][@产品编号#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_eva.tb_evatotal_pd_fina_value (
                     create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,fina_acco_code,fina_acco_name,eva_check_type,amount,prime_cost,market_price,market_value) 
                     select 
                     v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,init_date,co_no,pd_no,v_fina_acco_code,v_fina_acco_name,v_eva_check_type,0,0,0,curr_amt 
                     from db_eva_his.tb_evadata_pd_acco_capit_his 
                     where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no  and asset_acco=v_config_str and crncy_type="CNY" ;
                 if v_error_code = "1" then
                             
                     SET v_error_code = "evaA.3.61.1";
                     if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
                     else
                         SET v_error_info = concat("产品编号=",v_pd_no);
                     end if;
                     close cursor_fina_code;
                     leave label_pro;
                 end if;

             end if;

             /* if @估值核对类型# =2 then */
             if v_eva_check_type =2 then

                 /* [读取插入表记录][平台估值_估值汇总_估值产品估值核对项目表][历史_平台估值_业务数据_估值产品证券持仓表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{科目代码},{科目名称},{估值核对类型},{数量},{成本},{市价},{市值}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,{初始化日期},{机构编号},{产品编号},concat(@科目代码#,{证券代码}),{证券名称},@估值核对类型#,0,0,0,{当前数量}][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#  and {证券类型} in (@参数配置串#)][1][@产品编号#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_eva.tb_evatotal_pd_fina_value (
                     create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,fina_acco_code,fina_acco_name,eva_check_type,amount,prime_cost,market_price,market_value) 
                     select 
                     v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,init_date,co_no,pd_no,concat(v_fina_acco_code,stock_code),stock_name,v_eva_check_type,0,0,0,curr_qty 
                     from db_eva_his.tb_evadata_pd_secu_posi_his 
                     where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no  and stock_type in (v_config_str);
                 if v_error_code = "1" then
                             
                     SET v_error_code = "evaA.3.61.1";
                     if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
                     else
                         SET v_error_info = concat("产品编号=",v_pd_no);
                     end if;
                     close cursor_fina_code;
                     leave label_pro;
                 end if;

             end if;

             /* if @估值核对类型# =3 then */
             if v_eva_check_type =3 then

                 /* [读取插入表记录][平台估值_估值汇总_估值产品估值核对项目表][历史_平台估值_估值汇总_估值产品费用表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{科目代码},{科目名称},{估值核对类型},{数量},{成本},{市价},{市值}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,{初始化日期},{机构编号},{产品编号},@科目代码#,@科目名称#,@估值核对类型#,0,0,0,{当前金额}][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#  and {产品费用类型}=@参数配置串# ][1][@产品编号#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_eva.tb_evatotal_pd_fina_value (
                     create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,fina_acco_code,fina_acco_name,eva_check_type,amount,prime_cost,market_price,market_value) 
                     select 
                     v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,init_date,co_no,pd_no,v_fina_acco_code,v_fina_acco_name,v_eva_check_type,0,0,0,curr_amt 
                     from db_eva_his.tb_evatotal_pd_fee_total_his 
                     where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no  and pd_fee_type=v_config_str ;
                 if v_error_code = "1" then
                             
                     SET v_error_code = "evaA.3.61.1";
                     if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
                     else
                         SET v_error_info = concat("产品编号=",v_pd_no);
                     end if;
                     close cursor_fina_code;
                     leave label_pro;
                 end if;

             end if;

             /* if @估值核对类型# =4 then */
             if v_eva_check_type =4 then

                 /* [读取插入表记录][平台估值_估值汇总_估值产品估值核对项目表][历史_平台估值_估值汇总_估值产品利息表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{科目代码},{科目名称},{估值核对类型},{数量},{成本},{市价},{市值}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,{初始化日期},{机构编号},{产品编号},@科目代码#,@科目名称#,@估值核对类型#,0,0,0,{当前金额}][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#  and {资产账户}=@参数配置串# ][1][@产品编号#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_eva.tb_evatotal_pd_fina_value (
                     create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,fina_acco_code,fina_acco_name,eva_check_type,amount,prime_cost,market_price,market_value) 
                     select 
                     v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,init_date,co_no,pd_no,v_fina_acco_code,v_fina_acco_name,v_eva_check_type,0,0,0,curr_amt 
                     from db_eva_his.tb_evatotal_pd_interest_total_his 
                     where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no  and asset_acco=v_config_str ;
                 if v_error_code = "1" then
                             
                     SET v_error_code = "evaA.3.61.1";
                     if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
                     else
                         SET v_error_info = concat("产品编号=",v_pd_no);
                     end if;
                     close cursor_fina_code;
                     leave label_pro;
                 end if;

             end if;
            #核对更新份额

             /* if @估值核对类型# =9 then */
             if v_eva_check_type =9 then

                 /* [读取插入表记录][平台估值_估值汇总_估值产品估值核对项目表][历史_平台估值_估值汇总_估值产品资产信息表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{科目代码},{科目名称},{估值核对类型},{数量},{成本},{市价},{市值}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,{初始化日期},{机构编号},{产品编号},@科目代码#,@科目名称#,@估值核对类型#,0,0,0,{产品当前份额}][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# ][1][@产品编号#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_eva.tb_evatotal_pd_fina_value (
                     create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,fina_acco_code,fina_acco_name,eva_check_type,amount,prime_cost,market_price,market_value) 
                     select 
                     v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,init_date,co_no,pd_no,v_fina_acco_code,v_fina_acco_name,v_eva_check_type,0,0,0,pd_curr_share 
                     from db_eva_his.tb_evatotal_product_asset_info_his 
                     where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no ;
                 if v_error_code = "1" then
                             
                     SET v_error_code = "evaA.3.61.1";
                     if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
                     else
                         SET v_error_info = concat("产品编号=",v_pd_no);
                     end if;
                     close cursor_fina_code;
                     leave label_pro;
                 end if;

             end if;

             /* if @估值核对类型# =10 then */
             if v_eva_check_type =10 then

                 /* [读取插入表记录][平台估值_估值汇总_估值产品估值核对项目表][历史_平台估值_业务数据_估值产品证券持仓表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{科目代码},{科目名称},{估值核对类型},{数量},{成本},{市价},{市值}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,{初始化日期},{机构编号},{产品编号},@科目代码#,{证券名称},@估值核对类型#,0,0,0,{当前数量}][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# ][1][@产品编号#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_eva.tb_evatotal_pd_fina_value (
                     create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,fina_acco_code,fina_acco_name,eva_check_type,amount,prime_cost,market_price,market_value) 
                     select 
                     v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,init_date,co_no,pd_no,v_fina_acco_code,stock_name,v_eva_check_type,0,0,0,curr_qty 
                     from db_eva_his.tb_evadata_pd_secu_posi_his 
                     where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no ;
                 if v_error_code = "1" then
                             
                     SET v_error_code = "evaA.3.61.1";
                     if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
                     else
                         SET v_error_info = concat("产品编号=",v_pd_no);
                     end if;
                     close cursor_fina_code;
                     leave label_pro;
                 end if;

             end if;

             /* if @估值核对类型# =6 then */
             if v_eva_check_type =6 then

                 /* [读取插入表记录][平台估值_估值汇总_估值产品估值核对项目表][历史_平台估值_估值汇总_估值产品资产信息表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{科目代码},{科目名称},{估值核对类型},{数量},{成本},{市价},{市值}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,{初始化日期},{机构编号},{产品编号},@科目代码#,@科目名称#,@估值核对类型#,0,0,0,{单位净值}][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# ][1][@产品编号#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_eva.tb_evatotal_pd_fina_value (
                     create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,fina_acco_code,fina_acco_name,eva_check_type,amount,prime_cost,market_price,market_value) 
                     select 
                     v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,init_date,co_no,pd_no,v_fina_acco_code,v_fina_acco_name,v_eva_check_type,0,0,0,unit_nav 
                     from db_eva_his.tb_evatotal_product_asset_info_his 
                     where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no ;
                 if v_error_code = "1" then
                             
                     SET v_error_code = "evaA.3.61.1";
                     if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
                     else
                         SET v_error_info = concat("产品编号=",v_pd_no);
                     end if;
                     close cursor_fina_code;
                     leave label_pro;
                 end if;

             end if;

            /* [关闭游标][cursor_fina_code] */
                IF v_cursor_done THEN
                    set v_cursor_done = false;
                END IF;
            END LOOP;
            close cursor_fina_code;
            end cursor_fina_code;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_查询产品估值核对数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdCompareValue;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdCompareValue(
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
    

    /* select {机构编号},{产品编号},{初始化日期},{估值核对类型},{科目代码},{科目名称},0 as {市值},{市值} as {当前金额} from ~平台估值_估值汇总_估值产品估值核对项目表^  where {机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {估值核对类型} <> 2 and {科目代码} not in (select {科目代码} from ~平台估值_估值汇总_估值产品外部估值项目表^ where {机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#) and exists (select {科目代码} from ~平台估值_估值汇总_估值产品外部估值项目表^ where {机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#) union select a.{机构编号},a.{产品编号},a.{初始化日期},b.{估值核对类型},a.{科目代码},case when b.{估值核对类型} in (2,10) then b.{科目名称} else a.{科目名称} end as {科目名称},case when b.{估值核对类型} in (6,9) then a.{科目名称} when b.{估值核对类型} in (2,10) then a.{数量} else a.{市值} end as {市值},b.{市值} as {当前金额} from ~平台估值_估值汇总_估值产品外部估值项目表^ a,~平台估值_估值汇总_估值产品估值核对项目表^ b where a.{机构编号}=b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{初始化日期}=b.{初始化日期} and ((a.{科目代码}=b.{科目代码} and b.{估值核对类型}<>2) or (a.{科目代码} like concat(b.{科目代码},'%') and b.{估值核对类型} = 2)) and a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{初始化日期}=@估值日期#; */
    select co_no,pd_no,init_date,eva_check_type,fina_acco_code,fina_acco_name,0 as market_value,market_value as curr_amt from db_eva.tb_evatotal_pd_fina_value  where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and eva_check_type <> 2 and fina_acco_code not in (select fina_acco_code from db_eva.tb_evatotal_pd_asset_check where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date) and exists (select fina_acco_code from db_eva.tb_evatotal_pd_asset_check where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date) union select a.co_no,a.pd_no,a.init_date,b.eva_check_type,a.fina_acco_code,case when b.eva_check_type in (2,10) then b.fina_acco_name else a.fina_acco_name end as fina_acco_name,case when b.eva_check_type in (6,9) then a.fina_acco_name when b.eva_check_type in (2,10) then a.amount else a.market_value end as market_value,b.market_value as curr_amt from db_eva.tb_evatotal_pd_asset_check a,db_eva.tb_evatotal_pd_fina_value b where a.co_no=b.co_no and a.pd_no=b.pd_no and a.init_date=b.init_date and ((a.fina_acco_code=b.fina_acco_code and b.eva_check_type<>2) or (a.fina_acco_code like concat(b.fina_acco_code,'%') and b.eva_check_type = 2)) and a.co_no=v_co_no and a.pd_no=v_pd_no and a.init_date=v_evalu_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_生成估值产品累计净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_createPdTotalNet;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_createPdTotalNet(
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
    declare v_pd_curr_share decimal(18,2);
    declare v_unit_nav decimal(18,4);
    declare v_pre_cash_coeffi decimal(18,12);
    declare v_pre_share_coeffi decimal(18,12);
    declare v_net_prefee_coeffi decimal(18,12);
    declare v_cash_coeffi decimal(18,12);
    declare v_share_coeffi decimal(18,12);
    declare v_share_oper int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_share decimal(18,2);
    declare v_total_unit_nav decimal(18,4);
    declare v_pre_fee_share_net_total decimal(18,4);
    declare v_init_date int;
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_nav_asset = 0;
    SET v_pd_curr_share = 0;
    SET v_unit_nav = 0;
    SET v_pre_cash_coeffi = 0;
    SET v_pre_share_coeffi = 0;
    SET v_net_prefee_coeffi = 0;
    SET v_cash_coeffi = 0;
    SET v_share_coeffi = 0;
    SET v_share_oper = 0;
    SET v_occur_amt = 0;
    SET v_occur_share = 0;
    SET v_total_unit_nav = 0;
    SET v_pre_fee_share_net_total = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][平台估值_估值汇总_估值产品累计净值计算表][{净资产},{产品当前份额},{单位净值}][@净资产#,@产品当前份额#,@单位净值#][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#] */
    select nav_asset,pd_curr_share,unit_nav into v_nav_asset,v_pd_curr_share,v_unit_nav from db_eva.tb_evatotal_pd_totalnet_calc where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no limit 1;


    /* set @上日现金分红系数#=0; */
    set v_pre_cash_coeffi=0;

    /* set @上日份额分红系数#=1; */
    set v_pre_share_coeffi=1;

    /* set @费前累计净值系数#=1; */
    set v_net_prefee_coeffi=1;

    /* [获取表记录变量语句][平台估值_估值汇总_估值产品累计净值计算表][{现金分红系数},{份额分红系数},{费前累计净值系数},{产品当前份额}][@上日现金分红系数#,@上日份额分红系数#,@费前累计净值系数#,@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@估值日期# order by {初始化日期} desc] */
    select cash_coeffi,share_coeffi,net_prefee_coeffi,pd_curr_share into v_pre_cash_coeffi,v_pre_share_coeffi,v_net_prefee_coeffi,v_pd_curr_share from db_eva.tb_evatotal_pd_totalnet_calc where co_no=v_co_no and pd_no=v_pd_no and init_date<v_evalu_date order by init_date desc limit 1;


    /* set @上日现金分红系数#=ifnull(@上日现金分红系数#,0); */
    set v_pre_cash_coeffi=ifnull(v_pre_cash_coeffi,0);

    /* set @上日份额分红系数#=ifnull(@上日份额分红系数#,1); */
    set v_pre_share_coeffi=ifnull(v_pre_share_coeffi,1);

    /* set @费前累计净值系数#=ifnull(@费前累计净值系数#,1); */
    set v_net_prefee_coeffi=ifnull(v_net_prefee_coeffi,1);

    /* set @现金分红系数#=@上日现金分红系数#; */
    set v_cash_coeffi=v_pre_cash_coeffi;

    /* set @份额分红系数#=@上日份额分红系数#; */
    set v_share_coeffi=v_pre_share_coeffi;
    #对估值产品份额流水表里的记录游标循环处理

    /* [声明游标][平台估值_基础参数_估值产品份额流水表][{份额操作},{变动金额},{变动份额}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#][cursor_eva_product_sharejour] */
    cursor_eva_product_sharejour:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_product_sharejour CURSOR FOR
        select share_oper,occur_amt,occur_share 
        from db_eva.tb_evabasic_product_share_jour 
        where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@份额操作#,@变动金额#,@变动份额#][cursor_eva_product_sharejour][loop_eva_product_sharejour] */
    open cursor_eva_product_sharejour;
    loop_eva_product_sharejour: LOOP
    fetch cursor_eva_product_sharejour into v_share_oper,v_occur_amt,v_occur_share;
        IF v_cursor_done THEN
            LEAVE loop_eva_product_sharejour;
        END IF;


       /* if @份额操作#=《份额操作-现金分红》 then */
       if v_share_oper=3 then

           /* set @现金分红系数#=round(@变动金额#/@净资产#,4); */
           set v_cash_coeffi=round(v_occur_amt/v_nav_asset,4);

           /* set @费前累计净值系数#=round(@费前累计净值系数#*(1+@现金分红系数#),4); */
           set v_net_prefee_coeffi=round(v_net_prefee_coeffi*(1+v_cash_coeffi),4);

           /* set @现金分红系数#=@上日现金分红系数#+@上日份额分红系数#*@现金分红系数#; */
           set v_cash_coeffi=v_pre_cash_coeffi+v_pre_share_coeffi*v_cash_coeffi;
       end if;

       /* if @份额操作#=《份额操作-份额分红》 then */
       if v_share_oper=4 then

           /* set @份额分红系数#=round(@变动份额#/@产品当前份额#,4); */
           set v_share_coeffi=round(v_occur_share/v_pd_curr_share,4);

           /* set @费前累计净值系数#=@费前累计净值系数#*round((@净资产#+@变动金额#)/@产品当前份额#,4); */
           set v_net_prefee_coeffi=v_net_prefee_coeffi*round((v_nav_asset+v_occur_amt)/v_pd_curr_share,4);
           #set @费前累计净值系数#=@费前累计净值系数#*(1+@份额分红系数#);

           /* set @份额分红系数#=@上日份额分红系数#*(1+@份额分红系数#); */
           set v_share_coeffi=v_pre_share_coeffi*(1+v_share_coeffi);
       end if;

       /* if @份额操作#=《份额操作-支付业绩报酬》 then */
       if v_share_oper=5 then

           /* if @变动份额# = 0 then */
           if v_occur_share = 0 then

           /* set @费前累计净值系数#=@费前累计净值系数#*round((@净资产#+@变动金额#)/@净资产#,4); */
           set v_net_prefee_coeffi=v_net_prefee_coeffi*round((v_nav_asset+v_occur_amt)/v_nav_asset,4);
          end if;
       end if;

    /* [关闭游标][cursor_eva_product_sharejour] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_product_sharejour;
    end cursor_eva_product_sharejour;


    /* set @累计单位净值#=@单位净值#*@份额分红系数#+@现金分红系数#; */
    set v_total_unit_nav=v_unit_nav*v_share_coeffi+v_cash_coeffi;

    /* set @费前累计净值#=round(@单位净值#*round(@费前累计净值系数#,4),4); */
    set v_pre_fee_share_net_total=round(v_unit_nav*round(v_net_prefee_coeffi,4),4);

    /* set @初始化日期#=@估值日期#; */
    set v_init_date=v_evalu_date;

    /* [插入重复更新][平台估值_估值汇总_估值产品累计净值计算表][字段][字段变量][{现金分红系数}=@现金分红系数#,{份额分红系数}=@份额分红系数#,{累计单位净值}=@累计单位净值#,{费前累计净值系数}=@费前累计净值系数#,{费前累计净值}=@费前累计净值#][1][@产品编号#,@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evatotal_pd_totalnet_calc (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, nav_asset, pd_curr_share, unit_nav, 
        cash_coeffi, share_coeffi, total_unit_nav, net_prefee_coeffi, 
        pre_fee_share_net_total) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_nav_asset, v_pd_curr_share, v_unit_nav, 
        v_cash_coeffi, v_share_coeffi, v_total_unit_nav, v_net_prefee_coeffi, 
        v_pre_fee_share_net_total) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, cash_coeffi=v_cash_coeffi,share_coeffi=v_share_coeffi,total_unit_nav=v_total_unit_nav,net_prefee_coeffi=v_net_prefee_coeffi,pre_fee_share_net_total=v_pre_fee_share_net_total;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.63.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_新增估值产品累计净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_addPdTotalNet;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_addPdTotalNet(
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][平台估值_估值汇总_估值产品累计净值计算表][字段][字段变量][{净资产}=@净资产#,{产品当前份额}=@产品当前份额#,{单位净值}=@单位净值#,{现金分红系数}=@现金分红系数#,{份额分红系数}=@份额分红系数#,{累计单位净值}=@累计单位净值#,{费前累计净值系数}=@费前累计净值系数#,{费前累计净值}=@费前累计净值#][1][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evatotal_pd_totalnet_calc (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, nav_asset, pd_curr_share, unit_nav, 
        cash_coeffi, share_coeffi, total_unit_nav, net_prefee_coeffi, 
        pre_fee_share_net_total) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_nav_asset, v_pd_curr_share, v_unit_nav, 
        v_cash_coeffi, v_share_coeffi, v_total_unit_nav, v_net_prefee_coeffi, 
        v_pre_fee_share_net_total) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, nav_asset=v_nav_asset,pd_curr_share=v_pd_curr_share,unit_nav=v_unit_nav,cash_coeffi=v_cash_coeffi,share_coeffi=v_share_coeffi,total_unit_nav=v_total_unit_nav,net_prefee_coeffi=v_net_prefee_coeffi,pre_fee_share_net_total=v_pre_fee_share_net_total;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.64.1";
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
use db_eva;;

# 原子_平台估值_估值汇总_修改估值产品累计净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_modiPdTotalNet;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_modiPdTotalNet(
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][平台估值_估值汇总_估值产品累计净值计算表][{净资产}=@净资产#,{产品当前份额}=@产品当前份额#,{单位净值}=@单位净值#,{现金分红系数}=@现金分红系数#,{份额分红系数}=@份额分红系数#,{累计单位净值}=@累计单位净值#,{费前累计净值系数}=@费前累计净值系数#,{费前累计净值}=@费前累计净值#][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evatotal_pd_totalnet_calc set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, nav_asset=v_nav_asset,pd_curr_share=v_pd_curr_share,unit_nav=v_unit_nav,cash_coeffi=v_cash_coeffi,share_coeffi=v_share_coeffi,total_unit_nav=v_total_unit_nav,net_prefee_coeffi=v_net_prefee_coeffi,pre_fee_share_net_total=v_pre_fee_share_net_total where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.65.2";
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
use db_eva;;

# 原子_平台估值_估值汇总_删除估值产品累计净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_delPdTotalNet;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_delPdTotalNet(
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
    

    /* [删除表记录][平台估值_估值汇总_估值产品累计净值计算表][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#][3][@产品编号#] */
    delete from db_eva.tb_evatotal_pd_totalnet_calc 
        where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.67.3";
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
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品累计净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdTotalNet;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdTotalNet(
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
    

    /* [获取表记录][平台估值_估值汇总_估值产品累计净值计算表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#)  and  {初始化日期} between @开始日期# and @结束日期# order by {初始化日期}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, nav_asset, pd_curr_share, 
        unit_nav, cash_coeffi, share_coeffi, total_unit_nav, 
        net_prefee_coeffi, pre_fee_share_net_total from db_eva.tb_evatotal_pd_totalnet_calc where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no)  and  init_date between v_begin_date and v_end_date order by init_date;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, nav_asset, pd_curr_share, 
        unit_nav, cash_coeffi, share_coeffi, total_unit_nav, 
        net_prefee_coeffi, pre_fee_share_net_total from db_eva.tb_evatotal_pd_totalnet_calc where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no)  and  init_date between v_begin_date and v_end_date order by init_date limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_修改估值产品资产信息备注
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_modiPdAssetRemark;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_modiPdAssetRemark(
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
    declare v_sys_date int;
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
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sys_date = date_format(curdate(),'%Y%m%d');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @系统日期#=date_format(curdate(),'%Y%m%d'); */
    set v_sys_date=date_format(curdate(),'%Y%m%d');

    /* if @初始化日期#=@系统日期# then */
    if v_init_date=v_sys_date then

        /* [更新表记录][平台估值_估值汇总_估值产品资产信息表][{备注信息}=@备注信息#][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@产品编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_eva.tb_evatotal_product_asset_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remark_info=v_remark_info where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "evaA.3.69.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no);
            end if;
            leave label_pro;
        end if;


    /* elseif @初始化日期#<@系统日期# then */
    elseif v_init_date<v_sys_date then

       /* [更新表记录][历史_平台估值_估值汇总_估值产品资产信息表][{备注信息}=@备注信息#][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@产品编号#] */
       set v_update_date = date_format(curdate(),'%Y%m%d');
       set v_update_time = date_format(curtime(),'%H%i%s');
       update db_eva_his.tb_evatotal_product_asset_info_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remark_info=v_remark_info where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no;
       if v_error_code = "1" then
                   
           SET v_error_code = "evaA.3.69.2";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
           else
               SET v_error_info = concat("产品编号=",v_pd_no);
           end if;
           leave label_pro;
       end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_查询产品估值表单位净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdFinaNet;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdFinaNet(
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
    declare v_fina_acco_code varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_fina_acco_code = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][平台估值_基础参数_估值科目表][{科目代码}][@科目代码#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {估值核对类型}=《估值核对类型-单位净值》] */
    select fina_acco_code into v_fina_acco_code from db_eva.tb_evabasic_account_name where co_no=v_co_no and pd_no=v_pd_no and eva_check_type=6 limit 1;


    /* [获取表记录][平台估值_估值汇总_估值产品外部估值项目表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期} = @估值日期# and {科目代码}=@科目代码#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, fina_acco_code, fina_acco_name, 
        amount, unit_cost, prime_cost, cost_net_ratio, 
        market_price, market_value, market_net_ratio, evalu_add_value, 
        evalu_add_str, stop_info, rights_info from db_eva.tb_evatotal_pd_asset_check where co_no=v_co_no and pd_no=v_pd_no and init_date = v_evalu_date and fina_acco_code=v_fina_acco_code;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, fina_acco_code, fina_acco_name, 
        amount, unit_cost, prime_cost, cost_net_ratio, 
        market_price, market_value, market_net_ratio, evalu_add_value, 
        evalu_add_str, stop_info, rights_info from db_eva.tb_evatotal_pd_asset_check where co_no=v_co_no and pd_no=v_pd_no and init_date = v_evalu_date and fina_acco_code=v_fina_acco_code limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_计算估值产品交易组费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_calcPdExgpFee;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_calcPdExgpFee(
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
    IN p_nav_asset decimal(18,4),
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
    declare v_nav_asset decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_pd_fee_type int;
    declare v_pd_fee_rate decimal(18,12);
    declare v_pd_fee_circle int;
    declare v_min_fee decimal(18,4);
    declare v_fina_acco_code varchar(64);
    declare v_calc_fee_date_str varchar(4096);
    declare v_eva_calc_type int;
    declare v_remark_info varchar(255);
    declare v_begin_amt decimal(18,4);
    declare v_evalu_date int;
    declare v_payab_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_nav_asset = p_nav_asset;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pd_fee_type = 0;
    SET v_pd_fee_rate = 0;
    SET v_pd_fee_circle = 0;
    SET v_min_fee = 0;
    SET v_fina_acco_code = " ";
    SET v_calc_fee_date_str = " ";
    SET v_eva_calc_type = 0;
    SET v_remark_info = " ";
    SET v_begin_amt = 0;
    SET v_evalu_date = date_format(curdate(),'%Y%m%d');
    SET v_payab_amt = 0;

    
    label_pro:BEGIN
    
    #初始化估值产品交易组费用表当前金额

    /* [更新表记录][平台估值_估值汇总_估值产品交易组费用表][{当前金额} = {期初金额}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {手工标志}=0][2][@产品编号#,@交易组编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evatotal_pd_exgp_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = begin_amt where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and manual_flag=0;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.71.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    #对估值产品交易组费用表里的记录游标循环处理

    /* [声明游标][平台估值_基础参数_估值产品费率表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号#][cursor_eva_product_fee] */
    cursor_eva_product_fee:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_product_fee CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_fee_type, pd_fee_rate, pd_fee_circle, 
        min_fee, fina_acco_code, calc_fee_date_str, eva_calc_type, 
        remark_info 
        from db_eva.tb_evabasic_product_fee 
        where co_no=v_co_no and pd_no=v_pd_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_eva_product_fee][loop_eva_product_fee] */
    open cursor_eva_product_fee;
    loop_eva_product_fee: LOOP
    fetch cursor_eva_product_fee into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_pd_fee_type, v_pd_fee_rate, v_pd_fee_circle, 
        v_min_fee, v_fina_acco_code, v_calc_fee_date_str, v_eva_calc_type, 
        v_remark_info;
        IF v_cursor_done THEN
            LEAVE loop_eva_product_fee;
        END IF;

         #获取上一日费用初始值

         /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品交易组费用表][{当前金额}-{确认金额}][@期初金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {产品费用类型}=@产品费用类型# and {初始化日期}<@估值日期# order by {初始化日期} desc] */
         select curr_amt-confirm_apply into v_begin_amt from db_eva_his.tb_evatotal_pd_exgp_fee_total_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and pd_fee_type=v_pd_fee_type and init_date<v_evalu_date order by init_date desc limit 1;


         /* set @应付金额# = round(@净资产# * @产品费用费率#/@产品计费周期#,2); */
         set v_payab_amt = round(v_nav_asset * v_pd_fee_rate/v_pd_fee_circle,2);

         /* if @最低费用#>@应付金额# then */
         if v_min_fee>v_payab_amt then

            /* set @应付金额#=@最低费用#; */
            set v_payab_amt=v_min_fee;
          end if;

        /* [更新表记录][平台估值_估值汇总_估值产品交易组费用表][{当前金额} = @期初金额# + @应付金额#,{期初金额}=@期初金额#,{产品净资产}=@净资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {产品费用类型}=@产品费用类型# and {手工标志}=0][2][concat("更新估值产品交易组费用表记录错误！【机构编号】=", @机构编号#,"【产品编号】=",@产品编号#,"【交易组编号】=",@交易组编号#,"【产品费用类型】=",@产品费用类型#)] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_eva.tb_evatotal_pd_exgp_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = v_begin_amt + v_payab_amt,begin_amt=v_begin_amt,pd_net_asset=v_nav_asset where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and pd_fee_type=v_pd_fee_type and manual_flag=0;
        if v_error_code = "1" then
                    
            SET v_error_code = "evaA.3.71.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("更新估值产品交易组费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【交易组编号】=",v_exch_group_no,"【产品费用类型】=",v_pd_fee_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("更新估值产品交易组费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【交易组编号】=",v_exch_group_no,"【产品费用类型】=",v_pd_fee_type);
            end if;
            close cursor_eva_product_fee;
            leave label_pro;
        end if;


    /* [关闭游标][cursor_eva_product_fee] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_product_fee;
    end cursor_eva_product_fee;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_计算估值产品交易组利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_calcPdExgpRate;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_calcPdExgpRate(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

     /* update ~平台估值_业务数据_估值产品交易组账户资金表^ a,~平台估值_基础参数_估值产品利率表^ b set a.{预计利息}=GREATEST(round(a.{当前金额}*b.{利率}/b.{产品计费周期},2),b.{最低利息}) where a.{机构编号} = b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{资产账户} =b.{资产账户} and a.{机构编号} = @机构编号# and a.{产品编号} = @产品编号# and a.{交易组编号}=@交易组编号#; */
     update db_eva.tb_evadata_pd_exgp_acco_capit a,db_eva.tb_evabasic_product_rate b set a.intrst_cacl_amt=GREATEST(round(a.curr_amt*b.intrst_rate/b.pd_fee_circle,2),b.min_interest) where a.co_no = b.co_no and a.pd_no=b.pd_no and a.asset_acco =b.asset_acco and a.co_no = v_co_no and a.pd_no = v_pd_no and a.exch_group_no=v_exch_group_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_统计估值产品交易组利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_sumPdExgpRate;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_sumPdExgpRate(
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
    declare v_asset_acco varchar(16);
    declare v_begin_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);
    declare v_evalu_date int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco = " ";
    SET v_begin_amt = 0;
    SET v_intrst_cacl_amt = 0;
    SET v_evalu_date = date_format(curdate(),'%Y%m%d');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [声明游标][平台估值_基础参数_估值产品利率表][{资产账户}][{机构编号}=@机构编号# and {产品编号}=@产品编号#][cursor_eva_product_rate] */
    cursor_eva_product_rate:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_product_rate CURSOR FOR
        select asset_acco 
        from db_eva.tb_evabasic_product_rate 
        where co_no=v_co_no and pd_no=v_pd_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@资产账户#][cursor_eva_product_rate][loop_eva_product_rate] */
    open cursor_eva_product_rate;
    loop_eva_product_rate: LOOP
    fetch cursor_eva_product_rate into v_asset_acco;
        IF v_cursor_done THEN
            LEAVE loop_eva_product_rate;
        END IF;


         /* set @期初金额#=0; */
         set v_begin_amt=0;

         /* set @预计利息#=0; */
         set v_intrst_cacl_amt=0;
        #获取上日初始值

        /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品交易组利息表][{当前金额}-{确认金额}][@期初金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@估值日期# and {资产账户}=@资产账户#  and {交易组编号}=@交易组编号# order by {初始化日期} desc] */
        select curr_amt-confirm_apply into v_begin_amt from db_eva_his.tb_evatotal_pd_exgp_interest_total_his where co_no=v_co_no and pd_no=v_pd_no and init_date<v_evalu_date and asset_acco=v_asset_acco  and exch_group_no=v_exch_group_no order by init_date desc limit 1;

       #初始化估值产品利息表当前金额

       /* [更新表记录][平台估值_估值汇总_估值产品交易组利息表][{当前金额} = @期初金额#,{期初金额}=@期初金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户}=@资产账户# and {交易组编号}=@交易组编号# and {手工标志}=0][2][@产品编号#] */
       set v_update_date = date_format(curdate(),'%Y%m%d');
       set v_update_time = date_format(curtime(),'%H%i%s');
       update db_eva.tb_evatotal_pd_exgp_interest_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = v_begin_amt,begin_amt=v_begin_amt where co_no=v_co_no and pd_no=v_pd_no and asset_acco=v_asset_acco and exch_group_no=v_exch_group_no and manual_flag=0;
       if v_error_code = "1" then
                   
           SET v_error_code = "evaA.3.73.2";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
           else
               SET v_error_info = concat("产品编号=",v_pd_no);
           end if;
           close cursor_eva_product_rate;
           leave label_pro;
       end if;


    /* [关闭游标][cursor_eva_product_rate] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_product_rate;
    end cursor_eva_product_rate;


    /* update ~平台估值_估值汇总_估值产品交易组利息表^ a ,~平台估值_业务数据_估值产品交易组账户资金表^ b set a.{当前金额} = a.{当前金额} + b.{预计利息} where a.{机构编号} = b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{资产账户} =b.{资产账户} and a.{交易组编号}=b.{交易组编号} and a.{机构编号} = @机构编号# and a.{产品编号} = @产品编号# and a.{交易组编号}=@交易组编号# and a.{手工标志}=0; */
    update db_eva.tb_evatotal_pd_exgp_interest_total a ,db_eva.tb_evadata_pd_exgp_acco_capit b set a.curr_amt = a.curr_amt + b.intrst_cacl_amt where a.co_no = b.co_no and a.pd_no=b.pd_no and a.asset_acco =b.asset_acco and a.exch_group_no=b.exch_group_no and a.co_no = v_co_no and a.pd_no = v_pd_no and a.exch_group_no=v_exch_group_no and a.manual_flag=0;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_获取产品交易组上日资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_getProductExgpPreNet;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_getProductExgpPreNet(
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
    IN p_evalu_date int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_nav_asset decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_nav_asset = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品交易组资产信息表][ifnull({净资产},0)][@净资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}<@估值日期# order by {初始化日期} desc] */
    select ifnull(nav_asset,0) into v_nav_asset from db_eva_his.tb_evatotal_product_exgp_asset_info_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date<v_evalu_date order by init_date desc limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_nav_asset = v_nav_asset;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_生成估值产品交易组资产信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_createPdExgpAseetInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_createPdExgpAseetInfo(
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
    declare v_exch_group_no int;
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_total_unit_nav decimal(18,4);
    declare v_total_cash_divide decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_pd_curr_share decimal(18,2);
    declare v_cash_bala decimal(18,4);
    declare v_acco_cash decimal(18,4);
    declare v_stock_market_value decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_accumulative_receivable decimal(18,4);
    declare v_accumulative_payable decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_option_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_apply_amt decimal(18,4);
    declare v_redemp_amt decimal(18,4);
    declare v_total_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_unit_nav decimal(18,4);
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_total_unit_nav = 0;
    SET v_total_cash_divide = 0;
    SET v_remark_info = " ";
    SET v_pd_curr_share = 0;
    SET v_cash_bala = 0;
    SET v_acco_cash = 0;
    SET v_stock_market_value = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_accumulative_receivable = 0;
    SET v_accumulative_payable = 0;
    SET v_futu_asset = 0;
    SET v_option_asset = 0;
    SET v_other_asset = 0;
    SET v_apply_amt = 0;
    SET v_redemp_amt = 0;
    SET v_total_asset = 0;
    SET v_nav_asset = 0;
    SET v_unit_nav = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

           /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
           set v_init_date=date_format(curdate(),'%Y%m%d');

           /* set @累计单位净值#=0; */
           set v_total_unit_nav=0;

           /* set @累计派现金额#=0; */
           set v_total_cash_divide=0;

           /* set @备注信息#=''; */
           set v_remark_info='';
            #统计获取产品历史份额

            /* [获取表记录变量语句][平台估值_估值汇总_估值产品资产信息表][ifnull({产品当前份额},0)][@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# order by {初始化日期} desc][4][@产品编号#] */
            select ifnull(pd_curr_share,0) into v_pd_curr_share from db_eva.tb_evatotal_product_asset_info where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date order by init_date desc limit 1;

            #取产品现金余额

            /* [获取表记录变量语句][平台估值_业务数据_估值产品交易组账户资金表][ifnull(sum({当前金额}),0)][@现金余额#][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#  and {交易组编号}=@交易组编号# and  {产品账户类型} =《产品账户类型-银行账户》] */
            select ifnull(sum(curr_amt),0) into v_cash_bala from db_eva.tb_evadata_pd_exgp_acco_capit where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no  and exch_group_no=v_exch_group_no and  pd_acco_type =1 limit 1;

            #取产品账户资金

            /* [获取表记录变量语句][平台估值_业务数据_估值产品交易组账户资金表][ifnull(sum({当前金额}), 0)][@账户余额#][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号#  and {产品账户类型} in (《产品账户类型-证券账户》,《产品账户类型-期货账户》)] */
            select ifnull(sum(curr_amt), 0) into v_acco_cash from db_eva.tb_evadata_pd_exgp_acco_capit where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no  and pd_acco_type in (2,3) limit 1;

           #取股票资产

            /* [获取表记录变量语句][平台估值_业务数据_估值产品交易组证券持仓表][ifnull(sum({当前数量}*{最新价}*{汇率}), 0)][@股票市值#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号#  and {证券类型} in（《证券类型-股票》,《证券类型-申购》)] */
            select ifnull(sum(curr_qty*last_price*exch_rate), 0) into v_stock_market_value from db_eva.tb_evadata_pd_exgp_secu_posi where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no  and stock_type in(1,2) limit 1;

           #取基金资产

           /* [获取表记录变量语句][平台估值_业务数据_估值产品交易组证券持仓表][ifnull(sum({当前数量}*{最新价}), 0)][@基金资产#][ {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号#  and {证券类型} in (《证券类型-ETF基金》,《证券类型-货币ETF基金》,《证券类型-封闭式基金》,《证券类型-分级基金》,《证券类型-普通货币基金》)] */
           select ifnull(sum(curr_qty*last_price), 0) into v_fund_asset from db_eva.tb_evadata_pd_exgp_secu_posi where  co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no  and stock_type in (52,57,51,54,63) limit 1;

           #取债券资产

           /* [获取表记录变量语句][平台估值_业务数据_估值产品交易组证券持仓表][ifnull(sum({当前数量}*{最新价}), 0)][@债券资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {交易组编号}=@交易组编号# and {证券类型}  in (《证券类型-公司债》,《证券类型-企业债》,《证券类型-可转债》,《证券类型-回购标准券》)] */
           select ifnull(sum(curr_qty*last_price), 0) into v_bond_asset from db_eva.tb_evadata_pd_exgp_secu_posi where co_no=v_co_no and pd_no=v_pd_no  and exch_group_no=v_exch_group_no and stock_type  in (23,22,24,27) limit 1;

            #取累计应收

            /* [获取表记录变量语句][平台估值_估值汇总_估值产品交易组利息表][ifnull(sum({当前金额}-{确认金额}), 0)][@累计应收额#][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号#] */
            select ifnull(sum(curr_amt-confirm_apply), 0) into v_accumulative_receivable from db_eva.tb_evatotal_pd_exgp_interest_total where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no limit 1;

            #保障基金账户作为应收

            /* [获取表记录变量语句][平台估值_业务数据_估值产品交易组账户资金表][ifnull(sum({当前金额}),0)+@累计应收额#][@累计应收额#][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号#  and  {产品账户类型} =《产品账户类型-金融资产账户》] */
            select ifnull(sum(curr_amt),0)+v_accumulative_receivable into v_accumulative_receivable from db_eva.tb_evadata_pd_exgp_acco_capit where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no  and  pd_acco_type =11 limit 1;

            #债券利息作为应收

           /* [获取表记录变量语句][平台估值_业务数据_估值产品交易组证券持仓表][ifnull(sum({利息收益}),0)+@累计应收额#][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号#  and {证券类型}  in (《证券类型-公司债》,《证券类型-回购标准券》)] */
           select ifnull(sum(intrst_pandl),0)+v_accumulative_receivable into v_accumulative_receivable from db_eva.tb_evadata_pd_exgp_secu_posi where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no  and stock_type  in (23,27) limit 1;

            #取累计应付

            /* [获取表记录变量语句][平台估值_估值汇总_估值产品交易组费用表][ifnull(sum({当前金额}-{确认金额}),0)][@累计应付额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号#] */
            select ifnull(sum(curr_amt-confirm_apply),0) into v_accumulative_payable from db_eva.tb_evatotal_pd_exgp_fee_total where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no limit 1;

            #应付暂存账户作为应付

            /* [获取表记录变量语句][平台估值_业务数据_估值产品交易组账户资金表][ifnull(sum({当前金额}),0)+@累计应付额#][@累计应付额#][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号#  and  {产品账户类型} =《产品账户类型-应付暂存账户》] */
            select ifnull(sum(curr_amt),0)+v_accumulative_payable into v_accumulative_payable from db_eva.tb_evadata_pd_exgp_acco_capit where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no  and  pd_acco_type =12 limit 1;


           /* set @期货资产#=0; */
           set v_futu_asset=0;

           /* set @期权资产#=0; */
           set v_option_asset=0;

           /* set @其他资产#=0; */
           set v_other_asset=0;

           /* set @申购应收金额#=0; */
           set v_apply_amt=0;

           /* set @赎回应付金额#=0; */
           set v_redemp_amt=0;

            /* set @总资产#=@现金余额#+@账户余额#+@股票市值#+@基金资产#+@债券资产#+@期货资产#+@期权资产#+@其他资产#; */
            set v_total_asset=v_cash_bala+v_acco_cash+v_stock_market_value+v_fund_asset+v_bond_asset+v_futu_asset+v_option_asset+v_other_asset;

            /* set @净资产#=@总资产#+@累计应收额#-@累计应付额#+@申购应收金额#-@赎回应付金额#; */
            set v_nav_asset=v_total_asset+v_accumulative_receivable-v_accumulative_payable+v_apply_amt-v_redemp_amt;

            /* set @单位净值#=ifnull(round(@净资产#/@产品当前份额#, 4), 0); */
            set v_unit_nav=ifnull(round(v_nav_asset/v_pd_curr_share, 4), 0);

            /* [插入重复更新][平台估值_估值汇总_估值产品交易组资产信息表][字段][字段变量][{产品当前份额}=@产品当前份额#,{总资产}=@总资产#,{净资产}=@净资产#,{现金余额}=@现金余额#,{账户余额}=@账户余额#,{股票市值}=@股票市值#,{基金资产}=@基金资产#,{债券资产}=@债券资产#,{累计应付额}=@累计应付额#,{累计应收额}=@累计应收额#,{申购应收金额}=@申购应收金额#,{赎回应付金额}=@赎回应付金额#,{单位净值}=@单位净值#,{累计派现金额}=@累计派现金额#,{累计单位净值}=@累计单位净值#][2]["更新估值产品资产信息记录错误！"] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_eva.tb_evatotal_product_exgp_asset_info (
                create_date, create_time, update_date, 
                update_time, update_times, init_date, co_no, 
                pd_no, exch_group_no, pd_curr_share, total_asset, 
                nav_asset, cash_bala, acco_cash, stock_market_value, 
                fund_asset, bond_asset, futu_asset, option_asset, 
                other_asset, accumulative_receivable, accumulative_payable, apply_amt, 
                redemp_amt, unit_nav, total_cash_divide, total_unit_nav, 
                remark_info) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_pd_curr_share, v_total_asset, 
                v_nav_asset, v_cash_bala, v_acco_cash, v_stock_market_value, 
                v_fund_asset, v_bond_asset, v_futu_asset, v_option_asset, 
                v_other_asset, v_accumulative_receivable, v_accumulative_payable, v_apply_amt, 
                v_redemp_amt, v_unit_nav, v_total_cash_divide, v_total_unit_nav, 
                v_remark_info) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pd_curr_share=v_pd_curr_share,total_asset=v_total_asset,nav_asset=v_nav_asset,cash_bala=v_cash_bala,acco_cash=v_acco_cash,stock_market_value=v_stock_market_value,fund_asset=v_fund_asset,bond_asset=v_bond_asset,accumulative_payable=v_accumulative_payable,accumulative_receivable=v_accumulative_receivable,apply_amt=v_apply_amt,redemp_amt=v_redemp_amt,unit_nav=v_unit_nav,total_cash_divide=v_total_cash_divide,total_unit_nav=v_total_unit_nav;
            if v_error_code = "1" then
                        
                SET v_error_code = "evaA.3.75.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT("更新估值产品资产信息记录错误！","#",v_mysql_message);
                else
                    SET v_error_info = "更新估值产品资产信息记录错误！";
                end if;
                leave label_pro;
            end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_更新产品交易组费用利息期初金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_updatePdExgpFeeRateBeginAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_updatePdExgpFeeRateBeginAmt(
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
    declare v_exch_group_no int;
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pd_fee_type int;
    declare v_pd_fee_rate decimal(18,12);
    declare v_pd_fee_circle int;
    declare v_min_fee decimal(18,4);
    declare v_fina_acco_code varchar(64);
    declare v_calc_fee_date_str varchar(4096);
    declare v_eva_calc_type int;
    declare v_remark_info varchar(255);
    declare v_begin_amt decimal(18,4);
    declare v_evalu_deal_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pd_fee_type = 0;
    SET v_pd_fee_rate = 0;
    SET v_pd_fee_circle = 0;
    SET v_min_fee = 0;
    SET v_fina_acco_code = " ";
    SET v_calc_fee_date_str = " ";
    SET v_eva_calc_type = 0;
    SET v_remark_info = " ";
    SET v_begin_amt = 0;
    SET v_evalu_deal_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    
    #对估值产品费用表里的记录游标循环处理

    /* [声明游标][平台估值_基础参数_估值产品费率表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号#][cursor_eva_product_exgp_fee] */
    cursor_eva_product_exgp_fee:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_product_exgp_fee CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_fee_type, pd_fee_rate, pd_fee_circle, 
        min_fee, fina_acco_code, calc_fee_date_str, eva_calc_type, 
        remark_info 
        from db_eva.tb_evabasic_product_fee 
        where co_no=v_co_no and pd_no=v_pd_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_eva_product_exgp_fee][loop_eva_product_exgp_fee] */
    open cursor_eva_product_exgp_fee;
    loop_eva_product_exgp_fee: LOOP
    fetch cursor_eva_product_exgp_fee into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_pd_fee_type, v_pd_fee_rate, v_pd_fee_circle, 
        v_min_fee, v_fina_acco_code, v_calc_fee_date_str, v_eva_calc_type, 
        v_remark_info;
        IF v_cursor_done THEN
            LEAVE loop_eva_product_exgp_fee;
        END IF;

        #获取上日初始值

        /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品交易组费用表][{当前金额}-{确认金额}][@期初金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}<@估值日期# and {产品费用类型}=@产品费用类型# order by {初始化日期} desc] */
        select curr_amt-confirm_apply into v_begin_amt from db_eva_his.tb_evatotal_pd_exgp_fee_total_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date<v_evalu_date and pd_fee_type=v_pd_fee_type order by init_date desc limit 1;

       #初始化估值产品费用表期初金额

       /* [更新表记录][平台估值_估值汇总_估值产品交易组费用表][{当前金额} = @期初金额#,{期初金额}=@期初金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}=@估值日期# and {产品费用类型}=@产品费用类型# and {手工标志}=0][2][@产品编号#] */
       set v_update_date = date_format(curdate(),'%Y%m%d');
       set v_update_time = date_format(curtime(),'%H%i%s');
       update db_eva.tb_evatotal_pd_exgp_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = v_begin_amt,begin_amt=v_begin_amt where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date=v_evalu_date and pd_fee_type=v_pd_fee_type and manual_flag=0;
       if v_error_code = "1" then
                   
           SET v_error_code = "evaA.3.76.2";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
           else
               SET v_error_info = concat("产品编号=",v_pd_no);
           end if;
           close cursor_eva_product_exgp_fee;
           leave label_pro;
       end if;


    /* [关闭游标][cursor_eva_product_exgp_fee] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_product_exgp_fee;
    end cursor_eva_product_exgp_fee;

    #初始化估值产品利息表当前金额

    /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品交易组利息表][{初始化日期}][@估值处理日期#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}<@估值日期#  order by {初始化日期} desc] */
    select init_date into v_evalu_deal_date from db_eva_his.tb_evatotal_pd_exgp_interest_total_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date<v_evalu_date  order by init_date desc limit 1;


    /* update ~平台估值_估值汇总_估值产品交易组利息表^ a,~历史_平台估值_估值汇总_估值产品交易组利息表^ b set a.{期初金额}= b.{当前金额}-b.{确认金额},a.{当前金额}=b.{当前金额}-b.{确认金额} where a.{机构编号} = b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{资产账户} =b.{资产账户} and a.{交易组编号}=b.{交易组编号} and a.{机构编号} = @机构编号# and a.{产品编号} = @产品编号# and a.{交易组编号}=@交易组编号# and a.{初始化日期}=@估值日期# and a.{手工标志}=0 and b.{初始化日期}=@估值处理日期#; */
    update db_eva.tb_evatotal_pd_exgp_interest_total a,db_eva_his.tb_evatotal_pd_exgp_interest_total_his b set a.begin_amt= b.curr_amt-b.confirm_apply,a.curr_amt=b.curr_amt-b.confirm_apply where a.co_no = b.co_no and a.pd_no=b.pd_no and a.asset_acco =b.asset_acco and a.exch_group_no=b.exch_group_no and a.co_no = v_co_no and a.pd_no = v_pd_no and a.exch_group_no=v_exch_group_no and a.init_date=v_evalu_date and a.manual_flag=0 and b.init_date=v_evalu_deal_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品交易组资产信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdExgpAssetInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdExgpAssetInfo(
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
    

    /* select a.{更新日期},a.{更新时间},a.{初始化日期},a.{机构编号},a.{产品编号},a.{交易组编号},a.{产品当前份额},a.{总资产},a.{净资产},a.{现金余额},a.{账户余额},a.{股票市值},a.{基金资产},a.{债券资产},a.{期货资产},a.{期权资产},a.{其他资产},a.{累计应收额},a.{累计应付额},a.{申购应收金额},a.{赎回应付金额},a.{单位净值},a.{累计派现金额},a.{累计单位净值},a.{备注信息},ifnull((a.{单位净值}-b.{单位净值})/b.{单位净值},0) as {当日收益率}  from (select * from ~历史_平台估值_估值汇总_估值产品交易组资产信息表^ where {机构编号}=@机构编号# and ({产品编号}=@产品编号# or @产品编号# =0) and  ({交易组编号}=@交易组编号# or @交易组编号# =0) and {初始化日期} between @开始日期# and @结束日期# union select * from ~平台估值_估值汇总_估值产品交易组资产信息表^ where {机构编号}=@机构编号# and ({产品编号}=@产品编号# or @产品编号# =0) and ({交易组编号}=@交易组编号# or @交易组编号# =0) and {初始化日期} between @开始日期# and @结束日期# order by {初始化日期}) a left join ~历史_平台估值_估值汇总_估值产品交易组资产信息表^ b on a.{机构编号}=b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{交易组编号}=b.{交易组编号} and DATE_FORMAT(DATE_SUB(a.{初始化日期},INTERVAL 1 DAY),'%Y%m%d')=b.{初始化日期}; */
    select a.update_date,a.update_time,a.init_date,a.co_no,a.pd_no,a.exch_group_no,a.pd_curr_share,a.total_asset,a.nav_asset,a.cash_bala,a.acco_cash,a.stock_market_value,a.fund_asset,a.bond_asset,a.futu_asset,a.option_asset,a.other_asset,a.accumulative_receivable,a.accumulative_payable,a.apply_amt,a.redemp_amt,a.unit_nav,a.total_cash_divide,a.total_unit_nav,a.remark_info,ifnull((a.unit_nav-b.unit_nav)/b.unit_nav,0) as daily_pandl_ratio  from (select * from db_eva_his.tb_evatotal_product_exgp_asset_info_his where co_no=v_co_no and (pd_no=v_pd_no or v_pd_no =0) and  (exch_group_no=v_exch_group_no or v_exch_group_no =0) and init_date between v_begin_date and v_end_date union select * from db_eva.tb_evatotal_product_exgp_asset_info where co_no=v_co_no and (pd_no=v_pd_no or v_pd_no =0) and (exch_group_no=v_exch_group_no or v_exch_group_no =0) and init_date between v_begin_date and v_end_date order by init_date) a left join db_eva_his.tb_evatotal_product_exgp_asset_info_his b on a.co_no=b.co_no and a.pd_no=b.pd_no and a.exch_group_no=b.exch_group_no and DATE_FORMAT(DATE_SUB(a.init_date,INTERVAL 1 DAY),'%Y%m%d')=b.init_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_新增估值产品交易组费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_addPdExgpFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_addPdExgpFeeAmt(
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
    declare v_init_date int;
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
    declare v_confirm_apply decimal(18,4);
    declare v_manual_flag int;
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
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_begin_amt = p_begin_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_pd_net_asset = p_pd_net_asset;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_confirm_apply = 0;
    SET v_manual_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* set @确认金额#=0; */
    set v_confirm_apply=0;

    /* set @手工标志#=1; */
    set v_manual_flag=1;

    /* [插入重复更新][平台估值_估值汇总_估值产品交易组费用表][字段][字段变量][{期初金额}=@期初金额#,{当前金额}=@当前金额#,{产品净资产}=@产品净资产#,{确认金额}=@确认金额#,{备注信息}=@备注信息#,{手工标志}=@手工标志#][1][@备注信息#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evatotal_pd_exgp_fee_total (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, pd_fee_type, crncy_type, 
        begin_amt, curr_amt, pd_net_asset, confirm_apply, 
        remark_info, manual_flag) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_pd_fee_type, v_crncy_type, 
        v_begin_amt, v_curr_amt, v_pd_net_asset, v_confirm_apply, 
        v_remark_info, v_manual_flag) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, begin_amt=v_begin_amt,curr_amt=v_curr_amt,pd_net_asset=v_pd_net_asset,confirm_apply=v_confirm_apply,remark_info=v_remark_info,manual_flag=v_manual_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.78.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("备注信息=",v_remark_info),"#",v_mysql_message);
        else
            SET v_error_info = concat("备注信息=",v_remark_info);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_修改估值产品交易组费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_modiPdExgpFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_modiPdExgpFeeAmt(
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
    declare v_init_date int;
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* [更新表记录][平台估值_估值汇总_估值产品交易组费用表][{当前金额}=@当前金额#,{产品净资产}=@产品净资产#,{确认金额}=@确认金额#,{备注信息}=@备注信息#,{手工标志}=1][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {产品费用类型}=@产品费用类型# and {本币币种}=@本币币种#][2][@产品编号#,@交易组编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evatotal_pd_exgp_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=v_curr_amt,pd_net_asset=v_pd_net_asset,confirm_apply=v_confirm_apply,remark_info=v_remark_info,manual_flag=1 where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and pd_fee_type=v_pd_fee_type and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.79.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_删除估值产品交易组费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_delPdExgpFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_delPdExgpFeeAmt(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pd_fee_type int;
    declare v_crncy_type varchar(3);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* [删除表记录][平台估值_估值汇总_估值产品交易组费用表][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {产品费用类型}=@产品费用类型# and {本币币种}=@本币币种#][3][@产品编号#] */
    delete from db_eva.tb_evatotal_pd_exgp_fee_total 
        where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and pd_fee_type=v_pd_fee_type and crncy_type=v_crncy_type;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.80.3";
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
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品交易组费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdExgpFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdExgpFeeAmt(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_pd_fee_type int;
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_估值汇总_估值产品交易组费用表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@产品费用类型# =0 or {产品费用类型}=@产品费用类型#) and (@本币币种# =0 or {本币币种}=@本币币种#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, pd_fee_type, 
        crncy_type, begin_amt, curr_amt, pd_net_asset, 
        confirm_apply, remark_info, manual_flag from db_eva.tb_evatotal_pd_exgp_fee_total where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pd_fee_type =0 or pd_fee_type=v_pd_fee_type) and (v_crncy_type =0 or crncy_type=v_crncy_type);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, pd_fee_type, 
        crncy_type, begin_amt, curr_amt, pd_net_asset, 
        confirm_apply, remark_info, manual_flag from db_eva.tb_evatotal_pd_exgp_fee_total where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pd_fee_type =0 or pd_fee_type=v_pd_fee_type) and (v_crncy_type =0 or crncy_type=v_crncy_type) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_新增估值产品交易组利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_addPdExgpInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_addPdExgpInterestAmt(
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
    declare v_init_date int;
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
    declare v_confirm_apply decimal(18,4);
    declare v_manual_flag int;
    declare v_pd_rate_type int;
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
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_begin_amt = p_begin_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_intrst_base_amt = p_intrst_base_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_confirm_apply = 0;
    SET v_manual_flag = 0;
    SET v_pd_rate_type = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* set @确认金额#=0; */
    set v_confirm_apply=0;

    /* set @手工标志#=1; */
    set v_manual_flag=1;

    /* set @产品利率类型#=0; */
    set v_pd_rate_type=0;

    /* [插入重复更新][平台估值_估值汇总_估值产品交易组利息表][字段][字段变量][{期初金额}=@期初金额#,{当前金额}=@当前金额#,{利息积数}=@利息积数#,{备注信息}=@备注信息#,{手工标志}=@手工标志#][1][@备注信息#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evatotal_pd_exgp_interest_total (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, pd_rate_type, asset_acco, exch_group_no, 
        crncy_type, begin_amt, curr_amt, intrst_base_amt, 
        confirm_apply, remark_info, manual_flag) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_pd_rate_type, v_asset_acco, v_exch_group_no, 
        v_crncy_type, v_begin_amt, v_curr_amt, v_intrst_base_amt, 
        v_confirm_apply, v_remark_info, v_manual_flag) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, begin_amt=v_begin_amt,curr_amt=v_curr_amt,intrst_base_amt=v_intrst_base_amt,remark_info=v_remark_info,manual_flag=v_manual_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.82.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("备注信息=",v_remark_info),"#",v_mysql_message);
        else
            SET v_error_info = concat("备注信息=",v_remark_info);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_修改估值产品交易组利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_modiPdExgpInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_modiPdExgpInterestAmt(
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
    declare v_init_date int;
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* [更新表记录][平台估值_估值汇总_估值产品交易组利息表][{当前金额}=@当前金额#,{利息积数}=@利息积数#,{确认金额}=@确认金额#,{备注信息}=@备注信息#,{手工标志}=1][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户}=@资产账户# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evatotal_pd_exgp_interest_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=v_curr_amt,intrst_base_amt=v_intrst_base_amt,confirm_apply=v_confirm_apply,remark_info=v_remark_info,manual_flag=1 where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and asset_acco=v_asset_acco and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.83.2";
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
use db_eva;;

# 原子_平台估值_估值汇总_删除估值产品交易组利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_delPdExgpInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_delPdExgpInterestAmt(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* [删除表记录][平台估值_估值汇总_估值产品交易组利息表][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户}=@资产账户# and {本币币种}=@本币币种#][3][@产品编号#] */
    delete from db_eva.tb_evatotal_pd_exgp_interest_total 
        where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco=v_asset_acco and crncy_type=v_crncy_type;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.84.3";
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
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品交易组利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdExgpInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdExgpInterestAmt(
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco varchar(16);
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco = p_asset_acco;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_估值汇总_估值产品交易组利息表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户# =" " or {资产账户}=@资产账户#) and (@本币币种# =0 or {本币币种}=@本币币种#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_rate_type, asset_acco, 
        exch_group_no, crncy_type, begin_amt, curr_amt, 
        intrst_base_amt, confirm_apply, remark_info, manual_flag from db_eva.tb_evatotal_pd_exgp_interest_total where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco =" " or asset_acco=v_asset_acco) and (v_crncy_type =0 or crncy_type=v_crncy_type);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_rate_type, asset_acco, 
        exch_group_no, crncy_type, begin_amt, curr_amt, 
        intrst_base_amt, confirm_apply, remark_info, manual_flag from db_eva.tb_evatotal_pd_exgp_interest_total where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco =" " or asset_acco=v_asset_acco) and (v_crncy_type =0 or crncy_type=v_crncy_type) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_生成估值产品交易组历史资产信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_createHisPdExgpAseetInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_createHisPdExgpAseetInfo(
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
    declare v_exch_group_no int;
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_total_cash_divide decimal(18,4);
    declare v_total_unit_nav decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_pd_curr_share decimal(18,2);
    declare v_cash_bala decimal(18,4);
    declare v_acco_cash decimal(18,4);
    declare v_stock_market_value decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_accumulative_receivable decimal(18,4);
    declare v_accumulative_payable decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_option_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_apply_amt decimal(18,4);
    declare v_redemp_amt decimal(18,4);
    declare v_total_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_unit_nav decimal(18,4);
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_total_cash_divide = 0;
    SET v_total_unit_nav = 0;
    SET v_remark_info = " ";
    SET v_pd_curr_share = 0;
    SET v_cash_bala = 0;
    SET v_acco_cash = 0;
    SET v_stock_market_value = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_accumulative_receivable = 0;
    SET v_accumulative_payable = 0;
    SET v_futu_asset = 0;
    SET v_option_asset = 0;
    SET v_other_asset = 0;
    SET v_apply_amt = 0;
    SET v_redemp_amt = 0;
    SET v_total_asset = 0;
    SET v_nav_asset = 0;
    SET v_unit_nav = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

            /* set @初始化日期#=@估值日期#; */
            set v_init_date=v_evalu_date;

            /* set @累计派现金额#=0; */
            set v_total_cash_divide=0;

            /* set @累计单位净值#=0; */
            set v_total_unit_nav=0;

            /* set @备注信息#=''; */
            set v_remark_info='';
            #统计获取产品历史份额

            /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品资产信息表][{产品当前份额}][@产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# order by {初始化日期} desc][4][@产品编号#] */
            select pd_curr_share into v_pd_curr_share from db_eva_his.tb_evatotal_product_asset_info_his where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date order by init_date desc limit 1;

            #取产品现金余额

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品交易组账户资金表][ifnull(sum({当前金额}),0)][@现金余额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}=@初始化日期# and  {产品账户类型} =《产品账户类型-银行账户》] */
            select ifnull(sum(curr_amt),0) into v_cash_bala from db_eva_his.tb_evadata_pd_exgp_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date=v_init_date and  pd_acco_type =1 limit 1;

            #取产品账户资金

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品交易组账户资金表][ifnull(sum({当前金额}), 0)][@账户余额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}=@初始化日期# and {产品账户类型} in (《产品账户类型-证券账户》,《产品账户类型-期货账户》)] */
            select ifnull(sum(curr_amt), 0) into v_acco_cash from db_eva_his.tb_evadata_pd_exgp_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date=v_init_date and pd_acco_type in (2,3) limit 1;

           #取股票资产

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品交易组证券持仓表][ifnull(sum({当前数量}*{最新价}*{汇率}), 0)][@股票市值#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}=@初始化日期# and {证券类型} in(《证券类型-股票》,《证券类型-申购》)] */
            select ifnull(sum(curr_qty*last_price*exch_rate), 0) into v_stock_market_value from db_eva_his.tb_evadata_pd_exgp_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date=v_init_date and stock_type in(1,2) limit 1;

           #取基金资产

           /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品交易组证券持仓表][ifnull(SUM(({当前数量}+round({当前数量}*{利息收益}/10000,0))*{最新价}),0)][@基金资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}=@初始化日期# and {证券类型} in (《证券类型-ETF基金》,《证券类型-货币ETF基金》,《证券类型-封闭式基金》,《证券类型-分级基金》,《证券类型-普通货币基金》)] */
           select ifnull(SUM((curr_qty+round(curr_qty*intrst_pandl/10000,0))*last_price),0) into v_fund_asset from db_eva_his.tb_evadata_pd_exgp_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date=v_init_date and stock_type in (52,57,51,54,63) limit 1;

           #取债券资产

           /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品交易组证券持仓表][ifnull(sum({当前数量}*{最新价}), 0)][@债券资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}=@初始化日期# and {证券类型} in (《证券类型-公司债》,《证券类型-企业债》,《证券类型-可转债》,《证券类型-回购标准券》)] */
           select ifnull(sum(curr_qty*last_price), 0) into v_bond_asset from db_eva_his.tb_evadata_pd_exgp_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date=v_init_date and stock_type in (23,22,24,27) limit 1;

            #取累计应收

            /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品交易组利息表][ifnull(sum({当前金额}-{确认金额}), 0)][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}=@初始化日期#] */
            select ifnull(sum(curr_amt-confirm_apply), 0) into v_accumulative_receivable from db_eva_his.tb_evatotal_pd_exgp_interest_total_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date=v_init_date limit 1;

            #保障基金账户作为应收

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品交易组账户资金表][ifnull(sum({当前金额}),0)+@累计应收额#][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号#  and {初始化日期}=@初始化日期# and  {产品账户类型} =《产品账户类型-金融资产账户》] */
            select ifnull(sum(curr_amt),0)+v_accumulative_receivable into v_accumulative_receivable from db_eva_his.tb_evadata_pd_exgp_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no  and init_date=v_init_date and  pd_acco_type =11 limit 1;

            #债券利息作为应收

           /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品交易组证券持仓表][ifnull(sum({利息收益}),0)+@累计应收额#][@累计应收额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}=@初始化日期#  and {证券类型}  in (《证券类型-公司债》,《证券类型-回购标准券》)] */
           select ifnull(sum(intrst_pandl),0)+v_accumulative_receivable into v_accumulative_receivable from db_eva_his.tb_evadata_pd_exgp_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date=v_init_date  and stock_type  in (23,27) limit 1;

            #取累计应付

            /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品交易组费用表][ifnull(sum({当前金额}-{确认金额}),0)][@累计应付额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}=@初始化日期#] */
            select ifnull(sum(curr_amt-confirm_apply),0) into v_accumulative_payable from db_eva_his.tb_evatotal_pd_exgp_fee_total_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date=v_init_date limit 1;

            #应付暂存账户作为应付

            /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品交易组账户资金表][ifnull(sum({当前金额}),0)+@累计应付额#][@累计应付额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}=@初始化日期# and  {产品账户类型} =《产品账户类型-应付暂存账户》] */
            select ifnull(sum(curr_amt),0)+v_accumulative_payable into v_accumulative_payable from db_eva_his.tb_evadata_pd_exgp_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date=v_init_date and  pd_acco_type =12 limit 1;


           /* set @期货资产#=0; */
           set v_futu_asset=0;

           /* set @期权资产#=0; */
           set v_option_asset=0;

           /* set @其他资产#=0; */
           set v_other_asset=0;

           /* set @申购应收金额#=0; */
           set v_apply_amt=0;

           /* set @赎回应付金额#=0; */
           set v_redemp_amt=0;

            /* set @总资产#=@现金余额#+@账户余额#+@股票市值#+@基金资产#+@债券资产#+@期货资产#+@期权资产#+@其他资产#; */
            set v_total_asset=v_cash_bala+v_acco_cash+v_stock_market_value+v_fund_asset+v_bond_asset+v_futu_asset+v_option_asset+v_other_asset;

            /* set @净资产#=@总资产#+@累计应收额#-@累计应付额#+@申购应收金额#-@赎回应付金额#; */
            set v_nav_asset=v_total_asset+v_accumulative_receivable-v_accumulative_payable+v_apply_amt-v_redemp_amt;

            /* set @单位净值#=ifnull(round(@净资产#/@产品当前份额#, 4), 0); */
            set v_unit_nav=ifnull(round(v_nav_asset/v_pd_curr_share, 4), 0);

            /* [插入重复更新][历史_平台估值_估值汇总_估值产品交易组资产信息表][字段][字段变量][{产品当前份额}=@产品当前份额#,{总资产}=@总资产#,{净资产}=@净资产#,{现金余额}=@现金余额#,{账户余额}=@账户余额#,{股票市值}=@股票市值#,{基金资产}=@基金资产#,{债券资产}=@债券资产#,{累计应付额}=@累计应付额#,{累计应收额}=@累计应收额#,{申购应收金额}=@申购应收金额#,{赎回应付金额}=@赎回应付金额#,{单位净值}=@单位净值#,{累计派现金额}=@累计派现金额#,{累计单位净值}=@累计单位净值#][1]["更新估值产品交易组资产信息记录错误！"] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_eva_his.tb_evatotal_product_exgp_asset_info_his (
                create_date, create_time, update_date, 
                update_time, update_times, init_date, co_no, 
                pd_no, exch_group_no, pd_curr_share, total_asset, 
                nav_asset, cash_bala, acco_cash, stock_market_value, 
                fund_asset, bond_asset, futu_asset, option_asset, 
                other_asset, accumulative_receivable, accumulative_payable, apply_amt, 
                redemp_amt, unit_nav, total_cash_divide, total_unit_nav, 
                remark_info) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_init_date, v_co_no, 
                v_pd_no, v_exch_group_no, v_pd_curr_share, v_total_asset, 
                v_nav_asset, v_cash_bala, v_acco_cash, v_stock_market_value, 
                v_fund_asset, v_bond_asset, v_futu_asset, v_option_asset, 
                v_other_asset, v_accumulative_receivable, v_accumulative_payable, v_apply_amt, 
                v_redemp_amt, v_unit_nav, v_total_cash_divide, v_total_unit_nav, 
                v_remark_info) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pd_curr_share=v_pd_curr_share,total_asset=v_total_asset,nav_asset=v_nav_asset,cash_bala=v_cash_bala,acco_cash=v_acco_cash,stock_market_value=v_stock_market_value,fund_asset=v_fund_asset,bond_asset=v_bond_asset,accumulative_payable=v_accumulative_payable,accumulative_receivable=v_accumulative_receivable,apply_amt=v_apply_amt,redemp_amt=v_redemp_amt,unit_nav=v_unit_nav,total_cash_divide=v_total_cash_divide,total_unit_nav=v_total_unit_nav;
            if v_error_code = "1" then
                        
                SET v_error_code = "evaA.3.86.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT("更新估值产品交易组资产信息记录错误！","#",v_mysql_message);
                else
                    SET v_error_info = "更新估值产品交易组资产信息记录错误！";
                end if;
                leave label_pro;
            end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_计算估值产品交易组历史费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_calcPdExgpHisFee;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_calcPdExgpHisFee(
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
    IN p_nav_asset decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_nav_asset decimal(18,4);
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_init_date int;
    declare v_curr_amt decimal(18,4);
    declare v_pd_net_asset decimal(18,4);
    declare v_confirm_apply decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pd_fee_type int;
    declare v_pd_fee_rate decimal(18,12);
    declare v_pd_fee_circle int;
    declare v_min_fee decimal(18,4);
    declare v_fina_acco_code varchar(64);
    declare v_calc_fee_date_str varchar(4096);
    declare v_eva_calc_type int;
    declare v_remark_info varchar(255);
    declare v_begin_amt decimal(18,4);
    declare v_manual_flag int;
    declare v_payab_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_nav_asset = p_nav_asset;
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_curr_amt = 0;
    SET v_pd_net_asset = 0;
    SET v_confirm_apply = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pd_fee_type = 0;
    SET v_pd_fee_rate = 0;
    SET v_pd_fee_circle = 0;
    SET v_min_fee = 0;
    SET v_fina_acco_code = " ";
    SET v_calc_fee_date_str = " ";
    SET v_eva_calc_type = 0;
    SET v_remark_info = " ";
    SET v_begin_amt = 0;
    SET v_manual_flag = 0;
    SET v_payab_amt = 0;

    
    label_pro:BEGIN
    

    /* set @本币币种#=《本币币种-人民币》; */
    set v_crncy_type="CNY";

    /* set @初始化日期#=@估值日期#; */
    set v_init_date=v_evalu_date;

    /* set @当前金额#=0; */
    set v_curr_amt=0;

    /* set @产品净资产#=@净资产#; */
    set v_pd_net_asset=v_nav_asset;

    /* set @确认金额#=0; */
    set v_confirm_apply=0;
    #对估值产品费用表里的记录游标循环处理

    /* [声明游标][平台估值_基础参数_估值产品费率表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号#][cursor_eva_product_fee] */
    cursor_eva_product_fee:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_product_fee CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, pd_fee_type, pd_fee_rate, pd_fee_circle, 
        min_fee, fina_acco_code, calc_fee_date_str, eva_calc_type, 
        remark_info 
        from db_eva.tb_evabasic_product_fee 
        where co_no=v_co_no and pd_no=v_pd_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_eva_product_fee][loop_eva_product_fee] */
    open cursor_eva_product_fee;
    loop_eva_product_fee: LOOP
    fetch cursor_eva_product_fee into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_pd_fee_type, v_pd_fee_rate, v_pd_fee_circle, 
        v_min_fee, v_fina_acco_code, v_calc_fee_date_str, v_eva_calc_type, 
        v_remark_info;
        IF v_cursor_done THEN
            LEAVE loop_eva_product_fee;
        END IF;


         /* set @期初金额#=0; */
         set v_begin_amt=0;
        #获取上日初始值

        /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品交易组费用表][{当前金额}-{确认金额}][@期初金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}<@估值日期# and {产品费用类型}=@产品费用类型# order by {初始化日期} desc] */
        select curr_amt-confirm_apply into v_begin_amt from db_eva_his.tb_evatotal_pd_exgp_fee_total_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date<v_evalu_date and pd_fee_type=v_pd_fee_type order by init_date desc limit 1;


         /* set @手工标志#=0; */
         set v_manual_flag=0;
        #获取自动计算值

        /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品交易组费用表][{手工标志}][@手工标志#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}=@估值日期# and {产品费用类型}=@产品费用类型#] */
        select manual_flag into v_manual_flag from db_eva_his.tb_evatotal_pd_exgp_fee_total_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date=v_evalu_date and pd_fee_type=v_pd_fee_type limit 1;


         /* if @手工标志#=0 then */
         if v_manual_flag=0 then
           #初始化历史估值产品费用表当前金额

          /* [插入重复更新][历史_平台估值_估值汇总_估值产品交易组费用表][字段][字段变量][{当前金额} = @期初金额#,{期初金额}=@期初金额#][1][@产品编号#,@交易组编号#] */
          set v_create_date = date_format(curdate(),'%Y%m%d');
          set v_create_time = date_format(curtime(),'%H%i%s');
          set v_update_date = v_create_date;
          set v_update_time = v_create_time;
          set v_update_times = 1;
          insert into db_eva_his.tb_evatotal_pd_exgp_fee_total_his (
              create_date, create_time, update_date, 
              update_time, update_times, init_date, co_no, 
              pd_no, exch_group_no, pd_fee_type, crncy_type, 
              begin_amt, curr_amt, pd_net_asset, confirm_apply, 
              remark_info, manual_flag) 
          values(
              v_create_date, v_create_time, v_update_date, 
              v_update_time, v_update_times, v_init_date, v_co_no, 
              v_pd_no, v_exch_group_no, v_pd_fee_type, v_crncy_type, 
              v_begin_amt, v_curr_amt, v_pd_net_asset, v_confirm_apply, 
              v_remark_info, v_manual_flag) 
          ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt = v_begin_amt,begin_amt=v_begin_amt;
          if v_error_code = "1" then
                      
              SET v_error_code = "evaA.3.87.1";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
              else
                  SET v_error_info = concat("产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no);
              end if;
              close cursor_eva_product_fee;
              leave label_pro;
          end if;


         /* set @应付金额# = round(@净资产# * @产品费用费率#/@产品计费周期#,2); */
         set v_payab_amt = round(v_nav_asset * v_pd_fee_rate/v_pd_fee_circle,2);

        /* [插入重复更新][历史_平台估值_估值汇总_估值产品交易组费用表][字段][字段变量][{当前金额} = {当前金额} + @应付金额#,{产品净资产}=@净资产#][1][concat("更新历史估值产品交易组费用表记录错误！【机构编号】=", @机构编号#,"【产品编号】=",@产品编号#,"【交易组编号】=",@交易组编号#,"【产品费用类型】=",@产品费用类型#)] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_eva_his.tb_evatotal_pd_exgp_fee_total_his (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, pd_fee_type, crncy_type, 
            begin_amt, curr_amt, pd_net_asset, confirm_apply, 
            remark_info, manual_flag) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_pd_fee_type, v_crncy_type, 
            v_begin_amt, v_curr_amt, v_pd_net_asset, v_confirm_apply, 
            v_remark_info, v_manual_flag) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt = curr_amt + v_payab_amt,pd_net_asset=v_nav_asset;
        if v_error_code = "1" then
                    
            SET v_error_code = "evaA.3.87.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("更新历史估值产品交易组费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【交易组编号】=",v_exch_group_no,"【产品费用类型】=",v_pd_fee_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("更新历史估值产品交易组费用表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【交易组编号】=",v_exch_group_no,"【产品费用类型】=",v_pd_fee_type);
            end if;
            close cursor_eva_product_fee;
            leave label_pro;
        end if;

       end if;

    /* [关闭游标][cursor_eva_product_fee] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_product_fee;
    end cursor_eva_product_fee;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_计算估值产品交易组历史利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_calcPdExgpHisRate;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_calcPdExgpHisRate(
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
    declare v_exch_group_no int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* update ~历史_平台估值_业务数据_估值产品交易组账户资金表^ a,~平台估值_基础参数_估值产品利率表^ b set a.{预计利息}=GREATEST(round(a.{期初金额}*b.{利率}/b.{产品计费周期},2),b.{最低利息}) where a.{机构编号} = b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{资产账户} =b.{资产账户} and a.{机构编号} = @机构编号# and a.{产品编号} = @产品编号# and a.{交易组编号}=@交易组编号# and a.{初始化日期}=@估值日期#; */
    update db_eva_his.tb_evadata_pd_exgp_acco_capit_his a,db_eva.tb_evabasic_product_rate b set a.intrst_cacl_amt=GREATEST(round(a.begin_amt*b.intrst_rate/b.pd_fee_circle,2),b.min_interest) where a.co_no = b.co_no and a.pd_no=b.pd_no and a.asset_acco =b.asset_acco and a.co_no = v_co_no and a.pd_no = v_pd_no and a.exch_group_no=v_exch_group_no and a.init_date=v_evalu_date;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_统计估值产品交易组历史利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_sumPdExgpHisRate;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_sumPdExgpHisRate(
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
    declare v_exch_group_no int;
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
    declare v_confirm_apply decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pd_rate_type int;
    declare v_asset_acco varchar(16);
    declare v_begin_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);
    declare v_manual_flag int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_remark_info varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_curr_amt = 0;
    SET v_confirm_apply = 0;
    SET v_intrst_base_amt = 0;
    SET v_pd_rate_type = 0;
    SET v_asset_acco = " ";
    SET v_begin_amt = 0;
    SET v_intrst_cacl_amt = 0;
    SET v_manual_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* set @初始化日期#=@估值日期#; */
    set v_init_date=v_evalu_date;

    /* set @本币币种#=《本币币种-人民币》; */
    set v_crncy_type="CNY";

    /* set @当前金额#=0; */
    set v_curr_amt=0;

    /* set @确认金额#=0; */
    set v_confirm_apply=0;

    /* set @利息积数#=0; */
    set v_intrst_base_amt=0;

    /* set @产品利率类型#=0; */
    set v_pd_rate_type=0;

    /* [声明游标][平台估值_基础参数_估值产品利率表][{资产账户}][{机构编号}=@机构编号# and {产品编号}=@产品编号#][cursor_eva_product_rate] */
    cursor_eva_product_rate:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_product_rate CURSOR FOR
        select asset_acco 
        from db_eva.tb_evabasic_product_rate 
        where co_no=v_co_no and pd_no=v_pd_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@资产账户#][cursor_eva_product_rate][loop_eva_product_rate] */
    open cursor_eva_product_rate;
    loop_eva_product_rate: LOOP
    fetch cursor_eva_product_rate into v_asset_acco;
        IF v_cursor_done THEN
            LEAVE loop_eva_product_rate;
        END IF;


         /* set @期初金额#=0; */
         set v_begin_amt=0;

         /* set @预计利息#=0; */
         set v_intrst_cacl_amt=0;
        #获取上日初始值

        /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品交易组利息表][{当前金额}-{确认金额}][@期初金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}<@估值日期# and {资产账户}=@资产账户# order by {初始化日期} desc] */
        select curr_amt-confirm_apply into v_begin_amt from db_eva_his.tb_evatotal_pd_exgp_interest_total_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date<v_evalu_date and asset_acco=v_asset_acco order by init_date desc limit 1;


        /* set @手工标志#=0; */
        set v_manual_flag=0;
        #获取手工标志

        /* [获取表记录变量语句][历史_平台估值_估值汇总_估值产品交易组利息表][{手工标志}][@手工标志#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}=@估值日期# and {资产账户}=@资产账户#] */
        select manual_flag into v_manual_flag from db_eva_his.tb_evatotal_pd_exgp_interest_total_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date=v_evalu_date and asset_acco=v_asset_acco limit 1;


       /* if @手工标志#=0 then */
       if v_manual_flag=0 then
       #初始化历史估值产品利息表当前金额

       /* [插入重复更新][历史_平台估值_估值汇总_估值产品交易组利息表][字段][字段变量][{当前金额} = @期初金额#,{期初金额}=@期初金额#][1][@产品编号#] */
       set v_create_date = date_format(curdate(),'%Y%m%d');
       set v_create_time = date_format(curtime(),'%H%i%s');
       set v_update_date = v_create_date;
       set v_update_time = v_create_time;
       set v_update_times = 1;
       insert into db_eva_his.tb_evatotal_pd_exgp_interest_total_his (
           create_date, create_time, update_date, 
           update_time, update_times, init_date, co_no, 
           pd_no, pd_rate_type, asset_acco, exch_group_no, 
           crncy_type, begin_amt, curr_amt, intrst_base_amt, 
           confirm_apply, remark_info, manual_flag) 
       values(
           v_create_date, v_create_time, v_update_date, 
           v_update_time, v_update_times, v_init_date, v_co_no, 
           v_pd_no, v_pd_rate_type, v_asset_acco, v_exch_group_no, 
           v_crncy_type, v_begin_amt, v_curr_amt, v_intrst_base_amt, 
           v_confirm_apply, v_remark_info, v_manual_flag) 
       ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt = v_begin_amt,begin_amt=v_begin_amt;
       if v_error_code = "1" then
                   
           SET v_error_code = "evaA.3.89.1";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
           else
               SET v_error_info = concat("产品编号=",v_pd_no);
           end if;
           close cursor_eva_product_rate;
           leave label_pro;
       end if;

       #获取当日利息金额

        /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品交易组账户资金表][ifnull({预计利息},0)][@预计利息#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {初始化日期}=@估值日期# and {资产账户}=@资产账户#] */
        select ifnull(intrst_cacl_amt,0) into v_intrst_cacl_amt from db_eva_his.tb_evadata_pd_exgp_acco_capit_his where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and init_date=v_evalu_date and asset_acco=v_asset_acco limit 1;

       #更新当前金额

        /* [插入重复更新][历史_平台估值_估值汇总_估值产品交易组利息表][字段][字段变量][{当前金额} = {当前金额} + @预计利息#][1][concat("更新历史估值产品交易组利息表记录错误！【机构编号】=", @机构编号#,"【产品编号】=",@产品编号#,"【资产账户】=",@资产账户#)] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_eva_his.tb_evatotal_pd_exgp_interest_total_his (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, pd_rate_type, asset_acco, exch_group_no, 
            crncy_type, begin_amt, curr_amt, intrst_base_amt, 
            confirm_apply, remark_info, manual_flag) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_pd_rate_type, v_asset_acco, v_exch_group_no, 
            v_crncy_type, v_begin_amt, v_curr_amt, v_intrst_base_amt, 
            v_confirm_apply, v_remark_info, v_manual_flag) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt = curr_amt + v_intrst_cacl_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "evaA.3.89.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("更新历史估值产品交易组利息表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【资产账户】=",v_asset_acco),"#",v_mysql_message);
            else
                SET v_error_info = concat("更新历史估值产品交易组利息表记录错误！【机构编号】=", v_co_no,"【产品编号】=",v_pd_no,"【资产账户】=",v_asset_acco);
            end if;
            close cursor_eva_product_rate;
            leave label_pro;
        end if;

        end if;

    /* [关闭游标][cursor_eva_product_rate] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_product_rate;
    end cursor_eva_product_rate;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_新增估值产品交易组历史费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_addPdExgpHisFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_addPdExgpHisFeeAmt(
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
    declare v_init_date int;
    declare v_confirm_apply decimal(18,4);
    declare v_manual_flag int;
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_confirm_apply = 0;
    SET v_manual_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @初始化日期#=@估值日期#; */
    set v_init_date=v_evalu_date;

    /* set @确认金额#=0; */
    set v_confirm_apply=0;

    /* set @手工标志#=1; */
    set v_manual_flag=1;

    /* [插入重复更新][历史_平台估值_估值汇总_估值产品交易组费用表][字段][字段变量][{期初金额}=@期初金额#,{当前金额}=@当前金额#,{产品净资产}=@产品净资产#,{备注信息}=@备注信息#,{手工标志}=@手工标志#][1][@备注信息#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva_his.tb_evatotal_pd_exgp_fee_total_his (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, pd_fee_type, crncy_type, 
        begin_amt, curr_amt, pd_net_asset, confirm_apply, 
        remark_info, manual_flag) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_pd_fee_type, v_crncy_type, 
        v_begin_amt, v_curr_amt, v_pd_net_asset, v_confirm_apply, 
        v_remark_info, v_manual_flag) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, begin_amt=v_begin_amt,curr_amt=v_curr_amt,pd_net_asset=v_pd_net_asset,remark_info=v_remark_info,manual_flag=v_manual_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.90.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("备注信息=",v_remark_info),"#",v_mysql_message);
        else
            SET v_error_info = concat("备注信息=",v_remark_info);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_修改估值产品交易组历史费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_modiPdExgpHisFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_modiPdExgpHisFeeAmt(
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][历史_平台估值_估值汇总_估值产品交易组费用表][{当前金额}=@当前金额#,{产品净资产}=@产品净资产#,{确认金额}=@确认金额#,{备注信息}=@备注信息#,{手工标志}=1][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#  and {交易组编号}=@交易组编号# and {产品费用类型}=@产品费用类型# and {本币币种}=@本币币种#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva_his.tb_evatotal_pd_exgp_fee_total_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=v_curr_amt,pd_net_asset=v_pd_net_asset,confirm_apply=v_confirm_apply,remark_info=v_remark_info,manual_flag=1 where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no  and exch_group_no=v_exch_group_no and pd_fee_type=v_pd_fee_type and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.91.2";
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
use db_eva;;

# 原子_平台估值_估值汇总_删除估值产品交易组历史费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_delPdExgpHisFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_delPdExgpHisFeeAmt(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [删除表记录][历史_平台估值_估值汇总_估值产品交易组费用表][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {产品费用类型}=@产品费用类型# and {本币币种}=@本币币种#][3][@产品编号#] */
    delete from db_eva_his.tb_evatotal_pd_exgp_fee_total_his 
        where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and pd_fee_type=v_pd_fee_type and crncy_type=v_crncy_type;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.92.3";
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
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品交易组历史费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdExgpHisFeeAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdExgpHisFeeAmt(
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_pd_fee_type = p_pd_fee_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_平台估值_估值汇总_估值产品交易组费用表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and {初始化日期}=@估值日期# and (@产品费用类型# =0 or {产品费用类型}=@产品费用类型#) and (@本币币种# =0 or {本币币种}=@本币币种#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, pd_fee_type, 
        crncy_type, begin_amt, curr_amt, pd_net_asset, 
        confirm_apply, remark_info, manual_flag from db_eva_his.tb_evatotal_pd_exgp_fee_total_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and init_date=v_evalu_date and (v_pd_fee_type =0 or pd_fee_type=v_pd_fee_type) and (v_crncy_type =0 or crncy_type=v_crncy_type);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, pd_fee_type, 
        crncy_type, begin_amt, curr_amt, pd_net_asset, 
        confirm_apply, remark_info, manual_flag from db_eva_his.tb_evatotal_pd_exgp_fee_total_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and init_date=v_evalu_date and (v_pd_fee_type =0 or pd_fee_type=v_pd_fee_type) and (v_crncy_type =0 or crncy_type=v_crncy_type) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_新增估值产品交易组历史利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_addPdExgpHisInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_addPdExgpHisInterestAmt(
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
    declare v_init_date int;
    declare v_confirm_apply decimal(18,4);
    declare v_manual_flag int;
    declare v_pd_rate_type int;
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_confirm_apply = 0;
    SET v_manual_flag = 0;
    SET v_pd_rate_type = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @初始化日期#=@估值日期#; */
    set v_init_date=v_evalu_date;

    /* set @确认金额#=0; */
    set v_confirm_apply=0;

    /* set @手工标志#=1; */
    set v_manual_flag=1;

    /* set @产品利率类型#=0; */
    set v_pd_rate_type=0;

    /* [插入重复更新][历史_平台估值_估值汇总_估值产品交易组利息表][字段][字段变量][{期初金额}=@期初金额#,{当前金额}=@当前金额#,{利息积数}=@利息积数#,{备注信息}=@备注信息#,{手工标志}=@手工标志#][1][@备注信息#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva_his.tb_evatotal_pd_exgp_interest_total_his (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, pd_rate_type, asset_acco, exch_group_no, 
        crncy_type, begin_amt, curr_amt, intrst_base_amt, 
        confirm_apply, remark_info, manual_flag) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_pd_rate_type, v_asset_acco, v_exch_group_no, 
        v_crncy_type, v_begin_amt, v_curr_amt, v_intrst_base_amt, 
        v_confirm_apply, v_remark_info, v_manual_flag) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, begin_amt=v_begin_amt,curr_amt=v_curr_amt,intrst_base_amt=v_intrst_base_amt,remark_info=v_remark_info,manual_flag=v_manual_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.94.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("备注信息=",v_remark_info),"#",v_mysql_message);
        else
            SET v_error_info = concat("备注信息=",v_remark_info);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_修改估值产品交易组历史利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_modiPdExgpHisInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_modiPdExgpHisInterestAmt(
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][历史_平台估值_估值汇总_估值产品交易组利息表][{当前金额}=@当前金额#,{利息积数}=@利息积数#,{确认金额}=@确认金额#,{备注信息}=@备注信息#,{手工标志}=1][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户}=@资产账户# and {本币币种}=@本币币种#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva_his.tb_evatotal_pd_exgp_interest_total_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=v_curr_amt,intrst_base_amt=v_intrst_base_amt,confirm_apply=v_confirm_apply,remark_info=v_remark_info,manual_flag=1 where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco=v_asset_acco and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.95.2";
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
use db_eva;;

# 原子_平台估值_估值汇总_删除估值产品交易组历史利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_delPdExgpHisInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_delPdExgpHisInterestAmt(
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][历史_平台估值_估值汇总_估值产品交易组利息表][{初始化日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户}=@资产账户# and {本币币种}=@本币币种#][3][@产品编号#] */
    delete from db_eva_his.tb_evatotal_pd_exgp_interest_total_his 
        where init_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco=v_asset_acco and crncy_type=v_crncy_type;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.96.3";
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
use db_eva;;

# 原子_平台估值_估值汇总_查询估值产品交易组历史利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_queryPdExgpHisInterestAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_queryPdExgpHisInterestAmt(
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
    SET v_evalu_date = p_evalu_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco = p_asset_acco;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_平台估值_估值汇总_估值产品交易组利息表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and {初始化日期}=@估值日期# and (@资产账户# =" " or {资产账户}=@资产账户#) and (@本币币种# =0 or {本币币种}=@本币币种#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_rate_type, asset_acco, 
        exch_group_no, crncy_type, begin_amt, curr_amt, 
        intrst_base_amt, confirm_apply, remark_info, manual_flag from db_eva_his.tb_evatotal_pd_exgp_interest_total_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and init_date=v_evalu_date and (v_asset_acco =" " or asset_acco=v_asset_acco) and (v_crncy_type =0 or crncy_type=v_crncy_type);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_rate_type, asset_acco, 
        exch_group_no, crncy_type, begin_amt, curr_amt, 
        intrst_base_amt, confirm_apply, remark_info, manual_flag from db_eva_his.tb_evatotal_pd_exgp_interest_total_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and init_date=v_evalu_date and (v_asset_acco =" " or asset_acco=v_asset_acco) and (v_crncy_type =0 or crncy_type=v_crncy_type) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_估值汇总_新增外部估值资产信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_addPdFinaAssetInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_addPdFinaAssetInfo(
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
    IN p_eva_pd_curr_share varchar(32),
    IN p_eva_nav_asset varchar(32),
    IN p_eva_unit_nav varchar(32),
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
    declare v_eva_pd_curr_share varchar(32);
    declare v_eva_nav_asset varchar(32);
    declare v_eva_unit_nav varchar(32);
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
    SET v_eva_pd_curr_share = p_eva_pd_curr_share;
    SET v_eva_nav_asset = p_eva_nav_asset;
    SET v_eva_unit_nav = p_eva_unit_nav;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

             /* if @估值表产品当前份额# =" " then */
             if v_eva_pd_curr_share =" " then

               /* [获取表记录变量语句][平台估值_估值汇总_估值产品估值表资产项目表][{估值表产品当前份额}][@估值表产品当前份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期#] */
               select eva_pd_curr_share into v_eva_pd_curr_share from db_eva.tb_evatotal_pd_fina_asset_info where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date limit 1;

             end if;

             /* if @估值表净资产# =" " then */
             if v_eva_nav_asset =" " then

               /* [获取表记录变量语句][平台估值_估值汇总_估值产品估值表资产项目表][{估值表净资产}][@估值表净资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期#] */
               select eva_nav_asset into v_eva_nav_asset from db_eva.tb_evatotal_pd_fina_asset_info where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date limit 1;

             end if;

             /* if @估值表单位净值# =" " then */
             if v_eva_unit_nav =" " then

               /* [获取表记录变量语句][平台估值_估值汇总_估值产品估值表资产项目表][{估值表单位净值}][@估值表单位净值#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期#] */
               select eva_unit_nav into v_eva_unit_nav from db_eva.tb_evatotal_pd_fina_asset_info where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date limit 1;

             end if;

    /* [插入重复更新][平台估值_估值汇总_估值产品估值表资产项目表][字段][字段变量][{估值表产品当前份额}=@估值表产品当前份额#,{估值表净资产}=@估值表净资产#,{估值表单位净值}=@估值表单位净值#][1][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evatotal_pd_fina_asset_info (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, eva_pd_curr_share, eva_nav_asset, eva_unit_nav) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_eva_pd_curr_share, v_eva_nav_asset, v_eva_unit_nav) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, eva_pd_curr_share=v_eva_pd_curr_share,eva_nav_asset=v_eva_nav_asset,eva_unit_nav=v_eva_unit_nav;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.98.1";
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
use db_eva;;

# 原子_平台估值_估值汇总_估值系统数据归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_dataToHis;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_dataToHis(
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
    declare v_co_no int;
    declare v_occur_share decimal(18,2);
    declare v_pd_no int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_occur_share = 0;
    SET v_pd_no = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;
    #set @初始化日期#=date_format(curdate(),'%Y%m%d');

    /* [数据归历史][平台估值_估值汇总_估值产品资产信息表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{产品当前份额},{总资产},{净资产},{现金余额},{账户余额},{股票市值},{基金资产},{债券资产},{期货资产},{期权资产},{其他资产},{累计应收额},{累计应付额},{申购应收金额},{赎回应付金额},{单位净值},{累计派现金额},{累计单位净值},{备注信息}][{初始化日期}=@初始化日期#][302][@初始化日期#,@机构编号#] */
    insert into db_eva_his.tb_evatotal_product_asset_info_his (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,pd_curr_share,total_asset,nav_asset,cash_bala,acco_cash,stock_market_value,fund_asset,bond_asset,futu_asset,option_asset,other_asset,accumulative_receivable,accumulative_payable,apply_amt,redemp_amt,unit_nav,total_cash_divide,total_unit_nav,remark_info) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,pd_curr_share,total_asset,nav_asset,cash_bala,acco_cash,stock_market_value,fund_asset,bond_asset,futu_asset,option_asset,other_asset,accumulative_receivable,accumulative_payable,apply_amt,redemp_amt,unit_nav,total_cash_divide,total_unit_nav,remark_info 
        from db_eva.tb_evatotal_product_asset_info 
        where init_date=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][平台估值_估值汇总_估值产品资产信息表][{初始化日期}=@初始化日期#][3][@初始化日期#] */
    delete from db_eva.tb_evatotal_product_asset_info 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.101.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][平台估值_估值汇总_估值产品交易组资产信息表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{交易组编号},{产品当前份额},{总资产},{净资产},{现金余额},{账户余额},{股票市值},{基金资产},{债券资产},{期货资产},{期权资产},{其他资产},{累计应收额},{累计应付额},{申购应收金额},{赎回应付金额},{单位净值},{累计派现金额},{累计单位净值},{备注信息}][{初始化日期}=@初始化日期#][302][@初始化日期#,@机构编号#] */
    insert into db_eva_his.tb_evatotal_product_exgp_asset_info_his (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_group_no,pd_curr_share,total_asset,nav_asset,cash_bala,acco_cash,stock_market_value,fund_asset,bond_asset,futu_asset,option_asset,other_asset,accumulative_receivable,accumulative_payable,apply_amt,redemp_amt,unit_nav,total_cash_divide,total_unit_nav,remark_info) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_group_no,pd_curr_share,total_asset,nav_asset,cash_bala,acco_cash,stock_market_value,fund_asset,bond_asset,futu_asset,option_asset,other_asset,accumulative_receivable,accumulative_payable,apply_amt,redemp_amt,unit_nav,total_cash_divide,total_unit_nav,remark_info 
        from db_eva.tb_evatotal_product_exgp_asset_info 
        where init_date=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][平台估值_估值汇总_估值产品交易组资产信息表][{初始化日期}=@初始化日期#][3][@初始化日期#] */
    delete from db_eva.tb_evatotal_product_exgp_asset_info 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.101.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][平台估值_估值汇总_估值产品费用表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{产品费用类型},{本币币种},{期初金额},{当前金额},{产品净资产},{确认金额},{备注信息},{手工标志}][{初始化日期}=@初始化日期#][302][@初始化日期#] */
    insert into db_eva_his.tb_evatotal_pd_fee_total_his (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,pd_fee_type,crncy_type,begin_amt,curr_amt,pd_net_asset,confirm_apply,remark_info,manual_flag) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,pd_fee_type,crncy_type,begin_amt,curr_amt,pd_net_asset,confirm_apply,remark_info,manual_flag 
        from db_eva.tb_evatotal_pd_fee_total 
        where init_date=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][平台估值_估值汇总_估值产品交易组费用表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{交易组编号},{产品费用类型},{本币币种},{期初金额},{当前金额},{产品净资产},{确认金额},{备注信息},{手工标志}][{初始化日期}=@初始化日期#][302][@初始化日期#] */
    insert into db_eva_his.tb_evatotal_pd_exgp_fee_total_his (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_group_no,pd_fee_type,crncy_type,begin_amt,curr_amt,pd_net_asset,confirm_apply,remark_info,manual_flag) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_group_no,pd_fee_type,crncy_type,begin_amt,curr_amt,pd_net_asset,confirm_apply,remark_info,manual_flag 
        from db_eva.tb_evatotal_pd_exgp_fee_total 
        where init_date=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][平台估值_估值汇总_估值产品利息表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{产品利率类型},{资产账户},{本币币种},{期初金额},{当前金额},{利息积数},{确认金额},{备注信息},{手工标志}][{初始化日期}=@初始化日期#][302][@初始化日期#] */
    insert into db_eva_his.tb_evatotal_pd_interest_total_his (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,pd_rate_type,asset_acco,crncy_type,begin_amt,curr_amt,intrst_base_amt,confirm_apply,remark_info,manual_flag) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,pd_rate_type,asset_acco,crncy_type,begin_amt,curr_amt,intrst_base_amt,confirm_apply,remark_info,manual_flag 
        from db_eva.tb_evatotal_pd_interest_total 
        where init_date=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][平台估值_估值汇总_估值产品交易组利息表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{交易组编号},{产品利率类型},{资产账户},{本币币种},{期初金额},{当前金额},{利息积数},{确认金额},{备注信息},{手工标志}][{初始化日期}=@初始化日期#][302][@初始化日期#] */
    insert into db_eva_his.tb_evatotal_pd_exgp_interest_total_his (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_group_no,pd_rate_type,asset_acco,crncy_type,begin_amt,curr_amt,intrst_base_amt,confirm_apply,remark_info,manual_flag) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_group_no,pd_rate_type,asset_acco,crncy_type,begin_amt,curr_amt,intrst_base_amt,confirm_apply,remark_info,manual_flag 
        from db_eva.tb_evatotal_pd_exgp_interest_total 
        where init_date=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][平台估值_业务数据_估值产品账户资金表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{产品账户类型},{资产账户},{本币币种},{期初金额},{当前金额},{冻结金额},{解冻金额},{利息积数},{预计利息},{估值数据来源}][{初始化日期}=@初始化日期#][302][@初始化日期#] */
    insert into db_eva_his.tb_evadata_pd_acco_capit_his (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,pd_acco_type,asset_acco,crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,intrst_base_amt,intrst_cacl_amt,evalu_data_source) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,pd_acco_type,asset_acco,crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,intrst_base_amt,intrst_cacl_amt,evalu_data_source 
        from db_eva.tb_evadata_pd_acco_capit 
        where init_date=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][平台估值_业务数据_估值产品交易组账户资金表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{交易组编号},{产品账户类型},{资产账户},{本币币种},{期初金额},{当前金额},{冻结金额},{解冻金额},{利息积数},{预计利息}][{初始化日期}=@初始化日期#][302][@初始化日期#] */
    insert into db_eva_his.tb_evadata_pd_exgp_acco_capit_his (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_group_no,pd_acco_type,asset_acco,crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,intrst_base_amt,intrst_cacl_amt) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_group_no,pd_acco_type,asset_acco,crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,intrst_base_amt,intrst_cacl_amt 
        from db_eva.tb_evadata_pd_exgp_acco_capit 
        where init_date=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][平台估值_业务数据_估值产品证券持仓表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户},{市场编号},{股东代码},{证券类型},{证券代码},{证券名称},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{当前成本金额},{最新价},{汇率},{实现盈亏},{利息成本金额},{利息收益},{替代数量},{估值数据来源}][{初始化日期}=@初始化日期#][302][@初始化日期#] */
    insert into db_eva_his.tb_evadata_pd_secu_posi_his (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco,exch_no,stock_acco,stock_type,stock_code,stock_name,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,curr_cost_amt,last_price,exch_rate,realize_pandl,intrst_cost_amt,intrst_pandl,repl_qty,evalu_data_source) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco,exch_no,stock_acco,stock_type,stock_code,stock_name,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,curr_cost_amt,last_price,exch_rate,realize_pandl,intrst_cost_amt,intrst_pandl,repl_qty,evalu_data_source 
        from db_eva.tb_evadata_pd_secu_posi 
        where init_date=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][平台估值_业务数据_估值产品交易组证券持仓表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户},{市场编号},{股东代码},{证券类型},{证券代码},{证券名称},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{当前成本金额},{最新价},{汇率},{实现盈亏},{利息成本金额},{利息收益},{替代数量}][{初始化日期}=@初始化日期#][302][@初始化日期#] */
    insert into db_eva_his.tb_evadata_pd_exgp_secu_posi_his (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_group_no,asset_acco,exch_no,stock_acco,stock_type,stock_code,stock_name,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,curr_cost_amt,last_price,exch_rate,realize_pandl,intrst_cost_amt,intrst_pandl,repl_qty) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_group_no,asset_acco,exch_no,stock_acco,stock_type,stock_code,stock_name,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,curr_cost_amt,last_price,exch_rate,realize_pandl,intrst_cost_amt,intrst_pandl,repl_qty 
        from db_eva.tb_evadata_pd_exgp_secu_posi 
        where init_date=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][平台估值_业务数据_估值产品期货持仓表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户编号},{市场编号},{交易编码编号},{合约代码编号},{合约类型},{多空类型},{套保标志},{组合编码},{合约乘数},{期初数量},{当前数量},{冻结数量},{解冻数量},{昨结算价},{结算价},{应收保证金},{开仓金额},{实现盈亏},{平仓盈亏},{今仓标志},{估值数据来源}][{初始化日期}=@初始化日期#][302][@初始化日期#] */
    insert into db_eva_his.tb_evadata_pd_fupo_posi_his (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco_no,exch_no,futu_acco_no,contrc_code_no,contrc_type,lngsht_type,hedge_type,comb_code,contrc_unit,begin_qty,curr_qty,frozen_qty,unfroz_qty,pre_settle_price,sett_price,rece_margin,open_amount,realize_pandl,close_pandl,today_posi_flag,evalu_data_source) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco_no,exch_no,futu_acco_no,contrc_code_no,contrc_type,lngsht_type,hedge_type,comb_code,contrc_unit,begin_qty,curr_qty,frozen_qty,unfroz_qty,pre_settle_price,sett_price,rece_margin,open_amount,realize_pandl,close_pandl,today_posi_flag,evalu_data_source 
        from db_eva.tb_evadata_pd_fupo_posi 
        where init_date=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][平台估值_业务数据_估值产品成交表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{订单编号},{订单日期},{订单时间},{申报编号},{资产账户},{股东代码},{市场编号},{投资类型},{证券类型},{证券代码},{证券名称},{本币币种},{成交价格},{订单方向},{订单价格},{订单数量},{成交日期},{成交时间},{成交编号},{成交数量},{成交金额},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{债券计提利息},{净价标志}][{初始化日期}=@初始化日期#][302][@初始化日期#] */
    insert into db_eva_his.tb_evadata_pd_execution_his (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,order_no,order_date,order_time,report_no,asset_acco,stock_acco,exch_no,invest_type,stock_type,stock_code,stock_name,crncy_type,strike_price,order_dir,order_price,order_qty,strike_date,strike_time,strike_no,strike_qty,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,order_no,order_date,order_time,report_no,asset_acco,stock_acco,exch_no,invest_type,stock_type,stock_code,stock_name,crncy_type,strike_price,order_dir,order_price,order_qty,strike_date,strike_time,strike_no,strike_qty,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag 
        from db_eva.tb_evadata_pd_execution 
        where init_date=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][平台估值_业务数据_估值产品成交表][{初始化日期}=@初始化日期#][3][@初始化日期#] */
    delete from db_eva.tb_evadata_pd_execution 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.3.101.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #获取当日份额变动

    /* [获取表记录变量语句][平台估值_基础参数_估值产品份额流水表][ifnull(sum(case {变动方向} when 《变动方向-增加》 then {变动份额} else -1*{变动份额} end ),0)][@变动份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期#][13030502][@产品编号#] */
    select ifnull(sum(case occur_dir when 1 then occur_share else -1*occur_share end ),0) into v_occur_share from db_eva.tb_evabasic_product_share_jour where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date limit 1;

    #初始化估值产品资产信息表份额

    /* [更新表记录][平台估值_基础参数_估值产品基本信息表][{产品当前份额} = {产品当前份额}+@变动份额#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evabasic_product_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_curr_share = pd_curr_share+v_occur_share where co_no=v_co_no and pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.101.2";
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
use db_eva;;

# 原子_平台估值_估值汇总_估值系统初始化
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evatotal_systemInit;;
DELIMITER ;;
CREATE PROCEDURE pra_evatotal_systemInit(
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
    declare v_co_no int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #set @初始化日期#=date_format(curdate(),'%Y%m%d');

    /* set @机构编号#=@操作员机构编号#; */
    set v_co_no=v_opor_co_no;
    #更新产品账户资金表

    /* [更新表记录][平台估值_业务数据_估值产品账户资金表][{期初金额} = {当前金额},{初始化日期}=@初始化日期#][1=1][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evadata_pd_acco_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt = curr_amt,init_date=v_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.102.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #更新产品交易组账户资金表

    /* [更新表记录][平台估值_业务数据_估值产品交易组账户资金表][{期初金额} = {当前金额},{初始化日期}=@初始化日期#][1=1][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evadata_pd_exgp_acco_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt = curr_amt,init_date=v_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.102.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #更新产品证券持仓表期初数量

    /* [更新表记录][平台估值_业务数据_估值产品证券持仓表][{期初数量} = {当前数量},{初始化日期}=@初始化日期#][1=1][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evadata_pd_secu_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty = curr_qty,init_date=v_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.102.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #更新产品交易组持仓表期初数量

    /* [更新表记录][平台估值_业务数据_估值产品交易组证券持仓表][{期初数量} = {当前数量},{初始化日期}=@初始化日期#][1=1][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evadata_pd_exgp_secu_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty = curr_qty,init_date=v_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.102.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #更新产品期货持仓表期初数量

    /* [更新表记录][平台估值_业务数据_估值产品期货持仓表][{期初数量} = {当前数量},{初始化日期}=@初始化日期#][1=1][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evadata_pd_fupo_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty = curr_qty,init_date=v_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.102.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #更新产品费用

    /* [更新表记录][平台估值_估值汇总_估值产品费用表][{期初金额} = {当前金额}-{确认金额},{初始化日期}=@初始化日期#,{确认金额}=0,{手工标志}=0][1=1][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evatotal_pd_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt = curr_amt-confirm_apply,init_date=v_init_date,confirm_apply=0,manual_flag=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.102.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #更新产品交易组费用

    /* [更新表记录][平台估值_估值汇总_估值产品交易组费用表][{期初金额} = {当前金额}-{确认金额},{初始化日期}=@初始化日期#,{确认金额}=0,{手工标志}=0][1=1][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evatotal_pd_exgp_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt = curr_amt-confirm_apply,init_date=v_init_date,confirm_apply=0,manual_flag=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.102.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #更新产品利息

    /* [更新表记录][平台估值_估值汇总_估值产品利息表][{期初金额} = {当前金额}-{确认金额},{初始化日期}=@初始化日期#,{确认金额}=0,{手工标志}=0][1=1][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evatotal_pd_interest_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt = curr_amt-confirm_apply,init_date=v_init_date,confirm_apply=0,manual_flag=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.102.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #更新产品交易组利息

    /* [更新表记录][平台估值_估值汇总_估值产品交易组利息表][{期初金额} = {当前金额}-{确认金额},{初始化日期}=@初始化日期#,{确认金额}=0,{手工标志}=0][1=1][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evatotal_pd_exgp_interest_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt = curr_amt-confirm_apply,init_date=v_init_date,confirm_apply=0,manual_flag=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.102.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][平台估值_基础参数_估值产品基本信息表][{产品期初份额} = {产品当前份额}][1=1][2][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evabasic_product_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_begin_share = pd_curr_share where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.3.102.2";
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


