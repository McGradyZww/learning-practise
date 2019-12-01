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
    public partial class ClearSecuPublicCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_清算证券_公用_数据归历史
        /// </summary>
        public IWorkCommand<clsecuL_1_21_Request, ObservableCollection<clsecuL_1_21_Info>> clsecuL_1_21_Command
        {
            get
            {
                return new WorkCommand<clsecuL_1_21_Request, ObservableCollection<clsecuL_1_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_1_21_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_公用_重做准备
        /// </summary>
        public IWorkCommand<clsecuL_1_41_Request, ObservableCollection<clsecuL_1_41_Info>> clsecuL_1_41_Command
        {
            get
            {
                return new WorkCommand<clsecuL_1_41_Request, ObservableCollection<clsecuL_1_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_1_41_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_公用_处理流程统计
        /// </summary>
        public IWorkCommand<clsecuL_1_42_Request, ObservableCollection<clsecuL_1_42_Info>> clsecuL_1_42_Command
        {
            get
            {
                return new WorkCommand<clsecuL_1_42_Request, ObservableCollection<clsecuL_1_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_1_42_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_公用_查询处理流程统计数据
        /// </summary>
        public IWorkCommand<clsecuL_1_43_Request, ObservableCollection<clsecuL_1_43_Info>> clsecuL_1_43_Command
        {
            get
            {
                return new WorkCommand<clsecuL_1_43_Request, ObservableCollection<clsecuL_1_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_1_43_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_公用_检查处理流程正确性
        /// </summary>
        public IWorkCommand<clsecuL_1_44_Request, ObservableCollection<clsecuL_1_44_Info>> clsecuL_1_44_Command
        {
            get
            {
                return new WorkCommand<clsecuL_1_44_Request, ObservableCollection<clsecuL_1_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_1_44_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_公用_数据归历史定时任务
        /// </summary>
        public IWorkCommand<clsecuL_1_51_Request, ObservableCollection<clsecuL_1_51_Info>> clsecuL_1_51_Command
        {
            get
            {
                return new WorkCommand<clsecuL_1_51_Request, ObservableCollection<clsecuL_1_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_1_51_InfoList;
                });
            }
        }

    }
}
