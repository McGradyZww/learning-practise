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
    public partial class PublicIFCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_公共_公共接口_获取上一交易日期
        /// </summary>
        public IWorkCommand<pubL_24_1_Request, ObservableCollection<pubL_24_1_Info>> pubL_24_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_24_1_Request, ObservableCollection<pubL_24_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_24_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_公共接口_获取操作员操作权限串
        /// </summary>
        public IWorkCommand<pubL_24_2_Request, ObservableCollection<pubL_24_2_Info>> pubL_24_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_24_2_Request, ObservableCollection<pubL_24_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_24_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
