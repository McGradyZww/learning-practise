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

    public static class TrdFutuTrd
    {
        //逻辑_交易期货_交易_新增订单
        public static List<FunctdfutuL_4_11Model> GetFunctdfutuL_4_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_4_11Models = new List<FunctdfutuL_4_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_4_11Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
 
                FunctdfutuL_4_11Models.Add(reqCommand);
            }
            return FunctdfutuL_4_11Models;
        }
 
        //逻辑_交易期货_交易_新增订单
        public static List<FunctdfutuL_4_11Model> GetFunctdfutuL_4_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_4_11Models = new List<FunctdfutuL_4_11Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdfutuL_4_11Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                FunctdfutuL_4_11Models.Add(reqCommand);
            }
            return FunctdfutuL_4_11Models;
        }
 
        //逻辑_交易期货_交易_撤销订单
        public static List<FunctdfutuL_4_12Model> GetFunctdfutuL_4_12Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_4_12Models = new List<FunctdfutuL_4_12Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_4_12Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.wtdraw_status = packer.GetStrbyName("wtdraw_status", i);
                reqCommand.rsp_info = packer.GetStrbyName("rsp_info", i);
 
                FunctdfutuL_4_12Models.Add(reqCommand);
            }
            return FunctdfutuL_4_12Models;
        }
 
        //逻辑_交易期货_交易_撤销订单
        public static List<FunctdfutuL_4_12Model> GetFunctdfutuL_4_12Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_4_12Models = new List<FunctdfutuL_4_12Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdfutuL_4_12Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                reqCommand.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                reqCommand.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                FunctdfutuL_4_12Models.Add(reqCommand);
            }
            return FunctdfutuL_4_12Models;
        }
 
        //逻辑_交易期货_交易_查询报盘订单
        public static List<FunctdfutuL_4_31Model> GetFunctdfutuL_4_31Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_4_31Models = new List<FunctdfutuL_4_31Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_4_31Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco = packer.GetStrbyName("futu_acco", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_4_31Models.Add(reqCommand);
            }
            return FunctdfutuL_4_31Models;
        }
 
        //逻辑_交易期货_交易_查询报盘订单
        public static List<FunctdfutuL_4_31Model> GetFunctdfutuL_4_31Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_4_31Models = new List<FunctdfutuL_4_31Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_4_31Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_4_31Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_4_31Models;
        }
 
        //逻辑_交易期货_交易_查询报盘撤单
        public static List<FunctdfutuL_4_32Model> GetFunctdfutuL_4_32Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_4_32Models = new List<FunctdfutuL_4_32Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_4_32Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.wtdraw_status = packer.GetStrbyName("wtdraw_status", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_4_32Models.Add(reqCommand);
            }
            return FunctdfutuL_4_32Models;
        }
 
        //逻辑_交易期货_交易_查询报盘撤单
        public static List<FunctdfutuL_4_32Model> GetFunctdfutuL_4_32Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_4_32Models = new List<FunctdfutuL_4_32Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_4_32Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    reqCommand.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_4_32Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_4_32Models;
        }
 
        //逻辑_交易期货_交易_查询订单
        public static List<FunctdfutuL_4_101Model> GetFunctdfutuL_4_101Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_4_101Models = new List<FunctdfutuL_4_101Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_4_101Model();
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
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_time = packer.GetIntbyName("report_time", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.trade_fee = packer.GetDoublebyName("trade_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.strike_commis = packer.GetDoublebyName("strike_commis", i);
                reqCommand.strike_other_commis = packer.GetDoublebyName("strike_other_commis", i);
                reqCommand.strike_all_fee = packer.GetDoublebyName("strike_all_fee", i);
                reqCommand.report_fee = packer.GetDoublebyName("report_fee", i);
                reqCommand.wtdraw_fee = packer.GetDoublebyName("wtdraw_fee", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.trade_occur_amt = packer.GetDoublebyName("trade_occur_amt", i);
                reqCommand.comb_code = packer.GetStrbyName("comb_code", i);
                reqCommand.margin_ratio = packer.GetDoublebyName("margin_ratio", i);
                reqCommand.rsp_info = packer.GetStrbyName("rsp_info", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_4_101Models.Add(reqCommand);
            }
            return FunctdfutuL_4_101Models;
        }
 
        //逻辑_交易期货_交易_查询订单
        public static List<FunctdfutuL_4_101Model> GetFunctdfutuL_4_101Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_4_101Models = new List<FunctdfutuL_4_101Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_4_101Model();
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
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_COMMIS_FLOAT);
                    reqCommand.strike_other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
                    reqCommand.strike_all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ALL_FEE_FLOAT);
                    reqCommand.report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_FEE_FLOAT);
                    reqCommand.wtdraw_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_FEE_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.trade_occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_OCCUR_AMT_FLOAT);
                    reqCommand.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    reqCommand.margin_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_FLOAT);
                    reqCommand.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_4_101Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_4_101Models;
        }
 
        //逻辑_交易期货_交易_查询订单历史
        public static List<FunctdfutuL_4_102Model> GetFunctdfutuL_4_102Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_4_102Models = new List<FunctdfutuL_4_102Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_4_102Model();
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
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_time = packer.GetIntbyName("report_time", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.trade_fee = packer.GetDoublebyName("trade_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.strike_commis = packer.GetDoublebyName("strike_commis", i);
                reqCommand.strike_other_commis = packer.GetDoublebyName("strike_other_commis", i);
                reqCommand.strike_all_fee = packer.GetDoublebyName("strike_all_fee", i);
                reqCommand.report_fee = packer.GetDoublebyName("report_fee", i);
                reqCommand.wtdraw_fee = packer.GetDoublebyName("wtdraw_fee", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.trade_occur_amt = packer.GetDoublebyName("trade_occur_amt", i);
                reqCommand.comb_code = packer.GetStrbyName("comb_code", i);
                reqCommand.margin_ratio = packer.GetDoublebyName("margin_ratio", i);
                reqCommand.rsp_info = packer.GetStrbyName("rsp_info", i);
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_4_102Models.Add(reqCommand);
            }
            return FunctdfutuL_4_102Models;
        }
 
        //逻辑_交易期货_交易_查询订单历史
        public static List<FunctdfutuL_4_102Model> GetFunctdfutuL_4_102Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_4_102Models = new List<FunctdfutuL_4_102Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_4_102Model();
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
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_COMMIS_FLOAT);
                    reqCommand.strike_other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
                    reqCommand.strike_all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ALL_FEE_FLOAT);
                    reqCommand.report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_FEE_FLOAT);
                    reqCommand.wtdraw_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_FEE_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.trade_occur_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_OCCUR_AMT_FLOAT);
                    reqCommand.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    reqCommand.margin_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_FLOAT);
                    reqCommand.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_4_102Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_4_102Models;
        }
 
        //逻辑_交易期货_交易_查询汇总订单结果集
        public static List<FunctdfutuL_4_103Model> GetFunctdfutuL_4_103Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_4_103Models = new List<FunctdfutuL_4_103Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_4_103Model();
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
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_sum_status = packer.GetStrbyName("order_sum_status", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.waste_qty = packer.GetDoublebyName("waste_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_aver_price = packer.GetDoublebyName("strike_aver_price", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.trade_fee = packer.GetDoublebyName("trade_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.strike_commis = packer.GetDoublebyName("strike_commis", i);
                reqCommand.strike_other_commis = packer.GetDoublebyName("strike_other_commis", i);
                reqCommand.report_fee = packer.GetDoublebyName("report_fee", i);
                reqCommand.wtdraw_fee = packer.GetDoublebyName("wtdraw_fee", i);
                reqCommand.strike_all_fee = packer.GetDoublebyName("strike_all_fee", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_4_103Models.Add(reqCommand);
            }
            return FunctdfutuL_4_103Models;
        }
 
        //逻辑_交易期货_交易_查询汇总订单结果集
        public static List<FunctdfutuL_4_103Model> GetFunctdfutuL_4_103Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_4_103Models = new List<FunctdfutuL_4_103Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_4_103Model();
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
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_sum_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SUM_STATUS_STR);
                    reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    reqCommand.waste_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_COMMIS_FLOAT);
                    reqCommand.strike_other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
                    reqCommand.report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_FEE_FLOAT);
                    reqCommand.wtdraw_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_FEE_FLOAT);
                    reqCommand.strike_all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ALL_FEE_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_4_103Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_4_103Models;
        }
 
        //逻辑_交易期货_交易_查询历史汇总订单结果集
        public static List<FunctdfutuL_4_104Model> GetFunctdfutuL_4_104Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_4_104Models = new List<FunctdfutuL_4_104Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_4_104Model();
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
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_sum_status = packer.GetStrbyName("order_sum_status", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.waste_qty = packer.GetDoublebyName("waste_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_aver_price = packer.GetDoublebyName("strike_aver_price", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.trade_fee = packer.GetDoublebyName("trade_fee", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.strike_commis = packer.GetDoublebyName("strike_commis", i);
                reqCommand.strike_other_commis = packer.GetDoublebyName("strike_other_commis", i);
                reqCommand.report_fee = packer.GetDoublebyName("report_fee", i);
                reqCommand.wtdraw_fee = packer.GetDoublebyName("wtdraw_fee", i);
                reqCommand.strike_all_fee = packer.GetDoublebyName("strike_all_fee", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_4_104Models.Add(reqCommand);
            }
            return FunctdfutuL_4_104Models;
        }
 
        //逻辑_交易期货_交易_查询历史汇总订单结果集
        public static List<FunctdfutuL_4_104Model> GetFunctdfutuL_4_104Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_4_104Models = new List<FunctdfutuL_4_104Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_4_104Model();
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
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_sum_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_SUM_STATUS_STR);
                    reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    reqCommand.waste_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WASTE_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AVER_PRICE_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.trade_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FEE_FLOAT);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.strike_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_COMMIS_FLOAT);
                    reqCommand.strike_other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_OTHER_COMMIS_FLOAT);
                    reqCommand.report_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_FEE_FLOAT);
                    reqCommand.wtdraw_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_FEE_FLOAT);
                    reqCommand.strike_all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_ALL_FEE_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_4_104Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_4_104Models;
        }
 
        //逻辑_交易期货_交易_新增改单
        public static List<FunctdfutuL_4_33Model> GetFunctdfutuL_4_33Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_4_33Models = new List<FunctdfutuL_4_33Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_4_33Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.trade_code_no = packer.GetIntbyName("trade_code_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
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
 
                FunctdfutuL_4_33Models.Add(reqCommand);
            }
            return FunctdfutuL_4_33Models;
        }
 
        //逻辑_交易期货_交易_新增改单
        public static List<FunctdfutuL_4_33Model> GetFunctdfutuL_4_33Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_4_33Models = new List<FunctdfutuL_4_33Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdfutuL_4_33Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.trade_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CODE_NO_INT);
                reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
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
                FunctdfutuL_4_33Models.Add(reqCommand);
            }
            return FunctdfutuL_4_33Models;
        }
 
        //逻辑_交易期货_交易_查询报盘订单主推
        public static List<FunctdfutuL_4_41Model> GetFunctdfutuL_4_41Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_4_41Models = new List<FunctdfutuL_4_41Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_4_41Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco = packer.GetStrbyName("futu_acco", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.contrc_unit = packer.GetIntbyName("contrc_unit", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_4_41Models.Add(reqCommand);
            }
            return FunctdfutuL_4_41Models;
        }
 
        //逻辑_交易期货_交易_查询报盘订单主推
        public static List<FunctdfutuL_4_41Model> GetFunctdfutuL_4_41Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_4_41Models = new List<FunctdfutuL_4_41Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_4_41Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_STR);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.contrc_unit = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_UNIT_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_4_41Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_4_41Models;
        }
 
        //逻辑_交易期货_交易_查询报盘撤单主推
        public static List<FunctdfutuL_4_42Model> GetFunctdfutuL_4_42Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_4_42Models = new List<FunctdfutuL_4_42Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_4_42Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.wtdraw_status = packer.GetStrbyName("wtdraw_status", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_4_42Models.Add(reqCommand);
            }
            return FunctdfutuL_4_42Models;
        }
 
        //逻辑_交易期货_交易_查询报盘撤单主推
        public static List<FunctdfutuL_4_42Model> GetFunctdfutuL_4_42Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_4_42Models = new List<FunctdfutuL_4_42Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_4_42Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    reqCommand.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_4_42Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_4_42Models;
        }
 
    }
}
