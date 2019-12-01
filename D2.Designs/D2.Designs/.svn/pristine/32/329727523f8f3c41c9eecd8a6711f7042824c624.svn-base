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
    public partial class DcSyncProductFutuCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_数据同步_产品期货同步_同步交易组资金表
        /// </summary>
        public IWorkCommand<dcsyncL_4_12_Request, ObservableCollection<dcsyncL_4_12_Info>> dcsyncL_4_12_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_4_12_Request, ObservableCollection<dcsyncL_4_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_4_12_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_数据同步_产品期货同步_同步交易组资产表
        /// </summary>
        public IWorkCommand<dcsyncL_4_13_Request, ObservableCollection<dcsyncL_4_13_Info>> dcsyncL_4_13_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_4_13_Request, ObservableCollection<dcsyncL_4_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_4_13_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_数据同步_产品期货同步_同步资产账户资金表
        /// </summary>
        public IWorkCommand<dcsyncL_4_14_Request, ObservableCollection<dcsyncL_4_14_Info>> dcsyncL_4_14_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_4_14_Request, ObservableCollection<dcsyncL_4_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_4_14_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_数据同步_产品期货同步_同步交易组持仓表
        /// </summary>
        public IWorkCommand<dcsyncL_4_15_Request, ObservableCollection<dcsyncL_4_15_Info>> dcsyncL_4_15_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_4_15_Request, ObservableCollection<dcsyncL_4_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_4_15_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_数据同步_产品期货同步_同步资产账户持仓表
        /// </summary>
        public IWorkCommand<dcsyncL_4_16_Request, ObservableCollection<dcsyncL_4_16_Info>> dcsyncL_4_16_Command
        {
            get
            {
                return new WorkCommand<dcsyncL_4_16_Request, ObservableCollection<dcsyncL_4_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).dcsyncL_4_16_InfoList;
                });
            }
        }

    }
}
