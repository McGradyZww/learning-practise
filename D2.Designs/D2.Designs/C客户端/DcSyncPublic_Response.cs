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
    public class dcsyncL_1_11_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_11_Response()
        {
            this.dcsyncL_1_11_InfoList = new ObservableCollection<dcsyncL_1_11_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_11_Info> dcsyncL_1_11_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_11_Info info = new dcsyncL_1_11_Info();
            dcsyncL_1_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_11_InfoList.Add((dcsyncL_1_11_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ��֤ȯģ���
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_11_Info();
                dcsyncL_1_11_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_12_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_12_Response()
        {
            this.dcsyncL_1_12_InfoList = new ObservableCollection<dcsyncL_1_12_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_12_Info> dcsyncL_1_12_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_12_Info info = new dcsyncL_1_12_Info();
            dcsyncL_1_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_12_InfoList.Add((dcsyncL_1_12_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ��֤ȯ���ͱ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_12_Info();
                dcsyncL_1_12_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_13_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_13_Response()
        {
            this.dcsyncL_1_13_InfoList = new ObservableCollection<dcsyncL_1_13_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_13_Info> dcsyncL_1_13_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_13_Info info = new dcsyncL_1_13_Info();
            dcsyncL_1_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_13_InfoList.Add((dcsyncL_1_13_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ��֤ȯ���Ͷ��������
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_13_Info();
                dcsyncL_1_13_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_14_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_14_Response()
        {
            this.dcsyncL_1_14_InfoList = new ObservableCollection<dcsyncL_1_14_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_14_Info> dcsyncL_1_14_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_14_Info info = new dcsyncL_1_14_Info();
            dcsyncL_1_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_14_InfoList.Add((dcsyncL_1_14_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ��֤ȯ������Ϣ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_14_Info();
                dcsyncL_1_14_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_15_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_15_Response()
        {
            this.dcsyncL_1_15_InfoList = new ObservableCollection<dcsyncL_1_15_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_15_Info> dcsyncL_1_15_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_15_Info info = new dcsyncL_1_15_Info();
            dcsyncL_1_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_15_InfoList.Add((dcsyncL_1_15_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ��֤ȯ�����
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_15_Info();
                dcsyncL_1_15_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_16_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_16_Response()
        {
            this.dcsyncL_1_16_InfoList = new ObservableCollection<dcsyncL_1_16_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_16_Info> dcsyncL_1_16_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_16_Info info = new dcsyncL_1_16_Info();
            dcsyncL_1_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_16_InfoList.Add((dcsyncL_1_16_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ��ծȯ������Ϣ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_16_Info();
                dcsyncL_1_16_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_17_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_17_Response()
        {
            this.dcsyncL_1_17_InfoList = new ObservableCollection<dcsyncL_1_17_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_17_Info> dcsyncL_1_17_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_17_Info info = new dcsyncL_1_17_Info();
            dcsyncL_1_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_17_InfoList.Add((dcsyncL_1_17_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ��ϵͳ��Ϣ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_17_Info();
                dcsyncL_1_17_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_18_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_18_Response()
        {
            this.dcsyncL_1_18_InfoList = new ObservableCollection<dcsyncL_1_18_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_18_Info> dcsyncL_1_18_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_18_Info info = new dcsyncL_1_18_Info();
            dcsyncL_1_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_18_InfoList.Add((dcsyncL_1_18_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ��������Ϣ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_18_Info();
                dcsyncL_1_18_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_19_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_19_Response()
        {
            this.dcsyncL_1_19_InfoList = new ObservableCollection<dcsyncL_1_19_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_19_Info> dcsyncL_1_19_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_19_Info info = new dcsyncL_1_19_Info();
            dcsyncL_1_19_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_19_InfoList.Add((dcsyncL_1_19_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ���г�ҵ���¼��ű�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_19_Info();
                dcsyncL_1_19_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_20_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_20_Response()
        {
            this.dcsyncL_1_20_InfoList = new ObservableCollection<dcsyncL_1_20_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_20_Info> dcsyncL_1_20_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_20_Info info = new dcsyncL_1_20_Info();
            dcsyncL_1_20_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_20_InfoList.Add((dcsyncL_1_20_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ�������ֵ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_20_Info();
                dcsyncL_1_20_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_21_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_21_Response()
        {
            this.dcsyncL_1_21_InfoList = new ObservableCollection<dcsyncL_1_21_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_21_Info> dcsyncL_1_21_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_21_Info info = new dcsyncL_1_21_Info();
            dcsyncL_1_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_21_InfoList.Add((dcsyncL_1_21_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ���۹�ͨ���ʱ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_21_Info();
                dcsyncL_1_21_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_22_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_22_Response()
        {
            this.dcsyncL_1_22_InfoList = new ObservableCollection<dcsyncL_1_22_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_22_Info> dcsyncL_1_22_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_22_Info info = new dcsyncL_1_22_Info();
            dcsyncL_1_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_22_InfoList.Add((dcsyncL_1_22_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ������Ա��Ϣ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_22_Info();
                dcsyncL_1_22_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_23_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_23_Response()
        {
            this.dcsyncL_1_23_InfoList = new ObservableCollection<dcsyncL_1_23_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_23_Info> dcsyncL_1_23_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_23_Info info = new dcsyncL_1_23_Info();
            dcsyncL_1_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_23_InfoList.Add((dcsyncL_1_23_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ������Ա�ɲ���������
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_23_Info();
                dcsyncL_1_23_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_24_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_24_Response()
        {
            this.dcsyncL_1_24_InfoList = new ObservableCollection<dcsyncL_1_24_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_24_Info> dcsyncL_1_24_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_24_Info info = new dcsyncL_1_24_Info();
            dcsyncL_1_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_24_InfoList.Add((dcsyncL_1_24_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ������Ա�ɲ�����Ʒ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_24_Info();
                dcsyncL_1_24_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_25_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_25_Response()
        {
            this.dcsyncL_1_25_InfoList = new ObservableCollection<dcsyncL_1_25_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_25_Info> dcsyncL_1_25_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_25_Info info = new dcsyncL_1_25_Info();
            dcsyncL_1_25_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_25_InfoList.Add((dcsyncL_1_25_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ����������Ϣ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_25_Info();
                dcsyncL_1_25_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_26_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_26_Response()
        {
            this.dcsyncL_1_26_InfoList = new ObservableCollection<dcsyncL_1_26_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_26_Info> dcsyncL_1_26_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_26_Info info = new dcsyncL_1_26_Info();
            dcsyncL_1_26_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_26_InfoList.Add((dcsyncL_1_26_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ���������ʲ���
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_26_Info();
                dcsyncL_1_26_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_27_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_27_Response()
        {
            this.dcsyncL_1_27_InfoList = new ObservableCollection<dcsyncL_1_27_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_27_Info> dcsyncL_1_27_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_27_Info info = new dcsyncL_1_27_Info();
            dcsyncL_1_27_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_27_InfoList.Add((dcsyncL_1_27_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ������Ա�����������
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_27_Info();
                dcsyncL_1_27_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_1_28_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_1_28_Response()
        {
            this.dcsyncL_1_28_InfoList = new ObservableCollection<dcsyncL_1_28_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_1_28_Info> dcsyncL_1_28_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_1_28_Info info = new dcsyncL_1_28_Info();
            dcsyncL_1_28_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_1_28_InfoList.Add((dcsyncL_1_28_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����ͬ��_ͬ���ڻ������
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_1_28_Info();
                dcsyncL_1_28_InfoList.Add(info);
            }
        }
    }

}
