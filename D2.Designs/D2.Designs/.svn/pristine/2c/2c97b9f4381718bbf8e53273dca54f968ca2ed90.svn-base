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
    public class tdfutuL_5_1_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_5_1_Response()
        {
            this.tdfutuL_5_1_InfoList = new ObservableCollection<tdfutuL_5_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_5_1_Info> tdfutuL_5_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_5_1_Info info = new tdfutuL_5_1_Info();
            info.order_status = unpacker.GetStr("order_status");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.rsp_info = unpacker.GetStr("rsp_info");
            tdfutuL_5_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_5_1_InfoList.Add((tdfutuL_5_1_Info)info);
        }
        #endregion

        //逻辑_交易期货_报盘_处理订单回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_5_1_Info();
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                tdfutuL_5_1_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_5_11_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_5_11_Response()
        {
            this.tdfutuL_5_11_InfoList = new ObservableCollection<tdfutuL_5_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_5_11_Info> tdfutuL_5_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_5_11_Info info = new tdfutuL_5_11_Info();
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.external_no = unpacker.GetInt64("external_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_status = unpacker.GetStr("order_status");
            info.wtdraw_date = unpacker.GetInt("wtdraw_date");
            info.wtdraw_time = unpacker.GetInt("wtdraw_time");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.wtdraw_status = unpacker.GetStr("wtdraw_status");
            tdfutuL_5_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_5_11_InfoList.Add((tdfutuL_5_11_Info)info);
        }
        #endregion

        //逻辑_交易期货_报盘_处理撤单回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_5_11_Info();
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.wtdraw_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_DATE_INT);
                info.wtdraw_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_TIME_INT);
                info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                info.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                tdfutuL_5_11_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_5_21_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_5_21_Response()
        {
            this.tdfutuL_5_21_InfoList = new ObservableCollection<tdfutuL_5_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_5_21_Info> tdfutuL_5_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_5_21_Info info = new tdfutuL_5_21_Info();
            info.external_no = unpacker.GetInt64("external_no");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.report_date = unpacker.GetInt("report_date");
            info.report_no = unpacker.GetStr("report_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_no = unpacker.GetStr("strike_no");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_status = unpacker.GetStr("order_status");
            info.asset_type = unpacker.GetInt("asset_type");
            info.curr_qty = unpacker.GetDouble("curr_qty");
            info.old_trade_capt_qty = unpacker.GetDouble("old_trade_capt_qty");
            info.today_trade_capt_qty = unpacker.GetDouble("today_trade_capt_qty");
            info.pre_strike_capt_qty = unpacker.GetDouble("pre_strike_capt_qty");
            info.today_strike_capt_qty = unpacker.GetDouble("today_strike_capt_qty");
            info.trade_releas_qty = unpacker.GetDouble("trade_releas_qty");
            info.strike_releas_qty = unpacker.GetDouble("strike_releas_qty");
            info.open_amount = unpacker.GetDouble("open_amount");
            info.curr_amt = unpacker.GetDouble("curr_amt");
            info.begin_amt = unpacker.GetDouble("begin_amt");
            info.trade_capt_amt = unpacker.GetDouble("trade_capt_amt");
            info.trade_releas_amt = unpacker.GetDouble("trade_releas_amt");
            info.strike_capt_amt = unpacker.GetDouble("strike_capt_amt");
            info.strike_releas_amt = unpacker.GetDouble("strike_releas_amt");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.realize_pandl = unpacker.GetDouble("realize_pandl");
            info.trade_fee = unpacker.GetDouble("trade_fee");
            info.strike_fee = unpacker.GetDouble("strike_fee");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.capt_margin = unpacker.GetDouble("capt_margin");
            tdfutuL_5_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_5_21_InfoList.Add((tdfutuL_5_21_Info)info);
        }
        #endregion

        //逻辑_交易期货_报盘_处理成交回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_5_21_Info();
                info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                info.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                info.old_trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OLD_TRADE_CAPT_QTY_FLOAT);
                info.today_trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_TRADE_CAPT_QTY_FLOAT);
                info.pre_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_STRIKE_CAPT_QTY_FLOAT);
                info.today_strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TODAY_STRIKE_CAPT_QTY_FLOAT);
                info.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                info.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                info.open_amount = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_AMOUNT_FLOAT);
                info.curr_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_AMT_FLOAT);
                info.begin_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_AMT_FLOAT);
                info.trade_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_AMT_FLOAT);
                info.trade_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_AMT_FLOAT);
                info.strike_capt_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_AMT_FLOAT);
                info.strike_releas_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_AMT_FLOAT);
                info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                info.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                info.trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FEE_FLOAT);
                info.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                info.capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CAPT_MARGIN_FLOAT);
                tdfutuL_5_21_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_5_31_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_5_31_Response()
        {
            this.tdfutuL_5_31_InfoList = new ObservableCollection<tdfutuL_5_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_5_31_Info> tdfutuL_5_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_5_31_Info info = new tdfutuL_5_31_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.external_no = unpacker.GetInt64("external_no");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_status = unpacker.GetStr("order_status");
            tdfutuL_5_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_5_31_InfoList.Add((tdfutuL_5_31_Info)info);
        }
        #endregion

        //逻辑_交易期货_报盘_处理订单补单回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_5_31_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                tdfutuL_5_31_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_5_101_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_5_101_Response()
        {
            this.tdfutuL_5_101_InfoList = new ObservableCollection<tdfutuL_5_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_5_101_Info> tdfutuL_5_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_5_101_Info info = new tdfutuL_5_101_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.rsp_status = unpacker.GetStr("rsp_status");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.deal_status = unpacker.GetStr("deal_status");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_5_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_5_101_InfoList.Add((tdfutuL_5_101_Info)info);
        }
        #endregion

        //逻辑_交易期货_报盘_查询订单回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_5_101_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.rsp_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_STATUS_STR);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    info.deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_5_101_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_5_121_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_5_121_Response()
        {
            this.tdfutuL_5_121_InfoList = new ObservableCollection<tdfutuL_5_121_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_5_121_Info> tdfutuL_5_121_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_5_121_Info info = new tdfutuL_5_121_Info();
            info.init_date = unpacker.GetInt("init_date");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_no = unpacker.GetStr("report_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_deal_type = unpacker.GetInt("strike_deal_type");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.deal_status = unpacker.GetStr("deal_status");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_5_121_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_5_121_InfoList.Add((tdfutuL_5_121_Info)info);
        }
        #endregion

        //逻辑_交易期货_报盘_查询成交回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_5_121_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_deal_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DEAL_TYPE_INT);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    info.deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_5_121_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_5_122_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_5_122_Response()
        {
            this.tdfutuL_5_122_InfoList = new ObservableCollection<tdfutuL_5_122_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_5_122_Info> tdfutuL_5_122_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_5_122_Info info = new tdfutuL_5_122_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.query_opor_no = unpacker.GetInt("query_opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.report_date = unpacker.GetInt("report_date");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.report_no = unpacker.GetStr("report_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_fee = unpacker.GetDouble("strike_fee");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.strike_margin = unpacker.GetDouble("strike_margin");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.update_times = unpacker.GetInt("update_times");
            info.comm_id = unpacker.GetInt64("comm_id");
            tdfutuL_5_122_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_5_122_InfoList.Add((tdfutuL_5_122_Info)info);
        }
        #endregion

        //逻辑_交易期货_报盘_查询成交明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_5_122_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.query_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    info.strike_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_MARGIN_FLOAT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    tdfutuL_5_122_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_5_123_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_5_123_Response()
        {
            this.tdfutuL_5_123_InfoList = new ObservableCollection<tdfutuL_5_123_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_5_123_Info> tdfutuL_5_123_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_5_123_Info info = new tdfutuL_5_123_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.report_date = unpacker.GetInt("report_date");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.report_no = unpacker.GetStr("report_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_fee = unpacker.GetDouble("strike_fee");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.strike_margin = unpacker.GetDouble("strike_margin");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_5_123_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_5_123_InfoList.Add((tdfutuL_5_123_Info)info);
        }
        #endregion

        //逻辑_交易期货_报盘_查询成交明细历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_5_123_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    info.strike_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_MARGIN_FLOAT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_5_123_InfoList.Add(info);
                }
            }
        }
    }

}
