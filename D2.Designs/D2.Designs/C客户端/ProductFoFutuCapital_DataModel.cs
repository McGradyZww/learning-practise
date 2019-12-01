using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_产品外盘期货_资金_查询交易组资金
   public class FuncpdfofuL_2_37Model : BaseModel
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 期初金额
        /// </summary>
        public double begin_amt { get; set; }
 
        /// <summary>
        /// 当前金额
        /// </summary>
        public double curr_amt { get; set; }
 
        /// <summary>
        /// 占用保证金
        /// </summary>
        public double capt_margin { get; set; }
 
        /// <summary>
        /// 平仓盈亏
        /// </summary>
        public double close_pandl { get; set; }
 
        /// <summary>
        /// 盯市盈亏
        /// </summary>
        public double marked_pandl { get; set; }
 
        /// <summary>
        /// 冻结金额
        /// </summary>
        public double frozen_amt { get; set; }
 
        /// <summary>
        /// 解冻金额
        /// </summary>
        public double unfroz_amt { get; set; }
 
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// 利率
        /// </summary>
        public double intrst_rate { get; set; }
 
        /// <summary>
        /// 利息积数
        /// </summary>
        public double intrst_base_amt { get; set; }
 
        /// <summary>
        /// 待入账利息
        /// </summary>
        public double pre_entry_intrst_amt { get; set; }
 
   }
 
   //逻辑_产品外盘期货_资金_查询历史交易组资金
   public class FuncpdfofuL_2_38Model : BaseModel
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 期初金额
        /// </summary>
        public double begin_amt { get; set; }
 
        /// <summary>
        /// 当前金额
        /// </summary>
        public double curr_amt { get; set; }
 
        /// <summary>
        /// 占用保证金
        /// </summary>
        public double capt_margin { get; set; }
 
        /// <summary>
        /// 平仓盈亏
        /// </summary>
        public double close_pandl { get; set; }
 
        /// <summary>
        /// 盯市盈亏
        /// </summary>
        public double marked_pandl { get; set; }
 
        /// <summary>
        /// 冻结金额
        /// </summary>
        public double frozen_amt { get; set; }
 
        /// <summary>
        /// 解冻金额
        /// </summary>
        public double unfroz_amt { get; set; }
 
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// 利率
        /// </summary>
        public double intrst_rate { get; set; }
 
        /// <summary>
        /// 利息积数
        /// </summary>
        public double intrst_base_amt { get; set; }
 
        /// <summary>
        /// 待入账利息
        /// </summary>
        public double pre_entry_intrst_amt { get; set; }
 
   }
 
   //逻辑_产品外盘期货_资金_查询交易组资金流水
   public class FuncpdfofuL_2_39Model : BaseModel
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
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt { get; set; }
 
        /// <summary>
        /// 变动后金额
        /// </summary>
        public double occur_end_amt { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_产品外盘期货_资金_查询历史交易组资金流水
   public class FuncpdfofuL_2_40Model : BaseModel
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
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt { get; set; }
 
        /// <summary>
        /// 变动后金额
        /// </summary>
        public double occur_end_amt { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_产品外盘期货_资金_查询交易组资金冻结解冻流水
   public class FuncpdfofuL_2_41Model : BaseModel
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
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt { get; set; }
 
        /// <summary>
        /// 到期日期
        /// </summary>
        public int expire_date { get; set; }
 
        /// <summary>
        /// 流水状态
        /// </summary>
        public String jour_status { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_产品外盘期货_资金_查询历史交易组资金冻结解冻流水
   public class FuncpdfofuL_2_42Model : BaseModel
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
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt { get; set; }
 
        /// <summary>
        /// 到期日期
        /// </summary>
        public int expire_date { get; set; }
 
        /// <summary>
        /// 流水状态
        /// </summary>
        public String jour_status { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_产品外盘期货_资金_查询资产账户资金
   public class FuncpdfofuL_2_57Model : BaseModel
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
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 期初金额
        /// </summary>
        public double begin_amt { get; set; }
 
        /// <summary>
        /// 当前金额
        /// </summary>
        public double curr_amt { get; set; }
 
        /// <summary>
        /// 占用保证金
        /// </summary>
        public double capt_margin { get; set; }
 
        /// <summary>
        /// 平仓盈亏
        /// </summary>
        public double close_pandl { get; set; }
 
        /// <summary>
        /// 盯市盈亏
        /// </summary>
        public double marked_pandl { get; set; }
 
        /// <summary>
        /// 冻结金额
        /// </summary>
        public double frozen_amt { get; set; }
 
        /// <summary>
        /// 解冻金额
        /// </summary>
        public double unfroz_amt { get; set; }
 
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// 利率
        /// </summary>
        public double intrst_rate { get; set; }
 
        /// <summary>
        /// 利息积数
        /// </summary>
        public double intrst_base_amt { get; set; }
 
        /// <summary>
        /// 待入账利息
        /// </summary>
        public double pre_entry_intrst_amt { get; set; }
 
   }
 
   //逻辑_产品外盘期货_资金_查询历史资产账户资金
   public class FuncpdfofuL_2_58Model : BaseModel
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 期初金额
        /// </summary>
        public double begin_amt { get; set; }
 
        /// <summary>
        /// 当前金额
        /// </summary>
        public double curr_amt { get; set; }
 
        /// <summary>
        /// 占用保证金
        /// </summary>
        public double capt_margin { get; set; }
 
        /// <summary>
        /// 平仓盈亏
        /// </summary>
        public double close_pandl { get; set; }
 
        /// <summary>
        /// 盯市盈亏
        /// </summary>
        public double marked_pandl { get; set; }
 
        /// <summary>
        /// 冻结金额
        /// </summary>
        public double frozen_amt { get; set; }
 
        /// <summary>
        /// 解冻金额
        /// </summary>
        public double unfroz_amt { get; set; }
 
        /// <summary>
        /// 累计应收金额
        /// </summary>
        public double total_rece_amt { get; set; }
 
        /// <summary>
        /// 累计应付金额
        /// </summary>
        public double total_payab_amt { get; set; }
 
        /// <summary>
        /// 利率
        /// </summary>
        public double intrst_rate { get; set; }
 
        /// <summary>
        /// 利息积数
        /// </summary>
        public double intrst_base_amt { get; set; }
 
        /// <summary>
        /// 待入账利息
        /// </summary>
        public double pre_entry_intrst_amt { get; set; }
 
   }
 
   //逻辑_产品外盘期货_资金_查询资产账户资金流水
   public class FuncpdfofuL_2_59Model : BaseModel
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
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt { get; set; }
 
        /// <summary>
        /// 变动后金额
        /// </summary>
        public double occur_end_amt { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_产品外盘期货_资金_查询历史资产账户资金流水
   public class FuncpdfofuL_2_60Model : BaseModel
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
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt { get; set; }
 
        /// <summary>
        /// 变动后金额
        /// </summary>
        public double occur_end_amt { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_产品外盘期货_资金_查询资产账户资金冻结解冻流水
   public class FuncpdfofuL_2_61Model : BaseModel
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
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt { get; set; }
 
        /// <summary>
        /// 到期日期
        /// </summary>
        public int expire_date { get; set; }
 
        /// <summary>
        /// 流水状态
        /// </summary>
        public String jour_status { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_产品外盘期货_资金_查询历史资产账户资金冻结解冻流水
   public class FuncpdfofuL_2_62Model : BaseModel
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
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// 变动金额
        /// </summary>
        public double occur_amt { get; set; }
 
        /// <summary>
        /// 到期日期
        /// </summary>
        public int expire_date { get; set; }
 
        /// <summary>
        /// 流水状态
        /// </summary>
        public String jour_status { get; set; }
 
        /// <summary>
        /// 操作备注
        /// </summary>
        public String oper_remark_info { get; set; }
 
   }
 
   //逻辑_产品外盘期货_资金_查询外部外盘期货资金流水记录
   public class FuncpdfofuL_2_108Model : BaseModel
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
        /// 通道资金流水号
        /// </summary>
        public ulong pass_money_jour_no { get; set; }
 
        /// <summary>
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
        /// <summary>
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 入账金额
        /// </summary>
        public double entry_amt { get; set; }
 
        /// <summary>
        /// 入账后金额
        /// </summary>
        public double entry_end_amt { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 交易编码
        /// </summary>
        public String futu_acco { get; set; }
 
        /// <summary>
        /// 合约代码
        /// </summary>
        public String contrc_code { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 处理标志
        /// </summary>
        public int deal_flag { get; set; }
 
   }
 
   //逻辑_产品外盘期货_资金_查询清算资金统计数据
   public class FuncpdfofuL_2_202Model : BaseModel
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
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count { get; set; }
 
        /// <summary>
        /// 当前金额
        /// </summary>
        public double curr_amt { get; set; }
 
   }
 
}
