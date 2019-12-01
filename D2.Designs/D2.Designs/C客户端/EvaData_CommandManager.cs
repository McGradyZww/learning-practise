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
    public partial class EvaDataCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_平台估值_业务数据_同步估值产品证券资产
        /// </summary>
        public IWorkCommand<evaL_2_1_Request, ObservableCollection<evaL_2_1_Info>> evaL_2_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_1_Request, ObservableCollection<evaL_2_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_新增估值产品证券持仓
        /// </summary>
        public IWorkCommand<evaL_2_11_Request, ObservableCollection<evaL_2_11_Info>> evaL_2_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_11_Request, ObservableCollection<evaL_2_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_修改估值产品证券持仓
        /// </summary>
        public IWorkCommand<evaL_2_12_Request, ObservableCollection<evaL_2_12_Info>> evaL_2_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_12_Request, ObservableCollection<evaL_2_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_删除估值产品证券持仓
        /// </summary>
        public IWorkCommand<evaL_2_13_Request, ObservableCollection<evaL_2_13_Info>> evaL_2_13_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_13_Request, ObservableCollection<evaL_2_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_13_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_查询估值产品证券持仓
        /// </summary>
        public IWorkCommand<evaL_2_14_Request, ObservableCollection<evaL_2_14_Info>> evaL_2_14_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_14_Request, ObservableCollection<evaL_2_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_14_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_查询估值产品交易组证券持仓
        /// </summary>
        public IWorkCommand<evaL_2_15_Request, ObservableCollection<evaL_2_15_Info>> evaL_2_15_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_15_Request, ObservableCollection<evaL_2_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_15_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_查询估值产品期货持仓
        /// </summary>
        public IWorkCommand<evaL_2_16_Request, ObservableCollection<evaL_2_16_Info>> evaL_2_16_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_16_Request, ObservableCollection<evaL_2_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_16_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_新增估值产品账户资金
        /// </summary>
        public IWorkCommand<evaL_2_21_Request, ObservableCollection<evaL_2_21_Info>> evaL_2_21_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_21_Request, ObservableCollection<evaL_2_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_21_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_修改估值产品账户资金
        /// </summary>
        public IWorkCommand<evaL_2_22_Request, ObservableCollection<evaL_2_22_Info>> evaL_2_22_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_22_Request, ObservableCollection<evaL_2_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_22_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_删除估值产品账户资金
        /// </summary>
        public IWorkCommand<evaL_2_23_Request, ObservableCollection<evaL_2_23_Info>> evaL_2_23_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_23_Request, ObservableCollection<evaL_2_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_23_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_查询估值产品账户资金
        /// </summary>
        public IWorkCommand<evaL_2_24_Request, ObservableCollection<evaL_2_24_Info>> evaL_2_24_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_24_Request, ObservableCollection<evaL_2_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_24_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_查询估值产品交易组账户资金
        /// </summary>
        public IWorkCommand<evaL_2_25_Request, ObservableCollection<evaL_2_25_Info>> evaL_2_25_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_25_Request, ObservableCollection<evaL_2_25_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_25_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_导入估值产品证券持仓
        /// </summary>
        public IWorkCommand<evaL_2_31_Request, ObservableCollection<evaL_2_31_Info>> evaL_2_31_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_31_Request, ObservableCollection<evaL_2_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_31_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_新增估值产品银行流水
        /// </summary>
        public IWorkCommand<evaL_2_41_Request, ObservableCollection<evaL_2_41_Info>> evaL_2_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_41_Request, ObservableCollection<evaL_2_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_修改估值产品银行流水
        /// </summary>
        public IWorkCommand<evaL_2_42_Request, ObservableCollection<evaL_2_42_Info>> evaL_2_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_42_Request, ObservableCollection<evaL_2_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_删除估值产品银行流水
        /// </summary>
        public IWorkCommand<evaL_2_43_Request, ObservableCollection<evaL_2_43_Info>> evaL_2_43_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_43_Request, ObservableCollection<evaL_2_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_43_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_查询估值产品银行流水
        /// </summary>
        public IWorkCommand<evaL_2_44_Request, ObservableCollection<evaL_2_44_Info>> evaL_2_44_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_44_Request, ObservableCollection<evaL_2_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_44_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_新增估值产品场外交易
        /// </summary>
        public IWorkCommand<evaL_2_51_Request, ObservableCollection<evaL_2_51_Info>> evaL_2_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_51_Request, ObservableCollection<evaL_2_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_修改估值产品场外交易
        /// </summary>
        public IWorkCommand<evaL_2_52_Request, ObservableCollection<evaL_2_52_Info>> evaL_2_52_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_52_Request, ObservableCollection<evaL_2_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_52_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_删除估值产品场外交易
        /// </summary>
        public IWorkCommand<evaL_2_53_Request, ObservableCollection<evaL_2_53_Info>> evaL_2_53_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_53_Request, ObservableCollection<evaL_2_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_53_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_平台估值_业务数据_查询估值产品场外交易
        /// </summary>
        public IWorkCommand<evaL_2_54_Request, ObservableCollection<evaL_2_54_Info>> evaL_2_54_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<evaL_2_54_Request, ObservableCollection<evaL_2_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).evaL_2_54_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
