#创建公共_期货基础数据_期货组合保证金参数表初始化记录！
use db_pub;
truncate db_pub.tb_basefudt_futu_group_margin_config;
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,12,"ag&ag","白银组合",1,1,301,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,12,"au&au","黄金组合",1,1,302,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,12,"al&al","沪铝组合",1,1,311,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,12,"pb&pb","沪铅组合",1,1,312,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,12,"cu&cu","沪铜组合",1,1,313,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,12,"zn&zn","沪锌组合",1,1,314,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,12,"ni&ni","沪镍组合",1,1,315,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,12,"sn&sn","沪锡组合",1,1,316,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,12,"hc&hc","热轧卷板组合",1,1,331,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,12,"wr&wr","线材组合",1,1,332,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,12,"rb&rb","螺纹钢组合",1,1,333,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,12,"ru&ru","天然橡胶组合",1,1,341,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,12,"fu&fu","燃料油组合",1,1,351,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,12,"bu&bu","沥青组合",1,1,352,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"c&c","玉米组合",1,1,401,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"cs&cs","玉米淀粉组合",1,1,402,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"a&a","黄大豆1号组合",1,1,403,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"b&b","黄大豆2号组合",1,1,404,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"m&m","豆粕组合",1,1,405,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"y&y","豆油组合",1,1,406,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"p&p","棕榈油组合",1,1,407,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"jd&jd","鸡蛋组合",1,1,408,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"fb&fb","纤维板组合",1,1,409,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"bb&bb","胶合板组合",1,1,410,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"l&l","聚乙烯组合",1,1,431,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"v&v","聚氯乙烯组合",1,1,432,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"pp&pp","聚丙烯组合",1,1,433,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"j&j","焦炭组合",1,1,434,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"jm&jm","焦煤组合",1,1,435,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,13,"i&i","铁矿石组合",1,1,436,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"PM&PM","普麦组合",1,1,501,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"WH&WH","强麦组合",1,1,502,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"RI&RI","早籼稻组合",1,1,503,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"LR&LR","晚籼稻组合",1,1,504,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"JR&JR","粳稻组合",1,1,505,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"CF&CF","棉花组合",1,1,506,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"RS&RS","油菜籽组合",1,1,507,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"OI&OI","菜籽油组合",1,1,508,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"RM&RM","菜籽粕组合",1,1,509,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"SR&SR","白糖组合",1,1,510,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"ZC&ZC","动力煤组合",1,1,511,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"MA&MA","甲醇组合",1,1,512,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"TA&TA","PTA组合",1,1,513,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"FG&FG","玻璃组合",1,1,514,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"SF&SF","硅铁组合",1,1,515,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"SM&SM","锰硅组合",1,1,516,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"AP&AP","苹果组合",1,1,518,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,14,"CJ&CJ","干制红枣组合",1,1,519,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,11,"IF&IF","沪深300组合",1,1,601,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,11,"IH&IH","上证50组合",1,1,602,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,11,"IC&IC","中证500组合",1,1,603,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,11,"TF&TF","5年期国债组合",1,1,631,100,1,1,1);
insert into db_pub.tb_basefudt_futu_group_margin_config(create_date,create_time,update_date,update_time,update_times,exch_no,comb_code,comb_name,comb_type,pref_type,partic_code,margin_ratio,prior_type,trade_pref,sett_pref) values(date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),date_format(curdate(),'%Y%m%d'),date_format(curtime(),'%H%i%s'),1,11,"T&T","10年期国债组合",1,1,632,100,1,1,1);
commit;
