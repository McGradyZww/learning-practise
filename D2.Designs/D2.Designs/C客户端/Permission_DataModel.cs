using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_公共_权限_查询角色列表
   public class FuncpubL_7_5Model : BaseModel
   {
        /// <summary>
        /// 角色编号
        /// </summary>
        public int role_no { get; set; }
 
        /// <summary>
        /// 角色编码
        /// </summary>
        public String role_code { get; set; }
 
        /// <summary>
        /// 角色名称
        /// </summary>
        public String role_name { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 角色类型
        /// </summary>
        public int role_type { get; set; }
 
   }
 
   //逻辑_公共_权限_检查角色存在
   public class FuncpubL_7_6Model : BaseModel
   {
        /// <summary>
        /// 记录个数
        /// </summary>
        public int record_count { get; set; }
 
   }
 
   //逻辑_公共_权限_查询角色菜单功能列表
   public class FuncpubL_7_15Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 角色编号
        /// </summary>
        public int role_no { get; set; }
 
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no { get; set; }
 
        /// <summary>
        /// 业务功能编码
        /// </summary>
        public String busi_func_code { get; set; }
 
   }
 
   //逻辑_公共_权限_查询操作员可用角色列表
   public class FuncpubL_7_21Model : BaseModel
   {
        /// <summary>
        /// 角色编号
        /// </summary>
        public int role_no { get; set; }
 
        /// <summary>
        /// 角色名称
        /// </summary>
        public String role_name { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
   }
 
   //逻辑_公共_权限_查询操作员角色列表
   public class FuncpubL_7_24Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 角色编号
        /// </summary>
        public int role_no { get; set; }
 
   }
 
   //逻辑_公共_权限_查询全部菜单
   public class FuncpubL_7_33Model : BaseModel
   {
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no { get; set; }
 
        /// <summary>
        /// 菜单名称
        /// </summary>
        public String menu_name { get; set; }
 
        /// <summary>
        /// 菜单所属
        /// </summary>
        public int menu_parent { get; set; }
 
        /// <summary>
        /// 菜单枝叶
        /// </summary>
        public int menu_child { get; set; }
 
        /// <summary>
        /// 菜单路径
        /// </summary>
        public String menu_path { get; set; }
 
        /// <summary>
        /// 菜单图标
        /// </summary>
        public String menu_image { get; set; }
 
   }
 
   //逻辑_公共_权限_查询全部菜单功能
   public class FuncpubL_7_34Model : BaseModel
   {
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no { get; set; }
 
        /// <summary>
        /// 业务功能编码
        /// </summary>
        public String busi_func_code { get; set; }
 
        /// <summary>
        /// 功能名称
        /// </summary>
        public String func_name { get; set; }
 
   }
 
   //逻辑_公共_权限_查询操作员普通菜单
   public class FuncpubL_7_29Model : BaseModel
   {
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no { get; set; }
 
   }
 
   //逻辑_公共_权限_查询操作员特殊菜单
   public class FuncpubL_7_30Model : BaseModel
   {
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no { get; set; }
 
   }
 
   //逻辑_公共_权限_查询操作员普通菜单功能
   public class FuncpubL_7_31Model : BaseModel
   {
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no { get; set; }
 
        /// <summary>
        /// 业务功能编码
        /// </summary>
        public String busi_func_code { get; set; }
 
   }
 
   //逻辑_公共_权限_查询操作员特殊菜单功能
   public class FuncpubL_7_32Model : BaseModel
   {
        /// <summary>
        /// 业务菜单编号
        /// </summary>
        public int busi_menu_no { get; set; }
 
        /// <summary>
        /// 业务功能编码
        /// </summary>
        public String busi_func_code { get; set; }
 
   }
 
}
