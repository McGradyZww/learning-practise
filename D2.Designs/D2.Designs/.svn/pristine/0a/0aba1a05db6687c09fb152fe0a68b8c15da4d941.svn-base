DELIMITER ;;
use db_prod;;

# 事务_产品_资金_新增产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_AddPdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_AddPdCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_crncy_type varchar(3),
    IN p_first_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_cash_id bigint,
    OUT p_co_no int,
    OUT p_pd_first_amt decimal(18,4),
    OUT p_pd_curr_amt decimal(18,4),
    OUT p_pd_dist_amt decimal(18,4),
    OUT p_pd_auth_amt decimal(18,4),
    OUT p_pd_amt_check_diff decimal(18,4),
    OUT p_pd_pre_settle_amt decimal(18,4),
    OUT p_pd_total_cash_divide decimal(18,4),
    OUT p_pd_total_pre_fee decimal(18,4),
    OUT p_pd_total_rece_amt decimal(18,4),
    OUT p_pd_total_payab_amt decimal(18,4),
    OUT p_pd_intrst_cacl_amt decimal(18,4),
    OUT p_pd_pre_entry_intrst_amt decimal(18,4),
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
    declare v_pd_no int;
    declare v_crncy_type varchar(3);
    declare v_first_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_cash_id bigint;
    declare v_co_no int;
    declare v_pd_first_amt decimal(18,4);
    declare v_pd_curr_amt decimal(18,4);
    declare v_pd_dist_amt decimal(18,4);
    declare v_pd_auth_amt decimal(18,4);
    declare v_pd_amt_check_diff decimal(18,4);
    declare v_pd_pre_settle_amt decimal(18,4);
    declare v_pd_total_cash_divide decimal(18,4);
    declare v_pd_total_pre_fee decimal(18,4);
    declare v_pd_total_rece_amt decimal(18,4);
    declare v_pd_total_payab_amt decimal(18,4);
    declare v_pd_intrst_cacl_amt decimal(18,4);
    declare v_pd_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_pd_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_crncy_type = p_crncy_type;
    SET v_first_amt = p_first_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_cash_id = 0;
    SET v_co_no = 0;
    SET v_pd_first_amt = 0;
    SET v_pd_curr_amt = 0;
    SET v_pd_dist_amt = 0;
    SET v_pd_auth_amt = 0;
    SET v_pd_amt_check_diff = 0;
    SET v_pd_pre_settle_amt = 0;
    SET v_pd_total_cash_divide = 0;
    SET v_pd_total_pre_fee = 0;
    SET v_pd_total_rece_amt = 0;
    SET v_pd_total_payab_amt = 0;
    SET v_pd_intrst_cacl_amt = 0;
    SET v_pd_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;
    SET v_pd_status = "0";

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@产品编号#,@机构编号#,@操作员机构编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.3.1.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_资金_新增产品资金】*/
        call db_prod.pra_pdcapit_AddPdCapital(
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
            v_crncy_type,
            v_first_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_cash_id,
            v_pd_first_amt,
            v_pd_curr_amt,
            v_pd_dist_amt,
            v_pd_auth_amt,
            v_pd_amt_check_diff,
            v_pd_pre_settle_amt,
            v_pd_total_cash_divide,
            v_pd_total_pre_fee,
            v_pd_total_rece_amt,
            v_pd_total_payab_amt,
            v_pd_intrst_cacl_amt,
            v_pd_pre_entry_intrst_amt,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.3.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_新增产品资金出现错误！',v_mysql_message);
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
    SET p_pd_cash_id = v_pd_cash_id;
    SET p_co_no = v_co_no;
    SET p_pd_first_amt = v_pd_first_amt;
    SET p_pd_curr_amt = v_pd_curr_amt;
    SET p_pd_dist_amt = v_pd_dist_amt;
    SET p_pd_auth_amt = v_pd_auth_amt;
    SET p_pd_amt_check_diff = v_pd_amt_check_diff;
    SET p_pd_pre_settle_amt = v_pd_pre_settle_amt;
    SET p_pd_total_cash_divide = v_pd_total_cash_divide;
    SET p_pd_total_pre_fee = v_pd_total_pre_fee;
    SET p_pd_total_rece_amt = v_pd_total_rece_amt;
    SET p_pd_total_payab_amt = v_pd_total_payab_amt;
    SET p_pd_intrst_cacl_amt = v_pd_intrst_cacl_amt;
    SET p_pd_pre_entry_intrst_amt = v_pd_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_资金_扣除产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_DeductPdFee;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_DeductPdFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
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
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_status varchar(2);
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
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@产品编号#,@机构编号#,@操作员机构编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.3.7.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_资金_扣除产品费用】*/
        call db_prod.pra_pdcapit_DeductPdFee(
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
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.3.7.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_扣除产品费用出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_资金_查询产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_QueryPdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_QueryPdCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @操作员编号# = 99990001 then */
    if v_opor_no = 99990001 then

        /* set @机构编号# = 0; */
        set v_co_no = 0;

        /* set @产品编号权限串# = ' '; */
        set v_pd_no_rights_str = ' ';
    end if;

    /* 调用【原子_产品_资金_查询产品资金】*/
    call db_prod.pra_pdcapit_QueryPdCapital(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_查询产品资金出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_资金_查询产品资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_QueryPdCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_QueryPdCapital_Jour(
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
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_资金_查询产品资金流水】*/
    call db_prod.pra_pdcapit_QueryPdCapital_Jour(
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
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_查询产品资金流水出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_资金_查询历史产品资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_QueryPdCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_QueryPdCapital_JourHis(
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
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品_资金_查询历史产品资金流水】*/
    call db_prod.pra_pdcapit_QueryPdCapital_JourHis(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.6.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_查询历史产品资金流水出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_资金_出入产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_ChgPdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_ChgPdCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_occur_share decimal(18,2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_cash_id bigint,
    OUT p_pd_first_amt decimal(18,4),
    OUT p_pd_curr_amt decimal(18,4),
    OUT p_pd_dist_amt decimal(18,4),
    OUT p_pd_auth_amt decimal(18,4),
    OUT p_pd_amt_check_diff decimal(18,4),
    OUT p_pd_pre_settle_amt decimal(18,4),
    OUT p_pd_total_cash_divide decimal(18,4),
    OUT p_pd_total_pre_fee decimal(18,4),
    OUT p_pd_total_rece_amt decimal(18,4),
    OUT p_pd_total_payab_amt decimal(18,4),
    OUT p_pd_intrst_cacl_amt decimal(18,4),
    OUT p_pd_pre_entry_intrst_amt decimal(18,4),
    OUT p_pd_update_times int,
    OUT p_pd_code varchar(32),
    OUT p_pd_name varchar(64),
    OUT p_pd_type int,
    OUT p_pd_apply_currency varchar(3),
    OUT p_pd_crncy_type varchar(3),
    OUT p_pd_first_asset decimal(18,4),
    OUT p_pd_all_share decimal(18,2),
    OUT p_pd_curr_share decimal(18,2),
    OUT p_pd_pre_share decimal(18,2),
    OUT p_pd_his_max_per_nav decimal(18,4),
    OUT p_pd_pre_nav decimal(18,4),
    OUT p_asac_update_times int
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
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_occur_share decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_cash_id bigint;
    declare v_pd_first_amt decimal(18,4);
    declare v_pd_curr_amt decimal(18,4);
    declare v_pd_dist_amt decimal(18,4);
    declare v_pd_auth_amt decimal(18,4);
    declare v_pd_amt_check_diff decimal(18,4);
    declare v_pd_pre_settle_amt decimal(18,4);
    declare v_pd_total_cash_divide decimal(18,4);
    declare v_pd_total_pre_fee decimal(18,4);
    declare v_pd_total_rece_amt decimal(18,4);
    declare v_pd_total_payab_amt decimal(18,4);
    declare v_pd_intrst_cacl_amt decimal(18,4);
    declare v_pd_pre_entry_intrst_amt decimal(18,4);
    declare v_pd_update_times int;
    declare v_pd_code varchar(32);
    declare v_pd_name varchar(64);
    declare v_pd_type int;
    declare v_pd_apply_currency varchar(3);
    declare v_pd_crncy_type varchar(3);
    declare v_pd_first_asset decimal(18,4);
    declare v_pd_all_share decimal(18,2);
    declare v_pd_curr_share decimal(18,2);
    declare v_pd_pre_share decimal(18,2);
    declare v_pd_his_max_per_nav decimal(18,4);
    declare v_pd_pre_nav decimal(18,4);
    declare v_asac_update_times int;
    declare v_pd_status varchar(2);
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
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_occur_share = p_occur_share;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_cash_id = 0;
    SET v_pd_first_amt = 0;
    SET v_pd_curr_amt = 0;
    SET v_pd_dist_amt = 0;
    SET v_pd_auth_amt = 0;
    SET v_pd_amt_check_diff = 0;
    SET v_pd_pre_settle_amt = 0;
    SET v_pd_total_cash_divide = 0;
    SET v_pd_total_pre_fee = 0;
    SET v_pd_total_rece_amt = 0;
    SET v_pd_total_payab_amt = 0;
    SET v_pd_intrst_cacl_amt = 0;
    SET v_pd_pre_entry_intrst_amt = 0;
    SET v_pd_update_times = 0;
    SET v_pd_code = " ";
    SET v_pd_name = " ";
    SET v_pd_type = 0;
    SET v_pd_apply_currency = "CNY";
    SET v_pd_crncy_type = "CNY";
    SET v_pd_first_asset = 0;
    SET v_pd_all_share = 0;
    SET v_pd_curr_share = 0;
    SET v_pd_pre_share = 0;
    SET v_pd_his_max_per_nav = 0;
    SET v_pd_pre_nav = 0;
    SET v_asac_update_times = 0;
    SET v_pd_status = "0";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号# and @操作员机构编号# <> 9999][50][@产品编号#,@机构编号#,@操作员机构编号#] */
    if v_co_no <> v_opor_co_no and v_opor_co_no <> 9999 then
        
        SET v_error_code = "prodT.3.8.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_资金_出入产品资金】*/
        call db_prod.pra_pdcapit_ChgPdCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_cash_id,
            v_pd_first_amt,
            v_pd_curr_amt,
            v_pd_dist_amt,
            v_pd_auth_amt,
            v_pd_amt_check_diff,
            v_pd_pre_settle_amt,
            v_pd_total_cash_divide,
            v_pd_total_pre_fee,
            v_pd_total_rece_amt,
            v_pd_total_payab_amt,
            v_pd_intrst_cacl_amt,
            v_pd_pre_entry_intrst_amt,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.3.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_出入产品资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @产品更新次数# = @更新次数#; */
        set v_pd_update_times = v_update_times;

        /* if @变动份额# <> 0 then */
        if v_occur_share <> 0 then

            /* 调用【原子_产品_账户_更新产品份额变动量】*/
            call db_prod.pra_pdacco_UpdateProductShareOcurr(
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
                v_occur_share,
                v_oper_remark_info,
                v_menu_no,
                v_error_code,
                v_error_info,
                v_pd_code,
                v_pd_name,
                v_pd_type,
                v_pd_apply_currency,
                v_pd_crncy_type,
                v_pd_first_asset,
                v_pd_all_share,
                v_pd_curr_share,
                v_pd_pre_share,
                v_pd_his_max_per_nav,
                v_pd_pre_nav,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "prodT.3.8.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_更新产品份额变动量出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @资产账户更新次数# = @更新次数#; */
            set v_asac_update_times = v_update_times;
        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_cash_id = v_pd_cash_id;
    SET p_pd_first_amt = v_pd_first_amt;
    SET p_pd_curr_amt = v_pd_curr_amt;
    SET p_pd_dist_amt = v_pd_dist_amt;
    SET p_pd_auth_amt = v_pd_auth_amt;
    SET p_pd_amt_check_diff = v_pd_amt_check_diff;
    SET p_pd_pre_settle_amt = v_pd_pre_settle_amt;
    SET p_pd_total_cash_divide = v_pd_total_cash_divide;
    SET p_pd_total_pre_fee = v_pd_total_pre_fee;
    SET p_pd_total_rece_amt = v_pd_total_rece_amt;
    SET p_pd_total_payab_amt = v_pd_total_payab_amt;
    SET p_pd_intrst_cacl_amt = v_pd_intrst_cacl_amt;
    SET p_pd_pre_entry_intrst_amt = v_pd_pre_entry_intrst_amt;
    SET p_pd_update_times = v_pd_update_times;
    SET p_pd_code = v_pd_code;
    SET p_pd_name = v_pd_name;
    SET p_pd_type = v_pd_type;
    SET p_pd_apply_currency = v_pd_apply_currency;
    SET p_pd_crncy_type = v_pd_crncy_type;
    SET p_pd_first_asset = v_pd_first_asset;
    SET p_pd_all_share = v_pd_all_share;
    SET p_pd_curr_share = v_pd_curr_share;
    SET p_pd_pre_share = v_pd_pre_share;
    SET p_pd_his_max_per_nav = v_pd_his_max_per_nav;
    SET p_pd_pre_nav = v_pd_pre_nav;
    SET p_asac_update_times = v_asac_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_资金_更新产品资金累计应收应付
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_UpdatePdCapitalRecePayab;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_UpdatePdCapitalRecePayab(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_crncy_type varchar(3),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_cash_id bigint,
    OUT p_co_no int,
    OUT p_pd_first_amt decimal(18,4),
    OUT p_pd_curr_amt decimal(18,4),
    OUT p_pd_dist_amt decimal(18,4),
    OUT p_pd_auth_amt decimal(18,4),
    OUT p_pd_amt_check_diff decimal(18,4),
    OUT p_pd_pre_settle_amt decimal(18,4),
    OUT p_pd_total_cash_divide decimal(18,4),
    OUT p_pd_total_pre_fee decimal(18,4),
    OUT p_pd_total_rece_amt decimal(18,4),
    OUT p_pd_total_payab_amt decimal(18,4),
    OUT p_pd_intrst_cacl_amt decimal(18,4),
    OUT p_pd_pre_entry_intrst_amt decimal(18,4),
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
    declare v_pd_no int;
    declare v_crncy_type varchar(3);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_cash_id bigint;
    declare v_co_no int;
    declare v_pd_first_amt decimal(18,4);
    declare v_pd_curr_amt decimal(18,4);
    declare v_pd_dist_amt decimal(18,4);
    declare v_pd_auth_amt decimal(18,4);
    declare v_pd_amt_check_diff decimal(18,4);
    declare v_pd_pre_settle_amt decimal(18,4);
    declare v_pd_total_cash_divide decimal(18,4);
    declare v_pd_total_pre_fee decimal(18,4);
    declare v_pd_total_rece_amt decimal(18,4);
    declare v_pd_total_payab_amt decimal(18,4);
    declare v_pd_intrst_cacl_amt decimal(18,4);
    declare v_pd_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_pd_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_crncy_type = p_crncy_type;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_cash_id = 0;
    SET v_co_no = 0;
    SET v_pd_first_amt = 0;
    SET v_pd_curr_amt = 0;
    SET v_pd_dist_amt = 0;
    SET v_pd_auth_amt = 0;
    SET v_pd_amt_check_diff = 0;
    SET v_pd_pre_settle_amt = 0;
    SET v_pd_total_cash_divide = 0;
    SET v_pd_total_pre_fee = 0;
    SET v_pd_total_rece_amt = 0;
    SET v_pd_total_payab_amt = 0;
    SET v_pd_intrst_cacl_amt = 0;
    SET v_pd_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;
    SET v_pd_status = "0";

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.9.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@产品编号#,@机构编号#,@操作员机构编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.3.9.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_资金_更新产品资金累计应收应付】*/
        call db_prod.pra_pdcapit_UpdatePdCapitalRecePayab(
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
            v_crncy_type,
            v_total_rece_amt,
            v_total_payab_amt,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_pd_cash_id,
            v_pd_first_amt,
            v_pd_curr_amt,
            v_pd_dist_amt,
            v_pd_auth_amt,
            v_pd_amt_check_diff,
            v_pd_pre_settle_amt,
            v_pd_total_cash_divide,
            v_pd_total_pre_fee,
            v_pd_total_rece_amt,
            v_pd_total_payab_amt,
            v_pd_intrst_cacl_amt,
            v_pd_pre_entry_intrst_amt,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "prodT.3.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_更新产品资金累计应收应付出现错误！',v_mysql_message);
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
    SET p_pd_cash_id = v_pd_cash_id;
    SET p_co_no = v_co_no;
    SET p_pd_first_amt = v_pd_first_amt;
    SET p_pd_curr_amt = v_pd_curr_amt;
    SET p_pd_dist_amt = v_pd_dist_amt;
    SET p_pd_auth_amt = v_pd_auth_amt;
    SET p_pd_amt_check_diff = v_pd_amt_check_diff;
    SET p_pd_pre_settle_amt = v_pd_pre_settle_amt;
    SET p_pd_total_cash_divide = v_pd_total_cash_divide;
    SET p_pd_total_pre_fee = v_pd_total_pre_fee;
    SET p_pd_total_rece_amt = v_pd_total_rece_amt;
    SET p_pd_total_payab_amt = v_pd_total_payab_amt;
    SET p_pd_intrst_cacl_amt = v_pd_intrst_cacl_amt;
    SET p_pd_pre_entry_intrst_amt = v_pd_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 事务_产品_资金_查询产品资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_QueryPdAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_QueryPdAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@产品编号串#] */
    set v_pd_no_str = concat(";", v_pd_no_str,";");


    /* if @操作员编号# = 99990001 then */
    if v_opor_no = 99990001 then

        /* set @机构编号# = 0; */
        set v_co_no = 0;

        /* set @产品编号权限串# = ' '; */
        set v_pd_no_rights_str = ' ';
    end if;

    /* 调用【原子_产品_资金_查询产品资产】*/
    call db_prod.pra_pdcapit_QueryPdAsset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no_str,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_查询产品资产出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_资金_查询历史产品资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_QueryPdAsset_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_QueryPdAsset_His(
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
    IN p_pd_no_str varchar(2048),
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_pd_no_str varchar(2048);
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@产品编号串#] */
    set v_pd_no_str = concat(";", v_pd_no_str,";");


    /* 调用【原子_产品_资金_查询历史产品资产】*/
    call db_prod.pra_pdcapit_QueryPdAsset_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no_str,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_查询历史产品资产出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_资金_新增银行账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_AddbkacCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_AddbkacCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_bank_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_curr_amt decimal(18,4),
    IN p_intrst_rate decimal(18,12),
    IN p_oper_remark_info varchar(255),
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
    declare v_bank_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_status varchar(2);
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
    SET v_bank_acco_no = p_bank_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_curr_amt = p_curr_amt;
    SET v_intrst_rate = p_intrst_rate;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.71.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@产品编号#,@机构编号#,@操作员机构编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.3.71.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_资金_新增银行账户资金】*/
        call db_prod.pra_pdcapit_AddbkacCapital(
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
            v_bank_acco_no,
            v_crncy_type,
            v_curr_amt,
            v_intrst_rate,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.3.71.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_新增银行账户资金出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_资金_修改银行账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_ModibkacCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_ModibkacCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_bank_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_curr_amt decimal(18,4),
    IN p_intrst_rate decimal(18,12),
    IN p_intrst_base_amt decimal(18,4),
    IN p_pre_entry_intrst_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
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
    declare v_bank_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_status varchar(2);
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
    SET v_bank_acco_no = p_bank_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_curr_amt = p_curr_amt;
    SET v_intrst_rate = p_intrst_rate;
    SET v_intrst_base_amt = p_intrst_base_amt;
    SET v_pre_entry_intrst_amt = p_pre_entry_intrst_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.72.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@产品编号#,@机构编号#,@操作员机构编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.3.72.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_资金_修改银行账户资金】*/
        call db_prod.pra_pdcapit_ModibkacCapital(
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
            v_bank_acco_no,
            v_crncy_type,
            v_curr_amt,
            v_intrst_rate,
            v_intrst_base_amt,
            v_pre_entry_intrst_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.3.72.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_修改银行账户资金出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_资金_删除银行账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_DeletebkacCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_DeletebkacCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_bank_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_oper_remark_info varchar(255),
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
    declare v_bank_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_status varchar(2);
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
    SET v_bank_acco_no = p_bank_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_status = "0";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @产品状态# = 0; */
    set v_pd_status = 0;

    /* 调用【原子_产品_账户_检查产品状态】*/
    call db_prod.pra_pdacco_CheckProductStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_pd_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.73.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_账户_检查产品状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [检查报错返回][@机构编号# <> @操作员机构编号#][50][@产品编号#,@机构编号#,@操作员机构编号#] */
    if v_co_no <> v_opor_co_no then
        
        SET v_error_code = "prodT.3.73.50";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","机构编号=",v_co_no,",","操作员机构编号=",v_opor_co_no);
        end if;
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品_资金_删除银行账户资金】*/
        call db_prod.pra_pdcapit_DeletebkacCapital(
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
            v_bank_acco_no,
            v_crncy_type,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "prodT.3.73.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_删除银行账户资金出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_资金_查询银行账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_QuerybkacCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_QuerybkacCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_bank_acco_no_str varchar(64),
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_bank_acco_no_str varchar(64);
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_bank_acco_no_str = p_bank_acco_no_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@银行账户编号串#] */
    set v_bank_acco_no_str = concat(";", v_bank_acco_no_str,";");


    /* 调用【原子_产品_资金_查询银行账户资金】*/
    call db_prod.pra_pdcapit_QuerybkacCapital(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_bank_acco_no_str,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.74.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_查询银行账户资金出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_资金_查询历史银行账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_QuerybkacCapital_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_QuerybkacCapital_His(
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
    IN p_bank_acco_no_str varchar(64),
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_bank_acco_no_str varchar(64);
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_bank_acco_no_str = p_bank_acco_no_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@银行账户编号串#] */
    set v_bank_acco_no_str = concat(";", v_bank_acco_no_str,";");


    /* 调用【原子_产品_资金_查询历史银行账户资金】*/
    call db_prod.pra_pdcapit_QuerybkacCapital_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no,
        v_bank_acco_no_str,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.75.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_查询历史银行账户资金出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_资金_查询银行账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_QuerybkacCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_QuerybkacCapital_Jour(
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
    IN p_bank_acco_no_str varchar(64),
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_bank_acco_no_str varchar(64);
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_bank_acco_no_str = p_bank_acco_no_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@银行账户编号串#] */
    set v_bank_acco_no_str = concat(";", v_bank_acco_no_str,";");


    /* 调用【原子_产品_资金_查询银行账户资金流水】*/
    call db_prod.pra_pdcapit_QuerybkacCapital_Jour(
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
        v_bank_acco_no_str,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.76.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_查询银行账户资金流水出现错误！',v_mysql_message);
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
use db_prod;;

# 事务_产品_资金_查询历史银行账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdcapit_QuerybkacCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE prt_pdcapit_QuerybkacCapital_JourHis(
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
    IN p_bank_acco_no_str varchar(64),
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_bank_acco_no_str varchar(64);
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_bank_acco_no_str = p_bank_acco_no_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@银行账户编号串#] */
    set v_bank_acco_no_str = concat(";", v_bank_acco_no_str,";");


    /* 调用【原子_产品_资金_查询历史银行账户资金流水】*/
    call db_prod.pra_pdcapit_QuerybkacCapital_JourHis(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no,
        v_bank_acco_no_str,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "prodT.3.77.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品_资金_查询历史银行账户资金流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


