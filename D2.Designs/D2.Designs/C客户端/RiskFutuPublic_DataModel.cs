using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_风控期货_公用_查询风险规则记录
   public class FuncrkfutuL_1_4Model : BaseModel
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
        /// 风险规则类别
        /// </summary>
        public int risk_rule_type { get; set; }
 
        /// <summary>
        /// 风险规则名称
        /// </summary>
        public String risk_rule_name { get; set; }
 
        /// <summary>
        /// 风险规则代码
        /// </summary>
        public String risk_rule_code { get; set; }
 
        /// <summary>
        /// 风险要素串
        /// </summary>
        public String risk_param_str { get; set; }
 
        /// <summary>
        /// 对应插件
        /// </summary>
        public String corrsp_plug { get; set; }
 
   }
 
   //逻辑_风控期货_公用_增加风险条目记录
   public class FuncrkfutuL_1_5Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_风控期货_公用_查询风险条目记录
   public class FuncrkfutuL_1_9Model : BaseModel
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
        /// 风险条目名称
        /// </summary>
        public String risk_item_name { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 合约类型
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// 订单方向串
        /// </summary>
        public String order_dir_str { get; set; }
 
        /// <summary>
        /// 触发阶段类型
        /// </summary>
        public int trig_stage_type { get; set; }
 
        /// <summary>
        /// 合规计算层级
        /// </summary>
        public int compli_calc_level { get; set; }
 
        /// <summary>
        /// 单位净值标志
        /// </summary>
        public int unit_nav_flag { get; set; }
 
        /// <summary>
        /// 触发方向
        /// </summary>
        public int trig_type { get; set; }
 
        /// <summary>
        /// 风险规则序号
        /// </summary>
        public int risk_rule_id { get; set; }
 
        /// <summary>
        /// 风险规则类别
        /// </summary>
        public int risk_rule_type { get; set; }
 
        /// <summary>
        /// 风险规则名称
        /// </summary>
        public String risk_rule_name { get; set; }
 
        /// <summary>
        /// 风险规则代码
        /// </summary>
        public String risk_rule_code { get; set; }
 
        /// <summary>
        /// 风险要素串
        /// </summary>
        public String risk_param_str { get; set; }
 
        /// <summary>
        /// 风险规则值串
        /// </summary>
        public String risk_rule_value_str { get; set; }
 
        /// <summary>
        /// 对应插件
        /// </summary>
        public String corrsp_plug { get; set; }
 
        /// <summary>
        /// 风险采取行为
        /// </summary>
        public String risk_rule_action { get; set; }
 
        /// <summary>
        /// 开始时间
        /// </summary>
        public int begin_time { get; set; }
 
        /// <summary>
        /// 结束时间
        /// </summary>
        public int end_time { get; set; }
 
        /// <summary>
        /// 启用标志
        /// </summary>
        public int rule_flag { get; set; }
 
   }
 
   //逻辑_风控期货_公用_查询风险模板记录
   public class FuncrkfutuL_1_13Model : BaseModel
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
        /// 模板名称
        /// </summary>
        public String model_name { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_风控期货_公用_查询风险模板条目记录
   public class FuncrkfutuL_1_16Model : BaseModel
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
        /// 模板序号
        /// </summary>
        public ulong model_id { get; set; }
 
        /// <summary>
        /// 风险条目序号
        /// </summary>
        public int risk_item_id { get; set; }
 
        /// <summary>
        /// 风险规则类别
        /// </summary>
        public int risk_rule_type { get; set; }
 
        /// <summary>
        /// 风险条目名称
        /// </summary>
        public String risk_item_name { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 合约类型
        /// </summary>
        public int contrc_type { get; set; }
 
        /// <summary>
        /// 订单方向串
        /// </summary>
        public String order_dir_str { get; set; }
 
        /// <summary>
        /// 触发阶段类型
        /// </summary>
        public int trig_stage_type { get; set; }
 
        /// <summary>
        /// 合规计算层级
        /// </summary>
        public int compli_calc_level { get; set; }
 
        /// <summary>
        /// 单位净值标志
        /// </summary>
        public int unit_nav_flag { get; set; }
 
        /// <summary>
        /// 触发方向
        /// </summary>
        public int trig_type { get; set; }
 
        /// <summary>
        /// 风险规则值串
        /// </summary>
        public String risk_rule_value_str { get; set; }
 
        /// <summary>
        /// 风险要素串
        /// </summary>
        public String risk_param_str { get; set; }
 
        /// <summary>
        /// 风险采取行为
        /// </summary>
        public String risk_rule_action { get; set; }
 
        /// <summary>
        /// 开始时间
        /// </summary>
        public int begin_time { get; set; }
 
        /// <summary>
        /// 结束时间
        /// </summary>
        public int end_time { get; set; }
 
        /// <summary>
        /// 启用标志
        /// </summary>
        public int rule_flag { get; set; }
 
   }
 
   //逻辑_风控期货_公用_期货数据归历史
   public class FuncrkfutuL_1_17Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
}
