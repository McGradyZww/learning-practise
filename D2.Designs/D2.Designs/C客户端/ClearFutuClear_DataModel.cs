using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_清算期货_清算_清算准备
   public class FuncclfutuL_2_1Model : BaseModel
   {
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// 处理信息
        /// </summary>
        public String deal_info { get; set; }
 
   }
 
   //逻辑_清算期货_清算_转入持仓记录
   public class FuncclfutuL_2_2Model : BaseModel
   {
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 处理信息
        /// </summary>
        public String deal_info { get; set; }
 
   }
 
   //逻辑_清算期货_清算_转入订单记录
   public class FuncclfutuL_2_6Model : BaseModel
   {
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 处理信息
        /// </summary>
        public String deal_info { get; set; }
 
   }
 
   //逻辑_清算期货_清算_查询订单记录
   public class FuncclfutuL_2_9Model : BaseModel
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
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 汇率
        /// </summary>
        public double exch_rate { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 合约类型
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// 合约乘数
        /// </summary>
        public int contrc_unit { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
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
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 开平方向
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 撤单数量
        /// </summary>
        public double wtdraw_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 申报费用
        /// </summary>
        public double report_fee { get; set; }
 
        /// <summary>
        /// 撤单费用
        /// </summary>
        public double wtdraw_fee { get; set; }
 
        /// <summary>
        /// 订单状态
        /// </summary>
        public String order_status { get; set; }
 
        /// <summary>
        /// 处理标志
        /// </summary>
        public int deal_flag { get; set; }
 
   }
 
   //逻辑_清算期货_清算_转入成交记录
   public class FuncclfutuL_2_21Model : BaseModel
   {
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 处理信息
        /// </summary>
        public String deal_info { get; set; }
 
   }
 
   //逻辑_清算期货_清算_查询成交记录
   public class FuncclfutuL_2_24Model : BaseModel
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
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 汇率
        /// </summary>
        public double exch_rate { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// 合约类型
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// 合约乘数
        /// </summary>
        public int contrc_unit { get; set; }
 
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
        /// 开平方向
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
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
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// 申报费用
        /// </summary>
        public double report_fee { get; set; }
 
        /// <summary>
        /// 撤单费用
        /// </summary>
        public double wtdraw_fee { get; set; }
 
        /// <summary>
        /// 交割费用
        /// </summary>
        public double deli_fee { get; set; }
 
        /// <summary>
        /// 手续费用
        /// </summary>
        public double service_fee { get; set; }
 
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
        /// 外部申报费用
        /// </summary>
        public double out_report_fee { get; set; }
 
        /// <summary>
        /// 外部撤单费用
        /// </summary>
        public double out_cancel_fee { get; set; }
 
        /// <summary>
        /// 外部交割费用
        /// </summary>
        public double out_deli_fee { get; set; }
 
        /// <summary>
        /// 外部手续费用
        /// </summary>
        public double out_service_fee { get; set; }
 
        /// <summary>
        /// 外部其他费用
        /// </summary>
        public double out_other_fee { get; set; }
 
        /// <summary>
        /// 外部交易佣金
        /// </summary>
        public double out_brkage_commis { get; set; }
 
        /// <summary>
        /// 外部其他佣金
        /// </summary>
        public double out_other_commis { get; set; }
 
        /// <summary>
        /// 资金回转天数
        /// </summary>
        public int capit_reback_days { get; set; }
 
        /// <summary>
        /// 持仓回转天数
        /// </summary>
        public int posi_reback_days { get; set; }
 
        /// <summary>
        /// 清算入账类型
        /// </summary>
        public int clear_entry_type { get; set; }
 
        /// <summary>
        /// 处理标志
        /// </summary>
        public int deal_flag { get; set; }
 
   }
 
   //逻辑_清算期货_清算_清算处理
   public class FuncclfutuL_2_37Model : BaseModel
   {
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 处理信息
        /// </summary>
        public String deal_info { get; set; }
 
   }
 
   //逻辑_清算期货_清算_订单费用处理
   public class FuncclfutuL_2_38Model : BaseModel
   {
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// 处理信息
        /// </summary>
        public String deal_info { get; set; }
 
   }
 
   //逻辑_清算期货_清算_查询待入账记录
   public class FuncclfutuL_2_58Model : BaseModel
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
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 汇率
        /// </summary>
        public double exch_rate { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 合约类型
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// 合约乘数
        /// </summary>
        public int contrc_unit { get; set; }
 
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
        /// 开平方向
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 昨结算价
        /// </summary>
        public double pre_settle_price { get; set; }
 
        /// <summary>
        /// 结算价
        /// </summary>
        public double sett_price { get; set; }
 
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
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// 组合编码
        /// </summary>
        public String comb_code { get; set; }
 
        /// <summary>
        /// 清算平仓盈亏
        /// </summary>
        public double sett_close_pandl { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 申报费用
        /// </summary>
        public double report_fee { get; set; }
 
        /// <summary>
        /// 撤单费用
        /// </summary>
        public double wtdraw_fee { get; set; }
 
        /// <summary>
        /// 交割费用
        /// </summary>
        public double deli_fee { get; set; }
 
        /// <summary>
        /// 手续费用
        /// </summary>
        public double service_fee { get; set; }
 
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
        /// 外部全部费用
        /// </summary>
        public double out_all_fee { get; set; }
 
        /// <summary>
        /// 外部申报费用
        /// </summary>
        public double out_report_fee { get; set; }
 
        /// <summary>
        /// 外部撤单费用
        /// </summary>
        public double out_cancel_fee { get; set; }
 
        /// <summary>
        /// 外部交割费用
        /// </summary>
        public double out_deli_fee { get; set; }
 
        /// <summary>
        /// 外部手续费用
        /// </summary>
        public double out_service_fee { get; set; }
 
        /// <summary>
        /// 外部其他费用
        /// </summary>
        public double out_other_fee { get; set; }
 
        /// <summary>
        /// 外部交易佣金
        /// </summary>
        public double out_brkage_commis { get; set; }
 
        /// <summary>
        /// 外部其他佣金
        /// </summary>
        public double out_other_commis { get; set; }
 
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
        /// 入账资金流水号
        /// </summary>
        public ulong entry_money_jour_no { get; set; }
 
        /// <summary>
        /// 入账资产账户持仓流水号
        /// </summary>
        public ulong entry_asac_posi_jour_no { get; set; }
 
        /// <summary>
        /// 对账流水号
        /// </summary>
        public ulong deli_jour_no { get; set; }
 
   }
 
   //逻辑_清算期货_清算_入账处理
   public class FuncclfutuL_2_61Model : BaseModel
   {
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 处理信息
        /// </summary>
        public String deal_info { get; set; }
 
   }
 
   //逻辑_清算期货_清算_数据准备定时任务
   public class FuncclfutuL_2_101Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //逻辑_清算期货_清算_清算处理定时任务
   public class FuncclfutuL_2_103Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //逻辑_清算期货_清算_入账处理定时任务
   public class FuncclfutuL_2_104Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //逻辑_清算期货_清算_获取汇总统计值
   public class FuncclfutuL_2_107Model : BaseModel
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
 
   //逻辑_清算期货_清算_查询交易组持仓序号
   public class FuncclfutuL_2_108Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_清算期货_清算_查询成交回报序号
   public class FuncclfutuL_2_109Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_清算期货_清算_查询成交序号
   public class FuncclfutuL_2_110Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_清算期货_清算_查询待入账记录序号
   public class FuncclfutuL_2_111Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
}
