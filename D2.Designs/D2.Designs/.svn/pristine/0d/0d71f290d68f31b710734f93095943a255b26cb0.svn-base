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
    public class tdsecuL_5_1_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_1_Response()
        {
            this.tdsecuL_5_1_InfoList = new ObservableCollection<tdsecuL_5_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_1_Info> tdsecuL_5_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_1_Info info = new tdsecuL_5_1_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.report_date = unpacker.GetInt("report_date");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.order_rsp_status = unpacker.GetStr("order_rsp_status");
            info.price_type = unpacker.GetInt("price_type");
            info.order_id = unpacker.GetInt64("order_id");
            tdsecuL_5_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_1_InfoList.Add((tdsecuL_5_1_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_处理订单回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_5_1_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                info.order_rsp_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_RSP_STATUS_STR);
                info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                tdsecuL_5_1_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_5_11_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_11_Response()
        {
            this.tdsecuL_5_11_InfoList = new ObservableCollection<tdsecuL_5_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_11_Info> tdsecuL_5_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_11_Info info = new tdsecuL_5_11_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.external_no = unpacker.GetInt64("external_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_status = unpacker.GetStr("order_status");
            info.wtdraw_status = unpacker.GetStr("wtdraw_status");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.rsp_status = unpacker.GetStr("rsp_status");
            info.rsp_info = unpacker.GetStr("rsp_info");
            tdsecuL_5_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_11_InfoList.Add((tdsecuL_5_11_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_处理撤单回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_5_11_Info();
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                info.rsp_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_STATUS_STR);
                info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                tdsecuL_5_11_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_5_21_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_21_Response()
        {
            this.tdsecuL_5_21_InfoList = new ObservableCollection<tdsecuL_5_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_21_Info> tdsecuL_5_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_21_Info info = new tdsecuL_5_21_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.report_date = unpacker.GetInt("report_date");
            info.report_no = unpacker.GetStr("report_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.strike_deal_type = unpacker.GetInt("strike_deal_type");
            tdsecuL_5_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_21_InfoList.Add((tdsecuL_5_21_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_处理成交回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_5_21_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                info.strike_deal_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DEAL_TYPE_INT);
                tdsecuL_5_21_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_5_31_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_31_Response()
        {
            this.tdsecuL_5_31_InfoList = new ObservableCollection<tdsecuL_5_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_31_Info> tdsecuL_5_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_31_Info info = new tdsecuL_5_31_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.external_no = unpacker.GetInt64("external_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_status = unpacker.GetStr("order_status");
            info.price_type = unpacker.GetInt("price_type");
            tdsecuL_5_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_31_InfoList.Add((tdsecuL_5_31_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_处理订单补单回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_5_31_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                tdsecuL_5_31_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_5_41_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_41_Response()
        {
            this.tdsecuL_5_41_InfoList = new ObservableCollection<tdsecuL_5_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_41_Info> tdsecuL_5_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_41_Info info = new tdsecuL_5_41_Info();
            tdsecuL_5_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_41_InfoList.Add((tdsecuL_5_41_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_修改订单错单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_5_41_Info();
                tdsecuL_5_41_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_5_51_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_51_Response()
        {
            this.tdsecuL_5_51_InfoList = new ObservableCollection<tdsecuL_5_51_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_51_Info> tdsecuL_5_51_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_51_Info info = new tdsecuL_5_51_Info();
            tdsecuL_5_51_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_51_InfoList.Add((tdsecuL_5_51_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_导入成交补单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_5_51_Info();
                tdsecuL_5_51_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_5_52_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_52_Response()
        {
            this.tdsecuL_5_52_InfoList = new ObservableCollection<tdsecuL_5_52_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_52_Info> tdsecuL_5_52_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_52_Info info = new tdsecuL_5_52_Info();
            info.strike_id = unpacker.GetInt64("strike_id");
            info.comm_strike_qty = unpacker.GetDouble("comm_strike_qty");
            info.comm_strike_amt = unpacker.GetDouble("comm_strike_amt");
            tdsecuL_5_52_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_52_InfoList.Add((tdsecuL_5_52_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_体外指令成交
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_5_52_Info();
                info.strike_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ID_INT64);
                info.comm_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STRIKE_QTY_FLOAT);
                info.comm_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STRIKE_AMT_FLOAT);
                tdsecuL_5_52_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_5_53_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_53_Response()
        {
            this.tdsecuL_5_53_InfoList = new ObservableCollection<tdsecuL_5_53_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_53_Info> tdsecuL_5_53_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_53_Info info = new tdsecuL_5_53_Info();
            info.comm_strike_qty = unpacker.GetDouble("comm_strike_qty");
            info.comm_strike_amt = unpacker.GetDouble("comm_strike_amt");
            tdsecuL_5_53_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_53_InfoList.Add((tdsecuL_5_53_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_体外指令成交回溯
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_5_53_Info();
                info.comm_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STRIKE_QTY_FLOAT);
                info.comm_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STRIKE_AMT_FLOAT);
                tdsecuL_5_53_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_5_101_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_101_Response()
        {
            this.tdsecuL_5_101_InfoList = new ObservableCollection<tdsecuL_5_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_101_Info> tdsecuL_5_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_101_Info info = new tdsecuL_5_101_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.price_type = unpacker.GetInt("price_type");
            info.order_rsp_status = unpacker.GetStr("order_rsp_status");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.deal_status = unpacker.GetStr("deal_status");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_5_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_101_InfoList.Add((tdsecuL_5_101_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_查询订单回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_5_101_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    info.order_rsp_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_RSP_STATUS_STR);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    info.deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_5_101_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_5_121_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_121_Response()
        {
            this.tdsecuL_5_121_InfoList = new ObservableCollection<tdsecuL_5_121_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_121_Info> tdsecuL_5_121_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_121_Info info = new tdsecuL_5_121_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
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
            tdsecuL_5_121_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_121_InfoList.Add((tdsecuL_5_121_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_查询成交回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_5_121_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
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
                    tdsecuL_5_121_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_5_122_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_122_Response()
        {
            this.tdsecuL_5_122_InfoList = new ObservableCollection<tdsecuL_5_122_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_122_Info> tdsecuL_5_122_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_122_Info info = new tdsecuL_5_122_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.query_opor_no = unpacker.GetInt("query_opor_no");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code = unpacker.GetStr("stock_code");
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
            tdsecuL_5_122_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_122_InfoList.Add((tdsecuL_5_122_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_查询成交明细
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_5_122_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.query_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
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
                    tdsecuL_5_122_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_5_123_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_123_Response()
        {
            this.tdsecuL_5_123_InfoList = new ObservableCollection<tdsecuL_5_123_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_123_Info> tdsecuL_5_123_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_123_Info info = new tdsecuL_5_123_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.query_opor_no = unpacker.GetInt("query_opor_no");
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
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.strike_bond_accr_intrst = unpacker.GetDouble("strike_bond_accr_intrst");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.record_valid_flag = unpacker.GetInt("record_valid_flag");
            info.external_no = unpacker.GetInt64("external_no");
            info.combo_code = unpacker.GetStr("combo_code");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_5_123_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_123_InfoList.Add((tdsecuL_5_123_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_查询成交明细历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_5_123_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.query_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT);
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
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.strike_bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.record_valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_VALID_FLAG_INT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_5_123_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_5_124_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_124_Response()
        {
            this.tdsecuL_5_124_InfoList = new ObservableCollection<tdsecuL_5_124_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_124_Info> tdsecuL_5_124_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_124_Info info = new tdsecuL_5_124_Info();
            info.row_id = unpacker.GetInt64("row_id");
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
            info.strike_date = unpacker.GetInt("strike_date");
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
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.trade_tax = unpacker.GetDouble("trade_tax");
            info.trade_cost_fee = unpacker.GetDouble("trade_cost_fee");
            info.trade_system_use_fee = unpacker.GetDouble("trade_system_use_fee");
            info.stock_settle_fee = unpacker.GetDouble("stock_settle_fee");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.strike_bond_accr_intrst = unpacker.GetDouble("strike_bond_accr_intrst");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_5_124_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_124_InfoList.Add((tdsecuL_5_124_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_查询成交汇总
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_5_124_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
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
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.trade_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_TAX_FLOAT);
                    info.trade_cost_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COST_FEE_FLOAT);
                    info.trade_system_use_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
                    info.stock_settle_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_SETTLE_FEE_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.strike_bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_5_124_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_5_125_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_125_Response()
        {
            this.tdsecuL_5_125_InfoList = new ObservableCollection<tdsecuL_5_125_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_125_Info> tdsecuL_5_125_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_125_Info info = new tdsecuL_5_125_Info();
            info.row_id = unpacker.GetInt64("row_id");
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
            info.strike_date = unpacker.GetInt("strike_date");
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
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.strike_bond_accr_intrst = unpacker.GetDouble("strike_bond_accr_intrst");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_5_125_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_125_InfoList.Add((tdsecuL_5_125_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_查询成交汇总历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_5_125_Info();
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
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
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
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.strike_bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_5_125_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_5_126_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_126_Response()
        {
            this.tdsecuL_5_126_InfoList = new ObservableCollection<tdsecuL_5_126_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_126_Info> tdsecuL_5_126_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_126_Info info = new tdsecuL_5_126_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id = unpacker.GetInt64("order_id");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_id = unpacker.GetInt64("strike_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.amt_diff = unpacker.GetDouble("amt_diff");
            info.diff_qty = unpacker.GetDouble("diff_qty");
            info.deal_amt_diff = unpacker.GetDouble("deal_amt_diff");
            info.deal_diff_qty = unpacker.GetDouble("deal_diff_qty");
            info.deal_status = unpacker.GetStr("deal_status");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_5_126_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_126_InfoList.Add((tdsecuL_5_126_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_查询体外交易差额记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_5_126_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ID_INT64);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_DIFF_FLOAT);
                    info.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    info.deal_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_AMT_DIFF_FLOAT);
                    info.deal_diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_DIFF_QTY_FLOAT);
                    info.deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_5_126_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_5_127_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_127_Response()
        {
            this.tdsecuL_5_127_InfoList = new ObservableCollection<tdsecuL_5_127_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_127_Info> tdsecuL_5_127_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_127_Info info = new tdsecuL_5_127_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id = unpacker.GetInt64("order_id");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_id = unpacker.GetInt64("strike_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.occur_amt = unpacker.GetDouble("occur_amt");
            info.occur_qty = unpacker.GetDouble("occur_qty");
            info.amt_diff = unpacker.GetDouble("amt_diff");
            info.diff_qty = unpacker.GetDouble("diff_qty");
            info.deal_amt_diff = unpacker.GetDouble("deal_amt_diff");
            info.deal_diff_qty = unpacker.GetDouble("deal_diff_qty");
            info.deal_status = unpacker.GetStr("deal_status");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_5_127_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_127_InfoList.Add((tdsecuL_5_127_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_查询历史体外交易差额记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_5_127_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    info.strike_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ID_INT64);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    info.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    info.amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_DIFF_FLOAT);
                    info.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    info.deal_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_AMT_DIFF_FLOAT);
                    info.deal_diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_DIFF_QTY_FLOAT);
                    info.deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_5_127_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_5_128_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_128_Response()
        {
            this.tdsecuL_5_128_InfoList = new ObservableCollection<tdsecuL_5_128_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_128_Info> tdsecuL_5_128_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_128_Info info = new tdsecuL_5_128_Info();
            tdsecuL_5_128_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_128_InfoList.Add((tdsecuL_5_128_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_导入成交表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_5_128_Info();
                tdsecuL_5_128_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_5_129_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_129_Response()
        {
            this.tdsecuL_5_129_InfoList = new ObservableCollection<tdsecuL_5_129_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_129_Info> tdsecuL_5_129_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_129_Info info = new tdsecuL_5_129_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.report_date = unpacker.GetInt("report_date");
            info.report_no = unpacker.GetStr("report_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.strike_deal_type = unpacker.GetInt("strike_deal_type");
            tdsecuL_5_129_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_129_InfoList.Add((tdsecuL_5_129_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_处理融资融券成交回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_5_129_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                info.strike_deal_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DEAL_TYPE_INT);
                tdsecuL_5_129_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_5_130_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_130_Response()
        {
            this.tdsecuL_5_130_InfoList = new ObservableCollection<tdsecuL_5_130_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_130_Info> tdsecuL_5_130_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_130_Info info = new tdsecuL_5_130_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.external_no = unpacker.GetInt64("external_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_status = unpacker.GetStr("order_status");
            info.wtdraw_status = unpacker.GetStr("wtdraw_status");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.rsp_status = unpacker.GetStr("rsp_status");
            info.rsp_info = unpacker.GetStr("rsp_info");
            tdsecuL_5_130_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_130_InfoList.Add((tdsecuL_5_130_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_融资融券处理撤单回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_5_130_Info();
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                info.rsp_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_STATUS_STR);
                info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                tdsecuL_5_130_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_5_131_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_131_Response()
        {
            this.tdsecuL_5_131_InfoList = new ObservableCollection<tdsecuL_5_131_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_131_Info> tdsecuL_5_131_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_131_Info info = new tdsecuL_5_131_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.report_date = unpacker.GetInt("report_date");
            info.report_no = unpacker.GetStr("report_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.order_rsp_status = unpacker.GetStr("order_rsp_status");
            info.price_type = unpacker.GetInt("price_type");
            info.order_id = unpacker.GetInt64("order_id");
            tdsecuL_5_131_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_131_InfoList.Add((tdsecuL_5_131_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_融资融券处理订单回报
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_5_131_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                info.order_rsp_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_RSP_STATUS_STR);
                info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                tdsecuL_5_131_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_5_132_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_5_132_Response()
        {
            this.tdsecuL_5_132_InfoList = new ObservableCollection<tdsecuL_5_132_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_5_132_Info> tdsecuL_5_132_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_5_132_Info info = new tdsecuL_5_132_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.report_date = unpacker.GetInt("report_date");
            info.report_no = unpacker.GetStr("report_no");
            info.strike_date = unpacker.GetInt("strike_date");
            info.strike_time = unpacker.GetInt("strike_time");
            info.strike_no = unpacker.GetStr("strike_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.rsp_info = unpacker.GetStr("rsp_info");
            tdsecuL_5_132_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_5_132_InfoList.Add((tdsecuL_5_132_Info)info);
        }
        #endregion

        //逻辑_交易证券_报盘_查询成交回报处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_5_132_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                info.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                info.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                tdsecuL_5_132_InfoList.Add(info);
            }
        }
    }

}
