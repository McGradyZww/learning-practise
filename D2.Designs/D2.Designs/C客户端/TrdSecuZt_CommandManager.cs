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
    public partial class TrdSecuZtCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_交易证券_中泰_撤销指令
        /// </summary>
        public IWorkCommand<tdsecuL_7_1_Request, ObservableCollection<tdsecuL_7_1_Info>> tdsecuL_7_1_Command
        {
            get
            {
                return new WorkCommand<tdsecuL_7_1_Request, ObservableCollection<tdsecuL_7_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdsecuL_7_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易证券_中泰_新增组合指令
        /// </summary>
        public IWorkCommand<tdsecuL_7_2_Request, ObservableCollection<tdsecuL_7_2_Info>> tdsecuL_7_2_Command
        {
            get
            {
                return new WorkCommand<tdsecuL_7_2_Request, ObservableCollection<tdsecuL_7_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdsecuL_7_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易证券_中泰_新增组合订单
        /// </summary>
        public IWorkCommand<tdsecuL_7_3_Request, ObservableCollection<tdsecuL_7_3_Info>> tdsecuL_7_3_Command
        {
            get
            {
                return new WorkCommand<tdsecuL_7_3_Request, ObservableCollection<tdsecuL_7_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdsecuL_7_3_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易证券_中泰_撤销订单
        /// </summary>
        public IWorkCommand<tdsecuL_7_4_Request, ObservableCollection<tdsecuL_7_4_Info>> tdsecuL_7_4_Command
        {
            get
            {
                return new WorkCommand<tdsecuL_7_4_Request, ObservableCollection<tdsecuL_7_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdsecuL_7_4_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易证券_中泰_新增改单
        /// </summary>
        public IWorkCommand<tdsecuL_7_5_Request, ObservableCollection<tdsecuL_7_5_Info>> tdsecuL_7_5_Command
        {
            get
            {
                return new WorkCommand<tdsecuL_7_5_Request, ObservableCollection<tdsecuL_7_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdsecuL_7_5_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易证券_中泰_指令有效期处理
        /// </summary>
        public IWorkCommand<tdsecuL_7_6_Request, ObservableCollection<tdsecuL_7_6_Info>> tdsecuL_7_6_Command
        {
            get
            {
                return new WorkCommand<tdsecuL_7_6_Request, ObservableCollection<tdsecuL_7_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdsecuL_7_6_InfoList;
                });
            }
        }

    }
}
