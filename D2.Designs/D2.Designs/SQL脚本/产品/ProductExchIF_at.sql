DELIMITER ;;
use db_prod;;

# 原子_产品_交易接口_检查指令产品账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdexif_CheckApprProdAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdexif_CheckApprProdAccoInfo(
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
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_comm_dir int,
    IN p_co_busi_config_str varchar(64),
    IN p_co_comm_appr_oper int,
    IN p_busi_config_str varchar(64),
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_split_fee_typr_str varchar(64),
    OUT p_comm_appr_oper int,
    OUT p_exgp_avail_amt decimal(18,4),
    OUT p_asac_avail_amt decimal(18,4),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exter_comm_flag int,
    OUT p_market_price_ratio decimal(18,12),
    OUT p_comm_no_limit_price_ratio decimal(18,12),
    OUT p_cost_calc_type int,
    OUT p_opor_no_str1 varchar(2048),
    OUT p_opor_no_str2 varchar(2048),
    OUT p_opor_no_str3 varchar(2048),
    OUT p_fina_limit_max decimal(18,4),
    OUT p_loan_limit_max decimal(18,4),
    OUT p_asset_acco_type int,
    OUT p_sell_auto_back_debt int
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
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_comm_dir int;
    declare v_co_busi_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_split_fee_typr_str varchar(64);
    declare v_comm_appr_oper int;
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exter_comm_flag int;
    declare v_market_price_ratio decimal(18,12);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_cost_calc_type int;
    declare v_opor_no_str1 varchar(2048);
    declare v_opor_no_str2 varchar(2048);
    declare v_opor_no_str3 varchar(2048);
    declare v_fina_limit_max decimal(18,4);
    declare v_loan_limit_max decimal(18,4);
    declare v_asset_acco_type int;
    declare v_sell_auto_back_debt int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_pd_busi_config_str varchar(64);
    declare v_forbid_order_dir varchar(64);
    declare v_pd_status varchar(2);
    declare v_asset_acco_status varchar(2);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_comm_dir = p_comm_dir;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_co_comm_appr_oper = p_co_comm_appr_oper;
    SET v_busi_config_str = p_busi_config_str;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_split_fee_typr_str = " ";
    SET v_comm_appr_oper = 0;
    SET v_exgp_avail_amt = 0;
    SET v_asac_avail_amt = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exter_comm_flag = 0;
    SET v_market_price_ratio = 0;
    SET v_comm_no_limit_price_ratio = 0;
    SET v_cost_calc_type = 0;
    SET v_opor_no_str1 = " ";
    SET v_opor_no_str2 = " ";
    SET v_opor_no_str3 = " ";
    SET v_fina_limit_max = 0;
    SET v_loan_limit_max = 0;
    SET v_asset_acco_type = 0;
    SET v_sell_auto_back_debt = 0;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_pd_busi_config_str = " ";
    SET v_forbid_order_dir = " ";
    SET v_pd_status = "0";
    SET v_asset_acco_status = "0";
    SET v_busi_limit_str = " ";

    
    label_pro:BEGIN
    

    /* set @交易组业务控制配置串# = @业务控制配置串#; */
    set v_exgp_busi_config_str = v_busi_config_str;

    /* [获取表记录变量][产品_账户_产品限制信息表][{成本计算方式},{允许投资市场},{允许操作证券类型},{业务控制配置串},{指令审批操作员},{市价冻结浮动比例},{指令不限价浮动比例},{禁止订单方向},{产品状态}][@成本计算方式#,@允许投资市场#,@允许操作证券类型#,@产品业务控制配置串#,@指令审批操作员#,@市价冻结浮动比例#,@指令不限价浮动比例#,@禁止订单方向#,@产品状态#][{产品编号}=@产品编号#][4][@产品编号#] */
    select cost_calc_type,allow_exch,allow_stock_type,busi_config_str,comm_appr_oper,market_price_ratio,comm_no_limit_price_ratio,forbid_order_dir,pd_status into v_cost_calc_type,v_allow_exch,v_allow_stock_type,v_pd_busi_config_str,v_comm_appr_oper,v_market_price_ratio,v_comm_no_limit_price_ratio,v_forbid_order_dir,v_pd_status from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.8.11.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #根据产品业务控制配置串，第5位处理，是否重置指令审批操作员

    /* if substring(@产品业务控制配置串#, 5, 1) = 《指令审批设置-不设置》 or (substring(@产品业务控制配置串#, 5, 1) = 《指令审批设置-自动审批》 and @指令审批操作员# = 0) then */
    if substring(v_pd_busi_config_str, 5, 1) = 3 or (substring(v_pd_busi_config_str, 5, 1) = 1 and v_comm_appr_oper = 0) then

        /* set @指令审批操作员# = @机构指令审批操作员#; */
        set v_comm_appr_oper = v_co_comm_appr_oper;
    end if;
    #产品状态检查

    /* [检查报错返回][@产品状态# <> 《产品状态-正常》][105][@产品编号#] */
    if v_pd_status <> "1" then
        
        SET v_error_code = "prodA.8.11.105";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #禁止订单方向检查

    /* if @禁止订单方向#<>" " then */
    if v_forbid_order_dir<>" " then

        /* [检查报错返回][instr(concat(";",@禁止订单方向#,";"),concat(";",@指令方向#,";"))>0][639][@指令方向#] */
        if instr(concat(";",v_forbid_order_dir,";"),concat(";",v_comm_dir,";"))>0 then
            
            SET v_error_code = "prodA.8.11.639";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令方向=",v_comm_dir),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令方向=",v_comm_dir);
            end if;
            leave label_pro;
        end if;

    end if;
    #检查产品级业务限制
    #如果传入的市场编号有值，检查是否可操作

    /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][106][@市场编号#,@允许投资市场#] */
    if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
        
        SET v_error_code = "prodA.8.11.106";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
        end if;
        leave label_pro;
    end if;

    #如果传入的证券类型有值，检查是否可操作

    /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][107][@证券类型#,@允许操作证券类型#] */
    if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
        
        SET v_error_code = "prodA.8.11.107";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
        end if;
        leave label_pro;
    end if;

    #如果交易组编号不为0，则处理交易组相关数据

    /* if @交易组编号#<>0 then */
    if v_exch_group_no<>0 then

        /* 调用【原子_产品_账户_获取交易组业务控制配置串】*/
        call db_prod.pra_pdacco_GetExgpConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_exgp_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取交易组业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @交易组业务控制配置串# = @业务控制配置串#; */
        set v_exgp_busi_config_str = v_busi_config_str;
    end if;
    #如果资产账户编号不为0，则处理资产账户相关数据

    /* if @资产账户编号#<>0 then */
    if v_asset_acco_no<>0 then

        /* set @资产账户可用金额# = 0; */
        set v_asac_avail_amt = 0;
        #获取资产账户编号和资产账户状态

        /* [获取表记录变量][产品_账户_资产账户信息表][{资产账户状态},{允许投资市场},{允许操作证券类型},{业务限制串},{业务控制配置串},{体外指令标志},{资产账户类型}][@资产账户状态#,@允许投资市场#,@允许操作证券类型#,@业务限制串#,@资产账户业务控制配置串#,@体外指令标志#,@资产账户类型#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select asset_acco_status,allow_exch,allow_stock_type,busi_limit_str,busi_config_str,exter_comm_flag,asset_acco_type into v_asset_acco_status,v_allow_exch,v_allow_stock_type,v_busi_limit_str,v_asac_busi_config_str,v_exter_comm_flag,v_asset_acco_type from db_prod.tb_pdacco_asset_acco where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.11.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;

        #资产账户状态检查

        /* [检查报错返回][@资产账户状态# <> 《资产账户状态-正常》][125][@资产账户状态#] */
        if v_asset_acco_status <> "1" then
            
            SET v_error_code = "prodA.8.11.125";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户状态=",v_asset_acco_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户状态=",v_asset_acco_status);
            end if;
            leave label_pro;
        end if;

        #如果传入的市场编号有值，检查是否可操作

        /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][126][@市场编号#,@允许投资市场#] */
        if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
            
            SET v_error_code = "prodA.8.11.126";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
            end if;
            leave label_pro;
        end if;

        #如果传入的证券类型有值，检查是否可操作

        /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][127][@证券类型#,@允许操作证券类型#] */
        if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
            
            SET v_error_code = "prodA.8.11.127";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
            end if;
            leave label_pro;
        end if;

        #如果传入的指令方向有值，检查是否有相应业务限制

        /* if @指令方向# = 《指令方向-新股申购》 then */
        if v_comm_dir = 11 then

            /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制打新》) > 0][128][@业务限制串#] */
            if instr(v_busi_limit_str, 1) > 0 then
                
                SET v_error_code = "prodA.8.11.128";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务限制串=",v_busi_limit_str);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if @指令方向# = 《指令方向-融资回购》 then */
        if v_comm_dir = 3 then

            /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制融资回购》) > 0][129][@业务限制串#] */
            if instr(v_busi_limit_str, 2) > 0 then
                
                SET v_error_code = "prodA.8.11.129";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务限制串=",v_busi_limit_str);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if @指令方向# = 《指令方向-融券回购》 then */
        if v_comm_dir = 4 then

            /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制融券回购》) > 0][130][@业务限制串#] */
            if instr(v_busi_limit_str, 3) > 0 then
                
                SET v_error_code = "prodA.8.11.130";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务限制串=",v_busi_limit_str);
                end if;
                leave label_pro;
            end if;

        end if;

        /* 调用【原子_产品_账户_获取资产账户业务控制配置串】*/
        call db_prod.pra_pdacco_GetAsacConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_asac_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取资产账户业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @资产账户业务控制配置串# = @业务控制配置串#; */
        set v_asac_busi_config_str = v_busi_config_str;
        #如果指定自动审批，获取生成订单所需要的通道编号和外部账号

        /* set @通道编号# = 0; */
        set v_pass_no = 0;

        /* set @外部账号# = " "; */
        set v_out_acco = " ";

        /* [获取表记录变量][产品_账户_资产账户通道信息表][{通道编号},{外部账号}][@通道编号#,@外部账号#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select pass_no,out_acco into v_pass_no,v_out_acco from db_prod.tb_pdacco_asset_acco_ch where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.11.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;

    end if;
    #PB系统工作流检查

    /* 调用【原子_产品_交易接口_检查PB指令工作流】*/
    call db_prod.pra_pdexif_CheckPBCommandWorkflow(
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
        v_asset_acco_no,
        v_pd_busi_config_str,
        v_sys_config_str,
        v_error_code,
        v_error_info,
        v_opor_no_str1,
        v_opor_no_str2,
        v_opor_no_str3);
    if v_error_code = "1" then
        SET v_error_code = "prodA.8.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_交易接口_检查PB指令工作流出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @资产账户类型# = 《资产账户类型-融资融券》 and (@指令方向# = 《指令方向-融资买入》 or @指令方向# = 《指令方向-融券卖出》 or @指令方向# = 《指令方向-卖券还款》 or @指令方向# = 《指令方向-直接还款》 or @指令方向# = 《指令方向-卖出》) then */
    if v_asset_acco_type = 5 and (v_comm_dir = 5 or v_comm_dir = 6 or v_comm_dir = 7 or v_comm_dir = 14 or v_comm_dir = 2) then

        /* [获取表记录变量语句][产品_账户_融资融券配置表][{融资额度上限},{融券额度上限},{卖出自动还款}][@融资额度上限#,@融券额度上限#,@卖出自动还款#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select fina_limit_max,loan_limit_max,sell_auto_back_debt into v_fina_limit_max,v_loan_limit_max,v_sell_auto_back_debt from db_prod.tb_pdacco_fina_loan_config where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no=v_asset_acco_no limit 1;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_comm_appr_oper = v_comm_appr_oper;
    SET p_exgp_avail_amt = v_exgp_avail_amt;
    SET p_asac_avail_amt = v_asac_avail_amt;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_market_price_ratio = v_market_price_ratio;
    SET p_comm_no_limit_price_ratio = v_comm_no_limit_price_ratio;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_opor_no_str1 = v_opor_no_str1;
    SET p_opor_no_str2 = v_opor_no_str2;
    SET p_opor_no_str3 = v_opor_no_str3;
    SET p_fina_limit_max = v_fina_limit_max;
    SET p_loan_limit_max = v_loan_limit_max;
    SET p_asset_acco_type = v_asset_acco_type;
    SET p_sell_auto_back_debt = v_sell_auto_back_debt;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_交易接口_检查指令产品账户批量信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdexif_CheckApprProdAccoBatchInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdexif_CheckApprProdAccoBatchInfo(
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
    IN p_asset_acco_no int,
    IN p_crncy_type_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_comm_dir_str varchar(2048),
    IN p_co_busi_config_str varchar(64),
    IN p_co_comm_appr_oper int,
    IN p_busi_config_str varchar(64),
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_split_fee_typr_str varchar(64),
    OUT p_comm_appr_oper int,
    OUT p_exgp_avail_amt decimal(18,4),
    OUT p_asac_avail_amt decimal(18,4),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exter_comm_flag int,
    OUT p_market_price_ratio decimal(18,12),
    OUT p_comm_no_limit_price_ratio decimal(18,12),
    OUT p_cost_calc_type int,
    OUT p_opor_no_str1 varchar(2048),
    OUT p_opor_no_str2 varchar(2048),
    OUT p_opor_no_str3 varchar(2048),
    OUT p_asset_acco_type int
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
    declare v_asset_acco_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_comm_dir_str varchar(2048);
    declare v_co_busi_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_split_fee_typr_str varchar(64);
    declare v_comm_appr_oper int;
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exter_comm_flag int;
    declare v_market_price_ratio decimal(18,12);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_cost_calc_type int;
    declare v_opor_no_str1 varchar(2048);
    declare v_opor_no_str2 varchar(2048);
    declare v_opor_no_str3 varchar(2048);
    declare v_asset_acco_type int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_pd_busi_config_str varchar(64);
    declare v_forbid_order_dir varchar(64);
    declare v_pd_status varchar(2);
    declare v_tmp_allow_exch varchar(64);
    declare v_tmp_allow_stock_type varchar(2048);
    declare v_asset_acco_status varchar(2);
    declare v_busi_limit_str varchar(2048);
    declare v_split_str varchar(4);
    declare v_exch_no int;
    declare v_comm_dir int;
    declare v_stock_type int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_dir_str = p_comm_dir_str;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_co_comm_appr_oper = p_co_comm_appr_oper;
    SET v_busi_config_str = p_busi_config_str;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_split_fee_typr_str = " ";
    SET v_comm_appr_oper = 0;
    SET v_exgp_avail_amt = 0;
    SET v_asac_avail_amt = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exter_comm_flag = 0;
    SET v_market_price_ratio = 0;
    SET v_comm_no_limit_price_ratio = 0;
    SET v_cost_calc_type = 0;
    SET v_opor_no_str1 = " ";
    SET v_opor_no_str2 = " ";
    SET v_opor_no_str3 = " ";
    SET v_asset_acco_type = 0;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_pd_busi_config_str = " ";
    SET v_forbid_order_dir = " ";
    SET v_pd_status = "0";
    SET v_tmp_allow_exch = " ";
    SET v_tmp_allow_stock_type = " ";
    SET v_asset_acco_status = "0";
    SET v_busi_limit_str = " ";
    SET v_split_str = " ";
    SET v_exch_no = 0;
    SET v_comm_dir = 0;
    SET v_stock_type = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @交易组业务控制配置串# = @业务控制配置串#; */
    set v_exgp_busi_config_str = v_busi_config_str;

    /* [获取表记录变量][产品_账户_产品限制信息表][{成本计算方式},{允许投资市场},{允许操作证券类型},{业务控制配置串},{指令审批操作员},{市价冻结浮动比例},{指令不限价浮动比例},{禁止订单方向},{产品状态}][@成本计算方式#,@允许投资市场#,@允许操作证券类型#,@产品业务控制配置串#,@指令审批操作员#,@市价冻结浮动比例#,@指令不限价浮动比例#,@禁止订单方向#,@产品状态#][{产品编号}=@产品编号#][4][@产品编号#] */
    select cost_calc_type,allow_exch,allow_stock_type,busi_config_str,comm_appr_oper,market_price_ratio,comm_no_limit_price_ratio,forbid_order_dir,pd_status into v_cost_calc_type,v_allow_exch,v_allow_stock_type,v_pd_busi_config_str,v_comm_appr_oper,v_market_price_ratio,v_comm_no_limit_price_ratio,v_forbid_order_dir,v_pd_status from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.8.12.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #根据产品业务控制配置串，第5位处理，是否重置指令审批操作员

    /* if substring(@产品业务控制配置串#, 5, 1) = 《指令审批设置-不设置》 then */
    if substring(v_pd_busi_config_str, 5, 1) = 3 then

        /* set @指令审批操作员# = @机构指令审批操作员#; */
        set v_comm_appr_oper = v_co_comm_appr_oper;
    end if;
    #产品状态检查

    /* [检查报错返回][@产品状态# <> 《产品状态-正常》][105][@产品编号#] */
    if v_pd_status <> "1" then
        
        SET v_error_code = "prodA.8.12.105";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @临时_允许投资市场# = @允许投资市场#; */
    set v_tmp_allow_exch = v_allow_exch;

    /* set @临时_允许操作证券类型# = @允许操作证券类型#; */
    set v_tmp_allow_stock_type = v_allow_stock_type;
    #如果交易组编号不为0，则处理交易组相关数据

    /* if @交易组编号#<>0 then */
    if v_exch_group_no<>0 then

        /* 调用【原子_产品_账户_获取交易组业务控制配置串】*/
        call db_prod.pra_pdacco_GetExgpConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_exgp_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取交易组业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @交易组业务控制配置串# = @业务控制配置串#; */
        set v_exgp_busi_config_str = v_busi_config_str;
    end if;

    /* if @资产账户编号#<>0 then */
    if v_asset_acco_no<>0 then

        /* set @资产账户可用金额# = 0; */
        set v_asac_avail_amt = 0;
        #获取资产账户编号和资产账户状态

        /* [获取表记录变量][产品_账户_资产账户信息表][{资产账户状态},{允许投资市场},{允许操作证券类型},{业务限制串},{业务控制配置串},{体外指令标志},{资产账户类型}][@资产账户状态#,@允许投资市场#,@允许操作证券类型#,@业务限制串#,@资产账户业务控制配置串#,@体外指令标志#,@资产账户类型#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select asset_acco_status,allow_exch,allow_stock_type,busi_limit_str,busi_config_str,exter_comm_flag,asset_acco_type into v_asset_acco_status,v_allow_exch,v_allow_stock_type,v_busi_limit_str,v_asac_busi_config_str,v_exter_comm_flag,v_asset_acco_type from db_prod.tb_pdacco_asset_acco where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.12.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;

        #资产账户状态检查
    end if;

    /* if @分隔符# = ' ' then */
    if v_split_str = ' ' then

        /* set @分隔符#= ';'; */
        set v_split_str= ';';
    end if;

    /* while LOCATE(@分隔符#,@市场编号串#) <>0   do */
    while LOCATE(v_split_str,v_exch_no_str) <>0   do
        #截取前面每一位

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @指令方向#=cast(substring(@指令方向串#,1,LOCATE(@分隔符#,@指令方向串#)-1) as SIGNED); */
        set v_comm_dir=cast(substring(v_comm_dir_str,1,LOCATE(v_split_str,v_comm_dir_str)-1) as SIGNED);

        /* set @证券类型#=cast(substring(@证券类型串#,1,LOCATE(@分隔符#,@证券类型串#)-1) as SIGNED); */
        set v_stock_type=cast(substring(v_stock_type_str,1,LOCATE(v_split_str,v_stock_type_str)-1) as SIGNED);

        /* set @本币币种#=cast(substring(@本币币种串#,1,LOCATE(@分隔符#,@本币币种串#)-1) as SIGNED); */
        set v_crncy_type=cast(substring(v_crncy_type_str,1,LOCATE(v_split_str,v_crncy_type_str)-1) as SIGNED);
        #禁止订单方向检查

        /* if @禁止订单方向#<>" " then */
        if v_forbid_order_dir<>" " then

            /* [检查报错返回][instr(concat(";",@禁止订单方向#,";"),concat(";",@指令方向#,";"))>0][639][@指令方向#] */
            if instr(concat(";",v_forbid_order_dir,";"),concat(";",v_comm_dir,";"))>0 then
                
                SET v_error_code = "prodA.8.12.639";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("指令方向=",v_comm_dir),"#",v_mysql_message);
                else
                    SET v_error_info = concat("指令方向=",v_comm_dir);
                end if;
                leave label_pro;
            end if;

        end if;
        #检查产品级业务限制
        #如果传入的市场编号有值，检查是否可操作

        /* [检查报错返回][@市场编号# <> 0 and instr(@临时_允许投资市场#, @市场编号#) = 0][106][@市场编号#,@临时_允许投资市场#] */
        if v_exch_no <> 0 and instr(v_tmp_allow_exch, v_exch_no) = 0 then
            
            SET v_error_code = "prodA.8.12.106";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","临时_允许投资市场=",v_tmp_allow_exch),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","临时_允许投资市场=",v_tmp_allow_exch);
            end if;
            leave label_pro;
        end if;

        #如果传入的证券类型有值，检查是否可操作

        /* [检查报错返回][@证券类型# <> 0 and instr(@临时_允许操作证券类型#, @证券类型#) = 0][107][@证券类型#,@临时_允许操作证券类型#] */
        if v_stock_type <> 0 and instr(v_tmp_allow_stock_type, v_stock_type) = 0 then
            
            SET v_error_code = "prodA.8.12.107";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","临时_允许操作证券类型=",v_tmp_allow_stock_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券类型=",v_stock_type,",","临时_允许操作证券类型=",v_tmp_allow_stock_type);
            end if;
            leave label_pro;
        end if;

        #如果资产账户编号不为0，则处理资产账户相关数据

        /* if @资产账户编号#<>0 then */
        if v_asset_acco_no<>0 then
            #如果传入的市场编号有值，检查是否可操作

            /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][126][@市场编号#,@允许投资市场#] */
            if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
                
                SET v_error_code = "prodA.8.12.126";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
                end if;
                leave label_pro;
            end if;

            #如果传入的证券类型有值，检查是否可操作

            /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][127][@证券类型#,@允许操作证券类型#] */
            if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
                
                SET v_error_code = "prodA.8.12.127";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
                end if;
                leave label_pro;
            end if;

            #如果传入的指令方向有值，检查是否有相应业务限制

            /* if @指令方向# = 《指令方向-新股申购》 then */
            if v_comm_dir = 11 then

                /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制打新》) > 0][128][@业务限制串#] */
                if instr(v_busi_limit_str, 1) > 0 then
                    
                    SET v_error_code = "prodA.8.12.128";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("业务限制串=",v_busi_limit_str);
                    end if;
                    leave label_pro;
                end if;

            end if;

            /* if @指令方向# = 《指令方向-融资回购》 then */
            if v_comm_dir = 3 then

                /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制融资回购》) > 0][129][@业务限制串#] */
                if instr(v_busi_limit_str, 2) > 0 then
                    
                    SET v_error_code = "prodA.8.12.129";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("业务限制串=",v_busi_limit_str);
                    end if;
                    leave label_pro;
                end if;

            end if;

            /* if @指令方向# = 《指令方向-融券回购》 then */
            if v_comm_dir = 4 then

                /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制融券回购》) > 0][130][@业务限制串#] */
                if instr(v_busi_limit_str, 3) > 0 then
                    
                    SET v_error_code = "prodA.8.12.130";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("业务限制串=",v_busi_limit_str);
                    end if;
                    leave label_pro;
                end if;

            end if;
        end if;

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @指令方向串#=substring(@指令方向串#,LOCATE(@分隔符#,@指令方向串#)+1); */
        set v_comm_dir_str=substring(v_comm_dir_str,LOCATE(v_split_str,v_comm_dir_str)+1);

        /* set @证券类型串#=substring(@证券类型串#,LOCATE(@分隔符#,@证券类型串#)+1); */
        set v_stock_type_str=substring(v_stock_type_str,LOCATE(v_split_str,v_stock_type_str)+1);

        /* set @本币币种串#=substring(@本币币种串#,LOCATE(@分隔符#,@本币币种串#)+1); */
        set v_crncy_type_str=substring(v_crncy_type_str,LOCATE(v_split_str,v_crncy_type_str)+1);
    end while;

    /* if @资产账户编号#<>0 then */
    if v_asset_acco_no<>0 then

        /* 调用【原子_产品_账户_获取资产账户业务控制配置串】*/
        call db_prod.pra_pdacco_GetAsacConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_asac_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.12.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取资产账户业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @资产账户业务控制配置串# = @业务控制配置串#; */
        set v_asac_busi_config_str = v_busi_config_str;
        #如果指定自动审批，获取生成订单所需要的通道编号和外部账号

        /* set @通道编号# = 0; */
        set v_pass_no = 0;

        /* set @外部账号# = " "; */
        set v_out_acco = " ";

        /* [获取表记录变量][产品_账户_资产账户通道信息表][{通道编号},{外部账号}][@通道编号#,@外部账号#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select pass_no,out_acco into v_pass_no,v_out_acco from db_prod.tb_pdacco_asset_acco_ch where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.12.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;

    end if;
    #PB系统工作流检查

       /* 调用【原子_产品_交易接口_检查PB指令工作流】*/
       call db_prod.pra_pdexif_CheckPBCommandWorkflow(
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
           v_asset_acco_no,
           v_pd_busi_config_str,
           v_sys_config_str,
           v_error_code,
           v_error_info,
           v_opor_no_str1,
           v_opor_no_str2,
           v_opor_no_str3);
       if v_error_code = "1" then
           SET v_error_code = "prodA.8.12.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_交易接口_检查PB指令工作流出现错误！',v_mysql_message);
           end if;
           leave label_pro;
       elseif v_error_code <> "0" then
           leave label_pro;
       end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_comm_appr_oper = v_comm_appr_oper;
    SET p_exgp_avail_amt = v_exgp_avail_amt;
    SET p_asac_avail_amt = v_asac_avail_amt;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_market_price_ratio = v_market_price_ratio;
    SET p_comm_no_limit_price_ratio = v_comm_no_limit_price_ratio;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_opor_no_str1 = v_opor_no_str1;
    SET p_opor_no_str2 = v_opor_no_str2;
    SET p_opor_no_str3 = v_opor_no_str3;
    SET p_asset_acco_type = v_asset_acco_type;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_交易接口_检查指令审批产品账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdexif_CheckCommApprProdAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdexif_CheckCommApprProdAccoInfo(
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
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_comm_dir int,
    IN p_co_busi_config_str varchar(64),
    IN p_co_comm_appr_oper int,
    IN p_busi_config_str varchar(64),
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_split_fee_typr_str varchar(64),
    OUT p_comm_appr_oper int,
    OUT p_exgp_avail_amt decimal(18,4),
    OUT p_asac_avail_amt decimal(18,4),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exter_comm_flag int,
    OUT p_market_price_ratio decimal(18,12),
    OUT p_comm_no_limit_price_ratio decimal(18,12),
    OUT p_cost_calc_type int,
    OUT p_opor_no_str1 varchar(2048),
    OUT p_opor_no_str2 varchar(2048),
    OUT p_opor_no_str3 varchar(2048),
    OUT p_asset_acco_type int
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
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_comm_dir int;
    declare v_co_busi_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_split_fee_typr_str varchar(64);
    declare v_comm_appr_oper int;
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exter_comm_flag int;
    declare v_market_price_ratio decimal(18,12);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_cost_calc_type int;
    declare v_opor_no_str1 varchar(2048);
    declare v_opor_no_str2 varchar(2048);
    declare v_opor_no_str3 varchar(2048);
    declare v_asset_acco_type int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_pd_busi_config_str varchar(64);
    declare v_forbid_order_dir varchar(64);
    declare v_pd_status varchar(2);
    declare v_asset_acco_status varchar(2);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_comm_dir = p_comm_dir;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_co_comm_appr_oper = p_co_comm_appr_oper;
    SET v_busi_config_str = p_busi_config_str;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_split_fee_typr_str = " ";
    SET v_comm_appr_oper = 0;
    SET v_exgp_avail_amt = 0;
    SET v_asac_avail_amt = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exter_comm_flag = 0;
    SET v_market_price_ratio = 0;
    SET v_comm_no_limit_price_ratio = 0;
    SET v_cost_calc_type = 0;
    SET v_opor_no_str1 = " ";
    SET v_opor_no_str2 = " ";
    SET v_opor_no_str3 = " ";
    SET v_asset_acco_type = 0;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_pd_busi_config_str = " ";
    SET v_forbid_order_dir = " ";
    SET v_pd_status = "0";
    SET v_asset_acco_status = "0";
    SET v_busi_limit_str = " ";

    
    label_pro:BEGIN
    

    /* set @交易组业务控制配置串# = @业务控制配置串#; */
    set v_exgp_busi_config_str = v_busi_config_str;

    /* [获取表记录变量][产品_账户_产品限制信息表][{成本计算方式},{允许投资市场},{允许操作证券类型},{业务控制配置串},{指令审批操作员},{市价冻结浮动比例},{指令不限价浮动比例},{禁止订单方向},{产品状态}][@成本计算方式#,@允许投资市场#,@允许操作证券类型#,@产品业务控制配置串#,@指令审批操作员#,@市价冻结浮动比例#,@指令不限价浮动比例#,@禁止订单方向#,@产品状态#][{产品编号}=@产品编号#][4][@产品编号#] */
    select cost_calc_type,allow_exch,allow_stock_type,busi_config_str,comm_appr_oper,market_price_ratio,comm_no_limit_price_ratio,forbid_order_dir,pd_status into v_cost_calc_type,v_allow_exch,v_allow_stock_type,v_pd_busi_config_str,v_comm_appr_oper,v_market_price_ratio,v_comm_no_limit_price_ratio,v_forbid_order_dir,v_pd_status from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.8.13.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #[检查报错返回][@操作员编号# <> @指令审批操作员#][70][@操作员编号#,@指令审批操作员#]
    #根据产品业务控制配置串，第5位处理，是否重置指令审批操作员

    /* if substring(@产品业务控制配置串#, 5, 1) = 《指令审批设置-不设置》 or (substring(@产品业务控制配置串#, 5, 1) = 《指令审批设置-自动审批》 and @指令审批操作员# = 0) then */
    if substring(v_pd_busi_config_str, 5, 1) = 3 or (substring(v_pd_busi_config_str, 5, 1) = 1 and v_comm_appr_oper = 0) then

        /* set @指令审批操作员# = @机构指令审批操作员#; */
        set v_comm_appr_oper = v_co_comm_appr_oper;
    end if;
    #产品状态检查

    /* [检查报错返回][@产品状态# <> 《产品状态-正常》][105][@产品编号#] */
    if v_pd_status <> "1" then
        
        SET v_error_code = "prodA.8.13.105";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #禁止订单方向检查

    /* if @禁止订单方向#<>" " then */
    if v_forbid_order_dir<>" " then

        /* [检查报错返回][instr(concat(";",@禁止订单方向#,";"),concat(";",@指令方向#,";"))>0][639][@指令方向#] */
        if instr(concat(";",v_forbid_order_dir,";"),concat(";",v_comm_dir,";"))>0 then
            
            SET v_error_code = "prodA.8.13.639";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令方向=",v_comm_dir),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令方向=",v_comm_dir);
            end if;
            leave label_pro;
        end if;

    end if;
    #检查产品级业务限制
    #如果传入的市场编号有值，检查是否可操作

    /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][106][@市场编号#,@允许投资市场#] */
    if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
        
        SET v_error_code = "prodA.8.13.106";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
        end if;
        leave label_pro;
    end if;

    #如果传入的证券类型有值，检查是否可操作

    /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][107][@证券类型#,@允许操作证券类型#] */
    if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
        
        SET v_error_code = "prodA.8.13.107";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
        end if;
        leave label_pro;
    end if;

    #如果交易组编号不为0，则处理交易组相关数据

    /* if @交易组编号#<>0 then */
    if v_exch_group_no<>0 then

        /* 调用【原子_产品_账户_获取交易组业务控制配置串】*/
        call db_prod.pra_pdacco_GetExgpConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_exgp_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取交易组业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @交易组业务控制配置串# = @业务控制配置串#; */
        set v_exgp_busi_config_str = v_busi_config_str;
    end if;
    #如果资产账户编号不为0，则处理资产账户相关数据

    /* if @资产账户编号#<>0 then */
    if v_asset_acco_no<>0 then

        /* set @资产账户可用金额# = 0; */
        set v_asac_avail_amt = 0;
        #获取资产账户编号和资产账户状态

        /* [获取表记录变量][产品_账户_资产账户信息表][{资产账户状态},{允许投资市场},{允许操作证券类型},{业务限制串},{业务控制配置串},{体外指令标志},{资产账户类型}][@资产账户状态#,@允许投资市场#,@允许操作证券类型#,@业务限制串#,@资产账户业务控制配置串#,@体外指令标志#,@资产账户类型#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select asset_acco_status,allow_exch,allow_stock_type,busi_limit_str,busi_config_str,exter_comm_flag,asset_acco_type into v_asset_acco_status,v_allow_exch,v_allow_stock_type,v_busi_limit_str,v_asac_busi_config_str,v_exter_comm_flag,v_asset_acco_type from db_prod.tb_pdacco_asset_acco where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.13.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;

        #资产账户状态检查

        /* [检查报错返回][@资产账户状态# <> 《资产账户状态-正常》][125][@资产账户状态#] */
        if v_asset_acco_status <> "1" then
            
            SET v_error_code = "prodA.8.13.125";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户状态=",v_asset_acco_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户状态=",v_asset_acco_status);
            end if;
            leave label_pro;
        end if;

        #如果传入的市场编号有值，检查是否可操作

        /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][126][@市场编号#,@允许投资市场#] */
        if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
            
            SET v_error_code = "prodA.8.13.126";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
            end if;
            leave label_pro;
        end if;

        #如果传入的证券类型有值，检查是否可操作

        /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][127][@证券类型#,@允许操作证券类型#] */
        if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
            
            SET v_error_code = "prodA.8.13.127";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
            end if;
            leave label_pro;
        end if;

        #如果传入的指令方向有值，检查是否有相应业务限制

        /* if @指令方向# = 《指令方向-新股申购》 then */
        if v_comm_dir = 11 then

            /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制打新》) > 0][128][@业务限制串#] */
            if instr(v_busi_limit_str, 1) > 0 then
                
                SET v_error_code = "prodA.8.13.128";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务限制串=",v_busi_limit_str);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if @指令方向# = 《指令方向-融资回购》 then */
        if v_comm_dir = 3 then

            /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制融资回购》) > 0][129][@业务限制串#] */
            if instr(v_busi_limit_str, 2) > 0 then
                
                SET v_error_code = "prodA.8.13.129";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务限制串=",v_busi_limit_str);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if @指令方向# = 《指令方向-融券回购》 then */
        if v_comm_dir = 4 then

            /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制融券回购》) > 0][130][@业务限制串#] */
            if instr(v_busi_limit_str, 3) > 0 then
                
                SET v_error_code = "prodA.8.13.130";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务限制串=",v_busi_limit_str);
                end if;
                leave label_pro;
            end if;

        end if;

        /* 调用【原子_产品_账户_获取资产账户业务控制配置串】*/
        call db_prod.pra_pdacco_GetAsacConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_asac_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.13.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取资产账户业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @资产账户业务控制配置串# = @业务控制配置串#; */
        set v_asac_busi_config_str = v_busi_config_str;
        #如果指定自动审批，获取生成订单所需要的通道编号和外部账号

        /* set @通道编号# = 0; */
        set v_pass_no = 0;

        /* set @外部账号# = " "; */
        set v_out_acco = " ";

        /* [获取表记录变量][产品_账户_资产账户通道信息表][{通道编号},{外部账号}][@通道编号#,@外部账号#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select pass_no,out_acco into v_pass_no,v_out_acco from db_prod.tb_pdacco_asset_acco_ch where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.13.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_comm_appr_oper = v_comm_appr_oper;
    SET p_exgp_avail_amt = v_exgp_avail_amt;
    SET p_asac_avail_amt = v_asac_avail_amt;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_market_price_ratio = v_market_price_ratio;
    SET p_comm_no_limit_price_ratio = v_comm_no_limit_price_ratio;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_opor_no_str1 = v_opor_no_str1;
    SET p_opor_no_str2 = v_opor_no_str2;
    SET p_opor_no_str3 = v_opor_no_str3;
    SET p_asset_acco_type = v_asset_acco_type;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_交易接口_检查交易产品账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdexif_CheckExchProdAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdexif_CheckExchProdAccoInfo(
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
    IN p_asset_acco_no int,
    IN p_stock_code varchar(6),
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_co_busi_config_str varchar(64),
    IN p_busi_config_str varchar(64),
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_split_fee_typr_str varchar(64),
    OUT p_nav_asset decimal(18,4),
    OUT p_exter_comm_flag int,
    OUT p_market_price_ratio decimal(18,12),
    OUT p_cost_calc_type int,
    OUT p_opor_no_str1 varchar(2048),
    OUT p_opor_no_str2 varchar(2048),
    OUT p_opor_no_str3 varchar(2048),
    OUT p_fina_limit_max decimal(18,4),
    OUT p_loan_limit_max decimal(18,4),
    OUT p_asset_acco_type int,
    OUT p_sell_auto_back_debt int
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
    declare v_asset_acco_no int;
    declare v_stock_code varchar(6);
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_co_busi_config_str varchar(64);
    declare v_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_split_fee_typr_str varchar(64);
    declare v_nav_asset decimal(18,4);
    declare v_exter_comm_flag int;
    declare v_market_price_ratio decimal(18,12);
    declare v_cost_calc_type int;
    declare v_opor_no_str1 varchar(2048);
    declare v_opor_no_str2 varchar(2048);
    declare v_opor_no_str3 varchar(2048);
    declare v_fina_limit_max decimal(18,4);
    declare v_loan_limit_max decimal(18,4);
    declare v_asset_acco_type int;
    declare v_sell_auto_back_debt int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_pd_busi_config_str varchar(64);
    declare v_comm_appr_oper int;
    declare v_forbid_order_dir varchar(64);
    declare v_pd_status varchar(2);
    declare v_asac_avail_amt decimal(18,4);
    declare v_asset_acco_status varchar(2);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_busi_config_str = p_busi_config_str;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_split_fee_typr_str = " ";
    SET v_nav_asset = 0;
    SET v_exter_comm_flag = 0;
    SET v_market_price_ratio = 0;
    SET v_cost_calc_type = 0;
    SET v_opor_no_str1 = " ";
    SET v_opor_no_str2 = " ";
    SET v_opor_no_str3 = " ";
    SET v_fina_limit_max = 0;
    SET v_loan_limit_max = 0;
    SET v_asset_acco_type = 0;
    SET v_sell_auto_back_debt = 0;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_pd_busi_config_str = " ";
    SET v_comm_appr_oper = 0;
    SET v_forbid_order_dir = " ";
    SET v_pd_status = "0";
    SET v_asac_avail_amt = 0;
    SET v_asset_acco_status = "0";
    SET v_busi_limit_str = " ";

    
    label_pro:BEGIN
    

    /* set @交易组业务控制配置串# = @业务控制配置串#; */
    set v_exgp_busi_config_str = v_busi_config_str;

    /* [获取表记录变量][产品_账户_产品限制信息表][{成本计算方式},{允许投资市场},{允许操作证券类型},{业务控制配置串},{指令审批操作员},{市价冻结浮动比例},{禁止订单方向},{产品状态}][@成本计算方式#,@允许投资市场#,@允许操作证券类型#,@产品业务控制配置串#,@指令审批操作员#,@市价冻结浮动比例#,@禁止订单方向#,@产品状态#][{产品编号}=@产品编号#][4][@产品编号#] */
    select cost_calc_type,allow_exch,allow_stock_type,busi_config_str,comm_appr_oper,market_price_ratio,forbid_order_dir,pd_status into v_cost_calc_type,v_allow_exch,v_allow_stock_type,v_pd_busi_config_str,v_comm_appr_oper,v_market_price_ratio,v_forbid_order_dir,v_pd_status from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.8.21.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #产品状态检查

    /* [检查报错返回][@产品状态# <> 《产品状态-正常》][105][@产品编号#] */
    if v_pd_status <> "1" then
        
        SET v_error_code = "prodA.8.21.105";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #禁止订单方向检查

    /* if @禁止订单方向#<>" " then */
    if v_forbid_order_dir<>" " then

        /* [检查报错返回][instr(concat(";",@禁止订单方向#,";"),concat(";",@订单方向#,";"))>0][639][@订单方向#] */
        if instr(concat(";",v_forbid_order_dir,";"),concat(";",v_order_dir,";"))>0 then
            
            SET v_error_code = "prodA.8.21.639";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单方向=",v_order_dir),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单方向=",v_order_dir);
            end if;
            leave label_pro;
        end if;

    end if;
    #检查产品级业务限制
    #如果传入的市场编号有值，检查是否可操作

    /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][106][@市场编号#,@允许投资市场#] */
    if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
        
        SET v_error_code = "prodA.8.21.106";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
        end if;
        leave label_pro;
    end if;

    #如果传入的证券类型有值，检查是否可操作

    /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][107][@证券类型#,@允许操作证券类型#] */
    if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
        
        SET v_error_code = "prodA.8.21.107";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
        end if;
        leave label_pro;
    end if;

    #如果交易组编号不为0，则处理交易组相关数据

    /* if @交易组编号#<>0 then */
    if v_exch_group_no<>0 then

        /* 调用【原子_产品_账户_获取交易组业务控制配置串】*/
        call db_prod.pra_pdacco_GetExgpConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_exgp_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取交易组业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @交易组业务控制配置串# = @业务控制配置串#; */
        set v_exgp_busi_config_str = v_busi_config_str;
        #获取净资产
    end if;
    #如果资产账户编号不为0，则处理资产账户相关数据

    /* if @资产账户编号#<>0 then */
    if v_asset_acco_no<>0 then

        /* set @资产账户可用金额# = 0; */
        set v_asac_avail_amt = 0;
        #获取资产账户编号和资产账户状态

        /* [获取表记录变量][产品_账户_资产账户信息表][{资产账户状态},{允许投资市场},{允许操作证券类型},{业务限制串},{业务控制配置串},{资产账户类型}][@资产账户状态#,@允许投资市场#,@允许操作证券类型#,@业务限制串#,@资产账户业务控制配置串#,@资产账户类型#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select asset_acco_status,allow_exch,allow_stock_type,busi_limit_str,busi_config_str,asset_acco_type into v_asset_acco_status,v_allow_exch,v_allow_stock_type,v_busi_limit_str,v_asac_busi_config_str,v_asset_acco_type from db_prod.tb_pdacco_asset_acco where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.21.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;

        #资产账户状态检查

        /* [检查报错返回][@资产账户状态# <> 《资产账户状态-正常》][125][@资产账户状态#] */
        if v_asset_acco_status <> "1" then
            
            SET v_error_code = "prodA.8.21.125";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户状态=",v_asset_acco_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户状态=",v_asset_acco_status);
            end if;
            leave label_pro;
        end if;

        #如果传入的市场编号有值，检查是否可操作

        /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][126][@市场编号#,@允许投资市场#] */
        if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
            
            SET v_error_code = "prodA.8.21.126";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
            end if;
            leave label_pro;
        end if;

        #如果传入的证券类型有值，检查是否可操作

        /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][127][@证券类型#,@允许操作证券类型#] */
        if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
            
            SET v_error_code = "prodA.8.21.127";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
            end if;
            leave label_pro;
        end if;

        #如果传入的指令方向有值，检查是否有相应业务限制

        /* if @订单方向# = 《订单方向-新股申购》 and @证券代码#<=688000 and @证券代码#>=688999  then */
        if v_order_dir = 11 and v_stock_code<=688000 and v_stock_code>=688999  then

            /* [检查报错返回][instr(concat(";",@业务限制串#,";"),concat(";",《业务限制-限制打新》,";")) > 0][128][@业务限制串#] */
            if instr(concat(";",v_busi_limit_str,";"),concat(";",1,";")) > 0 then
                
                SET v_error_code = "prodA.8.21.128";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务限制串=",v_busi_limit_str);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if @订单方向# = 《订单方向-新股申购》 and @证券代码#>=688000 and @证券代码#<=688999  then */
        if v_order_dir = 11 and v_stock_code>=688000 and v_stock_code<=688999  then

            /* [检查报错返回][instr(concat(";",@业务限制串#,";"),concat(";",《业务限制-限制科创板打新》,";")) > 0][921][@业务限制串#] */
            if instr(concat(";",v_busi_limit_str,";"),concat(";",4,";")) > 0 then
                
                SET v_error_code = "prodA.8.21.921";
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

            /* [检查报错返回][instr(concat(";",@业务限制串#,";"), concat(";",《业务限制-限制融资回购》,";")) > 0][129][@业务限制串#] */
            if instr(concat(";",v_busi_limit_str,";"), concat(";",2,";")) > 0 then
                
                SET v_error_code = "prodA.8.21.129";
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

            /* [检查报错返回][instr(concat(";",@业务限制串#,";"), concat(";",《业务限制-限制融券回购》,";")) > 0][130][@业务限制串#] */
            if instr(concat(";",v_busi_limit_str,";"), concat(";",3,";")) > 0 then
                
                SET v_error_code = "prodA.8.21.130";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务限制串=",v_busi_limit_str);
                end if;
                leave label_pro;
            end if;

        end if;

        /* 调用【原子_产品_账户_获取资产账户业务控制配置串】*/
        call db_prod.pra_pdacco_GetAsacConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_asac_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取资产账户业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @资产账户业务控制配置串# = @业务控制配置串#; */
        set v_asac_busi_config_str = v_busi_config_str;
        #如果指定自动审批，获取生成订单所需要的通道编号和外部账号

        /* set @通道编号# = 0; */
        set v_pass_no = 0;

        /* set @外部账号# = " "; */
        set v_out_acco = " ";

        /* [获取表记录变量][产品_账户_资产账户通道信息表][{通道编号},{外部账号}][@通道编号#,@外部账号#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select pass_no,out_acco into v_pass_no,v_out_acco from db_prod.tb_pdacco_asset_acco_ch where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.21.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;

        #获取净资产
    end if;
    #PB系统工作流检查
     #  [原子_产品_交易接口_检查PB交易工作流]

    /* if @资产账户类型# = 《资产账户类型-融资融券》 and (@订单方向# = 《订单方向-融资买入》 or @订单方向# = 《订单方向-融券卖出》 or @订单方向# = 《订单方向-卖券还款》 or @订单方向# = 《订单方向-直接还款》 or @订单方向# = 《订单方向-卖出》)  then */
    if v_asset_acco_type = 5 and (v_order_dir = 5 or v_order_dir = 6 or v_order_dir = 7 or v_order_dir = 14 or v_order_dir = 2)  then

        /* [获取表记录变量语句][产品_账户_融资融券配置表][{融资额度上限},{融券额度上限},{卖出自动还款}][@融资额度上限#,@融券额度上限#,@卖出自动还款#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select fina_limit_max,loan_limit_max,sell_auto_back_debt into v_fina_limit_max,v_loan_limit_max,v_sell_auto_back_debt from db_prod.tb_pdacco_fina_loan_config where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no=v_asset_acco_no limit 1;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_nav_asset = v_nav_asset;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_market_price_ratio = v_market_price_ratio;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_opor_no_str1 = v_opor_no_str1;
    SET p_opor_no_str2 = v_opor_no_str2;
    SET p_opor_no_str3 = v_opor_no_str3;
    SET p_fina_limit_max = v_fina_limit_max;
    SET p_loan_limit_max = v_loan_limit_max;
    SET p_asset_acco_type = v_asset_acco_type;
    SET p_sell_auto_back_debt = v_sell_auto_back_debt;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_交易接口_检查交易产品账户批量信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdexif_CheckExchProdAccoBatchInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdexif_CheckExchProdAccoBatchInfo(
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
    IN p_asset_acco_no int,
    IN p_crncy_type_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_order_dir_str varchar(1024),
    IN p_co_busi_config_str varchar(64),
    IN p_busi_config_str varchar(64),
    IN p_split_str varchar(4),
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_split_fee_typr_str varchar(64),
    OUT p_nav_asset decimal(18,4),
    OUT p_exter_comm_flag int,
    OUT p_market_price_ratio decimal(18,12),
    OUT p_cost_calc_type int,
    OUT p_opor_no_str1 varchar(2048),
    OUT p_opor_no_str2 varchar(2048),
    OUT p_opor_no_str3 varchar(2048),
    OUT p_asset_acco_type int
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
    declare v_asset_acco_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_co_busi_config_str varchar(64);
    declare v_busi_config_str varchar(64);
    declare v_split_str varchar(4);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_split_fee_typr_str varchar(64);
    declare v_nav_asset decimal(18,4);
    declare v_exter_comm_flag int;
    declare v_market_price_ratio decimal(18,12);
    declare v_cost_calc_type int;
    declare v_opor_no_str1 varchar(2048);
    declare v_opor_no_str2 varchar(2048);
    declare v_opor_no_str3 varchar(2048);
    declare v_asset_acco_type int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_pd_busi_config_str varchar(64);
    declare v_comm_appr_oper int;
    declare v_forbid_order_dir varchar(64);
    declare v_pd_status varchar(2);
    declare v_tmp_allow_exch varchar(64);
    declare v_tmp_allow_stock_type varchar(2048);
    declare v_asac_avail_amt decimal(18,4);
    declare v_asset_acco_status varchar(2);
    declare v_busi_limit_str varchar(2048);
    declare v_exch_no int;
    declare v_order_dir int;
    declare v_stock_type int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_busi_config_str = p_busi_config_str;
    SET v_split_str = p_split_str;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_split_fee_typr_str = " ";
    SET v_nav_asset = 0;
    SET v_exter_comm_flag = 0;
    SET v_market_price_ratio = 0;
    SET v_cost_calc_type = 0;
    SET v_opor_no_str1 = " ";
    SET v_opor_no_str2 = " ";
    SET v_opor_no_str3 = " ";
    SET v_asset_acco_type = 0;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_pd_busi_config_str = " ";
    SET v_comm_appr_oper = 0;
    SET v_forbid_order_dir = " ";
    SET v_pd_status = "0";
    SET v_tmp_allow_exch = " ";
    SET v_tmp_allow_stock_type = " ";
    SET v_asac_avail_amt = 0;
    SET v_asset_acco_status = "0";
    SET v_busi_limit_str = " ";
    SET v_exch_no = 0;
    SET v_order_dir = 0;
    SET v_stock_type = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @交易组业务控制配置串# = @业务控制配置串#; */
    set v_exgp_busi_config_str = v_busi_config_str;

    /* [获取表记录变量][产品_账户_产品限制信息表][{成本计算方式},{允许投资市场},{允许操作证券类型},{业务控制配置串},{指令审批操作员},{市价冻结浮动比例},{禁止订单方向},{产品状态}][@成本计算方式#,@允许投资市场#,@允许操作证券类型#,@产品业务控制配置串#,@指令审批操作员#,@市价冻结浮动比例#,@禁止订单方向#,@产品状态#][{产品编号}=@产品编号#][4][@产品编号#] */
    select cost_calc_type,allow_exch,allow_stock_type,busi_config_str,comm_appr_oper,market_price_ratio,forbid_order_dir,pd_status into v_cost_calc_type,v_allow_exch,v_allow_stock_type,v_pd_busi_config_str,v_comm_appr_oper,v_market_price_ratio,v_forbid_order_dir,v_pd_status from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.8.22.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #产品状态检查

    /* [检查报错返回][@产品状态# <> 《产品状态-正常》][105][@产品编号#] */
    if v_pd_status <> "1" then
        
        SET v_error_code = "prodA.8.22.105";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @临时_允许投资市场# = @允许投资市场#; */
    set v_tmp_allow_exch = v_allow_exch;

    /* set @临时_允许操作证券类型# = @允许操作证券类型#; */
    set v_tmp_allow_stock_type = v_allow_stock_type;
    #如果交易组编号不为0，则处理交易组相关数据

    /* if @交易组编号#<>0 then */
    if v_exch_group_no<>0 then

        /* 调用【原子_产品_账户_获取交易组业务控制配置串】*/
        call db_prod.pra_pdacco_GetExgpConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_exgp_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取交易组业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @交易组业务控制配置串# = @业务控制配置串#; */
        set v_exgp_busi_config_str = v_busi_config_str;
        #获取净资产
    end if;

    /* if @资产账户编号#<>0 then */
    if v_asset_acco_no<>0 then

        /* set @资产账户可用金额# = 0; */
        set v_asac_avail_amt = 0;
        #获取资产账户编号和资产账户状态

        /* [获取表记录变量][产品_账户_资产账户信息表][{资产账户状态},{允许投资市场},{允许操作证券类型},{业务限制串},{业务控制配置串},{资产账户类型}][@资产账户状态#,@允许投资市场#,@允许操作证券类型#,@业务限制串#,@资产账户业务控制配置串#,@资产账户类型#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select asset_acco_status,allow_exch,allow_stock_type,busi_limit_str,busi_config_str,asset_acco_type into v_asset_acco_status,v_allow_exch,v_allow_stock_type,v_busi_limit_str,v_asac_busi_config_str,v_asset_acco_type from db_prod.tb_pdacco_asset_acco where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.22.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;

        #资产账户状态检查

        /* [检查报错返回][@资产账户状态# <> 《资产账户状态-正常》][125][@资产账户状态#] */
        if v_asset_acco_status <> "1" then
            
            SET v_error_code = "prodA.8.22.125";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户状态=",v_asset_acco_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户状态=",v_asset_acco_status);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @分隔符# = ' ' then */
    if v_split_str = ' ' then

        /* set @分隔符#= ';'; */
        set v_split_str= ';';
    end if;

    /* while LOCATE(@分隔符#,@市场编号串#) <>0   do */
    while LOCATE(v_split_str,v_exch_no_str) <>0   do
        #截取前面每一位

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @订单方向#=cast(substring(@订单方向串#,1,LOCATE(@分隔符#,@订单方向串#)-1) as SIGNED); */
        set v_order_dir=cast(substring(v_order_dir_str,1,LOCATE(v_split_str,v_order_dir_str)-1) as SIGNED);

        /* set @证券类型#=cast(substring(@证券类型串#,1,LOCATE(@分隔符#,@证券类型串#)-1) as SIGNED); */
        set v_stock_type=cast(substring(v_stock_type_str,1,LOCATE(v_split_str,v_stock_type_str)-1) as SIGNED);

        /* set @本币币种#=cast(substring(@本币币种串#,1,LOCATE(@分隔符#,@本币币种串#)-1) as SIGNED); */
        set v_crncy_type=cast(substring(v_crncy_type_str,1,LOCATE(v_split_str,v_crncy_type_str)-1) as SIGNED);
        #禁止订单方向检查

        /* if @禁止订单方向#<>" " then */
        if v_forbid_order_dir<>" " then

            /* [检查报错返回][instr(concat(";",@禁止订单方向#,";"),concat(";",@订单方向#,";"))>0][639][@订单方向#] */
            if instr(concat(";",v_forbid_order_dir,";"),concat(";",v_order_dir,";"))>0 then
                
                SET v_error_code = "prodA.8.22.639";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单方向=",v_order_dir),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单方向=",v_order_dir);
                end if;
                leave label_pro;
            end if;

        end if;
        #检查产品级业务限制
        #如果传入的市场编号有值，检查是否可操作

        /* [检查报错返回][@市场编号# <> 0 and instr(@临时_允许投资市场#, @市场编号#) = 0][106][@市场编号#,@临时_允许投资市场#] */
        if v_exch_no <> 0 and instr(v_tmp_allow_exch, v_exch_no) = 0 then
            
            SET v_error_code = "prodA.8.22.106";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","临时_允许投资市场=",v_tmp_allow_exch),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","临时_允许投资市场=",v_tmp_allow_exch);
            end if;
            leave label_pro;
        end if;

        #如果传入的证券类型有值，检查是否可操作

        /* [检查报错返回][@证券类型# <> 0 and instr(@临时_允许操作证券类型#, @证券类型#) = 0][107][@证券类型#,@临时_允许操作证券类型#] */
        if v_stock_type <> 0 and instr(v_tmp_allow_stock_type, v_stock_type) = 0 then
            
            SET v_error_code = "prodA.8.22.107";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","临时_允许操作证券类型=",v_tmp_allow_stock_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券类型=",v_stock_type,",","临时_允许操作证券类型=",v_tmp_allow_stock_type);
            end if;
            leave label_pro;
        end if;

        #如果资产账户编号不为0，则处理资产账户相关数据

        /* if @资产账户编号#<>0 then */
        if v_asset_acco_no<>0 then
            #如果传入的市场编号有值，检查是否可操作

            /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][126][@市场编号#,@允许投资市场#] */
            if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
                
                SET v_error_code = "prodA.8.22.126";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
                else
                    SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
                end if;
                leave label_pro;
            end if;

            #如果传入的证券类型有值，检查是否可操作

            /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][127][@证券类型#,@允许操作证券类型#] */
            if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
                
                SET v_error_code = "prodA.8.22.127";
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

                /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制打新》) > 0][128][@业务限制串#] */
                if instr(v_busi_limit_str, 1) > 0 then
                    
                    SET v_error_code = "prodA.8.22.128";
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

                /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制融资回购》) > 0][129][@业务限制串#] */
                if instr(v_busi_limit_str, 2) > 0 then
                    
                    SET v_error_code = "prodA.8.22.129";
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

                /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制融券回购》) > 0][130][@业务限制串#] */
                if instr(v_busi_limit_str, 3) > 0 then
                    
                    SET v_error_code = "prodA.8.22.130";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("业务限制串=",v_busi_limit_str);
                    end if;
                    leave label_pro;
                end if;

            end if;
        end if;

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @订单方向串#=substring(@订单方向串#,LOCATE(@分隔符#,@订单方向串#)+1); */
        set v_order_dir_str=substring(v_order_dir_str,LOCATE(v_split_str,v_order_dir_str)+1);

        /* set @证券类型串#=substring(@证券类型串#,LOCATE(@分隔符#,@证券类型串#)+1); */
        set v_stock_type_str=substring(v_stock_type_str,LOCATE(v_split_str,v_stock_type_str)+1);

        /* set @本币币种串#=substring(@本币币种串#,LOCATE(@分隔符#,@本币币种串#)+1); */
        set v_crncy_type_str=substring(v_crncy_type_str,LOCATE(v_split_str,v_crncy_type_str)+1);
    end while;

    /* if @资产账户编号#<>0 then */
    if v_asset_acco_no<>0 then

        /* 调用【原子_产品_账户_获取资产账户业务控制配置串】*/
        call db_prod.pra_pdacco_GetAsacConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_asac_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取资产账户业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @资产账户业务控制配置串# = @业务控制配置串#; */
        set v_asac_busi_config_str = v_busi_config_str;
        #如果指定自动审批，获取生成订单所需要的通道编号和外部账号

        /* set @通道编号# = 0; */
        set v_pass_no = 0;

        /* set @外部账号# = " "; */
        set v_out_acco = " ";

        /* [获取表记录变量][产品_账户_资产账户通道信息表][{通道编号},{外部账号}][@通道编号#,@外部账号#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select pass_no,out_acco into v_pass_no,v_out_acco from db_prod.tb_pdacco_asset_acco_ch where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.22.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;

        #获取净资产
    end if;
    #PB系统工作流检查

       /* 调用【原子_产品_交易接口_检查PB交易工作流】*/
       call db_prod.pra_pdexif_CheckPBExchWorkflow(
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
           v_asset_acco_no,
           v_pd_busi_config_str,
           v_sys_config_str,
           v_error_code,
           v_error_info,
           v_opor_no_str1,
           v_opor_no_str2,
           v_opor_no_str3);
       if v_error_code = "1" then
           SET v_error_code = "prodA.8.22.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_交易接口_检查PB交易工作流出现错误！',v_mysql_message);
           end if;
           leave label_pro;
       elseif v_error_code <> "0" then
           leave label_pro;
       end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_nav_asset = v_nav_asset;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_market_price_ratio = v_market_price_ratio;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_opor_no_str1 = v_opor_no_str1;
    SET p_opor_no_str2 = v_opor_no_str2;
    SET p_opor_no_str3 = v_opor_no_str3;
    SET p_asset_acco_type = v_asset_acco_type;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_交易接口_检查期货交易产品账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdexif_CheckFutuExchProdAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdexif_CheckFutuExchProdAccoInfo(
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
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_co_busi_config_str varchar(64),
    IN p_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_split_fee_typr_str varchar(64),
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
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_contrc_type int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_co_busi_config_str varchar(64);
    declare v_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_split_fee_typr_str varchar(64);
    declare v_nav_asset decimal(18,4);
    declare v_stock_type int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_cost_calc_type int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_comm_appr_oper int;
    declare v_market_price_ratio decimal(18,12);
    declare v_forbid_order_dir varchar(64);
    declare v_pd_status varchar(2);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_abolish_date int;
    declare v_pd_busi_config_str varchar(64);
    declare v_asac_avail_amt decimal(18,4);
    declare v_asset_acco varchar(16);
    declare v_asset_acco_name varchar(64);
    declare v_asset_acco_type int;
    declare v_trade_pwd varchar(64);
    declare v_asset_acco_status varchar(2);
    declare v_busi_limit_str varchar(2048);
    declare v_exter_comm_flag int;
    declare v_remark_info varchar(255);
    declare v_busi_depart varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_busi_config_str = p_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_split_fee_typr_str = " ";
    SET v_nav_asset = 0;
    SET v_stock_type = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_cost_calc_type = 0;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_comm_appr_oper = 0;
    SET v_market_price_ratio = 0;
    SET v_forbid_order_dir = " ";
    SET v_pd_status = "0";
    SET v_comm_no_limit_price_ratio = 0;
    SET v_abolish_date = 0;
    SET v_pd_busi_config_str = " ";
    SET v_asac_avail_amt = 0;
    SET v_asset_acco = " ";
    SET v_asset_acco_name = " ";
    SET v_asset_acco_type = 0;
    SET v_trade_pwd = " ";
    SET v_asset_acco_status = "0";
    SET v_busi_limit_str = " ";
    SET v_exter_comm_flag = 0;
    SET v_remark_info = " ";
    SET v_busi_depart = " ";

    
    label_pro:BEGIN
    

    /* set @证券类型#=@合约类型#; */
    set v_stock_type=v_contrc_type;

    /* set @交易组业务控制配置串# = @业务控制配置串#; */
    set v_exgp_busi_config_str = v_busi_config_str;

    /* [获取表记录变量][产品_账户_产品限制信息表][字段][字段变量][{产品编号}=@产品编号#][4][@产品编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, cost_calc_type, allow_exch, allow_stock_type, 
        busi_config_str, comm_appr_oper, market_price_ratio, forbid_order_dir, 
        pd_status, comm_no_limit_price_ratio, abolish_date into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_cost_calc_type, v_allow_exch, v_allow_stock_type, 
        v_busi_config_str, v_comm_appr_oper, v_market_price_ratio, v_forbid_order_dir, 
        v_pd_status, v_comm_no_limit_price_ratio, v_abolish_date from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.8.108.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @产品业务控制配置串# = @业务控制配置串#; */
    set v_pd_busi_config_str = v_busi_config_str;
    #产品状态检查

    /* [检查报错返回][@产品状态# <> 《产品状态-正常》][105][@产品编号#] */
    if v_pd_status <> "1" then
        
        SET v_error_code = "prodA.8.108.105";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #检查产品级业务限制
    #如果传入的市场编号有值，检查是否可操作

    /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][106][@市场编号#,@允许投资市场#] */
    if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
        
        SET v_error_code = "prodA.8.108.106";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
        end if;
        leave label_pro;
    end if;

    #如果传入的证券类型有值，检查是否可操作

    /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][107][@证券类型#,@允许操作证券类型#] */
    if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
        
        SET v_error_code = "prodA.8.108.107";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
        end if;
        leave label_pro;
    end if;

    #如果交易组编号不为0，则处理交易组相关数据

    /* if @交易组编号#<>0 then */
    if v_exch_group_no<>0 then

        /* 调用【原子_产品_账户_获取交易组业务控制配置串】*/
        call db_prod.pra_pdacco_GetExgpConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_exgp_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.108.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取交易组业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @交易组业务控制配置串# = @业务控制配置串#; */
        set v_exgp_busi_config_str = v_busi_config_str;
        #获取净资产
    end if;
    #如果资产账户编号不为0，则处理资产账户相关数据

    /* if @资产账户编号#<>0 then */
    if v_asset_acco_no<>0 then

        /* set @资产账户可用金额# = 0; */
        set v_asac_avail_amt = 0;
        #获取资产账户编号和资产账户状态

        /* [获取表记录变量][产品_账户_资产账户信息表][字段][字段变量][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, asset_acco_no, 
            co_no, pd_no, asset_acco, asset_acco_name, 
            asset_acco_type, trade_pwd, asset_acco_status, busi_config_str, 
            market_price_ratio, allow_exch, allow_stock_type, split_fee_typr_str, 
            busi_limit_str, exter_comm_flag, remark_info, busi_depart, 
            abolish_date into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_asset_acco_no, 
            v_co_no, v_pd_no, v_asset_acco, v_asset_acco_name, 
            v_asset_acco_type, v_trade_pwd, v_asset_acco_status, v_busi_config_str, 
            v_market_price_ratio, v_allow_exch, v_allow_stock_type, v_split_fee_typr_str, 
            v_busi_limit_str, v_exter_comm_flag, v_remark_info, v_busi_depart, 
            v_abolish_date from db_prod.tb_pdacco_asset_acco where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.108.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;


        /* set @资产账户业务控制配置串# = @业务控制配置串#; */
        set v_asac_busi_config_str = v_busi_config_str;
        #资产账户状态检查

        /* [检查报错返回][@资产账户状态# <> 《资产账户状态-正常》][125][@资产账户状态#] */
        if v_asset_acco_status <> "1" then
            
            SET v_error_code = "prodA.8.108.125";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户状态=",v_asset_acco_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户状态=",v_asset_acco_status);
            end if;
            leave label_pro;
        end if;

        #如果传入的市场编号有值，检查是否可操作

        /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][126][@市场编号#,@允许投资市场#] */
        if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
            
            SET v_error_code = "prodA.8.108.126";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
            end if;
            leave label_pro;
        end if;

        #如果传入的证券类型有值，检查是否可操作

        /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][127][@证券类型#,@允许操作证券类型#] */
        if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
            
            SET v_error_code = "prodA.8.108.127";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
            end if;
            leave label_pro;
        end if;

        #如果传入的指令方向有值，检查是否有相应业务限制
        #if @订单方向# = 《订单方向-新股申购》 then
        #    [检查报错返回][instr(@业务限制串#, 《业务限制-限制打新》) = 0][128][@业务限制串#]
       # end if;
       # if @订单方向# = 《订单方向-融资回购》 then
       #     [检查报错返回][instr(@业务限制串#, 《业务限制-限制融资回购》) = 0][129][@业务限制串#]
       # end if;
       # if @订单方向# = 《订单方向-融券回购》 then
        #    [检查报错返回][instr(@业务限制串#, 《业务限制-限制融券回购》) = 0][130][@业务限制串#]
       # end if;

        /* 调用【原子_产品_账户_获取资产账户业务控制配置串】*/
        call db_prod.pra_pdacco_GetAsacConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_asac_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.108.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取资产账户业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @资产账户业务控制配置串# = @业务控制配置串#; */
        set v_asac_busi_config_str = v_busi_config_str;
        #如果指定自动审批，获取生成订单所需要的通道编号和外部账号

        /* set @通道编号# = 0; */
        set v_pass_no = 0;

        /* set @外部账号# = " "; */
        set v_out_acco = " ";

        /* [获取表记录变量][产品_账户_资产账户通道信息表][{通道编号},{外部账号}][@通道编号#,@外部账号#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select pass_no,out_acco into v_pass_no,v_out_acco from db_prod.tb_pdacco_asset_acco_ch where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.108.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;

        #获取净资产
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_nav_asset = v_nav_asset;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_交易接口_检查PB指令工作流
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdexif_CheckPBCommandWorkflow;;
DELIMITER ;;
CREATE PROCEDURE pra_pdexif_CheckPBCommandWorkflow(
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
    IN p_asset_acco_no int,
    IN p_pd_busi_config_str varchar(64),
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_opor_no_str1 varchar(2048),
    OUT p_opor_no_str2 varchar(2048),
    OUT p_opor_no_str3 varchar(2048)
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
    declare v_asset_acco_no int;
    declare v_pd_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_opor_no_str1 varchar(2048);
    declare v_opor_no_str2 varchar(2048);
    declare v_opor_no_str3 varchar(2048);
    declare v_workflow_type int;
    declare v_workflow_num int;
    declare v_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pd_busi_config_str = p_pd_busi_config_str;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_opor_no_str1 = " ";
    SET v_opor_no_str2 = " ";
    SET v_opor_no_str3 = " ";
    SET v_workflow_type = 0;
    SET v_workflow_num = 0;
    SET v_opor_no_str = " ";

    
    label_pro:BEGIN
    
    #PB系统工作流检查

    /* if substring(@系统控制配置串#, 7, 1) = 《系统类型-PB系统》 then */
    if substring(v_sys_config_str, 7, 1) = 1 then
       # 独立交易员模式下不能下达指令

            /* [检查报错返回][substring(@产品业务控制配置串#, 25, 1) = 《工作流模式-独立交易员》][911][@产品编号#] */
            if substring(v_pd_busi_config_str, 25, 1) = 3 then
                
                SET v_error_code = "prodA.8.109.911";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("产品编号=",v_pd_no);
                end if;
                leave label_pro;
            end if;


            /* [获取表记录变量][产品_账户_产品工作流信息表][{工作流模式},{工作流顺序号},{操作员编号串}][@工作流模式#,@工作流顺序号#,@操作员编号串#][{产品编号}=@产品编号#  and {工作流顺序号} = 1][4][@产品编号#] */
            select workflow_type,workflow_num,opor_no_str into v_workflow_type,v_workflow_num,v_opor_no_str from db_prod.tb_pdacco_pd_workflow where pd_no=v_pd_no  and workflow_num = 1 limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "prodA.8.109.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("产品编号=",v_pd_no);
                end if;
                leave label_pro;
            end if;

          #不在第一个节点的操作员不能下指令

            /* [检查报错返回][instr(@操作员编号串#, @操作员编号#) = 0][912][@操作员编号串#] */
            if instr(v_opor_no_str, v_opor_no) = 0 then
                
                SET v_error_code = "prodA.8.109.912";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("操作员编号串=",v_opor_no_str),"#",v_mysql_message);
                else
                    SET v_error_info = concat("操作员编号串=",v_opor_no_str);
                end if;
                leave label_pro;
            end if;


            /* set @操作员编号串1# =  @操作员编号串#; */
            set v_opor_no_str1 =  v_opor_no_str;

            /* [获取表记录变量语句][产品_账户_产品工作流信息表][{操作员编号串}][@操作员编号串2#][{产品编号}=@产品编号#  and {工作流顺序号} = 2][5][@产品编号#] */
            select opor_no_str into v_opor_no_str2 from db_prod.tb_pdacco_pd_workflow where pd_no=v_pd_no  and workflow_num = 2 limit 1;


            /* [获取表记录变量语句][产品_账户_产品工作流信息表][{操作员编号串}][@操作员编号串3#][{产品编号}=@产品编号#  and {工作流顺序号} = 3][6][@产品编号#] */
            select opor_no_str into v_opor_no_str3 from db_prod.tb_pdacco_pd_workflow where pd_no=v_pd_no  and workflow_num = 3 limit 1;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_opor_no_str1 = v_opor_no_str1;
    SET p_opor_no_str2 = v_opor_no_str2;
    SET p_opor_no_str3 = v_opor_no_str3;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_交易接口_检查PB交易工作流
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdexif_CheckPBExchWorkflow;;
DELIMITER ;;
CREATE PROCEDURE pra_pdexif_CheckPBExchWorkflow(
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
    IN p_asset_acco_no int,
    IN p_pd_busi_config_str varchar(64),
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_opor_no_str1 varchar(2048),
    OUT p_opor_no_str2 varchar(2048),
    OUT p_opor_no_str3 varchar(2048)
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
    declare v_asset_acco_no int;
    declare v_pd_busi_config_str varchar(64);
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_opor_no_str1 varchar(2048);
    declare v_opor_no_str2 varchar(2048);
    declare v_opor_no_str3 varchar(2048);
    declare v_workflow_type int;
    declare v_workflow_num int;
    declare v_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pd_busi_config_str = p_pd_busi_config_str;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_opor_no_str1 = " ";
    SET v_opor_no_str2 = " ";
    SET v_opor_no_str3 = " ";
    SET v_workflow_type = 0;
    SET v_workflow_num = 0;
    SET v_opor_no_str = " ";

    
    label_pro:BEGIN
    
    #PB系统工作流检查

    /* if substring(@系统控制配置串#, 7, 1) = 《系统类型-PB系统》 then */
    if substring(v_sys_config_str, 7, 1) = 1 then
       # 非独立交易员模式下不能直接下订单

            /* [检查报错返回][substring(@产品业务控制配置串#, 25, 1) <> 《工作流模式-独立交易员》][913][@产品编号#] */
            if substring(v_pd_busi_config_str, 25, 1) <> 3 then
                
                SET v_error_code = "prodA.8.111.913";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("产品编号=",v_pd_no);
                end if;
                leave label_pro;
            end if;


            /* [获取表记录变量][产品_账户_产品工作流信息表][{工作流模式},{工作流顺序号},{操作员编号串}][@工作流模式#,@工作流顺序号#,@操作员编号串#][{产品编号}=@产品编号#  and {工作流顺序号} = 1][4][@产品编号#] */
            select workflow_type,workflow_num,opor_no_str into v_workflow_type,v_workflow_num,v_opor_no_str from db_prod.tb_pdacco_pd_workflow where pd_no=v_pd_no  and workflow_num = 1 limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "prodA.8.111.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("产品编号=",v_pd_no);
                end if;
                leave label_pro;
            end if;

          #不在第一个节点的操作员不能下指令

            /* [检查报错返回][instr(@操作员编号串#, @操作员编号#) = 0][914][@操作员编号串#] */
            if instr(v_opor_no_str, v_opor_no) = 0 then
                
                SET v_error_code = "prodA.8.111.914";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("操作员编号串=",v_opor_no_str),"#",v_mysql_message);
                else
                    SET v_error_info = concat("操作员编号串=",v_opor_no_str);
                end if;
                leave label_pro;
            end if;


            /* set @操作员编号串1# =  @操作员编号串#; */
            set v_opor_no_str1 =  v_opor_no_str;

            /* [获取表记录变量语句][产品_账户_产品工作流信息表][{操作员编号串}][@操作员编号串2#][{产品编号}=@产品编号#  and {工作流顺序号} = 2][5][@产品编号#] */
            select opor_no_str into v_opor_no_str2 from db_prod.tb_pdacco_pd_workflow where pd_no=v_pd_no  and workflow_num = 2 limit 1;


            /* [获取表记录变量语句][产品_账户_产品工作流信息表][{操作员编号串}][@操作员编号串3#][{产品编号}=@产品编号#  and {工作流顺序号} = 3][6][@产品编号#] */
            select opor_no_str into v_opor_no_str3 from db_prod.tb_pdacco_pd_workflow where pd_no=v_pd_no  and workflow_num = 3 limit 1;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_opor_no_str1 = v_opor_no_str1;
    SET p_opor_no_str2 = v_opor_no_str2;
    SET p_opor_no_str3 = v_opor_no_str3;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_交易接口_检查期货指令产品账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdexif_CheckFutuCommProdAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdexif_CheckFutuCommProdAccoInfo(
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
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_co_busi_config_str varchar(64),
    IN p_busi_config_str varchar(64),
    IN p_co_comm_appr_oper int,
    IN p_sys_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_split_fee_typr_str varchar(64),
    OUT p_busi_limit_str varchar(2048),
    OUT p_comm_appr_oper int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exter_comm_flag int,
    OUT p_market_price_ratio decimal(18,12),
    OUT p_comm_no_limit_price_ratio decimal(18,12),
    OUT p_cost_calc_type int,
    OUT p_comm_appr_set int,
    OUT p_opor_no_str1 varchar(2048),
    OUT p_opor_no_str2 varchar(2048),
    OUT p_opor_no_str3 varchar(2048)
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
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_contrc_type int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_co_busi_config_str varchar(64);
    declare v_busi_config_str varchar(64);
    declare v_co_comm_appr_oper int;
    declare v_sys_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_split_fee_typr_str varchar(64);
    declare v_busi_limit_str varchar(2048);
    declare v_comm_appr_oper int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exter_comm_flag int;
    declare v_market_price_ratio decimal(18,12);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_cost_calc_type int;
    declare v_comm_appr_set int;
    declare v_opor_no_str1 varchar(2048);
    declare v_opor_no_str2 varchar(2048);
    declare v_opor_no_str3 varchar(2048);
    declare v_stock_type int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_forbid_order_dir varchar(64);
    declare v_pd_status varchar(2);
    declare v_abolish_date int;
    declare v_pd_busi_config_str varchar(64);
    declare v_asac_avail_amt decimal(18,4);
    declare v_asset_acco varchar(16);
    declare v_asset_acco_name varchar(64);
    declare v_asset_acco_type int;
    declare v_trade_pwd varchar(64);
    declare v_asset_acco_status varchar(2);
    declare v_remark_info varchar(255);
    declare v_busi_depart varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_busi_config_str = p_busi_config_str;
    SET v_co_comm_appr_oper = p_co_comm_appr_oper;
    SET v_sys_config_str = p_sys_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_split_fee_typr_str = " ";
    SET v_busi_limit_str = " ";
    SET v_comm_appr_oper = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exter_comm_flag = 0;
    SET v_market_price_ratio = 0;
    SET v_comm_no_limit_price_ratio = 0;
    SET v_cost_calc_type = 0;
    SET v_comm_appr_set = 0;
    SET v_opor_no_str1 = " ";
    SET v_opor_no_str2 = " ";
    SET v_opor_no_str3 = " ";
    SET v_stock_type = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_forbid_order_dir = " ";
    SET v_pd_status = "0";
    SET v_abolish_date = 0;
    SET v_pd_busi_config_str = " ";
    SET v_asac_avail_amt = 0;
    SET v_asset_acco = " ";
    SET v_asset_acco_name = " ";
    SET v_asset_acco_type = 0;
    SET v_trade_pwd = " ";
    SET v_asset_acco_status = "0";
    SET v_remark_info = " ";
    SET v_busi_depart = " ";

    
    label_pro:BEGIN
    

    /* set @证券类型#=@合约类型#; */
    set v_stock_type=v_contrc_type;

    /* set @交易组业务控制配置串# = @业务控制配置串#; */
    set v_exgp_busi_config_str = v_busi_config_str;

    /* [获取表记录变量][产品_账户_产品限制信息表][字段][字段变量][{产品编号}=@产品编号#][4][@产品编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, cost_calc_type, allow_exch, allow_stock_type, 
        busi_config_str, comm_appr_oper, market_price_ratio, forbid_order_dir, 
        pd_status, comm_no_limit_price_ratio, abolish_date into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_cost_calc_type, v_allow_exch, v_allow_stock_type, 
        v_busi_config_str, v_comm_appr_oper, v_market_price_ratio, v_forbid_order_dir, 
        v_pd_status, v_comm_no_limit_price_ratio, v_abolish_date from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.8.112.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @产品业务控制配置串# = @业务控制配置串#; */
    set v_pd_busi_config_str = v_busi_config_str;
    #根据产品业务控制配置串，第5位处理，是否重置指令审批操作员

    /* if substring(@产品业务控制配置串#, 5, 1) = 《指令审批设置-不设置》 or (substring(@产品业务控制配置串#, 5, 1) = 《指令审批设置-自动审批》 and @指令审批操作员# = 0) then */
    if substring(v_pd_busi_config_str, 5, 1) = 3 or (substring(v_pd_busi_config_str, 5, 1) = 1 and v_comm_appr_oper = 0) then

        /* set @指令审批操作员# = @机构指令审批操作员#; */
        set v_comm_appr_oper = v_co_comm_appr_oper;
    end if;
    #产品状态检查

    /* [检查报错返回][@产品状态# <> 《产品状态-正常》][105][@产品编号#] */
    if v_pd_status <> "1" then
        
        SET v_error_code = "prodA.8.112.105";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #检查产品级业务限制
    #如果传入的市场编号有值，检查是否可操作

    /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][106][@市场编号#,@允许投资市场#] */
    if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
        
        SET v_error_code = "prodA.8.112.106";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
        end if;
        leave label_pro;
    end if;

    #如果传入的证券类型有值，检查是否可操作

    /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][107][@证券类型#,@允许操作证券类型#] */
    if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
        
        SET v_error_code = "prodA.8.112.107";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
        end if;
        leave label_pro;
    end if;

    #如果交易组编号不为0，则处理交易组相关数据

    /* if @交易组编号#<>0 then */
    if v_exch_group_no<>0 then

        /* 调用【原子_产品_账户_获取交易组业务控制配置串】*/
        call db_prod.pra_pdacco_GetExgpConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_exgp_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.112.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取交易组业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @交易组业务控制配置串# = @业务控制配置串#; */
        set v_exgp_busi_config_str = v_busi_config_str;
        #获取净资产
    end if;
    #如果资产账户编号不为0，则处理资产账户相关数据

    /* if @资产账户编号#<>0 then */
    if v_asset_acco_no<>0 then

        /* set @资产账户可用金额# = 0; */
        set v_asac_avail_amt = 0;
        #获取资产账户编号和资产账户状态

        /* [获取表记录变量][产品_账户_资产账户信息表][字段][字段变量][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, asset_acco_no, 
            co_no, pd_no, asset_acco, asset_acco_name, 
            asset_acco_type, trade_pwd, asset_acco_status, busi_config_str, 
            market_price_ratio, allow_exch, allow_stock_type, split_fee_typr_str, 
            busi_limit_str, exter_comm_flag, remark_info, busi_depart, 
            abolish_date into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_asset_acco_no, 
            v_co_no, v_pd_no, v_asset_acco, v_asset_acco_name, 
            v_asset_acco_type, v_trade_pwd, v_asset_acco_status, v_busi_config_str, 
            v_market_price_ratio, v_allow_exch, v_allow_stock_type, v_split_fee_typr_str, 
            v_busi_limit_str, v_exter_comm_flag, v_remark_info, v_busi_depart, 
            v_abolish_date from db_prod.tb_pdacco_asset_acco where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.112.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;


        /* set @资产账户业务控制配置串# = @业务控制配置串#; */
        set v_asac_busi_config_str = v_busi_config_str;
        #资产账户状态检查

        /* [检查报错返回][@资产账户状态# <> 《资产账户状态-正常》][125][@资产账户状态#] */
        if v_asset_acco_status <> "1" then
            
            SET v_error_code = "prodA.8.112.125";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户状态=",v_asset_acco_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户状态=",v_asset_acco_status);
            end if;
            leave label_pro;
        end if;

        #如果传入的市场编号有值，检查是否可操作

        /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][126][@市场编号#,@允许投资市场#] */
        if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
            
            SET v_error_code = "prodA.8.112.126";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
            end if;
            leave label_pro;
        end if;

        #如果传入的证券类型有值，检查是否可操作

        /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][127][@证券类型#,@允许操作证券类型#] */
        if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
            
            SET v_error_code = "prodA.8.112.127";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
            end if;
            leave label_pro;
        end if;


        /* 调用【原子_产品_账户_获取资产账户业务控制配置串】*/
        call db_prod.pra_pdacco_GetAsacConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_asac_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.112.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取资产账户业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @资产账户业务控制配置串# = @业务控制配置串#; */
        set v_asac_busi_config_str = v_busi_config_str;
        #如果指定自动审批，获取生成订单所需要的通道编号和外部账号

        /* set @通道编号# = 0; */
        set v_pass_no = 0;

        /* set @外部账号# = " "; */
        set v_out_acco = " ";

        /* [获取表记录变量][产品_账户_资产账户通道信息表][{通道编号},{外部账号}][@通道编号#,@外部账号#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select pass_no,out_acco into v_pass_no,v_out_acco from db_prod.tb_pdacco_asset_acco_ch where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.112.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;

        #获取净资产
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_busi_limit_str = v_busi_limit_str;
    SET p_comm_appr_oper = v_comm_appr_oper;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exter_comm_flag = v_exter_comm_flag;
    SET p_market_price_ratio = v_market_price_ratio;
    SET p_comm_no_limit_price_ratio = v_comm_no_limit_price_ratio;
    SET p_cost_calc_type = v_cost_calc_type;
    SET p_comm_appr_set = v_comm_appr_set;
    SET p_opor_no_str1 = v_opor_no_str1;
    SET p_opor_no_str2 = v_opor_no_str2;
    SET p_opor_no_str3 = v_opor_no_str3;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_交易接口_检查期货审批产品账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdexif_CheckFutuApprProdAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdexif_CheckFutuApprProdAccoInfo(
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
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_co_busi_config_str varchar(64),
    IN p_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_busi_config_str varchar(64),
    OUT p_asac_busi_config_str varchar(64),
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_split_fee_typr_str varchar(64),
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
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_contrc_type int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_co_busi_config_str varchar(64);
    declare v_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_split_fee_typr_str varchar(64);
    declare v_nav_asset decimal(18,4);
    declare v_stock_type int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_cost_calc_type int;
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_comm_appr_oper int;
    declare v_market_price_ratio decimal(18,12);
    declare v_forbid_order_dir varchar(64);
    declare v_pd_status varchar(2);
    declare v_comm_no_limit_price_ratio decimal(18,12);
    declare v_abolish_date int;
    declare v_pd_busi_config_str varchar(64);
    declare v_asac_avail_amt decimal(18,4);
    declare v_asset_acco varchar(16);
    declare v_asset_acco_name varchar(64);
    declare v_asset_acco_type int;
    declare v_trade_pwd varchar(64);
    declare v_asset_acco_status varchar(2);
    declare v_busi_limit_str varchar(2048);
    declare v_exter_comm_flag int;
    declare v_remark_info varchar(255);
    declare v_busi_depart varchar(255);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_busi_config_str = p_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_busi_config_str = " ";
    SET v_asac_busi_config_str = " ";
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_split_fee_typr_str = " ";
    SET v_nav_asset = 0;
    SET v_stock_type = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_cost_calc_type = 0;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_comm_appr_oper = 0;
    SET v_market_price_ratio = 0;
    SET v_forbid_order_dir = " ";
    SET v_pd_status = "0";
    SET v_comm_no_limit_price_ratio = 0;
    SET v_abolish_date = 0;
    SET v_pd_busi_config_str = " ";
    SET v_asac_avail_amt = 0;
    SET v_asset_acco = " ";
    SET v_asset_acco_name = " ";
    SET v_asset_acco_type = 0;
    SET v_trade_pwd = " ";
    SET v_asset_acco_status = "0";
    SET v_busi_limit_str = " ";
    SET v_exter_comm_flag = 0;
    SET v_remark_info = " ";
    SET v_busi_depart = " ";

    
    label_pro:BEGIN
    

    /* set @证券类型#=@合约类型#; */
    set v_stock_type=v_contrc_type;

    /* set @交易组业务控制配置串# = @业务控制配置串#; */
    set v_exgp_busi_config_str = v_busi_config_str;

    /* [获取表记录变量][产品_账户_产品限制信息表][字段][字段变量][{产品编号}=@产品编号#][4][@产品编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, cost_calc_type, allow_exch, allow_stock_type, 
        busi_config_str, comm_appr_oper, market_price_ratio, forbid_order_dir, 
        pd_status, comm_no_limit_price_ratio, abolish_date into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_cost_calc_type, v_allow_exch, v_allow_stock_type, 
        v_busi_config_str, v_comm_appr_oper, v_market_price_ratio, v_forbid_order_dir, 
        v_pd_status, v_comm_no_limit_price_ratio, v_abolish_date from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.8.113.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #[检查报错返回][@操作员编号# <> @指令审批操作员#][70][@操作员编号#,@指令审批操作员#]

    /* set @产品业务控制配置串# = @业务控制配置串#; */
    set v_pd_busi_config_str = v_busi_config_str;
    #产品状态检查

    /* [检查报错返回][@产品状态# <> 《产品状态-正常》][105][@产品编号#] */
    if v_pd_status <> "1" then
        
        SET v_error_code = "prodA.8.113.105";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    #检查产品级业务限制
    #如果传入的市场编号有值，检查是否可操作

    /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][106][@市场编号#,@允许投资市场#] */
    if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
        
        SET v_error_code = "prodA.8.113.106";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
        end if;
        leave label_pro;
    end if;

    #如果传入的证券类型有值，检查是否可操作

    /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][107][@证券类型#,@允许操作证券类型#] */
    if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
        
        SET v_error_code = "prodA.8.113.107";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
        end if;
        leave label_pro;
    end if;

    #如果交易组编号不为0，则处理交易组相关数据

    /* if @交易组编号#<>0 then */
    if v_exch_group_no<>0 then

        /* 调用【原子_产品_账户_获取交易组业务控制配置串】*/
        call db_prod.pra_pdacco_GetExgpConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_exgp_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.113.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取交易组业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @交易组业务控制配置串# = @业务控制配置串#; */
        set v_exgp_busi_config_str = v_busi_config_str;
        #获取净资产
    end if;
    #如果资产账户编号不为0，则处理资产账户相关数据

    /* if @资产账户编号#<>0 then */
    if v_asset_acco_no<>0 then

        /* set @资产账户可用金额# = 0; */
        set v_asac_avail_amt = 0;
        #获取资产账户编号和资产账户状态

        /* [获取表记录变量][产品_账户_资产账户信息表][字段][字段变量][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, asset_acco_no, 
            co_no, pd_no, asset_acco, asset_acco_name, 
            asset_acco_type, trade_pwd, asset_acco_status, busi_config_str, 
            market_price_ratio, allow_exch, allow_stock_type, split_fee_typr_str, 
            busi_limit_str, exter_comm_flag, remark_info, busi_depart, 
            abolish_date into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_asset_acco_no, 
            v_co_no, v_pd_no, v_asset_acco, v_asset_acco_name, 
            v_asset_acco_type, v_trade_pwd, v_asset_acco_status, v_busi_config_str, 
            v_market_price_ratio, v_allow_exch, v_allow_stock_type, v_split_fee_typr_str, 
            v_busi_limit_str, v_exter_comm_flag, v_remark_info, v_busi_depart, 
            v_abolish_date from db_prod.tb_pdacco_asset_acco where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.113.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;


        /* set @资产账户业务控制配置串# = @业务控制配置串#; */
        set v_asac_busi_config_str = v_busi_config_str;
        #资产账户状态检查

        /* [检查报错返回][@资产账户状态# <> 《资产账户状态-正常》][125][@资产账户状态#] */
        if v_asset_acco_status <> "1" then
            
            SET v_error_code = "prodA.8.113.125";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户状态=",v_asset_acco_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户状态=",v_asset_acco_status);
            end if;
            leave label_pro;
        end if;

        #如果传入的市场编号有值，检查是否可操作

        /* [检查报错返回][@市场编号# <> 0 and instr(@允许投资市场#, @市场编号#) = 0][126][@市场编号#,@允许投资市场#] */
        if v_exch_no <> 0 and instr(v_allow_exch, v_exch_no) = 0 then
            
            SET v_error_code = "prodA.8.113.126";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch),"#",v_mysql_message);
            else
                SET v_error_info = concat("市场编号=",v_exch_no,",","允许投资市场=",v_allow_exch);
            end if;
            leave label_pro;
        end if;

        #如果传入的证券类型有值，检查是否可操作

        /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][127][@证券类型#,@允许操作证券类型#] */
        if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
            
            SET v_error_code = "prodA.8.113.127";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
            end if;
            leave label_pro;
        end if;

        #如果传入的指令方向有值，检查是否有相应业务限制
        #if @订单方向# = 《订单方向-新股申购》 then
        #    [检查报错返回][instr(@业务限制串#, 《业务限制-限制打新》) = 0][128][@业务限制串#]
       # end if;
       # if @订单方向# = 《订单方向-融资回购》 then
       #     [检查报错返回][instr(@业务限制串#, 《业务限制-限制融资回购》) = 0][129][@业务限制串#]
       # end if;
       # if @订单方向# = 《订单方向-融券回购》 then
        #    [检查报错返回][instr(@业务限制串#, 《业务限制-限制融券回购》) = 0][130][@业务限制串#]
       # end if;

        /* 调用【原子_产品_账户_获取资产账户业务控制配置串】*/
        call db_prod.pra_pdacco_GetAsacConfigStr(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_busi_config_str,
            v_pd_busi_config_str,
            v_asac_busi_config_str,
            v_error_code,
            v_error_info,
            v_busi_config_str);
        if v_error_code = "1" then
            SET v_error_code = "prodA.8.113.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_获取资产账户业务控制配置串出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @资产账户业务控制配置串# = @业务控制配置串#; */
        set v_asac_busi_config_str = v_busi_config_str;
        #如果指定自动审批，获取生成订单所需要的通道编号和外部账号

        /* set @通道编号# = 0; */
        set v_pass_no = 0;

        /* set @外部账号# = " "; */
        set v_out_acco = " ";

        /* [获取表记录变量][产品_账户_资产账户通道信息表][{通道编号},{外部账号}][@通道编号#,@外部账号#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select pass_no,out_acco into v_pass_no,v_out_acco from db_prod.tb_pdacco_asset_acco_ch where asset_acco_no=v_asset_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "prodA.8.113.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;

        #获取净资产
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_busi_config_str = v_exgp_busi_config_str;
    SET p_asac_busi_config_str = v_asac_busi_config_str;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_split_fee_typr_str = v_split_fee_typr_str;
    SET p_nav_asset = v_nav_asset;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_交易接口_获取资产账户默认交易组编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdexif_GetAccoDefaultExgp;;
DELIMITER ;;
CREATE PROCEDURE pra_pdexif_GetAccoDefaultExgp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
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
    declare v_asset_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_资产账户默认交易组信息表][{交易组编号}][@交易组编号#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
    select exch_group_no into v_exch_group_no from db_prod.tb_pdacco_asset_acco_default_exgp where asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.8.114.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_交易接口_获取融资融券卖券还款方式
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdexif_GetFinaLoanRepaymentWay;;
DELIMITER ;;
CREATE PROCEDURE pra_pdexif_GetFinaLoanRepaymentWay(
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
    IN p_order_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_fina_return_type int,
    OUT p_sell_auto_back_debt int
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
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_fina_return_type int;
    declare v_sell_auto_back_debt int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_fina_return_type = 0;
    SET v_sell_auto_back_debt = 0;

    
    label_pro:BEGIN
    

    /* if  @订单方向# = 《订单方向-卖券还款》 or @订单方向# = 《订单方向-直接还款》  or @订单方向# = 《订单方向-卖出》 then */
    if  v_order_dir = 7 or v_order_dir = 14  or v_order_dir = 2 then

        /* [获取表记录变量语句][产品_账户_融资融券配置表][{卖券还款方式},{卖出自动还款}][@卖券还款方式#,@卖出自动还款#][{机构编号} = @机构编号# and {产品编号} = @产品编号# and {资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
        select fina_return_type,sell_auto_back_debt into v_fina_return_type,v_sell_auto_back_debt from db_prod.tb_pdacco_fina_loan_config where co_no = v_co_no and pd_no = v_pd_no and asset_acco_no=v_asset_acco_no limit 1;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_fina_return_type = v_fina_return_type;
    SET p_sell_auto_back_debt = v_sell_auto_back_debt;

END;;


