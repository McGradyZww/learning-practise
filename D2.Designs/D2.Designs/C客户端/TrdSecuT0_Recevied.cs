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

    public static class TrdSecuT0
    {
        //逻辑_交易证券_T0_券源持仓查询
        public static List<FunctdsecuL_6_1Model> GetFunctdsecuL_6_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_1Models = new List<FunctdsecuL_6_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.source_stock_qty = packer.GetDoublebyName("source_stock_qty", i);
                reqCommand.single_limit_qty = packer.GetDoublebyName("single_limit_qty", i);
                reqCommand.assigned_qty = packer.GetDoublebyName("assigned_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.total_open_posi_fee = packer.GetDoublebyName("total_open_posi_fee", i);
                reqCommand.total_close_posi_fee = packer.GetDoublebyName("total_close_posi_fee", i);
                reqCommand.out_order_releas_qty = packer.GetDoublebyName("out_order_releas_qty", i);
                reqCommand.out_order_capt_qty = packer.GetDoublebyName("out_order_capt_qty", i);
                reqCommand.out_strike_releas_qty = packer.GetDoublebyName("out_strike_releas_qty", i);
                reqCommand.out_strike_capt_qty = packer.GetDoublebyName("out_strike_capt_qty", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.buy_avail_qty = packer.GetDoublebyName("buy_avail_qty", i);
                reqCommand.sell_avail_qty = packer.GetDoublebyName("sell_avail_qty", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.today_trade_fee = packer.GetDoublebyName("today_trade_fee", i);
                reqCommand.today_pandl = packer.GetDoublebyName("today_pandl", i);
                reqCommand.diff_qty = packer.GetDoublebyName("diff_qty", i);
                reqCommand.over_night_trade_buy_qty = packer.GetDoublebyName("over_night_trade_buy_qty", i);
                reqCommand.over_night_trade_sell_qty = packer.GetDoublebyName("over_night_trade_sell_qty", i);
                reqCommand.over_night_strike_sell_qty = packer.GetDoublebyName("over_night_strike_sell_qty", i);
                reqCommand.over_night_sumtrd_sell_qty = packer.GetDoublebyName("over_night_sumtrd_sell_qty", i);
                reqCommand.over_night_sumstk_sell_qty = packer.GetDoublebyName("over_night_sumstk_sell_qty", i);
                reqCommand.t0_buy_type = packer.GetIntbyName("t0_buy_type", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_6_1Models.Add(reqCommand);
            }
            return FunctdsecuL_6_1Models;
        }
 
        //逻辑_交易证券_T0_券源持仓查询
        public static List<FunctdsecuL_6_1Model> GetFunctdsecuL_6_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_1Models = new List<FunctdsecuL_6_1Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_1Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.source_stock_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_QTY_FLOAT);
                    reqCommand.single_limit_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_QTY_FLOAT);
                    reqCommand.assigned_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.total_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_OPEN_POSI_FEE_FLOAT);
                    reqCommand.total_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.out_order_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_RELEAS_QTY_FLOAT);
                    reqCommand.out_order_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_CAPT_QTY_FLOAT);
                    reqCommand.out_strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.out_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.buy_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AVAIL_QTY_FLOAT);
                    reqCommand.sell_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AVAIL_QTY_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.today_trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_TRADE_FEE_FLOAT);
                    reqCommand.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    reqCommand.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    reqCommand.over_night_trade_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_TRADE_BUY_QTY_FLOAT);
                    reqCommand.over_night_trade_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_TRADE_SELL_QTY_FLOAT);
                    reqCommand.over_night_strike_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_STRIKE_SELL_QTY_FLOAT);
                    reqCommand.over_night_sumtrd_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_SUMTRD_SELL_QTY_FLOAT);
                    reqCommand.over_night_sumstk_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_SUMSTK_SELL_QTY_FLOAT);
                    reqCommand.t0_buy_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_T0_BUY_TYPE_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_6_1Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_1Models;
        }
 
        //逻辑_交易证券_T0_券源持仓历史查询
        public static List<FunctdsecuL_6_111Model> GetFunctdsecuL_6_111Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_111Models = new List<FunctdsecuL_6_111Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_111Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.source_stock_qty = packer.GetDoublebyName("source_stock_qty", i);
                reqCommand.single_limit_qty = packer.GetDoublebyName("single_limit_qty", i);
                reqCommand.assigned_qty = packer.GetDoublebyName("assigned_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.total_open_posi_fee = packer.GetDoublebyName("total_open_posi_fee", i);
                reqCommand.total_close_posi_fee = packer.GetDoublebyName("total_close_posi_fee", i);
                reqCommand.out_order_releas_qty = packer.GetDoublebyName("out_order_releas_qty", i);
                reqCommand.out_order_capt_qty = packer.GetDoublebyName("out_order_capt_qty", i);
                reqCommand.out_strike_releas_qty = packer.GetDoublebyName("out_strike_releas_qty", i);
                reqCommand.out_strike_capt_qty = packer.GetDoublebyName("out_strike_capt_qty", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.buy_avail_qty = packer.GetDoublebyName("buy_avail_qty", i);
                reqCommand.sell_avail_qty = packer.GetDoublebyName("sell_avail_qty", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.today_trade_fee = packer.GetDoublebyName("today_trade_fee", i);
                reqCommand.today_pandl = packer.GetDoublebyName("today_pandl", i);
                reqCommand.diff_qty = packer.GetDoublebyName("diff_qty", i);
                reqCommand.t0_buy_type = packer.GetIntbyName("t0_buy_type", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_6_111Models.Add(reqCommand);
            }
            return FunctdsecuL_6_111Models;
        }
 
        //逻辑_交易证券_T0_券源持仓历史查询
        public static List<FunctdsecuL_6_111Model> GetFunctdsecuL_6_111Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_111Models = new List<FunctdsecuL_6_111Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_111Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.source_stock_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_QTY_FLOAT);
                    reqCommand.single_limit_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_QTY_FLOAT);
                    reqCommand.assigned_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.total_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_OPEN_POSI_FEE_FLOAT);
                    reqCommand.total_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.out_order_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_RELEAS_QTY_FLOAT);
                    reqCommand.out_order_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_CAPT_QTY_FLOAT);
                    reqCommand.out_strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.out_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.buy_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AVAIL_QTY_FLOAT);
                    reqCommand.sell_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AVAIL_QTY_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.today_trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_TRADE_FEE_FLOAT);
                    reqCommand.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    reqCommand.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    reqCommand.t0_buy_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_T0_BUY_TYPE_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_6_111Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_111Models;
        }
 
        //逻辑_交易证券_T0_持仓分笔查询
        public static List<FunctdsecuL_6_2Model> GetFunctdsecuL_6_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_2Models = new List<FunctdsecuL_6_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_2Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.open_posi_time = packer.GetIntbyName("open_posi_time", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.close_posi_date = packer.GetIntbyName("close_posi_date", i);
                reqCommand.close_posi_time = packer.GetIntbyName("close_posi_time", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.close_posi_fee = packer.GetDoublebyName("close_posi_fee", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
                reqCommand.posi_status = packer.GetStrbyName("posi_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_6_2Models.Add(reqCommand);
            }
            return FunctdsecuL_6_2Models;
        }
 
        //逻辑_交易证券_T0_持仓分笔查询
        public static List<FunctdsecuL_6_2Model> GetFunctdsecuL_6_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_2Models = new List<FunctdsecuL_6_2Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_2Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.close_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_DATE_INT);
                    reqCommand.close_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_TIME_INT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    reqCommand.posi_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_STATUS_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_6_2Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_2Models;
        }
 
        //逻辑_交易证券_T0_持仓分笔历史查询
        public static List<FunctdsecuL_6_201Model> GetFunctdsecuL_6_201Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_201Models = new List<FunctdsecuL_6_201Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_201Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.open_posi_time = packer.GetIntbyName("open_posi_time", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.close_posi_date = packer.GetIntbyName("close_posi_date", i);
                reqCommand.close_posi_time = packer.GetIntbyName("close_posi_time", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.close_posi_fee = packer.GetDoublebyName("close_posi_fee", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
                reqCommand.posi_status = packer.GetStrbyName("posi_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_6_201Models.Add(reqCommand);
            }
            return FunctdsecuL_6_201Models;
        }
 
        //逻辑_交易证券_T0_持仓分笔历史查询
        public static List<FunctdsecuL_6_201Model> GetFunctdsecuL_6_201Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_201Models = new List<FunctdsecuL_6_201Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_201Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.close_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_DATE_INT);
                    reqCommand.close_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_TIME_INT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    reqCommand.posi_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_STATUS_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_6_201Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_201Models;
        }
 
        //逻辑_交易证券_T0_持仓合笔查询
        public static List<FunctdsecuL_6_3Model> GetFunctdsecuL_6_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_3Models = new List<FunctdsecuL_6_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.open_posi_time = packer.GetIntbyName("open_posi_time", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
 
                FunctdsecuL_6_3Models.Add(reqCommand);
            }
            return FunctdsecuL_6_3Models;
        }
 
        //逻辑_交易证券_T0_持仓合笔查询
        public static List<FunctdsecuL_6_3Model> GetFunctdsecuL_6_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_3Models = new List<FunctdsecuL_6_3Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_3Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    FunctdsecuL_6_3Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_3Models;
        }
 
        //逻辑_交易证券_T0_账户汇总信息查询
        public static List<FunctdsecuL_6_4Model> GetFunctdsecuL_6_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_4Models = new List<FunctdsecuL_6_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.trade_amt = packer.GetDoublebyName("trade_amt", i);
                reqCommand.trade_qty = packer.GetDoublebyName("trade_qty", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.yield_rate = packer.GetDoublebyName("yield_rate", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.avail_amt = packer.GetDoublebyName("avail_amt", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_6_4Models.Add(reqCommand);
            }
            return FunctdsecuL_6_4Models;
        }
 
        //逻辑_交易证券_T0_账户汇总信息查询
        public static List<FunctdsecuL_6_4Model> GetFunctdsecuL_6_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_4Models = new List<FunctdsecuL_6_4Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_6_4Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                reqCommand.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                reqCommand.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                reqCommand.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                FunctdsecuL_6_4Models.Add(reqCommand);
            }
            return FunctdsecuL_6_4Models;
        }
 
        //逻辑_交易证券_T0_持仓盈亏查询
        public static List<FunctdsecuL_6_5Model> GetFunctdsecuL_6_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_5Models = new List<FunctdsecuL_6_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_5Model();
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
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
 
                FunctdsecuL_6_5Models.Add(reqCommand);
            }
            return FunctdsecuL_6_5Models;
        }
 
        //逻辑_交易证券_T0_持仓盈亏查询
        public static List<FunctdsecuL_6_5Model> GetFunctdsecuL_6_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_5Models = new List<FunctdsecuL_6_5Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_5Model();
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
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    FunctdsecuL_6_5Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_5Models;
        }
 
        //逻辑_交易证券_T0_持仓盈亏历史查询
        public static List<FunctdsecuL_6_6Model> GetFunctdsecuL_6_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_6Models = new List<FunctdsecuL_6_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_6Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
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
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
 
                FunctdsecuL_6_6Models.Add(reqCommand);
            }
            return FunctdsecuL_6_6Models;
        }
 
        //逻辑_交易证券_T0_持仓盈亏历史查询
        public static List<FunctdsecuL_6_6Model> GetFunctdsecuL_6_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_6Models = new List<FunctdsecuL_6_6Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_6Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
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
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    FunctdsecuL_6_6Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_6Models;
        }
 
        //逻辑_交易证券_T0_操作员阈值设置查询
        public static List<FunctdsecuL_6_9Model> GetFunctdsecuL_6_9Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_9Models = new List<FunctdsecuL_6_9Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_9Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.frozen_amt = packer.GetDoublebyName("frozen_amt", i);
                reqCommand.opor_warn_tshold = packer.GetDoublebyName("opor_warn_tshold", i);
                reqCommand.opor_stop_tshold = packer.GetDoublebyName("opor_stop_tshold", i);
                reqCommand.order_limit_time = packer.GetIntbyName("order_limit_time", i);
                reqCommand.per_secu_posi_ratio = packer.GetDoublebyName("per_secu_posi_ratio", i);
                reqCommand.posi_limit_time = packer.GetIntbyName("posi_limit_time", i);
                reqCommand.order_ctrl_qty = packer.GetDoublebyName("order_ctrl_qty", i);
                reqCommand.order_ctrl_amt = packer.GetDoublebyName("order_ctrl_amt", i);
                reqCommand.stock_warn_ratio = packer.GetDoublebyName("stock_warn_ratio", i);
                reqCommand.stock_stop_ratio = packer.GetDoublebyName("stock_stop_ratio", i);
                reqCommand.stock_warn_amt = packer.GetDoublebyName("stock_warn_amt", i);
                reqCommand.stock_stop_amt = packer.GetDoublebyName("stock_stop_amt", i);
                reqCommand.trig_oper_type = packer.GetIntbyName("trig_oper_type", i);
                reqCommand.open_close_permission = packer.GetIntbyName("open_close_permission", i);
                reqCommand.risk_oper = packer.GetIntbyName("risk_oper", i);
                reqCommand.fee_calc_type = packer.GetIntbyName("fee_calc_type", i);
                reqCommand.permit_margin_trade = packer.GetIntbyName("permit_margin_trade", i);
                reqCommand.buy_fee_ratio = packer.GetDoublebyName("buy_fee_ratio", i);
                reqCommand.sell_fee_ratio = packer.GetDoublebyName("sell_fee_ratio", i);
                reqCommand.buy_min_fee = packer.GetDoublebyName("buy_min_fee", i);
                reqCommand.sell_min_fee = packer.GetDoublebyName("sell_min_fee", i);
                reqCommand.trade_capt_amt = packer.GetDoublebyName("trade_capt_amt", i);
                reqCommand.trade_releas_amt = packer.GetDoublebyName("trade_releas_amt", i);
                reqCommand.strike_capt_amt = packer.GetDoublebyName("strike_capt_amt", i);
                reqCommand.strike_releas_amt = packer.GetDoublebyName("strike_releas_amt", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.amt_diff = packer.GetDoublebyName("amt_diff", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.avail_amt = packer.GetDoublebyName("avail_amt", i);
 
                FunctdsecuL_6_9Models.Add(reqCommand);
            }
            return FunctdsecuL_6_9Models;
        }
 
        //逻辑_交易证券_T0_操作员阈值设置查询
        public static List<FunctdsecuL_6_9Model> GetFunctdsecuL_6_9Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_9Models = new List<FunctdsecuL_6_9Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_9Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    reqCommand.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    reqCommand.order_limit_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_LIMIT_TIME_INT);
                    reqCommand.per_secu_posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PER_SECU_POSI_RATIO_FLOAT);
                    reqCommand.posi_limit_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_TIME_INT);
                    reqCommand.order_ctrl_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CTRL_QTY_FLOAT);
                    reqCommand.order_ctrl_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CTRL_AMT_FLOAT);
                    reqCommand.stock_warn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT);
                    reqCommand.stock_stop_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT);
                    reqCommand.stock_warn_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT);
                    reqCommand.stock_stop_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT);
                    reqCommand.trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_OPER_TYPE_INT);
                    reqCommand.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    reqCommand.risk_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_OPER_INT);
                    reqCommand.fee_calc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_CALC_TYPE_INT);
                    reqCommand.permit_margin_trade = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PERMIT_MARGIN_TRADE_INT);
                    reqCommand.buy_fee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_FEE_RATIO_FLOAT);
                    reqCommand.sell_fee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_FEE_RATIO_FLOAT);
                    reqCommand.buy_min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_MIN_FEE_FLOAT);
                    reqCommand.sell_min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_MIN_FEE_FLOAT);
                    reqCommand.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    reqCommand.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    reqCommand.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    reqCommand.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_DIFF_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    FunctdsecuL_6_9Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_9Models;
        }
 
        //逻辑_交易证券_T0_交易员开平仓明细查询
        public static List<FunctdsecuL_6_11Model> GetFunctdsecuL_6_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_11Models = new List<FunctdsecuL_6_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_11Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.close_posi_fee = packer.GetDoublebyName("close_posi_fee", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.open_posi_time = packer.GetIntbyName("open_posi_time", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.close_posi_time = packer.GetIntbyName("close_posi_time", i);
                reqCommand.close_posi_date = packer.GetIntbyName("close_posi_date", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
 
                FunctdsecuL_6_11Models.Add(reqCommand);
            }
            return FunctdsecuL_6_11Models;
        }
 
        //逻辑_交易证券_T0_交易员开平仓明细查询
        public static List<FunctdsecuL_6_11Model> GetFunctdsecuL_6_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_11Models = new List<FunctdsecuL_6_11Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_11Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.close_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_TIME_INT);
                    reqCommand.close_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_DATE_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    FunctdsecuL_6_11Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_11Models;
        }
 
        //逻辑_交易证券_T0_操作员阈值信息初始化
        public static List<FunctdsecuL_6_12Model> GetFunctdsecuL_6_12Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_12Models = new List<FunctdsecuL_6_12Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_12Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FunctdsecuL_6_12Models.Add(reqCommand);
            }
            return FunctdsecuL_6_12Models;
        }
 
        //逻辑_交易证券_T0_操作员阈值信息初始化
        public static List<FunctdsecuL_6_12Model> GetFunctdsecuL_6_12Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_12Models = new List<FunctdsecuL_6_12Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_6_12Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FunctdsecuL_6_12Models.Add(reqCommand);
            }
            return FunctdsecuL_6_12Models;
        }
 
        //逻辑_交易证券_T0_交易员开平仓明细历史查询
        public static List<FunctdsecuL_6_13Model> GetFunctdsecuL_6_13Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_13Models = new List<FunctdsecuL_6_13Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_13Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.close_posi_fee = packer.GetDoublebyName("close_posi_fee", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.open_posi_time = packer.GetIntbyName("open_posi_time", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.close_posi_time = packer.GetIntbyName("close_posi_time", i);
                reqCommand.close_posi_date = packer.GetIntbyName("close_posi_date", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
 
                FunctdsecuL_6_13Models.Add(reqCommand);
            }
            return FunctdsecuL_6_13Models;
        }
 
        //逻辑_交易证券_T0_交易员开平仓明细历史查询
        public static List<FunctdsecuL_6_13Model> GetFunctdsecuL_6_13Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_13Models = new List<FunctdsecuL_6_13Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_13Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.close_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_TIME_INT);
                    reqCommand.close_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_DATE_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    FunctdsecuL_6_13Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_13Models;
        }
 
        //逻辑_交易证券_T0_操作员券源限额设置查询
        public static List<FunctdsecuL_6_15Model> GetFunctdsecuL_6_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_15Models = new List<FunctdsecuL_6_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_15Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.source_stock_qty = packer.GetDoublebyName("source_stock_qty", i);
                reqCommand.single_limit_qty = packer.GetDoublebyName("single_limit_qty", i);
                reqCommand.assigned_qty = packer.GetDoublebyName("assigned_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.total_realize_pandl = packer.GetDoublebyName("total_realize_pandl", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.total_open_posi_fee = packer.GetDoublebyName("total_open_posi_fee", i);
                reqCommand.total_close_posi_fee = packer.GetDoublebyName("total_close_posi_fee", i);
                reqCommand.out_order_releas_qty = packer.GetDoublebyName("out_order_releas_qty", i);
                reqCommand.out_order_capt_qty = packer.GetDoublebyName("out_order_capt_qty", i);
                reqCommand.out_strike_releas_qty = packer.GetDoublebyName("out_strike_releas_qty", i);
                reqCommand.out_strike_capt_qty = packer.GetDoublebyName("out_strike_capt_qty", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.buy_avail_qty = packer.GetDoublebyName("buy_avail_qty", i);
                reqCommand.sell_avail_qty = packer.GetDoublebyName("sell_avail_qty", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.today_trade_fee = packer.GetDoublebyName("today_trade_fee", i);
                reqCommand.today_pandl = packer.GetDoublebyName("today_pandl", i);
                reqCommand.diff_qty = packer.GetDoublebyName("diff_qty", i);
                reqCommand.t0_buy_type = packer.GetIntbyName("t0_buy_type", i);
 
                FunctdsecuL_6_15Models.Add(reqCommand);
            }
            return FunctdsecuL_6_15Models;
        }
 
        //逻辑_交易证券_T0_操作员券源限额设置查询
        public static List<FunctdsecuL_6_15Model> GetFunctdsecuL_6_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_15Models = new List<FunctdsecuL_6_15Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_15Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.source_stock_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_QTY_FLOAT);
                    reqCommand.single_limit_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_QTY_FLOAT);
                    reqCommand.assigned_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.total_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZE_PANDL_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.total_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_OPEN_POSI_FEE_FLOAT);
                    reqCommand.total_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.out_order_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_RELEAS_QTY_FLOAT);
                    reqCommand.out_order_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_CAPT_QTY_FLOAT);
                    reqCommand.out_strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.out_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.buy_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AVAIL_QTY_FLOAT);
                    reqCommand.sell_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AVAIL_QTY_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.today_trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_TRADE_FEE_FLOAT);
                    reqCommand.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    reqCommand.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    reqCommand.t0_buy_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_T0_BUY_TYPE_INT);
                    FunctdsecuL_6_15Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_15Models;
        }
 
        //逻辑_交易证券_T0_操作员参数设置查询
        public static List<FunctdsecuL_6_20Model> GetFunctdsecuL_6_20Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_20Models = new List<FunctdsecuL_6_20Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_20Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.config_no = packer.GetInt64byName("config_no", i);
                reqCommand.config_value = packer.GetStrbyName("config_value", i);
                reqCommand.config_name = packer.GetStrbyName("config_name", i);
                reqCommand.config_memo = packer.GetStrbyName("config_memo", i);
 
                FunctdsecuL_6_20Models.Add(reqCommand);
            }
            return FunctdsecuL_6_20Models;
        }
 
        //逻辑_交易证券_T0_操作员参数设置查询
        public static List<FunctdsecuL_6_20Model> GetFunctdsecuL_6_20Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_20Models = new List<FunctdsecuL_6_20Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_20Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.config_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64);
                    reqCommand.config_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR);
                    reqCommand.config_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR);
                    reqCommand.config_memo = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_MEMO_STR);
                    FunctdsecuL_6_20Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_20Models;
        }
 
        //逻辑_交易证券_T0_操作员阈值信息计算更新
        public static List<FunctdsecuL_6_90Model> GetFunctdsecuL_6_90Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_90Models = new List<FunctdsecuL_6_90Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_90Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FunctdsecuL_6_90Models.Add(reqCommand);
            }
            return FunctdsecuL_6_90Models;
        }
 
        //逻辑_交易证券_T0_操作员阈值信息计算更新
        public static List<FunctdsecuL_6_90Model> GetFunctdsecuL_6_90Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_90Models = new List<FunctdsecuL_6_90Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_6_90Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FunctdsecuL_6_90Models.Add(reqCommand);
            }
            return FunctdsecuL_6_90Models;
        }
 
        //逻辑_交易证券_T0_操作员阈值汇总信息计算更新
        public static List<FunctdsecuL_6_92Model> GetFunctdsecuL_6_92Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_92Models = new List<FunctdsecuL_6_92Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_92Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FunctdsecuL_6_92Models.Add(reqCommand);
            }
            return FunctdsecuL_6_92Models;
        }
 
        //逻辑_交易证券_T0_操作员阈值汇总信息计算更新
        public static List<FunctdsecuL_6_92Model> GetFunctdsecuL_6_92Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_92Models = new List<FunctdsecuL_6_92Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_6_92Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FunctdsecuL_6_92Models.Add(reqCommand);
            }
            return FunctdsecuL_6_92Models;
        }
 
        //逻辑_交易证券_T0_隔夜仓查询
        public static List<FunctdsecuL_6_94Model> GetFunctdsecuL_6_94Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_94Models = new List<FunctdsecuL_6_94Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_94Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.open_posi_time = packer.GetIntbyName("open_posi_time", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
 
                FunctdsecuL_6_94Models.Add(reqCommand);
            }
            return FunctdsecuL_6_94Models;
        }
 
        //逻辑_交易证券_T0_隔夜仓查询
        public static List<FunctdsecuL_6_94Model> GetFunctdsecuL_6_94Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_94Models = new List<FunctdsecuL_6_94Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_94Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    FunctdsecuL_6_94Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_94Models;
        }
 
        //逻辑_交易证券_T0_查询操作员券源限额设置流水
        public static List<FunctdsecuL_6_99Model> GetFunctdsecuL_6_99Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_99Models = new List<FunctdsecuL_6_99Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_99Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.busi_opor_no = packer.GetIntbyName("busi_opor_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.source_stock_occur_qty = packer.GetDoublebyName("source_stock_occur_qty", i);
                reqCommand.source_stock_occur_end_qty = packer.GetDoublebyName("source_stock_occur_end_qty", i);
                reqCommand.single_limit_occur_qty = packer.GetDoublebyName("single_limit_occur_qty", i);
                reqCommand.single_limit_occur_end_qty = packer.GetDoublebyName("single_limit_occur_end_qty", i);
                reqCommand.assigned_occur_qty = packer.GetDoublebyName("assigned_occur_qty", i);
                reqCommand.assigned_occur_end_qty = packer.GetDoublebyName("assigned_occur_end_qty", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FunctdsecuL_6_99Models.Add(reqCommand);
            }
            return FunctdsecuL_6_99Models;
        }
 
        //逻辑_交易证券_T0_查询操作员券源限额设置流水
        public static List<FunctdsecuL_6_99Model> GetFunctdsecuL_6_99Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_99Models = new List<FunctdsecuL_6_99Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_99Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.busi_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.source_stock_occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_OCCUR_QTY_FLOAT);
                    reqCommand.source_stock_occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_OCCUR_END_QTY_FLOAT);
                    reqCommand.single_limit_occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_OCCUR_QTY_FLOAT);
                    reqCommand.single_limit_occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_OCCUR_END_QTY_FLOAT);
                    reqCommand.assigned_occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_OCCUR_QTY_FLOAT);
                    reqCommand.assigned_occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_OCCUR_END_QTY_FLOAT);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FunctdsecuL_6_99Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_99Models;
        }
 
        //逻辑_交易证券_T0_查询操作员券源限额设置流水历史
        public static List<FunctdsecuL_6_102Model> GetFunctdsecuL_6_102Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_102Models = new List<FunctdsecuL_6_102Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_102Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.busi_opor_no = packer.GetIntbyName("busi_opor_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.source_stock_occur_qty = packer.GetDoublebyName("source_stock_occur_qty", i);
                reqCommand.source_stock_occur_end_qty = packer.GetDoublebyName("source_stock_occur_end_qty", i);
                reqCommand.single_limit_occur_qty = packer.GetDoublebyName("single_limit_occur_qty", i);
                reqCommand.single_limit_occur_end_qty = packer.GetDoublebyName("single_limit_occur_end_qty", i);
                reqCommand.assigned_occur_qty = packer.GetDoublebyName("assigned_occur_qty", i);
                reqCommand.assigned_occur_end_qty = packer.GetDoublebyName("assigned_occur_end_qty", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FunctdsecuL_6_102Models.Add(reqCommand);
            }
            return FunctdsecuL_6_102Models;
        }
 
        //逻辑_交易证券_T0_查询操作员券源限额设置流水历史
        public static List<FunctdsecuL_6_102Model> GetFunctdsecuL_6_102Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_102Models = new List<FunctdsecuL_6_102Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_102Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.busi_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.source_stock_occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_OCCUR_QTY_FLOAT);
                    reqCommand.source_stock_occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_OCCUR_END_QTY_FLOAT);
                    reqCommand.single_limit_occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_OCCUR_QTY_FLOAT);
                    reqCommand.single_limit_occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_OCCUR_END_QTY_FLOAT);
                    reqCommand.assigned_occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_OCCUR_QTY_FLOAT);
                    reqCommand.assigned_occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_OCCUR_END_QTY_FLOAT);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FunctdsecuL_6_102Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_102Models;
        }
 
        //逻辑_交易证券_T0_查询操作员可用交易组资金
        public static List<FunctdsecuL_6_33Model> GetFunctdsecuL_6_33Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_33Models = new List<FunctdsecuL_6_33Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_33Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.frozen_amt = packer.GetDoublebyName("frozen_amt", i);
                reqCommand.unfroz_amt = packer.GetDoublebyName("unfroz_amt", i);
                reqCommand.comm_frozen_amt = packer.GetDoublebyName("comm_frozen_amt", i);
                reqCommand.comm_unfroz_amt = packer.GetDoublebyName("comm_unfroz_amt", i);
                reqCommand.comm_capt_amt = packer.GetDoublebyName("comm_capt_amt", i);
                reqCommand.comm_releas_amt = packer.GetDoublebyName("comm_releas_amt", i);
                reqCommand.trade_frozen_amt = packer.GetDoublebyName("trade_frozen_amt", i);
                reqCommand.trade_unfroz_amt = packer.GetDoublebyName("trade_unfroz_amt", i);
                reqCommand.trade_capt_amt = packer.GetDoublebyName("trade_capt_amt", i);
                reqCommand.trade_releas_amt = packer.GetDoublebyName("trade_releas_amt", i);
                reqCommand.strike_capt_amt = packer.GetDoublebyName("strike_capt_amt", i);
                reqCommand.strike_releas_amt = packer.GetDoublebyName("strike_releas_amt", i);
                reqCommand.avail_amt = packer.GetDoublebyName("avail_amt", i);
 
                FunctdsecuL_6_33Models.Add(reqCommand);
            }
            return FunctdsecuL_6_33Models;
        }
 
        //逻辑_交易证券_T0_查询操作员可用交易组资金
        public static List<FunctdsecuL_6_33Model> GetFunctdsecuL_6_33Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_33Models = new List<FunctdsecuL_6_33Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_33Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    reqCommand.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    reqCommand.comm_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_AMT_FLOAT);
                    reqCommand.comm_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_AMT_FLOAT);
                    reqCommand.comm_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_AMT_FLOAT);
                    reqCommand.trade_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_AMT_FLOAT);
                    reqCommand.trade_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_AMT_FLOAT);
                    reqCommand.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    reqCommand.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    reqCommand.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    reqCommand.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    reqCommand.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    FunctdsecuL_6_33Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_33Models;
        }
 
        //逻辑_交易证券_T0_查询持仓作废流水
        public static List<FunctdsecuL_6_34Model> GetFunctdsecuL_6_34Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_34Models = new List<FunctdsecuL_6_34Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_34Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.busi_opor_no = packer.GetIntbyName("busi_opor_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.open_posi_time = packer.GetIntbyName("open_posi_time", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.waste_qty = packer.GetDoublebyName("waste_qty", i);
                reqCommand.waste_date = packer.GetIntbyName("waste_date", i);
                reqCommand.waste_time = packer.GetIntbyName("waste_time", i);
                reqCommand.detail_posi_id = packer.GetInt64byName("detail_posi_id", i);
 
                FunctdsecuL_6_34Models.Add(reqCommand);
            }
            return FunctdsecuL_6_34Models;
        }
 
        //逻辑_交易证券_T0_查询持仓作废流水
        public static List<FunctdsecuL_6_34Model> GetFunctdsecuL_6_34Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_34Models = new List<FunctdsecuL_6_34Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_34Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.busi_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.waste_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_QTY_FLOAT);
                    reqCommand.waste_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_DATE_INT);
                    reqCommand.waste_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_TIME_INT);
                    reqCommand.detail_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DETAIL_POSI_ID_INT64);
                    FunctdsecuL_6_34Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_34Models;
        }
 
        //逻辑_交易证券_T0_查询历史持仓作废流水
        public static List<FunctdsecuL_6_35Model> GetFunctdsecuL_6_35Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_35Models = new List<FunctdsecuL_6_35Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_35Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.busi_opor_no = packer.GetIntbyName("busi_opor_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.open_posi_time = packer.GetIntbyName("open_posi_time", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.waste_qty = packer.GetDoublebyName("waste_qty", i);
                reqCommand.waste_date = packer.GetIntbyName("waste_date", i);
                reqCommand.waste_time = packer.GetIntbyName("waste_time", i);
                reqCommand.detail_posi_id = packer.GetInt64byName("detail_posi_id", i);
 
                FunctdsecuL_6_35Models.Add(reqCommand);
            }
            return FunctdsecuL_6_35Models;
        }
 
        //逻辑_交易证券_T0_查询历史持仓作废流水
        public static List<FunctdsecuL_6_35Model> GetFunctdsecuL_6_35Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_35Models = new List<FunctdsecuL_6_35Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_35Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.busi_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.waste_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_QTY_FLOAT);
                    reqCommand.waste_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_DATE_INT);
                    reqCommand.waste_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_TIME_INT);
                    reqCommand.detail_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DETAIL_POSI_ID_INT64);
                    FunctdsecuL_6_35Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_35Models;
        }
 
        //逻辑_交易证券_T0_查询操作员持仓市值
        public static List<FunctdsecuL_6_38Model> GetFunctdsecuL_6_38Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_38Models = new List<FunctdsecuL_6_38Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_38Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.max_posi_market_value = packer.GetDoublebyName("max_posi_market_value", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_6_38Models.Add(reqCommand);
            }
            return FunctdsecuL_6_38Models;
        }
 
        //逻辑_交易证券_T0_查询操作员持仓市值
        public static List<FunctdsecuL_6_38Model> GetFunctdsecuL_6_38Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_38Models = new List<FunctdsecuL_6_38Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_38Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.max_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_6_38Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_38Models;
        }
 
        //逻辑_交易证券_T0_根据操作员查询券源持仓
        public static List<FunctdsecuL_6_110Model> GetFunctdsecuL_6_110Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_110Models = new List<FunctdsecuL_6_110Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_110Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.source_stock_qty = packer.GetDoublebyName("source_stock_qty", i);
                reqCommand.single_limit_qty = packer.GetDoublebyName("single_limit_qty", i);
                reqCommand.assigned_qty = packer.GetDoublebyName("assigned_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.total_open_posi_fee = packer.GetDoublebyName("total_open_posi_fee", i);
                reqCommand.total_close_posi_fee = packer.GetDoublebyName("total_close_posi_fee", i);
                reqCommand.out_order_releas_qty = packer.GetDoublebyName("out_order_releas_qty", i);
                reqCommand.out_order_capt_qty = packer.GetDoublebyName("out_order_capt_qty", i);
                reqCommand.out_strike_releas_qty = packer.GetDoublebyName("out_strike_releas_qty", i);
                reqCommand.out_strike_capt_qty = packer.GetDoublebyName("out_strike_capt_qty", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.buy_avail_qty = packer.GetDoublebyName("buy_avail_qty", i);
                reqCommand.sell_avail_qty = packer.GetDoublebyName("sell_avail_qty", i);
                reqCommand.posi_qty = packer.GetDoublebyName("posi_qty", i);
                reqCommand.today_trade_fee = packer.GetDoublebyName("today_trade_fee", i);
                reqCommand.today_pandl = packer.GetDoublebyName("today_pandl", i);
                reqCommand.diff_qty = packer.GetDoublebyName("diff_qty", i);
                reqCommand.over_night_trade_buy_qty = packer.GetDoublebyName("over_night_trade_buy_qty", i);
                reqCommand.over_night_trade_sell_qty = packer.GetDoublebyName("over_night_trade_sell_qty", i);
                reqCommand.over_night_strike_sell_qty = packer.GetDoublebyName("over_night_strike_sell_qty", i);
                reqCommand.over_night_sumtrd_sell_qty = packer.GetDoublebyName("over_night_sumtrd_sell_qty", i);
                reqCommand.over_night_sumstk_sell_qty = packer.GetDoublebyName("over_night_sumstk_sell_qty", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_6_110Models.Add(reqCommand);
            }
            return FunctdsecuL_6_110Models;
        }
 
        //逻辑_交易证券_T0_根据操作员查询券源持仓
        public static List<FunctdsecuL_6_110Model> GetFunctdsecuL_6_110Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_110Models = new List<FunctdsecuL_6_110Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_110Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.source_stock_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_QTY_FLOAT);
                    reqCommand.single_limit_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_QTY_FLOAT);
                    reqCommand.assigned_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.total_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_OPEN_POSI_FEE_FLOAT);
                    reqCommand.total_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.out_order_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_RELEAS_QTY_FLOAT);
                    reqCommand.out_order_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_CAPT_QTY_FLOAT);
                    reqCommand.out_strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.out_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.buy_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AVAIL_QTY_FLOAT);
                    reqCommand.sell_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AVAIL_QTY_FLOAT);
                    reqCommand.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    reqCommand.today_trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_TRADE_FEE_FLOAT);
                    reqCommand.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    reqCommand.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    reqCommand.over_night_trade_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_TRADE_BUY_QTY_FLOAT);
                    reqCommand.over_night_trade_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_TRADE_SELL_QTY_FLOAT);
                    reqCommand.over_night_strike_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_STRIKE_SELL_QTY_FLOAT);
                    reqCommand.over_night_sumtrd_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_SUMTRD_SELL_QTY_FLOAT);
                    reqCommand.over_night_sumstk_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_SUMSTK_SELL_QTY_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_6_110Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_110Models;
        }
 
        //逻辑_交易证券_T0_根据操作员查询账户汇总信息
        public static List<FunctdsecuL_6_113Model> GetFunctdsecuL_6_113Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_113Models = new List<FunctdsecuL_6_113Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_113Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.trade_amt = packer.GetDoublebyName("trade_amt", i);
                reqCommand.trade_qty = packer.GetDoublebyName("trade_qty", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.yield_rate = packer.GetDoublebyName("yield_rate", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.avail_amt = packer.GetDoublebyName("avail_amt", i);
                reqCommand.over_night_pandl = packer.GetDoublebyName("over_night_pandl", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_6_113Models.Add(reqCommand);
            }
            return FunctdsecuL_6_113Models;
        }
 
        //逻辑_交易证券_T0_根据操作员查询账户汇总信息
        public static List<FunctdsecuL_6_113Model> GetFunctdsecuL_6_113Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_113Models = new List<FunctdsecuL_6_113Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_6_113Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                reqCommand.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                reqCommand.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                reqCommand.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                reqCommand.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                FunctdsecuL_6_113Models.Add(reqCommand);
            }
            return FunctdsecuL_6_113Models;
        }
 
        //逻辑_交易证券_T0_根据操作员查询操作员可用交易组资金
        public static List<FunctdsecuL_6_112Model> GetFunctdsecuL_6_112Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_112Models = new List<FunctdsecuL_6_112Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_112Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.frozen_amt = packer.GetDoublebyName("frozen_amt", i);
                reqCommand.unfroz_amt = packer.GetDoublebyName("unfroz_amt", i);
                reqCommand.comm_frozen_amt = packer.GetDoublebyName("comm_frozen_amt", i);
                reqCommand.comm_unfroz_amt = packer.GetDoublebyName("comm_unfroz_amt", i);
                reqCommand.comm_capt_amt = packer.GetDoublebyName("comm_capt_amt", i);
                reqCommand.comm_releas_amt = packer.GetDoublebyName("comm_releas_amt", i);
                reqCommand.trade_frozen_amt = packer.GetDoublebyName("trade_frozen_amt", i);
                reqCommand.trade_unfroz_amt = packer.GetDoublebyName("trade_unfroz_amt", i);
                reqCommand.trade_capt_amt = packer.GetDoublebyName("trade_capt_amt", i);
                reqCommand.trade_releas_amt = packer.GetDoublebyName("trade_releas_amt", i);
                reqCommand.strike_capt_amt = packer.GetDoublebyName("strike_capt_amt", i);
                reqCommand.strike_releas_amt = packer.GetDoublebyName("strike_releas_amt", i);
                reqCommand.avail_amt = packer.GetDoublebyName("avail_amt", i);
 
                FunctdsecuL_6_112Models.Add(reqCommand);
            }
            return FunctdsecuL_6_112Models;
        }
 
        //逻辑_交易证券_T0_根据操作员查询操作员可用交易组资金
        public static List<FunctdsecuL_6_112Model> GetFunctdsecuL_6_112Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_112Models = new List<FunctdsecuL_6_112Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_112Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    reqCommand.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    reqCommand.comm_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_AMT_FLOAT);
                    reqCommand.comm_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_AMT_FLOAT);
                    reqCommand.comm_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_AMT_FLOAT);
                    reqCommand.trade_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_AMT_FLOAT);
                    reqCommand.trade_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_AMT_FLOAT);
                    reqCommand.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    reqCommand.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    reqCommand.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    reqCommand.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    reqCommand.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    FunctdsecuL_6_112Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_112Models;
        }
 
        //逻辑_交易证券_T0_根据操作员查询操作员阈值设置
        public static List<FunctdsecuL_6_114Model> GetFunctdsecuL_6_114Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_6_114Models = new List<FunctdsecuL_6_114Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_6_114Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.begin_amt = packer.GetDoublebyName("begin_amt", i);
                reqCommand.curr_amt = packer.GetDoublebyName("curr_amt", i);
                reqCommand.frozen_amt = packer.GetDoublebyName("frozen_amt", i);
                reqCommand.opor_warn_tshold = packer.GetDoublebyName("opor_warn_tshold", i);
                reqCommand.opor_stop_tshold = packer.GetDoublebyName("opor_stop_tshold", i);
                reqCommand.order_limit_time = packer.GetIntbyName("order_limit_time", i);
                reqCommand.per_secu_posi_ratio = packer.GetDoublebyName("per_secu_posi_ratio", i);
                reqCommand.posi_limit_time = packer.GetIntbyName("posi_limit_time", i);
                reqCommand.order_ctrl_qty = packer.GetDoublebyName("order_ctrl_qty", i);
                reqCommand.order_ctrl_amt = packer.GetDoublebyName("order_ctrl_amt", i);
                reqCommand.stock_warn_ratio = packer.GetDoublebyName("stock_warn_ratio", i);
                reqCommand.stock_stop_ratio = packer.GetDoublebyName("stock_stop_ratio", i);
                reqCommand.stock_warn_amt = packer.GetDoublebyName("stock_warn_amt", i);
                reqCommand.stock_stop_amt = packer.GetDoublebyName("stock_stop_amt", i);
                reqCommand.trig_oper_type = packer.GetIntbyName("trig_oper_type", i);
                reqCommand.open_close_permission = packer.GetIntbyName("open_close_permission", i);
                reqCommand.risk_oper = packer.GetIntbyName("risk_oper", i);
                reqCommand.fee_calc_type = packer.GetIntbyName("fee_calc_type", i);
                reqCommand.permit_margin_trade = packer.GetIntbyName("permit_margin_trade", i);
                reqCommand.buy_fee_ratio = packer.GetDoublebyName("buy_fee_ratio", i);
                reqCommand.sell_fee_ratio = packer.GetDoublebyName("sell_fee_ratio", i);
                reqCommand.buy_min_fee = packer.GetDoublebyName("buy_min_fee", i);
                reqCommand.sell_min_fee = packer.GetDoublebyName("sell_min_fee", i);
                reqCommand.trade_capt_amt = packer.GetDoublebyName("trade_capt_amt", i);
                reqCommand.trade_releas_amt = packer.GetDoublebyName("trade_releas_amt", i);
                reqCommand.strike_capt_amt = packer.GetDoublebyName("strike_capt_amt", i);
                reqCommand.strike_releas_amt = packer.GetDoublebyName("strike_releas_amt", i);
                reqCommand.sum_realize_pandl = packer.GetDoublebyName("sum_realize_pandl", i);
                reqCommand.amt_diff = packer.GetDoublebyName("amt_diff", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.avail_amt = packer.GetDoublebyName("avail_amt", i);
 
                FunctdsecuL_6_114Models.Add(reqCommand);
            }
            return FunctdsecuL_6_114Models;
        }
 
        //逻辑_交易证券_T0_根据操作员查询操作员阈值设置
        public static List<FunctdsecuL_6_114Model> GetFunctdsecuL_6_114Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_6_114Models = new List<FunctdsecuL_6_114Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_6_114Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    reqCommand.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    reqCommand.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    reqCommand.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    reqCommand.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    reqCommand.order_limit_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_LIMIT_TIME_INT);
                    reqCommand.per_secu_posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PER_SECU_POSI_RATIO_FLOAT);
                    reqCommand.posi_limit_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_TIME_INT);
                    reqCommand.order_ctrl_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CTRL_QTY_FLOAT);
                    reqCommand.order_ctrl_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CTRL_AMT_FLOAT);
                    reqCommand.stock_warn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT);
                    reqCommand.stock_stop_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT);
                    reqCommand.stock_warn_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT);
                    reqCommand.stock_stop_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT);
                    reqCommand.trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_OPER_TYPE_INT);
                    reqCommand.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    reqCommand.risk_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_OPER_INT);
                    reqCommand.fee_calc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_CALC_TYPE_INT);
                    reqCommand.permit_margin_trade = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PERMIT_MARGIN_TRADE_INT);
                    reqCommand.buy_fee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_FEE_RATIO_FLOAT);
                    reqCommand.sell_fee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_FEE_RATIO_FLOAT);
                    reqCommand.buy_min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_MIN_FEE_FLOAT);
                    reqCommand.sell_min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_MIN_FEE_FLOAT);
                    reqCommand.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    reqCommand.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    reqCommand.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    reqCommand.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    reqCommand.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    reqCommand.amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_DIFF_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    FunctdsecuL_6_114Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_6_114Models;
        }
 
    }
}
