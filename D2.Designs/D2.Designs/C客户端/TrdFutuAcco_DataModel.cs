using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_交易期货_账户_计算交易组资金可用
   public class FunctdfutuL_2_1Model : BaseModel
   {
        /// <summary>
        /// 指令端可用金额
        /// </summary>
        public double comm_avail_amt { get; set; }
 
        /// <summary>
        /// 交易端可用金额
        /// </summary>
        public double trade_avail_amt { get; set; }
 
        /// <summary>
        /// 静态可用金额
        /// </summary>
        public double static_avail_amt { get; set; }
 
   }
 
   //逻辑_交易期货_账户_计算资产账户资金可用
   public class FunctdfutuL_2_2Model : BaseModel
   {
        /// <summary>
        /// 指令端可用金额
        /// </summary>
        public double comm_avail_amt { get; set; }
 
        /// <summary>
        /// 交易端可用金额
        /// </summary>
        public double trade_avail_amt { get; set; }
 
        /// <summary>
        /// 静态可用金额
        /// </summary>
        public double static_avail_amt { get; set; }
 
   }
 
   //逻辑_交易期货_账户_计算交易组持仓可用
   public class FunctdfutuL_2_3Model : BaseModel
   {
        /// <summary>
        /// 指令端可用数量
        /// </summary>
        public double comm_avail_qty { get; set; }
 
        /// <summary>
        /// 交易端可用数量
        /// </summary>
        public double trade_avail_qty { get; set; }
 
        /// <summary>
        /// 静态可用数量
        /// </summary>
        public double static_avail_qty { get; set; }
 
   }
 
   //逻辑_交易期货_账户_计算资产账户持仓可用
   public class FunctdfutuL_2_4Model : BaseModel
   {
        /// <summary>
        /// 指令端可用数量
        /// </summary>
        public double comm_avail_qty { get; set; }
 
        /// <summary>
        /// 交易端可用数量
        /// </summary>
        public double trade_avail_qty { get; set; }
 
        /// <summary>
        /// 静态可用数量
        /// </summary>
        public double static_avail_qty { get; set; }
 
   }
 
   //逻辑_交易期货_账户_查询交易组资金
   public class FunctdfutuL_2_5Model : BaseModel
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
        /// 占用保证金
        /// </summary>
        public double capt_margin { get; set; }
 
        /// <summary>
        /// 交易费用
        /// </summary>
        public double trade_fee { get; set; }
 
        /// <summary>
        /// 成交费用
        /// </summary>
        public double strike_fee { get; set; }
 
        /// <summary>
        /// 平仓盈亏
        /// </summary>
        public double close_pandl { get; set; }
 
        /// <summary>
        /// 盯市盈亏
        /// </summary>
        public double marked_pandl { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易期货_账户_查询资产账户资金
   public class FunctdfutuL_2_6Model : BaseModel
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
        /// 占用保证金
        /// </summary>
        public double capt_margin { get; set; }
 
        /// <summary>
        /// 交易费用
        /// </summary>
        public double trade_fee { get; set; }
 
        /// <summary>
        /// 成交费用
        /// </summary>
        public double strike_fee { get; set; }
 
        /// <summary>
        /// 平仓盈亏
        /// </summary>
        public double close_pandl { get; set; }
 
        /// <summary>
        /// 盯市盈亏
        /// </summary>
        public double marked_pandl { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易期货_账户_查询交易组持仓
   public class FunctdfutuL_2_7Model : BaseModel
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
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
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
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// 组合编码
        /// </summary>
        public String comb_code { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 指令释放数量
        /// </summary>
        public double comm_releas_qty { get; set; }
 
        /// <summary>
        /// 交易释放数量
        /// </summary>
        public double trade_releas_qty { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 老仓指令占用数量
        /// </summary>
        public double pre_comm_capt_qty { get; set; }
 
        /// <summary>
        /// 今仓指令占用数量
        /// </summary>
        public double today_comm_capt_qty { get; set; }
 
        /// <summary>
        /// 老仓交易占用数量
        /// </summary>
        public double old_trade_capt_qty { get; set; }
 
        /// <summary>
        /// 今仓交易占用数量
        /// </summary>
        public double today_trade_capt_qty { get; set; }
 
        /// <summary>
        /// 老仓成交占用数量
        /// </summary>
        public double pre_strike_capt_qty { get; set; }
 
        /// <summary>
        /// 今仓成交占用数量
        /// </summary>
        public double today_strike_capt_qty { get; set; }
 
        /// <summary>
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// 昨结算价
        /// </summary>
        public double pre_settle_price { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 开仓金额
        /// </summary>
        public double open_amount { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易期货_账户_查询资产账户持仓
   public class FunctdfutuL_2_8Model : BaseModel
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
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
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
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// 组合编码
        /// </summary>
        public String comb_code { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 交易释放数量
        /// </summary>
        public double trade_releas_qty { get; set; }
 
        /// <summary>
        /// 成交释放数量
        /// </summary>
        public double strike_releas_qty { get; set; }
 
        /// <summary>
        /// 老仓交易占用数量
        /// </summary>
        public double old_trade_capt_qty { get; set; }
 
        /// <summary>
        /// 今仓交易占用数量
        /// </summary>
        public double today_trade_capt_qty { get; set; }
 
        /// <summary>
        /// 老仓成交占用数量
        /// </summary>
        public double pre_strike_capt_qty { get; set; }
 
        /// <summary>
        /// 今仓成交占用数量
        /// </summary>
        public double today_strike_capt_qty { get; set; }
 
        /// <summary>
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// 昨结算价
        /// </summary>
        public double pre_settle_price { get; set; }
 
        /// <summary>
        /// 开仓金额
        /// </summary>
        public double open_amount { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易期货_账户_查询交易组持仓明细
   public class FunctdfutuL_2_9Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 明细持仓序号
        /// </summary>
        public ulong detail_posi_id { get; set; }
 
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
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 多空类型
        /// </summary>
        public int lngsht_type { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// 开仓日期
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// 开仓时间
        /// </summary>
        public int open_posi_time { get; set; }
 
        /// <summary>
        /// 成交编号
        /// </summary>
        public String strike_no { get; set; }
 
        /// <summary>
        /// 开仓价格
        /// </summary>
        public double open_posi_price { get; set; }
 
        /// <summary>
        /// 开仓数量
        /// </summary>
        public double open_posi_qty { get; set; }
 
        /// <summary>
        /// 开仓金额
        /// </summary>
        public double open_amount { get; set; }
 
        /// <summary>
        /// 交易占用数量
        /// </summary>
        public double trade_capt_qty { get; set; }
 
        /// <summary>
        /// 成交占用数量
        /// </summary>
        public double strike_capt_qty { get; set; }
 
        /// <summary>
        /// 开仓费用
        /// </summary>
        public double open_posi_fee { get; set; }
 
        /// <summary>
        /// 平仓费用
        /// </summary>
        public double close_posi_fee { get; set; }
 
        /// <summary>
        /// 盯市结算价格
        /// </summary>
        public double marked_sett_price { get; set; }
 
        /// <summary>
        /// 盯市盈亏
        /// </summary>
        public double marked_pandl { get; set; }
 
        /// <summary>
        /// 平仓盈亏
        /// </summary>
        public double close_pandl { get; set; }
 
        /// <summary>
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易期货_账户_查询历史交易组业务资金
   public class FunctdfutuL_2_10Model : BaseModel
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
        /// 占用保证金
        /// </summary>
        public double capt_margin { get; set; }
 
        /// <summary>
        /// 交易费用
        /// </summary>
        public double trade_fee { get; set; }
 
        /// <summary>
        /// 成交费用
        /// </summary>
        public double strike_fee { get; set; }
 
        /// <summary>
        /// 平仓盈亏
        /// </summary>
        public double close_pandl { get; set; }
 
        /// <summary>
        /// 盯市盈亏
        /// </summary>
        public double marked_pandl { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
}
