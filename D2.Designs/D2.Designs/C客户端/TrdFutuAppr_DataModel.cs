using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_交易期货_指令_新增指令
   public class FunctdfutuL_3_1Model : BaseModel
   {
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
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
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// 指令金额
        /// </summary>
        public double comm_amt { get; set; }
 
        /// <summary>
        /// 指令状态
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// 指令审批状态
        /// </summary>
        public String comm_appr_status { get; set; }
 
   }
 
   //逻辑_交易期货_指令_审批指令
   public class FunctdfutuL_3_4Model : BaseModel
   {
        /// <summary>
        /// 指令状态
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// 订单序号
        /// </summary>
        public ulong order_id { get; set; }
 
   }
 
   //逻辑_交易期货_指令_分发指令
   public class FunctdfutuL_3_5Model : BaseModel
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
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
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
        /// 指令状态
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// 成交状态
        /// </summary>
        public String strike_status { get; set; }
 
   }
 
   //逻辑_交易期货_指令_查询指令结果集
   public class FunctdfutuL_3_6Model : BaseModel
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
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 开平方向
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
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
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
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
        /// 指令冻结数量
        /// </summary>
        public double comm_frozen_qty { get; set; }
 
        /// <summary>
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// 资金回转天数
        /// </summary>
        public int capit_reback_days { get; set; }
 
        /// <summary>
        /// 持仓回转天数
        /// </summary>
        public int posi_reback_days { get; set; }
 
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
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 组合编码
        /// </summary>
        public String comb_code { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 指令完成标志
        /// </summary>
        public int comm_comple_flag { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易期货_指令_查询历史指令结果集
   public class FunctdfutuL_3_7Model : BaseModel
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
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 开平方向
        /// </summary>
        public int contrc_dir { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
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
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
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
        /// 指令冻结数量
        /// </summary>
        public double comm_frozen_qty { get; set; }
 
        /// <summary>
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// 资金回转天数
        /// </summary>
        public int capit_reback_days { get; set; }
 
        /// <summary>
        /// 持仓回转天数
        /// </summary>
        public int posi_reback_days { get; set; }
 
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
        /// 外部编号
        /// </summary>
        public ulong external_no { get; set; }
 
        /// <summary>
        /// 组合编码
        /// </summary>
        public String comb_code { get; set; }
 
        /// <summary>
        /// 指令操作方式
        /// </summary>
        public String comm_oper_way { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 指令完成标志
        /// </summary>
        public int comm_comple_flag { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易期货_指令_查询指令分发结果集
   public class FunctdfutuL_3_8Model : BaseModel
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
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 合约类型
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// 指令状态
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 分发日期
        /// </summary>
        public int disp_date { get; set; }
 
        /// <summary>
        /// 分发时间
        /// </summary>
        public int disp_time { get; set; }
 
        /// <summary>
        /// 前指令执行人
        /// </summary>
        public int before_comm_executor { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 是否撤单
        /// </summary>
        public int is_withdraw { get; set; }
 
        /// <summary>
        /// 分发方式
        /// </summary>
        public int disp_flag { get; set; }
 
        /// <summary>
        /// 分发说明
        /// </summary>
        public String disp_remark { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易期货_指令_查询历史指令分发结果集
   public class FunctdfutuL_3_9Model : BaseModel
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
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 合约类型
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令批号
        /// </summary>
        public int comm_batch_no { get; set; }
 
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// 指令状态
        /// </summary>
        public String comm_status { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 分发日期
        /// </summary>
        public int disp_date { get; set; }
 
        /// <summary>
        /// 分发时间
        /// </summary>
        public int disp_time { get; set; }
 
        /// <summary>
        /// 前指令执行人
        /// </summary>
        public int before_comm_executor { get; set; }
 
        /// <summary>
        /// 指令执行人
        /// </summary>
        public int comm_executor { get; set; }
 
        /// <summary>
        /// 是否撤单
        /// </summary>
        public int is_withdraw { get; set; }
 
        /// <summary>
        /// 分发方式
        /// </summary>
        public int disp_flag { get; set; }
 
        /// <summary>
        /// 分发说明
        /// </summary>
        public String disp_remark { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易期货_指令_查询指令审批结果集
   public class FunctdfutuL_3_10Model : BaseModel
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
        /// 指令审批日期
        /// </summary>
        public int comm_appr_date { get; set; }
 
        /// <summary>
        /// 指令审批时间
        /// </summary>
        public int comm_appr_time { get; set; }
 
        /// <summary>
        /// 指令审批操作员序号
        /// </summary>
        public int comm_appr_oper_no { get; set; }
 
        /// <summary>
        /// 指令审批操作员
        /// </summary>
        public int comm_appr_oper { get; set; }
 
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
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price { get; set; }
 
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
        /// 指令审批状态
        /// </summary>
        public String comm_appr_status { get; set; }
 
        /// <summary>
        /// 指令审批说明
        /// </summary>
        public String comm_appr_remark { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易期货_指令_查询历史指令审批结果集
   public class FunctdfutuL_3_11Model : BaseModel
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
        /// 指令审批日期
        /// </summary>
        public int comm_appr_date { get; set; }
 
        /// <summary>
        /// 指令审批时间
        /// </summary>
        public int comm_appr_time { get; set; }
 
        /// <summary>
        /// 指令审批操作员序号
        /// </summary>
        public int comm_appr_oper_no { get; set; }
 
        /// <summary>
        /// 指令审批操作员
        /// </summary>
        public int comm_appr_oper { get; set; }
 
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
        /// 合约类型
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// 指令日期
        /// </summary>
        public int comm_date { get; set; }
 
        /// <summary>
        /// 指令序号
        /// </summary>
        public ulong comm_id { get; set; }
 
        /// <summary>
        /// 指令下达人
        /// </summary>
        public int comm_opor { get; set; }
 
        /// <summary>
        /// 指令方向
        /// </summary>
        public int comm_dir { get; set; }
 
        /// <summary>
        /// 指令数量
        /// </summary>
        public double comm_qty { get; set; }
 
        /// <summary>
        /// 指令限价
        /// </summary>
        public double comm_limit_price { get; set; }
 
        /// <summary>
        /// 指令实际限价
        /// </summary>
        public double limit_actual_price { get; set; }
 
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
        /// 指令审批状态
        /// </summary>
        public String comm_appr_status { get; set; }
 
        /// <summary>
        /// 指令审批说明
        /// </summary>
        public String comm_appr_remark { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易期货_指令_查询汇总指令结果集
   public class FunctdfutuL_3_12Model : BaseModel
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
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
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
        /// 开平方向
        /// </summary>
        public int contrc_dir { get; set; }
 
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
        /// 交易币种
        /// </summary>
        public String exch_crncy_type { get; set; }
 
        /// <summary>
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易期货_指令_查询历史汇总指令结果集
   public class FunctdfutuL_3_13Model : BaseModel
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
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
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
        /// 开平方向
        /// </summary>
        public int contrc_dir { get; set; }
 
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
        /// 应收保证金
        /// </summary>
        public double rece_margin { get; set; }
 
        /// <summary>
        /// 套保标志
        /// </summary>
        public int hedge_type { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
}
