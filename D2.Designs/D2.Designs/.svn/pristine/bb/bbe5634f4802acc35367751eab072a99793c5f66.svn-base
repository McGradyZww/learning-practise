-- /**************************************************************************************/
-- 创建数据库【公共】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：公共_王彤彤测试_增删改查表
use db_pub;
DROP TABLE IF EXISTS tb_wangtongtong_test;
CREATE TABLE tb_wangtongtong_test (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    wanttt_id int NOT NULL ,
    wanttt_name varchar(255) NOT NULL ,
    wanttt_asset_no int NOT NULL ,
    wangtt_stock_code_no int NOT NULL ,
    wanttt_buy_stock_qty int NOT NULL ,
    wanttt_sale_stock_qty int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_wangtongtong_test_1 on tb_wangtongtong_test (wanttt_id);
commit;
