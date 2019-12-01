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
    public partial class PublicIFCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_����_�����ӿ�_��ȡ��һ��������
        /// </summary>
        public IWorkCommand<pubL_24_1_Request, ObservableCollection<pubL_24_1_Info>> pubL_24_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_24_1_Request, ObservableCollection<pubL_24_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_24_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }


        /// <summary>
        /// �߼�_����_�����ӿ�_��ȡ����Ա����Ȩ�޴�
        /// </summary>
        public IWorkCommand<pubL_24_2_Request, ObservableCollection<pubL_24_2_Info>> pubL_24_2_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pubL_24_2_Request, ObservableCollection<pubL_24_2_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pubL_24_2_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
