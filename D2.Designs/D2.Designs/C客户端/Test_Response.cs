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
    public class pubL_41_1_Response : IResponse
    {
        #region ���캯��
        public pubL_41_1_Response()
        {
            this.pubL_41_1_InfoList = new ObservableCollection<pubL_41_1_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<pubL_41_1_Info> pubL_41_1_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_41_1_Info info = new pubL_41_1_Info();
            pubL_41_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_41_1_InfoList.Add((pubL_41_1_Info)info);
        }
        #endregion

        //�߼�_����_����_������ɾ�Ĳ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_41_1_Info();
                pubL_41_1_InfoList.Add(info);
            }
        }
    }

    public class pubL_41_2_Response : IResponse
    {
        #region ���캯��
        public pubL_41_2_Response()
        {
            this.pubL_41_2_InfoList = new ObservableCollection<pubL_41_2_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<pubL_41_2_Info> pubL_41_2_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_41_2_Info info = new pubL_41_2_Info();
            pubL_41_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_41_2_InfoList.Add((pubL_41_2_Info)info);
        }
        #endregion

        //�߼�_����_����_ɾȥ��ɾ�Ĳ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_41_2_Info();
                pubL_41_2_InfoList.Add(info);
            }
        }
    }

    public class pubL_41_3_Response : IResponse
    {
        #region ���캯��
        public pubL_41_3_Response()
        {
            this.pubL_41_3_InfoList = new ObservableCollection<pubL_41_3_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<pubL_41_3_Info> pubL_41_3_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_41_3_Info info = new pubL_41_3_Info();
            pubL_41_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_41_3_InfoList.Add((pubL_41_3_Info)info);
        }
        #endregion

        //�߼�_����_����_�޸���ɾ�Ĳ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_41_3_Info();
                pubL_41_3_InfoList.Add(info);
            }
        }
    }

    public class pubL_41_4_Response : IResponse
    {
        #region ���캯��
        public pubL_41_4_Response()
        {
            this.pubL_41_4_InfoList = new ObservableCollection<pubL_41_4_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<pubL_41_4_Info> pubL_41_4_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_41_4_Info info = new pubL_41_4_Info();
            pubL_41_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_41_4_InfoList.Add((pubL_41_4_Info)info);
        }
        #endregion

        //�߼�_����_����_��ѯ��ɾ�Ĳ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new pubL_41_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    pubL_41_4_InfoList.Add(info);
                }
            }
        }
    }

}
