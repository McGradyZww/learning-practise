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
    public partial class RptDataCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_报表_报表数据_更新报表产品信息
        /// </summary>
        public IWorkCommand<rptL_2_1_Request, ObservableCollection<rptL_2_1_Info>> rptL_2_1_Command
        {
            get
            {
                return new WorkCommand<rptL_2_1_Request, ObservableCollection<rptL_2_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询报表产品信息
        /// </summary>
        public IWorkCommand<rptL_2_2_Request, ObservableCollection<rptL_2_2_Info>> rptL_2_2_Command
        {
            get
            {
                return new WorkCommand<rptL_2_2_Request, ObservableCollection<rptL_2_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_修改报表产品信息
        /// </summary>
        public IWorkCommand<rptL_2_3_Request, ObservableCollection<rptL_2_3_Info>> rptL_2_3_Command
        {
            get
            {
                return new WorkCommand<rptL_2_3_Request, ObservableCollection<rptL_2_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_3_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_更新报表产品资产
        /// </summary>
        public IWorkCommand<rptL_2_4_Request, ObservableCollection<rptL_2_4_Info>> rptL_2_4_Command
        {
            get
            {
                return new WorkCommand<rptL_2_4_Request, ObservableCollection<rptL_2_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_4_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_更新报表产品持仓
        /// </summary>
        public IWorkCommand<rptL_2_5_Request, ObservableCollection<rptL_2_5_Info>> rptL_2_5_Command
        {
            get
            {
                return new WorkCommand<rptL_2_5_Request, ObservableCollection<rptL_2_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_5_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_计算单产品收益率
        /// </summary>
        public IWorkCommand<rptL_2_6_Request, ObservableCollection<rptL_2_6_Info>> rptL_2_6_Command
        {
            get
            {
                return new WorkCommand<rptL_2_6_Request, ObservableCollection<rptL_2_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_6_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_计算产品收益率分析
        /// </summary>
        public IWorkCommand<rptL_2_7_Request, ObservableCollection<rptL_2_7_Info>> rptL_2_7_Command
        {
            get
            {
                return new WorkCommand<rptL_2_7_Request, ObservableCollection<rptL_2_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_7_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_增加交易周信息
        /// </summary>
        public IWorkCommand<rptL_2_8_Request, ObservableCollection<rptL_2_8_Info>> rptL_2_8_Command
        {
            get
            {
                return new WorkCommand<rptL_2_8_Request, ObservableCollection<rptL_2_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_8_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_同步资管产品账户表
        /// </summary>
        public IWorkCommand<rptL_2_9_Request, ObservableCollection<rptL_2_9_Info>> rptL_2_9_Command
        {
            get
            {
                return new WorkCommand<rptL_2_9_Request, ObservableCollection<rptL_2_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_9_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_同步资管历史产品账户表
        /// </summary>
        public IWorkCommand<rptL_2_10_Request, ObservableCollection<rptL_2_10_Info>> rptL_2_10_Command
        {
            get
            {
                return new WorkCommand<rptL_2_10_Request, ObservableCollection<rptL_2_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_10_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_同步资管产品持仓表
        /// </summary>
        public IWorkCommand<rptL_2_11_Request, ObservableCollection<rptL_2_11_Info>> rptL_2_11_Command
        {
            get
            {
                return new WorkCommand<rptL_2_11_Request, ObservableCollection<rptL_2_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_11_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_同步资管历史产品持仓表
        /// </summary>
        public IWorkCommand<rptL_2_12_Request, ObservableCollection<rptL_2_12_Info>> rptL_2_12_Command
        {
            get
            {
                return new WorkCommand<rptL_2_12_Request, ObservableCollection<rptL_2_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_12_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_同步资管产品单元资金表
        /// </summary>
        public IWorkCommand<rptL_2_13_Request, ObservableCollection<rptL_2_13_Info>> rptL_2_13_Command
        {
            get
            {
                return new WorkCommand<rptL_2_13_Request, ObservableCollection<rptL_2_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_13_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_同步资管历史产品单元资金表
        /// </summary>
        public IWorkCommand<rptL_2_14_Request, ObservableCollection<rptL_2_14_Info>> rptL_2_14_Command
        {
            get
            {
                return new WorkCommand<rptL_2_14_Request, ObservableCollection<rptL_2_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_14_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_同步资管证券行情表
        /// </summary>
        public IWorkCommand<rptL_2_15_Request, ObservableCollection<rptL_2_15_Info>> rptL_2_15_Command
        {
            get
            {
                return new WorkCommand<rptL_2_15_Request, ObservableCollection<rptL_2_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_15_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_同步资管历史证券行情表
        /// </summary>
        public IWorkCommand<rptL_2_16_Request, ObservableCollection<rptL_2_16_Info>> rptL_2_16_Command
        {
            get
            {
                return new WorkCommand<rptL_2_16_Request, ObservableCollection<rptL_2_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_16_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_同步资管证券订单表
        /// </summary>
        public IWorkCommand<rptL_2_17_Request, ObservableCollection<rptL_2_17_Info>> rptL_2_17_Command
        {
            get
            {
                return new WorkCommand<rptL_2_17_Request, ObservableCollection<rptL_2_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_17_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_同步资管证券成交表
        /// </summary>
        public IWorkCommand<rptL_2_18_Request, ObservableCollection<rptL_2_18_Info>> rptL_2_18_Command
        {
            get
            {
                return new WorkCommand<rptL_2_18_Request, ObservableCollection<rptL_2_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_18_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_新增报表产品信息
        /// </summary>
        public IWorkCommand<rptL_2_19_Request, ObservableCollection<rptL_2_19_Info>> rptL_2_19_Command
        {
            get
            {
                return new WorkCommand<rptL_2_19_Request, ObservableCollection<rptL_2_19_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_19_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询行业类别表
        /// </summary>
        public IWorkCommand<rptL_2_21_Request, ObservableCollection<rptL_2_21_Info>> rptL_2_21_Command
        {
            get
            {
                return new WorkCommand<rptL_2_21_Request, ObservableCollection<rptL_2_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_21_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询行业证券表
        /// </summary>
        public IWorkCommand<rptL_2_22_Request, ObservableCollection<rptL_2_22_Info>> rptL_2_22_Command
        {
            get
            {
                return new WorkCommand<rptL_2_22_Request, ObservableCollection<rptL_2_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_22_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_初始化产品初始化定时任务
        /// </summary>
        public IWorkCommand<rptL_2_50_Request, ObservableCollection<rptL_2_50_Info>> rptL_2_50_Command
        {
            get
            {
                return new WorkCommand<rptL_2_50_Request, ObservableCollection<rptL_2_50_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_50_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_备份数据产品资产表
        /// </summary>
        public IWorkCommand<rptL_2_51_Request, ObservableCollection<rptL_2_51_Info>> rptL_2_51_Command
        {
            get
            {
                return new WorkCommand<rptL_2_51_Request, ObservableCollection<rptL_2_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_51_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_备份数据产品持仓表
        /// </summary>
        public IWorkCommand<rptL_2_52_Request, ObservableCollection<rptL_2_52_Info>> rptL_2_52_Command
        {
            get
            {
                return new WorkCommand<rptL_2_52_Request, ObservableCollection<rptL_2_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_52_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_每日计算产品持仓市值
        /// </summary>
        public IWorkCommand<rptL_2_53_Request, ObservableCollection<rptL_2_53_Info>> rptL_2_53_Command
        {
            get
            {
                return new WorkCommand<rptL_2_53_Request, ObservableCollection<rptL_2_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_53_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_备份数据产品订单表
        /// </summary>
        public IWorkCommand<rptL_2_54_Request, ObservableCollection<rptL_2_54_Info>> rptL_2_54_Command
        {
            get
            {
                return new WorkCommand<rptL_2_54_Request, ObservableCollection<rptL_2_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_54_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_备份数据产品成交表
        /// </summary>
        public IWorkCommand<rptL_2_55_Request, ObservableCollection<rptL_2_55_Info>> rptL_2_55_Command
        {
            get
            {
                return new WorkCommand<rptL_2_55_Request, ObservableCollection<rptL_2_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_55_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_备份数据产品自定义资产
        /// </summary>
        public IWorkCommand<rptL_2_56_Request, ObservableCollection<rptL_2_56_Info>> rptL_2_56_Command
        {
            get
            {
                return new WorkCommand<rptL_2_56_Request, ObservableCollection<rptL_2_56_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_56_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询机构自定义资产类型
        /// </summary>
        public IWorkCommand<rptL_2_61_Request, ObservableCollection<rptL_2_61_Info>> rptL_2_61_Command
        {
            get
            {
                return new WorkCommand<rptL_2_61_Request, ObservableCollection<rptL_2_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_61_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_修改产品自定义资产
        /// </summary>
        public IWorkCommand<rptL_2_62_Request, ObservableCollection<rptL_2_62_Info>> rptL_2_62_Command
        {
            get
            {
                return new WorkCommand<rptL_2_62_Request, ObservableCollection<rptL_2_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_62_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品自定义资产
        /// </summary>
        public IWorkCommand<rptL_2_63_Request, ObservableCollection<rptL_2_63_Info>> rptL_2_63_Command
        {
            get
            {
                return new WorkCommand<rptL_2_63_Request, ObservableCollection<rptL_2_63_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_63_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_计算产品自定义资产
        /// </summary>
        public IWorkCommand<rptL_2_64_Request, ObservableCollection<rptL_2_64_Info>> rptL_2_64_Command
        {
            get
            {
                return new WorkCommand<rptL_2_64_Request, ObservableCollection<rptL_2_64_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_64_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_定时任务计算产品自定义资产
        /// </summary>
        public IWorkCommand<rptL_2_65_Request, ObservableCollection<rptL_2_65_Info>> rptL_2_65_Command
        {
            get
            {
                return new WorkCommand<rptL_2_65_Request, ObservableCollection<rptL_2_65_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_65_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询机构自定义资产字段列表
        /// </summary>
        public IWorkCommand<rptL_2_66_Request, ObservableCollection<rptL_2_66_Info>> rptL_2_66_Command
        {
            get
            {
                return new WorkCommand<rptL_2_66_Request, ObservableCollection<rptL_2_66_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_66_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_产品执行SQL
        /// </summary>
        public IWorkCommand<rptL_2_67_Request, ObservableCollection<rptL_2_67_Info>> rptL_2_67_Command
        {
            get
            {
                return new WorkCommand<rptL_2_67_Request, ObservableCollection<rptL_2_67_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_67_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询调用命令表
        /// </summary>
        public IWorkCommand<rptL_2_68_Request, ObservableCollection<rptL_2_68_Info>> rptL_2_68_Command
        {
            get
            {
                return new WorkCommand<rptL_2_68_Request, ObservableCollection<rptL_2_68_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_68_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询同步状态表
        /// </summary>
        public IWorkCommand<rptL_2_69_Request, ObservableCollection<rptL_2_69_Info>> rptL_2_69_Command
        {
            get
            {
                return new WorkCommand<rptL_2_69_Request, ObservableCollection<rptL_2_69_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_69_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_同步并计算产品所有信息
        /// </summary>
        public IWorkCommand<rptL_2_100_Request, ObservableCollection<rptL_2_100_Info>> rptL_2_100_Command
        {
            get
            {
                return new WorkCommand<rptL_2_100_Request, ObservableCollection<rptL_2_100_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_100_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_修改交易组附加属性
        /// </summary>
        public IWorkCommand<rptL_2_101_Request, ObservableCollection<rptL_2_101_Info>> rptL_2_101_Command
        {
            get
            {
                return new WorkCommand<rptL_2_101_Request, ObservableCollection<rptL_2_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_101_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品区间统计
        /// </summary>
        public IWorkCommand<rptL_2_151_Request, ObservableCollection<rptL_2_151_Info>> rptL_2_151_Command
        {
            get
            {
                return new WorkCommand<rptL_2_151_Request, ObservableCollection<rptL_2_151_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_151_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询指数区间统计
        /// </summary>
        public IWorkCommand<rptL_2_152_Request, ObservableCollection<rptL_2_152_Info>> rptL_2_152_Command
        {
            get
            {
                return new WorkCommand<rptL_2_152_Request, ObservableCollection<rptL_2_152_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_152_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品指数区间统计
        /// </summary>
        public IWorkCommand<rptL_2_153_Request, ObservableCollection<rptL_2_153_Info>> rptL_2_153_Command
        {
            get
            {
                return new WorkCommand<rptL_2_153_Request, ObservableCollection<rptL_2_153_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_153_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品区间指标
        /// </summary>
        public IWorkCommand<rptL_2_154_Request, ObservableCollection<rptL_2_154_Info>> rptL_2_154_Command
        {
            get
            {
                return new WorkCommand<rptL_2_154_Request, ObservableCollection<rptL_2_154_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_154_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询指数区间指标
        /// </summary>
        public IWorkCommand<rptL_2_155_Request, ObservableCollection<rptL_2_155_Info>> rptL_2_155_Command
        {
            get
            {
                return new WorkCommand<rptL_2_155_Request, ObservableCollection<rptL_2_155_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_155_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品业绩基准区间指标
        /// </summary>
        public IWorkCommand<rptL_2_156_Request, ObservableCollection<rptL_2_156_Info>> rptL_2_156_Command
        {
            get
            {
                return new WorkCommand<rptL_2_156_Request, ObservableCollection<rptL_2_156_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_156_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_新增产品日净值
        /// </summary>
        public IWorkCommand<rptL_2_157_Request, ObservableCollection<rptL_2_157_Info>> rptL_2_157_Command
        {
            get
            {
                return new WorkCommand<rptL_2_157_Request, ObservableCollection<rptL_2_157_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_157_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_删除产品日净值
        /// </summary>
        public IWorkCommand<rptL_2_158_Request, ObservableCollection<rptL_2_158_Info>> rptL_2_158_Command
        {
            get
            {
                return new WorkCommand<rptL_2_158_Request, ObservableCollection<rptL_2_158_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_158_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_修改产品日净值
        /// </summary>
        public IWorkCommand<rptL_2_159_Request, ObservableCollection<rptL_2_159_Info>> rptL_2_159_Command
        {
            get
            {
                return new WorkCommand<rptL_2_159_Request, ObservableCollection<rptL_2_159_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_159_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品日净值
        /// </summary>
        public IWorkCommand<rptL_2_160_Request, ObservableCollection<rptL_2_160_Info>> rptL_2_160_Command
        {
            get
            {
                return new WorkCommand<rptL_2_160_Request, ObservableCollection<rptL_2_160_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_160_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_初始化产品日收益率
        /// </summary>
        public IWorkCommand<rptL_2_161_Request, ObservableCollection<rptL_2_161_Info>> rptL_2_161_Command
        {
            get
            {
                return new WorkCommand<rptL_2_161_Request, ObservableCollection<rptL_2_161_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_161_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_初始化指数日收益率
        /// </summary>
        public IWorkCommand<rptL_2_162_Request, ObservableCollection<rptL_2_162_Info>> rptL_2_162_Command
        {
            get
            {
                return new WorkCommand<rptL_2_162_Request, ObservableCollection<rptL_2_162_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_162_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_初始化产品周收益率
        /// </summary>
        public IWorkCommand<rptL_2_163_Request, ObservableCollection<rptL_2_163_Info>> rptL_2_163_Command
        {
            get
            {
                return new WorkCommand<rptL_2_163_Request, ObservableCollection<rptL_2_163_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_163_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_初始化指数周收益率
        /// </summary>
        public IWorkCommand<rptL_2_164_Request, ObservableCollection<rptL_2_164_Info>> rptL_2_164_Command
        {
            get
            {
                return new WorkCommand<rptL_2_164_Request, ObservableCollection<rptL_2_164_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_164_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_初始化产品月收益率
        /// </summary>
        public IWorkCommand<rptL_2_165_Request, ObservableCollection<rptL_2_165_Info>> rptL_2_165_Command
        {
            get
            {
                return new WorkCommand<rptL_2_165_Request, ObservableCollection<rptL_2_165_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_165_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_初始化指数月收益率
        /// </summary>
        public IWorkCommand<rptL_2_166_Request, ObservableCollection<rptL_2_166_Info>> rptL_2_166_Command
        {
            get
            {
                return new WorkCommand<rptL_2_166_Request, ObservableCollection<rptL_2_166_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_166_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品日收益率
        /// </summary>
        public IWorkCommand<rptL_2_181_Request, ObservableCollection<rptL_2_181_Info>> rptL_2_181_Command
        {
            get
            {
                return new WorkCommand<rptL_2_181_Request, ObservableCollection<rptL_2_181_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_181_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询指数日收益率
        /// </summary>
        public IWorkCommand<rptL_2_182_Request, ObservableCollection<rptL_2_182_Info>> rptL_2_182_Command
        {
            get
            {
                return new WorkCommand<rptL_2_182_Request, ObservableCollection<rptL_2_182_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_182_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品周收益率
        /// </summary>
        public IWorkCommand<rptL_2_183_Request, ObservableCollection<rptL_2_183_Info>> rptL_2_183_Command
        {
            get
            {
                return new WorkCommand<rptL_2_183_Request, ObservableCollection<rptL_2_183_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_183_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询指数周收益率
        /// </summary>
        public IWorkCommand<rptL_2_184_Request, ObservableCollection<rptL_2_184_Info>> rptL_2_184_Command
        {
            get
            {
                return new WorkCommand<rptL_2_184_Request, ObservableCollection<rptL_2_184_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_184_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品月收益率
        /// </summary>
        public IWorkCommand<rptL_2_185_Request, ObservableCollection<rptL_2_185_Info>> rptL_2_185_Command
        {
            get
            {
                return new WorkCommand<rptL_2_185_Request, ObservableCollection<rptL_2_185_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_185_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询指数月收益率
        /// </summary>
        public IWorkCommand<rptL_2_186_Request, ObservableCollection<rptL_2_186_Info>> rptL_2_186_Command
        {
            get
            {
                return new WorkCommand<rptL_2_186_Request, ObservableCollection<rptL_2_186_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_186_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_月报处理产品收益率
        /// </summary>
        public IWorkCommand<rptL_2_201_Request, ObservableCollection<rptL_2_201_Info>> rptL_2_201_Command
        {
            get
            {
                return new WorkCommand<rptL_2_201_Request, ObservableCollection<rptL_2_201_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_201_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_月报处理指数收益率
        /// </summary>
        public IWorkCommand<rptL_2_202_Request, ObservableCollection<rptL_2_202_Info>> rptL_2_202_Command
        {
            get
            {
                return new WorkCommand<rptL_2_202_Request, ObservableCollection<rptL_2_202_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_202_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_月报处理产品最大回撤
        /// </summary>
        public IWorkCommand<rptL_2_203_Request, ObservableCollection<rptL_2_203_Info>> rptL_2_203_Command
        {
            get
            {
                return new WorkCommand<rptL_2_203_Request, ObservableCollection<rptL_2_203_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_203_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_月报处理指数最大回撤
        /// </summary>
        public IWorkCommand<rptL_2_204_Request, ObservableCollection<rptL_2_204_Info>> rptL_2_204_Command
        {
            get
            {
                return new WorkCommand<rptL_2_204_Request, ObservableCollection<rptL_2_204_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_204_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_月报处理产品夏普比率
        /// </summary>
        public IWorkCommand<rptL_2_205_Request, ObservableCollection<rptL_2_205_Info>> rptL_2_205_Command
        {
            get
            {
                return new WorkCommand<rptL_2_205_Request, ObservableCollection<rptL_2_205_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_205_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_月报处理指数夏普比率
        /// </summary>
        public IWorkCommand<rptL_2_206_Request, ObservableCollection<rptL_2_206_Info>> rptL_2_206_Command
        {
            get
            {
                return new WorkCommand<rptL_2_206_Request, ObservableCollection<rptL_2_206_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_206_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_月报处理产品日胜率
        /// </summary>
        public IWorkCommand<rptL_2_207_Request, ObservableCollection<rptL_2_207_Info>> rptL_2_207_Command
        {
            get
            {
                return new WorkCommand<rptL_2_207_Request, ObservableCollection<rptL_2_207_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_207_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_月报处理指数日胜率
        /// </summary>
        public IWorkCommand<rptL_2_208_Request, ObservableCollection<rptL_2_208_Info>> rptL_2_208_Command
        {
            get
            {
                return new WorkCommand<rptL_2_208_Request, ObservableCollection<rptL_2_208_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_208_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_月报处理产品周胜率
        /// </summary>
        public IWorkCommand<rptL_2_209_Request, ObservableCollection<rptL_2_209_Info>> rptL_2_209_Command
        {
            get
            {
                return new WorkCommand<rptL_2_209_Request, ObservableCollection<rptL_2_209_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_209_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_月报处理指数周胜率
        /// </summary>
        public IWorkCommand<rptL_2_210_Request, ObservableCollection<rptL_2_210_Info>> rptL_2_210_Command
        {
            get
            {
                return new WorkCommand<rptL_2_210_Request, ObservableCollection<rptL_2_210_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_210_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询基金经理与交易员关系
        /// </summary>
        public IWorkCommand<rptL_2_211_Request, ObservableCollection<rptL_2_211_Info>> rptL_2_211_Command
        {
            get
            {
                return new WorkCommand<rptL_2_211_Request, ObservableCollection<rptL_2_211_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_211_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品资产
        /// </summary>
        public IWorkCommand<rptL_2_301_Request, ObservableCollection<rptL_2_301_Info>> rptL_2_301_Command
        {
            get
            {
                return new WorkCommand<rptL_2_301_Request, ObservableCollection<rptL_2_301_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_301_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品持仓
        /// </summary>
        public IWorkCommand<rptL_2_302_Request, ObservableCollection<rptL_2_302_Info>> rptL_2_302_Command
        {
            get
            {
                return new WorkCommand<rptL_2_302_Request, ObservableCollection<rptL_2_302_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_302_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品行业
        /// </summary>
        public IWorkCommand<rptL_2_303_Request, ObservableCollection<rptL_2_303_Info>> rptL_2_303_Command
        {
            get
            {
                return new WorkCommand<rptL_2_303_Request, ObservableCollection<rptL_2_303_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_303_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品行业区间盈亏
        /// </summary>
        public IWorkCommand<rptL_2_304_Request, ObservableCollection<rptL_2_304_Info>> rptL_2_304_Command
        {
            get
            {
                return new WorkCommand<rptL_2_304_Request, ObservableCollection<rptL_2_304_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_304_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询汇总机构证券买卖成交
        /// </summary>
        public IWorkCommand<rptL_2_305_Request, ObservableCollection<rptL_2_305_Info>> rptL_2_305_Command
        {
            get
            {
                return new WorkCommand<rptL_2_305_Request, ObservableCollection<rptL_2_305_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_305_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询汇总产品证券买卖成交
        /// </summary>
        public IWorkCommand<rptL_2_306_Request, ObservableCollection<rptL_2_306_Info>> rptL_2_306_Command
        {
            get
            {
                return new WorkCommand<rptL_2_306_Request, ObservableCollection<rptL_2_306_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_306_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询汇总产品证券成交
        /// </summary>
        public IWorkCommand<rptL_2_307_Request, ObservableCollection<rptL_2_307_Info>> rptL_2_307_Command
        {
            get
            {
                return new WorkCommand<rptL_2_307_Request, ObservableCollection<rptL_2_307_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_307_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询区间汇总产品证券成交
        /// </summary>
        public IWorkCommand<rptL_2_308_Request, ObservableCollection<rptL_2_308_Info>> rptL_2_308_Command
        {
            get
            {
                return new WorkCommand<rptL_2_308_Request, ObservableCollection<rptL_2_308_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_308_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询汇总产品资金流水
        /// </summary>
        public IWorkCommand<rptL_2_309_Request, ObservableCollection<rptL_2_309_Info>> rptL_2_309_Command
        {
            get
            {
                return new WorkCommand<rptL_2_309_Request, ObservableCollection<rptL_2_309_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_309_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询区间汇总产品资金流水
        /// </summary>
        public IWorkCommand<rptL_2_310_Request, ObservableCollection<rptL_2_310_Info>> rptL_2_310_Command
        {
            get
            {
                return new WorkCommand<rptL_2_310_Request, ObservableCollection<rptL_2_310_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_310_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询月汇总产品持仓成交
        /// </summary>
        public IWorkCommand<rptL_2_311_Request, ObservableCollection<rptL_2_311_Info>> rptL_2_311_Command
        {
            get
            {
                return new WorkCommand<rptL_2_311_Request, ObservableCollection<rptL_2_311_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_311_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询结算提前待入账记录表
        /// </summary>
        public IWorkCommand<rptL_2_312_Request, ObservableCollection<rptL_2_312_Info>> rptL_2_312_Command
        {
            get
            {
                return new WorkCommand<rptL_2_312_Request, ObservableCollection<rptL_2_312_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_312_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_修改统计基金经理资产
        /// </summary>
        public IWorkCommand<rptL_2_313_Request, ObservableCollection<rptL_2_313_Info>> rptL_2_313_Command
        {
            get
            {
                return new WorkCommand<rptL_2_313_Request, ObservableCollection<rptL_2_313_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_313_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询统计基金经理资产
        /// </summary>
        public IWorkCommand<rptL_2_314_Request, ObservableCollection<rptL_2_314_Info>> rptL_2_314_Command
        {
            get
            {
                return new WorkCommand<rptL_2_314_Request, ObservableCollection<rptL_2_314_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_314_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_修改统计基金经理持仓
        /// </summary>
        public IWorkCommand<rptL_2_315_Request, ObservableCollection<rptL_2_315_Info>> rptL_2_315_Command
        {
            get
            {
                return new WorkCommand<rptL_2_315_Request, ObservableCollection<rptL_2_315_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_315_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询统计基金经理持仓
        /// </summary>
        public IWorkCommand<rptL_2_316_Request, ObservableCollection<rptL_2_316_Info>> rptL_2_316_Command
        {
            get
            {
                return new WorkCommand<rptL_2_316_Request, ObservableCollection<rptL_2_316_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_316_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_新增机构业绩报告配置
        /// </summary>
        public IWorkCommand<rptL_2_401_Request, ObservableCollection<rptL_2_401_Info>> rptL_2_401_Command
        {
            get
            {
                return new WorkCommand<rptL_2_401_Request, ObservableCollection<rptL_2_401_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_401_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_删除机构业绩报告配置
        /// </summary>
        public IWorkCommand<rptL_2_402_Request, ObservableCollection<rptL_2_402_Info>> rptL_2_402_Command
        {
            get
            {
                return new WorkCommand<rptL_2_402_Request, ObservableCollection<rptL_2_402_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_402_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_修改机构业绩报告配置
        /// </summary>
        public IWorkCommand<rptL_2_403_Request, ObservableCollection<rptL_2_403_Info>> rptL_2_403_Command
        {
            get
            {
                return new WorkCommand<rptL_2_403_Request, ObservableCollection<rptL_2_403_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_403_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询机构业绩报告配置
        /// </summary>
        public IWorkCommand<rptL_2_404_Request, ObservableCollection<rptL_2_404_Info>> rptL_2_404_Command
        {
            get
            {
                return new WorkCommand<rptL_2_404_Request, ObservableCollection<rptL_2_404_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_404_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_新增产品业绩报告附加信息
        /// </summary>
        public IWorkCommand<rptL_2_406_Request, ObservableCollection<rptL_2_406_Info>> rptL_2_406_Command
        {
            get
            {
                return new WorkCommand<rptL_2_406_Request, ObservableCollection<rptL_2_406_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_406_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_删除产品业绩报告附加信息
        /// </summary>
        public IWorkCommand<rptL_2_407_Request, ObservableCollection<rptL_2_407_Info>> rptL_2_407_Command
        {
            get
            {
                return new WorkCommand<rptL_2_407_Request, ObservableCollection<rptL_2_407_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_407_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_修改产品业绩报告附加信息
        /// </summary>
        public IWorkCommand<rptL_2_408_Request, ObservableCollection<rptL_2_408_Info>> rptL_2_408_Command
        {
            get
            {
                return new WorkCommand<rptL_2_408_Request, ObservableCollection<rptL_2_408_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_408_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品业绩报告附加信息
        /// </summary>
        public IWorkCommand<rptL_2_409_Request, ObservableCollection<rptL_2_409_Info>> rptL_2_409_Command
        {
            get
            {
                return new WorkCommand<rptL_2_409_Request, ObservableCollection<rptL_2_409_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_409_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_新增基金经理信息
        /// </summary>
        public IWorkCommand<rptL_2_411_Request, ObservableCollection<rptL_2_411_Info>> rptL_2_411_Command
        {
            get
            {
                return new WorkCommand<rptL_2_411_Request, ObservableCollection<rptL_2_411_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_411_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_删除基金经理信息
        /// </summary>
        public IWorkCommand<rptL_2_412_Request, ObservableCollection<rptL_2_412_Info>> rptL_2_412_Command
        {
            get
            {
                return new WorkCommand<rptL_2_412_Request, ObservableCollection<rptL_2_412_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_412_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_修改基金经理信息
        /// </summary>
        public IWorkCommand<rptL_2_413_Request, ObservableCollection<rptL_2_413_Info>> rptL_2_413_Command
        {
            get
            {
                return new WorkCommand<rptL_2_413_Request, ObservableCollection<rptL_2_413_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_413_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询基金经理信息
        /// </summary>
        public IWorkCommand<rptL_2_414_Request, ObservableCollection<rptL_2_414_Info>> rptL_2_414_Command
        {
            get
            {
                return new WorkCommand<rptL_2_414_Request, ObservableCollection<rptL_2_414_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_414_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_新增交易员信息
        /// </summary>
        public IWorkCommand<rptL_2_416_Request, ObservableCollection<rptL_2_416_Info>> rptL_2_416_Command
        {
            get
            {
                return new WorkCommand<rptL_2_416_Request, ObservableCollection<rptL_2_416_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_416_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_删除交易员信息
        /// </summary>
        public IWorkCommand<rptL_2_417_Request, ObservableCollection<rptL_2_417_Info>> rptL_2_417_Command
        {
            get
            {
                return new WorkCommand<rptL_2_417_Request, ObservableCollection<rptL_2_417_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_417_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_修改交易员信息
        /// </summary>
        public IWorkCommand<rptL_2_418_Request, ObservableCollection<rptL_2_418_Info>> rptL_2_418_Command
        {
            get
            {
                return new WorkCommand<rptL_2_418_Request, ObservableCollection<rptL_2_418_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_418_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询交易员信息
        /// </summary>
        public IWorkCommand<rptL_2_419_Request, ObservableCollection<rptL_2_419_Info>> rptL_2_419_Command
        {
            get
            {
                return new WorkCommand<rptL_2_419_Request, ObservableCollection<rptL_2_419_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_419_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_新增产品基金经理与交易员
        /// </summary>
        public IWorkCommand<rptL_2_421_Request, ObservableCollection<rptL_2_421_Info>> rptL_2_421_Command
        {
            get
            {
                return new WorkCommand<rptL_2_421_Request, ObservableCollection<rptL_2_421_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_421_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_删除产品基金经理与交易员
        /// </summary>
        public IWorkCommand<rptL_2_422_Request, ObservableCollection<rptL_2_422_Info>> rptL_2_422_Command
        {
            get
            {
                return new WorkCommand<rptL_2_422_Request, ObservableCollection<rptL_2_422_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_422_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_修改产品基金经理与交易员
        /// </summary>
        public IWorkCommand<rptL_2_423_Request, ObservableCollection<rptL_2_423_Info>> rptL_2_423_Command
        {
            get
            {
                return new WorkCommand<rptL_2_423_Request, ObservableCollection<rptL_2_423_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_423_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品基金经理与交易员
        /// </summary>
        public IWorkCommand<rptL_2_424_Request, ObservableCollection<rptL_2_424_Info>> rptL_2_424_Command
        {
            get
            {
                return new WorkCommand<rptL_2_424_Request, ObservableCollection<rptL_2_424_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_424_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_新增产品持仓导入外部交割流水
        /// </summary>
        public IWorkCommand<rptL_2_425_Request, ObservableCollection<rptL_2_425_Info>> rptL_2_425_Command
        {
            get
            {
                return new WorkCommand<rptL_2_425_Request, ObservableCollection<rptL_2_425_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_425_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_删除产品持仓导入外部交割流水
        /// </summary>
        public IWorkCommand<rptL_2_426_Request, ObservableCollection<rptL_2_426_Info>> rptL_2_426_Command
        {
            get
            {
                return new WorkCommand<rptL_2_426_Request, ObservableCollection<rptL_2_426_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_426_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_查询产品持仓导入外部交割流水
        /// </summary>
        public IWorkCommand<rptL_2_428_Request, ObservableCollection<rptL_2_428_Info>> rptL_2_428_Command
        {
            get
            {
                return new WorkCommand<rptL_2_428_Request, ObservableCollection<rptL_2_428_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_428_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_处理产品持仓导入外部交割流水
        /// </summary>
        public IWorkCommand<rptL_2_429_Request, ObservableCollection<rptL_2_429_Info>> rptL_2_429_Command
        {
            get
            {
                return new WorkCommand<rptL_2_429_Request, ObservableCollection<rptL_2_429_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_429_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_修改月汇总产品持仓成交
        /// </summary>
        public IWorkCommand<rptL_2_431_Request, ObservableCollection<rptL_2_431_Info>> rptL_2_431_Command
        {
            get
            {
                return new WorkCommand<rptL_2_431_Request, ObservableCollection<rptL_2_431_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_431_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_新增汇总产品证券成交
        /// </summary>
        public IWorkCommand<rptL_2_436_Request, ObservableCollection<rptL_2_436_Info>> rptL_2_436_Command
        {
            get
            {
                return new WorkCommand<rptL_2_436_Request, ObservableCollection<rptL_2_436_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_436_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_删除汇总产品证券成交
        /// </summary>
        public IWorkCommand<rptL_2_437_Request, ObservableCollection<rptL_2_437_Info>> rptL_2_437_Command
        {
            get
            {
                return new WorkCommand<rptL_2_437_Request, ObservableCollection<rptL_2_437_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_437_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_修改汇总产品证券成交
        /// </summary>
        public IWorkCommand<rptL_2_438_Request, ObservableCollection<rptL_2_438_Info>> rptL_2_438_Command
        {
            get
            {
                return new WorkCommand<rptL_2_438_Request, ObservableCollection<rptL_2_438_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_438_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_新增结算提前待入账记录表
        /// </summary>
        public IWorkCommand<rptL_2_441_Request, ObservableCollection<rptL_2_441_Info>> rptL_2_441_Command
        {
            get
            {
                return new WorkCommand<rptL_2_441_Request, ObservableCollection<rptL_2_441_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_441_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_删除结算提前待入账记录表
        /// </summary>
        public IWorkCommand<rptL_2_442_Request, ObservableCollection<rptL_2_442_Info>> rptL_2_442_Command
        {
            get
            {
                return new WorkCommand<rptL_2_442_Request, ObservableCollection<rptL_2_442_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_442_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_报表_报表数据_修改结算提前待入账记录表
        /// </summary>
        public IWorkCommand<rptL_2_443_Request, ObservableCollection<rptL_2_443_Info>> rptL_2_443_Command
        {
            get
            {
                return new WorkCommand<rptL_2_443_Request, ObservableCollection<rptL_2_443_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).rptL_2_443_InfoList;
                });
            }
        }

    }
}
