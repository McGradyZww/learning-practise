-- /**************************************************************************************/
-- 创建数据库【产品期货】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdfutu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pdfutu_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：产品期货_持仓运维_期货行情表
use db_pdfutu;
DROP TABLE IF EXISTS tb_pdfupobk_futu_quot;
CREATE TABLE tb_pdfupobk_futu_quot (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    contrc_code_no int NOT NULL ,
    last_price decimal(16,9) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_pdfupobk_futu_quot_1 on tb_pdfupobk_futu_quot (contrc_code_no);
commit;
