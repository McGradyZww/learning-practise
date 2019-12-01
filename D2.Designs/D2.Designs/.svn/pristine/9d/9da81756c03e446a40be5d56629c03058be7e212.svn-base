-- /**************************************************************************************/
-- 创建数据库【公共】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：公共_基础客户端_对冲篮子信息表
use db_pub;
DROP TABLE IF EXISTS tb_baseclient_hedgingbasket;
CREATE TABLE tb_baseclient_hedgingbasket (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    record_batch_no int NOT NULL ,
    comm_trd_type int NOT NULL ,
    basket_id bigint NOT NULL ,
    basket_name varchar(64) NOT NULL ,
    futu_qty decimal(18,2) NOT NULL ,
    spot_qty decimal(18,2) NOT NULL ,
    basket_copies decimal(18,2) NOT NULL ,
    remain_copies decimal(18,2) NOT NULL ,
    cash_replace_amt decimal(18,4) NOT NULL ,
    hedging_pankou decimal(18,4) NOT NULL ,
    name_base_diff decimal(18,4) NOT NULL ,
    basket_base_diff decimal(18,4) NOT NULL ,
    track_base_diff decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_baseclient_hedgingbasket_1 on tb_baseclient_hedgingbasket (init_date,co_no,record_batch_no);

-- 创建数据表：历史_公共_基础客户端_对冲篮子信息表
use db_pub_his;
DROP TABLE IF EXISTS tb_baseclient_hedgingbasket_his;
CREATE TABLE tb_baseclient_hedgingbasket_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    record_batch_no int NOT NULL ,
    comm_trd_type int NOT NULL ,
    basket_id bigint NOT NULL ,
    basket_name varchar(64) NOT NULL ,
    futu_qty decimal(18,2) NOT NULL ,
    spot_qty decimal(18,2) NOT NULL ,
    basket_copies decimal(18,2) NOT NULL ,
    remain_copies decimal(18,2) NOT NULL ,
    cash_replace_amt decimal(18,4) NOT NULL ,
    hedging_pankou decimal(18,4) NOT NULL ,
    name_base_diff decimal(18,4) NOT NULL ,
    basket_base_diff decimal(18,4) NOT NULL ,
    track_base_diff decimal(18,4) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_baseclient_hedgingbasket_his_1 on tb_baseclient_hedgingbasket_his (init_date,co_no,record_batch_no);
commit;
