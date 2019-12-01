using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_产品证券_融资融券_查询资产账户持仓负债
   public class FuncpdsecuL_21_1Model : BaseModel
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
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
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
        /// 期初负债数量
        /// </summary>
        public double begin_debt_qty { get; set; }
 
        /// <summary>
        /// 当前负债数量
        /// </summary>
        public double curr_debt_qty { get; set; }
 
        /// <summary>
        /// 持仓核对差额
        /// </summary>
        public double posi_qty_check_diff { get; set; }
 
        /// <summary>
        /// 期初负债金额
        /// </summary>
        public double begin_debt_amt { get; set; }
 
        /// <summary>
        /// 当前负债金额
        /// </summary>
        public double curr_debt_amt { get; set; }
 
        /// <summary>
        /// 负债利息金额
        /// </summary>
        public double debt_interest_amt { get; set; }
 
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
 
   }
 
   //逻辑_产品证券_融资融券_查询交易组持仓负债
   public class FuncpdsecuL_21_2Model : BaseModel
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
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
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
        /// 期初负债数量
        /// </summary>
        public double begin_debt_qty { get; set; }
 
        /// <summary>
        /// 当前负债数量
        /// </summary>
        public double curr_debt_qty { get; set; }
 
        /// <summary>
        /// 持仓核对差额
        /// </summary>
        public double posi_qty_check_diff { get; set; }
 
        /// <summary>
        /// 期初负债金额
        /// </summary>
        public double begin_debt_amt { get; set; }
 
        /// <summary>
        /// 当前负债金额
        /// </summary>
        public double curr_debt_amt { get; set; }
 
        /// <summary>
        /// 负债利息金额
        /// </summary>
        public double debt_interest_amt { get; set; }
 
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
 
   }
 
   //逻辑_产品证券_融资融券_查询交易组资金负债
   public class FuncpdsecuL_21_3Model : BaseModel
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
        /// 融券卖出金额
        /// </summary>
        public double loan_sell_amt { get; set; }
 
        /// <summary>
        /// 负债利息金额
        /// </summary>
        public double debt_interest_amt { get; set; }
 
   }
 
   //逻辑_产品证券_融资融券_查询资产账户资金负债
   public class FuncpdsecuL_21_4Model : BaseModel
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
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 期初金额
        /// </summary>
        public double begin_amt { get; set; }
 
        /// <summary>
        /// 融券卖出金额
        /// </summary>
        public double loan_sell_amt { get; set; }
 
        /// <summary>
        /// 负债利息金额
        /// </summary>
        public double debt_interest_amt { get; set; }
 
   }
 
   //逻辑_产品证券_融资融券_查询资产账户负债明细
   public class FuncpdsecuL_21_5Model : BaseModel
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
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
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
        /// 订单编号
        /// </summary>
        public int order_no { get; set; }
 
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
        /// 负债年利率
        /// </summary>
        public double debt_intrst_rate { get; set; }
 
        /// <summary>
        /// 期初负债金额
        /// </summary>
        public double begin_debt_amt { get; set; }
 
        /// <summary>
        /// 期初负债数量
        /// </summary>
        public double begin_debt_qty { get; set; }
 
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
        /// 利息积数更改日期
        /// </summary>
        public int interest_update_date { get; set; }
 
        /// <summary>
        /// 负债截止日期
        /// </summary>
        public int debt_end_date { get; set; }
 
        /// <summary>
        /// 原负债截止日期
        /// </summary>
        public int orign_debt_end_date { get; set; }
 
        /// <summary>
        /// 展期次数
        /// </summary>
        public int defer_times { get; set; }
 
        /// <summary>
        /// 负债归还日期
        /// </summary>
        public int debt_return_date { get; set; }
 
        /// <summary>
        /// 负债状态
        /// </summary>
        public int debt_status { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_产品证券_融资融券_查询交易组负债明细
   public class FuncpdsecuL_21_6Model : BaseModel
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
        /// 订单编号
        /// </summary>
        public int order_no { get; set; }
 
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
        /// 负债年利率
        /// </summary>
        public double debt_intrst_rate { get; set; }
 
        /// <summary>
        /// 期初负债金额
        /// </summary>
        public double begin_debt_amt { get; set; }
 
        /// <summary>
        /// 期初负债数量
        /// </summary>
        public double begin_debt_qty { get; set; }
 
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
        /// 利息积数更改日期
        /// </summary>
        public int interest_update_date { get; set; }
 
        /// <summary>
        /// 负债截止日期
        /// </summary>
        public int debt_end_date { get; set; }
 
        /// <summary>
        /// 原负债截止日期
        /// </summary>
        public int orign_debt_end_date { get; set; }
 
        /// <summary>
        /// 展期次数
        /// </summary>
        public int defer_times { get; set; }
 
        /// <summary>
        /// 负债归还日期
        /// </summary>
        public int debt_return_date { get; set; }
 
        /// <summary>
        /// 负债状态
        /// </summary>
        public int debt_status { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
}
