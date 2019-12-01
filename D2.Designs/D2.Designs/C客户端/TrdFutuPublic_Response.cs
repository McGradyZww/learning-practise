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
    public class tdfutuL_1_1_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_1_1_Response()
        {
            this.tdfutuL_1_1_InfoList = new ObservableCollection<tdfutuL_1_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_1_1_Info> tdfutuL_1_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_1_1_Info info = new tdfutuL_1_1_Info();
            tdfutuL_1_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_1_1_InfoList.Add((tdfutuL_1_1_Info)info);
        }
        #endregion

        //逻辑_交易期货_公用_更新报盘机状态
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_1_1_Info();
                tdfutuL_1_1_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_1_2_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_1_2_Response()
        {
            this.tdfutuL_1_2_InfoList = new ObservableCollection<tdfutuL_1_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_1_2_Info> tdfutuL_1_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_1_2_Info info = new tdfutuL_1_2_Info();
            info.curr_no = unpacker.GetInt64("curr_no");
            tdfutuL_1_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_1_2_InfoList.Add((tdfutuL_1_2_Info)info);
        }
        #endregion

        //逻辑_交易期货_公用_获取业务记录编号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_1_2_Info();
                info.curr_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CURR_NO_INT64);
                tdfutuL_1_2_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_1_3_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_1_3_Response()
        {
            this.tdfutuL_1_3_InfoList = new ObservableCollection<tdfutuL_1_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_1_3_Info> tdfutuL_1_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_1_3_Info info = new tdfutuL_1_3_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            tdfutuL_1_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_1_3_InfoList.Add((tdfutuL_1_3_Info)info);
        }
        #endregion

        //逻辑_交易期货_公用_数据归历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_1_3_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                tdfutuL_1_3_InfoList.Add(info);
            }
        }
    }

}
