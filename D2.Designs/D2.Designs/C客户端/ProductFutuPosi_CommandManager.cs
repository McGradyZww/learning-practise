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
    public partial class ProductFutuPosiCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_产品期货_持仓_红冲蓝补交易组持仓
        /// </summary>
        public IWorkCommand<pdfutuL_3_1_Request, ObservableCollection<pdfutuL_3_1_Info>> pdfutuL_3_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_1_Request, ObservableCollection<pdfutuL_3_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_冻结交易组持仓
        /// </summary>
        public IWorkCommand<pdfutuL_3_2_Request, ObservableCollection<pdfutuL_3_2_Info>> pdfutuL_3_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_2_Request, ObservableCollection<pdfutuL_3_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_取消冻结交易组持仓
        /// </summary>
        public IWorkCommand<pdfutuL_3_3_Request, ObservableCollection<pdfutuL_3_3_Info>> pdfutuL_3_3_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_3_Request, ObservableCollection<pdfutuL_3_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_3_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_解冻交易组持仓
        /// </summary>
        public IWorkCommand<pdfutuL_3_4_Request, ObservableCollection<pdfutuL_3_4_Info>> pdfutuL_3_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_4_Request, ObservableCollection<pdfutuL_3_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_取消解冻交易组持仓
        /// </summary>
        public IWorkCommand<pdfutuL_3_5_Request, ObservableCollection<pdfutuL_3_5_Info>> pdfutuL_3_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_5_Request, ObservableCollection<pdfutuL_3_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_查询交易组持仓
        /// </summary>
        public IWorkCommand<pdfutuL_3_21_Request, ObservableCollection<pdfutuL_3_21_Info>> pdfutuL_3_21_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_21_Request, ObservableCollection<pdfutuL_3_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_21_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_查询历史交易组持仓
        /// </summary>
        public IWorkCommand<pdfutuL_3_22_Request, ObservableCollection<pdfutuL_3_22_Info>> pdfutuL_3_22_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_22_Request, ObservableCollection<pdfutuL_3_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_22_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_查询交易组持仓流水
        /// </summary>
        public IWorkCommand<pdfutuL_3_31_Request, ObservableCollection<pdfutuL_3_31_Info>> pdfutuL_3_31_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_31_Request, ObservableCollection<pdfutuL_3_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_31_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_查询历史交易组持仓流水
        /// </summary>
        public IWorkCommand<pdfutuL_3_32_Request, ObservableCollection<pdfutuL_3_32_Info>> pdfutuL_3_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_32_Request, ObservableCollection<pdfutuL_3_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_查询交易组持仓冻结解冻流水
        /// </summary>
        public IWorkCommand<pdfutuL_3_34_Request, ObservableCollection<pdfutuL_3_34_Info>> pdfutuL_3_34_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_34_Request, ObservableCollection<pdfutuL_3_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_34_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_查询历史交易组持仓冻结解冻流水
        /// </summary>
        public IWorkCommand<pdfutuL_3_35_Request, ObservableCollection<pdfutuL_3_35_Info>> pdfutuL_3_35_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_35_Request, ObservableCollection<pdfutuL_3_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_35_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_红冲蓝补资产账户持仓
        /// </summary>
        public IWorkCommand<pdfutuL_3_51_Request, ObservableCollection<pdfutuL_3_51_Info>> pdfutuL_3_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_51_Request, ObservableCollection<pdfutuL_3_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_冻结资产账户持仓
        /// </summary>
        public IWorkCommand<pdfutuL_3_52_Request, ObservableCollection<pdfutuL_3_52_Info>> pdfutuL_3_52_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_52_Request, ObservableCollection<pdfutuL_3_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_52_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_取消冻结资产账户持仓
        /// </summary>
        public IWorkCommand<pdfutuL_3_53_Request, ObservableCollection<pdfutuL_3_53_Info>> pdfutuL_3_53_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_53_Request, ObservableCollection<pdfutuL_3_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_53_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_解冻资产账户持仓
        /// </summary>
        public IWorkCommand<pdfutuL_3_54_Request, ObservableCollection<pdfutuL_3_54_Info>> pdfutuL_3_54_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_54_Request, ObservableCollection<pdfutuL_3_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_54_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_取消解冻资产账户持仓
        /// </summary>
        public IWorkCommand<pdfutuL_3_55_Request, ObservableCollection<pdfutuL_3_55_Info>> pdfutuL_3_55_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_55_Request, ObservableCollection<pdfutuL_3_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_55_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_查询资产账户持仓
        /// </summary>
        public IWorkCommand<pdfutuL_3_71_Request, ObservableCollection<pdfutuL_3_71_Info>> pdfutuL_3_71_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_71_Request, ObservableCollection<pdfutuL_3_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_71_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_查询历史资产账户持仓
        /// </summary>
        public IWorkCommand<pdfutuL_3_72_Request, ObservableCollection<pdfutuL_3_72_Info>> pdfutuL_3_72_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_72_Request, ObservableCollection<pdfutuL_3_72_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_72_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_查询资产账户持仓流水
        /// </summary>
        public IWorkCommand<pdfutuL_3_81_Request, ObservableCollection<pdfutuL_3_81_Info>> pdfutuL_3_81_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_81_Request, ObservableCollection<pdfutuL_3_81_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_81_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_查询历史资产账户持仓流水
        /// </summary>
        public IWorkCommand<pdfutuL_3_82_Request, ObservableCollection<pdfutuL_3_82_Info>> pdfutuL_3_82_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_82_Request, ObservableCollection<pdfutuL_3_82_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_82_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_查询资产账户持仓冻结解冻流水
        /// </summary>
        public IWorkCommand<pdfutuL_3_84_Request, ObservableCollection<pdfutuL_3_84_Info>> pdfutuL_3_84_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_84_Request, ObservableCollection<pdfutuL_3_84_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_84_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_查询历史资产账户持仓冻结解冻流水
        /// </summary>
        public IWorkCommand<pdfutuL_3_85_Request, ObservableCollection<pdfutuL_3_85_Info>> pdfutuL_3_85_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_85_Request, ObservableCollection<pdfutuL_3_85_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_85_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_转入外部期货持仓记录
        /// </summary>
        public IWorkCommand<pdfutuL_3_171_Request, ObservableCollection<pdfutuL_3_171_Info>> pdfutuL_3_171_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_171_Request, ObservableCollection<pdfutuL_3_171_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_171_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_清除外部转入记录
        /// </summary>
        public IWorkCommand<pdfutuL_3_172_Request, ObservableCollection<pdfutuL_3_172_Info>> pdfutuL_3_172_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_172_Request, ObservableCollection<pdfutuL_3_172_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_172_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品期货_持仓_清除外部持仓转入记录
        /// </summary>
        public IWorkCommand<pdfutuL_3_173_Request, ObservableCollection<pdfutuL_3_173_Info>> pdfutuL_3_173_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdfutuL_3_173_Request, ObservableCollection<pdfutuL_3_173_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdfutuL_3_173_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
