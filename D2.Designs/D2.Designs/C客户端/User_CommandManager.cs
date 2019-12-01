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
    public partial class UserCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_公共_用户_新增操作员信息
        /// </summary>
        public IWorkCommand<pubL_5_1_Request, ObservableCollection<pubL_5_1_Info>> pubL_5_1_Command
        {
            get
            {
                return new WorkCommand<pubL_5_1_Request, ObservableCollection<pubL_5_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_修改操作员信息
        /// </summary>
        public IWorkCommand<pubL_5_2_Request, ObservableCollection<pubL_5_2_Info>> pubL_5_2_Command
        {
            get
            {
                return new WorkCommand<pubL_5_2_Request, ObservableCollection<pubL_5_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_查询操作员信息
        /// </summary>
        public IWorkCommand<pubL_5_4_Request, ObservableCollection<pubL_5_4_Info>> pubL_5_4_Command
        {
            get
            {
                return new WorkCommand<pubL_5_4_Request, ObservableCollection<pubL_5_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_4_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_冻结操作员
        /// </summary>
        public IWorkCommand<pubL_5_5_Request, ObservableCollection<pubL_5_5_Info>> pubL_5_5_Command
        {
            get
            {
                return new WorkCommand<pubL_5_5_Request, ObservableCollection<pubL_5_5_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_5_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_解冻操作员
        /// </summary>
        public IWorkCommand<pubL_5_6_Request, ObservableCollection<pubL_5_6_Info>> pubL_5_6_Command
        {
            get
            {
                return new WorkCommand<pubL_5_6_Request, ObservableCollection<pubL_5_6_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_6_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_注销操作员
        /// </summary>
        public IWorkCommand<pubL_5_7_Request, ObservableCollection<pubL_5_7_Info>> pubL_5_7_Command
        {
            get
            {
                return new WorkCommand<pubL_5_7_Request, ObservableCollection<pubL_5_7_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_7_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_修改操作员密码
        /// </summary>
        public IWorkCommand<pubL_5_9_Request, ObservableCollection<pubL_5_9_Info>> pubL_5_9_Command
        {
            get
            {
                return new WorkCommand<pubL_5_9_Request, ObservableCollection<pubL_5_9_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_9_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_重置操作员密码
        /// </summary>
        public IWorkCommand<pubL_5_10_Request, ObservableCollection<pubL_5_10_Info>> pubL_5_10_Command
        {
            get
            {
                return new WorkCommand<pubL_5_10_Request, ObservableCollection<pubL_5_10_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_10_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_查询操作员信息流水
        /// </summary>
        public IWorkCommand<pubL_5_11_Request, ObservableCollection<pubL_5_11_Info>> pubL_5_11_Command
        {
            get
            {
                return new WorkCommand<pubL_5_11_Request, ObservableCollection<pubL_5_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_11_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_查询历史操作员信息流水
        /// </summary>
        public IWorkCommand<pubL_5_12_Request, ObservableCollection<pubL_5_12_Info>> pubL_5_12_Command
        {
            get
            {
                return new WorkCommand<pubL_5_12_Request, ObservableCollection<pubL_5_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_12_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_检查操作员存在
        /// </summary>
        public IWorkCommand<pubL_5_13_Request, ObservableCollection<pubL_5_13_Info>> pubL_5_13_Command
        {
            get
            {
                return new WorkCommand<pubL_5_13_Request, ObservableCollection<pubL_5_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_13_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_获取操作员编号
        /// </summary>
        public IWorkCommand<pubL_5_14_Request, ObservableCollection<pubL_5_14_Info>> pubL_5_14_Command
        {
            get
            {
                return new WorkCommand<pubL_5_14_Request, ObservableCollection<pubL_5_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_14_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_操作员登录
        /// </summary>
        public IWorkCommand<pubL_5_21_Request, ObservableCollection<pubL_5_21_Info>> pubL_5_21_Command
        {
            get
            {
                return new WorkCommand<pubL_5_21_Request, ObservableCollection<pubL_5_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_21_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_操作员退出
        /// </summary>
        public IWorkCommand<pubL_5_22_Request, ObservableCollection<pubL_5_22_Info>> pubL_5_22_Command
        {
            get
            {
                return new WorkCommand<pubL_5_22_Request, ObservableCollection<pubL_5_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_22_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_新增操作员可操作机构
        /// </summary>
        public IWorkCommand<pubL_5_41_Request, ObservableCollection<pubL_5_41_Info>> pubL_5_41_Command
        {
            get
            {
                return new WorkCommand<pubL_5_41_Request, ObservableCollection<pubL_5_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_41_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_删除操作员可操作机构
        /// </summary>
        public IWorkCommand<pubL_5_42_Request, ObservableCollection<pubL_5_42_Info>> pubL_5_42_Command
        {
            get
            {
                return new WorkCommand<pubL_5_42_Request, ObservableCollection<pubL_5_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_42_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_查询操作员可操作机构
        /// </summary>
        public IWorkCommand<pubL_5_44_Request, ObservableCollection<pubL_5_44_Info>> pubL_5_44_Command
        {
            get
            {
                return new WorkCommand<pubL_5_44_Request, ObservableCollection<pubL_5_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_44_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_查询全部交易组
        /// </summary>
        public IWorkCommand<pubL_5_65_Request, ObservableCollection<pubL_5_65_Info>> pubL_5_65_Command
        {
            get
            {
                return new WorkCommand<pubL_5_65_Request, ObservableCollection<pubL_5_65_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_65_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_查询全部操作员信息
        /// </summary>
        public IWorkCommand<pubL_5_201_Request, ObservableCollection<pubL_5_201_Info>> pubL_5_201_Command
        {
            get
            {
                return new WorkCommand<pubL_5_201_Request, ObservableCollection<pubL_5_201_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_201_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_获取操作员交易组权限串
        /// </summary>
        public IWorkCommand<pubL_5_202_Request, ObservableCollection<pubL_5_202_Info>> pubL_5_202_Command
        {
            get
            {
                return new WorkCommand<pubL_5_202_Request, ObservableCollection<pubL_5_202_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_202_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_获取操作员交易组权限
        /// </summary>
        public IWorkCommand<pubL_5_203_Request, ObservableCollection<pubL_5_203_Info>> pubL_5_203_Command
        {
            get
            {
                return new WorkCommand<pubL_5_203_Request, ObservableCollection<pubL_5_203_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_203_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_查询操作员可设置操作员
        /// </summary>
        public IWorkCommand<pubL_5_204_Request, ObservableCollection<pubL_5_204_Info>> pubL_5_204_Command
        {
            get
            {
                return new WorkCommand<pubL_5_204_Request, ObservableCollection<pubL_5_204_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_204_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_冻结交易组
        /// </summary>
        public IWorkCommand<pubL_5_205_Request, ObservableCollection<pubL_5_205_Info>> pubL_5_205_Command
        {
            get
            {
                return new WorkCommand<pubL_5_205_Request, ObservableCollection<pubL_5_205_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_205_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_解冻交易组
        /// </summary>
        public IWorkCommand<pubL_5_206_Request, ObservableCollection<pubL_5_206_Info>> pubL_5_206_Command
        {
            get
            {
                return new WorkCommand<pubL_5_206_Request, ObservableCollection<pubL_5_206_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_206_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_更新交易组禁止订单方向
        /// </summary>
        public IWorkCommand<pubL_5_207_Request, ObservableCollection<pubL_5_207_Info>> pubL_5_207_Command
        {
            get
            {
                return new WorkCommand<pubL_5_207_Request, ObservableCollection<pubL_5_207_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_207_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_新增交易组信息
        /// </summary>
        public IWorkCommand<pubL_5_208_Request, ObservableCollection<pubL_5_208_Info>> pubL_5_208_Command
        {
            get
            {
                return new WorkCommand<pubL_5_208_Request, ObservableCollection<pubL_5_208_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_208_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_查询交易组信息
        /// </summary>
        public IWorkCommand<pubL_5_209_Request, ObservableCollection<pubL_5_209_Info>> pubL_5_209_Command
        {
            get
            {
                return new WorkCommand<pubL_5_209_Request, ObservableCollection<pubL_5_209_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_209_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_修改交易组信息
        /// </summary>
        public IWorkCommand<pubL_5_210_Request, ObservableCollection<pubL_5_210_Info>> pubL_5_210_Command
        {
            get
            {
                return new WorkCommand<pubL_5_210_Request, ObservableCollection<pubL_5_210_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_210_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_注销交易组
        /// </summary>
        public IWorkCommand<pubL_5_211_Request, ObservableCollection<pubL_5_211_Info>> pubL_5_211_Command
        {
            get
            {
                return new WorkCommand<pubL_5_211_Request, ObservableCollection<pubL_5_211_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_211_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_新增操作员可操作操作员
        /// </summary>
        public IWorkCommand<pubL_5_212_Request, ObservableCollection<pubL_5_212_Info>> pubL_5_212_Command
        {
            get
            {
                return new WorkCommand<pubL_5_212_Request, ObservableCollection<pubL_5_212_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_212_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_删除操作员可操作操作员
        /// </summary>
        public IWorkCommand<pubL_5_213_Request, ObservableCollection<pubL_5_213_Info>> pubL_5_213_Command
        {
            get
            {
                return new WorkCommand<pubL_5_213_Request, ObservableCollection<pubL_5_213_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_213_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_新增操作员可操作产品
        /// </summary>
        public IWorkCommand<pubL_5_214_Request, ObservableCollection<pubL_5_214_Info>> pubL_5_214_Command
        {
            get
            {
                return new WorkCommand<pubL_5_214_Request, ObservableCollection<pubL_5_214_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_214_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_删除操作员可操作产品
        /// </summary>
        public IWorkCommand<pubL_5_215_Request, ObservableCollection<pubL_5_215_Info>> pubL_5_215_Command
        {
            get
            {
                return new WorkCommand<pubL_5_215_Request, ObservableCollection<pubL_5_215_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_215_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_新增操作员所属交易组
        /// </summary>
        public IWorkCommand<pubL_5_216_Request, ObservableCollection<pubL_5_216_Info>> pubL_5_216_Command
        {
            get
            {
                return new WorkCommand<pubL_5_216_Request, ObservableCollection<pubL_5_216_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_216_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_用户_删除操作员所属交易组
        /// </summary>
        public IWorkCommand<pubL_5_217_Request, ObservableCollection<pubL_5_217_Info>> pubL_5_217_Command
        {
            get
            {
                return new WorkCommand<pubL_5_217_Request, ObservableCollection<pubL_5_217_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_5_217_InfoList;
                });
            }
        }

    }
}
