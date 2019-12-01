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
    public class rptL_1_1_Response : IResponse
    {
        #region ���캯��
        public rptL_1_1_Response()
        {
            this.rptL_1_1_InfoList = new ObservableCollection<rptL_1_1_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<rptL_1_1_Info> rptL_1_1_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_1_1_Info info = new rptL_1_1_Info();
            rptL_1_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_1_1_InfoList.Add((rptL_1_1_Info)info);
        }
        #endregion

        //�߼�_����_�������_��ʼ���г���ʼ����ʱ����
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_1_1_Info();
                rptL_1_1_InfoList.Add(info);
            }
        }
    }

    public class rptL_1_2_Response : IResponse
    {
        #region ���캯��
        public rptL_1_2_Response()
        {
            this.rptL_1_2_InfoList = new ObservableCollection<rptL_1_2_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<rptL_1_2_Info> rptL_1_2_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_1_2_Info info = new rptL_1_2_Info();
            rptL_1_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_1_2_InfoList.Add((rptL_1_2_Info)info);
        }
        #endregion

        //�߼�_����_�������_��ʼ��ϵͳ��ʼ����ʱ����
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_1_2_Info();
                rptL_1_2_InfoList.Add(info);
            }
        }
    }

    public class rptL_1_3_Response : IResponse
    {
        #region ���캯��
        public rptL_1_3_Response()
        {
            this.rptL_1_3_InfoList = new ObservableCollection<rptL_1_3_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<rptL_1_3_Info> rptL_1_3_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_1_3_Info info = new rptL_1_3_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.last_init_date = unpacker.GetInt("last_init_date");
            info.next_init_date = unpacker.GetInt("next_init_date");
            rptL_1_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_1_3_InfoList.Add((rptL_1_3_Info)info);
        }
        #endregion

        //�߼�_����_�������_��ѯϵͳ��ʼ������
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_1_3_Info();
                info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                info.last_init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_INIT_DATE_INT);
                info.next_init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NEXT_INIT_DATE_INT);
                rptL_1_3_InfoList.Add(info);
            }
        }
    }

    public class rptL_1_21_Response : IResponse
    {
        #region ���캯��
        public rptL_1_21_Response()
        {
            this.rptL_1_21_InfoList = new ObservableCollection<rptL_1_21_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<rptL_1_21_Info> rptL_1_21_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_1_21_Info info = new rptL_1_21_Info();
            rptL_1_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_1_21_InfoList.Add((rptL_1_21_Info)info);
        }
        #endregion

        //�߼�_����_�������_���������������ֿ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_1_21_Info();
                rptL_1_21_InfoList.Add(info);
            }
        }
    }

    public class rptL_1_22_Response : IResponse
    {
        #region ���캯��
        public rptL_1_22_Response()
        {
            this.rptL_1_22_InfoList = new ObservableCollection<rptL_1_22_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<rptL_1_22_Info> rptL_1_22_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_1_22_Info info = new rptL_1_22_Info();
            rptL_1_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_1_22_InfoList.Add((rptL_1_22_Info)info);
        }
        #endregion

        //�߼�_����_�������_�޸Ļ����������ֿ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_1_22_Info();
                rptL_1_22_InfoList.Add(info);
            }
        }
    }

    public class rptL_1_23_Response : IResponse
    {
        #region ���캯��
        public rptL_1_23_Response()
        {
            this.rptL_1_23_InfoList = new ObservableCollection<rptL_1_23_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<rptL_1_23_Info> rptL_1_23_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_1_23_Info info = new rptL_1_23_Info();
            rptL_1_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_1_23_InfoList.Add((rptL_1_23_Info)info);
        }
        #endregion

        //�߼�_����_�������_ִ�л����������ֿ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_1_23_Info();
                rptL_1_23_InfoList.Add(info);
            }
        }
    }

    public class rptL_1_25_Response : IResponse
    {
        #region ���캯��
        public rptL_1_25_Response()
        {
            this.rptL_1_25_InfoList = new ObservableCollection<rptL_1_25_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<rptL_1_25_Info> rptL_1_25_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_1_25_Info info = new rptL_1_25_Info();
            rptL_1_25_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_1_25_InfoList.Add((rptL_1_25_Info)info);
        }
        #endregion

        //�߼�_����_�������_������������ִ������
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_1_25_Info();
                rptL_1_25_InfoList.Add(info);
            }
        }
    }

    public class rptL_1_27_Response : IResponse
    {
        #region ���캯��
        public rptL_1_27_Response()
        {
            this.rptL_1_27_InfoList = new ObservableCollection<rptL_1_27_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<rptL_1_27_Info> rptL_1_27_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_1_27_Info info = new rptL_1_27_Info();
            rptL_1_27_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_1_27_InfoList.Add((rptL_1_27_Info)info);
        }
        #endregion

        //�߼�_����_�������_����ִ�����ִ����
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_1_27_Info();
                rptL_1_27_InfoList.Add(info);
            }
        }
    }

    public class rptL_1_30_Response : IResponse
    {
        #region ���캯��
        public rptL_1_30_Response()
        {
            this.rptL_1_30_InfoList = new ObservableCollection<rptL_1_30_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<rptL_1_30_Info> rptL_1_30_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_1_30_Info info = new rptL_1_30_Info();
            rptL_1_30_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_1_30_InfoList.Add((rptL_1_30_Info)info);
        }
        #endregion

        //�߼�_����_�������_ִ�����ִ����
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_1_30_Info();
                rptL_1_30_InfoList.Add(info);
            }
        }
    }

}
