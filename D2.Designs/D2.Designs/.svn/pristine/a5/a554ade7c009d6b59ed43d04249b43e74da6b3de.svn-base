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
    public class pubL_24_1_Response : IResponse
    {
        #region 构造函数
        public pubL_24_1_Response()
        {
            this.pubL_24_1_InfoList = new ObservableCollection<pubL_24_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_24_1_Info> pubL_24_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_24_1_Info info = new pubL_24_1_Info();
            info.last_init_date = unpacker.GetInt("last_init_date");
            pubL_24_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_24_1_InfoList.Add((pubL_24_1_Info)info);
        }
        #endregion

        //逻辑_公共_公共接口_获取上一交易日期
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_24_1_Info();
                info.last_init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_INIT_DATE_INT);
                pubL_24_1_InfoList.Add(info);
            }
        }
    }

    public class pubL_24_2_Response : IResponse
    {
        #region 构造函数
        public pubL_24_2_Response()
        {
            this.pubL_24_2_InfoList = new ObservableCollection<pubL_24_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<pubL_24_2_Info> pubL_24_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            pubL_24_2_Info info = new pubL_24_2_Info();
            info.co_no_rights_str = unpacker.GetStr("co_no_rights_str");
            info.pd_no_rights_str = unpacker.GetStr("pd_no_rights_str");
            info.exch_group_no_rights_str = unpacker.GetStr("exch_group_no_rights_str");
            pubL_24_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            pubL_24_2_InfoList.Add((pubL_24_2_Info)info);
        }
        #endregion

        //逻辑_公共_公共接口_获取操作员操作权限串
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new pubL_24_2_Info();
                info.co_no_rights_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_RIGHTS_STR_STR);
                info.pd_no_rights_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_RIGHTS_STR_STR);
                info.exch_group_no_rights_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR);
                pubL_24_2_InfoList.Add(info);
            }
        }
    }

}
