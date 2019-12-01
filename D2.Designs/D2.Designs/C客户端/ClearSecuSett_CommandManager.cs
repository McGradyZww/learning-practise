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
    public partial class ClearSecuSettCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_清算证券_结算_增加公司行为记录
        /// </summary>
        public IWorkCommand<clsecuL_3_1_Request, ObservableCollection<clsecuL_3_1_Info>> clsecuL_3_1_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_1_Request, ObservableCollection<clsecuL_3_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_修改公司行为记录
        /// </summary>
        public IWorkCommand<clsecuL_3_2_Request, ObservableCollection<clsecuL_3_2_Info>> clsecuL_3_2_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_2_Request, ObservableCollection<clsecuL_3_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_删除公司行为记录
        /// </summary>
        public IWorkCommand<clsecuL_3_3_Request, ObservableCollection<clsecuL_3_3_Info>> clsecuL_3_3_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_3_Request, ObservableCollection<clsecuL_3_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_3_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_查询公司行为记录
        /// </summary>
        public IWorkCommand<clsecuL_3_4_Request, ObservableCollection<clsecuL_3_4_Info>> clsecuL_3_4_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_4_Request, ObservableCollection<clsecuL_3_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_4_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_增加机构税率记录
        /// </summary>
        public IWorkCommand<clsecuL_3_11_Request, ObservableCollection<clsecuL_3_11_Info>> clsecuL_3_11_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_11_Request, ObservableCollection<clsecuL_3_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_11_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_修改机构税率记录
        /// </summary>
        public IWorkCommand<clsecuL_3_12_Request, ObservableCollection<clsecuL_3_12_Info>> clsecuL_3_12_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_12_Request, ObservableCollection<clsecuL_3_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_12_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_删除机构税率记录
        /// </summary>
        public IWorkCommand<clsecuL_3_13_Request, ObservableCollection<clsecuL_3_13_Info>> clsecuL_3_13_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_13_Request, ObservableCollection<clsecuL_3_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_13_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_查询机构税率记录
        /// </summary>
        public IWorkCommand<clsecuL_3_14_Request, ObservableCollection<clsecuL_3_14_Info>> clsecuL_3_14_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_14_Request, ObservableCollection<clsecuL_3_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_14_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_增加机构产品税率记录
        /// </summary>
        public IWorkCommand<clsecuL_3_16_Request, ObservableCollection<clsecuL_3_16_Info>> clsecuL_3_16_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_16_Request, ObservableCollection<clsecuL_3_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_16_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_修改机构产品税率记录
        /// </summary>
        public IWorkCommand<clsecuL_3_17_Request, ObservableCollection<clsecuL_3_17_Info>> clsecuL_3_17_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_17_Request, ObservableCollection<clsecuL_3_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_17_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_删除机构产品税率记录
        /// </summary>
        public IWorkCommand<clsecuL_3_18_Request, ObservableCollection<clsecuL_3_18_Info>> clsecuL_3_18_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_18_Request, ObservableCollection<clsecuL_3_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_18_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_查询机构产品税率记录
        /// </summary>
        public IWorkCommand<clsecuL_3_19_Request, ObservableCollection<clsecuL_3_19_Info>> clsecuL_3_19_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_19_Request, ObservableCollection<clsecuL_3_19_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_19_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_转入新股中签记录
        /// </summary>
        public IWorkCommand<clsecuL_3_21_Request, ObservableCollection<clsecuL_3_21_Info>> clsecuL_3_21_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_21_Request, ObservableCollection<clsecuL_3_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_21_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_修改新股中签记录
        /// </summary>
        public IWorkCommand<clsecuL_3_22_Request, ObservableCollection<clsecuL_3_22_Info>> clsecuL_3_22_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_22_Request, ObservableCollection<clsecuL_3_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_22_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_删除新股中签记录
        /// </summary>
        public IWorkCommand<clsecuL_3_23_Request, ObservableCollection<clsecuL_3_23_Info>> clsecuL_3_23_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_23_Request, ObservableCollection<clsecuL_3_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_23_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_查询新股中签记录
        /// </summary>
        public IWorkCommand<clsecuL_3_24_Request, ObservableCollection<clsecuL_3_24_Info>> clsecuL_3_24_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_24_Request, ObservableCollection<clsecuL_3_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_24_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_查询历史新股中签记录
        /// </summary>
        public IWorkCommand<clsecuL_3_26_Request, ObservableCollection<clsecuL_3_26_Info>> clsecuL_3_26_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_26_Request, ObservableCollection<clsecuL_3_26_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_26_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_转入新股申购记录
        /// </summary>
        public IWorkCommand<clsecuL_3_31_Request, ObservableCollection<clsecuL_3_31_Info>> clsecuL_3_31_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_31_Request, ObservableCollection<clsecuL_3_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_31_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_查询新股申购记录
        /// </summary>
        public IWorkCommand<clsecuL_3_34_Request, ObservableCollection<clsecuL_3_34_Info>> clsecuL_3_34_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_34_Request, ObservableCollection<clsecuL_3_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_34_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_查询新股申购中签记录
        /// </summary>
        public IWorkCommand<clsecuL_3_36_Request, ObservableCollection<clsecuL_3_36_Info>> clsecuL_3_36_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_36_Request, ObservableCollection<clsecuL_3_36_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_36_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_转入可转债中签记录
        /// </summary>
        public IWorkCommand<clsecuL_3_37_Request, ObservableCollection<clsecuL_3_37_Info>> clsecuL_3_37_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_37_Request, ObservableCollection<clsecuL_3_37_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_37_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_修改可转债中签记录
        /// </summary>
        public IWorkCommand<clsecuL_3_38_Request, ObservableCollection<clsecuL_3_38_Info>> clsecuL_3_38_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_38_Request, ObservableCollection<clsecuL_3_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_38_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_删除可转债中签记录
        /// </summary>
        public IWorkCommand<clsecuL_3_39_Request, ObservableCollection<clsecuL_3_39_Info>> clsecuL_3_39_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_39_Request, ObservableCollection<clsecuL_3_39_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_39_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_查询可转债中签记录
        /// </summary>
        public IWorkCommand<clsecuL_3_40_Request, ObservableCollection<clsecuL_3_40_Info>> clsecuL_3_40_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_40_Request, ObservableCollection<clsecuL_3_40_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_40_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_查询历史可转债中签记录
        /// </summary>
        public IWorkCommand<clsecuL_3_41_Request, ObservableCollection<clsecuL_3_41_Info>> clsecuL_3_41_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_41_Request, ObservableCollection<clsecuL_3_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_41_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_查询回购记录
        /// </summary>
        public IWorkCommand<clsecuL_3_44_Request, ObservableCollection<clsecuL_3_44_Info>> clsecuL_3_44_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_44_Request, ObservableCollection<clsecuL_3_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_44_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_转入清算证券结算记录
        /// </summary>
        public IWorkCommand<clsecuL_3_50_Request, ObservableCollection<clsecuL_3_50_Info>> clsecuL_3_50_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_50_Request, ObservableCollection<clsecuL_3_50_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_50_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_查询提前待入账记录
        /// </summary>
        public IWorkCommand<clsecuL_3_86_Request, ObservableCollection<clsecuL_3_86_Info>> clsecuL_3_86_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_86_Request, ObservableCollection<clsecuL_3_86_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_86_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_查询待入账记录
        /// </summary>
        public IWorkCommand<clsecuL_3_87_Request, ObservableCollection<clsecuL_3_87_Info>> clsecuL_3_87_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_87_Request, ObservableCollection<clsecuL_3_87_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_87_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_入账处理
        /// </summary>
        public IWorkCommand<clsecuL_3_88_Request, ObservableCollection<clsecuL_3_88_Info>> clsecuL_3_88_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_88_Request, ObservableCollection<clsecuL_3_88_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_88_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_入账回滚处理
        /// </summary>
        public IWorkCommand<clsecuL_3_89_Request, ObservableCollection<clsecuL_3_89_Info>> clsecuL_3_89_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_89_Request, ObservableCollection<clsecuL_3_89_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_89_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_系统初始化
        /// </summary>
        public IWorkCommand<clsecuL_3_90_Request, ObservableCollection<clsecuL_3_90_Info>> clsecuL_3_90_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_90_Request, ObservableCollection<clsecuL_3_90_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_90_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_结算处理定时任务
        /// </summary>
        public IWorkCommand<clsecuL_3_152_Request, ObservableCollection<clsecuL_3_152_Info>> clsecuL_3_152_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_152_Request, ObservableCollection<clsecuL_3_152_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_152_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_入账定时任务
        /// </summary>
        public IWorkCommand<clsecuL_3_153_Request, ObservableCollection<clsecuL_3_153_Info>> clsecuL_3_153_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_153_Request, ObservableCollection<clsecuL_3_153_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_153_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_数据统计
        /// </summary>
        public IWorkCommand<clsecuL_3_201_Request, ObservableCollection<clsecuL_3_201_Info>> clsecuL_3_201_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_201_Request, ObservableCollection<clsecuL_3_201_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_201_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_查询统计数据
        /// </summary>
        public IWorkCommand<clsecuL_3_202_Request, ObservableCollection<clsecuL_3_202_Info>> clsecuL_3_202_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_202_Request, ObservableCollection<clsecuL_3_202_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_202_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_查询公司行为表
        /// </summary>
        public IWorkCommand<clsecuL_3_203_Request, ObservableCollection<clsecuL_3_203_Info>> clsecuL_3_203_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_203_Request, ObservableCollection<clsecuL_3_203_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_203_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_自动增加公司行为记录
        /// </summary>
        public IWorkCommand<clsecuL_3_101_Request, ObservableCollection<clsecuL_3_101_Info>> clsecuL_3_101_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_101_Request, ObservableCollection<clsecuL_3_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_101_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_新增新股中签记录
        /// </summary>
        public IWorkCommand<clsecuL_3_51_Request, ObservableCollection<clsecuL_3_51_Info>> clsecuL_3_51_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_51_Request, ObservableCollection<clsecuL_3_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_51_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_查询配股登记信息
        /// </summary>
        public IWorkCommand<clsecuL_3_204_Request, ObservableCollection<clsecuL_3_204_Info>> clsecuL_3_204_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_204_Request, ObservableCollection<clsecuL_3_204_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_204_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_确认配股登记信息
        /// </summary>
        public IWorkCommand<clsecuL_3_205_Request, ObservableCollection<clsecuL_3_205_Info>> clsecuL_3_205_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_205_Request, ObservableCollection<clsecuL_3_205_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_205_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_清算证券_结算_撤销配股登记
        /// </summary>
        public IWorkCommand<clsecuL_3_206_Request, ObservableCollection<clsecuL_3_206_Info>> clsecuL_3_206_Command
        {
            get
            {
                return new WorkCommand<clsecuL_3_206_Request, ObservableCollection<clsecuL_3_206_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).clsecuL_3_206_InfoList;
                });
            }
        }

    }
}
