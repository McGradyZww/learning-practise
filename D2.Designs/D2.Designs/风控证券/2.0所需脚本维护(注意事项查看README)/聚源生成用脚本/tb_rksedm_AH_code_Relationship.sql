select "use db_rksecu;";
select "truncate db_rksecu.tb_rksedm_AH_code_Relationship;";
SELECT concat("insert into db_rksecu.tb_rksedm_AH_code_Relationship (create_date, create_time, update_date, update_time, update_times, exch_no, stock_code, stock_name, target_code) values (date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 1,",(case when A.SecuMarket = 90 then 2 else 1 end),", '",A.SecuCode, "', '", A.SecuAbbr,"', '", C.SecuCode , "');")
FROM SecuMain A
JOIN LC_CodeRelationship B ON A.InnerCode=B.InnerCode
AND B.Market=72
JOIN HK_SecuMain C ON C.InnerCode=B.RelatedInnerCode
WHERE A.SecuCategory IN(1,2) AND A.SecuMarket IN(83,90) AND A.ListedState<>5 AND LEFT(A.SecuCode,1) NOT IN('4','X');