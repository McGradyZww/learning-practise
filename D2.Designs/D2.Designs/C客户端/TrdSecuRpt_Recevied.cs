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

    public static class TrdSecuRpt
    {
        //逻辑_交易证券_报盘_处理订单回报
        public static List<FunctdsecuL_5_1Model> GetFunctdsecuL_5_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_1Models = new List<FunctdsecuL_5_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.rsp_info = packer.GetStrbyName("rsp_info", i);
                reqCommand.order_rsp_status = packer.GetStrbyName("order_rsp_status", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
 
                FunctdsecuL_5_1Models.Add(reqCommand);
            }
            return FunctdsecuL_5_1Models;
        }
 
        //逻辑_交易证券_报盘_处理订单回报
        public static List<FunctdsecuL_5_1Model> GetFunctdsecuL_5_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_1Models = new List<FunctdsecuL_5_1Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_5_1Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                reqCommand.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                reqCommand.order_rsp_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_RSP_STATUS_STR);
                reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                FunctdsecuL_5_1Models.Add(reqCommand);
            }
            return FunctdsecuL_5_1Models;
        }
 
        //逻辑_交易证券_报盘_处理撤单回报
        public static List<FunctdsecuL_5_11Model> GetFunctdsecuL_5_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_11Models = new List<FunctdsecuL_5_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_11Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_time = packer.GetIntbyName("report_time", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.wtdraw_status = packer.GetStrbyName("wtdraw_status", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.rsp_status = packer.GetStrbyName("rsp_status", i);
                reqCommand.rsp_info = packer.GetStrbyName("rsp_info", i);
 
                FunctdsecuL_5_11Models.Add(reqCommand);
            }
            return FunctdsecuL_5_11Models;
        }
 
        //逻辑_交易证券_报盘_处理撤单回报
        public static List<FunctdsecuL_5_11Model> GetFunctdsecuL_5_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_11Models = new List<FunctdsecuL_5_11Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_5_11Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                reqCommand.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                reqCommand.rsp_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_STATUS_STR);
                reqCommand.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                FunctdsecuL_5_11Models.Add(reqCommand);
            }
            return FunctdsecuL_5_11Models;
        }
 
        //逻辑_交易证券_报盘_处理成交回报
        public static List<FunctdsecuL_5_21Model> GetFunctdsecuL_5_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_21Models = new List<FunctdsecuL_5_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_21Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.rsp_info = packer.GetStrbyName("rsp_info", i);
                reqCommand.strike_deal_type = packer.GetIntbyName("strike_deal_type", i);
 
                FunctdsecuL_5_21Models.Add(reqCommand);
            }
            return FunctdsecuL_5_21Models;
        }
 
        //逻辑_交易证券_报盘_处理成交回报
        public static List<FunctdsecuL_5_21Model> GetFunctdsecuL_5_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_21Models = new List<FunctdsecuL_5_21Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_5_21Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                reqCommand.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                reqCommand.strike_deal_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DEAL_TYPE_INT);
                FunctdsecuL_5_21Models.Add(reqCommand);
            }
            return FunctdsecuL_5_21Models;
        }
 
        //逻辑_交易证券_报盘_处理订单补单回报
        public static List<FunctdsecuL_5_31Model> GetFunctdsecuL_5_31Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_31Models = new List<FunctdsecuL_5_31Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_31Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_time = packer.GetIntbyName("report_time", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
 
                FunctdsecuL_5_31Models.Add(reqCommand);
            }
            return FunctdsecuL_5_31Models;
        }
 
        //逻辑_交易证券_报盘_处理订单补单回报
        public static List<FunctdsecuL_5_31Model> GetFunctdsecuL_5_31Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_31Models = new List<FunctdsecuL_5_31Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_5_31Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                reqCommand.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                FunctdsecuL_5_31Models.Add(reqCommand);
            }
            return FunctdsecuL_5_31Models;
        }
 
        //逻辑_交易证券_报盘_体外指令成交
        public static List<FunctdsecuL_5_52Model> GetFunctdsecuL_5_52Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_52Models = new List<FunctdsecuL_5_52Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_52Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.strike_id = packer.GetInt64byName("strike_id", i);
                reqCommand.comm_strike_qty = packer.GetDoublebyName("comm_strike_qty", i);
                reqCommand.comm_strike_amt = packer.GetDoublebyName("comm_strike_amt", i);
 
                FunctdsecuL_5_52Models.Add(reqCommand);
            }
            return FunctdsecuL_5_52Models;
        }
 
        //逻辑_交易证券_报盘_体外指令成交
        public static List<FunctdsecuL_5_52Model> GetFunctdsecuL_5_52Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_52Models = new List<FunctdsecuL_5_52Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_5_52Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.strike_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ID_INT64);
                reqCommand.comm_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STRIKE_QTY_FLOAT);
                reqCommand.comm_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STRIKE_AMT_FLOAT);
                FunctdsecuL_5_52Models.Add(reqCommand);
            }
            return FunctdsecuL_5_52Models;
        }
 
        //逻辑_交易证券_报盘_体外指令成交回溯
        public static List<FunctdsecuL_5_53Model> GetFunctdsecuL_5_53Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_53Models = new List<FunctdsecuL_5_53Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_53Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_strike_qty = packer.GetDoublebyName("comm_strike_qty", i);
                reqCommand.comm_strike_amt = packer.GetDoublebyName("comm_strike_amt", i);
 
                FunctdsecuL_5_53Models.Add(reqCommand);
            }
            return FunctdsecuL_5_53Models;
        }
 
        //逻辑_交易证券_报盘_体外指令成交回溯
        public static List<FunctdsecuL_5_53Model> GetFunctdsecuL_5_53Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_53Models = new List<FunctdsecuL_5_53Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_5_53Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.comm_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STRIKE_QTY_FLOAT);
                reqCommand.comm_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STRIKE_AMT_FLOAT);
                FunctdsecuL_5_53Models.Add(reqCommand);
            }
            return FunctdsecuL_5_53Models;
        }
 
        //逻辑_交易证券_报盘_查询订单回报
        public static List<FunctdsecuL_5_101Model> GetFunctdsecuL_5_101Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_101Models = new List<FunctdsecuL_5_101Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_101Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_time = packer.GetIntbyName("report_time", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.order_rsp_status = packer.GetStrbyName("order_rsp_status", i);
                reqCommand.rsp_info = packer.GetStrbyName("rsp_info", i);
                reqCommand.deal_status = packer.GetStrbyName("deal_status", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_5_101Models.Add(reqCommand);
            }
            return FunctdsecuL_5_101Models;
        }
 
        //逻辑_交易证券_报盘_查询订单回报
        public static List<FunctdsecuL_5_101Model> GetFunctdsecuL_5_101Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_101Models = new List<FunctdsecuL_5_101Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_5_101Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    reqCommand.order_rsp_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_RSP_STATUS_STR);
                    reqCommand.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    reqCommand.deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_5_101Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_5_101Models;
        }
 
        //逻辑_交易证券_报盘_查询成交回报
        public static List<FunctdsecuL_5_121Model> GetFunctdsecuL_5_121Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_121Models = new List<FunctdsecuL_5_121Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_121Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_deal_type = packer.GetIntbyName("strike_deal_type", i);
                reqCommand.rsp_info = packer.GetStrbyName("rsp_info", i);
                reqCommand.deal_status = packer.GetStrbyName("deal_status", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_5_121Models.Add(reqCommand);
            }
            return FunctdsecuL_5_121Models;
        }
 
        //逻辑_交易证券_报盘_查询成交回报
        public static List<FunctdsecuL_5_121Model> GetFunctdsecuL_5_121Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_121Models = new List<FunctdsecuL_5_121Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_5_121Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_deal_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DEAL_TYPE_INT);
                    reqCommand.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    reqCommand.deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_5_121Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_5_121Models;
        }
 
        //逻辑_交易证券_报盘_查询成交明细
        public static List<FunctdsecuL_5_122Model> GetFunctdsecuL_5_122Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_122Models = new List<FunctdsecuL_5_122Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_122Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.query_opor_no = packer.GetIntbyName("query_opor_no", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.trade_tax = packer.GetDoublebyName("trade_tax", i);
                reqCommand.trade_cost_fee = packer.GetDoublebyName("trade_cost_fee", i);
                reqCommand.trade_system_use_fee = packer.GetDoublebyName("trade_system_use_fee", i);
                reqCommand.stock_settle_fee = packer.GetDoublebyName("stock_settle_fee", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.strike_bond_accr_intrst = packer.GetDoublebyName("strike_bond_accr_intrst", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.record_valid_flag = packer.GetIntbyName("record_valid_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
 
                FunctdsecuL_5_122Models.Add(reqCommand);
            }
            return FunctdsecuL_5_122Models;
        }
 
        //逻辑_交易证券_报盘_查询成交明细
        public static List<FunctdsecuL_5_122Model> GetFunctdsecuL_5_122Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_122Models = new List<FunctdsecuL_5_122Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_5_122Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.query_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.trade_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_TAX_FLOAT);
                    reqCommand.trade_cost_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COST_FEE_FLOAT);
                    reqCommand.trade_system_use_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
                    reqCommand.stock_settle_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_SETTLE_FEE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.strike_bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.record_valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_VALID_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    FunctdsecuL_5_122Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_5_122Models;
        }
 
        //逻辑_交易证券_报盘_查询成交明细历史
        public static List<FunctdsecuL_5_123Model> GetFunctdsecuL_5_123Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_123Models = new List<FunctdsecuL_5_123Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_123Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.query_opor_no = packer.GetIntbyName("query_opor_no", i);
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
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.trade_tax = packer.GetDoublebyName("trade_tax", i);
                reqCommand.trade_cost_fee = packer.GetDoublebyName("trade_cost_fee", i);
                reqCommand.trade_system_use_fee = packer.GetDoublebyName("trade_system_use_fee", i);
                reqCommand.stock_settle_fee = packer.GetDoublebyName("stock_settle_fee", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.strike_bond_accr_intrst = packer.GetDoublebyName("strike_bond_accr_intrst", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.record_valid_flag = packer.GetIntbyName("record_valid_flag", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_5_123Models.Add(reqCommand);
            }
            return FunctdsecuL_5_123Models;
        }
 
        //逻辑_交易证券_报盘_查询成交明细历史
        public static List<FunctdsecuL_5_123Model> GetFunctdsecuL_5_123Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_123Models = new List<FunctdsecuL_5_123Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_5_123Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.query_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_QUERY_OPOR_NO_INT);
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
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.trade_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_TAX_FLOAT);
                    reqCommand.trade_cost_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COST_FEE_FLOAT);
                    reqCommand.trade_system_use_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
                    reqCommand.stock_settle_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_SETTLE_FEE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.strike_bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.record_valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_VALID_FLAG_INT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_5_123Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_5_123Models;
        }
 
        //逻辑_交易证券_报盘_查询成交汇总
        public static List<FunctdsecuL_5_124Model> GetFunctdsecuL_5_124Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_124Models = new List<FunctdsecuL_5_124Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_124Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
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
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.trade_tax = packer.GetDoublebyName("trade_tax", i);
                reqCommand.trade_cost_fee = packer.GetDoublebyName("trade_cost_fee", i);
                reqCommand.trade_system_use_fee = packer.GetDoublebyName("trade_system_use_fee", i);
                reqCommand.stock_settle_fee = packer.GetDoublebyName("stock_settle_fee", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.strike_bond_accr_intrst = packer.GetDoublebyName("strike_bond_accr_intrst", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_5_124Models.Add(reqCommand);
            }
            return FunctdsecuL_5_124Models;
        }
 
        //逻辑_交易证券_报盘_查询成交汇总
        public static List<FunctdsecuL_5_124Model> GetFunctdsecuL_5_124Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_124Models = new List<FunctdsecuL_5_124Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_5_124Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
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
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.trade_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_TAX_FLOAT);
                    reqCommand.trade_cost_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COST_FEE_FLOAT);
                    reqCommand.trade_system_use_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
                    reqCommand.stock_settle_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_SETTLE_FEE_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.strike_bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_5_124Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_5_124Models;
        }
 
        //逻辑_交易证券_报盘_查询成交汇总历史
        public static List<FunctdsecuL_5_125Model> GetFunctdsecuL_5_125Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_125Models = new List<FunctdsecuL_5_125Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_125Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
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
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.trade_tax = packer.GetDoublebyName("trade_tax", i);
                reqCommand.trade_cost_fee = packer.GetDoublebyName("trade_cost_fee", i);
                reqCommand.trade_system_use_fee = packer.GetDoublebyName("trade_system_use_fee", i);
                reqCommand.stock_settle_fee = packer.GetDoublebyName("stock_settle_fee", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.strike_bond_accr_intrst = packer.GetDoublebyName("strike_bond_accr_intrst", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_5_125Models.Add(reqCommand);
            }
            return FunctdsecuL_5_125Models;
        }
 
        //逻辑_交易证券_报盘_查询成交汇总历史
        public static List<FunctdsecuL_5_125Model> GetFunctdsecuL_5_125Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_125Models = new List<FunctdsecuL_5_125Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_5_125Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
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
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.trade_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_TAX_FLOAT);
                    reqCommand.trade_cost_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COST_FEE_FLOAT);
                    reqCommand.trade_system_use_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
                    reqCommand.stock_settle_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_SETTLE_FEE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.strike_bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_5_125Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_5_125Models;
        }
 
        //逻辑_交易证券_报盘_查询体外交易差额记录
        public static List<FunctdsecuL_5_126Model> GetFunctdsecuL_5_126Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_126Models = new List<FunctdsecuL_5_126Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_126Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_id = packer.GetInt64byName("strike_id", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.occur_qty = packer.GetDoublebyName("occur_qty", i);
                reqCommand.amt_diff = packer.GetDoublebyName("amt_diff", i);
                reqCommand.diff_qty = packer.GetDoublebyName("diff_qty", i);
                reqCommand.deal_amt_diff = packer.GetDoublebyName("deal_amt_diff", i);
                reqCommand.deal_diff_qty = packer.GetDoublebyName("deal_diff_qty", i);
                reqCommand.deal_status = packer.GetStrbyName("deal_status", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_5_126Models.Add(reqCommand);
            }
            return FunctdsecuL_5_126Models;
        }
 
        //逻辑_交易证券_报盘_查询体外交易差额记录
        public static List<FunctdsecuL_5_126Model> GetFunctdsecuL_5_126Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_126Models = new List<FunctdsecuL_5_126Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_5_126Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ID_INT64);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    reqCommand.amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_DIFF_FLOAT);
                    reqCommand.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    reqCommand.deal_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_AMT_DIFF_FLOAT);
                    reqCommand.deal_diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_DIFF_QTY_FLOAT);
                    reqCommand.deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_5_126Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_5_126Models;
        }
 
        //逻辑_交易证券_报盘_查询历史体外交易差额记录
        public static List<FunctdsecuL_5_127Model> GetFunctdsecuL_5_127Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_127Models = new List<FunctdsecuL_5_127Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_127Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_id = packer.GetInt64byName("strike_id", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.occur_amt = packer.GetDoublebyName("occur_amt", i);
                reqCommand.occur_qty = packer.GetDoublebyName("occur_qty", i);
                reqCommand.amt_diff = packer.GetDoublebyName("amt_diff", i);
                reqCommand.diff_qty = packer.GetDoublebyName("diff_qty", i);
                reqCommand.deal_amt_diff = packer.GetDoublebyName("deal_amt_diff", i);
                reqCommand.deal_diff_qty = packer.GetDoublebyName("deal_diff_qty", i);
                reqCommand.deal_status = packer.GetStrbyName("deal_status", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_5_127Models.Add(reqCommand);
            }
            return FunctdsecuL_5_127Models;
        }
 
        //逻辑_交易证券_报盘_查询历史体外交易差额记录
        public static List<FunctdsecuL_5_127Model> GetFunctdsecuL_5_127Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_127Models = new List<FunctdsecuL_5_127Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_5_127Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ID_INT64);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_AMT_FLOAT);
                    reqCommand.occur_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OCCUR_QTY_FLOAT);
                    reqCommand.amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_AMT_DIFF_FLOAT);
                    reqCommand.diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DIFF_QTY_FLOAT);
                    reqCommand.deal_amt_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_AMT_DIFF_FLOAT);
                    reqCommand.deal_diff_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_DIFF_QTY_FLOAT);
                    reqCommand.deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_STATUS_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_5_127Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_5_127Models;
        }
 
        //逻辑_交易证券_报盘_处理融资融券成交回报
        public static List<FunctdsecuL_5_129Model> GetFunctdsecuL_5_129Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_129Models = new List<FunctdsecuL_5_129Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_129Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.rsp_info = packer.GetStrbyName("rsp_info", i);
                reqCommand.strike_deal_type = packer.GetIntbyName("strike_deal_type", i);
 
                FunctdsecuL_5_129Models.Add(reqCommand);
            }
            return FunctdsecuL_5_129Models;
        }
 
        //逻辑_交易证券_报盘_处理融资融券成交回报
        public static List<FunctdsecuL_5_129Model> GetFunctdsecuL_5_129Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_129Models = new List<FunctdsecuL_5_129Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_5_129Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                reqCommand.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                reqCommand.strike_deal_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DEAL_TYPE_INT);
                FunctdsecuL_5_129Models.Add(reqCommand);
            }
            return FunctdsecuL_5_129Models;
        }
 
        //逻辑_交易证券_报盘_融资融券处理撤单回报
        public static List<FunctdsecuL_5_130Model> GetFunctdsecuL_5_130Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_130Models = new List<FunctdsecuL_5_130Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_130Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_time = packer.GetIntbyName("report_time", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.wtdraw_status = packer.GetStrbyName("wtdraw_status", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.rsp_status = packer.GetStrbyName("rsp_status", i);
                reqCommand.rsp_info = packer.GetStrbyName("rsp_info", i);
 
                FunctdsecuL_5_130Models.Add(reqCommand);
            }
            return FunctdsecuL_5_130Models;
        }
 
        //逻辑_交易证券_报盘_融资融券处理撤单回报
        public static List<FunctdsecuL_5_130Model> GetFunctdsecuL_5_130Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_130Models = new List<FunctdsecuL_5_130Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_5_130Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                reqCommand.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                reqCommand.rsp_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_STATUS_STR);
                reqCommand.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                FunctdsecuL_5_130Models.Add(reqCommand);
            }
            return FunctdsecuL_5_130Models;
        }
 
        //逻辑_交易证券_报盘_融资融券处理订单回报
        public static List<FunctdsecuL_5_131Model> GetFunctdsecuL_5_131Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_131Models = new List<FunctdsecuL_5_131Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_131Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.rsp_info = packer.GetStrbyName("rsp_info", i);
                reqCommand.order_rsp_status = packer.GetStrbyName("order_rsp_status", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
 
                FunctdsecuL_5_131Models.Add(reqCommand);
            }
            return FunctdsecuL_5_131Models;
        }
 
        //逻辑_交易证券_报盘_融资融券处理订单回报
        public static List<FunctdsecuL_5_131Model> GetFunctdsecuL_5_131Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_131Models = new List<FunctdsecuL_5_131Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_5_131Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                reqCommand.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                reqCommand.order_rsp_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_RSP_STATUS_STR);
                reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                FunctdsecuL_5_131Models.Add(reqCommand);
            }
            return FunctdsecuL_5_131Models;
        }
 
        //逻辑_交易证券_报盘_查询成交回报处理
        public static List<FunctdsecuL_5_132Model> GetFunctdsecuL_5_132Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_5_132Models = new List<FunctdsecuL_5_132Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_5_132Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.rsp_info = packer.GetStrbyName("rsp_info", i);
 
                FunctdsecuL_5_132Models.Add(reqCommand);
            }
            return FunctdsecuL_5_132Models;
        }
 
        //逻辑_交易证券_报盘_查询成交回报处理
        public static List<FunctdsecuL_5_132Model> GetFunctdsecuL_5_132Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_5_132Models = new List<FunctdsecuL_5_132Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_5_132Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                reqCommand.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                FunctdsecuL_5_132Models.Add(reqCommand);
            }
            return FunctdsecuL_5_132Models;
        }
 
    }
}
