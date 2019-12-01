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
    public partial class PermissionClientCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_公共_权限客户端_新增角色
        /// </summary>
        public IWorkCommand<pubL_21_1_Request, ObservableCollection<pubL_21_1_Info>> pubL_21_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_1_Request, ObservableCollection<pubL_21_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_修改角色
        /// </summary>
        public IWorkCommand<pubL_21_2_Request, ObservableCollection<pubL_21_2_Info>> pubL_21_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_2_Request, ObservableCollection<pubL_21_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_删除角色
        /// </summary>
        public IWorkCommand<pubL_21_3_Request, ObservableCollection<pubL_21_3_Info>> pubL_21_3_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_3_Request, ObservableCollection<pubL_21_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_3_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_复制角色
        /// </summary>
        public IWorkCommand<pubL_21_4_Request, ObservableCollection<pubL_21_4_Info>> pubL_21_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_4_Request, ObservableCollection<pubL_21_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_查询角色列表
        /// </summary>
        public IWorkCommand<pubL_21_5_Request, ObservableCollection<pubL_21_5_Info>> pubL_21_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_5_Request, ObservableCollection<pubL_21_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_批量新增角色菜单功能
        /// </summary>
        public IWorkCommand<pubL_21_13_Request, ObservableCollection<pubL_21_13_Info>> pubL_21_13_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_13_Request, ObservableCollection<pubL_21_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_13_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_批量删除角色菜单功能
        /// </summary>
        public IWorkCommand<pubL_21_14_Request, ObservableCollection<pubL_21_14_Info>> pubL_21_14_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_14_Request, ObservableCollection<pubL_21_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_14_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_查询角色菜单功能列表
        /// </summary>
        public IWorkCommand<pubL_21_15_Request, ObservableCollection<pubL_21_15_Info>> pubL_21_15_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_15_Request, ObservableCollection<pubL_21_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_15_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_查询操作员可用角色列表
        /// </summary>
        public IWorkCommand<pubL_21_21_Request, ObservableCollection<pubL_21_21_Info>> pubL_21_21_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_21_Request, ObservableCollection<pubL_21_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_21_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_新增操作员角色
        /// </summary>
        public IWorkCommand<pubL_21_22_Request, ObservableCollection<pubL_21_22_Info>> pubL_21_22_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_22_Request, ObservableCollection<pubL_21_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_22_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_删除操作员角色
        /// </summary>
        public IWorkCommand<pubL_21_23_Request, ObservableCollection<pubL_21_23_Info>> pubL_21_23_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_23_Request, ObservableCollection<pubL_21_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_23_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_查询操作员角色列表
        /// </summary>
        public IWorkCommand<pubL_21_24_Request, ObservableCollection<pubL_21_24_Info>> pubL_21_24_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_24_Request, ObservableCollection<pubL_21_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_24_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_批量新增操作员特殊菜单功能
        /// </summary>
        public IWorkCommand<pubL_21_27_Request, ObservableCollection<pubL_21_27_Info>> pubL_21_27_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_27_Request, ObservableCollection<pubL_21_27_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_27_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_批量删除操作员特殊菜单功能
        /// </summary>
        public IWorkCommand<pubL_21_28_Request, ObservableCollection<pubL_21_28_Info>> pubL_21_28_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_28_Request, ObservableCollection<pubL_21_28_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_28_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_查询操作员普通菜单
        /// </summary>
        public IWorkCommand<pubL_21_29_Request, ObservableCollection<pubL_21_29_Info>> pubL_21_29_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_29_Request, ObservableCollection<pubL_21_29_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_29_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_查询操作员特殊菜单
        /// </summary>
        public IWorkCommand<pubL_21_30_Request, ObservableCollection<pubL_21_30_Info>> pubL_21_30_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_30_Request, ObservableCollection<pubL_21_30_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_30_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_查询操作员普通菜单功能
        /// </summary>
        public IWorkCommand<pubL_21_31_Request, ObservableCollection<pubL_21_31_Info>> pubL_21_31_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_31_Request, ObservableCollection<pubL_21_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_31_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_查询操作员特殊菜单功能
        /// </summary>
        public IWorkCommand<pubL_21_32_Request, ObservableCollection<pubL_21_32_Info>> pubL_21_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_32_Request, ObservableCollection<pubL_21_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_查询全部菜单
        /// </summary>
        public IWorkCommand<pubL_21_33_Request, ObservableCollection<pubL_21_33_Info>> pubL_21_33_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_33_Request, ObservableCollection<pubL_21_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_33_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_权限客户端_回收菜单功能权限
        /// </summary>
        public IWorkCommand<pubL_21_51_Request, ObservableCollection<pubL_21_51_Info>> pubL_21_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_21_51_Request, ObservableCollection<pubL_21_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_21_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
