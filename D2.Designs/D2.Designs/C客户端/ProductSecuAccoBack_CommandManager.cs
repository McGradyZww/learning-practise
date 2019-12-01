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
    public partial class ProductSecuAccoBackCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_产品证券_账户运维_查询全部证券账户
        /// </summary>
        public IWorkCommand<pdsecuL_7_1_Request, ObservableCollection<pdsecuL_7_1_Info>> pdsecuL_7_1_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_1_Request, ObservableCollection<pdsecuL_7_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_归档产品证券数据
        /// </summary>
        public IWorkCommand<pdsecuL_7_11_Request, ObservableCollection<pdsecuL_7_11_Info>> pdsecuL_7_11_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_11_Request, ObservableCollection<pdsecuL_7_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_11_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_初始化产品证券数据
        /// </summary>
        public IWorkCommand<pdsecuL_7_12_Request, ObservableCollection<pdsecuL_7_12_Info>> pdsecuL_7_12_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_12_Request, ObservableCollection<pdsecuL_7_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_12_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_更新港股通待入账记录
        /// </summary>
        public IWorkCommand<pdsecuL_7_13_Request, ObservableCollection<pdsecuL_7_13_Info>> pdsecuL_7_13_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_13_Request, ObservableCollection<pdsecuL_7_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_13_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_更新估值资产
        /// </summary>
        public IWorkCommand<pdsecuL_7_14_Request, ObservableCollection<pdsecuL_7_14_Info>> pdsecuL_7_14_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_14_Request, ObservableCollection<pdsecuL_7_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_14_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_更新港股通结算汇率
        /// </summary>
        public IWorkCommand<pdsecuL_7_15_Request, ObservableCollection<pdsecuL_7_15_Info>> pdsecuL_7_15_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_15_Request, ObservableCollection<pdsecuL_7_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_15_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_同步产品信息
        /// </summary>
        public IWorkCommand<pdsecuL_7_16_Request, ObservableCollection<pdsecuL_7_16_Info>> pdsecuL_7_16_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_16_Request, ObservableCollection<pdsecuL_7_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_16_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_同步资产所需证券代码信息
        /// </summary>
        public IWorkCommand<pdsecuL_7_17_Request, ObservableCollection<pdsecuL_7_17_Info>> pdsecuL_7_17_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_17_Request, ObservableCollection<pdsecuL_7_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_17_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_新增证券账户信息
        /// </summary>
        public IWorkCommand<pdsecuL_7_18_Request, ObservableCollection<pdsecuL_7_18_Info>> pdsecuL_7_18_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_18_Request, ObservableCollection<pdsecuL_7_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_18_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_查询证券账户信息
        /// </summary>
        public IWorkCommand<pdsecuL_7_19_Request, ObservableCollection<pdsecuL_7_19_Info>> pdsecuL_7_19_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_19_Request, ObservableCollection<pdsecuL_7_19_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_19_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_注销资产账户和证券账户
        /// </summary>
        public IWorkCommand<pdsecuL_7_20_Request, ObservableCollection<pdsecuL_7_20_Info>> pdsecuL_7_20_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_20_Request, ObservableCollection<pdsecuL_7_20_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_20_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_冻结证券账户
        /// </summary>
        public IWorkCommand<pdsecuL_7_21_Request, ObservableCollection<pdsecuL_7_21_Info>> pdsecuL_7_21_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_21_Request, ObservableCollection<pdsecuL_7_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_21_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_恢复证券账户
        /// </summary>
        public IWorkCommand<pdsecuL_7_22_Request, ObservableCollection<pdsecuL_7_22_Info>> pdsecuL_7_22_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_22_Request, ObservableCollection<pdsecuL_7_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_22_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_注销证券账户
        /// </summary>
        public IWorkCommand<pdsecuL_7_23_Request, ObservableCollection<pdsecuL_7_23_Info>> pdsecuL_7_23_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_23_Request, ObservableCollection<pdsecuL_7_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_23_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_修改证券账户信息
        /// </summary>
        public IWorkCommand<pdsecuL_7_25_Request, ObservableCollection<pdsecuL_7_25_Info>> pdsecuL_7_25_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_25_Request, ObservableCollection<pdsecuL_7_25_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_25_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_删除证券账户信息
        /// </summary>
        public IWorkCommand<pdsecuL_7_26_Request, ObservableCollection<pdsecuL_7_26_Info>> pdsecuL_7_26_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_26_Request, ObservableCollection<pdsecuL_7_26_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_26_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_产品证券_账户运维_注销交易组
        /// </summary>
        public IWorkCommand<pdsecuL_7_27_Request, ObservableCollection<pdsecuL_7_27_Info>> pdsecuL_7_27_Command
        {
            get
            {
                return new WorkCommand<pdsecuL_7_27_Request, ObservableCollection<pdsecuL_7_27_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pdsecuL_7_27_InfoList;
                });
            }
        }

    }
}
