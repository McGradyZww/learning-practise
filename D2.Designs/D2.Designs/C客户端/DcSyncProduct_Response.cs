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
    public class dcsyncL_2_12_Response : IResponse
    {
        #region 构造函数
        public dcsyncL_2_12_Response()
        {
            this.dcsyncL_2_12_InfoList = new ObservableCollection<dcsyncL_2_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<dcsyncL_2_12_Info> dcsyncL_2_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_2_12_Info info = new dcsyncL_2_12_Info();
            dcsyncL_2_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_2_12_InfoList.Add((dcsyncL_2_12_Info)info);
        }
        #endregion

        //逻辑_数据同步_产品同步_同步产品信息表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_2_12_Info();
                dcsyncL_2_12_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_2_13_Response : IResponse
    {
        #region 构造函数
        public dcsyncL_2_13_Response()
        {
            this.dcsyncL_2_13_InfoList = new ObservableCollection<dcsyncL_2_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<dcsyncL_2_13_Info> dcsyncL_2_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_2_13_Info info = new dcsyncL_2_13_Info();
            dcsyncL_2_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_2_13_InfoList.Add((dcsyncL_2_13_Info)info);
        }
        #endregion

        //逻辑_数据同步_产品同步_同步产品限制信息表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_2_13_Info();
                dcsyncL_2_13_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_2_14_Response : IResponse
    {
        #region 构造函数
        public dcsyncL_2_14_Response()
        {
            this.dcsyncL_2_14_InfoList = new ObservableCollection<dcsyncL_2_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<dcsyncL_2_14_Info> dcsyncL_2_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_2_14_Info info = new dcsyncL_2_14_Info();
            dcsyncL_2_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_2_14_InfoList.Add((dcsyncL_2_14_Info)info);
        }
        #endregion

        //逻辑_数据同步_产品同步_同步资产账户信息表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_2_14_Info();
                dcsyncL_2_14_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_2_15_Response : IResponse
    {
        #region 构造函数
        public dcsyncL_2_15_Response()
        {
            this.dcsyncL_2_15_InfoList = new ObservableCollection<dcsyncL_2_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<dcsyncL_2_15_Info> dcsyncL_2_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_2_15_Info info = new dcsyncL_2_15_Info();
            dcsyncL_2_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_2_15_InfoList.Add((dcsyncL_2_15_Info)info);
        }
        #endregion

        //逻辑_数据同步_产品同步_同步资产账户通道信息表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_2_15_Info();
                dcsyncL_2_15_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_2_16_Response : IResponse
    {
        #region 构造函数
        public dcsyncL_2_16_Response()
        {
            this.dcsyncL_2_16_InfoList = new ObservableCollection<dcsyncL_2_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<dcsyncL_2_16_Info> dcsyncL_2_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_2_16_Info info = new dcsyncL_2_16_Info();
            dcsyncL_2_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_2_16_InfoList.Add((dcsyncL_2_16_Info)info);
        }
        #endregion

        //逻辑_数据同步_产品同步_同步产品资金表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_2_16_Info();
                dcsyncL_2_16_InfoList.Add(info);
            }
        }
    }

    public class dcsyncL_2_17_Response : IResponse
    {
        #region 构造函数
        public dcsyncL_2_17_Response()
        {
            this.dcsyncL_2_17_InfoList = new ObservableCollection<dcsyncL_2_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<dcsyncL_2_17_Info> dcsyncL_2_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            dcsyncL_2_17_Info info = new dcsyncL_2_17_Info();
            dcsyncL_2_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            dcsyncL_2_17_InfoList.Add((dcsyncL_2_17_Info)info);
        }
        #endregion

        //逻辑_数据同步_产品同步_同步产品资产表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new dcsyncL_2_17_Info();
                dcsyncL_2_17_InfoList.Add(info);
            }
        }
    }

}
