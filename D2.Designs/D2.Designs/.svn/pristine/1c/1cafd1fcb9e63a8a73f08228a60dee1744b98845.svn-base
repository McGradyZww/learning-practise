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

    public static class TrdFutuAppr
    {
        //逻辑_交易期货_指令_新增指令
        public static List<FunctdfutuL_3_1Model> GetFunctdfutuL_3_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_3_1Models = new List<FunctdfutuL_3_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_3_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.comm_dir = packer.GetIntbyName("comm_dir", i);
                reqCommand.comm_limit_price = packer.GetDoublebyName("comm_limit_price", i);
                reqCommand.comm_qty = packer.GetDoublebyName("comm_qty", i);
                reqCommand.comm_amt = packer.GetDoublebyName("comm_amt", i);
                reqCommand.comm_status = packer.GetStrbyName("comm_status", i);
                reqCommand.comm_appr_status = packer.GetStrbyName("comm_appr_status", i);
 
                FunctdfutuL_3_1Models.Add(reqCommand);
            }
            return FunctdfutuL_3_1Models;
        }
 
        //逻辑_交易期货_指令_新增指令
        public static List<FunctdfutuL_3_1Model> GetFunctdfutuL_3_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_3_1Models = new List<FunctdfutuL_3_1Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdfutuL_3_1Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                reqCommand.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                reqCommand.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                reqCommand.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                reqCommand.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                reqCommand.comm_appr_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR);
                FunctdfutuL_3_1Models.Add(reqCommand);
            }
            return FunctdfutuL_3_1Models;
        }
 
        //逻辑_交易期货_指令_审批指令
        public static List<FunctdfutuL_3_4Model> GetFunctdfutuL_3_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_3_4Models = new List<FunctdfutuL_3_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_3_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_status = packer.GetStrbyName("comm_status", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
 
                FunctdfutuL_3_4Models.Add(reqCommand);
            }
            return FunctdfutuL_3_4Models;
        }
 
        //逻辑_交易期货_指令_审批指令
        public static List<FunctdfutuL_3_4Model> GetFunctdfutuL_3_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_3_4Models = new List<FunctdfutuL_3_4Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdfutuL_3_4Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                FunctdfutuL_3_4Models.Add(reqCommand);
            }
            return FunctdfutuL_3_4Models;
        }
 
        //逻辑_交易期货_指令_分发指令
        public static List<FunctdfutuL_3_5Model> GetFunctdfutuL_3_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_3_5Models = new List<FunctdfutuL_3_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_3_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.comm_date = packer.GetIntbyName("comm_date", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.comm_dir = packer.GetIntbyName("comm_dir", i);
                reqCommand.comm_qty = packer.GetDoublebyName("comm_qty", i);
                reqCommand.comm_amt = packer.GetDoublebyName("comm_amt", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.comm_cancel_qty = packer.GetDoublebyName("comm_cancel_qty", i);
                reqCommand.comm_status = packer.GetStrbyName("comm_status", i);
                reqCommand.strike_status = packer.GetStrbyName("strike_status", i);
 
                FunctdfutuL_3_5Models.Add(reqCommand);
            }
            return FunctdfutuL_3_5Models;
        }
 
        //逻辑_交易期货_指令_分发指令
        public static List<FunctdfutuL_3_5Model> GetFunctdfutuL_3_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_3_5Models = new List<FunctdfutuL_3_5Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdfutuL_3_5Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                reqCommand.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                reqCommand.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                reqCommand.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                reqCommand.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                reqCommand.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                reqCommand.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                reqCommand.strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR);
                FunctdfutuL_3_5Models.Add(reqCommand);
            }
            return FunctdfutuL_3_5Models;
        }
 
        //逻辑_交易期货_指令_查询指令结果集
        public static List<FunctdfutuL_3_6Model> GetFunctdfutuL_3_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_3_6Models = new List<FunctdfutuL_3_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_3_6Model();
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
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.comm_date = packer.GetIntbyName("comm_date", i);
                reqCommand.comm_time = packer.GetIntbyName("comm_time", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.comm_executor = packer.GetIntbyName("comm_executor", i);
                reqCommand.comm_dir = packer.GetIntbyName("comm_dir", i);
                reqCommand.comm_limit_price = packer.GetDoublebyName("comm_limit_price", i);
                reqCommand.limit_actual_price = packer.GetDoublebyName("limit_actual_price", i);
                reqCommand.comm_qty = packer.GetDoublebyName("comm_qty", i);
                reqCommand.comm_amt = packer.GetDoublebyName("comm_amt", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.comm_cancel_qty = packer.GetDoublebyName("comm_cancel_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.comm_frozen_qty = packer.GetDoublebyName("comm_frozen_qty", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.capit_reback_days = packer.GetIntbyName("capit_reback_days", i);
                reqCommand.posi_reback_days = packer.GetIntbyName("posi_reback_days", i);
                reqCommand.strike_status = packer.GetStrbyName("strike_status", i);
                reqCommand.comm_status = packer.GetStrbyName("comm_status", i);
                reqCommand.comm_begin_date = packer.GetIntbyName("comm_begin_date", i);
                reqCommand.comm_end_date = packer.GetIntbyName("comm_end_date", i);
                reqCommand.comm_begin_time = packer.GetIntbyName("comm_begin_time", i);
                reqCommand.comm_end_time = packer.GetIntbyName("comm_end_time", i);
                reqCommand.comm_comple_date = packer.GetIntbyName("comm_comple_date", i);
                reqCommand.comm_comple_time = packer.GetIntbyName("comm_comple_time", i);
                reqCommand.comm_appr_date = packer.GetIntbyName("comm_appr_date", i);
                reqCommand.comm_appr_time = packer.GetIntbyName("comm_appr_time", i);
                reqCommand.comm_appr_status = packer.GetStrbyName("comm_appr_status", i);
                reqCommand.comm_appr_oper_no = packer.GetIntbyName("comm_appr_oper_no", i);
                reqCommand.comm_appr_oper = packer.GetIntbyName("comm_appr_oper", i);
                reqCommand.comm_appr_remark = packer.GetStrbyName("comm_appr_remark", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.comb_code = packer.GetStrbyName("comb_code", i);
                reqCommand.comm_oper_way = packer.GetStrbyName("comm_oper_way", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.comm_comple_flag = packer.GetIntbyName("comm_comple_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_3_6Models.Add(reqCommand);
            }
            return FunctdfutuL_3_6Models;
        }
 
        //逻辑_交易期货_指令_查询指令结果集
        public static List<FunctdfutuL_3_6Model> GetFunctdfutuL_3_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_3_6Models = new List<FunctdfutuL_3_6Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_3_6Model();
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
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    reqCommand.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    reqCommand.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    reqCommand.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    reqCommand.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    reqCommand.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    reqCommand.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    reqCommand.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    reqCommand.strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR);
                    reqCommand.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                    reqCommand.comm_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT);
                    reqCommand.comm_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT);
                    reqCommand.comm_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT);
                    reqCommand.comm_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT);
                    reqCommand.comm_comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_DATE_INT);
                    reqCommand.comm_comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_TIME_INT);
                    reqCommand.comm_appr_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_DATE_INT);
                    reqCommand.comm_appr_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_TIME_INT);
                    reqCommand.comm_appr_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR);
                    reqCommand.comm_appr_oper_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_NO_INT);
                    reqCommand.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    reqCommand.comm_appr_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_REMARK_STR);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    reqCommand.comm_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.comm_comple_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_3_6Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_3_6Models;
        }
 
        //逻辑_交易期货_指令_查询历史指令结果集
        public static List<FunctdfutuL_3_7Model> GetFunctdfutuL_3_7Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_3_7Models = new List<FunctdfutuL_3_7Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_3_7Model();
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
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.contrc_code = packer.GetStrbyName("contrc_code", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.comm_date = packer.GetIntbyName("comm_date", i);
                reqCommand.comm_time = packer.GetIntbyName("comm_time", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.comm_executor = packer.GetIntbyName("comm_executor", i);
                reqCommand.comm_dir = packer.GetIntbyName("comm_dir", i);
                reqCommand.comm_limit_price = packer.GetDoublebyName("comm_limit_price", i);
                reqCommand.limit_actual_price = packer.GetDoublebyName("limit_actual_price", i);
                reqCommand.comm_qty = packer.GetDoublebyName("comm_qty", i);
                reqCommand.comm_amt = packer.GetDoublebyName("comm_amt", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.comm_cancel_qty = packer.GetDoublebyName("comm_cancel_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.comm_frozen_qty = packer.GetDoublebyName("comm_frozen_qty", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.capit_reback_days = packer.GetIntbyName("capit_reback_days", i);
                reqCommand.posi_reback_days = packer.GetIntbyName("posi_reback_days", i);
                reqCommand.strike_status = packer.GetStrbyName("strike_status", i);
                reqCommand.comm_status = packer.GetStrbyName("comm_status", i);
                reqCommand.comm_begin_date = packer.GetIntbyName("comm_begin_date", i);
                reqCommand.comm_end_date = packer.GetIntbyName("comm_end_date", i);
                reqCommand.comm_begin_time = packer.GetIntbyName("comm_begin_time", i);
                reqCommand.comm_end_time = packer.GetIntbyName("comm_end_time", i);
                reqCommand.comm_comple_date = packer.GetIntbyName("comm_comple_date", i);
                reqCommand.comm_comple_time = packer.GetIntbyName("comm_comple_time", i);
                reqCommand.comm_appr_date = packer.GetIntbyName("comm_appr_date", i);
                reqCommand.comm_appr_time = packer.GetIntbyName("comm_appr_time", i);
                reqCommand.comm_appr_status = packer.GetStrbyName("comm_appr_status", i);
                reqCommand.comm_appr_oper_no = packer.GetIntbyName("comm_appr_oper_no", i);
                reqCommand.comm_appr_oper = packer.GetIntbyName("comm_appr_oper", i);
                reqCommand.comm_appr_remark = packer.GetStrbyName("comm_appr_remark", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.comb_code = packer.GetStrbyName("comb_code", i);
                reqCommand.comm_oper_way = packer.GetStrbyName("comm_oper_way", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.comm_comple_flag = packer.GetIntbyName("comm_comple_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_3_7Models.Add(reqCommand);
            }
            return FunctdfutuL_3_7Models;
        }
 
        //逻辑_交易期货_指令_查询历史指令结果集
        public static List<FunctdfutuL_3_7Model> GetFunctdfutuL_3_7Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_3_7Models = new List<FunctdfutuL_3_7Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_3_7Model();
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
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.contrc_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_STR);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    reqCommand.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    reqCommand.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    reqCommand.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    reqCommand.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    reqCommand.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    reqCommand.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.capit_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CAPIT_REBACK_DAYS_INT);
                    reqCommand.posi_reback_days = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_REBACK_DAYS_INT);
                    reqCommand.strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR);
                    reqCommand.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                    reqCommand.comm_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT);
                    reqCommand.comm_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT);
                    reqCommand.comm_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT);
                    reqCommand.comm_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT);
                    reqCommand.comm_comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_DATE_INT);
                    reqCommand.comm_comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_TIME_INT);
                    reqCommand.comm_appr_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_DATE_INT);
                    reqCommand.comm_appr_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_TIME_INT);
                    reqCommand.comm_appr_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR);
                    reqCommand.comm_appr_oper_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_NO_INT);
                    reqCommand.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    reqCommand.comm_appr_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_REMARK_STR);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.comb_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMB_CODE_STR);
                    reqCommand.comm_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.comm_comple_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_3_7Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_3_7Models;
        }
 
        //逻辑_交易期货_指令_查询指令分发结果集
        public static List<FunctdfutuL_3_8Model> GetFunctdfutuL_3_8Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_3_8Models = new List<FunctdfutuL_3_8Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_3_8Model();
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
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.comm_date = packer.GetIntbyName("comm_date", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.comm_dir = packer.GetIntbyName("comm_dir", i);
                reqCommand.comm_status = packer.GetStrbyName("comm_status", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.disp_date = packer.GetIntbyName("disp_date", i);
                reqCommand.disp_time = packer.GetIntbyName("disp_time", i);
                reqCommand.before_comm_executor = packer.GetIntbyName("before_comm_executor", i);
                reqCommand.comm_executor = packer.GetIntbyName("comm_executor", i);
                reqCommand.is_withdraw = packer.GetIntbyName("is_withdraw", i);
                reqCommand.disp_flag = packer.GetIntbyName("disp_flag", i);
                reqCommand.disp_remark = packer.GetStrbyName("disp_remark", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_3_8Models.Add(reqCommand);
            }
            return FunctdfutuL_3_8Models;
        }
 
        //逻辑_交易期货_指令_查询指令分发结果集
        public static List<FunctdfutuL_3_8Model> GetFunctdfutuL_3_8Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_3_8Models = new List<FunctdfutuL_3_8Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_3_8Model();
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
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    reqCommand.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.disp_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_DATE_INT);
                    reqCommand.disp_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_TIME_INT);
                    reqCommand.before_comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEFORE_COMM_EXECUTOR_INT);
                    reqCommand.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    reqCommand.is_withdraw = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT);
                    reqCommand.disp_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_FLAG_INT);
                    reqCommand.disp_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DISP_REMARK_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_3_8Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_3_8Models;
        }
 
        //逻辑_交易期货_指令_查询历史指令分发结果集
        public static List<FunctdfutuL_3_9Model> GetFunctdfutuL_3_9Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_3_9Models = new List<FunctdfutuL_3_9Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_3_9Model();
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
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.comm_date = packer.GetIntbyName("comm_date", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.comm_dir = packer.GetIntbyName("comm_dir", i);
                reqCommand.comm_status = packer.GetStrbyName("comm_status", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.disp_date = packer.GetIntbyName("disp_date", i);
                reqCommand.disp_time = packer.GetIntbyName("disp_time", i);
                reqCommand.before_comm_executor = packer.GetIntbyName("before_comm_executor", i);
                reqCommand.comm_executor = packer.GetIntbyName("comm_executor", i);
                reqCommand.is_withdraw = packer.GetIntbyName("is_withdraw", i);
                reqCommand.disp_flag = packer.GetIntbyName("disp_flag", i);
                reqCommand.disp_remark = packer.GetStrbyName("disp_remark", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_3_9Models.Add(reqCommand);
            }
            return FunctdfutuL_3_9Models;
        }
 
        //逻辑_交易期货_指令_查询历史指令分发结果集
        public static List<FunctdfutuL_3_9Model> GetFunctdfutuL_3_9Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_3_9Models = new List<FunctdfutuL_3_9Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_3_9Model();
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
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    reqCommand.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.disp_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_DATE_INT);
                    reqCommand.disp_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_TIME_INT);
                    reqCommand.before_comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEFORE_COMM_EXECUTOR_INT);
                    reqCommand.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    reqCommand.is_withdraw = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT);
                    reqCommand.disp_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_FLAG_INT);
                    reqCommand.disp_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DISP_REMARK_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_3_9Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_3_9Models;
        }
 
        //逻辑_交易期货_指令_查询指令审批结果集
        public static List<FunctdfutuL_3_10Model> GetFunctdfutuL_3_10Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_3_10Models = new List<FunctdfutuL_3_10Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_3_10Model();
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
                reqCommand.comm_appr_date = packer.GetIntbyName("comm_appr_date", i);
                reqCommand.comm_appr_time = packer.GetIntbyName("comm_appr_time", i);
                reqCommand.comm_appr_oper_no = packer.GetIntbyName("comm_appr_oper_no", i);
                reqCommand.comm_appr_oper = packer.GetIntbyName("comm_appr_oper", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.comm_date = packer.GetIntbyName("comm_date", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.comm_dir = packer.GetIntbyName("comm_dir", i);
                reqCommand.comm_qty = packer.GetDoublebyName("comm_qty", i);
                reqCommand.comm_limit_price = packer.GetDoublebyName("comm_limit_price", i);
                reqCommand.limit_actual_price = packer.GetDoublebyName("limit_actual_price", i);
                reqCommand.comm_begin_date = packer.GetIntbyName("comm_begin_date", i);
                reqCommand.comm_end_date = packer.GetIntbyName("comm_end_date", i);
                reqCommand.comm_begin_time = packer.GetIntbyName("comm_begin_time", i);
                reqCommand.comm_end_time = packer.GetIntbyName("comm_end_time", i);
                reqCommand.comm_appr_status = packer.GetStrbyName("comm_appr_status", i);
                reqCommand.comm_appr_remark = packer.GetStrbyName("comm_appr_remark", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_3_10Models.Add(reqCommand);
            }
            return FunctdfutuL_3_10Models;
        }
 
        //逻辑_交易期货_指令_查询指令审批结果集
        public static List<FunctdfutuL_3_10Model> GetFunctdfutuL_3_10Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_3_10Models = new List<FunctdfutuL_3_10Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_3_10Model();
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
                    reqCommand.comm_appr_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_DATE_INT);
                    reqCommand.comm_appr_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_TIME_INT);
                    reqCommand.comm_appr_oper_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_NO_INT);
                    reqCommand.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    reqCommand.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    reqCommand.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    reqCommand.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    reqCommand.comm_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT);
                    reqCommand.comm_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT);
                    reqCommand.comm_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT);
                    reqCommand.comm_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT);
                    reqCommand.comm_appr_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR);
                    reqCommand.comm_appr_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_REMARK_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_3_10Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_3_10Models;
        }
 
        //逻辑_交易期货_指令_查询历史指令审批结果集
        public static List<FunctdfutuL_3_11Model> GetFunctdfutuL_3_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_3_11Models = new List<FunctdfutuL_3_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_3_11Model();
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
                reqCommand.comm_appr_date = packer.GetIntbyName("comm_appr_date", i);
                reqCommand.comm_appr_time = packer.GetIntbyName("comm_appr_time", i);
                reqCommand.comm_appr_oper_no = packer.GetIntbyName("comm_appr_oper_no", i);
                reqCommand.comm_appr_oper = packer.GetIntbyName("comm_appr_oper", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.futu_acco_no = packer.GetIntbyName("futu_acco_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.comm_date = packer.GetIntbyName("comm_date", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.comm_dir = packer.GetIntbyName("comm_dir", i);
                reqCommand.comm_qty = packer.GetDoublebyName("comm_qty", i);
                reqCommand.comm_limit_price = packer.GetDoublebyName("comm_limit_price", i);
                reqCommand.limit_actual_price = packer.GetDoublebyName("limit_actual_price", i);
                reqCommand.comm_begin_date = packer.GetIntbyName("comm_begin_date", i);
                reqCommand.comm_end_date = packer.GetIntbyName("comm_end_date", i);
                reqCommand.comm_begin_time = packer.GetIntbyName("comm_begin_time", i);
                reqCommand.comm_end_time = packer.GetIntbyName("comm_end_time", i);
                reqCommand.comm_appr_status = packer.GetStrbyName("comm_appr_status", i);
                reqCommand.comm_appr_remark = packer.GetStrbyName("comm_appr_remark", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_3_11Models.Add(reqCommand);
            }
            return FunctdfutuL_3_11Models;
        }
 
        //逻辑_交易期货_指令_查询历史指令审批结果集
        public static List<FunctdfutuL_3_11Model> GetFunctdfutuL_3_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_3_11Models = new List<FunctdfutuL_3_11Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_3_11Model();
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
                    reqCommand.comm_appr_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_DATE_INT);
                    reqCommand.comm_appr_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_TIME_INT);
                    reqCommand.comm_appr_oper_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_NO_INT);
                    reqCommand.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.futu_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ACCO_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    reqCommand.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    reqCommand.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    reqCommand.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    reqCommand.comm_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT);
                    reqCommand.comm_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT);
                    reqCommand.comm_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT);
                    reqCommand.comm_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT);
                    reqCommand.comm_appr_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR);
                    reqCommand.comm_appr_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_REMARK_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_3_11Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_3_11Models;
        }
 
        //逻辑_交易期货_指令_查询汇总指令结果集
        public static List<FunctdfutuL_3_12Model> GetFunctdfutuL_3_12Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_3_12Models = new List<FunctdfutuL_3_12Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_3_12Model();
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
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.comm_executor = packer.GetIntbyName("comm_executor", i);
                reqCommand.comm_date = packer.GetIntbyName("comm_date", i);
                reqCommand.comm_time = packer.GetIntbyName("comm_time", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.comm_dir = packer.GetIntbyName("comm_dir", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.comm_limit_price = packer.GetDoublebyName("comm_limit_price", i);
                reqCommand.limit_actual_price = packer.GetDoublebyName("limit_actual_price", i);
                reqCommand.comm_qty = packer.GetDoublebyName("comm_qty", i);
                reqCommand.comm_amt = packer.GetDoublebyName("comm_amt", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.comm_cancel_qty = packer.GetDoublebyName("comm_cancel_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_status = packer.GetStrbyName("strike_status", i);
                reqCommand.comm_sum_status = packer.GetStrbyName("comm_sum_status", i);
                reqCommand.comm_begin_date = packer.GetIntbyName("comm_begin_date", i);
                reqCommand.comm_end_date = packer.GetIntbyName("comm_end_date", i);
                reqCommand.comm_begin_time = packer.GetIntbyName("comm_begin_time", i);
                reqCommand.comm_end_time = packer.GetIntbyName("comm_end_time", i);
                reqCommand.comm_comple_date = packer.GetIntbyName("comm_comple_date", i);
                reqCommand.comm_comple_time = packer.GetIntbyName("comm_comple_time", i);
                reqCommand.max_comm_comple_date = packer.GetIntbyName("max_comm_comple_date", i);
                reqCommand.max_comm_comple_time = packer.GetIntbyName("max_comm_comple_time", i);
                reqCommand.comm_appr_date = packer.GetIntbyName("comm_appr_date", i);
                reqCommand.comm_appr_time = packer.GetIntbyName("comm_appr_time", i);
                reqCommand.comm_sum_approve_status = packer.GetStrbyName("comm_sum_approve_status", i);
                reqCommand.buy_order_qty = packer.GetDoublebyName("buy_order_qty", i);
                reqCommand.sell_order_qty = packer.GetDoublebyName("sell_order_qty", i);
                reqCommand.buy_comm_qty = packer.GetDoublebyName("buy_comm_qty", i);
                reqCommand.sell_comm_qty = packer.GetDoublebyName("sell_comm_qty", i);
                reqCommand.buy_strike_qty = packer.GetDoublebyName("buy_strike_qty", i);
                reqCommand.sell_strike_qty = packer.GetDoublebyName("sell_strike_qty", i);
                reqCommand.buy_strike_amt = packer.GetDoublebyName("buy_strike_amt", i);
                reqCommand.sell_strike_amt = packer.GetDoublebyName("sell_strike_amt", i);
                reqCommand.buy_comm_amt = packer.GetDoublebyName("buy_comm_amt", i);
                reqCommand.sell_comm_amt = packer.GetDoublebyName("sell_comm_amt", i);
                reqCommand.comm_oper_way = packer.GetStrbyName("comm_oper_way", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_3_12Models.Add(reqCommand);
            }
            return FunctdfutuL_3_12Models;
        }
 
        //逻辑_交易期货_指令_查询汇总指令结果集
        public static List<FunctdfutuL_3_12Model> GetFunctdfutuL_3_12Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_3_12Models = new List<FunctdfutuL_3_12Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_3_12Model();
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
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    reqCommand.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    reqCommand.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    reqCommand.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    reqCommand.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    reqCommand.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR);
                    reqCommand.comm_sum_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_STATUS_STR);
                    reqCommand.comm_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT);
                    reqCommand.comm_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT);
                    reqCommand.comm_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT);
                    reqCommand.comm_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT);
                    reqCommand.comm_comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_DATE_INT);
                    reqCommand.comm_comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_TIME_INT);
                    reqCommand.max_comm_comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_COMM_COMPLE_DATE_INT);
                    reqCommand.max_comm_comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_COMM_COMPLE_TIME_INT);
                    reqCommand.comm_appr_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_DATE_INT);
                    reqCommand.comm_appr_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_TIME_INT);
                    reqCommand.comm_sum_approve_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_APPROVE_STATUS_STR);
                    reqCommand.buy_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_ORDER_QTY_FLOAT);
                    reqCommand.sell_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_ORDER_QTY_FLOAT);
                    reqCommand.buy_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_COMM_QTY_FLOAT);
                    reqCommand.sell_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_COMM_QTY_FLOAT);
                    reqCommand.buy_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_STRIKE_QTY_FLOAT);
                    reqCommand.sell_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_STRIKE_QTY_FLOAT);
                    reqCommand.buy_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_STRIKE_AMT_FLOAT);
                    reqCommand.sell_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_STRIKE_AMT_FLOAT);
                    reqCommand.buy_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_COMM_AMT_FLOAT);
                    reqCommand.sell_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_COMM_AMT_FLOAT);
                    reqCommand.comm_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_3_12Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_3_12Models;
        }
 
        //逻辑_交易期货_指令_查询历史汇总指令结果集
        public static List<FunctdfutuL_3_13Model> GetFunctdfutuL_3_13Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdfutuL_3_13Models = new List<FunctdfutuL_3_13Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdfutuL_3_13Model();
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
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.comm_executor = packer.GetIntbyName("comm_executor", i);
                reqCommand.comm_date = packer.GetIntbyName("comm_date", i);
                reqCommand.comm_time = packer.GetIntbyName("comm_time", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.comm_dir = packer.GetIntbyName("comm_dir", i);
                reqCommand.contrc_dir = packer.GetIntbyName("contrc_dir", i);
                reqCommand.comm_limit_price = packer.GetDoublebyName("comm_limit_price", i);
                reqCommand.limit_actual_price = packer.GetDoublebyName("limit_actual_price", i);
                reqCommand.comm_qty = packer.GetDoublebyName("comm_qty", i);
                reqCommand.comm_amt = packer.GetDoublebyName("comm_amt", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.comm_cancel_qty = packer.GetDoublebyName("comm_cancel_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_status = packer.GetStrbyName("strike_status", i);
                reqCommand.comm_sum_status = packer.GetStrbyName("comm_sum_status", i);
                reqCommand.comm_begin_date = packer.GetIntbyName("comm_begin_date", i);
                reqCommand.comm_end_date = packer.GetIntbyName("comm_end_date", i);
                reqCommand.comm_begin_time = packer.GetIntbyName("comm_begin_time", i);
                reqCommand.comm_end_time = packer.GetIntbyName("comm_end_time", i);
                reqCommand.comm_comple_date = packer.GetIntbyName("comm_comple_date", i);
                reqCommand.comm_comple_time = packer.GetIntbyName("comm_comple_time", i);
                reqCommand.max_comm_comple_date = packer.GetIntbyName("max_comm_comple_date", i);
                reqCommand.max_comm_comple_time = packer.GetIntbyName("max_comm_comple_time", i);
                reqCommand.comm_appr_date = packer.GetIntbyName("comm_appr_date", i);
                reqCommand.comm_appr_time = packer.GetIntbyName("comm_appr_time", i);
                reqCommand.comm_sum_approve_status = packer.GetStrbyName("comm_sum_approve_status", i);
                reqCommand.buy_order_qty = packer.GetDoublebyName("buy_order_qty", i);
                reqCommand.sell_order_qty = packer.GetDoublebyName("sell_order_qty", i);
                reqCommand.buy_comm_qty = packer.GetDoublebyName("buy_comm_qty", i);
                reqCommand.sell_comm_qty = packer.GetDoublebyName("sell_comm_qty", i);
                reqCommand.buy_strike_qty = packer.GetDoublebyName("buy_strike_qty", i);
                reqCommand.sell_strike_qty = packer.GetDoublebyName("sell_strike_qty", i);
                reqCommand.buy_strike_amt = packer.GetDoublebyName("buy_strike_amt", i);
                reqCommand.sell_strike_amt = packer.GetDoublebyName("sell_strike_amt", i);
                reqCommand.buy_comm_amt = packer.GetDoublebyName("buy_comm_amt", i);
                reqCommand.sell_comm_amt = packer.GetDoublebyName("sell_comm_amt", i);
                reqCommand.comm_oper_way = packer.GetStrbyName("comm_oper_way", i);
                reqCommand.rece_margin = packer.GetDoublebyName("rece_margin", i);
                reqCommand.hedge_type = packer.GetIntbyName("hedge_type", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdfutuL_3_13Models.Add(reqCommand);
            }
            return FunctdfutuL_3_13Models;
        }
 
        //逻辑_交易期货_指令_查询历史汇总指令结果集
        public static List<FunctdfutuL_3_13Model> GetFunctdfutuL_3_13Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdfutuL_3_13Models = new List<FunctdfutuL_3_13Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdfutuL_3_13Model();
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
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    reqCommand.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    reqCommand.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    reqCommand.contrc_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_DIR_INT);
                    reqCommand.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    reqCommand.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    reqCommand.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    reqCommand.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_STATUS_STR);
                    reqCommand.comm_sum_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_STATUS_STR);
                    reqCommand.comm_begin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_DATE_INT);
                    reqCommand.comm_end_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_DATE_INT);
                    reqCommand.comm_begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BEGIN_TIME_INT);
                    reqCommand.comm_end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_END_TIME_INT);
                    reqCommand.comm_comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_DATE_INT);
                    reqCommand.comm_comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_TIME_INT);
                    reqCommand.max_comm_comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_COMM_COMPLE_DATE_INT);
                    reqCommand.max_comm_comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_COMM_COMPLE_TIME_INT);
                    reqCommand.comm_appr_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_DATE_INT);
                    reqCommand.comm_appr_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_TIME_INT);
                    reqCommand.comm_sum_approve_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_SUM_APPROVE_STATUS_STR);
                    reqCommand.buy_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_ORDER_QTY_FLOAT);
                    reqCommand.sell_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_ORDER_QTY_FLOAT);
                    reqCommand.buy_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_COMM_QTY_FLOAT);
                    reqCommand.sell_comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_COMM_QTY_FLOAT);
                    reqCommand.buy_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_STRIKE_QTY_FLOAT);
                    reqCommand.sell_strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_STRIKE_QTY_FLOAT);
                    reqCommand.buy_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_STRIKE_AMT_FLOAT);
                    reqCommand.sell_strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_STRIKE_AMT_FLOAT);
                    reqCommand.buy_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_COMM_AMT_FLOAT);
                    reqCommand.sell_comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_COMM_AMT_FLOAT);
                    reqCommand.comm_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR);
                    reqCommand.rece_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RECE_MARGIN_FLOAT);
                    reqCommand.hedge_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HEDGE_TYPE_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdfutuL_3_13Models.Add(reqCommand);
                }
            }
            return FunctdfutuL_3_13Models;
        }
 
    }
}
