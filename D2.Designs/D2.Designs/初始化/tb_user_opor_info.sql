#创建公共_用户_操作员信息表初始化记录！
use db_pub;
truncate db_pub.tb_user_opor_info;
insert into db_pub.tb_user_opor_info(create_date,create_time,update_date,update_time,update_times,co_no,opor_no,opor_name,opor_type,opor_pwd,opor_status,create_opor,conta_addr,oper_rights,phone_number,email,is_trader,trader_no,allow_login_type,allow_oper_ip_addr,allow_oper_mac,display_non_logon_operator_orders) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,9999,99990001,"络町系统管理员",1,md5(concat('LDOSM',to_base64(MD5('99990001#1')))),"1",0,"络町",2," "," ",0,0,"1;2;3;4"," "," ",2);
commit;
