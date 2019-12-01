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
    public class rptL_4_1_Response : IResponse
    {
        #region 构造函数
        public rptL_4_1_Response()
        {
            this.rptL_4_1_InfoList = new ObservableCollection<rptL_4_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_1_Info> rptL_4_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_1_Info info = new rptL_4_1_Info();
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
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            rptL_4_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_1_InfoList.Add((rptL_4_1_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_T+0持仓盈亏查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_1_Info();
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
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    rptL_4_1_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_2_Response : IResponse
    {
        #region 构造函数
        public rptL_4_2_Response()
        {
            this.rptL_4_2_InfoList = new ObservableCollection<rptL_4_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_2_Info> rptL_4_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_2_Info info = new rptL_4_2_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.source_stock_qty = unpacker.GetDouble("source_stock_qty");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.yield_rate = unpacker.GetDouble("yield_rate");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.total_long_curr_qty = unpacker.GetDouble("total_long_curr_qty");
            info.total_short_curr_qty = unpacker.GetDouble("total_short_curr_qty");
            info.total_long_open_posi_value = unpacker.GetDouble("total_long_open_posi_value");
            info.total_short_open_posi_value = unpacker.GetDouble("total_short_open_posi_value");
            info.total_long_open_posi_fee = unpacker.GetDouble("total_long_open_posi_fee");
            info.total_short_open_posi_fee = unpacker.GetDouble("total_short_open_posi_fee");
            info.total_long_close_posi_value = unpacker.GetDouble("total_long_close_posi_value");
            info.total_short_close_posi_value = unpacker.GetDouble("total_short_close_posi_value");
            info.total_long_close_posi_qty = unpacker.GetDouble("total_long_close_posi_qty");
            info.total_short_close_posi_qty = unpacker.GetDouble("total_short_close_posi_qty");
            info.total_long_close_posi_fee = unpacker.GetDouble("total_long_close_posi_fee");
            info.total_short_close_posi_fee = unpacker.GetDouble("total_short_close_posi_fee");
            info.total_realize_pandl = unpacker.GetDouble("total_realize_pandl");
            info.long_curr_qty = unpacker.GetDouble("long_curr_qty");
            info.short_curr_qty = unpacker.GetDouble("short_curr_qty");
            info.long_open_posi_value = unpacker.GetDouble("long_open_posi_value");
            info.short_open_posi_value = unpacker.GetDouble("short_open_posi_value");
            info.long_open_posi_fee = unpacker.GetDouble("long_open_posi_fee");
            info.short_open_posi_fee = unpacker.GetDouble("short_open_posi_fee");
            info.long_close_posi_qty = unpacker.GetDouble("long_close_posi_qty");
            info.short_close_posi_qty = unpacker.GetDouble("short_close_posi_qty");
            info.long_close_posi_value = unpacker.GetDouble("long_close_posi_value");
            info.short_close_posi_value = unpacker.GetDouble("short_close_posi_value");
            info.long_close_posi_fee = unpacker.GetDouble("long_close_posi_fee");
            info.short_close_posi_fee = unpacker.GetDouble("short_close_posi_fee");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            rptL_4_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_2_InfoList.Add((rptL_4_2_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_T+0券源持仓报表查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_2_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.source_stock_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_QTY_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.total_long_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CURR_QTY_FLOAT);
                    info.total_short_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CURR_QTY_FLOAT);
                    info.total_long_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_OPEN_POSI_VALUE_FLOAT);
                    info.total_short_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_OPEN_POSI_VALUE_FLOAT);
                    info.total_long_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_OPEN_POSI_FEE_FLOAT);
                    info.total_short_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_OPEN_POSI_FEE_FLOAT);
                    info.total_long_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CLOSE_POSI_VALUE_FLOAT);
                    info.total_short_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CLOSE_POSI_VALUE_FLOAT);
                    info.total_long_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CLOSE_POSI_QTY_FLOAT);
                    info.total_short_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CLOSE_POSI_QTY_FLOAT);
                    info.total_long_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CLOSE_POSI_FEE_FLOAT);
                    info.total_short_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CLOSE_POSI_FEE_FLOAT);
                    info.total_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZE_PANDL_FLOAT);
                    info.long_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CURR_QTY_FLOAT);
                    info.short_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CURR_QTY_FLOAT);
                    info.long_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_OPEN_POSI_VALUE_FLOAT);
                    info.short_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_OPEN_POSI_VALUE_FLOAT);
                    info.long_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_OPEN_POSI_FEE_FLOAT);
                    info.short_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_OPEN_POSI_FEE_FLOAT);
                    info.long_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CLOSE_POSI_QTY_FLOAT);
                    info.short_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CLOSE_POSI_QTY_FLOAT);
                    info.long_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CLOSE_POSI_VALUE_FLOAT);
                    info.short_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CLOSE_POSI_VALUE_FLOAT);
                    info.long_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CLOSE_POSI_FEE_FLOAT);
                    info.short_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CLOSE_POSI_FEE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    rptL_4_2_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_3_Response : IResponse
    {
        #region 构造函数
        public rptL_4_3_Response()
        {
            this.rptL_4_3_InfoList = new ObservableCollection<rptL_4_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_3_Info> rptL_4_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_3_Info info = new rptL_4_3_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.trade_amt = unpacker.GetDouble("trade_amt");
            info.today_pandl = unpacker.GetDouble("today_pandl");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.yield_rate = unpacker.GetDouble("yield_rate");
            rptL_4_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_3_InfoList.Add((rptL_4_3_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_T+0账户交易汇总查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_3_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    info.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    rptL_4_3_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_4_Response : IResponse
    {
        #region 构造函数
        public rptL_4_4_Response()
        {
            this.rptL_4_4_InfoList = new ObservableCollection<rptL_4_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_4_Info> rptL_4_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_4_Info info = new rptL_4_4_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.trade_qty = unpacker.GetDouble("trade_qty");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.yield_rate = unpacker.GetDouble("yield_rate");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            info.trade_amt = unpacker.GetDouble("trade_amt");
            rptL_4_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_4_InfoList.Add((rptL_4_4_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_T+0持仓盈亏历史查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    info.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    rptL_4_4_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_5_Response : IResponse
    {
        #region 构造函数
        public rptL_4_5_Response()
        {
            this.rptL_4_5_InfoList = new ObservableCollection<rptL_4_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_5_Info> rptL_4_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_5_Info info = new rptL_4_5_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.source_stock_qty = unpacker.GetDouble("source_stock_qty");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.yield_rate = unpacker.GetDouble("yield_rate");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.total_long_curr_qty = unpacker.GetDouble("total_long_curr_qty");
            info.total_short_curr_qty = unpacker.GetDouble("total_short_curr_qty");
            info.total_long_open_posi_value = unpacker.GetDouble("total_long_open_posi_value");
            info.total_short_open_posi_value = unpacker.GetDouble("total_short_open_posi_value");
            info.total_long_open_posi_fee = unpacker.GetDouble("total_long_open_posi_fee");
            info.total_short_open_posi_fee = unpacker.GetDouble("total_short_open_posi_fee");
            info.total_long_close_posi_value = unpacker.GetDouble("total_long_close_posi_value");
            info.total_short_close_posi_value = unpacker.GetDouble("total_short_close_posi_value");
            info.total_long_close_posi_qty = unpacker.GetDouble("total_long_close_posi_qty");
            info.total_short_close_posi_qty = unpacker.GetDouble("total_short_close_posi_qty");
            info.total_long_close_posi_fee = unpacker.GetDouble("total_long_close_posi_fee");
            info.total_short_close_posi_fee = unpacker.GetDouble("total_short_close_posi_fee");
            info.total_realize_pandl = unpacker.GetDouble("total_realize_pandl");
            info.long_curr_qty = unpacker.GetDouble("long_curr_qty");
            info.short_curr_qty = unpacker.GetDouble("short_curr_qty");
            info.long_open_posi_value = unpacker.GetDouble("long_open_posi_value");
            info.short_open_posi_value = unpacker.GetDouble("short_open_posi_value");
            info.long_open_posi_fee = unpacker.GetDouble("long_open_posi_fee");
            info.short_open_posi_fee = unpacker.GetDouble("short_open_posi_fee");
            info.long_close_posi_qty = unpacker.GetDouble("long_close_posi_qty");
            info.short_close_posi_qty = unpacker.GetDouble("short_close_posi_qty");
            info.long_close_posi_value = unpacker.GetDouble("long_close_posi_value");
            info.short_close_posi_value = unpacker.GetDouble("short_close_posi_value");
            info.long_close_posi_fee = unpacker.GetDouble("long_close_posi_fee");
            info.short_close_posi_fee = unpacker.GetDouble("short_close_posi_fee");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            rptL_4_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_5_InfoList.Add((rptL_4_5_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_T+0券源持仓报表历史查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_5_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.source_stock_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SOURCE_STOCK_QTY_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.total_long_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CURR_QTY_FLOAT);
                    info.total_short_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CURR_QTY_FLOAT);
                    info.total_long_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_OPEN_POSI_VALUE_FLOAT);
                    info.total_short_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_OPEN_POSI_VALUE_FLOAT);
                    info.total_long_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_OPEN_POSI_FEE_FLOAT);
                    info.total_short_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_OPEN_POSI_FEE_FLOAT);
                    info.total_long_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CLOSE_POSI_VALUE_FLOAT);
                    info.total_short_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CLOSE_POSI_VALUE_FLOAT);
                    info.total_long_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CLOSE_POSI_QTY_FLOAT);
                    info.total_short_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CLOSE_POSI_QTY_FLOAT);
                    info.total_long_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LONG_CLOSE_POSI_FEE_FLOAT);
                    info.total_short_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_SHORT_CLOSE_POSI_FEE_FLOAT);
                    info.total_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZE_PANDL_FLOAT);
                    info.long_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CURR_QTY_FLOAT);
                    info.short_curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CURR_QTY_FLOAT);
                    info.long_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_OPEN_POSI_VALUE_FLOAT);
                    info.short_open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_OPEN_POSI_VALUE_FLOAT);
                    info.long_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_OPEN_POSI_FEE_FLOAT);
                    info.short_open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_OPEN_POSI_FEE_FLOAT);
                    info.long_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CLOSE_POSI_QTY_FLOAT);
                    info.short_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CLOSE_POSI_QTY_FLOAT);
                    info.long_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CLOSE_POSI_VALUE_FLOAT);
                    info.short_close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CLOSE_POSI_VALUE_FLOAT);
                    info.long_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LONG_CLOSE_POSI_FEE_FLOAT);
                    info.short_close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SHORT_CLOSE_POSI_FEE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    rptL_4_5_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_6_Response : IResponse
    {
        #region 构造函数
        public rptL_4_6_Response()
        {
            this.rptL_4_6_InfoList = new ObservableCollection<rptL_4_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_6_Info> rptL_4_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_6_Info info = new rptL_4_6_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.trade_amt = unpacker.GetDouble("trade_amt");
            info.today_pandl = unpacker.GetDouble("today_pandl");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.yield_rate = unpacker.GetDouble("yield_rate");
            rptL_4_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_6_InfoList.Add((rptL_4_6_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_T+0账户交易汇总历史查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_6_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    info.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    rptL_4_6_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_7_Response : IResponse
    {
        #region 构造函数
        public rptL_4_7_Response()
        {
            this.rptL_4_7_InfoList = new ObservableCollection<rptL_4_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_7_Info> rptL_4_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_7_Info info = new rptL_4_7_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.today_buy_qty = unpacker.GetDouble("today_buy_qty");
            info.today_sell_qty = unpacker.GetDouble("today_sell_qty");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.today_close_price = unpacker.GetDouble("today_close_price");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            rptL_4_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_7_InfoList.Add((rptL_4_7_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_报表产品持仓汇总查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_7_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.today_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_QTY_FLOAT);
                    info.today_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_QTY_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    rptL_4_7_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_8_Response : IResponse
    {
        #region 构造函数
        public rptL_4_8_Response()
        {
            this.rptL_4_8_InfoList = new ObservableCollection<rptL_4_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_8_Info> rptL_4_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_8_Info info = new rptL_4_8_Info();
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.today_buy_qty = unpacker.GetDouble("today_buy_qty");
            info.today_sell_qty = unpacker.GetDouble("today_sell_qty");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.today_close_price = unpacker.GetDouble("today_close_price");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.posi_nav_ratio = unpacker.GetDouble("posi_nav_ratio");
            rptL_4_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_8_InfoList.Add((rptL_4_8_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_报表机构持仓汇总查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_8_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.today_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_QTY_FLOAT);
                    info.today_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_QTY_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    rptL_4_8_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_9_Response : IResponse
    {
        #region 构造函数
        public rptL_4_9_Response()
        {
            this.rptL_4_9_InfoList = new ObservableCollection<rptL_4_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_9_Info> rptL_4_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_9_Info info = new rptL_4_9_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.invest_type = unpacker.GetInt("invest_type");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.pre_holding_qty = unpacker.GetDouble("pre_holding_qty");
            info.today_buy_qty = unpacker.GetDouble("today_buy_qty");
            info.today_buy_amt = unpacker.GetDouble("today_buy_amt");
            info.today_buy_price = unpacker.GetDouble("today_buy_price");
            info.buy_begin_time = unpacker.GetInt("buy_begin_time");
            info.buy_end_time = unpacker.GetInt("buy_end_time");
            info.today_sell_qty = unpacker.GetDouble("today_sell_qty");
            info.today_sell_amt = unpacker.GetDouble("today_sell_amt");
            info.today_sell_price = unpacker.GetDouble("today_sell_price");
            info.sell_begin_time = unpacker.GetInt("sell_begin_time");
            info.sell_end_time = unpacker.GetInt("sell_end_time");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.today_close_price = unpacker.GetDouble("today_close_price");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            rptL_4_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_9_InfoList.Add((rptL_4_9_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_报表产品持仓交易汇总查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_9_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.pre_holding_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_HOLDING_QTY_FLOAT);
                    info.today_buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_QTY_FLOAT);
                    info.today_buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_AMT_FLOAT);
                    info.today_buy_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_BUY_PRICE_FLOAT);
                    info.buy_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_BEGIN_TIME_INT);
                    info.buy_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUY_END_TIME_INT);
                    info.today_sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_QTY_FLOAT);
                    info.today_sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_AMT_FLOAT);
                    info.today_sell_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_SELL_PRICE_FLOAT);
                    info.sell_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_BEGIN_TIME_INT);
                    info.sell_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_END_TIME_INT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    rptL_4_9_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_10_Response : IResponse
    {
        #region 构造函数
        public rptL_4_10_Response()
        {
            this.rptL_4_10_InfoList = new ObservableCollection<rptL_4_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_10_Info> rptL_4_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_10_Info info = new rptL_4_10_Info();
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.last_price = unpacker.GetDouble("last_price");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.float_pandl_ratio = unpacker.GetDouble("float_pandl_ratio");
            info.market_value_ratio = unpacker.GetDouble("market_value_ratio");
            info.nav_ratio = unpacker.GetDouble("nav_ratio");
            rptL_4_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_10_InfoList.Add((rptL_4_10_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_产品账户证券重仓股持仓查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_10_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.float_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_RATIO_FLOAT);
                    info.market_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_RATIO_FLOAT);
                    info.nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_RATIO_FLOAT);
                    rptL_4_10_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_11_Response : IResponse
    {
        #region 构造函数
        public rptL_4_11_Response()
        {
            this.rptL_4_11_InfoList = new ObservableCollection<rptL_4_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_11_Info> rptL_4_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_11_Info info = new rptL_4_11_Info();
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.last_price = unpacker.GetDouble("last_price");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.float_pandl_ratio = unpacker.GetDouble("float_pandl_ratio");
            info.market_value_ratio = unpacker.GetDouble("market_value_ratio");
            info.nav_ratio = unpacker.GetDouble("nav_ratio");
            rptL_4_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_11_InfoList.Add((rptL_4_11_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_交易单元证券重仓股持仓查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_11_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.float_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_RATIO_FLOAT);
                    info.market_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_VALUE_RATIO_FLOAT);
                    info.nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_RATIO_FLOAT);
                    rptL_4_11_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_12_Response : IResponse
    {
        #region 构造函数
        public rptL_4_12_Response()
        {
            this.rptL_4_12_InfoList = new ObservableCollection<rptL_4_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_12_Info> rptL_4_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_12_Info info = new rptL_4_12_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.invest_type = unpacker.GetInt("invest_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.comm_capt_qty = unpacker.GetDouble("comm_capt_qty");
            info.comm_releas_qty = unpacker.GetDouble("comm_releas_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.last_price = unpacker.GetDouble("last_price");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.pandl_ratio = unpacker.GetDouble("pandl_ratio");
            info.trade_avail_qty = unpacker.GetDouble("trade_avail_qty");
            info.comm_avail_qty = unpacker.GetDouble("comm_avail_qty");
            info.static_avail_qty = unpacker.GetDouble("static_avail_qty");
            info.posi_nav_ratio = unpacker.GetDouble("posi_nav_ratio");
            info.bond_receivable_amt = unpacker.GetDouble("bond_receivable_amt");
            info.full_holding_amt = unpacker.GetDouble("full_holding_amt");
            info.impawn_qty = unpacker.GetDouble("impawn_qty");
            rptL_4_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_12_InfoList.Add((rptL_4_12_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_证券持仓汇总查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_12_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    info.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    info.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                    info.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                    info.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                    info.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    info.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    info.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    info.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    rptL_4_12_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_13_Response : IResponse
    {
        #region 构造函数
        public rptL_4_13_Response()
        {
            this.rptL_4_13_InfoList = new ObservableCollection<rptL_4_13_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_13_Info> rptL_4_13_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_13_Info info = new rptL_4_13_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.invest_type = unpacker.GetInt("invest_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.comm_capt_qty = unpacker.GetDouble("comm_capt_qty");
            info.comm_releas_qty = unpacker.GetDouble("comm_releas_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.last_price = unpacker.GetDouble("last_price");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.pandl_ratio = unpacker.GetDouble("pandl_ratio");
            info.trade_avail_qty = unpacker.GetDouble("trade_avail_qty");
            info.comm_avail_qty = unpacker.GetDouble("comm_avail_qty");
            info.static_avail_qty = unpacker.GetDouble("static_avail_qty");
            info.posi_nav_ratio = unpacker.GetDouble("posi_nav_ratio");
            info.bond_receivable_amt = unpacker.GetDouble("bond_receivable_amt");
            info.full_holding_amt = unpacker.GetDouble("full_holding_amt");
            info.impawn_qty = unpacker.GetDouble("impawn_qty");
            rptL_4_13_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_13_InfoList.Add((rptL_4_13_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_历史证券持仓汇总查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_13_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    info.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    info.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                    info.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                    info.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                    info.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    info.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    info.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    info.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    rptL_4_13_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_14_Response : IResponse
    {
        #region 构造函数
        public rptL_4_14_Response()
        {
            this.rptL_4_14_InfoList = new ObservableCollection<rptL_4_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_14_Info> rptL_4_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_14_Info info = new rptL_4_14_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.trade_amt = unpacker.GetDouble("trade_amt");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.buy_qty = unpacker.GetDouble("buy_qty");
            info.buy_amt = unpacker.GetDouble("buy_amt");
            info.sell_qty = unpacker.GetDouble("sell_qty");
            info.sellout_amt = unpacker.GetDouble("sellout_amt");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.yield_rate = unpacker.GetDouble("yield_rate");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.trade_qty = unpacker.GetDouble("trade_qty");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            rptL_4_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_14_InfoList.Add((rptL_4_14_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_T+0账户盈亏报表查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_14_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_FLOAT);
                    info.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    info.sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_FLOAT);
                    info.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    rptL_4_14_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_15_Response : IResponse
    {
        #region 构造函数
        public rptL_4_15_Response()
        {
            this.rptL_4_15_InfoList = new ObservableCollection<rptL_4_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_15_Info> rptL_4_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_15_Info info = new rptL_4_15_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.today_pandl = unpacker.GetDouble("today_pandl");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.trade_amt = unpacker.GetDouble("trade_amt");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.buy_qty = unpacker.GetDouble("buy_qty");
            info.buy_amt = unpacker.GetDouble("buy_amt");
            info.sell_qty = unpacker.GetDouble("sell_qty");
            info.sellout_amt = unpacker.GetDouble("sellout_amt");
            rptL_4_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_15_InfoList.Add((rptL_4_15_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_T+0账户盈亏报表历史查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_15_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.buy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_FLOAT);
                    info.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    info.sell_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_FLOAT);
                    info.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    rptL_4_15_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_16_Response : IResponse
    {
        #region 构造函数
        public rptL_4_16_Response()
        {
            this.rptL_4_16_InfoList = new ObservableCollection<rptL_4_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_16_Info> rptL_4_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_16_Info info = new rptL_4_16_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.close_posi_fee = unpacker.GetDouble("close_posi_fee");
            info.un_close_posi_qty = unpacker.GetDouble("un_close_posi_qty");
            info.un_close_marke_value = unpacker.GetDouble("un_close_marke_value");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            rptL_4_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_16_InfoList.Add((rptL_4_16_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_T+0账户敞口报表查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_16_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    info.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    info.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    rptL_4_16_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_17_Response : IResponse
    {
        #region 构造函数
        public rptL_4_17_Response()
        {
            this.rptL_4_17_InfoList = new ObservableCollection<rptL_4_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_17_Info> rptL_4_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_17_Info info = new rptL_4_17_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.trade_qty = unpacker.GetDouble("trade_qty");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.yield_rate = unpacker.GetDouble("yield_rate");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            info.trade_amt = unpacker.GetDouble("trade_amt");
            info.un_close_posi_qty = unpacker.GetDouble("un_close_posi_qty");
            info.un_close_marke_value = unpacker.GetDouble("un_close_marke_value");
            rptL_4_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_17_InfoList.Add((rptL_4_17_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_T+0账户敞口报表历史查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_17_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    info.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    info.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    info.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    rptL_4_17_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_18_Response : IResponse
    {
        #region 构造函数
        public rptL_4_18_Response()
        {
            this.rptL_4_18_InfoList = new ObservableCollection<rptL_4_18_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_18_Info> rptL_4_18_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_18_Info info = new rptL_4_18_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.report_date = unpacker.GetInt("report_date");
            info.pass_no = unpacker.GetInt("pass_no");
            info.order_no = unpacker.GetInt("order_no");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.report_no = unpacker.GetStr("report_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_id = unpacker.GetInt64("strike_id");
            info.strike_no = unpacker.GetStr("strike_no");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.row_id = unpacker.GetInt64("row_id");
            info.oper_way = unpacker.GetStr("oper_way");
            info.busi_opor_no = unpacker.GetInt("busi_opor_no");
            info.busi_opor_name = unpacker.GetStr("busi_opor_name");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.full_execution_amt = unpacker.GetDouble("full_execution_amt");
            info.strike_aver_price = unpacker.GetDouble("strike_aver_price");
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.record_valid_flag = unpacker.GetInt("record_valid_flag");
            rptL_4_18_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_18_InfoList.Add((rptL_4_18_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_证券成交流水明细查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_18_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ID_INT64);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.busi_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT);
                    info.busi_opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NAME_STR);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.full_execution_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_EXECUTION_AMT_FLOAT);
                    info.strike_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT);
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.record_valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_VALID_FLAG_INT);
                    rptL_4_18_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_19_Response : IResponse
    {
        #region 构造函数
        public rptL_4_19_Response()
        {
            this.rptL_4_19_InfoList = new ObservableCollection<rptL_4_19_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_19_Info> rptL_4_19_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_19_Info info = new rptL_4_19_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.report_date = unpacker.GetInt("report_date");
            info.pass_no = unpacker.GetInt("pass_no");
            info.order_no = unpacker.GetInt("order_no");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.report_no = unpacker.GetStr("report_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_id = unpacker.GetInt64("strike_id");
            info.strike_no = unpacker.GetStr("strike_no");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.row_id = unpacker.GetInt64("row_id");
            info.oper_way = unpacker.GetStr("oper_way");
            info.busi_opor_no = unpacker.GetInt("busi_opor_no");
            info.busi_opor_name = unpacker.GetStr("busi_opor_name");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.full_execution_amt = unpacker.GetDouble("full_execution_amt");
            info.strike_aver_price = unpacker.GetDouble("strike_aver_price");
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.record_valid_flag = unpacker.GetInt("record_valid_flag");
            rptL_4_19_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_19_InfoList.Add((rptL_4_19_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_证券成交流水历史查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_19_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ID_INT64);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.busi_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT);
                    info.busi_opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NAME_STR);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.full_execution_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_EXECUTION_AMT_FLOAT);
                    info.strike_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT);
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.record_valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_VALID_FLAG_INT);
                    rptL_4_19_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_20_Response : IResponse
    {
        #region 构造函数
        public rptL_4_20_Response()
        {
            this.rptL_4_20_InfoList = new ObservableCollection<rptL_4_20_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_20_Info> rptL_4_20_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_20_Info info = new rptL_4_20_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.opor_name = unpacker.GetStr("opor_name");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.month_pandl = unpacker.GetDouble("month_pandl");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.trade_amt = unpacker.GetDouble("trade_amt");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.buy_amt = unpacker.GetDouble("buy_amt");
            info.sell_amt = unpacker.GetDouble("sell_amt");
            rptL_4_20_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_20_InfoList.Add((rptL_4_20_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_T+0账户月盈亏报表查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_20_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.month_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONTH_PANDL_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    info.sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AMT_FLOAT);
                    rptL_4_20_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_21_Response : IResponse
    {
        #region 构造函数
        public rptL_4_21_Response()
        {
            this.rptL_4_21_InfoList = new ObservableCollection<rptL_4_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_21_Info> rptL_4_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_21_Info info = new rptL_4_21_Info();
            info.curr_month = unpacker.GetInt("curr_month");
            info.opor_no = unpacker.GetInt("opor_no");
            info.opor_name = unpacker.GetStr("opor_name");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.month_pandl = unpacker.GetDouble("month_pandl");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.trade_amt = unpacker.GetDouble("trade_amt");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.buy_amt = unpacker.GetDouble("buy_amt");
            info.sell_amt = unpacker.GetDouble("sell_amt");
            info.yield_rate = unpacker.GetDouble("yield_rate");
            rptL_4_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_21_InfoList.Add((rptL_4_21_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_T+0账户月盈亏报表历史查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_21_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.curr_month = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONTH_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.month_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONTH_PANDL_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    info.sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AMT_FLOAT);
                    info.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    rptL_4_21_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_27_Response : IResponse
    {
        #region 构造函数
        public rptL_4_27_Response()
        {
            this.rptL_4_27_InfoList = new ObservableCollection<rptL_4_27_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_27_Info> rptL_4_27_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_27_Info info = new rptL_4_27_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.trade_qty = unpacker.GetDouble("trade_qty");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.yield_rate = unpacker.GetDouble("yield_rate");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            info.trade_amt = unpacker.GetDouble("trade_amt");
            rptL_4_27_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_27_InfoList.Add((rptL_4_27_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_T+0账户盈亏专用报表查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_27_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    info.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    rptL_4_27_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_28_Response : IResponse
    {
        #region 构造函数
        public rptL_4_28_Response()
        {
            this.rptL_4_28_InfoList = new ObservableCollection<rptL_4_28_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_28_Info> rptL_4_28_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_28_Info info = new rptL_4_28_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.posi_qty = unpacker.GetDouble("posi_qty");
            info.trade_qty = unpacker.GetDouble("trade_qty");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.yield_rate = unpacker.GetDouble("yield_rate");
            info.sum_realize_pandl = unpacker.GetDouble("sum_realize_pandl");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            info.trade_amt = unpacker.GetDouble("trade_amt");
            rptL_4_28_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_28_InfoList.Add((rptL_4_28_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_T+0账户盈亏专用报表历史查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_28_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_QTY_FLOAT);
                    info.trade_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_QTY_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_YIELD_RATE_FLOAT);
                    info.sum_realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SUM_REALIZE_PANDL_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    info.trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AMT_FLOAT);
                    rptL_4_28_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_31_Response : IResponse
    {
        #region 构造函数
        public rptL_4_31_Response()
        {
            this.rptL_4_31_InfoList = new ObservableCollection<rptL_4_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_31_Info> rptL_4_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_31_Info info = new rptL_4_31_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_all_share = unpacker.GetDouble("pd_all_share");
            info.curr_share = unpacker.GetDouble("curr_share");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.pre_nav = unpacker.GetDouble("pre_nav");
            info.nav_fluct = unpacker.GetDouble("nav_fluct");
            info.cash_asset = unpacker.GetDouble("cash_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.money_fund_asset = unpacker.GetDouble("money_fund_asset");
            info.not_money_fund_asset = unpacker.GetDouble("not_money_fund_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.hk_thrgh_stock_asset = unpacker.GetDouble("hk_thrgh_stock_asset");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.assign_avail_amt = unpacker.GetDouble("assign_avail_amt");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.today_pandl = unpacker.GetDouble("today_pandl");
            info.daily_pandl_ratio = unpacker.GetDouble("daily_pandl_ratio");
            info.cash_out_amt = unpacker.GetDouble("cash_out_amt");
            info.stock_asset_ratio = unpacker.GetDouble("stock_asset_ratio");
            info.securities_ratio = unpacker.GetDouble("securities_ratio");
            info.fund_asset_ratio = unpacker.GetDouble("fund_asset_ratio");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.avail_cash = unpacker.GetDouble("avail_cash");
            info.capit_bala = unpacker.GetDouble("capit_bala");
            info.avail_amt = unpacker.GetDouble("avail_amt");
            info.total_change_amt = unpacker.GetDouble("total_change_amt");
            info.futu_cash_asset = unpacker.GetDouble("futu_cash_asset");
            info.total_cash_asset = unpacker.GetDouble("total_cash_asset");
            info.stock_cash_asset = unpacker.GetDouble("stock_cash_asset");
            info.capt_margin = unpacker.GetDouble("capt_margin");
            info.total_fina_debt = unpacker.GetDouble("total_fina_debt");
            info.total_loan_debt = unpacker.GetDouble("total_loan_debt");
            rptL_4_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_31_InfoList.Add((rptL_4_31_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询产品资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_31_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    info.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    info.nav_fluct = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_FLUCT_FLOAT);
                    info.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    info.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.assign_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGN_AVAIL_AMT_FLOAT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    info.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    info.cash_out_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_OUT_AMT_FLOAT);
                    info.stock_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_RATIO_FLOAT);
                    info.securities_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECURITIES_RATIO_FLOAT);
                    info.fund_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_RATIO_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.avail_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_CASH_FLOAT);
                    info.capit_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_BALA_FLOAT);
                    info.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    info.total_change_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CHANGE_AMT_FLOAT);
                    info.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    info.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    info.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    info.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    info.total_fina_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_FINA_DEBT_FLOAT);
                    info.total_loan_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LOAN_DEBT_FLOAT);
                    rptL_4_31_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_32_Response : IResponse
    {
        #region 构造函数
        public rptL_4_32_Response()
        {
            this.rptL_4_32_InfoList = new ObservableCollection<rptL_4_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_32_Info> rptL_4_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_32_Info info = new rptL_4_32_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.exch_group_pd_share = unpacker.GetDouble("exch_group_pd_share");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.pre_nav = unpacker.GetDouble("pre_nav");
            info.nav_fluct = unpacker.GetDouble("nav_fluct");
            info.cash_asset = unpacker.GetDouble("cash_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.money_fund_asset = unpacker.GetDouble("money_fund_asset");
            info.not_money_fund_asset = unpacker.GetDouble("not_money_fund_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.hk_thrgh_stock_asset = unpacker.GetDouble("hk_thrgh_stock_asset");
            info.assign_avail_amt = unpacker.GetDouble("assign_avail_amt");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.today_pandl = unpacker.GetDouble("today_pandl");
            info.daily_pandl_ratio = unpacker.GetDouble("daily_pandl_ratio");
            info.total_realiz_pandl = unpacker.GetDouble("total_realiz_pandl");
            info.total_realiz_pandl_ratio = unpacker.GetDouble("total_realiz_pandl_ratio");
            info.posi_ratio = unpacker.GetDouble("posi_ratio");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.avail_cash = unpacker.GetDouble("avail_cash");
            info.capit_bala = unpacker.GetDouble("capit_bala");
            info.avail_amt = unpacker.GetDouble("avail_amt");
            info.total_change_amt = unpacker.GetDouble("total_change_amt");
            info.futu_cash_asset = unpacker.GetDouble("futu_cash_asset");
            info.total_cash_asset = unpacker.GetDouble("total_cash_asset");
            info.stock_cash_asset = unpacker.GetDouble("stock_cash_asset");
            info.hk_avail_amt = unpacker.GetDouble("hk_avail_amt");
            info.total_fina_debt = unpacker.GetDouble("total_fina_debt");
            info.total_loan_debt = unpacker.GetDouble("total_loan_debt");
            rptL_4_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_32_InfoList.Add((rptL_4_32_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询交易组资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_32_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.exch_group_pd_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    info.nav_fluct = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_FLUCT_FLOAT);
                    info.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    info.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    info.assign_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGN_AVAIL_AMT_FLOAT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    info.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    info.total_realiz_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_FLOAT);
                    info.total_realiz_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_RATIO_FLOAT);
                    info.posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_RATIO_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.avail_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_CASH_FLOAT);
                    info.capit_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_BALA_FLOAT);
                    info.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    info.total_change_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CHANGE_AMT_FLOAT);
                    info.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    info.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    info.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    info.hk_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_AVAIL_AMT_FLOAT);
                    info.total_fina_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_FINA_DEBT_FLOAT);
                    info.total_loan_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LOAN_DEBT_FLOAT);
                    rptL_4_32_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_33_Response : IResponse
    {
        #region 构造函数
        public rptL_4_33_Response()
        {
            this.rptL_4_33_InfoList = new ObservableCollection<rptL_4_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_33_Info> rptL_4_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_33_Info info = new rptL_4_33_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_all_share = unpacker.GetDouble("pd_all_share");
            info.curr_share = unpacker.GetDouble("curr_share");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.pre_nav = unpacker.GetDouble("pre_nav");
            info.nav_fluct = unpacker.GetDouble("nav_fluct");
            info.cash_asset = unpacker.GetDouble("cash_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.money_fund_asset = unpacker.GetDouble("money_fund_asset");
            info.not_money_fund_asset = unpacker.GetDouble("not_money_fund_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.hk_thrgh_stock_asset = unpacker.GetDouble("hk_thrgh_stock_asset");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.assign_avail_amt = unpacker.GetDouble("assign_avail_amt");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.today_pandl = unpacker.GetDouble("today_pandl");
            info.daily_pandl_ratio = unpacker.GetDouble("daily_pandl_ratio");
            info.cash_out_amt = unpacker.GetDouble("cash_out_amt");
            info.stock_asset_ratio = unpacker.GetDouble("stock_asset_ratio");
            info.securities_ratio = unpacker.GetDouble("securities_ratio");
            info.fund_asset_ratio = unpacker.GetDouble("fund_asset_ratio");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.avail_cash = unpacker.GetDouble("avail_cash");
            info.capit_bala = unpacker.GetDouble("capit_bala");
            info.avail_amt = unpacker.GetDouble("avail_amt");
            info.total_change_amt = unpacker.GetDouble("total_change_amt");
            info.futu_cash_asset = unpacker.GetDouble("futu_cash_asset");
            info.total_cash_asset = unpacker.GetDouble("total_cash_asset");
            info.stock_cash_asset = unpacker.GetDouble("stock_cash_asset");
            info.capt_margin = unpacker.GetDouble("capt_margin");
            info.total_fina_debt = unpacker.GetDouble("total_fina_debt");
            info.total_loan_debt = unpacker.GetDouble("total_loan_debt");
            rptL_4_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_33_InfoList.Add((rptL_4_33_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询产品资产_历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_33_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    info.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    info.nav_fluct = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_FLUCT_FLOAT);
                    info.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    info.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.assign_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGN_AVAIL_AMT_FLOAT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    info.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    info.cash_out_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_OUT_AMT_FLOAT);
                    info.stock_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_RATIO_FLOAT);
                    info.securities_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECURITIES_RATIO_FLOAT);
                    info.fund_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_RATIO_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.avail_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_CASH_FLOAT);
                    info.capit_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_BALA_FLOAT);
                    info.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    info.total_change_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CHANGE_AMT_FLOAT);
                    info.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    info.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    info.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    info.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                    info.total_fina_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_FINA_DEBT_FLOAT);
                    info.total_loan_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LOAN_DEBT_FLOAT);
                    rptL_4_33_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_34_Response : IResponse
    {
        #region 构造函数
        public rptL_4_34_Response()
        {
            this.rptL_4_34_InfoList = new ObservableCollection<rptL_4_34_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_34_Info> rptL_4_34_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_34_Info info = new rptL_4_34_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.exch_group_pd_share = unpacker.GetDouble("exch_group_pd_share");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.pre_nav = unpacker.GetDouble("pre_nav");
            info.nav_fluct = unpacker.GetDouble("nav_fluct");
            info.cash_asset = unpacker.GetDouble("cash_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.money_fund_asset = unpacker.GetDouble("money_fund_asset");
            info.not_money_fund_asset = unpacker.GetDouble("not_money_fund_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.hk_thrgh_stock_asset = unpacker.GetDouble("hk_thrgh_stock_asset");
            info.assign_avail_amt = unpacker.GetDouble("assign_avail_amt");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.today_pandl = unpacker.GetDouble("today_pandl");
            info.daily_pandl_ratio = unpacker.GetDouble("daily_pandl_ratio");
            info.total_realiz_pandl = unpacker.GetDouble("total_realiz_pandl");
            info.total_realiz_pandl_ratio = unpacker.GetDouble("total_realiz_pandl_ratio");
            info.posi_ratio = unpacker.GetDouble("posi_ratio");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.avail_cash = unpacker.GetDouble("avail_cash");
            info.capit_bala = unpacker.GetDouble("capit_bala");
            info.avail_amt = unpacker.GetDouble("avail_amt");
            info.total_change_amt = unpacker.GetDouble("total_change_amt");
            info.futu_cash_asset = unpacker.GetDouble("futu_cash_asset");
            info.total_cash_asset = unpacker.GetDouble("total_cash_asset");
            info.stock_cash_asset = unpacker.GetDouble("stock_cash_asset");
            info.hk_avail_amt = unpacker.GetDouble("hk_avail_amt");
            info.total_fina_debt = unpacker.GetDouble("total_fina_debt");
            info.total_loan_debt = unpacker.GetDouble("total_loan_debt");
            rptL_4_34_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_34_InfoList.Add((rptL_4_34_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询交易组资产_历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_34_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.exch_group_pd_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    info.nav_fluct = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_FLUCT_FLOAT);
                    info.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    info.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    info.assign_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGN_AVAIL_AMT_FLOAT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    info.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    info.total_realiz_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_FLOAT);
                    info.total_realiz_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_REALIZ_PANDL_RATIO_FLOAT);
                    info.posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_RATIO_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.avail_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_CASH_FLOAT);
                    info.capit_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_BALA_FLOAT);
                    info.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    info.total_change_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CHANGE_AMT_FLOAT);
                    info.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    info.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    info.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    info.hk_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_AVAIL_AMT_FLOAT);
                    info.total_fina_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_FINA_DEBT_FLOAT);
                    info.total_loan_debt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_LOAN_DEBT_FLOAT);
                    rptL_4_34_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_35_Response : IResponse
    {
        #region 构造函数
        public rptL_4_35_Response()
        {
            this.rptL_4_35_InfoList = new ObservableCollection<rptL_4_35_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_35_Info> rptL_4_35_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_35_Info info = new rptL_4_35_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.invest_type = unpacker.GetInt("invest_type");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.pre_settle_qty = unpacker.GetDouble("pre_settle_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.comm_frozen_qty = unpacker.GetDouble("comm_frozen_qty");
            info.comm_unfroz_qty = unpacker.GetDouble("comm_unfroz_qty");
            info.comm_capt_qty = unpacker.GetDouble("comm_capt_qty");
            info.comm_releas_qty = unpacker.GetDouble("comm_releas_qty");
            info.trade_frozen_qty = unpacker.GetDouble("trade_frozen_qty");
            info.trade_unfroz_qty = unpacker.GetDouble("trade_unfroz_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_frozen_qty = unpacker.GetDouble("strike_frozen_qty");
            info.strike_unfroz_qty = unpacker.GetDouble("strike_unfroz_qty");
            info.buy_pre_sett_qty = unpacker.GetDouble("buy_pre_sett_qty");
            info.sell_pre_sett_qty = unpacker.GetDouble("sell_pre_sett_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.avail_qty = unpacker.GetDouble("avail_qty");
            info.impawn_qty = unpacker.GetDouble("impawn_qty");
            info.bond_receivable_amt = unpacker.GetDouble("bond_receivable_amt");
            info.net_price = unpacker.GetDouble("net_price");
            info.full_price = unpacker.GetDouble("full_price");
            info.last_price = unpacker.GetDouble("last_price");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.full_holding_amt = unpacker.GetDouble("full_holding_amt");
            info.block_trade_posi_market_value = unpacker.GetDouble("block_trade_posi_market_value");
            info.asset_type = unpacker.GetInt("asset_type");
            info.fair_price = unpacker.GetDouble("fair_price");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.bond_rate_type = unpacker.GetInt("bond_rate_type");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.impawn_ratio = unpacker.GetDouble("impawn_ratio");
            info.total_stock_issue = unpacker.GetDouble("total_stock_issue");
            info.circl_stock_capit = unpacker.GetDouble("circl_stock_capit");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_4_35_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_35_InfoList.Add((rptL_4_35_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询_产品_证券持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_35_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    info.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    info.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    info.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    info.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    info.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    info.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    info.buy_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRE_SETT_QTY_FLOAT);
                    info.sell_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRE_SETT_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_QTY_FLOAT);
                    info.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    info.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    info.net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLOAT);
                    info.full_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    info.block_trade_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BLOCK_TRADE_POSI_MARKET_VALUE_FLOAT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.fair_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FAIR_PRICE_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    info.total_stock_issue = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STOCK_ISSUE_FLOAT);
                    info.circl_stock_capit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CIRCL_STOCK_CAPIT_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_4_35_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_36_Response : IResponse
    {
        #region 构造函数
        public rptL_4_36_Response()
        {
            this.rptL_4_36_InfoList = new ObservableCollection<rptL_4_36_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_36_Info> rptL_4_36_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_36_Info info = new rptL_4_36_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.invest_type = unpacker.GetInt("invest_type");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.pre_settle_qty = unpacker.GetDouble("pre_settle_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.comm_frozen_qty = unpacker.GetDouble("comm_frozen_qty");
            info.comm_unfroz_qty = unpacker.GetDouble("comm_unfroz_qty");
            info.comm_capt_qty = unpacker.GetDouble("comm_capt_qty");
            info.comm_releas_qty = unpacker.GetDouble("comm_releas_qty");
            info.trade_frozen_qty = unpacker.GetDouble("trade_frozen_qty");
            info.trade_unfroz_qty = unpacker.GetDouble("trade_unfroz_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_frozen_qty = unpacker.GetDouble("strike_frozen_qty");
            info.strike_unfroz_qty = unpacker.GetDouble("strike_unfroz_qty");
            info.buy_pre_sett_qty = unpacker.GetDouble("buy_pre_sett_qty");
            info.sell_pre_sett_qty = unpacker.GetDouble("sell_pre_sett_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.full_holding_amt = unpacker.GetDouble("full_holding_amt");
            info.impawn_qty = unpacker.GetDouble("impawn_qty");
            info.bond_receivable_amt = unpacker.GetDouble("bond_receivable_amt");
            info.net_price = unpacker.GetDouble("net_price");
            info.full_price = unpacker.GetDouble("full_price");
            info.last_price = unpacker.GetDouble("last_price");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            info.trade_avail_qty = unpacker.GetDouble("trade_avail_qty");
            info.comm_avail_qty = unpacker.GetDouble("comm_avail_qty");
            info.static_avail_qty = unpacker.GetDouble("static_avail_qty");
            info.block_trade_posi_market_value = unpacker.GetDouble("block_trade_posi_market_value");
            info.asset_type = unpacker.GetInt("asset_type");
            info.fair_price = unpacker.GetDouble("fair_price");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.bond_rate_type = unpacker.GetInt("bond_rate_type");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.impawn_ratio = unpacker.GetDouble("impawn_ratio");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_4_36_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_36_InfoList.Add((rptL_4_36_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询_交易组_证券持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_36_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    info.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    info.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    info.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    info.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    info.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    info.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    info.buy_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRE_SETT_QTY_FLOAT);
                    info.sell_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRE_SETT_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    info.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    info.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    info.net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLOAT);
                    info.full_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    info.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                    info.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                    info.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                    info.block_trade_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BLOCK_TRADE_POSI_MARKET_VALUE_FLOAT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.fair_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FAIR_PRICE_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_4_36_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_37_Response : IResponse
    {
        #region 构造函数
        public rptL_4_37_Response()
        {
            this.rptL_4_37_InfoList = new ObservableCollection<rptL_4_37_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_37_Info> rptL_4_37_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_37_Info info = new rptL_4_37_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.posi_nav_ratio = unpacker.GetDouble("posi_nav_ratio");
            info.invest_type = unpacker.GetInt("invest_type");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.pre_settle_qty = unpacker.GetDouble("pre_settle_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.buy_pre_sett_qty = unpacker.GetDouble("buy_pre_sett_qty");
            info.sell_pre_sett_qty = unpacker.GetDouble("sell_pre_sett_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.avail_qty = unpacker.GetDouble("avail_qty");
            info.full_holding_amt = unpacker.GetDouble("full_holding_amt");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.impawn_qty = unpacker.GetDouble("impawn_qty");
            info.bond_receivable_amt = unpacker.GetDouble("bond_receivable_amt");
            info.net_price = unpacker.GetDouble("net_price");
            info.full_price = unpacker.GetDouble("full_price");
            info.last_price = unpacker.GetDouble("last_price");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_4_37_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_37_InfoList.Add((rptL_4_37_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询_产品_证券持仓_历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_37_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.buy_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRE_SETT_QTY_FLOAT);
                    info.sell_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRE_SETT_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_QTY_FLOAT);
                    info.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    info.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    info.net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLOAT);
                    info.full_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_4_37_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_38_Response : IResponse
    {
        #region 构造函数
        public rptL_4_38_Response()
        {
            this.rptL_4_38_InfoList = new ObservableCollection<rptL_4_38_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_38_Info> rptL_4_38_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_38_Info info = new rptL_4_38_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.invest_type = unpacker.GetInt("invest_type");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.trade_avail_qty = unpacker.GetDouble("trade_avail_qty");
            info.comm_avail_qty = unpacker.GetDouble("comm_avail_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.last_price = unpacker.GetDouble("last_price");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.posi_nav_ratio = unpacker.GetDouble("posi_nav_ratio");
            info.full_holding_amt = unpacker.GetDouble("full_holding_amt");
            info.float_pandl = unpacker.GetDouble("float_pandl");
            info.pandl_ratio = unpacker.GetDouble("pandl_ratio");
            info.bond_receivable_amt = unpacker.GetDouble("bond_receivable_amt");
            info.impawn_qty = unpacker.GetDouble("impawn_qty");
            info.remark_info = unpacker.GetStr("remark_info");
            rptL_4_38_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_38_InfoList.Add((rptL_4_38_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询_交易组_证券持仓_历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_38_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                    info.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    info.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    info.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    info.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    info.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    info.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    rptL_4_38_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_41_Response : IResponse
    {
        #region 构造函数
        public rptL_4_41_Response()
        {
            this.rptL_4_41_InfoList = new ObservableCollection<rptL_4_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_41_Info> rptL_4_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_41_Info info = new rptL_4_41_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.marked_pandl = unpacker.GetDouble("marked_pandl");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.today_strike_capt_qty = unpacker.GetDouble("today_strike_capt_qty");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.posi_nav_ratio = unpacker.GetDouble("posi_nav_ratio");
            info.open_aver_price = unpacker.GetDouble("open_aver_price");
            rptL_4_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_41_InfoList.Add((rptL_4_41_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询_产品_期货持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_41_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.today_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_STRIKE_CAPT_QTY_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    info.open_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AVER_PRICE_FLOAT);
                    rptL_4_41_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_42_Response : IResponse
    {
        #region 构造函数
        public rptL_4_42_Response()
        {
            this.rptL_4_42_InfoList = new ObservableCollection<rptL_4_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_42_Info> rptL_4_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_42_Info info = new rptL_4_42_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.marked_pandl = unpacker.GetDouble("marked_pandl");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.today_strike_capt_qty = unpacker.GetDouble("today_strike_capt_qty");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.posi_nav_ratio = unpacker.GetDouble("posi_nav_ratio");
            info.open_aver_price = unpacker.GetDouble("open_aver_price");
            rptL_4_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_42_InfoList.Add((rptL_4_42_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询_产品_期货持仓_历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_42_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.today_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_STRIKE_CAPT_QTY_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    info.open_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AVER_PRICE_FLOAT);
                    rptL_4_42_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_43_Response : IResponse
    {
        #region 构造函数
        public rptL_4_43_Response()
        {
            this.rptL_4_43_InfoList = new ObservableCollection<rptL_4_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_43_Info> rptL_4_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_43_Info info = new rptL_4_43_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.marked_pandl = unpacker.GetDouble("marked_pandl");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.today_strike_capt_qty = unpacker.GetDouble("today_strike_capt_qty");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.posi_nav_ratio = unpacker.GetDouble("posi_nav_ratio");
            info.open_aver_price = unpacker.GetDouble("open_aver_price");
            rptL_4_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_43_InfoList.Add((rptL_4_43_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询_交易组_期货持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_43_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.today_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_STRIKE_CAPT_QTY_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    info.open_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AVER_PRICE_FLOAT);
                    rptL_4_43_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_44_Response : IResponse
    {
        #region 构造函数
        public rptL_4_44_Response()
        {
            this.rptL_4_44_InfoList = new ObservableCollection<rptL_4_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_44_Info> rptL_4_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_44_Info info = new rptL_4_44_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.marked_pandl = unpacker.GetDouble("marked_pandl");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.today_strike_capt_qty = unpacker.GetDouble("today_strike_capt_qty");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.posi_nav_ratio = unpacker.GetDouble("posi_nav_ratio");
            info.open_aver_price = unpacker.GetDouble("open_aver_price");
            rptL_4_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_44_InfoList.Add((rptL_4_44_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询_交易组_期货持仓_历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_44_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.today_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_STRIKE_CAPT_QTY_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    info.open_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AVER_PRICE_FLOAT);
                    rptL_4_44_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_45_Response : IResponse
    {
        #region 构造函数
        public rptL_4_45_Response()
        {
            this.rptL_4_45_InfoList = new ObservableCollection<rptL_4_45_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_45_Info> rptL_4_45_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_45_Info info = new rptL_4_45_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.open_posi_time = unpacker.GetInt("open_posi_time");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.marked_pandl = unpacker.GetDouble("marked_pandl");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            rptL_4_45_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_45_InfoList.Add((rptL_4_45_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询_交易组_期货持仓明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_45_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    info.marked_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKED_PANDL_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    rptL_4_45_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_46_Response : IResponse
    {
        #region 构造函数
        public rptL_4_46_Response()
        {
            this.rptL_4_46_InfoList = new ObservableCollection<rptL_4_46_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_46_Info> rptL_4_46_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_46_Info info = new rptL_4_46_Info();
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.open_posi_date = unpacker.GetInt("open_posi_date");
            info.open_posi_time = unpacker.GetInt("open_posi_time");
            info.open_posi_price = unpacker.GetDouble("open_posi_price");
            info.open_posi_value = unpacker.GetDouble("open_posi_value");
            info.open_posi_fee = unpacker.GetDouble("open_posi_fee");
            info.close_posi_date = unpacker.GetInt("close_posi_date");
            info.close_posi_time = unpacker.GetInt("close_posi_time");
            info.close_posi_price = unpacker.GetDouble("close_posi_price");
            info.close_posi_market_value = unpacker.GetDouble("close_posi_market_value");
            info.close_posi_fee = unpacker.GetDouble("close_posi_fee");
            info.strike_no = unpacker.GetStr("strike_no");
            info.close_posi_qty = unpacker.GetDouble("close_posi_qty");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.over_night_pandl = unpacker.GetDouble("over_night_pandl");
            rptL_4_46_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_46_InfoList.Add((rptL_4_46_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询T0交易员开平仓明细历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_46_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    info.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    info.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    info.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    info.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    info.close_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_DATE_INT);
                    info.close_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_TIME_INT);
                    info.close_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_PRICE_FLOAT);
                    info.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    info.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.over_night_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OVER_NIGHT_PANDL_FLOAT);
                    rptL_4_46_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_47_Response : IResponse
    {
        #region 构造函数
        public rptL_4_47_Response()
        {
            this.rptL_4_47_InfoList = new ObservableCollection<rptL_4_47_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_47_Info> rptL_4_47_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_47_Info info = new rptL_4_47_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_no = unpacker.GetInt("opor_no");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.trade_tax = unpacker.GetDouble("trade_tax");
            info.trade_cost_fee = unpacker.GetDouble("trade_cost_fee");
            info.trade_system_use_fee = unpacker.GetDouble("trade_system_use_fee");
            info.stock_settle_fee = unpacker.GetDouble("stock_settle_fee");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.strike_bond_accr_intrst = unpacker.GetDouble("strike_bond_accr_intrst");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.record_valid_flag = unpacker.GetInt("record_valid_flag");
            info.update_times = unpacker.GetInt("update_times");
            info.external_no = unpacker.GetInt64("external_no");
            info.combo_code = unpacker.GetStr("combo_code");
            info.quot_strike_qty = unpacker.GetDouble("quot_strike_qty");
            info.quot_strike_amt = unpacker.GetDouble("quot_strike_amt");
            rptL_4_47_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_47_InfoList.Add((rptL_4_47_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询成交明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_47_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.trade_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_TAX_FLOAT);
                    info.trade_cost_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COST_FEE_FLOAT);
                    info.trade_system_use_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
                    info.stock_settle_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_SETTLE_FEE_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.strike_bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.record_valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_VALID_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.quot_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_QTY_FLOAT);
                    info.quot_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_AMT_FLOAT);
                    rptL_4_47_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_101_Response : IResponse
    {
        #region 构造函数
        public rptL_4_101_Response()
        {
            this.rptL_4_101_InfoList = new ObservableCollection<rptL_4_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_101_Info> rptL_4_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_101_Info info = new rptL_4_101_Info();
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_group_code = unpacker.GetStr("exch_group_code");
            info.exch_group_name = unpacker.GetStr("exch_group_name");
            info.exch_group_status = unpacker.GetStr("exch_group_status");
            info.default_group_flag = unpacker.GetInt("default_group_flag");
            info.pd_no = unpacker.GetInt("pd_no");
            rptL_4_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_101_InfoList.Add((rptL_4_101_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询全部交易组
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_101_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_group_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_CODE_STR);
                    info.exch_group_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NAME_STR);
                    info.exch_group_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_STATUS_STR);
                    info.default_group_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_GROUP_FLAG_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    rptL_4_101_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_102_Response : IResponse
    {
        #region 构造函数
        public rptL_4_102_Response()
        {
            this.rptL_4_102_InfoList = new ObservableCollection<rptL_4_102_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_102_Info> rptL_4_102_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_102_Info info = new rptL_4_102_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.opor_name = unpacker.GetStr("opor_name");
            info.opor_type = unpacker.GetInt("opor_type");
            info.opor_status = unpacker.GetStr("opor_status");
            rptL_4_102_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_102_InfoList.Add((rptL_4_102_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询全部操作员信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_102_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR);
                    info.opor_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_TYPE_INT);
                    info.opor_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STATUS_STR);
                    rptL_4_102_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_103_Response : IResponse
    {
        #region 构造函数
        public rptL_4_103_Response()
        {
            this.rptL_4_103_InfoList = new ObservableCollection<rptL_4_103_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_103_Info> rptL_4_103_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_103_Info info = new rptL_4_103_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.pd_all_share = unpacker.GetDouble("pd_all_share");
            info.curr_share = unpacker.GetDouble("curr_share");
            info.pre_share = unpacker.GetDouble("pre_share");
            info.begin_NAV = unpacker.GetDouble("begin_NAV");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.unit_nav = unpacker.GetDouble("unit_nav");
            info.pre_nav = unpacker.GetDouble("pre_nav");
            info.nav_fluct = unpacker.GetDouble("nav_fluct");
            info.cash_asset = unpacker.GetDouble("cash_asset");
            info.stock_asset = unpacker.GetDouble("stock_asset");
            info.bond_asset = unpacker.GetDouble("bond_asset");
            info.fund_asset = unpacker.GetDouble("fund_asset");
            info.repo_asset = unpacker.GetDouble("repo_asset");
            info.other_asset = unpacker.GetDouble("other_asset");
            info.futu_asset = unpacker.GetDouble("futu_asset");
            info.hk_thrgh_stock_asset = unpacker.GetDouble("hk_thrgh_stock_asset");
            info.assign_avail_amt = unpacker.GetDouble("assign_avail_amt");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.today_pandl = unpacker.GetDouble("today_pandl");
            info.daily_pandl_ratio = unpacker.GetDouble("daily_pandl_ratio");
            info.cash_out_amt = unpacker.GetDouble("cash_out_amt");
            info.stock_asset_ratio = unpacker.GetDouble("stock_asset_ratio");
            info.fund_asset_ratio = unpacker.GetDouble("fund_asset_ratio");
            info.securities_ratio = unpacker.GetDouble("securities_ratio");
            info.total_rece_amt = unpacker.GetDouble("total_rece_amt");
            info.total_payab_amt = unpacker.GetDouble("total_payab_amt");
            info.money_fund_asset = unpacker.GetDouble("money_fund_asset");
            info.stock_cost = unpacker.GetDouble("stock_cost");
            info.bond_cost = unpacker.GetDouble("bond_cost");
            info.fund_cost = unpacker.GetDouble("fund_cost");
            info.repo_cost = unpacker.GetDouble("repo_cost");
            info.other_cost = unpacker.GetDouble("other_cost");
            info.futu_cost = unpacker.GetDouble("futu_cost");
            info.hk_thrgh_stock_cost = unpacker.GetDouble("hk_thrgh_stock_cost");
            info.money_fund_cost = unpacker.GetDouble("money_fund_cost");
            info.unit_nav_total = unpacker.GetDouble("unit_nav_total");
            info.unit_divi_amt = unpacker.GetDouble("unit_divi_amt");
            info.avail_cash = unpacker.GetDouble("avail_cash");
            info.grp_row = unpacker.GetInt64("grp_row");
            info.last_month_pd_nav = unpacker.GetDouble("last_month_pd_nav");
            info.out_acco = unpacker.GetStr("out_acco");
            info.capit_bala = unpacker.GetDouble("capit_bala");
            info.avail_amt = unpacker.GetDouble("avail_amt");
            info.pre_cash_asset = unpacker.GetDouble("pre_cash_asset");
            info.pre_stock_asset = unpacker.GetDouble("pre_stock_asset");
            info.pre_bond_asset = unpacker.GetDouble("pre_bond_asset");
            info.pre_fund_asset = unpacker.GetDouble("pre_fund_asset");
            info.pre_repo_asset = unpacker.GetDouble("pre_repo_asset");
            info.pre_other_asset = unpacker.GetDouble("pre_other_asset");
            info.pre_futu_asset = unpacker.GetDouble("pre_futu_asset");
            info.pre_hk_thrgh_stock_asset = unpacker.GetDouble("pre_hk_thrgh_stock_asset");
            info.pre_money_fund_asset = unpacker.GetDouble("pre_money_fund_asset");
            info.pre_stock_cost = unpacker.GetDouble("pre_stock_cost");
            info.pre_bond_cost = unpacker.GetDouble("pre_bond_cost");
            info.pre_fund_cost = unpacker.GetDouble("pre_fund_cost");
            info.pre_repo_cost = unpacker.GetDouble("pre_repo_cost");
            info.pre_other_cost = unpacker.GetDouble("pre_other_cost");
            info.pre_futu_cost = unpacker.GetDouble("pre_futu_cost");
            info.pre_hk_thrgh_stock_cost = unpacker.GetDouble("pre_hk_thrgh_stock_cost");
            info.pre_money_fund_cost = unpacker.GetDouble("pre_money_fund_cost");
            rptL_4_103_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_103_InfoList.Add((rptL_4_103_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询产品上日资产
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_103_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    info.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    info.pre_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT);
                    info.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                    info.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    info.nav_fluct = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_FLUCT_FLOAT);
                    info.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    info.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    info.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    info.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    info.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    info.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    info.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    info.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    info.assign_avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ASSIGN_AVAIL_AMT_FLOAT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.today_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_PANDL_FLOAT);
                    info.daily_pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DAILY_PANDL_RATIO_FLOAT);
                    info.cash_out_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_OUT_AMT_FLOAT);
                    info.stock_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_RATIO_FLOAT);
                    info.fund_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_RATIO_FLOAT);
                    info.securities_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECURITIES_RATIO_FLOAT);
                    info.total_rece_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_RECE_AMT_FLOAT);
                    info.total_payab_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_PAYAB_AMT_FLOAT);
                    info.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    info.stock_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_COST_FLOAT);
                    info.bond_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_COST_FLOAT);
                    info.fund_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_COST_FLOAT);
                    info.repo_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_COST_FLOAT);
                    info.other_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COST_FLOAT);
                    info.futu_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_COST_FLOAT);
                    info.hk_thrgh_stock_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_COST_FLOAT);
                    info.money_fund_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_COST_FLOAT);
                    info.unit_nav_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_TOTAL_FLOAT);
                    info.unit_divi_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_DIVI_AMT_FLOAT);
                    info.avail_cash = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_CASH_FLOAT);
                    info.grp_row = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_GRP_ROW_INT64);
                    info.last_month_pd_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_MONTH_PD_NAV_FLOAT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.capit_bala = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_BALA_FLOAT);
                    info.avail_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_AMT_FLOAT);
                    info.pre_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CASH_ASSET_FLOAT);
                    info.pre_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_STOCK_ASSET_FLOAT);
                    info.pre_bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_BOND_ASSET_FLOAT);
                    info.pre_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FUND_ASSET_FLOAT);
                    info.pre_repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_REPO_ASSET_FLOAT);
                    info.pre_other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_OTHER_ASSET_FLOAT);
                    info.pre_futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FUTU_ASSET_FLOAT);
                    info.pre_hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_HK_THRGH_STOCK_ASSET_FLOAT);
                    info.pre_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_MONEY_FUND_ASSET_FLOAT);
                    info.pre_stock_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_STOCK_COST_FLOAT);
                    info.pre_bond_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_BOND_COST_FLOAT);
                    info.pre_fund_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FUND_COST_FLOAT);
                    info.pre_repo_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_REPO_COST_FLOAT);
                    info.pre_other_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_OTHER_COST_FLOAT);
                    info.pre_futu_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_FUTU_COST_FLOAT);
                    info.pre_hk_thrgh_stock_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_HK_THRGH_STOCK_COST_FLOAT);
                    info.pre_money_fund_cost = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_MONEY_FUND_COST_FLOAT);
                    rptL_4_103_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_104_Response : IResponse
    {
        #region 构造函数
        public rptL_4_104_Response()
        {
            this.rptL_4_104_InfoList = new ObservableCollection<rptL_4_104_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_104_Info> rptL_4_104_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_104_Info info = new rptL_4_104_Info();
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.total_trade_amt = unpacker.GetDouble("total_trade_amt");
            info.total_strike_commis = unpacker.GetDouble("total_strike_commis");
            info.stock_trade_amt = unpacker.GetDouble("stock_trade_amt");
            info.stock_strike_commis = unpacker.GetDouble("stock_strike_commis");
            info.bond_trade_amt = unpacker.GetDouble("bond_trade_amt");
            info.bond_strike_commis = unpacker.GetDouble("bond_strike_commis");
            info.fund_trade_amt = unpacker.GetDouble("fund_trade_amt");
            info.fund_strike_commis = unpacker.GetDouble("fund_strike_commis");
            info.money_fund_trade_amt = unpacker.GetDouble("money_fund_trade_amt");
            info.money_fund_strike_commis = unpacker.GetDouble("money_fund_strike_commis");
            info.hk_thrgh_trade_amt = unpacker.GetDouble("hk_thrgh_trade_amt");
            info.hk_thrgh_strike_commis = unpacker.GetDouble("hk_thrgh_strike_commis");
            info.repo_trade_amt = unpacker.GetDouble("repo_trade_amt");
            info.repo_strike_commis = unpacker.GetDouble("repo_strike_commis");
            info.option_trade_amt = unpacker.GetDouble("option_trade_amt");
            info.option_strike_commis = unpacker.GetDouble("option_strike_commis");
            info.futu_trade_amt = unpacker.GetDouble("futu_trade_amt");
            info.futu_strike_commis = unpacker.GetDouble("futu_strike_commis");
            info.total_trade_cnt = unpacker.GetInt("total_trade_cnt");
            info.stock_trade_cnt = unpacker.GetInt("stock_trade_cnt");
            info.bond_trade_cnt = unpacker.GetInt("bond_trade_cnt");
            info.fund_trade_cnt = unpacker.GetInt("fund_trade_cnt");
            info.money_fund_trade_cnt = unpacker.GetInt("money_fund_trade_cnt");
            info.hk_thrgh_trade_cnt = unpacker.GetInt("hk_thrgh_trade_cnt");
            info.repo_trade_cnt = unpacker.GetInt("repo_trade_cnt");
            info.option_trade_cnt = unpacker.GetInt("option_trade_cnt");
            info.futu_trade_cnt = unpacker.GetInt("futu_trade_cnt");
            rptL_4_104_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_104_InfoList.Add((rptL_4_104_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询产品汇总成交证券类型
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_104_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.total_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_TRADE_AMT_FLOAT);
                    info.total_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_STRIKE_COMMIS_FLOAT);
                    info.stock_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TRADE_AMT_FLOAT);
                    info.stock_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STRIKE_COMMIS_FLOAT);
                    info.bond_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_TRADE_AMT_FLOAT);
                    info.bond_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_STRIKE_COMMIS_FLOAT);
                    info.fund_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_TRADE_AMT_FLOAT);
                    info.fund_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_STRIKE_COMMIS_FLOAT);
                    info.money_fund_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_TRADE_AMT_FLOAT);
                    info.money_fund_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_STRIKE_COMMIS_FLOAT);
                    info.hk_thrgh_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_TRADE_AMT_FLOAT);
                    info.hk_thrgh_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STRIKE_COMMIS_FLOAT);
                    info.repo_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_TRADE_AMT_FLOAT);
                    info.repo_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_STRIKE_COMMIS_FLOAT);
                    info.option_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_TRADE_AMT_FLOAT);
                    info.option_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_STRIKE_COMMIS_FLOAT);
                    info.futu_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TRADE_AMT_FLOAT);
                    info.futu_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_STRIKE_COMMIS_FLOAT);
                    info.total_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_TRADE_CNT_INT);
                    info.stock_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TRADE_CNT_INT);
                    info.bond_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_TRADE_CNT_INT);
                    info.fund_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUND_TRADE_CNT_INT);
                    info.money_fund_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_TRADE_CNT_INT);
                    info.hk_thrgh_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_TRADE_CNT_INT);
                    info.repo_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPO_TRADE_CNT_INT);
                    info.option_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPTION_TRADE_CNT_INT);
                    info.futu_trade_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_TRADE_CNT_INT);
                    rptL_4_104_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_106_Response : IResponse
    {
        #region 构造函数
        public rptL_4_106_Response()
        {
            this.rptL_4_106_InfoList = new ObservableCollection<rptL_4_106_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_106_Info> rptL_4_106_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_106_Info info = new rptL_4_106_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.up_limit_price = unpacker.GetDouble("up_limit_price");
            info.down_limit_price = unpacker.GetDouble("down_limit_price");
            info.last_price = unpacker.GetDouble("last_price");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            info.today_open_price = unpacker.GetDouble("today_open_price");
            info.today_close_price = unpacker.GetDouble("today_close_price");
            info.today_max_price = unpacker.GetDouble("today_max_price");
            info.today_min_price = unpacker.GetDouble("today_min_price");
            info.buy_price_1 = unpacker.GetDouble("buy_price_1");
            info.buy_qty_1 = unpacker.GetDouble("buy_qty_1");
            info.buy_price_2 = unpacker.GetDouble("buy_price_2");
            info.buy_qty_2 = unpacker.GetDouble("buy_qty_2");
            info.buy_price_3 = unpacker.GetDouble("buy_price_3");
            info.buy_qty_3 = unpacker.GetDouble("buy_qty_3");
            info.buy_price_4 = unpacker.GetDouble("buy_price_4");
            info.buy_qty_4 = unpacker.GetDouble("buy_qty_4");
            info.buy_price_5 = unpacker.GetDouble("buy_price_5");
            info.buy_qty_5 = unpacker.GetDouble("buy_qty_5");
            info.sell_price_1 = unpacker.GetDouble("sell_price_1");
            info.sell_qty_1 = unpacker.GetDouble("sell_qty_1");
            info.sell_price_2 = unpacker.GetDouble("sell_price_2");
            info.sell_qty_2 = unpacker.GetDouble("sell_qty_2");
            info.sell_price_3 = unpacker.GetDouble("sell_price_3");
            info.sell_qty_3 = unpacker.GetDouble("sell_qty_3");
            info.sell_price_4 = unpacker.GetDouble("sell_price_4");
            info.sell_qty_4 = unpacker.GetDouble("sell_qty_4");
            info.sell_price_5 = unpacker.GetDouble("sell_price_5");
            info.sell_qty_5 = unpacker.GetDouble("sell_qty_5");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.pe_ratio = unpacker.GetDouble("pe_ratio");
            info.time_stamp = unpacker.GetInt("time_stamp");
            rptL_4_106_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_106_InfoList.Add((rptL_4_106_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询证券行情
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_106_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    info.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    info.today_open_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_OPEN_PRICE_FLOAT);
                    info.today_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_CLOSE_PRICE_FLOAT);
                    info.today_max_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MAX_PRICE_FLOAT);
                    info.today_min_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_MIN_PRICE_FLOAT);
                    info.buy_price_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_1_FLOAT);
                    info.buy_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_1_FLOAT);
                    info.buy_price_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_2_FLOAT);
                    info.buy_qty_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_2_FLOAT);
                    info.buy_price_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_3_FLOAT);
                    info.buy_qty_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_3_FLOAT);
                    info.buy_price_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_4_FLOAT);
                    info.buy_qty_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_4_FLOAT);
                    info.buy_price_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRICE_5_FLOAT);
                    info.buy_qty_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_QTY_5_FLOAT);
                    info.sell_price_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_1_FLOAT);
                    info.sell_qty_1 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_1_FLOAT);
                    info.sell_price_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_2_FLOAT);
                    info.sell_qty_2 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_2_FLOAT);
                    info.sell_price_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_3_FLOAT);
                    info.sell_qty_3 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_3_FLOAT);
                    info.sell_price_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_4_FLOAT);
                    info.sell_qty_4 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_4_FLOAT);
                    info.sell_price_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRICE_5_FLOAT);
                    info.sell_qty_5 = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_QTY_5_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.pe_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PE_RATIO_FLOAT);
                    info.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    rptL_4_106_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_107_Response : IResponse
    {
        #region 构造函数
        public rptL_4_107_Response()
        {
            this.rptL_4_107_InfoList = new ObservableCollection<rptL_4_107_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_107_Info> rptL_4_107_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_107_Info info = new rptL_4_107_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.commd_cnt = unpacker.GetDouble("commd_cnt");
            info.comm_qty = unpacker.GetDouble("comm_qty");
            info.comm_amt = unpacker.GetDouble("comm_amt");
            info.order_num = unpacker.GetInt("order_num");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_amt = unpacker.GetDouble("order_amt");
            info.undeal_amt = unpacker.GetDouble("undeal_amt");
            info.strike_num = unpacker.GetInt("strike_num");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.quot_strike_qty = unpacker.GetDouble("quot_strike_qty");
            info.quot_strike_amt = unpacker.GetDouble("quot_strike_amt");
            info.last_price = unpacker.GetDouble("last_price");
            rptL_4_107_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_107_InfoList.Add((rptL_4_107_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询产品指令统计
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_107_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.commd_cnt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMMD_CNT_FLOAT);
                    info.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    info.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    info.order_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NUM_INT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_AMT_FLOAT);
                    info.undeal_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNDEAL_AMT_FLOAT);
                    info.strike_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.quot_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_QTY_FLOAT);
                    info.quot_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_QUOT_STRIKE_AMT_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    rptL_4_107_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_108_Response : IResponse
    {
        #region 构造函数
        public rptL_4_108_Response()
        {
            this.rptL_4_108_InfoList = new ObservableCollection<rptL_4_108_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_108_Info> rptL_4_108_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_108_Info info = new rptL_4_108_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.posi_yield_rate = unpacker.GetDouble("posi_yield_rate");
            info.real_trade_oper_rate = unpacker.GetDouble("real_trade_oper_rate");
            info.avg_nav_asset = unpacker.GetDouble("avg_nav_asset");
            info.buy_amt = unpacker.GetDouble("buy_amt");
            info.sellout_amt = unpacker.GetDouble("sellout_amt");
            info.begin_NAV = unpacker.GetDouble("begin_NAV");
            info.begin_share_net_total = unpacker.GetDouble("begin_share_net_total");
            info.pd_begin_unit_nav = unpacker.GetDouble("pd_begin_unit_nav");
            info.begin_net_all = unpacker.GetDouble("begin_net_all");
            info.end_nav_asset = unpacker.GetDouble("end_nav_asset");
            info.end_share_net_total = unpacker.GetDouble("end_share_net_total");
            info.end_net_all = unpacker.GetDouble("end_net_all");
            info.end_unit_nav = unpacker.GetDouble("end_unit_nav");
            rptL_4_108_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_108_InfoList.Add((rptL_4_108_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询产品交易操作效率
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_108_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.posi_yield_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_YIELD_RATE_FLOAT);
                    info.real_trade_oper_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REAL_TRADE_OPER_RATE_FLOAT);
                    info.avg_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVG_NAV_ASSET_FLOAT);
                    info.buy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_AMT_FLOAT);
                    info.sellout_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELLOUT_AMT_FLOAT);
                    info.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    info.begin_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_SHARE_NET_TOTAL_FLOAT);
                    info.pd_begin_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_BEGIN_UNIT_NAV_FLOAT);
                    info.begin_net_all = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NET_ALL_FLOAT);
                    info.end_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_NAV_ASSET_FLOAT);
                    info.end_share_net_total = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_SHARE_NET_TOTAL_FLOAT);
                    info.end_net_all = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_NET_ALL_FLOAT);
                    info.end_unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_END_UNIT_NAV_FLOAT);
                    rptL_4_108_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_111_Response : IResponse
    {
        #region 构造函数
        public rptL_4_111_Response()
        {
            this.rptL_4_111_InfoList = new ObservableCollection<rptL_4_111_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_111_Info> rptL_4_111_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_111_Info info = new rptL_4_111_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.invest_type = unpacker.GetInt("invest_type");
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.pre_settle_qty = unpacker.GetDouble("pre_settle_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.comm_frozen_qty = unpacker.GetDouble("comm_frozen_qty");
            info.comm_unfroz_qty = unpacker.GetDouble("comm_unfroz_qty");
            info.comm_capt_qty = unpacker.GetDouble("comm_capt_qty");
            info.comm_releas_qty = unpacker.GetDouble("comm_releas_qty");
            info.trade_frozen_qty = unpacker.GetDouble("trade_frozen_qty");
            info.trade_unfroz_qty = unpacker.GetDouble("trade_unfroz_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_frozen_qty = unpacker.GetDouble("strike_frozen_qty");
            info.strike_unfroz_qty = unpacker.GetDouble("strike_unfroz_qty");
            info.buy_pre_sett_qty = unpacker.GetDouble("buy_pre_sett_qty");
            info.sell_pre_sett_qty = unpacker.GetDouble("sell_pre_sett_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.avail_qty = unpacker.GetDouble("avail_qty");
            info.full_holding_amt = unpacker.GetDouble("full_holding_amt");
            info.nav_asset = unpacker.GetDouble("nav_asset");
            info.impawn_qty = unpacker.GetDouble("impawn_qty");
            info.bond_receivable_amt = unpacker.GetDouble("bond_receivable_amt");
            info.net_price = unpacker.GetDouble("net_price");
            info.full_price = unpacker.GetDouble("full_price");
            info.last_price = unpacker.GetDouble("last_price");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            info.cost_price = unpacker.GetDouble("cost_price");
            info.posi_nav_ratio = unpacker.GetDouble("posi_nav_ratio");
            rptL_4_111_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_111_InfoList.Add((rptL_4_111_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询产品汇总持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_111_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    info.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    info.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    info.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    info.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    info.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    info.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    info.buy_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRE_SETT_QTY_FLOAT);
                    info.sell_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRE_SETT_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AVAIL_QTY_FLOAT);
                    info.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    info.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    info.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    info.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    info.net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLOAT);
                    info.full_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    info.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    info.posi_nav_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_NAV_RATIO_FLOAT);
                    rptL_4_111_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_112_Response : IResponse
    {
        #region 构造函数
        public rptL_4_112_Response()
        {
            this.rptL_4_112_InfoList = new ObservableCollection<rptL_4_112_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_112_Info> rptL_4_112_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_112_Info info = new rptL_4_112_Info();
            info.begin_date = unpacker.GetInt("begin_date");
            info.end_date = unpacker.GetInt("end_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.stock_trade_amt = unpacker.GetDouble("stock_trade_amt");
            info.stock_strike_commis = unpacker.GetDouble("stock_strike_commis");
            rptL_4_112_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_112_InfoList.Add((rptL_4_112_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询产品佣金统计报表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_112_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_DATE_INT);
                    info.end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.stock_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TRADE_AMT_FLOAT);
                    info.stock_strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STRIKE_COMMIS_FLOAT);
                    rptL_4_112_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_113_Response : IResponse
    {
        #region 构造函数
        public rptL_4_113_Response()
        {
            this.rptL_4_113_InfoList = new ObservableCollection<rptL_4_113_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_113_Info> rptL_4_113_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_113_Info info = new rptL_4_113_Info();
            info.strike_capt_amt = unpacker.GetDouble("strike_capt_amt");
            info.strike_releas_amt = unpacker.GetDouble("strike_releas_amt");
            rptL_4_113_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_113_InfoList.Add((rptL_4_113_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_产品当日成交统计查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_4_113_Info();
                info.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                info.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                rptL_4_113_InfoList.Add(info);
            }
        }
    }

    public class rptL_4_114_Response : IResponse
    {
        #region 构造函数
        public rptL_4_114_Response()
        {
            this.rptL_4_114_InfoList = new ObservableCollection<rptL_4_114_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_114_Info> rptL_4_114_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_114_Info info = new rptL_4_114_Info();
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.holder_profit = unpacker.GetDouble("holder_profit");
            rptL_4_114_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_114_InfoList.Add((rptL_4_114_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_产品持仓汇总统计查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_4_114_Info();
                info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                info.holder_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HOLDER_PROFIT_FLOAT);
                rptL_4_114_InfoList.Add(info);
            }
        }
    }

    public class rptL_4_115_Response : IResponse
    {
        #region 构造函数
        public rptL_4_115_Response()
        {
            this.rptL_4_115_InfoList = new ObservableCollection<rptL_4_115_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_115_Info> rptL_4_115_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_115_Info info = new rptL_4_115_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_name = unpacker.GetStr("stock_name");
            info.stock_type = unpacker.GetInt("stock_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.posi_market_value = unpacker.GetDouble("posi_market_value");
            info.invest_type = unpacker.GetInt("invest_type");
            info.begin_qty = unpacker.GetDouble("begin_qty");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.pre_settle_qty = unpacker.GetDouble("pre_settle_qty");
            info.frozen_qty = unpacker.GetDouble("frozen_qty");
            info.unfroz_qty = unpacker.GetDouble("unfroz_qty");
            info.comm_frozen_qty = unpacker.GetDouble("comm_frozen_qty");
            info.comm_unfroz_qty = unpacker.GetDouble("comm_unfroz_qty");
            info.comm_capt_qty = unpacker.GetDouble("comm_capt_qty");
            info.comm_releas_qty = unpacker.GetDouble("comm_releas_qty");
            info.trade_frozen_qty = unpacker.GetDouble("trade_frozen_qty");
            info.trade_unfroz_qty = unpacker.GetDouble("trade_unfroz_qty");
            info.trade_capt_qty = unpacker.GetDouble("trade_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_capt_qty = unpacker.GetDouble("strike_capt_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.strike_frozen_qty = unpacker.GetDouble("strike_frozen_qty");
            info.strike_unfroz_qty = unpacker.GetDouble("strike_unfroz_qty");
            info.buy_pre_sett_qty = unpacker.GetDouble("buy_pre_sett_qty");
            info.sell_pre_sett_qty = unpacker.GetDouble("sell_pre_sett_qty");
            info.cost_amt = unpacker.GetDouble("cost_amt");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.intrst_cost_amt = unpacker.GetDouble("intrst_cost_amt");
            info.intrst_pandl = unpacker.GetDouble("intrst_pandl");
            info.full_holding_amt = unpacker.GetDouble("full_holding_amt");
            info.impawn_qty = unpacker.GetDouble("impawn_qty");
            info.bond_receivable_amt = unpacker.GetDouble("bond_receivable_amt");
            info.net_price = unpacker.GetDouble("net_price");
            info.full_price = unpacker.GetDouble("full_price");
            info.last_price = unpacker.GetDouble("last_price");
            info.pre_close_price = unpacker.GetDouble("pre_close_price");
            info.trade_avail_qty = unpacker.GetDouble("trade_avail_qty");
            info.comm_avail_qty = unpacker.GetDouble("comm_avail_qty");
            info.static_avail_qty = unpacker.GetDouble("static_avail_qty");
            info.block_trade_posi_market_value = unpacker.GetDouble("block_trade_posi_market_value");
            info.asset_type = unpacker.GetInt("asset_type");
            info.fair_price = unpacker.GetDouble("fair_price");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.bond_rate_type = unpacker.GetInt("bond_rate_type");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.impawn_ratio = unpacker.GetDouble("impawn_ratio");
            rptL_4_115_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_115_InfoList.Add((rptL_4_115_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_查询_交易组_新证券持仓
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new rptL_4_115_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_POSI_MARKET_VALUE_FLOAT);
                    info.invest_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INVEST_TYPE_INT);
                    info.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    info.pre_settle_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_QTY_FLOAT);
                    info.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    info.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    info.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    info.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    info.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    info.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    info.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    info.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    info.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    info.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    info.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    info.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    info.buy_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_PRE_SETT_QTY_FLOAT);
                    info.sell_pre_sett_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_PRE_SETT_QTY_FLOAT);
                    info.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    info.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    info.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    info.full_holding_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_HOLDING_AMT_FLOAT);
                    info.impawn_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_QTY_FLOAT);
                    info.bond_receivable_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RECEIVABLE_AMT_FLOAT);
                    info.net_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLOAT);
                    info.full_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FULL_PRICE_FLOAT);
                    info.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    info.pre_close_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLOSE_PRICE_FLOAT);
                    info.trade_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_AVAIL_QTY_FLOAT);
                    info.comm_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AVAIL_QTY_FLOAT);
                    info.static_avail_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STATIC_AVAIL_QTY_FLOAT);
                    info.block_trade_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BLOCK_TRADE_POSI_MARKET_VALUE_FLOAT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.fair_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FAIR_PRICE_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.impawn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_IMPAWN_RATIO_FLOAT);
                    rptL_4_115_InfoList.Add(info);
                }
            }
        }
    }

    public class rptL_4_116_Response : IResponse
    {
        #region 构造函数
        public rptL_4_116_Response()
        {
            this.rptL_4_116_InfoList = new ObservableCollection<rptL_4_116_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<rptL_4_116_Info> rptL_4_116_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            rptL_4_116_Info info = new rptL_4_116_Info();
            info.strike_capt_amt = unpacker.GetDouble("strike_capt_amt");
            info.strike_releas_amt = unpacker.GetDouble("strike_releas_amt");
            rptL_4_116_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            rptL_4_116_InfoList.Add((rptL_4_116_Info)info);
        }
        #endregion

        //逻辑_报表_资管报表_交易组当日成交统计查询
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new rptL_4_116_Info();
                info.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                info.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                rptL_4_116_InfoList.Add(info);
            }
        }
    }

}
