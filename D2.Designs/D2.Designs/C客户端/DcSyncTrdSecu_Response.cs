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
    public class dcsyncL_5_12_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_12_Response()
        {
            this.dcsyncL_5_12_InfoList = new ObservableCollection<dcsyncL_5_12_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_12_Info> dcsyncL_5_12_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_12_Info info = new dcsyncL_5_12_Info();
            dcsyncL_5_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_12_InfoList.Add((dcsyncL_5_12_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ��������ҵ���ʽ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_12_Info();
                dcsyncL_5_12_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_13_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_13_Response()
        {
            this.dcsyncL_5_13_InfoList = new ObservableCollection<dcsyncL_5_13_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_13_Info> dcsyncL_5_13_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_13_Info info = new dcsyncL_5_13_Info();
            dcsyncL_5_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_13_InfoList.Add((dcsyncL_5_13_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ���ʲ��˻�ҵ���ʽ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_13_Info();
                dcsyncL_5_13_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_14_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_14_Response()
        {
            this.dcsyncL_5_14_InfoList = new ObservableCollection<dcsyncL_5_14_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_14_Info> dcsyncL_5_14_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_14_Info info = new dcsyncL_5_14_Info();
            dcsyncL_5_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_14_InfoList.Add((dcsyncL_5_14_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ��������ҵ��ֱֲ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_14_Info();
                dcsyncL_5_14_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_15_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_15_Response()
        {
            this.dcsyncL_5_15_InfoList = new ObservableCollection<dcsyncL_5_15_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_15_Info> dcsyncL_5_15_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_15_Info info = new dcsyncL_5_15_Info();
            dcsyncL_5_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_15_InfoList.Add((dcsyncL_5_15_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ���ʲ��˻�ҵ��ֱֲ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_15_Info();
                dcsyncL_5_15_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_16_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_16_Response()
        {
            this.dcsyncL_5_16_InfoList = new ObservableCollection<dcsyncL_5_16_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_16_Info> dcsyncL_5_16_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_16_Info info = new dcsyncL_5_16_Info();
            dcsyncL_5_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_16_InfoList.Add((dcsyncL_5_16_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ��������ծȯ��Ѻ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_16_Info();
                dcsyncL_5_16_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_17_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_17_Response()
        {
            this.dcsyncL_5_17_InfoList = new ObservableCollection<dcsyncL_5_17_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_17_Info> dcsyncL_5_17_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_17_Info info = new dcsyncL_5_17_Info();
            dcsyncL_5_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_17_InfoList.Add((dcsyncL_5_17_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ���ʲ��˻�ծȯ��Ѻ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_17_Info();
                dcsyncL_5_17_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_18_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_18_Response()
        {
            this.dcsyncL_5_18_InfoList = new ObservableCollection<dcsyncL_5_18_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_18_Info> dcsyncL_5_18_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_18_Info info = new dcsyncL_5_18_Info();
            dcsyncL_5_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_18_InfoList.Add((dcsyncL_5_18_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ��ָ���
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_18_Info();
                dcsyncL_5_18_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_19_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_19_Response()
        {
            this.dcsyncL_5_19_InfoList = new ObservableCollection<dcsyncL_5_19_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_19_Info> dcsyncL_5_19_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_19_Info info = new dcsyncL_5_19_Info();
            dcsyncL_5_19_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_19_InfoList.Add((dcsyncL_5_19_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ��ָ����ˮ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_19_Info();
                dcsyncL_5_19_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_20_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_20_Response()
        {
            this.dcsyncL_5_20_InfoList = new ObservableCollection<dcsyncL_5_20_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_20_Info> dcsyncL_5_20_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_20_Info info = new dcsyncL_5_20_Info();
            dcsyncL_5_20_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_20_InfoList.Add((dcsyncL_5_20_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ��ָ��ַ���
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_20_Info();
                dcsyncL_5_20_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_21_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_21_Response()
        {
            this.dcsyncL_5_21_InfoList = new ObservableCollection<dcsyncL_5_21_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_21_Info> dcsyncL_5_21_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_21_Info info = new dcsyncL_5_21_Info();
            dcsyncL_5_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_21_InfoList.Add((dcsyncL_5_21_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ��ָ��������
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_21_Info();
                dcsyncL_5_21_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_22_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_22_Response()
        {
            this.dcsyncL_5_22_InfoList = new ObservableCollection<dcsyncL_5_22_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_22_Info> dcsyncL_5_22_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_22_Info info = new dcsyncL_5_22_Info();
            dcsyncL_5_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_22_InfoList.Add((dcsyncL_5_22_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ��������
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_22_Info();
                dcsyncL_5_22_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_23_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_23_Response()
        {
            this.dcsyncL_5_23_InfoList = new ObservableCollection<dcsyncL_5_23_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_23_Info> dcsyncL_5_23_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_23_Info info = new dcsyncL_5_23_Info();
            dcsyncL_5_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_23_InfoList.Add((dcsyncL_5_23_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ��ͨ��������
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_23_Info();
                dcsyncL_5_23_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_24_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_24_Response()
        {
            this.dcsyncL_5_24_InfoList = new ObservableCollection<dcsyncL_5_24_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_24_Info> dcsyncL_5_24_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_24_Info info = new dcsyncL_5_24_Info();
            dcsyncL_5_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_24_InfoList.Add((dcsyncL_5_24_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ���¹��깺��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_24_Info();
                dcsyncL_5_24_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_25_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_25_Response()
        {
            this.dcsyncL_5_25_InfoList = new ObservableCollection<dcsyncL_5_25_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_25_Info> dcsyncL_5_25_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_25_Info info = new dcsyncL_5_25_Info();
            dcsyncL_5_25_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_25_InfoList.Add((dcsyncL_5_25_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ��������
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_25_Info();
                dcsyncL_5_25_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_26_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_26_Response()
        {
            this.dcsyncL_5_26_InfoList = new ObservableCollection<dcsyncL_5_26_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_26_Info> dcsyncL_5_26_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_26_Info info = new dcsyncL_5_26_Info();
            dcsyncL_5_26_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_26_InfoList.Add((dcsyncL_5_26_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ��Ԥ�񶩵���
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_26_Info();
                dcsyncL_5_26_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_27_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_27_Response()
        {
            this.dcsyncL_5_27_InfoList = new ObservableCollection<dcsyncL_5_27_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_27_Info> dcsyncL_5_27_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_27_Info info = new dcsyncL_5_27_Info();
            dcsyncL_5_27_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_27_InfoList.Add((dcsyncL_5_27_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ�����Ӷ�����
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_27_Info();
                dcsyncL_5_27_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_28_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_28_Response()
        {
            this.dcsyncL_5_28_InfoList = new ObservableCollection<dcsyncL_5_28_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_28_Info> dcsyncL_5_28_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_28_Info info = new dcsyncL_5_28_Info();
            dcsyncL_5_28_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_28_InfoList.Add((dcsyncL_5_28_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ���ĵ���
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_28_Info();
                dcsyncL_5_28_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_29_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_29_Response()
        {
            this.dcsyncL_5_29_InfoList = new ObservableCollection<dcsyncL_5_29_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_29_Info> dcsyncL_5_29_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_29_Info info = new dcsyncL_5_29_Info();
            dcsyncL_5_29_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_29_InfoList.Add((dcsyncL_5_29_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ����ִ�ж�����
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_29_Info();
                dcsyncL_5_29_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_30_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_30_Response()
        {
            this.dcsyncL_5_30_InfoList = new ObservableCollection<dcsyncL_5_30_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_30_Info> dcsyncL_5_30_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_30_Info info = new dcsyncL_5_30_Info();
            dcsyncL_5_30_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_30_InfoList.Add((dcsyncL_5_30_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ�������ر���
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_30_Info();
                dcsyncL_5_30_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_31_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_31_Response()
        {
            this.dcsyncL_5_31_InfoList = new ObservableCollection<dcsyncL_5_31_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_31_Info> dcsyncL_5_31_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_31_Info info = new dcsyncL_5_31_Info();
            dcsyncL_5_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_31_InfoList.Add((dcsyncL_5_31_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ���ɽ��ر���
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_31_Info();
                dcsyncL_5_31_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_32_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_32_Response()
        {
            this.dcsyncL_5_32_InfoList = new ObservableCollection<dcsyncL_5_32_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_32_Info> dcsyncL_5_32_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_32_Info info = new dcsyncL_5_32_Info();
            dcsyncL_5_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_32_InfoList.Add((dcsyncL_5_32_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ���ɽ���
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_32_Info();
                dcsyncL_5_32_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_33_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_33_Response()
        {
            this.dcsyncL_5_33_InfoList = new ObservableCollection<dcsyncL_5_33_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_33_Info> dcsyncL_5_33_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_33_Info info = new dcsyncL_5_33_Info();
            dcsyncL_5_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_33_InfoList.Add((dcsyncL_5_33_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ������Ա��ֵ���ñ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_33_Info();
                dcsyncL_5_33_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_34_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_34_Response()
        {
            this.dcsyncL_5_34_InfoList = new ObservableCollection<dcsyncL_5_34_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_34_Info> dcsyncL_5_34_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_34_Info info = new dcsyncL_5_34_Info();
            dcsyncL_5_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_34_InfoList.Add((dcsyncL_5_34_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ������Ա�������ñ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_34_Info();
                dcsyncL_5_34_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_35_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_35_Response()
        {
            this.dcsyncL_5_35_InfoList = new ObservableCollection<dcsyncL_5_35_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_35_Info> dcsyncL_5_35_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_35_Info info = new dcsyncL_5_35_Info();
            dcsyncL_5_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_35_InfoList.Add((dcsyncL_5_35_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ��֤ȯ�ֲ���ϸ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_35_Info();
                dcsyncL_5_35_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_36_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_36_Response()
        {
            this.dcsyncL_5_36_InfoList = new ObservableCollection<dcsyncL_5_36_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_36_Info> dcsyncL_5_36_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_36_Info info = new dcsyncL_5_36_Info();
            dcsyncL_5_36_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_36_InfoList.Add((dcsyncL_5_36_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ��֤ȯƽ�ֳɽ���ϸ��
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_36_Info();
                dcsyncL_5_36_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_37_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_37_Response()
        {
            this.dcsyncL_5_37_InfoList = new ObservableCollection<dcsyncL_5_37_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_37_Info> dcsyncL_5_37_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_37_Info info = new dcsyncL_5_37_Info();
            dcsyncL_5_37_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_37_InfoList.Add((dcsyncL_5_37_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ������ԱȯԴ���ñ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_37_Info();
                dcsyncL_5_37_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_5_38_Response : IResponse
    {
        #region ���캯��
        public dcsyncL_5_38_Response()
        {
            this.dcsyncL_5_38_InfoList = new ObservableCollection<dcsyncL_5_38_Info>();
        }
        #endregion

        #region ��������
        public ObservableCollection<dcsyncL_5_38_Info> dcsyncL_5_38_InfoList { get; set; }
        #endregion

        #region IResponse ��Ա
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_5_38_Info info = new dcsyncL_5_38_Info();
            dcsyncL_5_38_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_5_38_InfoList.Add((dcsyncL_5_38_Info)info);
        }
        #endregion

        //�߼�_����ͬ��_����֤ȯͬ��_ͬ��֤ȯ�ֲֻ��ܱ�
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_5_38_Info();
                dcsyncL_5_38_InfoList.Add(info);
            }
        }
    }

}
