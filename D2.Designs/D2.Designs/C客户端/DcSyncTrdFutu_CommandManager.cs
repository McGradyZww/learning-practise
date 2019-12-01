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
    public partial class DcSyncTrdFutuCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_数据同步_交易期货同步_同步交易组业务资金表
        /// </summary>
        public IWorkCommand<dcsyncL_6_12_Request, ObservableCollection<dcsyncL_6_12_Info>> dcsyncL_6_12_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_6_12_Request, ObservableCollection<dcsyncL_6_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_6_12_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_数据同步_交易期货同步_同步资产账户业务资金表
        /// </summary>
        public IWorkCommand<dcsyncL_6_13_Request, ObservableCollection<dcsyncL_6_13_Info>> dcsyncL_6_13_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_6_13_Request, ObservableCollection<dcsyncL_6_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_6_13_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_数据同步_交易期货同步_同步交易组业务持仓表
        /// </summary>
        public IWorkCommand<dcsyncL_6_14_Request, ObservableCollection<dcsyncL_6_14_Info>> dcsyncL_6_14_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_6_14_Request, ObservableCollection<dcsyncL_6_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_6_14_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_数据同步_交易期货同步_同步资产账户业务持仓表
        /// </summary>
        public IWorkCommand<dcsyncL_6_15_Request, ObservableCollection<dcsyncL_6_15_Info>> dcsyncL_6_15_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_6_15_Request, ObservableCollection<dcsyncL_6_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_6_15_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_数据同步_交易期货同步_同步交易组持仓明细表
        /// </summary>
        public IWorkCommand<dcsyncL_6_16_Request, ObservableCollection<dcsyncL_6_16_Info>> dcsyncL_6_16_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_6_16_Request, ObservableCollection<dcsyncL_6_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_6_16_InfoList;
                });
            }
        }

    }
}
