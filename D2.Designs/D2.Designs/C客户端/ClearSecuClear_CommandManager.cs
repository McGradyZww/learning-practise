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
    public partial class ClearSecuClearCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_清算证券_清算_转入成交记录
        /// </summary>
        public IWorkCommand<clsecuL_2_1_Request, ObservableCollection<clsecuL_2_1_Info>> clsecuL_2_1_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_1_Request, ObservableCollection<clsecuL_2_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_转入基金交易记录
        /// </summary>
        public IWorkCommand<clsecuL_2_2_Request, ObservableCollection<clsecuL_2_2_Info>> clsecuL_2_2_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_2_Request, ObservableCollection<clsecuL_2_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_查询成交记录
        /// </summary>
        public IWorkCommand<clsecuL_2_3_Request, ObservableCollection<clsecuL_2_3_Info>> clsecuL_2_3_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_3_Request, ObservableCollection<clsecuL_2_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_3_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_查询转入成交记录
        /// </summary>
        public IWorkCommand<clsecuL_2_4_Request, ObservableCollection<clsecuL_2_4_Info>> clsecuL_2_4_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_4_Request, ObservableCollection<clsecuL_2_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_4_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_清算处理
        /// </summary>
        public IWorkCommand<clsecuL_2_11_Request, ObservableCollection<clsecuL_2_11_Info>> clsecuL_2_11_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_11_Request, ObservableCollection<clsecuL_2_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_11_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_查询合并清算记录
        /// </summary>
        public IWorkCommand<clsecuL_2_13_Request, ObservableCollection<clsecuL_2_13_Info>> clsecuL_2_13_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_13_Request, ObservableCollection<clsecuL_2_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_13_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_合并清算处理
        /// </summary>
        public IWorkCommand<clsecuL_2_15_Request, ObservableCollection<clsecuL_2_15_Info>> clsecuL_2_15_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_15_Request, ObservableCollection<clsecuL_2_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_15_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_查询待入账记录
        /// </summary>
        public IWorkCommand<clsecuL_2_23_Request, ObservableCollection<clsecuL_2_23_Info>> clsecuL_2_23_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_23_Request, ObservableCollection<clsecuL_2_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_23_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_入账处理
        /// </summary>
        public IWorkCommand<clsecuL_2_24_Request, ObservableCollection<clsecuL_2_24_Info>> clsecuL_2_24_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_24_Request, ObservableCollection<clsecuL_2_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_24_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_入账回滚处理
        /// </summary>
        public IWorkCommand<clsecuL_2_25_Request, ObservableCollection<clsecuL_2_25_Info>> clsecuL_2_25_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_25_Request, ObservableCollection<clsecuL_2_25_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_25_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_成交转入定时任务
        /// </summary>
        public IWorkCommand<clsecuL_2_151_Request, ObservableCollection<clsecuL_2_151_Info>> clsecuL_2_151_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_151_Request, ObservableCollection<clsecuL_2_151_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_151_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_清算处理定时任务
        /// </summary>
        public IWorkCommand<clsecuL_2_153_Request, ObservableCollection<clsecuL_2_153_Info>> clsecuL_2_153_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_153_Request, ObservableCollection<clsecuL_2_153_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_153_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_入账处理定时任务
        /// </summary>
        public IWorkCommand<clsecuL_2_154_Request, ObservableCollection<clsecuL_2_154_Info>> clsecuL_2_154_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_154_Request, ObservableCollection<clsecuL_2_154_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_154_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_数据统计
        /// </summary>
        public IWorkCommand<clsecuL_2_201_Request, ObservableCollection<clsecuL_2_201_Info>> clsecuL_2_201_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_201_Request, ObservableCollection<clsecuL_2_201_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_201_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_查询统计数据
        /// </summary>
        public IWorkCommand<clsecuL_2_202_Request, ObservableCollection<clsecuL_2_202_Info>> clsecuL_2_202_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_202_Request, ObservableCollection<clsecuL_2_202_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_202_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_获取汇总统计值
        /// </summary>
        public IWorkCommand<clsecuL_2_203_Request, ObservableCollection<clsecuL_2_203_Info>> clsecuL_2_203_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_203_Request, ObservableCollection<clsecuL_2_203_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_203_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_查询成交记录序号
        /// </summary>
        public IWorkCommand<clsecuL_2_204_Request, ObservableCollection<clsecuL_2_204_Info>> clsecuL_2_204_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_204_Request, ObservableCollection<clsecuL_2_204_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_204_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_查询清算成交记录序号
        /// </summary>
        public IWorkCommand<clsecuL_2_205_Request, ObservableCollection<clsecuL_2_205_Info>> clsecuL_2_205_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_205_Request, ObservableCollection<clsecuL_2_205_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_205_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_查询合并清算记录序号
        /// </summary>
        public IWorkCommand<clsecuL_2_206_Request, ObservableCollection<clsecuL_2_206_Info>> clsecuL_2_206_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_206_Request, ObservableCollection<clsecuL_2_206_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_206_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_查询待入账记录序号
        /// </summary>
        public IWorkCommand<clsecuL_2_207_Request, ObservableCollection<clsecuL_2_207_Info>> clsecuL_2_207_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_207_Request, ObservableCollection<clsecuL_2_207_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_207_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_A股入账前检查
        /// </summary>
        public IWorkCommand<clsecuL_2_208_Request, ObservableCollection<clsecuL_2_208_Info>> clsecuL_2_208_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_208_Request, ObservableCollection<clsecuL_2_208_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_208_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_清算_批量转入成交记录
        /// </summary>
        public IWorkCommand<clsecuL_2_209_Request, ObservableCollection<clsecuL_2_209_Info>> clsecuL_2_209_Command
        {
            get
            {
                return new WorkCommand<clsecuL_2_209_Request, ObservableCollection<clsecuL_2_209_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_2_209_InfoList;
                });
            }
        }

    }
}
