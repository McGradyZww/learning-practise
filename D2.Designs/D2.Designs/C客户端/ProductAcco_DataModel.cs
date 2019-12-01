using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_产品_账户_新增产品信息
   public class FuncprodL_1_1Model : BaseModel
   {
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
   }
 
   //逻辑_产品_账户_查询产品信息
   public class FuncprodL_1_4Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 产品名称
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// 产品全称
        /// </summary>
        public String pd_flname { get; set; }
 
        /// <summary>
        /// 基金备案编号
        /// </summary>
        public String fund_reg_code { get; set; }
 
        /// <summary>
        /// 产品管理人
        /// </summary>
        public String pd_manager { get; set; }
 
        /// <summary>
        /// 成立日期
        /// </summary>
        public int found_date { get; set; }
 
        /// <summary>
        /// 产品类型
        /// </summary>
        public int pd_type { get; set; }
 
        /// <summary>
        /// 募集币种
        /// </summary>
        public String apply_currency { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 原始资产
        /// </summary>
        public double first_asset { get; set; }
 
        /// <summary>
        /// 原始金额
        /// </summary>
        public double first_amt { get; set; }
 
        /// <summary>
        /// 产品总份额
        /// </summary>
        public double pd_all_share { get; set; }
 
        /// <summary>
        /// 当前份额
        /// </summary>
        public double curr_share { get; set; }
 
        /// <summary>
        /// 昨日份额
        /// </summary>
        public double pre_share { get; set; }
 
        /// <summary>
        /// 历史最高单位净值
        /// </summary>
        public double his_max_per_nav { get; set; }
 
        /// <summary>
        /// 昨日净值
        /// </summary>
        public double pre_nav { get; set; }
 
        /// <summary>
        /// 境内托管人全名
        /// </summary>
        public String coust_full_name { get; set; }
 
        /// <summary>
        /// 境内托管账户
        /// </summary>
        public String coust_acco { get; set; }
 
        /// <summary>
        /// 境内托管账户名
        /// </summary>
        public String coust_acco_name { get; set; }
 
        /// <summary>
        /// 预警线
        /// </summary>
        public double warn_posi_value { get; set; }
 
        /// <summary>
        /// 平仓线
        /// </summary>
        public double close_posi_value { get; set; }
 
        /// <summary>
        /// 目标仓位
        /// </summary>
        public double target_posi_ratio { get; set; }
 
        /// <summary>
        /// beta系数
        /// </summary>
        public double beta_coeffi { get; set; }
 
        /// <summary>
        /// 自定义产品分类
        /// </summary>
        public String custom_pd_class { get; set; }
 
        /// <summary>
        /// 产品状态
        /// </summary>
        public String pd_status { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 索引值
        /// </summary>
        public int index_value { get; set; }
 
   }
 
   //逻辑_产品_账户_查询历史产品信息
   public class FuncprodL_1_5Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 产品名称
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// 产品全称
        /// </summary>
        public String pd_flname { get; set; }
 
        /// <summary>
        /// 基金备案编号
        /// </summary>
        public String fund_reg_code { get; set; }
 
        /// <summary>
        /// 产品管理人
        /// </summary>
        public String pd_manager { get; set; }
 
        /// <summary>
        /// 成立日期
        /// </summary>
        public int found_date { get; set; }
 
        /// <summary>
        /// 产品类型
        /// </summary>
        public int pd_type { get; set; }
 
        /// <summary>
        /// 募集币种
        /// </summary>
        public String apply_currency { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 原始资产
        /// </summary>
        public double first_asset { get; set; }
 
        /// <summary>
        /// 原始金额
        /// </summary>
        public double first_amt { get; set; }
 
        /// <summary>
        /// 产品总份额
        /// </summary>
        public double pd_all_share { get; set; }
 
        /// <summary>
        /// 当前份额
        /// </summary>
        public double curr_share { get; set; }
 
        /// <summary>
        /// 昨日份额
        /// </summary>
        public double pre_share { get; set; }
 
        /// <summary>
        /// 历史最高单位净值
        /// </summary>
        public double his_max_per_nav { get; set; }
 
        /// <summary>
        /// 昨日净值
        /// </summary>
        public double pre_nav { get; set; }
 
        /// <summary>
        /// 境内托管人全名
        /// </summary>
        public String coust_full_name { get; set; }
 
        /// <summary>
        /// 境内托管账户
        /// </summary>
        public String coust_acco { get; set; }
 
        /// <summary>
        /// 境内托管账户名
        /// </summary>
        public String coust_acco_name { get; set; }
 
        /// <summary>
        /// 预警线
        /// </summary>
        public double warn_posi_value { get; set; }
 
        /// <summary>
        /// 平仓线
        /// </summary>
        public double close_posi_value { get; set; }
 
        /// <summary>
        /// 目标仓位
        /// </summary>
        public double target_posi_ratio { get; set; }
 
        /// <summary>
        /// beta系数
        /// </summary>
        public double beta_coeffi { get; set; }
 
        /// <summary>
        /// 自定义产品分类
        /// </summary>
        public String custom_pd_class { get; set; }
 
        /// <summary>
        /// 产品状态
        /// </summary>
        public String pd_status { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 索引值
        /// </summary>
        public int index_value { get; set; }
 
   }
 
   //逻辑_产品_账户_查询产品信息流水
   public class FuncprodL_1_6Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time { get; set; }
 
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
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
   //逻辑_产品_账户_查询历史产品信息流水
   public class FuncprodL_1_7Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time { get; set; }
 
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
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
   //逻辑_产品_账户_查询全部产品列表
   public class FuncprodL_1_12Model : BaseModel
   {
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 产品名称
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// 产品状态
        /// </summary>
        public String pd_status { get; set; }
 
   }
 
   //逻辑_产品_账户_查询可见产品列表
   public class FuncprodL_1_13Model : BaseModel
   {
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 产品名称
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// 产品状态
        /// </summary>
        public String pd_status { get; set; }
 
        /// <summary>
        /// 产品业务控制配置串
        /// </summary>
        public String pd_busi_config_str { get; set; }
 
        /// <summary>
        /// 指令不限价浮动比例
        /// </summary>
        public double comm_no_limit_price_ratio { get; set; }
 
   }
 
   //逻辑_产品_账户_查询产品历史最高单位净值
   public class FuncprodL_1_17Model : BaseModel
   {
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 产品名称
        /// </summary>
        public String pd_name { get; set; }
 
        /// <summary>
        /// 历史最高单位净值
        /// </summary>
        public double his_max_per_nav { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
   }
 
   //逻辑_产品_账户_查询产品限制信息
   public class FuncprodL_1_24Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 成本计算方式
        /// </summary>
        public int cost_calc_type { get; set; }
 
        /// <summary>
        /// 允许投资市场
        /// </summary>
        public String allow_exch { get; set; }
 
        /// <summary>
        /// 允许操作证券类型
        /// </summary>
        public String allow_stock_type { get; set; }
 
        /// <summary>
        /// 业务控制配置串
        /// </summary>
        public String busi_config_str { get; set; }
 
        /// <summary>
        /// 指令审批操作员
        /// </summary>
        public int comm_appr_oper { get; set; }
 
        /// <summary>
        /// 市价冻结浮动比例
        /// </summary>
        public double market_price_ratio { get; set; }
 
        /// <summary>
        /// 禁止订单方向
        /// </summary>
        public String forbid_order_dir { get; set; }
 
        /// <summary>
        /// 产品状态
        /// </summary>
        public String pd_status { get; set; }
 
        /// <summary>
        /// 指令不限价浮动比例
        /// </summary>
        public double comm_no_limit_price_ratio { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_产品_账户_查询产品限制信息流水
   public class FuncprodL_1_25Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time { get; set; }
 
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
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
   //逻辑_产品_账户_查询历史产品限制信息流水
   public class FuncprodL_1_26Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time { get; set; }
 
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
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
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
 
   //逻辑_产品_账户_新增银行账户信息
   public class FuncprodL_1_31Model : BaseModel
   {
        /// <summary>
        /// 银行账户编号
        /// </summary>
        public int bank_acco_no { get; set; }
 
   }
 
   //逻辑_产品_账户_查询银行账户信息
   public class FuncprodL_1_34Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 银行账户编号
        /// </summary>
        public int bank_acco_no { get; set; }
 
        /// <summary>
        /// 银行代码
        /// </summary>
        public String bank_code { get; set; }
 
        /// <summary>
        /// 银行名称
        /// </summary>
        public String bank_name { get; set; }
 
        /// <summary>
        /// 银行账户
        /// </summary>
        public String bank_acco { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_产品_账户_查询银行账户信息流水
   public class FuncprodL_1_35Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time { get; set; }
 
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
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 银行账户编号
        /// </summary>
        public int bank_acco_no { get; set; }
 
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
 
   //逻辑_产品_账户_查询历史银行账户信息流水
   public class FuncprodL_1_36Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time { get; set; }
 
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
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 银行账户编号
        /// </summary>
        public int bank_acco_no { get; set; }
 
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
 
   //逻辑_产品_账户_新增资产账户信息
   public class FuncprodL_1_41Model : BaseModel
   {
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
   }
 
   //逻辑_产品_账户_查询资产账户信息
   public class FuncprodL_1_44Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 资产账户
        /// </summary>
        public String asset_acco { get; set; }
 
        /// <summary>
        /// 资产账户名称
        /// </summary>
        public String asset_acco_name { get; set; }
 
        /// <summary>
        /// 资产账户类型
        /// </summary>
        public int asset_acco_type { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 交易密码
        /// </summary>
        public String trade_pwd { get; set; }
 
        /// <summary>
        /// 资产账户状态
        /// </summary>
        public String asset_acco_status { get; set; }
 
        /// <summary>
        /// 业务控制配置串
        /// </summary>
        public String busi_config_str { get; set; }
 
        /// <summary>
        /// 市价冻结浮动比例
        /// </summary>
        public double market_price_ratio { get; set; }
 
        /// <summary>
        /// 允许投资市场
        /// </summary>
        public String allow_exch { get; set; }
 
        /// <summary>
        /// 允许操作证券类型
        /// </summary>
        public String allow_stock_type { get; set; }
 
        /// <summary>
        /// 分笔费用类型串
        /// </summary>
        public String split_fee_typr_str { get; set; }
 
        /// <summary>
        /// 业务限制串
        /// </summary>
        public String busi_limit_str { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 营业部
        /// </summary>
        public String busi_depart { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
   }
 
   //逻辑_产品_账户_查询资产账户信息流水
   public class FuncprodL_1_45Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time { get; set; }
 
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
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
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
 
   //逻辑_产品_账户_查询历史资产账户信息流水
   public class FuncprodL_1_46Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time { get; set; }
 
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
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
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
 
   //逻辑_产品_账户_查询资产账户列表
   public class FuncprodL_1_51Model : BaseModel
   {
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 资产账户
        /// </summary>
        public String asset_acco { get; set; }
 
        /// <summary>
        /// 资产账户名称
        /// </summary>
        public String asset_acco_name { get; set; }
 
        /// <summary>
        /// 资产账户状态
        /// </summary>
        public String asset_acco_status { get; set; }
 
   }
 
   //逻辑_产品_账户_更新资产账户在线状态
   public class FuncprodL_1_52Model : BaseModel
   {
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 在线状态
        /// </summary>
        public int online_status { get; set; }
 
   }
 
   //逻辑_产品_账户_查询资产账户通道信息
   public class FuncprodL_1_74Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编码
        /// </summary>
        public String pd_code { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 通道类型
        /// </summary>
        public int pass_type { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 在线状态
        /// </summary>
        public int online_status { get; set; }
 
        /// <summary>
        /// 参数配置串
        /// </summary>
        public String config_str { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_产品_账户_获取产品最大单位净值
   public class FuncprodL_1_75Model : BaseModel
   {
        /// <summary>
        /// 产品单位净值
        /// </summary>
        public double pd_part_nav { get; set; }
 
   }
 
   //逻辑_产品_账户_获取产品最大净值
   public class FuncprodL_1_76Model : BaseModel
   {
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
   }
 
   //逻辑_产品_账户_资产账户编号获取资产账户
   public class FuncprodL_1_77Model : BaseModel
   {
        /// <summary>
        /// 资产账户
        /// </summary>
        public String asset_acco { get; set; }
 
   }
 
   //逻辑_产品_账户_查询产品份额变动流水
   public class FuncprodL_1_78Model : BaseModel
   {
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
   }
 
   //逻辑_产品_账户_查询产品份额变动流水历史
   public class FuncprodL_1_79Model : BaseModel
   {
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
   }
 
   //逻辑_产品_账户_查询产品工作流信息
   public class FuncprodL_1_82Model : BaseModel
   {
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 工作流模式
        /// </summary>
        public int workflow_type { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 工作流顺序号
        /// </summary>
        public int workflow_num { get; set; }
 
        /// <summary>
        /// 操作员编号串
        /// </summary>
        public String opor_no_str { get; set; }
 
   }
 
   //逻辑_产品_账户_查询账户同步信息
   public class FuncprodL_1_83Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 资产账户类型
        /// </summary>
        public int asset_acco_type { get; set; }
 
        /// <summary>
        /// 资产账户状态
        /// </summary>
        public String asset_acco_status { get; set; }
 
        /// <summary>
        /// 密码验证状态
        /// </summary>
        public int pwd_check_status { get; set; }
 
        /// <summary>
        /// 在线状态
        /// </summary>
        public int online_status { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 允许投资市场
        /// </summary>
        public String allow_exch { get; set; }
 
        /// <summary>
        /// 允许操作证券类型
        /// </summary>
        public String allow_stock_type { get; set; }
 
   }
 
   //逻辑_产品_账户_获取产品工作流信息
   public class FuncprodL_1_85Model : BaseModel
   {
        /// <summary>
        /// 工作流模式
        /// </summary>
        public int workflow_type { get; set; }
 
        /// <summary>
        /// 工作流顺序号
        /// </summary>
        public int workflow_num { get; set; }
 
        /// <summary>
        /// 操作员编号串
        /// </summary>
        public String opor_no_str { get; set; }
 
   }
 
   //逻辑_产品_账户_账户登录回报
   public class FuncprodL_1_86Model : BaseModel
   {
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
   }
 
   //逻辑_产品_账户_查询开盘检查流程
   public class FuncprodL_1_89Model : BaseModel
   {
        /// <summary>
        /// 执行方式
        /// </summary>
        public int execute_type { get; set; }
 
        /// <summary>
        /// 初始化步骤
        /// </summary>
        public int init_step { get; set; }
 
        /// <summary>
        /// 开始时间
        /// </summary>
        public int begin_time { get; set; }
 
        /// <summary>
        /// 执行时间
        /// </summary>
        public int exec_time { get; set; }
 
        /// <summary>
        /// 执行日期
        /// </summary>
        public int exec_date { get; set; }
 
        /// <summary>
        /// 开盘检查执行状态
        /// </summary>
        public int open_execute_type { get; set; }
 
        /// <summary>
        /// 开盘检查执行结果
        /// </summary>
        public int open_execute_result { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_产品_账户_获取开盘检查流程
   public class FuncprodL_1_90Model : BaseModel
   {
        /// <summary>
        /// 执行方式
        /// </summary>
        public int execute_type { get; set; }
 
        /// <summary>
        /// 初始化步骤
        /// </summary>
        public int init_step { get; set; }
 
        /// <summary>
        /// 开始时间
        /// </summary>
        public int begin_time { get; set; }
 
        /// <summary>
        /// 执行时间
        /// </summary>
        public int exec_time { get; set; }
 
        /// <summary>
        /// 执行日期
        /// </summary>
        public int exec_date { get; set; }
 
        /// <summary>
        /// 开盘检查执行状态
        /// </summary>
        public int open_execute_type { get; set; }
 
        /// <summary>
        /// 开盘检查执行结果
        /// </summary>
        public int open_execute_result { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_产品_账户_查询收盘作业流程
   public class FuncprodL_1_91Model : BaseModel
   {
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 流程业务
        /// </summary>
        public int flow_business { get; set; }
 
        /// <summary>
        /// 执行方式
        /// </summary>
        public int execute_type { get; set; }
 
        /// <summary>
        /// 开始时间
        /// </summary>
        public int begin_time { get; set; }
 
        /// <summary>
        /// 执行日期
        /// </summary>
        public int exec_date { get; set; }
 
        /// <summary>
        /// 执行时间
        /// </summary>
        public int exec_time { get; set; }
 
        /// <summary>
        /// 收盘作业执行状态
        /// </summary>
        public int close_execute_type { get; set; }
 
        /// <summary>
        /// 异常处理方式
        /// </summary>
        public int error_deal_type { get; set; }
 
   }
 
   //逻辑_产品_账户_查询产品关系
   public class FuncprodL_1_103Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 创建日期
        /// </summary>
        public int create_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
        /// <summary>
        /// 更新日期
        /// </summary>
        public int update_date { get; set; }
 
        /// <summary>
        /// 更新时间
        /// </summary>
        public int update_time { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 母产品编号
        /// </summary>
        public int mum_pd_no { get; set; }
 
   }
 
   //逻辑_产品_账户_获取注销资产账户串
   public class FuncprodL_1_104Model : BaseModel
   {
        /// <summary>
        /// 资产账户编号串
        /// </summary>
        public String asset_acco_no_str { get; set; }
 
   }
 
   //逻辑_产品_账户_新增融资融券配置表
   public class FuncprodL_1_105Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_产品_账户_查询融资融券配置表
   public class FuncprodL_1_108Model : BaseModel
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 卖券还款方式
        /// </summary>
        public int fina_return_type { get; set; }
 
        /// <summary>
        /// 卖出自动还款
        /// </summary>
        public int sell_auto_back_debt { get; set; }
 
        /// <summary>
        /// 融资额度上限
        /// </summary>
        public double fina_limit_max { get; set; }
 
        /// <summary>
        /// 融券额度上限
        /// </summary>
        public double loan_limit_max { get; set; }
 
        /// <summary>
        /// 融资年利率
        /// </summary>
        public double fina_year_intrst_rate { get; set; }
 
        /// <summary>
        /// 融券年利率
        /// </summary>
        public double secu_loan_year_intrst_rate { get; set; }
 
        /// <summary>
        /// 平仓维持担保比例
        /// </summary>
        public double close_posi_keep_guarantee_ratio { get; set; }
 
        /// <summary>
        /// 补仓维持担保比例
        /// </summary>
        public double fill_posi_keep_guarantee_ratio { get; set; }
 
        /// <summary>
        /// 提取担保比例
        /// </summary>
        public double extract_guarantee_ratio { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_产品_账户_查询资产账户默认交易组信息
   public class FuncprodL_1_109Model : BaseModel
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
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
   }
 
   //逻辑_产品_账户_导入产品信息
   public class FuncprodL_1_112Model : BaseModel
   {
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
   }
 
   //逻辑_产品_账户_获取保证金比例
   public class FuncprodL_1_116Model : BaseModel
   {
        /// <summary>
        /// 保证金比例
        /// </summary>
        public double margin_ratio { get; set; }
 
   }
 
   //逻辑_产品_账户_计算证券订单费用
   public class FuncprodL_1_117Model : BaseModel
   {
        /// <summary>
        /// 交易佣金
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 印花税
        /// </summary>
        public double stamp_tax { get; set; }
 
        /// <summary>
        /// 过户费
        /// </summary>
        public double trans_fee { get; set; }
 
        /// <summary>
        /// 经手费
        /// </summary>
        public double brkage_fee { get; set; }
 
        /// <summary>
        /// 证管费
        /// </summary>
        public double SEC_charges { get; set; }
 
        /// <summary>
        /// 其他费用
        /// </summary>
        public double other_fee { get; set; }
 
        /// <summary>
        /// 其他佣金
        /// </summary>
        public double other_commis { get; set; }
 
        /// <summary>
        /// 交易征费
        /// </summary>
        public double trade_tax { get; set; }
 
        /// <summary>
        /// 交易费
        /// </summary>
        public double trade_cost_fee { get; set; }
 
        /// <summary>
        /// 交易系统使用费
        /// </summary>
        public double trade_system_use_fee { get; set; }
 
        /// <summary>
        /// 股份交收费
        /// </summary>
        public double stock_settle_fee { get; set; }
 
        /// <summary>
        /// 订单冻结金额
        /// </summary>
        public double order_frozen_amt { get; set; }
 
   }
 
   //逻辑_产品_账户_批量计算证券订单费用
   public class FuncprodL_1_118Model : BaseModel
   {
        /// <summary>
        /// 对应序号
        /// </summary>
        public ulong corrsp_id { get; set; }
 
        /// <summary>
        /// 交易佣金
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 印花税
        /// </summary>
        public double stamp_tax { get; set; }
 
        /// <summary>
        /// 过户费
        /// </summary>
        public double trans_fee { get; set; }
 
        /// <summary>
        /// 经手费
        /// </summary>
        public double brkage_fee { get; set; }
 
        /// <summary>
        /// 证管费
        /// </summary>
        public double SEC_charges { get; set; }
 
        /// <summary>
        /// 其他费用
        /// </summary>
        public double other_fee { get; set; }
 
        /// <summary>
        /// 其他佣金
        /// </summary>
        public double other_commis { get; set; }
 
        /// <summary>
        /// 交易征费
        /// </summary>
        public double trade_tax { get; set; }
 
        /// <summary>
        /// 交易费
        /// </summary>
        public double trade_cost_fee { get; set; }
 
        /// <summary>
        /// 交易系统使用费
        /// </summary>
        public double trade_system_use_fee { get; set; }
 
        /// <summary>
        /// 股份交收费
        /// </summary>
        public double stock_settle_fee { get; set; }
 
        /// <summary>
        /// 订单冻结金额
        /// </summary>
        public double order_frozen_amt { get; set; }
 
   }
 
}
