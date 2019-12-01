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
    public partial class ClearFutuPublicCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_清算期货_公用_数据归历史
        /// </summary>
        public IWorkCommand<clfutuL_1_21_Request, ObservableCollection<clfutuL_1_21_Info>> clfutuL_1_21_Command
        {
            get
            {
                return new WorkCommand<clfutuL_1_21_Request, ObservableCollection<clfutuL_1_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_1_21_InfoList;
                });
            }
        }

    }
}
