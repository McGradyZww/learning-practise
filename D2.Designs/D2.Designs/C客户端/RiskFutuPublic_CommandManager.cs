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
    public partial class RiskFutuPublicCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_风控期货_公用_查询风险规则记录
        /// </summary>
        public IWorkCommand<rkfutuL_1_4_Request, ObservableCollection<rkfutuL_1_4_Info>> rkfutuL_1_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_1_4_Request, ObservableCollection<rkfutuL_1_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_1_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_公用_增加风险条目记录
        /// </summary>
        public IWorkCommand<rkfutuL_1_5_Request, ObservableCollection<rkfutuL_1_5_Info>> rkfutuL_1_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_1_5_Request, ObservableCollection<rkfutuL_1_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_1_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_公用_修改风险条目记录
        /// </summary>
        public IWorkCommand<rkfutuL_1_6_Request, ObservableCollection<rkfutuL_1_6_Info>> rkfutuL_1_6_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_1_6_Request, ObservableCollection<rkfutuL_1_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_1_6_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_公用_更新风险条目记录启用标志
        /// </summary>
        public IWorkCommand<rkfutuL_1_7_Request, ObservableCollection<rkfutuL_1_7_Info>> rkfutuL_1_7_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_1_7_Request, ObservableCollection<rkfutuL_1_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_1_7_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_公用_删除风险条目记录
        /// </summary>
        public IWorkCommand<rkfutuL_1_8_Request, ObservableCollection<rkfutuL_1_8_Info>> rkfutuL_1_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_1_8_Request, ObservableCollection<rkfutuL_1_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_1_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_公用_查询风险条目记录
        /// </summary>
        public IWorkCommand<rkfutuL_1_9_Request, ObservableCollection<rkfutuL_1_9_Info>> rkfutuL_1_9_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_1_9_Request, ObservableCollection<rkfutuL_1_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_1_9_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_公用_增加风险模板记录
        /// </summary>
        public IWorkCommand<rkfutuL_1_10_Request, ObservableCollection<rkfutuL_1_10_Info>> rkfutuL_1_10_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_1_10_Request, ObservableCollection<rkfutuL_1_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_1_10_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_公用_删除风险模板记录
        /// </summary>
        public IWorkCommand<rkfutuL_1_11_Request, ObservableCollection<rkfutuL_1_11_Info>> rkfutuL_1_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_1_11_Request, ObservableCollection<rkfutuL_1_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_1_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_公用_修改风险模板记录
        /// </summary>
        public IWorkCommand<rkfutuL_1_12_Request, ObservableCollection<rkfutuL_1_12_Info>> rkfutuL_1_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_1_12_Request, ObservableCollection<rkfutuL_1_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_1_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_公用_查询风险模板记录
        /// </summary>
        public IWorkCommand<rkfutuL_1_13_Request, ObservableCollection<rkfutuL_1_13_Info>> rkfutuL_1_13_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_1_13_Request, ObservableCollection<rkfutuL_1_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_1_13_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_公用_增加风险模板条目记录
        /// </summary>
        public IWorkCommand<rkfutuL_1_14_Request, ObservableCollection<rkfutuL_1_14_Info>> rkfutuL_1_14_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_1_14_Request, ObservableCollection<rkfutuL_1_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_1_14_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_公用_删除风险模板条目记录
        /// </summary>
        public IWorkCommand<rkfutuL_1_15_Request, ObservableCollection<rkfutuL_1_15_Info>> rkfutuL_1_15_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_1_15_Request, ObservableCollection<rkfutuL_1_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_1_15_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_公用_查询风险模板条目记录
        /// </summary>
        public IWorkCommand<rkfutuL_1_16_Request, ObservableCollection<rkfutuL_1_16_Info>> rkfutuL_1_16_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_1_16_Request, ObservableCollection<rkfutuL_1_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_1_16_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控期货_公用_期货数据归历史
        /// </summary>
        public IWorkCommand<rkfutuL_1_17_Request, ObservableCollection<rkfutuL_1_17_Info>> rkfutuL_1_17_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rkfutuL_1_17_Request, ObservableCollection<rkfutuL_1_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rkfutuL_1_17_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
