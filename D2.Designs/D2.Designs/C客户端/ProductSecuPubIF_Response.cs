using LdNet.ClientSdk.Model;
using LdNet.ClientCore.Sdk;
using LdNet.Communication;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using LDsdkDefineEx;

namespace LdNet.ClientSdk.Response
{
    public class pdsecuL_4_1_Response : IResponse
    {
        #region ���캯��
        public pdsecuL_4_1_Response()
        {
            this.pdsecuL_4_1_InfoList = new ObservableCollection<pdsecuL_4_1_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<pdsecuL_4_1_Info> pdsecuL_4_1_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            pdsecuL_4_1_Info info = new pdsecuL_4_1_Info();
            pdsecuL_4_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pdsecuL_4_1_InfoList.Add((pdsecuL_4_1_Info)info);
        }
        #endregion

        //�߼�_��Ʒ֤ȯ_�����ӿ�_ע��������
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pdsecuL_4_1_Info();
                pdsecuL_4_1_InfoList.Add(info);
            }
        }
    }

}
