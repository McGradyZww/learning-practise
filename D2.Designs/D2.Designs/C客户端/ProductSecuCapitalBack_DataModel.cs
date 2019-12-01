using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_产品证券_资金运维_查询资产账户内外资金差异记录
   public class FuncpdsecuL_10_1Model : BaseModel
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 账户当前金额
        /// </summary>
        public double acco_curr_amt { get; set; }
 
        /// <summary>
        /// 账户可用金额
        /// </summary>
        public double acco_avail_amt { get; set; }
 
        /// <summary>
        /// 外部当前金额
        /// </summary>
        public double out_curr_amt { get; set; }
 
        /// <summary>
        /// 外部可用金额
        /// </summary>
        public double out_enable_amt { get; set; }
 
        /// <summary>
        /// 系统可用金额差额
        /// </summary>
        public double sys_avail_amt_diff { get; set; }
 
        /// <summary>
        /// 账户当前金额差额
        /// </summary>
        public double acco_curr_amt_diff { get; set; }
 
        /// <summary>
        /// 账户可用金额差额
        /// </summary>
        public double acco_avail_amt_diff { get; set; }
 
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// 外部累计应付金额
        /// </summary>
        public double out_total_payab_amt { get; set; }
 
        /// <summary>
        /// 外部累计应收金额
        /// </summary>
        public double out_total_rece_amt { get; set; }
 
        /// <summary>
        /// 账户累计应付金额差额
        /// </summary>
        public double acco_total_payab_amt_diff { get; set; }
 
        /// <summary>
        /// 账户累计应收金额差额
        /// </summary>
        public double acco_total_rece_amt_diff { get; set; }
 
        /// <summary>
        /// 处理标志
        /// </summary>
        public int deal_flag { get; set; }
 
        /// <summary>
        /// 资产是否同步
        /// </summary>
        public int asset_sync_flag { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_产品证券_资金运维_处理资产账户内外资金差异记录
   public class FuncpdsecuL_10_2Model : BaseModel
   {
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
   }
 
   //逻辑_产品证券_资金运维_查询估值外部资金
   public class FuncpdsecuL_10_4Model : BaseModel
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 外部当前金额
        /// </summary>
        public double out_curr_amt { get; set; }
 
        /// <summary>
        /// 外部可用金额
        /// </summary>
        public double out_enable_amt { get; set; }
 
        /// <summary>
        /// 外部冻结金额
        /// </summary>
        public double out_frozen_amt { get; set; }
 
        /// <summary>
        /// 外部解冻金额
        /// </summary>
        public double out_unfroz_amt { get; set; }
 
   }
 
   //逻辑_产品证券_资金运维_查询外部资金
   public class FuncpdsecuL_10_5Model : BaseModel
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 外部当前金额
        /// </summary>
        public double out_curr_amt { get; set; }
 
        /// <summary>
        /// 外部可用金额
        /// </summary>
        public double out_enable_amt { get; set; }
 
        /// <summary>
        /// 外部冻结金额
        /// </summary>
        public double out_frozen_amt { get; set; }
 
        /// <summary>
        /// 外部解冻金额
        /// </summary>
        public double out_unfroz_amt { get; set; }
 
        /// <summary>
        /// 外部累计应付金额
        /// </summary>
        public double out_total_payab_amt { get; set; }
 
        /// <summary>
        /// 外部累计应收金额
        /// </summary>
        public double out_total_rece_amt { get; set; }
 
   }
 
   //逻辑_产品证券_资金运维_查询交易组资金
   public class FuncpdsecuL_10_23Model : BaseModel
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 期初金额
        /// </summary>
        public double begin_amt { get; set; }
 
        /// <summary>
        /// 当前金额
        /// </summary>
        public double curr_amt { get; set; }
 
        /// <summary>
        /// 冻结金额
        /// </summary>
        public double frozen_amt { get; set; }
 
        /// <summary>
        /// 解冻金额
        /// </summary>
        public double unfroz_amt { get; set; }
 
        /// <summary>
        /// 待交收金额
        /// </summary>
        public double pre_settle_amt { get; set; }
 
        /// <summary>
        /// 沪深可用调整金额
        /// </summary>
        public double shsz_avail_change_amt { get; set; }
 
        /// <summary>
        /// 港股通可用调整金额
        /// </summary>
        public double hk_avail_change_amt { get; set; }
 
        /// <summary>
        /// 金额核对差额
        /// </summary>
        public double amt_check_diff { get; set; }
 
        /// <summary>
        /// T日当日港股买入金额
        /// </summary>
        public double T_hk_buy_total_amt { get; set; }
 
        /// <summary>
        /// T日当日港股卖出金额
        /// </summary>
        public double T_hk_sell_total_amt { get; set; }
 
        /// <summary>
        /// T1日当日港股买入金额
        /// </summary>
        public double T1_hk_buy_total_amt { get; set; }
 
        /// <summary>
        /// T1日当日港股卖出金额
        /// </summary>
        public double T1_hk_sell_total_amt { get; set; }
 
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// 红冲蓝补金额
        /// </summary>
        public double total_change_amt { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利率
        /// </summary>
        public double intrst_rate { get; set; }
 
        /// <summary>
        /// 利息积数
        /// </summary>
        public double intrst_base_amt { get; set; }
 
        /// <summary>
        /// 待入账利息
        /// </summary>
        public double pre_entry_intrst_amt { get; set; }
 
   }
 
   //逻辑_产品证券_资金运维_查询通道内外资金差异
   public class FuncpdsecuL_10_25Model : BaseModel
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 账户当前金额
        /// </summary>
        public double acco_curr_amt { get; set; }
 
        /// <summary>
        /// 账户可用金额
        /// </summary>
        public double acco_avail_amt { get; set; }
 
        /// <summary>
        /// 外部当前金额
        /// </summary>
        public double out_curr_amt { get; set; }
 
        /// <summary>
        /// 外部可用金额
        /// </summary>
        public double out_enable_amt { get; set; }
 
        /// <summary>
        /// 系统可用金额差额
        /// </summary>
        public double sys_avail_amt_diff { get; set; }
 
        /// <summary>
        /// 账户当前金额差额
        /// </summary>
        public double acco_curr_amt_diff { get; set; }
 
        /// <summary>
        /// 账户可用金额差额
        /// </summary>
        public double acco_avail_amt_diff { get; set; }
 
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// 外部累计应付金额
        /// </summary>
        public double out_total_payab_amt { get; set; }
 
        /// <summary>
        /// 外部累计应收金额
        /// </summary>
        public double out_total_rece_amt { get; set; }
 
        /// <summary>
        /// 账户累计应付金额差额
        /// </summary>
        public double acco_total_payab_amt_diff { get; set; }
 
        /// <summary>
        /// 账户累计应收金额差额
        /// </summary>
        public double acco_total_rece_amt_diff { get; set; }
 
        /// <summary>
        /// 处理标志
        /// </summary>
        public int deal_flag { get; set; }
 
        /// <summary>
        /// 资产是否同步
        /// </summary>
        public int asset_sync_flag { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_产品证券_资金运维_查询资产账户资金流水
   public class FuncpdsecuL_10_27Model : BaseModel
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
 
   //逻辑_产品证券_资金运维_查询历史资产账户资金流水
   public class FuncpdsecuL_10_28Model : BaseModel
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
 
}
