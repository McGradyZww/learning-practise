using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_公共_公共接口_获取上一交易日期
   public class FuncpubL_24_1Model : BaseModel
   {
        /// <summary>
        /// 上日初始化日期
        /// </summary>
        public int last_init_date { get; set; }
 
   }
 
   //逻辑_公共_公共接口_获取操作员操作权限串
   public class FuncpubL_24_2Model : BaseModel
   {
        /// <summary>
        /// 机构编号权限串
        /// </summary>
        public String co_no_rights_str { get; set; }
 
        /// <summary>
        /// 产品编号权限串
        /// </summary>
        public String pd_no_rights_str { get; set; }
 
        /// <summary>
        /// 交易组编号权限串
        /// </summary>
        public String exch_group_no_rights_str { get; set; }
 
   }
 
}
