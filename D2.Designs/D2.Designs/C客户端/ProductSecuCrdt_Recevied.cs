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

    public static class ProductSecuCrdt
    {
        //逻辑_产品证券_融资融券_查询资产账户持仓负债
        public static List<FuncpdsecuL_21_1Model> GetFuncpdsecuL_21_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_21_1Models = new List<FuncpdsecuL_21_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_21_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.debt_type = packer.GetIntbyName("debt_type", i);
                reqCommand.begin_debt_qty = packer.GetDoublebyName("begin_debt_qty", i);
                reqCommand.curr_debt_qty = packer.GetDoublebyName("curr_debt_qty", i);
                reqCommand.posi_qty_check_diff = packer.GetDoublebyName("posi_qty_check_diff", i);
                reqCommand.begin_debt_amt = packer.GetDoublebyName("begin_debt_amt", i);
                reqCommand.curr_debt_amt = packer.GetDoublebyName("curr_debt_amt", i);
                reqCommand.debt_interest_amt = packer.GetDoublebyName("debt_interest_amt", i);
                reqCommand.debt_return_amt = packer.GetDoublebyName("debt_return_amt", i);
                reqCommand.debt_return_qty = packer.GetDoublebyName("debt_return_qty", i);
                reqCommand.return_interest_amt = packer.GetDoublebyName("return_interest_amt", i);
 
                FuncpdsecuL_21_1Models.Add(reqCommand);
            }
            return FuncpdsecuL_21_1Models;
        }
 
        //逻辑_产品证券_融资融券_查询资产账户持仓负债
        public static List<FuncpdsecuL_21_1Model> GetFuncpdsecuL_21_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_21_1Models = new List<FuncpdsecuL_21_1Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdsecuL_21_1Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    reqCommand.begin_debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_QTY_FLOAT);
                    reqCommand.curr_debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_DEBT_QTY_FLOAT);
                    reqCommand.posi_qty_check_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_CHECK_DIFF_FLOAT);
                    reqCommand.begin_debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_AMT_FLOAT);
                    reqCommand.curr_debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_DEBT_AMT_FLOAT);
                    reqCommand.debt_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_AMT_FLOAT);
                    reqCommand.debt_return_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_AMT_FLOAT);
                    reqCommand.debt_return_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_QTY_FLOAT);
                    reqCommand.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    FuncpdsecuL_21_1Models.Add(reqCommand);
                }
            }
            return FuncpdsecuL_21_1Models;
        }
 
        //逻辑_产品证券_融资融券_查询交易组持仓负债
        public static List<FuncpdsecuL_21_2Model> GetFuncpdsecuL_21_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_21_2Models = new List<FuncpdsecuL_21_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_21_2Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.debt_type = packer.GetIntbyName("debt_type", i);
                reqCommand.begin_debt_qty = packer.GetDoublebyName("begin_debt_qty", i);
                reqCommand.curr_debt_qty = packer.GetDoublebyName("curr_debt_qty", i);
                reqCommand.posi_qty_check_diff = packer.GetDoublebyName("posi_qty_check_diff", i);
                reqCommand.begin_debt_amt = packer.GetDoublebyName("begin_debt_amt", i);
                reqCommand.curr_debt_amt = packer.GetDoublebyName("curr_debt_amt", i);
                reqCommand.debt_interest_amt = packer.GetDoublebyName("debt_interest_amt", i);
                reqCommand.debt_return_amt = packer.GetDoublebyName("debt_return_amt", i);
                reqCommand.debt_return_qty = packer.GetDoublebyName("debt_return_qty", i);
                reqCommand.return_interest_amt = packer.GetDoublebyName("return_interest_amt", i);
 
                FuncpdsecuL_21_2Models.Add(reqCommand);
            }
            return FuncpdsecuL_21_2Models;
        }
 
        //逻辑_产品证券_融资融券_查询交易组持仓负债
        public static List<FuncpdsecuL_21_2Model> GetFuncpdsecuL_21_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_21_2Models = new List<FuncpdsecuL_21_2Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdsecuL_21_2Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    reqCommand.begin_debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_QTY_FLOAT);
                    reqCommand.curr_debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_DEBT_QTY_FLOAT);
                    reqCommand.posi_qty_check_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_CHECK_DIFF_FLOAT);
                    reqCommand.begin_debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_AMT_FLOAT);
                    reqCommand.curr_debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_DEBT_AMT_FLOAT);
                    reqCommand.debt_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_AMT_FLOAT);
                    reqCommand.debt_return_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_AMT_FLOAT);
                    reqCommand.debt_return_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_QTY_FLOAT);
                    reqCommand.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    FuncpdsecuL_21_2Models.Add(reqCommand);
                }
            }
            return FuncpdsecuL_21_2Models;
        }
 
        //逻辑_产品证券_融资融券_查询交易组资金负债
        public static List<FuncpdsecuL_21_3Model> GetFuncpdsecuL_21_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_21_3Models = new List<FuncpdsecuL_21_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_21_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.loan_sell_amt = packer.GetDoublebyName("loan_sell_amt", i);
                reqCommand.debt_interest_amt = packer.GetDoublebyName("debt_interest_amt", i);
 
                FuncpdsecuL_21_3Models.Add(reqCommand);
            }
            return FuncpdsecuL_21_3Models;
        }
 
        //逻辑_产品证券_融资融券_查询交易组资金负债
        public static List<FuncpdsecuL_21_3Model> GetFuncpdsecuL_21_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_21_3Models = new List<FuncpdsecuL_21_3Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdsecuL_21_3Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.loan_sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_SELL_AMT_FLOAT);
                    reqCommand.debt_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_AMT_FLOAT);
                    FuncpdsecuL_21_3Models.Add(reqCommand);
                }
            }
            return FuncpdsecuL_21_3Models;
        }
 
        //逻辑_产品证券_融资融券_查询资产账户资金负债
        public static List<FuncpdsecuL_21_4Model> GetFuncpdsecuL_21_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_21_4Models = new List<FuncpdsecuL_21_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_21_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.loan_sell_amt = packer.GetDoublebyName("loan_sell_amt", i);
                reqCommand.debt_interest_amt = packer.GetDoublebyName("debt_interest_amt", i);
 
                FuncpdsecuL_21_4Models.Add(reqCommand);
            }
            return FuncpdsecuL_21_4Models;
        }
 
        //逻辑_产品证券_融资融券_查询资产账户资金负债
        public static List<FuncpdsecuL_21_4Model> GetFuncpdsecuL_21_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_21_4Models = new List<FuncpdsecuL_21_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdsecuL_21_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.loan_sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_SELL_AMT_FLOAT);
                    reqCommand.debt_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_AMT_FLOAT);
                    FuncpdsecuL_21_4Models.Add(reqCommand);
                }
            }
            return FuncpdsecuL_21_4Models;
        }
 
        //逻辑_产品证券_融资融券_查询资产账户负债明细
        public static List<FuncpdsecuL_21_5Model> GetFuncpdsecuL_21_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_21_5Models = new List<FuncpdsecuL_21_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_21_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.debt_type = packer.GetIntbyName("debt_type", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_fee = packer.GetDoublebyName("strike_fee", i);
                reqCommand.order_no = packer.GetIntbyName("order_no", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.debt_intrst_rate = packer.GetDoublebyName("debt_intrst_rate", i);
                reqCommand.begin_debt_amt = packer.GetDoublebyName("begin_debt_amt", i);
                reqCommand.begin_debt_qty = packer.GetDoublebyName("begin_debt_qty", i);
                reqCommand.debt_amt = packer.GetDoublebyName("debt_amt", i);
                reqCommand.debt_qty = packer.GetDoublebyName("debt_qty", i);
                reqCommand.debt_fee = packer.GetDoublebyName("debt_fee", i);
                reqCommand.debt_interest = packer.GetDoublebyName("debt_interest", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
                reqCommand.debt_return_amt = packer.GetDoublebyName("debt_return_amt", i);
                reqCommand.debt_return_qty = packer.GetDoublebyName("debt_return_qty", i);
                reqCommand.return_interest_amt = packer.GetDoublebyName("return_interest_amt", i);
                reqCommand.interest_update_date = packer.GetIntbyName("interest_update_date", i);
                reqCommand.debt_end_date = packer.GetIntbyName("debt_end_date", i);
                reqCommand.orign_debt_end_date = packer.GetIntbyName("orign_debt_end_date", i);
                reqCommand.defer_times = packer.GetIntbyName("defer_times", i);
                reqCommand.debt_return_date = packer.GetIntbyName("debt_return_date", i);
                reqCommand.debt_status = packer.GetIntbyName("debt_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpdsecuL_21_5Models.Add(reqCommand);
            }
            return FuncpdsecuL_21_5Models;
        }
 
        //逻辑_产品证券_融资融券_查询资产账户负债明细
        public static List<FuncpdsecuL_21_5Model> GetFuncpdsecuL_21_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_21_5Models = new List<FuncpdsecuL_21_5Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdsecuL_21_5Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    reqCommand.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.debt_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTRST_RATE_FLOAT);
                    reqCommand.begin_debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_AMT_FLOAT);
                    reqCommand.begin_debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_QTY_FLOAT);
                    reqCommand.debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_AMT_FLOAT);
                    reqCommand.debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_QTY_FLOAT);
                    reqCommand.debt_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FEE_FLOAT);
                    reqCommand.debt_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    reqCommand.debt_return_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_AMT_FLOAT);
                    reqCommand.debt_return_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_QTY_FLOAT);
                    reqCommand.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    reqCommand.interest_update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTEREST_UPDATE_DATE_INT);
                    reqCommand.debt_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_END_DATE_INT);
                    reqCommand.orign_debt_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORIGN_DEBT_END_DATE_INT);
                    reqCommand.defer_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFER_TIMES_INT);
                    reqCommand.debt_return_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_DATE_INT);
                    reqCommand.debt_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STATUS_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpdsecuL_21_5Models.Add(reqCommand);
                }
            }
            return FuncpdsecuL_21_5Models;
        }
 
        //逻辑_产品证券_融资融券_查询交易组负债明细
        public static List<FuncpdsecuL_21_6Model> GetFuncpdsecuL_21_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpdsecuL_21_6Models = new List<FuncpdsecuL_21_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpdsecuL_21_6Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.debt_type = packer.GetIntbyName("debt_type", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_fee = packer.GetDoublebyName("strike_fee", i);
                reqCommand.order_no = packer.GetIntbyName("order_no", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.debt_intrst_rate = packer.GetDoublebyName("debt_intrst_rate", i);
                reqCommand.begin_debt_amt = packer.GetDoublebyName("begin_debt_amt", i);
                reqCommand.begin_debt_qty = packer.GetDoublebyName("begin_debt_qty", i);
                reqCommand.debt_amt = packer.GetDoublebyName("debt_amt", i);
                reqCommand.debt_qty = packer.GetDoublebyName("debt_qty", i);
                reqCommand.debt_fee = packer.GetDoublebyName("debt_fee", i);
                reqCommand.debt_interest = packer.GetDoublebyName("debt_interest", i);
                reqCommand.intrst_base_amt = packer.GetDoublebyName("intrst_base_amt", i);
                reqCommand.debt_return_amt = packer.GetDoublebyName("debt_return_amt", i);
                reqCommand.debt_return_qty = packer.GetDoublebyName("debt_return_qty", i);
                reqCommand.return_interest_amt = packer.GetDoublebyName("return_interest_amt", i);
                reqCommand.interest_update_date = packer.GetIntbyName("interest_update_date", i);
                reqCommand.debt_end_date = packer.GetIntbyName("debt_end_date", i);
                reqCommand.orign_debt_end_date = packer.GetIntbyName("orign_debt_end_date", i);
                reqCommand.defer_times = packer.GetIntbyName("defer_times", i);
                reqCommand.debt_return_date = packer.GetIntbyName("debt_return_date", i);
                reqCommand.debt_status = packer.GetIntbyName("debt_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpdsecuL_21_6Models.Add(reqCommand);
            }
            return FuncpdsecuL_21_6Models;
        }
 
        //逻辑_产品证券_融资融券_查询交易组负债明细
        public static List<FuncpdsecuL_21_6Model> GetFuncpdsecuL_21_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpdsecuL_21_6Models = new List<FuncpdsecuL_21_6Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpdsecuL_21_6Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.debt_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_TYPE_INT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    reqCommand.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.debt_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTRST_RATE_FLOAT);
                    reqCommand.begin_debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_AMT_FLOAT);
                    reqCommand.begin_debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DEBT_QTY_FLOAT);
                    reqCommand.debt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_AMT_FLOAT);
                    reqCommand.debt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_QTY_FLOAT);
                    reqCommand.debt_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_FEE_FLOAT);
                    reqCommand.debt_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_INTEREST_FLOAT);
                    reqCommand.intrst_base_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_BASE_AMT_FLOAT);
                    reqCommand.debt_return_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_AMT_FLOAT);
                    reqCommand.debt_return_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_QTY_FLOAT);
                    reqCommand.return_interest_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RETURN_INTEREST_AMT_FLOAT);
                    reqCommand.interest_update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTEREST_UPDATE_DATE_INT);
                    reqCommand.debt_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_END_DATE_INT);
                    reqCommand.orign_debt_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORIGN_DEBT_END_DATE_INT);
                    reqCommand.defer_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFER_TIMES_INT);
                    reqCommand.debt_return_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_RETURN_DATE_INT);
                    reqCommand.debt_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEBT_STATUS_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpdsecuL_21_6Models.Add(reqCommand);
                }
            }
            return FuncpdsecuL_21_6Models;
        }
 
    }
}
