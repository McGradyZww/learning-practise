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
    public partial class TestCommandManager : BaseCommand
    {

        /// <summary>
        /// 逻辑_公共_测试_新增增删改查表
        /// </summary>
        public IWorkCommand<pubL_41_1_Request, ObservableCollection<pubL_41_1_Info>> pubL_41_1_Command
        {
            get
            {
                return new WorkCommand<pubL_41_1_Request, ObservableCollection<pubL_41_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_41_1_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_测试_删去增删改查表
        /// </summary>
        public IWorkCommand<pubL_41_2_Request, ObservableCollection<pubL_41_2_Info>> pubL_41_2_Command
        {
            get
            {
                return new WorkCommand<pubL_41_2_Request, ObservableCollection<pubL_41_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_41_2_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_测试_修改增删改查表
        /// </summary>
        public IWorkCommand<pubL_41_3_Request, ObservableCollection<pubL_41_3_Info>> pubL_41_3_Command
        {
            get
            {
                return new WorkCommand<pubL_41_3_Request, ObservableCollection<pubL_41_3_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_41_3_InfoList;
                });
            }
        }


        /// <summary>
        /// 逻辑_公共_测试_查询增删改查表
        /// </summary>
        public IWorkCommand<pubL_41_4_Request, ObservableCollection<pubL_41_4_Info>> pubL_41_4_Command
        {
            get
            {
                return new WorkCommand<pubL_41_4_Request, ObservableCollection<pubL_41_4_Info>>((o) =>
                {
                    return ApiInstance.Execute(o).pubL_41_4_InfoList;
                });
            }
        }

    }
}
