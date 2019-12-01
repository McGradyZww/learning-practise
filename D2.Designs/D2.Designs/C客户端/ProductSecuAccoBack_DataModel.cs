using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_产品证券_账户运维_查询全部证券账户
   public class FuncpdsecuL_7_1Model : BaseModel
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
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// 股东代码名称
        /// </summary>
        public String stock_acco_name { get; set; }
 
        /// <summary>
        /// 股东代码状态
        /// </summary>
        public String stock_acco_status { get; set; }
 
        /// <summary>
        /// 股东指定状态
        /// </summary>
        public String stock_acco_apoint_status { get; set; }
 
   }
 
   //逻辑_产品证券_账户运维_新增证券账户信息
   public class FuncpdsecuL_7_18Model : BaseModel
   {
        /// <summary>
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
   }
 
   //逻辑_产品证券_账户运维_查询证券账户信息
   public class FuncpdsecuL_7_19Model : BaseModel
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
        /// 股东代码编号
        /// </summary>
        public int stock_acco_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 股东代码
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// 股东代码名称
        /// </summary>
        public String stock_acco_name { get; set; }
 
        /// <summary>
        /// 股东代码状态
        /// </summary>
        public String stock_acco_status { get; set; }
 
        /// <summary>
        /// 股东指定状态
        /// </summary>
        public String stock_acco_apoint_status { get; set; }
 
        /// <summary>
        /// 允许操作证券类型
        /// </summary>
        public String allow_stock_type { get; set; }
 
        /// <summary>
        /// 业务限制串
        /// </summary>
        public String busi_limit_str { get; set; }
 
        /// <summary>
        /// 登记机构
        /// </summary>
        public String registration_agency { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
}
