using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_交易证券_策略_策略插件上线
   public class FunctdsecuL_11_1Model : BaseModel
   {
        /// <summary>
        /// 策略插件状态
        /// </summary>
        public String strategy_plugin_status { get; set; }
 
   }
 
   //逻辑_交易证券_策略_策略插件下线
   public class FunctdsecuL_11_2Model : BaseModel
   {
        /// <summary>
        /// 策略插件状态
        /// </summary>
        public String strategy_plugin_status { get; set; }
 
   }
 
   //逻辑_交易证券_策略_新增策略
   public class FunctdsecuL_11_11Model : BaseModel
   {
        /// <summary>
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
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
        /// 策略方向
        /// </summary>
        public int strategy_dir { get; set; }
 
        /// <summary>
        /// 价格类型
        /// </summary>
        public int price_type { get; set; }
 
        /// <summary>
        /// 策略时间
        /// </summary>
        public int strategy_time { get; set; }
 
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// 目标策略参数
        /// </summary>
        public String target_strategy_param { get; set; }
 
        /// <summary>
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// 策略操作方式
        /// </summary>
        public String strategy_oper_way { get; set; }
 
   }
 
   //逻辑_交易证券_策略_暂停策略
   public class FunctdsecuL_11_12Model : BaseModel
   {
        /// <summary>
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
        /// <summary>
        /// 原策略序号
        /// </summary>
        public ulong orig_strategy_id { get; set; }
 
        /// <summary>
        /// 策略时间
        /// </summary>
        public int strategy_time { get; set; }
 
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// 目标策略参数
        /// </summary>
        public String target_strategy_param { get; set; }
 
        /// <summary>
        /// 策略控制指令
        /// </summary>
        public String strategy_contr_comm { get; set; }
 
   }
 
   //逻辑_交易证券_策略_重启策略
   public class FunctdsecuL_11_13Model : BaseModel
   {
        /// <summary>
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
        /// <summary>
        /// 原策略序号
        /// </summary>
        public ulong orig_strategy_id { get; set; }
 
        /// <summary>
        /// 策略时间
        /// </summary>
        public int strategy_time { get; set; }
 
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// 目标策略参数
        /// </summary>
        public String target_strategy_param { get; set; }
 
        /// <summary>
        /// 策略控制指令
        /// </summary>
        public String strategy_contr_comm { get; set; }
 
   }
 
   //逻辑_交易证券_策略_撤销策略
   public class FunctdsecuL_11_14Model : BaseModel
   {
        /// <summary>
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
        /// <summary>
        /// 原策略序号
        /// </summary>
        public ulong orig_strategy_id { get; set; }
 
        /// <summary>
        /// 策略时间
        /// </summary>
        public int strategy_time { get; set; }
 
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// 目标策略参数
        /// </summary>
        public String target_strategy_param { get; set; }
 
   }
 
   //逻辑_交易证券_策略_更新策略执行情况
   public class FunctdsecuL_11_15Model : BaseModel
   {
        /// <summary>
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
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
        /// 策略方向
        /// </summary>
        public int strategy_dir { get; set; }
 
        /// <summary>
        /// 策略操作方式
        /// </summary>
        public String strategy_oper_way { get; set; }
 
   }
 
   //逻辑_交易证券_策略_更新策略状态
   public class FunctdsecuL_11_16Model : BaseModel
   {
        /// <summary>
        /// 原策略序号
        /// </summary>
        public ulong orig_strategy_id { get; set; }
 
        /// <summary>
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
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
        /// 策略方向
        /// </summary>
        public int strategy_dir { get; set; }
 
        /// <summary>
        /// 策略状态
        /// </summary>
        public String strategy_status { get; set; }
 
        /// <summary>
        /// 策略操作方式
        /// </summary>
        public String strategy_oper_way { get; set; }
 
   }
 
   //逻辑_交易证券_策略_查询策略
   public class FunctdsecuL_11_101Model : BaseModel
   {
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
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
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
        /// <summary>
        /// 原策略序号
        /// </summary>
        public ulong orig_strategy_id { get; set; }
 
        /// <summary>
        /// 策略执行商
        /// </summary>
        public String strategy_exec_broker { get; set; }
 
        /// <summary>
        /// 策略执行方式
        /// </summary>
        public int strategy_exec_kind { get; set; }
 
        /// <summary>
        /// 策略执行指令串
        /// </summary>
        public String strategy_exec_comm_str { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 股东代码
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 策略方向
        /// </summary>
        public int strategy_dir { get; set; }
 
        /// <summary>
        /// 策略数量
        /// </summary>
        public double strategy_qty { get; set; }
 
        /// <summary>
        /// 资金策略数量
        /// </summary>
        public double cash_strategy_qty { get; set; }
 
        /// <summary>
        /// 策略价格
        /// </summary>
        public double strategy_price { get; set; }
 
        /// <summary>
        /// 价格类型
        /// </summary>
        public int price_type { get; set; }
 
        /// <summary>
        /// 策略有效期限
        /// </summary>
        public int strategy_valid_type { get; set; }
 
        /// <summary>
        /// 策略规则方式
        /// </summary>
        public String strategy_rule_way { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 策略时间
        /// </summary>
        public int strategy_time { get; set; }
 
        /// <summary>
        /// 信用交易方式
        /// </summary>
        public int margin_trade_type { get; set; }
 
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// 目标策略参数
        /// </summary>
        public String target_strategy_param { get; set; }
 
        /// <summary>
        /// 策略控制指令
        /// </summary>
        public String strategy_contr_comm { get; set; }
 
        /// <summary>
        /// 策略状态
        /// </summary>
        public String strategy_status { get; set; }
 
        /// <summary>
        /// 策略处理状态
        /// </summary>
        public String strategy_deal_status { get; set; }
 
        /// <summary>
        /// 策略处理方式
        /// </summary>
        public int strategy_deal_kind { get; set; }
 
        /// <summary>
        /// 策略金额
        /// </summary>
        public double strategy_amt { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 订单金额
        /// </summary>
        public double order_amt { get; set; }
 
        /// <summary>
        /// 撤单数量
        /// </summary>
        public double wtdraw_qty { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// 策略操作方式
        /// </summary>
        public String strategy_oper_way { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// 策略批号
        /// </summary>
        public int strategy_batch_no { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
   }
 
   //逻辑_交易证券_策略_插件查询策略
   public class FunctdsecuL_11_102Model : BaseModel
   {
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
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
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 策略序号
        /// </summary>
        public ulong strategy_id { get; set; }
 
        /// <summary>
        /// 原策略序号
        /// </summary>
        public ulong orig_strategy_id { get; set; }
 
        /// <summary>
        /// 策略执行商
        /// </summary>
        public String strategy_exec_broker { get; set; }
 
        /// <summary>
        /// 策略执行方式
        /// </summary>
        public int strategy_exec_kind { get; set; }
 
        /// <summary>
        /// 策略执行指令串
        /// </summary>
        public String strategy_exec_comm_str { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 股东代码
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 策略方向
        /// </summary>
        public int strategy_dir { get; set; }
 
        /// <summary>
        /// 策略数量
        /// </summary>
        public double strategy_qty { get; set; }
 
        /// <summary>
        /// 资金策略数量
        /// </summary>
        public double cash_strategy_qty { get; set; }
 
        /// <summary>
        /// 策略价格
        /// </summary>
        public double strategy_price { get; set; }
 
        /// <summary>
        /// 价格类型
        /// </summary>
        public int price_type { get; set; }
 
        /// <summary>
        /// 策略有效期限
        /// </summary>
        public int strategy_valid_type { get; set; }
 
        /// <summary>
        /// 策略规则方式
        /// </summary>
        public String strategy_rule_way { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 策略时间
        /// </summary>
        public int strategy_time { get; set; }
 
        /// <summary>
        /// 信用交易方式
        /// </summary>
        public int margin_trade_type { get; set; }
 
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// 目标策略参数
        /// </summary>
        public String target_strategy_param { get; set; }
 
        /// <summary>
        /// 策略控制指令
        /// </summary>
        public String strategy_contr_comm { get; set; }
 
        /// <summary>
        /// 策略状态
        /// </summary>
        public String strategy_status { get; set; }
 
        /// <summary>
        /// 策略处理状态
        /// </summary>
        public String strategy_deal_status { get; set; }
 
        /// <summary>
        /// 策略处理方式
        /// </summary>
        public int strategy_deal_kind { get; set; }
 
        /// <summary>
        /// 策略金额
        /// </summary>
        public double strategy_amt { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 订单金额
        /// </summary>
        public double order_amt { get; set; }
 
        /// <summary>
        /// 撤单数量
        /// </summary>
        public double wtdraw_qty { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// 策略操作方式
        /// </summary>
        public String strategy_oper_way { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 策略批号
        /// </summary>
        public int strategy_batch_no { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_策略_查询策略汇总
   public class FunctdsecuL_11_103Model : BaseModel
   {
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
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
        /// 策略批号
        /// </summary>
        public int strategy_batch_no { get; set; }
 
        /// <summary>
        /// 策略执行商
        /// </summary>
        public String strategy_exec_broker { get; set; }
 
        /// <summary>
        /// 策略执行方式
        /// </summary>
        public int strategy_exec_kind { get; set; }
 
        /// <summary>
        /// 策略执行指令串
        /// </summary>
        public String strategy_exec_comm_str { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 策略方向
        /// </summary>
        public int strategy_dir { get; set; }
 
        /// <summary>
        /// 策略数量
        /// </summary>
        public double strategy_qty { get; set; }
 
        /// <summary>
        /// 资金策略数量
        /// </summary>
        public double cash_strategy_qty { get; set; }
 
        /// <summary>
        /// 策略价格
        /// </summary>
        public double strategy_price { get; set; }
 
        /// <summary>
        /// 价格类型
        /// </summary>
        public int price_type { get; set; }
 
        /// <summary>
        /// 策略金额
        /// </summary>
        public double strategy_amt { get; set; }
 
        /// <summary>
        /// 策略有效期限
        /// </summary>
        public int strategy_valid_type { get; set; }
 
        /// <summary>
        /// 策略规则方式
        /// </summary>
        public String strategy_rule_way { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 策略日期
        /// </summary>
        public int strategy_date { get; set; }
 
        /// <summary>
        /// 信用交易方式
        /// </summary>
        public int margin_trade_type { get; set; }
 
        /// <summary>
        /// 目标策略类型
        /// </summary>
        public String target_strategy_type { get; set; }
 
        /// <summary>
        /// 目标策略参数
        /// </summary>
        public String target_strategy_param { get; set; }
 
        /// <summary>
        /// 策略控制指令
        /// </summary>
        public String strategy_contr_comm { get; set; }
 
        /// <summary>
        /// 策略汇总状态
        /// </summary>
        public String strategy_sum_status { get; set; }
 
        /// <summary>
        /// 策略处理状态
        /// </summary>
        public String strategy_deal_status { get; set; }
 
        /// <summary>
        /// 策略处理方式
        /// </summary>
        public int strategy_deal_kind { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 有效订单数量
        /// </summary>
        public double valid_order_qty { get; set; }
 
        /// <summary>
        /// 订单金额
        /// </summary>
        public double order_amt { get; set; }
 
        /// <summary>
        /// 撤单数量
        /// </summary>
        public double wtdraw_qty { get; set; }
 
        /// <summary>
        /// 有效撤单数量
        /// </summary>
        public double valid_wtdraw_qty { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 撤销数量
        /// </summary>
        public double cancel_qty { get; set; }
 
        /// <summary>
        /// 失败数量
        /// </summary>
        public double faild_qty { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 策略操作方式
        /// </summary>
        public String strategy_oper_way { get; set; }
 
   }
 
}
