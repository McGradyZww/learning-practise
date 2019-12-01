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
    public partial class FeeFutuCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_公共_期货费用_新增期货费用模板
        /// </summary>
        public IWorkCommand<pubL_15_41_Request, ObservableCollection<pubL_15_41_Info>> pubL_15_41_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_41_Request, ObservableCollection<pubL_15_41_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_41_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_修改期货费用模板
        /// </summary>
        public IWorkCommand<pubL_15_42_Request, ObservableCollection<pubL_15_42_Info>> pubL_15_42_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_42_Request, ObservableCollection<pubL_15_42_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_42_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_删除期货费用模板
        /// </summary>
        public IWorkCommand<pubL_15_43_Request, ObservableCollection<pubL_15_43_Info>> pubL_15_43_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_43_Request, ObservableCollection<pubL_15_43_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_43_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询期货费用模板
        /// </summary>
        public IWorkCommand<pubL_15_44_Request, ObservableCollection<pubL_15_44_Info>> pubL_15_44_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_44_Request, ObservableCollection<pubL_15_44_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_44_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询期货费用模板流水
        /// </summary>
        public IWorkCommand<pubL_15_45_Request, ObservableCollection<pubL_15_45_Info>> pubL_15_45_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_45_Request, ObservableCollection<pubL_15_45_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_45_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询历史期货费用模板流水
        /// </summary>
        public IWorkCommand<pubL_15_46_Request, ObservableCollection<pubL_15_46_Info>> pubL_15_46_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_46_Request, ObservableCollection<pubL_15_46_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_46_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_新增合约类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_15_51_Request, ObservableCollection<pubL_15_51_Info>> pubL_15_51_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_51_Request, ObservableCollection<pubL_15_51_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_51_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_修改合约类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_15_52_Request, ObservableCollection<pubL_15_52_Info>> pubL_15_52_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_52_Request, ObservableCollection<pubL_15_52_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_52_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_删除合约类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_15_53_Request, ObservableCollection<pubL_15_53_Info>> pubL_15_53_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_53_Request, ObservableCollection<pubL_15_53_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_53_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询合约类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_15_54_Request, ObservableCollection<pubL_15_54_Info>> pubL_15_54_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_54_Request, ObservableCollection<pubL_15_54_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_54_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询合约类型费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_15_55_Request, ObservableCollection<pubL_15_55_Info>> pubL_15_55_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_55_Request, ObservableCollection<pubL_15_55_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_55_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询历史合约类型费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_15_56_Request, ObservableCollection<pubL_15_56_Info>> pubL_15_56_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_56_Request, ObservableCollection<pubL_15_56_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_56_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_新增合约代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_15_61_Request, ObservableCollection<pubL_15_61_Info>> pubL_15_61_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_61_Request, ObservableCollection<pubL_15_61_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_61_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_修改合约代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_15_62_Request, ObservableCollection<pubL_15_62_Info>> pubL_15_62_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_62_Request, ObservableCollection<pubL_15_62_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_62_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_删除合约代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_15_63_Request, ObservableCollection<pubL_15_63_Info>> pubL_15_63_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_63_Request, ObservableCollection<pubL_15_63_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_63_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询合约代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_15_64_Request, ObservableCollection<pubL_15_64_Info>> pubL_15_64_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_64_Request, ObservableCollection<pubL_15_64_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_64_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询合约代码费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_15_65_Request, ObservableCollection<pubL_15_65_Info>> pubL_15_65_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_65_Request, ObservableCollection<pubL_15_65_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_65_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询历史合约代码费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_15_66_Request, ObservableCollection<pubL_15_66_Info>> pubL_15_66_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_66_Request, ObservableCollection<pubL_15_66_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_66_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_新增外部合约类型费用
        /// </summary>
        public IWorkCommand<pubL_15_121_Request, ObservableCollection<pubL_15_121_Info>> pubL_15_121_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_121_Request, ObservableCollection<pubL_15_121_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_121_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_修改外部合约类型费用
        /// </summary>
        public IWorkCommand<pubL_15_122_Request, ObservableCollection<pubL_15_122_Info>> pubL_15_122_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_122_Request, ObservableCollection<pubL_15_122_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_122_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_删除外部合约类型费用
        /// </summary>
        public IWorkCommand<pubL_15_123_Request, ObservableCollection<pubL_15_123_Info>> pubL_15_123_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_123_Request, ObservableCollection<pubL_15_123_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_123_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询外部合约类型费用
        /// </summary>
        public IWorkCommand<pubL_15_124_Request, ObservableCollection<pubL_15_124_Info>> pubL_15_124_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_124_Request, ObservableCollection<pubL_15_124_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_124_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询外部合约类型费用流水
        /// </summary>
        public IWorkCommand<pubL_15_125_Request, ObservableCollection<pubL_15_125_Info>> pubL_15_125_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_125_Request, ObservableCollection<pubL_15_125_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_125_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询历史外部合约类型费用流水
        /// </summary>
        public IWorkCommand<pubL_15_126_Request, ObservableCollection<pubL_15_126_Info>> pubL_15_126_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_126_Request, ObservableCollection<pubL_15_126_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_126_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_新增外部合约代码费用
        /// </summary>
        public IWorkCommand<pubL_15_131_Request, ObservableCollection<pubL_15_131_Info>> pubL_15_131_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_131_Request, ObservableCollection<pubL_15_131_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_131_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_修改外部合约代码费用
        /// </summary>
        public IWorkCommand<pubL_15_132_Request, ObservableCollection<pubL_15_132_Info>> pubL_15_132_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_132_Request, ObservableCollection<pubL_15_132_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_132_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_删除外部合约代码费用
        /// </summary>
        public IWorkCommand<pubL_15_133_Request, ObservableCollection<pubL_15_133_Info>> pubL_15_133_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_133_Request, ObservableCollection<pubL_15_133_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_133_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询外部合约代码费用
        /// </summary>
        public IWorkCommand<pubL_15_134_Request, ObservableCollection<pubL_15_134_Info>> pubL_15_134_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_134_Request, ObservableCollection<pubL_15_134_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_134_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询外部合约代码费用流水
        /// </summary>
        public IWorkCommand<pubL_15_135_Request, ObservableCollection<pubL_15_135_Info>> pubL_15_135_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_135_Request, ObservableCollection<pubL_15_135_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_135_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询历史外部合约代码费用流水
        /// </summary>
        public IWorkCommand<pubL_15_136_Request, ObservableCollection<pubL_15_136_Info>> pubL_15_136_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_136_Request, ObservableCollection<pubL_15_136_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_136_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_新增系统合约类型费用
        /// </summary>
        public IWorkCommand<pubL_15_141_Request, ObservableCollection<pubL_15_141_Info>> pubL_15_141_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_141_Request, ObservableCollection<pubL_15_141_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_141_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_修改系统合约类型费用
        /// </summary>
        public IWorkCommand<pubL_15_142_Request, ObservableCollection<pubL_15_142_Info>> pubL_15_142_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_142_Request, ObservableCollection<pubL_15_142_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_142_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_删除系统合约类型费用
        /// </summary>
        public IWorkCommand<pubL_15_143_Request, ObservableCollection<pubL_15_143_Info>> pubL_15_143_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_143_Request, ObservableCollection<pubL_15_143_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_143_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询系统合约类型费用
        /// </summary>
        public IWorkCommand<pubL_15_144_Request, ObservableCollection<pubL_15_144_Info>> pubL_15_144_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_144_Request, ObservableCollection<pubL_15_144_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_144_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询系统合约类型费用流水
        /// </summary>
        public IWorkCommand<pubL_15_145_Request, ObservableCollection<pubL_15_145_Info>> pubL_15_145_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_145_Request, ObservableCollection<pubL_15_145_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_145_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询历史系统合约类型费用流水
        /// </summary>
        public IWorkCommand<pubL_15_146_Request, ObservableCollection<pubL_15_146_Info>> pubL_15_146_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_146_Request, ObservableCollection<pubL_15_146_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_146_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_新增系统合约代码费用
        /// </summary>
        public IWorkCommand<pubL_15_151_Request, ObservableCollection<pubL_15_151_Info>> pubL_15_151_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_151_Request, ObservableCollection<pubL_15_151_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_151_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_修改系统合约代码费用
        /// </summary>
        public IWorkCommand<pubL_15_152_Request, ObservableCollection<pubL_15_152_Info>> pubL_15_152_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_152_Request, ObservableCollection<pubL_15_152_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_152_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_删除系统合约代码费用
        /// </summary>
        public IWorkCommand<pubL_15_153_Request, ObservableCollection<pubL_15_153_Info>> pubL_15_153_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_153_Request, ObservableCollection<pubL_15_153_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_153_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询系统合约代码费用
        /// </summary>
        public IWorkCommand<pubL_15_154_Request, ObservableCollection<pubL_15_154_Info>> pubL_15_154_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_154_Request, ObservableCollection<pubL_15_154_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_154_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询系统合约代码费用流水
        /// </summary>
        public IWorkCommand<pubL_15_155_Request, ObservableCollection<pubL_15_155_Info>> pubL_15_155_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_155_Request, ObservableCollection<pubL_15_155_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_155_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询历史系统合约代码费用流水
        /// </summary>
        public IWorkCommand<pubL_15_156_Request, ObservableCollection<pubL_15_156_Info>> pubL_15_156_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_156_Request, ObservableCollection<pubL_15_156_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_156_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_计算期货费用
        /// </summary>
        public IWorkCommand<pubL_15_203_Request, ObservableCollection<pubL_15_203_Info>> pubL_15_203_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_203_Request, ObservableCollection<pubL_15_203_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_203_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询费用编号
        /// </summary>
        public IWorkCommand<pubL_15_302_Request, ObservableCollection<pubL_15_302_Info>> pubL_15_302_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_302_Request, ObservableCollection<pubL_15_302_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_302_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_新增资产账户期货费用模板
        /// </summary>
        public IWorkCommand<pubL_15_303_Request, ObservableCollection<pubL_15_303_Info>> pubL_15_303_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_303_Request, ObservableCollection<pubL_15_303_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_303_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_模板编号删除期货费用明细
        /// </summary>
        public IWorkCommand<pubL_15_304_Request, ObservableCollection<pubL_15_304_Info>> pubL_15_304_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_304_Request, ObservableCollection<pubL_15_304_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_304_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_复制期货费用模板
        /// </summary>
        public IWorkCommand<pubL_15_305_Request, ObservableCollection<pubL_15_305_Info>> pubL_15_305_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_305_Request, ObservableCollection<pubL_15_305_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_305_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_修改资产账户期货费用模板
        /// </summary>
        public IWorkCommand<pubL_15_306_Request, ObservableCollection<pubL_15_306_Info>> pubL_15_306_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_306_Request, ObservableCollection<pubL_15_306_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_306_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_删除资产账户期货费用模板
        /// </summary>
        public IWorkCommand<pubL_15_307_Request, ObservableCollection<pubL_15_307_Info>> pubL_15_307_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_307_Request, ObservableCollection<pubL_15_307_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_307_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货费用_查询资产账户期货费用模板
        /// </summary>
        public IWorkCommand<pubL_15_308_Request, ObservableCollection<pubL_15_308_Info>> pubL_15_308_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_15_308_Request, ObservableCollection<pubL_15_308_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_15_308_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
