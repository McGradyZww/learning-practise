-- /**************************************************************************************/
-- 创建数据库【公共】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：公共_基础数据同步_自动同步设置表
use db_pub;
DROP TABLE IF EXISTS tb_auto_sync_set;
CREATE TABLE tb_auto_sync_set (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    auto_sync_type int NOT NULL ,
    capital_batch_deal_range int NOT NULL ,
    posi_batch_deal_range int NOT NULL ,
    begin_time int NOT NULL ,
    auto_sync_deal_flag int NOT NULL ,
    end_time int NOT NULL ,
    is_batch_deal int NOT NULL ,
    is_inner_check int NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_auto_sync_set_1 on tb_auto_sync_set (co_no,auto_sync_type);

-- 创建数据表：公共_基础数据同步_自动同步日志表
use db_pub;
DROP TABLE IF EXISTS tb_auto_sync_log;
CREATE TABLE tb_auto_sync_log (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    co_no int NOT NULL ,
    process_type_name varchar(64) NOT NULL ,
    process_name varchar(64) NOT NULL ,
    event_msg_content varchar(4096) NOT NULL ,
    remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
commit;
