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
    public partial class ClearFutuSettCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_清算期货_结算_结算处理
        /// </summary>
        public IWorkCommand<clfutuL_3_31_Request, ObservableCollection<clfutuL_3_31_Info>> clfutuL_3_31_Command
        {
            get
            {
                return new WorkCommand<clfutuL_3_31_Request, ObservableCollection<clfutuL_3_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_3_31_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_结算_查询待入账记录
        /// </summary>
        public IWorkCommand<clfutuL_3_45_Request, ObservableCollection<clfutuL_3_45_Info>> clfutuL_3_45_Command
        {
            get
            {
                return new WorkCommand<clfutuL_3_45_Request, ObservableCollection<clfutuL_3_45_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_3_45_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_结算_入账处理
        /// </summary>
        public IWorkCommand<clfutuL_3_46_Request, ObservableCollection<clfutuL_3_46_Info>> clfutuL_3_46_Command
        {
            get
            {
                return new WorkCommand<clfutuL_3_46_Request, ObservableCollection<clfutuL_3_46_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_3_46_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_结算_入账回滚处理
        /// </summary>
        public IWorkCommand<clfutuL_3_47_Request, ObservableCollection<clfutuL_3_47_Info>> clfutuL_3_47_Command
        {
            get
            {
                return new WorkCommand<clfutuL_3_47_Request, ObservableCollection<clfutuL_3_47_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_3_47_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_结算_结算处理定时任务
        /// </summary>
        public IWorkCommand<clfutuL_3_105_Request, ObservableCollection<clfutuL_3_105_Info>> clfutuL_3_105_Command
        {
            get
            {
                return new WorkCommand<clfutuL_3_105_Request, ObservableCollection<clfutuL_3_105_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_3_105_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_结算_入账处理定时任务
        /// </summary>
        public IWorkCommand<clfutuL_3_104_Request, ObservableCollection<clfutuL_3_104_Info>> clfutuL_3_104_Command
        {
            get
            {
                return new WorkCommand<clfutuL_3_104_Request, ObservableCollection<clfutuL_3_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_3_104_InfoList;
                });
            }
        }

    }
}
