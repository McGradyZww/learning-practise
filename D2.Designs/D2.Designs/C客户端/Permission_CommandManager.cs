using LdNet.ClientSdk.Model;
using LdNet.ClientSdk.Request;
using LdNet.ClientCore.Sdk;
using LdNet.ClientCore.Threading;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;

namespace LdNet.ClientSdk.Command
{
    public partial class PermissionCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_公共_权限_新增角色
        /// </summary>
        public IWorkCommand<pubL_7_1_Request, ObservableCollection<pubL_7_1_Info>> pubL_7_1_Command
        {
            get
            {
                return new WorkCommand<pubL_7_1_Request, ObservableCollection<pubL_7_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_修改角色
        /// </summary>
        public IWorkCommand<pubL_7_2_Request, ObservableCollection<pubL_7_2_Info>> pubL_7_2_Command
        {
            get
            {
                return new WorkCommand<pubL_7_2_Request, ObservableCollection<pubL_7_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_删除角色
        /// </summary>
        public IWorkCommand<pubL_7_3_Request, ObservableCollection<pubL_7_3_Info>> pubL_7_3_Command
        {
            get
            {
                return new WorkCommand<pubL_7_3_Request, ObservableCollection<pubL_7_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_3_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_复制角色
        /// </summary>
        public IWorkCommand<pubL_7_4_Request, ObservableCollection<pubL_7_4_Info>> pubL_7_4_Command
        {
            get
            {
                return new WorkCommand<pubL_7_4_Request, ObservableCollection<pubL_7_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_4_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_查询角色列表
        /// </summary>
        public IWorkCommand<pubL_7_5_Request, ObservableCollection<pubL_7_5_Info>> pubL_7_5_Command
        {
            get
            {
                return new WorkCommand<pubL_7_5_Request, ObservableCollection<pubL_7_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_5_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_检查角色存在
        /// </summary>
        public IWorkCommand<pubL_7_6_Request, ObservableCollection<pubL_7_6_Info>> pubL_7_6_Command
        {
            get
            {
                return new WorkCommand<pubL_7_6_Request, ObservableCollection<pubL_7_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_6_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_批量新增角色菜单功能
        /// </summary>
        public IWorkCommand<pubL_7_13_Request, ObservableCollection<pubL_7_13_Info>> pubL_7_13_Command
        {
            get
            {
                return new WorkCommand<pubL_7_13_Request, ObservableCollection<pubL_7_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_13_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_批量删除角色菜单功能
        /// </summary>
        public IWorkCommand<pubL_7_14_Request, ObservableCollection<pubL_7_14_Info>> pubL_7_14_Command
        {
            get
            {
                return new WorkCommand<pubL_7_14_Request, ObservableCollection<pubL_7_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_14_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_查询角色菜单功能列表
        /// </summary>
        public IWorkCommand<pubL_7_15_Request, ObservableCollection<pubL_7_15_Info>> pubL_7_15_Command
        {
            get
            {
                return new WorkCommand<pubL_7_15_Request, ObservableCollection<pubL_7_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_15_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_查询操作员可用角色列表
        /// </summary>
        public IWorkCommand<pubL_7_21_Request, ObservableCollection<pubL_7_21_Info>> pubL_7_21_Command
        {
            get
            {
                return new WorkCommand<pubL_7_21_Request, ObservableCollection<pubL_7_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_21_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_新增操作员角色
        /// </summary>
        public IWorkCommand<pubL_7_22_Request, ObservableCollection<pubL_7_22_Info>> pubL_7_22_Command
        {
            get
            {
                return new WorkCommand<pubL_7_22_Request, ObservableCollection<pubL_7_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_22_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_删除操作员角色
        /// </summary>
        public IWorkCommand<pubL_7_23_Request, ObservableCollection<pubL_7_23_Info>> pubL_7_23_Command
        {
            get
            {
                return new WorkCommand<pubL_7_23_Request, ObservableCollection<pubL_7_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_23_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_查询操作员角色列表
        /// </summary>
        public IWorkCommand<pubL_7_24_Request, ObservableCollection<pubL_7_24_Info>> pubL_7_24_Command
        {
            get
            {
                return new WorkCommand<pubL_7_24_Request, ObservableCollection<pubL_7_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_24_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_批量新增操作员特殊菜单功能
        /// </summary>
        public IWorkCommand<pubL_7_27_Request, ObservableCollection<pubL_7_27_Info>> pubL_7_27_Command
        {
            get
            {
                return new WorkCommand<pubL_7_27_Request, ObservableCollection<pubL_7_27_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_27_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_批量删除操作员特殊菜单功能
        /// </summary>
        public IWorkCommand<pubL_7_28_Request, ObservableCollection<pubL_7_28_Info>> pubL_7_28_Command
        {
            get
            {
                return new WorkCommand<pubL_7_28_Request, ObservableCollection<pubL_7_28_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_28_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_查询全部菜单
        /// </summary>
        public IWorkCommand<pubL_7_33_Request, ObservableCollection<pubL_7_33_Info>> pubL_7_33_Command
        {
            get
            {
                return new WorkCommand<pubL_7_33_Request, ObservableCollection<pubL_7_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_33_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_查询全部菜单功能
        /// </summary>
        public IWorkCommand<pubL_7_34_Request, ObservableCollection<pubL_7_34_Info>> pubL_7_34_Command
        {
            get
            {
                return new WorkCommand<pubL_7_34_Request, ObservableCollection<pubL_7_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_34_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_查询操作员普通菜单
        /// </summary>
        public IWorkCommand<pubL_7_29_Request, ObservableCollection<pubL_7_29_Info>> pubL_7_29_Command
        {
            get
            {
                return new WorkCommand<pubL_7_29_Request, ObservableCollection<pubL_7_29_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_29_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_查询操作员特殊菜单
        /// </summary>
        public IWorkCommand<pubL_7_30_Request, ObservableCollection<pubL_7_30_Info>> pubL_7_30_Command
        {
            get
            {
                return new WorkCommand<pubL_7_30_Request, ObservableCollection<pubL_7_30_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_30_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_查询操作员普通菜单功能
        /// </summary>
        public IWorkCommand<pubL_7_31_Request, ObservableCollection<pubL_7_31_Info>> pubL_7_31_Command
        {
            get
            {
                return new WorkCommand<pubL_7_31_Request, ObservableCollection<pubL_7_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_31_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_查询操作员特殊菜单功能
        /// </summary>
        public IWorkCommand<pubL_7_32_Request, ObservableCollection<pubL_7_32_Info>> pubL_7_32_Command
        {
            get
            {
                return new WorkCommand<pubL_7_32_Request, ObservableCollection<pubL_7_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_32_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_回收菜单功能权限
        /// </summary>
        public IWorkCommand<pubL_7_51_Request, ObservableCollection<pubL_7_51_Info>> pubL_7_51_Command
        {
            get
            {
                return new WorkCommand<pubL_7_51_Request, ObservableCollection<pubL_7_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_51_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_权限_主推密码权限校验
        /// </summary>
        public IWorkCommand<pubL_7_52_Request, ObservableCollection<pubL_7_52_Info>> pubL_7_52_Command
        {
            get
            {
                return new WorkCommand<pubL_7_52_Request, ObservableCollection<pubL_7_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_7_52_InfoList;
                });
            }
        }

    }
}
