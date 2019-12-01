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
    public partial class TrdSecuBackCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_交易证券_交易运维_查询指令
        /// </summary>
        public IWorkCommand<tdsecuL_10_31_Request, ObservableCollection<tdsecuL_10_31_Info>> tdsecuL_10_31_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_31_Request, ObservableCollection<tdsecuL_10_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_31_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询指令历史
        /// </summary>
        public IWorkCommand<tdsecuL_10_32_Request, ObservableCollection<tdsecuL_10_32_Info>> tdsecuL_10_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_32_Request, ObservableCollection<tdsecuL_10_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询订单
        /// </summary>
        public IWorkCommand<tdsecuL_10_41_Request, ObservableCollection<tdsecuL_10_41_Info>> tdsecuL_10_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_41_Request, ObservableCollection<tdsecuL_10_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询订单历史
        /// </summary>
        public IWorkCommand<tdsecuL_10_42_Request, ObservableCollection<tdsecuL_10_42_Info>> tdsecuL_10_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_42_Request, ObservableCollection<tdsecuL_10_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询订单回报
        /// </summary>
        public IWorkCommand<tdsecuL_10_51_Request, ObservableCollection<tdsecuL_10_51_Info>> tdsecuL_10_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_51_Request, ObservableCollection<tdsecuL_10_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询成交回报
        /// </summary>
        public IWorkCommand<tdsecuL_10_52_Request, ObservableCollection<tdsecuL_10_52_Info>> tdsecuL_10_52_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_52_Request, ObservableCollection<tdsecuL_10_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_52_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询成交明细
        /// </summary>
        public IWorkCommand<tdsecuL_10_53_Request, ObservableCollection<tdsecuL_10_53_Info>> tdsecuL_10_53_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_53_Request, ObservableCollection<tdsecuL_10_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_53_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询成交明细历史
        /// </summary>
        public IWorkCommand<tdsecuL_10_54_Request, ObservableCollection<tdsecuL_10_54_Info>> tdsecuL_10_54_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_54_Request, ObservableCollection<tdsecuL_10_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_54_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询机构统计订单
        /// </summary>
        public IWorkCommand<tdsecuL_10_55_Request, ObservableCollection<tdsecuL_10_55_Info>> tdsecuL_10_55_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_55_Request, ObservableCollection<tdsecuL_10_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_55_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_计算资产账户持仓数量同步产品库
        /// </summary>
        public IWorkCommand<tdsecuL_10_56_Request, ObservableCollection<tdsecuL_10_56_Info>> tdsecuL_10_56_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_56_Request, ObservableCollection<tdsecuL_10_56_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_56_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_计算资产账户资金可用同步产品库
        /// </summary>
        public IWorkCommand<tdsecuL_10_57_Request, ObservableCollection<tdsecuL_10_57_Info>> tdsecuL_10_57_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_57_Request, ObservableCollection<tdsecuL_10_57_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_57_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_计算债券质押同步产品库
        /// </summary>
        public IWorkCommand<tdsecuL_10_58_Request, ObservableCollection<tdsecuL_10_58_Info>> tdsecuL_10_58_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_58_Request, ObservableCollection<tdsecuL_10_58_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_58_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_补单关联订单
        /// </summary>
        public IWorkCommand<tdsecuL_10_59_Request, ObservableCollection<tdsecuL_10_59_Info>> tdsecuL_10_59_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_59_Request, ObservableCollection<tdsecuL_10_59_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_59_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询机构统计异常订单
        /// </summary>
        public IWorkCommand<tdsecuL_10_60_Request, ObservableCollection<tdsecuL_10_60_Info>> tdsecuL_10_60_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_60_Request, ObservableCollection<tdsecuL_10_60_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_60_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询指令汇总考核
        /// </summary>
        public IWorkCommand<tdsecuL_10_61_Request, ObservableCollection<tdsecuL_10_61_Info>> tdsecuL_10_61_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_61_Request, ObservableCollection<tdsecuL_10_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_61_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询指令汇总考核历史
        /// </summary>
        public IWorkCommand<tdsecuL_10_62_Request, ObservableCollection<tdsecuL_10_62_Info>> tdsecuL_10_62_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_62_Request, ObservableCollection<tdsecuL_10_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_62_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_更新查询指令汇总考核
        /// </summary>
        public IWorkCommand<tdsecuL_10_63_Request, ObservableCollection<tdsecuL_10_63_Info>> tdsecuL_10_63_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_63_Request, ObservableCollection<tdsecuL_10_63_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_63_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询所有指令汇总
        /// </summary>
        public IWorkCommand<tdsecuL_10_64_Request, ObservableCollection<tdsecuL_10_64_Info>> tdsecuL_10_64_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_64_Request, ObservableCollection<tdsecuL_10_64_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_64_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询运维订单回报
        /// </summary>
        public IWorkCommand<tdsecuL_10_65_Request, ObservableCollection<tdsecuL_10_65_Info>> tdsecuL_10_65_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_65_Request, ObservableCollection<tdsecuL_10_65_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_65_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询运维成交回报
        /// </summary>
        public IWorkCommand<tdsecuL_10_66_Request, ObservableCollection<tdsecuL_10_66_Info>> tdsecuL_10_66_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_66_Request, ObservableCollection<tdsecuL_10_66_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_66_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询运维成交明细
        /// </summary>
        public IWorkCommand<tdsecuL_10_67_Request, ObservableCollection<tdsecuL_10_67_Info>> tdsecuL_10_67_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_67_Request, ObservableCollection<tdsecuL_10_67_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_67_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询报盘信息
        /// </summary>
        public IWorkCommand<tdsecuL_10_68_Request, ObservableCollection<tdsecuL_10_68_Info>> tdsecuL_10_68_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_68_Request, ObservableCollection<tdsecuL_10_68_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_68_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询运维撤单流水
        /// </summary>
        public IWorkCommand<tdsecuL_10_69_Request, ObservableCollection<tdsecuL_10_69_Info>> tdsecuL_10_69_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_69_Request, ObservableCollection<tdsecuL_10_69_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_69_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_同步场外基金成交回报表
        /// </summary>
        public IWorkCommand<tdsecuL_10_70_Request, ObservableCollection<tdsecuL_10_70_Info>> tdsecuL_10_70_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_70_Request, ObservableCollection<tdsecuL_10_70_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_70_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询场外基金成交回报表
        /// </summary>
        public IWorkCommand<tdsecuL_10_71_Request, ObservableCollection<tdsecuL_10_71_Info>> tdsecuL_10_71_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_71_Request, ObservableCollection<tdsecuL_10_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_71_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_错单修改成交回溯
        /// </summary>
        public IWorkCommand<tdsecuL_10_72_Request, ObservableCollection<tdsecuL_10_72_Info>> tdsecuL_10_72_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_72_Request, ObservableCollection<tdsecuL_10_72_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_72_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_查询所有交易组持仓
        /// </summary>
        public IWorkCommand<tdsecuL_10_73_Request, ObservableCollection<tdsecuL_10_73_Info>> tdsecuL_10_73_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<tdsecuL_10_73_Request, ObservableCollection<tdsecuL_10_73_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).tdsecuL_10_73_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_错单修改撤单回退
        /// </summary>
        public IWorkCommand<tdsecuL_10_74_Request, ObservableCollection<tdsecuL_10_74_Info>> tdsecuL_10_74_Command
        {
            get
            {
                return new WorkCommand<tdsecuL_10_74_Request, ObservableCollection<tdsecuL_10_74_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdsecuL_10_74_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_交易证券_交易运维_错单修改废单回退
        /// </summary>
        public IWorkCommand<tdsecuL_10_75_Request, ObservableCollection<tdsecuL_10_75_Info>> tdsecuL_10_75_Command
        {
            get
            {
                return new WorkCommand<tdsecuL_10_75_Request, ObservableCollection<tdsecuL_10_75_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).tdsecuL_10_75_InfoList;
                });
            }
        }

    }
}
