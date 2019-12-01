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
    public partial class ClearFoFutuClearCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_清算外盘期货_清算_转入订单记录
        /// </summary>
        public IWorkCommand<clfofuL_2_1_Request, ObservableCollection<clfofuL_2_1_Info>> clfofuL_2_1_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_1_Request, ObservableCollection<clfofuL_2_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_查询订单记录
        /// </summary>
        public IWorkCommand<clfofuL_2_4_Request, ObservableCollection<clfofuL_2_4_Info>> clfofuL_2_4_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_4_Request, ObservableCollection<clfofuL_2_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_4_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_转入成交记录
        /// </summary>
        public IWorkCommand<clfofuL_2_6_Request, ObservableCollection<clfofuL_2_6_Info>> clfofuL_2_6_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_6_Request, ObservableCollection<clfofuL_2_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_6_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_查询成交记录
        /// </summary>
        public IWorkCommand<clfofuL_2_9_Request, ObservableCollection<clfofuL_2_9_Info>> clfofuL_2_9_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_9_Request, ObservableCollection<clfofuL_2_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_9_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_清算处理
        /// </summary>
        public IWorkCommand<clfofuL_2_31_Request, ObservableCollection<clfofuL_2_31_Info>> clfofuL_2_31_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_31_Request, ObservableCollection<clfofuL_2_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_31_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_订单费用处理
        /// </summary>
        public IWorkCommand<clfofuL_2_32_Request, ObservableCollection<clfofuL_2_32_Info>> clfofuL_2_32_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_32_Request, ObservableCollection<clfofuL_2_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_32_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_合并清算处理
        /// </summary>
        public IWorkCommand<clfofuL_2_33_Request, ObservableCollection<clfofuL_2_33_Info>> clfofuL_2_33_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_33_Request, ObservableCollection<clfofuL_2_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_33_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_查询合并清算记录
        /// </summary>
        public IWorkCommand<clfofuL_2_34_Request, ObservableCollection<clfofuL_2_34_Info>> clfofuL_2_34_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_34_Request, ObservableCollection<clfofuL_2_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_34_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_查询待入账记录
        /// </summary>
        public IWorkCommand<clfofuL_2_35_Request, ObservableCollection<clfofuL_2_35_Info>> clfofuL_2_35_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_35_Request, ObservableCollection<clfofuL_2_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_35_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_入账处理
        /// </summary>
        public IWorkCommand<clfofuL_2_51_Request, ObservableCollection<clfofuL_2_51_Info>> clfofuL_2_51_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_51_Request, ObservableCollection<clfofuL_2_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_51_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_入账回滚处理
        /// </summary>
        public IWorkCommand<clfofuL_2_52_Request, ObservableCollection<clfofuL_2_52_Info>> clfofuL_2_52_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_52_Request, ObservableCollection<clfofuL_2_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_52_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_数据归历史
        /// </summary>
        public IWorkCommand<clfofuL_2_71_Request, ObservableCollection<clfofuL_2_71_Info>> clfofuL_2_71_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_71_Request, ObservableCollection<clfofuL_2_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_71_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_数据准备定时任务
        /// </summary>
        public IWorkCommand<clfofuL_2_101_Request, ObservableCollection<clfofuL_2_101_Info>> clfofuL_2_101_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_101_Request, ObservableCollection<clfofuL_2_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_101_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_成交配对定时任务
        /// </summary>
        public IWorkCommand<clfutuL_2_102_Request, ObservableCollection<clfutuL_2_102_Info>> clfutuL_2_102_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_102_Request, ObservableCollection<clfutuL_2_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_102_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_清算处理定时任务
        /// </summary>
        public IWorkCommand<clfofuL_2_103_Request, ObservableCollection<clfofuL_2_103_Info>> clfofuL_2_103_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_103_Request, ObservableCollection<clfofuL_2_103_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_103_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_入账定时任务
        /// </summary>
        public IWorkCommand<clfofuL_2_104_Request, ObservableCollection<clfofuL_2_104_Info>> clfofuL_2_104_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_104_Request, ObservableCollection<clfofuL_2_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_104_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_清算_数据归历史定时任务
        /// </summary>
        public IWorkCommand<clfofuL_2_106_Request, ObservableCollection<clfofuL_2_106_Info>> clfofuL_2_106_Command
        {
            get
            {
                return new WorkCommand<clfofuL_2_106_Request, ObservableCollection<clfofuL_2_106_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_2_106_InfoList;
                });
            }
        }

    }
}
