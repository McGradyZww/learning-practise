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
    public class dcsyncL_3_11_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_11_Response()
        {
            this.dcsyncL_3_11_InfoList = new ObservableCollection<dcsyncL_3_11_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_11_Info> dcsyncL_3_11_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_11_Info info = new dcsyncL_3_11_Info();
            dcsyncL_3_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_11_InfoList.Add((dcsyncL_3_11_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ���ʲ��˻��ֲ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_11_Info();
                dcsyncL_3_11_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_3_12_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_12_Response()
        {
            this.dcsyncL_3_12_InfoList = new ObservableCollection<dcsyncL_3_12_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_12_Info> dcsyncL_3_12_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_12_Info info = new dcsyncL_3_12_Info();
            dcsyncL_3_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_12_InfoList.Add((dcsyncL_3_12_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ���ʲ��˻��ʲ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_12_Info();
                dcsyncL_3_12_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_3_13_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_13_Response()
        {
            this.dcsyncL_3_13_InfoList = new ObservableCollection<dcsyncL_3_13_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_13_Info> dcsyncL_3_13_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_13_Info info = new dcsyncL_3_13_Info();
            dcsyncL_3_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_13_InfoList.Add((dcsyncL_3_13_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ��֤ȯ�˻���Ϣ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_13_Info();
                dcsyncL_3_13_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_3_14_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_14_Response()
        {
            this.dcsyncL_3_14_InfoList = new ObservableCollection<dcsyncL_3_14_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_14_Info> dcsyncL_3_14_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_14_Info info = new dcsyncL_3_14_Info();
            dcsyncL_3_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_14_InfoList.Add((dcsyncL_3_14_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ���������ʽ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_14_Info();
                dcsyncL_3_14_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_3_15_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_15_Response()
        {
            this.dcsyncL_3_15_InfoList = new ObservableCollection<dcsyncL_3_15_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_15_Info> dcsyncL_3_15_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_15_Info info = new dcsyncL_3_15_Info();
            dcsyncL_3_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_15_InfoList.Add((dcsyncL_3_15_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ���������ʲ���
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_15_Info();
                dcsyncL_3_15_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_3_16_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_16_Response()
        {
            this.dcsyncL_3_16_InfoList = new ObservableCollection<dcsyncL_3_16_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_16_Info> dcsyncL_3_16_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_16_Info info = new dcsyncL_3_16_Info();
            dcsyncL_3_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_16_InfoList.Add((dcsyncL_3_16_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ���ʲ��˻��ʽ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_16_Info();
                dcsyncL_3_16_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_3_17_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_17_Response()
        {
            this.dcsyncL_3_17_InfoList = new ObservableCollection<dcsyncL_3_17_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_17_Info> dcsyncL_3_17_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_17_Info info = new dcsyncL_3_17_Info();
            dcsyncL_3_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_17_InfoList.Add((dcsyncL_3_17_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ���ⲿ�ʲ��˻��ʽ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_17_Info();
                dcsyncL_3_17_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_3_18_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_18_Response()
        {
            this.dcsyncL_3_18_InfoList = new ObservableCollection<dcsyncL_3_18_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_18_Info> dcsyncL_3_18_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_18_Info info = new dcsyncL_3_18_Info();
            dcsyncL_3_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_18_InfoList.Add((dcsyncL_3_18_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ����ֵ�ⲿ�ʲ��˻��ʽ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_18_Info();
                dcsyncL_3_18_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_3_19_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_19_Response()
        {
            this.dcsyncL_3_19_InfoList = new ObservableCollection<dcsyncL_3_19_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_19_Info> dcsyncL_3_19_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_19_Info info = new dcsyncL_3_19_Info();
            dcsyncL_3_19_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_19_InfoList.Add((dcsyncL_3_19_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ��������ֱֲ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_19_Info();
                dcsyncL_3_19_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_3_20_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_20_Response()
        {
            this.dcsyncL_3_20_InfoList = new ObservableCollection<dcsyncL_3_20_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_20_Info> dcsyncL_3_20_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_20_Info info = new dcsyncL_3_20_Info();
            dcsyncL_3_20_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_20_InfoList.Add((dcsyncL_3_20_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ��������ծȯ��Ѻ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_20_Info();
                dcsyncL_3_20_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_3_21_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_21_Response()
        {
            this.dcsyncL_3_21_InfoList = new ObservableCollection<dcsyncL_3_21_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_21_Info> dcsyncL_3_21_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_21_Info info = new dcsyncL_3_21_Info();
            dcsyncL_3_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_21_InfoList.Add((dcsyncL_3_21_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ���ʲ��˻��ֱֲ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_21_Info();
                dcsyncL_3_21_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_3_22_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_22_Response()
        {
            this.dcsyncL_3_22_InfoList = new ObservableCollection<dcsyncL_3_22_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_22_Info> dcsyncL_3_22_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_22_Info info = new dcsyncL_3_22_Info();
            dcsyncL_3_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_22_InfoList.Add((dcsyncL_3_22_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ���ʲ��˻�ծȯ��Ѻ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_22_Info();
                dcsyncL_3_22_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_3_23_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_23_Response()
        {
            this.dcsyncL_3_23_InfoList = new ObservableCollection<dcsyncL_3_23_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_23_Info> dcsyncL_3_23_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_23_Info info = new dcsyncL_3_23_Info();
            dcsyncL_3_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_23_InfoList.Add((dcsyncL_3_23_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ��ծȯ�ع���
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_23_Info();
                dcsyncL_3_23_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_3_24_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_24_Response()
        {
            this.dcsyncL_3_24_InfoList = new ObservableCollection<dcsyncL_3_24_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_24_Info> dcsyncL_3_24_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_24_Info info = new dcsyncL_3_24_Info();
            dcsyncL_3_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_24_InfoList.Add((dcsyncL_3_24_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ���ⲿ�ʲ��˻��ֱֲ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_24_Info();
                dcsyncL_3_24_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_3_25_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_25_Response()
        {
            this.dcsyncL_3_25_InfoList = new ObservableCollection<dcsyncL_3_25_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_25_Info> dcsyncL_3_25_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_25_Info info = new dcsyncL_3_25_Info();
            dcsyncL_3_25_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_25_InfoList.Add((dcsyncL_3_25_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ����ֵ�ⲿ�ʲ��˻��ֱֲ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_25_Info();
                dcsyncL_3_25_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_3_26_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_3_26_Response()
        {
            this.dcsyncL_3_26_InfoList = new ObservableCollection<dcsyncL_3_26_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_3_26_Info> dcsyncL_3_26_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_3_26_Info info = new dcsyncL_3_26_Info();
            dcsyncL_3_26_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_3_26_InfoList.Add((dcsyncL_3_26_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_��Ʒ֤ȯͬ��_ͬ�����ڽ��׳ֱֲ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_3_26_Info();
                dcsyncL_3_26_InfoList.Add(info);
            }
        }
    }

}
