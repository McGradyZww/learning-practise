using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_清算外盘期货_公用_查询处理记录序号
   public class FuncclfofuL_1_4Model : BaseModel
   {
        /// <summary>
        /// 系统业务
        /// </summary>
        public int sys_busin { get; set; }
 
        /// <summary>
        /// 清算数据来源
        /// </summary>
        public int clear_data_source { get; set; }
 
        /// <summary>
        /// 清算处理日期
        /// </summary>
        public int clear_date { get; set; }
 
        /// <summary>
        /// 清算处理序号
        /// </summary>
        public ulong clear_deal_id { get; set; }
 
        /// <summary>
        /// 清算结算数据状态
        /// </summary>
        public String sett_clear_status { get; set; }
 
   }
 
   //逻辑_清算外盘期货_公用_查询处理流程统计数据
   public class FuncclfofuL_1_43Model : BaseModel
   {
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 清算步骤
        /// </summary>
        public int sett_flow_step { get; set; }
 
        /// <summary>
        /// 总记录数
        /// </summary>
        public int total_count { get; set; }
 
        /// <summary>
        /// 总金额
        /// </summary>
        public double total_amt { get; set; }
 
        /// <summary>
        /// 已处理记录数
        /// </summary>
        public int total_succ_count { get; set; }
 
        /// <summary>
        /// 已处理金额
        /// </summary>
        public double total_succ_amt { get; set; }
 
        /// <summary>
        /// 未处理记录数
        /// </summary>
        public int total_fail_count { get; set; }
 
        /// <summary>
        /// 未处理金额
        /// </summary>
        public double total_fail_amt { get; set; }
 
   }
 
   //逻辑_清算外盘期货_公用_数据归历史定时任务
   public class FuncclfofuL_1_51Model : BaseModel
   {
        /// <summary>
        /// 任务执行状态
        /// </summary>
        public String task_strike_status { get; set; }
 
   }
 
}
