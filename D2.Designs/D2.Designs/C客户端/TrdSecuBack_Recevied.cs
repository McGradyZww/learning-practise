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

    public static class TrdSecuBack
    {
        //逻辑_交易证券_交易运维_查询指令
        public static List<FunctdsecuL_10_31Model> GetFunctdsecuL_10_31Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_31Models = new List<FunctdsecuL_10_31Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_31Model();
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
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_10_31Models.Add(reqCommand);
            }
            return FunctdsecuL_10_31Models;
        }
 
        //逻辑_交易证券_交易运维_查询指令
        public static List<FunctdsecuL_10_31Model> GetFunctdsecuL_10_31Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_31Models = new List<FunctdsecuL_10_31Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_31Model();
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
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_10_31Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_31Models;
        }
 
        //逻辑_交易证券_交易运维_查询指令历史
        public static List<FunctdsecuL_10_32Model> GetFunctdsecuL_10_32Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_32Models = new List<FunctdsecuL_10_32Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_32Model();
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
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_10_32Models.Add(reqCommand);
            }
            return FunctdsecuL_10_32Models;
        }
 
        //逻辑_交易证券_交易运维_查询指令历史
        public static List<FunctdsecuL_10_32Model> GetFunctdsecuL_10_32Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_32Models = new List<FunctdsecuL_10_32Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_32Model();
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
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_10_32Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_32Models;
        }
 
        //逻辑_交易证券_交易运维_查询订单
        public static List<FunctdsecuL_10_41Model> GetFunctdsecuL_10_41Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_41Models = new List<FunctdsecuL_10_41Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_41Model();
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
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_10_41Models.Add(reqCommand);
            }
            return FunctdsecuL_10_41Models;
        }
 
        //逻辑_交易证券_交易运维_查询订单
        public static List<FunctdsecuL_10_41Model> GetFunctdsecuL_10_41Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_41Models = new List<FunctdsecuL_10_41Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_41Model();
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
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_10_41Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_41Models;
        }
 
        //逻辑_交易证券_交易运维_查询订单历史
        public static List<FunctdsecuL_10_42Model> GetFunctdsecuL_10_42Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_42Models = new List<FunctdsecuL_10_42Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_42Model();
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
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_10_42Models.Add(reqCommand);
            }
            return FunctdsecuL_10_42Models;
        }
 
        //逻辑_交易证券_交易运维_查询订单历史
        public static List<FunctdsecuL_10_42Model> GetFunctdsecuL_10_42Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_42Models = new List<FunctdsecuL_10_42Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_42Model();
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
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_10_42Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_42Models;
        }
 
        //逻辑_交易证券_交易运维_查询订单回报
        public static List<FunctdsecuL_10_51Model> GetFunctdsecuL_10_51Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_51Models = new List<FunctdsecuL_10_51Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_51Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
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
 
                FunctdsecuL_10_51Models.Add(reqCommand);
            }
            return FunctdsecuL_10_51Models;
        }
 
        //逻辑_交易证券_交易运维_查询订单回报
        public static List<FunctdsecuL_10_51Model> GetFunctdsecuL_10_51Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_51Models = new List<FunctdsecuL_10_51Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_51Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
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
                    FunctdsecuL_10_51Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_51Models;
        }
 
        //逻辑_交易证券_交易运维_查询成交回报
        public static List<FunctdsecuL_10_52Model> GetFunctdsecuL_10_52Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_52Models = new List<FunctdsecuL_10_52Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_52Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
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
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
 
                FunctdsecuL_10_52Models.Add(reqCommand);
            }
            return FunctdsecuL_10_52Models;
        }
 
        //逻辑_交易证券_交易运维_查询成交回报
        public static List<FunctdsecuL_10_52Model> GetFunctdsecuL_10_52Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_52Models = new List<FunctdsecuL_10_52Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_52Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
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
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    FunctdsecuL_10_52Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_52Models;
        }
 
        //逻辑_交易证券_交易运维_查询成交明细
        public static List<FunctdsecuL_10_53Model> GetFunctdsecuL_10_53Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_53Models = new List<FunctdsecuL_10_53Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_53Model();
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
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
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
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.strike_bond_accr_intrst = packer.GetDoublebyName("strike_bond_accr_intrst", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.record_valid_flag = packer.GetIntbyName("record_valid_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_10_53Models.Add(reqCommand);
            }
            return FunctdsecuL_10_53Models;
        }
 
        //逻辑_交易证券_交易运维_查询成交明细
        public static List<FunctdsecuL_10_53Model> GetFunctdsecuL_10_53Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_53Models = new List<FunctdsecuL_10_53Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_53Model();
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
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
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
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.strike_bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.record_valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_VALID_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_10_53Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_53Models;
        }
 
        //逻辑_交易证券_交易运维_查询成交明细历史
        public static List<FunctdsecuL_10_54Model> GetFunctdsecuL_10_54Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_54Models = new List<FunctdsecuL_10_54Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_54Model();
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
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
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
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.strike_bond_accr_intrst = packer.GetDoublebyName("strike_bond_accr_intrst", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.record_valid_flag = packer.GetIntbyName("record_valid_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_10_54Models.Add(reqCommand);
            }
            return FunctdsecuL_10_54Models;
        }
 
        //逻辑_交易证券_交易运维_查询成交明细历史
        public static List<FunctdsecuL_10_54Model> GetFunctdsecuL_10_54Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_54Models = new List<FunctdsecuL_10_54Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_54Model();
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
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
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
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.strike_bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.record_valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_VALID_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_10_54Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_54Models;
        }
 
        //逻辑_交易证券_交易运维_查询机构统计订单
        public static List<FunctdsecuL_10_55Model> GetFunctdsecuL_10_55Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_55Models = new List<FunctdsecuL_10_55Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_55Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.order_status = packer.GetStrbyName("order_status", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
 
                FunctdsecuL_10_55Models.Add(reqCommand);
            }
            return FunctdsecuL_10_55Models;
        }
 
        //逻辑_交易证券_交易运维_查询机构统计订单
        public static List<FunctdsecuL_10_55Model> GetFunctdsecuL_10_55Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_55Models = new List<FunctdsecuL_10_55Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_55Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.order_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_STATUS_STR);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    FunctdsecuL_10_55Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_55Models;
        }
 
        //逻辑_交易证券_交易运维_查询机构统计异常订单
        public static List<FunctdsecuL_10_60Model> GetFunctdsecuL_10_60Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_60Models = new List<FunctdsecuL_10_60Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_60Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.no_report_cnt = packer.GetIntbyName("no_report_cnt", i);
                reqCommand.already_report_cnt = packer.GetIntbyName("already_report_cnt", i);
                reqCommand.wait_report_cnt = packer.GetIntbyName("wait_report_cnt", i);
                reqCommand.wait_report_except_cnt = packer.GetIntbyName("wait_report_except_cnt", i);
                reqCommand.in_report_cnt = packer.GetIntbyName("in_report_cnt", i);
                reqCommand.in_report_except_cnt = packer.GetIntbyName("in_report_except_cnt", i);
                reqCommand.wait_cancel_cnt = packer.GetIntbyName("wait_cancel_cnt", i);
                reqCommand.wait_cancel_except_cnt = packer.GetIntbyName("wait_cancel_except_cnt", i);
                reqCommand.part_cancel_cnt = packer.GetIntbyName("part_cancel_cnt", i);
                reqCommand.all_cancel_cnt = packer.GetIntbyName("all_cancel_cnt", i);
                reqCommand.part_strike_cnt = packer.GetIntbyName("part_strike_cnt", i);
                reqCommand.all_strike_cnt = packer.GetIntbyName("all_strike_cnt", i);
                reqCommand.abolish_cnt = packer.GetIntbyName("abolish_cnt", i);
 
                FunctdsecuL_10_60Models.Add(reqCommand);
            }
            return FunctdsecuL_10_60Models;
        }
 
        //逻辑_交易证券_交易运维_查询机构统计异常订单
        public static List<FunctdsecuL_10_60Model> GetFunctdsecuL_10_60Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_60Models = new List<FunctdsecuL_10_60Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_60Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.no_report_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NO_REPORT_CNT_INT);
                    reqCommand.already_report_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALREADY_REPORT_CNT_INT);
                    reqCommand.wait_report_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WAIT_REPORT_CNT_INT);
                    reqCommand.wait_report_except_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WAIT_REPORT_EXCEPT_CNT_INT);
                    reqCommand.in_report_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IN_REPORT_CNT_INT);
                    reqCommand.in_report_except_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IN_REPORT_EXCEPT_CNT_INT);
                    reqCommand.wait_cancel_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WAIT_CANCEL_CNT_INT);
                    reqCommand.wait_cancel_except_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WAIT_CANCEL_EXCEPT_CNT_INT);
                    reqCommand.part_cancel_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PART_CANCEL_CNT_INT);
                    reqCommand.all_cancel_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALL_CANCEL_CNT_INT);
                    reqCommand.part_strike_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PART_STRIKE_CNT_INT);
                    reqCommand.all_strike_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALL_STRIKE_CNT_INT);
                    reqCommand.abolish_cnt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ABOLISH_CNT_INT);
                    FunctdsecuL_10_60Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_60Models;
        }
 
        //逻辑_交易证券_交易运维_查询指令汇总考核
        public static List<FunctdsecuL_10_61Model> GetFunctdsecuL_10_61Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_61Models = new List<FunctdsecuL_10_61Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_61Model();
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
                reqCommand.valid_aver_price = packer.GetDoublebyName("valid_aver_price", i);
                reqCommand.valid_aver_price_allday = packer.GetDoublebyName("valid_aver_price_allday", i);
                reqCommand.exec_price_diff = packer.GetDoublebyName("exec_price_diff", i);
                reqCommand.exec_price_diff_allday = packer.GetDoublebyName("exec_price_diff_allday", i);
                reqCommand.valid_ratio = packer.GetDoublebyName("valid_ratio", i);
                reqCommand.valid_ratio_allday = packer.GetDoublebyName("valid_ratio_allday", i);
                reqCommand.valid_qty = packer.GetDoublebyName("valid_qty", i);
                reqCommand.valid_qty_allday = packer.GetDoublebyName("valid_qty_allday", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.comm_remark_info = packer.GetStrbyName("comm_remark_info", i);
 
                FunctdsecuL_10_61Models.Add(reqCommand);
            }
            return FunctdsecuL_10_61Models;
        }
 
        //逻辑_交易证券_交易运维_查询指令汇总考核
        public static List<FunctdsecuL_10_61Model> GetFunctdsecuL_10_61Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_61Models = new List<FunctdsecuL_10_61Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_61Model();
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
                    reqCommand.valid_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_AVER_PRICE_FLOAT);
                    reqCommand.valid_aver_price_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_AVER_PRICE_ALLDAY_FLOAT);
                    reqCommand.exec_price_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_DIFF_FLOAT);
                    reqCommand.exec_price_diff_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_DIFF_ALLDAY_FLOAT);
                    reqCommand.valid_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_RATIO_FLOAT);
                    reqCommand.valid_ratio_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_RATIO_ALLDAY_FLOAT);
                    reqCommand.valid_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_QTY_FLOAT);
                    reqCommand.valid_qty_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_QTY_ALLDAY_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.comm_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR);
                    FunctdsecuL_10_61Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_61Models;
        }
 
        //逻辑_交易证券_交易运维_查询指令汇总考核历史
        public static List<FunctdsecuL_10_62Model> GetFunctdsecuL_10_62Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_62Models = new List<FunctdsecuL_10_62Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_62Model();
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
                reqCommand.valid_aver_price = packer.GetDoublebyName("valid_aver_price", i);
                reqCommand.valid_aver_price_allday = packer.GetDoublebyName("valid_aver_price_allday", i);
                reqCommand.exec_price_diff = packer.GetDoublebyName("exec_price_diff", i);
                reqCommand.exec_price_diff_allday = packer.GetDoublebyName("exec_price_diff_allday", i);
                reqCommand.valid_ratio = packer.GetDoublebyName("valid_ratio", i);
                reqCommand.valid_ratio_allday = packer.GetDoublebyName("valid_ratio_allday", i);
                reqCommand.valid_qty = packer.GetDoublebyName("valid_qty", i);
                reqCommand.valid_qty_allday = packer.GetDoublebyName("valid_qty_allday", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.comm_remark_info = packer.GetStrbyName("comm_remark_info", i);
 
                FunctdsecuL_10_62Models.Add(reqCommand);
            }
            return FunctdsecuL_10_62Models;
        }
 
        //逻辑_交易证券_交易运维_查询指令汇总考核历史
        public static List<FunctdsecuL_10_62Model> GetFunctdsecuL_10_62Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_62Models = new List<FunctdsecuL_10_62Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_62Model();
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
                    reqCommand.valid_aver_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_AVER_PRICE_FLOAT);
                    reqCommand.valid_aver_price_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_AVER_PRICE_ALLDAY_FLOAT);
                    reqCommand.exec_price_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_DIFF_FLOAT);
                    reqCommand.exec_price_diff_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRICE_DIFF_ALLDAY_FLOAT);
                    reqCommand.valid_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_RATIO_FLOAT);
                    reqCommand.valid_ratio_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_RATIO_ALLDAY_FLOAT);
                    reqCommand.valid_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_QTY_FLOAT);
                    reqCommand.valid_qty_allday = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_QTY_ALLDAY_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.comm_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMM_REMARK_INFO_STR);
                    FunctdsecuL_10_62Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_62Models;
        }
 
        //逻辑_交易证券_交易运维_查询所有指令汇总
        public static List<FunctdsecuL_10_64Model> GetFunctdsecuL_10_64Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_64Models = new List<FunctdsecuL_10_64Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_64Model();
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
 
                FunctdsecuL_10_64Models.Add(reqCommand);
            }
            return FunctdsecuL_10_64Models;
        }
 
        //逻辑_交易证券_交易运维_查询所有指令汇总
        public static List<FunctdsecuL_10_64Model> GetFunctdsecuL_10_64Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_64Models = new List<FunctdsecuL_10_64Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_64Model();
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
                    FunctdsecuL_10_64Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_64Models;
        }
 
        //逻辑_交易证券_交易运维_查询运维订单回报
        public static List<FunctdsecuL_10_65Model> GetFunctdsecuL_10_65Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_65Models = new List<FunctdsecuL_10_65Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_65Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
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
 
                FunctdsecuL_10_65Models.Add(reqCommand);
            }
            return FunctdsecuL_10_65Models;
        }
 
        //逻辑_交易证券_交易运维_查询运维订单回报
        public static List<FunctdsecuL_10_65Model> GetFunctdsecuL_10_65Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_65Models = new List<FunctdsecuL_10_65Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_65Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
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
                    FunctdsecuL_10_65Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_65Models;
        }
 
        //逻辑_交易证券_交易运维_查询运维成交回报
        public static List<FunctdsecuL_10_66Model> GetFunctdsecuL_10_66Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_66Models = new List<FunctdsecuL_10_66Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_66Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
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
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
 
                FunctdsecuL_10_66Models.Add(reqCommand);
            }
            return FunctdsecuL_10_66Models;
        }
 
        //逻辑_交易证券_交易运维_查询运维成交回报
        public static List<FunctdsecuL_10_66Model> GetFunctdsecuL_10_66Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_66Models = new List<FunctdsecuL_10_66Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_66Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
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
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    FunctdsecuL_10_66Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_66Models;
        }
 
        //逻辑_交易证券_交易运维_查询运维成交明细
        public static List<FunctdsecuL_10_67Model> GetFunctdsecuL_10_67Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_67Models = new List<FunctdsecuL_10_67Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_67Model();
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
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.strike_date = packer.GetIntbyName("strike_date", i);
                reqCommand.strike_time = packer.GetIntbyName("strike_time", i);
                reqCommand.strike_no = packer.GetStrbyName("strike_no", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_time = packer.GetIntbyName("order_time", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
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
                reqCommand.bond_accr_intrst = packer.GetDoublebyName("bond_accr_intrst", i);
                reqCommand.strike_bond_accr_intrst = packer.GetDoublebyName("strike_bond_accr_intrst", i);
                reqCommand.net_price_flag = packer.GetIntbyName("net_price_flag", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.record_valid_flag = packer.GetIntbyName("record_valid_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_10_67Models.Add(reqCommand);
            }
            return FunctdsecuL_10_67Models;
        }
 
        //逻辑_交易证券_交易运维_查询运维成交明细
        public static List<FunctdsecuL_10_67Model> GetFunctdsecuL_10_67Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_67Models = new List<FunctdsecuL_10_67Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_67Model();
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
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.strike_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DATE_INT);
                    reqCommand.strike_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_TIME_INT);
                    reqCommand.strike_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_NO_STR);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_TIME_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
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
                    reqCommand.bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.strike_bond_accr_intrst = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_BOND_ACCR_INTRST_FLOAT);
                    reqCommand.net_price_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_NET_PRICE_FLAG_INT);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.record_valid_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_VALID_FLAG_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_10_67Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_67Models;
        }
 
        //逻辑_交易证券_交易运维_查询报盘信息
        public static List<FunctdsecuL_10_68Model> GetFunctdsecuL_10_68Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_68Models = new List<FunctdsecuL_10_68Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_68Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.offer_type = packer.GetStrbyName("offer_type", i);
                reqCommand.offer_name = packer.GetStrbyName("offer_name", i);
                reqCommand.offer_server_name = packer.GetStrbyName("offer_server_name", i);
                reqCommand.offer_server_ip = packer.GetStrbyName("offer_server_ip", i);
                reqCommand.offer_server_port = packer.GetIntbyName("offer_server_port", i);
 
                FunctdsecuL_10_68Models.Add(reqCommand);
            }
            return FunctdsecuL_10_68Models;
        }
 
        //逻辑_交易证券_交易运维_查询报盘信息
        public static List<FunctdsecuL_10_68Model> GetFunctdsecuL_10_68Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_68Models = new List<FunctdsecuL_10_68Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_68Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.offer_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_TYPE_STR);
                    reqCommand.offer_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_NAME_STR);
                    reqCommand.offer_server_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_SERVER_NAME_STR);
                    reqCommand.offer_server_ip = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_SERVER_IP_STR);
                    reqCommand.offer_server_port = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OFFER_SERVER_PORT_INT);
                    FunctdsecuL_10_68Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_68Models;
        }
 
        //逻辑_交易证券_交易运维_查询运维撤单流水
        public static List<FunctdsecuL_10_69Model> GetFunctdsecuL_10_69Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_69Models = new List<FunctdsecuL_10_69Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_69Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
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
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.wtdraw_batch_no = packer.GetIntbyName("wtdraw_batch_no", i);
                reqCommand.wtdraw_date = packer.GetIntbyName("wtdraw_date", i);
                reqCommand.wtdraw_time = packer.GetIntbyName("wtdraw_time", i);
                reqCommand.order_date = packer.GetIntbyName("order_date", i);
                reqCommand.order_id = packer.GetInt64byName("order_id", i);
                reqCommand.report_date = packer.GetIntbyName("report_date", i);
                reqCommand.report_time = packer.GetIntbyName("report_time", i);
                reqCommand.report_no = packer.GetStrbyName("report_no", i);
                reqCommand.wtdraw_status = packer.GetStrbyName("wtdraw_status", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.wtdraw_remark = packer.GetStrbyName("wtdraw_remark", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_10_69Models.Add(reqCommand);
            }
            return FunctdsecuL_10_69Models;
        }
 
        //逻辑_交易证券_交易运维_查询运维撤单流水
        public static List<FunctdsecuL_10_69Model> GetFunctdsecuL_10_69Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_69Models = new List<FunctdsecuL_10_69Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_69Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
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
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.wtdraw_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_BATCH_NO_INT);
                    reqCommand.wtdraw_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_DATE_INT);
                    reqCommand.wtdraw_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_TIME_INT);
                    reqCommand.order_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DATE_INT);
                    reqCommand.order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_ID_INT64);
                    reqCommand.report_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_DATE_INT);
                    reqCommand.report_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_TIME_INT);
                    reqCommand.report_no = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REPORT_NO_STR);
                    reqCommand.wtdraw_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_STATUS_STR);
                    reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    reqCommand.wtdraw_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_REMARK_STR);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_10_69Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_69Models;
        }
 
        //逻辑_交易证券_交易运维_查询场外基金成交回报表
        public static List<FunctdsecuL_10_71Model> GetFunctdsecuL_10_71Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_71Models = new List<FunctdsecuL_10_71Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_71Model();
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
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.strike_price = packer.GetDoublebyName("strike_price", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.strike_deal_type = packer.GetIntbyName("strike_deal_type", i);
                reqCommand.rsp_info = packer.GetStrbyName("rsp_info", i);
 
                FunctdsecuL_10_71Models.Add(reqCommand);
            }
            return FunctdsecuL_10_71Models;
        }
 
        //逻辑_交易证券_交易运维_查询场外基金成交回报表
        public static List<FunctdsecuL_10_71Model> GetFunctdsecuL_10_71Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_71Models = new List<FunctdsecuL_10_71Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_71Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
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
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.strike_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_PRICE_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.strike_deal_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_DEAL_TYPE_INT);
                    reqCommand.rsp_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RSP_INFO_STR);
                    FunctdsecuL_10_71Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_71Models;
        }
 
        //逻辑_交易证券_交易运维_查询所有交易组持仓
        public static List<FunctdsecuL_10_73Model> GetFunctdsecuL_10_73Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_10_73Models = new List<FunctdsecuL_10_73Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_10_73Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.begin_qty = packer.GetDoublebyName("begin_qty", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.frozen_qty = packer.GetDoublebyName("frozen_qty", i);
                reqCommand.unfroz_qty = packer.GetDoublebyName("unfroz_qty", i);
                reqCommand.comm_frozen_qty = packer.GetDoublebyName("comm_frozen_qty", i);
                reqCommand.comm_unfroz_qty = packer.GetDoublebyName("comm_unfroz_qty", i);
                reqCommand.comm_capt_qty = packer.GetDoublebyName("comm_capt_qty", i);
                reqCommand.comm_releas_qty = packer.GetDoublebyName("comm_releas_qty", i);
                reqCommand.trade_frozen_qty = packer.GetDoublebyName("trade_frozen_qty", i);
                reqCommand.trade_unfroz_qty = packer.GetDoublebyName("trade_unfroz_qty", i);
                reqCommand.trade_capt_qty = packer.GetDoublebyName("trade_capt_qty", i);
                reqCommand.trade_releas_qty = packer.GetDoublebyName("trade_releas_qty", i);
                reqCommand.strike_capt_qty = packer.GetDoublebyName("strike_capt_qty", i);
                reqCommand.strike_releas_qty = packer.GetDoublebyName("strike_releas_qty", i);
                reqCommand.strike_frozen_qty = packer.GetDoublebyName("strike_frozen_qty", i);
                reqCommand.strike_unfroz_qty = packer.GetDoublebyName("strike_unfroz_qty", i);
                reqCommand.cost_amt = packer.GetDoublebyName("cost_amt", i);
                reqCommand.intrst_cost_amt = packer.GetDoublebyName("intrst_cost_amt", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.intrst_pandl = packer.GetDoublebyName("intrst_pandl", i);
 
                FunctdsecuL_10_73Models.Add(reqCommand);
            }
            return FunctdsecuL_10_73Models;
        }
 
        //逻辑_交易证券_交易运维_查询所有交易组持仓
        public static List<FunctdsecuL_10_73Model> GetFunctdsecuL_10_73Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_10_73Models = new List<FunctdsecuL_10_73Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_10_73Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.begin_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_QTY_FLOAT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FROZEN_QTY_FLOAT);
                    reqCommand.unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_FROZEN_QTY_FLOAT);
                    reqCommand.comm_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_UNFROZ_QTY_FLOAT);
                    reqCommand.comm_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_CAPT_QTY_FLOAT);
                    reqCommand.comm_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_RELEAS_QTY_FLOAT);
                    reqCommand.trade_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_FROZEN_QTY_FLOAT);
                    reqCommand.trade_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_UNFROZ_QTY_FLOAT);
                    reqCommand.trade_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_CAPT_QTY_FLOAT);
                    reqCommand.trade_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_capt_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_CAPT_QTY_FLOAT);
                    reqCommand.strike_releas_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_RELEAS_QTY_FLOAT);
                    reqCommand.strike_frozen_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_FROZEN_QTY_FLOAT);
                    reqCommand.strike_unfroz_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_UNFROZ_QTY_FLOAT);
                    reqCommand.cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_AMT_FLOAT);
                    reqCommand.intrst_cost_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_COST_AMT_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.intrst_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_INTRST_PANDL_FLOAT);
                    FunctdsecuL_10_73Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_10_73Models;
        }
 
    }
}
