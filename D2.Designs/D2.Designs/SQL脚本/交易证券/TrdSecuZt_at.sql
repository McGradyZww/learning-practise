DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_中泰_去重查询指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdseap_DistinctQueryComm;;
DELIMITER ;;
CREATE PROCEDURE pra_tdseap_DistinctQueryComm(
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
    
    #[获取表全记录去重][交易证券_指令_指令表][{机构编号},{指令批号},{指令操作方式},{初始化日期}][{指令方向} in (《指令方向-基金申购》 , 《指令方向-基金赎回》  , {指令方向} = 《指令方向-基金转换》)]
    select distinct co_no,comm_batch_no,comm_oper_way,init_date from db_tdsecu.tb_tdseap_command where comm_dir in (9 , 10  , 12);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


