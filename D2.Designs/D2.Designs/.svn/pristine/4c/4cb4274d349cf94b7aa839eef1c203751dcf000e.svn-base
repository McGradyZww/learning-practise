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
    public class tdfutuL_8_1_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_8_1_Response()
        {
            this.tdfutuL_8_1_InfoList = new ObservableCollection<tdfutuL_8_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_8_1_Info> tdfutuL_8_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_8_1_Info info = new tdfutuL_8_1_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.external_no = unpacker.GetInt64("external_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_status = unpacker.GetStr("order_status");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.report_fee = unpacker.GetDouble("report_fee");
            info.wtdraw_fee = unpacker.GetDouble("wtdraw_fee");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.comb_code = unpacker.GetStr("comb_code");
            info.margin_ratio = unpacker.GetDouble("margin_ratio");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_8_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_8_1_InfoList.Add((tdfutuL_8_1_Info)info);
        }
        #endregion

        //逻辑_交易期货_交易运维_查询订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_8_1_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_FEE_FLOAT);
                    info.wtdraw_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_FEE_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    info.margin_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_FLOAT);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_8_1_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_8_2_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_8_2_Response()
        {
            this.tdfutuL_8_2_InfoList = new ObservableCollection<tdfutuL_8_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_8_2_Info> tdfutuL_8_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_8_2_Info info = new tdfutuL_8_2_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
            info.external_no = unpacker.GetInt64("external_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_status = unpacker.GetStr("order_status");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.strike_commis = unpacker.GetDouble("strike_commis");
            info.strike_other_commis = unpacker.GetDouble("strike_other_commis");
            info.strike_all_fee = unpacker.GetDouble("strike_all_fee");
            info.report_fee = unpacker.GetDouble("report_fee");
            info.wtdraw_fee = unpacker.GetDouble("wtdraw_fee");
            info.rece_margin = unpacker.GetDouble("rece_margin");
            info.comb_code = unpacker.GetStr("comb_code");
            info.margin_ratio = unpacker.GetDouble("margin_ratio");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_8_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_8_2_InfoList.Add((tdfutuL_8_2_Info)info);
        }
        #endregion

        //逻辑_交易期货_交易运维_查询订单历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_8_2_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_COMMIS_FLOAT);
                    info.strike_other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
                    info.strike_all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ALL_FEE_FLOAT);
                    info.report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_FEE_FLOAT);
                    info.wtdraw_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_FEE_FLOAT);
                    info.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    info.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    info.margin_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_FLOAT);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_8_2_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_8_3_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_8_3_Response()
        {
            this.tdfutuL_8_3_InfoList = new ObservableCollection<tdfutuL_8_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_8_3_Info> tdfutuL_8_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_8_3_Info info = new tdfutuL_8_3_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.rsp_status = unpacker.GetStr("rsp_status");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.deal_status = unpacker.GetStr("deal_status");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_8_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_8_3_InfoList.Add((tdfutuL_8_3_Info)info);
        }
        #endregion

        //逻辑_交易期货_交易运维_查询订单回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_8_3_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.rsp_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_STATUS_STR);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    info.deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_8_3_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_8_4_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_8_4_Response()
        {
            this.tdfutuL_8_4_InfoList = new ObservableCollection<tdfutuL_8_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_8_4_Info> tdfutuL_8_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_8_4_Info info = new tdfutuL_8_4_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.report_date = unpacker.GetInt("report_date");
            info.report_no = unpacker.GetStr("report_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.deal_status = unpacker.GetStr("deal_status");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_8_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_8_4_InfoList.Add((tdfutuL_8_4_Info)info);
        }
        #endregion

        //逻辑_交易期货_交易运维_查询成交回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_8_4_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    info.deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_8_4_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_8_5_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_8_5_Response()
        {
            this.tdfutuL_8_5_InfoList = new ObservableCollection<tdfutuL_8_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_8_5_Info> tdfutuL_8_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_8_5_Info info = new tdfutuL_8_5_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
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
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_fee = unpacker.GetDouble("strike_fee");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.strike_margin = unpacker.GetDouble("strike_margin");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_8_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_8_5_InfoList.Add((tdfutuL_8_5_Info)info);
        }
        #endregion

        //逻辑_交易期货_交易运维_查询成交明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_8_5_Info();
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
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
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
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    info.strike_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_MARGIN_FLOAT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_8_5_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_8_6_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_8_6_Response()
        {
            this.tdfutuL_8_6_InfoList = new ObservableCollection<tdfutuL_8_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_8_6_Info> tdfutuL_8_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_8_6_Info info = new tdfutuL_8_6_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.contrc_type = unpacker.GetInt("contrc_type");
            info.contrc_unit = unpacker.GetInt("contrc_unit");
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
            info.order_dir = unpacker.GetInt("order_dir");
            info.contrc_dir = unpacker.GetInt("contrc_dir");
            info.hedge_type = unpacker.GetInt("hedge_type");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_price = unpacker.GetDouble("strike_price");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_fee = unpacker.GetDouble("strike_fee");
            info.close_pandl = unpacker.GetDouble("close_pandl");
            info.strike_margin = unpacker.GetDouble("strike_margin");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_8_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_8_6_InfoList.Add((tdfutuL_8_6_Info)info);
        }
        #endregion

        //逻辑_交易期货_交易运维_查询成交明细历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_8_6_Info();
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
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    info.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
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
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    info.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FEE_FLOAT);
                    info.close_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_PANDL_FLOAT);
                    info.strike_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_MARGIN_FLOAT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_8_6_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_8_7_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_8_7_Response()
        {
            this.tdfutuL_8_7_InfoList = new ObservableCollection<tdfutuL_8_7_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_8_7_Info> tdfutuL_8_7_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_8_7_Info info = new tdfutuL_8_7_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_co_no = unpacker.GetInt("opor_co_no");
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.oper_way = unpacker.GetStr("oper_way");
            info.oper_func_code = unpacker.GetStr("oper_func_code");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.crncy_type = unpacker.GetStr("crncy_type");
            info.exch_no = unpacker.GetInt("exch_no");
            info.futu_acco_no = unpacker.GetInt("futu_acco_no");
            info.futu_acco = unpacker.GetStr("futu_acco");
            info.contrc_code_no = unpacker.GetInt("contrc_code_no");
            info.contrc_code = unpacker.GetStr("contrc_code");
            info.external_no = unpacker.GetInt64("external_no");
            info.wtdraw_batch_no = unpacker.GetInt("wtdraw_batch_no");
            info.wtdraw_date = unpacker.GetInt("wtdraw_date");
            info.wtdraw_time = unpacker.GetInt("wtdraw_time");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id = unpacker.GetInt64("order_id");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.wtdraw_status = unpacker.GetStr("wtdraw_status");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.wtdraw_remark = unpacker.GetStr("wtdraw_remark");
            info.update_times = unpacker.GetInt("update_times");
            tdfutuL_8_7_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_8_7_InfoList.Add((tdfutuL_8_7_Info)info);
        }
        #endregion

        //逻辑_交易期货_交易运维_查询撤单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_8_7_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    info.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    info.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    info.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    info.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.wtdraw_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_BATCH_NO_INT);
                    info.wtdraw_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_DATE_INT);
                    info.wtdraw_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_TIME_INT);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                    info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    info.wtdraw_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_REMARK_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdfutuL_8_7_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_8_8_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_8_8_Response()
        {
            this.tdfutuL_8_8_InfoList = new ObservableCollection<tdfutuL_8_8_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_8_8_Info> tdfutuL_8_8_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_8_8_Info info = new tdfutuL_8_8_Info();
            tdfutuL_8_8_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_8_8_InfoList.Add((tdfutuL_8_8_Info)info);
        }
        #endregion

        //逻辑_交易期货_交易运维_计算资产账户持仓数量同步产品库
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_8_8_Info();
                tdfutuL_8_8_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_8_9_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_8_9_Response()
        {
            this.tdfutuL_8_9_InfoList = new ObservableCollection<tdfutuL_8_9_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_8_9_Info> tdfutuL_8_9_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_8_9_Info info = new tdfutuL_8_9_Info();
            tdfutuL_8_9_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_8_9_InfoList.Add((tdfutuL_8_9_Info)info);
        }
        #endregion

        //逻辑_交易期货_交易运维_计算资产账户资金可用同步产品库
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_8_9_Info();
                tdfutuL_8_9_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_8_10_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_8_10_Response()
        {
            this.tdfutuL_8_10_InfoList = new ObservableCollection<tdfutuL_8_10_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_8_10_Info> tdfutuL_8_10_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_8_10_Info info = new tdfutuL_8_10_Info();
            tdfutuL_8_10_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_8_10_InfoList.Add((tdfutuL_8_10_Info)info);
        }
        #endregion

        //逻辑_交易期货_交易运维_同步期货行情最新价
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_8_10_Info();
                tdfutuL_8_10_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_8_20_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_8_20_Response()
        {
            this.tdfutuL_8_20_InfoList = new ObservableCollection<tdfutuL_8_20_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_8_20_Info> tdfutuL_8_20_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_8_20_Info info = new tdfutuL_8_20_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.order_status = unpacker.GetStr("order_status");
            info.order_time = unpacker.GetInt("order_time");
            info.mach_time = unpacker.GetInt("mach_time");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            tdfutuL_8_20_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_8_20_InfoList.Add((tdfutuL_8_20_Info)info);
        }
        #endregion

        //逻辑_交易期货_交易运维_查询机构统计异常订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_8_20_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.mach_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MACH_TIME_INT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    tdfutuL_8_20_InfoList.Add(info);
                }
            }
        }
    }

    public class tdfutuL_8_21_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_8_21_Response()
        {
            this.tdfutuL_8_21_InfoList = new ObservableCollection<tdfutuL_8_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_8_21_Info> tdfutuL_8_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_8_21_Info info = new tdfutuL_8_21_Info();
            tdfutuL_8_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_8_21_InfoList.Add((tdfutuL_8_21_Info)info);
        }
        #endregion

        //逻辑_交易期货_交易运维_修改订单错单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdfutuL_8_21_Info();
                tdfutuL_8_21_InfoList.Add(info);
            }
        }
    }

    public class tdfutuL_8_22_Response : IResponse
    {
        #region 构造函数
        public tdfutuL_8_22_Response()
        {
            this.tdfutuL_8_22_InfoList = new ObservableCollection<tdfutuL_8_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdfutuL_8_22_Info> tdfutuL_8_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdfutuL_8_22_Info info = new tdfutuL_8_22_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.no_report_cnt = unpacker.GetInt("no_report_cnt");
            info.already_report_cnt = unpacker.GetInt("already_report_cnt");
            info.wait_report_cnt = unpacker.GetInt("wait_report_cnt");
            info.wait_report_except_cnt = unpacker.GetInt("wait_report_except_cnt");
            info.in_report_cnt = unpacker.GetInt("in_report_cnt");
            info.in_report_except_cnt = unpacker.GetInt("in_report_except_cnt");
            info.wait_cancel_cnt = unpacker.GetInt("wait_cancel_cnt");
            info.wait_cancel_except_cnt = unpacker.GetInt("wait_cancel_except_cnt");
            info.part_strike_cnt = unpacker.GetInt("part_strike_cnt");
            info.all_strike_cnt = unpacker.GetInt("all_strike_cnt");
            info.abolish_cnt = unpacker.GetInt("abolish_cnt");
            tdfutuL_8_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdfutuL_8_22_InfoList.Add((tdfutuL_8_22_Info)info);
        }
        #endregion

        //逻辑_交易期货_交易运维_查询机构统计异常订单数量
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdfutuL_8_22_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.no_report_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NO_REPORT_CNT_INT);
                    info.already_report_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALREADY_REPORT_CNT_INT);
                    info.wait_report_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WAIT_REPORT_CNT_INT);
                    info.wait_report_except_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WAIT_REPORT_EXCEPT_CNT_INT);
                    info.in_report_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IN_REPORT_CNT_INT);
                    info.in_report_except_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IN_REPORT_EXCEPT_CNT_INT);
                    info.wait_cancel_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WAIT_CANCEL_CNT_INT);
                    info.wait_cancel_except_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WAIT_CANCEL_EXCEPT_CNT_INT);
                    info.part_strike_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PART_STRIKE_CNT_INT);
                    info.all_strike_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALL_STRIKE_CNT_INT);
                    info.abolish_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ABOLISH_CNT_INT);
                    tdfutuL_8_22_InfoList.Add(info);
                }
            }
        }
    }

}
