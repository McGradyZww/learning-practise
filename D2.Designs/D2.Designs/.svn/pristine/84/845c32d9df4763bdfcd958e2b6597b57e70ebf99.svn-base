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

    public static class RptAsset
    {
        //逻辑_报表_资管报表_T+0持仓盈亏查询
        public static List<FuncrptL_4_1Model> GetFuncrptL_4_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_1Models = new List<FuncrptL_4_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.trade_qty = packer.GetDoublebyName("trade_qty", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.yield_rate = packer.GetDoublebyName("yield_rate", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
 
                FuncrptL_4_1Models.Add(reqCommand);
            }
            return FuncrptL_4_1Models;
        }
 
        //逻辑_报表_资管报表_T+0持仓盈亏查询
        public static List<FuncrptL_4_1Model> GetFuncrptL_4_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_1Models = new List<FuncrptL_4_1Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_1Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    FuncrptL_4_1Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_1Models;
        }
 
        //逻辑_报表_资管报表_T+0券源持仓报表查询
        public static List<FuncrptL_4_2Model> GetFuncrptL_4_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_2Models = new List<FuncrptL_4_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_2Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.source_stock_qty = packer.GetDoublebyName("source_stock_qty", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.yield_rate = packer.GetDoublebyName("yield_rate", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.total_long_curr_qty = packer.GetDoublebyName("total_long_curr_qty", i);
                reqCommand.total_short_curr_qty = packer.GetDoublebyName("total_short_curr_qty", i);
                reqCommand.total_long_open_posi_value = packer.GetDoublebyName("total_long_open_posi_value", i);
                reqCommand.total_short_open_posi_value = packer.GetDoublebyName("total_short_open_posi_value", i);
                reqCommand.total_long_open_posi_fee = packer.GetDoublebyName("total_long_open_posi_fee", i);
                reqCommand.total_short_open_posi_fee = packer.GetDoublebyName("total_short_open_posi_fee", i);
                reqCommand.total_long_close_posi_value = packer.GetDoublebyName("total_long_close_posi_value", i);
                reqCommand.total_short_close_posi_value = packer.GetDoublebyName("total_short_close_posi_value", i);
                reqCommand.total_long_close_posi_qty = packer.GetDoublebyName("total_long_close_posi_qty", i);
                reqCommand.total_short_close_posi_qty = packer.GetDoublebyName("total_short_close_posi_qty", i);
                reqCommand.total_long_close_posi_fee = packer.GetDoublebyName("total_long_close_posi_fee", i);
                reqCommand.total_short_close_posi_fee = packer.GetDoublebyName("total_short_close_posi_fee", i);
                reqCommand.total_realize_pandl = packer.GetDoublebyName("total_realize_pandl", i);
                reqCommand.long_curr_qty = packer.GetDoublebyName("long_curr_qty", i);
                reqCommand.short_curr_qty = packer.GetDoublebyName("short_curr_qty", i);
                reqCommand.long_open_posi_value = packer.GetDoublebyName("long_open_posi_value", i);
                reqCommand.short_open_posi_value = packer.GetDoublebyName("short_open_posi_value", i);
                reqCommand.long_open_posi_fee = packer.GetDoublebyName("long_open_posi_fee", i);
                reqCommand.short_open_posi_fee = packer.GetDoublebyName("short_open_posi_fee", i);
                reqCommand.long_close_posi_qty = packer.GetDoublebyName("long_close_posi_qty", i);
                reqCommand.short_close_posi_qty = packer.GetDoublebyName("short_close_posi_qty", i);
                reqCommand.long_close_posi_value = packer.GetDoublebyName("long_close_posi_value", i);
                reqCommand.short_close_posi_value = packer.GetDoublebyName("short_close_posi_value", i);
                reqCommand.long_close_posi_fee = packer.GetDoublebyName("long_close_posi_fee", i);
                reqCommand.short_close_posi_fee = packer.GetDoublebyName("short_close_posi_fee", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
 
                FuncrptL_4_2Models.Add(reqCommand);
            }
            return FuncrptL_4_2Models;
        }
 
        //逻辑_报表_资管报表_T+0券源持仓报表查询
        public static List<FuncrptL_4_2Model> GetFuncrptL_4_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_2Models = new List<FuncrptL_4_2Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_2Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.source_stock_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_QTY_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.total_long_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CURR_QTY_FLOAT);
                    reqCommand.total_short_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CURR_QTY_FLOAT);
                    reqCommand.total_long_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.total_short_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.total_long_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_OPEN_POSI_FEE_FLOAT);
                    reqCommand.total_short_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_OPEN_POSI_FEE_FLOAT);
                    reqCommand.total_long_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.total_short_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.total_long_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.total_short_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.total_long_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.total_short_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.total_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZE_PANDL_FLOAT);
                    reqCommand.long_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CURR_QTY_FLOAT);
                    reqCommand.short_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CURR_QTY_FLOAT);
                    reqCommand.long_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.short_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.long_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_OPEN_POSI_FEE_FLOAT);
                    reqCommand.short_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_OPEN_POSI_FEE_FLOAT);
                    reqCommand.long_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.short_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.long_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.short_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.long_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.short_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    FuncrptL_4_2Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_2Models;
        }
 
        //逻辑_报表_资管报表_T+0账户交易汇总查询
        public static List<FuncrptL_4_3Model> GetFuncrptL_4_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_3Models = new List<FuncrptL_4_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.trade_amt = packer.GetDoublebyName("trade_amt", i);
                reqCommand.today_pandl = packer.GetDoublebyName("today_pandl", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.yield_rate = packer.GetDoublebyName("yield_rate", i);
 
                FuncrptL_4_3Models.Add(reqCommand);
            }
            return FuncrptL_4_3Models;
        }
 
        //逻辑_报表_资管报表_T+0账户交易汇总查询
        public static List<FuncrptL_4_3Model> GetFuncrptL_4_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_3Models = new List<FuncrptL_4_3Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_3Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    reqCommand.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    FuncrptL_4_3Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_3Models;
        }
 
        //逻辑_报表_资管报表_T+0持仓盈亏历史查询
        public static List<FuncrptL_4_4Model> GetFuncrptL_4_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_4Models = new List<FuncrptL_4_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.trade_qty = packer.GetDoublebyName("trade_qty", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.yield_rate = packer.GetDoublebyName("yield_rate", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
                reqCommand.trade_amt = packer.GetDoublebyName("trade_amt", i);
 
                FuncrptL_4_4Models.Add(reqCommand);
            }
            return FuncrptL_4_4Models;
        }
 
        //逻辑_报表_资管报表_T+0持仓盈亏历史查询
        public static List<FuncrptL_4_4Model> GetFuncrptL_4_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_4Models = new List<FuncrptL_4_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    reqCommand.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    FuncrptL_4_4Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_4Models;
        }
 
        //逻辑_报表_资管报表_T+0券源持仓报表历史查询
        public static List<FuncrptL_4_5Model> GetFuncrptL_4_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_5Models = new List<FuncrptL_4_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.source_stock_qty = packer.GetDoublebyName("source_stock_qty", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.yield_rate = packer.GetDoublebyName("yield_rate", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.total_long_curr_qty = packer.GetDoublebyName("total_long_curr_qty", i);
                reqCommand.total_short_curr_qty = packer.GetDoublebyName("total_short_curr_qty", i);
                reqCommand.total_long_open_posi_value = packer.GetDoublebyName("total_long_open_posi_value", i);
                reqCommand.total_short_open_posi_value = packer.GetDoublebyName("total_short_open_posi_value", i);
                reqCommand.total_long_open_posi_fee = packer.GetDoublebyName("total_long_open_posi_fee", i);
                reqCommand.total_short_open_posi_fee = packer.GetDoublebyName("total_short_open_posi_fee", i);
                reqCommand.total_long_close_posi_value = packer.GetDoublebyName("total_long_close_posi_value", i);
                reqCommand.total_short_close_posi_value = packer.GetDoublebyName("total_short_close_posi_value", i);
                reqCommand.total_long_close_posi_qty = packer.GetDoublebyName("total_long_close_posi_qty", i);
                reqCommand.total_short_close_posi_qty = packer.GetDoublebyName("total_short_close_posi_qty", i);
                reqCommand.total_long_close_posi_fee = packer.GetDoublebyName("total_long_close_posi_fee", i);
                reqCommand.total_short_close_posi_fee = packer.GetDoublebyName("total_short_close_posi_fee", i);
                reqCommand.total_realize_pandl = packer.GetDoublebyName("total_realize_pandl", i);
                reqCommand.long_curr_qty = packer.GetDoublebyName("long_curr_qty", i);
                reqCommand.short_curr_qty = packer.GetDoublebyName("short_curr_qty", i);
                reqCommand.long_open_posi_value = packer.GetDoublebyName("long_open_posi_value", i);
                reqCommand.short_open_posi_value = packer.GetDoublebyName("short_open_posi_value", i);
                reqCommand.long_open_posi_fee = packer.GetDoublebyName("long_open_posi_fee", i);
                reqCommand.short_open_posi_fee = packer.GetDoublebyName("short_open_posi_fee", i);
                reqCommand.long_close_posi_qty = packer.GetDoublebyName("long_close_posi_qty", i);
                reqCommand.short_close_posi_qty = packer.GetDoublebyName("short_close_posi_qty", i);
                reqCommand.long_close_posi_value = packer.GetDoublebyName("long_close_posi_value", i);
                reqCommand.short_close_posi_value = packer.GetDoublebyName("short_close_posi_value", i);
                reqCommand.long_close_posi_fee = packer.GetDoublebyName("long_close_posi_fee", i);
                reqCommand.short_close_posi_fee = packer.GetDoublebyName("short_close_posi_fee", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
 
                FuncrptL_4_5Models.Add(reqCommand);
            }
            return FuncrptL_4_5Models;
        }
 
        //逻辑_报表_资管报表_T+0券源持仓报表历史查询
        public static List<FuncrptL_4_5Model> GetFuncrptL_4_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_5Models = new List<FuncrptL_4_5Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_5Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.source_stock_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_QTY_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.total_long_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CURR_QTY_FLOAT);
                    reqCommand.total_short_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CURR_QTY_FLOAT);
                    reqCommand.total_long_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.total_short_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.total_long_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_OPEN_POSI_FEE_FLOAT);
                    reqCommand.total_short_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_OPEN_POSI_FEE_FLOAT);
                    reqCommand.total_long_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.total_short_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.total_long_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.total_short_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.total_long_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.total_short_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.total_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZE_PANDL_FLOAT);
                    reqCommand.long_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CURR_QTY_FLOAT);
                    reqCommand.short_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CURR_QTY_FLOAT);
                    reqCommand.long_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.short_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.long_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_OPEN_POSI_FEE_FLOAT);
                    reqCommand.short_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_OPEN_POSI_FEE_FLOAT);
                    reqCommand.long_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.short_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.long_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.short_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.long_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.short_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    FuncrptL_4_5Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_5Models;
        }
 
        //逻辑_报表_资管报表_T+0账户交易汇总历史查询
        public static List<FuncrptL_4_6Model> GetFuncrptL_4_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_6Models = new List<FuncrptL_4_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_6Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.trade_amt = packer.GetDoublebyName("trade_amt", i);
                reqCommand.today_pandl = packer.GetDoublebyName("today_pandl", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.yield_rate = packer.GetDoublebyName("yield_rate", i);
 
                FuncrptL_4_6Models.Add(reqCommand);
            }
            return FuncrptL_4_6Models;
        }
 
        //逻辑_报表_资管报表_T+0账户交易汇总历史查询
        public static List<FuncrptL_4_6Model> GetFuncrptL_4_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_6Models = new List<FuncrptL_4_6Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_6Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    reqCommand.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    FuncrptL_4_6Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_6Models;
        }
 
        //逻辑_报表_资管报表_报表产品持仓汇总查询
        public static List<FuncrptL_4_7Model> GetFuncrptL_4_7Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_7Models = new List<FuncrptL_4_7Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_7Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.today_buy_qty = packer.GetDoublebyName("today_buy_qty", i);
                reqCommand.today_sell_qty = packer.GetDoublebyName("today_sell_qty", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.today_close_price = packer.GetDoublebyName("today_close_price", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
 
                FuncrptL_4_7Models.Add(reqCommand);
            }
            return FuncrptL_4_7Models;
        }
 
        //逻辑_报表_资管报表_报表产品持仓汇总查询
        public static List<FuncrptL_4_7Model> GetFuncrptL_4_7Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_7Models = new List<FuncrptL_4_7Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_7Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.today_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_QTY_FLOAT);
                    reqCommand.today_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_QTY_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    FuncrptL_4_7Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_7Models;
        }
 
        //逻辑_报表_资管报表_报表机构持仓汇总查询
        public static List<FuncrptL_4_8Model> GetFuncrptL_4_8Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_8Models = new List<FuncrptL_4_8Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_8Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.today_buy_qty = packer.GetDoublebyName("today_buy_qty", i);
                reqCommand.today_sell_qty = packer.GetDoublebyName("today_sell_qty", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.today_close_price = packer.GetDoublebyName("today_close_price", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.posi_nav_ratio = packer.GetDoublebyName("posi_nav_ratio", i);
 
                FuncrptL_4_8Models.Add(reqCommand);
            }
            return FuncrptL_4_8Models;
        }
 
        //逻辑_报表_资管报表_报表机构持仓汇总查询
        public static List<FuncrptL_4_8Model> GetFuncrptL_4_8Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_8Models = new List<FuncrptL_4_8Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_8Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.today_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_QTY_FLOAT);
                    reqCommand.today_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_QTY_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    FuncrptL_4_8Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_8Models;
        }
 
        //逻辑_报表_资管报表_报表产品持仓交易汇总查询
        public static List<FuncrptL_4_9Model> GetFuncrptL_4_9Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_9Models = new List<FuncrptL_4_9Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_9Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.pre_holding_qty = packer.GetDoublebyName("pre_holding_qty", i);
                reqCommand.today_buy_qty = packer.GetDoublebyName("today_buy_qty", i);
                reqCommand.today_buy_amt = packer.GetDoublebyName("today_buy_amt", i);
                reqCommand.today_buy_price = packer.GetDoublebyName("today_buy_price", i);
                reqCommand.buy_begin_time = packer.GetIntbyName("buy_begin_time", i);
                reqCommand.buy_end_time = packer.GetIntbyName("buy_end_time", i);
                reqCommand.today_sell_qty = packer.GetDoublebyName("today_sell_qty", i);
                reqCommand.today_sell_amt = packer.GetDoublebyName("today_sell_amt", i);
                reqCommand.today_sell_price = packer.GetDoublebyName("today_sell_price", i);
                reqCommand.sell_begin_time = packer.GetIntbyName("sell_begin_time", i);
                reqCommand.sell_end_time = packer.GetIntbyName("sell_end_time", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.today_close_price = packer.GetDoublebyName("today_close_price", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
 
                FuncrptL_4_9Models.Add(reqCommand);
            }
            return FuncrptL_4_9Models;
        }
 
        //逻辑_报表_资管报表_报表产品持仓交易汇总查询
        public static List<FuncrptL_4_9Model> GetFuncrptL_4_9Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_9Models = new List<FuncrptL_4_9Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_9Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.pre_holding_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_HOLDING_QTY_FLOAT);
                    reqCommand.today_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_QTY_FLOAT);
                    reqCommand.today_buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_AMT_FLOAT);
                    reqCommand.today_buy_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_PRICE_FLOAT);
                    reqCommand.buy_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_BEGIN_TIME_INT);
                    reqCommand.buy_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_END_TIME_INT);
                    reqCommand.today_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_QTY_FLOAT);
                    reqCommand.today_sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_AMT_FLOAT);
                    reqCommand.today_sell_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_PRICE_FLOAT);
                    reqCommand.sell_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_BEGIN_TIME_INT);
                    reqCommand.sell_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_END_TIME_INT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    FuncrptL_4_9Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_9Models;
        }
 
        //逻辑_报表_资管报表_产品账户证券重仓股持仓查询
        public static List<FuncrptL_4_10Model> GetFuncrptL_4_10Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_10Models = new List<FuncrptL_4_10Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_10Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.float_pandl_ratio = packer.GetDoublebyName("float_pandl_ratio", i);
                reqCommand.market_value_ratio = packer.GetDoublebyName("market_value_ratio", i);
                reqCommand.nav_ratio = packer.GetDoublebyName("nav_ratio", i);
 
                FuncrptL_4_10Models.Add(reqCommand);
            }
            return FuncrptL_4_10Models;
        }
 
        //逻辑_报表_资管报表_产品账户证券重仓股持仓查询
        public static List<FuncrptL_4_10Model> GetFuncrptL_4_10Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_10Models = new List<FuncrptL_4_10Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_10Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.float_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_RATIO_FLOAT);
                    reqCommand.market_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_RATIO_FLOAT);
                    reqCommand.nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_RATIO_FLOAT);
                    FuncrptL_4_10Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_10Models;
        }
 
        //逻辑_报表_资管报表_交易单元证券重仓股持仓查询
        public static List<FuncrptL_4_11Model> GetFuncrptL_4_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_11Models = new List<FuncrptL_4_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_11Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.float_pandl_ratio = packer.GetDoublebyName("float_pandl_ratio", i);
                reqCommand.market_value_ratio = packer.GetDoublebyName("market_value_ratio", i);
                reqCommand.nav_ratio = packer.GetDoublebyName("nav_ratio", i);
 
                FuncrptL_4_11Models.Add(reqCommand);
            }
            return FuncrptL_4_11Models;
        }
 
        //逻辑_报表_资管报表_交易单元证券重仓股持仓查询
        public static List<FuncrptL_4_11Model> GetFuncrptL_4_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_11Models = new List<FuncrptL_4_11Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_11Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.float_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_RATIO_FLOAT);
                    reqCommand.market_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_RATIO_FLOAT);
                    reqCommand.nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_RATIO_FLOAT);
                    FuncrptL_4_11Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_11Models;
        }
 
        //逻辑_报表_资管报表_证券持仓汇总查询
        public static List<FuncrptL_4_12Model> GetFuncrptL_4_12Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_12Models = new List<FuncrptL_4_12Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_12Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.comm_capt_qty = packer.GetDoublebyName("comm_capt_qty", i);
                reqCommand.comm_releas_qty = packer.GetDoublebyName("comm_releas_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.pandl_ratio = packer.GetDoublebyName("pandl_ratio", i);
                reqCommand.trade_avail_qty = packer.GetDoublebyName("trade_avail_qty", i);
                reqCommand.comm_avail_qty = packer.GetDoublebyName("comm_avail_qty", i);
                reqCommand.static_avail_qty = packer.GetDoublebyName("static_avail_qty", i);
                reqCommand.posi_nav_ratio = packer.GetDoublebyName("posi_nav_ratio", i);
                reqCommand.bond_receivable_amt = packer.GetDoublebyName("bond_receivable_amt", i);
                reqCommand.full_holding_amt = packer.GetDoublebyName("full_holding_amt", i);
                reqCommand.impawn_qty = packer.GetDoublebyName("impawn_qty", i);
 
                FuncrptL_4_12Models.Add(reqCommand);
            }
            return FuncrptL_4_12Models;
        }
 
        //逻辑_报表_资管报表_证券持仓汇总查询
        public static List<FuncrptL_4_12Model> GetFuncrptL_4_12Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_12Models = new List<FuncrptL_4_12Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_12Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    reqCommand.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    reqCommand.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                    reqCommand.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                    reqCommand.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                    reqCommand.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    reqCommand.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    reqCommand.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    reqCommand.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    FuncrptL_4_12Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_12Models;
        }
 
        //逻辑_报表_资管报表_历史证券持仓汇总查询
        public static List<FuncrptL_4_13Model> GetFuncrptL_4_13Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_13Models = new List<FuncrptL_4_13Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_13Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.comm_capt_qty = packer.GetDoublebyName("comm_capt_qty", i);
                reqCommand.comm_releas_qty = packer.GetDoublebyName("comm_releas_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.pandl_ratio = packer.GetDoublebyName("pandl_ratio", i);
                reqCommand.trade_avail_qty = packer.GetDoublebyName("trade_avail_qty", i);
                reqCommand.comm_avail_qty = packer.GetDoublebyName("comm_avail_qty", i);
                reqCommand.static_avail_qty = packer.GetDoublebyName("static_avail_qty", i);
                reqCommand.posi_nav_ratio = packer.GetDoublebyName("posi_nav_ratio", i);
                reqCommand.bond_receivable_amt = packer.GetDoublebyName("bond_receivable_amt", i);
                reqCommand.full_holding_amt = packer.GetDoublebyName("full_holding_amt", i);
                reqCommand.impawn_qty = packer.GetDoublebyName("impawn_qty", i);
 
                FuncrptL_4_13Models.Add(reqCommand);
            }
            return FuncrptL_4_13Models;
        }
 
        //逻辑_报表_资管报表_历史证券持仓汇总查询
        public static List<FuncrptL_4_13Model> GetFuncrptL_4_13Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_13Models = new List<FuncrptL_4_13Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_13Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    reqCommand.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    reqCommand.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                    reqCommand.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                    reqCommand.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                    reqCommand.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    reqCommand.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    reqCommand.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    reqCommand.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    FuncrptL_4_13Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_13Models;
        }
 
        //逻辑_报表_资管报表_T+0账户盈亏报表查询
        public static List<FuncrptL_4_14Model> GetFuncrptL_4_14Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_14Models = new List<FuncrptL_4_14Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_14Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.trade_amt = packer.GetDoublebyName("trade_amt", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.buy_qty = packer.GetDoublebyName("buy_qty", i);
                reqCommand.buy_amt = packer.GetDoublebyName("buy_amt", i);
                reqCommand.sell_qty = packer.GetDoublebyName("sell_qty", i);
                reqCommand.sellout_amt = packer.GetDoublebyName("sellout_amt", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.yield_rate = packer.GetDoublebyName("yield_rate", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.trade_qty = packer.GetDoublebyName("trade_qty", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
 
                FuncrptL_4_14Models.Add(reqCommand);
            }
            return FuncrptL_4_14Models;
        }
 
        //逻辑_报表_资管报表_T+0账户盈亏报表查询
        public static List<FuncrptL_4_14Model> GetFuncrptL_4_14Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_14Models = new List<FuncrptL_4_14Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_14Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_FLOAT);
                    reqCommand.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    reqCommand.sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_FLOAT);
                    reqCommand.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    FuncrptL_4_14Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_14Models;
        }
 
        //逻辑_报表_资管报表_T+0账户盈亏报表历史查询
        public static List<FuncrptL_4_15Model> GetFuncrptL_4_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_15Models = new List<FuncrptL_4_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_15Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.today_pandl = packer.GetDoublebyName("today_pandl", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.trade_amt = packer.GetDoublebyName("trade_amt", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.buy_qty = packer.GetDoublebyName("buy_qty", i);
                reqCommand.buy_amt = packer.GetDoublebyName("buy_amt", i);
                reqCommand.sell_qty = packer.GetDoublebyName("sell_qty", i);
                reqCommand.sellout_amt = packer.GetDoublebyName("sellout_amt", i);
 
                FuncrptL_4_15Models.Add(reqCommand);
            }
            return FuncrptL_4_15Models;
        }
 
        //逻辑_报表_资管报表_T+0账户盈亏报表历史查询
        public static List<FuncrptL_4_15Model> GetFuncrptL_4_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_15Models = new List<FuncrptL_4_15Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_15Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_FLOAT);
                    reqCommand.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    reqCommand.sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_FLOAT);
                    reqCommand.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    FuncrptL_4_15Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_15Models;
        }
 
        //逻辑_报表_资管报表_T+0账户敞口报表查询
        public static List<FuncrptL_4_16Model> GetFuncrptL_4_16Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_16Models = new List<FuncrptL_4_16Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_16Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.close_posi_fee = packer.GetDoublebyName("close_posi_fee", i);
                reqCommand.un_close_posi_qty = packer.GetDoublebyName("un_close_posi_qty", i);
                reqCommand.un_close_marke_value = packer.GetDoublebyName("un_close_marke_value", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
 
                FuncrptL_4_16Models.Add(reqCommand);
            }
            return FuncrptL_4_16Models;
        }
 
        //逻辑_报表_资管报表_T+0账户敞口报表查询
        public static List<FuncrptL_4_16Model> GetFuncrptL_4_16Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_16Models = new List<FuncrptL_4_16Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_16Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    FuncrptL_4_16Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_16Models;
        }
 
        //逻辑_报表_资管报表_T+0账户敞口报表历史查询
        public static List<FuncrptL_4_17Model> GetFuncrptL_4_17Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_17Models = new List<FuncrptL_4_17Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_17Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.trade_qty = packer.GetDoublebyName("trade_qty", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.yield_rate = packer.GetDoublebyName("yield_rate", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
                reqCommand.trade_amt = packer.GetDoublebyName("trade_amt", i);
                reqCommand.un_close_posi_qty = packer.GetDoublebyName("un_close_posi_qty", i);
                reqCommand.un_close_marke_value = packer.GetDoublebyName("un_close_marke_value", i);
 
                FuncrptL_4_17Models.Add(reqCommand);
            }
            return FuncrptL_4_17Models;
        }
 
        //逻辑_报表_资管报表_T+0账户敞口报表历史查询
        public static List<FuncrptL_4_17Model> GetFuncrptL_4_17Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_17Models = new List<FuncrptL_4_17Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_17Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    reqCommand.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    reqCommand.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    FuncrptL_4_17Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_17Models;
        }
 
        //逻辑_报表_资管报表_证券成交流水明细查询
        public static List<FuncrptL_4_18Model> GetFuncrptL_4_18Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_18Models = new List<FuncrptL_4_18Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_18Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.order_no = packer.GetIntbyName("order_no", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.strike_id = packer.GetInt64byName("strike_id", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.busi_opor_no = packer.GetIntbyName("busi_opor_no", i);
                reqCommand.busi_opor_name = packer.GetStrbyName("busi_opor_name", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.full_execution_amt = packer.GetDoublebyName("full_execution_amt", i);
                reqCommand.strike_aver_price = packer.GetDoublebyName("strike_aver_price", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.record_valid_flag = packer.GetIntbyName("record_valid_flag", i);
 
                FuncrptL_4_18Models.Add(reqCommand);
            }
            return FuncrptL_4_18Models;
        }
 
        //逻辑_报表_资管报表_证券成交流水明细查询
        public static List<FuncrptL_4_18Model> GetFuncrptL_4_18Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_18Models = new List<FuncrptL_4_18Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_18Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    reqCommand.strike_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ID_INT64);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.busi_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT);
                    reqCommand.busi_opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NAME_STR);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.full_execution_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_EXECUTION_AMT_FLOAT);
                    reqCommand.strike_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.record_valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_VALID_FLAG_INT);
                    FuncrptL_4_18Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_18Models;
        }
 
        //逻辑_报表_资管报表_证券成交流水历史查询
        public static List<FuncrptL_4_19Model> GetFuncrptL_4_19Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_19Models = new List<FuncrptL_4_19Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_19Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.order_no = packer.GetIntbyName("order_no", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.strike_id = packer.GetInt64byName("strike_id", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.busi_opor_no = packer.GetIntbyName("busi_opor_no", i);
                reqCommand.busi_opor_name = packer.GetStrbyName("busi_opor_name", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.full_execution_amt = packer.GetDoublebyName("full_execution_amt", i);
                reqCommand.strike_aver_price = packer.GetDoublebyName("strike_aver_price", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.record_valid_flag = packer.GetIntbyName("record_valid_flag", i);
 
                FuncrptL_4_19Models.Add(reqCommand);
            }
            return FuncrptL_4_19Models;
        }
 
        //逻辑_报表_资管报表_证券成交流水历史查询
        public static List<FuncrptL_4_19Model> GetFuncrptL_4_19Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_19Models = new List<FuncrptL_4_19Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_19Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    reqCommand.strike_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ID_INT64);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.busi_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT);
                    reqCommand.busi_opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NAME_STR);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.full_execution_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_EXECUTION_AMT_FLOAT);
                    reqCommand.strike_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.record_valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_VALID_FLAG_INT);
                    FuncrptL_4_19Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_19Models;
        }
 
        //逻辑_报表_资管报表_T+0账户月盈亏报表查询
        public static List<FuncrptL_4_20Model> GetFuncrptL_4_20Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_20Models = new List<FuncrptL_4_20Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_20Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.opor_name = packer.GetStrbyName("opor_name", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.month_pandl = packer.GetDoublebyName("month_pandl", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.trade_amt = packer.GetDoublebyName("trade_amt", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.buy_amt = packer.GetDoublebyName("buy_amt", i);
                reqCommand.sell_amt = packer.GetDoublebyName("sell_amt", i);
 
                FuncrptL_4_20Models.Add(reqCommand);
            }
            return FuncrptL_4_20Models;
        }
 
        //逻辑_报表_资管报表_T+0账户月盈亏报表查询
        public static List<FuncrptL_4_20Model> GetFuncrptL_4_20Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_20Models = new List<FuncrptL_4_20Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_20Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.month_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONTH_PANDL_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    reqCommand.sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AMT_FLOAT);
                    FuncrptL_4_20Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_20Models;
        }
 
        //逻辑_报表_资管报表_T+0账户月盈亏报表历史查询
        public static List<FuncrptL_4_21Model> GetFuncrptL_4_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_21Models = new List<FuncrptL_4_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_21Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.curr_month = packer.GetIntbyName("curr_month", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.opor_name = packer.GetStrbyName("opor_name", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.month_pandl = packer.GetDoublebyName("month_pandl", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.trade_amt = packer.GetDoublebyName("trade_amt", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.buy_amt = packer.GetDoublebyName("buy_amt", i);
                reqCommand.sell_amt = packer.GetDoublebyName("sell_amt", i);
                reqCommand.yield_rate = packer.GetDoublebyName("yield_rate", i);
 
                FuncrptL_4_21Models.Add(reqCommand);
            }
            return FuncrptL_4_21Models;
        }
 
        //逻辑_报表_资管报表_T+0账户月盈亏报表历史查询
        public static List<FuncrptL_4_21Model> GetFuncrptL_4_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_21Models = new List<FuncrptL_4_21Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_21Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.month_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONTH_PANDL_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    reqCommand.sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AMT_FLOAT);
                    reqCommand.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    FuncrptL_4_21Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_21Models;
        }
 
        //逻辑_报表_资管报表_T+0账户盈亏专用报表查询
        public static List<FuncrptL_4_27Model> GetFuncrptL_4_27Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_27Models = new List<FuncrptL_4_27Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_27Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.trade_qty = packer.GetDoublebyName("trade_qty", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.yield_rate = packer.GetDoublebyName("yield_rate", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
                reqCommand.trade_amt = packer.GetDoublebyName("trade_amt", i);
 
                FuncrptL_4_27Models.Add(reqCommand);
            }
            return FuncrptL_4_27Models;
        }
 
        //逻辑_报表_资管报表_T+0账户盈亏专用报表查询
        public static List<FuncrptL_4_27Model> GetFuncrptL_4_27Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_27Models = new List<FuncrptL_4_27Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_27Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    reqCommand.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    FuncrptL_4_27Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_27Models;
        }
 
        //逻辑_报表_资管报表_T+0账户盈亏专用报表历史查询
        public static List<FuncrptL_4_28Model> GetFuncrptL_4_28Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_28Models = new List<FuncrptL_4_28Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_28Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.trade_qty = packer.GetDoublebyName("trade_qty", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.yield_rate = packer.GetDoublebyName("yield_rate", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
                reqCommand.trade_amt = packer.GetDoublebyName("trade_amt", i);
 
                FuncrptL_4_28Models.Add(reqCommand);
            }
            return FuncrptL_4_28Models;
        }
 
        //逻辑_报表_资管报表_T+0账户盈亏专用报表历史查询
        public static List<FuncrptL_4_28Model> GetFuncrptL_4_28Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_28Models = new List<FuncrptL_4_28Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_28Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    reqCommand.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    FuncrptL_4_28Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_28Models;
        }
 
        //逻辑_报表_资管报表_查询产品资产
        public static List<FuncrptL_4_31Model> GetFuncrptL_4_31Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_31Models = new List<FuncrptL_4_31Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_31Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_all_share = packer.GetDoublebyName("pd_all_share", i);
                reqCommand.curr_share = packer.GetDoublebyName("curr_share", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.pre_nav = packer.GetDoublebyName("pre_nav", i);
                reqCommand.nav_fluct = packer.GetDoublebyName("nav_fluct", i);
                reqCommand.cash_asset = packer.GetDoublebyName("cash_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.money_fund_asset = packer.GetDoublebyName("money_fund_asset", i);
                reqCommand.not_money_fund_asset = packer.GetDoublebyName("not_money_fund_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.hk_thrgh_stock_asset = packer.GetDoublebyName("hk_thrgh_stock_asset", i);
                reqCommand.futu_asset = packer.GetDoublebyName("futu_asset", i);
                reqCommand.assign_avail_amt = packer.GetDoublebyName("assign_avail_amt", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.today_pandl = packer.GetDoublebyName("today_pandl", i);
                reqCommand.daily_pandl_ratio = packer.GetDoublebyName("daily_pandl_ratio", i);
                reqCommand.cash_out_amt = packer.GetDoublebyName("cash_out_amt", i);
                reqCommand.stock_asset_ratio = packer.GetDoublebyName("stock_asset_ratio", i);
                reqCommand.securities_ratio = packer.GetDoublebyName("securities_ratio", i);
                reqCommand.fund_asset_ratio = packer.GetDoublebyName("fund_asset_ratio", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
                reqCommand.avail_cash = packer.GetDoublebyName("avail_cash", i);
                reqCommand.capit_bala = packer.GetDoublebyName("capit_bala", i);
                reqCommand.avail_amt = packer.GetDoublebyName("avail_amt", i);
                reqCommand.total_change_amt = packer.GetDoublebyName("total_change_amt", i);
                reqCommand.futu_cash_asset = packer.GetDoublebyName("futu_cash_asset", i);
                reqCommand.total_cash_asset = packer.GetDoublebyName("total_cash_asset", i);
                reqCommand.stock_cash_asset = packer.GetDoublebyName("stock_cash_asset", i);
                reqCommand.capt_margin = packer.GetDoublebyName("capt_margin", i);
                reqCommand.total_fina_debt = packer.GetDoublebyName("total_fina_debt", i);
                reqCommand.total_loan_debt = packer.GetDoublebyName("total_loan_debt", i);
 
                FuncrptL_4_31Models.Add(reqCommand);
            }
            return FuncrptL_4_31Models;
        }
 
        //逻辑_报表_资管报表_查询产品资产
        public static List<FuncrptL_4_31Model> GetFuncrptL_4_31Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_31Models = new List<FuncrptL_4_31Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_31Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    reqCommand.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    reqCommand.nav_fluct = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_FLUCT_FLOAT);
                    reqCommand.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    reqCommand.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    reqCommand.assign_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGN_AVAIL_AMT_FLOAT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    reqCommand.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    reqCommand.cash_out_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_OUT_AMT_FLOAT);
                    reqCommand.stock_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_RATIO_FLOAT);
                    reqCommand.securities_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECURITIES_RATIO_FLOAT);
                    reqCommand.fund_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_RATIO_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.avail_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_CASH_FLOAT);
                    reqCommand.capit_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_BALA_FLOAT);
                    reqCommand.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    reqCommand.total_change_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CHANGE_AMT_FLOAT);
                    reqCommand.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    reqCommand.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    reqCommand.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    reqCommand.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    reqCommand.total_fina_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_FINA_DEBT_FLOAT);
                    reqCommand.total_loan_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LOAN_DEBT_FLOAT);
                    FuncrptL_4_31Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_31Models;
        }
 
        //逻辑_报表_资管报表_查询交易组资产
        public static List<FuncrptL_4_32Model> GetFuncrptL_4_32Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_32Models = new List<FuncrptL_4_32Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_32Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.exch_group_pd_share = packer.GetDoublebyName("exch_group_pd_share", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.pre_nav = packer.GetDoublebyName("pre_nav", i);
                reqCommand.nav_fluct = packer.GetDoublebyName("nav_fluct", i);
                reqCommand.cash_asset = packer.GetDoublebyName("cash_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.money_fund_asset = packer.GetDoublebyName("money_fund_asset", i);
                reqCommand.not_money_fund_asset = packer.GetDoublebyName("not_money_fund_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.futu_asset = packer.GetDoublebyName("futu_asset", i);
                reqCommand.hk_thrgh_stock_asset = packer.GetDoublebyName("hk_thrgh_stock_asset", i);
                reqCommand.assign_avail_amt = packer.GetDoublebyName("assign_avail_amt", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.today_pandl = packer.GetDoublebyName("today_pandl", i);
                reqCommand.daily_pandl_ratio = packer.GetDoublebyName("daily_pandl_ratio", i);
                reqCommand.total_realiz_pandl = packer.GetDoublebyName("total_realiz_pandl", i);
                reqCommand.total_realiz_pandl_ratio = packer.GetDoublebyName("total_realiz_pandl_ratio", i);
                reqCommand.posi_ratio = packer.GetDoublebyName("posi_ratio", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
                reqCommand.avail_cash = packer.GetDoublebyName("avail_cash", i);
                reqCommand.capit_bala = packer.GetDoublebyName("capit_bala", i);
                reqCommand.avail_amt = packer.GetDoublebyName("avail_amt", i);
                reqCommand.total_change_amt = packer.GetDoublebyName("total_change_amt", i);
                reqCommand.futu_cash_asset = packer.GetDoublebyName("futu_cash_asset", i);
                reqCommand.total_cash_asset = packer.GetDoublebyName("total_cash_asset", i);
                reqCommand.stock_cash_asset = packer.GetDoublebyName("stock_cash_asset", i);
                reqCommand.hk_avail_amt = packer.GetDoublebyName("hk_avail_amt", i);
                reqCommand.total_fina_debt = packer.GetDoublebyName("total_fina_debt", i);
                reqCommand.total_loan_debt = packer.GetDoublebyName("total_loan_debt", i);
 
                FuncrptL_4_32Models.Add(reqCommand);
            }
            return FuncrptL_4_32Models;
        }
 
        //逻辑_报表_资管报表_查询交易组资产
        public static List<FuncrptL_4_32Model> GetFuncrptL_4_32Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_32Models = new List<FuncrptL_4_32Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_32Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.exch_group_pd_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    reqCommand.nav_fluct = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_FLUCT_FLOAT);
                    reqCommand.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    reqCommand.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    reqCommand.assign_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGN_AVAIL_AMT_FLOAT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    reqCommand.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    reqCommand.total_realiz_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_FLOAT);
                    reqCommand.total_realiz_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_RATIO_FLOAT);
                    reqCommand.posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_RATIO_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.avail_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_CASH_FLOAT);
                    reqCommand.capit_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_BALA_FLOAT);
                    reqCommand.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    reqCommand.total_change_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CHANGE_AMT_FLOAT);
                    reqCommand.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    reqCommand.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    reqCommand.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    reqCommand.hk_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_AVAIL_AMT_FLOAT);
                    reqCommand.total_fina_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_FINA_DEBT_FLOAT);
                    reqCommand.total_loan_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LOAN_DEBT_FLOAT);
                    FuncrptL_4_32Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_32Models;
        }
 
        //逻辑_报表_资管报表_查询产品资产_历史
        public static List<FuncrptL_4_33Model> GetFuncrptL_4_33Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_33Models = new List<FuncrptL_4_33Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_33Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_all_share = packer.GetDoublebyName("pd_all_share", i);
                reqCommand.curr_share = packer.GetDoublebyName("curr_share", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.pre_nav = packer.GetDoublebyName("pre_nav", i);
                reqCommand.nav_fluct = packer.GetDoublebyName("nav_fluct", i);
                reqCommand.cash_asset = packer.GetDoublebyName("cash_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.money_fund_asset = packer.GetDoublebyName("money_fund_asset", i);
                reqCommand.not_money_fund_asset = packer.GetDoublebyName("not_money_fund_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.hk_thrgh_stock_asset = packer.GetDoublebyName("hk_thrgh_stock_asset", i);
                reqCommand.futu_asset = packer.GetDoublebyName("futu_asset", i);
                reqCommand.assign_avail_amt = packer.GetDoublebyName("assign_avail_amt", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.today_pandl = packer.GetDoublebyName("today_pandl", i);
                reqCommand.daily_pandl_ratio = packer.GetDoublebyName("daily_pandl_ratio", i);
                reqCommand.cash_out_amt = packer.GetDoublebyName("cash_out_amt", i);
                reqCommand.stock_asset_ratio = packer.GetDoublebyName("stock_asset_ratio", i);
                reqCommand.securities_ratio = packer.GetDoublebyName("securities_ratio", i);
                reqCommand.fund_asset_ratio = packer.GetDoublebyName("fund_asset_ratio", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
                reqCommand.avail_cash = packer.GetDoublebyName("avail_cash", i);
                reqCommand.capit_bala = packer.GetDoublebyName("capit_bala", i);
                reqCommand.avail_amt = packer.GetDoublebyName("avail_amt", i);
                reqCommand.total_change_amt = packer.GetDoublebyName("total_change_amt", i);
                reqCommand.futu_cash_asset = packer.GetDoublebyName("futu_cash_asset", i);
                reqCommand.total_cash_asset = packer.GetDoublebyName("total_cash_asset", i);
                reqCommand.stock_cash_asset = packer.GetDoublebyName("stock_cash_asset", i);
                reqCommand.capt_margin = packer.GetDoublebyName("capt_margin", i);
                reqCommand.total_fina_debt = packer.GetDoublebyName("total_fina_debt", i);
                reqCommand.total_loan_debt = packer.GetDoublebyName("total_loan_debt", i);
 
                FuncrptL_4_33Models.Add(reqCommand);
            }
            return FuncrptL_4_33Models;
        }
 
        //逻辑_报表_资管报表_查询产品资产_历史
        public static List<FuncrptL_4_33Model> GetFuncrptL_4_33Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_33Models = new List<FuncrptL_4_33Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_33Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    reqCommand.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    reqCommand.nav_fluct = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_FLUCT_FLOAT);
                    reqCommand.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    reqCommand.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    reqCommand.assign_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGN_AVAIL_AMT_FLOAT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    reqCommand.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    reqCommand.cash_out_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_OUT_AMT_FLOAT);
                    reqCommand.stock_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_RATIO_FLOAT);
                    reqCommand.securities_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECURITIES_RATIO_FLOAT);
                    reqCommand.fund_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_RATIO_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.avail_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_CASH_FLOAT);
                    reqCommand.capit_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_BALA_FLOAT);
                    reqCommand.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    reqCommand.total_change_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CHANGE_AMT_FLOAT);
                    reqCommand.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    reqCommand.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    reqCommand.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    reqCommand.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    reqCommand.total_fina_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_FINA_DEBT_FLOAT);
                    reqCommand.total_loan_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LOAN_DEBT_FLOAT);
                    FuncrptL_4_33Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_33Models;
        }
 
        //逻辑_报表_资管报表_查询交易组资产_历史
        public static List<FuncrptL_4_34Model> GetFuncrptL_4_34Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_34Models = new List<FuncrptL_4_34Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_34Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.exch_group_pd_share = packer.GetDoublebyName("exch_group_pd_share", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.pre_nav = packer.GetDoublebyName("pre_nav", i);
                reqCommand.nav_fluct = packer.GetDoublebyName("nav_fluct", i);
                reqCommand.cash_asset = packer.GetDoublebyName("cash_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.money_fund_asset = packer.GetDoublebyName("money_fund_asset", i);
                reqCommand.not_money_fund_asset = packer.GetDoublebyName("not_money_fund_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.futu_asset = packer.GetDoublebyName("futu_asset", i);
                reqCommand.hk_thrgh_stock_asset = packer.GetDoublebyName("hk_thrgh_stock_asset", i);
                reqCommand.assign_avail_amt = packer.GetDoublebyName("assign_avail_amt", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.today_pandl = packer.GetDoublebyName("today_pandl", i);
                reqCommand.daily_pandl_ratio = packer.GetDoublebyName("daily_pandl_ratio", i);
                reqCommand.total_realiz_pandl = packer.GetDoublebyName("total_realiz_pandl", i);
                reqCommand.total_realiz_pandl_ratio = packer.GetDoublebyName("total_realiz_pandl_ratio", i);
                reqCommand.posi_ratio = packer.GetDoublebyName("posi_ratio", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
                reqCommand.avail_cash = packer.GetDoublebyName("avail_cash", i);
                reqCommand.capit_bala = packer.GetDoublebyName("capit_bala", i);
                reqCommand.avail_amt = packer.GetDoublebyName("avail_amt", i);
                reqCommand.total_change_amt = packer.GetDoublebyName("total_change_amt", i);
                reqCommand.futu_cash_asset = packer.GetDoublebyName("futu_cash_asset", i);
                reqCommand.total_cash_asset = packer.GetDoublebyName("total_cash_asset", i);
                reqCommand.stock_cash_asset = packer.GetDoublebyName("stock_cash_asset", i);
                reqCommand.hk_avail_amt = packer.GetDoublebyName("hk_avail_amt", i);
                reqCommand.total_fina_debt = packer.GetDoublebyName("total_fina_debt", i);
                reqCommand.total_loan_debt = packer.GetDoublebyName("total_loan_debt", i);
 
                FuncrptL_4_34Models.Add(reqCommand);
            }
            return FuncrptL_4_34Models;
        }
 
        //逻辑_报表_资管报表_查询交易组资产_历史
        public static List<FuncrptL_4_34Model> GetFuncrptL_4_34Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_34Models = new List<FuncrptL_4_34Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_34Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.exch_group_pd_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    reqCommand.nav_fluct = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_FLUCT_FLOAT);
                    reqCommand.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    reqCommand.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    reqCommand.assign_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGN_AVAIL_AMT_FLOAT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    reqCommand.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    reqCommand.total_realiz_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_FLOAT);
                    reqCommand.total_realiz_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_RATIO_FLOAT);
                    reqCommand.posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_RATIO_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.avail_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_CASH_FLOAT);
                    reqCommand.capit_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_BALA_FLOAT);
                    reqCommand.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    reqCommand.total_change_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CHANGE_AMT_FLOAT);
                    reqCommand.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    reqCommand.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    reqCommand.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    reqCommand.hk_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_AVAIL_AMT_FLOAT);
                    reqCommand.total_fina_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_FINA_DEBT_FLOAT);
                    reqCommand.total_loan_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LOAN_DEBT_FLOAT);
                    FuncrptL_4_34Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_34Models;
        }
 
        //逻辑_报表_资管报表_查询_产品_证券持仓
        public static List<FuncrptL_4_35Model> GetFuncrptL_4_35Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_35Models = new List<FuncrptL_4_35Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_35Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.pre_settle_qty = packer.GetDoublebyName("pre_settle_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.comm_frozen_qty = packer.GetDoublebyName("comm_frozen_qty", i);
                reqCommand.comm_unfroz_qty = packer.GetDoublebyName("comm_unfroz_qty", i);
                reqCommand.comm_capt_qty = packer.GetDoublebyName("comm_capt_qty", i);
                reqCommand.comm_releas_qty = packer.GetDoublebyName("comm_releas_qty", i);
                reqCommand.trade_frozen_qty = packer.GetDoublebyName("trade_frozen_qty", i);
                reqCommand.trade_unfroz_qty = packer.GetDoublebyName("trade_unfroz_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_frozen_qty = packer.GetDoublebyName("strike_frozen_qty", i);
                reqCommand.strike_unfroz_qty = packer.GetDoublebyName("strike_unfroz_qty", i);
                reqCommand.buy_pre_sett_qty = packer.GetDoublebyName("buy_pre_sett_qty", i);
                reqCommand.sell_pre_sett_qty = packer.GetDoublebyName("sell_pre_sett_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.avail_qty = packer.GetDoublebyName("avail_qty", i);
                reqCommand.impawn_qty = packer.GetDoublebyName("impawn_qty", i);
                reqCommand.bond_receivable_amt = packer.GetDoublebyName("bond_receivable_amt", i);
                reqCommand.net_price = packer.GetDoublebyName("net_price", i);
                reqCommand.full_price = packer.GetDoublebyName("full_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.full_holding_amt = packer.GetDoublebyName("full_holding_amt", i);
                reqCommand.block_trade_posi_market_value = packer.GetDoublebyName("block_trade_posi_market_value", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.fair_price = packer.GetDoublebyName("fair_price", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.bond_rate_type = packer.GetIntbyName("bond_rate_type", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.impawn_ratio = packer.GetDoublebyName("impawn_ratio", i);
                reqCommand.total_stock_issue = packer.GetDoublebyName("total_stock_issue", i);
                reqCommand.circl_stock_capit = packer.GetDoublebyName("circl_stock_capit", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_4_35Models.Add(reqCommand);
            }
            return FuncrptL_4_35Models;
        }
 
        //逻辑_报表_资管报表_查询_产品_证券持仓
        public static List<FuncrptL_4_35Model> GetFuncrptL_4_35Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_35Models = new List<FuncrptL_4_35Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_35Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    reqCommand.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    reqCommand.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    reqCommand.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    reqCommand.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    reqCommand.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    reqCommand.buy_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRE_SETT_QTY_FLOAT);
                    reqCommand.sell_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRE_SETT_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_QTY_FLOAT);
                    reqCommand.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    reqCommand.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    reqCommand.net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLOAT);
                    reqCommand.full_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    reqCommand.block_trade_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BLOCK_TRADE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.fair_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FAIR_PRICE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    reqCommand.total_stock_issue = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_FLOAT);
                    reqCommand.circl_stock_capit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_STOCK_CAPIT_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_4_35Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_35Models;
        }
 
        //逻辑_报表_资管报表_查询_交易组_证券持仓
        public static List<FuncrptL_4_36Model> GetFuncrptL_4_36Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_36Models = new List<FuncrptL_4_36Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_36Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.pre_settle_qty = packer.GetDoublebyName("pre_settle_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.comm_frozen_qty = packer.GetDoublebyName("comm_frozen_qty", i);
                reqCommand.comm_unfroz_qty = packer.GetDoublebyName("comm_unfroz_qty", i);
                reqCommand.comm_capt_qty = packer.GetDoublebyName("comm_capt_qty", i);
                reqCommand.comm_releas_qty = packer.GetDoublebyName("comm_releas_qty", i);
                reqCommand.trade_frozen_qty = packer.GetDoublebyName("trade_frozen_qty", i);
                reqCommand.trade_unfroz_qty = packer.GetDoublebyName("trade_unfroz_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_frozen_qty = packer.GetDoublebyName("strike_frozen_qty", i);
                reqCommand.strike_unfroz_qty = packer.GetDoublebyName("strike_unfroz_qty", i);
                reqCommand.buy_pre_sett_qty = packer.GetDoublebyName("buy_pre_sett_qty", i);
                reqCommand.sell_pre_sett_qty = packer.GetDoublebyName("sell_pre_sett_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.full_holding_amt = packer.GetDoublebyName("full_holding_amt", i);
                reqCommand.impawn_qty = packer.GetDoublebyName("impawn_qty", i);
                reqCommand.bond_receivable_amt = packer.GetDoublebyName("bond_receivable_amt", i);
                reqCommand.net_price = packer.GetDoublebyName("net_price", i);
                reqCommand.full_price = packer.GetDoublebyName("full_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
                reqCommand.trade_avail_qty = packer.GetDoublebyName("trade_avail_qty", i);
                reqCommand.comm_avail_qty = packer.GetDoublebyName("comm_avail_qty", i);
                reqCommand.static_avail_qty = packer.GetDoublebyName("static_avail_qty", i);
                reqCommand.block_trade_posi_market_value = packer.GetDoublebyName("block_trade_posi_market_value", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.fair_price = packer.GetDoublebyName("fair_price", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.bond_rate_type = packer.GetIntbyName("bond_rate_type", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.impawn_ratio = packer.GetDoublebyName("impawn_ratio", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_4_36Models.Add(reqCommand);
            }
            return FuncrptL_4_36Models;
        }
 
        //逻辑_报表_资管报表_查询_交易组_证券持仓
        public static List<FuncrptL_4_36Model> GetFuncrptL_4_36Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_36Models = new List<FuncrptL_4_36Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_36Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    reqCommand.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    reqCommand.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    reqCommand.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    reqCommand.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    reqCommand.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    reqCommand.buy_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRE_SETT_QTY_FLOAT);
                    reqCommand.sell_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRE_SETT_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    reqCommand.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    reqCommand.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    reqCommand.net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLOAT);
                    reqCommand.full_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    reqCommand.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                    reqCommand.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                    reqCommand.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                    reqCommand.block_trade_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BLOCK_TRADE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.fair_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FAIR_PRICE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_4_36Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_36Models;
        }
 
        //逻辑_报表_资管报表_查询_产品_证券持仓_历史
        public static List<FuncrptL_4_37Model> GetFuncrptL_4_37Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_37Models = new List<FuncrptL_4_37Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_37Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.posi_nav_ratio = packer.GetDoublebyName("posi_nav_ratio", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.pre_settle_qty = packer.GetDoublebyName("pre_settle_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.buy_pre_sett_qty = packer.GetDoublebyName("buy_pre_sett_qty", i);
                reqCommand.sell_pre_sett_qty = packer.GetDoublebyName("sell_pre_sett_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.avail_qty = packer.GetDoublebyName("avail_qty", i);
                reqCommand.full_holding_amt = packer.GetDoublebyName("full_holding_amt", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.impawn_qty = packer.GetDoublebyName("impawn_qty", i);
                reqCommand.bond_receivable_amt = packer.GetDoublebyName("bond_receivable_amt", i);
                reqCommand.net_price = packer.GetDoublebyName("net_price", i);
                reqCommand.full_price = packer.GetDoublebyName("full_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_4_37Models.Add(reqCommand);
            }
            return FuncrptL_4_37Models;
        }
 
        //逻辑_报表_资管报表_查询_产品_证券持仓_历史
        public static List<FuncrptL_4_37Model> GetFuncrptL_4_37Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_37Models = new List<FuncrptL_4_37Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_37Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.buy_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRE_SETT_QTY_FLOAT);
                    reqCommand.sell_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRE_SETT_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_QTY_FLOAT);
                    reqCommand.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    reqCommand.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    reqCommand.net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLOAT);
                    reqCommand.full_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_4_37Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_37Models;
        }
 
        //逻辑_报表_资管报表_查询_交易组_证券持仓_历史
        public static List<FuncrptL_4_38Model> GetFuncrptL_4_38Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_38Models = new List<FuncrptL_4_38Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_38Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.trade_avail_qty = packer.GetDoublebyName("trade_avail_qty", i);
                reqCommand.comm_avail_qty = packer.GetDoublebyName("comm_avail_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.posi_nav_ratio = packer.GetDoublebyName("posi_nav_ratio", i);
                reqCommand.full_holding_amt = packer.GetDoublebyName("full_holding_amt", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.pandl_ratio = packer.GetDoublebyName("pandl_ratio", i);
                reqCommand.bond_receivable_amt = packer.GetDoublebyName("bond_receivable_amt", i);
                reqCommand.impawn_qty = packer.GetDoublebyName("impawn_qty", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrptL_4_38Models.Add(reqCommand);
            }
            return FuncrptL_4_38Models;
        }
 
        //逻辑_报表_资管报表_查询_交易组_证券持仓_历史
        public static List<FuncrptL_4_38Model> GetFuncrptL_4_38Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_38Models = new List<FuncrptL_4_38Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_38Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                    reqCommand.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    reqCommand.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    reqCommand.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    reqCommand.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrptL_4_38Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_38Models;
        }
 
        //逻辑_报表_资管报表_查询_产品_期货持仓
        public static List<FuncrptL_4_41Model> GetFuncrptL_4_41Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_41Models = new List<FuncrptL_4_41Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_41Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.marked_pandl = packer.GetDoublebyName("marked_pandl", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.today_strike_capt_qty = packer.GetDoublebyName("today_strike_capt_qty", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.posi_nav_ratio = packer.GetDoublebyName("posi_nav_ratio", i);
                reqCommand.open_aver_price = packer.GetDoublebyName("open_aver_price", i);
 
                FuncrptL_4_41Models.Add(reqCommand);
            }
            return FuncrptL_4_41Models;
        }
 
        //逻辑_报表_资管报表_查询_产品_期货持仓
        public static List<FuncrptL_4_41Model> GetFuncrptL_4_41Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_41Models = new List<FuncrptL_4_41Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_41Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.today_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    reqCommand.open_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AVER_PRICE_FLOAT);
                    FuncrptL_4_41Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_41Models;
        }
 
        //逻辑_报表_资管报表_查询_产品_期货持仓_历史
        public static List<FuncrptL_4_42Model> GetFuncrptL_4_42Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_42Models = new List<FuncrptL_4_42Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_42Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.marked_pandl = packer.GetDoublebyName("marked_pandl", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.today_strike_capt_qty = packer.GetDoublebyName("today_strike_capt_qty", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.posi_nav_ratio = packer.GetDoublebyName("posi_nav_ratio", i);
                reqCommand.open_aver_price = packer.GetDoublebyName("open_aver_price", i);
 
                FuncrptL_4_42Models.Add(reqCommand);
            }
            return FuncrptL_4_42Models;
        }
 
        //逻辑_报表_资管报表_查询_产品_期货持仓_历史
        public static List<FuncrptL_4_42Model> GetFuncrptL_4_42Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_42Models = new List<FuncrptL_4_42Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_42Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.today_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    reqCommand.open_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AVER_PRICE_FLOAT);
                    FuncrptL_4_42Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_42Models;
        }
 
        //逻辑_报表_资管报表_查询_交易组_期货持仓
        public static List<FuncrptL_4_43Model> GetFuncrptL_4_43Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_43Models = new List<FuncrptL_4_43Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_43Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.marked_pandl = packer.GetDoublebyName("marked_pandl", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.today_strike_capt_qty = packer.GetDoublebyName("today_strike_capt_qty", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.posi_nav_ratio = packer.GetDoublebyName("posi_nav_ratio", i);
                reqCommand.open_aver_price = packer.GetDoublebyName("open_aver_price", i);
 
                FuncrptL_4_43Models.Add(reqCommand);
            }
            return FuncrptL_4_43Models;
        }
 
        //逻辑_报表_资管报表_查询_交易组_期货持仓
        public static List<FuncrptL_4_43Model> GetFuncrptL_4_43Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_43Models = new List<FuncrptL_4_43Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_43Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.today_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    reqCommand.open_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AVER_PRICE_FLOAT);
                    FuncrptL_4_43Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_43Models;
        }
 
        //逻辑_报表_资管报表_查询_交易组_期货持仓_历史
        public static List<FuncrptL_4_44Model> GetFuncrptL_4_44Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_44Models = new List<FuncrptL_4_44Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_44Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.marked_pandl = packer.GetDoublebyName("marked_pandl", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.today_strike_capt_qty = packer.GetDoublebyName("today_strike_capt_qty", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.posi_nav_ratio = packer.GetDoublebyName("posi_nav_ratio", i);
                reqCommand.open_aver_price = packer.GetDoublebyName("open_aver_price", i);
 
                FuncrptL_4_44Models.Add(reqCommand);
            }
            return FuncrptL_4_44Models;
        }
 
        //逻辑_报表_资管报表_查询_交易组_期货持仓_历史
        public static List<FuncrptL_4_44Model> GetFuncrptL_4_44Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_44Models = new List<FuncrptL_4_44Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_44Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.today_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    reqCommand.open_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AVER_PRICE_FLOAT);
                    FuncrptL_4_44Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_44Models;
        }
 
        //逻辑_报表_资管报表_查询_交易组_期货持仓明细
        public static List<FuncrptL_4_45Model> GetFuncrptL_4_45Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_45Models = new List<FuncrptL_4_45Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_45Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.open_posi_time = packer.GetIntbyName("open_posi_time", i);
                reqCommand.close_pandl = packer.GetDoublebyName("close_pandl", i);
                reqCommand.marked_pandl = packer.GetDoublebyName("marked_pandl", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
 
                FuncrptL_4_45Models.Add(reqCommand);
            }
            return FuncrptL_4_45Models;
        }
 
        //逻辑_报表_资管报表_查询_交易组_期货持仓明细
        public static List<FuncrptL_4_45Model> GetFuncrptL_4_45Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_45Models = new List<FuncrptL_4_45Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_45Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    reqCommand.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    reqCommand.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    FuncrptL_4_45Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_45Models;
        }
 
        //逻辑_报表_资管报表_查询T0交易员开平仓明细历史
        public static List<FuncrptL_4_46Model> GetFuncrptL_4_46Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_46Models = new List<FuncrptL_4_46Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_46Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.open_posi_time = packer.GetIntbyName("open_posi_time", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.close_posi_date = packer.GetIntbyName("close_posi_date", i);
                reqCommand.close_posi_time = packer.GetIntbyName("close_posi_time", i);
                reqCommand.close_posi_price = packer.GetDoublebyName("close_posi_price", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.close_posi_fee = packer.GetDoublebyName("close_posi_fee", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
 
                FuncrptL_4_46Models.Add(reqCommand);
            }
            return FuncrptL_4_46Models;
        }
 
        //逻辑_报表_资管报表_查询T0交易员开平仓明细历史
        public static List<FuncrptL_4_46Model> GetFuncrptL_4_46Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_46Models = new List<FuncrptL_4_46Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_46Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.close_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_DATE_INT);
                    reqCommand.close_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_TIME_INT);
                    reqCommand.close_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_PRICE_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    FuncrptL_4_46Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_46Models;
        }
 
        //逻辑_报表_资管报表_查询成交明细
        public static List<FuncrptL_4_47Model> GetFuncrptL_4_47Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_47Models = new List<FuncrptL_4_47Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_47Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.trade_tax = packer.GetDoublebyName("trade_tax", i);
                reqCommand.trade_cost_fee = packer.GetDoublebyName("trade_cost_fee", i);
                reqCommand.trade_system_use_fee = packer.GetDoublebyName("trade_system_use_fee", i);
                reqCommand.stock_settle_fee = packer.GetDoublebyName("stock_settle_fee", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.strike_bond_accr_intrst = packer.GetDoublebyName("strike_bond_accr_intrst", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.record_valid_flag = packer.GetIntbyName("record_valid_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.quot_strike_qty = packer.GetDoublebyName("quot_strike_qty", i);
                reqCommand.quot_strike_amt = packer.GetDoublebyName("quot_strike_amt", i);
 
                FuncrptL_4_47Models.Add(reqCommand);
            }
            return FuncrptL_4_47Models;
        }
 
        //逻辑_报表_资管报表_查询成交明细
        public static List<FuncrptL_4_47Model> GetFuncrptL_4_47Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_47Models = new List<FuncrptL_4_47Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_47Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.trade_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_TAX_FLOAT);
                    reqCommand.trade_cost_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COST_FEE_FLOAT);
                    reqCommand.trade_system_use_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
                    reqCommand.stock_settle_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_SETTLE_FEE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.strike_bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.record_valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_VALID_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.quot_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_QTY_FLOAT);
                    reqCommand.quot_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_AMT_FLOAT);
                    FuncrptL_4_47Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_47Models;
        }
 
        //逻辑_报表_资管报表_查询全部交易组
        public static List<FuncrptL_4_101Model> GetFuncrptL_4_101Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_101Models = new List<FuncrptL_4_101Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_101Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_group_code = packer.GetStrbyName("exch_group_code", i);
                reqCommand.exch_group_name = packer.GetStrbyName("exch_group_name", i);
                reqCommand.exch_group_status = packer.GetStrbyName("exch_group_status", i);
                reqCommand.default_group_flag = packer.GetIntbyName("default_group_flag", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
 
                FuncrptL_4_101Models.Add(reqCommand);
            }
            return FuncrptL_4_101Models;
        }
 
        //逻辑_报表_资管报表_查询全部交易组
        public static List<FuncrptL_4_101Model> GetFuncrptL_4_101Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_101Models = new List<FuncrptL_4_101Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_101Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_group_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_CODE_STR);
                    reqCommand.exch_group_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NAME_STR);
                    reqCommand.exch_group_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_STATUS_STR);
                    reqCommand.default_group_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_GROUP_FLAG_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    FuncrptL_4_101Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_101Models;
        }
 
        //逻辑_报表_资管报表_查询全部操作员信息
        public static List<FuncrptL_4_102Model> GetFuncrptL_4_102Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_102Models = new List<FuncrptL_4_102Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_102Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.opor_name = packer.GetStrbyName("opor_name", i);
                reqCommand.opor_type = packer.GetIntbyName("opor_type", i);
                reqCommand.opor_status = packer.GetStrbyName("opor_status", i);
 
                FuncrptL_4_102Models.Add(reqCommand);
            }
            return FuncrptL_4_102Models;
        }
 
        //逻辑_报表_资管报表_查询全部操作员信息
        public static List<FuncrptL_4_102Model> GetFuncrptL_4_102Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_102Models = new List<FuncrptL_4_102Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_102Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR);
                    reqCommand.opor_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_TYPE_INT);
                    reqCommand.opor_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STATUS_STR);
                    FuncrptL_4_102Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_102Models;
        }
 
        //逻辑_报表_资管报表_查询产品上日资产
        public static List<FuncrptL_4_103Model> GetFuncrptL_4_103Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_103Models = new List<FuncrptL_4_103Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_103Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.pd_all_share = packer.GetDoublebyName("pd_all_share", i);
                reqCommand.curr_share = packer.GetDoublebyName("curr_share", i);
                reqCommand.pre_share = packer.GetDoublebyName("pre_share", i);
                reqCommand.begin_NAV = packer.GetDoublebyName("begin_NAV", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
                reqCommand.pre_nav = packer.GetDoublebyName("pre_nav", i);
                reqCommand.nav_fluct = packer.GetDoublebyName("nav_fluct", i);
                reqCommand.cash_asset = packer.GetDoublebyName("cash_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.futu_asset = packer.GetDoublebyName("futu_asset", i);
                reqCommand.hk_thrgh_stock_asset = packer.GetDoublebyName("hk_thrgh_stock_asset", i);
                reqCommand.assign_avail_amt = packer.GetDoublebyName("assign_avail_amt", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.today_pandl = packer.GetDoublebyName("today_pandl", i);
                reqCommand.daily_pandl_ratio = packer.GetDoublebyName("daily_pandl_ratio", i);
                reqCommand.cash_out_amt = packer.GetDoublebyName("cash_out_amt", i);
                reqCommand.stock_asset_ratio = packer.GetDoublebyName("stock_asset_ratio", i);
                reqCommand.fund_asset_ratio = packer.GetDoublebyName("fund_asset_ratio", i);
                reqCommand.securities_ratio = packer.GetDoublebyName("securities_ratio", i);
                reqCommand.total_rece_amt = packer.GetDoublebyName("total_rece_amt", i);
                reqCommand.total_payab_amt = packer.GetDoublebyName("total_payab_amt", i);
                reqCommand.money_fund_asset = packer.GetDoublebyName("money_fund_asset", i);
                reqCommand.stock_cost = packer.GetDoublebyName("stock_cost", i);
                reqCommand.bond_cost = packer.GetDoublebyName("bond_cost", i);
                reqCommand.fund_cost = packer.GetDoublebyName("fund_cost", i);
                reqCommand.repo_cost = packer.GetDoublebyName("repo_cost", i);
                reqCommand.other_cost = packer.GetDoublebyName("other_cost", i);
                reqCommand.futu_cost = packer.GetDoublebyName("futu_cost", i);
                reqCommand.hk_thrgh_stock_cost = packer.GetDoublebyName("hk_thrgh_stock_cost", i);
                reqCommand.money_fund_cost = packer.GetDoublebyName("money_fund_cost", i);
                reqCommand.unit_nav_total = packer.GetDoublebyName("unit_nav_total", i);
                reqCommand.unit_divi_amt = packer.GetDoublebyName("unit_divi_amt", i);
                reqCommand.avail_cash = packer.GetDoublebyName("avail_cash", i);
                reqCommand.grp_row = packer.GetInt64byName("grp_row", i);
                reqCommand.last_month_pd_nav = packer.GetDoublebyName("last_month_pd_nav", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.capit_bala = packer.GetDoublebyName("capit_bala", i);
                reqCommand.avail_amt = packer.GetDoublebyName("avail_amt", i);
                reqCommand.pre_cash_asset = packer.GetDoublebyName("pre_cash_asset", i);
                reqCommand.pre_stock_asset = packer.GetDoublebyName("pre_stock_asset", i);
                reqCommand.pre_bond_asset = packer.GetDoublebyName("pre_bond_asset", i);
                reqCommand.pre_fund_asset = packer.GetDoublebyName("pre_fund_asset", i);
                reqCommand.pre_repo_asset = packer.GetDoublebyName("pre_repo_asset", i);
                reqCommand.pre_other_asset = packer.GetDoublebyName("pre_other_asset", i);
                reqCommand.pre_futu_asset = packer.GetDoublebyName("pre_futu_asset", i);
                reqCommand.pre_hk_thrgh_stock_asset = packer.GetDoublebyName("pre_hk_thrgh_stock_asset", i);
                reqCommand.pre_money_fund_asset = packer.GetDoublebyName("pre_money_fund_asset", i);
                reqCommand.pre_stock_cost = packer.GetDoublebyName("pre_stock_cost", i);
                reqCommand.pre_bond_cost = packer.GetDoublebyName("pre_bond_cost", i);
                reqCommand.pre_fund_cost = packer.GetDoublebyName("pre_fund_cost", i);
                reqCommand.pre_repo_cost = packer.GetDoublebyName("pre_repo_cost", i);
                reqCommand.pre_other_cost = packer.GetDoublebyName("pre_other_cost", i);
                reqCommand.pre_futu_cost = packer.GetDoublebyName("pre_futu_cost", i);
                reqCommand.pre_hk_thrgh_stock_cost = packer.GetDoublebyName("pre_hk_thrgh_stock_cost", i);
                reqCommand.pre_money_fund_cost = packer.GetDoublebyName("pre_money_fund_cost", i);
 
                FuncrptL_4_103Models.Add(reqCommand);
            }
            return FuncrptL_4_103Models;
        }
 
        //逻辑_报表_资管报表_查询产品上日资产
        public static List<FuncrptL_4_103Model> GetFuncrptL_4_103Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_103Models = new List<FuncrptL_4_103Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_103Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    reqCommand.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    reqCommand.pre_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT);
                    reqCommand.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    reqCommand.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    reqCommand.nav_fluct = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_FLUCT_FLOAT);
                    reqCommand.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    reqCommand.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    reqCommand.assign_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGN_AVAIL_AMT_FLOAT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    reqCommand.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    reqCommand.cash_out_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_OUT_AMT_FLOAT);
                    reqCommand.stock_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_RATIO_FLOAT);
                    reqCommand.fund_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_RATIO_FLOAT);
                    reqCommand.securities_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECURITIES_RATIO_FLOAT);
                    reqCommand.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    reqCommand.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    reqCommand.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.stock_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_COST_FLOAT);
                    reqCommand.bond_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_COST_FLOAT);
                    reqCommand.fund_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_COST_FLOAT);
                    reqCommand.repo_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_COST_FLOAT);
                    reqCommand.other_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COST_FLOAT);
                    reqCommand.futu_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_COST_FLOAT);
                    reqCommand.hk_thrgh_stock_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_COST_FLOAT);
                    reqCommand.money_fund_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_COST_FLOAT);
                    reqCommand.unit_nav_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_TOTAL_FLOAT);
                    reqCommand.unit_divi_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_DIVI_AMT_FLOAT);
                    reqCommand.avail_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_CASH_FLOAT);
                    reqCommand.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    reqCommand.last_month_pd_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_MONTH_PD_NAV_FLOAT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.capit_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_BALA_FLOAT);
                    reqCommand.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    reqCommand.pre_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CASH_ASSET_FLOAT);
                    reqCommand.pre_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_STOCK_ASSET_FLOAT);
                    reqCommand.pre_bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_BOND_ASSET_FLOAT);
                    reqCommand.pre_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FUND_ASSET_FLOAT);
                    reqCommand.pre_repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_REPO_ASSET_FLOAT);
                    reqCommand.pre_other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_OTHER_ASSET_FLOAT);
                    reqCommand.pre_futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FUTU_ASSET_FLOAT);
                    reqCommand.pre_hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_HK_THRGH_STOCK_ASSET_FLOAT);
                    reqCommand.pre_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.pre_stock_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_STOCK_COST_FLOAT);
                    reqCommand.pre_bond_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_BOND_COST_FLOAT);
                    reqCommand.pre_fund_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FUND_COST_FLOAT);
                    reqCommand.pre_repo_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_REPO_COST_FLOAT);
                    reqCommand.pre_other_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_OTHER_COST_FLOAT);
                    reqCommand.pre_futu_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FUTU_COST_FLOAT);
                    reqCommand.pre_hk_thrgh_stock_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_HK_THRGH_STOCK_COST_FLOAT);
                    reqCommand.pre_money_fund_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_MONEY_FUND_COST_FLOAT);
                    FuncrptL_4_103Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_103Models;
        }
 
        //逻辑_报表_资管报表_查询产品汇总成交证券类型
        public static List<FuncrptL_4_104Model> GetFuncrptL_4_104Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_104Models = new List<FuncrptL_4_104Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_104Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.total_trade_amt = packer.GetDoublebyName("total_trade_amt", i);
                reqCommand.total_strike_commis = packer.GetDoublebyName("total_strike_commis", i);
                reqCommand.stock_trade_amt = packer.GetDoublebyName("stock_trade_amt", i);
                reqCommand.stock_strike_commis = packer.GetDoublebyName("stock_strike_commis", i);
                reqCommand.bond_trade_amt = packer.GetDoublebyName("bond_trade_amt", i);
                reqCommand.bond_strike_commis = packer.GetDoublebyName("bond_strike_commis", i);
                reqCommand.fund_trade_amt = packer.GetDoublebyName("fund_trade_amt", i);
                reqCommand.fund_strike_commis = packer.GetDoublebyName("fund_strike_commis", i);
                reqCommand.money_fund_trade_amt = packer.GetDoublebyName("money_fund_trade_amt", i);
                reqCommand.money_fund_strike_commis = packer.GetDoublebyName("money_fund_strike_commis", i);
                reqCommand.hk_thrgh_trade_amt = packer.GetDoublebyName("hk_thrgh_trade_amt", i);
                reqCommand.hk_thrgh_strike_commis = packer.GetDoublebyName("hk_thrgh_strike_commis", i);
                reqCommand.repo_trade_amt = packer.GetDoublebyName("repo_trade_amt", i);
                reqCommand.repo_strike_commis = packer.GetDoublebyName("repo_strike_commis", i);
                reqCommand.option_trade_amt = packer.GetDoublebyName("option_trade_amt", i);
                reqCommand.option_strike_commis = packer.GetDoublebyName("option_strike_commis", i);
                reqCommand.futu_trade_amt = packer.GetDoublebyName("futu_trade_amt", i);
                reqCommand.futu_strike_commis = packer.GetDoublebyName("futu_strike_commis", i);
                reqCommand.total_trade_cnt = packer.GetIntbyName("total_trade_cnt", i);
                reqCommand.stock_trade_cnt = packer.GetIntbyName("stock_trade_cnt", i);
                reqCommand.bond_trade_cnt = packer.GetIntbyName("bond_trade_cnt", i);
                reqCommand.fund_trade_cnt = packer.GetIntbyName("fund_trade_cnt", i);
                reqCommand.money_fund_trade_cnt = packer.GetIntbyName("money_fund_trade_cnt", i);
                reqCommand.hk_thrgh_trade_cnt = packer.GetIntbyName("hk_thrgh_trade_cnt", i);
                reqCommand.repo_trade_cnt = packer.GetIntbyName("repo_trade_cnt", i);
                reqCommand.option_trade_cnt = packer.GetIntbyName("option_trade_cnt", i);
                reqCommand.futu_trade_cnt = packer.GetIntbyName("futu_trade_cnt", i);
 
                FuncrptL_4_104Models.Add(reqCommand);
            }
            return FuncrptL_4_104Models;
        }
 
        //逻辑_报表_资管报表_查询产品汇总成交证券类型
        public static List<FuncrptL_4_104Model> GetFuncrptL_4_104Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_104Models = new List<FuncrptL_4_104Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_104Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.total_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_TRADE_AMT_FLOAT);
                    reqCommand.total_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STRIKE_COMMIS_FLOAT);
                    reqCommand.stock_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TRADE_AMT_FLOAT);
                    reqCommand.stock_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STRIKE_COMMIS_FLOAT);
                    reqCommand.bond_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_TRADE_AMT_FLOAT);
                    reqCommand.bond_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_STRIKE_COMMIS_FLOAT);
                    reqCommand.fund_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_TRADE_AMT_FLOAT);
                    reqCommand.fund_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_STRIKE_COMMIS_FLOAT);
                    reqCommand.money_fund_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_TRADE_AMT_FLOAT);
                    reqCommand.money_fund_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_STRIKE_COMMIS_FLOAT);
                    reqCommand.hk_thrgh_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_TRADE_AMT_FLOAT);
                    reqCommand.hk_thrgh_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STRIKE_COMMIS_FLOAT);
                    reqCommand.repo_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_TRADE_AMT_FLOAT);
                    reqCommand.repo_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_STRIKE_COMMIS_FLOAT);
                    reqCommand.option_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_TRADE_AMT_FLOAT);
                    reqCommand.option_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_STRIKE_COMMIS_FLOAT);
                    reqCommand.futu_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TRADE_AMT_FLOAT);
                    reqCommand.futu_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_STRIKE_COMMIS_FLOAT);
                    reqCommand.total_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_TRADE_CNT_INT);
                    reqCommand.stock_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TRADE_CNT_INT);
                    reqCommand.bond_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_TRADE_CNT_INT);
                    reqCommand.fund_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_TRADE_CNT_INT);
                    reqCommand.money_fund_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_TRADE_CNT_INT);
                    reqCommand.hk_thrgh_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_TRADE_CNT_INT);
                    reqCommand.repo_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_TRADE_CNT_INT);
                    reqCommand.option_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_TRADE_CNT_INT);
                    reqCommand.futu_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TRADE_CNT_INT);
                    FuncrptL_4_104Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_104Models;
        }
 
        //逻辑_报表_资管报表_查询证券行情
        public static List<FuncrptL_4_106Model> GetFuncrptL_4_106Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_106Models = new List<FuncrptL_4_106Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_106Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.up_limit_price = packer.GetDoublebyName("up_limit_price", i);
                reqCommand.down_limit_price = packer.GetDoublebyName("down_limit_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
                reqCommand.today_open_price = packer.GetDoublebyName("today_open_price", i);
                reqCommand.today_close_price = packer.GetDoublebyName("today_close_price", i);
                reqCommand.today_max_price = packer.GetDoublebyName("today_max_price", i);
                reqCommand.today_min_price = packer.GetDoublebyName("today_min_price", i);
                reqCommand.buy_price_1 = packer.GetDoublebyName("buy_price_1", i);
                reqCommand.buy_qty_1 = packer.GetDoublebyName("buy_qty_1", i);
                reqCommand.buy_price_2 = packer.GetDoublebyName("buy_price_2", i);
                reqCommand.buy_qty_2 = packer.GetDoublebyName("buy_qty_2", i);
                reqCommand.buy_price_3 = packer.GetDoublebyName("buy_price_3", i);
                reqCommand.buy_qty_3 = packer.GetDoublebyName("buy_qty_3", i);
                reqCommand.buy_price_4 = packer.GetDoublebyName("buy_price_4", i);
                reqCommand.buy_qty_4 = packer.GetDoublebyName("buy_qty_4", i);
                reqCommand.buy_price_5 = packer.GetDoublebyName("buy_price_5", i);
                reqCommand.buy_qty_5 = packer.GetDoublebyName("buy_qty_5", i);
                reqCommand.sell_price_1 = packer.GetDoublebyName("sell_price_1", i);
                reqCommand.sell_qty_1 = packer.GetDoublebyName("sell_qty_1", i);
                reqCommand.sell_price_2 = packer.GetDoublebyName("sell_price_2", i);
                reqCommand.sell_qty_2 = packer.GetDoublebyName("sell_qty_2", i);
                reqCommand.sell_price_3 = packer.GetDoublebyName("sell_price_3", i);
                reqCommand.sell_qty_3 = packer.GetDoublebyName("sell_qty_3", i);
                reqCommand.sell_price_4 = packer.GetDoublebyName("sell_price_4", i);
                reqCommand.sell_qty_4 = packer.GetDoublebyName("sell_qty_4", i);
                reqCommand.sell_price_5 = packer.GetDoublebyName("sell_price_5", i);
                reqCommand.sell_qty_5 = packer.GetDoublebyName("sell_qty_5", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.pe_ratio = packer.GetDoublebyName("pe_ratio", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncrptL_4_106Models.Add(reqCommand);
            }
            return FuncrptL_4_106Models;
        }
 
        //逻辑_报表_资管报表_查询证券行情
        public static List<FuncrptL_4_106Model> GetFuncrptL_4_106Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_106Models = new List<FuncrptL_4_106Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_106Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    reqCommand.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    reqCommand.today_open_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_OPEN_PRICE_FLOAT);
                    reqCommand.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    reqCommand.today_max_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MAX_PRICE_FLOAT);
                    reqCommand.today_min_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MIN_PRICE_FLOAT);
                    reqCommand.buy_price_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_1_FLOAT);
                    reqCommand.buy_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_1_FLOAT);
                    reqCommand.buy_price_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_2_FLOAT);
                    reqCommand.buy_qty_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_2_FLOAT);
                    reqCommand.buy_price_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_3_FLOAT);
                    reqCommand.buy_qty_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_3_FLOAT);
                    reqCommand.buy_price_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_4_FLOAT);
                    reqCommand.buy_qty_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_4_FLOAT);
                    reqCommand.buy_price_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_5_FLOAT);
                    reqCommand.buy_qty_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_5_FLOAT);
                    reqCommand.sell_price_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_1_FLOAT);
                    reqCommand.sell_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_1_FLOAT);
                    reqCommand.sell_price_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_2_FLOAT);
                    reqCommand.sell_qty_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_2_FLOAT);
                    reqCommand.sell_price_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_3_FLOAT);
                    reqCommand.sell_qty_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_3_FLOAT);
                    reqCommand.sell_price_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_4_FLOAT);
                    reqCommand.sell_qty_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_4_FLOAT);
                    reqCommand.sell_price_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_5_FLOAT);
                    reqCommand.sell_qty_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_5_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.pe_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PE_RATIO_FLOAT);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncrptL_4_106Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_106Models;
        }
 
        //逻辑_报表_资管报表_查询产品指令统计
        public static List<FuncrptL_4_107Model> GetFuncrptL_4_107Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_107Models = new List<FuncrptL_4_107Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_107Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.commd_cnt = packer.GetDoublebyName("commd_cnt", i);
                reqCommand.comm_qty = packer.GetDoublebyName("comm_qty", i);
                reqCommand.comm_amt = packer.GetDoublebyName("comm_amt", i);
                reqCommand.order_num = packer.GetIntbyName("order_num", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_amt = packer.GetDoublebyName("order_amt", i);
                reqCommand.undeal_amt = packer.GetDoublebyName("undeal_amt", i);
                reqCommand.strike_num = packer.GetIntbyName("strike_num", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.quot_strike_qty = packer.GetDoublebyName("quot_strike_qty", i);
                reqCommand.quot_strike_amt = packer.GetDoublebyName("quot_strike_amt", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
 
                FuncrptL_4_107Models.Add(reqCommand);
            }
            return FuncrptL_4_107Models;
        }
 
        //逻辑_报表_资管报表_查询产品指令统计
        public static List<FuncrptL_4_107Model> GetFuncrptL_4_107Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_107Models = new List<FuncrptL_4_107Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_107Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.commd_cnt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMMD_CNT_FLOAT);
                    reqCommand.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    reqCommand.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    reqCommand.order_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NUM_INT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_AMT_FLOAT);
                    reqCommand.undeal_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNDEAL_AMT_FLOAT);
                    reqCommand.strike_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.quot_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_QTY_FLOAT);
                    reqCommand.quot_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_AMT_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    FuncrptL_4_107Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_107Models;
        }
 
        //逻辑_报表_资管报表_查询产品交易操作效率
        public static List<FuncrptL_4_108Model> GetFuncrptL_4_108Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_108Models = new List<FuncrptL_4_108Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_108Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.posi_yield_rate = packer.GetDoublebyName("posi_yield_rate", i);
                reqCommand.real_trade_oper_rate = packer.GetDoublebyName("real_trade_oper_rate", i);
                reqCommand.avg_nav_asset = packer.GetDoublebyName("avg_nav_asset", i);
                reqCommand.buy_amt = packer.GetDoublebyName("buy_amt", i);
                reqCommand.sellout_amt = packer.GetDoublebyName("sellout_amt", i);
                reqCommand.begin_NAV = packer.GetDoublebyName("begin_NAV", i);
                reqCommand.begin_share_net_total = packer.GetDoublebyName("begin_share_net_total", i);
                reqCommand.pd_begin_unit_nav = packer.GetDoublebyName("pd_begin_unit_nav", i);
                reqCommand.begin_net_all = packer.GetDoublebyName("begin_net_all", i);
                reqCommand.end_nav_asset = packer.GetDoublebyName("end_nav_asset", i);
                reqCommand.end_share_net_total = packer.GetDoublebyName("end_share_net_total", i);
                reqCommand.end_net_all = packer.GetDoublebyName("end_net_all", i);
                reqCommand.end_unit_nav = packer.GetDoublebyName("end_unit_nav", i);
 
                FuncrptL_4_108Models.Add(reqCommand);
            }
            return FuncrptL_4_108Models;
        }
 
        //逻辑_报表_资管报表_查询产品交易操作效率
        public static List<FuncrptL_4_108Model> GetFuncrptL_4_108Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_108Models = new List<FuncrptL_4_108Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_108Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.posi_yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_YIELD_RATE_FLOAT);
                    reqCommand.real_trade_oper_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REAL_TRADE_OPER_RATE_FLOAT);
                    reqCommand.avg_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_NAV_ASSET_FLOAT);
                    reqCommand.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    reqCommand.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    reqCommand.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    reqCommand.begin_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.pd_begin_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_BEGIN_UNIT_NAV_FLOAT);
                    reqCommand.begin_net_all = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NET_ALL_FLOAT);
                    reqCommand.end_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_NAV_ASSET_FLOAT);
                    reqCommand.end_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_SHARE_NET_TOTAL_FLOAT);
                    reqCommand.end_net_all = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_NET_ALL_FLOAT);
                    reqCommand.end_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_UNIT_NAV_FLOAT);
                    FuncrptL_4_108Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_108Models;
        }
 
        //逻辑_报表_资管报表_查询产品汇总持仓
        public static List<FuncrptL_4_111Model> GetFuncrptL_4_111Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_111Models = new List<FuncrptL_4_111Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_111Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.pre_settle_qty = packer.GetDoublebyName("pre_settle_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.comm_frozen_qty = packer.GetDoublebyName("comm_frozen_qty", i);
                reqCommand.comm_unfroz_qty = packer.GetDoublebyName("comm_unfroz_qty", i);
                reqCommand.comm_capt_qty = packer.GetDoublebyName("comm_capt_qty", i);
                reqCommand.comm_releas_qty = packer.GetDoublebyName("comm_releas_qty", i);
                reqCommand.trade_frozen_qty = packer.GetDoublebyName("trade_frozen_qty", i);
                reqCommand.trade_unfroz_qty = packer.GetDoublebyName("trade_unfroz_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_frozen_qty = packer.GetDoublebyName("strike_frozen_qty", i);
                reqCommand.strike_unfroz_qty = packer.GetDoublebyName("strike_unfroz_qty", i);
                reqCommand.buy_pre_sett_qty = packer.GetDoublebyName("buy_pre_sett_qty", i);
                reqCommand.sell_pre_sett_qty = packer.GetDoublebyName("sell_pre_sett_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.avail_qty = packer.GetDoublebyName("avail_qty", i);
                reqCommand.full_holding_amt = packer.GetDoublebyName("full_holding_amt", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.impawn_qty = packer.GetDoublebyName("impawn_qty", i);
                reqCommand.bond_receivable_amt = packer.GetDoublebyName("bond_receivable_amt", i);
                reqCommand.net_price = packer.GetDoublebyName("net_price", i);
                reqCommand.full_price = packer.GetDoublebyName("full_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.posi_nav_ratio = packer.GetDoublebyName("posi_nav_ratio", i);
 
                FuncrptL_4_111Models.Add(reqCommand);
            }
            return FuncrptL_4_111Models;
        }
 
        //逻辑_报表_资管报表_查询产品汇总持仓
        public static List<FuncrptL_4_111Model> GetFuncrptL_4_111Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_111Models = new List<FuncrptL_4_111Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_111Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    reqCommand.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    reqCommand.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    reqCommand.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    reqCommand.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    reqCommand.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    reqCommand.buy_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRE_SETT_QTY_FLOAT);
                    reqCommand.sell_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRE_SETT_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_QTY_FLOAT);
                    reqCommand.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    reqCommand.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    reqCommand.net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLOAT);
                    reqCommand.full_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    FuncrptL_4_111Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_111Models;
        }
 
        //逻辑_报表_资管报表_查询产品佣金统计报表
        public static List<FuncrptL_4_112Model> GetFuncrptL_4_112Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_112Models = new List<FuncrptL_4_112Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_112Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.begin_date = packer.GetIntbyName("begin_date", i);
                reqCommand.end_date = packer.GetIntbyName("end_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.stock_trade_amt = packer.GetDoublebyName("stock_trade_amt", i);
                reqCommand.stock_strike_commis = packer.GetDoublebyName("stock_strike_commis", i);
 
                FuncrptL_4_112Models.Add(reqCommand);
            }
            return FuncrptL_4_112Models;
        }
 
        //逻辑_报表_资管报表_查询产品佣金统计报表
        public static List<FuncrptL_4_112Model> GetFuncrptL_4_112Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_112Models = new List<FuncrptL_4_112Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_112Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    reqCommand.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.stock_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TRADE_AMT_FLOAT);
                    reqCommand.stock_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STRIKE_COMMIS_FLOAT);
                    FuncrptL_4_112Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_112Models;
        }
 
        //逻辑_报表_资管报表_产品当日成交统计查询
        public static List<FuncrptL_4_113Model> GetFuncrptL_4_113Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_113Models = new List<FuncrptL_4_113Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_113Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.strike_capt_amt = packer.GetDoublebyName("strike_capt_amt", i);
                reqCommand.strike_releas_amt = packer.GetDoublebyName("strike_releas_amt", i);
 
                FuncrptL_4_113Models.Add(reqCommand);
            }
            return FuncrptL_4_113Models;
        }
 
        //逻辑_报表_资管报表_产品当日成交统计查询
        public static List<FuncrptL_4_113Model> GetFuncrptL_4_113Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_113Models = new List<FuncrptL_4_113Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrptL_4_113Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                reqCommand.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                FuncrptL_4_113Models.Add(reqCommand);
            }
            return FuncrptL_4_113Models;
        }
 
        //逻辑_报表_资管报表_产品持仓汇总统计查询
        public static List<FuncrptL_4_114Model> GetFuncrptL_4_114Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_114Models = new List<FuncrptL_4_114Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_114Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.holder_profit = packer.GetDoublebyName("holder_profit", i);
 
                FuncrptL_4_114Models.Add(reqCommand);
            }
            return FuncrptL_4_114Models;
        }
 
        //逻辑_报表_资管报表_产品持仓汇总统计查询
        public static List<FuncrptL_4_114Model> GetFuncrptL_4_114Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_114Models = new List<FuncrptL_4_114Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrptL_4_114Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                reqCommand.holder_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLDER_PROFIT_FLOAT);
                FuncrptL_4_114Models.Add(reqCommand);
            }
            return FuncrptL_4_114Models;
        }
 
        //逻辑_报表_资管报表_查询_交易组_新证券持仓
        public static List<FuncrptL_4_115Model> GetFuncrptL_4_115Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_115Models = new List<FuncrptL_4_115Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_115Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.posi_market_value = packer.GetDoublebyName("posi_market_value", i);
                reqCommand.invest_type = packer.GetIntbyName("invest_type", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.pre_settle_qty = packer.GetDoublebyName("pre_settle_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.comm_frozen_qty = packer.GetDoublebyName("comm_frozen_qty", i);
                reqCommand.comm_unfroz_qty = packer.GetDoublebyName("comm_unfroz_qty", i);
                reqCommand.comm_capt_qty = packer.GetDoublebyName("comm_capt_qty", i);
                reqCommand.comm_releas_qty = packer.GetDoublebyName("comm_releas_qty", i);
                reqCommand.trade_frozen_qty = packer.GetDoublebyName("trade_frozen_qty", i);
                reqCommand.trade_unfroz_qty = packer.GetDoublebyName("trade_unfroz_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_frozen_qty = packer.GetDoublebyName("strike_frozen_qty", i);
                reqCommand.strike_unfroz_qty = packer.GetDoublebyName("strike_unfroz_qty", i);
                reqCommand.buy_pre_sett_qty = packer.GetDoublebyName("buy_pre_sett_qty", i);
                reqCommand.sell_pre_sett_qty = packer.GetDoublebyName("sell_pre_sett_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
                reqCommand.full_holding_amt = packer.GetDoublebyName("full_holding_amt", i);
                reqCommand.impawn_qty = packer.GetDoublebyName("impawn_qty", i);
                reqCommand.bond_receivable_amt = packer.GetDoublebyName("bond_receivable_amt", i);
                reqCommand.net_price = packer.GetDoublebyName("net_price", i);
                reqCommand.full_price = packer.GetDoublebyName("full_price", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.pre_close_price = packer.GetDoublebyName("pre_close_price", i);
                reqCommand.trade_avail_qty = packer.GetDoublebyName("trade_avail_qty", i);
                reqCommand.comm_avail_qty = packer.GetDoublebyName("comm_avail_qty", i);
                reqCommand.static_avail_qty = packer.GetDoublebyName("static_avail_qty", i);
                reqCommand.block_trade_posi_market_value = packer.GetDoublebyName("block_trade_posi_market_value", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.fair_price = packer.GetDoublebyName("fair_price", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.bond_rate_type = packer.GetIntbyName("bond_rate_type", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.impawn_ratio = packer.GetDoublebyName("impawn_ratio", i);
 
                FuncrptL_4_115Models.Add(reqCommand);
            }
            return FuncrptL_4_115Models;
        }
 
        //逻辑_报表_资管报表_查询_交易组_新证券持仓
        public static List<FuncrptL_4_115Model> GetFuncrptL_4_115Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_115Models = new List<FuncrptL_4_115Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrptL_4_115Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    reqCommand.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    reqCommand.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    reqCommand.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    reqCommand.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    reqCommand.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    reqCommand.buy_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRE_SETT_QTY_FLOAT);
                    reqCommand.sell_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRE_SETT_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    reqCommand.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    reqCommand.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    reqCommand.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    reqCommand.net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLOAT);
                    reqCommand.full_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_PRICE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    reqCommand.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                    reqCommand.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                    reqCommand.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                    reqCommand.block_trade_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BLOCK_TRADE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.fair_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FAIR_PRICE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    FuncrptL_4_115Models.Add(reqCommand);
                }
            }
            return FuncrptL_4_115Models;
        }
 
        //逻辑_报表_资管报表_交易组当日成交统计查询
        public static List<FuncrptL_4_116Model> GetFuncrptL_4_116Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrptL_4_116Models = new List<FuncrptL_4_116Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrptL_4_116Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.strike_capt_amt = packer.GetDoublebyName("strike_capt_amt", i);
                reqCommand.strike_releas_amt = packer.GetDoublebyName("strike_releas_amt", i);
 
                FuncrptL_4_116Models.Add(reqCommand);
            }
            return FuncrptL_4_116Models;
        }
 
        //逻辑_报表_资管报表_交易组当日成交统计查询
        public static List<FuncrptL_4_116Model> GetFuncrptL_4_116Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrptL_4_116Models = new List<FuncrptL_4_116Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrptL_4_116Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                reqCommand.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                FuncrptL_4_116Models.Add(reqCommand);
            }
            return FuncrptL_4_116Models;
        }
 
    }
}
