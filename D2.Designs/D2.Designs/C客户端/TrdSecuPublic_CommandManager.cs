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
    public partial class TrdSecuPublicCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_交易证券_公用_更新报盘机状态
        /// </summary>
        public IWorkCommand<tdsecuL_1_1_Request, ObservableCollection<tdsecuL_1_1_Info>> tdsecuL_1_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_1_Request, ObservableCollection<tdsecuL_1_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_新增篮子
        /// </summary>
        public IWorkCommand<tdsecuL_1_11_Request, ObservableCollection<tdsecuL_1_11_Info>> tdsecuL_1_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_11_Request, ObservableCollection<tdsecuL_1_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_修改篮子
        /// </summary>
        public IWorkCommand<tdsecuL_1_12_Request, ObservableCollection<tdsecuL_1_12_Info>> tdsecuL_1_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_12_Request, ObservableCollection<tdsecuL_1_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_删除篮子
        /// </summary>
        public IWorkCommand<tdsecuL_1_13_Request, ObservableCollection<tdsecuL_1_13_Info>> tdsecuL_1_13_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_13_Request, ObservableCollection<tdsecuL_1_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_13_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_查询篮子
        /// </summary>
        public IWorkCommand<tdsecuL_1_14_Request, ObservableCollection<tdsecuL_1_14_Info>> tdsecuL_1_14_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_14_Request, ObservableCollection<tdsecuL_1_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_14_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_新增篮子成份
        /// </summary>
        public IWorkCommand<tdsecuL_1_21_Request, ObservableCollection<tdsecuL_1_21_Info>> tdsecuL_1_21_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_21_Request, ObservableCollection<tdsecuL_1_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_21_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_修改篮子成份
        /// </summary>
        public IWorkCommand<tdsecuL_1_22_Request, ObservableCollection<tdsecuL_1_22_Info>> tdsecuL_1_22_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_22_Request, ObservableCollection<tdsecuL_1_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_22_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_删除篮子成份
        /// </summary>
        public IWorkCommand<tdsecuL_1_23_Request, ObservableCollection<tdsecuL_1_23_Info>> tdsecuL_1_23_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_23_Request, ObservableCollection<tdsecuL_1_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_23_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_查询篮子成份
        /// </summary>
        public IWorkCommand<tdsecuL_1_24_Request, ObservableCollection<tdsecuL_1_24_Info>> tdsecuL_1_24_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_24_Request, ObservableCollection<tdsecuL_1_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_24_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_数据归历史
        /// </summary>
        public IWorkCommand<tdsecuL_1_51_Request, ObservableCollection<tdsecuL_1_51_Info>> tdsecuL_1_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_51_Request, ObservableCollection<tdsecuL_1_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_数据归档
        /// </summary>
        public IWorkCommand<tdsecuL_1_54_Request, ObservableCollection<tdsecuL_1_54_Info>> tdsecuL_1_54_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_54_Request, ObservableCollection<tdsecuL_1_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_54_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_获取业务记录编号
        /// </summary>
        public IWorkCommand<tdsecuL_1_901_Request, ObservableCollection<tdsecuL_1_901_Info>> tdsecuL_1_901_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_901_Request, ObservableCollection<tdsecuL_1_901_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_901_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_新增组合
        /// </summary>
        public IWorkCommand<tdsecuL_1_31_Request, ObservableCollection<tdsecuL_1_31_Info>> tdsecuL_1_31_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_31_Request, ObservableCollection<tdsecuL_1_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_31_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_修改组合
        /// </summary>
        public IWorkCommand<tdsecuL_1_32_Request, ObservableCollection<tdsecuL_1_32_Info>> tdsecuL_1_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_32_Request, ObservableCollection<tdsecuL_1_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_删除组合
        /// </summary>
        public IWorkCommand<tdsecuL_1_33_Request, ObservableCollection<tdsecuL_1_33_Info>> tdsecuL_1_33_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_33_Request, ObservableCollection<tdsecuL_1_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_33_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_查询组合
        /// </summary>
        public IWorkCommand<tdsecuL_1_34_Request, ObservableCollection<tdsecuL_1_34_Info>> tdsecuL_1_34_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_34_Request, ObservableCollection<tdsecuL_1_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_34_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_新增组合证券
        /// </summary>
        public IWorkCommand<tdsecuL_1_35_Request, ObservableCollection<tdsecuL_1_35_Info>> tdsecuL_1_35_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_35_Request, ObservableCollection<tdsecuL_1_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_35_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_修改组合证券
        /// </summary>
        public IWorkCommand<tdsecuL_1_36_Request, ObservableCollection<tdsecuL_1_36_Info>> tdsecuL_1_36_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_36_Request, ObservableCollection<tdsecuL_1_36_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_36_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_删除组合证券
        /// </summary>
        public IWorkCommand<tdsecuL_1_37_Request, ObservableCollection<tdsecuL_1_37_Info>> tdsecuL_1_37_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_37_Request, ObservableCollection<tdsecuL_1_37_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_37_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_查询组合证券
        /// </summary>
        public IWorkCommand<tdsecuL_1_38_Request, ObservableCollection<tdsecuL_1_38_Info>> tdsecuL_1_38_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_38_Request, ObservableCollection<tdsecuL_1_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_38_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_计算组合市值
        /// </summary>
        public IWorkCommand<tdsecuL_1_39_Request, ObservableCollection<tdsecuL_1_39_Info>> tdsecuL_1_39_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_39_Request, ObservableCollection<tdsecuL_1_39_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_39_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_转入产品证券负债明细记录
        /// </summary>
        public IWorkCommand<tdsecuL_1_56_Request, ObservableCollection<tdsecuL_1_56_Info>> tdsecuL_1_56_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_56_Request, ObservableCollection<tdsecuL_1_56_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_56_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_新增指令自动分发规则
        /// </summary>
        public IWorkCommand<tdsecuL_1_40_Request, ObservableCollection<tdsecuL_1_40_Info>> tdsecuL_1_40_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_40_Request, ObservableCollection<tdsecuL_1_40_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_40_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_修改指令自动分发规则
        /// </summary>
        public IWorkCommand<tdsecuL_1_41_Request, ObservableCollection<tdsecuL_1_41_Info>> tdsecuL_1_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_41_Request, ObservableCollection<tdsecuL_1_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_删除指令自动分发规则
        /// </summary>
        public IWorkCommand<tdsecuL_1_42_Request, ObservableCollection<tdsecuL_1_42_Info>> tdsecuL_1_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_42_Request, ObservableCollection<tdsecuL_1_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_查询指令自动分发规则
        /// </summary>
        public IWorkCommand<tdsecuL_1_43_Request, ObservableCollection<tdsecuL_1_43_Info>> tdsecuL_1_43_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_43_Request, ObservableCollection<tdsecuL_1_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_43_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_融资融券归档
        /// </summary>
        public IWorkCommand<tdsecuL_1_60_Request, ObservableCollection<tdsecuL_1_60_Info>> tdsecuL_1_60_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_60_Request, ObservableCollection<tdsecuL_1_60_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_60_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_组合归档
        /// </summary>
        public IWorkCommand<tdsecuL_1_61_Request, ObservableCollection<tdsecuL_1_61_Info>> tdsecuL_1_61_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_61_Request, ObservableCollection<tdsecuL_1_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_61_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_策略归档
        /// </summary>
        public IWorkCommand<tdsecuL_1_62_Request, ObservableCollection<tdsecuL_1_62_Info>> tdsecuL_1_62_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_62_Request, ObservableCollection<tdsecuL_1_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_62_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_T0归档
        /// </summary>
        public IWorkCommand<tdsecuL_1_63_Request, ObservableCollection<tdsecuL_1_63_Info>> tdsecuL_1_63_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_63_Request, ObservableCollection<tdsecuL_1_63_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_63_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_资金持仓归档
        /// </summary>
        public IWorkCommand<tdsecuL_1_64_Request, ObservableCollection<tdsecuL_1_64_Info>> tdsecuL_1_64_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_64_Request, ObservableCollection<tdsecuL_1_64_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_64_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_成交归档
        /// </summary>
        public IWorkCommand<tdsecuL_1_65_Request, ObservableCollection<tdsecuL_1_65_Info>> tdsecuL_1_65_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_65_Request, ObservableCollection<tdsecuL_1_65_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_65_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_订单归档
        /// </summary>
        public IWorkCommand<tdsecuL_1_66_Request, ObservableCollection<tdsecuL_1_66_Info>> tdsecuL_1_66_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_66_Request, ObservableCollection<tdsecuL_1_66_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_66_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_公用_指令归档
        /// </summary>
        public IWorkCommand<tdsecuL_1_67_Request, ObservableCollection<tdsecuL_1_67_Info>> tdsecuL_1_67_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_1_67_Request, ObservableCollection<tdsecuL_1_67_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_1_67_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
