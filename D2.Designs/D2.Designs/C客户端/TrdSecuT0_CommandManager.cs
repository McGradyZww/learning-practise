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
    public partial class TrdSecuT0CommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_交易证券_T0_券源持仓查询
        /// </summary>
        public IWorkCommand<tdsecuL_6_1_Request, ObservableCollection<tdsecuL_6_1_Info>> tdsecuL_6_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_1_Request, ObservableCollection<tdsecuL_6_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_券源持仓历史查询
        /// </summary>
        public IWorkCommand<tdsecuL_6_111_Request, ObservableCollection<tdsecuL_6_111_Info>> tdsecuL_6_111_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_111_Request, ObservableCollection<tdsecuL_6_111_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_111_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_持仓分笔查询
        /// </summary>
        public IWorkCommand<tdsecuL_6_2_Request, ObservableCollection<tdsecuL_6_2_Info>> tdsecuL_6_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_2_Request, ObservableCollection<tdsecuL_6_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_持仓分笔历史查询
        /// </summary>
        public IWorkCommand<tdsecuL_6_201_Request, ObservableCollection<tdsecuL_6_201_Info>> tdsecuL_6_201_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_201_Request, ObservableCollection<tdsecuL_6_201_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_201_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_持仓合笔查询
        /// </summary>
        public IWorkCommand<tdsecuL_6_3_Request, ObservableCollection<tdsecuL_6_3_Info>> tdsecuL_6_3_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_3_Request, ObservableCollection<tdsecuL_6_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_3_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_账户汇总信息查询
        /// </summary>
        public IWorkCommand<tdsecuL_6_4_Request, ObservableCollection<tdsecuL_6_4_Info>> tdsecuL_6_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_4_Request, ObservableCollection<tdsecuL_6_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_持仓盈亏查询
        /// </summary>
        public IWorkCommand<tdsecuL_6_5_Request, ObservableCollection<tdsecuL_6_5_Info>> tdsecuL_6_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_5_Request, ObservableCollection<tdsecuL_6_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_持仓盈亏历史查询
        /// </summary>
        public IWorkCommand<tdsecuL_6_6_Request, ObservableCollection<tdsecuL_6_6_Info>> tdsecuL_6_6_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_6_Request, ObservableCollection<tdsecuL_6_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_6_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_操作员阈值设置查询
        /// </summary>
        public IWorkCommand<tdsecuL_6_9_Request, ObservableCollection<tdsecuL_6_9_Info>> tdsecuL_6_9_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_9_Request, ObservableCollection<tdsecuL_6_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_9_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_操作员阈值设置新增
        /// </summary>
        public IWorkCommand<tdsecuL_6_10_Request, ObservableCollection<tdsecuL_6_10_Info>> tdsecuL_6_10_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_10_Request, ObservableCollection<tdsecuL_6_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_10_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_操作员阈值设置更新
        /// </summary>
        public IWorkCommand<tdsecuL_6_101_Request, ObservableCollection<tdsecuL_6_101_Info>> tdsecuL_6_101_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_101_Request, ObservableCollection<tdsecuL_6_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_101_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_交易员开平仓明细查询
        /// </summary>
        public IWorkCommand<tdsecuL_6_11_Request, ObservableCollection<tdsecuL_6_11_Info>> tdsecuL_6_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_11_Request, ObservableCollection<tdsecuL_6_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_操作员阈值信息初始化
        /// </summary>
        public IWorkCommand<tdsecuL_6_12_Request, ObservableCollection<tdsecuL_6_12_Info>> tdsecuL_6_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_12_Request, ObservableCollection<tdsecuL_6_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_交易员开平仓明细历史查询
        /// </summary>
        public IWorkCommand<tdsecuL_6_13_Request, ObservableCollection<tdsecuL_6_13_Info>> tdsecuL_6_13_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_13_Request, ObservableCollection<tdsecuL_6_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_13_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_操作员券源限额设置更新
        /// </summary>
        public IWorkCommand<tdsecuL_6_14_Request, ObservableCollection<tdsecuL_6_14_Info>> tdsecuL_6_14_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_14_Request, ObservableCollection<tdsecuL_6_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_14_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_操作员券源限额设置查询
        /// </summary>
        public IWorkCommand<tdsecuL_6_15_Request, ObservableCollection<tdsecuL_6_15_Info>> tdsecuL_6_15_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_15_Request, ObservableCollection<tdsecuL_6_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_15_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_删除操作员券源限额设置
        /// </summary>
        public IWorkCommand<tdsecuL_6_16_Request, ObservableCollection<tdsecuL_6_16_Info>> tdsecuL_6_16_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_16_Request, ObservableCollection<tdsecuL_6_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_16_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_启用操作员券源限额设置
        /// </summary>
        public IWorkCommand<tdsecuL_6_17_Request, ObservableCollection<tdsecuL_6_17_Info>> tdsecuL_6_17_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_17_Request, ObservableCollection<tdsecuL_6_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_17_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_暂停操作员券源限额设置
        /// </summary>
        public IWorkCommand<tdsecuL_6_18_Request, ObservableCollection<tdsecuL_6_18_Info>> tdsecuL_6_18_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_18_Request, ObservableCollection<tdsecuL_6_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_18_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_停止操作员券源限额设置
        /// </summary>
        public IWorkCommand<tdsecuL_6_19_Request, ObservableCollection<tdsecuL_6_19_Info>> tdsecuL_6_19_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_19_Request, ObservableCollection<tdsecuL_6_19_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_19_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_操作员参数设置查询
        /// </summary>
        public IWorkCommand<tdsecuL_6_20_Request, ObservableCollection<tdsecuL_6_20_Info>> tdsecuL_6_20_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_20_Request, ObservableCollection<tdsecuL_6_20_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_20_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_操作员参数设置更新
        /// </summary>
        public IWorkCommand<tdsecuL_6_21_Request, ObservableCollection<tdsecuL_6_21_Info>> tdsecuL_6_21_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_21_Request, ObservableCollection<tdsecuL_6_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_21_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_删除操作员参数设置
        /// </summary>
        public IWorkCommand<tdsecuL_6_22_Request, ObservableCollection<tdsecuL_6_22_Info>> tdsecuL_6_22_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_22_Request, ObservableCollection<tdsecuL_6_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_22_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_操作员券源限额设置批量更新
        /// </summary>
        public IWorkCommand<tdsecuL_6_23_Request, ObservableCollection<tdsecuL_6_23_Info>> tdsecuL_6_23_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_23_Request, ObservableCollection<tdsecuL_6_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_23_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_操作员阈值信息计算更新
        /// </summary>
        public IWorkCommand<tdsecuL_6_90_Request, ObservableCollection<tdsecuL_6_90_Info>> tdsecuL_6_90_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_90_Request, ObservableCollection<tdsecuL_6_90_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_90_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_操作员阈值汇总信息计算更新
        /// </summary>
        public IWorkCommand<tdsecuL_6_92_Request, ObservableCollection<tdsecuL_6_92_Info>> tdsecuL_6_92_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_92_Request, ObservableCollection<tdsecuL_6_92_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_92_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_操作员阈值设置调整资金
        /// </summary>
        public IWorkCommand<tdsecuL_6_93_Request, ObservableCollection<tdsecuL_6_93_Info>> tdsecuL_6_93_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_93_Request, ObservableCollection<tdsecuL_6_93_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_93_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_隔夜仓查询
        /// </summary>
        public IWorkCommand<tdsecuL_6_94_Request, ObservableCollection<tdsecuL_6_94_Info>> tdsecuL_6_94_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_94_Request, ObservableCollection<tdsecuL_6_94_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_94_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_持仓明细作废
        /// </summary>
        public IWorkCommand<tdsecuL_6_95_Request, ObservableCollection<tdsecuL_6_95_Info>> tdsecuL_6_95_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_95_Request, ObservableCollection<tdsecuL_6_95_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_95_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_设置开平仓权限
        /// </summary>
        public IWorkCommand<tdsecuL_6_96_Request, ObservableCollection<tdsecuL_6_96_Info>> tdsecuL_6_96_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_96_Request, ObservableCollection<tdsecuL_6_96_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_96_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_券源划转
        /// </summary>
        public IWorkCommand<tdsecuL_6_97_Request, ObservableCollection<tdsecuL_6_97_Info>> tdsecuL_6_97_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_97_Request, ObservableCollection<tdsecuL_6_97_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_97_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_根据成交表处理持仓明细
        /// </summary>
        public IWorkCommand<tdsecuL_6_98_Request, ObservableCollection<tdsecuL_6_98_Info>> tdsecuL_6_98_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_98_Request, ObservableCollection<tdsecuL_6_98_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_98_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_查询操作员券源限额设置流水
        /// </summary>
        public IWorkCommand<tdsecuL_6_99_Request, ObservableCollection<tdsecuL_6_99_Info>> tdsecuL_6_99_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_99_Request, ObservableCollection<tdsecuL_6_99_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_99_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_查询操作员券源限额设置流水历史
        /// </summary>
        public IWorkCommand<tdsecuL_6_102_Request, ObservableCollection<tdsecuL_6_102_Info>> tdsecuL_6_102_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_102_Request, ObservableCollection<tdsecuL_6_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_102_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_持仓反向平仓
        /// </summary>
        public IWorkCommand<tdsecuL_6_30_Request, ObservableCollection<tdsecuL_6_30_Info>> tdsecuL_6_30_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_30_Request, ObservableCollection<tdsecuL_6_30_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_30_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_新增操作员可用交易组资金
        /// </summary>
        public IWorkCommand<tdsecuL_6_31_Request, ObservableCollection<tdsecuL_6_31_Info>> tdsecuL_6_31_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_31_Request, ObservableCollection<tdsecuL_6_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_31_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_删除操作员可用交易组资金
        /// </summary>
        public IWorkCommand<tdsecuL_6_32_Request, ObservableCollection<tdsecuL_6_32_Info>> tdsecuL_6_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_32_Request, ObservableCollection<tdsecuL_6_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_查询操作员可用交易组资金
        /// </summary>
        public IWorkCommand<tdsecuL_6_33_Request, ObservableCollection<tdsecuL_6_33_Info>> tdsecuL_6_33_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_33_Request, ObservableCollection<tdsecuL_6_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_33_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_查询持仓作废流水
        /// </summary>
        public IWorkCommand<tdsecuL_6_34_Request, ObservableCollection<tdsecuL_6_34_Info>> tdsecuL_6_34_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_34_Request, ObservableCollection<tdsecuL_6_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_34_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_查询历史持仓作废流水
        /// </summary>
        public IWorkCommand<tdsecuL_6_35_Request, ObservableCollection<tdsecuL_6_35_Info>> tdsecuL_6_35_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_35_Request, ObservableCollection<tdsecuL_6_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_35_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_设置操作员持仓市值
        /// </summary>
        public IWorkCommand<tdsecuL_6_36_Request, ObservableCollection<tdsecuL_6_36_Info>> tdsecuL_6_36_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_36_Request, ObservableCollection<tdsecuL_6_36_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_36_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_删除操作员持仓市值
        /// </summary>
        public IWorkCommand<tdsecuL_6_37_Request, ObservableCollection<tdsecuL_6_37_Info>> tdsecuL_6_37_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_37_Request, ObservableCollection<tdsecuL_6_37_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_37_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_查询操作员持仓市值
        /// </summary>
        public IWorkCommand<tdsecuL_6_38_Request, ObservableCollection<tdsecuL_6_38_Info>> tdsecuL_6_38_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_38_Request, ObservableCollection<tdsecuL_6_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_38_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_根据操作员查询券源持仓
        /// </summary>
        public IWorkCommand<tdsecuL_6_110_Request, ObservableCollection<tdsecuL_6_110_Info>> tdsecuL_6_110_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_110_Request, ObservableCollection<tdsecuL_6_110_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_110_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_根据操作员查询账户汇总信息
        /// </summary>
        public IWorkCommand<tdsecuL_6_113_Request, ObservableCollection<tdsecuL_6_113_Info>> tdsecuL_6_113_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_113_Request, ObservableCollection<tdsecuL_6_113_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_113_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_根据操作员查询操作员可用交易组资金
        /// </summary>
        public IWorkCommand<tdsecuL_6_112_Request, ObservableCollection<tdsecuL_6_112_Info>> tdsecuL_6_112_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_112_Request, ObservableCollection<tdsecuL_6_112_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_112_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_根据操作员查询操作员阈值设置
        /// </summary>
        public IWorkCommand<tdsecuL_6_114_Request, ObservableCollection<tdsecuL_6_114_Info>> tdsecuL_6_114_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_114_Request, ObservableCollection<tdsecuL_6_114_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_114_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_操作员阈值累计盈亏更新
        /// </summary>
        public IWorkCommand<tdsecuL_6_115_Request, ObservableCollection<tdsecuL_6_115_Info>> tdsecuL_6_115_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_115_Request, ObservableCollection<tdsecuL_6_115_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_115_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_T0_修改操作员券源T0买入方式
        /// </summary>
        public IWorkCommand<tdsecuL_6_116_Request, ObservableCollection<tdsecuL_6_116_Info>> tdsecuL_6_116_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_6_116_Request, ObservableCollection<tdsecuL_6_116_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_6_116_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
