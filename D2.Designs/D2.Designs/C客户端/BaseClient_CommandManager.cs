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
    public partial class BaseClientCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_公共_基础客户端_获取机器日期时间
        /// </summary>
        public IWorkCommand<pubL_17_8_Request, ObservableCollection<pubL_17_8_Info>> pubL_17_8_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_8_Request, ObservableCollection<pubL_17_8_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_8_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_修改机构信息
        /// </summary>
        public IWorkCommand<pubL_17_12_Request, ObservableCollection<pubL_17_12_Info>> pubL_17_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_12_Request, ObservableCollection<pubL_17_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_修改机构业务控制配置串
        /// </summary>
        public IWorkCommand<pubL_17_13_Request, ObservableCollection<pubL_17_13_Info>> pubL_17_13_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_13_Request, ObservableCollection<pubL_17_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_13_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_查询机构信息
        /// </summary>
        public IWorkCommand<pubL_17_18_Request, ObservableCollection<pubL_17_18_Info>> pubL_17_18_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_18_Request, ObservableCollection<pubL_17_18_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_18_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_查询系统配置
        /// </summary>
        public IWorkCommand<pubL_17_32_Request, ObservableCollection<pubL_17_32_Info>> pubL_17_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_32_Request, ObservableCollection<pubL_17_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_查询机构汇率
        /// </summary>
        public IWorkCommand<pubL_17_38_Request, ObservableCollection<pubL_17_38_Info>> pubL_17_38_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_38_Request, ObservableCollection<pubL_17_38_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_38_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_上线通道
        /// </summary>
        public IWorkCommand<pubL_17_154_Request, ObservableCollection<pubL_17_154_Info>> pubL_17_154_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_154_Request, ObservableCollection<pubL_17_154_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_154_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_下线通道
        /// </summary>
        public IWorkCommand<pubL_17_155_Request, ObservableCollection<pubL_17_155_Info>> pubL_17_155_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_155_Request, ObservableCollection<pubL_17_155_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_155_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_获取港股通汇率信息
        /// </summary>
        public IWorkCommand<pubL_17_117_Request, ObservableCollection<pubL_17_117_Info>> pubL_17_117_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_117_Request, ObservableCollection<pubL_17_117_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_117_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_更新港股通额度信息
        /// </summary>
        public IWorkCommand<pubL_17_118_Request, ObservableCollection<pubL_17_118_Info>> pubL_17_118_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_118_Request, ObservableCollection<pubL_17_118_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_118_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_查询港股通额度信息
        /// </summary>
        public IWorkCommand<pubL_17_119_Request, ObservableCollection<pubL_17_119_Info>> pubL_17_119_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_119_Request, ObservableCollection<pubL_17_119_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_119_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_查询数据字典
        /// </summary>
        public IWorkCommand<pubL_17_180_Request, ObservableCollection<pubL_17_180_Info>> pubL_17_180_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_180_Request, ObservableCollection<pubL_17_180_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_180_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_查询业务标志
        /// </summary>
        public IWorkCommand<pubL_17_181_Request, ObservableCollection<pubL_17_181_Info>> pubL_17_181_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_181_Request, ObservableCollection<pubL_17_181_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_181_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_获取基础证券行情
        /// </summary>
        public IWorkCommand<pubL_17_182_Request, ObservableCollection<pubL_17_182_Info>> pubL_17_182_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_182_Request, ObservableCollection<pubL_17_182_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_182_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_获取所需港股通汇率信息
        /// </summary>
        public IWorkCommand<pubL_17_120_Request, ObservableCollection<pubL_17_120_Info>> pubL_17_120_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_120_Request, ObservableCollection<pubL_17_120_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_120_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_新增所需港股通汇率信息
        /// </summary>
        public IWorkCommand<pubL_17_121_Request, ObservableCollection<pubL_17_121_Info>> pubL_17_121_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_121_Request, ObservableCollection<pubL_17_121_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_121_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_修改所需港股通汇率信息
        /// </summary>
        public IWorkCommand<pubL_17_122_Request, ObservableCollection<pubL_17_122_Info>> pubL_17_122_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_122_Request, ObservableCollection<pubL_17_122_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_122_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_修改新股代码信息
        /// </summary>
        public IWorkCommand<pubL_17_123_Request, ObservableCollection<pubL_17_123_Info>> pubL_17_123_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_123_Request, ObservableCollection<pubL_17_123_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_123_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_修改可转债代码信息
        /// </summary>
        public IWorkCommand<pubL_17_124_Request, ObservableCollection<pubL_17_124_Info>> pubL_17_124_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_124_Request, ObservableCollection<pubL_17_124_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_124_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_新增对冲篮子信息
        /// </summary>
        public IWorkCommand<pubL_17_125_Request, ObservableCollection<pubL_17_125_Info>> pubL_17_125_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_125_Request, ObservableCollection<pubL_17_125_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_125_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_查询对冲篮子信息结果集
        /// </summary>
        public IWorkCommand<pubL_17_126_Request, ObservableCollection<pubL_17_126_Info>> pubL_17_126_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_126_Request, ObservableCollection<pubL_17_126_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_126_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_查询历史对冲篮子信息结果集
        /// </summary>
        public IWorkCommand<pubL_17_127_Request, ObservableCollection<pubL_17_127_Info>> pubL_17_127_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_127_Request, ObservableCollection<pubL_17_127_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_127_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_基础客户端_修改对冲篮子信息
        /// </summary>
        public IWorkCommand<pubL_17_128_Request, ObservableCollection<pubL_17_128_Info>> pubL_17_128_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_17_128_Request, ObservableCollection<pubL_17_128_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_17_128_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
