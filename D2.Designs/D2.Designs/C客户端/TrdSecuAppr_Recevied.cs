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

    public static class TrdSecuAppr
    {
        //逻辑_交易证券_指令_新增指令
        public static List<FunctdsecuL_3_1Model> GetFunctdsecuL_3_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_1Models = new List<FunctdsecuL_3_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_1Model();
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
 
                FunctdsecuL_3_1Models.Add(reqCommand);
            }
            return FunctdsecuL_3_1Models;
        }
 
        //逻辑_交易证券_指令_新增指令
        public static List<FunctdsecuL_3_1Model> GetFunctdsecuL_3_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_1Models = new List<FunctdsecuL_3_1Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_3_1Model();
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
                FunctdsecuL_3_1Models.Add(reqCommand);
            }
            return FunctdsecuL_3_1Models;
        }
 
        //逻辑_交易证券_指令_审批指令
        public static List<FunctdsecuL_3_4Model> GetFunctdsecuL_3_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_4Models = new List<FunctdsecuL_3_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_status = packer.GetStrbyName("comm_status", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
 
                FunctdsecuL_3_4Models.Add(reqCommand);
            }
            return FunctdsecuL_3_4Models;
        }
 
        //逻辑_交易证券_指令_审批指令
        public static List<FunctdsecuL_3_4Model> GetFunctdsecuL_3_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_4Models = new List<FunctdsecuL_3_4Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_3_4Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                FunctdsecuL_3_4Models.Add(reqCommand);
            }
            return FunctdsecuL_3_4Models;
        }
 
        //逻辑_交易证券_指令_分发指令
        public static List<FunctdsecuL_3_5Model> GetFunctdsecuL_3_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_5Models = new List<FunctdsecuL_3_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
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
 
                FunctdsecuL_3_5Models.Add(reqCommand);
            }
            return FunctdsecuL_3_5Models;
        }
 
        //逻辑_交易证券_指令_分发指令
        public static List<FunctdsecuL_3_5Model> GetFunctdsecuL_3_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_5Models = new List<FunctdsecuL_3_5Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_3_5Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
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
                FunctdsecuL_3_5Models.Add(reqCommand);
            }
            return FunctdsecuL_3_5Models;
        }
 
        //逻辑_交易证券_指令_新增篮子批量指令
        public static List<FunctdsecuL_3_6Model> GetFunctdsecuL_3_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_6Models = new List<FunctdsecuL_3_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_6Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_id_str = packer.GetStrbyName("comm_id_str", i);
                reqCommand.comm_appr_status_str = packer.GetStrbyName("comm_appr_status_str", i);
 
                FunctdsecuL_3_6Models.Add(reqCommand);
            }
            return FunctdsecuL_3_6Models;
        }
 
        //逻辑_交易证券_指令_新增篮子批量指令
        public static List<FunctdsecuL_3_6Model> GetFunctdsecuL_3_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_6Models = new List<FunctdsecuL_3_6Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_3_6Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.comm_id_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_STR_STR);
                reqCommand.comm_appr_status_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR_STR);
                FunctdsecuL_3_6Models.Add(reqCommand);
            }
            return FunctdsecuL_3_6Models;
        }
 
        //逻辑_交易证券_指令_新增调仓指令
        public static List<FunctdsecuL_3_8Model> GetFunctdsecuL_3_8Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_8Models = new List<FunctdsecuL_3_8Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_8Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_id_str = packer.GetStrbyName("comm_id_str", i);
                reqCommand.comm_appr_status_str = packer.GetStrbyName("comm_appr_status_str", i);
 
                FunctdsecuL_3_8Models.Add(reqCommand);
            }
            return FunctdsecuL_3_8Models;
        }
 
        //逻辑_交易证券_指令_新增调仓指令
        public static List<FunctdsecuL_3_8Model> GetFunctdsecuL_3_8Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_8Models = new List<FunctdsecuL_3_8Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_3_8Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.comm_id_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_STR_STR);
                reqCommand.comm_appr_status_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_STATUS_STR_STR);
                FunctdsecuL_3_8Models.Add(reqCommand);
            }
            return FunctdsecuL_3_8Models;
        }
 
        //逻辑_交易证券_指令_新增组合指令
        public static List<FunctdsecuL_3_9Model> GetFunctdsecuL_3_9Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_9Models = new List<FunctdsecuL_3_9Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_9Model();
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
 
                FunctdsecuL_3_9Models.Add(reqCommand);
            }
            return FunctdsecuL_3_9Models;
        }
 
        //逻辑_交易证券_指令_新增组合指令
        public static List<FunctdsecuL_3_9Model> GetFunctdsecuL_3_9Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_9Models = new List<FunctdsecuL_3_9Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_3_9Model();
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
                FunctdsecuL_3_9Models.Add(reqCommand);
            }
            return FunctdsecuL_3_9Models;
        }
 
        //逻辑_交易证券_指令_查询指令
        public static List<FunctdsecuL_3_51Model> GetFunctdsecuL_3_51Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_51Models = new List<FunctdsecuL_3_51Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_51Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.comm_executor = packer.GetIntbyName("comm_executor", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.comm_date = packer.GetIntbyName("comm_date", i);
                reqCommand.comm_time = packer.GetIntbyName("comm_time", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.comm_dir = packer.GetIntbyName("comm_dir", i);
                reqCommand.comm_limit_price = packer.GetDoublebyName("comm_limit_price", i);
                reqCommand.limit_actual_price = packer.GetDoublebyName("limit_actual_price", i);
                reqCommand.comm_qty = packer.GetDoublebyName("comm_qty", i);
                reqCommand.comm_amt = packer.GetDoublebyName("comm_amt", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.comm_cancel_qty = packer.GetDoublebyName("comm_cancel_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.comm_frozen_amt = packer.GetDoublebyName("comm_frozen_amt", i);
                reqCommand.comm_frozen_qty = packer.GetDoublebyName("comm_frozen_qty", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
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
                reqCommand.basket_id = packer.GetInt64byName("basket_id", i);
                reqCommand.comm_oper_way = packer.GetStrbyName("comm_oper_way", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.comm_comple_flag = packer.GetIntbyName("comm_comple_flag", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.strategy_capt_qty = packer.GetDoublebyName("strategy_capt_qty", i);
                reqCommand.strategy_order_qty = packer.GetDoublebyName("strategy_order_qty", i);
                reqCommand.combo_code = packer.GetStrbyName("combo_code", i);
                reqCommand.contra_no = packer.GetStrbyName("contra_no", i);
                reqCommand.disp_opor = packer.GetIntbyName("disp_opor", i);
                reqCommand.disp_status = packer.GetIntbyName("disp_status", i);
                reqCommand.read_flag = packer.GetIntbyName("read_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.comm_remark_info = packer.GetStrbyName("comm_remark_info", i);
 
                FunctdsecuL_3_51Models.Add(reqCommand);
            }
            return FunctdsecuL_3_51Models;
        }
 
        //逻辑_交易证券_指令_查询指令
        public static List<FunctdsecuL_3_51Model> GetFunctdsecuL_3_51Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_51Models = new List<FunctdsecuL_3_51Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_3_51Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    reqCommand.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    reqCommand.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    reqCommand.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    reqCommand.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    reqCommand.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    reqCommand.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
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
                    reqCommand.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    reqCommand.comm_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.comm_comple_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_FLAG_INT);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.strategy_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CAPT_QTY_FLOAT);
                    reqCommand.strategy_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ORDER_QTY_FLOAT);
                    reqCommand.combo_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMBO_CODE_STR);
                    reqCommand.contra_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRA_NO_STR);
                    reqCommand.disp_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_OPOR_INT);
                    reqCommand.disp_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_STATUS_INT);
                    reqCommand.read_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_READ_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.comm_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR);
                    FunctdsecuL_3_51Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_3_51Models;
        }
 
        //逻辑_交易证券_指令_查询指令历史
        public static List<FunctdsecuL_3_52Model> GetFunctdsecuL_3_52Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_52Models = new List<FunctdsecuL_3_52Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_52Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.comm_executor = packer.GetIntbyName("comm_executor", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.comm_date = packer.GetIntbyName("comm_date", i);
                reqCommand.comm_time = packer.GetIntbyName("comm_time", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.comm_dir = packer.GetIntbyName("comm_dir", i);
                reqCommand.comm_limit_price = packer.GetDoublebyName("comm_limit_price", i);
                reqCommand.limit_actual_price = packer.GetDoublebyName("limit_actual_price", i);
                reqCommand.comm_qty = packer.GetDoublebyName("comm_qty", i);
                reqCommand.comm_amt = packer.GetDoublebyName("comm_amt", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.comm_cancel_qty = packer.GetDoublebyName("comm_cancel_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.comm_frozen_amt = packer.GetDoublebyName("comm_frozen_amt", i);
                reqCommand.comm_frozen_qty = packer.GetDoublebyName("comm_frozen_qty", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
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
                reqCommand.basket_id = packer.GetInt64byName("basket_id", i);
                reqCommand.comm_oper_way = packer.GetStrbyName("comm_oper_way", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.comm_comple_flag = packer.GetIntbyName("comm_comple_flag", i);
                reqCommand.strategy_capt_qty = packer.GetDoublebyName("strategy_capt_qty", i);
                reqCommand.strategy_order_qty = packer.GetDoublebyName("strategy_order_qty", i);
                reqCommand.contra_no = packer.GetStrbyName("contra_no", i);
                reqCommand.disp_opor = packer.GetIntbyName("disp_opor", i);
                reqCommand.disp_status = packer.GetIntbyName("disp_status", i);
                reqCommand.read_flag = packer.GetIntbyName("read_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.comm_remark_info = packer.GetStrbyName("comm_remark_info", i);
 
                FunctdsecuL_3_52Models.Add(reqCommand);
            }
            return FunctdsecuL_3_52Models;
        }
 
        //逻辑_交易证券_指令_查询指令历史
        public static List<FunctdsecuL_3_52Model> GetFunctdsecuL_3_52Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_52Models = new List<FunctdsecuL_3_52Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_3_52Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    reqCommand.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    reqCommand.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    reqCommand.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    reqCommand.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    reqCommand.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    reqCommand.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
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
                    reqCommand.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    reqCommand.comm_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.comm_comple_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_FLAG_INT);
                    reqCommand.strategy_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CAPT_QTY_FLOAT);
                    reqCommand.strategy_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ORDER_QTY_FLOAT);
                    reqCommand.contra_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRA_NO_STR);
                    reqCommand.disp_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_OPOR_INT);
                    reqCommand.disp_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DISP_STATUS_INT);
                    reqCommand.read_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_READ_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.comm_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR);
                    FunctdsecuL_3_52Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_3_52Models;
        }
 
        //逻辑_交易证券_指令_查询指令分发
        public static List<FunctdsecuL_3_53Model> GetFunctdsecuL_3_53Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_53Models = new List<FunctdsecuL_3_53Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_53Model();
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
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
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
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_3_53Models.Add(reqCommand);
            }
            return FunctdsecuL_3_53Models;
        }
 
        //逻辑_交易证券_指令_查询指令分发
        public static List<FunctdsecuL_3_53Model> GetFunctdsecuL_3_53Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_53Models = new List<FunctdsecuL_3_53Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_3_53Model();
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
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
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
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_3_53Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_3_53Models;
        }
 
        //逻辑_交易证券_指令_查询指令分发历史
        public static List<FunctdsecuL_3_54Model> GetFunctdsecuL_3_54Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_54Models = new List<FunctdsecuL_3_54Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_54Model();
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
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
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
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_3_54Models.Add(reqCommand);
            }
            return FunctdsecuL_3_54Models;
        }
 
        //逻辑_交易证券_指令_查询指令分发历史
        public static List<FunctdsecuL_3_54Model> GetFunctdsecuL_3_54Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_54Models = new List<FunctdsecuL_3_54Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_3_54Model();
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
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
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
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_3_54Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_3_54Models;
        }
 
        //逻辑_交易证券_指令_查询指令审批
        public static List<FunctdsecuL_3_55Model> GetFunctdsecuL_3_55Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_55Models = new List<FunctdsecuL_3_55Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_55Model();
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
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
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
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_3_55Models.Add(reqCommand);
            }
            return FunctdsecuL_3_55Models;
        }
 
        //逻辑_交易证券_指令_查询指令审批
        public static List<FunctdsecuL_3_55Model> GetFunctdsecuL_3_55Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_55Models = new List<FunctdsecuL_3_55Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_3_55Model();
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
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
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
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_3_55Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_3_55Models;
        }
 
        //逻辑_交易证券_指令_查询指令审批历史
        public static List<FunctdsecuL_3_56Model> GetFunctdsecuL_3_56Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_56Models = new List<FunctdsecuL_3_56Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_56Model();
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
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
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
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_3_56Models.Add(reqCommand);
            }
            return FunctdsecuL_3_56Models;
        }
 
        //逻辑_交易证券_指令_查询指令审批历史
        public static List<FunctdsecuL_3_56Model> GetFunctdsecuL_3_56Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_56Models = new List<FunctdsecuL_3_56Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_3_56Model();
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
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
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
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_3_56Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_3_56Models;
        }
 
        //逻辑_交易证券_指令_查询汇总指令
        public static List<FunctdsecuL_3_57Model> GetFunctdsecuL_3_57Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_57Models = new List<FunctdsecuL_3_57Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_57Model();
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
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.comm_executor = packer.GetIntbyName("comm_executor", i);
                reqCommand.comm_date = packer.GetIntbyName("comm_date", i);
                reqCommand.comm_time = packer.GetIntbyName("comm_time", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.comm_dir = packer.GetIntbyName("comm_dir", i);
                reqCommand.comm_limit_price = packer.GetDoublebyName("comm_limit_price", i);
                reqCommand.limit_actual_price = packer.GetDoublebyName("limit_actual_price", i);
                reqCommand.comm_qty = packer.GetDoublebyName("comm_qty", i);
                reqCommand.comm_amt = packer.GetDoublebyName("comm_amt", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.comm_cancel_qty = packer.GetDoublebyName("comm_cancel_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
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
                reqCommand.basket_id = packer.GetInt64byName("basket_id", i);
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
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.comm_remark_info = packer.GetStrbyName("comm_remark_info", i);
                reqCommand.read_flag = packer.GetIntbyName("read_flag", i);
                reqCommand.acco_concat_info = packer.GetStrbyName("acco_concat_info", i);
 
                FunctdsecuL_3_57Models.Add(reqCommand);
            }
            return FunctdsecuL_3_57Models;
        }
 
        //逻辑_交易证券_指令_查询汇总指令
        public static List<FunctdsecuL_3_57Model> GetFunctdsecuL_3_57Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_57Models = new List<FunctdsecuL_3_57Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_3_57Model();
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
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    reqCommand.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    reqCommand.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    reqCommand.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    reqCommand.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    reqCommand.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    reqCommand.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
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
                    reqCommand.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
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
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.comm_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR);
                    reqCommand.read_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_READ_FLAG_INT);
                    reqCommand.acco_concat_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR);
                    FunctdsecuL_3_57Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_3_57Models;
        }
 
        //逻辑_交易证券_指令_查询汇总指令历史
        public static List<FunctdsecuL_3_58Model> GetFunctdsecuL_3_58Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_58Models = new List<FunctdsecuL_3_58Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_58Model();
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
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.comm_executor = packer.GetIntbyName("comm_executor", i);
                reqCommand.comm_date = packer.GetIntbyName("comm_date", i);
                reqCommand.comm_time = packer.GetIntbyName("comm_time", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.comm_dir = packer.GetIntbyName("comm_dir", i);
                reqCommand.comm_limit_price = packer.GetDoublebyName("comm_limit_price", i);
                reqCommand.limit_actual_price = packer.GetDoublebyName("limit_actual_price", i);
                reqCommand.comm_qty = packer.GetDoublebyName("comm_qty", i);
                reqCommand.comm_amt = packer.GetDoublebyName("comm_amt", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.comm_cancel_qty = packer.GetDoublebyName("comm_cancel_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
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
                reqCommand.basket_id = packer.GetInt64byName("basket_id", i);
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
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.comm_remark_info = packer.GetStrbyName("comm_remark_info", i);
                reqCommand.read_flag = packer.GetIntbyName("read_flag", i);
                reqCommand.acco_concat_info = packer.GetStrbyName("acco_concat_info", i);
 
                FunctdsecuL_3_58Models.Add(reqCommand);
            }
            return FunctdsecuL_3_58Models;
        }
 
        //逻辑_交易证券_指令_查询汇总指令历史
        public static List<FunctdsecuL_3_58Model> GetFunctdsecuL_3_58Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_58Models = new List<FunctdsecuL_3_58Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_3_58Model();
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
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    reqCommand.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    reqCommand.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    reqCommand.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    reqCommand.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    reqCommand.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    reqCommand.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
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
                    reqCommand.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
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
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.comm_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR);
                    reqCommand.read_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_READ_FLAG_INT);
                    reqCommand.acco_concat_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ACCO_CONCAT_INFO_STR);
                    FunctdsecuL_3_58Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_3_58Models;
        }
 
        //逻辑_交易证券_指令_审批转发指令
        public static List<FunctdsecuL_3_64Model> GetFunctdsecuL_3_64Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_64Models = new List<FunctdsecuL_3_64Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_64Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
 
                FunctdsecuL_3_64Models.Add(reqCommand);
            }
            return FunctdsecuL_3_64Models;
        }
 
        //逻辑_交易证券_指令_审批转发指令
        public static List<FunctdsecuL_3_64Model> GetFunctdsecuL_3_64Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_64Models = new List<FunctdsecuL_3_64Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_3_64Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                FunctdsecuL_3_64Models.Add(reqCommand);
            }
            return FunctdsecuL_3_64Models;
        }
 
        //逻辑_交易证券_指令_查询转发审批指令
        public static List<FunctdsecuL_3_65Model> GetFunctdsecuL_3_65Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_65Models = new List<FunctdsecuL_3_65Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_65Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.comm_executor = packer.GetIntbyName("comm_executor", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.comm_date = packer.GetIntbyName("comm_date", i);
                reqCommand.comm_time = packer.GetIntbyName("comm_time", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.comm_dir = packer.GetIntbyName("comm_dir", i);
                reqCommand.comm_limit_price = packer.GetDoublebyName("comm_limit_price", i);
                reqCommand.limit_actual_price = packer.GetDoublebyName("limit_actual_price", i);
                reqCommand.comm_qty = packer.GetDoublebyName("comm_qty", i);
                reqCommand.comm_amt = packer.GetDoublebyName("comm_amt", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.comm_cancel_qty = packer.GetDoublebyName("comm_cancel_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.comm_frozen_amt = packer.GetDoublebyName("comm_frozen_amt", i);
                reqCommand.comm_frozen_qty = packer.GetDoublebyName("comm_frozen_qty", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.par_value = packer.GetDoublebyName("par_value", i);
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
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
                reqCommand.basket_id = packer.GetInt64byName("basket_id", i);
                reqCommand.comm_oper_way = packer.GetStrbyName("comm_oper_way", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.comm_comple_flag = packer.GetIntbyName("comm_comple_flag", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.comm_dispense_appr_status = packer.GetStrbyName("comm_dispense_appr_status", i);
                reqCommand.comm_dispense_appr_opor = packer.GetIntbyName("comm_dispense_appr_opor", i);
                reqCommand.comm_dispense_appr_date = packer.GetIntbyName("comm_dispense_appr_date", i);
                reqCommand.comm_dispense_appr_time = packer.GetIntbyName("comm_dispense_appr_time", i);
                reqCommand.comm_dispense_appr_remark = packer.GetStrbyName("comm_dispense_appr_remark", i);
                reqCommand.disp_remark = packer.GetStrbyName("disp_remark", i);
                reqCommand.before_comm_executor = packer.GetIntbyName("before_comm_executor", i);
                reqCommand.is_withdraw = packer.GetIntbyName("is_withdraw", i);
 
                FunctdsecuL_3_65Models.Add(reqCommand);
            }
            return FunctdsecuL_3_65Models;
        }
 
        //逻辑_交易证券_指令_查询转发审批指令
        public static List<FunctdsecuL_3_65Model> GetFunctdsecuL_3_65Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_65Models = new List<FunctdsecuL_3_65Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_3_65Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_EXECUTOR_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.comm_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DATE_INT);
                    reqCommand.comm_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TIME_INT);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.comm_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DIR_INT);
                    reqCommand.comm_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_LIMIT_PRICE_FLOAT);
                    reqCommand.limit_actual_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LIMIT_ACTUAL_PRICE_FLOAT);
                    reqCommand.comm_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_QTY_FLOAT);
                    reqCommand.comm_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_AMT_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.comm_cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CANCEL_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.comm_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_AMT_FLOAT);
                    reqCommand.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.par_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PAR_VALUE_FLOAT);
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
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
                    reqCommand.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    reqCommand.comm_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPER_WAY_STR);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.comm_comple_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_COMPLE_FLAG_INT);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.comm_dispense_appr_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISPENSE_APPR_STATUS_STR);
                    reqCommand.comm_dispense_appr_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISPENSE_APPR_OPOR_INT);
                    reqCommand.comm_dispense_appr_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISPENSE_APPR_DATE_INT);
                    reqCommand.comm_dispense_appr_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISPENSE_APPR_TIME_INT);
                    reqCommand.comm_dispense_appr_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_DISPENSE_APPR_REMARK_STR);
                    reqCommand.disp_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DISP_REMARK_STR);
                    reqCommand.before_comm_executor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEFORE_COMM_EXECUTOR_INT);
                    reqCommand.is_withdraw = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_WITHDRAW_INT);
                    FunctdsecuL_3_65Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_3_65Models;
        }
 
        //逻辑_交易证券_指令_融资融券新增指令
        public static List<FunctdsecuL_3_66Model> GetFunctdsecuL_3_66Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_66Models = new List<FunctdsecuL_3_66Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_66Model();
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
 
                FunctdsecuL_3_66Models.Add(reqCommand);
            }
            return FunctdsecuL_3_66Models;
        }
 
        //逻辑_交易证券_指令_融资融券新增指令
        public static List<FunctdsecuL_3_66Model> GetFunctdsecuL_3_66Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_66Models = new List<FunctdsecuL_3_66Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_3_66Model();
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
                FunctdsecuL_3_66Models.Add(reqCommand);
            }
            return FunctdsecuL_3_66Models;
        }
 
        //逻辑_交易证券_指令_融资融券审批指令
        public static List<FunctdsecuL_3_68Model> GetFunctdsecuL_3_68Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_68Models = new List<FunctdsecuL_3_68Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_68Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_status = packer.GetStrbyName("comm_status", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
 
                FunctdsecuL_3_68Models.Add(reqCommand);
            }
            return FunctdsecuL_3_68Models;
        }
 
        //逻辑_交易证券_指令_融资融券审批指令
        public static List<FunctdsecuL_3_68Model> GetFunctdsecuL_3_68Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_68Models = new List<FunctdsecuL_3_68Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_3_68Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.comm_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_STATUS_STR);
                reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                FunctdsecuL_3_68Models.Add(reqCommand);
            }
            return FunctdsecuL_3_68Models;
        }
 
        //逻辑_交易证券_指令_新分发指令
        public static List<FunctdsecuL_3_69Model> GetFunctdsecuL_3_69Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_69Models = new List<FunctdsecuL_3_69Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_69Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
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
 
                FunctdsecuL_3_69Models.Add(reqCommand);
            }
            return FunctdsecuL_3_69Models;
        }
 
        //逻辑_交易证券_指令_新分发指令
        public static List<FunctdsecuL_3_69Model> GetFunctdsecuL_3_69Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_69Models = new List<FunctdsecuL_3_69Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_3_69Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
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
                FunctdsecuL_3_69Models.Add(reqCommand);
            }
            return FunctdsecuL_3_69Models;
        }
 
        //逻辑_交易证券_指令_新增组合策略指令
        public static List<FunctdsecuL_3_70Model> GetFunctdsecuL_3_70Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_3_70Models = new List<FunctdsecuL_3_70Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_3_70Model();
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
 
                FunctdsecuL_3_70Models.Add(reqCommand);
            }
            return FunctdsecuL_3_70Models;
        }
 
        //逻辑_交易证券_指令_新增组合策略指令
        public static List<FunctdsecuL_3_70Model> GetFunctdsecuL_3_70Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_3_70Models = new List<FunctdsecuL_3_70Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_3_70Model();
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
                FunctdsecuL_3_70Models.Add(reqCommand);
            }
            return FunctdsecuL_3_70Models;
        }
 
    }
}
