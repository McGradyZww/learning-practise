using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_清算外盘期货_结算_查询合约交割参数记录
   public class FuncclfofuL_3_4Model : BaseModel
   {
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 交割价
        /// </summary>
        public double deli_price { get; set; }
 
   }
 
   //逻辑_清算外盘期货_结算_查询组合占用保证金记录
   public class FuncclfofuL_3_9Model : BaseModel
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
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易编码编号
        /// </summary>
        public int futu_acco_no { get; set; }
 
        /// <summary>
        /// 组合编码
        /// </summary>
        public String comb_code { get; set; }
 
        /// <summary>
        /// 组合类型
        /// </summary>
        public int comb_type { get; set; }
 
        /// <summary>
        /// 组合名称
        /// </summary>
        public String comb_name { get; set; }
 
        /// <summary>
        /// 多头持仓保证金
        /// </summary>
        public double long_hold_margin { get; set; }
 
        /// <summary>
        /// 空头持仓保证金
        /// </summary>
        public double short_hold_margin { get; set; }
 
        /// <summary>
        /// 清算占用保证金
        /// </summary>
        public double sett_capt_margin { get; set; }
 
        /// <summary>
        /// 处理标志
        /// </summary>
        public int deal_flag { get; set; }
 
   }
 
   //逻辑_清算外盘期货_结算_查询待入账记录
   public class FuncclfofuL_3_35Model : BaseModel
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
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
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
        /// 组合类型
        /// </summary>
        public int comb_type { get; set; }
 
        /// <summary>
        /// 组合名称
        /// </summary>
        public String comb_name { get; set; }
 
        /// <summary>
        /// 多头持仓保证金
        /// </summary>
        public double long_hold_margin { get; set; }
 
        /// <summary>
        /// 空头持仓保证金
        /// </summary>
        public double short_hold_margin { get; set; }
 
        /// <summary>
        /// 清算占用保证金
        /// </summary>
        public double sett_capt_margin { get; set; }
 
        /// <summary>
        /// 清算平仓盈亏
        /// </summary>
        public double sett_close_pandl { get; set; }
 
        /// <summary>
        /// 清算盯市盈亏
        /// </summary>
        public double sett_marked_pandl { get; set; }
 
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
        /// 入账持仓流水号
        /// </summary>
        public ulong entry_posi_jour_no { get; set; }
 
        /// <summary>
        /// 对账流水号
        /// </summary>
        public ulong deli_jour_no { get; set; }
 
   }
 
   //逻辑_清算外盘期货_结算_结算处理定时任务
   public class FuncclfofuL_3_102Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //逻辑_清算外盘期货_结算_入账处理定时任务
   public class FuncclfofuL_3_104Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //逻辑_清算外盘期货_结算_数据归历史定时任务
   public class FuncclfofuL_3_106Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
}
