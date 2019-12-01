using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_产品证券_持仓_查询交易组持仓
   public class FuncpdsecuL_3_21Model : BaseModel
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
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 待交收数量
        /// </summary>
        public double pre_settle_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 持仓核对差额
        /// </summary>
        public double posi_qty_check_diff { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询历史交易组持仓
   public class FuncpdsecuL_3_22Model : BaseModel
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
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 待交收数量
        /// </summary>
        public double pre_settle_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 持仓核对差额
        /// </summary>
        public double posi_qty_check_diff { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询交易组持仓流水
   public class FuncpdsecuL_3_31Model : BaseModel
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
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
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
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 变动数量
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// 变动后数量
        /// </summary>
        public double occur_end_qty { get; set; }
 
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
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询历史交易组持仓流水
   public class FuncpdsecuL_3_32Model : BaseModel
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
        /// 操作菜单
        /// </summary>
        public int oper_menu_no { get; set; }
 
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
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 变动数量
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// 变动后数量
        /// </summary>
        public double occur_end_qty { get; set; }
 
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
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询交易组持仓冻结解冻流水
   public class FuncpdsecuL_3_34Model : BaseModel
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
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// 变动数量
        /// </summary>
        public double occur_qty { get; set; }
 
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
 
   //逻辑_产品证券_持仓_查询历史交易组持仓冻结解冻流水
   public class FuncpdsecuL_3_35Model : BaseModel
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
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// 变动数量
        /// </summary>
        public double occur_qty { get; set; }
 
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
 
   //逻辑_产品证券_持仓_查询债券质押交易组持仓
   public class FuncpdsecuL_3_36Model : BaseModel
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
        /// 可质押数量
        /// </summary>
        public double avail_impawn_qty { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询债券转回质押质押信息
   public class FuncpdsecuL_3_37Model : BaseModel
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
        /// 质押数量
        /// </summary>
        public double impawn_qty { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询交易组标准券可用
   public class FuncpdsecuL_3_38Model : BaseModel
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
        /// 可用数量
        /// </summary>
        public double avail_qty { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询债券回购
   public class FuncpdsecuL_3_39Model : BaseModel
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
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 标的代码编号
        /// </summary>
        public int target_code_no { get; set; }
 
        /// <summary>
        /// 标的代码
        /// </summary>
        public String target_code { get; set; }
 
        /// <summary>
        /// 订单方向
        /// </summary>
        public int order_dir { get; set; }
 
        /// <summary>
        /// 回购数量
        /// </summary>
        public double repo_qty { get; set; }
 
        /// <summary>
        /// 回购金额
        /// </summary>
        public double repo_amt { get; set; }
 
        /// <summary>
        /// 回购利率
        /// </summary>
        public double repo_rate { get; set; }
 
        /// <summary>
        /// 回购交易日期
        /// </summary>
        public int repo_trade_date { get; set; }
 
        /// <summary>
        /// 回购委托序号
        /// </summary>
        public ulong repo_order_id { get; set; }
 
        /// <summary>
        /// 回购成交序号
        /// </summary>
        public ulong repo_strike_id { get; set; }
 
        /// <summary>
        /// 回购天数
        /// </summary>
        public int repo_days { get; set; }
 
        /// <summary>
        /// 回购实际天数
        /// </summary>
        public int repo_cale_days { get; set; }
 
        /// <summary>
        /// 回购到期日期
        /// </summary>
        public int repo_back_date { get; set; }
 
        /// <summary>
        /// 回购购回金额
        /// </summary>
        public double repo_back_amt { get; set; }
 
        /// <summary>
        /// 回购购回利息
        /// </summary>
        public double repo_back_intrst { get; set; }
 
        /// <summary>
        /// 实际回购到期日期
        /// </summary>
        public int repo_back_trade_date { get; set; }
 
        /// <summary>
        /// 回购处理状态
        /// </summary>
        public String repo_status { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询交易组债券质押
   public class FuncpdsecuL_3_41Model : BaseModel
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
        /// 提交质押数量
        /// </summary>
        public double put_impawn_qty { get; set; }
 
        /// <summary>
        /// 转回质押数量
        /// </summary>
        public double get_impawn_qty { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询资产账户持仓
   public class FuncpdsecuL_3_71Model : BaseModel
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
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 资产类型
        /// </summary>
        public int asset_type { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 待交收数量
        /// </summary>
        public double pre_settle_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 持仓核对差额
        /// </summary>
        public double posi_qty_check_diff { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询历史资产账户持仓
   public class FuncpdsecuL_3_72Model : BaseModel
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
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 待交收数量
        /// </summary>
        public double pre_settle_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 持仓核对差额
        /// </summary>
        public double posi_qty_check_diff { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询资产账户持仓流水
   public class FuncpdsecuL_3_81Model : BaseModel
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
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 变动数量
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// 变动后数量
        /// </summary>
        public double occur_end_qty { get; set; }
 
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
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询历史资产账户持仓流水
   public class FuncpdsecuL_3_82Model : BaseModel
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
        /// 业务标志
        /// </summary>
        public int busi_flag { get; set; }
 
        /// <summary>
        /// 变动数量
        /// </summary>
        public double occur_qty { get; set; }
 
        /// <summary>
        /// 变动后数量
        /// </summary>
        public double occur_end_qty { get; set; }
 
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
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询资产账户持仓冻结解冻流水
   public class FuncpdsecuL_3_84Model : BaseModel
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
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// 变动数量
        /// </summary>
        public double occur_qty { get; set; }
 
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
 
   //逻辑_产品证券_持仓_查询历史资产账户持仓冻结解冻流水
   public class FuncpdsecuL_3_85Model : BaseModel
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
        /// 冻结解冻类型
        /// </summary>
        public int frozen_type { get; set; }
 
        /// <summary>
        /// 变动数量
        /// </summary>
        public double occur_qty { get; set; }
 
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
 
   //逻辑_产品证券_持仓_查询自动打新证券账户列表
   public class FuncpdsecuL_3_91Model : BaseModel
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
        /// 申购上限
        /// </summary>
        public double apply_limit { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 开始时间
        /// </summary>
        public int begin_time { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_转入外部证券持仓记录
   public class FuncpdsecuL_3_171Model : BaseModel
   {
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_转入外部质押明细
   public class FuncpdsecuL_3_181Model : BaseModel
   {
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_转入外部新股申购额度
   public class FuncpdsecuL_3_191Model : BaseModel
   {
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询新股申购额度
   public class FuncpdsecuL_3_192Model : BaseModel
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
        /// 股东代码
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// 申购上限
        /// </summary>
        public double apply_limit { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询大宗交易持仓
   public class FuncpdsecuL_3_507Model : BaseModel
   {
        /// <summary>
        /// 持仓序号
        /// </summary>
        public ulong posi_id { get; set; }
 
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
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交价格
        /// </summary>
        public double strike_price { get; set; }
 
        /// <summary>
        /// 公允价格
        /// </summary>
        public double fair_price { get; set; }
 
        /// <summary>
        /// 成交日期
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// 解禁日期
        /// </summary>
        public int release_date { get; set; }
 
        /// <summary>
        /// 处理状态
        /// </summary>
        public String deal_status { get; set; }
 
        /// <summary>
        /// 更新次数
        /// </summary>
        public int update_times { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询历史大宗交易持仓
   public class FuncpdsecuL_3_508Model : BaseModel
   {
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 持仓序号
        /// </summary>
        public ulong posi_id { get; set; }
 
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
        /// 成交数量
        /// </summary>
        public double strike_qty { get; set; }
 
        /// <summary>
        /// 成交价格
        /// </summary>
        public double strike_price { get; set; }
 
        /// <summary>
        /// 公允价格
        /// </summary>
        public double fair_price { get; set; }
 
        /// <summary>
        /// 成交日期
        /// </summary>
        public int strike_date { get; set; }
 
        /// <summary>
        /// 解禁日期
        /// </summary>
        public int release_date { get; set; }
 
        /// <summary>
        /// 处理状态
        /// </summary>
        public String deal_status { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_转入外部资产账户持仓记录
   public class FuncpdsecuL_3_604Model : BaseModel
   {
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_根据操作员查询交易组持仓
   public class FuncpdsecuL_3_700Model : BaseModel
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
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 投资类型
        /// </summary>
        public int invest_type { get; set; }
 
        /// <summary>
        /// 期初数量
        /// </summary>
        public double begin_qty { get; set; }
 
        /// <summary>
        /// 当前数量
        /// </summary>
        public double curr_qty { get; set; }
 
        /// <summary>
        /// 待交收数量
        /// </summary>
        public double pre_settle_qty { get; set; }
 
        /// <summary>
        /// 冻结数量
        /// </summary>
        public double frozen_qty { get; set; }
 
        /// <summary>
        /// 解冻数量
        /// </summary>
        public double unfroz_qty { get; set; }
 
        /// <summary>
        /// 持仓核对差额
        /// </summary>
        public double posi_qty_check_diff { get; set; }
 
        /// <summary>
        /// 成本金额
        /// </summary>
        public double cost_amt { get; set; }
 
        /// <summary>
        /// 实现盈亏
        /// </summary>
        public double realize_pandl { get; set; }
 
        /// <summary>
        /// 利息成本金额
        /// </summary>
        public double intrst_cost_amt { get; set; }
 
        /// <summary>
        /// 利息收益
        /// </summary>
        public double intrst_pandl { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询资产账户内外持仓差异记录
   public class FuncpdsecuL_3_701Model : BaseModel
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
        /// 资产账户编号
        /// </summary>
        public int asset_acco_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
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
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 外部成本价
        /// </summary>
        public double out_cost_price { get; set; }
 
        /// <summary>
        /// 账户当前数量
        /// </summary>
        public double acco_curr_qty { get; set; }
 
        /// <summary>
        /// 账户可用数量
        /// </summary>
        public double acco_avail_qty { get; set; }
 
        /// <summary>
        /// 外部当前数量
        /// </summary>
        public double out_curr_qty { get; set; }
 
        /// <summary>
        /// 外部可用数量
        /// </summary>
        public double out_enable_qty { get; set; }
 
        /// <summary>
        /// 账户当前数量差额
        /// </summary>
        public double acco_curr_qty_diff { get; set; }
 
        /// <summary>
        /// 账户可用数量差额
        /// </summary>
        public double acco_avail_qty_diff { get; set; }
 
        /// <summary>
        /// 外部质押数量
        /// </summary>
        public double out_impawn_qty { get; set; }
 
        /// <summary>
        /// 处理标志
        /// </summary>
        public int deal_flag { get; set; }
 
        /// <summary>
        /// 资产是否同步
        /// </summary>
        public int asset_sync_flag { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_转入科创板外部新股申购额度
   public class FuncpdsecuL_3_193Model : BaseModel
   {
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 外部账号
        /// </summary>
        public String out_acco { get; set; }
 
   }
 
   //逻辑_产品证券_持仓_查询科创板新股申购额度
   public class FuncpdsecuL_3_194Model : BaseModel
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
        /// 股东代码
        /// </summary>
        public String stock_acco { get; set; }
 
        /// <summary>
        /// 申购上限
        /// </summary>
        public double apply_limit { get; set; }
 
   }
 
}
