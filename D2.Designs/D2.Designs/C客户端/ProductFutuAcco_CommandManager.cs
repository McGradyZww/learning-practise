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
    public partial class ProductFutuAccoCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_产品期货_账户_检查期货账户存在
        /// </summary>
        public IWorkCommand<pdfutuL_1_40_Request, ObservableCollection<pdfutuL_1_40_Info>> pdfutuL_1_40_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_1_40_Request, ObservableCollection<pdfutuL_1_40_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_1_40_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户_新增期货账户信息
        /// </summary>
        public IWorkCommand<pdfutuL_1_41_Request, ObservableCollection<pdfutuL_1_41_Info>> pdfutuL_1_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_1_41_Request, ObservableCollection<pdfutuL_1_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_1_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户_修改期货账户信息
        /// </summary>
        public IWorkCommand<pdfutuL_1_42_Request, ObservableCollection<pdfutuL_1_42_Info>> pdfutuL_1_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_1_42_Request, ObservableCollection<pdfutuL_1_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_1_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户_删除期货账户信息
        /// </summary>
        public IWorkCommand<pdfutuL_1_43_Request, ObservableCollection<pdfutuL_1_43_Info>> pdfutuL_1_43_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_1_43_Request, ObservableCollection<pdfutuL_1_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_1_43_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户_查询期货账户信息
        /// </summary>
        public IWorkCommand<pdfutuL_1_44_Request, ObservableCollection<pdfutuL_1_44_Info>> pdfutuL_1_44_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_1_44_Request, ObservableCollection<pdfutuL_1_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_1_44_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户_查询期货账户信息流水
        /// </summary>
        public IWorkCommand<pdfutuL_1_45_Request, ObservableCollection<pdfutuL_1_45_Info>> pdfutuL_1_45_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_1_45_Request, ObservableCollection<pdfutuL_1_45_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_1_45_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户_查询历史期货账户信息流水
        /// </summary>
        public IWorkCommand<pdfutuL_1_46_Request, ObservableCollection<pdfutuL_1_46_Info>> pdfutuL_1_46_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_1_46_Request, ObservableCollection<pdfutuL_1_46_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_1_46_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户_冻结期货账户
        /// </summary>
        public IWorkCommand<pdfutuL_1_47_Request, ObservableCollection<pdfutuL_1_47_Info>> pdfutuL_1_47_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_1_47_Request, ObservableCollection<pdfutuL_1_47_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_1_47_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户_恢复期货账户
        /// </summary>
        public IWorkCommand<pdfutuL_1_48_Request, ObservableCollection<pdfutuL_1_48_Info>> pdfutuL_1_48_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_1_48_Request, ObservableCollection<pdfutuL_1_48_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_1_48_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户_注销期货账户
        /// </summary>
        public IWorkCommand<pdfutuL_1_49_Request, ObservableCollection<pdfutuL_1_49_Info>> pdfutuL_1_49_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_1_49_Request, ObservableCollection<pdfutuL_1_49_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_1_49_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户_查询期货账户列表
        /// </summary>
        public IWorkCommand<pdfutuL_1_51_Request, ObservableCollection<pdfutuL_1_51_Info>> pdfutuL_1_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_1_51_Request, ObservableCollection<pdfutuL_1_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_1_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_账户_查询报盘所需资产账户证券账户信息
        /// </summary>
        public IWorkCommand<pdfutuL_1_501_Request, ObservableCollection<pdfutuL_1_501_Info>> pdfutuL_1_501_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_1_501_Request, ObservableCollection<pdfutuL_1_501_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_1_501_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
