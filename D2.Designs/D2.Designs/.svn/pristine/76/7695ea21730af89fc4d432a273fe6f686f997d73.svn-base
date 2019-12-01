-- /**************************************************************************************/
-- 创建数据库【公共】及其之上的数据表
-- /**************************************************************************************/
CREATE DATABASE IF NOT EXISTS db_logic DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS db_pub_his DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

-- 创建数据表：公共_权限_交易菜单表
use db_pub;
DROP TABLE IF EXISTS tb_perm_exch_menu;
CREATE TABLE tb_perm_exch_menu (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    busi_menu_no int NOT NULL ,
    menu_name varchar(64) NOT NULL ,
    menu_parent int NOT NULL ,
    menu_child int NOT NULL ,
    menu_path varchar(64) NOT NULL ,
    menu_image varchar(64) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_perm_exch_menu_1 on tb_perm_exch_menu (busi_menu_no);

-- 创建数据表：公共_权限_管理菜单表
use db_pub;
DROP TABLE IF EXISTS tb_perm_mage_menu;
CREATE TABLE tb_perm_mage_menu (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    busi_menu_no int NOT NULL ,
    menu_name varchar(64) NOT NULL ,
    menu_parent int NOT NULL ,
    menu_child int NOT NULL ,
    menu_path varchar(64) NOT NULL ,
    menu_image varchar(64) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_perm_mage_menu_1 on tb_perm_mage_menu (busi_menu_no);

-- 创建数据表：公共_权限_运维菜单表
use db_pub;
DROP TABLE IF EXISTS tb_perm_back_menu;
CREATE TABLE tb_perm_back_menu (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    busi_menu_no int NOT NULL ,
    menu_name varchar(64) NOT NULL ,
    menu_parent int NOT NULL ,
    menu_child int NOT NULL ,
    menu_path varchar(64) NOT NULL ,
    menu_image varchar(64) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_perm_back_menu_1 on tb_perm_back_menu (busi_menu_no);

-- 创建数据表：公共_权限_服务菜单表
use db_pub;
DROP TABLE IF EXISTS tb_perm_serv_menu;
CREATE TABLE tb_perm_serv_menu (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    busi_menu_no int NOT NULL ,
    menu_name varchar(64) NOT NULL ,
    menu_parent int NOT NULL ,
    menu_child int NOT NULL ,
    menu_path varchar(64) NOT NULL ,
    menu_image varchar(64) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_perm_serv_menu_1 on tb_perm_serv_menu (busi_menu_no);

-- 创建数据表：公共_权限_业务功能表
use db_pub;
DROP TABLE IF EXISTS tb_perm_busi_func;
CREATE TABLE tb_perm_busi_func (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    busi_func_code varchar(16) NOT NULL ,
    func_name varchar(64) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_perm_busi_func_1 on tb_perm_busi_func (busi_func_code);

-- 创建数据表：公共_权限_交易菜单功能对照表
use db_pub;
DROP TABLE IF EXISTS tb_perm_exch_menu_func;
CREATE TABLE tb_perm_exch_menu_func (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    busi_menu_no int NOT NULL ,
    busi_func_code varchar(16) NOT NULL ,
    func_name varchar(64) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_perm_exch_menu_func_1 on tb_perm_exch_menu_func (busi_menu_no,busi_func_code);

-- 创建数据表：公共_权限_管理菜单功能对照表
use db_pub;
DROP TABLE IF EXISTS tb_perm_mage_menu_func;
CREATE TABLE tb_perm_mage_menu_func (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    busi_menu_no int NOT NULL ,
    busi_func_code varchar(16) NOT NULL ,
    func_name varchar(64) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_perm_mage_menu_func_1 on tb_perm_mage_menu_func (busi_menu_no,busi_func_code);

-- 创建数据表：公共_权限_运维菜单功能对照表
use db_pub;
DROP TABLE IF EXISTS tb_perm_back_menu_func;
CREATE TABLE tb_perm_back_menu_func (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    busi_menu_no int NOT NULL ,
    busi_func_code varchar(16) NOT NULL ,
    func_name varchar(64) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_perm_back_menu_func_1 on tb_perm_back_menu_func (busi_menu_no,busi_func_code);

-- 创建数据表：公共_权限_服务菜单功能对照表
use db_pub;
DROP TABLE IF EXISTS tb_perm_serv_menu_func;
CREATE TABLE tb_perm_serv_menu_func (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    busi_menu_no int NOT NULL ,
    busi_func_code varchar(16) NOT NULL ,
    func_name varchar(64) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_perm_serv_menu_func_1 on tb_perm_serv_menu_func (busi_menu_no,busi_func_code);

-- 创建数据表：公共_权限_角色表
use db_pub;
DROP TABLE IF EXISTS tb_perm_role;
CREATE TABLE tb_perm_role (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    role_no int NOT NULL ,
    co_no int NOT NULL ,
    role_code varchar(32) NOT NULL ,
    role_name varchar(64) NOT NULL ,
    role_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_perm_role_1 on tb_perm_role (co_no,role_code);
create index idx_tb_perm_role_2 on tb_perm_role (role_no);

-- 创建数据表：公共_权限_角色流水表
use db_pub;
DROP TABLE IF EXISTS tb_perm_role_jour;
CREATE TABLE tb_perm_role_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_co_no int NOT NULL ,
    opor_no int NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    role_no int NOT NULL ,
    role_name varchar(64) NOT NULL ,
    role_type int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_perm_role_jour_1 on tb_perm_role_jour (init_date,co_no,role_no);
create index idx_tb_perm_role_jour_2 on tb_perm_role_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_权限_角色流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_perm_role_jour_his;
CREATE TABLE tb_perm_role_jour_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_co_no int NOT NULL ,
    opor_no int NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    role_no int NOT NULL ,
    role_name varchar(64) NOT NULL ,
    role_type int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_perm_role_jour_his_1 on tb_perm_role_jour_his (init_date,co_no,role_no);
create index idx_tb_perm_role_jour_his_2 on tb_perm_role_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_权限_角色交易菜单功能表
use db_pub;
DROP TABLE IF EXISTS tb_perm_role_exch_menu;
CREATE TABLE tb_perm_role_exch_menu (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    role_no int NOT NULL ,
    busi_menu_no int NOT NULL ,
    busi_func_code varchar(16) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_perm_role_exch_menu_1 on tb_perm_role_exch_menu (role_no,busi_menu_no,busi_func_code);
create index idx_tb_perm_role_exch_menu_2 on tb_perm_role_exch_menu (busi_menu_no,busi_func_code);

-- 创建数据表：公共_权限_角色管理菜单功能表
use db_pub;
DROP TABLE IF EXISTS tb_perm_role_mage_menu;
CREATE TABLE tb_perm_role_mage_menu (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    role_no int NOT NULL ,
    busi_menu_no int NOT NULL ,
    busi_func_code varchar(16) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_perm_role_mage_menu_1 on tb_perm_role_mage_menu (role_no,busi_menu_no,busi_func_code);
create index idx_tb_perm_role_mage_menu_2 on tb_perm_role_mage_menu (busi_menu_no,busi_func_code);

-- 创建数据表：公共_权限_角色运维菜单功能表
use db_pub;
DROP TABLE IF EXISTS tb_perm_role_back_menu;
CREATE TABLE tb_perm_role_back_menu (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    role_no int NOT NULL ,
    busi_menu_no int NOT NULL ,
    busi_func_code varchar(16) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_perm_role_back_menu_1 on tb_perm_role_back_menu (role_no,busi_menu_no,busi_func_code);
create index idx_tb_perm_role_back_menu_2 on tb_perm_role_back_menu (busi_menu_no,busi_func_code);

-- 创建数据表：公共_权限_角色服务菜单功能表
use db_pub;
DROP TABLE IF EXISTS tb_perm_role_serv_menu;
CREATE TABLE tb_perm_role_serv_menu (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    role_no int NOT NULL ,
    busi_menu_no int NOT NULL ,
    busi_func_code varchar(16) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_perm_role_serv_menu_1 on tb_perm_role_serv_menu (role_no,busi_menu_no,busi_func_code);
create index idx_tb_perm_role_serv_menu_2 on tb_perm_role_serv_menu (busi_menu_no,busi_func_code);

-- 创建数据表：公共_权限_角色菜单功能流水表
use db_pub;
DROP TABLE IF EXISTS tb_perm_role_menu_jour;
CREATE TABLE tb_perm_role_menu_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_co_no int NOT NULL ,
    opor_no int NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    role_no int NOT NULL ,
    menu_type int NOT NULL ,
    busi_menu_no int NOT NULL ,
    busi_func_code varchar(16) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_perm_role_menu_jour_1 on tb_perm_role_menu_jour (init_date,co_no,role_no,menu_type);
create index idx_tb_perm_role_menu_jour_2 on tb_perm_role_menu_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_权限_角色菜单功能流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_perm_role_menu_jour_his;
CREATE TABLE tb_perm_role_menu_jour_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_co_no int NOT NULL ,
    opor_no int NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    role_no int NOT NULL ,
    menu_type int NOT NULL ,
    busi_menu_no int NOT NULL ,
    busi_func_code varchar(16) NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_perm_role_menu_jour_his_1 on tb_perm_role_menu_jour_his (init_date,co_no,role_no,menu_type);
create index idx_tb_perm_role_menu_jour_his_2 on tb_perm_role_menu_jour_his (init_date,opor_co_no,opor_no);

-- 创建数据表：公共_权限_操作员角色表
use db_pub;
DROP TABLE IF EXISTS tb_perm_opor_role;
CREATE TABLE tb_perm_opor_role (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_no int NOT NULL ,
    role_no int NOT NULL ,
    role_type int NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_tb_perm_opor_role_1 on tb_perm_opor_role (opor_no,role_no);
create index idx_tb_perm_opor_role_2 on tb_perm_opor_role (role_no);

-- 创建数据表：公共_权限_操作员角色流水表
use db_pub;
DROP TABLE IF EXISTS tb_perm_opor_role_jour;
CREATE TABLE tb_perm_opor_role_jour (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_co_no int NOT NULL ,
    opor_no int NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    target_opor_no int NOT NULL ,
    role_no int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_perm_opor_role_jour_1 on tb_perm_opor_role_jour (init_date,co_no,target_opor_no);
create index idx_tb_perm_opor_role_jour_2 on tb_perm_opor_role_jour (init_date,opor_co_no,opor_no);

-- 创建数据表：历史_公共_权限_操作员角色流水表
use db_pub_his;
DROP TABLE IF EXISTS tb_perm_opor_role_jour_his;
CREATE TABLE tb_perm_opor_role_jour_his (
    row_id bigint NOT NULL AUTO_INCREMENT,
    create_date int NOT NULL ,
    create_time int NOT NULL ,
    update_date int NOT NULL ,
    update_time int NOT NULL ,
    update_times int NOT NULL ,
    opor_co_no int NOT NULL ,
    opor_no int NOT NULL ,
    oper_mac varchar(32) NOT NULL ,
    oper_ip_addr varchar(32) NOT NULL ,
    oper_info varchar(1024) NOT NULL ,
    oper_way varchar(2) NOT NULL ,
    oper_menu_no int NOT NULL ,
    oper_func_code varchar(16) NOT NULL ,
    init_date int NOT NULL ,
    co_no int NOT NULL ,
    target_opor_no int NOT NULL ,
    role_no int NOT NULL ,
    oper_remark_info varchar(255) NOT NULL ,
    PRIMARY KEY (row_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create index idx_tb_perm_opor_role_jour_his_1 on tb_perm_opor_role_jour_his (init_date,co_no,target_opor_no);
create index idx_tb_perm_opor_role_jour_his_2 on tb_perm_opor_role_jour_his (init_date,opor_co_no,opor_no);
commit;
