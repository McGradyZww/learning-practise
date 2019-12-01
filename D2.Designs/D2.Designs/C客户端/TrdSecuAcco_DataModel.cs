using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_交易证券_账户_计算交易组资金可用
   public class FunctdsecuL_2_1Model : BaseModel
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
 
   //逻辑_交易证券_账户_计算资产账户资金可用
   public class FunctdsecuL_2_2Model : BaseModel
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
 
   //逻辑_交易证券_账户_计算交易组持仓可用
   public class FunctdsecuL_2_3Model : BaseModel
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
 
   //逻辑_交易证券_账户_计算资产账户持仓可用
   public class FunctdsecuL_2_4Model : BaseModel
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
 
   //逻辑_交易证券_账户_查询交易组资金
   public class FunctdsecuL_2_5Model : BaseModel
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
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询资产账户资金
   public class FunctdsecuL_2_6Model : BaseModel
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
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询交易组持仓
   public class FunctdsecuL_2_7Model : BaseModel
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
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询资产账户持仓
   public class FunctdsecuL_2_8Model : BaseModel
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
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询交易组债券质押
   public class FunctdsecuL_2_33Model : BaseModel
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
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 提交质押数量
        /// </summary>
        public double put_impawn_qty { get; set; }
 
        /// <summary>
        /// 转回质押数量
        /// </summary>
        public double get_impawn_qty { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询资产账户债券质押
   public class FunctdsecuL_2_34Model : BaseModel
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
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 提交质押数量
        /// </summary>
        public double put_impawn_qty { get; set; }
 
        /// <summary>
        /// 转回质押数量
        /// </summary>
        public double get_impawn_qty { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询交易组债券质押转回可用
   public class FunctdsecuL_2_37Model : BaseModel
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
        /// 指令端转回可用数量
        /// </summary>
        public double comm_reback_avail_qty { get; set; }
 
        /// <summary>
        /// 交易端转回可用数量
        /// </summary>
        public double trade_reback_avail_qty { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询交易组债券回购
   public class FunctdsecuL_2_43Model : BaseModel
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
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 回购数量
        /// </summary>
        public double repo_qty { get; set; }
 
        /// <summary>
        /// 回购金额
        /// </summary>
        public double repo_amt { get; set; }
 
        /// <summary>
        /// 回购利率
        /// </summary>
        public double repo_rate { get; set; }
 
        /// <summary>
        /// 回购交易日期
        /// </summary>
        public int repo_trade_date { get; set; }
 
        /// <summary>
        /// 回购委托序号
        /// </summary>
        public ulong repo_order_id { get; set; }
 
        /// <summary>
        /// 回购成交序号
        /// </summary>
        public ulong repo_strike_id { get; set; }
 
        /// <summary>
        /// 回购天数
        /// </summary>
        public int repo_days { get; set; }
 
        /// <summary>
        /// 回购实际天数
        /// </summary>
        public int repo_cale_days { get; set; }
 
        /// <summary>
        /// 回购到期日期
        /// </summary>
        public int repo_back_date { get; set; }
 
        /// <summary>
        /// 回购购回金额
        /// </summary>
        public double repo_back_amt { get; set; }
 
        /// <summary>
        /// 回购购回利息
        /// </summary>
        public double repo_back_intrst { get; set; }
 
        /// <summary>
        /// 实际回购到期日期
        /// </summary>
        public int repo_back_trade_date { get; set; }
 
        /// <summary>
        /// 回购处理状态
        /// </summary>
        public String repo_status { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询组合持仓
   public class FunctdsecuL_2_44Model : BaseModel
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
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 组合代码
        /// </summary>
        public String combo_code { get; set; }
 
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
        /// 开仓日期
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 待交收数量
        /// </summary>
        public double pre_settle_qty { get; set; }
 
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
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询历史组合持仓
   public class FunctdsecuL_2_45Model : BaseModel
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
        /// 组合代码
        /// </summary>
        public String combo_code { get; set; }
 
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
        /// 开仓日期
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 待交收数量
        /// </summary>
        public double pre_settle_qty { get; set; }
 
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
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询组合收益
   public class FunctdsecuL_2_46Model : BaseModel
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
        /// 开仓日期
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// 组合代码
        /// </summary>
        public String combo_code { get; set; }
 
        /// <summary>
        /// 组合份数
        /// </summary>
        public double combo_copies { get; set; }
 
        /// <summary>
        /// 组合状态
        /// </summary>
        public String combo_status { get; set; }
 
        /// <summary>
        /// 组合成本
        /// </summary>
        public double combo_cost { get; set; }
 
        /// <summary>
        /// 组合市值
        /// </summary>
        public double combo_market_value { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询历史组合收益
   public class FunctdsecuL_2_47Model : BaseModel
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
        /// 开仓日期
        /// </summary>
        public int open_posi_date { get; set; }
 
        /// <summary>
        /// 组合代码
        /// </summary>
        public String combo_code { get; set; }
 
        /// <summary>
        /// 组合份数
        /// </summary>
        public double combo_copies { get; set; }
 
        /// <summary>
        /// 组合状态
        /// </summary>
        public String combo_status { get; set; }
 
        /// <summary>
        /// 组合成本
        /// </summary>
        public double combo_cost { get; set; }
 
        /// <summary>
        /// 组合市值
        /// </summary>
        public double combo_market_value { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询组合持仓汇总
   public class FunctdsecuL_2_48Model : BaseModel
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
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 组合代码
        /// </summary>
        public String combo_code { get; set; }
 
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
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 待交收数量
        /// </summary>
        public double pre_settle_qty { get; set; }
 
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
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询历史组合持仓汇总
   public class FunctdsecuL_2_49Model : BaseModel
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
        /// 组合代码
        /// </summary>
        public String combo_code { get; set; }
 
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
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 持仓数量
        /// </summary>
        public double posi_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 待交收数量
        /// </summary>
        public double pre_settle_qty { get; set; }
 
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
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询组合收益汇总
   public class FunctdsecuL_2_50Model : BaseModel
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
        /// 组合代码
        /// </summary>
        public String combo_code { get; set; }
 
        /// <summary>
        /// 组合份数
        /// </summary>
        public double combo_copies { get; set; }
 
        /// <summary>
        /// 组合状态
        /// </summary>
        public String combo_status { get; set; }
 
        /// <summary>
        /// 组合成本
        /// </summary>
        public double combo_cost { get; set; }
 
        /// <summary>
        /// 组合市值
        /// </summary>
        public double combo_market_value { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询历史组合收益汇总
   public class FunctdsecuL_2_60Model : BaseModel
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
        /// 组合代码
        /// </summary>
        public String combo_code { get; set; }
 
        /// <summary>
        /// 组合份数
        /// </summary>
        public double combo_copies { get; set; }
 
        /// <summary>
        /// 组合状态
        /// </summary>
        public String combo_status { get; set; }
 
        /// <summary>
        /// 组合成本
        /// </summary>
        public double combo_cost { get; set; }
 
        /// <summary>
        /// 组合市值
        /// </summary>
        public double combo_market_value { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 累计实现盈亏
        /// </summary>
        public double sum_realize_pandl { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询N天期内可赎回数量
   public class FunctdsecuL_2_61Model : BaseModel
   {
        /// <summary>
        /// 统计数量
        /// </summary>
        public double stat_qty { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询交易组融资融券保证金计算结果集
   public class FunctdsecuL_2_64Model : BaseModel
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
        /// 冲抵折算保证金
        /// </summary>
        public double converted_margin { get; set; }
 
        /// <summary>
        /// 融资折算盈亏
        /// </summary>
        public double fina_converted_pandl { get; set; }
 
        /// <summary>
        /// 融券折算盈亏
        /// </summary>
        public double loan_converted_pandl { get; set; }
 
        /// <summary>
        /// 融资占用保证金
        /// </summary>
        public double fina_capt_margin { get; set; }
 
        /// <summary>
        /// 融券占用保证金
        /// </summary>
        public double loan_capt_margin { get; set; }
 
        /// <summary>
        /// 维持担保比例
        /// </summary>
        public double keep_guarantee_ratio { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询资产账户融资融券保证金计算结果集
   public class FunctdsecuL_2_65Model : BaseModel
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
        /// 冲抵折算保证金
        /// </summary>
        public double converted_margin { get; set; }
 
        /// <summary>
        /// 融资折算盈亏
        /// </summary>
        public double fina_converted_pandl { get; set; }
 
        /// <summary>
        /// 融券折算盈亏
        /// </summary>
        public double loan_converted_pandl { get; set; }
 
        /// <summary>
        /// 融资占用保证金
        /// </summary>
        public double fina_capt_margin { get; set; }
 
        /// <summary>
        /// 融券占用保证金
        /// </summary>
        public double loan_capt_margin { get; set; }
 
        /// <summary>
        /// 维持担保比例
        /// </summary>
        public double keep_guarantee_ratio { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询交易组业务资金负债结果集
   public class FunctdsecuL_2_66Model : BaseModel
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
        /// 负债融券卖出成交金额
        /// </summary>
        public double debt_loan_sell_strike_amt { get; set; }
 
        /// <summary>
        /// 负债成交费用
        /// </summary>
        public double debt_strike_fee { get; set; }
 
        /// <summary>
        /// 融券归还成交金额
        /// </summary>
        public double loan_return_strike_amt { get; set; }
 
        /// <summary>
        /// 融券归还订单金额
        /// </summary>
        public double loan_return_order_amt { get; set; }
 
        /// <summary>
        /// 融券归还指令金额
        /// </summary>
        public double loan_return_comm_amt { get; set; }
 
        /// <summary>
        /// 归还成交费用
        /// </summary>
        public double return_strike_fee { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询资产账户业务资金负债结果集
   public class FunctdsecuL_2_67Model : BaseModel
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
        /// 负债融券卖出成交金额
        /// </summary>
        public double debt_loan_sell_strike_amt { get; set; }
 
        /// <summary>
        /// 负债成交费用
        /// </summary>
        public double debt_strike_fee { get; set; }
 
        /// <summary>
        /// 融券归还成交金额
        /// </summary>
        public double loan_return_strike_amt { get; set; }
 
        /// <summary>
        /// 融券归还订单金额
        /// </summary>
        public double loan_return_order_amt { get; set; }
 
        /// <summary>
        /// 融券归还指令金额
        /// </summary>
        public double loan_return_comm_amt { get; set; }
 
        /// <summary>
        /// 归还成交费用
        /// </summary>
        public double return_strike_fee { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询交易组业务持仓负债结果集
   public class FunctdsecuL_2_68Model : BaseModel
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
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
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
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 负债类型
        /// </summary>
        public int debt_type { get; set; }
 
        /// <summary>
        /// 负债融资买入成交数量
        /// </summary>
        public double debt_fina_buy_strike_qty { get; set; }
 
        /// <summary>
        /// 融资归还成交数量
        /// </summary>
        public double fina_return_strike_qty { get; set; }
 
        /// <summary>
        /// 负债融券卖出成交数量
        /// </summary>
        public double debt_loan_sell_strike_qty { get; set; }
 
        /// <summary>
        /// 融券归还成交数量
        /// </summary>
        public double loan_return_strike_qty { get; set; }
 
        /// <summary>
        /// 负债融资买入订单数量
        /// </summary>
        public double debt_fina_buy_order_qty { get; set; }
 
        /// <summary>
        /// 融资归还订单数量
        /// </summary>
        public double fina_return_order_qty { get; set; }
 
        /// <summary>
        /// 负债融券卖出订单数量
        /// </summary>
        public double debt_loan_sell_order_qty { get; set; }
 
        /// <summary>
        /// 融券归还订单数量
        /// </summary>
        public double loan_return_order_qty { get; set; }
 
        /// <summary>
        /// 负债融资买入指令数量
        /// </summary>
        public double debt_fina_buy_comm_qty { get; set; }
 
        /// <summary>
        /// 融资归还指令数量
        /// </summary>
        public double fina_return_comm_qty { get; set; }
 
        /// <summary>
        /// 负债融券卖出指令数量
        /// </summary>
        public double debt_loan_sell_comm_qty { get; set; }
 
        /// <summary>
        /// 融券归还指令数量
        /// </summary>
        public double loan_return_comm_qty { get; set; }
 
        /// <summary>
        /// 负债融资买入成交金额
        /// </summary>
        public double debt_fina_buy_strike_amt { get; set; }
 
        /// <summary>
        /// 融资归还成交金额
        /// </summary>
        public double fina_return_strike_amt { get; set; }
 
        /// <summary>
        /// 负债融券卖出成交金额
        /// </summary>
        public double debt_loan_sell_strike_amt { get; set; }
 
        /// <summary>
        /// 融券归还成交金额
        /// </summary>
        public double loan_return_strike_amt { get; set; }
 
        /// <summary>
        /// 负债融资买入订单金额
        /// </summary>
        public double debt_fina_buy_order_amt { get; set; }
 
        /// <summary>
        /// 融资归还订单金额
        /// </summary>
        public double fina_return_order_amt { get; set; }
 
        /// <summary>
        /// 负债融券卖出订单金额
        /// </summary>
        public double debt_loan_sell_order_amt { get; set; }
 
        /// <summary>
        /// 融券归还订单金额
        /// </summary>
        public double loan_return_order_amt { get; set; }
 
        /// <summary>
        /// 负债融资买入指令金额
        /// </summary>
        public double debt_fina_buy_comm_amt { get; set; }
 
        /// <summary>
        /// 融资归还指令金额
        /// </summary>
        public double fina_return_comm_amt { get; set; }
 
        /// <summary>
        /// 负债融券卖出指令金额
        /// </summary>
        public double debt_loan_sell_comm_amt { get; set; }
 
        /// <summary>
        /// 融券归还指令金额
        /// </summary>
        public double loan_return_comm_amt { get; set; }
 
        /// <summary>
        /// 负债成交费用
        /// </summary>
        public double debt_strike_fee { get; set; }
 
        /// <summary>
        /// 归还成交费用
        /// </summary>
        public double return_strike_fee { get; set; }
 
        /// <summary>
        /// 负债利息
        /// </summary>
        public double debt_interest { get; set; }
 
        /// <summary>
        /// 归还利息金额
        /// </summary>
        public double return_interest_amt { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询资产账户业务持仓负债结果集
   public class FunctdsecuL_2_69Model : BaseModel
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
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
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
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 负债类型
        /// </summary>
        public int debt_type { get; set; }
 
        /// <summary>
        /// 负债融资买入成交数量
        /// </summary>
        public double debt_fina_buy_strike_qty { get; set; }
 
        /// <summary>
        /// 融资归还成交数量
        /// </summary>
        public double fina_return_strike_qty { get; set; }
 
        /// <summary>
        /// 负债融券卖出成交数量
        /// </summary>
        public double debt_loan_sell_strike_qty { get; set; }
 
        /// <summary>
        /// 融券归还成交数量
        /// </summary>
        public double loan_return_strike_qty { get; set; }
 
        /// <summary>
        /// 负债融资买入订单数量
        /// </summary>
        public double debt_fina_buy_order_qty { get; set; }
 
        /// <summary>
        /// 融资归还订单数量
        /// </summary>
        public double fina_return_order_qty { get; set; }
 
        /// <summary>
        /// 负债融券卖出订单数量
        /// </summary>
        public double debt_loan_sell_order_qty { get; set; }
 
        /// <summary>
        /// 融券归还订单数量
        /// </summary>
        public double loan_return_order_qty { get; set; }
 
        /// <summary>
        /// 负债融资买入指令数量
        /// </summary>
        public double debt_fina_buy_comm_qty { get; set; }
 
        /// <summary>
        /// 融资归还指令数量
        /// </summary>
        public double fina_return_comm_qty { get; set; }
 
        /// <summary>
        /// 负债融券卖出指令数量
        /// </summary>
        public double debt_loan_sell_comm_qty { get; set; }
 
        /// <summary>
        /// 融券归还指令数量
        /// </summary>
        public double loan_return_comm_qty { get; set; }
 
        /// <summary>
        /// 负债融资买入成交金额
        /// </summary>
        public double debt_fina_buy_strike_amt { get; set; }
 
        /// <summary>
        /// 融资归还成交金额
        /// </summary>
        public double fina_return_strike_amt { get; set; }
 
        /// <summary>
        /// 负债融券卖出成交金额
        /// </summary>
        public double debt_loan_sell_strike_amt { get; set; }
 
        /// <summary>
        /// 融券归还成交金额
        /// </summary>
        public double loan_return_strike_amt { get; set; }
 
        /// <summary>
        /// 负债融资买入订单金额
        /// </summary>
        public double debt_fina_buy_order_amt { get; set; }
 
        /// <summary>
        /// 融资归还订单金额
        /// </summary>
        public double fina_return_order_amt { get; set; }
 
        /// <summary>
        /// 负债融券卖出订单金额
        /// </summary>
        public double debt_loan_sell_order_amt { get; set; }
 
        /// <summary>
        /// 融券归还订单金额
        /// </summary>
        public double loan_return_order_amt { get; set; }
 
        /// <summary>
        /// 负债融资买入指令金额
        /// </summary>
        public double debt_fina_buy_comm_amt { get; set; }
 
        /// <summary>
        /// 融资归还指令金额
        /// </summary>
        public double fina_return_comm_amt { get; set; }
 
        /// <summary>
        /// 负债融券卖出指令金额
        /// </summary>
        public double debt_loan_sell_comm_amt { get; set; }
 
        /// <summary>
        /// 融券归还指令金额
        /// </summary>
        public double loan_return_comm_amt { get; set; }
 
        /// <summary>
        /// 负债成交费用
        /// </summary>
        public double debt_strike_fee { get; set; }
 
        /// <summary>
        /// 归还成交费用
        /// </summary>
        public double return_strike_fee { get; set; }
 
        /// <summary>
        /// 负债利息
        /// </summary>
        public double debt_interest { get; set; }
 
        /// <summary>
        /// 归还利息金额
        /// </summary>
        public double return_interest_amt { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询交易组负债明细结果集
   public class FunctdsecuL_2_70Model : BaseModel
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
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 负债类型
        /// </summary>
        public int debt_type { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 成交费用
        /// </summary>
        public double strike_fee { get; set; }
 
        /// <summary>
        /// 负债订单编号
        /// </summary>
        public int debt_order_no { get; set; }
 
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
        /// 负债金额
        /// </summary>
        public double debt_amt { get; set; }
 
        /// <summary>
        /// 负债数量
        /// </summary>
        public double debt_qty { get; set; }
 
        /// <summary>
        /// 负债费用
        /// </summary>
        public double debt_fee { get; set; }
 
        /// <summary>
        /// 负债利息
        /// </summary>
        public double debt_interest { get; set; }
 
        /// <summary>
        /// 利息积数
        /// </summary>
        public double intrst_base_amt { get; set; }
 
        /// <summary>
        /// 已归还金额
        /// </summary>
        public double debt_return_amt { get; set; }
 
        /// <summary>
        /// 已归还数量
        /// </summary>
        public double debt_return_qty { get; set; }
 
        /// <summary>
        /// 归还利息金额
        /// </summary>
        public double return_interest_amt { get; set; }
 
        /// <summary>
        /// 负债状态
        /// </summary>
        public int debt_status { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_根据操作员查询交易组资金
   public class FunctdsecuL_2_90Model : BaseModel
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
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_账户_根据操作员查询交易组持仓
   public class FunctdsecuL_2_91Model : BaseModel
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
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
   }
 
   //逻辑_交易证券_账户_查询资产账户负债明细结果集
   public class FunctdsecuL_2_92Model : BaseModel
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
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 负债类型
        /// </summary>
        public int debt_type { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 成交费用
        /// </summary>
        public double strike_fee { get; set; }
 
        /// <summary>
        /// 负债订单编号
        /// </summary>
        public int debt_order_no { get; set; }
 
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
        /// 负债金额
        /// </summary>
        public double debt_amt { get; set; }
 
        /// <summary>
        /// 负债数量
        /// </summary>
        public double debt_qty { get; set; }
 
        /// <summary>
        /// 负债费用
        /// </summary>
        public double debt_fee { get; set; }
 
        /// <summary>
        /// 负债利息
        /// </summary>
        public double debt_interest { get; set; }
 
        /// <summary>
        /// 利息积数
        /// </summary>
        public double intrst_base_amt { get; set; }
 
        /// <summary>
        /// 已归还金额
        /// </summary>
        public double debt_return_amt { get; set; }
 
        /// <summary>
        /// 已归还数量
        /// </summary>
        public double debt_return_qty { get; set; }
 
        /// <summary>
        /// 归还利息金额
        /// </summary>
        public double return_interest_amt { get; set; }
 
        /// <summary>
        /// 负债状态
        /// </summary>
        public int debt_status { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
}
