using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_交易证券_T0_券源持仓查询
   public class FunctdsecuL_6_1Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
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
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 券源数量
        /// </summary>
        public double source_stock_qty { get; set; }
 
        /// <summary>
        /// 单笔限额数量
        /// </summary>
        public double single_limit_qty { get; set; }
 
        /// <summary>
        /// 已分配数量
        /// </summary>
        public double assigned_qty { get; set; }
 
        /// <summary>
        /// 交易释放数量
        /// </summary>
        public double trade_releas_qty { get; set; }
 
        /// <summary>
        /// 交易占用数量
        /// </summary>
        public double trade_capt_qty { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 成交占用数量
        /// </summary>
        public double strike_capt_qty { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 总开仓费用
        /// </summary>
        public double total_open_posi_fee { get; set; }
 
        /// <summary>
        /// 总平仓费用
        /// </summary>
        public double total_close_posi_fee { get; set; }
 
        /// <summary>
        /// 外部交易释放数量
        /// </summary>
        public double out_order_releas_qty { get; set; }
 
        /// <summary>
        /// 外部交易占用数量
        /// </summary>
        public double out_order_capt_qty { get; set; }
 
        /// <summary>
        /// 外部成交释放数量
        /// </summary>
        public double out_strike_releas_qty { get; set; }
 
        /// <summary>
        /// 外部成交占用数量
        /// </summary>
        public double out_strike_capt_qty { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 买入可用数量
        /// </summary>
        public double buy_avail_qty { get; set; }
 
        /// <summary>
        /// 卖出可用数量
        /// </summary>
        public double sell_avail_qty { get; set; }
 
        /// <summary>
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 当日交易费
        /// </summary>
        public double today_trade_fee { get; set; }
 
        /// <summary>
        /// 当日盈亏
        /// </summary>
        public double today_pandl { get; set; }
 
        /// <summary>
        /// 数量差额
        /// </summary>
        public double diff_qty { get; set; }
 
        /// <summary>
        /// 隔夜仓强平交易买入数量
        /// </summary>
        public double over_night_trade_buy_qty { get; set; }
 
        /// <summary>
        /// 隔夜仓强平交易卖出数量
        /// </summary>
        public double over_night_trade_sell_qty { get; set; }
 
        /// <summary>
        /// 隔夜仓强平成交卖出数量
        /// </summary>
        public double over_night_strike_sell_qty { get; set; }
 
        /// <summary>
        /// 隔夜仓强平总交易卖出数量
        /// </summary>
        public double over_night_sumtrd_sell_qty { get; set; }
 
        /// <summary>
        /// 隔夜仓强平总成交卖出数量
        /// </summary>
        public double over_night_sumstk_sell_qty { get; set; }
 
        /// <summary>
        /// T0买入方式
        /// </summary>
        public int t0_buy_type { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_T0_券源持仓历史查询
   public class FunctdsecuL_6_111Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
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
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 券源数量
        /// </summary>
        public double source_stock_qty { get; set; }
 
        /// <summary>
        /// 单笔限额数量
        /// </summary>
        public double single_limit_qty { get; set; }
 
        /// <summary>
        /// 已分配数量
        /// </summary>
        public double assigned_qty { get; set; }
 
        /// <summary>
        /// 交易释放数量
        /// </summary>
        public double trade_releas_qty { get; set; }
 
        /// <summary>
        /// 交易占用数量
        /// </summary>
        public double trade_capt_qty { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 成交占用数量
        /// </summary>
        public double strike_capt_qty { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 总开仓费用
        /// </summary>
        public double total_open_posi_fee { get; set; }
 
        /// <summary>
        /// 总平仓费用
        /// </summary>
        public double total_close_posi_fee { get; set; }
 
        /// <summary>
        /// 外部交易释放数量
        /// </summary>
        public double out_order_releas_qty { get; set; }
 
        /// <summary>
        /// 外部交易占用数量
        /// </summary>
        public double out_order_capt_qty { get; set; }
 
        /// <summary>
        /// 外部成交释放数量
        /// </summary>
        public double out_strike_releas_qty { get; set; }
 
        /// <summary>
        /// 外部成交占用数量
        /// </summary>
        public double out_strike_capt_qty { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 买入可用数量
        /// </summary>
        public double buy_avail_qty { get; set; }
 
        /// <summary>
        /// 卖出可用数量
        /// </summary>
        public double sell_avail_qty { get; set; }
 
        /// <summary>
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 当日交易费
        /// </summary>
        public double today_trade_fee { get; set; }
 
        /// <summary>
        /// 当日盈亏
        /// </summary>
        public double today_pandl { get; set; }
 
        /// <summary>
        /// 数量差额
        /// </summary>
        public double diff_qty { get; set; }
 
        /// <summary>
        /// T0买入方式
        /// </summary>
        public int t0_buy_type { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_T0_持仓分笔查询
   public class FunctdsecuL_6_2Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
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
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓日期
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// 开仓时间
        /// </summary>
        public int open_posi_time { get; set; }
 
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price { get; set; }
 
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee { get; set; }
 
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty { get; set; }
 
        /// <summary>
        /// 平仓日期
        /// </summary>
        public int close_posi_date { get; set; }
 
        /// <summary>
        /// 平仓时间
        /// </summary>
        public int close_posi_time { get; set; }
 
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// 平仓费用
        /// </summary>
        public double close_posi_fee { get; set; }
 
        /// <summary>
        /// 成交编号
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
        /// <summary>
        /// 持仓状态
        /// </summary>
        public String posi_status { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_T0_持仓分笔历史查询
   public class FunctdsecuL_6_201Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
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
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓日期
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// 开仓时间
        /// </summary>
        public int open_posi_time { get; set; }
 
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price { get; set; }
 
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee { get; set; }
 
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty { get; set; }
 
        /// <summary>
        /// 平仓日期
        /// </summary>
        public int close_posi_date { get; set; }
 
        /// <summary>
        /// 平仓时间
        /// </summary>
        public int close_posi_time { get; set; }
 
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// 平仓费用
        /// </summary>
        public double close_posi_fee { get; set; }
 
        /// <summary>
        /// 成交编号
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
        /// <summary>
        /// 持仓状态
        /// </summary>
        public String posi_status { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_T0_持仓合笔查询
   public class FunctdsecuL_6_3Model : BaseModel
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
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee { get; set; }
 
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
        /// 开仓日期
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// 开仓时间
        /// </summary>
        public int open_posi_time { get; set; }
 
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price { get; set; }
 
   }
 
   //逻辑_交易证券_T0_账户汇总信息查询
   public class FunctdsecuL_6_4Model : BaseModel
   {
        /// <summary>
        /// 交易金额
        /// </summary>
        public double trade_amt { get; set; }
 
        /// <summary>
        /// 交易数量
        /// </summary>
        public double trade_qty { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 收益率
        /// </summary>
        public double yield_rate { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 可用金额
        /// </summary>
        public double avail_amt { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_T0_持仓盈亏查询
   public class FunctdsecuL_6_5Model : BaseModel
   {
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
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 交易数量
        /// </summary>
        public double trade_qty { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 收益率
        /// </summary>
        public double yield_rate { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
   }
 
   //逻辑_交易证券_T0_持仓盈亏历史查询
   public class FunctdsecuL_6_6Model : BaseModel
   {
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
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
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 交易数量
        /// </summary>
        public double trade_qty { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 收益率
        /// </summary>
        public double yield_rate { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
   }
 
   //逻辑_交易证券_T0_操作员阈值设置查询
   public class FunctdsecuL_6_9Model : BaseModel
   {
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
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
        /// 操作员预警阈值
        /// </summary>
        public double opor_warn_tshold { get; set; }
 
        /// <summary>
        /// 操作员止损阈值
        /// </summary>
        public double opor_stop_tshold { get; set; }
 
        /// <summary>
        /// 下单限制时间
        /// </summary>
        public int order_limit_time { get; set; }
 
        /// <summary>
        /// 单券持仓比例
        /// </summary>
        public double per_secu_posi_ratio { get; set; }
 
        /// <summary>
        /// 持仓时限
        /// </summary>
        public int posi_limit_time { get; set; }
 
        /// <summary>
        /// 单笔数量控制
        /// </summary>
        public double order_ctrl_qty { get; set; }
 
        /// <summary>
        /// 单笔金额控制
        /// </summary>
        public double order_ctrl_amt { get; set; }
 
        /// <summary>
        /// 单券预警比例
        /// </summary>
        public double stock_warn_ratio { get; set; }
 
        /// <summary>
        /// 单券止损比例
        /// </summary>
        public double stock_stop_ratio { get; set; }
 
        /// <summary>
        /// 单券预警金额
        /// </summary>
        public double stock_warn_amt { get; set; }
 
        /// <summary>
        /// 单券止损金额
        /// </summary>
        public double stock_stop_amt { get; set; }
 
        /// <summary>
        /// 触警操作方式
        /// </summary>
        public int trig_oper_type { get; set; }
 
        /// <summary>
        /// 开平仓权限
        /// </summary>
        public int open_close_permission { get; set; }
 
        /// <summary>
        /// 风控监控员
        /// </summary>
        public int risk_oper { get; set; }
 
        /// <summary>
        /// 费用计算方式
        /// </summary>
        public int fee_calc_type { get; set; }
 
        /// <summary>
        /// 允许信用交易
        /// </summary>
        public int permit_margin_trade { get; set; }
 
        /// <summary>
        /// 买费率
        /// </summary>
        public double buy_fee_ratio { get; set; }
 
        /// <summary>
        /// 卖费率
        /// </summary>
        public double sell_fee_ratio { get; set; }
 
        /// <summary>
        /// 买最低费用
        /// </summary>
        public double buy_min_fee { get; set; }
 
        /// <summary>
        /// 卖最低费用
        /// </summary>
        public double sell_min_fee { get; set; }
 
        /// <summary>
        /// 交易占用金额
        /// </summary>
        public double trade_capt_amt { get; set; }
 
        /// <summary>
        /// 交易释放金额
        /// </summary>
        public double trade_releas_amt { get; set; }
 
        /// <summary>
        /// 成交占用金额
        /// </summary>
        public double strike_capt_amt { get; set; }
 
        /// <summary>
        /// 成交释放金额
        /// </summary>
        public double strike_releas_amt { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 金额差额
        /// </summary>
        public double amt_diff { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// 可用金额
        /// </summary>
        public double avail_amt { get; set; }
 
   }
 
   //逻辑_交易证券_T0_交易员开平仓明细查询
   public class FunctdsecuL_6_11Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 成交编号
        /// </summary>
        public String strike_no { get; set; }
 
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
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee { get; set; }
 
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty { get; set; }
 
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// 平仓费用
        /// </summary>
        public double close_posi_fee { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 开仓时间
        /// </summary>
        public int open_posi_time { get; set; }
 
        /// <summary>
        /// 开仓日期
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// 平仓时间
        /// </summary>
        public int close_posi_time { get; set; }
 
        /// <summary>
        /// 平仓日期
        /// </summary>
        public int close_posi_date { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
   }
 
   //逻辑_交易证券_T0_操作员阈值信息初始化
   public class FunctdsecuL_6_12Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //逻辑_交易证券_T0_交易员开平仓明细历史查询
   public class FunctdsecuL_6_13Model : BaseModel
   {
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 成交编号
        /// </summary>
        public String strike_no { get; set; }
 
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
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee { get; set; }
 
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty { get; set; }
 
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// 平仓费用
        /// </summary>
        public double close_posi_fee { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 开仓时间
        /// </summary>
        public int open_posi_time { get; set; }
 
        /// <summary>
        /// 开仓日期
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// 平仓时间
        /// </summary>
        public int close_posi_time { get; set; }
 
        /// <summary>
        /// 平仓日期
        /// </summary>
        public int close_posi_date { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
   }
 
   //逻辑_交易证券_T0_操作员券源限额设置查询
   public class FunctdsecuL_6_15Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
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
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 券源数量
        /// </summary>
        public double source_stock_qty { get; set; }
 
        /// <summary>
        /// 单笔限额数量
        /// </summary>
        public double single_limit_qty { get; set; }
 
        /// <summary>
        /// 已分配数量
        /// </summary>
        public double assigned_qty { get; set; }
 
        /// <summary>
        /// 交易释放数量
        /// </summary>
        public double trade_releas_qty { get; set; }
 
        /// <summary>
        /// 交易占用数量
        /// </summary>
        public double trade_capt_qty { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 成交占用数量
        /// </summary>
        public double strike_capt_qty { get; set; }
 
        /// <summary>
        /// 总实现盈亏
        /// </summary>
        public double total_realize_pandl { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 总开仓费用
        /// </summary>
        public double total_open_posi_fee { get; set; }
 
        /// <summary>
        /// 总平仓费用
        /// </summary>
        public double total_close_posi_fee { get; set; }
 
        /// <summary>
        /// 外部交易释放数量
        /// </summary>
        public double out_order_releas_qty { get; set; }
 
        /// <summary>
        /// 外部交易占用数量
        /// </summary>
        public double out_order_capt_qty { get; set; }
 
        /// <summary>
        /// 外部成交释放数量
        /// </summary>
        public double out_strike_releas_qty { get; set; }
 
        /// <summary>
        /// 外部成交占用数量
        /// </summary>
        public double out_strike_capt_qty { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// 买入可用数量
        /// </summary>
        public double buy_avail_qty { get; set; }
 
        /// <summary>
        /// 卖出可用数量
        /// </summary>
        public double sell_avail_qty { get; set; }
 
        /// <summary>
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 当日交易费
        /// </summary>
        public double today_trade_fee { get; set; }
 
        /// <summary>
        /// 当日盈亏
        /// </summary>
        public double today_pandl { get; set; }
 
        /// <summary>
        /// 数量差额
        /// </summary>
        public double diff_qty { get; set; }
 
        /// <summary>
        /// T0买入方式
        /// </summary>
        public int t0_buy_type { get; set; }
 
   }
 
   //逻辑_交易证券_T0_操作员参数设置查询
   public class FunctdsecuL_6_20Model : BaseModel
   {
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 配置编号
        /// </summary>
        public ulong config_no { get; set; }
 
        /// <summary>
        /// 配置值
        /// </summary>
        public String config_value { get; set; }
 
        /// <summary>
        /// 配置名称
        /// </summary>
        public String config_name { get; set; }
 
        /// <summary>
        /// 配置说明
        /// </summary>
        public String config_memo { get; set; }
 
   }
 
   //逻辑_交易证券_T0_操作员阈值信息计算更新
   public class FunctdsecuL_6_90Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //逻辑_交易证券_T0_操作员阈值汇总信息计算更新
   public class FunctdsecuL_6_92Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //逻辑_交易证券_T0_隔夜仓查询
   public class FunctdsecuL_6_94Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee { get; set; }
 
        /// <summary>
        /// 开仓日期
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// 开仓时间
        /// </summary>
        public int open_posi_time { get; set; }
 
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
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
   }
 
   //逻辑_交易证券_T0_查询操作员券源限额设置流水
   public class FunctdsecuL_6_99Model : BaseModel
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
        /// 业务操作员编号
        /// </summary>
        public int busi_opor_no { get; set; }
 
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
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 券源变动数量
        /// </summary>
        public double source_stock_occur_qty { get; set; }
 
        /// <summary>
        /// 变动后券源数量
        /// </summary>
        public double source_stock_occur_end_qty { get; set; }
 
        /// <summary>
        /// 单笔限额变动数量
        /// </summary>
        public double single_limit_occur_qty { get; set; }
 
        /// <summary>
        /// 变动后单笔限额数量
        /// </summary>
        public double single_limit_occur_end_qty { get; set; }
 
        /// <summary>
        /// 已分配变动数量
        /// </summary>
        public double assigned_occur_qty { get; set; }
 
        /// <summary>
        /// 变动后已分配数量
        /// </summary>
        public double assigned_occur_end_qty { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_交易证券_T0_查询操作员券源限额设置流水历史
   public class FunctdsecuL_6_102Model : BaseModel
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
        /// 业务操作员编号
        /// </summary>
        public int busi_opor_no { get; set; }
 
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
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 券源变动数量
        /// </summary>
        public double source_stock_occur_qty { get; set; }
 
        /// <summary>
        /// 变动后券源数量
        /// </summary>
        public double source_stock_occur_end_qty { get; set; }
 
        /// <summary>
        /// 单笔限额变动数量
        /// </summary>
        public double single_limit_occur_qty { get; set; }
 
        /// <summary>
        /// 变动后单笔限额数量
        /// </summary>
        public double single_limit_occur_end_qty { get; set; }
 
        /// <summary>
        /// 已分配变动数量
        /// </summary>
        public double assigned_occur_qty { get; set; }
 
        /// <summary>
        /// 变动后已分配数量
        /// </summary>
        public double assigned_occur_end_qty { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_交易证券_T0_查询操作员可用交易组资金
   public class FunctdsecuL_6_33Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
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
        /// 指令冻结金额
        /// </summary>
        public double comm_frozen_amt { get; set; }
 
        /// <summary>
        /// 指令解冻金额
        /// </summary>
        public double comm_unfroz_amt { get; set; }
 
        /// <summary>
        /// 指令占用金额
        /// </summary>
        public double comm_capt_amt { get; set; }
 
        /// <summary>
        /// 指令释放金额
        /// </summary>
        public double comm_releas_amt { get; set; }
 
        /// <summary>
        /// 交易冻结金额
        /// </summary>
        public double trade_frozen_amt { get; set; }
 
        /// <summary>
        /// 交易解冻金额
        /// </summary>
        public double trade_unfroz_amt { get; set; }
 
        /// <summary>
        /// 交易占用金额
        /// </summary>
        public double trade_capt_amt { get; set; }
 
        /// <summary>
        /// 交易释放金额
        /// </summary>
        public double trade_releas_amt { get; set; }
 
        /// <summary>
        /// 成交占用金额
        /// </summary>
        public double strike_capt_amt { get; set; }
 
        /// <summary>
        /// 成交释放金额
        /// </summary>
        public double strike_releas_amt { get; set; }
 
        /// <summary>
        /// 可用金额
        /// </summary>
        public double avail_amt { get; set; }
 
   }
 
   //逻辑_交易证券_T0_查询持仓作废流水
   public class FunctdsecuL_6_34Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 业务操作员编号
        /// </summary>
        public int busi_opor_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
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
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓日期
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// 开仓时间
        /// </summary>
        public int open_posi_time { get; set; }
 
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price { get; set; }
 
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee { get; set; }
 
        /// <summary>
        /// 废单数量
        /// </summary>
        public double waste_qty { get; set; }
 
        /// <summary>
        /// 作废日期
        /// </summary>
        public int waste_date { get; set; }
 
        /// <summary>
        /// 作废时间
        /// </summary>
        public int waste_time { get; set; }
 
        /// <summary>
        /// 明细持仓序号
        /// </summary>
        public ulong detail_posi_id { get; set; }
 
   }
 
   //逻辑_交易证券_T0_查询历史持仓作废流水
   public class FunctdsecuL_6_35Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 业务操作员编号
        /// </summary>
        public int busi_opor_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
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
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓日期
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// 开仓时间
        /// </summary>
        public int open_posi_time { get; set; }
 
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price { get; set; }
 
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee { get; set; }
 
        /// <summary>
        /// 废单数量
        /// </summary>
        public double waste_qty { get; set; }
 
        /// <summary>
        /// 作废日期
        /// </summary>
        public int waste_date { get; set; }
 
        /// <summary>
        /// 作废时间
        /// </summary>
        public int waste_time { get; set; }
 
        /// <summary>
        /// 明细持仓序号
        /// </summary>
        public ulong detail_posi_id { get; set; }
 
   }
 
   //逻辑_交易证券_T0_查询操作员持仓市值
   public class FunctdsecuL_6_38Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 最大持仓市值
        /// </summary>
        public double max_posi_market_value { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_T0_根据操作员查询券源持仓
   public class FunctdsecuL_6_110Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
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
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 券源数量
        /// </summary>
        public double source_stock_qty { get; set; }
 
        /// <summary>
        /// 单笔限额数量
        /// </summary>
        public double single_limit_qty { get; set; }
 
        /// <summary>
        /// 已分配数量
        /// </summary>
        public double assigned_qty { get; set; }
 
        /// <summary>
        /// 交易释放数量
        /// </summary>
        public double trade_releas_qty { get; set; }
 
        /// <summary>
        /// 交易占用数量
        /// </summary>
        public double trade_capt_qty { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 成交占用数量
        /// </summary>
        public double strike_capt_qty { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 总开仓费用
        /// </summary>
        public double total_open_posi_fee { get; set; }
 
        /// <summary>
        /// 总平仓费用
        /// </summary>
        public double total_close_posi_fee { get; set; }
 
        /// <summary>
        /// 外部交易释放数量
        /// </summary>
        public double out_order_releas_qty { get; set; }
 
        /// <summary>
        /// 外部交易占用数量
        /// </summary>
        public double out_order_capt_qty { get; set; }
 
        /// <summary>
        /// 外部成交释放数量
        /// </summary>
        public double out_strike_releas_qty { get; set; }
 
        /// <summary>
        /// 外部成交占用数量
        /// </summary>
        public double out_strike_capt_qty { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 买入可用数量
        /// </summary>
        public double buy_avail_qty { get; set; }
 
        /// <summary>
        /// 卖出可用数量
        /// </summary>
        public double sell_avail_qty { get; set; }
 
        /// <summary>
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 当日交易费
        /// </summary>
        public double today_trade_fee { get; set; }
 
        /// <summary>
        /// 当日盈亏
        /// </summary>
        public double today_pandl { get; set; }
 
        /// <summary>
        /// 数量差额
        /// </summary>
        public double diff_qty { get; set; }
 
        /// <summary>
        /// 隔夜仓强平交易买入数量
        /// </summary>
        public double over_night_trade_buy_qty { get; set; }
 
        /// <summary>
        /// 隔夜仓强平交易卖出数量
        /// </summary>
        public double over_night_trade_sell_qty { get; set; }
 
        /// <summary>
        /// 隔夜仓强平成交卖出数量
        /// </summary>
        public double over_night_strike_sell_qty { get; set; }
 
        /// <summary>
        /// 隔夜仓强平总交易卖出数量
        /// </summary>
        public double over_night_sumtrd_sell_qty { get; set; }
 
        /// <summary>
        /// 隔夜仓强平总成交卖出数量
        /// </summary>
        public double over_night_sumstk_sell_qty { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_T0_根据操作员查询账户汇总信息
   public class FunctdsecuL_6_113Model : BaseModel
   {
        /// <summary>
        /// 交易金额
        /// </summary>
        public double trade_amt { get; set; }
 
        /// <summary>
        /// 交易数量
        /// </summary>
        public double trade_qty { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 收益率
        /// </summary>
        public double yield_rate { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 可用金额
        /// </summary>
        public double avail_amt { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_T0_根据操作员查询操作员可用交易组资金
   public class FunctdsecuL_6_112Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
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
        /// 指令冻结金额
        /// </summary>
        public double comm_frozen_amt { get; set; }
 
        /// <summary>
        /// 指令解冻金额
        /// </summary>
        public double comm_unfroz_amt { get; set; }
 
        /// <summary>
        /// 指令占用金额
        /// </summary>
        public double comm_capt_amt { get; set; }
 
        /// <summary>
        /// 指令释放金额
        /// </summary>
        public double comm_releas_amt { get; set; }
 
        /// <summary>
        /// 交易冻结金额
        /// </summary>
        public double trade_frozen_amt { get; set; }
 
        /// <summary>
        /// 交易解冻金额
        /// </summary>
        public double trade_unfroz_amt { get; set; }
 
        /// <summary>
        /// 交易占用金额
        /// </summary>
        public double trade_capt_amt { get; set; }
 
        /// <summary>
        /// 交易释放金额
        /// </summary>
        public double trade_releas_amt { get; set; }
 
        /// <summary>
        /// 成交占用金额
        /// </summary>
        public double strike_capt_amt { get; set; }
 
        /// <summary>
        /// 成交释放金额
        /// </summary>
        public double strike_releas_amt { get; set; }
 
        /// <summary>
        /// 可用金额
        /// </summary>
        public double avail_amt { get; set; }
 
   }
 
   //逻辑_交易证券_T0_根据操作员查询操作员阈值设置
   public class FunctdsecuL_6_114Model : BaseModel
   {
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
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
        /// 操作员预警阈值
        /// </summary>
        public double opor_warn_tshold { get; set; }
 
        /// <summary>
        /// 操作员止损阈值
        /// </summary>
        public double opor_stop_tshold { get; set; }
 
        /// <summary>
        /// 下单限制时间
        /// </summary>
        public int order_limit_time { get; set; }
 
        /// <summary>
        /// 单券持仓比例
        /// </summary>
        public double per_secu_posi_ratio { get; set; }
 
        /// <summary>
        /// 持仓时限
        /// </summary>
        public int posi_limit_time { get; set; }
 
        /// <summary>
        /// 单笔数量控制
        /// </summary>
        public double order_ctrl_qty { get; set; }
 
        /// <summary>
        /// 单笔金额控制
        /// </summary>
        public double order_ctrl_amt { get; set; }
 
        /// <summary>
        /// 单券预警比例
        /// </summary>
        public double stock_warn_ratio { get; set; }
 
        /// <summary>
        /// 单券止损比例
        /// </summary>
        public double stock_stop_ratio { get; set; }
 
        /// <summary>
        /// 单券预警金额
        /// </summary>
        public double stock_warn_amt { get; set; }
 
        /// <summary>
        /// 单券止损金额
        /// </summary>
        public double stock_stop_amt { get; set; }
 
        /// <summary>
        /// 触警操作方式
        /// </summary>
        public int trig_oper_type { get; set; }
 
        /// <summary>
        /// 开平仓权限
        /// </summary>
        public int open_close_permission { get; set; }
 
        /// <summary>
        /// 风控监控员
        /// </summary>
        public int risk_oper { get; set; }
 
        /// <summary>
        /// 费用计算方式
        /// </summary>
        public int fee_calc_type { get; set; }
 
        /// <summary>
        /// 允许信用交易
        /// </summary>
        public int permit_margin_trade { get; set; }
 
        /// <summary>
        /// 买费率
        /// </summary>
        public double buy_fee_ratio { get; set; }
 
        /// <summary>
        /// 卖费率
        /// </summary>
        public double sell_fee_ratio { get; set; }
 
        /// <summary>
        /// 买最低费用
        /// </summary>
        public double buy_min_fee { get; set; }
 
        /// <summary>
        /// 卖最低费用
        /// </summary>
        public double sell_min_fee { get; set; }
 
        /// <summary>
        /// 交易占用金额
        /// </summary>
        public double trade_capt_amt { get; set; }
 
        /// <summary>
        /// 交易释放金额
        /// </summary>
        public double trade_releas_amt { get; set; }
 
        /// <summary>
        /// 成交占用金额
        /// </summary>
        public double strike_capt_amt { get; set; }
 
        /// <summary>
        /// 成交释放金额
        /// </summary>
        public double strike_releas_amt { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 金额差额
        /// </summary>
        public double amt_diff { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// 可用金额
        /// </summary>
        public double avail_amt { get; set; }
 
   }
 
}
