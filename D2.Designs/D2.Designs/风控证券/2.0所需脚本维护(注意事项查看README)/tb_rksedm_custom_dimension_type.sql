use db_rksecu;
TRUNCATE db_rksecu.tb_rksedm_custom_dimension_type;
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('1', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'SGG', 'ST类', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'SGG\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE (tssi.stock_name LIKE \'ST%\' or tssi.stock_name LIKE \'*ST%\' or tssi.stock_name LIKE \'S*ST%\' or tssi.stock_name LIKE \'SST%\' ) AND (tssi.exch_no = 1 or tssi.exch_no =  2) AND tssi.stock_type=1;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('2', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'SG', 'S股', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'SG\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.stock_name LIKE \'S%\' AND tssi.stock_name NOT LIKE \'ST%\' AND (tssi.exch_no = 1 or tssi.exch_no =  2) AND tssi.stock_type=1;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('3', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'STG', 'ST股', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'STG\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.stock_name LIKE \'ST%\' AND (tssi.exch_no = 1 or tssi.exch_no =  2) AND tssi.stock_type=1;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('4', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), '*STG', '*ST股', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'*STG\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.stock_name LIKE \'*ST%\' AND (tssi.exch_no = 1 or tssi.exch_no =  2) AND tssi.stock_type=1;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('5', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'S*STG', 'S*ST股', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'S*STG\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.stock_name LIKE \'S*ST%\' AND (tssi.exch_no = 1 or tssi.exch_no =  2) AND tssi.stock_type=1;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('6', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'SSTG', 'SST股', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'SSTG\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.stock_name LIKE \'SST%\'  AND (tssi.exch_no = 1 or tssi.exch_no =  2)and tssi.stock_type=1;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('7', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'SHAG', '上海A股', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'SHAG\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no=1 AND tssi.stock_type=1;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('8', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'SZAG', '深圳A股（不含中小板和创业板）', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'SZAG\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no=2 AND tssi.stock_code NOT LIKE \'002%\' AND tssi.stock_code NOT LIKE \'300%\' AND tssi.stock_type=1;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('9', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'SZZXB', '深圳中小板', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'SZZXB\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no=2 AND tssi.stock_code LIKE \'002%\' AND tssi.stock_type=1 ;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('10', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'SZCYB', '深圳创业板', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'SZCYB\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no=2 AND tssi.stock_code LIKE \'300%\' AND tssi.stock_type=1 ;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('11', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'HSAG', '沪深A股（不含中小板和创业板）', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'HSAG\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE (tssi.exch_no=1 or (tssi.exch_no=2 AND tssi.stock_code NOT LIKE \'002%\' AND tssi.stock_code NOT LIKE \'300%\')) AND tssi.stock_type=1 ;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('12', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'SZZXC', '深圳中小创', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'SZZXC\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no=2 AND (tssi.stock_code LIKE \'002%\' or tssi.stock_code LIKE \'300%\') AND tssi.stock_type=1;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('13', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'ZQ', '债券', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'ZQ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 21
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'ZQ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 22
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'ZQ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 23
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'ZQ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 24
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'ZQ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 25
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'ZQ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 30
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'ZQ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 37
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'ZQ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 40
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'ZQ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 41
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'ZQ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 42
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'ZQ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 43
 ;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('14', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'FHBJJ', '非货币基金', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'FHBJJ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 51
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'FHBJJ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 51
	union 
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'FHBJJ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 52
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'FHBJJ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 53
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'FHBJJ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 54
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'FHBJJ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 55
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'FHBJJ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 56
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'FHBJJ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 58
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'FHBJJ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 59
	union 
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'FHBJJ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 60
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'FHBJJ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 62
	union
	SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'FHBJJ\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no in(1,2)  AND tssi.stock_type = 64
	;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('15', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'HSAGZXB', '沪深A股(含中小板不含创业板)', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'HSAGZXB\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE (tssi.exch_no=1 or (tssi.exch_no=2 AND tssi.stock_code NOT LIKE \'300%\')) AND tssi.stock_type=1 ;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('16', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'XG', '新股', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'XG\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE (tssi.exch_no=1 or tssi.exch_no=2 ) AND tssi.stock_type=1 AND tssi.stock_name like \'N%\';', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('17', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'FHS300', '非沪深300股票', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'FHS300\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE (tssi.exch_no=1 or tssi.exch_no=2 ) AND tssi.stock_type=1 AND tssi.stock_code not in (select stock_code from tb_rksedm_index_stock where index_code = \'HS300\');', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('18', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'GG', '港股', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'GG\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE (tssi.exch_no=3 or tssi.exch_no=4 ) AND tssi.stock_type=1;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('19', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'SZAGHZXC', '深圳A股（含中小板和创业板）', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'SZAGHZXC\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE tssi.exch_no=2  AND tssi.stock_type=1;', '2', '0', ' ', '1');
INSERT INTO `db_rksecu`.`tb_rksedm_custom_dimension_type` (`row_id`, `create_date`, `create_time`, `update_date`, `update_time`, `dime_type_code`, `dime_type_name`, `dime_sql_script`, `dime_sql_create_type`, `weight_type`, `remark_info`, `update_times`) VALUES ('20', date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 'KCB', '科创板', 'INSERT INTO db_rksecu.tb_rksedm_custom_dimension_stock(create_date, create_time, update_date, update_time, update_times,dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,weight_value,weight_ratio,remark_info) SELECT DISTINCT date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), date_format(curdate(),\'%Y%m%d\'), date_format(curtime(),\'%H%i%s\'), 1, \'KCB\' AS dime_type_code,exch_no,stock_code_no, stock_code,stock_name,stock_type,0 AS weight_value,0 AS weight_ratio,\' \' as remark_info FROM db_rksecu.tb_rksecc_secu_stock_info tssi WHERE (tssi.exch_no=1  AND tssi.stock_code LIKE \'688%\') AND tssi.stock_type=1 ;', '2', '0', ' ', '1');
commit;

