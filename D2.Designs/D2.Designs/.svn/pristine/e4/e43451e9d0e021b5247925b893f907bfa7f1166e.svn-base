select "use db_rksecu;";
select "truncate tb_rksedm_index_stock;";
SELECT concat("INSERT INTO `db_rksecu`.`tb_rksedm_index_stock` ( `create_date`, `create_time`, `update_date`, `update_time`, `index_no`, `index_code`, `index_name`, `exch_no`, `stock_code_no`, `stock_code`, `stock_name`, `stock_type`, `weight_value`, `weight_ratio`, `remark_info`, `update_times`) select date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 1, 'HS300','", A.SecuAbbr, "', exch_no,stock_code_no,'",C.SecuCode,"', '",C.SecuAbbr,"', stock_type, '0', '0.0', ' ', '1' from `tb_rksecc_secu_stock_info` a  where a.stock_code = '",C.SecuCode ,"';")
 FROM SecuMain A
JOIN LC_IndexComponent B ON A.InnerCode=B.IndexInnerCode AND B.Flag=1
JOIN SecuMain C ON B.SecuInnerCode=C.InnerCode
WHERE A.SecuCode='000300';
select " ";
SELECT concat("INSERT INTO `db_rksecu`.`tb_rksedm_index_stock` ( `create_date`, `create_time`, `update_date`, `update_time`, `index_no`, `index_code`, `index_name`, `exch_no`, `stock_code_no`, `stock_code`, `stock_name`, `stock_type`, `weight_value`, `weight_ratio`, `remark_info`, `update_times`) select date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 2, 'ZZ500','", A.SecuAbbr, "', exch_no,stock_code_no,'",C.SecuCode,"', '",C.SecuAbbr,"', stock_type, '0', '0.0', ' ', '1' from `tb_rksecc_secu_stock_info` a  where a.stock_code = '",C.SecuCode ,"';")
 FROM SecuMain A
JOIN LC_IndexComponent B ON A.InnerCode=B.IndexInnerCode AND B.Flag=1
JOIN SecuMain C ON B.SecuInnerCode=C.InnerCode
WHERE A.SecuCode='399905';
select " ";
SELECT concat("INSERT INTO `db_rksecu`.`tb_rksedm_index_stock` ( `create_date`, `create_time`, `update_date`, `update_time`, `index_no`, `index_code`, `index_name`, `exch_no`, `stock_code_no`, `stock_code`, `stock_name`, `stock_type`, `weight_value`, `weight_ratio`, `remark_info`, `update_times`) select date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'),3, 'SZ50','", A.SecuAbbr, "', exch_no,stock_code_no,'",C.SecuCode,"', '",C.SecuAbbr,"', stock_type, '0', '0.0', ' ', '1' from `tb_rksecc_secu_stock_info` a  where a.stock_code = '",C.SecuCode ,"';")
 FROM SecuMain A
JOIN LC_IndexComponent B ON A.InnerCode=B.IndexInnerCode AND B.Flag=1
JOIN SecuMain C ON B.SecuInnerCode=C.InnerCode
WHERE A.SecuCode='000016';
select "commit;";