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
    public partial class BaseCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_公共_基础_设置系统信息
        /// </summary>
        public IWorkCommand<pubL_3_1_Request, ObservableCollection<pubL_3_1_Info>> pubL_3_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_1_Request, ObservableCollection<pubL_3_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_设置系统非交易日期
        /// </summary>
        public IWorkCommand<pubL_3_2_Request, ObservableCollection<pubL_3_2_Info>> pubL_3_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_2_Request, ObservableCollection<pubL_3_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_更新系统状态
        /// </summary>
        public IWorkCommand<pubL_3_3_Request, ObservableCollection<pubL_3_3_Info>> pubL_3_3_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_3_Request, ObservableCollection<pubL_3_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_3_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_获取系统信息
        /// </summary>
        public IWorkCommand<pubL_3_4_Request, ObservableCollection<pubL_3_4_Info>> pubL_3_4_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_4_Request, ObservableCollection<pubL_3_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_4_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询系统信息流水
        /// </summary>
        public IWorkCommand<pubL_3_5_Request, ObservableCollection<pubL_3_5_Info>> pubL_3_5_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_5_Request, ObservableCollection<pubL_3_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_5_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询历史系统信息流水
        /// </summary>
        public IWorkCommand<pubL_3_6_Request, ObservableCollection<pubL_3_6_Info>> pubL_3_6_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_6_Request, ObservableCollection<pubL_3_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_6_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_修改系统控制配置串
        /// </summary>
        public IWorkCommand<pubL_3_7_Request, ObservableCollection<pubL_3_7_Info>> pubL_3_7_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_7_Request, ObservableCollection<pubL_3_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_7_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_获取机器日期时间
        /// </summary>
        public IWorkCommand<pubL_3_8_Request, ObservableCollection<pubL_3_8_Info>> pubL_3_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_8_Request, ObservableCollection<pubL_3_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_新增机构信息
        /// </summary>
        public IWorkCommand<pubL_3_11_Request, ObservableCollection<pubL_3_11_Info>> pubL_3_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_11_Request, ObservableCollection<pubL_3_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_修改机构信息
        /// </summary>
        public IWorkCommand<pubL_3_12_Request, ObservableCollection<pubL_3_12_Info>> pubL_3_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_12_Request, ObservableCollection<pubL_3_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_冻结机构
        /// </summary>
        public IWorkCommand<pubL_3_14_Request, ObservableCollection<pubL_3_14_Info>> pubL_3_14_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_14_Request, ObservableCollection<pubL_3_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_14_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_解冻机构
        /// </summary>
        public IWorkCommand<pubL_3_15_Request, ObservableCollection<pubL_3_15_Info>> pubL_3_15_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_15_Request, ObservableCollection<pubL_3_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_15_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_注销机构
        /// </summary>
        public IWorkCommand<pubL_3_16_Request, ObservableCollection<pubL_3_16_Info>> pubL_3_16_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_16_Request, ObservableCollection<pubL_3_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_16_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询机构信息
        /// </summary>
        public IWorkCommand<pubL_3_18_Request, ObservableCollection<pubL_3_18_Info>> pubL_3_18_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_18_Request, ObservableCollection<pubL_3_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_18_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询机构信息流水
        /// </summary>
        public IWorkCommand<pubL_3_19_Request, ObservableCollection<pubL_3_19_Info>> pubL_3_19_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_19_Request, ObservableCollection<pubL_3_19_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_19_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询历史机构信息流水
        /// </summary>
        public IWorkCommand<pubL_3_20_Request, ObservableCollection<pubL_3_20_Info>> pubL_3_20_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_20_Request, ObservableCollection<pubL_3_20_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_20_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_检查机构编号存在
        /// </summary>
        public IWorkCommand<pubL_3_21_Request, ObservableCollection<pubL_3_21_Info>> pubL_3_21_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_21_Request, ObservableCollection<pubL_3_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_21_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_获取机构编号
        /// </summary>
        public IWorkCommand<pubL_3_22_Request, ObservableCollection<pubL_3_22_Info>> pubL_3_22_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_22_Request, ObservableCollection<pubL_3_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_22_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_修改机构业务范围
        /// </summary>
        public IWorkCommand<pubL_3_17_Request, ObservableCollection<pubL_3_17_Info>> pubL_3_17_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_17_Request, ObservableCollection<pubL_3_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_17_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_修改机构业务控制配置串
        /// </summary>
        public IWorkCommand<pubL_3_23_Request, ObservableCollection<pubL_3_23_Info>> pubL_3_23_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_23_Request, ObservableCollection<pubL_3_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_23_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询机构列表
        /// </summary>
        public IWorkCommand<pubL_3_24_Request, ObservableCollection<pubL_3_24_Info>> pubL_3_24_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_24_Request, ObservableCollection<pubL_3_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_24_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_设置系统配置
        /// </summary>
        public IWorkCommand<pubL_3_31_Request, ObservableCollection<pubL_3_31_Info>> pubL_3_31_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_31_Request, ObservableCollection<pubL_3_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_31_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询系统配置
        /// </summary>
        public IWorkCommand<pubL_3_32_Request, ObservableCollection<pubL_3_32_Info>> pubL_3_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_32_Request, ObservableCollection<pubL_3_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询系统配置流水
        /// </summary>
        public IWorkCommand<pubL_3_33_Request, ObservableCollection<pubL_3_33_Info>> pubL_3_33_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_33_Request, ObservableCollection<pubL_3_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_33_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询历史系统配置流水
        /// </summary>
        public IWorkCommand<pubL_3_34_Request, ObservableCollection<pubL_3_34_Info>> pubL_3_34_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_34_Request, ObservableCollection<pubL_3_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_34_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_新增机构汇率
        /// </summary>
        public IWorkCommand<pubL_3_35_Request, ObservableCollection<pubL_3_35_Info>> pubL_3_35_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_35_Request, ObservableCollection<pubL_3_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_35_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_修改机构汇率
        /// </summary>
        public IWorkCommand<pubL_3_36_Request, ObservableCollection<pubL_3_36_Info>> pubL_3_36_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_36_Request, ObservableCollection<pubL_3_36_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_36_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_删除机构汇率
        /// </summary>
        public IWorkCommand<pubL_3_37_Request, ObservableCollection<pubL_3_37_Info>> pubL_3_37_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_37_Request, ObservableCollection<pubL_3_37_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_37_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询机构汇率
        /// </summary>
        public IWorkCommand<pubL_3_38_Request, ObservableCollection<pubL_3_38_Info>> pubL_3_38_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_38_Request, ObservableCollection<pubL_3_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_38_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询机构汇率流水
        /// </summary>
        public IWorkCommand<pubL_3_39_Request, ObservableCollection<pubL_3_39_Info>> pubL_3_39_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_39_Request, ObservableCollection<pubL_3_39_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_39_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询历史机构汇率流水
        /// </summary>
        public IWorkCommand<pubL_3_40_Request, ObservableCollection<pubL_3_40_Info>> pubL_3_40_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_40_Request, ObservableCollection<pubL_3_40_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_40_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询港股通汇率信息
        /// </summary>
        public IWorkCommand<pubL_3_41_Request, ObservableCollection<pubL_3_41_Info>> pubL_3_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_41_Request, ObservableCollection<pubL_3_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_新增港股通汇率信息
        /// </summary>
        public IWorkCommand<pubL_3_42_Request, ObservableCollection<pubL_3_42_Info>> pubL_3_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_42_Request, ObservableCollection<pubL_3_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_删除港股通汇率信息
        /// </summary>
        public IWorkCommand<pubL_3_43_Request, ObservableCollection<pubL_3_43_Info>> pubL_3_43_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_43_Request, ObservableCollection<pubL_3_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_43_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_更新港股通结算汇率
        /// </summary>
        public IWorkCommand<pubL_3_44_Request, ObservableCollection<pubL_3_44_Info>> pubL_3_44_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_44_Request, ObservableCollection<pubL_3_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_44_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询市场信息
        /// </summary>
        public IWorkCommand<pubL_3_104_Request, ObservableCollection<pubL_3_104_Info>> pubL_3_104_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_104_Request, ObservableCollection<pubL_3_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_104_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询市场信息流水
        /// </summary>
        public IWorkCommand<pubL_3_105_Request, ObservableCollection<pubL_3_105_Info>> pubL_3_105_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_105_Request, ObservableCollection<pubL_3_105_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_105_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询历史市场信息流水
        /// </summary>
        public IWorkCommand<pubL_3_106_Request, ObservableCollection<pubL_3_106_Info>> pubL_3_106_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_106_Request, ObservableCollection<pubL_3_106_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_106_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_设置市场非交易日期
        /// </summary>
        public IWorkCommand<pubL_3_107_Request, ObservableCollection<pubL_3_107_Info>> pubL_3_107_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_107_Request, ObservableCollection<pubL_3_107_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_107_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_设置港股通非交收日期
        /// </summary>
        public IWorkCommand<pubL_3_108_Request, ObservableCollection<pubL_3_108_Info>> pubL_3_108_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_108_Request, ObservableCollection<pubL_3_108_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_108_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_新增交易时间
        /// </summary>
        public IWorkCommand<pubL_3_111_Request, ObservableCollection<pubL_3_111_Info>> pubL_3_111_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_111_Request, ObservableCollection<pubL_3_111_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_111_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_删除交易时间
        /// </summary>
        public IWorkCommand<pubL_3_113_Request, ObservableCollection<pubL_3_113_Info>> pubL_3_113_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_113_Request, ObservableCollection<pubL_3_113_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_113_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询交易时间
        /// </summary>
        public IWorkCommand<pubL_3_114_Request, ObservableCollection<pubL_3_114_Info>> pubL_3_114_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_114_Request, ObservableCollection<pubL_3_114_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_114_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询交易时间流水
        /// </summary>
        public IWorkCommand<pubL_3_115_Request, ObservableCollection<pubL_3_115_Info>> pubL_3_115_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_115_Request, ObservableCollection<pubL_3_115_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_115_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询历史交易时间流水
        /// </summary>
        public IWorkCommand<pubL_3_116_Request, ObservableCollection<pubL_3_116_Info>> pubL_3_116_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_116_Request, ObservableCollection<pubL_3_116_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_116_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_获取港股通汇率信息
        /// </summary>
        public IWorkCommand<pubL_3_117_Request, ObservableCollection<pubL_3_117_Info>> pubL_3_117_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_117_Request, ObservableCollection<pubL_3_117_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_117_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_获取所需港股通汇率信息
        /// </summary>
        public IWorkCommand<pubL_3_118_Request, ObservableCollection<pubL_3_118_Info>> pubL_3_118_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_118_Request, ObservableCollection<pubL_3_118_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_118_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_新增通道信息
        /// </summary>
        public IWorkCommand<pubL_3_150_Request, ObservableCollection<pubL_3_150_Info>> pubL_3_150_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_150_Request, ObservableCollection<pubL_3_150_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_150_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_修改通道信息
        /// </summary>
        public IWorkCommand<pubL_3_151_Request, ObservableCollection<pubL_3_151_Info>> pubL_3_151_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_151_Request, ObservableCollection<pubL_3_151_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_151_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_删除通道信息
        /// </summary>
        public IWorkCommand<pubL_3_152_Request, ObservableCollection<pubL_3_152_Info>> pubL_3_152_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_152_Request, ObservableCollection<pubL_3_152_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_152_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询通道信息
        /// </summary>
        public IWorkCommand<pubL_3_153_Request, ObservableCollection<pubL_3_153_Info>> pubL_3_153_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_153_Request, ObservableCollection<pubL_3_153_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_153_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_上线通道
        /// </summary>
        public IWorkCommand<pubL_3_154_Request, ObservableCollection<pubL_3_154_Info>> pubL_3_154_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_154_Request, ObservableCollection<pubL_3_154_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_154_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_下线通道
        /// </summary>
        public IWorkCommand<pubL_3_155_Request, ObservableCollection<pubL_3_155_Info>> pubL_3_155_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_155_Request, ObservableCollection<pubL_3_155_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_155_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询数据字典
        /// </summary>
        public IWorkCommand<pubL_3_180_Request, ObservableCollection<pubL_3_180_Info>> pubL_3_180_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_180_Request, ObservableCollection<pubL_3_180_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_180_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询业务标志
        /// </summary>
        public IWorkCommand<pubL_3_181_Request, ObservableCollection<pubL_3_181_Info>> pubL_3_181_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_181_Request, ObservableCollection<pubL_3_181_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_181_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_公共数据归档
        /// </summary>
        public IWorkCommand<pubL_3_201_Request, ObservableCollection<pubL_3_201_Info>> pubL_3_201_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_201_Request, ObservableCollection<pubL_3_201_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_201_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_初始化系统
        /// </summary>
        public IWorkCommand<pubL_3_202_Request, ObservableCollection<pubL_3_202_Info>> pubL_3_202_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_202_Request, ObservableCollection<pubL_3_202_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_202_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_初始化市场信息
        /// </summary>
        public IWorkCommand<pubL_3_203_Request, ObservableCollection<pubL_3_203_Info>> pubL_3_203_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_203_Request, ObservableCollection<pubL_3_203_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_203_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_新增监控服务信息
        /// </summary>
        public IWorkCommand<pubL_3_210_Request, ObservableCollection<pubL_3_210_Info>> pubL_3_210_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_210_Request, ObservableCollection<pubL_3_210_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_210_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础_查询通道报盘信息
        /// </summary>
        public IWorkCommand<pubL_3_204_Request, ObservableCollection<pubL_3_204_Info>> pubL_3_204_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_3_204_Request, ObservableCollection<pubL_3_204_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_3_204_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
