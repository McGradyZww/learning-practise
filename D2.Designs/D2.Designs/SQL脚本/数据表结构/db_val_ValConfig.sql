-- /**************************************************************************************/
-- 创建数据库【独立估值】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_val DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_val_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：独立估值_基础配置_产品信息表
use db_val;
DROP TABLE IF EXISTS tb_valconfig_product_info;
CREATE TABLE tb_valconfig_product_info (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    pd_no int NOT NULL ,
    pd_code varchar(32) NOT NULL ,
    pd_name varchar(64) NOT NULL ,
    found_share decimal(18,2) NOT NULL ,
    pd_curr_share decimal(18,2) NOT NULL ,
    begin_val_date int NOT NULL ,
    target_pd_code varchar(8) NOT NULL ,
    task_status varchar(2) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_valconfig_product_info_1 on tb_valconfig_product_info (co_no,pd_no);
create index idx_tb_valconfig_product_info_2 on tb_valconfig_product_info (task_status);
commit;
