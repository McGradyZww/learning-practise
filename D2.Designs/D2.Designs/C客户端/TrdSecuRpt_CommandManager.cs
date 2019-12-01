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
    public partial class TrdSecuRptCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_交易证券_报盘_处理订单回报
        /// </summary>
        public IWorkCommand<tdsecuL_5_1_Request, ObservableCollection<tdsecuL_5_1_Info>> tdsecuL_5_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_1_Request, ObservableCollection<tdsecuL_5_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_处理撤单回报
        /// </summary>
        public IWorkCommand<tdsecuL_5_11_Request, ObservableCollection<tdsecuL_5_11_Info>> tdsecuL_5_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_11_Request, ObservableCollection<tdsecuL_5_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_处理成交回报
        /// </summary>
        public IWorkCommand<tdsecuL_5_21_Request, ObservableCollection<tdsecuL_5_21_Info>> tdsecuL_5_21_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_21_Request, ObservableCollection<tdsecuL_5_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_21_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_处理订单补单回报
        /// </summary>
        public IWorkCommand<tdsecuL_5_31_Request, ObservableCollection<tdsecuL_5_31_Info>> tdsecuL_5_31_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_31_Request, ObservableCollection<tdsecuL_5_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_31_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_修改订单错单
        /// </summary>
        public IWorkCommand<tdsecuL_5_41_Request, ObservableCollection<tdsecuL_5_41_Info>> tdsecuL_5_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_41_Request, ObservableCollection<tdsecuL_5_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_导入成交补单
        /// </summary>
        public IWorkCommand<tdsecuL_5_51_Request, ObservableCollection<tdsecuL_5_51_Info>> tdsecuL_5_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_51_Request, ObservableCollection<tdsecuL_5_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_体外指令成交
        /// </summary>
        public IWorkCommand<tdsecuL_5_52_Request, ObservableCollection<tdsecuL_5_52_Info>> tdsecuL_5_52_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_52_Request, ObservableCollection<tdsecuL_5_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_52_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_体外指令成交回溯
        /// </summary>
        public IWorkCommand<tdsecuL_5_53_Request, ObservableCollection<tdsecuL_5_53_Info>> tdsecuL_5_53_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_53_Request, ObservableCollection<tdsecuL_5_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_53_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_查询订单回报
        /// </summary>
        public IWorkCommand<tdsecuL_5_101_Request, ObservableCollection<tdsecuL_5_101_Info>> tdsecuL_5_101_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_101_Request, ObservableCollection<tdsecuL_5_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_101_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_查询成交回报
        /// </summary>
        public IWorkCommand<tdsecuL_5_121_Request, ObservableCollection<tdsecuL_5_121_Info>> tdsecuL_5_121_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_121_Request, ObservableCollection<tdsecuL_5_121_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_121_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_查询成交明细
        /// </summary>
        public IWorkCommand<tdsecuL_5_122_Request, ObservableCollection<tdsecuL_5_122_Info>> tdsecuL_5_122_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_122_Request, ObservableCollection<tdsecuL_5_122_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_122_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_查询成交明细历史
        /// </summary>
        public IWorkCommand<tdsecuL_5_123_Request, ObservableCollection<tdsecuL_5_123_Info>> tdsecuL_5_123_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_123_Request, ObservableCollection<tdsecuL_5_123_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_123_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_查询成交汇总
        /// </summary>
        public IWorkCommand<tdsecuL_5_124_Request, ObservableCollection<tdsecuL_5_124_Info>> tdsecuL_5_124_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_124_Request, ObservableCollection<tdsecuL_5_124_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_124_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_查询成交汇总历史
        /// </summary>
        public IWorkCommand<tdsecuL_5_125_Request, ObservableCollection<tdsecuL_5_125_Info>> tdsecuL_5_125_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_125_Request, ObservableCollection<tdsecuL_5_125_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_125_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_查询体外交易差额记录
        /// </summary>
        public IWorkCommand<tdsecuL_5_126_Request, ObservableCollection<tdsecuL_5_126_Info>> tdsecuL_5_126_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_126_Request, ObservableCollection<tdsecuL_5_126_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_126_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_查询历史体外交易差额记录
        /// </summary>
        public IWorkCommand<tdsecuL_5_127_Request, ObservableCollection<tdsecuL_5_127_Info>> tdsecuL_5_127_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_127_Request, ObservableCollection<tdsecuL_5_127_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_127_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_导入成交表
        /// </summary>
        public IWorkCommand<tdsecuL_5_128_Request, ObservableCollection<tdsecuL_5_128_Info>> tdsecuL_5_128_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_128_Request, ObservableCollection<tdsecuL_5_128_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_128_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_处理融资融券成交回报
        /// </summary>
        public IWorkCommand<tdsecuL_5_129_Request, ObservableCollection<tdsecuL_5_129_Info>> tdsecuL_5_129_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_129_Request, ObservableCollection<tdsecuL_5_129_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_129_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_融资融券处理撤单回报
        /// </summary>
        public IWorkCommand<tdsecuL_5_130_Request, ObservableCollection<tdsecuL_5_130_Info>> tdsecuL_5_130_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_130_Request, ObservableCollection<tdsecuL_5_130_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_130_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_融资融券处理订单回报
        /// </summary>
        public IWorkCommand<tdsecuL_5_131_Request, ObservableCollection<tdsecuL_5_131_Info>> tdsecuL_5_131_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_5_131_Request, ObservableCollection<tdsecuL_5_131_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_5_131_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_报盘_查询成交回报处理
        /// </summary>
        public IWorkCommand<tdsecuL_5_132_Request, ObservableCollection<tdsecuL_5_132_Info>> tdsecuL_5_132_Command
        {
            get
            {
                return new WorkCommand<tdsecuL_5_132_Request, ObservableCollection<tdsecuL_5_132_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdsecuL_5_132_InfoList;
                });
            }
        }

    }
}
