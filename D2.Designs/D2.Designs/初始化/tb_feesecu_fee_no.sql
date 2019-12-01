#创建公共_证券费用_费用编号表初始化记录！
use db_pub;
truncate db_pub.tb_feesecu_fee_no;
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,10100,1,1,0,"买入印花税");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,10200,1,2,0,"卖出印花税");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13100,1,31,0,"零股卖出印花税");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,20100,2,1,0,"买入过户费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,20200,2,2,0,"卖出过户费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,30100,3,1,0,"买入经手费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,30200,3,2,0,"卖出经手费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,40100,4,1,0,"买入证管费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,40200,4,2,0,"卖出证管费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,50100,5,1,0,"买入其他费用");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,50200,5,2,0,"卖出其他费用");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,70100,7,1,0,"买入交易佣金");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,70200,7,2,0,"卖出交易佣金");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,70400,7,4,0,"融券回购交易佣金");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,90100,9,1,0,"买入其他佣金");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,90200,9,2,0,"卖出其他佣金");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,100100,10,1,0,"买入交易征费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,100200,10,2,0,"卖出交易征费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,103100,10,31,0,"零股卖出交易征费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,110100,11,1,0,"买入交易费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,110200,11,2,0,"卖出交易费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,113100,11,31,0,"零股卖出交易费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,120100,12,1,0,"买入交易系统使用费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,120200,12,2,0,"卖出交易系统使用费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,123100,12,31,0,"零股卖出交易系统使用费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,130100,13,1,0,"买入股份交收费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,130200,13,2,0,"卖出股份交收费");
insert into db_pub.tb_feesecu_fee_no(create_date,create_time,update_date,update_time,update_times,fee_no,secu_fee_type,order_dir,contrc_dir,remark_info) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,133100,13,31,0,"零股卖出股份交收费");
commit;
