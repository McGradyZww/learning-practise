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
    public partial class ClearSecuCrdtClearCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_清算证券_融资融券清算_转入成交记录
        /// </summary>
        public IWorkCommand<clsecuL_21_1_Request, ObservableCollection<clsecuL_21_1_Info>> clsecuL_21_1_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_1_Request, ObservableCollection<clsecuL_21_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_查询成交记录
        /// </summary>
        public IWorkCommand<clsecuL_21_3_Request, ObservableCollection<clsecuL_21_3_Info>> clsecuL_21_3_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_3_Request, ObservableCollection<clsecuL_21_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_3_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_查询转入成交记录
        /// </summary>
        public IWorkCommand<clsecuL_21_4_Request, ObservableCollection<clsecuL_21_4_Info>> clsecuL_21_4_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_4_Request, ObservableCollection<clsecuL_21_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_4_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_清算处理
        /// </summary>
        public IWorkCommand<clsecuL_21_11_Request, ObservableCollection<clsecuL_21_11_Info>> clsecuL_21_11_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_11_Request, ObservableCollection<clsecuL_21_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_11_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_查询合并清算记录
        /// </summary>
        public IWorkCommand<clsecuL_21_13_Request, ObservableCollection<clsecuL_21_13_Info>> clsecuL_21_13_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_13_Request, ObservableCollection<clsecuL_21_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_13_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_合并清算处理
        /// </summary>
        public IWorkCommand<clsecuL_21_15_Request, ObservableCollection<clsecuL_21_15_Info>> clsecuL_21_15_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_15_Request, ObservableCollection<clsecuL_21_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_15_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_查询待入账记录
        /// </summary>
        public IWorkCommand<clsecuL_21_23_Request, ObservableCollection<clsecuL_21_23_Info>> clsecuL_21_23_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_23_Request, ObservableCollection<clsecuL_21_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_23_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_入账处理
        /// </summary>
        public IWorkCommand<clsecuL_21_24_Request, ObservableCollection<clsecuL_21_24_Info>> clsecuL_21_24_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_24_Request, ObservableCollection<clsecuL_21_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_24_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_入账回滚处理
        /// </summary>
        public IWorkCommand<clsecuL_21_25_Request, ObservableCollection<clsecuL_21_25_Info>> clsecuL_21_25_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_25_Request, ObservableCollection<clsecuL_21_25_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_25_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_入账后还券处理
        /// </summary>
        public IWorkCommand<clsecuL_21_26_Request, ObservableCollection<clsecuL_21_26_Info>> clsecuL_21_26_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_26_Request, ObservableCollection<clsecuL_21_26_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_26_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_入账后还款处理
        /// </summary>
        public IWorkCommand<clsecuL_21_27_Request, ObservableCollection<clsecuL_21_27_Info>> clsecuL_21_27_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_27_Request, ObservableCollection<clsecuL_21_27_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_27_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_入账后计算融券所得资金
        /// </summary>
        public IWorkCommand<clsecuL_21_28_Request, ObservableCollection<clsecuL_21_28_Info>> clsecuL_21_28_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_28_Request, ObservableCollection<clsecuL_21_28_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_28_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_入账后更新持仓负债数据
        /// </summary>
        public IWorkCommand<clsecuL_21_29_Request, ObservableCollection<clsecuL_21_29_Info>> clsecuL_21_29_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_29_Request, ObservableCollection<clsecuL_21_29_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_29_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_成交转入定时任务
        /// </summary>
        public IWorkCommand<clsecuL_21_151_Request, ObservableCollection<clsecuL_21_151_Info>> clsecuL_21_151_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_151_Request, ObservableCollection<clsecuL_21_151_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_151_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_清算处理定时任务
        /// </summary>
        public IWorkCommand<clsecuL_21_153_Request, ObservableCollection<clsecuL_21_153_Info>> clsecuL_21_153_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_153_Request, ObservableCollection<clsecuL_21_153_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_153_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_入账处理定时任务
        /// </summary>
        public IWorkCommand<clsecuL_21_154_Request, ObservableCollection<clsecuL_21_154_Info>> clsecuL_21_154_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_154_Request, ObservableCollection<clsecuL_21_154_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_154_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_数据统计
        /// </summary>
        public IWorkCommand<clsecuL_21_201_Request, ObservableCollection<clsecuL_21_201_Info>> clsecuL_21_201_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_201_Request, ObservableCollection<clsecuL_21_201_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_201_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_查询统计数据
        /// </summary>
        public IWorkCommand<clsecuL_21_202_Request, ObservableCollection<clsecuL_21_202_Info>> clsecuL_21_202_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_202_Request, ObservableCollection<clsecuL_21_202_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_202_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_获取汇总统计值
        /// </summary>
        public IWorkCommand<clsecuL_21_203_Request, ObservableCollection<clsecuL_21_203_Info>> clsecuL_21_203_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_203_Request, ObservableCollection<clsecuL_21_203_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_203_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_查询成交记录序号
        /// </summary>
        public IWorkCommand<clsecuL_21_204_Request, ObservableCollection<clsecuL_21_204_Info>> clsecuL_21_204_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_204_Request, ObservableCollection<clsecuL_21_204_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_204_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_查询清算成交记录序号
        /// </summary>
        public IWorkCommand<clsecuL_21_205_Request, ObservableCollection<clsecuL_21_205_Info>> clsecuL_21_205_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_205_Request, ObservableCollection<clsecuL_21_205_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_205_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_查询合并清算记录序号
        /// </summary>
        public IWorkCommand<clsecuL_21_206_Request, ObservableCollection<clsecuL_21_206_Info>> clsecuL_21_206_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_206_Request, ObservableCollection<clsecuL_21_206_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_206_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_查询待入账记录序号
        /// </summary>
        public IWorkCommand<clsecuL_21_207_Request, ObservableCollection<clsecuL_21_207_Info>> clsecuL_21_207_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_207_Request, ObservableCollection<clsecuL_21_207_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_207_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_融资融券清算_数据归历史
        /// </summary>
        public IWorkCommand<clsecuL_21_301_Request, ObservableCollection<clsecuL_21_301_Info>> clsecuL_21_301_Command
        {
            get
            {
                return new WorkCommand<clsecuL_21_301_Request, ObservableCollection<clsecuL_21_301_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_21_301_InfoList;
                });
            }
        }

    }
}
