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
    public class tdsecuL_6_1_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_1_Response()
        {
            this.tdsecuL_6_1_InfoList = new ObservableCollection<tdsecuL_6_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_1_Info> tdsecuL_6_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_1_Info info = new tdsecuL_6_1_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.source_stock_qty = unpacker.GetDouble("source_stock_qty");
            info.single_limit_qty = unpacker.GetDouble("single_limit_qty");
            info.assigned_qty = unpacker.GetDouble("assigned_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.total_open_posi_fee = unpacker.GetDouble("total_open_posi_fee");
            info.total_close_posi_fee = unpacker.GetDouble("total_close_posi_fee");
            info.out_order_releas_qty = unpacker.GetDouble("out_order_releas_qty");
            info.out_order_capt_qty = unpacker.GetDouble("out_order_capt_qty");
            info.out_strike_releas_qty = unpacker.GetDouble("out_strike_releas_qty");
            info.out_strike_capt_qty = unpacker.GetDouble("out_strike_capt_qty");
            info.remark_info = unpacker.GetStr("remark_info");
            info.buy_avail_qty = unpacker.GetDouble("buy_avail_qty");
            info.sell_avail_qty = unpacker.GetDouble("sell_avail_qty");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.today_trade_fee = unpacker.GetDouble("today_trade_fee");
            info.today_pandl = unpacker.GetDouble("today_pandl");
            info.diff_qty = unpacker.GetDouble("diff_qty");
            info.over_night_trade_buy_qty = unpacker.GetDouble("over_night_trade_buy_qty");
            info.over_night_trade_sell_qty = unpacker.GetDouble("over_night_trade_sell_qty");
            info.over_night_strike_sell_qty = unpacker.GetDouble("over_night_strike_sell_qty");
            info.over_night_sumtrd_sell_qty = unpacker.GetDouble("over_night_sumtrd_sell_qty");
            info.over_night_sumstk_sell_qty = unpacker.GetDouble("over_night_sumstk_sell_qty");
            info.t0_buy_type = unpacker.GetInt("t0_buy_type");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_6_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_1_InfoList.Add((tdsecuL_6_1_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_券源持仓查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_1_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.source_stock_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_QTY_FLOAT);
                    info.single_limit_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_QTY_FLOAT);
                    info.assigned_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.total_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_OPEN_POSI_FEE_FLOAT);
                    info.total_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CLOSE_POSI_FEE_FLOAT);
                    info.out_order_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_RELEAS_QTY_FLOAT);
                    info.out_order_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_CAPT_QTY_FLOAT);
                    info.out_strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_RELEAS_QTY_FLOAT);
                    info.out_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_CAPT_QTY_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.buy_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AVAIL_QTY_FLOAT);
                    info.sell_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AVAIL_QTY_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.today_trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_TRADE_FEE_FLOAT);
                    info.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    info.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    info.over_night_trade_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_TRADE_BUY_QTY_FLOAT);
                    info.over_night_trade_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_TRADE_SELL_QTY_FLOAT);
                    info.over_night_strike_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_STRIKE_SELL_QTY_FLOAT);
                    info.over_night_sumtrd_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_SUMTRD_SELL_QTY_FLOAT);
                    info.over_night_sumstk_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_SUMSTK_SELL_QTY_FLOAT);
                    info.t0_buy_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_T0_BUY_TYPE_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_6_1_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_111_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_111_Response()
        {
            this.tdsecuL_6_111_InfoList = new ObservableCollection<tdsecuL_6_111_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_111_Info> tdsecuL_6_111_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_111_Info info = new tdsecuL_6_111_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.source_stock_qty = unpacker.GetDouble("source_stock_qty");
            info.single_limit_qty = unpacker.GetDouble("single_limit_qty");
            info.assigned_qty = unpacker.GetDouble("assigned_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.total_open_posi_fee = unpacker.GetDouble("total_open_posi_fee");
            info.total_close_posi_fee = unpacker.GetDouble("total_close_posi_fee");
            info.out_order_releas_qty = unpacker.GetDouble("out_order_releas_qty");
            info.out_order_capt_qty = unpacker.GetDouble("out_order_capt_qty");
            info.out_strike_releas_qty = unpacker.GetDouble("out_strike_releas_qty");
            info.out_strike_capt_qty = unpacker.GetDouble("out_strike_capt_qty");
            info.remark_info = unpacker.GetStr("remark_info");
            info.buy_avail_qty = unpacker.GetDouble("buy_avail_qty");
            info.sell_avail_qty = unpacker.GetDouble("sell_avail_qty");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.today_trade_fee = unpacker.GetDouble("today_trade_fee");
            info.today_pandl = unpacker.GetDouble("today_pandl");
            info.diff_qty = unpacker.GetDouble("diff_qty");
            info.t0_buy_type = unpacker.GetInt("t0_buy_type");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_6_111_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_111_InfoList.Add((tdsecuL_6_111_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_券源持仓历史查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_111_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.source_stock_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_QTY_FLOAT);
                    info.single_limit_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_QTY_FLOAT);
                    info.assigned_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.total_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_OPEN_POSI_FEE_FLOAT);
                    info.total_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CLOSE_POSI_FEE_FLOAT);
                    info.out_order_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_RELEAS_QTY_FLOAT);
                    info.out_order_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_CAPT_QTY_FLOAT);
                    info.out_strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_RELEAS_QTY_FLOAT);
                    info.out_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_CAPT_QTY_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.buy_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AVAIL_QTY_FLOAT);
                    info.sell_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AVAIL_QTY_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.today_trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_TRADE_FEE_FLOAT);
                    info.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    info.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    info.t0_buy_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_T0_BUY_TYPE_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_6_111_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_2_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_2_Response()
        {
            this.tdsecuL_6_2_InfoList = new ObservableCollection<tdsecuL_6_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_2_Info> tdsecuL_6_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_2_Info info = new tdsecuL_6_2_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.open_posi_time = unpacker.GetInt("open_posi_time");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.close_posi_date = unpacker.GetInt("close_posi_date");
            info.close_posi_time = unpacker.GetInt("close_posi_time");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.close_posi_fee = unpacker.GetDouble("close_posi_fee");
            info.strike_no = unpacker.GetStr("strike_no");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            info.posi_status = unpacker.GetStr("posi_status");
            info.remark_info = unpacker.GetStr("remark_info");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_6_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_2_InfoList.Add((tdsecuL_6_2_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_持仓分笔查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_2_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.close_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_DATE_INT);
                    info.close_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_TIME_INT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    info.posi_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_STATUS_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_6_2_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_201_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_201_Response()
        {
            this.tdsecuL_6_201_InfoList = new ObservableCollection<tdsecuL_6_201_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_201_Info> tdsecuL_6_201_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_201_Info info = new tdsecuL_6_201_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.open_posi_time = unpacker.GetInt("open_posi_time");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.close_posi_date = unpacker.GetInt("close_posi_date");
            info.close_posi_time = unpacker.GetInt("close_posi_time");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.close_posi_fee = unpacker.GetDouble("close_posi_fee");
            info.strike_no = unpacker.GetStr("strike_no");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            info.posi_status = unpacker.GetStr("posi_status");
            info.remark_info = unpacker.GetStr("remark_info");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_6_201_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_201_InfoList.Add((tdsecuL_6_201_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_持仓分笔历史查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_201_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.close_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_DATE_INT);
                    info.close_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_TIME_INT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    info.posi_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_STATUS_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_6_201_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_3_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_3_Response()
        {
            this.tdsecuL_6_3_InfoList = new ObservableCollection<tdsecuL_6_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_3_Info> tdsecuL_6_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_3_Info info = new tdsecuL_6_3_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.open_posi_time = unpacker.GetInt("open_posi_time");
            info.cost_price = unpacker.GetDouble("cost_price");
            tdsecuL_6_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_3_InfoList.Add((tdsecuL_6_3_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_持仓合笔查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_3_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    tdsecuL_6_3_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_4_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_4_Response()
        {
            this.tdsecuL_6_4_InfoList = new ObservableCollection<tdsecuL_6_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_4_Info> tdsecuL_6_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_4_Info info = new tdsecuL_6_4_Info();
            info.trade_amt = unpacker.GetDouble("trade_amt");
            info.trade_qty = unpacker.GetDouble("trade_qty");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.yield_rate = unpacker.GetDouble("yield_rate");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.avail_amt = unpacker.GetDouble("avail_amt");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_6_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_4_InfoList.Add((tdsecuL_6_4_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_账户汇总信息查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_4_Info();
                info.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                info.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                info.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                info.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                tdsecuL_6_4_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_5_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_5_Response()
        {
            this.tdsecuL_6_5_InfoList = new ObservableCollection<tdsecuL_6_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_5_Info> tdsecuL_6_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_5_Info info = new tdsecuL_6_5_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.trade_qty = unpacker.GetDouble("trade_qty");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.opor_no = unpacker.GetInt("opor_no");
            info.yield_rate = unpacker.GetDouble("yield_rate");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            tdsecuL_6_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_5_InfoList.Add((tdsecuL_6_5_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_持仓盈亏查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_5_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    tdsecuL_6_5_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_6_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_6_Response()
        {
            this.tdsecuL_6_6_InfoList = new ObservableCollection<tdsecuL_6_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_6_Info> tdsecuL_6_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_6_Info info = new tdsecuL_6_6_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.trade_qty = unpacker.GetDouble("trade_qty");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.opor_no = unpacker.GetInt("opor_no");
            info.yield_rate = unpacker.GetDouble("yield_rate");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            tdsecuL_6_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_6_InfoList.Add((tdsecuL_6_6_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_持仓盈亏历史查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_6_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    tdsecuL_6_6_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_9_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_9_Response()
        {
            this.tdsecuL_6_9_InfoList = new ObservableCollection<tdsecuL_6_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_9_Info> tdsecuL_6_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_9_Info info = new tdsecuL_6_9_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.frozen_amt = unpacker.GetDouble("frozen_amt");
            info.opor_warn_tshold = unpacker.GetDouble("opor_warn_tshold");
            info.opor_stop_tshold = unpacker.GetDouble("opor_stop_tshold");
            info.order_limit_time = unpacker.GetInt("order_limit_time");
            info.per_secu_posi_ratio = unpacker.GetDouble("per_secu_posi_ratio");
            info.posi_limit_time = unpacker.GetInt("posi_limit_time");
            info.order_ctrl_qty = unpacker.GetDouble("order_ctrl_qty");
            info.order_ctrl_amt = unpacker.GetDouble("order_ctrl_amt");
            info.stock_warn_ratio = unpacker.GetDouble("stock_warn_ratio");
            info.stock_stop_ratio = unpacker.GetDouble("stock_stop_ratio");
            info.stock_warn_amt = unpacker.GetDouble("stock_warn_amt");
            info.stock_stop_amt = unpacker.GetDouble("stock_stop_amt");
            info.trig_oper_type = unpacker.GetInt("trig_oper_type");
            info.open_close_permission = unpacker.GetInt("open_close_permission");
            info.risk_oper = unpacker.GetInt("risk_oper");
            info.fee_calc_type = unpacker.GetInt("fee_calc_type");
            info.permit_margin_trade = unpacker.GetInt("permit_margin_trade");
            info.buy_fee_ratio = unpacker.GetDouble("buy_fee_ratio");
            info.sell_fee_ratio = unpacker.GetDouble("sell_fee_ratio");
            info.buy_min_fee = unpacker.GetDouble("buy_min_fee");
            info.sell_min_fee = unpacker.GetDouble("sell_min_fee");
            info.trade_capt_amt = unpacker.GetDouble("trade_capt_amt");
            info.trade_releas_amt = unpacker.GetDouble("trade_releas_amt");
            info.strike_capt_amt = unpacker.GetDouble("strike_capt_amt");
            info.strike_releas_amt = unpacker.GetDouble("strike_releas_amt");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.amt_diff = unpacker.GetDouble("amt_diff");
            info.remark_info = unpacker.GetStr("remark_info");
            info.update_times = unpacker.GetInt("update_times");
            info.avail_amt = unpacker.GetDouble("avail_amt");
            tdsecuL_6_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_9_InfoList.Add((tdsecuL_6_9_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_操作员阈值设置查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_9_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    info.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    info.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    info.order_limit_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_LIMIT_TIME_INT);
                    info.per_secu_posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PER_SECU_POSI_RATIO_FLOAT);
                    info.posi_limit_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_TIME_INT);
                    info.order_ctrl_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CTRL_QTY_FLOAT);
                    info.order_ctrl_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CTRL_AMT_FLOAT);
                    info.stock_warn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT);
                    info.stock_stop_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT);
                    info.stock_warn_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT);
                    info.stock_stop_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT);
                    info.trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_OPER_TYPE_INT);
                    info.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    info.risk_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_OPER_INT);
                    info.fee_calc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_CALC_TYPE_INT);
                    info.permit_margin_trade = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PERMIT_MARGIN_TRADE_INT);
                    info.buy_fee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_FEE_RATIO_FLOAT);
                    info.sell_fee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_FEE_RATIO_FLOAT);
                    info.buy_min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_MIN_FEE_FLOAT);
                    info.sell_min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_MIN_FEE_FLOAT);
                    info.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    info.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    info.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    info.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_DIFF_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    tdsecuL_6_9_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_10_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_10_Response()
        {
            this.tdsecuL_6_10_InfoList = new ObservableCollection<tdsecuL_6_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_10_Info> tdsecuL_6_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_10_Info info = new tdsecuL_6_10_Info();
            tdsecuL_6_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_10_InfoList.Add((tdsecuL_6_10_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_操作员阈值设置新增
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_10_Info();
                tdsecuL_6_10_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_101_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_101_Response()
        {
            this.tdsecuL_6_101_InfoList = new ObservableCollection<tdsecuL_6_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_101_Info> tdsecuL_6_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_101_Info info = new tdsecuL_6_101_Info();
            tdsecuL_6_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_101_InfoList.Add((tdsecuL_6_101_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_操作员阈值设置更新
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_101_Info();
                tdsecuL_6_101_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_11_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_11_Response()
        {
            this.tdsecuL_6_11_InfoList = new ObservableCollection<tdsecuL_6_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_11_Info> tdsecuL_6_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_11_Info info = new tdsecuL_6_11_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.strike_no = unpacker.GetStr("strike_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.close_posi_fee = unpacker.GetDouble("close_posi_fee");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.open_posi_time = unpacker.GetInt("open_posi_time");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.close_posi_time = unpacker.GetInt("close_posi_time");
            info.close_posi_date = unpacker.GetInt("close_posi_date");
            info.opor_no = unpacker.GetInt("opor_no");
            tdsecuL_6_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_11_InfoList.Add((tdsecuL_6_11_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_交易员开平仓明细查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_11_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.close_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_TIME_INT);
                    info.close_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_DATE_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    tdsecuL_6_11_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_12_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_12_Response()
        {
            this.tdsecuL_6_12_InfoList = new ObservableCollection<tdsecuL_6_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_12_Info> tdsecuL_6_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_12_Info info = new tdsecuL_6_12_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            tdsecuL_6_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_12_InfoList.Add((tdsecuL_6_12_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_操作员阈值信息初始化
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_12_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                tdsecuL_6_12_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_13_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_13_Response()
        {
            this.tdsecuL_6_13_InfoList = new ObservableCollection<tdsecuL_6_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_13_Info> tdsecuL_6_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_13_Info info = new tdsecuL_6_13_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.row_id = unpacker.GetInt64("row_id");
            info.strike_no = unpacker.GetStr("strike_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.close_posi_fee = unpacker.GetDouble("close_posi_fee");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.open_posi_time = unpacker.GetInt("open_posi_time");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.close_posi_time = unpacker.GetInt("close_posi_time");
            info.close_posi_date = unpacker.GetInt("close_posi_date");
            info.opor_no = unpacker.GetInt("opor_no");
            tdsecuL_6_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_13_InfoList.Add((tdsecuL_6_13_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_交易员开平仓明细历史查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_13_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.close_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_TIME_INT);
                    info.close_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_DATE_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    tdsecuL_6_13_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_14_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_14_Response()
        {
            this.tdsecuL_6_14_InfoList = new ObservableCollection<tdsecuL_6_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_14_Info> tdsecuL_6_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_14_Info info = new tdsecuL_6_14_Info();
            tdsecuL_6_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_14_InfoList.Add((tdsecuL_6_14_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_操作员券源限额设置更新
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_14_Info();
                tdsecuL_6_14_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_15_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_15_Response()
        {
            this.tdsecuL_6_15_InfoList = new ObservableCollection<tdsecuL_6_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_15_Info> tdsecuL_6_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_15_Info info = new tdsecuL_6_15_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.source_stock_qty = unpacker.GetDouble("source_stock_qty");
            info.single_limit_qty = unpacker.GetDouble("single_limit_qty");
            info.assigned_qty = unpacker.GetDouble("assigned_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.total_realize_pandl = unpacker.GetDouble("total_realize_pandl");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.total_open_posi_fee = unpacker.GetDouble("total_open_posi_fee");
            info.total_close_posi_fee = unpacker.GetDouble("total_close_posi_fee");
            info.out_order_releas_qty = unpacker.GetDouble("out_order_releas_qty");
            info.out_order_capt_qty = unpacker.GetDouble("out_order_capt_qty");
            info.out_strike_releas_qty = unpacker.GetDouble("out_strike_releas_qty");
            info.out_strike_capt_qty = unpacker.GetDouble("out_strike_capt_qty");
            info.remark_info = unpacker.GetStr("remark_info");
            info.update_times = unpacker.GetInt("update_times");
            info.buy_avail_qty = unpacker.GetDouble("buy_avail_qty");
            info.sell_avail_qty = unpacker.GetDouble("sell_avail_qty");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.today_trade_fee = unpacker.GetDouble("today_trade_fee");
            info.today_pandl = unpacker.GetDouble("today_pandl");
            info.diff_qty = unpacker.GetDouble("diff_qty");
            info.t0_buy_type = unpacker.GetInt("t0_buy_type");
            tdsecuL_6_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_15_InfoList.Add((tdsecuL_6_15_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_操作员券源限额设置查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_15_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.source_stock_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_QTY_FLOAT);
                    info.single_limit_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_QTY_FLOAT);
                    info.assigned_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.total_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZE_PANDL_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.total_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_OPEN_POSI_FEE_FLOAT);
                    info.total_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CLOSE_POSI_FEE_FLOAT);
                    info.out_order_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_RELEAS_QTY_FLOAT);
                    info.out_order_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_CAPT_QTY_FLOAT);
                    info.out_strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_RELEAS_QTY_FLOAT);
                    info.out_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_CAPT_QTY_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.buy_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AVAIL_QTY_FLOAT);
                    info.sell_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AVAIL_QTY_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.today_trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_TRADE_FEE_FLOAT);
                    info.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    info.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    info.t0_buy_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_T0_BUY_TYPE_INT);
                    tdsecuL_6_15_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_16_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_16_Response()
        {
            this.tdsecuL_6_16_InfoList = new ObservableCollection<tdsecuL_6_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_16_Info> tdsecuL_6_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_16_Info info = new tdsecuL_6_16_Info();
            tdsecuL_6_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_16_InfoList.Add((tdsecuL_6_16_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_删除操作员券源限额设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_16_Info();
                tdsecuL_6_16_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_17_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_17_Response()
        {
            this.tdsecuL_6_17_InfoList = new ObservableCollection<tdsecuL_6_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_17_Info> tdsecuL_6_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_17_Info info = new tdsecuL_6_17_Info();
            tdsecuL_6_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_17_InfoList.Add((tdsecuL_6_17_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_启用操作员券源限额设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_17_Info();
                tdsecuL_6_17_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_18_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_18_Response()
        {
            this.tdsecuL_6_18_InfoList = new ObservableCollection<tdsecuL_6_18_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_18_Info> tdsecuL_6_18_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_18_Info info = new tdsecuL_6_18_Info();
            tdsecuL_6_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_18_InfoList.Add((tdsecuL_6_18_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_暂停操作员券源限额设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_18_Info();
                tdsecuL_6_18_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_19_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_19_Response()
        {
            this.tdsecuL_6_19_InfoList = new ObservableCollection<tdsecuL_6_19_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_19_Info> tdsecuL_6_19_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_19_Info info = new tdsecuL_6_19_Info();
            tdsecuL_6_19_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_19_InfoList.Add((tdsecuL_6_19_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_停止操作员券源限额设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_19_Info();
                tdsecuL_6_19_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_20_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_20_Response()
        {
            this.tdsecuL_6_20_InfoList = new ObservableCollection<tdsecuL_6_20_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_20_Info> tdsecuL_6_20_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_20_Info info = new tdsecuL_6_20_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.config_no = unpacker.GetInt64("config_no");
            info.config_value = unpacker.GetStr("config_value");
            info.config_name = unpacker.GetStr("config_name");
            info.config_memo = unpacker.GetStr("config_memo");
            tdsecuL_6_20_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_20_InfoList.Add((tdsecuL_6_20_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_操作员参数设置查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_20_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.config_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64);
                    info.config_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR);
                    info.config_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR);
                    info.config_memo = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_MEMO_STR);
                    tdsecuL_6_20_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_21_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_21_Response()
        {
            this.tdsecuL_6_21_InfoList = new ObservableCollection<tdsecuL_6_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_21_Info> tdsecuL_6_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_21_Info info = new tdsecuL_6_21_Info();
            tdsecuL_6_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_21_InfoList.Add((tdsecuL_6_21_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_操作员参数设置更新
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_21_Info();
                tdsecuL_6_21_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_22_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_22_Response()
        {
            this.tdsecuL_6_22_InfoList = new ObservableCollection<tdsecuL_6_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_22_Info> tdsecuL_6_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_22_Info info = new tdsecuL_6_22_Info();
            tdsecuL_6_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_22_InfoList.Add((tdsecuL_6_22_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_删除操作员参数设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_22_Info();
                tdsecuL_6_22_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_23_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_23_Response()
        {
            this.tdsecuL_6_23_InfoList = new ObservableCollection<tdsecuL_6_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_23_Info> tdsecuL_6_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_23_Info info = new tdsecuL_6_23_Info();
            tdsecuL_6_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_23_InfoList.Add((tdsecuL_6_23_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_操作员券源限额设置批量更新
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_23_Info();
                tdsecuL_6_23_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_90_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_90_Response()
        {
            this.tdsecuL_6_90_InfoList = new ObservableCollection<tdsecuL_6_90_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_90_Info> tdsecuL_6_90_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_90_Info info = new tdsecuL_6_90_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            tdsecuL_6_90_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_90_InfoList.Add((tdsecuL_6_90_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_操作员阈值信息计算更新
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_90_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                tdsecuL_6_90_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_92_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_92_Response()
        {
            this.tdsecuL_6_92_InfoList = new ObservableCollection<tdsecuL_6_92_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_92_Info> tdsecuL_6_92_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_92_Info info = new tdsecuL_6_92_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            tdsecuL_6_92_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_92_InfoList.Add((tdsecuL_6_92_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_操作员阈值汇总信息计算更新
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_92_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                tdsecuL_6_92_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_93_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_93_Response()
        {
            this.tdsecuL_6_93_InfoList = new ObservableCollection<tdsecuL_6_93_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_93_Info> tdsecuL_6_93_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_93_Info info = new tdsecuL_6_93_Info();
            tdsecuL_6_93_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_93_InfoList.Add((tdsecuL_6_93_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_操作员阈值设置调整资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_93_Info();
                tdsecuL_6_93_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_94_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_94_Response()
        {
            this.tdsecuL_6_94_InfoList = new ObservableCollection<tdsecuL_6_94_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_94_Info> tdsecuL_6_94_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_94_Info info = new tdsecuL_6_94_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_no = unpacker.GetInt("opor_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.open_posi_time = unpacker.GetInt("open_posi_time");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            tdsecuL_6_94_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_94_InfoList.Add((tdsecuL_6_94_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_隔夜仓查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_94_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    tdsecuL_6_94_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_95_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_95_Response()
        {
            this.tdsecuL_6_95_InfoList = new ObservableCollection<tdsecuL_6_95_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_95_Info> tdsecuL_6_95_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_95_Info info = new tdsecuL_6_95_Info();
            tdsecuL_6_95_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_95_InfoList.Add((tdsecuL_6_95_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_持仓明细作废
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_95_Info();
                tdsecuL_6_95_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_96_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_96_Response()
        {
            this.tdsecuL_6_96_InfoList = new ObservableCollection<tdsecuL_6_96_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_96_Info> tdsecuL_6_96_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_96_Info info = new tdsecuL_6_96_Info();
            tdsecuL_6_96_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_96_InfoList.Add((tdsecuL_6_96_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_设置开平仓权限
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_96_Info();
                tdsecuL_6_96_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_97_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_97_Response()
        {
            this.tdsecuL_6_97_InfoList = new ObservableCollection<tdsecuL_6_97_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_97_Info> tdsecuL_6_97_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_97_Info info = new tdsecuL_6_97_Info();
            tdsecuL_6_97_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_97_InfoList.Add((tdsecuL_6_97_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_券源划转
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_97_Info();
                tdsecuL_6_97_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_98_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_98_Response()
        {
            this.tdsecuL_6_98_InfoList = new ObservableCollection<tdsecuL_6_98_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_98_Info> tdsecuL_6_98_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_98_Info info = new tdsecuL_6_98_Info();
            tdsecuL_6_98_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_98_InfoList.Add((tdsecuL_6_98_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_根据成交表处理持仓明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_98_Info();
                tdsecuL_6_98_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_99_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_99_Response()
        {
            this.tdsecuL_6_99_InfoList = new ObservableCollection<tdsecuL_6_99_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_99_Info> tdsecuL_6_99_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_99_Info info = new tdsecuL_6_99_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.busi_opor_no = unpacker.GetInt("busi_opor_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.source_stock_occur_qty = unpacker.GetDouble("source_stock_occur_qty");
            info.source_stock_occur_end_qty = unpacker.GetDouble("source_stock_occur_end_qty");
            info.single_limit_occur_qty = unpacker.GetDouble("single_limit_occur_qty");
            info.single_limit_occur_end_qty = unpacker.GetDouble("single_limit_occur_end_qty");
            info.assigned_occur_qty = unpacker.GetDouble("assigned_occur_qty");
            info.assigned_occur_end_qty = unpacker.GetDouble("assigned_occur_end_qty");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            tdsecuL_6_99_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_99_InfoList.Add((tdsecuL_6_99_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_查询操作员券源限额设置流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_99_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.busi_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.source_stock_occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_OCCUR_QTY_FLOAT);
                    info.source_stock_occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_OCCUR_END_QTY_FLOAT);
                    info.single_limit_occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_OCCUR_QTY_FLOAT);
                    info.single_limit_occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_OCCUR_END_QTY_FLOAT);
                    info.assigned_occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_OCCUR_QTY_FLOAT);
                    info.assigned_occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_OCCUR_END_QTY_FLOAT);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    tdsecuL_6_99_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_102_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_102_Response()
        {
            this.tdsecuL_6_102_InfoList = new ObservableCollection<tdsecuL_6_102_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_102_Info> tdsecuL_6_102_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_102_Info info = new tdsecuL_6_102_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_date = unpacker.GetInt("update_date");
            info.update_time = unpacker.GetInt("update_time");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_menu_no = unpacker.GetInt("oper_menu_no");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.busi_opor_no = unpacker.GetInt("busi_opor_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.source_stock_occur_qty = unpacker.GetDouble("source_stock_occur_qty");
            info.source_stock_occur_end_qty = unpacker.GetDouble("source_stock_occur_end_qty");
            info.single_limit_occur_qty = unpacker.GetDouble("single_limit_occur_qty");
            info.single_limit_occur_end_qty = unpacker.GetDouble("single_limit_occur_end_qty");
            info.assigned_occur_qty = unpacker.GetDouble("assigned_occur_qty");
            info.assigned_occur_end_qty = unpacker.GetDouble("assigned_occur_end_qty");
            info.oper_remark_info = unpacker.GetStr("oper_remark_info");
            tdsecuL_6_102_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_102_InfoList.Add((tdsecuL_6_102_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_查询操作员券源限额设置流水历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_102_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    info.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.busi_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.source_stock_occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_OCCUR_QTY_FLOAT);
                    info.source_stock_occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_OCCUR_END_QTY_FLOAT);
                    info.single_limit_occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_OCCUR_QTY_FLOAT);
                    info.single_limit_occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_OCCUR_END_QTY_FLOAT);
                    info.assigned_occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_OCCUR_QTY_FLOAT);
                    info.assigned_occur_end_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_OCCUR_END_QTY_FLOAT);
                    info.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    tdsecuL_6_102_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_30_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_30_Response()
        {
            this.tdsecuL_6_30_InfoList = new ObservableCollection<tdsecuL_6_30_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_30_Info> tdsecuL_6_30_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_30_Info info = new tdsecuL_6_30_Info();
            tdsecuL_6_30_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_30_InfoList.Add((tdsecuL_6_30_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_持仓反向平仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_30_Info();
                tdsecuL_6_30_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_31_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_31_Response()
        {
            this.tdsecuL_6_31_InfoList = new ObservableCollection<tdsecuL_6_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_31_Info> tdsecuL_6_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_31_Info info = new tdsecuL_6_31_Info();
            tdsecuL_6_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_31_InfoList.Add((tdsecuL_6_31_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_新增操作员可用交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_31_Info();
                tdsecuL_6_31_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_32_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_32_Response()
        {
            this.tdsecuL_6_32_InfoList = new ObservableCollection<tdsecuL_6_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_32_Info> tdsecuL_6_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_32_Info info = new tdsecuL_6_32_Info();
            tdsecuL_6_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_32_InfoList.Add((tdsecuL_6_32_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_删除操作员可用交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_32_Info();
                tdsecuL_6_32_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_33_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_33_Response()
        {
            this.tdsecuL_6_33_InfoList = new ObservableCollection<tdsecuL_6_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_33_Info> tdsecuL_6_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_33_Info info = new tdsecuL_6_33_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.frozen_amt = unpacker.GetDouble("frozen_amt");
            info.unfroz_amt = unpacker.GetDouble("unfroz_amt");
            info.comm_frozen_amt = unpacker.GetDouble("comm_frozen_amt");
            info.comm_unfroz_amt = unpacker.GetDouble("comm_unfroz_amt");
            info.comm_capt_amt = unpacker.GetDouble("comm_capt_amt");
            info.comm_releas_amt = unpacker.GetDouble("comm_releas_amt");
            info.trade_frozen_amt = unpacker.GetDouble("trade_frozen_amt");
            info.trade_unfroz_amt = unpacker.GetDouble("trade_unfroz_amt");
            info.trade_capt_amt = unpacker.GetDouble("trade_capt_amt");
            info.trade_releas_amt = unpacker.GetDouble("trade_releas_amt");
            info.strike_capt_amt = unpacker.GetDouble("strike_capt_amt");
            info.strike_releas_amt = unpacker.GetDouble("strike_releas_amt");
            info.avail_amt = unpacker.GetDouble("avail_amt");
            tdsecuL_6_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_33_InfoList.Add((tdsecuL_6_33_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_查询操作员可用交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_33_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    info.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    info.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    info.comm_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_AMT_FLOAT);
                    info.comm_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_AMT_FLOAT);
                    info.comm_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_AMT_FLOAT);
                    info.trade_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_AMT_FLOAT);
                    info.trade_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_AMT_FLOAT);
                    info.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    info.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    info.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    info.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    info.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    tdsecuL_6_33_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_34_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_34_Response()
        {
            this.tdsecuL_6_34_InfoList = new ObservableCollection<tdsecuL_6_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_34_Info> tdsecuL_6_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_34_Info info = new tdsecuL_6_34_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.busi_opor_no = unpacker.GetInt("busi_opor_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.open_posi_time = unpacker.GetInt("open_posi_time");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.waste_qty = unpacker.GetDouble("waste_qty");
            info.waste_date = unpacker.GetInt("waste_date");
            info.waste_time = unpacker.GetInt("waste_time");
            info.detail_posi_id = unpacker.GetInt64("detail_posi_id");
            tdsecuL_6_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_34_InfoList.Add((tdsecuL_6_34_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_查询持仓作废流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_34_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.busi_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.waste_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_QTY_FLOAT);
                    info.waste_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_DATE_INT);
                    info.waste_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_TIME_INT);
                    info.detail_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DETAIL_POSI_ID_INT64);
                    tdsecuL_6_34_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_35_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_35_Response()
        {
            this.tdsecuL_6_35_InfoList = new ObservableCollection<tdsecuL_6_35_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_35_Info> tdsecuL_6_35_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_35_Info info = new tdsecuL_6_35_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.busi_opor_no = unpacker.GetInt("busi_opor_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.open_posi_time = unpacker.GetInt("open_posi_time");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.waste_qty = unpacker.GetDouble("waste_qty");
            info.waste_date = unpacker.GetInt("waste_date");
            info.waste_time = unpacker.GetInt("waste_time");
            info.detail_posi_id = unpacker.GetInt64("detail_posi_id");
            tdsecuL_6_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_35_InfoList.Add((tdsecuL_6_35_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_查询历史持仓作废流水
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_35_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.busi_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.waste_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_QTY_FLOAT);
                    info.waste_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_DATE_INT);
                    info.waste_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_TIME_INT);
                    info.detail_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DETAIL_POSI_ID_INT64);
                    tdsecuL_6_35_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_36_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_36_Response()
        {
            this.tdsecuL_6_36_InfoList = new ObservableCollection<tdsecuL_6_36_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_36_Info> tdsecuL_6_36_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_36_Info info = new tdsecuL_6_36_Info();
            tdsecuL_6_36_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_36_InfoList.Add((tdsecuL_6_36_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_设置操作员持仓市值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_36_Info();
                tdsecuL_6_36_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_37_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_37_Response()
        {
            this.tdsecuL_6_37_InfoList = new ObservableCollection<tdsecuL_6_37_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_37_Info> tdsecuL_6_37_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_37_Info info = new tdsecuL_6_37_Info();
            tdsecuL_6_37_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_37_InfoList.Add((tdsecuL_6_37_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_删除操作员持仓市值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_37_Info();
                tdsecuL_6_37_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_38_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_38_Response()
        {
            this.tdsecuL_6_38_InfoList = new ObservableCollection<tdsecuL_6_38_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_38_Info> tdsecuL_6_38_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_38_Info info = new tdsecuL_6_38_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.max_posi_market_value = unpacker.GetDouble("max_posi_market_value");
            info.remark_info = unpacker.GetStr("remark_info");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_6_38_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_38_InfoList.Add((tdsecuL_6_38_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_查询操作员持仓市值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_38_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.max_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_POSI_MARKET_VALUE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_6_38_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_110_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_110_Response()
        {
            this.tdsecuL_6_110_InfoList = new ObservableCollection<tdsecuL_6_110_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_110_Info> tdsecuL_6_110_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_110_Info info = new tdsecuL_6_110_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.source_stock_qty = unpacker.GetDouble("source_stock_qty");
            info.single_limit_qty = unpacker.GetDouble("single_limit_qty");
            info.assigned_qty = unpacker.GetDouble("assigned_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.total_open_posi_fee = unpacker.GetDouble("total_open_posi_fee");
            info.total_close_posi_fee = unpacker.GetDouble("total_close_posi_fee");
            info.out_order_releas_qty = unpacker.GetDouble("out_order_releas_qty");
            info.out_order_capt_qty = unpacker.GetDouble("out_order_capt_qty");
            info.out_strike_releas_qty = unpacker.GetDouble("out_strike_releas_qty");
            info.out_strike_capt_qty = unpacker.GetDouble("out_strike_capt_qty");
            info.remark_info = unpacker.GetStr("remark_info");
            info.buy_avail_qty = unpacker.GetDouble("buy_avail_qty");
            info.sell_avail_qty = unpacker.GetDouble("sell_avail_qty");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.today_trade_fee = unpacker.GetDouble("today_trade_fee");
            info.today_pandl = unpacker.GetDouble("today_pandl");
            info.diff_qty = unpacker.GetDouble("diff_qty");
            info.over_night_trade_buy_qty = unpacker.GetDouble("over_night_trade_buy_qty");
            info.over_night_trade_sell_qty = unpacker.GetDouble("over_night_trade_sell_qty");
            info.over_night_strike_sell_qty = unpacker.GetDouble("over_night_strike_sell_qty");
            info.over_night_sumtrd_sell_qty = unpacker.GetDouble("over_night_sumtrd_sell_qty");
            info.over_night_sumstk_sell_qty = unpacker.GetDouble("over_night_sumstk_sell_qty");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_6_110_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_110_InfoList.Add((tdsecuL_6_110_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_根据操作员查询券源持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_110_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.source_stock_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_QTY_FLOAT);
                    info.single_limit_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SINGLE_LIMIT_QTY_FLOAT);
                    info.assigned_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGNED_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.total_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_OPEN_POSI_FEE_FLOAT);
                    info.total_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CLOSE_POSI_FEE_FLOAT);
                    info.out_order_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_RELEAS_QTY_FLOAT);
                    info.out_order_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ORDER_CAPT_QTY_FLOAT);
                    info.out_strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_RELEAS_QTY_FLOAT);
                    info.out_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_STRIKE_CAPT_QTY_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.buy_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AVAIL_QTY_FLOAT);
                    info.sell_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AVAIL_QTY_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.today_trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_TRADE_FEE_FLOAT);
                    info.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    info.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    info.over_night_trade_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_TRADE_BUY_QTY_FLOAT);
                    info.over_night_trade_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_TRADE_SELL_QTY_FLOAT);
                    info.over_night_strike_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_STRIKE_SELL_QTY_FLOAT);
                    info.over_night_sumtrd_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_SUMTRD_SELL_QTY_FLOAT);
                    info.over_night_sumstk_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_SUMSTK_SELL_QTY_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_6_110_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_113_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_113_Response()
        {
            this.tdsecuL_6_113_InfoList = new ObservableCollection<tdsecuL_6_113_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_113_Info> tdsecuL_6_113_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_113_Info info = new tdsecuL_6_113_Info();
            info.trade_amt = unpacker.GetDouble("trade_amt");
            info.trade_qty = unpacker.GetDouble("trade_qty");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.yield_rate = unpacker.GetDouble("yield_rate");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.avail_amt = unpacker.GetDouble("avail_amt");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_6_113_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_113_InfoList.Add((tdsecuL_6_113_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_根据操作员查询账户汇总信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_113_Info();
                info.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                info.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                info.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                info.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                tdsecuL_6_113_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_112_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_112_Response()
        {
            this.tdsecuL_6_112_InfoList = new ObservableCollection<tdsecuL_6_112_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_112_Info> tdsecuL_6_112_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_112_Info info = new tdsecuL_6_112_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.frozen_amt = unpacker.GetDouble("frozen_amt");
            info.unfroz_amt = unpacker.GetDouble("unfroz_amt");
            info.comm_frozen_amt = unpacker.GetDouble("comm_frozen_amt");
            info.comm_unfroz_amt = unpacker.GetDouble("comm_unfroz_amt");
            info.comm_capt_amt = unpacker.GetDouble("comm_capt_amt");
            info.comm_releas_amt = unpacker.GetDouble("comm_releas_amt");
            info.trade_frozen_amt = unpacker.GetDouble("trade_frozen_amt");
            info.trade_unfroz_amt = unpacker.GetDouble("trade_unfroz_amt");
            info.trade_capt_amt = unpacker.GetDouble("trade_capt_amt");
            info.trade_releas_amt = unpacker.GetDouble("trade_releas_amt");
            info.strike_capt_amt = unpacker.GetDouble("strike_capt_amt");
            info.strike_releas_amt = unpacker.GetDouble("strike_releas_amt");
            info.avail_amt = unpacker.GetDouble("avail_amt");
            tdsecuL_6_112_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_112_InfoList.Add((tdsecuL_6_112_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_根据操作员查询操作员可用交易组资金
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_112_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    info.unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_AMT_FLOAT);
                    info.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    info.comm_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_AMT_FLOAT);
                    info.comm_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_AMT_FLOAT);
                    info.comm_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_AMT_FLOAT);
                    info.trade_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_AMT_FLOAT);
                    info.trade_unfroz_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_AMT_FLOAT);
                    info.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    info.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    info.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    info.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    info.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    tdsecuL_6_112_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_114_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_114_Response()
        {
            this.tdsecuL_6_114_InfoList = new ObservableCollection<tdsecuL_6_114_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_114_Info> tdsecuL_6_114_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_114_Info info = new tdsecuL_6_114_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.frozen_amt = unpacker.GetDouble("frozen_amt");
            info.opor_warn_tshold = unpacker.GetDouble("opor_warn_tshold");
            info.opor_stop_tshold = unpacker.GetDouble("opor_stop_tshold");
            info.order_limit_time = unpacker.GetInt("order_limit_time");
            info.per_secu_posi_ratio = unpacker.GetDouble("per_secu_posi_ratio");
            info.posi_limit_time = unpacker.GetInt("posi_limit_time");
            info.order_ctrl_qty = unpacker.GetDouble("order_ctrl_qty");
            info.order_ctrl_amt = unpacker.GetDouble("order_ctrl_amt");
            info.stock_warn_ratio = unpacker.GetDouble("stock_warn_ratio");
            info.stock_stop_ratio = unpacker.GetDouble("stock_stop_ratio");
            info.stock_warn_amt = unpacker.GetDouble("stock_warn_amt");
            info.stock_stop_amt = unpacker.GetDouble("stock_stop_amt");
            info.trig_oper_type = unpacker.GetInt("trig_oper_type");
            info.open_close_permission = unpacker.GetInt("open_close_permission");
            info.risk_oper = unpacker.GetInt("risk_oper");
            info.fee_calc_type = unpacker.GetInt("fee_calc_type");
            info.permit_margin_trade = unpacker.GetInt("permit_margin_trade");
            info.buy_fee_ratio = unpacker.GetDouble("buy_fee_ratio");
            info.sell_fee_ratio = unpacker.GetDouble("sell_fee_ratio");
            info.buy_min_fee = unpacker.GetDouble("buy_min_fee");
            info.sell_min_fee = unpacker.GetDouble("sell_min_fee");
            info.trade_capt_amt = unpacker.GetDouble("trade_capt_amt");
            info.trade_releas_amt = unpacker.GetDouble("trade_releas_amt");
            info.strike_capt_amt = unpacker.GetDouble("strike_capt_amt");
            info.strike_releas_amt = unpacker.GetDouble("strike_releas_amt");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.amt_diff = unpacker.GetDouble("amt_diff");
            info.remark_info = unpacker.GetStr("remark_info");
            info.update_times = unpacker.GetInt("update_times");
            info.avail_amt = unpacker.GetDouble("avail_amt");
            tdsecuL_6_114_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_114_InfoList.Add((tdsecuL_6_114_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_根据操作员查询操作员阈值设置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_6_114_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                    info.frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_AMT_FLOAT);
                    info.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    info.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    info.order_limit_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_LIMIT_TIME_INT);
                    info.per_secu_posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PER_SECU_POSI_RATIO_FLOAT);
                    info.posi_limit_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_TIME_INT);
                    info.order_ctrl_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CTRL_QTY_FLOAT);
                    info.order_ctrl_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CTRL_AMT_FLOAT);
                    info.stock_warn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT);
                    info.stock_stop_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT);
                    info.stock_warn_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT);
                    info.stock_stop_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT);
                    info.trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_OPER_TYPE_INT);
                    info.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    info.risk_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_OPER_INT);
                    info.fee_calc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FEE_CALC_TYPE_INT);
                    info.permit_margin_trade = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PERMIT_MARGIN_TRADE_INT);
                    info.buy_fee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_FEE_RATIO_FLOAT);
                    info.sell_fee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_FEE_RATIO_FLOAT);
                    info.buy_min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_MIN_FEE_FLOAT);
                    info.sell_min_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_MIN_FEE_FLOAT);
                    info.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                    info.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                    info.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                    info.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_DIFF_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    tdsecuL_6_114_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_6_115_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_115_Response()
        {
            this.tdsecuL_6_115_InfoList = new ObservableCollection<tdsecuL_6_115_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_115_Info> tdsecuL_6_115_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_115_Info info = new tdsecuL_6_115_Info();
            tdsecuL_6_115_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_115_InfoList.Add((tdsecuL_6_115_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_操作员阈值累计盈亏更新
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_115_Info();
                tdsecuL_6_115_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_6_116_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_6_116_Response()
        {
            this.tdsecuL_6_116_InfoList = new ObservableCollection<tdsecuL_6_116_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_6_116_Info> tdsecuL_6_116_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_6_116_Info info = new tdsecuL_6_116_Info();
            tdsecuL_6_116_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_6_116_InfoList.Add((tdsecuL_6_116_Info)info);
        }
        #endregion

        //逻辑_交易证券_T0_修改操作员券源T0买入方式
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_6_116_Info();
                tdsecuL_6_116_InfoList.Add(info);
            }
        }
    }

}
