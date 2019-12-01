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
    public partial class ProductFutuCapitalCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_产品期货_资金_分配产品资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_8_Request, ObservableCollection<pdfutuL_2_8_Info>> pdfutuL_2_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_8_Request, ObservableCollection<pdfutuL_2_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_回收产品资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_9_Request, ObservableCollection<pdfutuL_2_9_Info>> pdfutuL_2_9_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_9_Request, ObservableCollection<pdfutuL_2_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_9_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_授权产品资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_10_Request, ObservableCollection<pdfutuL_2_10_Info>> pdfutuL_2_10_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_10_Request, ObservableCollection<pdfutuL_2_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_10_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_回收授权产品资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_11_Request, ObservableCollection<pdfutuL_2_11_Info>> pdfutuL_2_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_11_Request, ObservableCollection<pdfutuL_2_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_冻结交易组资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_32_Request, ObservableCollection<pdfutuL_2_32_Info>> pdfutuL_2_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_32_Request, ObservableCollection<pdfutuL_2_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_取消冻结交易组资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_33_Request, ObservableCollection<pdfutuL_2_33_Info>> pdfutuL_2_33_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_33_Request, ObservableCollection<pdfutuL_2_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_33_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_解冻交易组资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_34_Request, ObservableCollection<pdfutuL_2_34_Info>> pdfutuL_2_34_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_34_Request, ObservableCollection<pdfutuL_2_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_34_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_取消解冻交易组资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_35_Request, ObservableCollection<pdfutuL_2_35_Info>> pdfutuL_2_35_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_35_Request, ObservableCollection<pdfutuL_2_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_35_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_查询交易组资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_37_Request, ObservableCollection<pdfutuL_2_37_Info>> pdfutuL_2_37_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_37_Request, ObservableCollection<pdfutuL_2_37_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_37_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_查询历史交易组资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_38_Request, ObservableCollection<pdfutuL_2_38_Info>> pdfutuL_2_38_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_38_Request, ObservableCollection<pdfutuL_2_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_38_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_查询交易组资金流水
        /// </summary>
        public IWorkCommand<pdfutuL_2_39_Request, ObservableCollection<pdfutuL_2_39_Info>> pdfutuL_2_39_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_39_Request, ObservableCollection<pdfutuL_2_39_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_39_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_查询历史交易组资金流水
        /// </summary>
        public IWorkCommand<pdfutuL_2_40_Request, ObservableCollection<pdfutuL_2_40_Info>> pdfutuL_2_40_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_40_Request, ObservableCollection<pdfutuL_2_40_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_40_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_查询交易组资金冻结解冻流水
        /// </summary>
        public IWorkCommand<pdfutuL_2_41_Request, ObservableCollection<pdfutuL_2_41_Info>> pdfutuL_2_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_41_Request, ObservableCollection<pdfutuL_2_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_查询历史交易组资金冻结解冻流水
        /// </summary>
        public IWorkCommand<pdfutuL_2_42_Request, ObservableCollection<pdfutuL_2_42_Info>> pdfutuL_2_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_42_Request, ObservableCollection<pdfutuL_2_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_红冲蓝补资产账户资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_51_Request, ObservableCollection<pdfutuL_2_51_Info>> pdfutuL_2_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_51_Request, ObservableCollection<pdfutuL_2_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_冻结资产账户资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_52_Request, ObservableCollection<pdfutuL_2_52_Info>> pdfutuL_2_52_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_52_Request, ObservableCollection<pdfutuL_2_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_52_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_取消冻结资产账户资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_53_Request, ObservableCollection<pdfutuL_2_53_Info>> pdfutuL_2_53_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_53_Request, ObservableCollection<pdfutuL_2_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_53_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_解冻资产账户资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_54_Request, ObservableCollection<pdfutuL_2_54_Info>> pdfutuL_2_54_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_54_Request, ObservableCollection<pdfutuL_2_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_54_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_取消解冻资产账户资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_55_Request, ObservableCollection<pdfutuL_2_55_Info>> pdfutuL_2_55_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_55_Request, ObservableCollection<pdfutuL_2_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_55_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_查询资产账户资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_57_Request, ObservableCollection<pdfutuL_2_57_Info>> pdfutuL_2_57_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_57_Request, ObservableCollection<pdfutuL_2_57_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_57_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_查询历史资产账户资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_58_Request, ObservableCollection<pdfutuL_2_58_Info>> pdfutuL_2_58_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_58_Request, ObservableCollection<pdfutuL_2_58_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_58_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_查询资产账户资金流水
        /// </summary>
        public IWorkCommand<pdfutuL_2_59_Request, ObservableCollection<pdfutuL_2_59_Info>> pdfutuL_2_59_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_59_Request, ObservableCollection<pdfutuL_2_59_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_59_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_查询历史资产账户资金流水
        /// </summary>
        public IWorkCommand<pdfutuL_2_60_Request, ObservableCollection<pdfutuL_2_60_Info>> pdfutuL_2_60_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_60_Request, ObservableCollection<pdfutuL_2_60_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_60_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_查询资产账户资金冻结解冻流水
        /// </summary>
        public IWorkCommand<pdfutuL_2_61_Request, ObservableCollection<pdfutuL_2_61_Info>> pdfutuL_2_61_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_61_Request, ObservableCollection<pdfutuL_2_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_61_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_查询历史资产账户资金冻结解冻流水
        /// </summary>
        public IWorkCommand<pdfutuL_2_62_Request, ObservableCollection<pdfutuL_2_62_Info>> pdfutuL_2_62_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_62_Request, ObservableCollection<pdfutuL_2_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_62_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_资金_转入外部资金
        /// </summary>
        public IWorkCommand<pdfutuL_2_101_Request, ObservableCollection<pdfutuL_2_101_Info>> pdfutuL_2_101_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_2_101_Request, ObservableCollection<pdfutuL_2_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_2_101_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
