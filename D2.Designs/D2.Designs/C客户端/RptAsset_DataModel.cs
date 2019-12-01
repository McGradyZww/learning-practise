using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_报表_资管报表_T+0持仓盈亏查询
   public class FuncrptL_4_1Model : BaseModel
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
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
   }
 
   //逻辑_报表_资管报表_T+0券源持仓报表查询
   public class FuncrptL_4_2Model : BaseModel
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
        /// 券源数量
        /// </summary>
        public double source_stock_qty { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 收益率
        /// </summary>
        public double yield_rate { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 总多头当前数量
        /// </summary>
        public double total_long_curr_qty { get; set; }
 
        /// <summary>
        /// 总空头当前数量
        /// </summary>
        public double total_short_curr_qty { get; set; }
 
        /// <summary>
        /// 总多头开仓市值
        /// </summary>
        public double total_long_open_posi_value { get; set; }
 
        /// <summary>
        /// 总空头开仓市值
        /// </summary>
        public double total_short_open_posi_value { get; set; }
 
        /// <summary>
        /// 总多头开仓费用
        /// </summary>
        public double total_long_open_posi_fee { get; set; }
 
        /// <summary>
        /// 总空头开仓费用
        /// </summary>
        public double total_short_open_posi_fee { get; set; }
 
        /// <summary>
        /// 总多头平仓市值
        /// </summary>
        public double total_long_close_posi_value { get; set; }
 
        /// <summary>
        /// 总空头平仓市值
        /// </summary>
        public double total_short_close_posi_value { get; set; }
 
        /// <summary>
        /// 总多头平仓数量
        /// </summary>
        public double total_long_close_posi_qty { get; set; }
 
        /// <summary>
        /// 总空头平仓数量
        /// </summary>
        public double total_short_close_posi_qty { get; set; }
 
        /// <summary>
        /// 总多头平仓费用
        /// </summary>
        public double total_long_close_posi_fee { get; set; }
 
        /// <summary>
        /// 总空头平仓费用
        /// </summary>
        public double total_short_close_posi_fee { get; set; }
 
        /// <summary>
        /// 总实现盈亏
        /// </summary>
        public double total_realize_pandl { get; set; }
 
        /// <summary>
        /// 多头当前数量
        /// </summary>
        public double long_curr_qty { get; set; }
 
        /// <summary>
        /// 空头当前数量
        /// </summary>
        public double short_curr_qty { get; set; }
 
        /// <summary>
        /// 多头开仓市值
        /// </summary>
        public double long_open_posi_value { get; set; }
 
        /// <summary>
        /// 空头开仓市值
        /// </summary>
        public double short_open_posi_value { get; set; }
 
        /// <summary>
        /// 多头开仓费用
        /// </summary>
        public double long_open_posi_fee { get; set; }
 
        /// <summary>
        /// 空头开仓费用
        /// </summary>
        public double short_open_posi_fee { get; set; }
 
        /// <summary>
        /// 多头平仓数量
        /// </summary>
        public double long_close_posi_qty { get; set; }
 
        /// <summary>
        /// 空头平仓数量
        /// </summary>
        public double short_close_posi_qty { get; set; }
 
        /// <summary>
        /// 多头平仓市值
        /// </summary>
        public double long_close_posi_value { get; set; }
 
        /// <summary>
        /// 空头平仓市值
        /// </summary>
        public double short_close_posi_value { get; set; }
 
        /// <summary>
        /// 多头平仓费用
        /// </summary>
        public double long_close_posi_fee { get; set; }
 
        /// <summary>
        /// 空头平仓费用
        /// </summary>
        public double short_close_posi_fee { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
   }
 
   //逻辑_报表_资管报表_T+0账户交易汇总查询
   public class FuncrptL_4_3Model : BaseModel
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
        /// 期初金额
        /// </summary>
        public double begin_amt { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 交易金额
        /// </summary>
        public double trade_amt { get; set; }
 
        /// <summary>
        /// 当日盈亏
        /// </summary>
        public double today_pandl { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 收益率
        /// </summary>
        public double yield_rate { get; set; }
 
   }
 
   //逻辑_报表_资管报表_T+0持仓盈亏历史查询
   public class FuncrptL_4_4Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
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
        /// 收益率
        /// </summary>
        public double yield_rate { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty { get; set; }
 
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
        /// <summary>
        /// 交易金额
        /// </summary>
        public double trade_amt { get; set; }
 
   }
 
   //逻辑_报表_资管报表_T+0券源持仓报表历史查询
   public class FuncrptL_4_5Model : BaseModel
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
        /// 券源数量
        /// </summary>
        public double source_stock_qty { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 收益率
        /// </summary>
        public double yield_rate { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 总多头当前数量
        /// </summary>
        public double total_long_curr_qty { get; set; }
 
        /// <summary>
        /// 总空头当前数量
        /// </summary>
        public double total_short_curr_qty { get; set; }
 
        /// <summary>
        /// 总多头开仓市值
        /// </summary>
        public double total_long_open_posi_value { get; set; }
 
        /// <summary>
        /// 总空头开仓市值
        /// </summary>
        public double total_short_open_posi_value { get; set; }
 
        /// <summary>
        /// 总多头开仓费用
        /// </summary>
        public double total_long_open_posi_fee { get; set; }
 
        /// <summary>
        /// 总空头开仓费用
        /// </summary>
        public double total_short_open_posi_fee { get; set; }
 
        /// <summary>
        /// 总多头平仓市值
        /// </summary>
        public double total_long_close_posi_value { get; set; }
 
        /// <summary>
        /// 总空头平仓市值
        /// </summary>
        public double total_short_close_posi_value { get; set; }
 
        /// <summary>
        /// 总多头平仓数量
        /// </summary>
        public double total_long_close_posi_qty { get; set; }
 
        /// <summary>
        /// 总空头平仓数量
        /// </summary>
        public double total_short_close_posi_qty { get; set; }
 
        /// <summary>
        /// 总多头平仓费用
        /// </summary>
        public double total_long_close_posi_fee { get; set; }
 
        /// <summary>
        /// 总空头平仓费用
        /// </summary>
        public double total_short_close_posi_fee { get; set; }
 
        /// <summary>
        /// 总实现盈亏
        /// </summary>
        public double total_realize_pandl { get; set; }
 
        /// <summary>
        /// 多头当前数量
        /// </summary>
        public double long_curr_qty { get; set; }
 
        /// <summary>
        /// 空头当前数量
        /// </summary>
        public double short_curr_qty { get; set; }
 
        /// <summary>
        /// 多头开仓市值
        /// </summary>
        public double long_open_posi_value { get; set; }
 
        /// <summary>
        /// 空头开仓市值
        /// </summary>
        public double short_open_posi_value { get; set; }
 
        /// <summary>
        /// 多头开仓费用
        /// </summary>
        public double long_open_posi_fee { get; set; }
 
        /// <summary>
        /// 空头开仓费用
        /// </summary>
        public double short_open_posi_fee { get; set; }
 
        /// <summary>
        /// 多头平仓数量
        /// </summary>
        public double long_close_posi_qty { get; set; }
 
        /// <summary>
        /// 空头平仓数量
        /// </summary>
        public double short_close_posi_qty { get; set; }
 
        /// <summary>
        /// 多头平仓市值
        /// </summary>
        public double long_close_posi_value { get; set; }
 
        /// <summary>
        /// 空头平仓市值
        /// </summary>
        public double short_close_posi_value { get; set; }
 
        /// <summary>
        /// 多头平仓费用
        /// </summary>
        public double long_close_posi_fee { get; set; }
 
        /// <summary>
        /// 空头平仓费用
        /// </summary>
        public double short_close_posi_fee { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
   }
 
   //逻辑_报表_资管报表_T+0账户交易汇总历史查询
   public class FuncrptL_4_6Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 期初金额
        /// </summary>
        public double begin_amt { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 交易金额
        /// </summary>
        public double trade_amt { get; set; }
 
        /// <summary>
        /// 当日盈亏
        /// </summary>
        public double today_pandl { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 收益率
        /// </summary>
        public double yield_rate { get; set; }
 
   }
 
   //逻辑_报表_资管报表_报表产品持仓汇总查询
   public class FuncrptL_4_7Model : BaseModel
   {
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 当日买入数量
        /// </summary>
        public double today_buy_qty { get; set; }
 
        /// <summary>
        /// 当日卖出数量
        /// </summary>
        public double today_sell_qty { get; set; }
 
        /// <summary>
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// 今收盘价
        /// </summary>
        public double today_close_price { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
   }
 
   //逻辑_报表_资管报表_报表机构持仓汇总查询
   public class FuncrptL_4_8Model : BaseModel
   {
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 当日买入数量
        /// </summary>
        public double today_buy_qty { get; set; }
 
        /// <summary>
        /// 当日卖出数量
        /// </summary>
        public double today_sell_qty { get; set; }
 
        /// <summary>
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 今收盘价
        /// </summary>
        public double today_close_price { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 持仓净值占比
        /// </summary>
        public double posi_nav_ratio { get; set; }
 
   }
 
   //逻辑_报表_资管报表_报表产品持仓交易汇总查询
   public class FuncrptL_4_9Model : BaseModel
   {
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 昨日持仓数量
        /// </summary>
        public double pre_holding_qty { get; set; }
 
        /// <summary>
        /// 当日买入数量
        /// </summary>
        public double today_buy_qty { get; set; }
 
        /// <summary>
        /// 当日买入金额
        /// </summary>
        public double today_buy_amt { get; set; }
 
        /// <summary>
        /// 当日买入价格
        /// </summary>
        public double today_buy_price { get; set; }
 
        /// <summary>
        /// 买入开始时间
        /// </summary>
        public int buy_begin_time { get; set; }
 
        /// <summary>
        /// 买入结束时间
        /// </summary>
        public int buy_end_time { get; set; }
 
        /// <summary>
        /// 当日卖出数量
        /// </summary>
        public double today_sell_qty { get; set; }
 
        /// <summary>
        /// 当日卖出金额
        /// </summary>
        public double today_sell_amt { get; set; }
 
        /// <summary>
        /// 当日卖出价格
        /// </summary>
        public double today_sell_price { get; set; }
 
        /// <summary>
        /// 卖出开始时间
        /// </summary>
        public int sell_begin_time { get; set; }
 
        /// <summary>
        /// 卖出结束时间
        /// </summary>
        public int sell_end_time { get; set; }
 
        /// <summary>
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 今收盘价
        /// </summary>
        public double today_close_price { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
   }
 
   //逻辑_报表_资管报表_产品账户证券重仓股持仓查询
   public class FuncrptL_4_10Model : BaseModel
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
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 浮动盈亏
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// 浮动盈亏比例
        /// </summary>
        public double float_pandl_ratio { get; set; }
 
        /// <summary>
        /// 市值占比
        /// </summary>
        public double market_value_ratio { get; set; }
 
        /// <summary>
        /// 净值占比
        /// </summary>
        public double nav_ratio { get; set; }
 
   }
 
   //逻辑_报表_资管报表_交易单元证券重仓股持仓查询
   public class FuncrptL_4_11Model : BaseModel
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
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 浮动盈亏
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// 浮动盈亏比例
        /// </summary>
        public double float_pandl_ratio { get; set; }
 
        /// <summary>
        /// 市值占比
        /// </summary>
        public double market_value_ratio { get; set; }
 
        /// <summary>
        /// 净值占比
        /// </summary>
        public double nav_ratio { get; set; }
 
   }
 
   //逻辑_报表_资管报表_证券持仓汇总查询
   public class FuncrptL_4_12Model : BaseModel
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
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 指令占用数量
        /// </summary>
        public double comm_capt_qty { get; set; }
 
        /// <summary>
        /// 指令释放数量
        /// </summary>
        public double comm_releas_qty { get; set; }
 
        /// <summary>
        /// 交易占用数量
        /// </summary>
        public double trade_capt_qty { get; set; }
 
        /// <summary>
        /// 交易释放数量
        /// </summary>
        public double trade_releas_qty { get; set; }
 
        /// <summary>
        /// 成交占用数量
        /// </summary>
        public double strike_capt_qty { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 浮动盈亏
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// 盈亏比例
        /// </summary>
        public double pandl_ratio { get; set; }
 
        /// <summary>
        /// 交易端可用数量
        /// </summary>
        public double trade_avail_qty { get; set; }
 
        /// <summary>
        /// 指令端可用数量
        /// </summary>
        public double comm_avail_qty { get; set; }
 
        /// <summary>
        /// 静态可用数量
        /// </summary>
        public double static_avail_qty { get; set; }
 
        /// <summary>
        /// 持仓净值占比
        /// </summary>
        public double posi_nav_ratio { get; set; }
 
        /// <summary>
        /// 债券应收利息
        /// </summary>
        public double bond_receivable_amt { get; set; }
 
        /// <summary>
        /// 全价持仓市值
        /// </summary>
        public double full_holding_amt { get; set; }
 
        /// <summary>
        /// 质押数量
        /// </summary>
        public double impawn_qty { get; set; }
 
   }
 
   //逻辑_报表_资管报表_历史证券持仓汇总查询
   public class FuncrptL_4_13Model : BaseModel
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
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 指令占用数量
        /// </summary>
        public double comm_capt_qty { get; set; }
 
        /// <summary>
        /// 指令释放数量
        /// </summary>
        public double comm_releas_qty { get; set; }
 
        /// <summary>
        /// 交易占用数量
        /// </summary>
        public double trade_capt_qty { get; set; }
 
        /// <summary>
        /// 交易释放数量
        /// </summary>
        public double trade_releas_qty { get; set; }
 
        /// <summary>
        /// 成交占用数量
        /// </summary>
        public double strike_capt_qty { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 浮动盈亏
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// 盈亏比例
        /// </summary>
        public double pandl_ratio { get; set; }
 
        /// <summary>
        /// 交易端可用数量
        /// </summary>
        public double trade_avail_qty { get; set; }
 
        /// <summary>
        /// 指令端可用数量
        /// </summary>
        public double comm_avail_qty { get; set; }
 
        /// <summary>
        /// 静态可用数量
        /// </summary>
        public double static_avail_qty { get; set; }
 
        /// <summary>
        /// 持仓净值占比
        /// </summary>
        public double posi_nav_ratio { get; set; }
 
        /// <summary>
        /// 债券应收利息
        /// </summary>
        public double bond_receivable_amt { get; set; }
 
        /// <summary>
        /// 全价持仓市值
        /// </summary>
        public double full_holding_amt { get; set; }
 
        /// <summary>
        /// 质押数量
        /// </summary>
        public double impawn_qty { get; set; }
 
   }
 
   //逻辑_报表_资管报表_T+0账户盈亏报表查询
   public class FuncrptL_4_14Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
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
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 交易金额
        /// </summary>
        public double trade_amt { get; set; }
 
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// 买入数量
        /// </summary>
        public double buy_qty { get; set; }
 
        /// <summary>
        /// 买入金额
        /// </summary>
        public double buy_amt { get; set; }
 
        /// <summary>
        /// 卖出数量
        /// </summary>
        public double sell_qty { get; set; }
 
        /// <summary>
        /// 卖出金额
        /// </summary>
        public double sellout_amt { get; set; }
 
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty { get; set; }
 
        /// <summary>
        /// 收益率
        /// </summary>
        public double yield_rate { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 交易数量
        /// </summary>
        public double trade_qty { get; set; }
 
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value { get; set; }
 
   }
 
   //逻辑_报表_资管报表_T+0账户盈亏报表历史查询
   public class FuncrptL_4_15Model : BaseModel
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
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 当日盈亏
        /// </summary>
        public double today_pandl { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 交易金额
        /// </summary>
        public double trade_amt { get; set; }
 
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// 买入数量
        /// </summary>
        public double buy_qty { get; set; }
 
        /// <summary>
        /// 买入金额
        /// </summary>
        public double buy_amt { get; set; }
 
        /// <summary>
        /// 卖出数量
        /// </summary>
        public double sell_qty { get; set; }
 
        /// <summary>
        /// 卖出金额
        /// </summary>
        public double sellout_amt { get; set; }
 
   }
 
   //逻辑_报表_资管报表_T+0账户敞口报表查询
   public class FuncrptL_4_16Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
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
        /// 未平仓数量
        /// </summary>
        public double un_close_posi_qty { get; set; }
 
        /// <summary>
        /// 未平仓市值
        /// </summary>
        public double un_close_marke_value { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
   }
 
   //逻辑_报表_资管报表_T+0账户敞口报表历史查询
   public class FuncrptL_4_17Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
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
        /// 收益率
        /// </summary>
        public double yield_rate { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty { get; set; }
 
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
        /// <summary>
        /// 交易金额
        /// </summary>
        public double trade_amt { get; set; }
 
        /// <summary>
        /// 未平仓数量
        /// </summary>
        public double un_close_posi_qty { get; set; }
 
        /// <summary>
        /// 未平仓市值
        /// </summary>
        public double un_close_marke_value { get; set; }
 
   }
 
   //逻辑_报表_资管报表_证券成交流水明细查询
   public class FuncrptL_4_18Model : BaseModel
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 申报日期
        /// </summary>
        public int report_date { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 订单编号
        /// </summary>
        public int order_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// 订单时间
        /// </summary>
        public int order_time { get; set; }
 
        /// <summary>
        /// 申报编号
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 成交价格
        /// </summary>
        public double strike_price { get; set; }
 
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
        /// 成交日期
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// 成交时间
        /// </summary>
        public int strike_time { get; set; }
 
        /// <summary>
        /// 成交序号
        /// </summary>
        public ulong strike_id { get; set; }
 
        /// <summary>
        /// 成交编号
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
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
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 业务操作员编号
        /// </summary>
        public int busi_opor_no { get; set; }
 
        /// <summary>
        /// 业务操作员名称
        /// </summary>
        public String busi_opor_name { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 全价成交金额
        /// </summary>
        public double full_execution_amt { get; set; }
 
        /// <summary>
        /// 成交均价
        /// </summary>
        public double strike_aver_price { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// 记录有效标志
        /// </summary>
        public int record_valid_flag { get; set; }
 
   }
 
   //逻辑_报表_资管报表_证券成交流水历史查询
   public class FuncrptL_4_19Model : BaseModel
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 申报日期
        /// </summary>
        public int report_date { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 订单编号
        /// </summary>
        public int order_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// 订单时间
        /// </summary>
        public int order_time { get; set; }
 
        /// <summary>
        /// 申报编号
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 成交价格
        /// </summary>
        public double strike_price { get; set; }
 
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
        /// 成交日期
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// 成交时间
        /// </summary>
        public int strike_time { get; set; }
 
        /// <summary>
        /// 成交序号
        /// </summary>
        public ulong strike_id { get; set; }
 
        /// <summary>
        /// 成交编号
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
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
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 操作方式
        /// </summary>
        public String oper_way { get; set; }
 
        /// <summary>
        /// 业务操作员编号
        /// </summary>
        public int busi_opor_no { get; set; }
 
        /// <summary>
        /// 业务操作员名称
        /// </summary>
        public String busi_opor_name { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 全价成交金额
        /// </summary>
        public double full_execution_amt { get; set; }
 
        /// <summary>
        /// 成交均价
        /// </summary>
        public double strike_aver_price { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// 记录有效标志
        /// </summary>
        public int record_valid_flag { get; set; }
 
   }
 
   //逻辑_报表_资管报表_T+0账户月盈亏报表查询
   public class FuncrptL_4_20Model : BaseModel
   {
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作员名称
        /// </summary>
        public String opor_name { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 当月盈亏
        /// </summary>
        public double month_pandl { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 交易金额
        /// </summary>
        public double trade_amt { get; set; }
 
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// 买入金额
        /// </summary>
        public double buy_amt { get; set; }
 
        /// <summary>
        /// 销售金额
        /// </summary>
        public double sell_amt { get; set; }
 
   }
 
   //逻辑_报表_资管报表_T+0账户月盈亏报表历史查询
   public class FuncrptL_4_21Model : BaseModel
   {
        /// <summary>
        /// 当前月份
        /// </summary>
        public int curr_month { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作员名称
        /// </summary>
        public String opor_name { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 当月盈亏
        /// </summary>
        public double month_pandl { get; set; }
 
        /// <summary>
        /// 全部费用
        /// </summary>
        public double all_fee { get; set; }
 
        /// <summary>
        /// 交易金额
        /// </summary>
        public double trade_amt { get; set; }
 
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// 买入金额
        /// </summary>
        public double buy_amt { get; set; }
 
        /// <summary>
        /// 销售金额
        /// </summary>
        public double sell_amt { get; set; }
 
        /// <summary>
        /// 收益率
        /// </summary>
        public double yield_rate { get; set; }
 
   }
 
   //逻辑_报表_资管报表_T+0账户盈亏专用报表查询
   public class FuncrptL_4_27Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
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
        /// 收益率
        /// </summary>
        public double yield_rate { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty { get; set; }
 
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
        /// <summary>
        /// 交易金额
        /// </summary>
        public double trade_amt { get; set; }
 
   }
 
   //逻辑_报表_资管报表_T+0账户盈亏专用报表历史查询
   public class FuncrptL_4_28Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
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
        /// 收益率
        /// </summary>
        public double yield_rate { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓市值
        /// </summary>
        public double open_posi_value { get; set; }
 
        /// <summary>
        /// 平仓数量
        /// </summary>
        public double close_posi_qty { get; set; }
 
        /// <summary>
        /// 平仓市值
        /// </summary>
        public double close_posi_market_value { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
        /// <summary>
        /// 交易金额
        /// </summary>
        public double trade_amt { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询产品资产
   public class FuncrptL_4_31Model : BaseModel
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
        /// 产品总份额
        /// </summary>
        public double pd_all_share { get; set; }
 
        /// <summary>
        /// 当前份额
        /// </summary>
        public double curr_share { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 单位净值
        /// </summary>
        public double unit_nav { get; set; }
 
        /// <summary>
        /// 昨日净值
        /// </summary>
        public double pre_nav { get; set; }
 
        /// <summary>
        /// 净值波动
        /// </summary>
        public double nav_fluct { get; set; }
 
        /// <summary>
        /// 现金资产
        /// </summary>
        public double cash_asset { get; set; }
 
        /// <summary>
        /// 股票资产
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// 债券资产
        /// </summary>
        public double bond_asset { get; set; }
 
        /// <summary>
        /// 基金资产
        /// </summary>
        public double fund_asset { get; set; }
 
        /// <summary>
        /// 货币基金资产
        /// </summary>
        public double money_fund_asset { get; set; }
 
        /// <summary>
        /// 非货币基金资产
        /// </summary>
        public double not_money_fund_asset { get; set; }
 
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
 
        /// <summary>
        /// 期货资产
        /// </summary>
        public double futu_asset { get; set; }
 
        /// <summary>
        /// 可分配金额
        /// </summary>
        public double assign_avail_amt { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 当日盈亏
        /// </summary>
        public double today_pandl { get; set; }
 
        /// <summary>
        /// 当日收益率
        /// </summary>
        public double daily_pandl_ratio { get; set; }
 
        /// <summary>
        /// 可提现金额
        /// </summary>
        public double cash_out_amt { get; set; }
 
        /// <summary>
        /// 股票资产占比
        /// </summary>
        public double stock_asset_ratio { get; set; }
 
        /// <summary>
        /// 证券占比
        /// </summary>
        public double securities_ratio { get; set; }
 
        /// <summary>
        /// 基金资产占比
        /// </summary>
        public double fund_asset_ratio { get; set; }
 
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// 可用资金
        /// </summary>
        public double avail_cash { get; set; }
 
        /// <summary>
        /// 资金余额
        /// </summary>
        public double capit_bala { get; set; }
 
        /// <summary>
        /// 可用金额
        /// </summary>
        public double avail_amt { get; set; }
 
        /// <summary>
        /// 红冲蓝补金额
        /// </summary>
        public double total_change_amt { get; set; }
 
        /// <summary>
        /// 期货现金资产
        /// </summary>
        public double futu_cash_asset { get; set; }
 
        /// <summary>
        /// 总现金资产
        /// </summary>
        public double total_cash_asset { get; set; }
 
        /// <summary>
        /// 证券现金资产
        /// </summary>
        public double stock_cash_asset { get; set; }
 
        /// <summary>
        /// 占用保证金
        /// </summary>
        public double capt_margin { get; set; }
 
        /// <summary>
        /// 总融资负债
        /// </summary>
        public double total_fina_debt { get; set; }
 
        /// <summary>
        /// 总融券负债
        /// </summary>
        public double total_loan_debt { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询交易组资产
   public class FuncrptL_4_32Model : BaseModel
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
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 交易组产品份额
        /// </summary>
        public double exch_group_pd_share { get; set; }
 
        /// <summary>
        /// 单位净值
        /// </summary>
        public double unit_nav { get; set; }
 
        /// <summary>
        /// 昨日净值
        /// </summary>
        public double pre_nav { get; set; }
 
        /// <summary>
        /// 净值波动
        /// </summary>
        public double nav_fluct { get; set; }
 
        /// <summary>
        /// 现金资产
        /// </summary>
        public double cash_asset { get; set; }
 
        /// <summary>
        /// 股票资产
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// 债券资产
        /// </summary>
        public double bond_asset { get; set; }
 
        /// <summary>
        /// 基金资产
        /// </summary>
        public double fund_asset { get; set; }
 
        /// <summary>
        /// 货币基金资产
        /// </summary>
        public double money_fund_asset { get; set; }
 
        /// <summary>
        /// 非货币基金资产
        /// </summary>
        public double not_money_fund_asset { get; set; }
 
        /// <summary>
        /// 回购资产
        /// </summary>
        public double repo_asset { get; set; }
 
        /// <summary>
        /// 其他资产
        /// </summary>
        public double other_asset { get; set; }
 
        /// <summary>
        /// 期货资产
        /// </summary>
        public double futu_asset { get; set; }
 
        /// <summary>
        /// 港股通资产
        /// </summary>
        public double hk_thrgh_stock_asset { get; set; }
 
        /// <summary>
        /// 可分配金额
        /// </summary>
        public double assign_avail_amt { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 当日盈亏
        /// </summary>
        public double today_pandl { get; set; }
 
        /// <summary>
        /// 当日收益率
        /// </summary>
        public double daily_pandl_ratio { get; set; }
 
        /// <summary>
        /// 累计实现收益
        /// </summary>
        public double total_realiz_pandl { get; set; }
 
        /// <summary>
        /// 累计收益率
        /// </summary>
        public double total_realiz_pandl_ratio { get; set; }
 
        /// <summary>
        /// 持股比例
        /// </summary>
        public double posi_ratio { get; set; }
 
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// 可用资金
        /// </summary>
        public double avail_cash { get; set; }
 
        /// <summary>
        /// 资金余额
        /// </summary>
        public double capit_bala { get; set; }
 
        /// <summary>
        /// 可用金额
        /// </summary>
        public double avail_amt { get; set; }
 
        /// <summary>
        /// 红冲蓝补金额
        /// </summary>
        public double total_change_amt { get; set; }
 
        /// <summary>
        /// 期货现金资产
        /// </summary>
        public double futu_cash_asset { get; set; }
 
        /// <summary>
        /// 总现金资产
        /// </summary>
        public double total_cash_asset { get; set; }
 
        /// <summary>
        /// 证券现金资产
        /// </summary>
        public double stock_cash_asset { get; set; }
 
        /// <summary>
        /// 港股可用金额
        /// </summary>
        public double hk_avail_amt { get; set; }
 
        /// <summary>
        /// 总融资负债
        /// </summary>
        public double total_fina_debt { get; set; }
 
        /// <summary>
        /// 总融券负债
        /// </summary>
        public double total_loan_debt { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询产品资产_历史
   public class FuncrptL_4_33Model : BaseModel
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
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 产品总份额
        /// </summary>
        public double pd_all_share { get; set; }
 
        /// <summary>
        /// 当前份额
        /// </summary>
        public double curr_share { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 单位净值
        /// </summary>
        public double unit_nav { get; set; }
 
        /// <summary>
        /// 昨日净值
        /// </summary>
        public double pre_nav { get; set; }
 
        /// <summary>
        /// 净值波动
        /// </summary>
        public double nav_fluct { get; set; }
 
        /// <summary>
        /// 现金资产
        /// </summary>
        public double cash_asset { get; set; }
 
        /// <summary>
        /// 股票资产
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// 债券资产
        /// </summary>
        public double bond_asset { get; set; }
 
        /// <summary>
        /// 基金资产
        /// </summary>
        public double fund_asset { get; set; }
 
        /// <summary>
        /// 货币基金资产
        /// </summary>
        public double money_fund_asset { get; set; }
 
        /// <summary>
        /// 非货币基金资产
        /// </summary>
        public double not_money_fund_asset { get; set; }
 
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
 
        /// <summary>
        /// 期货资产
        /// </summary>
        public double futu_asset { get; set; }
 
        /// <summary>
        /// 可分配金额
        /// </summary>
        public double assign_avail_amt { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 当日盈亏
        /// </summary>
        public double today_pandl { get; set; }
 
        /// <summary>
        /// 当日收益率
        /// </summary>
        public double daily_pandl_ratio { get; set; }
 
        /// <summary>
        /// 可提现金额
        /// </summary>
        public double cash_out_amt { get; set; }
 
        /// <summary>
        /// 股票资产占比
        /// </summary>
        public double stock_asset_ratio { get; set; }
 
        /// <summary>
        /// 证券占比
        /// </summary>
        public double securities_ratio { get; set; }
 
        /// <summary>
        /// 基金资产占比
        /// </summary>
        public double fund_asset_ratio { get; set; }
 
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// 可用资金
        /// </summary>
        public double avail_cash { get; set; }
 
        /// <summary>
        /// 资金余额
        /// </summary>
        public double capit_bala { get; set; }
 
        /// <summary>
        /// 可用金额
        /// </summary>
        public double avail_amt { get; set; }
 
        /// <summary>
        /// 红冲蓝补金额
        /// </summary>
        public double total_change_amt { get; set; }
 
        /// <summary>
        /// 期货现金资产
        /// </summary>
        public double futu_cash_asset { get; set; }
 
        /// <summary>
        /// 总现金资产
        /// </summary>
        public double total_cash_asset { get; set; }
 
        /// <summary>
        /// 证券现金资产
        /// </summary>
        public double stock_cash_asset { get; set; }
 
        /// <summary>
        /// 占用保证金
        /// </summary>
        public double capt_margin { get; set; }
 
        /// <summary>
        /// 总融资负债
        /// </summary>
        public double total_fina_debt { get; set; }
 
        /// <summary>
        /// 总融券负债
        /// </summary>
        public double total_loan_debt { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询交易组资产_历史
   public class FuncrptL_4_34Model : BaseModel
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
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 交易组产品份额
        /// </summary>
        public double exch_group_pd_share { get; set; }
 
        /// <summary>
        /// 单位净值
        /// </summary>
        public double unit_nav { get; set; }
 
        /// <summary>
        /// 昨日净值
        /// </summary>
        public double pre_nav { get; set; }
 
        /// <summary>
        /// 净值波动
        /// </summary>
        public double nav_fluct { get; set; }
 
        /// <summary>
        /// 现金资产
        /// </summary>
        public double cash_asset { get; set; }
 
        /// <summary>
        /// 股票资产
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// 债券资产
        /// </summary>
        public double bond_asset { get; set; }
 
        /// <summary>
        /// 基金资产
        /// </summary>
        public double fund_asset { get; set; }
 
        /// <summary>
        /// 货币基金资产
        /// </summary>
        public double money_fund_asset { get; set; }
 
        /// <summary>
        /// 非货币基金资产
        /// </summary>
        public double not_money_fund_asset { get; set; }
 
        /// <summary>
        /// 回购资产
        /// </summary>
        public double repo_asset { get; set; }
 
        /// <summary>
        /// 其他资产
        /// </summary>
        public double other_asset { get; set; }
 
        /// <summary>
        /// 期货资产
        /// </summary>
        public double futu_asset { get; set; }
 
        /// <summary>
        /// 港股通资产
        /// </summary>
        public double hk_thrgh_stock_asset { get; set; }
 
        /// <summary>
        /// 可分配金额
        /// </summary>
        public double assign_avail_amt { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 当日盈亏
        /// </summary>
        public double today_pandl { get; set; }
 
        /// <summary>
        /// 当日收益率
        /// </summary>
        public double daily_pandl_ratio { get; set; }
 
        /// <summary>
        /// 累计实现收益
        /// </summary>
        public double total_realiz_pandl { get; set; }
 
        /// <summary>
        /// 累计收益率
        /// </summary>
        public double total_realiz_pandl_ratio { get; set; }
 
        /// <summary>
        /// 持股比例
        /// </summary>
        public double posi_ratio { get; set; }
 
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// 可用资金
        /// </summary>
        public double avail_cash { get; set; }
 
        /// <summary>
        /// 资金余额
        /// </summary>
        public double capit_bala { get; set; }
 
        /// <summary>
        /// 可用金额
        /// </summary>
        public double avail_amt { get; set; }
 
        /// <summary>
        /// 红冲蓝补金额
        /// </summary>
        public double total_change_amt { get; set; }
 
        /// <summary>
        /// 期货现金资产
        /// </summary>
        public double futu_cash_asset { get; set; }
 
        /// <summary>
        /// 总现金资产
        /// </summary>
        public double total_cash_asset { get; set; }
 
        /// <summary>
        /// 证券现金资产
        /// </summary>
        public double stock_cash_asset { get; set; }
 
        /// <summary>
        /// 港股可用金额
        /// </summary>
        public double hk_avail_amt { get; set; }
 
        /// <summary>
        /// 总融资负债
        /// </summary>
        public double total_fina_debt { get; set; }
 
        /// <summary>
        /// 总融券负债
        /// </summary>
        public double total_loan_debt { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询_产品_证券持仓
   public class FuncrptL_4_35Model : BaseModel
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
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 待交收数量
        /// </summary>
        public double pre_settle_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 指令冻结数量
        /// </summary>
        public double comm_frozen_qty { get; set; }
 
        /// <summary>
        /// 指令解冻数量
        /// </summary>
        public double comm_unfroz_qty { get; set; }
 
        /// <summary>
        /// 指令占用数量
        /// </summary>
        public double comm_capt_qty { get; set; }
 
        /// <summary>
        /// 指令释放数量
        /// </summary>
        public double comm_releas_qty { get; set; }
 
        /// <summary>
        /// 交易冻结数量
        /// </summary>
        public double trade_frozen_qty { get; set; }
 
        /// <summary>
        /// 交易解冻数量
        /// </summary>
        public double trade_unfroz_qty { get; set; }
 
        /// <summary>
        /// 交易占用数量
        /// </summary>
        public double trade_capt_qty { get; set; }
 
        /// <summary>
        /// 交易释放数量
        /// </summary>
        public double trade_releas_qty { get; set; }
 
        /// <summary>
        /// 成交占用数量
        /// </summary>
        public double strike_capt_qty { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 成交冻结数量
        /// </summary>
        public double strike_frozen_qty { get; set; }
 
        /// <summary>
        /// 成交解冻数量
        /// </summary>
        public double strike_unfroz_qty { get; set; }
 
        /// <summary>
        /// 买入待交割数量
        /// </summary>
        public double buy_pre_sett_qty { get; set; }
 
        /// <summary>
        /// 卖出待交割数量
        /// </summary>
        public double sell_pre_sett_qty { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
        /// <summary>
        /// 可用数量
        /// </summary>
        public double avail_qty { get; set; }
 
        /// <summary>
        /// 质押数量
        /// </summary>
        public double impawn_qty { get; set; }
 
        /// <summary>
        /// 债券应收利息
        /// </summary>
        public double bond_receivable_amt { get; set; }
 
        /// <summary>
        /// 净价
        /// </summary>
        public double net_price { get; set; }
 
        /// <summary>
        /// 全价
        /// </summary>
        public double full_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 全价持仓市值
        /// </summary>
        public double full_holding_amt { get; set; }
 
        /// <summary>
        /// 大宗交易持仓市值
        /// </summary>
        public double block_trade_posi_market_value { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 公允价格
        /// </summary>
        public double fair_price { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 债券利率类型
        /// </summary>
        public int bond_rate_type { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 质押比例
        /// </summary>
        public double impawn_ratio { get; set; }
 
        /// <summary>
        /// 总股本
        /// </summary>
        public double total_stock_issue { get; set; }
 
        /// <summary>
        /// 流通股本
        /// </summary>
        public double circl_stock_capit { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询_交易组_证券持仓
   public class FuncrptL_4_36Model : BaseModel
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
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 待交收数量
        /// </summary>
        public double pre_settle_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 指令冻结数量
        /// </summary>
        public double comm_frozen_qty { get; set; }
 
        /// <summary>
        /// 指令解冻数量
        /// </summary>
        public double comm_unfroz_qty { get; set; }
 
        /// <summary>
        /// 指令占用数量
        /// </summary>
        public double comm_capt_qty { get; set; }
 
        /// <summary>
        /// 指令释放数量
        /// </summary>
        public double comm_releas_qty { get; set; }
 
        /// <summary>
        /// 交易冻结数量
        /// </summary>
        public double trade_frozen_qty { get; set; }
 
        /// <summary>
        /// 交易解冻数量
        /// </summary>
        public double trade_unfroz_qty { get; set; }
 
        /// <summary>
        /// 交易占用数量
        /// </summary>
        public double trade_capt_qty { get; set; }
 
        /// <summary>
        /// 交易释放数量
        /// </summary>
        public double trade_releas_qty { get; set; }
 
        /// <summary>
        /// 成交占用数量
        /// </summary>
        public double strike_capt_qty { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 成交冻结数量
        /// </summary>
        public double strike_frozen_qty { get; set; }
 
        /// <summary>
        /// 成交解冻数量
        /// </summary>
        public double strike_unfroz_qty { get; set; }
 
        /// <summary>
        /// 买入待交割数量
        /// </summary>
        public double buy_pre_sett_qty { get; set; }
 
        /// <summary>
        /// 卖出待交割数量
        /// </summary>
        public double sell_pre_sett_qty { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
        /// <summary>
        /// 全价持仓市值
        /// </summary>
        public double full_holding_amt { get; set; }
 
        /// <summary>
        /// 质押数量
        /// </summary>
        public double impawn_qty { get; set; }
 
        /// <summary>
        /// 债券应收利息
        /// </summary>
        public double bond_receivable_amt { get; set; }
 
        /// <summary>
        /// 净价
        /// </summary>
        public double net_price { get; set; }
 
        /// <summary>
        /// 全价
        /// </summary>
        public double full_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price { get; set; }
 
        /// <summary>
        /// 交易端可用数量
        /// </summary>
        public double trade_avail_qty { get; set; }
 
        /// <summary>
        /// 指令端可用数量
        /// </summary>
        public double comm_avail_qty { get; set; }
 
        /// <summary>
        /// 静态可用数量
        /// </summary>
        public double static_avail_qty { get; set; }
 
        /// <summary>
        /// 大宗交易持仓市值
        /// </summary>
        public double block_trade_posi_market_value { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 公允价格
        /// </summary>
        public double fair_price { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 债券利率类型
        /// </summary>
        public int bond_rate_type { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 质押比例
        /// </summary>
        public double impawn_ratio { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询_产品_证券持仓_历史
   public class FuncrptL_4_37Model : BaseModel
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
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 持仓净值占比
        /// </summary>
        public double posi_nav_ratio { get; set; }
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 待交收数量
        /// </summary>
        public double pre_settle_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 买入待交割数量
        /// </summary>
        public double buy_pre_sett_qty { get; set; }
 
        /// <summary>
        /// 卖出待交割数量
        /// </summary>
        public double sell_pre_sett_qty { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
        /// <summary>
        /// 可用数量
        /// </summary>
        public double avail_qty { get; set; }
 
        /// <summary>
        /// 全价持仓市值
        /// </summary>
        public double full_holding_amt { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 质押数量
        /// </summary>
        public double impawn_qty { get; set; }
 
        /// <summary>
        /// 债券应收利息
        /// </summary>
        public double bond_receivable_amt { get; set; }
 
        /// <summary>
        /// 净价
        /// </summary>
        public double net_price { get; set; }
 
        /// <summary>
        /// 全价
        /// </summary>
        public double full_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price { get; set; }
 
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询_交易组_证券持仓_历史
   public class FuncrptL_4_38Model : BaseModel
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
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 交易端可用数量
        /// </summary>
        public double trade_avail_qty { get; set; }
 
        /// <summary>
        /// 指令端可用数量
        /// </summary>
        public double comm_avail_qty { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 持仓净值占比
        /// </summary>
        public double posi_nav_ratio { get; set; }
 
        /// <summary>
        /// 全价持仓市值
        /// </summary>
        public double full_holding_amt { get; set; }
 
        /// <summary>
        /// 浮动盈亏
        /// </summary>
        public double float_pandl { get; set; }
 
        /// <summary>
        /// 盈亏比例
        /// </summary>
        public double pandl_ratio { get; set; }
 
        /// <summary>
        /// 债券应收利息
        /// </summary>
        public double bond_receivable_amt { get; set; }
 
        /// <summary>
        /// 质押数量
        /// </summary>
        public double impawn_qty { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询_产品_期货持仓
   public class FuncrptL_4_41Model : BaseModel
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
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price { get; set; }
 
        /// <summary>
        /// 盯市盈亏
        /// </summary>
        public double marked_pandl { get; set; }
 
        /// <summary>
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 今仓成交占用数量
        /// </summary>
        public double today_strike_capt_qty { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 持仓净值占比
        /// </summary>
        public double posi_nav_ratio { get; set; }
 
        /// <summary>
        /// 开仓均价
        /// </summary>
        public double open_aver_price { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询_产品_期货持仓_历史
   public class FuncrptL_4_42Model : BaseModel
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
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price { get; set; }
 
        /// <summary>
        /// 盯市盈亏
        /// </summary>
        public double marked_pandl { get; set; }
 
        /// <summary>
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 今仓成交占用数量
        /// </summary>
        public double today_strike_capt_qty { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 持仓净值占比
        /// </summary>
        public double posi_nav_ratio { get; set; }
 
        /// <summary>
        /// 开仓均价
        /// </summary>
        public double open_aver_price { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询_交易组_期货持仓
   public class FuncrptL_4_43Model : BaseModel
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
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price { get; set; }
 
        /// <summary>
        /// 盯市盈亏
        /// </summary>
        public double marked_pandl { get; set; }
 
        /// <summary>
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 今仓成交占用数量
        /// </summary>
        public double today_strike_capt_qty { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 持仓净值占比
        /// </summary>
        public double posi_nav_ratio { get; set; }
 
        /// <summary>
        /// 开仓均价
        /// </summary>
        public double open_aver_price { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询_交易组_期货持仓_历史
   public class FuncrptL_4_44Model : BaseModel
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
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price { get; set; }
 
        /// <summary>
        /// 盯市盈亏
        /// </summary>
        public double marked_pandl { get; set; }
 
        /// <summary>
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 今仓成交占用数量
        /// </summary>
        public double today_strike_capt_qty { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 持仓净值占比
        /// </summary>
        public double posi_nav_ratio { get; set; }
 
        /// <summary>
        /// 开仓均价
        /// </summary>
        public double open_aver_price { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询_交易组_期货持仓明细
   public class FuncrptL_4_45Model : BaseModel
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
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price { get; set; }
 
        /// <summary>
        /// 开仓日期
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// 开仓时间
        /// </summary>
        public int open_posi_time { get; set; }
 
        /// <summary>
        /// 平仓盈亏
        /// </summary>
        public double close_pandl { get; set; }
 
        /// <summary>
        /// 盯市盈亏
        /// </summary>
        public double marked_pandl { get; set; }
 
        /// <summary>
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询T0交易员开平仓明细历史
   public class FuncrptL_4_46Model : BaseModel
   {
        /// <summary>
        /// 开平方向
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
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
        /// 平仓日期
        /// </summary>
        public int close_posi_date { get; set; }
 
        /// <summary>
        /// 平仓时间
        /// </summary>
        public int close_posi_time { get; set; }
 
        /// <summary>
        /// 平仓价格
        /// </summary>
        public double close_posi_price { get; set; }
 
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
        /// 平仓数量
        /// </summary>
        public double close_posi_qty { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 隔夜盈亏
        /// </summary>
        public double over_night_pandl { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询成交明细
   public class FuncrptL_4_47Model : BaseModel
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
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
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
        /// 订单序号
        /// </summary>
        public ulong order_id { get; set; }
 
        /// <summary>
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
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
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交价格
        /// </summary>
        public double strike_price { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
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
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 成交债券计提利息
        /// </summary>
        public double strike_bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 订单操作方式
        /// </summary>
        public String order_oper_way { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// 记录有效标志
        /// </summary>
        public int record_valid_flag { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 组合代码
        /// </summary>
        public String combo_code { get; set; }
 
        /// <summary>
        /// 行情成交数量
        /// </summary>
        public double quot_strike_qty { get; set; }
 
        /// <summary>
        /// 行情成交金额
        /// </summary>
        public double quot_strike_amt { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询全部交易组
   public class FuncrptL_4_101Model : BaseModel
   {
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 交易组编码
        /// </summary>
        public String exch_group_code { get; set; }
 
        /// <summary>
        /// 交易组名称
        /// </summary>
        public String exch_group_name { get; set; }
 
        /// <summary>
        /// 交易组状态
        /// </summary>
        public String exch_group_status { get; set; }
 
        /// <summary>
        /// 默认组标志
        /// </summary>
        public int default_group_flag { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询全部操作员信息
   public class FuncrptL_4_102Model : BaseModel
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
        /// 操作员名称
        /// </summary>
        public String opor_name { get; set; }
 
        /// <summary>
        /// 操作员类型
        /// </summary>
        public int opor_type { get; set; }
 
        /// <summary>
        /// 操作员状态
        /// </summary>
        public String opor_status { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询产品上日资产
   public class FuncrptL_4_103Model : BaseModel
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
        /// 期初净资产
        /// </summary>
        public double begin_NAV { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 单位净值
        /// </summary>
        public double unit_nav { get; set; }
 
        /// <summary>
        /// 昨日净值
        /// </summary>
        public double pre_nav { get; set; }
 
        /// <summary>
        /// 净值波动
        /// </summary>
        public double nav_fluct { get; set; }
 
        /// <summary>
        /// 现金资产
        /// </summary>
        public double cash_asset { get; set; }
 
        /// <summary>
        /// 股票资产
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// 债券资产
        /// </summary>
        public double bond_asset { get; set; }
 
        /// <summary>
        /// 基金资产
        /// </summary>
        public double fund_asset { get; set; }
 
        /// <summary>
        /// 回购资产
        /// </summary>
        public double repo_asset { get; set; }
 
        /// <summary>
        /// 其他资产
        /// </summary>
        public double other_asset { get; set; }
 
        /// <summary>
        /// 期货资产
        /// </summary>
        public double futu_asset { get; set; }
 
        /// <summary>
        /// 港股通资产
        /// </summary>
        public double hk_thrgh_stock_asset { get; set; }
 
        /// <summary>
        /// 可分配金额
        /// </summary>
        public double assign_avail_amt { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 当日盈亏
        /// </summary>
        public double today_pandl { get; set; }
 
        /// <summary>
        /// 当日收益率
        /// </summary>
        public double daily_pandl_ratio { get; set; }
 
        /// <summary>
        /// 可提现金额
        /// </summary>
        public double cash_out_amt { get; set; }
 
        /// <summary>
        /// 股票资产占比
        /// </summary>
        public double stock_asset_ratio { get; set; }
 
        /// <summary>
        /// 基金资产占比
        /// </summary>
        public double fund_asset_ratio { get; set; }
 
        /// <summary>
        /// 证券占比
        /// </summary>
        public double securities_ratio { get; set; }
 
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// 货币基金资产
        /// </summary>
        public double money_fund_asset { get; set; }
 
        /// <summary>
        /// 股票成本
        /// </summary>
        public double stock_cost { get; set; }
 
        /// <summary>
        /// 债券成本
        /// </summary>
        public double bond_cost { get; set; }
 
        /// <summary>
        /// 基金成本
        /// </summary>
        public double fund_cost { get; set; }
 
        /// <summary>
        /// 回购成本
        /// </summary>
        public double repo_cost { get; set; }
 
        /// <summary>
        /// 其他成本
        /// </summary>
        public double other_cost { get; set; }
 
        /// <summary>
        /// 期货成本
        /// </summary>
        public double futu_cost { get; set; }
 
        /// <summary>
        /// 港股通成本
        /// </summary>
        public double hk_thrgh_stock_cost { get; set; }
 
        /// <summary>
        /// 货币基金成本
        /// </summary>
        public double money_fund_cost { get; set; }
 
        /// <summary>
        /// 单位累计净值
        /// </summary>
        public double unit_nav_total { get; set; }
 
        /// <summary>
        /// 单位分红
        /// </summary>
        public double unit_divi_amt { get; set; }
 
        /// <summary>
        /// 可用资金
        /// </summary>
        public double avail_cash { get; set; }
 
        /// <summary>
        /// 分组序号
        /// </summary>
        public ulong grp_row { get; set; }
 
        /// <summary>
        /// 上月净值
        /// </summary>
        public double last_month_pd_nav { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 资金余额
        /// </summary>
        public double capit_bala { get; set; }
 
        /// <summary>
        /// 可用金额
        /// </summary>
        public double avail_amt { get; set; }
 
        /// <summary>
        /// 上日现金资产
        /// </summary>
        public double pre_cash_asset { get; set; }
 
        /// <summary>
        /// 上日股票资产
        /// </summary>
        public double pre_stock_asset { get; set; }
 
        /// <summary>
        /// 上日债券资产
        /// </summary>
        public double pre_bond_asset { get; set; }
 
        /// <summary>
        /// 上日基金资产
        /// </summary>
        public double pre_fund_asset { get; set; }
 
        /// <summary>
        /// 上日回购资产
        /// </summary>
        public double pre_repo_asset { get; set; }
 
        /// <summary>
        /// 上日其他资产
        /// </summary>
        public double pre_other_asset { get; set; }
 
        /// <summary>
        /// 上日期货资产
        /// </summary>
        public double pre_futu_asset { get; set; }
 
        /// <summary>
        /// 上日港股通资产
        /// </summary>
        public double pre_hk_thrgh_stock_asset { get; set; }
 
        /// <summary>
        /// 上日货币基金资产
        /// </summary>
        public double pre_money_fund_asset { get; set; }
 
        /// <summary>
        /// 上日股票成本
        /// </summary>
        public double pre_stock_cost { get; set; }
 
        /// <summary>
        /// 上日债券成本
        /// </summary>
        public double pre_bond_cost { get; set; }
 
        /// <summary>
        /// 上日基金成本
        /// </summary>
        public double pre_fund_cost { get; set; }
 
        /// <summary>
        /// 上日回购成本
        /// </summary>
        public double pre_repo_cost { get; set; }
 
        /// <summary>
        /// 上日其他成本
        /// </summary>
        public double pre_other_cost { get; set; }
 
        /// <summary>
        /// 上日期货成本
        /// </summary>
        public double pre_futu_cost { get; set; }
 
        /// <summary>
        /// 上日港股通成本
        /// </summary>
        public double pre_hk_thrgh_stock_cost { get; set; }
 
        /// <summary>
        /// 上日货币基金成本
        /// </summary>
        public double pre_money_fund_cost { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询产品汇总成交证券类型
   public class FuncrptL_4_104Model : BaseModel
   {
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 累计交易金额
        /// </summary>
        public double total_trade_amt { get; set; }
 
        /// <summary>
        /// 累计成交佣金
        /// </summary>
        public double total_strike_commis { get; set; }
 
        /// <summary>
        /// A股交易金额
        /// </summary>
        public double stock_trade_amt { get; set; }
 
        /// <summary>
        /// A股成交佣金
        /// </summary>
        public double stock_strike_commis { get; set; }
 
        /// <summary>
        /// 债券交易金额
        /// </summary>
        public double bond_trade_amt { get; set; }
 
        /// <summary>
        /// 债券成交佣金
        /// </summary>
        public double bond_strike_commis { get; set; }
 
        /// <summary>
        /// 基金交易金额
        /// </summary>
        public double fund_trade_amt { get; set; }
 
        /// <summary>
        /// 基金成交佣金
        /// </summary>
        public double fund_strike_commis { get; set; }
 
        /// <summary>
        /// 货币基金交易金额
        /// </summary>
        public double money_fund_trade_amt { get; set; }
 
        /// <summary>
        /// 货币基金成交佣金
        /// </summary>
        public double money_fund_strike_commis { get; set; }
 
        /// <summary>
        /// 港股通交易金额
        /// </summary>
        public double hk_thrgh_trade_amt { get; set; }
 
        /// <summary>
        /// 港股通成交佣金
        /// </summary>
        public double hk_thrgh_strike_commis { get; set; }
 
        /// <summary>
        /// 回购交易金额
        /// </summary>
        public double repo_trade_amt { get; set; }
 
        /// <summary>
        /// 回购成交佣金
        /// </summary>
        public double repo_strike_commis { get; set; }
 
        /// <summary>
        /// 期权交易金额
        /// </summary>
        public double option_trade_amt { get; set; }
 
        /// <summary>
        /// 期权成交佣金
        /// </summary>
        public double option_strike_commis { get; set; }
 
        /// <summary>
        /// 期货交易金额
        /// </summary>
        public double futu_trade_amt { get; set; }
 
        /// <summary>
        /// 期货成交佣金
        /// </summary>
        public double futu_strike_commis { get; set; }
 
        /// <summary>
        /// 累计交易笔数
        /// </summary>
        public int total_trade_cnt { get; set; }
 
        /// <summary>
        /// A股交易笔数
        /// </summary>
        public int stock_trade_cnt { get; set; }
 
        /// <summary>
        /// 债券交易笔数
        /// </summary>
        public int bond_trade_cnt { get; set; }
 
        /// <summary>
        /// 基金交易笔数
        /// </summary>
        public int fund_trade_cnt { get; set; }
 
        /// <summary>
        /// 货币基金交易笔数
        /// </summary>
        public int money_fund_trade_cnt { get; set; }
 
        /// <summary>
        /// 港股通交易笔数
        /// </summary>
        public int hk_thrgh_trade_cnt { get; set; }
 
        /// <summary>
        /// 回购交易笔数
        /// </summary>
        public int repo_trade_cnt { get; set; }
 
        /// <summary>
        /// 期权交易笔数
        /// </summary>
        public int option_trade_cnt { get; set; }
 
        /// <summary>
        /// 期货交易笔数
        /// </summary>
        public int futu_trade_cnt { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询证券行情
   public class FuncrptL_4_106Model : BaseModel
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
 
   //逻辑_报表_资管报表_查询产品指令统计
   public class FuncrptL_4_107Model : BaseModel
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
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 指令笔数
        /// </summary>
        public double commd_cnt { get; set; }
 
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// 订单笔数
        /// </summary>
        public int order_num { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 订单金额
        /// </summary>
        public double order_amt { get; set; }
 
        /// <summary>
        /// 未成交金额
        /// </summary>
        public double undeal_amt { get; set; }
 
        /// <summary>
        /// 成交笔数
        /// </summary>
        public int strike_num { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 行情成交数量
        /// </summary>
        public double quot_strike_qty { get; set; }
 
        /// <summary>
        /// 行情成交金额
        /// </summary>
        public double quot_strike_amt { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询产品交易操作效率
   public class FuncrptL_4_108Model : BaseModel
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
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// 持仓不动收益率
        /// </summary>
        public double posi_yield_rate { get; set; }
 
        /// <summary>
        /// 绝对操作效率
        /// </summary>
        public double real_trade_oper_rate { get; set; }
 
        /// <summary>
        /// 日均净资产
        /// </summary>
        public double avg_nav_asset { get; set; }
 
        /// <summary>
        /// 买入金额
        /// </summary>
        public double buy_amt { get; set; }
 
        /// <summary>
        /// 卖出金额
        /// </summary>
        public double sellout_amt { get; set; }
 
        /// <summary>
        /// 期初净资产
        /// </summary>
        public double begin_NAV { get; set; }
 
        /// <summary>
        /// 期初份额累计净值
        /// </summary>
        public double begin_share_net_total { get; set; }
 
        /// <summary>
        /// 期初单位净值
        /// </summary>
        public double pd_begin_unit_nav { get; set; }
 
        /// <summary>
        /// 期初份额总额
        /// </summary>
        public double begin_net_all { get; set; }
 
        /// <summary>
        /// 期末净资产
        /// </summary>
        public double end_nav_asset { get; set; }
 
        /// <summary>
        /// 期末份额累计净值
        /// </summary>
        public double end_share_net_total { get; set; }
 
        /// <summary>
        /// 期末份额总额
        /// </summary>
        public double end_net_all { get; set; }
 
        /// <summary>
        /// 期末单位净值
        /// </summary>
        public double end_unit_nav { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询产品汇总持仓
   public class FuncrptL_4_111Model : BaseModel
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
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 待交收数量
        /// </summary>
        public double pre_settle_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 指令冻结数量
        /// </summary>
        public double comm_frozen_qty { get; set; }
 
        /// <summary>
        /// 指令解冻数量
        /// </summary>
        public double comm_unfroz_qty { get; set; }
 
        /// <summary>
        /// 指令占用数量
        /// </summary>
        public double comm_capt_qty { get; set; }
 
        /// <summary>
        /// 指令释放数量
        /// </summary>
        public double comm_releas_qty { get; set; }
 
        /// <summary>
        /// 交易冻结数量
        /// </summary>
        public double trade_frozen_qty { get; set; }
 
        /// <summary>
        /// 交易解冻数量
        /// </summary>
        public double trade_unfroz_qty { get; set; }
 
        /// <summary>
        /// 交易占用数量
        /// </summary>
        public double trade_capt_qty { get; set; }
 
        /// <summary>
        /// 交易释放数量
        /// </summary>
        public double trade_releas_qty { get; set; }
 
        /// <summary>
        /// 成交占用数量
        /// </summary>
        public double strike_capt_qty { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 成交冻结数量
        /// </summary>
        public double strike_frozen_qty { get; set; }
 
        /// <summary>
        /// 成交解冻数量
        /// </summary>
        public double strike_unfroz_qty { get; set; }
 
        /// <summary>
        /// 买入待交割数量
        /// </summary>
        public double buy_pre_sett_qty { get; set; }
 
        /// <summary>
        /// 卖出待交割数量
        /// </summary>
        public double sell_pre_sett_qty { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
        /// <summary>
        /// 可用数量
        /// </summary>
        public double avail_qty { get; set; }
 
        /// <summary>
        /// 全价持仓市值
        /// </summary>
        public double full_holding_amt { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 质押数量
        /// </summary>
        public double impawn_qty { get; set; }
 
        /// <summary>
        /// 债券应收利息
        /// </summary>
        public double bond_receivable_amt { get; set; }
 
        /// <summary>
        /// 净价
        /// </summary>
        public double net_price { get; set; }
 
        /// <summary>
        /// 全价
        /// </summary>
        public double full_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price { get; set; }
 
        /// <summary>
        /// 成本价
        /// </summary>
        public double cost_price { get; set; }
 
        /// <summary>
        /// 持仓净值占比
        /// </summary>
        public double posi_nav_ratio { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询产品佣金统计报表
   public class FuncrptL_4_112Model : BaseModel
   {
        /// <summary>
        /// 开始日期
        /// </summary>
        public int begin_date { get; set; }
 
        /// <summary>
        /// 结束日期
        /// </summary>
        public int end_date { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// A股交易金额
        /// </summary>
        public double stock_trade_amt { get; set; }
 
        /// <summary>
        /// A股成交佣金
        /// </summary>
        public double stock_strike_commis { get; set; }
 
   }
 
   //逻辑_报表_资管报表_产品当日成交统计查询
   public class FuncrptL_4_113Model : BaseModel
   {
        /// <summary>
        /// 成交占用金额
        /// </summary>
        public double strike_capt_amt { get; set; }
 
        /// <summary>
        /// 成交释放金额
        /// </summary>
        public double strike_releas_amt { get; set; }
 
   }
 
   //逻辑_报表_资管报表_产品持仓汇总统计查询
   public class FuncrptL_4_114Model : BaseModel
   {
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 持仓盈亏
        /// </summary>
        public double holder_profit { get; set; }
 
   }
 
   //逻辑_报表_资管报表_查询_交易组_新证券持仓
   public class FuncrptL_4_115Model : BaseModel
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
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 持仓市值
        /// </summary>
        public double posi_market_value { get; set; }
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 待交收数量
        /// </summary>
        public double pre_settle_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 指令冻结数量
        /// </summary>
        public double comm_frozen_qty { get; set; }
 
        /// <summary>
        /// 指令解冻数量
        /// </summary>
        public double comm_unfroz_qty { get; set; }
 
        /// <summary>
        /// 指令占用数量
        /// </summary>
        public double comm_capt_qty { get; set; }
 
        /// <summary>
        /// 指令释放数量
        /// </summary>
        public double comm_releas_qty { get; set; }
 
        /// <summary>
        /// 交易冻结数量
        /// </summary>
        public double trade_frozen_qty { get; set; }
 
        /// <summary>
        /// 交易解冻数量
        /// </summary>
        public double trade_unfroz_qty { get; set; }
 
        /// <summary>
        /// 交易占用数量
        /// </summary>
        public double trade_capt_qty { get; set; }
 
        /// <summary>
        /// 交易释放数量
        /// </summary>
        public double trade_releas_qty { get; set; }
 
        /// <summary>
        /// 成交占用数量
        /// </summary>
        public double strike_capt_qty { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 成交冻结数量
        /// </summary>
        public double strike_frozen_qty { get; set; }
 
        /// <summary>
        /// 成交解冻数量
        /// </summary>
        public double strike_unfroz_qty { get; set; }
 
        /// <summary>
        /// 买入待交割数量
        /// </summary>
        public double buy_pre_sett_qty { get; set; }
 
        /// <summary>
        /// 卖出待交割数量
        /// </summary>
        public double sell_pre_sett_qty { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
        /// <summary>
        /// 全价持仓市值
        /// </summary>
        public double full_holding_amt { get; set; }
 
        /// <summary>
        /// 质押数量
        /// </summary>
        public double impawn_qty { get; set; }
 
        /// <summary>
        /// 债券应收利息
        /// </summary>
        public double bond_receivable_amt { get; set; }
 
        /// <summary>
        /// 净价
        /// </summary>
        public double net_price { get; set; }
 
        /// <summary>
        /// 全价
        /// </summary>
        public double full_price { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
        /// <summary>
        /// 昨收盘价
        /// </summary>
        public double pre_close_price { get; set; }
 
        /// <summary>
        /// 交易端可用数量
        /// </summary>
        public double trade_avail_qty { get; set; }
 
        /// <summary>
        /// 指令端可用数量
        /// </summary>
        public double comm_avail_qty { get; set; }
 
        /// <summary>
        /// 静态可用数量
        /// </summary>
        public double static_avail_qty { get; set; }
 
        /// <summary>
        /// 大宗交易持仓市值
        /// </summary>
        public double block_trade_posi_market_value { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 公允价格
        /// </summary>
        public double fair_price { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 债券利率类型
        /// </summary>
        public int bond_rate_type { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 质押比例
        /// </summary>
        public double impawn_ratio { get; set; }
 
   }
 
   //逻辑_报表_资管报表_交易组当日成交统计查询
   public class FuncrptL_4_116Model : BaseModel
   {
        /// <summary>
        /// 成交占用金额
        /// </summary>
        public double strike_capt_amt { get; set; }
 
        /// <summary>
        /// 成交释放金额
        /// </summary>
        public double strike_releas_amt { get; set; }
 
   }
 
}
