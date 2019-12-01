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
    public partial class ProductCapitalBackCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_产品_资金运维_查询产品资金
        /// </summary>
        public IWorkCommand<prodL_4_1_Request, ObservableCollection<prodL_4_1_Info>> prodL_4_1_Command
        {
            get
            {
                return new WorkCommand<prodL_4_1_Request, ObservableCollection<prodL_4_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_4_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_资金运维_查询历史产品资金
        /// </summary>
        public IWorkCommand<prodL_4_2_Request, ObservableCollection<prodL_4_2_Info>> prodL_4_2_Command
        {
            get
            {
                return new WorkCommand<prodL_4_2_Request, ObservableCollection<prodL_4_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_4_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_资金运维_查询产品资金流水
        /// </summary>
        public IWorkCommand<prodL_4_5_Request, ObservableCollection<prodL_4_5_Info>> prodL_4_5_Command
        {
            get
            {
                return new WorkCommand<prodL_4_5_Request, ObservableCollection<prodL_4_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_4_5_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_资金运维_查询历史产品资金流水
        /// </summary>
        public IWorkCommand<prodL_4_6_Request, ObservableCollection<prodL_4_6_Info>> prodL_4_6_Command
        {
            get
            {
                return new WorkCommand<prodL_4_6_Request, ObservableCollection<prodL_4_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_4_6_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_资金运维_查询产品资产
        /// </summary>
        public IWorkCommand<prodL_4_7_Request, ObservableCollection<prodL_4_7_Info>> prodL_4_7_Command
        {
            get
            {
                return new WorkCommand<prodL_4_7_Request, ObservableCollection<prodL_4_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_4_7_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_资金运维_查询历史产品资产
        /// </summary>
        public IWorkCommand<prodL_4_8_Request, ObservableCollection<prodL_4_8_Info>> prodL_4_8_Command
        {
            get
            {
                return new WorkCommand<prodL_4_8_Request, ObservableCollection<prodL_4_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_4_8_InfoList;
                });
            }
        }

    }
}
