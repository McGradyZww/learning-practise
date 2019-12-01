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
    public class tdsecuL_7_1_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_7_1_Response()
        {
            this.tdsecuL_7_1_InfoList = new ObservableCollection<tdsecuL_7_1_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_7_1_Info> tdsecuL_7_1_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_7_1_Info info = new tdsecuL_7_1_Info();
            tdsecuL_7_1_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_7_1_InfoList.Add((tdsecuL_7_1_Info)info);
        }
        #endregion

        //逻辑_交易证券_中泰_撤销指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_7_1_Info();
                tdsecuL_7_1_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_7_2_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_7_2_Response()
        {
            this.tdsecuL_7_2_InfoList = new ObservableCollection<tdsecuL_7_2_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_7_2_Info> tdsecuL_7_2_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_7_2_Info info = new tdsecuL_7_2_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_statn = unpacker.GetStr("oper_statn");
            info.co_no = unpacker.GetInt("co_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id_str = unpacker.GetStr("order_id_str");
            info.order_status_str = unpacker.GetStr("order_status_str");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            tdsecuL_7_2_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_7_2_InfoList.Add((tdsecuL_7_2_Info)info);
        }
        #endregion

        //逻辑_交易证券_中泰_新增组合指令
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_7_2_Info();
                info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                info.oper_statn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_STATN_STR);
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                info.order_id_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_STR_STR);
                info.order_status_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR_STR);
                info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                tdsecuL_7_2_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_7_3_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_7_3_Response()
        {
            this.tdsecuL_7_3_InfoList = new ObservableCollection<tdsecuL_7_3_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_7_3_Info> tdsecuL_7_3_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_7_3_Info info = new tdsecuL_7_3_Info();
            info.opor_no = unpacker.GetInt("opor_no");
            info.oper_statn = unpacker.GetStr("oper_statn");
            info.co_no = unpacker.GetInt("co_no");
            info.pass_no = unpacker.GetInt("pass_no");
            info.out_acco = unpacker.GetStr("out_acco");
            info.order_date = unpacker.GetInt("order_date");
            info.order_id_str = unpacker.GetStr("order_id_str");
            info.order_status_str = unpacker.GetStr("order_status_str");
            info.compli_trig_id = unpacker.GetInt64("compli_trig_id");
            tdsecuL_7_3_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_7_3_InfoList.Add((tdsecuL_7_3_Info)info);
        }
        #endregion

        //逻辑_交易证券_中泰_新增组合订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_7_3_Info();
                info.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                info.oper_statn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_STATN_STR);
                info.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                info.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                info.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                info.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                info.order_id_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_STR_STR);
                info.order_status_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR_STR);
                info.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                tdsecuL_7_3_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_7_4_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_7_4_Response()
        {
            this.tdsecuL_7_4_InfoList = new ObservableCollection<tdsecuL_7_4_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_7_4_Info> tdsecuL_7_4_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_7_4_Info info = new tdsecuL_7_4_Info();
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
            tdsecuL_7_4_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_7_4_InfoList.Add((tdsecuL_7_4_Info)info);
        }
        #endregion

        //逻辑_交易证券_中泰_撤销订单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_7_4_Info();
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
                tdsecuL_7_4_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_7_5_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_7_5_Response()
        {
            this.tdsecuL_7_5_InfoList = new ObservableCollection<tdsecuL_7_5_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_7_5_Info> tdsecuL_7_5_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_7_5_Info info = new tdsecuL_7_5_Info();
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
            tdsecuL_7_5_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_7_5_InfoList.Add((tdsecuL_7_5_Info)info);
        }
        #endregion

        //逻辑_交易证券_中泰_新增改单
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_7_5_Info();
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
                tdsecuL_7_5_InfoList.Add(info);
            }
        }
    }

    public class tdsecuL_7_6_Response : IResponse
    {
        #region 构造函数
        public tdsecuL_7_6_Response()
        {
            this.tdsecuL_7_6_InfoList = new ObservableCollection<tdsecuL_7_6_Info>();
        }
        #endregion

        #region 公共属性
        public ObservableCollection<tdsecuL_7_6_Info> tdsecuL_7_6_InfoList { get; set; }
        #endregion

        #region IResponse 成员
        public void Parser(ILdUnPacker unpacker)
        {
            tdsecuL_7_6_Info info = new tdsecuL_7_6_Info();
            tdsecuL_7_6_InfoList.Add(info);
        }

        public void Parser(object info)
        {
            tdsecuL_7_6_InfoList.Add((tdsecuL_7_6_Info)info);
        }
        #endregion

        //逻辑_交易证券_中泰_指令有效期处理
        public void Parser(LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var info = new tdsecuL_7_6_Info();
                tdsecuL_7_6_InfoList.Add(info);
            }
        }
    }

}
