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
    public partial class ProductSecuPubIFCommandManager : BaseCommand
    {

        /// <summary>
        /// �߼�_��Ʒ֤ȯ_�����ӿ�_ע��������
        /// </summary>
        public IWorkCommand<pdsecuL_4_1_Request, ObservableCollection<pdsecuL_4_1_Info>> pdsecuL_4_1_Command
        {
            get
            {
                var WorkCommand = new WorkCommand<pdsecuL_4_1_Request, ObservableCollection<pdsecuL_4_1_Info>>((o) =>
                {
                    return ApiInstance.Execute(o, TimeOut).pdsecuL_4_1_InfoList;
                });
                SetTimeOut();
                return WorkCommand;
            }
        }

    }
}
