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
    public partial class BaseSecuMarginDataCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_公共_融资融券基础数据_新增可冲抵保证金证券表
        /// </summary>
        public IWorkCommand<pubL_29_1_Request, ObservableCollection<pubL_29_1_Info>> pubL_29_1_Command
        {
            get
            {
                return new WorkCommand<pubL_29_1_Request, ObservableCollection<pubL_29_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_修改可冲抵保证金证券表
        /// </summary>
        public IWorkCommand<pubL_29_2_Request, ObservableCollection<pubL_29_2_Info>> pubL_29_2_Command
        {
            get
            {
                return new WorkCommand<pubL_29_2_Request, ObservableCollection<pubL_29_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_删除可冲抵保证金证券表
        /// </summary>
        public IWorkCommand<pubL_29_3_Request, ObservableCollection<pubL_29_3_Info>> pubL_29_3_Command
        {
            get
            {
                return new WorkCommand<pubL_29_3_Request, ObservableCollection<pubL_29_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_3_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_查询可冲抵保证金证券表
        /// </summary>
        public IWorkCommand<pubL_29_4_Request, ObservableCollection<pubL_29_4_Info>> pubL_29_4_Command
        {
            get
            {
                return new WorkCommand<pubL_29_4_Request, ObservableCollection<pubL_29_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_4_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_新增融资融券配置表
        /// </summary>
        public IWorkCommand<pubL_29_5_Request, ObservableCollection<pubL_29_5_Info>> pubL_29_5_Command
        {
            get
            {
                return new WorkCommand<pubL_29_5_Request, ObservableCollection<pubL_29_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_5_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_修改融资融券配置表
        /// </summary>
        public IWorkCommand<pubL_29_6_Request, ObservableCollection<pubL_29_6_Info>> pubL_29_6_Command
        {
            get
            {
                return new WorkCommand<pubL_29_6_Request, ObservableCollection<pubL_29_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_6_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_删除融资融券配置表
        /// </summary>
        public IWorkCommand<pubL_29_7_Request, ObservableCollection<pubL_29_7_Info>> pubL_29_7_Command
        {
            get
            {
                return new WorkCommand<pubL_29_7_Request, ObservableCollection<pubL_29_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_7_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_查询融资融券配置表
        /// </summary>
        public IWorkCommand<pubL_29_8_Request, ObservableCollection<pubL_29_8_Info>> pubL_29_8_Command
        {
            get
            {
                return new WorkCommand<pubL_29_8_Request, ObservableCollection<pubL_29_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_8_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_新增融资融券标的证券表
        /// </summary>
        public IWorkCommand<pubL_29_9_Request, ObservableCollection<pubL_29_9_Info>> pubL_29_9_Command
        {
            get
            {
                return new WorkCommand<pubL_29_9_Request, ObservableCollection<pubL_29_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_9_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_修改融资融券标的证券表
        /// </summary>
        public IWorkCommand<pubL_29_10_Request, ObservableCollection<pubL_29_10_Info>> pubL_29_10_Command
        {
            get
            {
                return new WorkCommand<pubL_29_10_Request, ObservableCollection<pubL_29_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_10_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_删除融资融券标的证券表
        /// </summary>
        public IWorkCommand<pubL_29_11_Request, ObservableCollection<pubL_29_11_Info>> pubL_29_11_Command
        {
            get
            {
                return new WorkCommand<pubL_29_11_Request, ObservableCollection<pubL_29_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_11_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_查询融资融券标的证券表
        /// </summary>
        public IWorkCommand<pubL_29_12_Request, ObservableCollection<pubL_29_12_Info>> pubL_29_12_Command
        {
            get
            {
                return new WorkCommand<pubL_29_12_Request, ObservableCollection<pubL_29_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_12_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_新增融资融券券商禁止标的证券表
        /// </summary>
        public IWorkCommand<pubL_29_13_Request, ObservableCollection<pubL_29_13_Info>> pubL_29_13_Command
        {
            get
            {
                return new WorkCommand<pubL_29_13_Request, ObservableCollection<pubL_29_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_13_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_修改融资融券券商禁止标的证券表
        /// </summary>
        public IWorkCommand<pubL_29_14_Request, ObservableCollection<pubL_29_14_Info>> pubL_29_14_Command
        {
            get
            {
                return new WorkCommand<pubL_29_14_Request, ObservableCollection<pubL_29_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_14_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_删除融资融券券商禁止标的证券表
        /// </summary>
        public IWorkCommand<pubL_29_15_Request, ObservableCollection<pubL_29_15_Info>> pubL_29_15_Command
        {
            get
            {
                return new WorkCommand<pubL_29_15_Request, ObservableCollection<pubL_29_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_15_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_查询融资融券券商禁止标的证券表
        /// </summary>
        public IWorkCommand<pubL_29_16_Request, ObservableCollection<pubL_29_16_Info>> pubL_29_16_Command
        {
            get
            {
                return new WorkCommand<pubL_29_16_Request, ObservableCollection<pubL_29_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_16_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_新增融资融券保证金比例配置表
        /// </summary>
        public IWorkCommand<pubL_29_17_Request, ObservableCollection<pubL_29_17_Info>> pubL_29_17_Command
        {
            get
            {
                return new WorkCommand<pubL_29_17_Request, ObservableCollection<pubL_29_17_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_17_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_修改融资融券保证金比例配置表
        /// </summary>
        public IWorkCommand<pubL_29_18_Request, ObservableCollection<pubL_29_18_Info>> pubL_29_18_Command
        {
            get
            {
                return new WorkCommand<pubL_29_18_Request, ObservableCollection<pubL_29_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_18_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_删除融资融券保证金比例配置表
        /// </summary>
        public IWorkCommand<pubL_29_19_Request, ObservableCollection<pubL_29_19_Info>> pubL_29_19_Command
        {
            get
            {
                return new WorkCommand<pubL_29_19_Request, ObservableCollection<pubL_29_19_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_19_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_查询融资融券保证金比例配置表
        /// </summary>
        public IWorkCommand<pubL_29_20_Request, ObservableCollection<pubL_29_20_Info>> pubL_29_20_Command
        {
            get
            {
                return new WorkCommand<pubL_29_20_Request, ObservableCollection<pubL_29_20_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_20_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_获取融资融券保证金比例配置
        /// </summary>
        public IWorkCommand<pubL_29_21_Request, ObservableCollection<pubL_29_21_Info>> pubL_29_21_Command
        {
            get
            {
                return new WorkCommand<pubL_29_21_Request, ObservableCollection<pubL_29_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_21_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_获取可冲抵保证金证券表
        /// </summary>
        public IWorkCommand<pubL_29_22_Request, ObservableCollection<pubL_29_22_Info>> pubL_29_22_Command
        {
            get
            {
                return new WorkCommand<pubL_29_22_Request, ObservableCollection<pubL_29_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_22_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_查询机构融资融券保证金比例
        /// </summary>
        public IWorkCommand<pubL_29_23_Request, ObservableCollection<pubL_29_23_Info>> pubL_29_23_Command
        {
            get
            {
                return new WorkCommand<pubL_29_23_Request, ObservableCollection<pubL_29_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_23_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_可冲抵保证金证券导入
        /// </summary>
        public IWorkCommand<pubL_29_24_Request, ObservableCollection<pubL_29_24_Info>> pubL_29_24_Command
        {
            get
            {
                return new WorkCommand<pubL_29_24_Request, ObservableCollection<pubL_29_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_24_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_融资融券基础数据_融资融券标的证券导入
        /// </summary>
        public IWorkCommand<pubL_29_25_Request, ObservableCollection<pubL_29_25_Info>> pubL_29_25_Command
        {
            get
            {
                return new WorkCommand<pubL_29_25_Request, ObservableCollection<pubL_29_25_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_29_25_InfoList;
                });
            }
        }

    }
}
