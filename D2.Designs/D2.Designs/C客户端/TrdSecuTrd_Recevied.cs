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

    public static class TrdSecuTrd
    {
        //逻辑_交易证券_交易_新增订单
        public static List<FunctdsecuL_4_11Model> GetFunctdsecuL_4_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_11Models = new List<FunctdsecuL_4_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_11Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
 
                FunctdsecuL_4_11Models.Add(reqCommand);
            }
            return FunctdsecuL_4_11Models;
        }
 
        //逻辑_交易证券_交易_新增订单
        public static List<FunctdsecuL_4_11Model> GetFunctdsecuL_4_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_11Models = new List<FunctdsecuL_4_11Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_11Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                FunctdsecuL_4_11Models.Add(reqCommand);
            }
            return FunctdsecuL_4_11Models;
        }
 
        //逻辑_交易证券_交易_撤销订单
        public static List<FunctdsecuL_4_12Model> GetFunctdsecuL_4_12Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_12Models = new List<FunctdsecuL_4_12Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_12Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.wtdraw_id = packer.GetInt64byName("wtdraw_id", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.wtdraw_status = packer.GetStrbyName("wtdraw_status", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
 
                FunctdsecuL_4_12Models.Add(reqCommand);
            }
            return FunctdsecuL_4_12Models;
        }
 
        //逻辑_交易证券_交易_撤销订单
        public static List<FunctdsecuL_4_12Model> GetFunctdsecuL_4_12Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_12Models = new List<FunctdsecuL_4_12Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_12Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                reqCommand.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                FunctdsecuL_4_12Models.Add(reqCommand);
            }
            return FunctdsecuL_4_12Models;
        }
 
        //逻辑_交易证券_交易_新增改单
        public static List<FunctdsecuL_4_14Model> GetFunctdsecuL_4_14Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_14Models = new List<FunctdsecuL_4_14Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_14Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.modi_order_id = packer.GetInt64byName("modi_order_id", i);
                reqCommand.new_order_id = packer.GetInt64byName("new_order_id", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.wtdraw_id = packer.GetInt64byName("wtdraw_id", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.wtdraw_status = packer.GetStrbyName("wtdraw_status", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
                reqCommand.old_order_status = packer.GetStrbyName("old_order_status", i);
                reqCommand.new_order_status = packer.GetStrbyName("new_order_status", i);
 
                FunctdsecuL_4_14Models.Add(reqCommand);
            }
            return FunctdsecuL_4_14Models;
        }
 
        //逻辑_交易证券_交易_新增改单
        public static List<FunctdsecuL_4_14Model> GetFunctdsecuL_4_14Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_14Models = new List<FunctdsecuL_4_14Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_14Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                reqCommand.modi_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_ID_INT64);
                reqCommand.new_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_NEW_ORDER_ID_INT64);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                reqCommand.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                reqCommand.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                reqCommand.old_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OLD_ORDER_STATUS_STR);
                reqCommand.new_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NEW_ORDER_STATUS_STR);
                FunctdsecuL_4_14Models.Add(reqCommand);
            }
            return FunctdsecuL_4_14Models;
        }
 
        //逻辑_交易证券_交易_新增篮子批量订单
        public static List<FunctdsecuL_4_15Model> GetFunctdsecuL_4_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_15Models = new List<FunctdsecuL_4_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_15Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_statn = packer.GetStrbyName("oper_statn", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_id_str = packer.GetStrbyName("order_id_str", i);
                reqCommand.order_status_str = packer.GetStrbyName("order_status_str", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
 
                FunctdsecuL_4_15Models.Add(reqCommand);
            }
            return FunctdsecuL_4_15Models;
        }
 
        //逻辑_交易证券_交易_新增篮子批量订单
        public static List<FunctdsecuL_4_15Model> GetFunctdsecuL_4_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_15Models = new List<FunctdsecuL_4_15Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_15Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                reqCommand.oper_statn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_STATN_STR);
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                reqCommand.order_id_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_STR_STR);
                reqCommand.order_status_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR_STR);
                reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                FunctdsecuL_4_15Models.Add(reqCommand);
            }
            return FunctdsecuL_4_15Models;
        }
 
        //逻辑_交易证券_交易_新增待执行订单
        public static List<FunctdsecuL_4_16Model> GetFunctdsecuL_4_16Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_16Models = new List<FunctdsecuL_4_16Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_16Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.pend_order_id = packer.GetInt64byName("pend_order_id", i);
 
                FunctdsecuL_4_16Models.Add(reqCommand);
            }
            return FunctdsecuL_4_16Models;
        }
 
        //逻辑_交易证券_交易_新增待执行订单
        public static List<FunctdsecuL_4_16Model> GetFunctdsecuL_4_16Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_16Models = new List<FunctdsecuL_4_16Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_16Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                reqCommand.pend_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PEND_ORDER_ID_INT64);
                FunctdsecuL_4_16Models.Add(reqCommand);
            }
            return FunctdsecuL_4_16Models;
        }
 
        //逻辑_交易证券_交易_查询报盘订单
        public static List<FunctdsecuL_4_21Model> GetFunctdsecuL_4_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_21Models = new List<FunctdsecuL_4_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_21Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
 
                FunctdsecuL_4_21Models.Add(reqCommand);
            }
            return FunctdsecuL_4_21Models;
        }
 
        //逻辑_交易证券_交易_查询报盘订单
        public static List<FunctdsecuL_4_21Model> GetFunctdsecuL_4_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_21Models = new List<FunctdsecuL_4_21Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_21Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    FunctdsecuL_4_21Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_21Models;
        }
 
        //逻辑_交易证券_交易_查询报盘撤单
        public static List<FunctdsecuL_4_22Model> GetFunctdsecuL_4_22Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_22Models = new List<FunctdsecuL_4_22Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_22Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.wtdraw_id = packer.GetInt64byName("wtdraw_id", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.wtdraw_status = packer.GetStrbyName("wtdraw_status", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
 
                FunctdsecuL_4_22Models.Add(reqCommand);
            }
            return FunctdsecuL_4_22Models;
        }
 
        //逻辑_交易证券_交易_查询报盘撤单
        public static List<FunctdsecuL_4_22Model> GetFunctdsecuL_4_22Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_22Models = new List<FunctdsecuL_4_22Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_22Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    FunctdsecuL_4_22Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_22Models;
        }
 
        //逻辑_交易证券_交易_更新订单状态
        public static List<FunctdsecuL_4_23Model> GetFunctdsecuL_4_23Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_23Models = new List<FunctdsecuL_4_23Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_23Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
 
                FunctdsecuL_4_23Models.Add(reqCommand);
            }
            return FunctdsecuL_4_23Models;
        }
 
        //逻辑_交易证券_交易_更新订单状态
        public static List<FunctdsecuL_4_23Model> GetFunctdsecuL_4_23Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_23Models = new List<FunctdsecuL_4_23Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_23Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                FunctdsecuL_4_23Models.Add(reqCommand);
            }
            return FunctdsecuL_4_23Models;
        }
 
        //逻辑_交易证券_交易_处理异常撤单
        public static List<FunctdsecuL_4_31Model> GetFunctdsecuL_4_31Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_31Models = new List<FunctdsecuL_4_31Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_31Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.wtdraw_id = packer.GetInt64byName("wtdraw_id", i);
                reqCommand.wtdraw_status = packer.GetStrbyName("wtdraw_status", i);
 
                FunctdsecuL_4_31Models.Add(reqCommand);
            }
            return FunctdsecuL_4_31Models;
        }
 
        //逻辑_交易证券_交易_处理异常撤单
        public static List<FunctdsecuL_4_31Model> GetFunctdsecuL_4_31Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_31Models = new List<FunctdsecuL_4_31Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_31Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                reqCommand.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                FunctdsecuL_4_31Models.Add(reqCommand);
            }
            return FunctdsecuL_4_31Models;
        }
 
        //逻辑_交易证券_交易_手工补单
        public static List<FunctdsecuL_4_32Model> GetFunctdsecuL_4_32Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_32Models = new List<FunctdsecuL_4_32Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_32Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
 
                FunctdsecuL_4_32Models.Add(reqCommand);
            }
            return FunctdsecuL_4_32Models;
        }
 
        //逻辑_交易证券_交易_手工补单
        public static List<FunctdsecuL_4_32Model> GetFunctdsecuL_4_32Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_32Models = new List<FunctdsecuL_4_32Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_32Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                FunctdsecuL_4_32Models.Add(reqCommand);
            }
            return FunctdsecuL_4_32Models;
        }
 
        //逻辑_交易证券_交易_导入订单补单
        public static List<FunctdsecuL_4_33Model> GetFunctdsecuL_4_33Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_33Models = new List<FunctdsecuL_4_33Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_33Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.oper_statn = packer.GetStrbyName("oper_statn", i);
 
                FunctdsecuL_4_33Models.Add(reqCommand);
            }
            return FunctdsecuL_4_33Models;
        }
 
        //逻辑_交易证券_交易_导入订单补单
        public static List<FunctdsecuL_4_33Model> GetFunctdsecuL_4_33Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_33Models = new List<FunctdsecuL_4_33Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_33Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                reqCommand.oper_statn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_STATN_STR);
                FunctdsecuL_4_33Models.Add(reqCommand);
            }
            return FunctdsecuL_4_33Models;
        }
 
        //逻辑_交易证券_交易_新增篮子订单
        public static List<FunctdsecuL_4_41Model> GetFunctdsecuL_4_41Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_41Models = new List<FunctdsecuL_4_41Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_41Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
 
                FunctdsecuL_4_41Models.Add(reqCommand);
            }
            return FunctdsecuL_4_41Models;
        }
 
        //逻辑_交易证券_交易_新增篮子订单
        public static List<FunctdsecuL_4_41Model> GetFunctdsecuL_4_41Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_41Models = new List<FunctdsecuL_4_41Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_41Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                FunctdsecuL_4_41Models.Add(reqCommand);
            }
            return FunctdsecuL_4_41Models;
        }
 
        //逻辑_交易证券_交易_新增预埋订单
        public static List<FunctdsecuL_4_42Model> GetFunctdsecuL_4_42Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_42Models = new List<FunctdsecuL_4_42Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_42Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pre_order_id = packer.GetInt64byName("pre_order_id", i);
                reqCommand.pre_order_date = packer.GetIntbyName("pre_order_date", i);
                reqCommand.pre_order_time = packer.GetIntbyName("pre_order_time", i);
                reqCommand.pre_order_status = packer.GetStrbyName("pre_order_status", i);
 
                FunctdsecuL_4_42Models.Add(reqCommand);
            }
            return FunctdsecuL_4_42Models;
        }
 
        //逻辑_交易证券_交易_新增预埋订单
        public static List<FunctdsecuL_4_42Model> GetFunctdsecuL_4_42Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_42Models = new List<FunctdsecuL_4_42Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_42Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pre_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_ID_INT64);
                reqCommand.pre_order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_DATE_INT);
                reqCommand.pre_order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_TIME_INT);
                reqCommand.pre_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_STATUS_STR);
                FunctdsecuL_4_42Models.Add(reqCommand);
            }
            return FunctdsecuL_4_42Models;
        }
 
        //逻辑_交易证券_交易_新增组合订单
        public static List<FunctdsecuL_4_44Model> GetFunctdsecuL_4_44Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_44Models = new List<FunctdsecuL_4_44Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_44Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_statn = packer.GetStrbyName("oper_statn", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_id_str = packer.GetStrbyName("order_id_str", i);
                reqCommand.order_status_str = packer.GetStrbyName("order_status_str", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
 
                FunctdsecuL_4_44Models.Add(reqCommand);
            }
            return FunctdsecuL_4_44Models;
        }
 
        //逻辑_交易证券_交易_新增组合订单
        public static List<FunctdsecuL_4_44Model> GetFunctdsecuL_4_44Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_44Models = new List<FunctdsecuL_4_44Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_44Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                reqCommand.oper_statn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_STATN_STR);
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                reqCommand.order_id_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_STR_STR);
                reqCommand.order_status_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR_STR);
                reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                FunctdsecuL_4_44Models.Add(reqCommand);
            }
            return FunctdsecuL_4_44Models;
        }
 
        //逻辑_交易证券_交易_查询报盘订单主推
        public static List<FunctdsecuL_4_45Model> GetFunctdsecuL_4_45Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_45Models = new List<FunctdsecuL_4_45Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_45Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
 
                FunctdsecuL_4_45Models.Add(reqCommand);
            }
            return FunctdsecuL_4_45Models;
        }
 
        //逻辑_交易证券_交易_查询报盘订单主推
        public static List<FunctdsecuL_4_45Model> GetFunctdsecuL_4_45Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_45Models = new List<FunctdsecuL_4_45Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_45Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    FunctdsecuL_4_45Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_45Models;
        }
 
        //逻辑_交易证券_交易_查询报盘撤单主推
        public static List<FunctdsecuL_4_46Model> GetFunctdsecuL_4_46Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_46Models = new List<FunctdsecuL_4_46Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_46Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.wtdraw_id = packer.GetInt64byName("wtdraw_id", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
 
                FunctdsecuL_4_46Models.Add(reqCommand);
            }
            return FunctdsecuL_4_46Models;
        }
 
        //逻辑_交易证券_交易_查询报盘撤单主推
        public static List<FunctdsecuL_4_46Model> GetFunctdsecuL_4_46Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_46Models = new List<FunctdsecuL_4_46Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_46Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    FunctdsecuL_4_46Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_46Models;
        }
 
        //逻辑_交易证券_交易_查询订单
        public static List<FunctdsecuL_4_101Model> GetFunctdsecuL_4_101Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_101Models = new List<FunctdsecuL_4_101Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_101Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_time = packer.GetIntbyName("report_time", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.order_frozen_amt = packer.GetDoublebyName("order_frozen_amt", i);
                reqCommand.order_frozen_qty = packer.GetDoublebyName("order_frozen_qty", i);
                reqCommand.rsp_info = packer.GetStrbyName("rsp_info", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.combo_posi_id = packer.GetInt64byName("combo_posi_id", i);
                reqCommand.strategy_id = packer.GetInt64byName("strategy_id", i);
                reqCommand.contra_no = packer.GetStrbyName("contra_no", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_4_101Models.Add(reqCommand);
            }
            return FunctdsecuL_4_101Models;
        }
 
        //逻辑_交易证券_交易_查询订单
        public static List<FunctdsecuL_4_101Model> GetFunctdsecuL_4_101Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_101Models = new List<FunctdsecuL_4_101Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_101Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                    reqCommand.order_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_QTY_FLOAT);
                    reqCommand.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.combo_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_POSI_ID_INT64);
                    reqCommand.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                    reqCommand.contra_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRA_NO_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_4_101Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_101Models;
        }
 
        //逻辑_交易证券_交易_查询订单历史
        public static List<FunctdsecuL_4_102Model> GetFunctdsecuL_4_102Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_102Models = new List<FunctdsecuL_4_102Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_102Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
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
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_time = packer.GetIntbyName("report_time", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.order_frozen_amt = packer.GetDoublebyName("order_frozen_amt", i);
                reqCommand.order_frozen_qty = packer.GetDoublebyName("order_frozen_qty", i);
                reqCommand.rsp_info = packer.GetStrbyName("rsp_info", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.combo_posi_id = packer.GetInt64byName("combo_posi_id", i);
                reqCommand.contra_no = packer.GetStrbyName("contra_no", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_4_102Models.Add(reqCommand);
            }
            return FunctdsecuL_4_102Models;
        }
 
        //逻辑_交易证券_交易_查询订单历史
        public static List<FunctdsecuL_4_102Model> GetFunctdsecuL_4_102Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_102Models = new List<FunctdsecuL_4_102Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_102Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
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
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                    reqCommand.order_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_QTY_FLOAT);
                    reqCommand.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.combo_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_POSI_ID_INT64);
                    reqCommand.contra_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRA_NO_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_4_102Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_102Models;
        }
 
        //逻辑_交易证券_交易_查询订单汇总
        public static List<FunctdsecuL_4_103Model> GetFunctdsecuL_4_103Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_103Models = new List<FunctdsecuL_4_103Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_103Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_sum_status = packer.GetStrbyName("order_sum_status", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.waste_qty = packer.GetDoublebyName("waste_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.intrst_days = packer.GetIntbyName("intrst_days", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.bond_rate_type = packer.GetIntbyName("bond_rate_type", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_4_103Models.Add(reqCommand);
            }
            return FunctdsecuL_4_103Models;
        }
 
        //逻辑_交易证券_交易_查询订单汇总
        public static List<FunctdsecuL_4_103Model> GetFunctdsecuL_4_103Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_103Models = new List<FunctdsecuL_4_103Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_103Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_sum_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SUM_STATUS_STR);
                    reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    reqCommand.waste_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_4_103Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_103Models;
        }
 
        //逻辑_交易证券_交易_查询篮子订单
        public static List<FunctdsecuL_4_104Model> GetFunctdsecuL_4_104Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_104Models = new List<FunctdsecuL_4_104Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_104Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.basket_id = packer.GetInt64byName("basket_id", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.basket_trade_type = packer.GetIntbyName("basket_trade_type", i);
                reqCommand.basket_trade_amt = packer.GetDoublebyName("basket_trade_amt", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_4_104Models.Add(reqCommand);
            }
            return FunctdsecuL_4_104Models;
        }
 
        //逻辑_交易证券_交易_查询篮子订单
        public static List<FunctdsecuL_4_104Model> GetFunctdsecuL_4_104Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_104Models = new List<FunctdsecuL_4_104Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_104Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.basket_trade_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_TRADE_TYPE_INT);
                    reqCommand.basket_trade_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_TRADE_AMT_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_4_104Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_104Models;
        }
 
        //逻辑_交易证券_交易_查询预埋订单
        public static List<FunctdsecuL_4_105Model> GetFunctdsecuL_4_105Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_105Models = new List<FunctdsecuL_4_105Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_105Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.pre_order_id = packer.GetInt64byName("pre_order_id", i);
                reqCommand.pre_order_date = packer.GetIntbyName("pre_order_date", i);
                reqCommand.pre_order_time = packer.GetIntbyName("pre_order_time", i);
                reqCommand.pre_order_dir = packer.GetIntbyName("pre_order_dir", i);
                reqCommand.pre_order_type = packer.GetIntbyName("pre_order_type", i);
                reqCommand.pre_order_price = packer.GetDoublebyName("pre_order_price", i);
                reqCommand.pre_order_qty = packer.GetDoublebyName("pre_order_qty", i);
                reqCommand.pre_order_status = packer.GetStrbyName("pre_order_status", i);
                reqCommand.pre_price_type = packer.GetIntbyName("pre_price_type", i);
                reqCommand.price_offset = packer.GetDoublebyName("price_offset", i);
                reqCommand.pre_begin_date = packer.GetIntbyName("pre_begin_date", i);
                reqCommand.pre_end_date = packer.GetIntbyName("pre_end_date", i);
                reqCommand.pre_begin_time = packer.GetIntbyName("pre_begin_time", i);
                reqCommand.pre_end_time = packer.GetIntbyName("pre_end_time", i);
                reqCommand.trig_type = packer.GetIntbyName("trig_type", i);
                reqCommand.trig_price = packer.GetDoublebyName("trig_price", i);
                reqCommand.trig_date = packer.GetIntbyName("trig_date", i);
                reqCommand.trig_time = packer.GetIntbyName("trig_time", i);
                reqCommand.is_trace = packer.GetIntbyName("is_trace", i);
                reqCommand.price_up = packer.GetDoublebyName("price_up", i);
                reqCommand.keep_trace = packer.GetIntbyName("keep_trace", i);
                reqCommand.order_no_str = packer.GetStrbyName("order_no_str", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_4_105Models.Add(reqCommand);
            }
            return FunctdsecuL_4_105Models;
        }
 
        //逻辑_交易证券_交易_查询预埋订单
        public static List<FunctdsecuL_4_105Model> GetFunctdsecuL_4_105Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_105Models = new List<FunctdsecuL_4_105Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_105Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.pre_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_ID_INT64);
                    reqCommand.pre_order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_DATE_INT);
                    reqCommand.pre_order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_TIME_INT);
                    reqCommand.pre_order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_DIR_INT);
                    reqCommand.pre_order_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_TYPE_INT);
                    reqCommand.pre_order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_PRICE_FLOAT);
                    reqCommand.pre_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_QTY_FLOAT);
                    reqCommand.pre_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PRE_ORDER_STATUS_STR);
                    reqCommand.pre_price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_PRICE_TYPE_INT);
                    reqCommand.price_offset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_OFFSET_FLOAT);
                    reqCommand.pre_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_BEGIN_DATE_INT);
                    reqCommand.pre_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_END_DATE_INT);
                    reqCommand.pre_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_BEGIN_TIME_INT);
                    reqCommand.pre_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRE_END_TIME_INT);
                    reqCommand.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    reqCommand.trig_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_PRICE_FLOAT);
                    reqCommand.trig_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_DATE_INT);
                    reqCommand.trig_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TIME_INT);
                    reqCommand.is_trace = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRACE_INT);
                    reqCommand.price_up = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_UP_FLOAT);
                    reqCommand.keep_trace = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_KEEP_TRACE_INT);
                    reqCommand.order_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_NO_STR_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_4_105Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_105Models;
        }
 
        //逻辑_交易证券_交易_查询改单
        public static List<FunctdsecuL_4_106Model> GetFunctdsecuL_4_106Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_106Models = new List<FunctdsecuL_4_106Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_106Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.modi_order_date = packer.GetIntbyName("modi_order_date", i);
                reqCommand.modi_order_time = packer.GetIntbyName("modi_order_time", i);
                reqCommand.modi_batch_no = packer.GetIntbyName("modi_batch_no", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.modi_order_price = packer.GetDoublebyName("modi_order_price", i);
                reqCommand.modi_order_qty = packer.GetDoublebyName("modi_order_qty", i);
                reqCommand.modi_order_status = packer.GetStrbyName("modi_order_status", i);
                reqCommand.modi_price_type = packer.GetIntbyName("modi_price_type", i);
                reqCommand.new_order_id = packer.GetInt64byName("new_order_id", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_4_106Models.Add(reqCommand);
            }
            return FunctdsecuL_4_106Models;
        }
 
        //逻辑_交易证券_交易_查询改单
        public static List<FunctdsecuL_4_106Model> GetFunctdsecuL_4_106Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_106Models = new List<FunctdsecuL_4_106Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_106Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.modi_order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_DATE_INT);
                    reqCommand.modi_order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_TIME_INT);
                    reqCommand.modi_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_BATCH_NO_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    reqCommand.modi_order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_PRICE_FLOAT);
                    reqCommand.modi_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_QTY_FLOAT);
                    reqCommand.modi_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_STATUS_STR);
                    reqCommand.modi_price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_PRICE_TYPE_INT);
                    reqCommand.new_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_NEW_ORDER_ID_INT64);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_4_106Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_106Models;
        }
 
        //逻辑_交易证券_交易_查询改单历史
        public static List<FunctdsecuL_4_107Model> GetFunctdsecuL_4_107Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_107Models = new List<FunctdsecuL_4_107Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_107Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.modi_order_date = packer.GetIntbyName("modi_order_date", i);
                reqCommand.modi_order_time = packer.GetIntbyName("modi_order_time", i);
                reqCommand.modi_batch_no = packer.GetIntbyName("modi_batch_no", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.modi_order_price = packer.GetDoublebyName("modi_order_price", i);
                reqCommand.modi_order_qty = packer.GetDoublebyName("modi_order_qty", i);
                reqCommand.modi_order_status = packer.GetStrbyName("modi_order_status", i);
                reqCommand.modi_price_type = packer.GetIntbyName("modi_price_type", i);
                reqCommand.new_order_id = packer.GetInt64byName("new_order_id", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_4_107Models.Add(reqCommand);
            }
            return FunctdsecuL_4_107Models;
        }
 
        //逻辑_交易证券_交易_查询改单历史
        public static List<FunctdsecuL_4_107Model> GetFunctdsecuL_4_107Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_107Models = new List<FunctdsecuL_4_107Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_107Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.modi_order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_DATE_INT);
                    reqCommand.modi_order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_TIME_INT);
                    reqCommand.modi_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_BATCH_NO_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    reqCommand.modi_order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_PRICE_FLOAT);
                    reqCommand.modi_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_QTY_FLOAT);
                    reqCommand.modi_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_STATUS_STR);
                    reqCommand.modi_price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MODI_PRICE_TYPE_INT);
                    reqCommand.new_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_NEW_ORDER_ID_INT64);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_4_107Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_107Models;
        }
 
        //逻辑_交易证券_交易_查询未成交代码列表
        public static List<FunctdsecuL_4_108Model> GetFunctdsecuL_4_108Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_108Models = new List<FunctdsecuL_4_108Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_108Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
 
                FunctdsecuL_4_108Models.Add(reqCommand);
            }
            return FunctdsecuL_4_108Models;
        }
 
        //逻辑_交易证券_交易_查询未成交代码列表
        public static List<FunctdsecuL_4_108Model> GetFunctdsecuL_4_108Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_108Models = new List<FunctdsecuL_4_108Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_108Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    FunctdsecuL_4_108Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_108Models;
        }
 
        //逻辑_交易证券_交易_证券行情检查账户成交
        public static List<FunctdsecuL_4_109Model> GetFunctdsecuL_4_109Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_109Models = new List<FunctdsecuL_4_109Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_109Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.offer_oper_way = packer.GetStrbyName("offer_oper_way", i);
 
                FunctdsecuL_4_109Models.Add(reqCommand);
            }
            return FunctdsecuL_4_109Models;
        }
 
        //逻辑_交易证券_交易_证券行情检查账户成交
        public static List<FunctdsecuL_4_109Model> GetFunctdsecuL_4_109Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_109Models = new List<FunctdsecuL_4_109Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_109Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.offer_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_OPER_WAY_STR);
                    FunctdsecuL_4_109Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_109Models;
        }
 
        //逻辑_交易证券_交易_查询订单汇总历史
        public static List<FunctdsecuL_4_110Model> GetFunctdsecuL_4_110Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_110Models = new List<FunctdsecuL_4_110Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_110Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_sum_status = packer.GetStrbyName("order_sum_status", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.waste_qty = packer.GetDoublebyName("waste_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.intrst_days = packer.GetIntbyName("intrst_days", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.bond_rate_type = packer.GetIntbyName("bond_rate_type", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_4_110Models.Add(reqCommand);
            }
            return FunctdsecuL_4_110Models;
        }
 
        //逻辑_交易证券_交易_查询订单汇总历史
        public static List<FunctdsecuL_4_110Model> GetFunctdsecuL_4_110Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_110Models = new List<FunctdsecuL_4_110Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_110Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_sum_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SUM_STATUS_STR);
                    reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    reqCommand.waste_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.intrst_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_DAYS_INT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.bond_rate_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_RATE_TYPE_INT);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_4_110Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_110Models;
        }
 
        //逻辑_交易证券_交易_查询待执行订单
        public static List<FunctdsecuL_4_111Model> GetFunctdsecuL_4_111Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_111Models = new List<FunctdsecuL_4_111Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_111Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
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
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.exec_price_type = packer.GetIntbyName("exec_price_type", i);
                reqCommand.price_offset = packer.GetDoublebyName("price_offset", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.pend_order_status = packer.GetStrbyName("pend_order_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
 
                FunctdsecuL_4_111Models.Add(reqCommand);
            }
            return FunctdsecuL_4_111Models;
        }
 
        //逻辑_交易证券_交易_查询待执行订单
        public static List<FunctdsecuL_4_111Model> GetFunctdsecuL_4_111Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_111Models = new List<FunctdsecuL_4_111Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_111Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
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
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    reqCommand.exec_price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_TYPE_INT);
                    reqCommand.price_offset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_OFFSET_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.pend_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PEND_ORDER_STATUS_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    FunctdsecuL_4_111Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_111Models;
        }
 
        //逻辑_交易证券_交易_查询待执行订单历史
        public static List<FunctdsecuL_4_112Model> GetFunctdsecuL_4_112Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_112Models = new List<FunctdsecuL_4_112Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_112Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
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
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.exec_price_type = packer.GetIntbyName("exec_price_type", i);
                reqCommand.price_offset = packer.GetDoublebyName("price_offset", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.pend_order_status = packer.GetStrbyName("pend_order_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
 
                FunctdsecuL_4_112Models.Add(reqCommand);
            }
            return FunctdsecuL_4_112Models;
        }
 
        //逻辑_交易证券_交易_查询待执行订单历史
        public static List<FunctdsecuL_4_112Model> GetFunctdsecuL_4_112Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_112Models = new List<FunctdsecuL_4_112Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_112Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
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
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    reqCommand.exec_price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_TYPE_INT);
                    reqCommand.price_offset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_OFFSET_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.pend_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PEND_ORDER_STATUS_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    FunctdsecuL_4_112Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_112Models;
        }
 
        //逻辑_交易证券_交易_查询订单记录数
        public static List<FunctdsecuL_4_113Model> GetFunctdsecuL_4_113Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_113Models = new List<FunctdsecuL_4_113Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_113Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.order_count = packer.GetIntbyName("order_count", i);
 
                FunctdsecuL_4_113Models.Add(reqCommand);
            }
            return FunctdsecuL_4_113Models;
        }
 
        //逻辑_交易证券_交易_查询订单记录数
        public static List<FunctdsecuL_4_113Model> GetFunctdsecuL_4_113Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_113Models = new List<FunctdsecuL_4_113Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_113Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.order_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_COUNT_INT);
                FunctdsecuL_4_113Models.Add(reqCommand);
            }
            return FunctdsecuL_4_113Models;
        }
 
        //逻辑_交易证券_交易_查询交易组订单记录数
        public static List<FunctdsecuL_4_114Model> GetFunctdsecuL_4_114Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_114Models = new List<FunctdsecuL_4_114Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_114Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.record_count = packer.GetIntbyName("record_count", i);
 
                FunctdsecuL_4_114Models.Add(reqCommand);
            }
            return FunctdsecuL_4_114Models;
        }
 
        //逻辑_交易证券_交易_查询交易组订单记录数
        public static List<FunctdsecuL_4_114Model> GetFunctdsecuL_4_114Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_114Models = new List<FunctdsecuL_4_114Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_114Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                FunctdsecuL_4_114Models.Add(reqCommand);
            }
            return FunctdsecuL_4_114Models;
        }
 
        //逻辑_交易证券_交易_新增订单1
        public static List<FunctdsecuL_4_115Model> GetFunctdsecuL_4_115Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_115Models = new List<FunctdsecuL_4_115Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_115Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
 
                FunctdsecuL_4_115Models.Add(reqCommand);
            }
            return FunctdsecuL_4_115Models;
        }
 
        //逻辑_交易证券_交易_新增订单1
        public static List<FunctdsecuL_4_115Model> GetFunctdsecuL_4_115Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_115Models = new List<FunctdsecuL_4_115Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_115Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                FunctdsecuL_4_115Models.Add(reqCommand);
            }
            return FunctdsecuL_4_115Models;
        }
 
        //逻辑_交易证券_交易_查询组合交易流水记录
        public static List<FunctdsecuL_4_120Model> GetFunctdsecuL_4_120Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_120Models = new List<FunctdsecuL_4_120Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_120Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.combo_copies = packer.GetDoublebyName("combo_copies", i);
                reqCommand.combo_date = packer.GetIntbyName("combo_date", i);
                reqCommand.combo_time = packer.GetIntbyName("combo_time", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_4_120Models.Add(reqCommand);
            }
            return FunctdsecuL_4_120Models;
        }
 
        //逻辑_交易证券_交易_查询组合交易流水记录
        public static List<FunctdsecuL_4_120Model> GetFunctdsecuL_4_120Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_120Models = new List<FunctdsecuL_4_120Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_120Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.combo_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT);
                    reqCommand.combo_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_DATE_INT);
                    reqCommand.combo_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_TIME_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_4_120Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_120Models;
        }
 
        //逻辑_交易证券_交易_查询历史组合交易流水记录
        public static List<FunctdsecuL_4_121Model> GetFunctdsecuL_4_121Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_121Models = new List<FunctdsecuL_4_121Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_121Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.combo_copies = packer.GetDoublebyName("combo_copies", i);
                reqCommand.combo_date = packer.GetIntbyName("combo_date", i);
                reqCommand.combo_time = packer.GetIntbyName("combo_time", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_4_121Models.Add(reqCommand);
            }
            return FunctdsecuL_4_121Models;
        }
 
        //逻辑_交易证券_交易_查询历史组合交易流水记录
        public static List<FunctdsecuL_4_121Model> GetFunctdsecuL_4_121Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_121Models = new List<FunctdsecuL_4_121Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_121Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.combo_copies = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_COPIES_FLOAT);
                    reqCommand.combo_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_DATE_INT);
                    reqCommand.combo_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_TIME_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_4_121Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_121Models;
        }
 
        //逻辑_交易证券_交易_导入订单表
        public static List<FunctdsecuL_4_122Model> GetFunctdsecuL_4_122Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_122Models = new List<FunctdsecuL_4_122Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_122Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.oper_statn = packer.GetStrbyName("oper_statn", i);
 
                FunctdsecuL_4_122Models.Add(reqCommand);
            }
            return FunctdsecuL_4_122Models;
        }
 
        //逻辑_交易证券_交易_导入订单表
        public static List<FunctdsecuL_4_122Model> GetFunctdsecuL_4_122Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_122Models = new List<FunctdsecuL_4_122Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_122Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                reqCommand.oper_statn = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_STATN_STR);
                FunctdsecuL_4_122Models.Add(reqCommand);
            }
            return FunctdsecuL_4_122Models;
        }
 
        //逻辑_交易证券_交易_查询资产账户订单记录数
        public static List<FunctdsecuL_4_123Model> GetFunctdsecuL_4_123Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_123Models = new List<FunctdsecuL_4_123Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_123Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.record_count = packer.GetIntbyName("record_count", i);
 
                FunctdsecuL_4_123Models.Add(reqCommand);
            }
            return FunctdsecuL_4_123Models;
        }
 
        //逻辑_交易证券_交易_查询资产账户订单记录数
        public static List<FunctdsecuL_4_123Model> GetFunctdsecuL_4_123Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_123Models = new List<FunctdsecuL_4_123Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_123Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                FunctdsecuL_4_123Models.Add(reqCommand);
            }
            return FunctdsecuL_4_123Models;
        }
 
        //逻辑_交易证券_交易_查询产品订单记录数
        public static List<FunctdsecuL_4_124Model> GetFunctdsecuL_4_124Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_124Models = new List<FunctdsecuL_4_124Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_124Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.record_count = packer.GetIntbyName("record_count", i);
 
                FunctdsecuL_4_124Models.Add(reqCommand);
            }
            return FunctdsecuL_4_124Models;
        }
 
        //逻辑_交易证券_交易_查询产品订单记录数
        public static List<FunctdsecuL_4_124Model> GetFunctdsecuL_4_124Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_124Models = new List<FunctdsecuL_4_124Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_124Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                FunctdsecuL_4_124Models.Add(reqCommand);
            }
            return FunctdsecuL_4_124Models;
        }
 
        //逻辑_交易证券_交易_查询资产账户下交易组订单记录数
        public static List<FunctdsecuL_4_125Model> GetFunctdsecuL_4_125Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_125Models = new List<FunctdsecuL_4_125Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_125Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.record_count = packer.GetIntbyName("record_count", i);
 
                FunctdsecuL_4_125Models.Add(reqCommand);
            }
            return FunctdsecuL_4_125Models;
        }
 
        //逻辑_交易证券_交易_查询资产账户下交易组订单记录数
        public static List<FunctdsecuL_4_125Model> GetFunctdsecuL_4_125Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_125Models = new List<FunctdsecuL_4_125Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_125Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                FunctdsecuL_4_125Models.Add(reqCommand);
            }
            return FunctdsecuL_4_125Models;
        }
 
        //逻辑_交易证券_交易_查询交易时间配置
        public static List<FunctdsecuL_4_128Model> GetFunctdsecuL_4_128Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_128Models = new List<FunctdsecuL_4_128Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_128Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.am_trd_begin_time = packer.GetIntbyName("am_trd_begin_time", i);
                reqCommand.am_trd_end_time = packer.GetIntbyName("am_trd_end_time", i);
                reqCommand.pm_trd_begin_time = packer.GetIntbyName("pm_trd_begin_time", i);
                reqCommand.pm_trd_end_time = packer.GetIntbyName("pm_trd_end_time", i);
 
                FunctdsecuL_4_128Models.Add(reqCommand);
            }
            return FunctdsecuL_4_128Models;
        }
 
        //逻辑_交易证券_交易_查询交易时间配置
        public static List<FunctdsecuL_4_128Model> GetFunctdsecuL_4_128Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_128Models = new List<FunctdsecuL_4_128Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_4_128Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.am_trd_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AM_TRD_BEGIN_TIME_INT);
                    reqCommand.am_trd_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_AM_TRD_END_TIME_INT);
                    reqCommand.pm_trd_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PM_TRD_BEGIN_TIME_INT);
                    reqCommand.pm_trd_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PM_TRD_END_TIME_INT);
                    FunctdsecuL_4_128Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_4_128Models;
        }
 
        //逻辑_交易证券_交易_查询股东代码订单记录数
        public static List<FunctdsecuL_4_129Model> GetFunctdsecuL_4_129Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_129Models = new List<FunctdsecuL_4_129Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_129Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.record_count = packer.GetIntbyName("record_count", i);
 
                FunctdsecuL_4_129Models.Add(reqCommand);
            }
            return FunctdsecuL_4_129Models;
        }
 
        //逻辑_交易证券_交易_查询股东代码订单记录数
        public static List<FunctdsecuL_4_129Model> GetFunctdsecuL_4_129Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_129Models = new List<FunctdsecuL_4_129Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_129Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                FunctdsecuL_4_129Models.Add(reqCommand);
            }
            return FunctdsecuL_4_129Models;
        }
 
        //逻辑_交易证券_交易_融资融券新增订单
        public static List<FunctdsecuL_4_130Model> GetFunctdsecuL_4_130Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_130Models = new List<FunctdsecuL_4_130Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_130Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
 
                FunctdsecuL_4_130Models.Add(reqCommand);
            }
            return FunctdsecuL_4_130Models;
        }
 
        //逻辑_交易证券_交易_融资融券新增订单
        public static List<FunctdsecuL_4_130Model> GetFunctdsecuL_4_130Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_130Models = new List<FunctdsecuL_4_130Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_130Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                FunctdsecuL_4_130Models.Add(reqCommand);
            }
            return FunctdsecuL_4_130Models;
        }
 
        //逻辑_交易证券_交易_融资融券撤销订单
        public static List<FunctdsecuL_4_131Model> GetFunctdsecuL_4_131Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_131Models = new List<FunctdsecuL_4_131Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_131Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.wtdraw_id = packer.GetInt64byName("wtdraw_id", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.wtdraw_status = packer.GetStrbyName("wtdraw_status", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
 
                FunctdsecuL_4_131Models.Add(reqCommand);
            }
            return FunctdsecuL_4_131Models;
        }
 
        //逻辑_交易证券_交易_融资融券撤销订单
        public static List<FunctdsecuL_4_131Model> GetFunctdsecuL_4_131Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_131Models = new List<FunctdsecuL_4_131Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_131Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                reqCommand.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                FunctdsecuL_4_131Models.Add(reqCommand);
            }
            return FunctdsecuL_4_131Models;
        }
 
        //逻辑_交易证券_交易_插件新增订单
        public static List<FunctdsecuL_4_132Model> GetFunctdsecuL_4_132Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_132Models = new List<FunctdsecuL_4_132Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_132Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
 
                FunctdsecuL_4_132Models.Add(reqCommand);
            }
            return FunctdsecuL_4_132Models;
        }
 
        //逻辑_交易证券_交易_插件新增订单
        public static List<FunctdsecuL_4_132Model> GetFunctdsecuL_4_132Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_132Models = new List<FunctdsecuL_4_132Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_132Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                FunctdsecuL_4_132Models.Add(reqCommand);
            }
            return FunctdsecuL_4_132Models;
        }
 
        //逻辑_交易证券_交易_插件撤销订单
        public static List<FunctdsecuL_4_133Model> GetFunctdsecuL_4_133Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_133Models = new List<FunctdsecuL_4_133Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_133Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.wtdraw_id = packer.GetInt64byName("wtdraw_id", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.wtdraw_status = packer.GetStrbyName("wtdraw_status", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
 
                FunctdsecuL_4_133Models.Add(reqCommand);
            }
            return FunctdsecuL_4_133Models;
        }
 
        //逻辑_交易证券_交易_插件撤销订单
        public static List<FunctdsecuL_4_133Model> GetFunctdsecuL_4_133Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_133Models = new List<FunctdsecuL_4_133Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_133Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                reqCommand.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                FunctdsecuL_4_133Models.Add(reqCommand);
            }
            return FunctdsecuL_4_133Models;
        }
 
        //逻辑_交易证券_交易_插件新增改单
        public static List<FunctdsecuL_4_134Model> GetFunctdsecuL_4_134Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_134Models = new List<FunctdsecuL_4_134Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_134Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.modi_order_id = packer.GetInt64byName("modi_order_id", i);
                reqCommand.new_order_id = packer.GetInt64byName("new_order_id", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.wtdraw_id = packer.GetInt64byName("wtdraw_id", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.wtdraw_status = packer.GetStrbyName("wtdraw_status", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
                reqCommand.old_order_status = packer.GetStrbyName("old_order_status", i);
                reqCommand.new_order_status = packer.GetStrbyName("new_order_status", i);
 
                FunctdsecuL_4_134Models.Add(reqCommand);
            }
            return FunctdsecuL_4_134Models;
        }
 
        //逻辑_交易证券_交易_插件新增改单
        public static List<FunctdsecuL_4_134Model> GetFunctdsecuL_4_134Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_134Models = new List<FunctdsecuL_4_134Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_134Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                reqCommand.modi_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODI_ORDER_ID_INT64);
                reqCommand.new_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_NEW_ORDER_ID_INT64);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                reqCommand.wtdraw_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_ID_INT64);
                reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                reqCommand.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                reqCommand.old_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OLD_ORDER_STATUS_STR);
                reqCommand.new_order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NEW_ORDER_STATUS_STR);
                FunctdsecuL_4_134Models.Add(reqCommand);
            }
            return FunctdsecuL_4_134Models;
        }
 
        //逻辑_交易证券_交易_新增组合策略订单
        public static List<FunctdsecuL_4_138Model> GetFunctdsecuL_4_138Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_138Models = new List<FunctdsecuL_4_138Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_138Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
 
                FunctdsecuL_4_138Models.Add(reqCommand);
            }
            return FunctdsecuL_4_138Models;
        }
 
        //逻辑_交易证券_交易_新增组合策略订单
        public static List<FunctdsecuL_4_138Model> GetFunctdsecuL_4_138Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_138Models = new List<FunctdsecuL_4_138Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_138Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                FunctdsecuL_4_138Models.Add(reqCommand);
            }
            return FunctdsecuL_4_138Models;
        }
 
        //逻辑_交易证券_交易_查询交易组在途业务
        public static List<FunctdsecuL_4_139Model> GetFunctdsecuL_4_139Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_4_139Models = new List<FunctdsecuL_4_139Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_4_139Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.record_count = packer.GetIntbyName("record_count", i);
 
                FunctdsecuL_4_139Models.Add(reqCommand);
            }
            return FunctdsecuL_4_139Models;
        }
 
        //逻辑_交易证券_交易_查询交易组在途业务
        public static List<FunctdsecuL_4_139Model> GetFunctdsecuL_4_139Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_4_139Models = new List<FunctdsecuL_4_139Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_4_139Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                FunctdsecuL_4_139Models.Add(reqCommand);
            }
            return FunctdsecuL_4_139Models;
        }
 
    }
}
