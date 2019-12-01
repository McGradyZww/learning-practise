DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_同步估值产品证券账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_SyncPdAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_SyncPdAccoCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_target_pd_code varchar(8),
    IN p_sync_total_rece_payab int,
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
    declare v_target_pd_code varchar(8);
    declare v_sync_total_rece_payab int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_acco_type int;
    declare v_total_payab_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_init_date int;
    declare v_exch_rate decimal(18,12);
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
    SET v_target_pd_code = p_target_pd_code;
    SET v_sync_total_rece_payab = p_sync_total_rece_payab;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_acco_type = 0;
    SET v_total_payab_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_rate = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set  @产品账户类型#=《产品账户类型-证券账户》; */
    set  v_pd_acco_type=2;

    /* set @累计应付金额#=0; */
    set v_total_payab_amt=0;

    /* set @累计应收金额#=0; */
    set v_total_rece_amt=0;

    /* [删除表记录][平台估值_业务数据_估值产品账户资金表][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {产品账户类型} =《产品账户类型-证券账户》 and {估值数据来源}=《估值数据来源-资管数据同步》][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evadata_pd_acco_capit 
        where co_no = v_co_no and pd_no = v_pd_no and pd_acco_type =2 and evalu_data_source=21;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.1.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #从资管数据获取

    /* insert into ~平台估值_业务数据_估值产品账户资金表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{产品账户类型},{资产账户},{本币币种},{期初金额},{当前金额},{冻结金额},{解冻金额},{利息积数},{预计利息},{估值数据来源}) select {创建日期},{创建时间},{更新日期},{更新时间},{更新次数},@初始化日期#,@机构编号#,@产品编号#,@产品账户类型#,{资产账户编号},{本币币种},sum({期初金额}),sum（{当前金额}+{待交收金额}+{金额核对差额}),sum({冻结金额}),sum({解冻金额}),sum({当前金额}),0,《估值数据来源-资管数据同步》 from db_dc.tb_pdseca_asac_capit where {机构编号}=@机构编号# and {产品编号}=@产品编号#  and @目标产品编码#=2 group by {资产账户编号},{本币币种}; */
    insert into db_eva.tb_evadata_pd_acco_capit(create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,pd_acco_type,asset_acco,crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,intrst_base_amt,intrst_cacl_amt,evalu_data_source) select create_date,create_time,update_date,update_time,update_times,v_init_date,v_co_no,v_pd_no,v_pd_acco_type,asset_acco_no,crncy_type,sum(begin_amt),sum(curr_amt+pre_settle_amt+amt_check_diff),sum(frozen_amt),sum(unfroz_amt),sum(curr_amt),0,21 from db_dc.tb_pdseca_asac_capit where co_no=v_co_no and pd_no=v_pd_no  and v_target_pd_code=2 group by asset_acco_no,crncy_type;

    /* update ~平台估值_业务数据_估值产品账户资金表^ a,db_dc.tb_tdseac_asac_busi_capit b set a.{当前金额}=a.{当前金额}-b.{成交占用金额}+b.{成交释放金额} */
    update db_eva.tb_evadata_pd_acco_capit a,db_dc.tb_tdseac_asac_busi_capit b set a.curr_amt=a.curr_amt-b.strike_capt_amt+b.strike_releas_amt

    /* where a.{机构编号}=b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{资产账户}= concat(b.{资产账户编号}) and a.{本币币种} =b.{交易币种} and a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# ; */
    where a.co_no=b.co_no and a.pd_no=b.pd_no and a.asset_acco= concat(b.asset_acco_no) and a.crncy_type =b.exch_crncy_type and a.co_no=v_co_no and a.pd_no=v_pd_no ;

    /* select ({买入参考汇率}+{卖出参考汇率})/2 into @汇率# from db_dc.tb_base_hk_exch_rate where {初始化日期}=@初始化日期# limit 1; */
    select (buy_ref_rate+sell_ref_rate)/2 into v_exch_rate from db_dc.tb_base_hk_exch_rate where init_date=v_init_date limit 1;

    /* insert into ~平台估值_业务数据_估值产品账户资金表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{产品账户类型},{资产账户},{本币币种},{期初金额},{当前金额},{冻结金额},{解冻金额},{利息积数},{预计利息},{估值数据来源}) select {创建日期},{创建时间},{更新日期},{更新时间},{更新次数},@初始化日期#,@机构编号#,@产品编号#,@产品账户类型#,{资产账户编号},{交易币种},0,({成交释放金额}-{成交占用金额})*@汇率#,0,0,({成交释放金额}-{成交占用金额}),@汇率#,《估值数据来源-资管数据同步》 from db_dc.tb_tdseac_asac_busi_capit where {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易币种}=《本币币种-港币》 and {成交释放金额}-{成交占用金额}<>0  and @目标产品编码#=2; */
    insert into db_eva.tb_evadata_pd_acco_capit(create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,pd_acco_type,asset_acco,crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,intrst_base_amt,intrst_cacl_amt,evalu_data_source) select create_date,create_time,update_date,update_time,update_times,v_init_date,v_co_no,v_pd_no,v_pd_acco_type,asset_acco_no,exch_crncy_type,0,(strike_releas_amt-strike_capt_amt)*v_exch_rate,0,0,(strike_releas_amt-strike_capt_amt),v_exch_rate,21 from db_dc.tb_tdseac_asac_busi_capit where co_no=v_co_no and pd_no=v_pd_no and exch_crncy_type="HKD" and strike_releas_amt-strike_capt_amt<>0  and v_target_pd_code=2;
    #从报盘数据获取

    /* insert into ~平台估值_业务数据_估值产品账户资金表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{产品账户类型},{资产账户},{本币币种},{期初金额},{当前金额},{冻结金额},{解冻金额},{利息积数},{预计利息},{估值数据来源}) select {创建日期},{创建时间},{更新日期},{更新时间},{更新次数},@初始化日期#,@机构编号#,@产品编号#,@产品账户类型#,{资产账户编号},{本币币种},0,{外部可用金额},0,0,{外部可用金额},0,《估值数据来源-资管数据同步》 from db_dc.tb_pdseca_out_asac_capit where {机构编号}=@机构编号# and {产品编号}=@产品编号#  and @目标产品编码#=1; */
    insert into db_eva.tb_evadata_pd_acco_capit(create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,pd_acco_type,asset_acco,crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,intrst_base_amt,intrst_cacl_amt,evalu_data_source) select create_date,create_time,update_date,update_time,update_times,v_init_date,v_co_no,v_pd_no,v_pd_acco_type,asset_acco_no,crncy_type,0,out_enable_amt,0,0,out_enable_amt,0,21 from db_dc.tb_pdseca_out_asac_capit where co_no=v_co_no and pd_no=v_pd_no  and v_target_pd_code=1;

    /* set  @产品账户类型#=《产品账户类型-期货账户》; */
    set  v_pd_acco_type=3;

    /* [删除表记录][平台估值_业务数据_估值产品账户资金表][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {产品账户类型} =《产品账户类型-期货账户》 and {估值数据来源}=《估值数据来源-资管数据同步》][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evadata_pd_acco_capit 
        where co_no = v_co_no and pd_no = v_pd_no and pd_acco_type =3 and evalu_data_source=21;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.1.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #从资管数据获取

    /* insert into ~平台估值_业务数据_估值产品账户资金表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{产品账户类型},{资产账户},{本币币种},{期初金额},{当前金额},{冻结金额},{解冻金额},{利息积数},{预计利息},{估值数据来源}) select {创建日期},{创建时间},{更新日期},{更新时间},{更新次数},@初始化日期#,@机构编号#,@产品编号#,@产品账户类型#,{资产账户编号},{本币币种},sum({期初金额}),sum（{当前金额}),sum({冻结金额}),sum({解冻金额}),sum({当前金额}-{占用保证金}),0,《估值数据来源-资管数据同步》 from db_dc.tb_pdfuca_asac_capit where {机构编号}=@机构编号# and {产品编号}=@产品编号#  and @目标产品编码#=2 group by {资产账户编号},{本币币种}; */
    insert into db_eva.tb_evadata_pd_acco_capit(create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,pd_acco_type,asset_acco,crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,intrst_base_amt,intrst_cacl_amt,evalu_data_source) select create_date,create_time,update_date,update_time,update_times,v_init_date,v_co_no,v_pd_no,v_pd_acco_type,asset_acco_no,crncy_type,sum(begin_amt),sum(curr_amt),sum(frozen_amt),sum(unfroz_amt),sum(curr_amt-capt_margin),0,21 from db_dc.tb_pdfuca_asac_capit where co_no=v_co_no and pd_no=v_pd_no  and v_target_pd_code=2 group by asset_acco_no,crncy_type;

    /* update ~平台估值_业务数据_估值产品账户资金表^ a,db_dc.tb_tdfuac_asac_busi_capit b set a.{当前金额}=a.{当前金额}+b.{平仓盈亏}-b.{成交费用} */
    update db_eva.tb_evadata_pd_acco_capit a,db_dc.tb_tdfuac_asac_busi_capit b set a.curr_amt=a.curr_amt+b.close_pandl-b.strike_fee

    /* where a.{机构编号}=b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{资产账户}= concat(b.{资产账户编号}) and a.{本币币种} =b.{交易币种} and a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# ; */
    where a.co_no=b.co_no and a.pd_no=b.pd_no and a.asset_acco= concat(b.asset_acco_no) and a.crncy_type =b.exch_crncy_type and a.co_no=v_co_no and a.pd_no=v_pd_no ;

    /* if @同步累计应收应付# =1 then */
    if v_sync_total_rece_payab =1 then

         /* select {累计应收金额},{累计应付金额} into  @累计应收金额#,@累计应付金额#  from db_dc.tb_pdseca_asac_capit where {机构编号}=@机构编号# and {产品编号}=@产品编号# limit 1; */
         select total_rece_amt,total_payab_amt into  v_total_rece_amt,v_total_payab_amt  from db_dc.tb_pdseca_asac_capit where co_no=v_co_no and pd_no=v_pd_no limit 1;

        /* [更新表记录][平台估值_估值汇总_估值产品费用表][{当前金额}=@累计应付金额#,{备注信息}="外部数据",{手工标志}=1][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品费用类型}=《产品费用类型-基金管理费》][2][@产品编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_eva.tb_evatotal_pd_fee_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=v_total_payab_amt,remark_info="外部数据",manual_flag=1 where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and pd_fee_type=1;
        if v_error_code = "1" then
                    
            SET v_error_code = "evaA.2.1.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no);
            end if;
            leave label_pro;
        end if;


        /* [更新表记录][平台估值_估值汇总_估值产品利息表][{当前金额}=@累计应收金额#,{备注信息}="外部数据",{手工标志}=1][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户}="银行存款"][2][@产品编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_eva.tb_evatotal_pd_interest_total set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=v_total_rece_amt,remark_info="外部数据",manual_flag=1 where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and asset_acco="银行存款";
        if v_error_code = "1" then
                    
            SET v_error_code = "evaA.2.1.2";
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

# 原子_平台估值_业务数据_同步估值产品证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_SyncPdSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_SyncPdSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_target_pd_code varchar(8),
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
    declare v_target_pd_code varchar(8);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_target_pd_code = p_target_pd_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_业务数据_估值产品证券持仓表][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {估值数据来源} in (《估值数据来源-资管数据同步》,《估值数据来源-外部成交记录》)][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evadata_pd_secu_posi 
        where co_no = v_co_no and pd_no = v_pd_no and evalu_data_source in (21,3);
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.2.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #从资管数据获取

    /* insert into ~平台估值_业务数据_估值产品证券持仓表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户},{市场编号},{股东代码},{证券类型},{证券代码},{证券名称},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{当前成本金额},{最新价},{汇率},{实现盈亏},{利息成本金额},{利息收益},{替代数量},{估值数据来源}) select a.{创建日期},a.{创建时间},a.{更新日期},a.{更新时间},a.{更新次数},@初始化日期#,@机构编号#,@产品编号#,{资产账户编号},a.{市场编号},{股东代码编号},b.{证券类型},b.{证券代码},b.{证券名称},0,sum({期初数量}),sum({当前数量}+{待交收数量}+{持仓核对差额}),sum({冻结数量}),sum({解冻数量}),sum({成本金额}),0,1,sum({实现盈亏}),sum({利息成本金额}),sum({利息收益}),0,《估值数据来源-资管数据同步》 from db_dc.tb_pdsepo_asac_posi  a ,db_dc.tb_basesedt_stock_code_info b  where a.{市场编号}=b.{市场编号} and a.{证券代码编号} =b.{证券代码编号} and a.{机构编号}=@机构编号# and  a.{产品编号}=@产品编号# and @目标产品编码#=2 group by {资产账户编号},a.{市场编号},{股东代码编号},a.{证券代码编号}; */
    insert into db_eva.tb_evadata_pd_secu_posi(create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco,exch_no,stock_acco,stock_type,stock_code,stock_name,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,curr_cost_amt,last_price,exch_rate,realize_pandl,intrst_cost_amt,intrst_pandl,repl_qty,evalu_data_source) select a.create_date,a.create_time,a.update_date,a.update_time,a.update_times,v_init_date,v_co_no,v_pd_no,asset_acco_no,a.exch_no,stock_acco_no,b.stock_type,b.stock_code,b.stock_name,0,sum(begin_qty),sum(curr_qty+pre_settle_qty+posi_qty_check_diff),sum(frozen_qty),sum(unfroz_qty),sum(cost_amt),0,1,sum(realize_pandl),sum(intrst_cost_amt),sum(intrst_pandl),0,21 from db_dc.tb_pdsepo_asac_posi  a ,db_dc.tb_basesedt_stock_code_info b  where a.exch_no=b.exch_no and a.stock_code_no =b.stock_code_no and a.co_no=v_co_no and  a.pd_no=v_pd_no and v_target_pd_code=2 group by asset_acco_no,a.exch_no,stock_acco_no,a.stock_code_no;

    /* update ~平台估值_业务数据_估值产品证券持仓表^ a,db_dc.tb_tdseac_asac_busi_posi b,db_dc.tb_basesedt_stock_code_info c */
    update db_eva.tb_evadata_pd_secu_posi a,db_dc.tb_tdseac_asac_busi_posi b,db_dc.tb_basesedt_stock_code_info c

    /* set a.{当前数量}=a.{当前数量}-b.{成交占用数量}+b.{成交释放数量},a.{当前成本金额}=a.{当前成本金额}+b.{成本金额} */
    set a.curr_qty=a.curr_qty-b.strike_capt_qty+b.strike_releas_qty,a.curr_cost_amt=a.curr_cost_amt+b.cost_amt

    /* where a.{机构编号}=b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{资产账户}= concat(b.{资产账户编号}) and a.{证券代码} =c.{证券代码} and b.{证券代码编号}=c.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号}=c.{市场编号} and a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号#; */
    where a.co_no=b.co_no and a.pd_no=b.pd_no and a.asset_acco= concat(b.asset_acco_no) and a.stock_code =c.stock_code and b.stock_code_no=c.stock_code_no and a.exch_no=b.exch_no and b.exch_no=c.exch_no and a.co_no=v_co_no and a.pd_no=v_pd_no;
    #买入新增

    /* insert into ~平台估值_业务数据_估值产品证券持仓表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户},{市场编号},{股东代码},{证券类型},{证券代码},{证券名称},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{当前成本金额},{最新价},{汇率},{实现盈亏},{利息成本金额},{利息收益},{替代数量},{估值数据来源}) select a.{创建日期},a.{创建时间},a.{更新日期},a.{更新时间},a.{更新次数},@初始化日期#,@机构编号#,@产品编号#,{资产账户编号},a.{市场编号},{股东代码编号},b.{证券类型},b.{证券代码},b.{证券名称},0,0,{成交释放数量},{冻结数量},{解冻数量},{成本金额},0,1,{实现盈亏},{利息成本金额},{利息收益},0,《估值数据来源-资管数据同步》 from db_dc.tb_tdseac_asac_busi_posi  a ,db_dc.tb_basesedt_stock_code_info b  where a.{市场编号}=b.{市场编号} and a.{证券代码编号} =b.{证券代码编号} and a.{机构编号}=@机构编号# and  a.{产品编号}=@产品编号# and (a.{资产账户编号},b.{证券代码}) not in (select {资产账户},{证券代码} from ~平台估值_业务数据_估值产品证券持仓表^ where {机构编号}=@机构编号# and {产品编号}=@产品编号#) and @目标产品编码#=2 ; */
    insert into db_eva.tb_evadata_pd_secu_posi(create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco,exch_no,stock_acco,stock_type,stock_code,stock_name,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,curr_cost_amt,last_price,exch_rate,realize_pandl,intrst_cost_amt,intrst_pandl,repl_qty,evalu_data_source) select a.create_date,a.create_time,a.update_date,a.update_time,a.update_times,v_init_date,v_co_no,v_pd_no,asset_acco_no,a.exch_no,stock_acco_no,b.stock_type,b.stock_code,b.stock_name,0,0,strike_releas_qty,frozen_qty,unfroz_qty,cost_amt,0,1,realize_pandl,intrst_cost_amt,intrst_pandl,0,21 from db_dc.tb_tdseac_asac_busi_posi  a ,db_dc.tb_basesedt_stock_code_info b  where a.exch_no=b.exch_no and a.stock_code_no =b.stock_code_no and a.co_no=v_co_no and  a.pd_no=v_pd_no and (a.asset_acco_no,b.stock_code) not in (select asset_acco,stock_code from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no) and v_target_pd_code=2 ;
    #删除当前数量为0的数据

    /* [删除表记录][平台估值_业务数据_估值产品证券持仓表][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {当前数量}=0 and {估值数据来源}=《估值数据来源-资管数据同步》][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evadata_pd_secu_posi 
        where co_no = v_co_no and pd_no = v_pd_no and curr_qty=0 and evalu_data_source=21;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.2.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #从报盘数据获取

    /* insert into ~平台估值_业务数据_估值产品证券持仓表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户},{市场编号},{股东代码},{证券类型},{证券代码},{证券名称},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{当前成本金额},{最新价},{汇率},{实现盈亏},{利息成本金额},{利息收益},{替代数量},{估值数据来源}) select a.{创建日期},a.{创建时间},a.{更新日期},a.{更新时间},a.{更新次数},@初始化日期#,@机构编号#,@产品编号#,{资产账户编号},a.{市场编号},{股东代码编号},b.{证券类型},a.{证券代码},a.{证券名称},0,0,{外部可用数量},0,0,{外部可用数量}*{外部成本价},0,1,0,0,0,0,《估值数据来源-资管数据同步》 from db_dc.tb_pdsepo_out_asac_posi  a ,db_dc.tb_basesedt_stock_code_info b  where a.{市场编号}=b.{市场编号} and a.{证券代码编号} =b.{证券代码编号} and a.{机构编号}=@机构编号# and  a.{产品编号}=@产品编号# and @目标产品编码#=1; */
    insert into db_eva.tb_evadata_pd_secu_posi(create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco,exch_no,stock_acco,stock_type,stock_code,stock_name,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,curr_cost_amt,last_price,exch_rate,realize_pandl,intrst_cost_amt,intrst_pandl,repl_qty,evalu_data_source) select a.create_date,a.create_time,a.update_date,a.update_time,a.update_times,v_init_date,v_co_no,v_pd_no,asset_acco_no,a.exch_no,stock_acco_no,b.stock_type,a.stock_code,a.stock_name,0,0,out_enable_qty,0,0,out_enable_qty*out_cost_price,0,1,0,0,0,0,21 from db_dc.tb_pdsepo_out_asac_posi  a ,db_dc.tb_basesedt_stock_code_info b  where a.exch_no=b.exch_no and a.stock_code_no =b.stock_code_no and a.co_no=v_co_no and  a.pd_no=v_pd_no and v_target_pd_code=1;
    #从成交获取回购数据上海一天回购

    /* if exists (select 1 from db_dc.tb_tdserp_strike  a where  a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码}="204001" and @目标产品编码#=1) then */
    if exists (select 1 from db_dc.tb_tdserp_strike  a where  a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code="204001" and v_target_pd_code=1) then

         /* delete from ~平台估值_业务数据_估值产品证券持仓表^ where {机构编号}=@机构编号# and {产品编号}=@产品编号# and {证券代码}="888880"; */
         delete from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no and stock_code="888880";

         /* insert into ~平台估值_业务数据_估值产品证券持仓表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户},{市场编号},{股东代码},{证券类型},{证券代码},{证券名称},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{当前成本金额},{最新价},{汇率},{实现盈亏},{利息成本金额},{利息收益},{替代数量},{估值数据来源}) select a.{创建日期},a.{创建时间},a.{更新日期},a.{更新时间},a.{更新次数},@初始化日期#,@机构编号#,@产品编号#,@产品编号#,《市场编号-上海证券交易所》,@产品编号#,《证券类型-回购标准券》,"888880","标准券",0,0,sum({成交数量}),0,0,0,0,1,0,0,0,0,《估值数据来源-资管数据同步》 from db_dc.tb_tdserp_strike  a where  a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码}="204001"  and @目标产品编码#=1; */
         insert into db_eva.tb_evadata_pd_secu_posi(create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco,exch_no,stock_acco,stock_type,stock_code,stock_name,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,curr_cost_amt,last_price,exch_rate,realize_pandl,intrst_cost_amt,intrst_pandl,repl_qty,evalu_data_source) select a.create_date,a.create_time,a.update_date,a.update_time,a.update_times,v_init_date,v_co_no,v_pd_no,v_pd_no,1,v_pd_no,27,"888880","标准券",0,0,sum(strike_qty),0,0,0,0,1,0,0,0,0,21 from db_dc.tb_tdserp_strike  a where  a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code="204001"  and v_target_pd_code=1;
    end if;
    #同步期货持仓

    /* [删除表记录][平台估值_业务数据_估值产品期货持仓表][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {估值数据来源}=《估值数据来源-资管数据同步》][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evadata_pd_fupo_posi 
        where co_no = v_co_no and pd_no = v_pd_no and evalu_data_source=21;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.2.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #从资管数据获取
    #老仓

    /* insert into ~平台估值_业务数据_估值产品期货持仓表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户编号},{市场编号},{交易编码编号},{合约代码编号},{合约类型},{多空类型},{套保标志},{组合编码},{合约乘数},{期初数量},{当前数量},{冻结数量},{解冻数量},{昨结算价},{结算价},{应收保证金},{开仓金额},{实现盈亏},{平仓盈亏},{今仓标志},{估值数据来源}) select {创建日期},{创建时间},{更新日期},{更新时间},{更新次数},@初始化日期#,{机构编号},{产品编号},{资产账户编号},{市场编号},{交易编码编号},{合约代码编号},{合约类型},{多空类型},{套保标志},{组合编码},{合约乘数},{期初数量},{当前数量},{冻结数量},{解冻数量},{昨结算价},{结算价},{应收保证金},0,0,0,《今仓标志-老仓》,《估值数据来源-资管数据同步》 from db_dc.tb_pdfupo_asac_posi where {机构编号}=@机构编号# and {产品编号}=@产品编号# and {当前数量}>0 and @目标产品编码#=2; */
    insert into db_eva.tb_evadata_pd_fupo_posi(create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco_no,exch_no,futu_acco_no,contrc_code_no,contrc_type,lngsht_type,hedge_type,comb_code,contrc_unit,begin_qty,curr_qty,frozen_qty,unfroz_qty,pre_settle_price,sett_price,rece_margin,open_amount,realize_pandl,close_pandl,today_posi_flag,evalu_data_source) select create_date,create_time,update_date,update_time,update_times,v_init_date,co_no,pd_no,asset_acco_no,exch_no,futu_acco_no,contrc_code_no,contrc_type,lngsht_type,hedge_type,comb_code,contrc_unit,begin_qty,curr_qty,frozen_qty,unfroz_qty,pre_settle_price,sett_price,rece_margin,0,0,0,2,21 from db_dc.tb_pdfupo_asac_posi where co_no=v_co_no and pd_no=v_pd_no and curr_qty>0 and v_target_pd_code=2;

    /* update ~平台估值_业务数据_估值产品期货持仓表^ a,db_dc.tb_tdfuac_asac_busi_posi b */
    update db_eva.tb_evadata_pd_fupo_posi a,db_dc.tb_tdfuac_asac_busi_posi b

    /* set a.{当前数量}=a.{当前数量}-b.{老仓成交占用数量} */
    set a.curr_qty=a.curr_qty-b.pre_strike_capt_qty

    /* where a.{机构编号}=b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{资产账户编号}= b.{资产账户编号} and  a.{市场编号}=b.{市场编号} and a.{交易编码编号}=b.{交易编码编号} and  a.{合约代码编号}=b.{合约代码编号} and a.{合约类型}=b.{合约类型} and a.{多空类型}=b.{多空类型} and a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号#; */
    where a.co_no=b.co_no and a.pd_no=b.pd_no and a.asset_acco_no= b.asset_acco_no and  a.exch_no=b.exch_no and a.futu_acco_no=b.futu_acco_no and  a.contrc_code_no=b.contrc_code_no and a.contrc_type=b.contrc_type and a.lngsht_type=b.lngsht_type and a.co_no=v_co_no and a.pd_no=v_pd_no;
    #今仓

    /* insert into ~平台估值_业务数据_估值产品期货持仓表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户编号},{市场编号},{交易编码编号},{合约代码编号},{合约类型},{多空类型},{套保标志},{组合编码},{合约乘数},{期初数量},{当前数量},{冻结数量},{解冻数量},{昨结算价},{结算价},{应收保证金},{开仓金额},{实现盈亏},{平仓盈亏},{今仓标志},{估值数据来源}) select {创建日期},{创建时间},{更新日期},{更新时间},{更新次数},@初始化日期#,{机构编号},{产品编号},{资产账户编号},{市场编号},{交易编码编号},{合约代码编号},{合约类型},{多空类型},{套保标志},{组合编码},{合约乘数},{期初数量},{成交释放数量}-{今仓成交占用数量},{冻结数量},{解冻数量},{开仓金额}/({成交释放数量}-{今仓成交占用数量})/{合约乘数},0,{应收保证金},{开仓金额},{实现盈亏},{平仓盈亏},《今仓标志-今仓》,《估值数据来源-资管数据同步》 from db_dc.tb_tdfuac_asac_busi_posi where {机构编号}=@机构编号# and {产品编号}=@产品编号# and @目标产品编码#=2 and ({成交释放数量}-{今仓成交占用数量})>0; */
    insert into db_eva.tb_evadata_pd_fupo_posi(create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco_no,exch_no,futu_acco_no,contrc_code_no,contrc_type,lngsht_type,hedge_type,comb_code,contrc_unit,begin_qty,curr_qty,frozen_qty,unfroz_qty,pre_settle_price,sett_price,rece_margin,open_amount,realize_pandl,close_pandl,today_posi_flag,evalu_data_source) select create_date,create_time,update_date,update_time,update_times,v_init_date,co_no,pd_no,asset_acco_no,exch_no,futu_acco_no,contrc_code_no,contrc_type,lngsht_type,hedge_type,comb_code,contrc_unit,begin_qty,strike_releas_qty-today_strike_capt_qty,frozen_qty,unfroz_qty,open_amount/(strike_releas_qty-today_strike_capt_qty)/contrc_unit,0,rece_margin,open_amount,realize_pandl,close_pandl,1,21 from db_dc.tb_tdfuac_asac_busi_posi where co_no=v_co_no and pd_no=v_pd_no and v_target_pd_code=2 and (strike_releas_qty-today_strike_capt_qty)>0;
    #删除当前数量为0的数据

    /* [删除表记录][平台估值_业务数据_估值产品期货持仓表][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {当前数量}=0 and {估值数据来源}=《估值数据来源-资管数据同步》][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evadata_pd_fupo_posi 
        where co_no = v_co_no and pd_no = v_pd_no and curr_qty=0 and evalu_data_source=21;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.2.3";
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
use db_eva;;

# 原子_平台估值_业务数据_更新估值产品证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_updateSecuPrice;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_updateSecuPrice(
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
    declare v_init_date int;
    declare v_hk_asset_calc_rate int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_hk_asset_calc_rate = 0;
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* update ~平台估值_业务数据_估值产品证券持仓表^ a,db_dc.tb_basesedt_stock_quot b set a.{最新价} = b.{最新价} where a.{市场编号} = b.{市场编号} and a.{证券代码} = b.{证券代码} and a.{机构编号} =@机构编号# and a.{产品编号} = @产品编号#; */
    update db_eva.tb_evadata_pd_secu_posi a,db_dc.tb_basesedt_stock_quot b set a.last_price = b.last_price where a.exch_no = b.exch_no and a.stock_code = b.stock_code and a.co_no =v_co_no and a.pd_no = v_pd_no;

    /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][{初始化日期}][@初始化日期#][{机构编号}=@机构编号# and {产品编号}=@产品编号#] */
    select init_date into v_init_date from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no limit 1;


    /* update ~平台估值_业务数据_估值产品证券持仓表^ a,db_dc.tb_basesedt_specail_stock_quot_info b set a.{最新价} = a.{最新价}/b.{行情计算单位} where a.{市场编号} = b.{市场编号} and a.{证券代码} = b.{证券代码} and a.{机构编号} =@机构编号# and a.{产品编号} = @产品编号#; */
    update db_eva.tb_evadata_pd_secu_posi a,db_dc.tb_basesedt_specail_stock_quot_info b set a.last_price = a.last_price/b.quot_calc_unit where a.exch_no = b.exch_no and a.stock_code = b.stock_code and a.co_no =v_co_no and a.pd_no = v_pd_no;

    /* [获取表记录变量语句][平台估值_基础参数_估值产品基本信息表][{港股通资产计算采用汇率}][@港股通资产计算采用汇率#][{机构编号}=@机构编号# and {产品编号}=@产品编号#] */
    select hk_asset_calc_rate into v_hk_asset_calc_rate from db_eva.tb_evabasic_product_info where co_no=v_co_no and pd_no=v_pd_no limit 1;


    /* if @港股通资产计算采用汇率# = 《港股通资产计算采用汇率-买卖结算汇率均值》 then */
    if v_hk_asset_calc_rate = 0 then

        /* select {初始化日期} into @上日初始化日期# from db_dc.tb_base_hk_exch_rate where {初始化日期}<=@初始化日期# order by {初始化日期} desc limit 1; */
        select init_date into v_last_init_date from db_dc.tb_base_hk_exch_rate where init_date<=v_init_date order by init_date desc limit 1;

        /* update ~平台估值_业务数据_估值产品证券持仓表^ a,db_dc.tb_base_hk_exch_rate b set a.{汇率} = (b.{买入参考汇率}+b.{卖出参考汇率})/2 where a.{市场编号} = b.{市场编号}  and a.{机构编号} =@机构编号# and a.{产品编号} = @产品编号# and a.{初始化日期}=@初始化日期# and b.{初始化日期}=@上日初始化日期#; */
        update db_eva.tb_evadata_pd_secu_posi a,db_dc.tb_base_hk_exch_rate b set a.exch_rate = (b.buy_ref_rate+b.sell_ref_rate)/2 where a.exch_no = b.exch_no  and a.co_no =v_co_no and a.pd_no = v_pd_no and a.init_date=v_init_date and b.init_date=v_last_init_date;

    /* elseif   @港股通资产计算采用汇率# = 《港股通资产计算采用汇率-中国人行汇率》 then */
    elseif   v_hk_asset_calc_rate = 3 then

        /* select {初始化日期} into @上日初始化日期# from db_dc.tb_base_hk_exch_rate where {初始化日期}<=@初始化日期# order by {初始化日期} desc limit 1; */
        select init_date into v_last_init_date from db_dc.tb_base_hk_exch_rate where init_date<=v_init_date order by init_date desc limit 1;

        /* update ~平台估值_业务数据_估值产品证券持仓表^ a,db_dc.tb_base_hk_exch_rate b set a.{汇率} = b.{中国人行汇率} where a.{市场编号} = b.{市场编号}  and a.{机构编号} =@机构编号# and a.{产品编号} = @产品编号# and a.{初始化日期}=@初始化日期# and b.{初始化日期}=@上日初始化日期#; */
        update db_eva.tb_evadata_pd_secu_posi a,db_dc.tb_base_hk_exch_rate b set a.exch_rate = b.pboc_rate where a.exch_no = b.exch_no  and a.co_no =v_co_no and a.pd_no = v_pd_no and a.init_date=v_init_date and b.init_date=v_last_init_date;
    end if;
    #更新期货结算价

    /* update ~平台估值_业务数据_估值产品期货持仓表^ a,db_dc.tb_basefudt_futu_quot b set a.{结算价} = b.{结算价} where a.{市场编号} = b.{市场编号} and a.{合约代码编号} = b.{合约代码编号} and a.{机构编号} =@机构编号# and a.{产品编号} = @产品编号#; */
    update db_eva.tb_evadata_pd_fupo_posi a,db_dc.tb_basefudt_futu_quot b set a.sett_price = b.sett_price where a.exch_no = b.exch_no and a.contrc_code_no = b.contrc_code_no and a.co_no =v_co_no and a.pd_no = v_pd_no;
    #更新子基金行情

    /* update ~平台估值_业务数据_估值产品证券持仓表^ a, ~平台估值_估值汇总_估值产品资产信息表^ b,~平台估值_基础参数_产品关系表^ c set a.{最新价} = b.{单位净值} where a.{机构编号} = b.{机构编号} and a.{机构编号} = c.{机构编号} and a.{产品编号}=c.{产品编号} and b.{产品编号}=c.{母产品编号} and a.{机构编号} =@机构编号# and a.{产品编号} = @产品编号#; */
    update db_eva.tb_evadata_pd_secu_posi a, db_eva.tb_evatotal_product_asset_info b,db_eva.tb_evabasic_pd_relation c set a.last_price = b.unit_nav where a.co_no = b.co_no and a.co_no = c.co_no and a.pd_no=c.pd_no and b.pd_no=c.mum_pd_no and a.co_no =v_co_no and a.pd_no = v_pd_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_同步估值产品债券回购
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_SyncPdBondRepo;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_SyncPdBondRepo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_target_pd_code varchar(8),
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
    declare v_target_pd_code varchar(8);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_target_pd_code = p_target_pd_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_业务数据_估值产品债券回购表][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {估值数据来源}=《估值数据来源-资管数据同步》][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evadata_pd_bond_repo 
        where co_no = v_co_no and pd_no = v_pd_no and evalu_data_source=21;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.4.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* insert into ~平台估值_业务数据_估值产品债券回购表^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{证券代码},{标的代码},{市场编号},{股东代码},{资产账户},{订单方向},{回购数量},{回购金额},{回购利率},{回购交易日期},{回购天数},{回购实际天数},{回购到期日期},{回购购回金额},{回购购回利息},{实际回购到期日期},{回购处理状态},{估值数据来源}) select @创建日期#,@创建时间#,@更新日期#,@更新时间#,{初始化日期},@机构编号#,@产品编号#,{证券代码},{标的代码},exchange_no,stock_account,asset_account,{订单方向},{回购数量},{回购金额},{回购利率},{回购交易日期},{回购天数},repo_calendar_days,{回购到期日期},{回购购回金额},repo_back_interest,{实际回购到期日期},{回购处理状态},《估值数据来源-资管数据同步》 from db_dc.tb_dt1_act_bondrepo  where product_code=@目标产品编码#; */
    insert into db_eva.tb_evadata_pd_bond_repo(create_date,create_time,update_date,update_time,init_date,co_no,pd_no,stock_code,target_code,exch_no,stock_acco,asset_acco,order_dir,repo_qty,repo_amt,repo_rate,repo_trade_date,repo_days,repo_cale_days,repo_back_date,repo_back_amt,repo_back_intrst,repo_back_trade_date,repo_status,evalu_data_source) select v_create_date,v_create_time,v_update_date,v_update_time,init_date,v_co_no,v_pd_no,stock_code,target_code,exchange_no,stock_account,asset_account,order_dir,repo_qty,repo_amt,repo_rate,repo_trade_date,repo_days,repo_calendar_days,repo_back_date,repo_back_amt,repo_back_interest,repo_back_trade_date,repo_status,21 from db_dc.tb_dt1_act_bondrepo  where product_code=v_target_pd_code;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_同步估值产品历史债券回购
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_SyncPdHisBondRepo;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_SyncPdHisBondRepo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_target_pd_code varchar(8),
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
    declare v_target_pd_code varchar(8);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_target_pd_code = p_target_pd_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [删除表记录][历史_平台估值_业务数据_估值产品债券回购表][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {估值数据来源}=《估值数据来源-资管数据同步》][3][@机构编号#,@产品编号#] */
    delete from db_eva_his.tb_evadata_pd_bond_repo_his 
        where co_no = v_co_no and pd_no = v_pd_no and evalu_data_source=21;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.5.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* insert into ~历史_平台估值_业务数据_估值产品债券回购表^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{证券代码},{标的代码},{市场编号},{股东代码},{资产账户},{订单方向},{回购数量},{回购金额},{回购利率},{回购交易日期},{回购天数},{回购实际天数},{回购到期日期},{回购购回金额},{回购购回利息},{实际回购到期日期},{回购处理状态},{估值数据来源}) select @创建日期#,@创建时间#,@更新日期#,@更新时间#,{初始化日期},@机构编号#,@产品编号#,{证券代码},{标的代码},exchange_no,stock_account,asset_account,{订单方向},{回购数量},{回购金额},{回购利率},{回购交易日期},{回购天数},repo_calendar_days,{回购到期日期},{回购购回金额},repo_back_interest,{实际回购到期日期},{回购处理状态},《估值数据来源-资管数据同步》 from db_dc.tb_dt1_act_bondrepo_his  where product_code=@目标产品编码#; */
    insert into db_eva_his.tb_evadata_pd_bond_repo_his(create_date,create_time,update_date,update_time,init_date,co_no,pd_no,stock_code,target_code,exch_no,stock_acco,asset_acco,order_dir,repo_qty,repo_amt,repo_rate,repo_trade_date,repo_days,repo_cale_days,repo_back_date,repo_back_amt,repo_back_intrst,repo_back_trade_date,repo_status,evalu_data_source) select v_create_date,v_create_time,v_update_date,v_update_time,init_date,v_co_no,v_pd_no,stock_code,target_code,exchange_no,stock_account,asset_account,order_dir,repo_qty,repo_amt,repo_rate,repo_trade_date,repo_days,repo_calendar_days,repo_back_date,repo_back_amt,repo_back_interest,repo_back_trade_date,repo_status,21 from db_dc.tb_dt1_act_bondrepo_his  where product_code=v_target_pd_code;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_推算估值产品证券账户资金根据流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_calcPdAccoCapitByJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_calcPdAccoCapitByJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_target_pd_code varchar(8),
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
    declare v_target_pd_code varchar(8);
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
    SET v_target_pd_code = p_target_pd_code;
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_同步估值产品证券成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_SyncPdExecution;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_SyncPdExecution(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_target_pd_code varchar(8),
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
    declare v_target_pd_code varchar(8);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_pd_no = p_pd_no;
    SET v_target_pd_code = p_target_pd_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_业务数据_估值产品成交表][{机构编号} = @机构编号# and {产品编号} = @产品编号# ][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evadata_pd_execution 
        where co_no = v_co_no and pd_no = v_pd_no ;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.7.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* insert into ~平台估值_业务数据_估值产品成交表^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{订单编号},{订单日期},{订单时间},{申报编号},{资产账户},{股东代码},{市场编号},{投资类型},{证券类型},{证券代码},{证券名称},{本币币种},{成交价格},{订单方向},{订单价格},{订单数量},{成交日期},{成交时间},{成交编号},{成交数量},{成交金额},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{债券计提利息},{净价标志}) select @创建日期#,@创建时间#,@更新日期#,@更新时间#,@初始化日期#,@机构编号#,@产品编号#,order_no,order_date,order_time,report_no,asset_account,stock_account,exchange_no,invest_type,stock_type,stock_code,stock_name,currency_type,execution_price,order_dir,order_price,order_qty,execution_date,execution_time,execution_no,execution_qty,execution_amt,all_fare,stamp_tax,transfer_fare,brokerage,SEC_charges,other_fare,brokerage_commission,other_commission,bond_interest,netprice_kind from db_dc.tb_trd_secu_execution where {资管产品编码}=@目标产品编码#; */
    insert into db_eva.tb_evadata_pd_execution(create_date,create_time,update_date,update_time,init_date,co_no,pd_no,order_no,order_date,order_time,report_no,asset_acco,stock_acco,exch_no,invest_type,stock_type,stock_code,stock_name,crncy_type,strike_price,order_dir,order_price,order_qty,strike_date,strike_time,strike_no,strike_qty,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,bond_accr_intrst,net_price_flag) select v_create_date,v_create_time,v_update_date,v_update_time,v_init_date,v_co_no,v_pd_no,order_no,order_date,order_time,report_no,asset_account,stock_account,exchange_no,invest_type,stock_type,stock_code,stock_name,currency_type,execution_price,order_dir,order_price,order_qty,execution_date,execution_time,execution_no,execution_qty,execution_amt,all_fare,stamp_tax,transfer_fare,brokerage,SEC_charges,other_fare,brokerage_commission,other_commission,bond_interest,netprice_kind from db_dc.tb_trd_secu_execution where product_code=v_target_pd_code;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_同步估值产品交易组证券账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_SyncPdExgpAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_SyncPdExgpAccoCapit(
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
    declare v_pd_acco_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_acco_type = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set  @产品账户类型#=《产品账户类型-证券账户》; */
    set  v_pd_acco_type=2;

    /* [删除表记录][平台估值_业务数据_估值产品交易组账户资金表][{初始化日期}=@初始化日期# and {机构编号} = @机构编号# and {产品编号} = @产品编号# and {交易组编号}=@交易组编号# and {产品账户类型} =《产品账户类型-证券账户》 ][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evadata_pd_exgp_acco_capit 
        where init_date=v_init_date and co_no = v_co_no and pd_no = v_pd_no and exch_group_no=v_exch_group_no and pd_acco_type =2 ;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.8.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #从资管数据获取

    /* insert into ~平台估值_业务数据_估值产品交易组账户资金表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{产品账户类型},{资产账户},{交易组编号},{本币币种},{期初金额},{当前金额},{冻结金额},{解冻金额},{利息积数},{预计利息}) select {创建日期},{创建时间},{更新日期},{更新时间},{更新次数},@初始化日期#,@机构编号#,@产品编号#,@产品账户类型#,{资产账户编号},{交易组编号},{本币币种},{期初金额},{当前金额}+{金额核对差额},{冻结金额},{解冻金额},{当前金额},0 from db_dc.tb_pdseca_exgp_capit where {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号#; */
    insert into db_eva.tb_evadata_pd_exgp_acco_capit(create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,pd_acco_type,asset_acco,exch_group_no,crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,intrst_base_amt,intrst_cacl_amt) select create_date,create_time,update_date,update_time,update_times,v_init_date,v_co_no,v_pd_no,v_pd_acco_type,asset_acco_no,exch_group_no,crncy_type,begin_amt,curr_amt+amt_check_diff,frozen_amt,unfroz_amt,curr_amt,0 from db_dc.tb_pdseca_exgp_capit where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no;

    /* update ~平台估值_业务数据_估值产品交易组账户资金表^ a,db_dc.tb_tdseac_exgp_busi_capit b set a.{当前金额}=a.{当前金额}-b.{成交占用金额}+b.{成交释放金额} */
    update db_eva.tb_evadata_pd_exgp_acco_capit a,db_dc.tb_tdseac_exgp_busi_capit b set a.curr_amt=a.curr_amt-b.strike_capt_amt+b.strike_releas_amt

    /* where a.{机构编号}=b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{资产账户}= concat(b.{资产账户编号}) and a.{交易组编号}=b.{交易组编号} and  a.{本币币种} =b.{交易币种} and a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{交易组编号}=@交易组编号#; */
    where a.co_no=b.co_no and a.pd_no=b.pd_no and a.asset_acco= concat(b.asset_acco_no) and a.exch_group_no=b.exch_group_no and  a.crncy_type =b.exch_crncy_type and a.co_no=v_co_no and a.pd_no=v_pd_no and a.exch_group_no=v_exch_group_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_同步估值产品交易组证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_SyncPdExgpSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_SyncPdExgpSecuPosi(
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_业务数据_估值产品交易组证券持仓表][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {交易组编号}=@交易组编号#][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evadata_pd_exgp_secu_posi 
        where co_no = v_co_no and pd_no = v_pd_no and exch_group_no=v_exch_group_no;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.9.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #从资管数据获取

    /* insert into ~平台估值_业务数据_估值产品交易组证券持仓表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户},{交易组编号},{市场编号},{股东代码},{证券类型},{证券代码},{证券名称},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{当前成本金额},{最新价},{汇率},{实现盈亏},{利息成本金额},{利息收益},{替代数量}) select a.{创建日期},a.{创建时间},a.{更新日期},a.{更新时间},a.{更新次数},@初始化日期#,@机构编号#,@产品编号#,{资产账户编号},{交易组编号},a.{市场编号},{股东代码编号},b.{证券类型},b.{证券代码},b.{证券名称},0,{期初数量},{当前数量},{冻结数量},{解冻数量},{成本金额},0,1,{实现盈亏},{利息成本金额},{利息收益},0 from db_dc.tb_pdsepo_exgp_posi  a ,db_dc.tb_basesedt_stock_code_info b  where a.{市场编号}=b.{市场编号} and a.{证券代码编号} =b.{证券代码编号} and a.{机构编号}=@机构编号# and  a.{产品编号}=@产品编号# and a.{交易组编号}=@交易组编号#; */
    insert into db_eva.tb_evadata_pd_exgp_secu_posi(create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco,exch_group_no,exch_no,stock_acco,stock_type,stock_code,stock_name,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,curr_cost_amt,last_price,exch_rate,realize_pandl,intrst_cost_amt,intrst_pandl,repl_qty) select a.create_date,a.create_time,a.update_date,a.update_time,a.update_times,v_init_date,v_co_no,v_pd_no,asset_acco_no,exch_group_no,a.exch_no,stock_acco_no,b.stock_type,b.stock_code,b.stock_name,0,begin_qty,curr_qty,frozen_qty,unfroz_qty,cost_amt,0,1,realize_pandl,intrst_cost_amt,intrst_pandl,0 from db_dc.tb_pdsepo_exgp_posi  a ,db_dc.tb_basesedt_stock_code_info b  where a.exch_no=b.exch_no and a.stock_code_no =b.stock_code_no and a.co_no=v_co_no and  a.pd_no=v_pd_no and a.exch_group_no=v_exch_group_no;

    /* update ~平台估值_业务数据_估值产品交易组证券持仓表^ a,db_dc.tb_tdseac_exgp_busi_posi b,db_dc.tb_basesedt_stock_code_info c */
    update db_eva.tb_evadata_pd_exgp_secu_posi a,db_dc.tb_tdseac_exgp_busi_posi b,db_dc.tb_basesedt_stock_code_info c

    /* set a.{当前数量}=a.{当前数量}-b.{成交占用数量}+b.{成交释放数量} */
    set a.curr_qty=a.curr_qty-b.strike_capt_qty+b.strike_releas_qty

    /* where a.{机构编号}=b.{机构编号} and a.{产品编号}=b.{产品编号} and a.{资产账户}= concat(b.{资产账户编号}) and a.{交易组编号}=b.{交易组编号} and a.{证券代码} =c.{证券代码} and b.{证券代码编号}=c.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号}=c.{市场编号} and a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{交易组编号}=@交易组编号#; */
    where a.co_no=b.co_no and a.pd_no=b.pd_no and a.asset_acco= concat(b.asset_acco_no) and a.exch_group_no=b.exch_group_no and a.stock_code =c.stock_code and b.stock_code_no=c.stock_code_no and a.exch_no=b.exch_no and b.exch_no=c.exch_no and a.co_no=v_co_no and a.pd_no=v_pd_no and a.exch_group_no=v_exch_group_no;
    #买入新增

    /* insert into ~平台估值_业务数据_估值产品交易组证券持仓表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户},{交易组编号},{市场编号},{股东代码},{证券类型},{证券代码},{证券名称},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{当前成本金额},{最新价},{汇率},{实现盈亏},{利息成本金额},{利息收益},{替代数量}) select a.{创建日期},a.{创建时间},a.{更新日期},a.{更新时间},a.{更新次数},@初始化日期#,@机构编号#,@产品编号#,{资产账户编号},{交易组编号},a.{市场编号},{股东代码编号},b.{证券类型},b.{证券代码},b.{证券名称},0,0,{成交释放数量},{冻结数量},{解冻数量},{成本金额},0,1,{实现盈亏},{利息成本金额},{利息收益},0 from db_dc.tb_tdseac_exgp_busi_posi  a ,db_dc.tb_basesedt_stock_code_info b  where a.{市场编号}=b.{市场编号} and a.{证券代码编号} =b.{证券代码编号} and a.{机构编号}=@机构编号# and  a.{产品编号}=@产品编号# and b.stock_code not in (select {证券代码} from ~平台估值_业务数据_估值产品交易组证券持仓表^ where {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号#); */
    insert into db_eva.tb_evadata_pd_exgp_secu_posi(create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco,exch_group_no,exch_no,stock_acco,stock_type,stock_code,stock_name,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,curr_cost_amt,last_price,exch_rate,realize_pandl,intrst_cost_amt,intrst_pandl,repl_qty) select a.create_date,a.create_time,a.update_date,a.update_time,a.update_times,v_init_date,v_co_no,v_pd_no,asset_acco_no,exch_group_no,a.exch_no,stock_acco_no,b.stock_type,b.stock_code,b.stock_name,0,0,strike_releas_qty,frozen_qty,unfroz_qty,cost_amt,0,1,realize_pandl,intrst_cost_amt,intrst_pandl,0 from db_dc.tb_tdseac_exgp_busi_posi  a ,db_dc.tb_basesedt_stock_code_info b  where a.exch_no=b.exch_no and a.stock_code_no =b.stock_code_no and a.co_no=v_co_no and  a.pd_no=v_pd_no and b.stock_code not in (select stock_code from db_eva.tb_evadata_pd_exgp_secu_posi where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_更新估值产品交易组证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_updateExgpSecuPrice;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_updateExgpSecuPrice(
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
    declare v_init_date int;
    declare v_hk_asset_calc_rate int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_hk_asset_calc_rate = 0;
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* update ~平台估值_业务数据_估值产品交易组证券持仓表^ a,db_dc.tb_basesedt_stock_quot b set a.{最新价} = b.{最新价} where a.{市场编号} = b.{市场编号} and a.{证券代码} = b.{证券代码} and a.{机构编号} =@机构编号# and a.{产品编号} = @产品编号# and a.{交易组编号}=@交易组编号#; */
    update db_eva.tb_evadata_pd_exgp_secu_posi a,db_dc.tb_basesedt_stock_quot b set a.last_price = b.last_price where a.exch_no = b.exch_no and a.stock_code = b.stock_code and a.co_no =v_co_no and a.pd_no = v_pd_no and a.exch_group_no=v_exch_group_no;

    /* [获取表记录变量语句][平台估值_业务数据_估值产品证券持仓表][{初始化日期}][@初始化日期#][{机构编号}=@机构编号# and {产品编号}=@产品编号#] */
    select init_date into v_init_date from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no limit 1;


    /* update ~平台估值_业务数据_估值产品交易组证券持仓表^ a,db_dc.tb_basesedt_specail_stock_quot_info b set a.{最新价} = a.{最新价}/b.{行情计算单位} where a.{市场编号} = b.{市场编号} and a.{证券代码} = b.{证券代码} and a.{机构编号} =@机构编号# and a.{产品编号} = @产品编号# and a.{交易组编号}=@交易组编号#; */
    update db_eva.tb_evadata_pd_exgp_secu_posi a,db_dc.tb_basesedt_specail_stock_quot_info b set a.last_price = a.last_price/b.quot_calc_unit where a.exch_no = b.exch_no and a.stock_code = b.stock_code and a.co_no =v_co_no and a.pd_no = v_pd_no and a.exch_group_no=v_exch_group_no;
    #select {初始化日期} into @上日初始化日期# from db_dc.tb_base_hk_exch_rate where {初始化日期}<@初始化日期# order by {初始化日期} desc limit 1;
    #update ~平台估值_业务数据_估值产品交易组证券持仓表^ a,db_dc.tb_base_hk_exch_rate b set a.{汇率} = (b.{买入结算汇率}+b.{卖出结算汇率})/2 where a.{市场编号} = b.{市场编号}  and a.{机构编号} =@机构编号# and a.{产品编号} = @产品编号#  and a.{交易组编号}=@交易组编号# and a.{初始化日期}=@初始化日期# and b.{初始化日期}=@上日初始化日期#;

    /* [获取表记录变量语句][平台估值_基础参数_估值产品基本信息表][{港股通资产计算采用汇率}][@港股通资产计算采用汇率#][{机构编号}=@机构编号# and {产品编号}=@产品编号#] */
    select hk_asset_calc_rate into v_hk_asset_calc_rate from db_eva.tb_evabasic_product_info where co_no=v_co_no and pd_no=v_pd_no limit 1;


    /* if @港股通资产计算采用汇率# = 《港股通资产计算采用汇率-买卖结算汇率均值》 then */
    if v_hk_asset_calc_rate = 0 then

        /* select {初始化日期} into @上日初始化日期# from db_dc.tb_base_hk_exch_rate where {初始化日期}<=@初始化日期# order by {初始化日期} desc limit 1; */
        select init_date into v_last_init_date from db_dc.tb_base_hk_exch_rate where init_date<=v_init_date order by init_date desc limit 1;

        /* update ~平台估值_业务数据_估值产品交易组证券持仓表^ a,db_dc.tb_base_hk_exch_rate b set a.{汇率} = (b.{买入参考汇率}+b.{卖出参考汇率})/2 where a.{市场编号} = b.{市场编号}  and a.{机构编号} =@机构编号# and a.{产品编号} = @产品编号# and a.{交易组编号}=@交易组编号# and a.{初始化日期}=@初始化日期# and b.{初始化日期}=@上日初始化日期#; */
        update db_eva.tb_evadata_pd_exgp_secu_posi a,db_dc.tb_base_hk_exch_rate b set a.exch_rate = (b.buy_ref_rate+b.sell_ref_rate)/2 where a.exch_no = b.exch_no  and a.co_no =v_co_no and a.pd_no = v_pd_no and a.exch_group_no=v_exch_group_no and a.init_date=v_init_date and b.init_date=v_last_init_date;

    /* elseif   @港股通资产计算采用汇率# = 《港股通资产计算采用汇率-中国人行汇率》 then */
    elseif   v_hk_asset_calc_rate = 3 then

        /* select {初始化日期} into @上日初始化日期# from db_dc.tb_base_hk_exch_rate where {初始化日期}<=@初始化日期# order by {初始化日期} desc limit 1; */
        select init_date into v_last_init_date from db_dc.tb_base_hk_exch_rate where init_date<=v_init_date order by init_date desc limit 1;

        /* update ~平台估值_业务数据_估值产品交易组证券持仓表^ a,db_dc.tb_base_hk_exch_rate b set a.{汇率} = b.{中国人行汇率} where a.{市场编号} = b.{市场编号}  and a.{机构编号} =@机构编号# and a.{产品编号} = @产品编号# and a.{交易组编号}=@交易组编号# and a.{初始化日期}=@初始化日期# and b.{初始化日期}=@上日初始化日期#; */
        update db_eva.tb_evadata_pd_exgp_secu_posi a,db_dc.tb_base_hk_exch_rate b set a.exch_rate = b.pboc_rate where a.exch_no = b.exch_no  and a.co_no =v_co_no and a.pd_no = v_pd_no and a.exch_group_no=v_exch_group_no and a.init_date=v_init_date and b.init_date=v_last_init_date;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_新增估值产品证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_AddPdSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_AddPdSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_curr_qty decimal(18,2);
    declare v_curr_cost_amt decimal(18,4);
    declare v_last_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_type int;
    declare v_stock_name varchar(64);
    declare v_invest_type int;
    declare v_begin_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_exch_rate decimal(18,12);
    declare v_evalu_data_source int;
    declare v_init_date int;
    declare v_repl_qty decimal(18,2);
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
    SET v_asset_acco = p_asset_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_curr_qty = p_curr_qty;
    SET v_curr_cost_amt = p_curr_cost_amt;
    SET v_last_price = p_last_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_type = 0;
    SET v_stock_name = " ";
    SET v_invest_type = 0;
    SET v_begin_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_exch_rate = 0;
    SET v_evalu_data_source = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_repl_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @证券类型#=《证券类型-股票》; */
    set v_stock_type=1;

    /* set @证券名称#=@证券代码#; */
    set v_stock_name=v_stock_code;

    /* set @投资类型#=《投资类型-二级市场交易性金融资产》; */
    set v_invest_type=1;

    /* set @期初数量#=0; */
    set v_begin_qty=0;

    /* set @冻结数量#=0; */
    set v_frozen_qty=0;

    /* set @解冻数量#=0; */
    set v_unfroz_qty=0;

    /* set @实现盈亏#=0; */
    set v_realize_pandl=0;

    /* set @利息成本金额#=0; */
    set v_intrst_cost_amt=0;

    /* set @利息收益#=0; */
    set v_intrst_pandl=0;

    /* set @汇率#=1; */
    set v_exch_rate=1;

    /* set @估值数据来源#=《估值数据来源-手工数据》; */
    set v_evalu_data_source=99;

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* set @替代数量#=0; */
    set v_repl_qty=0;
    #[获取表记录变量语句][db_dc.tb_act_stock_quotation][ifnull({证券名称},@证券代码#)][@证券名称#][exchange_no=@市场编号# and {证券代码}=@证券代码#]

    /* select ifnull({证券名称},@证券代码#) into @证券名称# from db_dc.tb_basesedt_stock_code_info where exch_no=@市场编号# and {证券代码}=@证券代码# limit 1; */
    select ifnull(stock_name,v_stock_code) into v_stock_name from db_dc.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;

    /* [插入表记录][平台估值_业务数据_估值产品证券持仓表][字段][字段变量][1][@资产账户#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evadata_pd_secu_posi(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco, exch_no, stock_acco, 
        stock_type, stock_code, stock_name, invest_type, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        curr_cost_amt, last_price, exch_rate, realize_pandl, 
        intrst_cost_amt, intrst_pandl, repl_qty, evalu_data_source) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco, v_exch_no, v_stock_acco, 
        v_stock_type, v_stock_code, v_stock_name, v_invest_type, 
        v_begin_qty, v_curr_qty, v_frozen_qty, v_unfroz_qty, 
        v_curr_cost_amt, v_last_price, v_exch_rate, v_realize_pandl, 
        v_intrst_cost_amt, v_intrst_pandl, v_repl_qty, v_evalu_data_source);
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.11.1";
        SET v_error_info =  CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_修改估值产品证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_ModiPdSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_ModiPdSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][平台估值_业务数据_估值产品证券持仓表][{当前数量} = @当前数量#,{当前成本金额}=@当前成本金额#,{最新价}=@最新价#,{汇率}=@汇率#,{利息收益}=@利息收益#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户}=@资产账户# and {市场编号}=@市场编号# and {股东代码} =@股东代码# and {证券代码}=@证券代码#][2][@资产账户#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evadata_pd_secu_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty = v_curr_qty,curr_cost_amt=v_curr_cost_amt,last_price=v_last_price,exch_rate=v_exch_rate,intrst_pandl=v_intrst_pandl where co_no=v_co_no and pd_no=v_pd_no and asset_acco=v_asset_acco and exch_no=v_exch_no and stock_acco =v_stock_acco and stock_code=v_stock_code;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.12.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户=",v_asset_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_删除估值产品证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_DelPdSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_DelPdSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
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
    SET v_asset_acco = p_asset_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_业务数据_估值产品证券持仓表][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {资产账户}=@资产账户# and {市场编号}=@市场编号# and {股东代码} =@股东代码# and {证券代码}=@证券代码#][3][@资产账户#] */
    delete from db_eva.tb_evadata_pd_secu_posi 
        where co_no=v_co_no and pd_no=v_pd_no  and asset_acco=v_asset_acco and exch_no=v_exch_no and stock_acco =v_stock_acco and stock_code=v_stock_code;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.13.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户=",v_asset_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_查询估值产品证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_QueryPdSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_QueryPdSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
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
    SET v_asset_acco = p_asset_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_业务数据_估值产品证券持仓表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@资产账户# =" " or {资产账户}=@资产账户#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@股东代码#=" " or {股东代码} =@股东代码#) and (@证券代码#= " " or {证券代码}=@证券代码#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco, exch_no, 
        stock_acco, stock_type, stock_code, stock_name, 
        invest_type, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, curr_cost_amt, last_price, exch_rate, 
        realize_pandl, intrst_cost_amt, intrst_pandl, repl_qty, 
        evalu_data_source from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco =" " or asset_acco=v_asset_acco) and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_acco=" " or stock_acco =v_stock_acco) and (v_stock_code= " " or stock_code=v_stock_code);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco, exch_no, 
        stock_acco, stock_type, stock_code, stock_name, 
        invest_type, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, curr_cost_amt, last_price, exch_rate, 
        realize_pandl, intrst_cost_amt, intrst_pandl, repl_qty, 
        evalu_data_source from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco =" " or asset_acco=v_asset_acco) and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_acco=" " or stock_acco =v_stock_acco) and (v_stock_code= " " or stock_code=v_stock_code) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_查询估值产品交易组证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_QueryPdExgpSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_QueryPdExgpSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco = p_asset_acco;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* [获取表记录][平台估值_业务数据_估值产品交易组证券持仓表][字段][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and (@资产账户# =" " or {资产账户}=@资产账户#) and (@交易组编号# =0 or {交易组编号}=@交易组编号#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@股东代码#=" " or {股东代码} =@股东代码#) and (@证券代码#= " " or {证券代码}=@证券代码#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco, exch_group_no, 
        exch_no, stock_acco, stock_type, stock_code, 
        stock_name, invest_type, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, curr_cost_amt, last_price, 
        exch_rate, realize_pandl, intrst_cost_amt, intrst_pandl, 
        repl_qty from db_eva.tb_evadata_pd_exgp_secu_posi where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and (v_asset_acco =" " or asset_acco=v_asset_acco) and (v_exch_group_no =0 or exch_group_no=v_exch_group_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_acco=" " or stock_acco =v_stock_acco) and (v_stock_code= " " or stock_code=v_stock_code);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco, exch_group_no, 
        exch_no, stock_acco, stock_type, stock_code, 
        stock_name, invest_type, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, curr_cost_amt, last_price, 
        exch_rate, realize_pandl, intrst_cost_amt, intrst_pandl, 
        repl_qty from db_eva.tb_evadata_pd_exgp_secu_posi where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and (v_asset_acco =" " or asset_acco=v_asset_acco) and (v_exch_group_no =0 or exch_group_no=v_exch_group_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_acco=" " or stock_acco =v_stock_acco) and (v_stock_code= " " or stock_code=v_stock_code) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_查询估值产品期货持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_QueryPdFupoPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_QueryPdFupoPosi(
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_lngsht_type int;
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
    SET v_exch_no = p_exch_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_业务数据_估值产品期货持仓表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@资产账户编号# =0 or {资产账户编号}=@资产账户编号#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@多空类型#=0 or {多空类型}=@多空类型#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, comb_code, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, pre_settle_price, 
        sett_price, rece_margin, open_amount, realize_pandl, 
        close_pandl, today_posi_flag, evalu_data_source from db_eva.tb_evadata_pd_fupo_posi where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no =0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_lngsht_type=0 or lngsht_type=v_lngsht_type);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, comb_code, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, pre_settle_price, 
        sett_price, rece_margin, open_amount, realize_pandl, 
        close_pandl, today_posi_flag, evalu_data_source from db_eva.tb_evadata_pd_fupo_posi where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no =0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_lngsht_type=0 or lngsht_type=v_lngsht_type) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_同步估值产品增值税证券成交
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_SyncPdVatTrans;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_SyncPdVatTrans(
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
    declare v_init_date int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_evalu_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_估值汇总_估值产品增值税成交计算表][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {初始化日期}=@初始化日期#][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evatotal_pd_vat_transcalc 
        where co_no = v_co_no and pd_no = v_pd_no and init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.17.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* insert into ~平台估值_估值汇总_估值产品增值税成交计算表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{订单方向},{成交编号},{成交时间},{证券代码},{成交价格},{成交数量},{成交金额},{全部费用},{成本价},{冲抵数量},{处理标志}) select @创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@估值日期#,{机构编号},{产品编号},{订单方向},{成交编号},{成交时间},{证券代码},{成交价格},{成交数量},{成交金额},0,0,0,0 from db_dc.tb_tdserp_strike where {初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {证券类型}=《证券类型-股票》; */
    insert into db_eva.tb_evatotal_pd_vat_transcalc(create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,order_dir,strike_no,strike_time,stock_code,strike_price,strike_qty,strike_amt,all_fee,cost_price,offset_qty,deal_flag) select v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_evalu_date,co_no,pd_no,order_dir,strike_no,strike_time,stock_code,strike_price,strike_qty,strike_amt,0,0,0,0 from db_dc.tb_tdserp_strike where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and stock_type=1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_同步估值产品大宗交易
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_SyncPdBlockTrade;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_SyncPdBlockTrade(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* [删除表记录][平台估值_业务数据_估值产品场外交易表][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {初始化日期}<=@初始化日期# ][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evadata_pd_transout 
        where co_no = v_co_no and pd_no = v_pd_no and init_date<=v_init_date ;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.18.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* insert into ~平台估值_业务数据_估值产品场外交易表^({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{市场编号},{证券类型},{证券代码},{订单方向},{成交数量},{成交价格},{到期日期},{备注信息}) select @创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,{成交日期},a.{机构编号},a.{产品编号},a.{市场编号},《证券类型-股票》,b.{证券代码},《订单方向-买入》,{成交数量},{成交价格},{解禁日期},' ' from db_dc.tb_pdsepo_block_trade_posi a,db_dc.tb_basesedt_stock_code_info b where  a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{市场编号}=b.{市场编号} and a.{证券代码编号}=b.{证券代码编号}; */
    insert into db_eva.tb_evadata_pd_transout(create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,exch_no,stock_type,stock_code,order_dir,strike_qty,strike_price,expire_date,remark_info) select v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,strike_date,a.co_no,a.pd_no,a.exch_no,1,b.stock_code,1,strike_qty,strike_price,release_date,' ' from db_dc.tb_pdsepo_block_trade_posi a,db_dc.tb_basesedt_stock_code_info b where  a.co_no=v_co_no and a.pd_no=v_pd_no and a.exch_no=b.exch_no and a.stock_code_no=b.stock_code_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_查询估值产品大宗持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_QueryPdSecuBlockPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_QueryPdSecuBlockPosi(
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
    

    /* [获取表记录][平台估值_业务数据_估值产品证券持仓表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {估值数据来源}=《估值数据来源-外部成交记录》][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco, exch_no, 
        stock_acco, stock_type, stock_code, stock_name, 
        invest_type, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, curr_cost_amt, last_price, exch_rate, 
        realize_pandl, intrst_cost_amt, intrst_pandl, repl_qty, 
        evalu_data_source from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no and evalu_data_source=3;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco, exch_no, 
        stock_acco, stock_type, stock_code, stock_name, 
        invest_type, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, curr_cost_amt, last_price, exch_rate, 
        realize_pandl, intrst_cost_amt, intrst_pandl, repl_qty, 
        evalu_data_source from db_eva.tb_evadata_pd_secu_posi where co_no=v_co_no and pd_no=v_pd_no and evalu_data_source=3 limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_新增估值产品账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_AddPdAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_AddPdAccoCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_acco_type int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);
    declare v_evalu_data_source int;
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
    SET v_pd_acco_type = p_pd_acco_type;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_curr_amt = p_curr_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_intrst_base_amt = 0;
    SET v_intrst_cacl_amt = 0;
    SET v_evalu_data_source = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

     /* set @期初金额#=0; */
     set v_begin_amt=0;

     /* set @冻结金额#=0; */
     set v_frozen_amt=0;

     /* set @解冻金额#=0; */
     set v_unfroz_amt=0;

     /* set @利息积数#=0; */
     set v_intrst_base_amt=0;

     /* set @预计利息#=0; */
     set v_intrst_cacl_amt=0;

    /* set @估值数据来源#=《估值数据来源-手工数据》; */
    set v_evalu_data_source=99;

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* [插入表记录][平台估值_业务数据_估值产品账户资金表][字段][字段变量][1][@资产账户#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evadata_pd_acco_capit(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, pd_acco_type, asset_acco, crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        intrst_base_amt, intrst_cacl_amt, evalu_data_source) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_pd_acco_type, v_asset_acco, v_crncy_type, 
        v_begin_amt, v_curr_amt, v_frozen_amt, v_unfroz_amt, 
        v_intrst_base_amt, v_intrst_cacl_amt, v_evalu_data_source);
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.21.1";
        SET v_error_info =  CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_修改估值产品账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_ModiPdAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_ModiPdAccoCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_acco_type int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_acco_type = p_pd_acco_type;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_curr_amt = p_curr_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][平台估值_业务数据_估值产品账户资金表][{当前金额} = @当前金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户}=@资产账户# and {本币币种}=@本币币种#][2][@资产账户#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evadata_pd_acco_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = v_curr_amt where co_no=v_co_no and pd_no=v_pd_no and asset_acco=v_asset_acco and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户=",v_asset_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_删除估值产品账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_DelPdAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_DelPdAccoCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_acco_type int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_acco_type = p_pd_acco_type;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_业务数据_估值产品账户资金表][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {产品账户类型}=@产品账户类型# and {资产账户}=@资产账户# and {本币币种}=@本币币种#][3][@资产账户#] */
    delete from db_eva.tb_evadata_pd_acco_capit 
        where co_no=v_co_no and pd_no=v_pd_no and pd_acco_type=v_pd_acco_type and asset_acco=v_asset_acco and crncy_type=v_crncy_type;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.23.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户=",v_asset_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_查询估值产品账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_QueryPdAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_QueryPdAccoCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_acco_type int;
    declare v_asset_acco varchar(16);
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
    SET v_pd_acco_type = p_pd_acco_type;
    SET v_asset_acco = p_asset_acco;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_业务数据_估值产品账户资金表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@产品账户类型# =0 or {产品账户类型}=@产品账户类型#) and (@资产账户# =" " or {资产账户}=@资产账户#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_acco_type, asset_acco, 
        crncy_type, begin_amt, curr_amt, frozen_amt, 
        unfroz_amt, intrst_base_amt, intrst_cacl_amt, evalu_data_source from db_eva.tb_evadata_pd_acco_capit where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_pd_acco_type =0 or pd_acco_type=v_pd_acco_type) and (v_asset_acco =" " or asset_acco=v_asset_acco);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_acco_type, asset_acco, 
        crncy_type, begin_amt, curr_amt, frozen_amt, 
        unfroz_amt, intrst_base_amt, intrst_cacl_amt, evalu_data_source from db_eva.tb_evadata_pd_acco_capit where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_pd_acco_type =0 or pd_acco_type=v_pd_acco_type) and (v_asset_acco =" " or asset_acco=v_asset_acco) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_查询估值产品交易组账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_QueryPdExgpAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_QueryPdExgpAccoCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_acco_type int;
    declare v_asset_acco varchar(16);
    declare v_exch_group_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_acco_type = p_pd_acco_type;
    SET v_asset_acco = p_asset_acco;
    SET v_exch_group_no = p_exch_group_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* [获取表记录][平台估值_业务数据_估值产品交易组账户资金表][字段][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@产品账户类型# =0 or {产品账户类型}=@产品账户类型#) and (@资产账户# =" " or {资产账户}=@资产账户#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, pd_acco_type, 
        asset_acco, crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, intrst_base_amt, intrst_cacl_amt from db_eva.tb_evadata_pd_exgp_acco_capit where init_date=v_init_date and co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pd_acco_type =0 or pd_acco_type=v_pd_acco_type) and (v_asset_acco =" " or asset_acco=v_asset_acco);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, pd_acco_type, 
        asset_acco, crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, intrst_base_amt, intrst_cacl_amt from db_eva.tb_evadata_pd_exgp_acco_capit where init_date=v_init_date and co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_pd_acco_type =0 or pd_acco_type=v_pd_acco_type) and (v_asset_acco =" " or asset_acco=v_asset_acco) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_新增估值产品历史证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_AddPdHisSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_AddPdHisSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco varchar(16),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_curr_qty decimal(18,2),
    IN p_curr_cost_amt decimal(18,4),
    IN p_last_price decimal(16,9),
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
    declare v_asset_acco varchar(16);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_curr_qty decimal(18,2);
    declare v_curr_cost_amt decimal(18,4);
    declare v_last_price decimal(16,9);
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_type int;
    declare v_stock_name varchar(64);
    declare v_invest_type int;
    declare v_begin_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_evalu_data_source int;
    declare v_init_date int;
    declare v_exch_rate decimal(18,12);
    declare v_repl_qty decimal(18,2);
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
    SET v_asset_acco = p_asset_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_curr_qty = p_curr_qty;
    SET v_curr_cost_amt = p_curr_cost_amt;
    SET v_last_price = p_last_price;
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_type = 0;
    SET v_stock_name = " ";
    SET v_invest_type = 0;
    SET v_begin_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_evalu_data_source = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_rate = 0;
    SET v_repl_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @证券类型#=《证券类型-股票》; */
    set v_stock_type=1;

    /* set @证券名称#=@证券代码#; */
    set v_stock_name=v_stock_code;

    /* set @投资类型#=《投资类型-二级市场交易性金融资产》; */
    set v_invest_type=1;

    /* set @期初数量#=0; */
    set v_begin_qty=0;

    /* set @冻结数量#=0; */
    set v_frozen_qty=0;

    /* set @解冻数量#=0; */
    set v_unfroz_qty=0;

    /* set @实现盈亏#=0; */
    set v_realize_pandl=0;

    /* set @利息成本金额#=0; */
    set v_intrst_cost_amt=0;

    /* set @利息收益#=0; */
    set v_intrst_pandl=0;

    /* set @估值数据来源#=《估值数据来源-手工数据》; */
    set v_evalu_data_source=99;

    /* set @初始化日期#=@估值日期#; */
    set v_init_date=v_evalu_date;

    /* set @汇率#=1; */
    set v_exch_rate=1;

    /* set @替代数量#=0; */
    set v_repl_qty=0;
    #[获取表记录变量语句][db_dc.tb_act_stock_quotation][ifnull({证券名称},@证券代码#)][@证券名称#][exchange_no=@市场编号# and {证券代码}=@证券代码#]

    /* select ifnull({证券名称},@证券代码#) into @证券名称# from db_dc.tb_basesedt_stock_code_info where {市场编号}=@市场编号# and {证券代码}=@证券代码# limit 1; */
    select ifnull(stock_name,v_stock_code) into v_stock_name from db_dc.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;

    /* [插入表记录][历史_平台估值_业务数据_估值产品证券持仓表][字段][字段变量][1][@资产账户#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva_his.tb_evadata_pd_secu_posi_his(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco, exch_no, stock_acco, 
        stock_type, stock_code, stock_name, invest_type, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        curr_cost_amt, last_price, exch_rate, realize_pandl, 
        intrst_cost_amt, intrst_pandl, repl_qty, evalu_data_source) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco, v_exch_no, v_stock_acco, 
        v_stock_type, v_stock_code, v_stock_name, v_invest_type, 
        v_begin_qty, v_curr_qty, v_frozen_qty, v_unfroz_qty, 
        v_curr_cost_amt, v_last_price, v_exch_rate, v_realize_pandl, 
        v_intrst_cost_amt, v_intrst_pandl, v_repl_qty, v_evalu_data_source);
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.31.1";
        SET v_error_info =  CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_修改估值产品历史证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_ModiPdHisSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_ModiPdHisSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco varchar(16),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
    IN p_curr_qty decimal(18,2),
    IN p_curr_cost_amt decimal(18,4),
    IN p_last_price decimal(16,9),
    IN p_exch_rate decimal(18,12),
    IN p_evalu_date int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_curr_qty decimal(18,2);
    declare v_curr_cost_amt decimal(18,4);
    declare v_last_price decimal(16,9);
    declare v_exch_rate decimal(18,12);
    declare v_evalu_date int;
    declare v_intrst_pandl decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco = p_asset_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_curr_qty = p_curr_qty;
    SET v_curr_cost_amt = p_curr_cost_amt;
    SET v_last_price = p_last_price;
    SET v_exch_rate = p_exch_rate;
    SET v_evalu_date = p_evalu_date;
    SET v_intrst_pandl = p_intrst_pandl;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][历史_平台估值_业务数据_估值产品证券持仓表][{当前数量} = @当前数量#,{当前成本金额}=@当前成本金额#,{最新价}=@最新价#,{汇率}=@汇率#,{利息收益}=@利息收益#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {资产账户}=@资产账户# and {市场编号}=@市场编号# and {股东代码} =@股东代码# and {证券代码}=@证券代码#][2][@资产账户#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva_his.tb_evadata_pd_secu_posi_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty = v_curr_qty,curr_cost_amt=v_curr_cost_amt,last_price=v_last_price,exch_rate=v_exch_rate,intrst_pandl=v_intrst_pandl where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and asset_acco=v_asset_acco and exch_no=v_exch_no and stock_acco =v_stock_acco and stock_code=v_stock_code;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.32.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户=",v_asset_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_删除估值产品历史证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_DelPdHisSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_DelPdHisSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco varchar(16),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
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
    declare v_asset_acco varchar(16);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
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
    SET v_asset_acco = p_asset_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][历史_平台估值_业务数据_估值产品证券持仓表][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {资产账户}=@资产账户# and {市场编号}=@市场编号# and {股东代码} =@股东代码# and {证券代码}=@证券代码#][3][@资产账户#] */
    delete from db_eva_his.tb_evadata_pd_secu_posi_his 
        where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and asset_acco=v_asset_acco and exch_no=v_exch_no and stock_acco =v_stock_acco and stock_code=v_stock_code;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.33.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户=",v_asset_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_查询估值产品历史证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_QueryPdHisSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_QueryPdHisSecuPosi(
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
    declare v_co_no int;
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco = p_asset_acco;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_平台估值_业务数据_估值产品证券持仓表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@资产账户# =" " or {资产账户}=@资产账户#) and {初始化日期}=@估值日期# and (@市场编号#=0 or {市场编号}=@市场编号#) and (@股东代码#=" " or {股东代码} =@股东代码#) and (@证券代码#= " " or {证券代码}=@证券代码#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco, exch_no, 
        stock_acco, stock_type, stock_code, stock_name, 
        invest_type, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, curr_cost_amt, last_price, exch_rate, 
        realize_pandl, intrst_cost_amt, intrst_pandl, repl_qty, 
        evalu_data_source from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco =" " or asset_acco=v_asset_acco) and init_date=v_evalu_date and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_acco=" " or stock_acco =v_stock_acco) and (v_stock_code= " " or stock_code=v_stock_code);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco, exch_no, 
        stock_acco, stock_type, stock_code, stock_name, 
        invest_type, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, curr_cost_amt, last_price, exch_rate, 
        realize_pandl, intrst_cost_amt, intrst_pandl, repl_qty, 
        evalu_data_source from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco =" " or asset_acco=v_asset_acco) and init_date=v_evalu_date and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_acco=" " or stock_acco =v_stock_acco) and (v_stock_code= " " or stock_code=v_stock_code) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_查询估值产品交易组历史证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_QueryPdExgpHisSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_QueryPdExgpHisSecuPosi(
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
    declare v_co_no int;
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco = p_asset_acco;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_平台估值_业务数据_估值产品交易组证券持仓表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户# =" " or {资产账户}=@资产账户#) and {初始化日期}=@估值日期# and (@市场编号#=0 or {市场编号}=@市场编号#) and (@股东代码#=" " or {股东代码} =@股东代码#) and (@证券代码#= " " or {证券代码}=@证券代码#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco, exch_group_no, 
        exch_no, stock_acco, stock_type, stock_code, 
        stock_name, invest_type, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, curr_cost_amt, last_price, 
        exch_rate, realize_pandl, intrst_cost_amt, intrst_pandl, 
        repl_qty from db_eva_his.tb_evadata_pd_exgp_secu_posi_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco =" " or asset_acco=v_asset_acco) and init_date=v_evalu_date and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_acco=" " or stock_acco =v_stock_acco) and (v_stock_code= " " or stock_code=v_stock_code);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco, exch_group_no, 
        exch_no, stock_acco, stock_type, stock_code, 
        stock_name, invest_type, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, curr_cost_amt, last_price, 
        exch_rate, realize_pandl, intrst_cost_amt, intrst_pandl, 
        repl_qty from db_eva_his.tb_evadata_pd_exgp_secu_posi_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco =" " or asset_acco=v_asset_acco) and init_date=v_evalu_date and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_acco=" " or stock_acco =v_stock_acco) and (v_stock_code= " " or stock_code=v_stock_code) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_更新估值产品历史证券持仓数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_UpdatePdHisSecuPosiAmount;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_UpdatePdHisSecuPosiAmount(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_stock_name varchar(64),
    IN p_curr_qty decimal(18,2),
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
    declare v_stock_name varchar(64);
    declare v_curr_qty decimal(18,2);
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_stock_name = p_stock_name;
    SET v_curr_qty = p_curr_qty;
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_stock_code = " ";

    
    label_pro:BEGIN
    

    /* [更新表记录][历史_平台估值_业务数据_估值产品证券持仓表][{当前数量} = @当前数量#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#  and {证券名称}=@证券名称#][2][@证券代码#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva_his.tb_evadata_pd_secu_posi_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty = v_curr_qty where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date  and stock_name=v_stock_name;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.36.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_查询估值产品历史期货持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_QueryPdHisFupoPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_QueryPdHisFupoPosi(
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_evalu_date int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_lngsht_type int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_平台估值_业务数据_估值产品期货持仓表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@资产账户编号# =0 or {资产账户编号}=@资产账户编号#) and {初始化日期}=@估值日期# and (@市场编号#=0 or {市场编号}=@市场编号#) and (@多空类型#=0 or {多空类型} =@多空类型#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, comb_code, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, pre_settle_price, 
        sett_price, rece_margin, open_amount, realize_pandl, 
        close_pandl, today_posi_flag, evalu_data_source from db_eva_his.tb_evadata_pd_fupo_posi_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no =0 or asset_acco_no=v_asset_acco_no) and init_date=v_evalu_date and (v_exch_no=0 or exch_no=v_exch_no) and (v_lngsht_type=0 or lngsht_type =v_lngsht_type);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, comb_code, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, pre_settle_price, 
        sett_price, rece_margin, open_amount, realize_pandl, 
        close_pandl, today_posi_flag, evalu_data_source from db_eva_his.tb_evadata_pd_fupo_posi_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no =0 or asset_acco_no=v_asset_acco_no) and init_date=v_evalu_date and (v_exch_no=0 or exch_no=v_exch_no) and (v_lngsht_type=0 or lngsht_type =v_lngsht_type) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_更新产品历史持仓产品份额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_UpdatePdHisShare;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_UpdatePdHisShare(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_curr_qty decimal(18,2),
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
    declare v_curr_qty decimal(18,2);
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_mum_pd_no int;
    declare v_eva_unit_nav varchar(32);
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
    SET v_curr_qty = p_curr_qty;
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_mum_pd_no = 0;
    SET v_eva_unit_nav = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][平台估值_基础参数_产品关系表][{母产品编号}][@母产品编号#][{机构编号}=@机构编号# and {产品编号}=@产品编号#] */
    select mum_pd_no into v_mum_pd_no from db_eva.tb_evabasic_pd_relation where co_no=v_co_no and pd_no=v_pd_no limit 1;


    /* [获取表记录变量语句][平台估值_估值汇总_估值产品估值表资产项目表][{估值表单位净值}][@估值表单位净值#][{机构编号}=@机构编号# and {产品编号}=@母产品编号# and {初始化日期}=@估值日期#] */
    select eva_unit_nav into v_eva_unit_nav from db_eva.tb_evatotal_pd_fina_asset_info where co_no=v_co_no and pd_no=v_mum_pd_no and init_date=v_evalu_date limit 1;

    #更新份额

    /* [更新表记录][历史_平台估值_业务数据_估值产品证券持仓表][{当前数量} = @当前数量#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# limit 1][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva_his.tb_evadata_pd_secu_posi_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty = v_curr_qty where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date limit 1;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.38.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* if @估值表单位净值# <> " " then */
    if v_eva_unit_nav <> " " then

    /* [更新表记录][历史_平台估值_业务数据_估值产品证券持仓表][{最新价} = @估值表单位净值#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# limit 1][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva_his.tb_evadata_pd_secu_posi_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, last_price = v_eva_unit_nav where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date limit 1;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.38.2";
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

# 原子_平台估值_业务数据_新增估值产品历史账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_AddPdHisAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_AddPdHisAccoCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_acco_type int,
    IN p_asset_acco varchar(16),
    IN p_crncy_type varchar(3),
    IN p_curr_amt decimal(18,4),
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
    declare v_pd_acco_type int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_intrst_base_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);
    declare v_evalu_data_source int;
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
    SET v_pd_acco_type = p_pd_acco_type;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_curr_amt = p_curr_amt;
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_intrst_base_amt = 0;
    SET v_intrst_cacl_amt = 0;
    SET v_evalu_data_source = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

     /* set @期初金额#=0; */
     set v_begin_amt=0;

     /* set @冻结金额#=0; */
     set v_frozen_amt=0;

     /* set @解冻金额#=0; */
     set v_unfroz_amt=0;

     /* set @利息积数#=0; */
     set v_intrst_base_amt=0;

     /* set @预计利息#=0; */
     set v_intrst_cacl_amt=0;

    /* set @估值数据来源#=《估值数据来源-手工数据》; */
    set v_evalu_data_source=99;

    /* set @初始化日期#=@估值日期#; */
    set v_init_date=v_evalu_date;

    /* [插入表记录][历史_平台估值_业务数据_估值产品账户资金表][字段][字段变量][1][@资产账户#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva_his.tb_evadata_pd_acco_capit_his(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, pd_acco_type, asset_acco, crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        intrst_base_amt, intrst_cacl_amt, evalu_data_source) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_pd_acco_type, v_asset_acco, v_crncy_type, 
        v_begin_amt, v_curr_amt, v_frozen_amt, v_unfroz_amt, 
        v_intrst_base_amt, v_intrst_cacl_amt, v_evalu_data_source);
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.41.1";
        SET v_error_info =  CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_修改估值产品历史账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_ModiPdHisAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_ModiPdHisAccoCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_acco_type int,
    IN p_asset_acco varchar(16),
    IN p_crncy_type varchar(3),
    IN p_curr_amt decimal(18,4),
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
    declare v_pd_acco_type int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
    declare v_evalu_date int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_acco_type = p_pd_acco_type;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_curr_amt = p_curr_amt;
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][历史_平台估值_业务数据_估值产品账户资金表][{当前金额} = @当前金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#  and {资产账户}=@资产账户# and {本币币种}=@本币币种#][2][@资产账户#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva_his.tb_evadata_pd_acco_capit_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = v_curr_amt where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date  and asset_acco=v_asset_acco and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.42.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户=",v_asset_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_删除估值产品历史账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_DelPdHisAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_DelPdHisAccoCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_acco_type int,
    IN p_asset_acco varchar(16),
    IN p_crncy_type varchar(3),
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
    declare v_pd_acco_type int;
    declare v_asset_acco varchar(16);
    declare v_crncy_type varchar(3);
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
    SET v_pd_acco_type = p_pd_acco_type;
    SET v_asset_acco = p_asset_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][历史_平台估值_业务数据_估值产品账户资金表][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {产品账户类型}=@产品账户类型# and {资产账户}=@资产账户# and {本币币种}=@本币币种#][3][@资产账户#] */
    delete from db_eva_his.tb_evadata_pd_acco_capit_his 
        where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and pd_acco_type=v_pd_acco_type and asset_acco=v_asset_acco and crncy_type=v_crncy_type;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.43.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户=",v_asset_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_查询估值产品历史账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_QueryPdHisAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_QueryPdHisAccoCapit(
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_evalu_date int;
    declare v_pd_acco_type int;
    declare v_asset_acco varchar(16);
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
    SET v_pd_acco_type = p_pd_acco_type;
    SET v_asset_acco = p_asset_acco;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_平台估值_业务数据_估值产品账户资金表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and {初始化日期}=@估值日期# and (@产品账户类型# =0 or {产品账户类型}=@产品账户类型#) and (@资产账户# =" " or {资产账户}=@资产账户#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_acco_type, asset_acco, 
        crncy_type, begin_amt, curr_amt, frozen_amt, 
        unfroz_amt, intrst_base_amt, intrst_cacl_amt, evalu_data_source from db_eva_his.tb_evadata_pd_acco_capit_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and init_date=v_evalu_date and (v_pd_acco_type =0 or pd_acco_type=v_pd_acco_type) and (v_asset_acco =" " or asset_acco=v_asset_acco);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_acco_type, asset_acco, 
        crncy_type, begin_amt, curr_amt, frozen_amt, 
        unfroz_amt, intrst_base_amt, intrst_cacl_amt, evalu_data_source from db_eva_his.tb_evadata_pd_acco_capit_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and init_date=v_evalu_date and (v_pd_acco_type =0 or pd_acco_type=v_pd_acco_type) and (v_asset_acco =" " or asset_acco=v_asset_acco) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_查询估值产品交易组历史账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_QueryPdExgpHisAccoCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_QueryPdExgpHisAccoCapit(
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_evalu_date int;
    declare v_pd_acco_type int;
    declare v_asset_acco varchar(16);
    declare v_exch_group_no int;
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
    SET v_pd_acco_type = p_pd_acco_type;
    SET v_asset_acco = p_asset_acco;
    SET v_exch_group_no = p_exch_group_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_平台估值_业务数据_估值产品交易组账户资金表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#)  and {初始化日期}=@估值日期# and (@产品账户类型# =0 or {产品账户类型}=@产品账户类型#) and (@资产账户# =" " or {资产账户}=@资产账户#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, pd_acco_type, 
        asset_acco, crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, intrst_base_amt, intrst_cacl_amt from db_eva_his.tb_evadata_pd_exgp_acco_capit_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no)  and init_date=v_evalu_date and (v_pd_acco_type =0 or pd_acco_type=v_pd_acco_type) and (v_asset_acco =" " or asset_acco=v_asset_acco);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, pd_acco_type, 
        asset_acco, crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, intrst_base_amt, intrst_cacl_amt from db_eva_his.tb_evadata_pd_exgp_acco_capit_his where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no)  and init_date=v_evalu_date and (v_pd_acco_type =0 or pd_acco_type=v_pd_acco_type) and (v_asset_acco =" " or asset_acco=v_asset_acco) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_导入估值产品证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_ImportPdSecuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_ImportPdSecuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pd_name varchar(64);
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pd_name = p_pd_name;
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @初始化日期#=date_format(curdate(),'%Y%m%d'); */
    set v_init_date=date_format(curdate(),'%Y%m%d');

    /* if @估值日期#=@初始化日期# then */
    if v_evalu_date=v_init_date then

    /* [删除表记录][平台估值_业务数据_估值产品证券持仓表][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {估值数据来源}=《估值数据来源-外部数据导入》][3][@机构编号#,@产品编号#] */
    delete from db_eva.tb_evadata_pd_secu_posi 
        where co_no = v_co_no and pd_no = v_pd_no and evalu_data_source=22;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.51.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* insert into ~平台估值_业务数据_估值产品证券持仓表^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{资产账户},{市场编号},{股东代码},{证券类型},{证券代码},{证券名称},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{当前成本金额},{最新价},{实现盈亏},{利息成本金额},{利息收益},{估值数据来源}) select @创建日期#,@创建时间#,@更新日期#,@更新时间#,@估值日期#,@机构编号#,@产品编号#,0,b.{市场编号},0,b.{证券类型},a.{证券代码},a.{证券名称},1,0,{持仓数量},0,0,0,b.{最新价},0,0,0,《估值数据来源-外部数据导入》 from db_dc.tb_zspb_productposition  a ,db_dc.tb_act_stock_quotation b  where a.{产品名称}=@产品名称# and a.{业务日期}=@估值日期# and a.{证券代码} =b.{证券代码} and a.{证券名称}=b.{证券名称}; */
    insert into db_eva.tb_evadata_pd_secu_posi(create_date,create_time,update_date,update_time,init_date,co_no,pd_no,asset_acco,exch_no,stock_acco,stock_type,stock_code,stock_name,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,curr_cost_amt,last_price,realize_pandl,intrst_cost_amt,intrst_pandl,evalu_data_source) select v_create_date,v_create_time,v_update_date,v_update_time,v_evalu_date,v_co_no,v_pd_no,0,b.exch_no,0,b.stock_type,a.stock_code,a.stock_name,1,0,posi_qty,0,0,0,b.last_price,0,0,0,22 from db_dc.tb_zspb_productposition  a ,db_dc.tb_act_stock_quotation b  where a.pd_name=v_pd_name and a.busin_date=v_evalu_date and a.stock_code =b.stock_code and a.stock_name=b.stock_name;

    /* insert into ~平台估值_业务数据_估值产品证券持仓表^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{资产账户},{市场编号},{股东代码},{证券类型},{证券代码},{证券名称},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{当前成本金额},{最新价},{实现盈亏},{利息成本金额},{利息收益},{估值数据来源}) select @创建日期#,@创建时间#,@更新日期#,@更新时间#,@估值日期#,@机构编号#,@产品编号#,0,b.{市场编号},0,《证券类型-股票》,a.{证券代码},a.{证券名称},1,0,{持仓数量},0,0,0,b.{最新价},0,{持仓市值},0,《估值数据来源-外部数据导入》 from db_dc.tb_zspb_productposition  a ,db_dc.tb_basedt_hk_stock_quot b  where  a.{业务日期}=@估值日期# and a.{证券代码} =b.{港股代码}; */
    insert into db_eva.tb_evadata_pd_secu_posi(create_date,create_time,update_date,update_time,init_date,co_no,pd_no,asset_acco,exch_no,stock_acco,stock_type,stock_code,stock_name,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,curr_cost_amt,last_price,realize_pandl,intrst_cost_amt,intrst_pandl,evalu_data_source) select v_create_date,v_create_time,v_update_date,v_update_time,v_evalu_date,v_co_no,v_pd_no,0,b.exch_no,0,1,a.stock_code,a.stock_name,1,0,posi_qty,0,0,0,b.last_price,0,posi_market_value,0,22 from db_dc.tb_zspb_productposition  a ,db_dc.tb_basedt_hk_stock_quot b  where  a.busin_date=v_evalu_date and a.stock_code =b.hk_stock_code;
    else

    /* [删除表记录][历史_平台估值_业务数据_估值产品证券持仓表][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {初始化日期}=@估值日期# and {估值数据来源}=《估值数据来源-外部数据导入》][3][@机构编号#,@产品编号#] */
    delete from db_eva_his.tb_evadata_pd_secu_posi_his 
        where co_no = v_co_no and pd_no = v_pd_no and init_date=v_evalu_date and evalu_data_source=22;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.51.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* insert into ~历史_平台估值_业务数据_估值产品证券持仓表^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{资产账户},{市场编号},{股东代码},{证券类型},{证券代码},{证券名称},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{当前成本金额},{最新价},{实现盈亏},{利息成本金额},{利息收益},{估值数据来源}) select @创建日期#,@创建时间#,@更新日期#,@更新时间#,@估值日期#,@机构编号#,@产品编号#,0,b.{市场编号},0,b.{证券类型},a.{证券代码},a.{证券名称},1,0,{持仓数量},0,0,0,b.{最新价},0,0,0,《估值数据来源-外部数据导入》 from db_dc.tb_zspb_productposition  a ,db_dc.tb_act_stock_quotation b  where a.{产品名称}=@产品名称# and a.{业务日期}=@估值日期# and a.{证券代码} =b.{证券代码} and a.{证券名称}=b.{证券名称}; */
    insert into db_eva_his.tb_evadata_pd_secu_posi_his(create_date,create_time,update_date,update_time,init_date,co_no,pd_no,asset_acco,exch_no,stock_acco,stock_type,stock_code,stock_name,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,curr_cost_amt,last_price,realize_pandl,intrst_cost_amt,intrst_pandl,evalu_data_source) select v_create_date,v_create_time,v_update_date,v_update_time,v_evalu_date,v_co_no,v_pd_no,0,b.exch_no,0,b.stock_type,a.stock_code,a.stock_name,1,0,posi_qty,0,0,0,b.last_price,0,0,0,22 from db_dc.tb_zspb_productposition  a ,db_dc.tb_act_stock_quotation b  where a.pd_name=v_pd_name and a.busin_date=v_evalu_date and a.stock_code =b.stock_code and a.stock_name=b.stock_name;

    /* insert into ~历史_平台估值_业务数据_估值产品证券持仓表^({创建日期},{创建时间},{更新日期},{更新时间},{初始化日期},{机构编号},{产品编号},{资产账户},{市场编号},{股东代码},{证券类型},{证券代码},{证券名称},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{当前成本金额},{最新价},{实现盈亏},{利息成本金额},{利息收益},{估值数据来源}) select @创建日期#,@创建时间#,@更新日期#,@更新时间#,@估值日期#,@机构编号#,@产品编号#,0,b.{市场编号},0,《证券类型-股票》,a.{证券代码},a.{证券名称},1,0,{持仓数量},0,0,0,b.{最新价},0,{持仓市值},0,《估值数据来源-外部数据导入》 from db_dc.tb_zspb_productposition  a ,db_dc.tb_basedt_hk_stock_quot b  where  a.{业务日期}=@估值日期# and a.{证券代码} =b.{港股代码}; */
    insert into db_eva_his.tb_evadata_pd_secu_posi_his(create_date,create_time,update_date,update_time,init_date,co_no,pd_no,asset_acco,exch_no,stock_acco,stock_type,stock_code,stock_name,invest_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,curr_cost_amt,last_price,realize_pandl,intrst_cost_amt,intrst_pandl,evalu_data_source) select v_create_date,v_create_time,v_update_date,v_update_time,v_evalu_date,v_co_no,v_pd_no,0,b.exch_no,0,1,a.stock_code,a.stock_name,1,0,posi_qty,0,0,0,b.last_price,0,posi_market_value,0,22 from db_dc.tb_zspb_productposition  a ,db_dc.tb_basedt_hk_stock_quot b  where  a.busin_date=v_evalu_date and a.stock_code =b.hk_stock_code;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_新增估值产品银行流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_AddPdBankJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_AddPdBankJour(
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_occur_dir int;
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
    SET v_asset_acco = p_asset_acco;
    SET v_occur_dir = p_occur_dir;
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
    

    /* [插入表记录][平台估值_业务数据_估值产品银行流水表][字段][字段变量][1][@资产账户#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evadata_product_bank_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco, occur_dir, occur_amt, 
        remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco, v_occur_dir, v_occur_amt, 
        v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.61.1";
        SET v_error_info =  CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_修改估值产品银行流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_ModiPdBankJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_ModiPdBankJour(
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_occur_dir int;
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
    SET v_row_id = p_row_id;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco = p_asset_acco;
    SET v_occur_dir = p_occur_dir;
    SET v_occur_amt = p_occur_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][平台估值_业务数据_估值产品银行流水表][{初始化日期}=@初始化日期#,{变动方向}=@变动方向#,{变动金额} = @变动金额#,{备注信息}=@备注信息#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户}=@资产账户# and {记录序号}=@记录序号#][2][@资产账户#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evadata_product_bank_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_init_date,occur_dir=v_occur_dir,occur_amt = v_occur_amt,remark_info=v_remark_info where co_no=v_co_no and pd_no=v_pd_no and asset_acco=v_asset_acco and row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.62.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户=",v_asset_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_删除估值产品银行流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_DelPdBankJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_DelPdBankJour(
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco varchar(16);
    declare v_occur_dir int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco = p_asset_acco;
    SET v_occur_dir = p_occur_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_业务数据_估值产品银行流水表][{机构编号}=@机构编号# and {产品编号}=@产品编号#  and {资产账户}=@资产账户# and {变动方向}=@变动方向# and {记录序号}=@记录序号#][3][@资产账户#] */
    delete from db_eva.tb_evadata_product_bank_jour 
        where co_no=v_co_no and pd_no=v_pd_no  and asset_acco=v_asset_acco and occur_dir=v_occur_dir and row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.63.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户=",v_asset_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_查询估值产品银行流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_QueryPdBankJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_QueryPdBankJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco varchar(16),
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
    declare v_asset_acco varchar(16);
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
    SET v_asset_acco = p_asset_acco;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][平台估值_业务数据_估值产品银行流水表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@资产账户# =" " or {资产账户}=@资产账户#) and {初始化日期} between @开始日期# and @结束日期#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco, occur_dir, 
        occur_amt, remark_info from db_eva.tb_evadata_product_bank_jour where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco =" " or asset_acco=v_asset_acco) and init_date between v_begin_date and v_end_date;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco, occur_dir, 
        occur_amt, remark_info from db_eva.tb_evadata_product_bank_jour where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco =" " or asset_acco=v_asset_acco) and init_date between v_begin_date and v_end_date limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_更新估值产品汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_updatePdExRate;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_updatePdExRate(
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
    declare v_last_init_date int;
    declare v_hk_asset_calc_rate int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_last_init_date = date_format(curdate(),'%Y%m%d');
    SET v_hk_asset_calc_rate = 0;

    
    label_pro:BEGIN
    

    /* select {初始化日期} into @上日初始化日期# from db_dc.tb_base_hk_exch_rate where {初始化日期}<=@估值日期# order by {初始化日期} desc limit 1; */
    select init_date into v_last_init_date from db_dc.tb_base_hk_exch_rate where init_date<=v_evalu_date order by init_date desc limit 1;

    /* [获取表记录变量语句][平台估值_基础参数_估值产品基本信息表][{港股通资产计算采用汇率}][@港股通资产计算采用汇率#][{机构编号}=@机构编号# and {产品编号}=@产品编号#] */
    select hk_asset_calc_rate into v_hk_asset_calc_rate from db_eva.tb_evabasic_product_info where co_no=v_co_no and pd_no=v_pd_no limit 1;


    /* if @港股通资产计算采用汇率# = 《港股通资产计算采用汇率-买卖结算汇率均值》 then */
    if v_hk_asset_calc_rate = 0 then

    /* update ~历史_平台估值_业务数据_估值产品证券持仓表^ a,db_dc.tb_base_hk_exch_rate b set a.{汇率} = (b.{买入结算汇率}+b.{卖出结算汇率})/2 where a.{市场编号} = b.{市场编号}  and a.{机构编号} =@机构编号# and a.{产品编号} = @产品编号#  and a.{初始化日期}=@估值日期# and b.{初始化日期}=@上日初始化日期#; */
    update db_eva_his.tb_evadata_pd_secu_posi_his a,db_dc.tb_base_hk_exch_rate b set a.exch_rate = (b.settle_buy_rate+b.settle_sell_rate)/2 where a.exch_no = b.exch_no  and a.co_no =v_co_no and a.pd_no = v_pd_no  and a.init_date=v_evalu_date and b.init_date=v_last_init_date;

    /* elseif   @港股通资产计算采用汇率# = 《港股通资产计算采用汇率-中国人行汇率》 then */
    elseif   v_hk_asset_calc_rate = 3 then

    /* update ~历史_平台估值_业务数据_估值产品证券持仓表^ a,db_dc.tb_base_hk_exch_rate b set a.{汇率} = b.{中国人行汇率} where a.{市场编号} = b.{市场编号}  and a.{机构编号} =@机构编号# and a.{产品编号} = @产品编号#  and a.{初始化日期}=@估值日期# and b.{初始化日期}=@上日初始化日期#; */
    update db_eva_his.tb_evadata_pd_secu_posi_his a,db_dc.tb_base_hk_exch_rate b set a.exch_rate = b.pboc_rate where a.exch_no = b.exch_no  and a.co_no =v_co_no and a.pd_no = v_pd_no  and a.init_date=v_evalu_date and b.init_date=v_last_init_date;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_新增估值产品场外交易
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_AddPdTransOut;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_AddPdTransOut(
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][平台估值_业务数据_估值产品场外交易表][字段][字段变量][1][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evadata_pd_transout(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_no, stock_type, stock_code, 
        order_dir, strike_qty, strike_price, expire_date, 
        remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_no, v_stock_type, v_stock_code, 
        v_order_dir, v_strike_qty, v_strike_price, v_expire_date, 
        v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.81.1";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_修改估值产品场外交易
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_ModiPdTransOut;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_ModiPdTransOut(
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][平台估值_业务数据_估值产品场外交易表][{初始化日期}=@初始化日期#,{订单方向}=@订单方向#,{证券类型}=@证券类型#,{证券代码}=@证券代码#,{成交价格} = @成交价格#,{成交数量} = @成交数量#,{到期日期}=@到期日期#,{备注信息}=@备注信息#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {记录序号}=@记录序号#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evadata_pd_transout set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_init_date,order_dir=v_order_dir,stock_type=v_stock_type,stock_code=v_stock_code,strike_price = v_strike_price,strike_qty = v_strike_qty,expire_date=v_expire_date,remark_info=v_remark_info where co_no=v_co_no and pd_no=v_pd_no and row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.82.2";
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

# 原子_平台估值_业务数据_删除估值产品场外交易
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_DelPdTransOut;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_DelPdTransOut(
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
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_row_id = p_row_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][平台估值_业务数据_估值产品场外交易表][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@初始化日期# and {记录序号}=@记录序号#][3][@产品编号#] */
    delete from db_eva.tb_evadata_pd_transout 
        where co_no=v_co_no and pd_no=v_pd_no and init_date=v_init_date and row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.83.3";
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

# 原子_平台估值_业务数据_查询估值产品场外交易
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_QueryPdTransOut;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_QueryPdTransOut(
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
    

    /* [获取表记录][平台估值_业务数据_估值产品场外交易表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#)  and {初始化日期} between @开始日期# and @结束日期#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_no, stock_type, 
        stock_code, order_dir, strike_qty, strike_price, 
        expire_date, remark_info from db_eva.tb_evadata_pd_transout where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no)  and init_date between v_begin_date and v_end_date;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_no, stock_type, 
        stock_code, order_dir, strike_qty, strike_price, 
        expire_date, remark_info from db_eva.tb_evadata_pd_transout where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no)  and init_date between v_begin_date and v_end_date limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_更新估值产品持仓根据场外交易
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_updatePdPosiByTransOut;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_updatePdPosiByTransOut(
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
    declare v_init_date int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_expire_date int;
    declare v_remark_info varchar(255);
    declare v_stat_days int;
    declare v_involved_days int;
    declare v_asset_acco varchar(16);
    declare v_stock_acco varchar(16);
    declare v_curr_cost_amt decimal(18,4);
    declare v_last_price decimal(16,9);
    declare v_stock_name varchar(64);
    declare v_invest_type int;
    declare v_begin_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_evalu_data_source int;
    declare v_exch_rate decimal(18,12);
    declare v_repl_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_stock_code = " ";
    SET v_order_dir = 0;
    SET v_strike_qty = 0;
    SET v_strike_price = 0;
    SET v_expire_date = date_format(curdate(),'%Y%m%d');
    SET v_remark_info = " ";
    SET v_stat_days = 0;
    SET v_involved_days = 0;
    SET v_asset_acco = " ";
    SET v_stock_acco = " ";
    SET v_curr_cost_amt = 0;
    SET v_last_price = 0;
    SET v_stock_name = " ";
    SET v_invest_type = 0;
    SET v_begin_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_curr_qty = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_evalu_data_source = 0;
    SET v_exch_rate = 0;
    SET v_repl_qty = 0;

    
    label_pro:BEGIN
    

    /* [声明游标][平台估值_业务数据_估值产品场外交易表][字段][{机构编号}=@机构编号# and {产品编号}=@产品编号# and @估值日期# between {初始化日期} and {到期日期}][cursor_eva_pd_transout] */
    cursor_eva_pd_transout:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_eva_pd_transout CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_no, stock_type, 
        stock_code, order_dir, strike_qty, strike_price, 
        expire_date, remark_info 
        from db_eva.tb_evadata_pd_transout 
        where co_no=v_co_no and pd_no=v_pd_no and v_evalu_date between init_date and expire_date;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_eva_pd_transout][loop_eva_pd_transout] */
    open cursor_eva_pd_transout;
    loop_eva_pd_transout: LOOP
    fetch cursor_eva_pd_transout into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_no, v_stock_type, 
        v_stock_code, v_order_dir, v_strike_qty, v_strike_price, 
        v_expire_date, v_remark_info;
        IF v_cursor_done THEN
            LEAVE loop_eva_pd_transout;
        END IF;


    /* 调用【原子_平台估值_业务数据_计算到期天数】*/
    call db_eva.pra_evadata_calcArriveRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_expire_date,
        v_evalu_date,
        v_error_code,
        v_error_info,
        v_stat_days,
        v_involved_days);
    if v_error_code = "1" then
        SET v_error_code = "evaA.2.85.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_平台估值_业务数据_计算到期天数出现错误！',v_mysql_message);
        end if;
        close cursor_eva_pd_transout;
        leave label_pro;
    elseif v_error_code <> "0" then
        close cursor_eva_pd_transout;
        leave label_pro;
    end if;


    /* set @资产账户#=@初始化日期#; */
    set v_asset_acco=v_init_date;

    /* set @股东代码#=' '; */
    set v_stock_acco=' ';

    /* set @当前成本金额#=0; */
    set v_curr_cost_amt=0;

    /* set @最新价#=0; */
    set v_last_price=0;

    /* set @证券名称#=@证券代码#; */
    set v_stock_name=v_stock_code;

    /* set @投资类型#=《投资类型-非二级市场交易性金融资产》; */
    set v_invest_type=2;

    /* set @期初数量#=0; */
    set v_begin_qty=0;

    /* set @冻结数量#=0; */
    set v_frozen_qty=0;

    /* set @解冻数量#=0; */
    set v_unfroz_qty=0;

    /* set @当前数量#=@成交数量#; */
    set v_curr_qty=v_strike_qty;

    /* set @实现盈亏#=0; */
    set v_realize_pandl=0;

    /* set @利息成本金额#=@成交价格#; */
    set v_intrst_cost_amt=v_strike_price;

    /* set @利息收益#=@涉及天数#/@统计天数#; */
    set v_intrst_pandl=v_involved_days/v_stat_days;

    /* set @估值数据来源#=《估值数据来源-外部成交记录》; */
    set v_evalu_data_source=3;

    /* set @汇率#=1; */
    set v_exch_rate=1;

    /* set @替代数量#=0; */
    set v_repl_qty=0;

    /* set @初始化日期#=@估值日期#; */
    set v_init_date=v_evalu_date;
    #[获取表记录变量语句][db_dc.tb_act_stock_quotation][ifnull({证券名称},@证券代码#)][@证券名称#][exchange_no=@市场编号# and {证券代码}=@证券代码#]

    /* select ifnull({证券名称},@证券代码#) into @证券名称# from db_dc.tb_basesedt_stock_code_info where {市场编号}=@市场编号# and {证券代码}=@证券代码# limit 1; */
    select ifnull(stock_name,v_stock_code) into v_stock_name from db_dc.tb_basesedt_stock_code_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;

    /* [插入表记录][平台估值_业务数据_估值产品证券持仓表][字段][字段变量][1][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evadata_pd_secu_posi(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco, exch_no, stock_acco, 
        stock_type, stock_code, stock_name, invest_type, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        curr_cost_amt, last_price, exch_rate, realize_pandl, 
        intrst_cost_amt, intrst_pandl, repl_qty, evalu_data_source) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco, v_exch_no, v_stock_acco, 
        v_stock_type, v_stock_code, v_stock_name, v_invest_type, 
        v_begin_qty, v_curr_qty, v_frozen_qty, v_unfroz_qty, 
        v_curr_cost_amt, v_last_price, v_exch_rate, v_realize_pandl, 
        v_intrst_cost_amt, v_intrst_pandl, v_repl_qty, v_evalu_data_source);
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.85.1";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        close cursor_eva_pd_transout;
        leave label_pro;
    end if;


    /* [更新表记录][平台估值_业务数据_估值产品证券持仓表][{当前数量}={当前数量}-@成交数量#][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {证券类型}=@证券类型# and {证券代码}=@证券代码# and {投资类型}=0][2][@资产账户#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evadata_pd_secu_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty-v_strike_qty where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and stock_type=v_stock_type and stock_code=v_stock_code and invest_type=0;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.85.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户=",v_asset_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户=",v_asset_acco);
        end if;
        close cursor_eva_pd_transout;
        leave label_pro;
    end if;


    /* [关闭游标][cursor_eva_pd_transout] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_eva_pd_transout;
    end cursor_eva_pd_transout;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_计算到期天数
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_calcArriveRate;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_calcArriveRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_expire_date int,
    IN p_evalu_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stat_days int,
    OUT p_involved_days int
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
    declare v_expire_date int;
    declare v_evalu_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stat_days int;
    declare v_involved_days int;
    declare v_no_exch_date_str varchar(2048);
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
    SET v_init_date = p_init_date;
    SET v_expire_date = p_expire_date;
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stat_days = 0;
    SET v_involved_days = 0;
    SET v_no_exch_date_str = " ";
    SET v_evalu_deal_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* select {非交易日期串} into @非交易日期串# from db_dc.tb_base_sys_info; */
    select no_exch_date_str into v_no_exch_date_str from db_dc.tb_base_sys_info;

    /* set @统计天数#=0; */
    set v_stat_days=0;

    /* set @估值处理日期#=@初始化日期#; */
    set v_evalu_deal_date=v_init_date;

    /* WHILE @估值处理日期# <= @到期日期# DO */
    WHILE v_evalu_deal_date <= v_expire_date DO

       /* IF (DAYOFWEEK(@估值处理日期#)>1 and DAYOFWEEK(@估值处理日期#)<7) then */
       IF (DAYOFWEEK(v_evalu_deal_date)>1 and DAYOFWEEK(v_evalu_deal_date)<7) then

         /* IF (instr(@非交易日期串#,@估值处理日期#)=0) then */
         IF (instr(v_no_exch_date_str,v_evalu_deal_date)=0) then

         /* SET @统计天数#=@统计天数#+1; */
         SET v_stat_days=v_stat_days+1;
         end if;
      end if;

      /* SET @估值处理日期#=DATE_FORMAT(DATE_ADD(@估值处理日期#, INTERVAL 1 DAY),'%Y%m%d'); */
      SET v_evalu_deal_date=DATE_FORMAT(DATE_ADD(v_evalu_deal_date, INTERVAL 1 DAY),'%Y%m%d');
    END WHILE;

    /* set @涉及天数#=0; */
    set v_involved_days=0;

    /* SET @估值处理日期#=@初始化日期#; */
    SET v_evalu_deal_date=v_init_date;

    /* WHILE @估值处理日期# <= @估值日期# DO */
    WHILE v_evalu_deal_date <= v_evalu_date DO

       /* IF (DAYOFWEEK(@估值处理日期#)>1 and DAYOFWEEK(@估值处理日期#)<7) then */
       IF (DAYOFWEEK(v_evalu_deal_date)>1 and DAYOFWEEK(v_evalu_deal_date)<7) then

         /* IF (instr(@非交易日期串#,@估值处理日期#)=0) then */
         IF (instr(v_no_exch_date_str,v_evalu_deal_date)=0) then

         /* SET @涉及天数#=@涉及天数#+1; */
         SET v_involved_days=v_involved_days+1;
         end if;
       end if;

      /* SET @估值处理日期#=DATE_FORMAT(DATE_ADD(@估值处理日期#, INTERVAL 1 DAY),'%Y%m%d'); */
      SET v_evalu_deal_date=DATE_FORMAT(DATE_ADD(v_evalu_deal_date, INTERVAL 1 DAY),'%Y%m%d');
    END WHILE;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stat_days = v_stat_days;
    SET p_involved_days = v_involved_days;

END;;


DELIMITER ;;
use db_eva;;

# 原子_平台估值_业务数据_计算估值产品场外交易公允价值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_calcPdTransOutValue;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_calcPdTransOutValue(
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
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_pd_no = p_pd_no;
    SET v_evalu_date = p_evalu_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [更新表记录][平台估值_业务数据_估值产品证券持仓表][{最新价}=round({利息成本金额}+({最新价}-{利息成本金额})*{利息收益},2)][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#  and {投资类型}=《投资类型-非二级市场交易性金融资产》 and {估值数据来源}=《估值数据来源-外部成交记录》 and {最新价}>{利息成本金额}][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_eva.tb_evadata_pd_secu_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, last_price=round(intrst_cost_amt+(last_price-intrst_cost_amt)*intrst_pandl,2) where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no  and invest_type=2 and evalu_data_source=3 and last_price>intrst_cost_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.87.2";
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

# 原子_平台估值_业务数据_同步产品份额变动
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_syncPdShareJour;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_syncPdShareJour(
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
    

    /* [删除表记录][平台估值_基础参数_估值产品份额流水表][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期# and {备注信息}='TA自动同步'][3][@产品编号#] */
    delete from db_eva.tb_evabasic_product_share_jour 
        where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date and remark_info='TA自动同步';
    if v_error_code = 1 then
                
        SET v_error_code = "evaA.2.91.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [读取插入表记录][平台估值_基础参数_估值产品份额流水表][平台估值_业务数据_投资人份额流水表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{变动方向},{份额操作},{变动份额},{变动金额},{到账日期},{备注信息}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,{确认日期},{机构编号},{产品编号},{变动方向},{变动方向},abs({变动份额}),{确认金额},DATE_FORMAT(DATE_ADD({确认日期}, INTERVAL 3 DAY),'%Y%m%d'),'TA自动同步'][{确认日期}=@估值日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号#][4][@产品编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_eva.tb_evabasic_product_share_jour (
        create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,occur_dir,share_oper,occur_share,occur_amt,arrive_date,remark_info) 
        select 
        v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,confirm_date,co_no,pd_no,occur_dir,occur_dir,abs(occur_share),confirm_apply,DATE_FORMAT(DATE_ADD(confirm_date, INTERVAL 3 DAY),'%Y%m%d'),'TA自动同步' 
        from db_eva.tb_evadata_invster_holding_jour 
        where confirm_date=v_evalu_date and co_no=v_co_no and pd_no=v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "evaA.2.91.4";
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

# 原子_平台估值_业务数据_计算子基金持仓变动
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_evadata_calcChildPdShare;;
DELIMITER ;;
CREATE PROCEDURE pra_evadata_calcChildPdShare(
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
    declare v_curr_qty decimal(18,2);
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
    SET v_curr_qty = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @系统日期#=date_format(curdate(),'%Y%m%d'); */
    set v_sys_date=date_format(curdate(),'%Y%m%d');

    /* [获取表记录变量语句][历史_平台估值_业务数据_估值产品证券持仓表][ifnull({当前数量},0)][@当前数量#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}<@估值日期# order by {初始化日期} desc][4][@产品编号#] */
    select ifnull(curr_qty,0) into v_curr_qty from db_eva_his.tb_evadata_pd_secu_posi_his where co_no=v_co_no and pd_no=v_pd_no and init_date<v_evalu_date order by init_date desc limit 1;


    /* if @估值日期#=@系统日期# then */
    if v_evalu_date=v_sys_date then
        #更新当前份额

        /* [更新表记录][平台估值_业务数据_估值产品证券持仓表][{当前数量} = @当前数量#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#][2][@产品编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_eva.tb_evadata_pd_secu_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty = v_curr_qty where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date;
        if v_error_code = "1" then
                    
            SET v_error_code = "evaA.2.92.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no);
            end if;
            leave label_pro;
        end if;

    else

        /* [更新表记录][历史_平台估值_业务数据_估值产品证券持仓表][{当前数量} = @当前数量#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {初始化日期}=@估值日期#][2][@产品编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_eva_his.tb_evadata_pd_secu_posi_his set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty = v_curr_qty where co_no=v_co_no and pd_no=v_pd_no and init_date=v_evalu_date;
        if v_error_code = "1" then
                    
            SET v_error_code = "evaA.2.92.2";
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


