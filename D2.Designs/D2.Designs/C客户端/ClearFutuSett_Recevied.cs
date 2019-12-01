using LD.Client.Commom;
using LD.Client.Contract;
using LDsdkDefine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{

    public static class ClearFutuSett
    {
        //逻辑_清算期货_结算_查询待入账记录
        public static List<FuncclfutuL_3_45Model> GetFuncclfutuL_3_45Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclfutuL_3_45Models = new List<FuncclfutuL_3_45Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclfutuL_3_45Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.exch_rate = packer.GetDoublebyName("exch_rate", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.pre_settle_price = packer.GetDoublebyName("pre_settle_price", i);
                reqCommand.sett_price = packer.GetDoublebyName("sett_price", i);
                reqCommand.pre_entry_amt = packer.GetDoublebyName("pre_entry_amt", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.entry_status = packer.GetStrbyName("entry_status", i);
                reqCommand.undo_status = packer.GetStrbyName("undo_status", i);
                reqCommand.entry_money_jour_no = packer.GetInt64byName("entry_money_jour_no", i);
                reqCommand.entry_asac_posi_jour_no = packer.GetInt64byName("entry_asac_posi_jour_no", i);
                reqCommand.deli_jour_no = packer.GetInt64byName("deli_jour_no", i);
 
                FuncclfutuL_3_45Models.Add(reqCommand);
            }
            return FuncclfutuL_3_45Models;
        }
 
        //逻辑_清算期货_结算_查询待入账记录
        public static List<FuncclfutuL_3_45Model> GetFuncclfutuL_3_45Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclfutuL_3_45Models = new List<FuncclfutuL_3_45Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclfutuL_3_45Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_RATE_FLOAT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.pre_settle_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT);
                    reqCommand.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    reqCommand.pre_entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.entry_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR);
                    reqCommand.undo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNDO_STATUS_STR);
                    reqCommand.entry_money_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
                    reqCommand.entry_asac_posi_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64);
                    reqCommand.deli_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DELI_JOUR_NO_INT64);
                    FuncclfutuL_3_45Models.Add(reqCommand);
                }
            }
            return FuncclfutuL_3_45Models;
        }
 
        //逻辑_清算期货_结算_入账处理
        public static List<FuncclfutuL_3_46Model> GetFuncclfutuL_3_46Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclfutuL_3_46Models = new List<FuncclfutuL_3_46Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclfutuL_3_46Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.record_count = packer.GetIntbyName("record_count", i);
                reqCommand.deal_info = packer.GetStrbyName("deal_info", i);
 
                FuncclfutuL_3_46Models.Add(reqCommand);
            }
            return FuncclfutuL_3_46Models;
        }
 
        //逻辑_清算期货_结算_入账处理
        public static List<FuncclfutuL_3_46Model> GetFuncclfutuL_3_46Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclfutuL_3_46Models = new List<FuncclfutuL_3_46Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclfutuL_3_46Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                reqCommand.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                FuncclfutuL_3_46Models.Add(reqCommand);
            }
            return FuncclfutuL_3_46Models;
        }
 
        //逻辑_清算期货_结算_结算处理定时任务
        public static List<FuncclfutuL_3_105Model> GetFuncclfutuL_3_105Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclfutuL_3_105Models = new List<FuncclfutuL_3_105Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclfutuL_3_105Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FuncclfutuL_3_105Models.Add(reqCommand);
            }
            return FuncclfutuL_3_105Models;
        }
 
        //逻辑_清算期货_结算_结算处理定时任务
        public static List<FuncclfutuL_3_105Model> GetFuncclfutuL_3_105Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclfutuL_3_105Models = new List<FuncclfutuL_3_105Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclfutuL_3_105Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FuncclfutuL_3_105Models.Add(reqCommand);
            }
            return FuncclfutuL_3_105Models;
        }
 
        //逻辑_清算期货_结算_入账处理定时任务
        public static List<FuncclfutuL_3_104Model> GetFuncclfutuL_3_104Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclfutuL_3_104Models = new List<FuncclfutuL_3_104Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclfutuL_3_104Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FuncclfutuL_3_104Models.Add(reqCommand);
            }
            return FuncclfutuL_3_104Models;
        }
 
        //逻辑_清算期货_结算_入账处理定时任务
        public static List<FuncclfutuL_3_104Model> GetFuncclfutuL_3_104Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclfutuL_3_104Models = new List<FuncclfutuL_3_104Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclfutuL_3_104Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FuncclfutuL_3_104Models.Add(reqCommand);
            }
            return FuncclfutuL_3_104Models;
        }
 
    }
}
