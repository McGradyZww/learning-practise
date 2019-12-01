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
    public partial class RiskSecuIFCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_风控证券_接口_计算更新证券风险监控数据
        /// </summary>
        public IWorkCommand<rksecuL_5_16_Request, ObservableCollection<rksecuL_5_16_Info>> rksecuL_5_16_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_5_16_Request, ObservableCollection<rksecuL_5_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_5_16_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_接口_计算更新账户风险监控数据
        /// </summary>
        public IWorkCommand<rksecuL_5_17_Request, ObservableCollection<rksecuL_5_17_Info>> rksecuL_5_17_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_5_17_Request, ObservableCollection<rksecuL_5_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_5_17_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_接口_计算t0操作员阀值
        /// </summary>
        public IWorkCommand<rksecuL_5_18_Request, ObservableCollection<rksecuL_5_18_Info>> rksecuL_5_18_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_5_18_Request, ObservableCollection<rksecuL_5_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_5_18_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_接口_计算t0操作员汇总阀值
        /// </summary>
        public IWorkCommand<rksecuL_5_19_Request, ObservableCollection<rksecuL_5_19_Info>> rksecuL_5_19_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_5_19_Request, ObservableCollection<rksecuL_5_19_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_5_19_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_接口_计算更新操作员风险监控数据
        /// </summary>
        public IWorkCommand<rksecuL_5_20_Request, ObservableCollection<rksecuL_5_20_Info>> rksecuL_5_20_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_5_20_Request, ObservableCollection<rksecuL_5_20_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_5_20_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_接口_查询风控服务器资产账户资产
        /// </summary>
        public IWorkCommand<rksecuL_5_21_Request, ObservableCollection<rksecuL_5_21_Info>> rksecuL_5_21_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_5_21_Request, ObservableCollection<rksecuL_5_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_5_21_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_接口_单条检查客户风险
        /// </summary>
        public IWorkCommand<rksecuL_5_22_Request, ObservableCollection<rksecuL_5_22_Info>> rksecuL_5_22_Command
        {
            get
            {
                return new WorkCommand<rksecuL_5_22_Request, ObservableCollection<rksecuL_5_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rksecuL_5_22_InfoList;
                });
            }
        }

    }
}
