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
    public class tdsecuL_4_11_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_11_Response()
        {
            this.tdsecuL_4_11_InfoList = new ObservableCollection<tdsecuL_4_11_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_11_Info> tdsecuL_4_11_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_11_Info info = new tdsecuL_4_11_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.stock_type = unpacker.GetInt("stock_type");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_price = unpacker.GetDouble("order_price");
            info.price_type = unpacker.GetInt("price_type");
            info.order_status = unpacker.GetStr("order_status");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            tdsecuL_4_11_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_11_InfoList.Add((tdsecuL_4_11_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_新增订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_11_Info();
                info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                tdsecuL_4_11_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_12_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_12_Response()
        {
            this.tdsecuL_4_12_InfoList = new ObservableCollection<tdsecuL_4_12_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_12_Info> tdsecuL_4_12_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_12_Info info = new tdsecuL_4_12_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.report_no = unpacker.GetStr("report_no");
            info.external_no = unpacker.GetInt64("external_no");
            info.order_status = unpacker.GetStr("order_status");
            info.wtdraw_id = unpacker.GetInt64("wtdraw_id");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.wtdraw_status = unpacker.GetStr("wtdraw_status");
            info.order_id = unpacker.GetInt64("order_id");
            tdsecuL_4_12_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_12_InfoList.Add((tdsecuL_4_12_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_撤销订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_12_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                info.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                tdsecuL_4_12_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_14_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_14_Response()
        {
            this.tdsecuL_4_14_InfoList = new ObservableCollection<tdsecuL_4_14_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_14_Info> tdsecuL_4_14_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_14_Info info = new tdsecuL_4_14_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.report_no = unpacker.GetStr("report_no");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.modi_order_id = unpacker.GetInt64("modi_order_id");
            info.new_order_id = unpacker.GetInt64("new_order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_price = unpacker.GetDouble("order_price");
            info.wtdraw_id = unpacker.GetInt64("wtdraw_id");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.wtdraw_status = unpacker.GetStr("wtdraw_status");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            info.old_order_status = unpacker.GetStr("old_order_status");
            info.new_order_status = unpacker.GetStr("new_order_status");
            tdsecuL_4_14_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_14_InfoList.Add((tdsecuL_4_14_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_新增改单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_14_Info();
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                info.modi_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_ID_INT64);
                info.new_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_NEW_ORDER_ID_INT64);
                info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                info.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                info.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                info.old_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OLD_ORDER_STATUS_STR);
                info.new_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NEW_ORDER_STATUS_STR);
                tdsecuL_4_14_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_15_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_15_Response()
        {
            this.tdsecuL_4_15_InfoList = new ObservableCollection<tdsecuL_4_15_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_15_Info> tdsecuL_4_15_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_15_Info info = new tdsecuL_4_15_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_statn = unpacker.GetStr("oper_statn");
            info.co_no = unpacker.GetInt("co_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id_str = unpacker.GetStr("order_id_str");
            info.order_status_str = unpacker.GetStr("order_status_str");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            tdsecuL_4_15_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_15_InfoList.Add((tdsecuL_4_15_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_新增篮子批量订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_15_Info();
                info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                info.oper_statn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_STATN_STR);
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                info.order_id_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_STR_STR);
                info.order_status_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR_STR);
                info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                tdsecuL_4_15_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_16_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_16_Response()
        {
            this.tdsecuL_4_16_InfoList = new ObservableCollection<tdsecuL_4_16_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_16_Info> tdsecuL_4_16_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_16_Info info = new tdsecuL_4_16_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.order_date = unpacker.GetInt("order_date");
            info.pend_order_id = unpacker.GetInt64("pend_order_id");
            tdsecuL_4_16_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_16_InfoList.Add((tdsecuL_4_16_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_新增待执行订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_16_Info();
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                info.pend_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PEND_ORDER_ID_INT64);
                tdsecuL_4_16_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_17_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_17_Response()
        {
            this.tdsecuL_4_17_InfoList = new ObservableCollection<tdsecuL_4_17_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_17_Info> tdsecuL_4_17_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_17_Info info = new tdsecuL_4_17_Info();
            tdsecuL_4_17_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_17_InfoList.Add((tdsecuL_4_17_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_修改待执行订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_17_Info();
                tdsecuL_4_17_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_21_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_21_Response()
        {
            this.tdsecuL_4_21_InfoList = new ObservableCollection<tdsecuL_4_21_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_21_Info> tdsecuL_4_21_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_21_Info info = new tdsecuL_4_21_Info();
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_type = unpacker.GetInt("stock_type");
            info.external_no = unpacker.GetInt64("external_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_status = unpacker.GetStr("order_status");
            info.price_type = unpacker.GetInt("price_type");
            tdsecuL_4_21_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_21_InfoList.Add((tdsecuL_4_21_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询报盘订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_21_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    tdsecuL_4_21_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_22_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_22_Response()
        {
            this.tdsecuL_4_22_InfoList = new ObservableCollection<tdsecuL_4_22_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_22_Info> tdsecuL_4_22_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_22_Info info = new tdsecuL_4_22_Info();
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.wtdraw_id = unpacker.GetInt64("wtdraw_id");
            info.external_no = unpacker.GetInt64("external_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.report_no = unpacker.GetStr("report_no");
            info.wtdraw_status = unpacker.GetStr("wtdraw_status");
            info.order_price = unpacker.GetDouble("order_price");
            tdsecuL_4_22_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_22_InfoList.Add((tdsecuL_4_22_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询报盘撤单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_22_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    tdsecuL_4_22_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_23_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_23_Response()
        {
            this.tdsecuL_4_23_InfoList = new ObservableCollection<tdsecuL_4_23_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_23_Info> tdsecuL_4_23_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_23_Info info = new tdsecuL_4_23_Info();
            info.order_date = unpacker.GetInt("order_date");
            info.order_id = unpacker.GetInt64("order_id");
            info.out_acco = unpacker.GetStr("out_acco");
            info.order_status = unpacker.GetStr("order_status");
            tdsecuL_4_23_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_23_InfoList.Add((tdsecuL_4_23_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_更新订单状态
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_23_Info();
                info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                tdsecuL_4_23_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_31_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_31_Response()
        {
            this.tdsecuL_4_31_InfoList = new ObservableCollection<tdsecuL_4_31_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_31_Info> tdsecuL_4_31_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_31_Info info = new tdsecuL_4_31_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.report_no = unpacker.GetStr("report_no");
            info.external_no = unpacker.GetInt64("external_no");
            info.order_status = unpacker.GetStr("order_status");
            info.wtdraw_id = unpacker.GetInt64("wtdraw_id");
            info.wtdraw_status = unpacker.GetStr("wtdraw_status");
            tdsecuL_4_31_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_31_InfoList.Add((tdsecuL_4_31_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_处理异常撤单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_31_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                info.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                tdsecuL_4_31_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_32_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_32_Response()
        {
            this.tdsecuL_4_32_InfoList = new ObservableCollection<tdsecuL_4_32_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_32_Info> tdsecuL_4_32_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_32_Info info = new tdsecuL_4_32_Info();
            info.order_id = unpacker.GetInt64("order_id");
            info.order_status = unpacker.GetStr("order_status");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            tdsecuL_4_32_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_32_InfoList.Add((tdsecuL_4_32_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_手工补单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_32_Info();
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                tdsecuL_4_32_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_33_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_33_Response()
        {
            this.tdsecuL_4_33_InfoList = new ObservableCollection<tdsecuL_4_33_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_33_Info> tdsecuL_4_33_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_33_Info info = new tdsecuL_4_33_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_status = unpacker.GetStr("order_status");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.oper_statn = unpacker.GetStr("oper_statn");
            tdsecuL_4_33_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_33_InfoList.Add((tdsecuL_4_33_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_导入订单补单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_33_Info();
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                info.oper_statn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_STATN_STR);
                tdsecuL_4_33_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_41_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_41_Response()
        {
            this.tdsecuL_4_41_InfoList = new ObservableCollection<tdsecuL_4_41_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_41_Info> tdsecuL_4_41_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_41_Info info = new tdsecuL_4_41_Info();
            info.order_date = unpacker.GetInt("order_date");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_time = unpacker.GetInt("order_time");
            tdsecuL_4_41_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_41_InfoList.Add((tdsecuL_4_41_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_新增篮子订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_41_Info();
                info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                tdsecuL_4_41_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_42_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_42_Response()
        {
            this.tdsecuL_4_42_InfoList = new ObservableCollection<tdsecuL_4_42_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_42_Info> tdsecuL_4_42_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_42_Info info = new tdsecuL_4_42_Info();
            info.pre_order_id = unpacker.GetInt64("pre_order_id");
            info.pre_order_date = unpacker.GetInt("pre_order_date");
            info.pre_order_time = unpacker.GetInt("pre_order_time");
            info.pre_order_status = unpacker.GetStr("pre_order_status");
            tdsecuL_4_42_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_42_InfoList.Add((tdsecuL_4_42_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_新增预埋订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_42_Info();
                info.pre_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_ID_INT64);
                info.pre_order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_DATE_INT);
                info.pre_order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_TIME_INT);
                info.pre_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_STATUS_STR);
                tdsecuL_4_42_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_43_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_43_Response()
        {
            this.tdsecuL_4_43_InfoList = new ObservableCollection<tdsecuL_4_43_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_43_Info> tdsecuL_4_43_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_43_Info info = new tdsecuL_4_43_Info();
            tdsecuL_4_43_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_43_InfoList.Add((tdsecuL_4_43_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_修改预埋订单状态
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_43_Info();
                tdsecuL_4_43_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_44_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_44_Response()
        {
            this.tdsecuL_4_44_InfoList = new ObservableCollection<tdsecuL_4_44_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_44_Info> tdsecuL_4_44_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_44_Info info = new tdsecuL_4_44_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_statn = unpacker.GetStr("oper_statn");
            info.co_no = unpacker.GetInt("co_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id_str = unpacker.GetStr("order_id_str");
            info.order_status_str = unpacker.GetStr("order_status_str");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            tdsecuL_4_44_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_44_InfoList.Add((tdsecuL_4_44_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_新增组合订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_44_Info();
                info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                info.oper_statn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_STATN_STR);
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                info.order_id_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_STR_STR);
                info.order_status_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR_STR);
                info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                tdsecuL_4_44_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_45_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_45_Response()
        {
            this.tdsecuL_4_45_InfoList = new ObservableCollection<tdsecuL_4_45_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_45_Info> tdsecuL_4_45_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_45_Info info = new tdsecuL_4_45_Info();
            info.oper_mac = unpacker.GetStr("oper_mac");
            info.oper_ip_addr = unpacker.GetStr("oper_ip_addr");
            info.oper_info = unpacker.GetStr("oper_info");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_type = unpacker.GetInt("stock_type");
            info.external_no = unpacker.GetInt64("external_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_price = unpacker.GetDouble("order_price");
            info.price_type = unpacker.GetInt("price_type");
            tdsecuL_4_45_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_45_InfoList.Add((tdsecuL_4_45_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询报盘订单主推
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_45_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    info.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    info.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    tdsecuL_4_45_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_46_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_46_Response()
        {
            this.tdsecuL_4_46_InfoList = new ObservableCollection<tdsecuL_4_46_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_46_Info> tdsecuL_4_46_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_46_Info info = new tdsecuL_4_46_Info();
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.wtdraw_id = unpacker.GetInt64("wtdraw_id");
            info.order_id = unpacker.GetInt64("order_id");
            info.report_no = unpacker.GetStr("report_no");
            tdsecuL_4_46_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_46_InfoList.Add((tdsecuL_4_46_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询报盘撤单主推
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_46_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    tdsecuL_4_46_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_47_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_47_Response()
        {
            this.tdsecuL_4_47_InfoList = new ObservableCollection<tdsecuL_4_47_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_47_Info> tdsecuL_4_47_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_47_Info info = new tdsecuL_4_47_Info();
            tdsecuL_4_47_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_47_InfoList.Add((tdsecuL_4_47_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_修改预埋订单信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_47_Info();
                tdsecuL_4_47_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_101_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_101_Response()
        {
            this.tdsecuL_4_101_InfoList = new ObservableCollection<tdsecuL_4_101_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_101_Info> tdsecuL_4_101_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_101_Info info = new tdsecuL_4_101_Info();
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
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.external_no = unpacker.GetInt64("external_no");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_dir = unpacker.GetInt("order_dir");
            info.price_type = unpacker.GetInt("price_type");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_status = unpacker.GetStr("order_status");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.order_frozen_amt = unpacker.GetDouble("order_frozen_amt");
            info.order_frozen_qty = unpacker.GetDouble("order_frozen_qty");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            info.remark_info = unpacker.GetStr("remark_info");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.combo_code = unpacker.GetStr("combo_code");
            info.combo_posi_id = unpacker.GetInt64("combo_posi_id");
            info.strategy_id = unpacker.GetInt64("strategy_id");
            info.contra_no = unpacker.GetStr("contra_no");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_4_101_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_101_InfoList.Add((tdsecuL_4_101_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_101_Info();
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
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                    info.order_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_QTY_FLOAT);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.combo_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_POSI_ID_INT64);
                    info.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                    info.contra_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRA_NO_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_4_101_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_102_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_102_Response()
        {
            this.tdsecuL_4_102_InfoList = new ObservableCollection<tdsecuL_4_102_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_102_Info> tdsecuL_4_102_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_102_Info info = new tdsecuL_4_102_Info();
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
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.comm_opor = unpacker.GetInt("comm_opor");
            info.external_no = unpacker.GetInt64("external_no");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.report_date = unpacker.GetInt("report_date");
            info.report_time = unpacker.GetInt("report_time");
            info.report_no = unpacker.GetStr("report_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_dir = unpacker.GetInt("order_dir");
            info.price_type = unpacker.GetInt("price_type");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_status = unpacker.GetStr("order_status");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.order_frozen_amt = unpacker.GetDouble("order_frozen_amt");
            info.order_frozen_qty = unpacker.GetDouble("order_frozen_qty");
            info.rsp_info = unpacker.GetStr("rsp_info");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            info.remark_info = unpacker.GetStr("remark_info");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.combo_code = unpacker.GetStr("combo_code");
            info.combo_posi_id = unpacker.GetInt64("combo_posi_id");
            info.contra_no = unpacker.GetStr("contra_no");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_4_102_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_102_InfoList.Add((tdsecuL_4_102_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询订单历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_102_Info();
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
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    info.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                    info.order_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_QTY_FLOAT);
                    info.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.combo_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_POSI_ID_INT64);
                    info.contra_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRA_NO_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_4_102_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_103_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_103_Response()
        {
            this.tdsecuL_4_103_InfoList = new ObservableCollection<tdsecuL_4_103_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_103_Info> tdsecuL_4_103_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_103_Info info = new tdsecuL_4_103_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.external_no = unpacker.GetInt64("external_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_sum_status = unpacker.GetStr("order_sum_status");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.waste_qty = unpacker.GetDouble("waste_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.intrst_days = unpacker.GetInt("intrst_days");
            info.par_value = unpacker.GetDouble("par_value");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.bond_rate_type = unpacker.GetInt("bond_rate_type");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.exch_crncy_type = unpacker.GetStr("exch_crncy_type");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_4_103_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_103_InfoList.Add((tdsecuL_4_103_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询订单汇总
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_103_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_sum_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SUM_STATUS_STR);
                    info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    info.waste_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_4_103_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_104_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_104_Response()
        {
            this.tdsecuL_4_104_InfoList = new ObservableCollection<tdsecuL_4_104_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_104_Info> tdsecuL_4_104_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_104_Info info = new tdsecuL_4_104_Info();
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
            info.basket_id = unpacker.GetInt64("basket_id");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.basket_trade_type = unpacker.GetInt("basket_trade_type");
            info.basket_trade_amt = unpacker.GetDouble("basket_trade_amt");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_4_104_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_104_InfoList.Add((tdsecuL_4_104_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询篮子订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_104_Info();
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
                    info.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.basket_trade_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_TRADE_TYPE_INT);
                    info.basket_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_TRADE_AMT_FLOAT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_4_104_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_105_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_105_Response()
        {
            this.tdsecuL_4_105_InfoList = new ObservableCollection<tdsecuL_4_105_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_105_Info> tdsecuL_4_105_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_105_Info info = new tdsecuL_4_105_Info();
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
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.pre_order_id = unpacker.GetInt64("pre_order_id");
            info.pre_order_date = unpacker.GetInt("pre_order_date");
            info.pre_order_time = unpacker.GetInt("pre_order_time");
            info.pre_order_dir = unpacker.GetInt("pre_order_dir");
            info.pre_order_type = unpacker.GetInt("pre_order_type");
            info.pre_order_price = unpacker.GetDouble("pre_order_price");
            info.pre_order_qty = unpacker.GetDouble("pre_order_qty");
            info.pre_order_status = unpacker.GetStr("pre_order_status");
            info.pre_price_type = unpacker.GetInt("pre_price_type");
            info.price_offset = unpacker.GetDouble("price_offset");
            info.pre_begin_date = unpacker.GetInt("pre_begin_date");
            info.pre_end_date = unpacker.GetInt("pre_end_date");
            info.pre_begin_time = unpacker.GetInt("pre_begin_time");
            info.pre_end_time = unpacker.GetInt("pre_end_time");
            info.trig_type = unpacker.GetInt("trig_type");
            info.trig_price = unpacker.GetDouble("trig_price");
            info.trig_date = unpacker.GetInt("trig_date");
            info.trig_time = unpacker.GetInt("trig_time");
            info.is_trace = unpacker.GetInt("is_trace");
            info.price_up = unpacker.GetDouble("price_up");
            info.keep_trace = unpacker.GetInt("keep_trace");
            info.order_no_str = unpacker.GetStr("order_no_str");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_4_105_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_105_InfoList.Add((tdsecuL_4_105_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询预埋订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_105_Info();
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
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.pre_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_ID_INT64);
                    info.pre_order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_DATE_INT);
                    info.pre_order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_TIME_INT);
                    info.pre_order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_DIR_INT);
                    info.pre_order_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_TYPE_INT);
                    info.pre_order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_PRICE_FLOAT);
                    info.pre_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_QTY_FLOAT);
                    info.pre_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_STATUS_STR);
                    info.pre_price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_PRICE_TYPE_INT);
                    info.price_offset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_OFFSET_FLOAT);
                    info.pre_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_BEGIN_DATE_INT);
                    info.pre_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_END_DATE_INT);
                    info.pre_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_BEGIN_TIME_INT);
                    info.pre_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_END_TIME_INT);
                    info.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    info.trig_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_PRICE_FLOAT);
                    info.trig_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_DATE_INT);
                    info.trig_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TIME_INT);
                    info.is_trace = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRACE_INT);
                    info.price_up = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_UP_FLOAT);
                    info.keep_trace = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_KEEP_TRACE_INT);
                    info.order_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_STR_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_4_105_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_106_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_106_Response()
        {
            this.tdsecuL_4_106_InfoList = new ObservableCollection<tdsecuL_4_106_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_106_Info> tdsecuL_4_106_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_106_Info info = new tdsecuL_4_106_Info();
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
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.modi_order_date = unpacker.GetInt("modi_order_date");
            info.modi_order_time = unpacker.GetInt("modi_order_time");
            info.modi_batch_no = unpacker.GetInt("modi_batch_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.price_type = unpacker.GetInt("price_type");
            info.modi_order_price = unpacker.GetDouble("modi_order_price");
            info.modi_order_qty = unpacker.GetDouble("modi_order_qty");
            info.modi_order_status = unpacker.GetStr("modi_order_status");
            info.modi_price_type = unpacker.GetInt("modi_price_type");
            info.new_order_id = unpacker.GetInt64("new_order_id");
            info.remark_info = unpacker.GetStr("remark_info");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_4_106_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_106_InfoList.Add((tdsecuL_4_106_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询改单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_106_Info();
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
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.modi_order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_DATE_INT);
                    info.modi_order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_TIME_INT);
                    info.modi_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_BATCH_NO_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    info.modi_order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_PRICE_FLOAT);
                    info.modi_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_QTY_FLOAT);
                    info.modi_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_STATUS_STR);
                    info.modi_price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_PRICE_TYPE_INT);
                    info.new_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_NEW_ORDER_ID_INT64);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_4_106_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_107_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_107_Response()
        {
            this.tdsecuL_4_107_InfoList = new ObservableCollection<tdsecuL_4_107_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_107_Info> tdsecuL_4_107_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_107_Info info = new tdsecuL_4_107_Info();
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
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.stock_type = unpacker.GetInt("stock_type");
            info.asset_type = unpacker.GetInt("asset_type");
            info.modi_order_date = unpacker.GetInt("modi_order_date");
            info.modi_order_time = unpacker.GetInt("modi_order_time");
            info.modi_batch_no = unpacker.GetInt("modi_batch_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.price_type = unpacker.GetInt("price_type");
            info.modi_order_price = unpacker.GetDouble("modi_order_price");
            info.modi_order_qty = unpacker.GetDouble("modi_order_qty");
            info.modi_order_status = unpacker.GetStr("modi_order_status");
            info.modi_price_type = unpacker.GetInt("modi_price_type");
            info.new_order_id = unpacker.GetInt64("new_order_id");
            info.remark_info = unpacker.GetStr("remark_info");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_4_107_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_107_InfoList.Add((tdsecuL_4_107_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询改单历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_107_Info();
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
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.modi_order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_DATE_INT);
                    info.modi_order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_TIME_INT);
                    info.modi_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_BATCH_NO_INT);
                    info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    info.modi_order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_PRICE_FLOAT);
                    info.modi_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_QTY_FLOAT);
                    info.modi_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_STATUS_STR);
                    info.modi_price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_PRICE_TYPE_INT);
                    info.new_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_NEW_ORDER_ID_INT64);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_4_107_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_108_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_108_Response()
        {
            this.tdsecuL_4_108_InfoList = new ObservableCollection<tdsecuL_4_108_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_108_Info> tdsecuL_4_108_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_108_Info info = new tdsecuL_4_108_Info();
            info.stock_code = unpacker.GetStr("stock_code");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            tdsecuL_4_108_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_108_InfoList.Add((tdsecuL_4_108_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询未成交代码列表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_108_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    tdsecuL_4_108_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_109_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_109_Response()
        {
            this.tdsecuL_4_109_InfoList = new ObservableCollection<tdsecuL_4_109_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_109_Info> tdsecuL_4_109_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_109_Info info = new tdsecuL_4_109_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.offer_oper_way = unpacker.GetStr("offer_oper_way");
            tdsecuL_4_109_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_109_InfoList.Add((tdsecuL_4_109_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_证券行情检查账户成交
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_109_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.offer_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_OPER_WAY_STR);
                    tdsecuL_4_109_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_110_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_110_Response()
        {
            this.tdsecuL_4_110_InfoList = new ObservableCollection<tdsecuL_4_110_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_110_Info> tdsecuL_4_110_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_110_Info info = new tdsecuL_4_110_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.stock_type = unpacker.GetInt("stock_type");
            info.external_no = unpacker.GetInt64("external_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_price = unpacker.GetDouble("order_price");
            info.order_sum_status = unpacker.GetStr("order_sum_status");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.waste_qty = unpacker.GetDouble("waste_qty");
            info.strike_amt = unpacker.GetDouble("strike_amt");
            info.strike_qty = unpacker.GetDouble("strike_qty");
            info.all_fee = unpacker.GetDouble("all_fee");
            info.trade_commis = unpacker.GetDouble("trade_commis");
            info.stamp_tax = unpacker.GetDouble("stamp_tax");
            info.trans_fee = unpacker.GetDouble("trans_fee");
            info.brkage_fee = unpacker.GetDouble("brkage_fee");
            info.SEC_charges = unpacker.GetDouble("SEC_charges");
            info.other_fee = unpacker.GetDouble("other_fee");
            info.other_commis = unpacker.GetDouble("other_commis");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.intrst_days = unpacker.GetInt("intrst_days");
            info.par_value = unpacker.GetDouble("par_value");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.bond_rate_type = unpacker.GetInt("bond_rate_type");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.exter_comm_flag = unpacker.GetInt("exter_comm_flag");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_4_110_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_110_InfoList.Add((tdsecuL_4_110_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询订单汇总历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_110_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    info.order_sum_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SUM_STATUS_STR);
                    info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    info.waste_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_QTY_FLOAT);
                    info.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    info.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    info.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    info.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    info.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    info.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    info.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    info.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    info.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    info.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    info.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_4_110_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_111_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_111_Response()
        {
            this.tdsecuL_4_111_InfoList = new ObservableCollection<tdsecuL_4_111_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_111_Info> tdsecuL_4_111_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_111_Info info = new tdsecuL_4_111_Info();
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
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_dir = unpacker.GetInt("order_dir");
            info.price_type = unpacker.GetInt("price_type");
            info.exec_price_type = unpacker.GetInt("exec_price_type");
            info.price_offset = unpacker.GetDouble("price_offset");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.pend_order_status = unpacker.GetStr("pend_order_status");
            info.remark_info = unpacker.GetStr("remark_info");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_times = unpacker.GetInt("update_times");
            info.external_no = unpacker.GetInt64("external_no");
            tdsecuL_4_111_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_111_InfoList.Add((tdsecuL_4_111_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询待执行订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_111_Info();
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
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    info.exec_price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_TYPE_INT);
                    info.price_offset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_OFFSET_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.pend_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PEND_ORDER_STATUS_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    tdsecuL_4_111_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_112_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_112_Response()
        {
            this.tdsecuL_4_112_InfoList = new ObservableCollection<tdsecuL_4_112_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_112_Info> tdsecuL_4_112_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_112_Info info = new tdsecuL_4_112_Info();
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
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.asset_type = unpacker.GetInt("asset_type");
            info.stock_type = unpacker.GetInt("stock_type");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.comm_batch_no = unpacker.GetInt("comm_batch_no");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_dir = unpacker.GetInt("order_dir");
            info.price_type = unpacker.GetInt("price_type");
            info.exec_price_type = unpacker.GetInt("exec_price_type");
            info.price_offset = unpacker.GetDouble("price_offset");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.bond_accr_intrst = unpacker.GetDouble("bond_accr_intrst");
            info.net_price_flag = unpacker.GetInt("net_price_flag");
            info.order_oper_way = unpacker.GetStr("order_oper_way");
            info.pend_order_status = unpacker.GetStr("pend_order_status");
            info.remark_info = unpacker.GetStr("remark_info");
            info.create_date = unpacker.GetInt("create_date");
            info.create_time = unpacker.GetInt("create_time");
            info.update_times = unpacker.GetInt("update_times");
            info.external_no = unpacker.GetInt64("external_no");
            tdsecuL_4_112_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_112_InfoList.Add((tdsecuL_4_112_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询待执行订单历史
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_112_Info();
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
                    info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    info.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    info.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    info.exec_price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_TYPE_INT);
                    info.price_offset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_OFFSET_FLOAT);
                    info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    info.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    info.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    info.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    info.pend_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PEND_ORDER_STATUS_STR);
                    info.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    info.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    info.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    tdsecuL_4_112_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_113_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_113_Response()
        {
            this.tdsecuL_4_113_InfoList = new ObservableCollection<tdsecuL_4_113_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_113_Info> tdsecuL_4_113_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_113_Info info = new tdsecuL_4_113_Info();
            info.order_count = unpacker.GetInt("order_count");
            tdsecuL_4_113_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_113_InfoList.Add((tdsecuL_4_113_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询订单记录数
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_113_Info();
                info.order_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_COUNT_INT);
                tdsecuL_4_113_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_114_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_114_Response()
        {
            this.tdsecuL_4_114_InfoList = new ObservableCollection<tdsecuL_4_114_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_114_Info> tdsecuL_4_114_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_114_Info info = new tdsecuL_4_114_Info();
            info.record_count = unpacker.GetInt("record_count");
            tdsecuL_4_114_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_114_InfoList.Add((tdsecuL_4_114_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询交易组订单记录数
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_114_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                tdsecuL_4_114_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_115_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_115_Response()
        {
            this.tdsecuL_4_115_InfoList = new ObservableCollection<tdsecuL_4_115_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_115_Info> tdsecuL_4_115_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_115_Info info = new tdsecuL_4_115_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.stock_type = unpacker.GetInt("stock_type");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_price = unpacker.GetDouble("order_price");
            info.price_type = unpacker.GetInt("price_type");
            info.order_status = unpacker.GetStr("order_status");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            tdsecuL_4_115_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_115_InfoList.Add((tdsecuL_4_115_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_新增订单1
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_115_Info();
                info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                tdsecuL_4_115_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_120_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_120_Response()
        {
            this.tdsecuL_4_120_InfoList = new ObservableCollection<tdsecuL_4_120_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_120_Info> tdsecuL_4_120_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_120_Info info = new tdsecuL_4_120_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.combo_code = unpacker.GetStr("combo_code");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.combo_copies = unpacker.GetDouble("combo_copies");
            info.combo_date = unpacker.GetInt("combo_date");
            info.combo_time = unpacker.GetInt("combo_time");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_4_120_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_120_InfoList.Add((tdsecuL_4_120_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询组合交易流水记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_120_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.combo_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT);
                    info.combo_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_DATE_INT);
                    info.combo_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_TIME_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_4_120_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_121_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_121_Response()
        {
            this.tdsecuL_4_121_InfoList = new ObservableCollection<tdsecuL_4_121_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_121_Info> tdsecuL_4_121_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_121_Info info = new tdsecuL_4_121_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.init_date = unpacker.GetInt("init_date");
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.combo_code = unpacker.GetStr("combo_code");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.combo_copies = unpacker.GetDouble("combo_copies");
            info.combo_date = unpacker.GetInt("combo_date");
            info.combo_time = unpacker.GetInt("combo_time");
            info.update_times = unpacker.GetInt("update_times");
            tdsecuL_4_121_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_121_InfoList.Add((tdsecuL_4_121_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询历史组合交易流水记录
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_121_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    info.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    info.combo_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT);
                    info.combo_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_DATE_INT);
                    info.combo_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_TIME_INT);
                    info.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    tdsecuL_4_121_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_122_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_122_Response()
        {
            this.tdsecuL_4_122_InfoList = new ObservableCollection<tdsecuL_4_122_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_122_Info> tdsecuL_4_122_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_122_Info info = new tdsecuL_4_122_Info();
            info.pd_no = unpacker.GetInt("pd_no");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_status = unpacker.GetStr("order_status");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.oper_statn = unpacker.GetStr("oper_statn");
            tdsecuL_4_122_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_122_InfoList.Add((tdsecuL_4_122_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_导入订单表
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_122_Info();
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                info.oper_statn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_STATN_STR);
                tdsecuL_4_122_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_123_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_123_Response()
        {
            this.tdsecuL_4_123_InfoList = new ObservableCollection<tdsecuL_4_123_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_123_Info> tdsecuL_4_123_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_123_Info info = new tdsecuL_4_123_Info();
            info.record_count = unpacker.GetInt("record_count");
            tdsecuL_4_123_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_123_InfoList.Add((tdsecuL_4_123_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询资产账户订单记录数
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_123_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                tdsecuL_4_123_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_124_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_124_Response()
        {
            this.tdsecuL_4_124_InfoList = new ObservableCollection<tdsecuL_4_124_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_124_Info> tdsecuL_4_124_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_124_Info info = new tdsecuL_4_124_Info();
            info.record_count = unpacker.GetInt("record_count");
            tdsecuL_4_124_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_124_InfoList.Add((tdsecuL_4_124_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询产品订单记录数
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_124_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                tdsecuL_4_124_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_125_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_125_Response()
        {
            this.tdsecuL_4_125_InfoList = new ObservableCollection<tdsecuL_4_125_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_125_Info> tdsecuL_4_125_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_125_Info info = new tdsecuL_4_125_Info();
            info.record_count = unpacker.GetInt("record_count");
            tdsecuL_4_125_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_125_InfoList.Add((tdsecuL_4_125_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询资产账户下交易组订单记录数
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_125_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                tdsecuL_4_125_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_126_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_126_Response()
        {
            this.tdsecuL_4_126_InfoList = new ObservableCollection<tdsecuL_4_126_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_126_Info> tdsecuL_4_126_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_126_Info info = new tdsecuL_4_126_Info();
            tdsecuL_4_126_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_126_InfoList.Add((tdsecuL_4_126_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_新增交易时间配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_126_Info();
                tdsecuL_4_126_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_127_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_127_Response()
        {
            this.tdsecuL_4_127_InfoList = new ObservableCollection<tdsecuL_4_127_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_127_Info> tdsecuL_4_127_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_127_Info info = new tdsecuL_4_127_Info();
            tdsecuL_4_127_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_127_InfoList.Add((tdsecuL_4_127_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_删除交易时间配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_127_Info();
                tdsecuL_4_127_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_128_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_128_Response()
        {
            this.tdsecuL_4_128_InfoList = new ObservableCollection<tdsecuL_4_128_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_128_Info> tdsecuL_4_128_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_128_Info info = new tdsecuL_4_128_Info();
            info.row_id = unpacker.GetInt64("row_id");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_no = unpacker.GetInt("exch_no");
            info.am_trd_begin_time = unpacker.GetInt("am_trd_begin_time");
            info.am_trd_end_time = unpacker.GetInt("am_trd_end_time");
            info.pm_trd_begin_time = unpacker.GetInt("pm_trd_begin_time");
            info.pm_trd_end_time = unpacker.GetInt("pm_trd_end_time");
            tdsecuL_4_128_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_128_InfoList.Add((tdsecuL_4_128_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询交易时间配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var info = new tdsecuL_4_128_Info();
                    var lpRecord =lpGroup.GetRecord(i);
                    info.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    info.am_trd_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AM_TRD_BEGIN_TIME_INT);
                    info.am_trd_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AM_TRD_END_TIME_INT);
                    info.pm_trd_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PM_TRD_BEGIN_TIME_INT);
                    info.pm_trd_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PM_TRD_END_TIME_INT);
                    tdsecuL_4_128_InfoList.Add(info);
                }
            }
        }
    }

    public class tdsecuL_4_129_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_129_Response()
        {
            this.tdsecuL_4_129_InfoList = new ObservableCollection<tdsecuL_4_129_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_129_Info> tdsecuL_4_129_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_129_Info info = new tdsecuL_4_129_Info();
            info.record_count = unpacker.GetInt("record_count");
            tdsecuL_4_129_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_129_InfoList.Add((tdsecuL_4_129_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询股东代码订单记录数
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_129_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                tdsecuL_4_129_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_130_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_130_Response()
        {
            this.tdsecuL_4_130_InfoList = new ObservableCollection<tdsecuL_4_130_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_130_Info> tdsecuL_4_130_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_130_Info info = new tdsecuL_4_130_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.stock_type = unpacker.GetInt("stock_type");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_price = unpacker.GetDouble("order_price");
            info.price_type = unpacker.GetInt("price_type");
            info.order_status = unpacker.GetStr("order_status");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            tdsecuL_4_130_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_130_InfoList.Add((tdsecuL_4_130_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_融资融券新增订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_130_Info();
                info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                tdsecuL_4_130_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_131_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_131_Response()
        {
            this.tdsecuL_4_131_InfoList = new ObservableCollection<tdsecuL_4_131_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_131_Info> tdsecuL_4_131_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_131_Info info = new tdsecuL_4_131_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.report_no = unpacker.GetStr("report_no");
            info.external_no = unpacker.GetInt64("external_no");
            info.order_status = unpacker.GetStr("order_status");
            info.wtdraw_id = unpacker.GetInt64("wtdraw_id");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.wtdraw_status = unpacker.GetStr("wtdraw_status");
            info.order_id = unpacker.GetInt64("order_id");
            tdsecuL_4_131_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_131_InfoList.Add((tdsecuL_4_131_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_融资融券撤销订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_131_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                info.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                tdsecuL_4_131_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_132_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_132_Response()
        {
            this.tdsecuL_4_132_InfoList = new ObservableCollection<tdsecuL_4_132_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_132_Info> tdsecuL_4_132_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_132_Info info = new tdsecuL_4_132_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.stock_type = unpacker.GetInt("stock_type");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_price = unpacker.GetDouble("order_price");
            info.price_type = unpacker.GetInt("price_type");
            info.order_status = unpacker.GetStr("order_status");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            tdsecuL_4_132_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_132_InfoList.Add((tdsecuL_4_132_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_插件新增订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_132_Info();
                info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                tdsecuL_4_132_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_133_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_133_Response()
        {
            this.tdsecuL_4_133_InfoList = new ObservableCollection<tdsecuL_4_133_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_133_Info> tdsecuL_4_133_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_133_Info info = new tdsecuL_4_133_Info();
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco = unpacker.GetStr("stock_acco");
            info.stock_code = unpacker.GetStr("stock_code");
            info.report_no = unpacker.GetStr("report_no");
            info.external_no = unpacker.GetInt64("external_no");
            info.order_status = unpacker.GetStr("order_status");
            info.wtdraw_id = unpacker.GetInt64("wtdraw_id");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.wtdraw_status = unpacker.GetStr("wtdraw_status");
            info.order_id = unpacker.GetInt64("order_id");
            tdsecuL_4_133_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_133_InfoList.Add((tdsecuL_4_133_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_插件撤销订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_133_Info();
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                info.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                tdsecuL_4_133_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_134_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_134_Response()
        {
            this.tdsecuL_4_134_InfoList = new ObservableCollection<tdsecuL_4_134_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_134_Info> tdsecuL_4_134_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_134_Info info = new tdsecuL_4_134_Info();
            info.co_no = unpacker.GetInt("co_no");
            info.pd_no = unpacker.GetInt("pd_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_acco_no = unpacker.GetInt("stock_acco_no");
            info.stock_code_no = unpacker.GetInt("stock_code_no");
            info.report_no = unpacker.GetStr("report_no");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.modi_order_id = unpacker.GetInt64("modi_order_id");
            info.new_order_id = unpacker.GetInt64("new_order_id");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_price = unpacker.GetDouble("order_price");
            info.wtdraw_id = unpacker.GetInt64("wtdraw_id");
            info.wtdraw_qty = unpacker.GetDouble("wtdraw_qty");
            info.wtdraw_status = unpacker.GetStr("wtdraw_status");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            info.old_order_status = unpacker.GetStr("old_order_status");
            info.new_order_status = unpacker.GetStr("new_order_status");
            tdsecuL_4_134_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_134_InfoList.Add((tdsecuL_4_134_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_插件新增改单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_134_Info();
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                info.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                info.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                info.modi_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_ID_INT64);
                info.new_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_NEW_ORDER_ID_INT64);
                info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                info.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                info.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                info.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                info.old_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OLD_ORDER_STATUS_STR);
                info.new_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NEW_ORDER_STATUS_STR);
                tdsecuL_4_134_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_135_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_135_Response()
        {
            this.tdsecuL_4_135_InfoList = new ObservableCollection<tdsecuL_4_135_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_135_Info> tdsecuL_4_135_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_135_Info info = new tdsecuL_4_135_Info();
            tdsecuL_4_135_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_135_InfoList.Add((tdsecuL_4_135_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_插件修改预埋订单状态
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_135_Info();
                tdsecuL_4_135_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_136_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_136_Response()
        {
            this.tdsecuL_4_136_InfoList = new ObservableCollection<tdsecuL_4_136_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_136_Info> tdsecuL_4_136_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_136_Info info = new tdsecuL_4_136_Info();
            tdsecuL_4_136_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_136_InfoList.Add((tdsecuL_4_136_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_修改交易时间配置
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_136_Info();
                tdsecuL_4_136_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_137_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_137_Response()
        {
            this.tdsecuL_4_137_InfoList = new ObservableCollection<tdsecuL_4_137_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_137_Info> tdsecuL_4_137_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_137_Info info = new tdsecuL_4_137_Info();
            tdsecuL_4_137_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_137_InfoList.Add((tdsecuL_4_137_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_插件修改预埋订单信息
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_137_Info();
                tdsecuL_4_137_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_138_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_138_Response()
        {
            this.tdsecuL_4_138_InfoList = new ObservableCollection<tdsecuL_4_138_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_138_Info> tdsecuL_4_138_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_138_Info info = new tdsecuL_4_138_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.co_no = unpacker.GetInt("co_no");
            info.exch_group_no = unpacker.GetInt("exch_group_no");
            info.asset_acco_no = unpacker.GetInt("asset_acco_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.exch_no = unpacker.GetInt("exch_no");
            info.stock_code = unpacker.GetStr("stock_code");
            info.comm_id = unpacker.GetInt64("comm_id");
            info.stock_type = unpacker.GetInt("stock_type");
            info.order_date = unpacker.GetInt("order_date");
            info.order_time = unpacker.GetInt("order_time");
            info.order_id = unpacker.GetInt64("order_id");
            info.order_batch_no = unpacker.GetInt("order_batch_no");
            info.order_dir = unpacker.GetInt("order_dir");
            info.order_qty = unpacker.GetDouble("order_qty");
            info.order_price = unpacker.GetDouble("order_price");
            info.price_type = unpacker.GetInt("price_type");
            info.order_status = unpacker.GetStr("order_status");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            tdsecuL_4_138_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_138_InfoList.Add((tdsecuL_4_138_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_新增组合策略订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_138_Info();
                info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                info.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                info.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                info.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                info.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                info.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                info.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                info.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                info.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                info.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                info.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                info.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                info.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                tdsecuL_4_138_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_4_139_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_4_139_Response()
        {
            this.tdsecuL_4_139_InfoList = new ObservableCollection<tdsecuL_4_139_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_4_139_Info> tdsecuL_4_139_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_4_139_Info info = new tdsecuL_4_139_Info();
            info.record_count = unpacker.GetInt("record_count");
            tdsecuL_4_139_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_4_139_InfoList.Add((tdsecuL_4_139_Info)info);
        }
        #endregion

        //逻辑_交易证券_交易_查询交易组在途业务
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_4_139_Info();
                info.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                tdsecuL_4_139_InfoList.Add(info);
            }
        }
    }

}
