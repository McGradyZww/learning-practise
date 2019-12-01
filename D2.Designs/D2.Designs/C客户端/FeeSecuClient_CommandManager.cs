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
    public partial class FeeSecuClientCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_公共_证券费用客户端_新增证券费用模板
        /// </summary>
        public IWorkCommand<pubL_23_11_Request, ObservableCollection<pubL_23_11_Info>> pubL_23_11_Command
        {
            get
            {
                return new WorkCommand<pubL_23_11_Request, ObservableCollection<pubL_23_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_11_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_修改证券费用模板
        /// </summary>
        public IWorkCommand<pubL_23_12_Request, ObservableCollection<pubL_23_12_Info>> pubL_23_12_Command
        {
            get
            {
                return new WorkCommand<pubL_23_12_Request, ObservableCollection<pubL_23_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_12_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_删除证券费用模板
        /// </summary>
        public IWorkCommand<pubL_23_13_Request, ObservableCollection<pubL_23_13_Info>> pubL_23_13_Command
        {
            get
            {
                return new WorkCommand<pubL_23_13_Request, ObservableCollection<pubL_23_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_13_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询证券费用模板
        /// </summary>
        public IWorkCommand<pubL_23_14_Request, ObservableCollection<pubL_23_14_Info>> pubL_23_14_Command
        {
            get
            {
                return new WorkCommand<pubL_23_14_Request, ObservableCollection<pubL_23_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_14_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询证券费用模板流水
        /// </summary>
        public IWorkCommand<pubL_23_15_Request, ObservableCollection<pubL_23_15_Info>> pubL_23_15_Command
        {
            get
            {
                return new WorkCommand<pubL_23_15_Request, ObservableCollection<pubL_23_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_15_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询历史证券费用模板流水
        /// </summary>
        public IWorkCommand<pubL_23_16_Request, ObservableCollection<pubL_23_16_Info>> pubL_23_16_Command
        {
            get
            {
                return new WorkCommand<pubL_23_16_Request, ObservableCollection<pubL_23_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_16_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_复制证券费用模板
        /// </summary>
        public IWorkCommand<pubL_23_17_Request, ObservableCollection<pubL_23_17_Info>> pubL_23_17_Command
        {
            get
            {
                return new WorkCommand<pubL_23_17_Request, ObservableCollection<pubL_23_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_17_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_新增证券类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_23_21_Request, ObservableCollection<pubL_23_21_Info>> pubL_23_21_Command
        {
            get
            {
                return new WorkCommand<pubL_23_21_Request, ObservableCollection<pubL_23_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_21_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_修改证券类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_23_22_Request, ObservableCollection<pubL_23_22_Info>> pubL_23_22_Command
        {
            get
            {
                return new WorkCommand<pubL_23_22_Request, ObservableCollection<pubL_23_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_22_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_删除证券类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_23_23_Request, ObservableCollection<pubL_23_23_Info>> pubL_23_23_Command
        {
            get
            {
                return new WorkCommand<pubL_23_23_Request, ObservableCollection<pubL_23_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_23_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询证券类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_23_24_Request, ObservableCollection<pubL_23_24_Info>> pubL_23_24_Command
        {
            get
            {
                return new WorkCommand<pubL_23_24_Request, ObservableCollection<pubL_23_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_24_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询证券类型费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_23_25_Request, ObservableCollection<pubL_23_25_Info>> pubL_23_25_Command
        {
            get
            {
                return new WorkCommand<pubL_23_25_Request, ObservableCollection<pubL_23_25_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_25_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询历史证券类型费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_23_26_Request, ObservableCollection<pubL_23_26_Info>> pubL_23_26_Command
        {
            get
            {
                return new WorkCommand<pubL_23_26_Request, ObservableCollection<pubL_23_26_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_26_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_新增证券代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_23_31_Request, ObservableCollection<pubL_23_31_Info>> pubL_23_31_Command
        {
            get
            {
                return new WorkCommand<pubL_23_31_Request, ObservableCollection<pubL_23_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_31_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_修改证券代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_23_32_Request, ObservableCollection<pubL_23_32_Info>> pubL_23_32_Command
        {
            get
            {
                return new WorkCommand<pubL_23_32_Request, ObservableCollection<pubL_23_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_32_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_删除证券代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_23_33_Request, ObservableCollection<pubL_23_33_Info>> pubL_23_33_Command
        {
            get
            {
                return new WorkCommand<pubL_23_33_Request, ObservableCollection<pubL_23_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_33_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询证券代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_23_34_Request, ObservableCollection<pubL_23_34_Info>> pubL_23_34_Command
        {
            get
            {
                return new WorkCommand<pubL_23_34_Request, ObservableCollection<pubL_23_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_34_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询证券代码费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_23_35_Request, ObservableCollection<pubL_23_35_Info>> pubL_23_35_Command
        {
            get
            {
                return new WorkCommand<pubL_23_35_Request, ObservableCollection<pubL_23_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_35_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询历史证券代码费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_23_36_Request, ObservableCollection<pubL_23_36_Info>> pubL_23_36_Command
        {
            get
            {
                return new WorkCommand<pubL_23_36_Request, ObservableCollection<pubL_23_36_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_36_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_新增资产账户证券费用模板
        /// </summary>
        public IWorkCommand<pubL_23_71_Request, ObservableCollection<pubL_23_71_Info>> pubL_23_71_Command
        {
            get
            {
                return new WorkCommand<pubL_23_71_Request, ObservableCollection<pubL_23_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_71_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_修改资产账户证券费用模板
        /// </summary>
        public IWorkCommand<pubL_23_72_Request, ObservableCollection<pubL_23_72_Info>> pubL_23_72_Command
        {
            get
            {
                return new WorkCommand<pubL_23_72_Request, ObservableCollection<pubL_23_72_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_72_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_删除资产账户证券费用模板
        /// </summary>
        public IWorkCommand<pubL_23_73_Request, ObservableCollection<pubL_23_73_Info>> pubL_23_73_Command
        {
            get
            {
                return new WorkCommand<pubL_23_73_Request, ObservableCollection<pubL_23_73_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_73_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询资产账户证券费用模板
        /// </summary>
        public IWorkCommand<pubL_23_74_Request, ObservableCollection<pubL_23_74_Info>> pubL_23_74_Command
        {
            get
            {
                return new WorkCommand<pubL_23_74_Request, ObservableCollection<pubL_23_74_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_74_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询资产账户证券费用模板流水
        /// </summary>
        public IWorkCommand<pubL_23_75_Request, ObservableCollection<pubL_23_75_Info>> pubL_23_75_Command
        {
            get
            {
                return new WorkCommand<pubL_23_75_Request, ObservableCollection<pubL_23_75_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_75_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询历史资产账户证券费用模板流水
        /// </summary>
        public IWorkCommand<pubL_23_76_Request, ObservableCollection<pubL_23_76_Info>> pubL_23_76_Command
        {
            get
            {
                return new WorkCommand<pubL_23_76_Request, ObservableCollection<pubL_23_76_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_76_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询系统证券类型费用
        /// </summary>
        public IWorkCommand<pubL_23_104_Request, ObservableCollection<pubL_23_104_Info>> pubL_23_104_Command
        {
            get
            {
                return new WorkCommand<pubL_23_104_Request, ObservableCollection<pubL_23_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_104_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询系统证券代码费用
        /// </summary>
        public IWorkCommand<pubL_23_114_Request, ObservableCollection<pubL_23_114_Info>> pubL_23_114_Command
        {
            get
            {
                return new WorkCommand<pubL_23_114_Request, ObservableCollection<pubL_23_114_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_114_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_新增产品费用
        /// </summary>
        public IWorkCommand<pubL_23_161_Request, ObservableCollection<pubL_23_161_Info>> pubL_23_161_Command
        {
            get
            {
                return new WorkCommand<pubL_23_161_Request, ObservableCollection<pubL_23_161_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_161_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_修改产品费用
        /// </summary>
        public IWorkCommand<pubL_23_162_Request, ObservableCollection<pubL_23_162_Info>> pubL_23_162_Command
        {
            get
            {
                return new WorkCommand<pubL_23_162_Request, ObservableCollection<pubL_23_162_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_162_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_删除产品费用
        /// </summary>
        public IWorkCommand<pubL_23_163_Request, ObservableCollection<pubL_23_163_Info>> pubL_23_163_Command
        {
            get
            {
                return new WorkCommand<pubL_23_163_Request, ObservableCollection<pubL_23_163_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_163_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询产品费用
        /// </summary>
        public IWorkCommand<pubL_23_164_Request, ObservableCollection<pubL_23_164_Info>> pubL_23_164_Command
        {
            get
            {
                return new WorkCommand<pubL_23_164_Request, ObservableCollection<pubL_23_164_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_164_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询产品费用流水
        /// </summary>
        public IWorkCommand<pubL_23_165_Request, ObservableCollection<pubL_23_165_Info>> pubL_23_165_Command
        {
            get
            {
                return new WorkCommand<pubL_23_165_Request, ObservableCollection<pubL_23_165_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_165_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询历史产品费用流水
        /// </summary>
        public IWorkCommand<pubL_23_166_Request, ObservableCollection<pubL_23_166_Info>> pubL_23_166_Command
        {
            get
            {
                return new WorkCommand<pubL_23_166_Request, ObservableCollection<pubL_23_166_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_166_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_计算证券费用
        /// </summary>
        public IWorkCommand<pubL_23_201_Request, ObservableCollection<pubL_23_201_Info>> pubL_23_201_Command
        {
            get
            {
                return new WorkCommand<pubL_23_201_Request, ObservableCollection<pubL_23_201_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_201_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_查询费用编号
        /// </summary>
        public IWorkCommand<pubL_23_302_Request, ObservableCollection<pubL_23_302_Info>> pubL_23_302_Command
        {
            get
            {
                return new WorkCommand<pubL_23_302_Request, ObservableCollection<pubL_23_302_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_302_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用客户端_模板编号删除证券费用明细
        /// </summary>
        public IWorkCommand<pubL_23_167_Request, ObservableCollection<pubL_23_167_Info>> pubL_23_167_Command
        {
            get
            {
                return new WorkCommand<pubL_23_167_Request, ObservableCollection<pubL_23_167_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_23_167_InfoList;
                });
            }
        }

    }
}
