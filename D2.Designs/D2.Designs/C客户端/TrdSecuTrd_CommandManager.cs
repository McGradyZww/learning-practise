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
    public partial class TrdSecuTrdCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_交易证券_交易_新增订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_11_Request, ObservableCollection<tdsecuL_4_11_Info>> tdsecuL_4_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_11_Request, ObservableCollection<tdsecuL_4_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_撤销订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_12_Request, ObservableCollection<tdsecuL_4_12_Info>> tdsecuL_4_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_12_Request, ObservableCollection<tdsecuL_4_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_新增改单
        /// </summary>
        public IWorkCommand<tdsecuL_4_14_Request, ObservableCollection<tdsecuL_4_14_Info>> tdsecuL_4_14_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_14_Request, ObservableCollection<tdsecuL_4_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_14_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_新增篮子批量订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_15_Request, ObservableCollection<tdsecuL_4_15_Info>> tdsecuL_4_15_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_15_Request, ObservableCollection<tdsecuL_4_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_15_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_新增待执行订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_16_Request, ObservableCollection<tdsecuL_4_16_Info>> tdsecuL_4_16_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_16_Request, ObservableCollection<tdsecuL_4_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_16_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_修改待执行订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_17_Request, ObservableCollection<tdsecuL_4_17_Info>> tdsecuL_4_17_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_17_Request, ObservableCollection<tdsecuL_4_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_17_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询报盘订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_21_Request, ObservableCollection<tdsecuL_4_21_Info>> tdsecuL_4_21_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_21_Request, ObservableCollection<tdsecuL_4_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_21_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询报盘撤单
        /// </summary>
        public IWorkCommand<tdsecuL_4_22_Request, ObservableCollection<tdsecuL_4_22_Info>> tdsecuL_4_22_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_22_Request, ObservableCollection<tdsecuL_4_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_22_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_更新订单状态
        /// </summary>
        public IWorkCommand<tdsecuL_4_23_Request, ObservableCollection<tdsecuL_4_23_Info>> tdsecuL_4_23_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_23_Request, ObservableCollection<tdsecuL_4_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_23_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_处理异常撤单
        /// </summary>
        public IWorkCommand<tdsecuL_4_31_Request, ObservableCollection<tdsecuL_4_31_Info>> tdsecuL_4_31_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_31_Request, ObservableCollection<tdsecuL_4_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_31_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_手工补单
        /// </summary>
        public IWorkCommand<tdsecuL_4_32_Request, ObservableCollection<tdsecuL_4_32_Info>> tdsecuL_4_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_32_Request, ObservableCollection<tdsecuL_4_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_导入订单补单
        /// </summary>
        public IWorkCommand<tdsecuL_4_33_Request, ObservableCollection<tdsecuL_4_33_Info>> tdsecuL_4_33_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_33_Request, ObservableCollection<tdsecuL_4_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_33_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_新增篮子订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_41_Request, ObservableCollection<tdsecuL_4_41_Info>> tdsecuL_4_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_41_Request, ObservableCollection<tdsecuL_4_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_新增预埋订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_42_Request, ObservableCollection<tdsecuL_4_42_Info>> tdsecuL_4_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_42_Request, ObservableCollection<tdsecuL_4_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_修改预埋订单状态
        /// </summary>
        public IWorkCommand<tdsecuL_4_43_Request, ObservableCollection<tdsecuL_4_43_Info>> tdsecuL_4_43_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_43_Request, ObservableCollection<tdsecuL_4_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_43_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_新增组合订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_44_Request, ObservableCollection<tdsecuL_4_44_Info>> tdsecuL_4_44_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_44_Request, ObservableCollection<tdsecuL_4_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_44_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询报盘订单主推
        /// </summary>
        public IWorkCommand<tdsecuL_4_45_Request, ObservableCollection<tdsecuL_4_45_Info>> tdsecuL_4_45_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_45_Request, ObservableCollection<tdsecuL_4_45_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_45_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询报盘撤单主推
        /// </summary>
        public IWorkCommand<tdsecuL_4_46_Request, ObservableCollection<tdsecuL_4_46_Info>> tdsecuL_4_46_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_46_Request, ObservableCollection<tdsecuL_4_46_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_46_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_修改预埋订单信息
        /// </summary>
        public IWorkCommand<tdsecuL_4_47_Request, ObservableCollection<tdsecuL_4_47_Info>> tdsecuL_4_47_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_47_Request, ObservableCollection<tdsecuL_4_47_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_47_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_101_Request, ObservableCollection<tdsecuL_4_101_Info>> tdsecuL_4_101_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_101_Request, ObservableCollection<tdsecuL_4_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_101_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询订单历史
        /// </summary>
        public IWorkCommand<tdsecuL_4_102_Request, ObservableCollection<tdsecuL_4_102_Info>> tdsecuL_4_102_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_102_Request, ObservableCollection<tdsecuL_4_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_102_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询订单汇总
        /// </summary>
        public IWorkCommand<tdsecuL_4_103_Request, ObservableCollection<tdsecuL_4_103_Info>> tdsecuL_4_103_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_103_Request, ObservableCollection<tdsecuL_4_103_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_103_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询篮子订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_104_Request, ObservableCollection<tdsecuL_4_104_Info>> tdsecuL_4_104_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_104_Request, ObservableCollection<tdsecuL_4_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_104_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询预埋订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_105_Request, ObservableCollection<tdsecuL_4_105_Info>> tdsecuL_4_105_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_105_Request, ObservableCollection<tdsecuL_4_105_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_105_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询改单
        /// </summary>
        public IWorkCommand<tdsecuL_4_106_Request, ObservableCollection<tdsecuL_4_106_Info>> tdsecuL_4_106_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_106_Request, ObservableCollection<tdsecuL_4_106_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_106_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询改单历史
        /// </summary>
        public IWorkCommand<tdsecuL_4_107_Request, ObservableCollection<tdsecuL_4_107_Info>> tdsecuL_4_107_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_107_Request, ObservableCollection<tdsecuL_4_107_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_107_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询未成交代码列表
        /// </summary>
        public IWorkCommand<tdsecuL_4_108_Request, ObservableCollection<tdsecuL_4_108_Info>> tdsecuL_4_108_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_108_Request, ObservableCollection<tdsecuL_4_108_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_108_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_证券行情检查账户成交
        /// </summary>
        public IWorkCommand<tdsecuL_4_109_Request, ObservableCollection<tdsecuL_4_109_Info>> tdsecuL_4_109_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_109_Request, ObservableCollection<tdsecuL_4_109_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_109_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询订单汇总历史
        /// </summary>
        public IWorkCommand<tdsecuL_4_110_Request, ObservableCollection<tdsecuL_4_110_Info>> tdsecuL_4_110_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_110_Request, ObservableCollection<tdsecuL_4_110_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_110_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询待执行订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_111_Request, ObservableCollection<tdsecuL_4_111_Info>> tdsecuL_4_111_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_111_Request, ObservableCollection<tdsecuL_4_111_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_111_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询待执行订单历史
        /// </summary>
        public IWorkCommand<tdsecuL_4_112_Request, ObservableCollection<tdsecuL_4_112_Info>> tdsecuL_4_112_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_112_Request, ObservableCollection<tdsecuL_4_112_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_112_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询订单记录数
        /// </summary>
        public IWorkCommand<tdsecuL_4_113_Request, ObservableCollection<tdsecuL_4_113_Info>> tdsecuL_4_113_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_113_Request, ObservableCollection<tdsecuL_4_113_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_113_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询交易组订单记录数
        /// </summary>
        public IWorkCommand<tdsecuL_4_114_Request, ObservableCollection<tdsecuL_4_114_Info>> tdsecuL_4_114_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_114_Request, ObservableCollection<tdsecuL_4_114_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_114_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_新增订单1
        /// </summary>
        public IWorkCommand<tdsecuL_4_115_Request, ObservableCollection<tdsecuL_4_115_Info>> tdsecuL_4_115_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_115_Request, ObservableCollection<tdsecuL_4_115_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_115_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询组合交易流水记录
        /// </summary>
        public IWorkCommand<tdsecuL_4_120_Request, ObservableCollection<tdsecuL_4_120_Info>> tdsecuL_4_120_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_120_Request, ObservableCollection<tdsecuL_4_120_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_120_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询历史组合交易流水记录
        /// </summary>
        public IWorkCommand<tdsecuL_4_121_Request, ObservableCollection<tdsecuL_4_121_Info>> tdsecuL_4_121_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_121_Request, ObservableCollection<tdsecuL_4_121_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_121_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_导入订单表
        /// </summary>
        public IWorkCommand<tdsecuL_4_122_Request, ObservableCollection<tdsecuL_4_122_Info>> tdsecuL_4_122_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_122_Request, ObservableCollection<tdsecuL_4_122_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_122_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询资产账户订单记录数
        /// </summary>
        public IWorkCommand<tdsecuL_4_123_Request, ObservableCollection<tdsecuL_4_123_Info>> tdsecuL_4_123_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_123_Request, ObservableCollection<tdsecuL_4_123_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_123_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询产品订单记录数
        /// </summary>
        public IWorkCommand<tdsecuL_4_124_Request, ObservableCollection<tdsecuL_4_124_Info>> tdsecuL_4_124_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_124_Request, ObservableCollection<tdsecuL_4_124_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_124_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询资产账户下交易组订单记录数
        /// </summary>
        public IWorkCommand<tdsecuL_4_125_Request, ObservableCollection<tdsecuL_4_125_Info>> tdsecuL_4_125_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_125_Request, ObservableCollection<tdsecuL_4_125_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_125_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_新增交易时间配置
        /// </summary>
        public IWorkCommand<tdsecuL_4_126_Request, ObservableCollection<tdsecuL_4_126_Info>> tdsecuL_4_126_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_126_Request, ObservableCollection<tdsecuL_4_126_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_126_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_删除交易时间配置
        /// </summary>
        public IWorkCommand<tdsecuL_4_127_Request, ObservableCollection<tdsecuL_4_127_Info>> tdsecuL_4_127_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_127_Request, ObservableCollection<tdsecuL_4_127_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_127_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询交易时间配置
        /// </summary>
        public IWorkCommand<tdsecuL_4_128_Request, ObservableCollection<tdsecuL_4_128_Info>> tdsecuL_4_128_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_128_Request, ObservableCollection<tdsecuL_4_128_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_128_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询股东代码订单记录数
        /// </summary>
        public IWorkCommand<tdsecuL_4_129_Request, ObservableCollection<tdsecuL_4_129_Info>> tdsecuL_4_129_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_129_Request, ObservableCollection<tdsecuL_4_129_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_129_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_融资融券新增订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_130_Request, ObservableCollection<tdsecuL_4_130_Info>> tdsecuL_4_130_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_130_Request, ObservableCollection<tdsecuL_4_130_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_130_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_融资融券撤销订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_131_Request, ObservableCollection<tdsecuL_4_131_Info>> tdsecuL_4_131_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_131_Request, ObservableCollection<tdsecuL_4_131_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_131_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_插件新增订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_132_Request, ObservableCollection<tdsecuL_4_132_Info>> tdsecuL_4_132_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_132_Request, ObservableCollection<tdsecuL_4_132_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_132_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_插件撤销订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_133_Request, ObservableCollection<tdsecuL_4_133_Info>> tdsecuL_4_133_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_133_Request, ObservableCollection<tdsecuL_4_133_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_133_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_插件新增改单
        /// </summary>
        public IWorkCommand<tdsecuL_4_134_Request, ObservableCollection<tdsecuL_4_134_Info>> tdsecuL_4_134_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_134_Request, ObservableCollection<tdsecuL_4_134_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_134_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_插件修改预埋订单状态
        /// </summary>
        public IWorkCommand<tdsecuL_4_135_Request, ObservableCollection<tdsecuL_4_135_Info>> tdsecuL_4_135_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_135_Request, ObservableCollection<tdsecuL_4_135_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_135_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_修改交易时间配置
        /// </summary>
        public IWorkCommand<tdsecuL_4_136_Request, ObservableCollection<tdsecuL_4_136_Info>> tdsecuL_4_136_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_136_Request, ObservableCollection<tdsecuL_4_136_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_136_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_插件修改预埋订单信息
        /// </summary>
        public IWorkCommand<tdsecuL_4_137_Request, ObservableCollection<tdsecuL_4_137_Info>> tdsecuL_4_137_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_137_Request, ObservableCollection<tdsecuL_4_137_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_137_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_新增组合策略订单
        /// </summary>
        public IWorkCommand<tdsecuL_4_138_Request, ObservableCollection<tdsecuL_4_138_Info>> tdsecuL_4_138_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_138_Request, ObservableCollection<tdsecuL_4_138_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_138_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易_查询交易组在途业务
        /// </summary>
        public IWorkCommand<tdsecuL_4_139_Request, ObservableCollection<tdsecuL_4_139_Info>> tdsecuL_4_139_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_4_139_Request, ObservableCollection<tdsecuL_4_139_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_4_139_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
