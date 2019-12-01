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
    public class clfutuL_1_21_Response : IResponse
    {
        #region ���캯��
        public clfutuL_1_21_Response()
        {
            this.clfutuL_1_21_InfoList = new ObservableCollection<clfutuL_1_21_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<clfutuL_1_21_Info> clfutuL_1_21_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_1_21_Info info = new clfutuL_1_21_Info();
            clfutuL_1_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_1_21_InfoList.Add((clfutuL_1_21_Info)info);
        }
        #endregion

        //�߼�_�����ڻ�_����_���ݹ���ʷ
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_1_21_Info();
                clfutuL_1_21_InfoList.Add(info);
            }
        }
    }

}
