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
    public class clfutuL_2_1_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_1_Response()
        {
            this.clfutuL_2_1_InfoList = new ObservableCollection<clfutuL_2_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_1_Info> clfutuL_2_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_1_Info info = new clfutuL_2_1_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.deal_info = unpacker.GetStr("deal_info");
            clfutuL_2_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_1_InfoList.Add((clfutuL_2_1_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_清算准备
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_2_1_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                clfutuL_2_1_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_2_2_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_2_Response()
        {
            this.clfutuL_2_2_InfoList = new ObservableCollection<clfutuL_2_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_2_Info> clfutuL_2_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_2_Info info = new clfutuL_2_2_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.row_id = unpacker.GetInt64("row_id");
            info.deal_info = unpacker.GetStr("deal_info");
            clfutuL_2_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_2_InfoList.Add((clfutuL_2_2_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_转入持仓记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_2_2_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                clfutuL_2_2_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_2_6_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_6_Response()
        {
            this.clfutuL_2_6_InfoList = new ObservableCollection<clfutuL_2_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_6_Info> clfutuL_2_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_6_Info info = new clfutuL_2_6_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.row_id = unpacker.GetInt64("row_id");
            info.deal_info = unpacker.GetStr("deal_info");
            clfutuL_2_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_6_InfoList.Add((clfutuL_2_6_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_转入订单记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_2_6_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                clfutuL_2_6_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_2_9_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_9_Response()
        {
            this.clfutuL_2_9_InfoList = new ObservableCollection<clfutuL_2_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_9_Info> clfutuL_2_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_9_Info info = new clfutuL_2_9_Info();
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
            info.comm_id = unpacker.GetInt64("comm_id");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_no = unpacker.GetInt("order_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.report_fee = unpacker.GetDouble("report_fee");
            info.wtdraw_fee = unpacker.GetDouble("wtdraw_fee");
            info.order_status = unpacker.GetStr("order_status");
            info.deal_flag = unpacker.GetInt("deal_flag");
            clfutuL_2_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_9_InfoList.Add((clfutuL_2_9_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_查询订单记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clfutuL_2_9_Info();
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
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_FEE_FLOAT);
                    info.wtdraw_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_FEE_FLOAT);
                    info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    clfutuL_2_9_InfoList.Add(info);
                }
            }
        }
    }

    public class clfutuL_2_21_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_21_Response()
        {
            this.clfutuL_2_21_InfoList = new ObservableCollection<clfutuL_2_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_21_Info> clfutuL_2_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_21_Info info = new clfutuL_2_21_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.row_id = unpacker.GetInt64("row_id");
            info.deal_info = unpacker.GetStr("deal_info");
            clfutuL_2_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_21_InfoList.Add((clfutuL_2_21_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_转入成交记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_2_21_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                clfutuL_2_21_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_2_24_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_24_Response()
        {
            this.clfutuL_2_24_InfoList = new ObservableCollection<clfutuL_2_24_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_24_Info> clfutuL_2_24_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_24_Info info = new clfutuL_2_24_Info();
            info.row_id = unpacker.GetInt64("row_id");
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
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_no = unpacker.GetInt("order_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.report_fee = unpacker.GetDouble("report_fee");
            info.wtdraw_fee = unpacker.GetDouble("wtdraw_fee");
            info.deli_fee = unpacker.GetDouble("deli_fee");
            info.service_fee = unpacker.GetDouble("service_fee");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.out_report_fee = unpacker.GetDouble("out_report_fee");
            info.out_cancel_fee = unpacker.GetDouble("out_cancel_fee");
            info.out_deli_fee = unpacker.GetDouble("out_deli_fee");
            info.out_service_fee = unpacker.GetDouble("out_service_fee");
            info.out_other_fee = unpacker.GetDouble("out_other_fee");
            info.out_brkage_commis = unpacker.GetDouble("out_brkage_commis");
            info.out_other_commis = unpacker.GetDouble("out_other_commis");
            info.capit_reback_days = unpacker.GetInt("capit_reback_days");
            info.posi_reback_days = unpacker.GetInt("posi_reback_days");
            info.clear_entry_type = unpacker.GetInt("clear_entry_type");
            info.deal_flag = unpacker.GetInt("deal_flag");
            clfutuL_2_24_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_24_InfoList.Add((clfutuL_2_24_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_查询成交记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clfutuL_2_24_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
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
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_FEE_FLOAT);
                    info.wtdraw_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_FEE_FLOAT);
                    info.deli_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DELI_FEE_FLOAT);
                    info.service_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SERVICE_FEE_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.out_report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_REPORT_FEE_FLOAT);
                    info.out_cancel_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CANCEL_FEE_FLOAT);
                    info.out_deli_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_DELI_FEE_FLOAT);
                    info.out_service_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_SERVICE_FEE_FLOAT);
                    info.out_other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_FEE_FLOAT);
                    info.out_brkage_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BRKAGE_COMMIS_FLOAT);
                    info.out_other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_COMMIS_FLOAT);
                    info.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    info.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    info.clear_entry_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLEAR_ENTRY_TYPE_INT);
                    info.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    clfutuL_2_24_InfoList.Add(info);
                }
            }
        }
    }

    public class clfutuL_2_37_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_37_Response()
        {
            this.clfutuL_2_37_InfoList = new ObservableCollection<clfutuL_2_37_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_37_Info> clfutuL_2_37_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_37_Info info = new clfutuL_2_37_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.row_id = unpacker.GetInt64("row_id");
            info.deal_info = unpacker.GetStr("deal_info");
            clfutuL_2_37_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_37_InfoList.Add((clfutuL_2_37_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_清算处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_2_37_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                clfutuL_2_37_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_2_38_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_38_Response()
        {
            this.clfutuL_2_38_InfoList = new ObservableCollection<clfutuL_2_38_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_38_Info> clfutuL_2_38_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_38_Info info = new clfutuL_2_38_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.deal_info = unpacker.GetStr("deal_info");
            clfutuL_2_38_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_38_InfoList.Add((clfutuL_2_38_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_订单费用处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_2_38_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                clfutuL_2_38_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_2_58_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_58_Response()
        {
            this.clfutuL_2_58_InfoList = new ObservableCollection<clfutuL_2_58_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_58_Info> clfutuL_2_58_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_58_Info info = new clfutuL_2_58_Info();
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
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_no = unpacker.GetInt("order_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.lngsht_type = unpacker.GetInt("lngsht_type");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.pre_settle_price = unpacker.GetDouble("pre_settle_price");
            info.sett_price = unpacker.GetDouble("sett_price");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_num = unpacker.GetInt("strike_num");
            info.pre_entry_qty = unpacker.GetDouble("pre_entry_qty");
            info.pre_entry_amt = unpacker.GetDouble("pre_entry_amt");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.comb_code = unpacker.GetStr("comb_code");
            info.sett_close_pandl = unpacker.GetDouble("sett_close_pandl");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.report_fee = unpacker.GetDouble("report_fee");
            info.wtdraw_fee = unpacker.GetDouble("wtdraw_fee");
            info.deli_fee = unpacker.GetDouble("deli_fee");
            info.service_fee = unpacker.GetDouble("service_fee");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.out_all_fee = unpacker.GetDouble("out_all_fee");
            info.out_report_fee = unpacker.GetDouble("out_report_fee");
            info.out_cancel_fee = unpacker.GetDouble("out_cancel_fee");
            info.out_deli_fee = unpacker.GetDouble("out_deli_fee");
            info.out_service_fee = unpacker.GetDouble("out_service_fee");
            info.out_other_fee = unpacker.GetDouble("out_other_fee");
            info.out_brkage_commis = unpacker.GetDouble("out_brkage_commis");
            info.out_other_commis = unpacker.GetDouble("out_other_commis");
            info.busi_flag = unpacker.GetInt("busi_flag");
            info.entry_status = unpacker.GetStr("entry_status");
            info.undo_status = unpacker.GetStr("undo_status");
            info.entry_money_jour_no = unpacker.GetInt64("entry_money_jour_no");
            info.entry_asac_posi_jour_no = unpacker.GetInt64("entry_asac_posi_jour_no");
            info.deli_jour_no = unpacker.GetInt64("deli_jour_no");
            clfutuL_2_58_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_58_InfoList.Add((clfutuL_2_58_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_查询待入账记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clfutuL_2_58_Info();
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
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.pre_settle_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SETTLE_PRICE_FLOAT);
                    info.sett_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_PRICE_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NUM_INT);
                    info.pre_entry_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_QTY_FLOAT);
                    info.pre_entry_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_AMT_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    info.sett_close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETT_CLOSE_PANDL_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_FEE_FLOAT);
                    info.wtdraw_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_FEE_FLOAT);
                    info.deli_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DELI_FEE_FLOAT);
                    info.service_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SERVICE_FEE_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.out_all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ALL_FEE_FLOAT);
                    info.out_report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_REPORT_FEE_FLOAT);
                    info.out_cancel_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_CANCEL_FEE_FLOAT);
                    info.out_deli_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_DELI_FEE_FLOAT);
                    info.out_service_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_SERVICE_FEE_FLOAT);
                    info.out_other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_FEE_FLOAT);
                    info.out_brkage_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_BRKAGE_COMMIS_FLOAT);
                    info.out_other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OUT_OTHER_COMMIS_FLOAT);
                    info.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    info.entry_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_STATUS_STR);
                    info.undo_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UNDO_STATUS_STR);
                    info.entry_money_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_MONEY_JOUR_NO_INT64);
                    info.entry_asac_posi_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ENTRY_ASAC_POSI_JOUR_NO_INT64);
                    info.deli_jour_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DELI_JOUR_NO_INT64);
                    clfutuL_2_58_InfoList.Add(info);
                }
            }
        }
    }

    public class clfutuL_2_61_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_61_Response()
        {
            this.clfutuL_2_61_InfoList = new ObservableCollection<clfutuL_2_61_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_61_Info> clfutuL_2_61_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_61_Info info = new clfutuL_2_61_Info();
            info.record_count = unpacker.GetInt("record_count");
            info.row_id = unpacker.GetInt64("row_id");
            info.deal_info = unpacker.GetStr("deal_info");
            clfutuL_2_61_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_61_InfoList.Add((clfutuL_2_61_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_入账处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_2_61_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                info.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                clfutuL_2_61_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_2_62_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_62_Response()
        {
            this.clfutuL_2_62_InfoList = new ObservableCollection<clfutuL_2_62_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_62_Info> clfutuL_2_62_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_62_Info info = new clfutuL_2_62_Info();
            clfutuL_2_62_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_62_InfoList.Add((clfutuL_2_62_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_入账回滚处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_2_62_Info();
                clfutuL_2_62_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_2_101_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_101_Response()
        {
            this.clfutuL_2_101_InfoList = new ObservableCollection<clfutuL_2_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_101_Info> clfutuL_2_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_101_Info info = new clfutuL_2_101_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clfutuL_2_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_101_InfoList.Add((clfutuL_2_101_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_数据准备定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_2_101_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                clfutuL_2_101_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_2_103_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_103_Response()
        {
            this.clfutuL_2_103_InfoList = new ObservableCollection<clfutuL_2_103_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_103_Info> clfutuL_2_103_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_103_Info info = new clfutuL_2_103_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clfutuL_2_103_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_103_InfoList.Add((clfutuL_2_103_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_清算处理定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_2_103_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                clfutuL_2_103_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_2_104_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_104_Response()
        {
            this.clfutuL_2_104_InfoList = new ObservableCollection<clfutuL_2_104_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_104_Info> clfutuL_2_104_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_104_Info info = new clfutuL_2_104_Info();
            info.task_strike_status = unpacker.GetStr("task_strike_status");
            clfutuL_2_104_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_104_InfoList.Add((clfutuL_2_104_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_入账处理定时任务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_2_104_Info();
                info.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                clfutuL_2_104_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_2_107_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_107_Response()
        {
            this.clfutuL_2_107_InfoList = new ObservableCollection<clfutuL_2_107_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_107_Info> clfutuL_2_107_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_107_Info info = new clfutuL_2_107_Info();
            info.pre_switch_strike_qty = unpacker.GetDouble("pre_switch_strike_qty");
            info.alr_switch_strike_qty = unpacker.GetDouble("alr_switch_strike_qty");
            info.pre_clr_strike_qty = unpacker.GetDouble("pre_clr_strike_qty");
            info.alr_clr_strike_qty = unpacker.GetDouble("alr_clr_strike_qty");
            info.pre_entry_record_qty = unpacker.GetDouble("pre_entry_record_qty");
            info.alr_entry_record_qty = unpacker.GetDouble("alr_entry_record_qty");
            clfutuL_2_107_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_107_InfoList.Add((clfutuL_2_107_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_获取汇总统计值
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new clfutuL_2_107_Info();
                info.pre_switch_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SWITCH_STRIKE_QTY_FLOAT);
                info.alr_switch_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALR_SWITCH_STRIKE_QTY_FLOAT);
                info.pre_clr_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_CLR_STRIKE_QTY_FLOAT);
                info.alr_clr_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALR_CLR_STRIKE_QTY_FLOAT);
                info.pre_entry_record_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ENTRY_RECORD_QTY_FLOAT);
                info.alr_entry_record_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALR_ENTRY_RECORD_QTY_FLOAT);
                clfutuL_2_107_InfoList.Add(info);
            }
        }
    }

    public class clfutuL_2_108_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_108_Response()
        {
            this.clfutuL_2_108_InfoList = new ObservableCollection<clfutuL_2_108_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_108_Info> clfutuL_2_108_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_108_Info info = new clfutuL_2_108_Info();
            info.row_id = unpacker.GetInt64("row_id");
            clfutuL_2_108_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_108_InfoList.Add((clfutuL_2_108_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_查询交易组持仓序号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clfutuL_2_108_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    clfutuL_2_108_InfoList.Add(info);
                }
            }
        }
    }

    public class clfutuL_2_109_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_109_Response()
        {
            this.clfutuL_2_109_InfoList = new ObservableCollection<clfutuL_2_109_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_109_Info> clfutuL_2_109_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_109_Info info = new clfutuL_2_109_Info();
            info.row_id = unpacker.GetInt64("row_id");
            clfutuL_2_109_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_109_InfoList.Add((clfutuL_2_109_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_查询成交回报序号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clfutuL_2_109_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    clfutuL_2_109_InfoList.Add(info);
                }
            }
        }
    }

    public class clfutuL_2_110_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_110_Response()
        {
            this.clfutuL_2_110_InfoList = new ObservableCollection<clfutuL_2_110_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_110_Info> clfutuL_2_110_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_110_Info info = new clfutuL_2_110_Info();
            info.row_id = unpacker.GetInt64("row_id");
            clfutuL_2_110_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_110_InfoList.Add((clfutuL_2_110_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_查询成交序号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clfutuL_2_110_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    clfutuL_2_110_InfoList.Add(info);
                }
            }
        }
    }

    public class clfutuL_2_111_Response : IResponse
    {
        #region 构造函数
        public clfutuL_2_111_Response()
        {
            this.clfutuL_2_111_InfoList = new ObservableCollection<clfutuL_2_111_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<clfutuL_2_111_Info> clfutuL_2_111_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            clfutuL_2_111_Info info = new clfutuL_2_111_Info();
            info.row_id = unpacker.GetInt64("row_id");
            clfutuL_2_111_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            clfutuL_2_111_InfoList.Add((clfutuL_2_111_Info)info);
        }
        #endregion

        //逻辑_清算期货_清算_查询待入账记录序号
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new clfutuL_2_111_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    clfutuL_2_111_InfoList.Add(info);
                }
            }
        }
    }

}
