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
    public partial class TrdSecuStrategyIFCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_交易证券_策略接口_新增母单
        /// </summary>
        public IWorkCommand<tdsecuL_11_11_Request, ObservableCollection<tdsecuL_11_11_Info>> tdsecuL_11_11_Command
        {
            get
            {
                return new WorkCommand<tdsecuL_11_11_Request, ObservableCollection<tdsecuL_11_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdsecuL_11_11_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易证券_策略接口_修改母单
        /// </summary>
        public IWorkCommand<tdsecuL_11_12_Request, ObservableCollection<tdsecuL_11_12_Info>> tdsecuL_11_12_Command
        {
            get
            {
                return new WorkCommand<tdsecuL_11_12_Request, ObservableCollection<tdsecuL_11_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdsecuL_11_12_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易证券_策略接口_撤销母单
        /// </summary>
        public IWorkCommand<tdsecuL_11_13_Request, ObservableCollection<tdsecuL_11_13_Info>> tdsecuL_11_13_Command
        {
            get
            {
                return new WorkCommand<tdsecuL_11_13_Request, ObservableCollection<tdsecuL_11_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdsecuL_11_13_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易证券_策略接口_查询母单
        /// </summary>
        public IWorkCommand<tdsecuL_11_101_Request, ObservableCollection<tdsecuL_11_101_Info>> tdsecuL_11_101_Command
        {
            get
            {
                return new WorkCommand<tdsecuL_11_101_Request, ObservableCollection<tdsecuL_11_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdsecuL_11_101_InfoList;
                });
            }
        }

    }
}
