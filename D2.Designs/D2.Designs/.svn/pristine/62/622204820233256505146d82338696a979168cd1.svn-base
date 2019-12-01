#创建公共_基础_系统信息表初始化记录！
use db_pub;
truncate db_pub.tb_base_sys_info;
insert into db_pub.tb_base_sys_info(create_date,create_time,update_date,update_time,update_times,sys_name,sys_status,init_date,no_exch_date_str,allow_next_init_time,sys_config_str,client_version,manage_ver,admin_ver,update_addr,dnload_addr) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,"LDAMS","1",date_format(curdate(),'%Y%m%d'),";20170102;20170127;20170130;20170131;20170201;20170202;20170403;20170404;20170501;20170529;20170530;20171002;20171003;20171004;20171005;20171006;20180101;20180501;",0,"221000000000000000000000000000000000000000000000000000000000000"," "," "," "," "," ");
commit;
