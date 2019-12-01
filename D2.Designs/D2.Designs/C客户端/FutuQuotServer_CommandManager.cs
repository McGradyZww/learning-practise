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
    public partial class FutuQuotServerCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_公共_期货行情服务_请求行情快照
        /// </summary>
        public IWorkCommand<pubL_14_1_Request, ObservableCollection<pubL_14_1_Info>> pubL_14_1_Command
        {
            get
            {
                return new WorkCommand<pubL_14_1_Request, ObservableCollection<pubL_14_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_14_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_期货行情服务_主推实时行情
        /// </summary>
        public IWorkCommand<pubL_14_2_Request, ObservableCollection<pubL_14_2_Info>> pubL_14_2_Command
        {
            get
            {
                return new WorkCommand<pubL_14_2_Request, ObservableCollection<pubL_14_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_14_2_InfoList;
                });
            }
        }

    }
}
