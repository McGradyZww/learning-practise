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
    public partial class MessageCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_公共_消息_更新对象版本信息
        /// </summary>
        public IWorkCommand<pubL_11_1_Request, ObservableCollection<pubL_11_1_Info>> pubL_11_1_Command
        {
            get
            {
                return new WorkCommand<pubL_11_1_Request, ObservableCollection<pubL_11_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_查询对象版本信息流水
        /// </summary>
        public IWorkCommand<pubL_11_2_Request, ObservableCollection<pubL_11_2_Info>> pubL_11_2_Command
        {
            get
            {
                return new WorkCommand<pubL_11_2_Request, ObservableCollection<pubL_11_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_查询历史对象版本信息流水
        /// </summary>
        public IWorkCommand<pubL_11_3_Request, ObservableCollection<pubL_11_3_Info>> pubL_11_3_Command
        {
            get
            {
                return new WorkCommand<pubL_11_3_Request, ObservableCollection<pubL_11_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_3_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_更新计划任务信息
        /// </summary>
        public IWorkCommand<pubL_11_6_Request, ObservableCollection<pubL_11_6_Info>> pubL_11_6_Command
        {
            get
            {
                return new WorkCommand<pubL_11_6_Request, ObservableCollection<pubL_11_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_6_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_查询计划任务信息
        /// </summary>
        public IWorkCommand<pubL_11_7_Request, ObservableCollection<pubL_11_7_Info>> pubL_11_7_Command
        {
            get
            {
                return new WorkCommand<pubL_11_7_Request, ObservableCollection<pubL_11_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_7_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_更新计划任务扩展信息
        /// </summary>
        public IWorkCommand<pubL_11_11_Request, ObservableCollection<pubL_11_11_Info>> pubL_11_11_Command
        {
            get
            {
                return new WorkCommand<pubL_11_11_Request, ObservableCollection<pubL_11_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_11_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_查询计划任务扩展信息
        /// </summary>
        public IWorkCommand<pubL_11_12_Request, ObservableCollection<pubL_11_12_Info>> pubL_11_12_Command
        {
            get
            {
                return new WorkCommand<pubL_11_12_Request, ObservableCollection<pubL_11_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_12_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_查询操作日志
        /// </summary>
        public IWorkCommand<pubL_11_21_Request, ObservableCollection<pubL_11_21_Info>> pubL_11_21_Command
        {
            get
            {
                return new WorkCommand<pubL_11_21_Request, ObservableCollection<pubL_11_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_21_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_查询历史操作日志
        /// </summary>
        public IWorkCommand<pubL_11_22_Request, ObservableCollection<pubL_11_22_Info>> pubL_11_22_Command
        {
            get
            {
                return new WorkCommand<pubL_11_22_Request, ObservableCollection<pubL_11_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_22_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_查询操作员任务提示信息
        /// </summary>
        public IWorkCommand<pubL_11_30_Request, ObservableCollection<pubL_11_30_Info>> pubL_11_30_Command
        {
            get
            {
                return new WorkCommand<pubL_11_30_Request, ObservableCollection<pubL_11_30_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_30_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_新增操作员任务提示信息
        /// </summary>
        public IWorkCommand<pubL_11_31_Request, ObservableCollection<pubL_11_31_Info>> pubL_11_31_Command
        {
            get
            {
                return new WorkCommand<pubL_11_31_Request, ObservableCollection<pubL_11_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_31_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_修改操作员任务提示信息
        /// </summary>
        public IWorkCommand<pubL_11_32_Request, ObservableCollection<pubL_11_32_Info>> pubL_11_32_Command
        {
            get
            {
                return new WorkCommand<pubL_11_32_Request, ObservableCollection<pubL_11_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_32_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_删除操作员任务提示信息
        /// </summary>
        public IWorkCommand<pubL_11_33_Request, ObservableCollection<pubL_11_33_Info>> pubL_11_33_Command
        {
            get
            {
                return new WorkCommand<pubL_11_33_Request, ObservableCollection<pubL_11_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_33_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_查询监控服务信息
        /// </summary>
        public IWorkCommand<pubL_11_40_Request, ObservableCollection<pubL_11_40_Info>> pubL_11_40_Command
        {
            get
            {
                return new WorkCommand<pubL_11_40_Request, ObservableCollection<pubL_11_40_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_40_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_新增监控服务信息
        /// </summary>
        public IWorkCommand<pubL_11_41_Request, ObservableCollection<pubL_11_41_Info>> pubL_11_41_Command
        {
            get
            {
                return new WorkCommand<pubL_11_41_Request, ObservableCollection<pubL_11_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_41_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_修改监控服务信息
        /// </summary>
        public IWorkCommand<pubL_11_42_Request, ObservableCollection<pubL_11_42_Info>> pubL_11_42_Command
        {
            get
            {
                return new WorkCommand<pubL_11_42_Request, ObservableCollection<pubL_11_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_42_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_消息_查询操作日志历史
        /// </summary>
        public IWorkCommand<pubL_11_43_Request, ObservableCollection<pubL_11_43_Info>> pubL_11_43_Command
        {
            get
            {
                return new WorkCommand<pubL_11_43_Request, ObservableCollection<pubL_11_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_11_43_InfoList;
                });
            }
        }

    }
}
