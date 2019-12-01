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
    public partial class RiskSecuRiskCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_风控证券_风控_增加客户风险规则记录
        /// </summary>
        public IWorkCommand<rksecuL_4_1_Request, ObservableCollection<rksecuL_4_1_Info>> rksecuL_4_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_1_Request, ObservableCollection<rksecuL_4_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_删除客户风险规则记录
        /// </summary>
        public IWorkCommand<rksecuL_4_2_Request, ObservableCollection<rksecuL_4_2_Info>> rksecuL_4_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_2_Request, ObservableCollection<rksecuL_4_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_查询客户风险规则记录
        /// </summary>
        public IWorkCommand<rksecuL_4_3_Request, ObservableCollection<rksecuL_4_3_Info>> rksecuL_4_3_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_3_Request, ObservableCollection<rksecuL_4_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_3_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_静态风险合规判断
        /// </summary>
        public IWorkCommand<rksecuL_4_4_Request, ObservableCollection<rksecuL_4_4_Info>> rksecuL_4_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_4_Request, ObservableCollection<rksecuL_4_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_客户风险触警流水查询
        /// </summary>
        public IWorkCommand<rksecuL_4_5_Request, ObservableCollection<rksecuL_4_5_Info>> rksecuL_4_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_5_Request, ObservableCollection<rksecuL_4_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_模板查询客户产品交易组
        /// </summary>
        public IWorkCommand<rksecuL_4_6_Request, ObservableCollection<rksecuL_4_6_Info>> rksecuL_4_6_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_6_Request, ObservableCollection<rksecuL_4_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_6_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_试算检查客户风险
        /// </summary>
        public IWorkCommand<rksecuL_4_7_Request, ObservableCollection<rksecuL_4_7_Info>> rksecuL_4_7_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_7_Request, ObservableCollection<rksecuL_4_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_7_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_新增账户风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_8_Request, ObservableCollection<rksecuL_4_8_Info>> rksecuL_4_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_8_Request, ObservableCollection<rksecuL_4_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_修改账户风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_9_Request, ObservableCollection<rksecuL_4_9_Info>> rksecuL_4_9_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_9_Request, ObservableCollection<rksecuL_4_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_9_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_删除账户风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_10_Request, ObservableCollection<rksecuL_4_10_Info>> rksecuL_4_10_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_10_Request, ObservableCollection<rksecuL_4_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_10_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_查询账户风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_11_Request, ObservableCollection<rksecuL_4_11_Info>> rksecuL_4_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_11_Request, ObservableCollection<rksecuL_4_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_启用账户风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_12_Request, ObservableCollection<rksecuL_4_12_Info>> rksecuL_4_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_12_Request, ObservableCollection<rksecuL_4_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_暂停账户风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_13_Request, ObservableCollection<rksecuL_4_13_Info>> rksecuL_4_13_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_13_Request, ObservableCollection<rksecuL_4_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_13_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_停止账户风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_14_Request, ObservableCollection<rksecuL_4_14_Info>> rksecuL_4_14_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_14_Request, ObservableCollection<rksecuL_4_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_14_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_启用所有账户风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_15_Request, ObservableCollection<rksecuL_4_15_Info>> rksecuL_4_15_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_15_Request, ObservableCollection<rksecuL_4_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_15_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_暂停所有账户风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_16_Request, ObservableCollection<rksecuL_4_16_Info>> rksecuL_4_16_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_16_Request, ObservableCollection<rksecuL_4_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_16_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_停止所有账户风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_17_Request, ObservableCollection<rksecuL_4_17_Info>> rksecuL_4_17_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_17_Request, ObservableCollection<rksecuL_4_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_17_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_新增证券风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_18_Request, ObservableCollection<rksecuL_4_18_Info>> rksecuL_4_18_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_18_Request, ObservableCollection<rksecuL_4_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_18_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_修改证券风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_19_Request, ObservableCollection<rksecuL_4_19_Info>> rksecuL_4_19_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_19_Request, ObservableCollection<rksecuL_4_19_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_19_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_删除证券风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_20_Request, ObservableCollection<rksecuL_4_20_Info>> rksecuL_4_20_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_20_Request, ObservableCollection<rksecuL_4_20_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_20_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_查询证券风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_21_Request, ObservableCollection<rksecuL_4_21_Info>> rksecuL_4_21_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_21_Request, ObservableCollection<rksecuL_4_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_21_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_启用证券风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_22_Request, ObservableCollection<rksecuL_4_22_Info>> rksecuL_4_22_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_22_Request, ObservableCollection<rksecuL_4_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_22_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_暂停证券风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_23_Request, ObservableCollection<rksecuL_4_23_Info>> rksecuL_4_23_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_23_Request, ObservableCollection<rksecuL_4_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_23_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_停止证券风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_24_Request, ObservableCollection<rksecuL_4_24_Info>> rksecuL_4_24_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_24_Request, ObservableCollection<rksecuL_4_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_24_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_启用所有证券风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_25_Request, ObservableCollection<rksecuL_4_25_Info>> rksecuL_4_25_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_25_Request, ObservableCollection<rksecuL_4_25_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_25_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_暂停所有证券风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_26_Request, ObservableCollection<rksecuL_4_26_Info>> rksecuL_4_26_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_26_Request, ObservableCollection<rksecuL_4_26_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_26_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_停止所有证券风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_27_Request, ObservableCollection<rksecuL_4_27_Info>> rksecuL_4_27_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_27_Request, ObservableCollection<rksecuL_4_27_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_27_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_计算账户风险监控设置数据
        /// </summary>
        public IWorkCommand<rksecuL_4_28_Request, ObservableCollection<rksecuL_4_28_Info>> rksecuL_4_28_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_28_Request, ObservableCollection<rksecuL_4_28_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_28_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_客户风险触警历史流水查询
        /// </summary>
        public IWorkCommand<rksecuL_4_29_Request, ObservableCollection<rksecuL_4_29_Info>> rksecuL_4_29_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_29_Request, ObservableCollection<rksecuL_4_29_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_29_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_条目查询客户产品交易组
        /// </summary>
        public IWorkCommand<rksecuL_4_30_Request, ObservableCollection<rksecuL_4_30_Info>> rksecuL_4_30_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_30_Request, ObservableCollection<rksecuL_4_30_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_30_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_更新客户风险规则启用标志
        /// </summary>
        public IWorkCommand<rksecuL_4_31_Request, ObservableCollection<rksecuL_4_31_Info>> rksecuL_4_31_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_31_Request, ObservableCollection<rksecuL_4_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_31_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_批量试算检查客户风险
        /// </summary>
        public IWorkCommand<rksecuL_4_32_Request, ObservableCollection<rksecuL_4_32_Info>> rksecuL_4_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_32_Request, ObservableCollection<rksecuL_4_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_T0操作员阈值信息查询
        /// </summary>
        public IWorkCommand<rksecuL_4_33_Request, ObservableCollection<rksecuL_4_33_Info>> rksecuL_4_33_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_33_Request, ObservableCollection<rksecuL_4_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_33_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_T0操作员阈值信息汇总查询
        /// </summary>
        public IWorkCommand<rksecuL_4_34_Request, ObservableCollection<rksecuL_4_34_Info>> rksecuL_4_34_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_34_Request, ObservableCollection<rksecuL_4_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_34_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_新增操作员风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_35_Request, ObservableCollection<rksecuL_4_35_Info>> rksecuL_4_35_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_35_Request, ObservableCollection<rksecuL_4_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_35_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_修改操作员风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_36_Request, ObservableCollection<rksecuL_4_36_Info>> rksecuL_4_36_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_36_Request, ObservableCollection<rksecuL_4_36_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_36_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_删除操作员风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_37_Request, ObservableCollection<rksecuL_4_37_Info>> rksecuL_4_37_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_37_Request, ObservableCollection<rksecuL_4_37_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_37_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_查询操作员风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_38_Request, ObservableCollection<rksecuL_4_38_Info>> rksecuL_4_38_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_38_Request, ObservableCollection<rksecuL_4_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_38_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_启停操作员风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_39_Request, ObservableCollection<rksecuL_4_39_Info>> rksecuL_4_39_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_39_Request, ObservableCollection<rksecuL_4_39_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_39_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_启停所有操作员风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_40_Request, ObservableCollection<rksecuL_4_40_Info>> rksecuL_4_40_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_40_Request, ObservableCollection<rksecuL_4_40_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_40_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_查询T0操作员触警流水信息
        /// </summary>
        public IWorkCommand<rksecuL_4_41_Request, ObservableCollection<rksecuL_4_41_Info>> rksecuL_4_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_41_Request, ObservableCollection<rksecuL_4_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_查询T0操作员汇总触警流水信息
        /// </summary>
        public IWorkCommand<rksecuL_4_42_Request, ObservableCollection<rksecuL_4_42_Info>> rksecuL_4_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_42_Request, ObservableCollection<rksecuL_4_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_查询T0操作员历史触警流水信息
        /// </summary>
        public IWorkCommand<rksecuL_4_43_Request, ObservableCollection<rksecuL_4_43_Info>> rksecuL_4_43_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_43_Request, ObservableCollection<rksecuL_4_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_43_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_查询T0操作员历史汇总触警流水信息
        /// </summary>
        public IWorkCommand<rksecuL_4_44_Request, ObservableCollection<rksecuL_4_44_Info>> rksecuL_4_44_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_44_Request, ObservableCollection<rksecuL_4_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_44_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_删除客户风险触警流水
        /// </summary>
        public IWorkCommand<rksecuL_4_45_Request, ObservableCollection<rksecuL_4_45_Info>> rksecuL_4_45_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_45_Request, ObservableCollection<rksecuL_4_45_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_45_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_更新资产账户融资融券保证金计算结果集
        /// </summary>
        public IWorkCommand<rksecuL_4_51_Request, ObservableCollection<rksecuL_4_51_Info>> rksecuL_4_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_51_Request, ObservableCollection<rksecuL_4_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_查询资产账户融资融券保证金计算结果集
        /// </summary>
        public IWorkCommand<rksecuL_4_54_Request, ObservableCollection<rksecuL_4_54_Info>> rksecuL_4_54_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_54_Request, ObservableCollection<rksecuL_4_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_54_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_更新交易组融资融券保证金计算结果集
        /// </summary>
        public IWorkCommand<rksecuL_4_61_Request, ObservableCollection<rksecuL_4_61_Info>> rksecuL_4_61_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_61_Request, ObservableCollection<rksecuL_4_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_61_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_查询交易组融资融券保证金计算结果集
        /// </summary>
        public IWorkCommand<rksecuL_4_64_Request, ObservableCollection<rksecuL_4_64_Info>> rksecuL_4_64_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_64_Request, ObservableCollection<rksecuL_4_64_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_64_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_查询所有账户风险监控设置
        /// </summary>
        public IWorkCommand<rksecuL_4_65_Request, ObservableCollection<rksecuL_4_65_Info>> rksecuL_4_65_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<rksecuL_4_65_Request, ObservableCollection<rksecuL_4_65_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).rksecuL_4_65_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_新增预订单信息表
        /// </summary>
        public IWorkCommand<rksecuL_4_66_Request, ObservableCollection<rksecuL_4_66_Info>> rksecuL_4_66_Command
        {
            get
            {
                return new WorkCommand<rksecuL_4_66_Request, ObservableCollection<rksecuL_4_66_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rksecuL_4_66_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_删除预订单信息表
        /// </summary>
        public IWorkCommand<rksecuL_4_67_Request, ObservableCollection<rksecuL_4_67_Info>> rksecuL_4_67_Command
        {
            get
            {
                return new WorkCommand<rksecuL_4_67_Request, ObservableCollection<rksecuL_4_67_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rksecuL_4_67_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_联合汇总检查客户风险
        /// </summary>
        public IWorkCommand<rksecuL_4_68_Request, ObservableCollection<rksecuL_4_68_Info>> rksecuL_4_68_Command
        {
            get
            {
                return new WorkCommand<rksecuL_4_68_Request, ObservableCollection<rksecuL_4_68_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rksecuL_4_68_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_风控证券_风控_新增预指令信息表
        /// </summary>
        public IWorkCommand<rksecuL_4_69_Request, ObservableCollection<rksecuL_4_69_Info>> rksecuL_4_69_Command
        {
            get
            {
                return new WorkCommand<rksecuL_4_69_Request, ObservableCollection<rksecuL_4_69_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rksecuL_4_69_InfoList;
                });
            }
        }

    }
}
