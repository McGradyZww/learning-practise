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
    public class pubL_14_1_Response : IResponse
    {
        #region 构造函数
        public pubL_14_1_Response()
        {
            this.pubL_14_1_InfoList = new ObservableCollection<pubL_14_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_14_1_Info> pubL_14_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_14_1_Info info = new pubL_14_1_Info();
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.quot_price_info = unpacker.GetStr("quot_price_info");
            pubL_14_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_14_1_InfoList.Add((pubL_14_1_Info)info);
        }
        #endregion

        //逻辑_公共_期货行情服务_请求行情快照
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_14_1_Info();
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                info.quot_price_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_PRICE_INFO_STR);
                pubL_14_1_InfoList.Add(info);
            }
        }
    }

    public class pubL_14_2_Response : IResponse
    {
        #region 构造函数
        public pubL_14_2_Response()
        {
            this.pubL_14_2_InfoList = new ObservableCollection<pubL_14_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_14_2_Info> pubL_14_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_14_2_Info info = new pubL_14_2_Info();
            pubL_14_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_14_2_InfoList.Add((pubL_14_2_Info)info);
        }
        #endregion

        //逻辑_公共_期货行情服务_主推实时行情
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_14_2_Info();
                pubL_14_2_InfoList.Add(info);
            }
        }
    }

}
