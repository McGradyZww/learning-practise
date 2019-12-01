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
    public partial class TrdFutuApprCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_交易期货_指令_新增指令
        /// </summary>
        public IWorkCommand<tdfutuL_3_1_Request, ObservableCollection<tdfutuL_3_1_Info>> tdfutuL_3_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_3_1_Request, ObservableCollection<tdfutuL_3_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_3_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_指令_撤销指令
        /// </summary>
        public IWorkCommand<tdfutuL_3_2_Request, ObservableCollection<tdfutuL_3_2_Info>> tdfutuL_3_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_3_2_Request, ObservableCollection<tdfutuL_3_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_3_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_指令_修改指令
        /// </summary>
        public IWorkCommand<tdfutuL_3_3_Request, ObservableCollection<tdfutuL_3_3_Info>> tdfutuL_3_3_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_3_3_Request, ObservableCollection<tdfutuL_3_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_3_3_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_指令_审批指令
        /// </summary>
        public IWorkCommand<tdfutuL_3_4_Request, ObservableCollection<tdfutuL_3_4_Info>> tdfutuL_3_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_3_4_Request, ObservableCollection<tdfutuL_3_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_3_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_指令_分发指令
        /// </summary>
        public IWorkCommand<tdfutuL_3_5_Request, ObservableCollection<tdfutuL_3_5_Info>> tdfutuL_3_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_3_5_Request, ObservableCollection<tdfutuL_3_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_3_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_指令_查询指令结果集
        /// </summary>
        public IWorkCommand<tdfutuL_3_6_Request, ObservableCollection<tdfutuL_3_6_Info>> tdfutuL_3_6_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_3_6_Request, ObservableCollection<tdfutuL_3_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_3_6_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_指令_查询历史指令结果集
        /// </summary>
        public IWorkCommand<tdfutuL_3_7_Request, ObservableCollection<tdfutuL_3_7_Info>> tdfutuL_3_7_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_3_7_Request, ObservableCollection<tdfutuL_3_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_3_7_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_指令_查询指令分发结果集
        /// </summary>
        public IWorkCommand<tdfutuL_3_8_Request, ObservableCollection<tdfutuL_3_8_Info>> tdfutuL_3_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_3_8_Request, ObservableCollection<tdfutuL_3_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_3_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_指令_查询历史指令分发结果集
        /// </summary>
        public IWorkCommand<tdfutuL_3_9_Request, ObservableCollection<tdfutuL_3_9_Info>> tdfutuL_3_9_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_3_9_Request, ObservableCollection<tdfutuL_3_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_3_9_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_指令_查询指令审批结果集
        /// </summary>
        public IWorkCommand<tdfutuL_3_10_Request, ObservableCollection<tdfutuL_3_10_Info>> tdfutuL_3_10_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_3_10_Request, ObservableCollection<tdfutuL_3_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_3_10_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_指令_查询历史指令审批结果集
        /// </summary>
        public IWorkCommand<tdfutuL_3_11_Request, ObservableCollection<tdfutuL_3_11_Info>> tdfutuL_3_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_3_11_Request, ObservableCollection<tdfutuL_3_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_3_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_指令_查询汇总指令结果集
        /// </summary>
        public IWorkCommand<tdfutuL_3_12_Request, ObservableCollection<tdfutuL_3_12_Info>> tdfutuL_3_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_3_12_Request, ObservableCollection<tdfutuL_3_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_3_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_指令_查询历史汇总指令结果集
        /// </summary>
        public IWorkCommand<tdfutuL_3_13_Request, ObservableCollection<tdfutuL_3_13_Info>> tdfutuL_3_13_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_3_13_Request, ObservableCollection<tdfutuL_3_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_3_13_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
