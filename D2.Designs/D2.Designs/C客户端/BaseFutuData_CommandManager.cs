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
    public partial class BaseFutuDataCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_公共_期货基础数据_修改合约类型
        /// </summary>
        public IWorkCommand<pubL_13_112_Request, ObservableCollection<pubL_13_112_Info>> pubL_13_112_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_112_Request, ObservableCollection<pubL_13_112_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_112_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询合约类型
        /// </summary>
        public IWorkCommand<pubL_13_114_Request, ObservableCollection<pubL_13_114_Info>> pubL_13_114_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_114_Request, ObservableCollection<pubL_13_114_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_114_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询合约类型流水
        /// </summary>
        public IWorkCommand<pubL_13_115_Request, ObservableCollection<pubL_13_115_Info>> pubL_13_115_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_115_Request, ObservableCollection<pubL_13_115_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_115_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询历史合约类型流水
        /// </summary>
        public IWorkCommand<pubL_13_116_Request, ObservableCollection<pubL_13_116_Info>> pubL_13_116_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_116_Request, ObservableCollection<pubL_13_116_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_116_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询合约类型订单方向
        /// </summary>
        public IWorkCommand<pubL_13_124_Request, ObservableCollection<pubL_13_124_Info>> pubL_13_124_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_124_Request, ObservableCollection<pubL_13_124_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_124_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_初始化期货代码信息
        /// </summary>
        public IWorkCommand<pubL_13_131_Request, ObservableCollection<pubL_13_131_Info>> pubL_13_131_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_131_Request, ObservableCollection<pubL_13_131_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_131_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_更新期货行情
        /// </summary>
        public IWorkCommand<pubL_13_132_Request, ObservableCollection<pubL_13_132_Info>> pubL_13_132_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_132_Request, ObservableCollection<pubL_13_132_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_132_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_期货合约列表查询
        /// </summary>
        public IWorkCommand<pubL_13_133_Request, ObservableCollection<pubL_13_133_Info>> pubL_13_133_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_133_Request, ObservableCollection<pubL_13_133_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_133_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询期货模板
        /// </summary>
        public IWorkCommand<pubL_13_134_Request, ObservableCollection<pubL_13_134_Info>> pubL_13_134_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_134_Request, ObservableCollection<pubL_13_134_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_134_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_新增合约代码信息
        /// </summary>
        public IWorkCommand<pubL_13_141_Request, ObservableCollection<pubL_13_141_Info>> pubL_13_141_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_141_Request, ObservableCollection<pubL_13_141_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_141_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_修改合约代码信息
        /// </summary>
        public IWorkCommand<pubL_13_142_Request, ObservableCollection<pubL_13_142_Info>> pubL_13_142_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_142_Request, ObservableCollection<pubL_13_142_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_142_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询合约代码信息
        /// </summary>
        public IWorkCommand<pubL_13_144_Request, ObservableCollection<pubL_13_144_Info>> pubL_13_144_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_144_Request, ObservableCollection<pubL_13_144_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_144_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询客户端合约代码信息
        /// </summary>
        public IWorkCommand<pubL_13_148_Request, ObservableCollection<pubL_13_148_Info>> pubL_13_148_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_148_Request, ObservableCollection<pubL_13_148_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_148_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_获取合约代码信息
        /// </summary>
        public IWorkCommand<pubL_13_145_Request, ObservableCollection<pubL_13_145_Info>> pubL_13_145_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_145_Request, ObservableCollection<pubL_13_145_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_145_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询合约代码信息流水
        /// </summary>
        public IWorkCommand<pubL_13_146_Request, ObservableCollection<pubL_13_146_Info>> pubL_13_146_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_146_Request, ObservableCollection<pubL_13_146_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_146_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询历史合约代码信息流水
        /// </summary>
        public IWorkCommand<pubL_13_147_Request, ObservableCollection<pubL_13_147_Info>> pubL_13_147_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_147_Request, ObservableCollection<pubL_13_147_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_147_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询合约代码列表
        /// </summary>
        public IWorkCommand<pubL_13_149_Request, ObservableCollection<pubL_13_149_Info>> pubL_13_149_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_149_Request, ObservableCollection<pubL_13_149_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_149_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_新增合约代码订单方向
        /// </summary>
        public IWorkCommand<pubL_13_151_Request, ObservableCollection<pubL_13_151_Info>> pubL_13_151_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_151_Request, ObservableCollection<pubL_13_151_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_151_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_修改合约代码订单方向
        /// </summary>
        public IWorkCommand<pubL_13_152_Request, ObservableCollection<pubL_13_152_Info>> pubL_13_152_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_152_Request, ObservableCollection<pubL_13_152_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_152_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_删除合约代码订单方向
        /// </summary>
        public IWorkCommand<pubL_13_153_Request, ObservableCollection<pubL_13_153_Info>> pubL_13_153_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_153_Request, ObservableCollection<pubL_13_153_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_153_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询合约代码订单方向
        /// </summary>
        public IWorkCommand<pubL_13_154_Request, ObservableCollection<pubL_13_154_Info>> pubL_13_154_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_154_Request, ObservableCollection<pubL_13_154_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_154_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询合约代码订单方向流水
        /// </summary>
        public IWorkCommand<pubL_13_155_Request, ObservableCollection<pubL_13_155_Info>> pubL_13_155_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_155_Request, ObservableCollection<pubL_13_155_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_155_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询历史合约代码订单方向流水
        /// </summary>
        public IWorkCommand<pubL_13_156_Request, ObservableCollection<pubL_13_156_Info>> pubL_13_156_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_156_Request, ObservableCollection<pubL_13_156_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_156_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_增加合约交割参数记录
        /// </summary>
        public IWorkCommand<pubL_13_157_Request, ObservableCollection<pubL_13_157_Info>> pubL_13_157_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_157_Request, ObservableCollection<pubL_13_157_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_157_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_修改合约交割参数记录
        /// </summary>
        public IWorkCommand<pubL_13_158_Request, ObservableCollection<pubL_13_158_Info>> pubL_13_158_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_158_Request, ObservableCollection<pubL_13_158_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_158_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_删除合约交割参数记录
        /// </summary>
        public IWorkCommand<pubL_13_159_Request, ObservableCollection<pubL_13_159_Info>> pubL_13_159_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_159_Request, ObservableCollection<pubL_13_159_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_159_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询合约交割参数记录
        /// </summary>
        public IWorkCommand<pubL_13_160_Request, ObservableCollection<pubL_13_160_Info>> pubL_13_160_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_160_Request, ObservableCollection<pubL_13_160_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_160_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询组合保证金参数
        /// </summary>
        public IWorkCommand<pubL_13_161_Request, ObservableCollection<pubL_13_161_Info>> pubL_13_161_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_161_Request, ObservableCollection<pubL_13_161_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_161_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_增加自选行情记录
        /// </summary>
        public IWorkCommand<pubL_13_170_Request, ObservableCollection<pubL_13_170_Info>> pubL_13_170_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_170_Request, ObservableCollection<pubL_13_170_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_170_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_删除自选行情记录
        /// </summary>
        public IWorkCommand<pubL_13_171_Request, ObservableCollection<pubL_13_171_Info>> pubL_13_171_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_171_Request, ObservableCollection<pubL_13_171_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_171_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询自选行情记录
        /// </summary>
        public IWorkCommand<pubL_13_172_Request, ObservableCollection<pubL_13_172_Info>> pubL_13_172_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_172_Request, ObservableCollection<pubL_13_172_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_172_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_查询期货行情
        /// </summary>
        public IWorkCommand<pubL_13_173_Request, ObservableCollection<pubL_13_173_Info>> pubL_13_173_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_13_173_Request, ObservableCollection<pubL_13_173_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_13_173_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_期货基础数据_更新期货行情结算价
        /// </summary>
        public IWorkCommand<pubL_13_174_Request, ObservableCollection<pubL_13_174_Info>> pubL_13_174_Command
        {
            get
            {
                return new WorkCommand<pubL_13_174_Request, ObservableCollection<pubL_13_174_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_13_174_InfoList;
                });
            }
        }

    }
}
