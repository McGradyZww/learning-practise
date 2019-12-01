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
    public class dcsyncL_6_12_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_6_12_Response()
        {
            this.dcsyncL_6_12_InfoList = new ObservableCollection<dcsyncL_6_12_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_6_12_Info> dcsyncL_6_12_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_6_12_Info info = new dcsyncL_6_12_Info();
            dcsyncL_6_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_6_12_InfoList.Add((dcsyncL_6_12_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_�����ڻ�ͬ��_ͬ��������ҵ���ʽ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_6_12_Info();
                dcsyncL_6_12_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_6_13_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_6_13_Response()
        {
            this.dcsyncL_6_13_InfoList = new ObservableCollection<dcsyncL_6_13_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_6_13_Info> dcsyncL_6_13_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_6_13_Info info = new dcsyncL_6_13_Info();
            dcsyncL_6_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_6_13_InfoList.Add((dcsyncL_6_13_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_�����ڻ�ͬ��_ͬ���ʲ��˻�ҵ���ʽ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_6_13_Info();
                dcsyncL_6_13_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_6_14_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_6_14_Response()
        {
            this.dcsyncL_6_14_InfoList = new ObservableCollection<dcsyncL_6_14_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_6_14_Info> dcsyncL_6_14_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_6_14_Info info = new dcsyncL_6_14_Info();
            dcsyncL_6_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_6_14_InfoList.Add((dcsyncL_6_14_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_�����ڻ�ͬ��_ͬ��������ҵ��ֱֲ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_6_14_Info();
                dcsyncL_6_14_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_6_15_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_6_15_Response()
        {
            this.dcsyncL_6_15_InfoList = new ObservableCollection<dcsyncL_6_15_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_6_15_Info> dcsyncL_6_15_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_6_15_Info info = new dcsyncL_6_15_Info();
            dcsyncL_6_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_6_15_InfoList.Add((dcsyncL_6_15_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_�����ڻ�ͬ��_ͬ���ʲ��˻�ҵ��ֱֲ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_6_15_Info();
                dcsyncL_6_15_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_6_16_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_6_16_Response()
        {
            this.dcsyncL_6_16_InfoList = new ObservableCollection<dcsyncL_6_16_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_6_16_Info> dcsyncL_6_16_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_6_16_Info info = new dcsyncL_6_16_Info();
            dcsyncL_6_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_6_16_InfoList.Add((dcsyncL_6_16_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_�����ڻ�ͬ��_ͬ��������ֲ���ϸ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_6_16_Info();
                dcsyncL_6_16_InfoList.Add(info);
            }
        }
    }

}
