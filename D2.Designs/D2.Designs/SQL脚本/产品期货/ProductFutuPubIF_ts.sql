DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_公共接口_获取交易编码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupubif_GetFutuAccoNo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupubif_GetFutuAccoNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_futu_acco varchar(16),
    IN p_hedge_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_futu_acco_no int
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
    declare v_futu_acco varchar(16);
    declare v_hedge_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_futu_acco_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco = p_futu_acco;
    SET v_hedge_type = p_hedge_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_futu_acco_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品期货_公共接口_获取交易编码编号】*/
    call db_pdfutu.pra_pdfupubif_GetFutuAccoNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no,
        v_exch_no,
        v_futu_acco,
        v_hedge_type,
        v_error_code,
        v_error_info,
        v_futu_acco_no);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.4.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_公共接口_获取交易编码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_futu_acco_no = v_futu_acco_no;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_公共接口_获取交易编码
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupubif_GetFutuAcco;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupubif_GetFutuAcco(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_futu_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_no int,
    OUT p_futu_acco varchar(16)
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
    declare v_futu_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_futu_acco varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_futu_acco = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品期货_公共接口_获取交易编码】*/
    call db_pdfutu.pra_pdfupubif_GetFutuAcco(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_asset_acco_no,
        v_futu_acco_no,
        v_error_code,
        v_error_info,
        v_exch_no,
        v_futu_acco);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.4.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_公共接口_获取交易编码出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco = v_futu_acco;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_公共接口_计算产品期货现金资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupubif_CalcProdFutuCashAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupubif_CalcProdFutuCashAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id_str varchar(2048),
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_futu_cash_asset_str varchar(4096),
    OUT p_crncy_type_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_row_id_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_futu_cash_asset_str varchar(4096);
    declare v_crncy_type_str varchar(2048);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_futu_cash_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);
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
    SET v_row_id_str = p_row_id_str;
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_futu_cash_asset_str = " ";
    SET v_crncy_type_str = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_futu_cash_asset = 0;
    SET v_futu_asset = 0;
    SET v_futu_long_market_value = 0;
    SET v_futu_short_market_value = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @期货现金资产串# = ""; */
    set v_futu_cash_asset_str = "";

    /* set @本币币种串# = ""; */
    set v_crncy_type_str = "";
    loop_label:loop

        /* if instr(@记录序号串#,";") > 0 then */
        if instr(v_row_id_str,";") > 0 then

            /* set @记录序号#=cast(substring(@记录序号串#,1,LOCATE(";",@记录序号串#)-1) as SIGNED); */
            set v_row_id=cast(substring(v_row_id_str,1,LOCATE(";",v_row_id_str)-1) as SIGNED);

            /* set @机构编号#=cast(substring(@机构编号串#,1,LOCATE(";",@机构编号串#)-1) as SIGNED); */
            set v_co_no=cast(substring(v_co_no_str,1,LOCATE(";",v_co_no_str)-1) as SIGNED);

            /* set @产品编号#=cast(substring(@产品编号串#,1,LOCATE(";",@产品编号串#)-1) as SIGNED); */
            set v_pd_no=cast(substring(v_pd_no_str,1,LOCATE(";",v_pd_no_str)-1) as SIGNED);

            /* [事务开始] */
            START TRANSACTION;


                /* 调用【原子_产品期货_公共接口_计算产品期货现金资产】*/
                call db_pdfutu.pra_pdfupubif_CalcProdFutuCashAsset(
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
                    v_futu_cash_asset,
                    v_futu_asset,
                    v_futu_long_market_value,
                    v_futu_short_market_value);
                if v_error_code = "1" then
                    SET v_error_code = "pdfutuT.4.3.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_公共接口_计算产品期货现金资产出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


            /* [事务结束] */
            COMMIT;


            /* set @期货现金资产串# = concat(@期货现金资产串#,@期货现金资产#,";"); */
            set v_futu_cash_asset_str = concat(v_futu_cash_asset_str,v_futu_cash_asset,";");

            /* set @本币币种串# = concat(@本币币种串#,@本币币种#,";"); */
            set v_crncy_type_str = concat(v_crncy_type_str,v_crncy_type,";");

            /* set @记录序号串#=substring(@记录序号串#,LOCATE(";",@记录序号串#)+1); */
            set v_row_id_str=substring(v_row_id_str,LOCATE(";",v_row_id_str)+1);

            /* set @机构编号串#=substring(@机构编号串#,LOCATE(";",@机构编号串#)+1); */
            set v_co_no_str=substring(v_co_no_str,LOCATE(";",v_co_no_str)+1);

            /* set @产品编号串#=substring(@产品编号串#,LOCATE(";",@产品编号串#)+1); */
            set v_pd_no_str=substring(v_pd_no_str,LOCATE(";",v_pd_no_str)+1);
        else
            leave loop_label;
        end if;
    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_futu_cash_asset_str = v_futu_cash_asset_str;
    SET p_crncy_type_str = v_crncy_type_str;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_公共接口_计算交易组期货现金资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupubif_CalcExchGroupFutuCashAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupubif_CalcExchGroupFutuCashAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id_str varchar(2048),
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_futu_cash_asset_str varchar(4096),
    OUT p_crncy_type_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_row_id_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_futu_cash_asset_str varchar(4096);
    declare v_crncy_type_str varchar(2048);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_futu_cash_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);
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
    SET v_row_id_str = p_row_id_str;
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_futu_cash_asset_str = " ";
    SET v_crncy_type_str = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_futu_cash_asset = 0;
    SET v_futu_asset = 0;
    SET v_futu_long_market_value = 0;
    SET v_futu_short_market_value = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @期货现金资产串# = ""; */
    set v_futu_cash_asset_str = "";

    /* set @本币币种串# = ""; */
    set v_crncy_type_str = "";
    loop_label:loop

        /* if instr(@记录序号串#,";") > 0 then */
        if instr(v_row_id_str,";") > 0 then

            /* set @记录序号#=cast(substring(@记录序号串#,1,LOCATE(";",@记录序号串#)-1) as SIGNED); */
            set v_row_id=cast(substring(v_row_id_str,1,LOCATE(";",v_row_id_str)-1) as SIGNED);

            /* set @机构编号#=cast(substring(@机构编号串#,1,LOCATE(";",@机构编号串#)-1) as SIGNED); */
            set v_co_no=cast(substring(v_co_no_str,1,LOCATE(";",v_co_no_str)-1) as SIGNED);

            /* set @产品编号#=cast(substring(@产品编号串#,1,LOCATE(";",@产品编号串#)-1) as SIGNED); */
            set v_pd_no=cast(substring(v_pd_no_str,1,LOCATE(";",v_pd_no_str)-1) as SIGNED);

            /* set @交易组编号#=cast(substring(@交易组编号串#,1,LOCATE(";",@交易组编号串#)-1) as SIGNED); */
            set v_exch_group_no=cast(substring(v_exch_group_no_str,1,LOCATE(";",v_exch_group_no_str)-1) as SIGNED);

            /* [事务开始] */
            START TRANSACTION;


                /* 调用【原子_产品期货_公共接口_计算交易组期货现金资产】*/
                call db_pdfutu.pra_pdfupubif_CalcExchGroupFutuCashAsset(
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
                    v_error_info,
                    v_futu_cash_asset,
                    v_futu_asset,
                    v_futu_long_market_value,
                    v_futu_short_market_value);
                if v_error_code = "1" then
                    SET v_error_code = "pdfutuT.4.4.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_公共接口_计算交易组期货现金资产出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


            /* [事务结束] */
            COMMIT;


            /* set @期货现金资产串# = concat(@期货现金资产串#,@期货现金资产#,";"); */
            set v_futu_cash_asset_str = concat(v_futu_cash_asset_str,v_futu_cash_asset,";");

            /* set @本币币种串# = concat(@本币币种串#,@本币币种#,";"); */
            set v_crncy_type_str = concat(v_crncy_type_str,v_crncy_type,";");

            /* set @记录序号串#=substring(@记录序号串#,LOCATE(";",@记录序号串#)+1); */
            set v_row_id_str=substring(v_row_id_str,LOCATE(";",v_row_id_str)+1);

            /* set @机构编号串#=substring(@机构编号串#,LOCATE(";",@机构编号串#)+1); */
            set v_co_no_str=substring(v_co_no_str,LOCATE(";",v_co_no_str)+1);

            /* set @产品编号串#=substring(@产品编号串#,LOCATE(";",@产品编号串#)+1); */
            set v_pd_no_str=substring(v_pd_no_str,LOCATE(";",v_pd_no_str)+1);

            /* set @交易组编号串#=substring(@交易组编号串#,LOCATE(";",@交易组编号串#)+1); */
            set v_exch_group_no_str=substring(v_exch_group_no_str,LOCATE(";",v_exch_group_no_str)+1);
        else
            leave loop_label;
        end if;
    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_futu_cash_asset_str = v_futu_cash_asset_str;
    SET p_crncy_type_str = v_crncy_type_str;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_公共接口_计算产品期货现金资产值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupubif_CalcProdFutuCashAssetValue;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupubif_CalcProdFutuCashAssetValue(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_futu_cash_asset decimal(18,4),
    OUT p_futu_asset decimal(18,4),
    OUT p_futu_long_market_value decimal(18,4),
    OUT p_futu_short_market_value decimal(18,4)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_futu_cash_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_futu_cash_asset = 0;
    SET v_futu_asset = 0;
    SET v_futu_long_market_value = 0;
    SET v_futu_short_market_value = 0;

    
    label_pro:BEGIN
    

          /* set @期货现金资产#=0; */
          set v_futu_cash_asset=0;

          /* set @期货资产#=0; */
          set v_futu_asset=0;

         /* 调用【原子_产品期货_公共接口_计算产品期货现金资产】*/
         call db_pdfutu.pra_pdfupubif_CalcProdFutuCashAsset(
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
             v_futu_cash_asset,
             v_futu_asset,
             v_futu_long_market_value,
             v_futu_short_market_value);
         if v_error_code = "1" then
             SET v_error_code = "pdfutuT.4.5.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_公共接口_计算产品期货现金资产出现错误！',v_mysql_message);
             end if;
             leave label_pro;
         elseif v_error_code <> "0" then
             leave label_pro;
         end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_futu_cash_asset = v_futu_cash_asset;
    SET p_futu_asset = v_futu_asset;
    SET p_futu_long_market_value = v_futu_long_market_value;
    SET p_futu_short_market_value = v_futu_short_market_value;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_公共接口_计算交易组期货现金资产值
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupubif_CalcExchGroupFutuCashAssetValue;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupubif_CalcExchGroupFutuCashAssetValue(
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
    OUT p_futu_cash_asset decimal(18,4),
    OUT p_futu_asset decimal(18,4),
    OUT p_futu_long_market_value decimal(18,4),
    OUT p_futu_short_market_value decimal(18,4)
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
    declare v_futu_cash_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_cash_asset = 0;
    SET v_futu_asset = 0;
    SET v_futu_long_market_value = 0;
    SET v_futu_short_market_value = 0;

    
    label_pro:BEGIN
    

         /* set @期货现金资产#=0; */
         set v_futu_cash_asset=0;

         /* set @期货资产#=0; */
         set v_futu_asset=0;

         /* 调用【原子_产品期货_公共接口_计算交易组期货现金资产】*/
         call db_pdfutu.pra_pdfupubif_CalcExchGroupFutuCashAsset(
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
             v_error_info,
             v_futu_cash_asset,
             v_futu_asset,
             v_futu_long_market_value,
             v_futu_short_market_value);
         if v_error_code = "1" then
             SET v_error_code = "pdfutuT.4.6.999";
             if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_公共接口_计算交易组期货现金资产出现错误！',v_mysql_message);
             end if;
             leave label_pro;
         elseif v_error_code <> "0" then
             leave label_pro;
         end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_futu_cash_asset = v_futu_cash_asset;
    SET p_futu_asset = v_futu_asset;
    SET p_futu_long_market_value = v_futu_long_market_value;
    SET p_futu_short_market_value = v_futu_short_market_value;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_公共接口_获取合约代码最新价
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupubif_GetContrcCodeLastPrice;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupubif_GetContrcCodeLastPrice(
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
    SET v_last_price = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品期货_公共接口_获取合约代码最新价】*/
    call db_pdfutu.pra_pdfupubif_GetContrcCodeLastPrice(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_contrc_code_no,
        v_error_code,
        v_error_info,
        v_last_price);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.4.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_公共接口_获取合约代码最新价出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_last_price = v_last_price;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_公共接口_更新期货行情最新价
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupubif_UpdateFutuQuotLastPrice;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupubif_UpdateFutuQuotLastPrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
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
    declare v_contrc_code_no int;
    declare v_last_price decimal(16,9);
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_last_price = p_last_price;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品期货_公共接口_更新期货行情最新价】*/
    call db_pdfutu.pra_pdfupubif_UpdateFutuQuotLastPrice(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_contrc_code_no,
        v_last_price,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.4.8.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_公共接口_更新期货行情最新价出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_公共接口_查询资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupubif_QueryAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupubif_QueryAsacCapital(
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
    declare v_asset_acco_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品期货_资金_查询资产账户资金】*/
    call db_pdfutu.pra_pdfuca_QueryAsacCapital(
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
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.4.901.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金_查询资产账户资金出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_公共接口_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupubif_QueryExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupubif_QueryExgpCapital(
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
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品期货_资金_查询交易组资金】*/
    call db_pdfutu.pra_pdfuca_QueryExgpCapital(
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
        v_exch_group_no,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.4.902.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金_查询交易组资金出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


