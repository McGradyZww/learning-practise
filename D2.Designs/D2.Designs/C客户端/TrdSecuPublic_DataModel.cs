using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_交易证券_公用_新增篮子
   public class FunctdsecuL_1_11Model : BaseModel
   {
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
   }
 
   //逻辑_交易证券_公用_查询篮子
   public class FunctdsecuL_1_14Model : BaseModel
   {
        /// <summary>
        /// 篮子名称
        /// </summary>
        public String basket_name { get; set; }
 
        /// <summary>
        /// 权重类型
        /// </summary>
        public int weight_type { get; set; }
 
        /// <summary>
        /// 是否公用
        /// </summary>
        public int is_public { get; set; }
 
        /// <summary>
        /// 成份股个数
        /// </summary>
        public int compos_count { get; set; }
 
        /// <summary>
        /// 篮子状态
        /// </summary>
        public String basket_status { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 现金替代金额
        /// </summary>
        public double cash_replace_amt { get; set; }
 
   }
 
   //逻辑_交易证券_公用_新增篮子成份
   public class FunctdsecuL_1_21Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_交易证券_公用_查询篮子成份
   public class FunctdsecuL_1_24Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 成份数量
        /// </summary>
        public double compos_qty { get; set; }
 
        /// <summary>
        /// 成份比例
        /// </summary>
        public double compos_ratio { get; set; }
 
        /// <summary>
        /// 替代证券代码编号
        /// </summary>
        public int repl_stock_code_no { get; set; }
 
        /// <summary>
        /// 替代数量
        /// </summary>
        public double repl_qty { get; set; }
 
   }
 
   //逻辑_交易证券_公用_数据归历史
   public class FunctdsecuL_1_51Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //逻辑_交易证券_公用_数据归档
   public class FunctdsecuL_1_54Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //逻辑_交易证券_公用_获取业务记录编号
   public class FunctdsecuL_1_901Model : BaseModel
   {
        /// <summary>
        /// 当前编号
        /// </summary>
        public ulong curr_no { get; set; }
 
   }
 
   //逻辑_交易证券_公用_新增组合
   public class FunctdsecuL_1_31Model : BaseModel
   {
        /// <summary>
        /// 组合序号
        /// </summary>
        public ulong combo_id { get; set; }
 
   }
 
   //逻辑_交易证券_公用_查询组合
   public class FunctdsecuL_1_34Model : BaseModel
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
        /// 组合代码
        /// </summary>
        public String combo_code { get; set; }
 
        /// <summary>
        /// 组合名称
        /// </summary>
        public String comb_name { get; set; }
 
        /// <summary>
        /// 是否公用
        /// </summary>
        public int is_public { get; set; }
 
        /// <summary>
        /// 创建失败有效期
        /// </summary>
        public int create_failure_validity_date { get; set; }
 
        /// <summary>
        /// 创建结束有效期
        /// </summary>
        public int create_end_validity_date { get; set; }
 
        /// <summary>
        /// 再平衡失败有效期
        /// </summary>
        public int rebalance_failure_validity_date { get; set; }
 
        /// <summary>
        /// 再平衡结束有效期
        /// </summary>
        public int rebalance_end_validity_date { get; set; }
 
        /// <summary>
        /// 补单失败有效期
        /// </summary>
        public int repair_failure_validity_date { get; set; }
 
        /// <summary>
        /// 补单结束有效期
        /// </summary>
        public int repair_end_validity_date { get; set; }
 
        /// <summary>
        /// 破坏有效期
        /// </summary>
        public int broke_validity_date { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_公用_新增组合证券
   public class FunctdsecuL_1_35Model : BaseModel
   {
        /// <summary>
        /// 组合证券序号
        /// </summary>
        public ulong combo_stock_id { get; set; }
 
   }
 
   //逻辑_交易证券_公用_查询组合证券
   public class FunctdsecuL_1_38Model : BaseModel
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
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 组合代码
        /// </summary>
        public String combo_code { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 组合比例
        /// </summary>
        public double combo_ratio { get; set; }
 
        /// <summary>
        /// 组合数量
        /// </summary>
        public double combo_qty { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_交易证券_公用_转入产品证券负债明细记录
   public class FunctdsecuL_1_56Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
   //逻辑_交易证券_公用_新增指令自动分发规则
   public class FunctdsecuL_1_40Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_交易证券_公用_查询指令自动分发规则
   public class FunctdsecuL_1_43Model : BaseModel
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
        /// 规则名称
        /// </summary>
        public String rule_name { get; set; }
 
        /// <summary>
        /// 优先级
        /// </summary>
        public int prior_type { get; set; }
 
        /// <summary>
        /// 交易组编号串
        /// </summary>
        public String exch_group_no_str { get; set; }
 
        /// <summary>
        /// 市场编号串
        /// </summary>
        public String exch_no_str { get; set; }
 
        /// <summary>
        /// 证券类型串
        /// </summary>
        public String stock_type_str { get; set; }
 
        /// <summary>
        /// 证券代码串
        /// </summary>
        public String stock_code_str { get; set; }
 
        /// <summary>
        /// 操作员编号串
        /// </summary>
        public String opor_no_str { get; set; }
 
        /// <summary>
        /// 指令自动分发同券分发给上次分发的交易员
        /// </summary>
        public int distribute_last_trader { get; set; }
 
        /// <summary>
        /// 指令自动分发按工作量分发
        /// </summary>
        public int distribute_by_jobs { get; set; }
 
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
