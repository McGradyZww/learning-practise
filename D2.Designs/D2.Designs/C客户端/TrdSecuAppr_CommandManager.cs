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
    public partial class TrdSecuApprCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_交易证券_指令_新增指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_1_Request, ObservableCollection<tdsecuL_3_1_Info>> tdsecuL_3_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_1_Request, ObservableCollection<tdsecuL_3_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_撤销指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_2_Request, ObservableCollection<tdsecuL_3_2_Info>> tdsecuL_3_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_2_Request, ObservableCollection<tdsecuL_3_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_修改指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_3_Request, ObservableCollection<tdsecuL_3_3_Info>> tdsecuL_3_3_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_3_Request, ObservableCollection<tdsecuL_3_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_3_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_审批指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_4_Request, ObservableCollection<tdsecuL_3_4_Info>> tdsecuL_3_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_4_Request, ObservableCollection<tdsecuL_3_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_分发指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_5_Request, ObservableCollection<tdsecuL_3_5_Info>> tdsecuL_3_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_5_Request, ObservableCollection<tdsecuL_3_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_新增篮子批量指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_6_Request, ObservableCollection<tdsecuL_3_6_Info>> tdsecuL_3_6_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_6_Request, ObservableCollection<tdsecuL_3_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_6_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_批量分发指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_7_Request, ObservableCollection<tdsecuL_3_7_Info>> tdsecuL_3_7_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_7_Request, ObservableCollection<tdsecuL_3_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_7_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_新增调仓指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_8_Request, ObservableCollection<tdsecuL_3_8_Info>> tdsecuL_3_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_8_Request, ObservableCollection<tdsecuL_3_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_新增组合指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_9_Request, ObservableCollection<tdsecuL_3_9_Info>> tdsecuL_3_9_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_9_Request, ObservableCollection<tdsecuL_3_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_9_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_查询指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_51_Request, ObservableCollection<tdsecuL_3_51_Info>> tdsecuL_3_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_51_Request, ObservableCollection<tdsecuL_3_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_查询指令历史
        /// </summary>
        public IWorkCommand<tdsecuL_3_52_Request, ObservableCollection<tdsecuL_3_52_Info>> tdsecuL_3_52_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_52_Request, ObservableCollection<tdsecuL_3_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_52_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_查询指令分发
        /// </summary>
        public IWorkCommand<tdsecuL_3_53_Request, ObservableCollection<tdsecuL_3_53_Info>> tdsecuL_3_53_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_53_Request, ObservableCollection<tdsecuL_3_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_53_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_查询指令分发历史
        /// </summary>
        public IWorkCommand<tdsecuL_3_54_Request, ObservableCollection<tdsecuL_3_54_Info>> tdsecuL_3_54_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_54_Request, ObservableCollection<tdsecuL_3_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_54_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_查询指令审批
        /// </summary>
        public IWorkCommand<tdsecuL_3_55_Request, ObservableCollection<tdsecuL_3_55_Info>> tdsecuL_3_55_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_55_Request, ObservableCollection<tdsecuL_3_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_55_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_查询指令审批历史
        /// </summary>
        public IWorkCommand<tdsecuL_3_56_Request, ObservableCollection<tdsecuL_3_56_Info>> tdsecuL_3_56_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_56_Request, ObservableCollection<tdsecuL_3_56_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_56_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_查询汇总指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_57_Request, ObservableCollection<tdsecuL_3_57_Info>> tdsecuL_3_57_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_57_Request, ObservableCollection<tdsecuL_3_57_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_57_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_查询汇总指令历史
        /// </summary>
        public IWorkCommand<tdsecuL_3_58_Request, ObservableCollection<tdsecuL_3_58_Info>> tdsecuL_3_58_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_58_Request, ObservableCollection<tdsecuL_3_58_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_58_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_暂停明细指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_59_Request, ObservableCollection<tdsecuL_3_59_Info>> tdsecuL_3_59_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_59_Request, ObservableCollection<tdsecuL_3_59_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_59_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_暂停汇总指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_60_Request, ObservableCollection<tdsecuL_3_60_Info>> tdsecuL_3_60_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_60_Request, ObservableCollection<tdsecuL_3_60_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_60_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_启动明细指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_61_Request, ObservableCollection<tdsecuL_3_61_Info>> tdsecuL_3_61_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_61_Request, ObservableCollection<tdsecuL_3_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_61_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_启动汇总指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_62_Request, ObservableCollection<tdsecuL_3_62_Info>> tdsecuL_3_62_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_62_Request, ObservableCollection<tdsecuL_3_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_62_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_分发待审批指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_63_Request, ObservableCollection<tdsecuL_3_63_Info>> tdsecuL_3_63_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_63_Request, ObservableCollection<tdsecuL_3_63_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_63_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_审批转发指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_64_Request, ObservableCollection<tdsecuL_3_64_Info>> tdsecuL_3_64_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_64_Request, ObservableCollection<tdsecuL_3_64_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_64_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_查询转发审批指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_65_Request, ObservableCollection<tdsecuL_3_65_Info>> tdsecuL_3_65_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_65_Request, ObservableCollection<tdsecuL_3_65_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_65_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_融资融券新增指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_66_Request, ObservableCollection<tdsecuL_3_66_Info>> tdsecuL_3_66_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_66_Request, ObservableCollection<tdsecuL_3_66_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_66_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_融资融券撤销指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_67_Request, ObservableCollection<tdsecuL_3_67_Info>> tdsecuL_3_67_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_67_Request, ObservableCollection<tdsecuL_3_67_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_67_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_融资融券审批指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_68_Request, ObservableCollection<tdsecuL_3_68_Info>> tdsecuL_3_68_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_68_Request, ObservableCollection<tdsecuL_3_68_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_68_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_新分发指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_69_Request, ObservableCollection<tdsecuL_3_69_Info>> tdsecuL_3_69_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_69_Request, ObservableCollection<tdsecuL_3_69_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_69_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_指令_新增组合策略指令
        /// </summary>
        public IWorkCommand<tdsecuL_3_70_Request, ObservableCollection<tdsecuL_3_70_Info>> tdsecuL_3_70_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_3_70_Request, ObservableCollection<tdsecuL_3_70_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_3_70_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
