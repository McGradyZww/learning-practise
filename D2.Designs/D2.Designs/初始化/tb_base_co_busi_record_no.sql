#创建公共_基础_机构业务记录编号表初始化记录！
use db_pub;
truncate db_pub.tb_base_co_busi_record_no;
insert into db_pub.tb_base_co_busi_record_no(create_date,create_time,update_date,update_time,update_times,co_no,record_no_type,curr_no) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,9999,14,3);
commit;
