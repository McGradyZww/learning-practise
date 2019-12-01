using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_公共_证券基础数据_查询证券模板
   public class FuncpubL_1_6Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 模板名称
        /// </summary>
        public String model_name { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码特征
        /// </summary>
        public String stock_code_feature { get; set; }
 
        /// <summary>
        /// 证券名称特征
        /// </summary>
        public String stock_name_feature { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询证券类型
   public class FuncpubL_1_14Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 证券类型简称
        /// </summary>
        public String stock_type_name { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 资金回转天数
        /// </summary>
        public int capit_reback_days { get; set; }
 
        /// <summary>
        /// 持仓回转天数
        /// </summary>
        public int posi_reback_days { get; set; }
 
        /// <summary>
        /// 类型单位
        /// </summary>
        public int type_unit { get; set; }
 
        /// <summary>
        /// 申报单位
        /// </summary>
        public int report_unit { get; set; }
 
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit { get; set; }
 
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty { get; set; }
 
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty { get; set; }
 
        /// <summary>
        /// 区分订单方向标志
        /// </summary>
        public int is_order_dir_flag { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询证券类型流水
   public class FuncpubL_1_15Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询历史证券类型流水
   public class FuncpubL_1_16Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询证券类型订单方向
   public class FuncpubL_1_24Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 资金冻结方式
        /// </summary>
        public int cash_frozen_type { get; set; }
 
        /// <summary>
        /// 订单数量拆分标志
        /// </summary>
        public int order_split_flag { get; set; }
 
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit { get; set; }
 
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty { get; set; }
 
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_新增证券代码信息
   public class FuncpubL_1_41Model : BaseModel
   {
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询证券信息
   public class FuncpubL_1_43Model : BaseModel
   {
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 拼音简称
        /// </summary>
        public String pinyin_short { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询证券代码信息
   public class FuncpubL_1_44Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 拼音简称
        /// </summary>
        public String pinyin_short { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 总股本
        /// </summary>
        public double total_stock_issue { get; set; }
 
        /// <summary>
        /// 流通股本
        /// </summary>
        public double circl_stock_capit { get; set; }
 
        /// <summary>
        /// 资金回转天数
        /// </summary>
        public int capit_reback_days { get; set; }
 
        /// <summary>
        /// 持仓回转天数
        /// </summary>
        public int posi_reback_days { get; set; }
 
        /// <summary>
        /// 类型单位
        /// </summary>
        public int type_unit { get; set; }
 
        /// <summary>
        /// 申报单位
        /// </summary>
        public int report_unit { get; set; }
 
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit { get; set; }
 
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty { get; set; }
 
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty { get; set; }
 
        /// <summary>
        /// 区分订单方向标志
        /// </summary>
        public int is_order_dir_flag { get; set; }
 
        /// <summary>
        /// 价格上限
        /// </summary>
        public double price_up { get; set; }
 
        /// <summary>
        /// 价格下限
        /// </summary>
        public double price_down { get; set; }
 
        /// <summary>
        /// 最小价差
        /// </summary>
        public double step_price { get; set; }
 
        /// <summary>
        /// 公允价格
        /// </summary>
        public double fair_price { get; set; }
 
        /// <summary>
        /// 停牌标志
        /// </summary>
        public String stop_status { get; set; }
 
        /// <summary>
        /// 港股通标的
        /// </summary>
        public int hk_stock_flag { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询证券代码信息流水
   public class FuncpubL_1_45Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询历史证券代码信息流水
   public class FuncpubL_1_46Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询证券代码列表
   public class FuncpubL_1_47Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 港股通标的
        /// </summary>
        public int hk_stock_flag { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询客户端证券代码信息
   public class FuncpubL_1_49Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 拼音简称
        /// </summary>
        public String pinyin_short { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 资金回转天数
        /// </summary>
        public int capit_reback_days { get; set; }
 
        /// <summary>
        /// 持仓回转天数
        /// </summary>
        public int posi_reback_days { get; set; }
 
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit { get; set; }
 
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty { get; set; }
 
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty { get; set; }
 
        /// <summary>
        /// 最小价差
        /// </summary>
        public double step_price { get; set; }
 
        /// <summary>
        /// 停牌标志
        /// </summary>
        public String stop_status { get; set; }
 
        /// <summary>
        /// 港股通标的
        /// </summary>
        public int hk_stock_flag { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询证券代码订单方向
   public class FuncpubL_1_54Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 资金冻结方式
        /// </summary>
        public int cash_frozen_type { get; set; }
 
        /// <summary>
        /// 订单数量拆分标志
        /// </summary>
        public int order_split_flag { get; set; }
 
        /// <summary>
        /// 最小单位
        /// </summary>
        public int min_unit { get; set; }
 
        /// <summary>
        /// 最小数量
        /// </summary>
        public double min_qty { get; set; }
 
        /// <summary>
        /// 最大数量
        /// </summary>
        public double max_qty { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询证券代码订单方向流水
   public class FuncpubL_1_55Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询历史证券代码订单方向流水
   public class FuncpubL_1_56Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询证券代码映射
   public class FuncpubL_1_64Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询证券代码映射流水
   public class FuncpubL_1_65Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询历史证券代码映射流水
   public class FuncpubL_1_66Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询新股信息
   public class FuncpubL_1_34Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no { get; set; }
 
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no { get; set; }
 
        /// <summary>
        /// 申购日期
        /// </summary>
        public int apply_date { get; set; }
 
        /// <summary>
        /// 申购上限
        /// </summary>
        public double apply_limit { get; set; }
 
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询当日新股信息
   public class FuncpubL_1_35Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no { get; set; }
 
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no { get; set; }
 
        /// <summary>
        /// 申购日期
        /// </summary>
        public int apply_date { get; set; }
 
        /// <summary>
        /// 申购上限
        /// </summary>
        public double apply_limit { get; set; }
 
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询可转债信息
   public class FuncpubL_1_36Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no { get; set; }
 
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no { get; set; }
 
        /// <summary>
        /// 申购日期
        /// </summary>
        public int apply_date { get; set; }
 
        /// <summary>
        /// 申购上限
        /// </summary>
        public double apply_limit { get; set; }
 
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询当日可转债信息
   public class FuncpubL_1_37Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no { get; set; }
 
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no { get; set; }
 
        /// <summary>
        /// 申购日期
        /// </summary>
        public int apply_date { get; set; }
 
        /// <summary>
        /// 申购上限
        /// </summary>
        public double apply_limit { get; set; }
 
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询证券行情
   public class FuncpubL_1_74Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 涨停价
        /// </summary>
        public double up_limit_price { get; set; }
 
        /// <summary>
        /// 跌停价
        /// </summary>
        public double down_limit_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price { get; set; }
 
        /// <summary>
        /// 今开盘价
        /// </summary>
        public double today_open_price { get; set; }
 
        /// <summary>
        /// 今收盘价
        /// </summary>
        public double today_close_price { get; set; }
 
        /// <summary>
        /// 今最高价
        /// </summary>
        public double today_max_price { get; set; }
 
        /// <summary>
        /// 今最低价
        /// </summary>
        public double today_min_price { get; set; }
 
        /// <summary>
        /// 买一价
        /// </summary>
        public double buy_price_1 { get; set; }
 
        /// <summary>
        /// 买一量
        /// </summary>
        public double buy_qty_1 { get; set; }
 
        /// <summary>
        /// 买二价
        /// </summary>
        public double buy_price_2 { get; set; }
 
        /// <summary>
        /// 买二量
        /// </summary>
        public double buy_qty_2 { get; set; }
 
        /// <summary>
        /// 买三价
        /// </summary>
        public double buy_price_3 { get; set; }
 
        /// <summary>
        /// 买三量
        /// </summary>
        public double buy_qty_3 { get; set; }
 
        /// <summary>
        /// 买四价
        /// </summary>
        public double buy_price_4 { get; set; }
 
        /// <summary>
        /// 买四量
        /// </summary>
        public double buy_qty_4 { get; set; }
 
        /// <summary>
        /// 买五价
        /// </summary>
        public double buy_price_5 { get; set; }
 
        /// <summary>
        /// 买五量
        /// </summary>
        public double buy_qty_5 { get; set; }
 
        /// <summary>
        /// 卖一价
        /// </summary>
        public double sell_price_1 { get; set; }
 
        /// <summary>
        /// 卖一量
        /// </summary>
        public double sell_qty_1 { get; set; }
 
        /// <summary>
        /// 卖二价
        /// </summary>
        public double sell_price_2 { get; set; }
 
        /// <summary>
        /// 卖二量
        /// </summary>
        public double sell_qty_2 { get; set; }
 
        /// <summary>
        /// 卖三价
        /// </summary>
        public double sell_price_3 { get; set; }
 
        /// <summary>
        /// 卖三量
        /// </summary>
        public double sell_qty_3 { get; set; }
 
        /// <summary>
        /// 卖四价
        /// </summary>
        public double sell_price_4 { get; set; }
 
        /// <summary>
        /// 卖四量
        /// </summary>
        public double sell_qty_4 { get; set; }
 
        /// <summary>
        /// 卖五价
        /// </summary>
        public double sell_price_5 { get; set; }
 
        /// <summary>
        /// 卖五量
        /// </summary>
        public double sell_qty_5 { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 市盈率
        /// </summary>
        public double pe_ratio { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_批量获取证券行情
   public class FuncpubL_1_77Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 涨停价
        /// </summary>
        public double up_limit_price { get; set; }
 
        /// <summary>
        /// 跌停价
        /// </summary>
        public double down_limit_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price { get; set; }
 
        /// <summary>
        /// 今开盘价
        /// </summary>
        public double today_open_price { get; set; }
 
        /// <summary>
        /// 今收盘价
        /// </summary>
        public double today_close_price { get; set; }
 
        /// <summary>
        /// 今最高价
        /// </summary>
        public double today_max_price { get; set; }
 
        /// <summary>
        /// 今最低价
        /// </summary>
        public double today_min_price { get; set; }
 
        /// <summary>
        /// 买一价
        /// </summary>
        public double buy_price_1 { get; set; }
 
        /// <summary>
        /// 买一量
        /// </summary>
        public double buy_qty_1 { get; set; }
 
        /// <summary>
        /// 买二价
        /// </summary>
        public double buy_price_2 { get; set; }
 
        /// <summary>
        /// 买二量
        /// </summary>
        public double buy_qty_2 { get; set; }
 
        /// <summary>
        /// 买三价
        /// </summary>
        public double buy_price_3 { get; set; }
 
        /// <summary>
        /// 买三量
        /// </summary>
        public double buy_qty_3 { get; set; }
 
        /// <summary>
        /// 买四价
        /// </summary>
        public double buy_price_4 { get; set; }
 
        /// <summary>
        /// 买四量
        /// </summary>
        public double buy_qty_4 { get; set; }
 
        /// <summary>
        /// 买五价
        /// </summary>
        public double buy_price_5 { get; set; }
 
        /// <summary>
        /// 买五量
        /// </summary>
        public double buy_qty_5 { get; set; }
 
        /// <summary>
        /// 卖一价
        /// </summary>
        public double sell_price_1 { get; set; }
 
        /// <summary>
        /// 卖一量
        /// </summary>
        public double sell_qty_1 { get; set; }
 
        /// <summary>
        /// 卖二价
        /// </summary>
        public double sell_price_2 { get; set; }
 
        /// <summary>
        /// 卖二量
        /// </summary>
        public double sell_qty_2 { get; set; }
 
        /// <summary>
        /// 卖三价
        /// </summary>
        public double sell_price_3 { get; set; }
 
        /// <summary>
        /// 卖三量
        /// </summary>
        public double sell_qty_3 { get; set; }
 
        /// <summary>
        /// 卖四价
        /// </summary>
        public double sell_price_4 { get; set; }
 
        /// <summary>
        /// 卖四量
        /// </summary>
        public double sell_qty_4 { get; set; }
 
        /// <summary>
        /// 卖五价
        /// </summary>
        public double sell_price_5 { get; set; }
 
        /// <summary>
        /// 卖五量
        /// </summary>
        public double sell_qty_5 { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 市盈率
        /// </summary>
        public double pe_ratio { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_获取证券行情
   public class FuncpubL_1_78Model : BaseModel
   {
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 涨停价
        /// </summary>
        public double up_limit_price { get; set; }
 
        /// <summary>
        /// 跌停价
        /// </summary>
        public double down_limit_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询证券行情流水
   public class FuncpubL_1_75Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询历史证券行情流水
   public class FuncpubL_1_76Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_证券行情归档定时任务
   public class FuncpubL_1_79Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询债券属性信息
   public class FuncpubL_1_84Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 发行日期
        /// </summary>
        public int issue_date { get; set; }
 
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// 起息日期
        /// </summary>
        public int value_date { get; set; }
 
        /// <summary>
        /// 下一起息日期
        /// </summary>
        public int next_value_date { get; set; }
 
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// 债券期限
        /// </summary>
        public double bond_limit { get; set; }
 
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price { get; set; }
 
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// 年利率
        /// </summary>
        public double intrst_ratio { get; set; }
 
        /// <summary>
        /// 计息天数
        /// </summary>
        public int intrst_days { get; set; }
 
        /// <summary>
        /// 付息间隔
        /// </summary>
        public int pay_inteval { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 债券利率类型
        /// </summary>
        public int bond_rate_type { get; set; }
 
        /// <summary>
        /// 间隔天数
        /// </summary>
        public int inteval_days { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 最后交易日
        /// </summary>
        public int last_trade_date { get; set; }
 
        /// <summary>
        /// 权益类型
        /// </summary>
        public int rights_type { get; set; }
 
        /// <summary>
        /// 转股开始日期
        /// </summary>
        public int trans_begin_date { get; set; }
 
        /// <summary>
        /// 转股结束日期
        /// </summary>
        public int trans_end_date { get; set; }
 
        /// <summary>
        /// 行权开始日期
        /// </summary>
        public int exec_begin_date { get; set; }
 
        /// <summary>
        /// 行权结束日期
        /// </summary>
        public int exec_end_date { get; set; }
 
        /// <summary>
        /// 质押比例
        /// </summary>
        public double impawn_ratio { get; set; }
 
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_获取债券属性
   public class FuncpubL_1_88Model : BaseModel
   {
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 发行日期
        /// </summary>
        public int issue_date { get; set; }
 
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// 起息日期
        /// </summary>
        public int value_date { get; set; }
 
        /// <summary>
        /// 下一起息日期
        /// </summary>
        public int next_value_date { get; set; }
 
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// 债券期限
        /// </summary>
        public double bond_limit { get; set; }
 
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price { get; set; }
 
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// 年利率
        /// </summary>
        public double intrst_ratio { get; set; }
 
        /// <summary>
        /// 计息天数
        /// </summary>
        public int intrst_days { get; set; }
 
        /// <summary>
        /// 付息间隔
        /// </summary>
        public int pay_inteval { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 债券利率类型
        /// </summary>
        public int bond_rate_type { get; set; }
 
        /// <summary>
        /// 间隔天数
        /// </summary>
        public int inteval_days { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 最后交易日
        /// </summary>
        public int last_trade_date { get; set; }
 
        /// <summary>
        /// 权益类型
        /// </summary>
        public int rights_type { get; set; }
 
        /// <summary>
        /// 转股开始日期
        /// </summary>
        public int trans_begin_date { get; set; }
 
        /// <summary>
        /// 转股结束日期
        /// </summary>
        public int trans_end_date { get; set; }
 
        /// <summary>
        /// 行权开始日期
        /// </summary>
        public int exec_begin_date { get; set; }
 
        /// <summary>
        /// 行权结束日期
        /// </summary>
        public int exec_end_date { get; set; }
 
        /// <summary>
        /// 质押比例
        /// </summary>
        public double impawn_ratio { get; set; }
 
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询债券属性流水
   public class FuncpubL_1_85Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询历史债券属性流水
   public class FuncpubL_1_86Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询债券质押信息
   public class FuncpubL_1_87Model : BaseModel
   {
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 质押代码编号
        /// </summary>
        public int impawn_code_no { get; set; }
 
        /// <summary>
        /// 质押代码
        /// </summary>
        public String impawn_code { get; set; }
 
        /// <summary>
        /// 质押比例
        /// </summary>
        public double impawn_ratio { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询债券利率
   public class FuncpubL_1_94Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 利率开始日期
        /// </summary>
        public int intrst_begin_date { get; set; }
 
        /// <summary>
        /// 年利率
        /// </summary>
        public double intrst_ratio { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询债券利率流水
   public class FuncpubL_1_95Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 利率开始日期
        /// </summary>
        public int intrst_begin_date { get; set; }
 
        /// <summary>
        /// 年利率
        /// </summary>
        public double intrst_ratio { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询历史债券利率流水
   public class FuncpubL_1_96Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 利率开始日期
        /// </summary>
        public int intrst_begin_date { get; set; }
 
        /// <summary>
        /// 年利率
        /// </summary>
        public double intrst_ratio { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询债券评级信息
   public class FuncpubL_1_104Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 评级机构
        /// </summary>
        public String rating_agency { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 债券等级
        /// </summary>
        public int bond_level { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询债券评级流水
   public class FuncpubL_1_105Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 评级机构
        /// </summary>
        public String rating_agency { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 债券等级
        /// </summary>
        public int bond_level { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询历史债券评级流水
   public class FuncpubL_1_106Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 评级机构
        /// </summary>
        public String rating_agency { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 债券等级
        /// </summary>
        public int bond_level { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询回购代码信息
   public class FuncpubL_1_130Model : BaseModel
   {
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 回购天数
        /// </summary>
        public int repo_days { get; set; }
 
        /// <summary>
        /// 资金占款天数
        /// </summary>
        public int cash_capt_days { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_逆回购获取代码费用信息
   public class FuncpubL_1_131Model : BaseModel
   {
        /// <summary>
        /// 金额比例串
        /// </summary>
        public String amt_ratio_str { get; set; }
 
        /// <summary>
        /// 金额固定额串
        /// </summary>
        public String amt_value_str { get; set; }
 
        /// <summary>
        /// 最高费用串
        /// </summary>
        public String max_fee_str { get; set; }
 
        /// <summary>
        /// 最低费用串
        /// </summary>
        public String min_fee_str { get; set; }
 
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询港股价位
   public class FuncpubL_1_140Model : BaseModel
   {
        /// <summary>
        /// 起始价位
        /// </summary>
        public double begin_price { get; set; }
 
        /// <summary>
        /// 结束价位
        /// </summary>
        public double end_price { get; set; }
 
        /// <summary>
        /// 最小价差
        /// </summary>
        public double step_price { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_编号获取证券信息
   public class FuncpubL_1_141Model : BaseModel
   {
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询基金属性信息
   public class FuncpubL_1_145Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 基金类别
        /// </summary>
        public int fund_kind { get; set; }
 
        /// <summary>
        /// 基金管理人
        /// </summary>
        public String fund_manager { get; set; }
 
        /// <summary>
        /// 基金托管人
        /// </summary>
        public String fund_trustee { get; set; }
 
        /// <summary>
        /// 发行规模
        /// </summary>
        public double distribution_scale { get; set; }
 
        /// <summary>
        /// 收费方式
        /// </summary>
        public int charging_method { get; set; }
 
        /// <summary>
        /// 默认分红方式
        /// </summary>
        public int default_divide_type { get; set; }
 
        /// <summary>
        /// 基金成立日期
        /// </summary>
        public int fund_found_date { get; set; }
 
        /// <summary>
        /// 基金到期日期
        /// </summary>
        public int fund_expire_date { get; set; }
 
        /// <summary>
        /// 认购交易标志
        /// </summary>
        public int subscription_trade_mark { get; set; }
 
        /// <summary>
        /// 申购交易标志
        /// </summary>
        public int purchase_trade_mark { get; set; }
 
        /// <summary>
        /// 赎回交易标志
        /// </summary>
        public int rede_trade_mark { get; set; }
 
        /// <summary>
        /// 首次最低金额
        /// </summary>
        public double first_minimum_amt { get; set; }
 
        /// <summary>
        /// 最低认购金额
        /// </summary>
        public double minimum_subscription_amt { get; set; }
 
        /// <summary>
        /// 最低申购金额
        /// </summary>
        public double minimum_purchase_amt { get; set; }
 
        /// <summary>
        /// 最低赎回份额
        /// </summary>
        public double minimum_rede_share { get; set; }
 
        /// <summary>
        /// 最低持有份额
        /// </summary>
        public double minimum_holding_share { get; set; }
 
        /// <summary>
        /// 最低转出份额
        /// </summary>
        public double minimum_turning_out_share { get; set; }
 
        /// <summary>
        /// 赎回款到账天数
        /// </summary>
        public int rede_money_to_account_days { get; set; }
 
        /// <summary>
        /// 登记机构
        /// </summary>
        public String registration_agency { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_获取基金属性
   public class FuncpubL_1_146Model : BaseModel
   {
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 基金类别
        /// </summary>
        public int fund_kind { get; set; }
 
        /// <summary>
        /// 基金管理人
        /// </summary>
        public String fund_manager { get; set; }
 
        /// <summary>
        /// 基金托管人
        /// </summary>
        public String fund_trustee { get; set; }
 
        /// <summary>
        /// 发行规模
        /// </summary>
        public double distribution_scale { get; set; }
 
        /// <summary>
        /// 收费方式
        /// </summary>
        public int charging_method { get; set; }
 
        /// <summary>
        /// 默认分红方式
        /// </summary>
        public int default_divide_type { get; set; }
 
        /// <summary>
        /// 基金成立日期
        /// </summary>
        public int fund_found_date { get; set; }
 
        /// <summary>
        /// 基金到期日期
        /// </summary>
        public int fund_expire_date { get; set; }
 
        /// <summary>
        /// 认购交易标志
        /// </summary>
        public int subscription_trade_mark { get; set; }
 
        /// <summary>
        /// 申购交易标志
        /// </summary>
        public int purchase_trade_mark { get; set; }
 
        /// <summary>
        /// 赎回交易标志
        /// </summary>
        public int rede_trade_mark { get; set; }
 
        /// <summary>
        /// 首次最低金额
        /// </summary>
        public double first_minimum_amt { get; set; }
 
        /// <summary>
        /// 最低认购金额
        /// </summary>
        public double minimum_subscription_amt { get; set; }
 
        /// <summary>
        /// 最低申购金额
        /// </summary>
        public double minimum_purchase_amt { get; set; }
 
        /// <summary>
        /// 最低赎回份额
        /// </summary>
        public double minimum_rede_share { get; set; }
 
        /// <summary>
        /// 最低持有份额
        /// </summary>
        public double minimum_holding_share { get; set; }
 
        /// <summary>
        /// 最低转出份额
        /// </summary>
        public double minimum_turning_out_share { get; set; }
 
        /// <summary>
        /// 赎回款到账天数
        /// </summary>
        public int rede_money_to_account_days { get; set; }
 
        /// <summary>
        /// 登记机构
        /// </summary>
        public String registration_agency { get; set; }
 
        /// <summary>
        /// 时间戳
        /// </summary>
        public int time_stamp { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询基金属性流水
   public class FuncpubL_1_147Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询历史基金属性流水
   public class FuncpubL_1_148Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员机构编号
        /// </summary>
        public int opor_co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
        /// <summary>
        /// 操作信息
        /// </summary>
        public String oper_info { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
        /// <summary>
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询新股开板监控信息
   public class FuncpubL_1_151Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no { get; set; }
 
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no { get; set; }
 
        /// <summary>
        /// 申购日期
        /// </summary>
        public int apply_date { get; set; }
 
        /// <summary>
        /// 申购上限
        /// </summary>
        public double apply_limit { get; set; }
 
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price { get; set; }
 
        /// <summary>
        /// 触警成交量
        /// </summary>
        public double warn_trade_amount { get; set; }
 
        /// <summary>
        /// 触警买一数量
        /// </summary>
        public double warn_buy_amount { get; set; }
 
        /// <summary>
        /// 触警是否自动卖出
        /// </summary>
        public int warn_auto_sell { get; set; }
 
        /// <summary>
        /// 是否触警
        /// </summary>
        public int is_warn { get; set; }
 
        /// <summary>
        /// 开板日期
        /// </summary>
        public int stock_open_date { get; set; }
 
        /// <summary>
        /// 开板价格
        /// </summary>
        public double stock_open_price { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 买一量
        /// </summary>
        public double buy_qty_1 { get; set; }
 
        /// <summary>
        /// 涨停价
        /// </summary>
        public double up_limit_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询触警新股信息
   public class FuncpubL_1_155Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 触警成交量
        /// </summary>
        public double warn_trade_amount { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 触警买一数量
        /// </summary>
        public double warn_buy_amount { get; set; }
 
        /// <summary>
        /// 买一量
        /// </summary>
        public double buy_qty_1 { get; set; }
 
        /// <summary>
        /// 涨停价
        /// </summary>
        public double up_limit_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询所有新股信息
   public class FuncpubL_1_157Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 交易代码
        /// </summary>
        public String trade_code { get; set; }
 
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 交易代码编号
        /// </summary>
        public int trade_code_no { get; set; }
 
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no { get; set; }
 
        /// <summary>
        /// 申购日期
        /// </summary>
        public int apply_date { get; set; }
 
        /// <summary>
        /// 申购上限
        /// </summary>
        public double apply_limit { get; set; }
 
        /// <summary>
        /// 上市日期
        /// </summary>
        public int begin_trade_date { get; set; }
 
        /// <summary>
        /// 发行价
        /// </summary>
        public double issue_price { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询基金产品对照关系
   public class FuncpubL_1_160Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询特殊证券行情计算单位
   public class FuncpubL_1_164Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 行情计算单位
        /// </summary>
        public double quot_calc_unit { get; set; }
 
   }
 
   //逻辑_公共_证券基础数据_查询证券收盘价
   public class FuncpubL_1_177Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 涨停价
        /// </summary>
        public double up_limit_price { get; set; }
 
        /// <summary>
        /// 跌停价
        /// </summary>
        public double down_limit_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price { get; set; }
 
        /// <summary>
        /// 今开盘价
        /// </summary>
        public double today_open_price { get; set; }
 
        /// <summary>
        /// 今收盘价
        /// </summary>
        public double today_close_price { get; set; }
 
        /// <summary>
        /// 今最高价
        /// </summary>
        public double today_max_price { get; set; }
 
        /// <summary>
        /// 今最低价
        /// </summary>
        public double today_min_price { get; set; }
 
   }
 
}
