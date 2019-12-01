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
    public partial class TrdFutuAccoCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_交易期货_账户_计算交易组资金可用
        /// </summary>
        public IWorkCommand<tdfutuL_2_1_Request, ObservableCollection<tdfutuL_2_1_Info>> tdfutuL_2_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_2_1_Request, ObservableCollection<tdfutuL_2_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_2_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_账户_计算资产账户资金可用
        /// </summary>
        public IWorkCommand<tdfutuL_2_2_Request, ObservableCollection<tdfutuL_2_2_Info>> tdfutuL_2_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_2_2_Request, ObservableCollection<tdfutuL_2_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_2_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_账户_计算交易组持仓可用
        /// </summary>
        public IWorkCommand<tdfutuL_2_3_Request, ObservableCollection<tdfutuL_2_3_Info>> tdfutuL_2_3_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_2_3_Request, ObservableCollection<tdfutuL_2_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_2_3_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_账户_计算资产账户持仓可用
        /// </summary>
        public IWorkCommand<tdfutuL_2_4_Request, ObservableCollection<tdfutuL_2_4_Info>> tdfutuL_2_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_2_4_Request, ObservableCollection<tdfutuL_2_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_2_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_账户_查询交易组资金
        /// </summary>
        public IWorkCommand<tdfutuL_2_5_Request, ObservableCollection<tdfutuL_2_5_Info>> tdfutuL_2_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_2_5_Request, ObservableCollection<tdfutuL_2_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_2_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_账户_查询资产账户资金
        /// </summary>
        public IWorkCommand<tdfutuL_2_6_Request, ObservableCollection<tdfutuL_2_6_Info>> tdfutuL_2_6_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_2_6_Request, ObservableCollection<tdfutuL_2_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_2_6_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_账户_查询交易组持仓
        /// </summary>
        public IWorkCommand<tdfutuL_2_7_Request, ObservableCollection<tdfutuL_2_7_Info>> tdfutuL_2_7_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_2_7_Request, ObservableCollection<tdfutuL_2_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_2_7_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_账户_查询资产账户持仓
        /// </summary>
        public IWorkCommand<tdfutuL_2_8_Request, ObservableCollection<tdfutuL_2_8_Info>> tdfutuL_2_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_2_8_Request, ObservableCollection<tdfutuL_2_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_2_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_账户_查询交易组持仓明细
        /// </summary>
        public IWorkCommand<tdfutuL_2_9_Request, ObservableCollection<tdfutuL_2_9_Info>> tdfutuL_2_9_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_2_9_Request, ObservableCollection<tdfutuL_2_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_2_9_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易期货_账户_查询历史交易组业务资金
        /// </summary>
        public IWorkCommand<tdfutuL_2_10_Request, ObservableCollection<tdfutuL_2_10_Info>> tdfutuL_2_10_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdfutuL_2_10_Request, ObservableCollection<tdfutuL_2_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdfutuL_2_10_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
