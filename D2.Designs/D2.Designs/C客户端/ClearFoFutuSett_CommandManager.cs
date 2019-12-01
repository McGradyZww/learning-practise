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
    public partial class ClearFoFutuSettCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_清算外盘期货_结算_增加合约交割参数记录
        /// </summary>
        public IWorkCommand<clfofuL_3_1_Request, ObservableCollection<clfofuL_3_1_Info>> clfofuL_3_1_Command
        {
            get
            {
                return new WorkCommand<clfofuL_3_1_Request, ObservableCollection<clfofuL_3_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_3_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_结算_修改合约交割参数记录
        /// </summary>
        public IWorkCommand<clfofuL_3_2_Request, ObservableCollection<clfofuL_3_2_Info>> clfofuL_3_2_Command
        {
            get
            {
                return new WorkCommand<clfofuL_3_2_Request, ObservableCollection<clfofuL_3_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_3_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_结算_删除合约交割参数记录
        /// </summary>
        public IWorkCommand<clfofuL_3_3_Request, ObservableCollection<clfofuL_3_3_Info>> clfofuL_3_3_Command
        {
            get
            {
                return new WorkCommand<clfofuL_3_3_Request, ObservableCollection<clfofuL_3_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_3_3_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_结算_查询合约交割参数记录
        /// </summary>
        public IWorkCommand<clfofuL_3_4_Request, ObservableCollection<clfofuL_3_4_Info>> clfofuL_3_4_Command
        {
            get
            {
                return new WorkCommand<clfofuL_3_4_Request, ObservableCollection<clfofuL_3_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_3_4_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_结算_查询组合占用保证金记录
        /// </summary>
        public IWorkCommand<clfofuL_3_9_Request, ObservableCollection<clfofuL_3_9_Info>> clfofuL_3_9_Command
        {
            get
            {
                return new WorkCommand<clfofuL_3_9_Request, ObservableCollection<clfofuL_3_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_3_9_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_结算_结算处理
        /// </summary>
        public IWorkCommand<clfofuL_3_31_Request, ObservableCollection<clfofuL_3_31_Info>> clfofuL_3_31_Command
        {
            get
            {
                return new WorkCommand<clfofuL_3_31_Request, ObservableCollection<clfofuL_3_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_3_31_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_结算_查询待入账记录
        /// </summary>
        public IWorkCommand<clfofuL_3_35_Request, ObservableCollection<clfofuL_3_35_Info>> clfofuL_3_35_Command
        {
            get
            {
                return new WorkCommand<clfofuL_3_35_Request, ObservableCollection<clfofuL_3_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_3_35_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_结算_入账处理
        /// </summary>
        public IWorkCommand<clfofuL_3_51_Request, ObservableCollection<clfofuL_3_51_Info>> clfofuL_3_51_Command
        {
            get
            {
                return new WorkCommand<clfofuL_3_51_Request, ObservableCollection<clfofuL_3_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_3_51_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_结算_入账回滚处理
        /// </summary>
        public IWorkCommand<clfofuL_3_52_Request, ObservableCollection<clfofuL_3_52_Info>> clfofuL_3_52_Command
        {
            get
            {
                return new WorkCommand<clfofuL_3_52_Request, ObservableCollection<clfofuL_3_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_3_52_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_结算_数据归历史
        /// </summary>
        public IWorkCommand<clfofuL_3_71_Request, ObservableCollection<clfofuL_3_71_Info>> clfofuL_3_71_Command
        {
            get
            {
                return new WorkCommand<clfofuL_3_71_Request, ObservableCollection<clfofuL_3_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_3_71_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_结算_结算处理定时任务
        /// </summary>
        public IWorkCommand<clfofuL_3_102_Request, ObservableCollection<clfofuL_3_102_Info>> clfofuL_3_102_Command
        {
            get
            {
                return new WorkCommand<clfofuL_3_102_Request, ObservableCollection<clfofuL_3_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_3_102_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_结算_入账处理定时任务
        /// </summary>
        public IWorkCommand<clfofuL_3_104_Request, ObservableCollection<clfofuL_3_104_Info>> clfofuL_3_104_Command
        {
            get
            {
                return new WorkCommand<clfofuL_3_104_Request, ObservableCollection<clfofuL_3_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_3_104_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算外盘期货_结算_数据归历史定时任务
        /// </summary>
        public IWorkCommand<clfofuL_3_106_Request, ObservableCollection<clfofuL_3_106_Info>> clfofuL_3_106_Command
        {
            get
            {
                return new WorkCommand<clfofuL_3_106_Request, ObservableCollection<clfofuL_3_106_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfofuL_3_106_InfoList;
                });
            }
        }

    }
}
