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
    public class clsecuL_1_21_Response : IResponse
    {
        #region 构造函数
        public clsecuL_1_21_Response()
        {
            this.clsecuL_1_21_InfoList = new ObservableCollection<clsecuL_1_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_1_21_Info> clsecuL_1_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_1_21_Info info = new clsecuL_1_21_Info();
            clsecuL_1_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_1_21_InfoList.Add((clsecuL_1_21_Info)info);
        }
        #endregion

        //逻辑_清算证券_公用_数据归历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_1_21_Info();
                clsecuL_1_21_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_1_41_Response : IResponse
    {
        #region 构造函数
        public clsecuL_1_41_Response()
        {
            this.clsecuL_1_41_InfoList = new ObservableCollection<clsecuL_1_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_1_41_Info> clsecuL_1_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_1_41_Info info = new clsecuL_1_41_Info();
            clsecuL_1_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_1_41_InfoList.Add((clsecuL_1_41_Info)info);
        }
        #endregion

        //逻辑_清算证券_公用_重做准备
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_1_41_Info();
                clsecuL_1_41_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_1_42_Response : IResponse
    {
        #region 构造函数
        public clsecuL_1_42_Response()
        {
            this.clsecuL_1_42_InfoList = new ObservableCollection<clsecuL_1_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_1_42_Info> clsecuL_1_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_1_42_Info info = new clsecuL_1_42_Info();
            clsecuL_1_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_1_42_InfoList.Add((clsecuL_1_42_Info)info);
        }
        #endregion

        //逻辑_清算证券_公用_处理流程统计
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_1_42_Info();
                clsecuL_1_42_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_1_43_Response : IResponse
    {
        #region 构造函数
        public clsecuL_1_43_Response()
        {
            this.clsecuL_1_43_InfoList = new ObservableCollection<clsecuL_1_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_1_43_Info> clsecuL_1_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_1_43_Info info = new clsecuL_1_43_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.sett_flow_step = unpacker.GetInt("sett_flow_step");
            info.total_count = unpacker.GetInt("total_count");
            info.total_amt = unpacker.GetDouble("total_amt");
            info.total_succ_count = unpacker.GetInt("total_succ_count");
            info.total_succ_amt = unpacker.GetDouble("total_succ_amt");
            info.total_fail_count = unpacker.GetInt("total_fail_count");
            info.total_fail_amt = unpacker.GetDouble("total_fail_amt");
            clsecuL_1_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_1_43_InfoList.Add((clsecuL_1_43_Info)info);
        }
        #endregion

        //逻辑_清算证券_公用_查询处理流程统计数据
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clsecuL_1_43_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.sett_flow_step = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SETT_FLOW_STEP_INT);
                    info.total_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_COUNT_INT);
                    info.total_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_AMT_FLOAT);
                    info.total_succ_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SUCC_COUNT_INT);
                    info.total_succ_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SUCC_AMT_FLOAT);
                    info.total_fail_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_FAIL_COUNT_INT);
                    info.total_fail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_FAIL_AMT_FLOAT);
                    clsecuL_1_43_InfoList.Add(info);
                }
            }
        }
    }

    public class clsecuL_1_44_Response : IResponse
    {
        #region 构造函数
        public clsecuL_1_44_Response()
        {
            this.clsecuL_1_44_InfoList = new ObservableCollection<clsecuL_1_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_1_44_Info> clsecuL_1_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_1_44_Info info = new clsecuL_1_44_Info();
            clsecuL_1_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_1_44_InfoList.Add((clsecuL_1_44_Info)info);
        }
        #endregion

        //逻辑_清算证券_公用_检查处理流程正确性
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_1_44_Info();
                clsecuL_1_44_InfoList.Add(info);
            }
        }
    }

    public class clsecuL_1_51_Response : IResponse
    {
        #region 构造函数
        public clsecuL_1_51_Response()
        {
            this.clsecuL_1_51_InfoList = new ObservableCollection<clsecuL_1_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clsecuL_1_51_Info> clsecuL_1_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clsecuL_1_51_Info info = new clsecuL_1_51_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clsecuL_1_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clsecuL_1_51_InfoList.Add((clsecuL_1_51_Info)info);
        }
        #endregion

        //逻辑_清算证券_公用_数据归历史定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clsecuL_1_51_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                clsecuL_1_51_InfoList.Add(info);
            }
        }
    }

}
