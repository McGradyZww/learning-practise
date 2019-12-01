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
    public partial class FeeFutuClientCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_公共_期货费用客户端_新增期货费用模板
        /// </summary>
        public IWorkCommand<pubL_18_41_Request, ObservableCollection<pubL_18_41_Info>> pubL_18_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_41_Request, ObservableCollection<pubL_18_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_修改期货费用模板
        /// </summary>
        public IWorkCommand<pubL_18_42_Request, ObservableCollection<pubL_18_42_Info>> pubL_18_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_42_Request, ObservableCollection<pubL_18_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_删除期货费用模板
        /// </summary>
        public IWorkCommand<pubL_18_43_Request, ObservableCollection<pubL_18_43_Info>> pubL_18_43_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_43_Request, ObservableCollection<pubL_18_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_43_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_查询期货费用模板
        /// </summary>
        public IWorkCommand<pubL_18_44_Request, ObservableCollection<pubL_18_44_Info>> pubL_18_44_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_44_Request, ObservableCollection<pubL_18_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_44_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_查询期货费用模板流水
        /// </summary>
        public IWorkCommand<pubL_18_45_Request, ObservableCollection<pubL_18_45_Info>> pubL_18_45_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_45_Request, ObservableCollection<pubL_18_45_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_45_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_查询历史期货费用模板流水
        /// </summary>
        public IWorkCommand<pubL_18_46_Request, ObservableCollection<pubL_18_46_Info>> pubL_18_46_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_46_Request, ObservableCollection<pubL_18_46_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_46_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_新增合约类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_18_51_Request, ObservableCollection<pubL_18_51_Info>> pubL_18_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_51_Request, ObservableCollection<pubL_18_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_修改合约类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_18_52_Request, ObservableCollection<pubL_18_52_Info>> pubL_18_52_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_52_Request, ObservableCollection<pubL_18_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_52_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_删除合约类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_18_53_Request, ObservableCollection<pubL_18_53_Info>> pubL_18_53_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_53_Request, ObservableCollection<pubL_18_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_53_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_查询合约类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_18_54_Request, ObservableCollection<pubL_18_54_Info>> pubL_18_54_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_54_Request, ObservableCollection<pubL_18_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_54_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_查询合约类型费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_18_55_Request, ObservableCollection<pubL_18_55_Info>> pubL_18_55_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_55_Request, ObservableCollection<pubL_18_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_55_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_查询历史合约类型费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_18_56_Request, ObservableCollection<pubL_18_56_Info>> pubL_18_56_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_56_Request, ObservableCollection<pubL_18_56_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_56_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_新增合约代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_18_61_Request, ObservableCollection<pubL_18_61_Info>> pubL_18_61_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_61_Request, ObservableCollection<pubL_18_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_61_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_修改合约代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_18_62_Request, ObservableCollection<pubL_18_62_Info>> pubL_18_62_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_62_Request, ObservableCollection<pubL_18_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_62_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_删除合约代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_18_63_Request, ObservableCollection<pubL_18_63_Info>> pubL_18_63_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_63_Request, ObservableCollection<pubL_18_63_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_63_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_查询合约代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_18_64_Request, ObservableCollection<pubL_18_64_Info>> pubL_18_64_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_64_Request, ObservableCollection<pubL_18_64_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_64_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_查询合约代码费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_18_65_Request, ObservableCollection<pubL_18_65_Info>> pubL_18_65_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_65_Request, ObservableCollection<pubL_18_65_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_65_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_查询历史合约代码费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_18_66_Request, ObservableCollection<pubL_18_66_Info>> pubL_18_66_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_66_Request, ObservableCollection<pubL_18_66_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_66_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_新增资产账户期货费用模板
        /// </summary>
        public IWorkCommand<pubL_18_71_Request, ObservableCollection<pubL_18_71_Info>> pubL_18_71_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_71_Request, ObservableCollection<pubL_18_71_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_71_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_修改资产账户期货费用模板
        /// </summary>
        public IWorkCommand<pubL_18_72_Request, ObservableCollection<pubL_18_72_Info>> pubL_18_72_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_72_Request, ObservableCollection<pubL_18_72_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_72_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_删除资产账户期货费用模板
        /// </summary>
        public IWorkCommand<pubL_18_73_Request, ObservableCollection<pubL_18_73_Info>> pubL_18_73_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_73_Request, ObservableCollection<pubL_18_73_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_73_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_查询资产账户期货费用模板
        /// </summary>
        public IWorkCommand<pubL_18_74_Request, ObservableCollection<pubL_18_74_Info>> pubL_18_74_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_74_Request, ObservableCollection<pubL_18_74_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_74_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_查询资产账户期货费用模板流水
        /// </summary>
        public IWorkCommand<pubL_18_75_Request, ObservableCollection<pubL_18_75_Info>> pubL_18_75_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_75_Request, ObservableCollection<pubL_18_75_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_75_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_查询历史资产账户期货费用模板流水
        /// </summary>
        public IWorkCommand<pubL_18_76_Request, ObservableCollection<pubL_18_76_Info>> pubL_18_76_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_76_Request, ObservableCollection<pubL_18_76_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_76_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_查询系统合约类型费用
        /// </summary>
        public IWorkCommand<pubL_18_144_Request, ObservableCollection<pubL_18_144_Info>> pubL_18_144_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_144_Request, ObservableCollection<pubL_18_144_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_144_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_查询系统合约代码费用
        /// </summary>
        public IWorkCommand<pubL_18_154_Request, ObservableCollection<pubL_18_154_Info>> pubL_18_154_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_154_Request, ObservableCollection<pubL_18_154_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_154_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_计算期货费用
        /// </summary>
        public IWorkCommand<pubL_18_203_Request, ObservableCollection<pubL_18_203_Info>> pubL_18_203_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_203_Request, ObservableCollection<pubL_18_203_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_203_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_查询费用编号
        /// </summary>
        public IWorkCommand<pubL_18_302_Request, ObservableCollection<pubL_18_302_Info>> pubL_18_302_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_302_Request, ObservableCollection<pubL_18_302_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_302_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_获取期货保证金参数
        /// </summary>
        public IWorkCommand<pubL_18_303_Request, ObservableCollection<pubL_18_303_Info>> pubL_18_303_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_303_Request, ObservableCollection<pubL_18_303_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_303_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_模板编号删除期货费用明细
        /// </summary>
        public IWorkCommand<pubL_18_77_Request, ObservableCollection<pubL_18_77_Info>> pubL_18_77_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_77_Request, ObservableCollection<pubL_18_77_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_77_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用客户端_复制期货费用模板
        /// </summary>
        public IWorkCommand<pubL_18_78_Request, ObservableCollection<pubL_18_78_Info>> pubL_18_78_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_18_78_Request, ObservableCollection<pubL_18_78_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_18_78_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
