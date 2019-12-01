using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_清算证券_融资融券清算_转入成交记录
   public class FuncclsecuL_21_1Model : BaseModel
   {
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// 处理信息
        /// </summary>
        public String deal_info { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_查询成交记录
   public class FuncclsecuL_21_3Model : BaseModel
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 成交日期
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// 成交时间
        /// </summary>
        public int strike_time { get; set; }
 
        /// <summary>
        /// 成交编号
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// 申报日期
        /// </summary>
        public int report_date { get; set; }
 
        /// <summary>
        /// 申报时间
        /// </summary>
        public int report_time { get; set; }
 
        /// <summary>
        /// 申报编号
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// 订单时间
        /// </summary>
        public int order_time { get; set; }
 
        /// <summary>
        /// 订单编号
        /// </summary>
        public int order_no { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 成交价格
        /// </summary>
        public double strike_price { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
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
        /// 交易佣金
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// 其他佣金
        /// </summary>
        public double other_commis { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 计息天数
        /// </summary>
        public int intrst_days { get; set; }
 
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 清算入账类型
        /// </summary>
        public int clear_entry_type { get; set; }
 
        /// <summary>
        /// 处理标志
        /// </summary>
        public int deal_flag { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_查询转入成交记录
   public class FuncclsecuL_21_4Model : BaseModel
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 成交时间
        /// </summary>
        public int strike_time { get; set; }
 
        /// <summary>
        /// 成交编号
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// 申报时间
        /// </summary>
        public int report_time { get; set; }
 
        /// <summary>
        /// 申报编号
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 清算结算标志
        /// </summary>
        public int sett_flag { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_清算处理
   public class FuncclsecuL_21_11Model : BaseModel
   {
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// 处理信息
        /// </summary>
        public String deal_info { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_查询合并清算记录
   public class FuncclsecuL_21_13Model : BaseModel
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 成交日期
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// 成交时间
        /// </summary>
        public int strike_time { get; set; }
 
        /// <summary>
        /// 成交编号
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// 申报日期
        /// </summary>
        public int report_date { get; set; }
 
        /// <summary>
        /// 申报时间
        /// </summary>
        public int report_time { get; set; }
 
        /// <summary>
        /// 申报编号
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// 订单时间
        /// </summary>
        public int order_time { get; set; }
 
        /// <summary>
        /// 订单编号
        /// </summary>
        public int order_no { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 成交笔数
        /// </summary>
        public int strike_num { get; set; }
 
        /// <summary>
        /// 成交均价
        /// </summary>
        public double strike_aver_price { get; set; }
 
        /// <summary>
        /// 待入账数量
        /// </summary>
        public double pre_entry_qty { get; set; }
 
        /// <summary>
        /// 待入账金额
        /// </summary>
        public double pre_entry_amt { get; set; }
 
        /// <summary>
        /// 分笔累计成交数量
        /// </summary>
        public double split_strike_qty { get; set; }
 
        /// <summary>
        /// 分笔累计成交金额
        /// </summary>
        public double split_strike_amt { get; set; }
 
        /// <summary>
        /// 分笔累计印花税
        /// </summary>
        public double split_stamp_tax { get; set; }
 
        /// <summary>
        /// 分笔累计过户费
        /// </summary>
        public double split_trans_fee { get; set; }
 
        /// <summary>
        /// 分笔累计经手费
        /// </summary>
        public double split_brkage { get; set; }
 
        /// <summary>
        /// 分笔累计证管费
        /// </summary>
        public double split_SEC_charges { get; set; }
 
        /// <summary>
        /// 分笔累计其他费用
        /// </summary>
        public double split_other_fee { get; set; }
 
        /// <summary>
        /// 分笔累计交易佣金
        /// </summary>
        public double split_brkage_commis { get; set; }
 
        /// <summary>
        /// 分笔累计渠道佣金
        /// </summary>
        public double split_chann_commis { get; set; }
 
        /// <summary>
        /// 分笔累计分成佣金
        /// </summary>
        public double split_divi_commis { get; set; }
 
        /// <summary>
        /// 分笔累计其他佣金
        /// </summary>
        public double split_other_commis { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 计息天数
        /// </summary>
        public int intrst_days { get; set; }
 
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 清算入账类型
        /// </summary>
        public int clear_entry_type { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 处理标志
        /// </summary>
        public int deal_flag { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_合并清算处理
   public class FuncclsecuL_21_15Model : BaseModel
   {
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// 处理信息
        /// </summary>
        public String deal_info { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_查询待入账记录
   public class FuncclsecuL_21_23Model : BaseModel
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 成交日期
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// 成交时间
        /// </summary>
        public int strike_time { get; set; }
 
        /// <summary>
        /// 成交编号
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// 申报日期
        /// </summary>
        public int report_date { get; set; }
 
        /// <summary>
        /// 申报时间
        /// </summary>
        public int report_time { get; set; }
 
        /// <summary>
        /// 申报编号
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// 订单时间
        /// </summary>
        public int order_time { get; set; }
 
        /// <summary>
        /// 订单编号
        /// </summary>
        public int order_no { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 成交价格
        /// </summary>
        public double strike_price { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 成交笔数
        /// </summary>
        public int strike_num { get; set; }
 
        /// <summary>
        /// 待入账数量
        /// </summary>
        public double pre_entry_qty { get; set; }
 
        /// <summary>
        /// 待入账金额
        /// </summary>
        public double pre_entry_amt { get; set; }
 
        /// <summary>
        /// 负债数量
        /// </summary>
        public double debt_qty { get; set; }
 
        /// <summary>
        /// 负债金额
        /// </summary>
        public double debt_amt { get; set; }
 
        /// <summary>
        /// 负债类型
        /// </summary>
        public int debt_type { get; set; }
 
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
        /// 交易佣金
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// 其他佣金
        /// </summary>
        public double other_commis { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 入账状态
        /// </summary>
        public String entry_status { get; set; }
 
        /// <summary>
        /// 回滚状态
        /// </summary>
        public String undo_status { get; set; }
 
        /// <summary>
        /// 成交流水号
        /// </summary>
        public ulong busi_jour_no { get; set; }
 
        /// <summary>
        /// 入账资金流水号
        /// </summary>
        public ulong entry_money_jour_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 计息天数
        /// </summary>
        public int intrst_days { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_入账处理
   public class FuncclsecuL_21_24Model : BaseModel
   {
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_成交转入定时任务
   public class FuncclsecuL_21_151Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
        /// <summary>
        /// 查询序号
        /// </summary>
        public int qry_no { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_清算处理定时任务
   public class FuncclsecuL_21_153Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
        /// <summary>
        /// 查询序号
        /// </summary>
        public int qry_no { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_入账处理定时任务
   public class FuncclsecuL_21_154Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_查询统计数据
   public class FuncclsecuL_21_202Model : BaseModel
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
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 清算笔数
        /// </summary>
        public int clear_num { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 成交笔数
        /// </summary>
        public int strike_num { get; set; }
 
        /// <summary>
        /// 成交均价
        /// </summary>
        public double strike_aver_price { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 入账数量
        /// </summary>
        public double entry_qty { get; set; }
 
        /// <summary>
        /// 入账金额
        /// </summary>
        public double entry_amt { get; set; }
 
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
        /// 交易佣金
        /// </summary>
        public double trade_commis { get; set; }
 
        /// <summary>
        /// 渠道佣金
        /// </summary>
        public double chann_commis { get; set; }
 
        /// <summary>
        /// 分成佣金
        /// </summary>
        public double divi_commis { get; set; }
 
        /// <summary>
        /// 其他佣金
        /// </summary>
        public double other_commis { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_获取汇总统计值
   public class FuncclsecuL_21_203Model : BaseModel
   {
        /// <summary>
        /// 待转入成交数
        /// </summary>
        public double pre_switch_strike_qty { get; set; }
 
        /// <summary>
        /// 已转入成交数
        /// </summary>
        public double alr_switch_strike_qty { get; set; }
 
        /// <summary>
        /// 待清算成交数
        /// </summary>
        public double pre_clr_strike_qty { get; set; }
 
        /// <summary>
        /// 已清算成交数
        /// </summary>
        public double alr_clr_strike_qty { get; set; }
 
        /// <summary>
        /// 待入账记录数
        /// </summary>
        public double pre_entry_record_qty { get; set; }
 
        /// <summary>
        /// 已入账记录数
        /// </summary>
        public double alr_entry_record_qty { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_查询成交记录序号
   public class FuncclsecuL_21_204Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_查询清算成交记录序号
   public class FuncclsecuL_21_205Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_查询合并清算记录序号
   public class FuncclsecuL_21_206Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_清算证券_融资融券清算_查询待入账记录序号
   public class FuncclsecuL_21_207Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
}
