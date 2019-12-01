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
    public partial class ClearFutuClearCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_清算期货_清算_清算准备
        /// </summary>
        public IWorkCommand<clfutuL_2_1_Request, ObservableCollection<clfutuL_2_1_Info>> clfutuL_2_1_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_1_Request, ObservableCollection<clfutuL_2_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_转入持仓记录
        /// </summary>
        public IWorkCommand<clfutuL_2_2_Request, ObservableCollection<clfutuL_2_2_Info>> clfutuL_2_2_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_2_Request, ObservableCollection<clfutuL_2_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_转入订单记录
        /// </summary>
        public IWorkCommand<clfutuL_2_6_Request, ObservableCollection<clfutuL_2_6_Info>> clfutuL_2_6_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_6_Request, ObservableCollection<clfutuL_2_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_6_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_查询订单记录
        /// </summary>
        public IWorkCommand<clfutuL_2_9_Request, ObservableCollection<clfutuL_2_9_Info>> clfutuL_2_9_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_9_Request, ObservableCollection<clfutuL_2_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_9_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_转入成交记录
        /// </summary>
        public IWorkCommand<clfutuL_2_21_Request, ObservableCollection<clfutuL_2_21_Info>> clfutuL_2_21_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_21_Request, ObservableCollection<clfutuL_2_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_21_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_查询成交记录
        /// </summary>
        public IWorkCommand<clfutuL_2_24_Request, ObservableCollection<clfutuL_2_24_Info>> clfutuL_2_24_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_24_Request, ObservableCollection<clfutuL_2_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_24_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_清算处理
        /// </summary>
        public IWorkCommand<clfutuL_2_37_Request, ObservableCollection<clfutuL_2_37_Info>> clfutuL_2_37_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_37_Request, ObservableCollection<clfutuL_2_37_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_37_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_订单费用处理
        /// </summary>
        public IWorkCommand<clfutuL_2_38_Request, ObservableCollection<clfutuL_2_38_Info>> clfutuL_2_38_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_38_Request, ObservableCollection<clfutuL_2_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_38_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_查询待入账记录
        /// </summary>
        public IWorkCommand<clfutuL_2_58_Request, ObservableCollection<clfutuL_2_58_Info>> clfutuL_2_58_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_58_Request, ObservableCollection<clfutuL_2_58_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_58_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_入账处理
        /// </summary>
        public IWorkCommand<clfutuL_2_61_Request, ObservableCollection<clfutuL_2_61_Info>> clfutuL_2_61_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_61_Request, ObservableCollection<clfutuL_2_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_61_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_入账回滚处理
        /// </summary>
        public IWorkCommand<clfutuL_2_62_Request, ObservableCollection<clfutuL_2_62_Info>> clfutuL_2_62_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_62_Request, ObservableCollection<clfutuL_2_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_62_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_数据准备定时任务
        /// </summary>
        public IWorkCommand<clfutuL_2_101_Request, ObservableCollection<clfutuL_2_101_Info>> clfutuL_2_101_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_101_Request, ObservableCollection<clfutuL_2_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_101_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_清算处理定时任务
        /// </summary>
        public IWorkCommand<clfutuL_2_103_Request, ObservableCollection<clfutuL_2_103_Info>> clfutuL_2_103_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_103_Request, ObservableCollection<clfutuL_2_103_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_103_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_入账处理定时任务
        /// </summary>
        public IWorkCommand<clfutuL_2_104_Request, ObservableCollection<clfutuL_2_104_Info>> clfutuL_2_104_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_104_Request, ObservableCollection<clfutuL_2_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_104_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_获取汇总统计值
        /// </summary>
        public IWorkCommand<clfutuL_2_107_Request, ObservableCollection<clfutuL_2_107_Info>> clfutuL_2_107_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_107_Request, ObservableCollection<clfutuL_2_107_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_107_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_查询交易组持仓序号
        /// </summary>
        public IWorkCommand<clfutuL_2_108_Request, ObservableCollection<clfutuL_2_108_Info>> clfutuL_2_108_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_108_Request, ObservableCollection<clfutuL_2_108_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_108_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_查询成交回报序号
        /// </summary>
        public IWorkCommand<clfutuL_2_109_Request, ObservableCollection<clfutuL_2_109_Info>> clfutuL_2_109_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_109_Request, ObservableCollection<clfutuL_2_109_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_109_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_查询成交序号
        /// </summary>
        public IWorkCommand<clfutuL_2_110_Request, ObservableCollection<clfutuL_2_110_Info>> clfutuL_2_110_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_110_Request, ObservableCollection<clfutuL_2_110_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_110_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算期货_清算_查询待入账记录序号
        /// </summary>
        public IWorkCommand<clfutuL_2_111_Request, ObservableCollection<clfutuL_2_111_Info>> clfutuL_2_111_Command
        {
            get
            {
                return new WorkCommand<clfutuL_2_111_Request, ObservableCollection<clfutuL_2_111_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clfutuL_2_111_InfoList;
                });
            }
        }

    }
}
