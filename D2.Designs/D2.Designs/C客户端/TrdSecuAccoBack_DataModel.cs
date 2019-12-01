using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_交易证券_账户运维_查询资产账户持仓
   public class FunctdsecuL_12_88Model : BaseModel
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
 
}
