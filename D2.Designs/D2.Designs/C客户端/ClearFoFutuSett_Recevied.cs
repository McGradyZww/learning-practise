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

    public static class ClearFoFutuSett
    {
        //逻辑_清算外盘期货_结算_查询合约交割参数记录
        public static List<FuncclfofuL_3_4Model> GetFuncclfofuL_3_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclfofuL_3_4Models = new List<FuncclfofuL_3_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclfofuL_3_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.deli_price = packer.GetDoublebyName("deli_price", i);
 
                FuncclfofuL_3_4Models.Add(reqCommand);
            }
            return FuncclfofuL_3_4Models;
        }
 
        //逻辑_清算外盘期货_结算_查询合约交割参数记录
        public static List<FuncclfofuL_3_4Model> GetFuncclfofuL_3_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclfofuL_3_4Models = new List<FuncclfofuL_3_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclfofuL_3_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.deli_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DELI_PRICE_FLOAT);
                    FuncclfofuL_3_4Models.Add(reqCommand);
                }
            }
            return FuncclfofuL_3_4Models;
        }
 
        //逻辑_清算外盘期货_结算_查询组合占用保证金记录
        public static List<FuncclfofuL_3_9Model> GetFuncclfofuL_3_9Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclfofuL_3_9Models = new List<FuncclfofuL_3_9Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclfofuL_3_9Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.comb_code = packer.GetStrbyName("comb_code", i);
                reqCommand.comb_type = packer.GetIntbyName("comb_type", i);
                reqCommand.comb_name = packer.GetStrbyName("comb_name", i);
                reqCommand.long_hold_margin = packer.GetDoublebyName("long_hold_margin", i);
                reqCommand.short_hold_margin = packer.GetDoublebyName("short_hold_margin", i);
                reqCommand.sett_capt_margin = packer.GetDoublebyName("sett_capt_margin", i);
                reqCommand.deal_flag = packer.GetIntbyName("deal_flag", i);
 
                FuncclfofuL_3_9Models.Add(reqCommand);
            }
            return FuncclfofuL_3_9Models;
        }
 
        //逻辑_清算外盘期货_结算_查询组合占用保证金记录
        public static List<FuncclfofuL_3_9Model> GetFuncclfofuL_3_9Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclfofuL_3_9Models = new List<FuncclfofuL_3_9Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclfofuL_3_9Model();
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
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    reqCommand.comb_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMB_TYPE_INT);
                    reqCommand.comb_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_NAME_STR);
                    reqCommand.long_hold_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_HOLD_MARGIN_FLOAT);
                    reqCommand.short_hold_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_HOLD_MARGIN_FLOAT);
                    reqCommand.sett_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_CAPT_MARGIN_FLOAT);
                    reqCommand.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    FuncclfofuL_3_9Models.Add(reqCommand);
                }
            }
            return FuncclfofuL_3_9Models;
        }
 
        //逻辑_清算外盘期货_结算_查询待入账记录
        public static List<FuncclfofuL_3_35Model> GetFuncclfofuL_3_35Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclfofuL_3_35Models = new List<FuncclfofuL_3_35Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclfofuL_3_35Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_time = packer.GetIntbyName("report_time", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_no = packer.GetIntbyName("order_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.pre_settle_price = packer.GetDoublebyName("pre_settle_price", i);
                reqCommand.sett_price = packer.GetDoublebyName("sett_price", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_num = packer.GetIntbyName("strike_num", i);
                reqCommand.pre_entry_qty = packer.GetDoublebyName("pre_entry_qty", i);
                reqCommand.pre_entry_amt = packer.GetDoublebyName("pre_entry_amt", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.comb_code = packer.GetStrbyName("comb_code", i);
                reqCommand.comb_type = packer.GetIntbyName("comb_type", i);
                reqCommand.comb_name = packer.GetStrbyName("comb_name", i);
                reqCommand.long_hold_margin = packer.GetDoublebyName("long_hold_margin", i);
                reqCommand.short_hold_margin = packer.GetDoublebyName("short_hold_margin", i);
                reqCommand.sett_capt_margin = packer.GetDoublebyName("sett_capt_margin", i);
                reqCommand.sett_close_pandl = packer.GetDoublebyName("sett_close_pandl", i);
                reqCommand.sett_marked_pandl = packer.GetDoublebyName("sett_marked_pandl", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.report_fee = packer.GetDoublebyName("report_fee", i);
                reqCommand.wtdraw_fee = packer.GetDoublebyName("wtdraw_fee", i);
                reqCommand.deli_fee = packer.GetDoublebyName("deli_fee", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.out_all_fee = packer.GetDoublebyName("out_all_fee", i);
                reqCommand.out_report_fee = packer.GetDoublebyName("out_report_fee", i);
                reqCommand.out_cancel_fee = packer.GetDoublebyName("out_cancel_fee", i);
                reqCommand.out_deli_fee = packer.GetDoublebyName("out_deli_fee", i);
                reqCommand.out_other_fee = packer.GetDoublebyName("out_other_fee", i);
                reqCommand.out_brkage_commis = packer.GetDoublebyName("out_brkage_commis", i);
                reqCommand.out_other_commis = packer.GetDoublebyName("out_other_commis", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.entry_status = packer.GetStrbyName("entry_status", i);
                reqCommand.undo_status = packer.GetStrbyName("undo_status", i);
                reqCommand.entry_money_jour_no = packer.GetInt64byName("entry_money_jour_no", i);
                reqCommand.entry_posi_jour_no = packer.GetInt64byName("entry_posi_jour_no", i);
                reqCommand.deli_jour_no = packer.GetInt64byName("deli_jour_no", i);
 
                FuncclfofuL_3_35Models.Add(reqCommand);
            }
            return FuncclfofuL_3_35Models;
        }
 
        //逻辑_清算外盘期货_结算_查询待入账记录
        public static List<FuncclfofuL_3_35Model> GetFuncclfofuL_3_35Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclfofuL_3_35Models = new List<FuncclfofuL_3_35Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclfofuL_3_35Model();
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
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.pre_settle_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT);
                    reqCommand.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT);
                    reqCommand.pre_entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT);
                    reqCommand.pre_entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    reqCommand.comb_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMB_TYPE_INT);
                    reqCommand.comb_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_NAME_STR);
                    reqCommand.long_hold_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_HOLD_MARGIN_FLOAT);
                    reqCommand.short_hold_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_HOLD_MARGIN_FLOAT);
                    reqCommand.sett_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_CAPT_MARGIN_FLOAT);
                    reqCommand.sett_close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_CLOSE_PANDL_FLOAT);
                    reqCommand.sett_marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_MARKED_PANDL_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_FEE_FLOAT);
                    reqCommand.wtdraw_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_FEE_FLOAT);
                    reqCommand.deli_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DELI_FEE_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.out_all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ALL_FEE_FLOAT);
                    reqCommand.out_report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_REPORT_FEE_FLOAT);
                    reqCommand.out_cancel_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CANCEL_FEE_FLOAT);
                    reqCommand.out_deli_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_DELI_FEE_FLOAT);
                    reqCommand.out_other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_FEE_FLOAT);
                    reqCommand.out_brkage_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BRKAGE_COMMIS_FLOAT);
                    reqCommand.out_other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_COMMIS_FLOAT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.entry_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR);
                    reqCommand.undo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNDO_STATUS_STR);
                    reqCommand.entry_money_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
                    reqCommand.entry_posi_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_POSI_JOUR_NO_INT64);
                    reqCommand.deli_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DELI_JOUR_NO_INT64);
                    FuncclfofuL_3_35Models.Add(reqCommand);
                }
            }
            return FuncclfofuL_3_35Models;
        }
 
        //逻辑_清算外盘期货_结算_结算处理定时任务
        public static List<FuncclfofuL_3_102Model> GetFuncclfofuL_3_102Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclfofuL_3_102Models = new List<FuncclfofuL_3_102Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclfofuL_3_102Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FuncclfofuL_3_102Models.Add(reqCommand);
            }
            return FuncclfofuL_3_102Models;
        }
 
        //逻辑_清算外盘期货_结算_结算处理定时任务
        public static List<FuncclfofuL_3_102Model> GetFuncclfofuL_3_102Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclfofuL_3_102Models = new List<FuncclfofuL_3_102Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclfofuL_3_102Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FuncclfofuL_3_102Models.Add(reqCommand);
            }
            return FuncclfofuL_3_102Models;
        }
 
        //逻辑_清算外盘期货_结算_入账处理定时任务
        public static List<FuncclfofuL_3_104Model> GetFuncclfofuL_3_104Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclfofuL_3_104Models = new List<FuncclfofuL_3_104Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclfofuL_3_104Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FuncclfofuL_3_104Models.Add(reqCommand);
            }
            return FuncclfofuL_3_104Models;
        }
 
        //逻辑_清算外盘期货_结算_入账处理定时任务
        public static List<FuncclfofuL_3_104Model> GetFuncclfofuL_3_104Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclfofuL_3_104Models = new List<FuncclfofuL_3_104Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclfofuL_3_104Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FuncclfofuL_3_104Models.Add(reqCommand);
            }
            return FuncclfofuL_3_104Models;
        }
 
        //逻辑_清算外盘期货_结算_数据归历史定时任务
        public static List<FuncclfofuL_3_106Model> GetFuncclfofuL_3_106Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclfofuL_3_106Models = new List<FuncclfofuL_3_106Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclfofuL_3_106Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FuncclfofuL_3_106Models.Add(reqCommand);
            }
            return FuncclfofuL_3_106Models;
        }
 
        //逻辑_清算外盘期货_结算_数据归历史定时任务
        public static List<FuncclfofuL_3_106Model> GetFuncclfofuL_3_106Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclfofuL_3_106Models = new List<FuncclfofuL_3_106Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclfofuL_3_106Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FuncclfofuL_3_106Models.Add(reqCommand);
            }
            return FuncclfofuL_3_106Models;
        }
 
    }
}
