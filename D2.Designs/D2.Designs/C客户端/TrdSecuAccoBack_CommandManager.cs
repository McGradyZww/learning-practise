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
    public partial class TrdSecuAccoBackCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_交易证券_账户运维_查询资产账户持仓
        /// </summary>
        public IWorkCommand<tdsecuL_12_88_Request, ObservableCollection<tdsecuL_12_88_Info>> tdsecuL_12_88_Command
        {
            get
            {
                return new WorkCommand<tdsecuL_12_88_Request, ObservableCollection<tdsecuL_12_88_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdsecuL_12_88_InfoList;
                });
            }
        }

    }
}
