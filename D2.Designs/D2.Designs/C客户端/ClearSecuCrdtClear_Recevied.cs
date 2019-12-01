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

    public static class ClearSecuCrdtClear
    {
        //逻辑_清算证券_融资融券清算_转入成交记录
        public static List<FuncclsecuL_21_1Model> GetFuncclsecuL_21_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_1Models = new List<FuncclsecuL_21_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.record_count = packer.GetIntbyName("record_count", i);
                reqCommand.deal_info = packer.GetStrbyName("deal_info", i);
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncclsecuL_21_1Models.Add(reqCommand);
            }
            return FuncclsecuL_21_1Models;
        }
 
        //逻辑_清算证券_融资融券清算_转入成交记录
        public static List<FuncclsecuL_21_1Model> GetFuncclsecuL_21_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_1Models = new List<FuncclsecuL_21_1Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclsecuL_21_1Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                reqCommand.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FuncclsecuL_21_1Models.Add(reqCommand);
            }
            return FuncclsecuL_21_1Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询成交记录
        public static List<FuncclsecuL_21_3Model> GetFuncclsecuL_21_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_3Models = new List<FuncclsecuL_21_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
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
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.intrst_days = packer.GetIntbyName("intrst_days", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.clear_entry_type = packer.GetIntbyName("clear_entry_type", i);
                reqCommand.deal_flag = packer.GetIntbyName("deal_flag", i);
 
                FuncclsecuL_21_3Models.Add(reqCommand);
            }
            return FuncclsecuL_21_3Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询成交记录
        public static List<FuncclsecuL_21_3Model> GetFuncclsecuL_21_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_3Models = new List<FuncclsecuL_21_3Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_21_3Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
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
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.clear_entry_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLEAR_ENTRY_TYPE_INT);
                    reqCommand.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    FuncclsecuL_21_3Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_21_3Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询转入成交记录
        public static List<FuncclsecuL_21_4Model> GetFuncclsecuL_21_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_4Models = new List<FuncclsecuL_21_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.report_time = packer.GetIntbyName("report_time", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.sett_flag = packer.GetIntbyName("sett_flag", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncclsecuL_21_4Models.Add(reqCommand);
            }
            return FuncclsecuL_21_4Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询转入成交记录
        public static List<FuncclsecuL_21_4Model> GetFuncclsecuL_21_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_4Models = new List<FuncclsecuL_21_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_21_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.sett_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SETT_FLAG_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncclsecuL_21_4Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_21_4Models;
        }
 
        //逻辑_清算证券_融资融券清算_清算处理
        public static List<FuncclsecuL_21_11Model> GetFuncclsecuL_21_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_11Models = new List<FuncclsecuL_21_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_11Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.record_count = packer.GetIntbyName("record_count", i);
                reqCommand.deal_info = packer.GetStrbyName("deal_info", i);
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncclsecuL_21_11Models.Add(reqCommand);
            }
            return FuncclsecuL_21_11Models;
        }
 
        //逻辑_清算证券_融资融券清算_清算处理
        public static List<FuncclsecuL_21_11Model> GetFuncclsecuL_21_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_11Models = new List<FuncclsecuL_21_11Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclsecuL_21_11Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                reqCommand.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FuncclsecuL_21_11Models.Add(reqCommand);
            }
            return FuncclsecuL_21_11Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询合并清算记录
        public static List<FuncclsecuL_21_13Model> GetFuncclsecuL_21_13Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_13Models = new List<FuncclsecuL_21_13Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_13Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
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
                reqCommand.strike_num = packer.GetIntbyName("strike_num", i);
                reqCommand.strike_aver_price = packer.GetDoublebyName("strike_aver_price", i);
                reqCommand.pre_entry_qty = packer.GetDoublebyName("pre_entry_qty", i);
                reqCommand.pre_entry_amt = packer.GetDoublebyName("pre_entry_amt", i);
                reqCommand.split_strike_qty = packer.GetDoublebyName("split_strike_qty", i);
                reqCommand.split_strike_amt = packer.GetDoublebyName("split_strike_amt", i);
                reqCommand.split_stamp_tax = packer.GetDoublebyName("split_stamp_tax", i);
                reqCommand.split_trans_fee = packer.GetDoublebyName("split_trans_fee", i);
                reqCommand.split_brkage = packer.GetDoublebyName("split_brkage", i);
                reqCommand.split_SEC_charges = packer.GetDoublebyName("split_SEC_charges", i);
                reqCommand.split_other_fee = packer.GetDoublebyName("split_other_fee", i);
                reqCommand.split_brkage_commis = packer.GetDoublebyName("split_brkage_commis", i);
                reqCommand.split_chann_commis = packer.GetDoublebyName("split_chann_commis", i);
                reqCommand.split_divi_commis = packer.GetDoublebyName("split_divi_commis", i);
                reqCommand.split_other_commis = packer.GetDoublebyName("split_other_commis", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.intrst_days = packer.GetIntbyName("intrst_days", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.clear_entry_type = packer.GetIntbyName("clear_entry_type", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.deal_flag = packer.GetIntbyName("deal_flag", i);
 
                FuncclsecuL_21_13Models.Add(reqCommand);
            }
            return FuncclsecuL_21_13Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询合并清算记录
        public static List<FuncclsecuL_21_13Model> GetFuncclsecuL_21_13Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_13Models = new List<FuncclsecuL_21_13Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_21_13Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
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
                    reqCommand.strike_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT);
                    reqCommand.strike_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT);
                    reqCommand.pre_entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT);
                    reqCommand.pre_entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT);
                    reqCommand.split_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_STRIKE_QTY_FLOAT);
                    reqCommand.split_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_STRIKE_AMT_FLOAT);
                    reqCommand.split_stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_STAMP_TAX_FLOAT);
                    reqCommand.split_trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_TRANS_FEE_FLOAT);
                    reqCommand.split_brkage = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_BRKAGE_FLOAT);
                    reqCommand.split_SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_SEC_CHARGES_FLOAT);
                    reqCommand.split_other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_OTHER_FEE_FLOAT);
                    reqCommand.split_brkage_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_BRKAGE_COMMIS_FLOAT);
                    reqCommand.split_chann_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_CHANN_COMMIS_FLOAT);
                    reqCommand.split_divi_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_DIVI_COMMIS_FLOAT);
                    reqCommand.split_other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_OTHER_COMMIS_FLOAT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.clear_entry_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLEAR_ENTRY_TYPE_INT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    FuncclsecuL_21_13Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_21_13Models;
        }
 
        //逻辑_清算证券_融资融券清算_合并清算处理
        public static List<FuncclsecuL_21_15Model> GetFuncclsecuL_21_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_15Models = new List<FuncclsecuL_21_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_15Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.record_count = packer.GetIntbyName("record_count", i);
                reqCommand.deal_info = packer.GetStrbyName("deal_info", i);
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncclsecuL_21_15Models.Add(reqCommand);
            }
            return FuncclsecuL_21_15Models;
        }
 
        //逻辑_清算证券_融资融券清算_合并清算处理
        public static List<FuncclsecuL_21_15Model> GetFuncclsecuL_21_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_15Models = new List<FuncclsecuL_21_15Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclsecuL_21_15Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                reqCommand.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FuncclsecuL_21_15Models.Add(reqCommand);
            }
            return FuncclsecuL_21_15Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询待入账记录
        public static List<FuncclsecuL_21_23Model> GetFuncclsecuL_21_23Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_23Models = new List<FuncclsecuL_21_23Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_23Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
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
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_num = packer.GetIntbyName("strike_num", i);
                reqCommand.pre_entry_qty = packer.GetDoublebyName("pre_entry_qty", i);
                reqCommand.pre_entry_amt = packer.GetDoublebyName("pre_entry_amt", i);
                reqCommand.debt_qty = packer.GetDoublebyName("debt_qty", i);
                reqCommand.debt_amt = packer.GetDoublebyName("debt_amt", i);
                reqCommand.debt_type = packer.GetIntbyName("debt_type", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.entry_status = packer.GetStrbyName("entry_status", i);
                reqCommand.undo_status = packer.GetStrbyName("undo_status", i);
                reqCommand.busi_jour_no = packer.GetInt64byName("busi_jour_no", i);
                reqCommand.entry_money_jour_no = packer.GetInt64byName("entry_money_jour_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.intrst_days = packer.GetIntbyName("intrst_days", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
 
                FuncclsecuL_21_23Models.Add(reqCommand);
            }
            return FuncclsecuL_21_23Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询待入账记录
        public static List<FuncclsecuL_21_23Model> GetFuncclsecuL_21_23Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_23Models = new List<FuncclsecuL_21_23Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_21_23Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
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
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT);
                    reqCommand.pre_entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT);
                    reqCommand.pre_entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT);
                    reqCommand.debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_QTY_FLOAT);
                    reqCommand.debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_AMT_FLOAT);
                    reqCommand.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.entry_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR);
                    reqCommand.undo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNDO_STATUS_STR);
                    reqCommand.busi_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_JOUR_NO_INT64);
                    reqCommand.entry_money_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    FuncclsecuL_21_23Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_21_23Models;
        }
 
        //逻辑_清算证券_融资融券清算_入账处理
        public static List<FuncclsecuL_21_24Model> GetFuncclsecuL_21_24Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_24Models = new List<FuncclsecuL_21_24Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_24Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.record_count = packer.GetIntbyName("record_count", i);
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncclsecuL_21_24Models.Add(reqCommand);
            }
            return FuncclsecuL_21_24Models;
        }
 
        //逻辑_清算证券_融资融券清算_入账处理
        public static List<FuncclsecuL_21_24Model> GetFuncclsecuL_21_24Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_24Models = new List<FuncclsecuL_21_24Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclsecuL_21_24Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FuncclsecuL_21_24Models.Add(reqCommand);
            }
            return FuncclsecuL_21_24Models;
        }
 
        //逻辑_清算证券_融资融券清算_成交转入定时任务
        public static List<FuncclsecuL_21_151Model> GetFuncclsecuL_21_151Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_151Models = new List<FuncclsecuL_21_151Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_151Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
                reqCommand.qry_no = packer.GetIntbyName("qry_no", i);
 
                FuncclsecuL_21_151Models.Add(reqCommand);
            }
            return FuncclsecuL_21_151Models;
        }
 
        //逻辑_清算证券_融资融券清算_成交转入定时任务
        public static List<FuncclsecuL_21_151Model> GetFuncclsecuL_21_151Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_151Models = new List<FuncclsecuL_21_151Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclsecuL_21_151Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                reqCommand.qry_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT);
                FuncclsecuL_21_151Models.Add(reqCommand);
            }
            return FuncclsecuL_21_151Models;
        }
 
        //逻辑_清算证券_融资融券清算_清算处理定时任务
        public static List<FuncclsecuL_21_153Model> GetFuncclsecuL_21_153Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_153Models = new List<FuncclsecuL_21_153Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_153Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
                reqCommand.qry_no = packer.GetIntbyName("qry_no", i);
 
                FuncclsecuL_21_153Models.Add(reqCommand);
            }
            return FuncclsecuL_21_153Models;
        }
 
        //逻辑_清算证券_融资融券清算_清算处理定时任务
        public static List<FuncclsecuL_21_153Model> GetFuncclsecuL_21_153Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_153Models = new List<FuncclsecuL_21_153Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclsecuL_21_153Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                reqCommand.qry_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QRY_NO_INT);
                FuncclsecuL_21_153Models.Add(reqCommand);
            }
            return FuncclsecuL_21_153Models;
        }
 
        //逻辑_清算证券_融资融券清算_入账处理定时任务
        public static List<FuncclsecuL_21_154Model> GetFuncclsecuL_21_154Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_154Models = new List<FuncclsecuL_21_154Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_154Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FuncclsecuL_21_154Models.Add(reqCommand);
            }
            return FuncclsecuL_21_154Models;
        }
 
        //逻辑_清算证券_融资融券清算_入账处理定时任务
        public static List<FuncclsecuL_21_154Model> GetFuncclsecuL_21_154Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_154Models = new List<FuncclsecuL_21_154Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclsecuL_21_154Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FuncclsecuL_21_154Models.Add(reqCommand);
            }
            return FuncclsecuL_21_154Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询统计数据
        public static List<FuncclsecuL_21_202Model> GetFuncclsecuL_21_202Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_202Models = new List<FuncclsecuL_21_202Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_202Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.clear_num = packer.GetIntbyName("clear_num", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.strike_num = packer.GetIntbyName("strike_num", i);
                reqCommand.strike_aver_price = packer.GetDoublebyName("strike_aver_price", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.entry_qty = packer.GetDoublebyName("entry_qty", i);
                reqCommand.entry_amt = packer.GetDoublebyName("entry_amt", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.chann_commis = packer.GetDoublebyName("chann_commis", i);
                reqCommand.divi_commis = packer.GetDoublebyName("divi_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
 
                FuncclsecuL_21_202Models.Add(reqCommand);
            }
            return FuncclsecuL_21_202Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询统计数据
        public static List<FuncclsecuL_21_202Model> GetFuncclsecuL_21_202Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_202Models = new List<FuncclsecuL_21_202Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_21_202Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.clear_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLEAR_NUM_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.strike_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT);
                    reqCommand.strike_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_QTY_FLOAT);
                    reqCommand.entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_AMT_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.chann_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CHANN_COMMIS_FLOAT);
                    reqCommand.divi_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIVI_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    FuncclsecuL_21_202Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_21_202Models;
        }
 
        //逻辑_清算证券_融资融券清算_获取汇总统计值
        public static List<FuncclsecuL_21_203Model> GetFuncclsecuL_21_203Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_203Models = new List<FuncclsecuL_21_203Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_203Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pre_switch_strike_qty = packer.GetDoublebyName("pre_switch_strike_qty", i);
                reqCommand.alr_switch_strike_qty = packer.GetDoublebyName("alr_switch_strike_qty", i);
                reqCommand.pre_clr_strike_qty = packer.GetDoublebyName("pre_clr_strike_qty", i);
                reqCommand.alr_clr_strike_qty = packer.GetDoublebyName("alr_clr_strike_qty", i);
                reqCommand.pre_entry_record_qty = packer.GetDoublebyName("pre_entry_record_qty", i);
                reqCommand.alr_entry_record_qty = packer.GetDoublebyName("alr_entry_record_qty", i);
 
                FuncclsecuL_21_203Models.Add(reqCommand);
            }
            return FuncclsecuL_21_203Models;
        }
 
        //逻辑_清算证券_融资融券清算_获取汇总统计值
        public static List<FuncclsecuL_21_203Model> GetFuncclsecuL_21_203Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_203Models = new List<FuncclsecuL_21_203Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncclsecuL_21_203Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pre_switch_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SWITCH_STRIKE_QTY_FLOAT);
                reqCommand.alr_switch_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALR_SWITCH_STRIKE_QTY_FLOAT);
                reqCommand.pre_clr_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLR_STRIKE_QTY_FLOAT);
                reqCommand.alr_clr_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALR_CLR_STRIKE_QTY_FLOAT);
                reqCommand.pre_entry_record_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_RECORD_QTY_FLOAT);
                reqCommand.alr_entry_record_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALR_ENTRY_RECORD_QTY_FLOAT);
                FuncclsecuL_21_203Models.Add(reqCommand);
            }
            return FuncclsecuL_21_203Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询成交记录序号
        public static List<FuncclsecuL_21_204Model> GetFuncclsecuL_21_204Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_204Models = new List<FuncclsecuL_21_204Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_204Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncclsecuL_21_204Models.Add(reqCommand);
            }
            return FuncclsecuL_21_204Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询成交记录序号
        public static List<FuncclsecuL_21_204Model> GetFuncclsecuL_21_204Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_204Models = new List<FuncclsecuL_21_204Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_21_204Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    FuncclsecuL_21_204Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_21_204Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询清算成交记录序号
        public static List<FuncclsecuL_21_205Model> GetFuncclsecuL_21_205Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_205Models = new List<FuncclsecuL_21_205Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_205Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncclsecuL_21_205Models.Add(reqCommand);
            }
            return FuncclsecuL_21_205Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询清算成交记录序号
        public static List<FuncclsecuL_21_205Model> GetFuncclsecuL_21_205Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_205Models = new List<FuncclsecuL_21_205Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_21_205Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    FuncclsecuL_21_205Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_21_205Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询合并清算记录序号
        public static List<FuncclsecuL_21_206Model> GetFuncclsecuL_21_206Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_206Models = new List<FuncclsecuL_21_206Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_206Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncclsecuL_21_206Models.Add(reqCommand);
            }
            return FuncclsecuL_21_206Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询合并清算记录序号
        public static List<FuncclsecuL_21_206Model> GetFuncclsecuL_21_206Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_206Models = new List<FuncclsecuL_21_206Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_21_206Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    FuncclsecuL_21_206Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_21_206Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询待入账记录序号
        public static List<FuncclsecuL_21_207Model> GetFuncclsecuL_21_207Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncclsecuL_21_207Models = new List<FuncclsecuL_21_207Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncclsecuL_21_207Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncclsecuL_21_207Models.Add(reqCommand);
            }
            return FuncclsecuL_21_207Models;
        }
 
        //逻辑_清算证券_融资融券清算_查询待入账记录序号
        public static List<FuncclsecuL_21_207Model> GetFuncclsecuL_21_207Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncclsecuL_21_207Models = new List<FuncclsecuL_21_207Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncclsecuL_21_207Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    FuncclsecuL_21_207Models.Add(reqCommand);
                }
            }
            return FuncclsecuL_21_207Models;
        }
 
    }
}
