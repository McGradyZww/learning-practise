DELIMITER ;;
use db_rksecu;;

-- 清空表数据
truncate table db_rksecu.tb_rksedm_industry_type;
truncate table db_rksecu.tb_rksedm_industry_classification;
truncate table db_rksecu.tb_rksedm_industry_stock;

DROP TABLE IF EXISTS industrytopidtable;
-- 创建中间表
create table db_rksecu.industrytopidtable as 
(
SELECT industry_id AS industry_id,parent_industry_id AS 父ID ,levels AS 父到子之间级数, substring(REPLACE(paths,',0',''),2,6) AS topid FROM (
     SELECT industry_id,parent_industry_id,
     @le:= IF (parent_industry_id = 0 ,0,  
         IF( LOCATE( CONCAT('|',parent_industry_id,':'),@pathlevel)   > 0  ,      
                  SUBSTRING_INDEX( SUBSTRING_INDEX(@pathlevel,CONCAT('|',parent_industry_id,':'),-1),'|',1) +1
        ,@le+1) ) levels
     , @pathlevel:= CONCAT(@pathlevel,'|',industry_id,':', @le ,'|') pathlevel
      , @pathnodes:= IF( parent_industry_id =-1,',0', 
           CONCAT_WS(',',
           IF( LOCATE( CONCAT('|',parent_industry_id,':'),@pathall) > 0  , 
               SUBSTRING_INDEX( SUBSTRING_INDEX(@pathall,CONCAT('|',parent_industry_id,':'),-1),'|',1)
              ,@pathnodes ) ,parent_industry_id  ) )paths
    ,@pathall:=CONCAT(@pathall,'|',industry_id,':', @pathnodes ,'|') pathall 
        FROM  db_rksecu.tb_sys_industry, 
    (SELECT @le:=0,@pathlevel:='', @pathall:='',@pathnodes:='') vv
    ORDER BY  parent_industry_id,industry_id
    ) src where parent_industry_id<>-1
ORDER BY industry_id);

 -- 无tb_rksedm_打头的的为聚源库中的表，请指定具体的库
 -- 行业类型表
insert into db_rksecu.tb_rksedm_industry_type(create_date, create_time, update_date, update_time, update_times, indu_type_no, indu_type_name, indu_bulid_orgn, indu_level_total, weight_type, remark_info) 
 select date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 1, industry_code,industry_name,' ',3,0,' ' from db_rksecu.tb_sys_industry t where t.parent_industry_id=-1;

-- 行业层级表
 insert into db_rksecu.tb_rksedm_industry_classification(create_date, create_time, update_date, update_time, update_times, indu_type_no,indu_code,indu_name,indu_level_total,indu_level,highup_indu_code,weight_type,weight_value,
weight_ratio,remark_info) 
 select date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 1, b.topid,industry_code,industry_name,3,industry_classification,parent_industry_id,0,0,0,' ' from db_rksecu.tb_sys_industry a,db_rksecu.industrytopidtable b where a.industry_id=b.industry_id;

-- 行业证券代码表
 insert into db_rksecu.tb_rksedm_industry_stock(create_date, create_time, update_date, update_time, update_times, stock_code_no, stock_name, indu_type_no,indu_code,exch_no,stock_code,stock_type,weight_value,weight_ratio,remark_info) 
 select date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 1, c.stock_code_no, t.stock_name, b.topid,industry_code,t.exchange_no,t.stock_code,t.stock_type,0,0,' ' from db_rksecu.tb_sys_industry_stock t,db_rksecu.industrytopidtable b, tb_rksecc_secu_stock_info c
where t.industry_std=24 and t.industry_code=b.industry_id  and t.stock_code = c.stock_code;

commit;