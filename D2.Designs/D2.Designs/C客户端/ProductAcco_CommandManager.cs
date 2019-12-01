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
    public partial class ProductAccoCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_产品_账户_新增产品信息
        /// </summary>
        public IWorkCommand<prodL_1_1_Request, ObservableCollection<prodL_1_1_Info>> prodL_1_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_1_Request, ObservableCollection<prodL_1_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_修改产品信息
        /// </summary>
        public IWorkCommand<prodL_1_2_Request, ObservableCollection<prodL_1_2_Info>> prodL_1_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_2_Request, ObservableCollection<prodL_1_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询产品信息
        /// </summary>
        public IWorkCommand<prodL_1_4_Request, ObservableCollection<prodL_1_4_Info>> prodL_1_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_4_Request, ObservableCollection<prodL_1_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询历史产品信息
        /// </summary>
        public IWorkCommand<prodL_1_5_Request, ObservableCollection<prodL_1_5_Info>> prodL_1_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_5_Request, ObservableCollection<prodL_1_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询产品信息流水
        /// </summary>
        public IWorkCommand<prodL_1_6_Request, ObservableCollection<prodL_1_6_Info>> prodL_1_6_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_6_Request, ObservableCollection<prodL_1_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_6_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询历史产品信息流水
        /// </summary>
        public IWorkCommand<prodL_1_7_Request, ObservableCollection<prodL_1_7_Info>> prodL_1_7_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_7_Request, ObservableCollection<prodL_1_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_7_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_冻结产品
        /// </summary>
        public IWorkCommand<prodL_1_8_Request, ObservableCollection<prodL_1_8_Info>> prodL_1_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_8_Request, ObservableCollection<prodL_1_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_恢复产品
        /// </summary>
        public IWorkCommand<prodL_1_9_Request, ObservableCollection<prodL_1_9_Info>> prodL_1_9_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_9_Request, ObservableCollection<prodL_1_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_9_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_注销产品
        /// </summary>
        public IWorkCommand<prodL_1_10_Request, ObservableCollection<prodL_1_10_Info>> prodL_1_10_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_10_Request, ObservableCollection<prodL_1_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_10_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_检查产品存在
        /// </summary>
        public IWorkCommand<prodL_1_11_Request, ObservableCollection<prodL_1_11_Info>> prodL_1_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_11_Request, ObservableCollection<prodL_1_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询全部产品列表
        /// </summary>
        public IWorkCommand<prodL_1_12_Request, ObservableCollection<prodL_1_12_Info>> prodL_1_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_12_Request, ObservableCollection<prodL_1_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询可见产品列表
        /// </summary>
        public IWorkCommand<prodL_1_13_Request, ObservableCollection<prodL_1_13_Info>> prodL_1_13_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_13_Request, ObservableCollection<prodL_1_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_13_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询产品历史最高单位净值
        /// </summary>
        public IWorkCommand<prodL_1_17_Request, ObservableCollection<prodL_1_17_Info>> prodL_1_17_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_17_Request, ObservableCollection<prodL_1_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_17_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_修改产品限制信息
        /// </summary>
        public IWorkCommand<prodL_1_22_Request, ObservableCollection<prodL_1_22_Info>> prodL_1_22_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_22_Request, ObservableCollection<prodL_1_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_22_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询产品限制信息
        /// </summary>
        public IWorkCommand<prodL_1_24_Request, ObservableCollection<prodL_1_24_Info>> prodL_1_24_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_24_Request, ObservableCollection<prodL_1_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_24_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询产品限制信息流水
        /// </summary>
        public IWorkCommand<prodL_1_25_Request, ObservableCollection<prodL_1_25_Info>> prodL_1_25_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_25_Request, ObservableCollection<prodL_1_25_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_25_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询历史产品限制信息流水
        /// </summary>
        public IWorkCommand<prodL_1_26_Request, ObservableCollection<prodL_1_26_Info>> prodL_1_26_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_26_Request, ObservableCollection<prodL_1_26_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_26_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_修改产品业务控制配置串
        /// </summary>
        public IWorkCommand<prodL_1_27_Request, ObservableCollection<prodL_1_27_Info>> prodL_1_27_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_27_Request, ObservableCollection<prodL_1_27_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_27_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_修改产品禁止订单方向
        /// </summary>
        public IWorkCommand<prodL_1_28_Request, ObservableCollection<prodL_1_28_Info>> prodL_1_28_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_28_Request, ObservableCollection<prodL_1_28_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_28_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_修改产品允许订单方向
        /// </summary>
        public IWorkCommand<prodL_1_29_Request, ObservableCollection<prodL_1_29_Info>> prodL_1_29_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_29_Request, ObservableCollection<prodL_1_29_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_29_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_检查银行账户存在
        /// </summary>
        public IWorkCommand<prodL_1_30_Request, ObservableCollection<prodL_1_30_Info>> prodL_1_30_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_30_Request, ObservableCollection<prodL_1_30_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_30_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_新增银行账户信息
        /// </summary>
        public IWorkCommand<prodL_1_31_Request, ObservableCollection<prodL_1_31_Info>> prodL_1_31_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_31_Request, ObservableCollection<prodL_1_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_31_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_修改银行账户信息
        /// </summary>
        public IWorkCommand<prodL_1_32_Request, ObservableCollection<prodL_1_32_Info>> prodL_1_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_32_Request, ObservableCollection<prodL_1_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_删除银行账户信息
        /// </summary>
        public IWorkCommand<prodL_1_33_Request, ObservableCollection<prodL_1_33_Info>> prodL_1_33_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_33_Request, ObservableCollection<prodL_1_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_33_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询银行账户信息
        /// </summary>
        public IWorkCommand<prodL_1_34_Request, ObservableCollection<prodL_1_34_Info>> prodL_1_34_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_34_Request, ObservableCollection<prodL_1_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_34_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询银行账户信息流水
        /// </summary>
        public IWorkCommand<prodL_1_35_Request, ObservableCollection<prodL_1_35_Info>> prodL_1_35_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_35_Request, ObservableCollection<prodL_1_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_35_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询历史银行账户信息流水
        /// </summary>
        public IWorkCommand<prodL_1_36_Request, ObservableCollection<prodL_1_36_Info>> prodL_1_36_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_36_Request, ObservableCollection<prodL_1_36_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_36_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_检查资产账户存在
        /// </summary>
        public IWorkCommand<prodL_1_40_Request, ObservableCollection<prodL_1_40_Info>> prodL_1_40_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_40_Request, ObservableCollection<prodL_1_40_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_40_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_新增资产账户信息
        /// </summary>
        public IWorkCommand<prodL_1_41_Request, ObservableCollection<prodL_1_41_Info>> prodL_1_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_41_Request, ObservableCollection<prodL_1_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_修改资产账户信息
        /// </summary>
        public IWorkCommand<prodL_1_42_Request, ObservableCollection<prodL_1_42_Info>> prodL_1_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_42_Request, ObservableCollection<prodL_1_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_删除资产账户信息
        /// </summary>
        public IWorkCommand<prodL_1_43_Request, ObservableCollection<prodL_1_43_Info>> prodL_1_43_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_43_Request, ObservableCollection<prodL_1_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_43_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询资产账户信息
        /// </summary>
        public IWorkCommand<prodL_1_44_Request, ObservableCollection<prodL_1_44_Info>> prodL_1_44_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_44_Request, ObservableCollection<prodL_1_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_44_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询资产账户信息流水
        /// </summary>
        public IWorkCommand<prodL_1_45_Request, ObservableCollection<prodL_1_45_Info>> prodL_1_45_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_45_Request, ObservableCollection<prodL_1_45_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_45_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询历史资产账户信息流水
        /// </summary>
        public IWorkCommand<prodL_1_46_Request, ObservableCollection<prodL_1_46_Info>> prodL_1_46_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_46_Request, ObservableCollection<prodL_1_46_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_46_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_冻结资产账户
        /// </summary>
        public IWorkCommand<prodL_1_47_Request, ObservableCollection<prodL_1_47_Info>> prodL_1_47_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_47_Request, ObservableCollection<prodL_1_47_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_47_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_恢复资产账户
        /// </summary>
        public IWorkCommand<prodL_1_48_Request, ObservableCollection<prodL_1_48_Info>> prodL_1_48_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_48_Request, ObservableCollection<prodL_1_48_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_48_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_注销资产账户
        /// </summary>
        public IWorkCommand<prodL_1_49_Request, ObservableCollection<prodL_1_49_Info>> prodL_1_49_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_49_Request, ObservableCollection<prodL_1_49_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_49_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_修改资产账户密码
        /// </summary>
        public IWorkCommand<prodL_1_50_Request, ObservableCollection<prodL_1_50_Info>> prodL_1_50_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_50_Request, ObservableCollection<prodL_1_50_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_50_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询资产账户列表
        /// </summary>
        public IWorkCommand<prodL_1_51_Request, ObservableCollection<prodL_1_51_Info>> prodL_1_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_51_Request, ObservableCollection<prodL_1_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_更新资产账户在线状态
        /// </summary>
        public IWorkCommand<prodL_1_52_Request, ObservableCollection<prodL_1_52_Info>> prodL_1_52_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_52_Request, ObservableCollection<prodL_1_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_52_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询资产账户通道信息
        /// </summary>
        public IWorkCommand<prodL_1_74_Request, ObservableCollection<prodL_1_74_Info>> prodL_1_74_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_74_Request, ObservableCollection<prodL_1_74_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_74_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_获取产品最大单位净值
        /// </summary>
        public IWorkCommand<prodL_1_75_Request, ObservableCollection<prodL_1_75_Info>> prodL_1_75_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_75_Request, ObservableCollection<prodL_1_75_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_75_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_获取产品最大净值
        /// </summary>
        public IWorkCommand<prodL_1_76_Request, ObservableCollection<prodL_1_76_Info>> prodL_1_76_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_76_Request, ObservableCollection<prodL_1_76_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_76_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_资产账户编号获取资产账户
        /// </summary>
        public IWorkCommand<prodL_1_77_Request, ObservableCollection<prodL_1_77_Info>> prodL_1_77_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_77_Request, ObservableCollection<prodL_1_77_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_77_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询产品份额变动流水
        /// </summary>
        public IWorkCommand<prodL_1_78_Request, ObservableCollection<prodL_1_78_Info>> prodL_1_78_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_78_Request, ObservableCollection<prodL_1_78_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_78_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询产品份额变动流水历史
        /// </summary>
        public IWorkCommand<prodL_1_79_Request, ObservableCollection<prodL_1_79_Info>> prodL_1_79_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_79_Request, ObservableCollection<prodL_1_79_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_79_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_修改产品限制信息风控版
        /// </summary>
        public IWorkCommand<prodL_1_80_Request, ObservableCollection<prodL_1_80_Info>> prodL_1_80_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_80_Request, ObservableCollection<prodL_1_80_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_80_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_修改产品工作流信息
        /// </summary>
        public IWorkCommand<prodL_1_81_Request, ObservableCollection<prodL_1_81_Info>> prodL_1_81_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_81_Request, ObservableCollection<prodL_1_81_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_81_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询产品工作流信息
        /// </summary>
        public IWorkCommand<prodL_1_82_Request, ObservableCollection<prodL_1_82_Info>> prodL_1_82_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_82_Request, ObservableCollection<prodL_1_82_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_82_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询账户同步信息
        /// </summary>
        public IWorkCommand<prodL_1_83_Request, ObservableCollection<prodL_1_83_Info>> prodL_1_83_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_83_Request, ObservableCollection<prodL_1_83_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_83_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_发送账户同步信息
        /// </summary>
        public IWorkCommand<prodL_1_84_Request, ObservableCollection<prodL_1_84_Info>> prodL_1_84_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_84_Request, ObservableCollection<prodL_1_84_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_84_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_获取产品工作流信息
        /// </summary>
        public IWorkCommand<prodL_1_85_Request, ObservableCollection<prodL_1_85_Info>> prodL_1_85_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_85_Request, ObservableCollection<prodL_1_85_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_85_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_账户登录回报
        /// </summary>
        public IWorkCommand<prodL_1_86_Request, ObservableCollection<prodL_1_86_Info>> prodL_1_86_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_86_Request, ObservableCollection<prodL_1_86_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_86_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_删除产品工作流信息
        /// </summary>
        public IWorkCommand<prodL_1_87_Request, ObservableCollection<prodL_1_87_Info>> prodL_1_87_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_87_Request, ObservableCollection<prodL_1_87_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_87_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_更新开盘检查流程
        /// </summary>
        public IWorkCommand<prodL_1_88_Request, ObservableCollection<prodL_1_88_Info>> prodL_1_88_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_88_Request, ObservableCollection<prodL_1_88_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_88_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询开盘检查流程
        /// </summary>
        public IWorkCommand<prodL_1_89_Request, ObservableCollection<prodL_1_89_Info>> prodL_1_89_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_89_Request, ObservableCollection<prodL_1_89_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_89_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_获取开盘检查流程
        /// </summary>
        public IWorkCommand<prodL_1_90_Request, ObservableCollection<prodL_1_90_Info>> prodL_1_90_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_90_Request, ObservableCollection<prodL_1_90_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_90_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询收盘作业流程
        /// </summary>
        public IWorkCommand<prodL_1_91_Request, ObservableCollection<prodL_1_91_Info>> prodL_1_91_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_91_Request, ObservableCollection<prodL_1_91_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_91_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_更新收盘作业流程
        /// </summary>
        public IWorkCommand<prodL_1_92_Request, ObservableCollection<prodL_1_92_Info>> prodL_1_92_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_92_Request, ObservableCollection<prodL_1_92_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_92_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_新增产品关系
        /// </summary>
        public IWorkCommand<prodL_1_101_Request, ObservableCollection<prodL_1_101_Info>> prodL_1_101_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_101_Request, ObservableCollection<prodL_1_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_101_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_删除产品关系
        /// </summary>
        public IWorkCommand<prodL_1_102_Request, ObservableCollection<prodL_1_102_Info>> prodL_1_102_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_102_Request, ObservableCollection<prodL_1_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_102_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询产品关系
        /// </summary>
        public IWorkCommand<prodL_1_103_Request, ObservableCollection<prodL_1_103_Info>> prodL_1_103_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_103_Request, ObservableCollection<prodL_1_103_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_103_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_获取注销资产账户串
        /// </summary>
        public IWorkCommand<prodL_1_104_Request, ObservableCollection<prodL_1_104_Info>> prodL_1_104_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_104_Request, ObservableCollection<prodL_1_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_104_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_新增融资融券配置表
        /// </summary>
        public IWorkCommand<prodL_1_105_Request, ObservableCollection<prodL_1_105_Info>> prodL_1_105_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_105_Request, ObservableCollection<prodL_1_105_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_105_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_修改融资融券配置表
        /// </summary>
        public IWorkCommand<prodL_1_106_Request, ObservableCollection<prodL_1_106_Info>> prodL_1_106_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_106_Request, ObservableCollection<prodL_1_106_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_106_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_删除融资融券配置表
        /// </summary>
        public IWorkCommand<prodL_1_107_Request, ObservableCollection<prodL_1_107_Info>> prodL_1_107_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_107_Request, ObservableCollection<prodL_1_107_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_107_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询融资融券配置表
        /// </summary>
        public IWorkCommand<prodL_1_108_Request, ObservableCollection<prodL_1_108_Info>> prodL_1_108_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_108_Request, ObservableCollection<prodL_1_108_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_108_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_查询资产账户默认交易组信息
        /// </summary>
        public IWorkCommand<prodL_1_109_Request, ObservableCollection<prodL_1_109_Info>> prodL_1_109_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_109_Request, ObservableCollection<prodL_1_109_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_109_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_设置资产账户默认交易组关系
        /// </summary>
        public IWorkCommand<prodL_1_110_Request, ObservableCollection<prodL_1_110_Info>> prodL_1_110_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_110_Request, ObservableCollection<prodL_1_110_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_110_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_删除资产账户默认交易组关系
        /// </summary>
        public IWorkCommand<prodL_1_111_Request, ObservableCollection<prodL_1_111_Info>> prodL_1_111_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_111_Request, ObservableCollection<prodL_1_111_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_111_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_导入产品信息
        /// </summary>
        public IWorkCommand<prodL_1_112_Request, ObservableCollection<prodL_1_112_Info>> prodL_1_112_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_112_Request, ObservableCollection<prodL_1_112_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_112_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_报盘回写通道信息
        /// </summary>
        public IWorkCommand<prodL_1_113_Request, ObservableCollection<prodL_1_113_Info>> prodL_1_113_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_113_Request, ObservableCollection<prodL_1_113_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_113_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_修改产品索引值
        /// </summary>
        public IWorkCommand<prodL_1_114_Request, ObservableCollection<prodL_1_114_Info>> prodL_1_114_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_114_Request, ObservableCollection<prodL_1_114_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_114_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_报盘校验资金账号
        /// </summary>
        public IWorkCommand<prodL_1_115_Request, ObservableCollection<prodL_1_115_Info>> prodL_1_115_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_115_Request, ObservableCollection<prodL_1_115_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_115_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_获取保证金比例
        /// </summary>
        public IWorkCommand<prodL_1_116_Request, ObservableCollection<prodL_1_116_Info>> prodL_1_116_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<prodL_1_116_Request, ObservableCollection<prodL_1_116_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).prodL_1_116_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_计算证券订单费用
        /// </summary>
        public IWorkCommand<prodL_1_117_Request, ObservableCollection<prodL_1_117_Info>> prodL_1_117_Command
        {
            get
            {
                return new WorkCommand<prodL_1_117_Request, ObservableCollection<prodL_1_117_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_1_117_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户_批量计算证券订单费用
        /// </summary>
        public IWorkCommand<prodL_1_118_Request, ObservableCollection<prodL_1_118_Info>> prodL_1_118_Command
        {
            get
            {
                return new WorkCommand<prodL_1_118_Request, ObservableCollection<prodL_1_118_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_1_118_InfoList;
                });
            }
        }

    }
}
