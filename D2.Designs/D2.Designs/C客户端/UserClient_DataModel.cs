using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_公共_用户客户端_查询操作员信息
   public class FuncpubL_19_4Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作员名称
        /// </summary>
        public String opor_name { get; set; }
 
        /// <summary>
        /// 操作员类型
        /// </summary>
        public int opor_type { get; set; }
 
        /// <summary>
        /// 操作员密码
        /// </summary>
        public String opor_pwd { get; set; }
 
        /// <summary>
        /// 操作员状态
        /// </summary>
        public String opor_status { get; set; }
 
        /// <summary>
        /// 创建者
        /// </summary>
        public int create_opor { get; set; }
 
        /// <summary>
        /// 联系地址
        /// </summary>
        public String conta_addr { get; set; }
 
        /// <summary>
        /// 操作权限
        /// </summary>
        public int oper_rights { get; set; }
 
        /// <summary>
        /// 电话
        /// </summary>
        public String phone_number { get; set; }
 
        /// <summary>
        /// EMAIL
        /// </summary>
        public String email { get; set; }
 
        /// <summary>
        /// 是否交易员
        /// </summary>
        public int is_trader { get; set; }
 
        /// <summary>
        /// 交易员编号
        /// </summary>
        public int trader_no { get; set; }
 
        /// <summary>
        /// 允许登录方式
        /// </summary>
        public String allow_login_type { get; set; }
 
        /// <summary>
        /// 允许操作IP
        /// </summary>
        public String allow_oper_ip_addr { get; set; }
 
        /// <summary>
        /// 允许登录MAC
        /// </summary>
        public String allow_login_mac { get; set; }
 
        /// <summary>
        /// 允许操作MAC
        /// </summary>
        public String allow_oper_mac { get; set; }
 
        /// <summary>
        /// 操作员权限串
        /// </summary>
        public String opor_rights_str { get; set; }
 
        /// <summary>
        /// 索引值
        /// </summary>
        public int index_value { get; set; }
 
        /// <summary>
        /// 管理非登录操作员订单
        /// </summary>
        public int manage_nolgn_opor_orders { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询操作员信息流水
   public class FuncpubL_19_11Model : BaseModel
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
        /// 目标操作员编号
        /// </summary>
        public int target_opor_no { get; set; }
 
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
 
   //逻辑_公共_用户客户端_查询历史操作员信息流水
   public class FuncpubL_19_12Model : BaseModel
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
        /// 目标操作员编号
        /// </summary>
        public int target_opor_no { get; set; }
 
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
 
   //逻辑_公共_用户客户端_获取操作员编号
   public class FuncpubL_19_14Model : BaseModel
   {
        /// <summary>
        /// 目标操作员编号
        /// </summary>
        public int target_opor_no { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询操作员列表
   public class FuncpubL_19_15Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作员名称
        /// </summary>
        public String opor_name { get; set; }
 
        /// <summary>
        /// 操作员状态
        /// </summary>
        public String opor_status { get; set; }
 
        /// <summary>
        /// 是否交易员
        /// </summary>
        public int is_trader { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询操作员权限信息
   public class FuncpubL_19_18Model : BaseModel
   {
        /// <summary>
        /// 允许操作MAC
        /// </summary>
        public String allow_oper_mac { get; set; }
 
        /// <summary>
        /// 操作员权限串
        /// </summary>
        public String opor_rights_str { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询操作员登录地址信息
   public class FuncpubL_19_19Model : BaseModel
   {
        /// <summary>
        /// 操作MAC
        /// </summary>
        public String oper_mac { get; set; }
 
        /// <summary>
        /// 操作IP
        /// </summary>
        public String oper_ip_addr { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_操作员登录
   public class FuncpubL_19_21Model : BaseModel
   {
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 操作员名称
        /// </summary>
        public String opor_name { get; set; }
 
        /// <summary>
        /// 操作员类型
        /// </summary>
        public int opor_type { get; set; }
 
        /// <summary>
        /// 操作权限
        /// </summary>
        public int oper_rights { get; set; }
 
        /// <summary>
        /// 是否交易员
        /// </summary>
        public int is_trader { get; set; }
 
        /// <summary>
        /// 交易员编号
        /// </summary>
        public int trader_no { get; set; }
 
        /// <summary>
        /// 在线状态
        /// </summary>
        public int online_status { get; set; }
 
        /// <summary>
        /// 登录次数
        /// </summary>
        public int login_count { get; set; }
 
        /// <summary>
        /// 登录错误次数
        /// </summary>
        public int login_error_count { get; set; }
 
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 上次登录IP
        /// </summary>
        public String last_login_ip { get; set; }
 
        /// <summary>
        /// 上次登录MAC
        /// </summary>
        public String last_login_mac { get; set; }
 
        /// <summary>
        /// 上次登录日期
        /// </summary>
        public int last_login_date { get; set; }
 
        /// <summary>
        /// 上次登录时间
        /// </summary>
        public int last_login_time { get; set; }
 
        /// <summary>
        /// 上次操作信息
        /// </summary>
        public String last_oper_info { get; set; }
 
        /// <summary>
        /// 机构类型
        /// </summary>
        public int co_type { get; set; }
 
        /// <summary>
        /// 机构业务控制配置串
        /// </summary>
        public String co_busi_config_str { get; set; }
 
        /// <summary>
        /// 改密标志
        /// </summary>
        public int change_pwd_flag { get; set; }
 
        /// <summary>
        /// 系统类型
        /// </summary>
        public int sys_type { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询操作员配置
   public class FuncpubL_19_32Model : BaseModel
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
        /// 配置编号
        /// </summary>
        public ulong config_no { get; set; }
 
        /// <summary>
        /// 配置名称
        /// </summary>
        public String config_name { get; set; }
 
        /// <summary>
        /// 配置值
        /// </summary>
        public String config_value { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询操作员表格显示
   public class FuncpubL_19_34Model : BaseModel
   {
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 父窗体
        /// </summary>
        public String parent_panel { get; set; }
 
        /// <summary>
        /// 表格名称
        /// </summary>
        public String dbgrid_name { get; set; }
 
        /// <summary>
        /// 表格键值
        /// </summary>
        public String dbgrid_key { get; set; }
 
        /// <summary>
        /// 表格字段
        /// </summary>
        public String dbgrid_field { get; set; }
 
        /// <summary>
        /// 字段宽度
        /// </summary>
        public int field_width { get; set; }
 
        /// <summary>
        /// 字段列号
        /// </summary>
        public int field_order { get; set; }
 
        /// <summary>
        /// 客户端类型
        /// </summary>
        public int client_type { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询操作员可操作产品
   public class FuncpubL_19_48Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 操作权限
        /// </summary>
        public int oper_rights { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_新增交易组信息
   public class FuncpubL_19_51Model : BaseModel
   {
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询交易组信息
   public class FuncpubL_19_54Model : BaseModel
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 交易组编码
        /// </summary>
        public String exch_group_code { get; set; }
 
        /// <summary>
        /// 交易组名称
        /// </summary>
        public String exch_group_name { get; set; }
 
        /// <summary>
        /// 交易组状态
        /// </summary>
        public String exch_group_status { get; set; }
 
        /// <summary>
        /// 默认组标志
        /// </summary>
        public int default_group_flag { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 原始资产
        /// </summary>
        public double first_asset { get; set; }
 
        /// <summary>
        /// 昨日净值
        /// </summary>
        public double pre_nav { get; set; }
 
        /// <summary>
        /// 分配产品资金
        /// </summary>
        public double exch_group_dist_pd_amt { get; set; }
 
        /// <summary>
        /// 交易组产品份额
        /// </summary>
        public double exch_group_pd_share { get; set; }
 
        /// <summary>
        /// 允许投资市场
        /// </summary>
        public String allow_exch { get; set; }
 
        /// <summary>
        /// 允许操作证券类型
        /// </summary>
        public String allow_stock_type { get; set; }
 
        /// <summary>
        /// 业务控制配置串
        /// </summary>
        public String busi_config_str { get; set; }
 
        /// <summary>
        /// 市价冻结浮动比例
        /// </summary>
        public double market_price_ratio { get; set; }
 
        /// <summary>
        /// 禁止订单方向
        /// </summary>
        public String forbid_order_dir { get; set; }
 
        /// <summary>
        /// 交易账户
        /// </summary>
        public String trade_acco { get; set; }
 
        /// <summary>
        /// 权重值
        /// </summary>
        public double weight_value { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 期货默认组标志
        /// </summary>
        public int futu_default_group_flag { get; set; }
 
        /// <summary>
        /// 融资融券默认组标志
        /// </summary>
        public int fina_loan_default_group_flag { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询交易组信息流水
   public class FuncpubL_19_58Model : BaseModel
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
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
 
   //逻辑_公共_用户客户端_查询历史交易组信息流水
   public class FuncpubL_19_59Model : BaseModel
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
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
 
   //逻辑_公共_用户客户端_查询可见交易组
   public class FuncpubL_19_73Model : BaseModel
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
        /// 交易组编码
        /// </summary>
        public String exch_group_code { get; set; }
 
        /// <summary>
        /// 交易组名称
        /// </summary>
        public String exch_group_name { get; set; }
 
        /// <summary>
        /// 交易组状态
        /// </summary>
        public String exch_group_status { get; set; }
 
        /// <summary>
        /// 默认组标志
        /// </summary>
        public int default_group_flag { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询操作员所属交易组
   public class FuncpubL_19_64Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 操作权限
        /// </summary>
        public int oper_rights { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_新增产品账户交易组组别
   public class FuncpubL_19_65Model : BaseModel
   {
        /// <summary>
        /// 组别编号
        /// </summary>
        public int group_no { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询产品账户交易组组别
   public class FuncpubL_19_68Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 组别编号
        /// </summary>
        public int group_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 组别名称
        /// </summary>
        public String group_name { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 产品账户组类型
        /// </summary>
        public int pd_account_group_type { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询产品账户交易组组别明细
   public class FuncpubL_19_72Model : BaseModel
   {
        /// <summary>
        /// 组别编号
        /// </summary>
        public int group_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
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
        /// 权重比例
        /// </summary>
        public double weight_ratio { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询操作员可操作操作员
   public class FuncpubL_19_76Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 可操作操作员编号
        /// </summary>
        public int allow_opor_no { get; set; }
 
        /// <summary>
        /// 操作权限
        /// </summary>
        public int oper_rights { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询交易组历史资产
   public class FuncpubL_19_89Model : BaseModel
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
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 期初净资产
        /// </summary>
        public double begin_NAV { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 总现金资产
        /// </summary>
        public double total_cash_asset { get; set; }
 
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
        /// 其他资产
        /// </summary>
        public double other_asset { get; set; }
 
        /// <summary>
        /// 港股通资产
        /// </summary>
        public double hk_thrgh_stock_asset { get; set; }
 
        /// <summary>
        /// 证券现金资产
        /// </summary>
        public double stock_cash_asset { get; set; }
 
        /// <summary>
        /// 期货现金资产
        /// </summary>
        public double futu_cash_asset { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询交易组资产
   public class FuncpubL_19_91Model : BaseModel
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
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 期初净资产
        /// </summary>
        public double begin_NAV { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 总现金资产
        /// </summary>
        public double total_cash_asset { get; set; }
 
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
        /// 其他资产
        /// </summary>
        public double other_asset { get; set; }
 
        /// <summary>
        /// 港股通资产
        /// </summary>
        public double hk_thrgh_stock_asset { get; set; }
 
        /// <summary>
        /// 期初估值净资产
        /// </summary>
        public double begin_evalu_nav_asset { get; set; }
 
        /// <summary>
        /// 估值净资产
        /// </summary>
        public double evalu_nav_asset { get; set; }
 
        /// <summary>
        /// 期货多头市值
        /// </summary>
        public double futu_long_market_value { get; set; }
 
        /// <summary>
        /// 期货空头市值
        /// </summary>
        public double futu_short_market_value { get; set; }
 
        /// <summary>
        /// 证券现金资产
        /// </summary>
        public double stock_cash_asset { get; set; }
 
        /// <summary>
        /// 期货现金资产
        /// </summary>
        public double futu_cash_asset { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询交易组资产历史
   public class FuncpubL_19_90Model : BaseModel
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
        /// 本币币种
        /// </summary>
        public String crncy_type { get; set; }
 
        /// <summary>
        /// 期初净资产
        /// </summary>
        public double begin_NAV { get; set; }
 
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
        /// <summary>
        /// 总现金资产
        /// </summary>
        public double total_cash_asset { get; set; }
 
        /// <summary>
        /// 货币基金资产
        /// </summary>
        public double money_fund_asset { get; set; }
 
        /// <summary>
        /// 非货币基金资产
        /// </summary>
        public double not_money_fund_asset { get; set; }
 
        /// <summary>
        /// 股票资产
        /// </summary>
        public double stock_asset { get; set; }
 
        /// <summary>
        /// 基金资产
        /// </summary>
        public double fund_asset { get; set; }
 
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
        /// 其他资产
        /// </summary>
        public double other_asset { get; set; }
 
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
 
        /// <summary>
        /// 证券现金资产
        /// </summary>
        public double stock_cash_asset { get; set; }
 
        /// <summary>
        /// 期货现金资产
        /// </summary>
        public double futu_cash_asset { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_获取交易组最大净值
   public class FuncpubL_19_92Model : BaseModel
   {
        /// <summary>
        /// 净资产
        /// </summary>
        public double nav_asset { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_获取交易组最大单位净值
   public class FuncpubL_19_93Model : BaseModel
   {
        /// <summary>
        /// 单位净值
        /// </summary>
        public double unit_nav { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询交易组份额变动流水
   public class FuncpubL_19_94Model : BaseModel
   {
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询交易组份额变动流水历史
   public class FuncpubL_19_95Model : BaseModel
   {
        /// <summary>
        /// 初始化日期
        /// </summary>
        public int init_date { get; set; }
 
        /// <summary>
        /// 创建时间
        /// </summary>
        public int create_time { get; set; }
 
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 流水变动字段
        /// </summary>
        public String jour_occur_field { get; set; }
 
        /// <summary>
        /// 流水后信息
        /// </summary>
        public String jour_after_occur_info { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询可见交易员列表
   public class FuncpubL_19_202Model : BaseModel
   {
        /// <summary>
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 操作员名称
        /// </summary>
        public String opor_name { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询自动打新交易组列表
   public class FuncpubL_19_203Model : BaseModel
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
        /// 交易组编码
        /// </summary>
        public String exch_group_code { get; set; }
 
        /// <summary>
        /// 交易组名称
        /// </summary>
        public String exch_group_name { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_获取可操作该产品操作员编号串
   public class FuncpubL_19_902Model : BaseModel
   {
        /// <summary>
        /// 可操作操作员编号串
        /// </summary>
        public String allow_opor_no_str { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询期现对冲组合
   public class FuncpubL_19_304Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 指令交易标志
        /// </summary>
        public int comm_trd_type { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 对冲组合名称
        /// </summary>
        public String hedg_name { get; set; }
 
        /// <summary>
        /// 期货交易组编号
        /// </summary>
        public int futu_exch_group_no { get; set; }
 
        /// <summary>
        /// 期货资产账户编号
        /// </summary>
        public int futu_asset_acco_no { get; set; }
 
        /// <summary>
        /// 期货产品编号
        /// </summary>
        public int futu_order_pd_no { get; set; }
 
        /// <summary>
        /// 证券交易组编号
        /// </summary>
        public int secu_exch_group_no { get; set; }
 
        /// <summary>
        /// 证券资产账户编号
        /// </summary>
        public int secu_asset_acco_no { get; set; }
 
        /// <summary>
        /// 证券产品编号
        /// </summary>
        public int secu_order_pd_no { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询期现对冲方案信息
   public class FuncpubL_19_404Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 指令交易标志
        /// </summary>
        public int comm_trd_type { get; set; }
 
        /// <summary>
        /// 对冲计划名称
        /// </summary>
        public String hedg_plan_name { get; set; }
 
        /// <summary>
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 合约代码编号
        /// </summary>
        public int contrc_code_no { get; set; }
 
        /// <summary>
        /// 期货手数
        /// </summary>
        public double futu_qty { get; set; }
 
        /// <summary>
        /// 篮子数量
        /// </summary>
        public double basket_qty { get; set; }
 
        /// <summary>
        /// 篮子序号
        /// </summary>
        public ulong basket_id { get; set; }
 
        /// <summary>
        /// 监控类型
        /// </summary>
        public int plan_type { get; set; }
 
        /// <summary>
        /// 对冲组合编号
        /// </summary>
        public ulong hedg_no { get; set; }
 
        /// <summary>
        /// 对冲盘口
        /// </summary>
        public double hedging_pankou { get; set; }
 
        /// <summary>
        /// 期货价格偏移量
        /// </summary>
        public double futu_price_offset { get; set; }
 
        /// <summary>
        /// 价格偏移量
        /// </summary>
        public double price_offset { get; set; }
 
        /// <summary>
        /// 标的基差
        /// </summary>
        public double target_base_diff { get; set; }
 
        /// <summary>
        /// 模板基差
        /// </summary>
        public double template_base_diff { get; set; }
 
        /// <summary>
        /// 现货涨停市值比例
        /// </summary>
        public double up_value_ratio { get; set; }
 
        /// <summary>
        /// 现货跌停市值比例
        /// </summary>
        public double down_value_ratio { get; set; }
 
        /// <summary>
        /// 现货停牌市值比例
        /// </summary>
        public double stop_value_ratio { get; set; }
 
        /// <summary>
        /// 现金替代金额
        /// </summary>
        public double cash_replace_amt { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询操作员可设置操作员
   public class FuncpubL_19_503Model : BaseModel
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
        /// 操作员编号
        /// </summary>
        public int opor_no { get; set; }
 
        /// <summary>
        /// 可操作操作员编号
        /// </summary>
        public int allow_opor_no { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_获取注销交易组串
   public class FuncpubL_19_504Model : BaseModel
   {
        /// <summary>
        /// 交易组编号串
        /// </summary>
        public String exch_group_no_str { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_查询基金产品行情
   public class FuncpubL_19_506Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券名称
        /// </summary>
        public String stock_name { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 最新价
        /// </summary>
        public double last_price { get; set; }
 
   }
 
   //逻辑_公共_用户客户端_运维端查询交易组信息
   public class FuncpubL_19_96Model : BaseModel
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
        /// 交易组编号
        /// </summary>
        public int exch_group_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 交易组编码
        /// </summary>
        public String exch_group_code { get; set; }
 
        /// <summary>
        /// 交易组名称
        /// </summary>
        public String exch_group_name { get; set; }
 
        /// <summary>
        /// 交易组状态
        /// </summary>
        public String exch_group_status { get; set; }
 
        /// <summary>
        /// 默认组标志
        /// </summary>
        public int default_group_flag { get; set; }
 
        /// <summary>
        /// 产品编号
        /// </summary>
        public int pd_no { get; set; }
 
        /// <summary>
        /// 原始资产
        /// </summary>
        public double first_asset { get; set; }
 
        /// <summary>
        /// 昨日净值
        /// </summary>
        public double pre_nav { get; set; }
 
        /// <summary>
        /// 分配产品资金
        /// </summary>
        public double exch_group_dist_pd_amt { get; set; }
 
        /// <summary>
        /// 交易组产品份额
        /// </summary>
        public double exch_group_pd_share { get; set; }
 
        /// <summary>
        /// 允许投资市场
        /// </summary>
        public String allow_exch { get; set; }
 
        /// <summary>
        /// 允许操作证券类型
        /// </summary>
        public String allow_stock_type { get; set; }
 
        /// <summary>
        /// 业务控制配置串
        /// </summary>
        public String busi_config_str { get; set; }
 
        /// <summary>
        /// 市价冻结浮动比例
        /// </summary>
        public double market_price_ratio { get; set; }
 
        /// <summary>
        /// 禁止订单方向
        /// </summary>
        public String forbid_order_dir { get; set; }
 
        /// <summary>
        /// 交易账户
        /// </summary>
        public String trade_acco { get; set; }
 
        /// <summary>
        /// 权重值
        /// </summary>
        public double weight_value { get; set; }
 
        /// <summary>
        /// 备注信息
        /// </summary>
        public String remark_info { get; set; }
 
        /// <summary>
        /// 期货默认组标志
        /// </summary>
        public int futu_default_group_flag { get; set; }
 
        /// <summary>
        /// 融资融券默认组标志
        /// </summary>
        public int fina_loan_default_group_flag { get; set; }
 
   }
 
}
