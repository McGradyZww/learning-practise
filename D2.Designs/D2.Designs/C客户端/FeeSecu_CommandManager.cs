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
    public partial class FeeSecuCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_公共_证券费用_新增证券费用模板
        /// </summary>
        public IWorkCommand<pubL_9_11_Request, ObservableCollection<pubL_9_11_Info>> pubL_9_11_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_11_Request, ObservableCollection<pubL_9_11_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_11_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_修改证券费用模板
        /// </summary>
        public IWorkCommand<pubL_9_12_Request, ObservableCollection<pubL_9_12_Info>> pubL_9_12_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_12_Request, ObservableCollection<pubL_9_12_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_12_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_删除证券费用模板
        /// </summary>
        public IWorkCommand<pubL_9_13_Request, ObservableCollection<pubL_9_13_Info>> pubL_9_13_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_13_Request, ObservableCollection<pubL_9_13_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_13_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询证券费用模板
        /// </summary>
        public IWorkCommand<pubL_9_14_Request, ObservableCollection<pubL_9_14_Info>> pubL_9_14_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_14_Request, ObservableCollection<pubL_9_14_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_14_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询证券费用模板流水
        /// </summary>
        public IWorkCommand<pubL_9_15_Request, ObservableCollection<pubL_9_15_Info>> pubL_9_15_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_15_Request, ObservableCollection<pubL_9_15_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_15_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询历史证券费用模板流水
        /// </summary>
        public IWorkCommand<pubL_9_16_Request, ObservableCollection<pubL_9_16_Info>> pubL_9_16_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_16_Request, ObservableCollection<pubL_9_16_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_16_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_新增证券类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_9_21_Request, ObservableCollection<pubL_9_21_Info>> pubL_9_21_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_21_Request, ObservableCollection<pubL_9_21_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_21_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_修改证券类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_9_22_Request, ObservableCollection<pubL_9_22_Info>> pubL_9_22_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_22_Request, ObservableCollection<pubL_9_22_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_22_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_删除证券类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_9_23_Request, ObservableCollection<pubL_9_23_Info>> pubL_9_23_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_23_Request, ObservableCollection<pubL_9_23_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_23_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询证券类型费用模板明细
        /// </summary>
        public IWorkCommand<pubL_9_24_Request, ObservableCollection<pubL_9_24_Info>> pubL_9_24_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_24_Request, ObservableCollection<pubL_9_24_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_24_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询证券类型费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_9_25_Request, ObservableCollection<pubL_9_25_Info>> pubL_9_25_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_25_Request, ObservableCollection<pubL_9_25_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_25_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询历史证券类型费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_9_26_Request, ObservableCollection<pubL_9_26_Info>> pubL_9_26_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_26_Request, ObservableCollection<pubL_9_26_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_26_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_新增证券代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_9_31_Request, ObservableCollection<pubL_9_31_Info>> pubL_9_31_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_31_Request, ObservableCollection<pubL_9_31_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_31_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_修改证券代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_9_32_Request, ObservableCollection<pubL_9_32_Info>> pubL_9_32_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_32_Request, ObservableCollection<pubL_9_32_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_32_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_删除证券代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_9_33_Request, ObservableCollection<pubL_9_33_Info>> pubL_9_33_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_33_Request, ObservableCollection<pubL_9_33_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_33_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询证券代码费用模板明细
        /// </summary>
        public IWorkCommand<pubL_9_34_Request, ObservableCollection<pubL_9_34_Info>> pubL_9_34_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_34_Request, ObservableCollection<pubL_9_34_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_34_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询证券代码费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_9_35_Request, ObservableCollection<pubL_9_35_Info>> pubL_9_35_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_35_Request, ObservableCollection<pubL_9_35_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_35_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询历史证券代码费用模板明细流水
        /// </summary>
        public IWorkCommand<pubL_9_36_Request, ObservableCollection<pubL_9_36_Info>> pubL_9_36_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_36_Request, ObservableCollection<pubL_9_36_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_36_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_新增外部证券类型费用
        /// </summary>
        public IWorkCommand<pubL_9_81_Request, ObservableCollection<pubL_9_81_Info>> pubL_9_81_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_81_Request, ObservableCollection<pubL_9_81_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_81_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_修改外部证券类型费用
        /// </summary>
        public IWorkCommand<pubL_9_82_Request, ObservableCollection<pubL_9_82_Info>> pubL_9_82_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_82_Request, ObservableCollection<pubL_9_82_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_82_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_删除外部证券类型费用
        /// </summary>
        public IWorkCommand<pubL_9_83_Request, ObservableCollection<pubL_9_83_Info>> pubL_9_83_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_83_Request, ObservableCollection<pubL_9_83_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_83_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询外部证券类型费用
        /// </summary>
        public IWorkCommand<pubL_9_84_Request, ObservableCollection<pubL_9_84_Info>> pubL_9_84_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_84_Request, ObservableCollection<pubL_9_84_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_84_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询外部证券类型费用流水
        /// </summary>
        public IWorkCommand<pubL_9_85_Request, ObservableCollection<pubL_9_85_Info>> pubL_9_85_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_85_Request, ObservableCollection<pubL_9_85_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_85_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询历史外部证券类型费用流水
        /// </summary>
        public IWorkCommand<pubL_9_86_Request, ObservableCollection<pubL_9_86_Info>> pubL_9_86_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_86_Request, ObservableCollection<pubL_9_86_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_86_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_新增外部证券代码费用
        /// </summary>
        public IWorkCommand<pubL_9_91_Request, ObservableCollection<pubL_9_91_Info>> pubL_9_91_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_91_Request, ObservableCollection<pubL_9_91_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_91_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_修改外部证券代码费用
        /// </summary>
        public IWorkCommand<pubL_9_92_Request, ObservableCollection<pubL_9_92_Info>> pubL_9_92_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_92_Request, ObservableCollection<pubL_9_92_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_92_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_删除外部证券代码费用
        /// </summary>
        public IWorkCommand<pubL_9_93_Request, ObservableCollection<pubL_9_93_Info>> pubL_9_93_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_93_Request, ObservableCollection<pubL_9_93_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_93_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询外部证券代码费用
        /// </summary>
        public IWorkCommand<pubL_9_94_Request, ObservableCollection<pubL_9_94_Info>> pubL_9_94_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_94_Request, ObservableCollection<pubL_9_94_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_94_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询外部证券代码费用流水
        /// </summary>
        public IWorkCommand<pubL_9_95_Request, ObservableCollection<pubL_9_95_Info>> pubL_9_95_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_95_Request, ObservableCollection<pubL_9_95_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_95_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询历史外部证券代码费用流水
        /// </summary>
        public IWorkCommand<pubL_9_96_Request, ObservableCollection<pubL_9_96_Info>> pubL_9_96_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_96_Request, ObservableCollection<pubL_9_96_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_96_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_新增系统证券类型费用
        /// </summary>
        public IWorkCommand<pubL_9_101_Request, ObservableCollection<pubL_9_101_Info>> pubL_9_101_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_101_Request, ObservableCollection<pubL_9_101_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_101_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_修改系统证券类型费用
        /// </summary>
        public IWorkCommand<pubL_9_102_Request, ObservableCollection<pubL_9_102_Info>> pubL_9_102_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_102_Request, ObservableCollection<pubL_9_102_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_102_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_删除系统证券类型费用
        /// </summary>
        public IWorkCommand<pubL_9_103_Request, ObservableCollection<pubL_9_103_Info>> pubL_9_103_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_103_Request, ObservableCollection<pubL_9_103_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_103_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询系统证券类型费用
        /// </summary>
        public IWorkCommand<pubL_9_104_Request, ObservableCollection<pubL_9_104_Info>> pubL_9_104_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_104_Request, ObservableCollection<pubL_9_104_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_104_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询系统证券类型费用流水
        /// </summary>
        public IWorkCommand<pubL_9_105_Request, ObservableCollection<pubL_9_105_Info>> pubL_9_105_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_105_Request, ObservableCollection<pubL_9_105_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_105_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询历史系统证券类型费用流水
        /// </summary>
        public IWorkCommand<pubL_9_106_Request, ObservableCollection<pubL_9_106_Info>> pubL_9_106_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_106_Request, ObservableCollection<pubL_9_106_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_106_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_新增系统证券代码费用
        /// </summary>
        public IWorkCommand<pubL_9_111_Request, ObservableCollection<pubL_9_111_Info>> pubL_9_111_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_111_Request, ObservableCollection<pubL_9_111_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_111_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_修改系统证券代码费用
        /// </summary>
        public IWorkCommand<pubL_9_112_Request, ObservableCollection<pubL_9_112_Info>> pubL_9_112_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_112_Request, ObservableCollection<pubL_9_112_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_112_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_删除系统证券代码费用
        /// </summary>
        public IWorkCommand<pubL_9_113_Request, ObservableCollection<pubL_9_113_Info>> pubL_9_113_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_113_Request, ObservableCollection<pubL_9_113_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_113_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询系统证券代码费用
        /// </summary>
        public IWorkCommand<pubL_9_114_Request, ObservableCollection<pubL_9_114_Info>> pubL_9_114_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_114_Request, ObservableCollection<pubL_9_114_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_114_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询系统证券代码费用流水
        /// </summary>
        public IWorkCommand<pubL_9_115_Request, ObservableCollection<pubL_9_115_Info>> pubL_9_115_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_115_Request, ObservableCollection<pubL_9_115_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_115_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询历史系统证券代码费用流水
        /// </summary>
        public IWorkCommand<pubL_9_116_Request, ObservableCollection<pubL_9_116_Info>> pubL_9_116_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_116_Request, ObservableCollection<pubL_9_116_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_116_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_新增产品费用
        /// </summary>
        public IWorkCommand<pubL_9_161_Request, ObservableCollection<pubL_9_161_Info>> pubL_9_161_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_161_Request, ObservableCollection<pubL_9_161_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_161_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_修改产品费用
        /// </summary>
        public IWorkCommand<pubL_9_162_Request, ObservableCollection<pubL_9_162_Info>> pubL_9_162_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_162_Request, ObservableCollection<pubL_9_162_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_162_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_删除产品费用
        /// </summary>
        public IWorkCommand<pubL_9_163_Request, ObservableCollection<pubL_9_163_Info>> pubL_9_163_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_163_Request, ObservableCollection<pubL_9_163_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_163_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询产品费用
        /// </summary>
        public IWorkCommand<pubL_9_164_Request, ObservableCollection<pubL_9_164_Info>> pubL_9_164_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_164_Request, ObservableCollection<pubL_9_164_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_164_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询产品费用流水
        /// </summary>
        public IWorkCommand<pubL_9_165_Request, ObservableCollection<pubL_9_165_Info>> pubL_9_165_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_165_Request, ObservableCollection<pubL_9_165_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_165_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询历史产品费用流水
        /// </summary>
        public IWorkCommand<pubL_9_166_Request, ObservableCollection<pubL_9_166_Info>> pubL_9_166_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_166_Request, ObservableCollection<pubL_9_166_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_166_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_计算证券费用
        /// </summary>
        public IWorkCommand<pubL_9_201_Request, ObservableCollection<pubL_9_201_Info>> pubL_9_201_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_201_Request, ObservableCollection<pubL_9_201_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_201_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询费用编号
        /// </summary>
        public IWorkCommand<pubL_9_302_Request, ObservableCollection<pubL_9_302_Info>> pubL_9_302_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_9_302_Request, ObservableCollection<pubL_9_302_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_9_302_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_新增资产账户证券费用模板
        /// </summary>
        public IWorkCommand<pubL_9_303_Request, ObservableCollection<pubL_9_303_Info>> pubL_9_303_Command
        {
            get
            {
                return new WorkCommand<pubL_9_303_Request, ObservableCollection<pubL_9_303_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_9_303_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_复制证券费用模板
        /// </summary>
        public IWorkCommand<pubL_9_304_Request, ObservableCollection<pubL_9_304_Info>> pubL_9_304_Command
        {
            get
            {
                return new WorkCommand<pubL_9_304_Request, ObservableCollection<pubL_9_304_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_9_304_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_模板编号删除证券费用明细
        /// </summary>
        public IWorkCommand<pubL_9_305_Request, ObservableCollection<pubL_9_305_Info>> pubL_9_305_Command
        {
            get
            {
                return new WorkCommand<pubL_9_305_Request, ObservableCollection<pubL_9_305_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_9_305_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_修改资产账户证券费用模板
        /// </summary>
        public IWorkCommand<pubL_9_306_Request, ObservableCollection<pubL_9_306_Info>> pubL_9_306_Command
        {
            get
            {
                return new WorkCommand<pubL_9_306_Request, ObservableCollection<pubL_9_306_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_9_306_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_删除资产账户证券费用模板
        /// </summary>
        public IWorkCommand<pubL_9_307_Request, ObservableCollection<pubL_9_307_Info>> pubL_9_307_Command
        {
            get
            {
                return new WorkCommand<pubL_9_307_Request, ObservableCollection<pubL_9_307_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_9_307_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_证券费用_查询资产账户证券费用模板
        /// </summary>
        public IWorkCommand<pubL_9_308_Request, ObservableCollection<pubL_9_308_Info>> pubL_9_308_Command
        {
            get
            {
                return new WorkCommand<pubL_9_308_Request, ObservableCollection<pubL_9_308_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_9_308_InfoList;
                });
            }
        }

    }
}
