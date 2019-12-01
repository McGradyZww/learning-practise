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
    public partial class ClearSecuBaseDataSyncCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_清算证券_基础数据同步_查询公司行为表
        /// </summary>
        public IWorkCommand<clsecuL_4_101_Request, ObservableCollection<clsecuL_4_101_Info>> clsecuL_4_101_Command
        {
            get
            {
                return new WorkCommand<clsecuL_4_101_Request, ObservableCollection<clsecuL_4_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_4_101_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_基础数据同步_更新公司行为表
        /// </summary>
        public IWorkCommand<clsecuL_4_102_Request, ObservableCollection<clsecuL_4_102_Info>> clsecuL_4_102_Command
        {
            get
            {
                return new WorkCommand<clsecuL_4_102_Request, ObservableCollection<clsecuL_4_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_4_102_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_基础数据同步_更新公司行为信息
        /// </summary>
        public IWorkCommand<clsecuL_4_103_Request, ObservableCollection<clsecuL_4_103_Info>> clsecuL_4_103_Command
        {
            get
            {
                return new WorkCommand<clsecuL_4_103_Request, ObservableCollection<clsecuL_4_103_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_4_103_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_基础数据同步_更新债券兑付信息
        /// </summary>
        public IWorkCommand<clsecuL_4_104_Request, ObservableCollection<clsecuL_4_104_Info>> clsecuL_4_104_Command
        {
            get
            {
                return new WorkCommand<clsecuL_4_104_Request, ObservableCollection<clsecuL_4_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_4_104_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_基础数据同步_更新债券兑息信息
        /// </summary>
        public IWorkCommand<clsecuL_4_105_Request, ObservableCollection<clsecuL_4_105_Info>> clsecuL_4_105_Command
        {
            get
            {
                return new WorkCommand<clsecuL_4_105_Request, ObservableCollection<clsecuL_4_105_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_4_105_InfoList;
                });
            }
        }

    }
}
