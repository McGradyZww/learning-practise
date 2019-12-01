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
    public partial class EvaTotalCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_平台估值_估值汇总_生成估值产品资产信息
        /// </summary>
        public IWorkCommand<evaL_3_1_Request, ObservableCollection<evaL_3_1_Info>> evaL_3_1_Command
        {
            get
            {
                return new WorkCommand<evaL_3_1_Request, ObservableCollection<evaL_3_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_估值产品基础数据准备
        /// </summary>
        public IWorkCommand<evaL_3_2_Request, ObservableCollection<evaL_3_2_Info>> evaL_3_2_Command
        {
            get
            {
                return new WorkCommand<evaL_3_2_Request, ObservableCollection<evaL_3_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询估值产品资产信息
        /// </summary>
        public IWorkCommand<evaL_3_3_Request, ObservableCollection<evaL_3_3_Info>> evaL_3_3_Command
        {
            get
            {
                return new WorkCommand<evaL_3_3_Request, ObservableCollection<evaL_3_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_3_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询估值产品应收应付汇总
        /// </summary>
        public IWorkCommand<evaL_3_4_Request, ObservableCollection<evaL_3_4_Info>> evaL_3_4_Command
        {
            get
            {
                return new WorkCommand<evaL_3_4_Request, ObservableCollection<evaL_3_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_4_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_新增估值产品费用
        /// </summary>
        public IWorkCommand<evaL_3_5_Request, ObservableCollection<evaL_3_5_Info>> evaL_3_5_Command
        {
            get
            {
                return new WorkCommand<evaL_3_5_Request, ObservableCollection<evaL_3_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_5_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_修改估值产品费用
        /// </summary>
        public IWorkCommand<evaL_3_6_Request, ObservableCollection<evaL_3_6_Info>> evaL_3_6_Command
        {
            get
            {
                return new WorkCommand<evaL_3_6_Request, ObservableCollection<evaL_3_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_6_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_删除估值产品费用
        /// </summary>
        public IWorkCommand<evaL_3_7_Request, ObservableCollection<evaL_3_7_Info>> evaL_3_7_Command
        {
            get
            {
                return new WorkCommand<evaL_3_7_Request, ObservableCollection<evaL_3_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_7_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询估值产品费用
        /// </summary>
        public IWorkCommand<evaL_3_8_Request, ObservableCollection<evaL_3_8_Info>> evaL_3_8_Command
        {
            get
            {
                return new WorkCommand<evaL_3_8_Request, ObservableCollection<evaL_3_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_8_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_新增估值产品利息
        /// </summary>
        public IWorkCommand<evaL_3_9_Request, ObservableCollection<evaL_3_9_Info>> evaL_3_9_Command
        {
            get
            {
                return new WorkCommand<evaL_3_9_Request, ObservableCollection<evaL_3_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_9_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_修改估值产品利息
        /// </summary>
        public IWorkCommand<evaL_3_10_Request, ObservableCollection<evaL_3_10_Info>> evaL_3_10_Command
        {
            get
            {
                return new WorkCommand<evaL_3_10_Request, ObservableCollection<evaL_3_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_10_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_删除估值产品利息
        /// </summary>
        public IWorkCommand<evaL_3_11_Request, ObservableCollection<evaL_3_11_Info>> evaL_3_11_Command
        {
            get
            {
                return new WorkCommand<evaL_3_11_Request, ObservableCollection<evaL_3_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_11_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询估值产品利息
        /// </summary>
        public IWorkCommand<evaL_3_12_Request, ObservableCollection<evaL_3_12_Info>> evaL_3_12_Command
        {
            get
            {
                return new WorkCommand<evaL_3_12_Request, ObservableCollection<evaL_3_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_12_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_生成估值产品历史资产信息
        /// </summary>
        public IWorkCommand<evaL_3_13_Request, ObservableCollection<evaL_3_13_Info>> evaL_3_13_Command
        {
            get
            {
                return new WorkCommand<evaL_3_13_Request, ObservableCollection<evaL_3_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_13_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_估值产品历史应收应付数据补算
        /// </summary>
        public IWorkCommand<evaL_3_14_Request, ObservableCollection<evaL_3_14_Info>> evaL_3_14_Command
        {
            get
            {
                return new WorkCommand<evaL_3_14_Request, ObservableCollection<evaL_3_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_14_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_估值产品历史数据重算
        /// </summary>
        public IWorkCommand<evaL_3_15_Request, ObservableCollection<evaL_3_15_Info>> evaL_3_15_Command
        {
            get
            {
                return new WorkCommand<evaL_3_15_Request, ObservableCollection<evaL_3_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_15_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_一键估值
        /// </summary>
        public IWorkCommand<evaL_3_16_Request, ObservableCollection<evaL_3_16_Info>> evaL_3_16_Command
        {
            get
            {
                return new WorkCommand<evaL_3_16_Request, ObservableCollection<evaL_3_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_16_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_新增估值产品费用流水
        /// </summary>
        public IWorkCommand<evaL_3_17_Request, ObservableCollection<evaL_3_17_Info>> evaL_3_17_Command
        {
            get
            {
                return new WorkCommand<evaL_3_17_Request, ObservableCollection<evaL_3_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_17_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_修改估值产品费用流水
        /// </summary>
        public IWorkCommand<evaL_3_18_Request, ObservableCollection<evaL_3_18_Info>> evaL_3_18_Command
        {
            get
            {
                return new WorkCommand<evaL_3_18_Request, ObservableCollection<evaL_3_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_18_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_删除估值产品费用流水
        /// </summary>
        public IWorkCommand<evaL_3_19_Request, ObservableCollection<evaL_3_19_Info>> evaL_3_19_Command
        {
            get
            {
                return new WorkCommand<evaL_3_19_Request, ObservableCollection<evaL_3_19_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_19_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询估值产品费用流水
        /// </summary>
        public IWorkCommand<evaL_3_20_Request, ObservableCollection<evaL_3_20_Info>> evaL_3_20_Command
        {
            get
            {
                return new WorkCommand<evaL_3_20_Request, ObservableCollection<evaL_3_20_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_20_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_新增估值产品利息流水
        /// </summary>
        public IWorkCommand<evaL_3_21_Request, ObservableCollection<evaL_3_21_Info>> evaL_3_21_Command
        {
            get
            {
                return new WorkCommand<evaL_3_21_Request, ObservableCollection<evaL_3_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_21_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_修改估值产品利息流水
        /// </summary>
        public IWorkCommand<evaL_3_22_Request, ObservableCollection<evaL_3_22_Info>> evaL_3_22_Command
        {
            get
            {
                return new WorkCommand<evaL_3_22_Request, ObservableCollection<evaL_3_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_22_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_删除估值产品利息流水
        /// </summary>
        public IWorkCommand<evaL_3_23_Request, ObservableCollection<evaL_3_23_Info>> evaL_3_23_Command
        {
            get
            {
                return new WorkCommand<evaL_3_23_Request, ObservableCollection<evaL_3_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_23_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询估值产品利息流水
        /// </summary>
        public IWorkCommand<evaL_3_24_Request, ObservableCollection<evaL_3_24_Info>> evaL_3_24_Command
        {
            get
            {
                return new WorkCommand<evaL_3_24_Request, ObservableCollection<evaL_3_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_24_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_新增外部估值科目数据
        /// </summary>
        public IWorkCommand<evaL_3_25_Request, ObservableCollection<evaL_3_25_Info>> evaL_3_25_Command
        {
            get
            {
                return new WorkCommand<evaL_3_25_Request, ObservableCollection<evaL_3_25_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_25_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询外部估值科目数据
        /// </summary>
        public IWorkCommand<evaL_3_26_Request, ObservableCollection<evaL_3_26_Info>> evaL_3_26_Command
        {
            get
            {
                return new WorkCommand<evaL_3_26_Request, ObservableCollection<evaL_3_26_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_26_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询外部估值数据核对结果
        /// </summary>
        public IWorkCommand<evaL_3_27_Request, ObservableCollection<evaL_3_27_Info>> evaL_3_27_Command
        {
            get
            {
                return new WorkCommand<evaL_3_27_Request, ObservableCollection<evaL_3_27_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_27_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询外部估值费用核对结果
        /// </summary>
        public IWorkCommand<evaL_3_28_Request, ObservableCollection<evaL_3_28_Info>> evaL_3_28_Command
        {
            get
            {
                return new WorkCommand<evaL_3_28_Request, ObservableCollection<evaL_3_28_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_28_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询外部估值利息核对结果
        /// </summary>
        public IWorkCommand<evaL_3_29_Request, ObservableCollection<evaL_3_29_Info>> evaL_3_29_Command
        {
            get
            {
                return new WorkCommand<evaL_3_29_Request, ObservableCollection<evaL_3_29_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_29_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询估值产品增值税明细
        /// </summary>
        public IWorkCommand<evaL_3_30_Request, ObservableCollection<evaL_3_30_Info>> evaL_3_30_Command
        {
            get
            {
                return new WorkCommand<evaL_3_30_Request, ObservableCollection<evaL_3_30_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_30_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询产品估值核对数据
        /// </summary>
        public IWorkCommand<evaL_3_31_Request, ObservableCollection<evaL_3_31_Info>> evaL_3_31_Command
        {
            get
            {
                return new WorkCommand<evaL_3_31_Request, ObservableCollection<evaL_3_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_31_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_更新估值产品核对数据
        /// </summary>
        public IWorkCommand<evaL_3_32_Request, ObservableCollection<evaL_3_32_Info>> evaL_3_32_Command
        {
            get
            {
                return new WorkCommand<evaL_3_32_Request, ObservableCollection<evaL_3_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_32_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_新增估值产品累计净值
        /// </summary>
        public IWorkCommand<evaL_3_33_Request, ObservableCollection<evaL_3_33_Info>> evaL_3_33_Command
        {
            get
            {
                return new WorkCommand<evaL_3_33_Request, ObservableCollection<evaL_3_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_33_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_修改估值产品累计净值
        /// </summary>
        public IWorkCommand<evaL_3_34_Request, ObservableCollection<evaL_3_34_Info>> evaL_3_34_Command
        {
            get
            {
                return new WorkCommand<evaL_3_34_Request, ObservableCollection<evaL_3_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_34_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_删除估值产品累计净值
        /// </summary>
        public IWorkCommand<evaL_3_35_Request, ObservableCollection<evaL_3_35_Info>> evaL_3_35_Command
        {
            get
            {
                return new WorkCommand<evaL_3_35_Request, ObservableCollection<evaL_3_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_35_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询估值产品累计净值
        /// </summary>
        public IWorkCommand<evaL_3_36_Request, ObservableCollection<evaL_3_36_Info>> evaL_3_36_Command
        {
            get
            {
                return new WorkCommand<evaL_3_36_Request, ObservableCollection<evaL_3_36_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_36_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_估值产品累计净值重算
        /// </summary>
        public IWorkCommand<evaL_3_37_Request, ObservableCollection<evaL_3_37_Info>> evaL_3_37_Command
        {
            get
            {
                return new WorkCommand<evaL_3_37_Request, ObservableCollection<evaL_3_37_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_37_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_导入产品增值税成交流水
        /// </summary>
        public IWorkCommand<evaL_3_38_Request, ObservableCollection<evaL_3_38_Info>> evaL_3_38_Command
        {
            get
            {
                return new WorkCommand<evaL_3_38_Request, ObservableCollection<evaL_3_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_38_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_删除产品增值税成交时间段
        /// </summary>
        public IWorkCommand<evaL_3_39_Request, ObservableCollection<evaL_3_39_Info>> evaL_3_39_Command
        {
            get
            {
                return new WorkCommand<evaL_3_39_Request, ObservableCollection<evaL_3_39_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_39_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_计算产品增值税
        /// </summary>
        public IWorkCommand<evaL_3_40_Request, ObservableCollection<evaL_3_40_Info>> evaL_3_40_Command
        {
            get
            {
                return new WorkCommand<evaL_3_40_Request, ObservableCollection<evaL_3_40_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_40_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_删除估值产品增值税成交流水
        /// </summary>
        public IWorkCommand<evaL_3_41_Request, ObservableCollection<evaL_3_41_Info>> evaL_3_41_Command
        {
            get
            {
                return new WorkCommand<evaL_3_41_Request, ObservableCollection<evaL_3_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_41_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_删除估值产品增值税成交明细
        /// </summary>
        public IWorkCommand<evaL_3_42_Request, ObservableCollection<evaL_3_42_Info>> evaL_3_42_Command
        {
            get
            {
                return new WorkCommand<evaL_3_42_Request, ObservableCollection<evaL_3_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_42_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询估值产品增值税成交汇总
        /// </summary>
        public IWorkCommand<evaL_3_43_Request, ObservableCollection<evaL_3_43_Info>> evaL_3_43_Command
        {
            get
            {
                return new WorkCommand<evaL_3_43_Request, ObservableCollection<evaL_3_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_43_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询估值产品增值税成交明细
        /// </summary>
        public IWorkCommand<evaL_3_44_Request, ObservableCollection<evaL_3_44_Info>> evaL_3_44_Command
        {
            get
            {
                return new WorkCommand<evaL_3_44_Request, ObservableCollection<evaL_3_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_44_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_修改估值产品资产信息备注
        /// </summary>
        public IWorkCommand<evaL_3_45_Request, ObservableCollection<evaL_3_45_Info>> evaL_3_45_Command
        {
            get
            {
                return new WorkCommand<evaL_3_45_Request, ObservableCollection<evaL_3_45_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_45_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询产品估值表单位净值
        /// </summary>
        public IWorkCommand<evaL_3_46_Request, ObservableCollection<evaL_3_46_Info>> evaL_3_46_Command
        {
            get
            {
                return new WorkCommand<evaL_3_46_Request, ObservableCollection<evaL_3_46_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_46_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询估值产品交易组资产信息
        /// </summary>
        public IWorkCommand<evaL_3_47_Request, ObservableCollection<evaL_3_47_Info>> evaL_3_47_Command
        {
            get
            {
                return new WorkCommand<evaL_3_47_Request, ObservableCollection<evaL_3_47_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_47_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_新增估值产品交易组费用
        /// </summary>
        public IWorkCommand<evaL_3_48_Request, ObservableCollection<evaL_3_48_Info>> evaL_3_48_Command
        {
            get
            {
                return new WorkCommand<evaL_3_48_Request, ObservableCollection<evaL_3_48_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_48_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_修改估值产品交易组费用
        /// </summary>
        public IWorkCommand<evaL_3_49_Request, ObservableCollection<evaL_3_49_Info>> evaL_3_49_Command
        {
            get
            {
                return new WorkCommand<evaL_3_49_Request, ObservableCollection<evaL_3_49_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_49_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_删除估值产品交易组费用
        /// </summary>
        public IWorkCommand<evaL_3_50_Request, ObservableCollection<evaL_3_50_Info>> evaL_3_50_Command
        {
            get
            {
                return new WorkCommand<evaL_3_50_Request, ObservableCollection<evaL_3_50_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_50_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询估值产品交易组费用
        /// </summary>
        public IWorkCommand<evaL_3_51_Request, ObservableCollection<evaL_3_51_Info>> evaL_3_51_Command
        {
            get
            {
                return new WorkCommand<evaL_3_51_Request, ObservableCollection<evaL_3_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_51_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_新增估值产品交易组利息
        /// </summary>
        public IWorkCommand<evaL_3_52_Request, ObservableCollection<evaL_3_52_Info>> evaL_3_52_Command
        {
            get
            {
                return new WorkCommand<evaL_3_52_Request, ObservableCollection<evaL_3_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_52_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_修改估值产品交易组利息
        /// </summary>
        public IWorkCommand<evaL_3_53_Request, ObservableCollection<evaL_3_53_Info>> evaL_3_53_Command
        {
            get
            {
                return new WorkCommand<evaL_3_53_Request, ObservableCollection<evaL_3_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_53_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_删除估值产品交易组利息
        /// </summary>
        public IWorkCommand<evaL_3_54_Request, ObservableCollection<evaL_3_54_Info>> evaL_3_54_Command
        {
            get
            {
                return new WorkCommand<evaL_3_54_Request, ObservableCollection<evaL_3_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_54_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_查询估值产品交易组利息
        /// </summary>
        public IWorkCommand<evaL_3_55_Request, ObservableCollection<evaL_3_55_Info>> evaL_3_55_Command
        {
            get
            {
                return new WorkCommand<evaL_3_55_Request, ObservableCollection<evaL_3_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_55_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_估值系统数据归档
        /// </summary>
        public IWorkCommand<evaL_3_101_Request, ObservableCollection<evaL_3_101_Info>> evaL_3_101_Command
        {
            get
            {
                return new WorkCommand<evaL_3_101_Request, ObservableCollection<evaL_3_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_101_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_估值系统初始化
        /// </summary>
        public IWorkCommand<evaL_3_102_Request, ObservableCollection<evaL_3_102_Info>> evaL_3_102_Command
        {
            get
            {
                return new WorkCommand<evaL_3_102_Request, ObservableCollection<evaL_3_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_102_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_估值系统自动估值定时任务
        /// </summary>
        public IWorkCommand<evaL_3_103_Request, ObservableCollection<evaL_3_103_Info>> evaL_3_103_Command
        {
            get
            {
                return new WorkCommand<evaL_3_103_Request, ObservableCollection<evaL_3_103_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_103_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_单产品获取数据估值
        /// </summary>
        public IWorkCommand<evaL_3_104_Request, ObservableCollection<evaL_3_104_Info>> evaL_3_104_Command
        {
            get
            {
                return new WorkCommand<evaL_3_104_Request, ObservableCollection<evaL_3_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_104_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_估值系统节假日补算
        /// </summary>
        public IWorkCommand<evaL_3_105_Request, ObservableCollection<evaL_3_105_Info>> evaL_3_105_Command
        {
            get
            {
                return new WorkCommand<evaL_3_105_Request, ObservableCollection<evaL_3_105_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_105_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_平台估值_估值汇总_产品校准
        /// </summary>
        public IWorkCommand<evaL_3_106_Request, ObservableCollection<evaL_3_106_Info>> evaL_3_106_Command
        {
            get
            {
                return new WorkCommand<evaL_3_106_Request, ObservableCollection<evaL_3_106_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).evaL_3_106_InfoList;
                });
            }
        }

    }
}
