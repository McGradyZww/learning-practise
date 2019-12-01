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
    public partial class RiskFutuRiskCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_风控期货_风控_增加客户风险规则记录
        /// </summary>
        public IWorkCommand<rkfutuL_3_1_Request, ObservableCollection<rkfutuL_3_1_Info>> rkfutuL_3_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_3_1_Request, ObservableCollection<rkfutuL_3_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_3_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_风控_删除客户风险规则记录
        /// </summary>
        public IWorkCommand<rkfutuL_3_2_Request, ObservableCollection<rkfutuL_3_2_Info>> rkfutuL_3_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_3_2_Request, ObservableCollection<rkfutuL_3_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_3_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_风控_查询客户风险规则记录
        /// </summary>
        public IWorkCommand<rkfutuL_3_3_Request, ObservableCollection<rkfutuL_3_3_Info>> rkfutuL_3_3_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_3_3_Request, ObservableCollection<rkfutuL_3_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_3_3_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_风控_获取客户风险要素
        /// </summary>
        public IWorkCommand<rkfutuL_3_4_Request, ObservableCollection<rkfutuL_3_4_Info>> rkfutuL_3_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_3_4_Request, ObservableCollection<rkfutuL_3_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_3_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_风控_试算检查客户风险
        /// </summary>
        public IWorkCommand<rkfutuL_3_5_Request, ObservableCollection<rkfutuL_3_5_Info>> rkfutuL_3_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_3_5_Request, ObservableCollection<rkfutuL_3_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_3_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_风控_客户风险触警流水查询
        /// </summary>
        public IWorkCommand<rkfutuL_3_6_Request, ObservableCollection<rkfutuL_3_6_Info>> rkfutuL_3_6_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_3_6_Request, ObservableCollection<rkfutuL_3_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_3_6_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_风控_模板查询客户产品交易组
        /// </summary>
        public IWorkCommand<rkfutuL_3_7_Request, ObservableCollection<rkfutuL_3_7_Info>> rkfutuL_3_7_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_3_7_Request, ObservableCollection<rkfutuL_3_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_3_7_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_风控_客户风险触警历史流水查询
        /// </summary>
        public IWorkCommand<rkfutuL_3_8_Request, ObservableCollection<rkfutuL_3_8_Info>> rkfutuL_3_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_3_8_Request, ObservableCollection<rkfutuL_3_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_3_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_风控_批量试算检查客户风险
        /// </summary>
        public IWorkCommand<rkfutuL_3_9_Request, ObservableCollection<rkfutuL_3_9_Info>> rkfutuL_3_9_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_3_9_Request, ObservableCollection<rkfutuL_3_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_3_9_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
