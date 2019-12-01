using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_产品_资金运维_查询产品资金
   public class FuncprodL_4_1Model : BaseModel
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
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 期初金额
        /// </summary>
        public double begin_amt { get; set; }
 
        /// <summary>
        /// 原始金额
        /// </summary>
        public double first_amt { get; set; }
 
        /// <summary>
        /// 当前金额
        /// </summary>
        public double curr_amt { get; set; }
 
        /// <summary>
        /// 产品已分配金额
        /// </summary>
        public double pd_dist_amt { get; set; }
 
        /// <summary>
        /// 产品已授权金额
        /// </summary>
        public double pd_auth_amt { get; set; }
 
        /// <summary>
        /// 金额核对差额
        /// </summary>
        public double amt_check_diff { get; set; }
 
        /// <summary>
        /// 待交收金额
        /// </summary>
        public double pre_settle_amt { get; set; }
 
        /// <summary>
        /// 累计派现金额
        /// </summary>
        public double total_cash_divide { get; set; }
 
        /// <summary>
        /// 累计计提费用
        /// </summary>
        public double total_pre_fee { get; set; }
 
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// 预计利息
        /// </summary>
        public double intrst_cacl_amt { get; set; }
 
        /// <summary>
        /// 待入账利息
        /// </summary>
        public double pre_entry_intrst_amt { get; set; }
 
   }
 
   //逻辑_产品_资金运维_查询历史产品资金
   public class FuncprodL_4_2Model : BaseModel
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
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 期初金额
        /// </summary>
        public double begin_amt { get; set; }
 
        /// <summary>
        /// 原始金额
        /// </summary>
        public double first_amt { get; set; }
 
        /// <summary>
        /// 当前金额
        /// </summary>
        public double curr_amt { get; set; }
 
        /// <summary>
        /// 产品已分配金额
        /// </summary>
        public double pd_dist_amt { get; set; }
 
        /// <summary>
        /// 产品已授权金额
        /// </summary>
        public double pd_auth_amt { get; set; }
 
        /// <summary>
        /// 金额核对差额
        /// </summary>
        public double amt_check_diff { get; set; }
 
        /// <summary>
        /// 待交收金额
        /// </summary>
        public double pre_settle_amt { get; set; }
 
        /// <summary>
        /// 累计派现金额
        /// </summary>
        public double total_cash_divide { get; set; }
 
        /// <summary>
        /// 累计计提费用
        /// </summary>
        public double total_pre_fee { get; set; }
 
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// 预计利息
        /// </summary>
        public double intrst_cacl_amt { get; set; }
 
        /// <summary>
        /// 待入账利息
        /// </summary>
        public double pre_entry_intrst_amt { get; set; }
 
   }
 
   //逻辑_产品_资金运维_查询产品资金流水
   public class FuncprodL_4_5Model : BaseModel
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
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt { get; set; }
 
        /// <summary>
        /// 变动后金额
        /// </summary>
        public double occur_end_amt { get; set; }
 
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
 
   //逻辑_产品_资金运维_查询历史产品资金流水
   public class FuncprodL_4_6Model : BaseModel
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
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt { get; set; }
 
        /// <summary>
        /// 变动后金额
        /// </summary>
        public double occur_end_amt { get; set; }
 
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
 
   //逻辑_产品_资金运维_查询产品资产
   public class FuncprodL_4_7Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 期初净资产
        /// </summary>
        public double begin_NAV { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 总现金资产
        /// </summary>
        public double total_cash_asset { get; set; }
 
        /// <summary>
        /// 证券现金资产
        /// </summary>
        public double stock_cash_asset { get; set; }
 
        /// <summary>
        /// 期货现金资产
        /// </summary>
        public double futu_cash_asset { get; set; }
 
        /// <summary>
        /// 股票资产
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// 基金资产
        /// </summary>
        public double fund_asset { get; set; }
 
        /// <summary>
        /// 债券资产
        /// </summary>
        public double bond_asset { get; set; }
 
        /// <summary>
        /// 期货资产
        /// </summary>
        public double futu_asset { get; set; }
 
        /// <summary>
        /// 回购资产
        /// </summary>
        public double repo_asset { get; set; }
 
        /// <summary>
        /// 其他资产
        /// </summary>
        public double other_asset { get; set; }
 
        /// <summary>
        /// 港股通资产
        /// </summary>
        public double hk_thrgh_stock_asset { get; set; }
 
   }
 
   //逻辑_产品_资金运维_查询历史产品资产
   public class FuncprodL_4_8Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 期初净资产
        /// </summary>
        public double begin_NAV { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 总现金资产
        /// </summary>
        public double total_cash_asset { get; set; }
 
        /// <summary>
        /// 证券现金资产
        /// </summary>
        public double stock_cash_asset { get; set; }
 
        /// <summary>
        /// 期货现金资产
        /// </summary>
        public double futu_cash_asset { get; set; }
 
        /// <summary>
        /// 股票资产
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// 基金资产
        /// </summary>
        public double fund_asset { get; set; }
 
        /// <summary>
        /// 债券资产
        /// </summary>
        public double bond_asset { get; set; }
 
        /// <summary>
        /// 期货资产
        /// </summary>
        public double futu_asset { get; set; }
 
        /// <summary>
        /// 回购资产
        /// </summary>
        public double repo_asset { get; set; }
 
        /// <summary>
        /// 其他资产
        /// </summary>
        public double other_asset { get; set; }
 
        /// <summary>
        /// 港股通资产
        /// </summary>
        public double hk_thrgh_stock_asset { get; set; }
 
   }
 
}
