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
    public partial class ProductAccoBackCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_产品_账户运维_查询全部产品
        /// </summary>
        public IWorkCommand<prodL_5_1_Request, ObservableCollection<prodL_5_1_Info>> prodL_5_1_Command
        {
            get
            {
                return new WorkCommand<prodL_5_1_Request, ObservableCollection<prodL_5_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_查询全部资产账户
        /// </summary>
        public IWorkCommand<prodL_5_2_Request, ObservableCollection<prodL_5_2_Info>> prodL_5_2_Command
        {
            get
            {
                return new WorkCommand<prodL_5_2_Request, ObservableCollection<prodL_5_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_查询产品信息
        /// </summary>
        public IWorkCommand<prodL_5_4_Request, ObservableCollection<prodL_5_4_Info>> prodL_5_4_Command
        {
            get
            {
                return new WorkCommand<prodL_5_4_Request, ObservableCollection<prodL_5_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_4_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_修改产品业务控制配置串
        /// </summary>
        public IWorkCommand<prodL_5_5_Request, ObservableCollection<prodL_5_5_Info>> prodL_5_5_Command
        {
            get
            {
                return new WorkCommand<prodL_5_5_Request, ObservableCollection<prodL_5_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_5_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_查询资产账户信息
        /// </summary>
        public IWorkCommand<prodL_5_6_Request, ObservableCollection<prodL_5_6_Info>> prodL_5_6_Command
        {
            get
            {
                return new WorkCommand<prodL_5_6_Request, ObservableCollection<prodL_5_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_6_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_修改资产账户业务控制配置串
        /// </summary>
        public IWorkCommand<prodL_5_7_Request, ObservableCollection<prodL_5_7_Info>> prodL_5_7_Command
        {
            get
            {
                return new WorkCommand<prodL_5_7_Request, ObservableCollection<prodL_5_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_7_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_查询证券同步所需资产账户信息
        /// </summary>
        public IWorkCommand<prodL_5_8_Request, ObservableCollection<prodL_5_8_Info>> prodL_5_8_Command
        {
            get
            {
                return new WorkCommand<prodL_5_8_Request, ObservableCollection<prodL_5_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_8_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_归档产品数据
        /// </summary>
        public IWorkCommand<prodL_5_11_Request, ObservableCollection<prodL_5_11_Info>> prodL_5_11_Command
        {
            get
            {
                return new WorkCommand<prodL_5_11_Request, ObservableCollection<prodL_5_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_11_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_更新产品估值资产
        /// </summary>
        public IWorkCommand<prodL_5_21_Request, ObservableCollection<prodL_5_21_Info>> prodL_5_21_Command
        {
            get
            {
                return new WorkCommand<prodL_5_21_Request, ObservableCollection<prodL_5_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_21_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_设置资产账户通道信息
        /// </summary>
        public IWorkCommand<prodL_5_71_Request, ObservableCollection<prodL_5_71_Info>> prodL_5_71_Command
        {
            get
            {
                return new WorkCommand<prodL_5_71_Request, ObservableCollection<prodL_5_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_71_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_查询全部资产账户通道信息
        /// </summary>
        public IWorkCommand<prodL_5_74_Request, ObservableCollection<prodL_5_74_Info>> prodL_5_74_Command
        {
            get
            {
                return new WorkCommand<prodL_5_74_Request, ObservableCollection<prodL_5_74_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_74_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_更新资产账户状态
        /// </summary>
        public IWorkCommand<prodL_5_75_Request, ObservableCollection<prodL_5_75_Info>> prodL_5_75_Command
        {
            get
            {
                return new WorkCommand<prodL_5_75_Request, ObservableCollection<prodL_5_75_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_75_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_查询符合资产帐户类型的产品
        /// </summary>
        public IWorkCommand<prodL_5_76_Request, ObservableCollection<prodL_5_76_Info>> prodL_5_76_Command
        {
            get
            {
                return new WorkCommand<prodL_5_76_Request, ObservableCollection<prodL_5_76_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_76_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_查询报盘回写通道信息
        /// </summary>
        public IWorkCommand<prodL_5_77_Request, ObservableCollection<prodL_5_77_Info>> prodL_5_77_Command
        {
            get
            {
                return new WorkCommand<prodL_5_77_Request, ObservableCollection<prodL_5_77_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_77_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_冻结产品
        /// </summary>
        public IWorkCommand<prodL_5_78_Request, ObservableCollection<prodL_5_78_Info>> prodL_5_78_Command
        {
            get
            {
                return new WorkCommand<prodL_5_78_Request, ObservableCollection<prodL_5_78_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_78_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_修改产品限制信息
        /// </summary>
        public IWorkCommand<prodL_5_79_Request, ObservableCollection<prodL_5_79_Info>> prodL_5_79_Command
        {
            get
            {
                return new WorkCommand<prodL_5_79_Request, ObservableCollection<prodL_5_79_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_79_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_恢复产品
        /// </summary>
        public IWorkCommand<prodL_5_80_Request, ObservableCollection<prodL_5_80_Info>> prodL_5_80_Command
        {
            get
            {
                return new WorkCommand<prodL_5_80_Request, ObservableCollection<prodL_5_80_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_80_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_修改产品禁止订单方向
        /// </summary>
        public IWorkCommand<prodL_5_81_Request, ObservableCollection<prodL_5_81_Info>> prodL_5_81_Command
        {
            get
            {
                return new WorkCommand<prodL_5_81_Request, ObservableCollection<prodL_5_81_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_81_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_查询产品限制信息
        /// </summary>
        public IWorkCommand<prodL_5_82_Request, ObservableCollection<prodL_5_82_Info>> prodL_5_82_Command
        {
            get
            {
                return new WorkCommand<prodL_5_82_Request, ObservableCollection<prodL_5_82_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_82_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_新增产品信息
        /// </summary>
        public IWorkCommand<prodL_5_83_Request, ObservableCollection<prodL_5_83_Info>> prodL_5_83_Command
        {
            get
            {
                return new WorkCommand<prodL_5_83_Request, ObservableCollection<prodL_5_83_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_83_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_导入产品信息
        /// </summary>
        public IWorkCommand<prodL_5_84_Request, ObservableCollection<prodL_5_84_Info>> prodL_5_84_Command
        {
            get
            {
                return new WorkCommand<prodL_5_84_Request, ObservableCollection<prodL_5_84_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_84_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_修改机构产品业务控制配置串
        /// </summary>
        public IWorkCommand<prodL_5_85_Request, ObservableCollection<prodL_5_85_Info>> prodL_5_85_Command
        {
            get
            {
                return new WorkCommand<prodL_5_85_Request, ObservableCollection<prodL_5_85_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_85_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_新增资产账户信息
        /// </summary>
        public IWorkCommand<prodL_5_86_Request, ObservableCollection<prodL_5_86_Info>> prodL_5_86_Command
        {
            get
            {
                return new WorkCommand<prodL_5_86_Request, ObservableCollection<prodL_5_86_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_86_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_设置资产账户通道表已读标记
        /// </summary>
        public IWorkCommand<prodL_5_87_Request, ObservableCollection<prodL_5_87_Info>> prodL_5_87_Command
        {
            get
            {
                return new WorkCommand<prodL_5_87_Request, ObservableCollection<prodL_5_87_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_87_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_修改产品信息
        /// </summary>
        public IWorkCommand<prodL_5_88_Request, ObservableCollection<prodL_5_88_Info>> prodL_5_88_Command
        {
            get
            {
                return new WorkCommand<prodL_5_88_Request, ObservableCollection<prodL_5_88_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_88_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_修改产品索引值
        /// </summary>
        public IWorkCommand<prodL_5_89_Request, ObservableCollection<prodL_5_89_Info>> prodL_5_89_Command
        {
            get
            {
                return new WorkCommand<prodL_5_89_Request, ObservableCollection<prodL_5_89_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_89_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_冻结资产账户
        /// </summary>
        public IWorkCommand<prodL_5_90_Request, ObservableCollection<prodL_5_90_Info>> prodL_5_90_Command
        {
            get
            {
                return new WorkCommand<prodL_5_90_Request, ObservableCollection<prodL_5_90_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_90_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_恢复资产账户
        /// </summary>
        public IWorkCommand<prodL_5_91_Request, ObservableCollection<prodL_5_91_Info>> prodL_5_91_Command
        {
            get
            {
                return new WorkCommand<prodL_5_91_Request, ObservableCollection<prodL_5_91_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_91_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_注销产品
        /// </summary>
        public IWorkCommand<prodL_5_92_Request, ObservableCollection<prodL_5_92_Info>> prodL_5_92_Command
        {
            get
            {
                return new WorkCommand<prodL_5_92_Request, ObservableCollection<prodL_5_92_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_92_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_查询所有产品信息
        /// </summary>
        public IWorkCommand<prodL_5_93_Request, ObservableCollection<prodL_5_93_Info>> prodL_5_93_Command
        {
            get
            {
                return new WorkCommand<prodL_5_93_Request, ObservableCollection<prodL_5_93_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_93_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品_账户运维_修改资产账户信息
        /// </summary>
        public IWorkCommand<prodL_5_94_Request, ObservableCollection<prodL_5_94_Info>> prodL_5_94_Command
        {
            get
            {
                return new WorkCommand<prodL_5_94_Request, ObservableCollection<prodL_5_94_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).prodL_5_94_InfoList;
                });
            }
        }

    }
}
