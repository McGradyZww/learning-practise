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
    public class clfutuL_3_31_Response : IResponse
    {
        #region 构造函数
        public clfutuL_3_31_Response()
        {
            this.clfutuL_3_31_InfoList = new ObservableCollection<clfutuL_3_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_3_31_Info> clfutuL_3_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_3_31_Info info = new clfutuL_3_31_Info();
            clfutuL_3_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_3_31_InfoList.Add((clfutuL_3_31_Info)info);
        }
        #endregion

        //逻辑_清算期货_结算_结算处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_3_31_Info();
                clfutuL_3_31_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_3_45_Response : IResponse
    {
        #region 构造函数
        public clfutuL_3_45_Response()
        {
            this.clfutuL_3_45_InfoList = new ObservableCollection<clfutuL_3_45_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_3_45_Info> clfutuL_3_45_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_3_45_Info info = new clfutuL_3_45_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.exch_rate = unpacker.GetDouble("exch_rate");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.pre_settle_price = unpacker.GetDouble("pre_settle_price");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.pre_entry_amt = unpacker.GetDouble("pre_entry_amt");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.entry_status = unpacker.GetStr("entry_status");
            info.undo_status = unpacker.GetStr("undo_status");
            info.entry_money_jour_no = unpacker.GetInt64("entry_money_jour_no");
            info.entry_asac_posi_jour_no = unpacker.GetInt64("entry_asac_posi_jour_no");
            info.deli_jour_no = unpacker.GetInt64("deli_jour_no");
            clfutuL_3_45_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_3_45_InfoList.Add((clfutuL_3_45_Info)info);
        }
        #endregion

        //逻辑_清算期货_结算_查询待入账记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clfutuL_3_45_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.pre_settle_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT);
                    info.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    info.pre_entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.entry_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR);
                    info.undo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNDO_STATUS_STR);
                    info.entry_money_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
                    info.entry_asac_posi_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64);
                    info.deli_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DELI_JOUR_NO_INT64);
                    clfutuL_3_45_InfoList.Add(info);
                }
            }
        }
    }

    public class clfutuL_3_46_Response : IResponse
    {
        #region 构造函数
        public clfutuL_3_46_Response()
        {
            this.clfutuL_3_46_InfoList = new ObservableCollection<clfutuL_3_46_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_3_46_Info> clfutuL_3_46_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_3_46_Info info = new clfutuL_3_46_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.deal_info = unpacker.GetStr("deal_info");
            clfutuL_3_46_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_3_46_InfoList.Add((clfutuL_3_46_Info)info);
        }
        #endregion

        //逻辑_清算期货_结算_入账处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_3_46_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                clfutuL_3_46_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_3_47_Response : IResponse
    {
        #region 构造函数
        public clfutuL_3_47_Response()
        {
            this.clfutuL_3_47_InfoList = new ObservableCollection<clfutuL_3_47_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_3_47_Info> clfutuL_3_47_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_3_47_Info info = new clfutuL_3_47_Info();
            clfutuL_3_47_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_3_47_InfoList.Add((clfutuL_3_47_Info)info);
        }
        #endregion

        //逻辑_清算期货_结算_入账回滚处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_3_47_Info();
                clfutuL_3_47_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_3_105_Response : IResponse
    {
        #region 构造函数
        public clfutuL_3_105_Response()
        {
            this.clfutuL_3_105_InfoList = new ObservableCollection<clfutuL_3_105_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_3_105_Info> clfutuL_3_105_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_3_105_Info info = new clfutuL_3_105_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clfutuL_3_105_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_3_105_InfoList.Add((clfutuL_3_105_Info)info);
        }
        #endregion

        //逻辑_清算期货_结算_结算处理定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_3_105_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                clfutuL_3_105_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_3_104_Response : IResponse
    {
        #region 构造函数
        public clfutuL_3_104_Response()
        {
            this.clfutuL_3_104_InfoList = new ObservableCollection<clfutuL_3_104_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_3_104_Info> clfutuL_3_104_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_3_104_Info info = new clfutuL_3_104_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clfutuL_3_104_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_3_104_InfoList.Add((clfutuL_3_104_Info)info);
        }
        #endregion

        //逻辑_清算期货_结算_入账处理定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_3_104_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                clfutuL_3_104_InfoList.Add(info);
            }
        }
    }

}
