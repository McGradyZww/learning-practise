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
    public partial class TrdFutuPublicCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_交易期货_公用_更新报盘机状态
        /// </summary>
        public IWorkCommand<tdfutuL_1_1_Request, ObservableCollection<tdfutuL_1_1_Info>> tdfutuL_1_1_Command
        {
            get
            {
                return new WorkCommand<tdfutuL_1_1_Request, ObservableCollection<tdfutuL_1_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdfutuL_1_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易期货_公用_获取业务记录编号
        /// </summary>
        public IWorkCommand<tdfutuL_1_2_Request, ObservableCollection<tdfutuL_1_2_Info>> tdfutuL_1_2_Command
        {
            get
            {
                return new WorkCommand<tdfutuL_1_2_Request, ObservableCollection<tdfutuL_1_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdfutuL_1_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易期货_公用_数据归历史
        /// </summary>
        public IWorkCommand<tdfutuL_1_3_Request, ObservableCollection<tdfutuL_1_3_Info>> tdfutuL_1_3_Command
        {
            get
            {
                return new WorkCommand<tdfutuL_1_3_Request, ObservableCollection<tdfutuL_1_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdfutuL_1_3_InfoList;
                });
            }
        }

    }
}
