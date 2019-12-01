#创建公共_权限_角色表初始化记录！
use db_pub;
truncate db_pub.tb_perm_role;
insert into db_pub.tb_perm_role(create_date,create_time,update_date,update_time,update_times,role_no,role_code,role_name,co_no,role_type) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,99990001,99990001,"系统交易端管理员",9999,1);
insert into db_pub.tb_perm_role(create_date,create_time,update_date,update_time,update_times,role_no,role_code,role_name,co_no,role_type) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,99990002,99990002,"系统管理端管理员",9999,2);
insert into db_pub.tb_perm_role(create_date,create_time,update_date,update_time,update_times,role_no,role_code,role_name,co_no,role_type) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,99990003,99990003,"系统运维端管理员",9999,3);
commit;
