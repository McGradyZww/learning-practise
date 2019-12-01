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
    public partial class ProductFutuAccoBackCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_产品期货_账户运维_查询全部期货账户
        /// </summary>
        public IWorkCommand<pdfutuL_7_1_Request, ObservableCollection<pdfutuL_7_1_Info>> pdfutuL_7_1_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_7_1_Request, ObservableCollection<pdfutuL_7_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_7_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户运维_归档产品期货数据
        /// </summary>
        public IWorkCommand<pdfutuL_7_11_Request, ObservableCollection<pdfutuL_7_11_Info>> pdfutuL_7_11_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_7_11_Request, ObservableCollection<pdfutuL_7_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_7_11_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户运维_新增期货账户信息
        /// </summary>
        public IWorkCommand<pdfutuL_7_2_Request, ObservableCollection<pdfutuL_7_2_Info>> pdfutuL_7_2_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_7_2_Request, ObservableCollection<pdfutuL_7_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_7_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户运维_修改期货账户信息
        /// </summary>
        public IWorkCommand<pdfutuL_7_3_Request, ObservableCollection<pdfutuL_7_3_Info>> pdfutuL_7_3_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_7_3_Request, ObservableCollection<pdfutuL_7_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_7_3_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户运维_删除期货账户信息
        /// </summary>
        public IWorkCommand<pdfutuL_7_4_Request, ObservableCollection<pdfutuL_7_4_Info>> pdfutuL_7_4_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_7_4_Request, ObservableCollection<pdfutuL_7_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_7_4_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户运维_查询期货账户信息
        /// </summary>
        public IWorkCommand<pdfutuL_7_5_Request, ObservableCollection<pdfutuL_7_5_Info>> pdfutuL_7_5_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_7_5_Request, ObservableCollection<pdfutuL_7_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_7_5_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户运维_冻结期货账户
        /// </summary>
        public IWorkCommand<pdfutuL_7_6_Request, ObservableCollection<pdfutuL_7_6_Info>> pdfutuL_7_6_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_7_6_Request, ObservableCollection<pdfutuL_7_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_7_6_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户运维_恢复期货账户
        /// </summary>
        public IWorkCommand<pdfutuL_7_7_Request, ObservableCollection<pdfutuL_7_7_Info>> pdfutuL_7_7_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_7_7_Request, ObservableCollection<pdfutuL_7_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_7_7_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户运维_注销期货账户
        /// </summary>
        public IWorkCommand<pdfutuL_7_8_Request, ObservableCollection<pdfutuL_7_8_Info>> pdfutuL_7_8_Command
        {
            get
            {
                return new WorkCommand<pdfutuL_7_8_Request, ObservableCollection<pdfutuL_7_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdfutuL_7_8_InfoList;
                });
            }
        }

    }
}
