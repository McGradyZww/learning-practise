using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_交易证券_交易运维_查询指令
   public class FunctdsecuL_10_31Model : BaseModel
   {
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
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
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
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令时间
        /// </summary>
        public int comm_time { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 指令撤销数量
        /// </summary>
        public double comm_cancel_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 指令冻结金额
        /// </summary>
        public double comm_frozen_amt { get; set; }
 
        /// <summary>
        /// 指令冻结数量
        /// </summary>
        public double comm_frozen_qty { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 成交状态
        /// </summary>
        public String strike_status { get; set; }
 
        /// <summary>
        /// 指令状态
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// 指令完成日期
        /// </summary>
        public int comm_comple_date { get; set; }
 
        /// <summary>
        /// 指令完成时间
        /// </summary>
        public int comm_comple_time { get; set; }
 
        /// <summary>
        /// 指令审批日期
        /// </summary>
        public int comm_appr_date { get; set; }
 
        /// <summary>
        /// 指令审批时间
        /// </summary>
        public int comm_appr_time { get; set; }
 
        /// <summary>
        /// 指令审批状态
        /// </summary>
        public String comm_appr_status { get; set; }
 
        /// <summary>
        /// 指令审批操作员序号
        /// </summary>
        public int comm_appr_oper_no { get; set; }
 
        /// <summary>
        /// 指令审批操作员
        /// </summary>
        public int comm_appr_oper { get; set; }
 
        /// <summary>
        /// 指令审批说明
        /// </summary>
        public String comm_appr_remark { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// 指令完成标志
        /// </summary>
        public int comm_comple_flag { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询指令历史
   public class FunctdsecuL_10_32Model : BaseModel
   {
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
        /// 操作功能
        /// </summary>
        public String oper_func_code { get; set; }
 
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
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令时间
        /// </summary>
        public int comm_time { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 指令撤销数量
        /// </summary>
        public double comm_cancel_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 指令冻结金额
        /// </summary>
        public double comm_frozen_amt { get; set; }
 
        /// <summary>
        /// 指令冻结数量
        /// </summary>
        public double comm_frozen_qty { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 成交状态
        /// </summary>
        public String strike_status { get; set; }
 
        /// <summary>
        /// 指令状态
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// 指令完成日期
        /// </summary>
        public int comm_comple_date { get; set; }
 
        /// <summary>
        /// 指令完成时间
        /// </summary>
        public int comm_comple_time { get; set; }
 
        /// <summary>
        /// 指令审批日期
        /// </summary>
        public int comm_appr_date { get; set; }
 
        /// <summary>
        /// 指令审批时间
        /// </summary>
        public int comm_appr_time { get; set; }
 
        /// <summary>
        /// 指令审批状态
        /// </summary>
        public String comm_appr_status { get; set; }
 
        /// <summary>
        /// 指令审批操作员序号
        /// </summary>
        public int comm_appr_oper_no { get; set; }
 
        /// <summary>
        /// 指令审批操作员
        /// </summary>
        public int comm_appr_oper { get; set; }
 
        /// <summary>
        /// 指令审批说明
        /// </summary>
        public String comm_appr_remark { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// 指令完成标志
        /// </summary>
        public int comm_comple_flag { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询订单
   public class FunctdsecuL_10_41Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
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
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
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
        /// 价格类型
        /// </summary>
        public int price_type { get; set; }
 
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 订单状态
        /// </summary>
        public String order_status { get; set; }
 
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
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 订单冻结金额
        /// </summary>
        public double order_frozen_amt { get; set; }
 
        /// <summary>
        /// 订单冻结数量
        /// </summary>
        public double order_frozen_qty { get; set; }
 
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info { get; set; }
 
        /// <summary>
        /// 合规触警序号
        /// </summary>
        public ulong compli_trig_id { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 订单操作方式
        /// </summary>
        public String order_oper_way { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询订单历史
   public class FunctdsecuL_10_42Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
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
        /// 订单批号
        /// </summary>
        public int order_batch_no { get; set; }
 
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id { get; set; }
 
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
        /// 价格类型
        /// </summary>
        public int price_type { get; set; }
 
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 订单状态
        /// </summary>
        public String order_status { get; set; }
 
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
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 订单冻结金额
        /// </summary>
        public double order_frozen_amt { get; set; }
 
        /// <summary>
        /// 订单冻结数量
        /// </summary>
        public double order_frozen_qty { get; set; }
 
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info { get; set; }
 
        /// <summary>
        /// 合规触警序号
        /// </summary>
        public ulong compli_trig_id { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 订单操作方式
        /// </summary>
        public String order_oper_way { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询订单回报
   public class FunctdsecuL_10_51Model : BaseModel
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
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
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
        /// 股东代码
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
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
        /// 订单序号
        /// </summary>
        public ulong order_id { get; set; }
 
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
        /// 价格类型
        /// </summary>
        public int price_type { get; set; }
 
        /// <summary>
        /// 订单回报状态
        /// </summary>
        public String order_rsp_status { get; set; }
 
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info { get; set; }
 
        /// <summary>
        /// 处理状态
        /// </summary>
        public String deal_status { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询成交回报
   public class FunctdsecuL_10_52Model : BaseModel
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
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
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
        /// 股东代码
        /// </summary>
        public String stock_acco { get; set; }
 
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
        /// 申报编号
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
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
        /// 成交处理方式
        /// </summary>
        public int strike_deal_type { get; set; }
 
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info { get; set; }
 
        /// <summary>
        /// 处理状态
        /// </summary>
        public String deal_status { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// 申报日期
        /// </summary>
        public int report_date { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询成交明细
   public class FunctdsecuL_10_53Model : BaseModel
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
 
   }
 
   //逻辑_交易证券_交易运维_查询成交明细历史
   public class FunctdsecuL_10_54Model : BaseModel
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
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 成交债券计提利息
        /// </summary>
        public double strike_bond_accr_intrst { get; set; }
 
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
 
   }
 
   //逻辑_交易证券_交易运维_查询机构统计订单
   public class FunctdsecuL_10_55Model : BaseModel
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
        /// 订单状态
        /// </summary>
        public String order_status { get; set; }
 
        /// <summary>
        /// 订单操作方式
        /// </summary>
        public String order_oper_way { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询机构统计异常订单
   public class FunctdsecuL_10_60Model : BaseModel
   {
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 未报记录数
        /// </summary>
        public int no_report_cnt { get; set; }
 
        /// <summary>
        /// 已报记录数
        /// </summary>
        public int already_report_cnt { get; set; }
 
        /// <summary>
        /// 待报记录数
        /// </summary>
        public int wait_report_cnt { get; set; }
 
        /// <summary>
        /// 待报异常数
        /// </summary>
        public int wait_report_except_cnt { get; set; }
 
        /// <summary>
        /// 正报记录数
        /// </summary>
        public int in_report_cnt { get; set; }
 
        /// <summary>
        /// 正报异常数
        /// </summary>
        public int in_report_except_cnt { get; set; }
 
        /// <summary>
        /// 待撤记录数
        /// </summary>
        public int wait_cancel_cnt { get; set; }
 
        /// <summary>
        /// 待撤异常数
        /// </summary>
        public int wait_cancel_except_cnt { get; set; }
 
        /// <summary>
        /// 部撤记录数
        /// </summary>
        public int part_cancel_cnt { get; set; }
 
        /// <summary>
        /// 已撤记录数
        /// </summary>
        public int all_cancel_cnt { get; set; }
 
        /// <summary>
        /// 部成记录数
        /// </summary>
        public int part_strike_cnt { get; set; }
 
        /// <summary>
        /// 已成记录数
        /// </summary>
        public int all_strike_cnt { get; set; }
 
        /// <summary>
        /// 废单记录数
        /// </summary>
        public int abolish_cnt { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询指令汇总考核
   public class FunctdsecuL_10_61Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令时间
        /// </summary>
        public int comm_time { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 指令撤销数量
        /// </summary>
        public double comm_cancel_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 成交状态
        /// </summary>
        public String strike_status { get; set; }
 
        /// <summary>
        /// 指令汇总状态
        /// </summary>
        public String comm_sum_status { get; set; }
 
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// 指令完成日期
        /// </summary>
        public int comm_comple_date { get; set; }
 
        /// <summary>
        /// 指令完成时间
        /// </summary>
        public int comm_comple_time { get; set; }
 
        /// <summary>
        /// 指令最大完成日期
        /// </summary>
        public int max_comm_comple_date { get; set; }
 
        /// <summary>
        /// 指令最大完成时间
        /// </summary>
        public int max_comm_comple_time { get; set; }
 
        /// <summary>
        /// 指令审批日期
        /// </summary>
        public int comm_appr_date { get; set; }
 
        /// <summary>
        /// 指令审批时间
        /// </summary>
        public int comm_appr_time { get; set; }
 
        /// <summary>
        /// 指令汇总审批状态
        /// </summary>
        public String comm_sum_approve_status { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 买入订单数量
        /// </summary>
        public double buy_order_qty { get; set; }
 
        /// <summary>
        /// 卖出订单数量
        /// </summary>
        public double sell_order_qty { get; set; }
 
        /// <summary>
        /// 买入指令数量
        /// </summary>
        public double buy_comm_qty { get; set; }
 
        /// <summary>
        /// 卖出指令数量
        /// </summary>
        public double sell_comm_qty { get; set; }
 
        /// <summary>
        /// 买入成交数量
        /// </summary>
        public double buy_strike_qty { get; set; }
 
        /// <summary>
        /// 卖出成交数量
        /// </summary>
        public double sell_strike_qty { get; set; }
 
        /// <summary>
        /// 买入成交金额
        /// </summary>
        public double buy_strike_amt { get; set; }
 
        /// <summary>
        /// 卖出成交金额
        /// </summary>
        public double sell_strike_amt { get; set; }
 
        /// <summary>
        /// 买入指令金额
        /// </summary>
        public double buy_comm_amt { get; set; }
 
        /// <summary>
        /// 卖出指令金额
        /// </summary>
        public double sell_comm_amt { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 有效均价
        /// </summary>
        public double valid_aver_price { get; set; }
 
        /// <summary>
        /// 全天有效均价
        /// </summary>
        public double valid_aver_price_allday { get; set; }
 
        /// <summary>
        /// 执行价差
        /// </summary>
        public double exec_price_diff { get; set; }
 
        /// <summary>
        /// 全天执行价差
        /// </summary>
        public double exec_price_diff_allday { get; set; }
 
        /// <summary>
        /// 有效占比
        /// </summary>
        public double valid_ratio { get; set; }
 
        /// <summary>
        /// 全天有效占比
        /// </summary>
        public double valid_ratio_allday { get; set; }
 
        /// <summary>
        /// 有效数量
        /// </summary>
        public double valid_qty { get; set; }
 
        /// <summary>
        /// 全天有效数量
        /// </summary>
        public double valid_qty_allday { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// 指令备注信息
        /// </summary>
        public String comm_remark_info { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询指令汇总考核历史
   public class FunctdsecuL_10_62Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令时间
        /// </summary>
        public int comm_time { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 指令撤销数量
        /// </summary>
        public double comm_cancel_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 成交状态
        /// </summary>
        public String strike_status { get; set; }
 
        /// <summary>
        /// 指令汇总状态
        /// </summary>
        public String comm_sum_status { get; set; }
 
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// 指令完成日期
        /// </summary>
        public int comm_comple_date { get; set; }
 
        /// <summary>
        /// 指令完成时间
        /// </summary>
        public int comm_comple_time { get; set; }
 
        /// <summary>
        /// 指令最大完成日期
        /// </summary>
        public int max_comm_comple_date { get; set; }
 
        /// <summary>
        /// 指令最大完成时间
        /// </summary>
        public int max_comm_comple_time { get; set; }
 
        /// <summary>
        /// 指令审批日期
        /// </summary>
        public int comm_appr_date { get; set; }
 
        /// <summary>
        /// 指令审批时间
        /// </summary>
        public int comm_appr_time { get; set; }
 
        /// <summary>
        /// 指令汇总审批状态
        /// </summary>
        public String comm_sum_approve_status { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 买入订单数量
        /// </summary>
        public double buy_order_qty { get; set; }
 
        /// <summary>
        /// 卖出订单数量
        /// </summary>
        public double sell_order_qty { get; set; }
 
        /// <summary>
        /// 买入指令数量
        /// </summary>
        public double buy_comm_qty { get; set; }
 
        /// <summary>
        /// 卖出指令数量
        /// </summary>
        public double sell_comm_qty { get; set; }
 
        /// <summary>
        /// 买入成交数量
        /// </summary>
        public double buy_strike_qty { get; set; }
 
        /// <summary>
        /// 卖出成交数量
        /// </summary>
        public double sell_strike_qty { get; set; }
 
        /// <summary>
        /// 买入成交金额
        /// </summary>
        public double buy_strike_amt { get; set; }
 
        /// <summary>
        /// 卖出成交金额
        /// </summary>
        public double sell_strike_amt { get; set; }
 
        /// <summary>
        /// 买入指令金额
        /// </summary>
        public double buy_comm_amt { get; set; }
 
        /// <summary>
        /// 卖出指令金额
        /// </summary>
        public double sell_comm_amt { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// 有效均价
        /// </summary>
        public double valid_aver_price { get; set; }
 
        /// <summary>
        /// 全天有效均价
        /// </summary>
        public double valid_aver_price_allday { get; set; }
 
        /// <summary>
        /// 执行价差
        /// </summary>
        public double exec_price_diff { get; set; }
 
        /// <summary>
        /// 全天执行价差
        /// </summary>
        public double exec_price_diff_allday { get; set; }
 
        /// <summary>
        /// 有效占比
        /// </summary>
        public double valid_ratio { get; set; }
 
        /// <summary>
        /// 全天有效占比
        /// </summary>
        public double valid_ratio_allday { get; set; }
 
        /// <summary>
        /// 有效数量
        /// </summary>
        public double valid_qty { get; set; }
 
        /// <summary>
        /// 全天有效数量
        /// </summary>
        public double valid_qty_allday { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// 指令备注信息
        /// </summary>
        public String comm_remark_info { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询所有指令汇总
   public class FunctdsecuL_10_64Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
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
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令时间
        /// </summary>
        public int comm_time { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price { get; set; }
 
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// 订单数量
        /// </summary>
        public double order_qty { get; set; }
 
        /// <summary>
        /// 指令撤销数量
        /// </summary>
        public double comm_cancel_qty { get; set; }
 
        /// <summary>
        /// 成交金额
        /// </summary>
        public double strike_amt { get; set; }
 
        /// <summary>
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 净价标志
        /// </summary>
        public int net_price_flag { get; set; }
 
        /// <summary>
        /// 票面面值
        /// </summary>
        public double par_value { get; set; }
 
        /// <summary>
        /// 债券计提利息
        /// </summary>
        public double bond_accr_intrst { get; set; }
 
        /// <summary>
        /// 成交状态
        /// </summary>
        public String strike_status { get; set; }
 
        /// <summary>
        /// 指令汇总状态
        /// </summary>
        public String comm_sum_status { get; set; }
 
        /// <summary>
        /// 指令开始日期
        /// </summary>
        public int comm_begin_date { get; set; }
 
        /// <summary>
        /// 指令结束日期
        /// </summary>
        public int comm_end_date { get; set; }
 
        /// <summary>
        /// 指令开始时间
        /// </summary>
        public int comm_begin_time { get; set; }
 
        /// <summary>
        /// 指令结束时间
        /// </summary>
        public int comm_end_time { get; set; }
 
        /// <summary>
        /// 指令完成日期
        /// </summary>
        public int comm_comple_date { get; set; }
 
        /// <summary>
        /// 指令完成时间
        /// </summary>
        public int comm_comple_time { get; set; }
 
        /// <summary>
        /// 指令最大完成日期
        /// </summary>
        public int max_comm_comple_date { get; set; }
 
        /// <summary>
        /// 指令最大完成时间
        /// </summary>
        public int max_comm_comple_time { get; set; }
 
        /// <summary>
        /// 指令审批日期
        /// </summary>
        public int comm_appr_date { get; set; }
 
        /// <summary>
        /// 指令审批时间
        /// </summary>
        public int comm_appr_time { get; set; }
 
        /// <summary>
        /// 指令汇总审批状态
        /// </summary>
        public String comm_sum_approve_status { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 买入订单数量
        /// </summary>
        public double buy_order_qty { get; set; }
 
        /// <summary>
        /// 卖出订单数量
        /// </summary>
        public double sell_order_qty { get; set; }
 
        /// <summary>
        /// 买入指令数量
        /// </summary>
        public double buy_comm_qty { get; set; }
 
        /// <summary>
        /// 卖出指令数量
        /// </summary>
        public double sell_comm_qty { get; set; }
 
        /// <summary>
        /// 买入成交数量
        /// </summary>
        public double buy_strike_qty { get; set; }
 
        /// <summary>
        /// 卖出成交数量
        /// </summary>
        public double sell_strike_qty { get; set; }
 
        /// <summary>
        /// 买入成交金额
        /// </summary>
        public double buy_strike_amt { get; set; }
 
        /// <summary>
        /// 卖出成交金额
        /// </summary>
        public double sell_strike_amt { get; set; }
 
        /// <summary>
        /// 买入指令金额
        /// </summary>
        public double buy_comm_amt { get; set; }
 
        /// <summary>
        /// 卖出指令金额
        /// </summary>
        public double sell_comm_amt { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 体外指令标志
        /// </summary>
        public int exter_comm_flag { get; set; }
 
        /// <summary>
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// 指令备注信息
        /// </summary>
        public String comm_remark_info { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询运维订单回报
   public class FunctdsecuL_10_65Model : BaseModel
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
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
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
        /// 股东代码
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
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
        /// 订单序号
        /// </summary>
        public ulong order_id { get; set; }
 
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
        /// 价格类型
        /// </summary>
        public int price_type { get; set; }
 
        /// <summary>
        /// 订单回报状态
        /// </summary>
        public String order_rsp_status { get; set; }
 
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info { get; set; }
 
        /// <summary>
        /// 处理状态
        /// </summary>
        public String deal_status { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询运维成交回报
   public class FunctdsecuL_10_66Model : BaseModel
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
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
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
        /// 股东代码
        /// </summary>
        public String stock_acco { get; set; }
 
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
        /// 申报编号
        /// </summary>
        public String report_no { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
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
        /// 成交处理方式
        /// </summary>
        public int strike_deal_type { get; set; }
 
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info { get; set; }
 
        /// <summary>
        /// 处理状态
        /// </summary>
        public String deal_status { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
        /// <summary>
        /// 申报日期
        /// </summary>
        public int report_date { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询运维成交明细
   public class FunctdsecuL_10_67Model : BaseModel
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
 
   }
 
   //逻辑_交易证券_交易运维_查询报盘信息
   public class FunctdsecuL_10_68Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 报盘类型
        /// </summary>
        public String offer_type { get; set; }
 
        /// <summary>
        /// 报盘标识
        /// </summary>
        public String offer_name { get; set; }
 
        /// <summary>
        /// 报盘服务器名称
        /// </summary>
        public String offer_server_name { get; set; }
 
        /// <summary>
        /// 报盘服务器IP
        /// </summary>
        public String offer_server_ip { get; set; }
 
        /// <summary>
        /// 报盘服务器端口
        /// </summary>
        public int offer_server_port { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询运维撤单流水
   public class FunctdsecuL_10_69Model : BaseModel
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
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
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
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 撤单批号
        /// </summary>
        public int wtdraw_batch_no { get; set; }
 
        /// <summary>
        /// 撤单日期
        /// </summary>
        public int wtdraw_date { get; set; }
 
        /// <summary>
        /// 撤单时间
        /// </summary>
        public int wtdraw_time { get; set; }
 
        /// <summary>
        /// 订单日期
        /// </summary>
        public int order_date { get; set; }
 
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id { get; set; }
 
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
        /// 撤单状态
        /// </summary>
        public String wtdraw_status { get; set; }
 
        /// <summary>
        /// 撤单数量
        /// </summary>
        public double wtdraw_qty { get; set; }
 
        /// <summary>
        /// 撤单说明
        /// </summary>
        public String wtdraw_remark { get; set; }
 
        /// <summary>
        /// 订单价格
        /// </summary>
        public double order_price { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询场外基金成交回报表
   public class FunctdsecuL_10_71Model : BaseModel
   {
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
        /// 股东代码
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 申报日期
        /// </summary>
        public int report_date { get; set; }
 
        /// <summary>
        /// 申报编号
        /// </summary>
        public String report_no { get; set; }
 
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
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
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
        /// 成交处理方式
        /// </summary>
        public int strike_deal_type { get; set; }
 
        /// <summary>
        /// 回报信息
        /// </summary>
        public String rsp_info { get; set; }
 
   }
 
   //逻辑_交易证券_交易运维_查询所有交易组持仓
   public class FunctdsecuL_10_73Model : BaseModel
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
 
}
