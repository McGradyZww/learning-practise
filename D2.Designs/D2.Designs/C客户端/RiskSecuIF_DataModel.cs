using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_风控证券_接口_查询风控服务器资产账户资产
   public class FuncrksecuL_5_21Model : BaseModel
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 总现金资产
        /// </summary>
        public double total_cash_asset { get; set; }
 
        /// <summary>
        /// 证券现金资产
        /// </summary>
        public double stock_cash_asset { get; set; }
 
        /// <summary>
        /// 期货现金资产
        /// </summary>
        public double futu_cash_asset { get; set; }
 
        /// <summary>
        /// 股票资产
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// 基金资产
        /// </summary>
        public double fund_asset { get; set; }
 
        /// <summary>
        /// 货币基金资产
        /// </summary>
        public double money_fund_asset { get; set; }
 
        /// <summary>
        /// 非货币基金资产
        /// </summary>
        public double not_money_fund_asset { get; set; }
 
        /// <summary>
        /// 债券资产
        /// </summary>
        public double bond_asset { get; set; }
 
        /// <summary>
        /// 期货资产
        /// </summary>
        public double futu_asset { get; set; }
 
        /// <summary>
        /// 回购资产
        /// </summary>
        public double repo_asset { get; set; }
 
        /// <summary>
        /// 港股通资产
        /// </summary>
        public double hk_thrgh_stock_asset { get; set; }
 
        /// <summary>
        /// 期货多头市值
        /// </summary>
        public double futu_long_market_value { get; set; }
 
        /// <summary>
        /// 期货空头市值
        /// </summary>
        public double futu_short_market_value { get; set; }
 
   }
 
   //逻辑_风控证券_接口_单条检查客户风险
   public class FuncrksecuL_5_22Model : BaseModel
   {
        /// <summary>
        /// 合规触警序号
        /// </summary>
        public ulong compli_trig_id { get; set; }
 
   }
 
}
