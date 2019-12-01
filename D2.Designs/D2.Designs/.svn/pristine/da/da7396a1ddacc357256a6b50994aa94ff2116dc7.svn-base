use db_rksecu;
DROP TABLE IF EXISTS tb_sys_industry_stock;
CREATE TABLE `tb_sys_industry_stock` (
  `row_id` bigint(20) NOT NULL,
  `sys_no` int(11) DEFAULT NULL,
  `stock_code` varchar(32) NOT NULL,
  `exchange_no` int(11) NOT NULL,
  `stock_name` varchar(64) DEFAULT NULL,
  `stock_type` varchar(64) NOT NULL,
  `industry_std` int(11) NOT NULL,
  `industry_num` varchar(64) NOT NULL,
  `industry_code` varchar(64) NOT NULL,
  `industry_name` varchar(64) NOT NULL,
  `first_industry_code` varchar(64) NOT NULL,
  `first_industry_name` varchar(64) NOT NULL,
  `second_industry_code` varchar(64) DEFAULT NULL,
  `second_industry_name` varchar(64) DEFAULT NULL,
  `third_industry_code` varchar(64) DEFAULT NULL,
  `third_industry_name` varchar(64) DEFAULT NULL,
  `fourth_industry_code` varchar(64) DEFAULT NULL,
  `fourth_industry_name` varchar(64) DEFAULT NULL,
  UNIQUE KEY `row_id` (`row_id`,`sys_no`),
  KEY `idx_industry_stock` (`stock_code`,`industry_std`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

use db_rksecu;
DROP TABLE IF EXISTS tb_sys_industry;
CREATE TABLE `tb_sys_industry` (
  `row_id` bigint(20) unsigned DEFAULT NULL,
  `sys_no` int(11) DEFAULT NULL,
  `industry_id` bigint(20) NOT NULL,
  `industry_code` varchar(64) NOT NULL,
  `industry_name` varchar(64) DEFAULT NULL,
  `industry_classification` int(20) DEFAULT NULL,
  `parent_industry_id` int(11) DEFAULT NULL,
  `industry_std` int(11) DEFAULT NULL,
  `first_industry_code` varchar(64) DEFAULT NULL,
  `first_industry_name` varchar(64) DEFAULT NULL,
  `second_industry_code` varchar(64) DEFAULT NULL,
  `second_industry_name` varchar(64) DEFAULT NULL,
  `third_industry_code` varchar(64) DEFAULT NULL,
  `third_industry_name` varchar(64) DEFAULT NULL,
  UNIQUE KEY `idx_tb_sys_dimension_1` (`industry_id`),
  KEY `row_id` (`row_id`,`sys_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

commit;
