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

    public static class TrdSecuStrategyIF
    {
        //逻辑_交易证券_策略接口_查询母单
        public static List<FunctdsecuL_11_101Model> GetFunctdsecuL_11_101Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_11_101Models = new List<FunctdsecuL_11_101Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_11_101Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.algo_order_id = packer.GetInt64byName("algo_order_id", i);
                reqCommand.seco_algo_order_id = packer.GetInt64byName("seco_algo_order_id", i);
                reqCommand.algo_exec_broker = packer.GetStrbyName("algo_exec_broker", i);
                reqCommand.algo_exec_comm_str = packer.GetStrbyName("algo_exec_comm_str", i);
                reqCommand.algo_exec_kind = packer.GetIntbyName("algo_exec_kind", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.algo_busi_type = packer.GetStrbyName("algo_busi_type", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.cash_order_qty = packer.GetDoublebyName("cash_order_qty", i);
                reqCommand.order_price = packer.GetDoublebyName("order_price", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.algo_valid_type = packer.GetIntbyName("algo_valid_type", i);
                reqCommand.algo_rule_way = packer.GetStrbyName("algo_rule_way", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.algo_order_time = packer.GetIntbyName("algo_order_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.busi_opor_no = packer.GetIntbyName("busi_opor_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.margin_trade_type = packer.GetIntbyName("margin_trade_type", i);
                reqCommand.target_strategy_type = packer.GetStrbyName("target_strategy_type", i);
                reqCommand.target_strategy_param = packer.GetStrbyName("target_strategy_param", i);
                reqCommand.external_no = packer.GetIntbyName("external_no", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.order_oper_way = packer.GetStrbyName("order_oper_way", i);
 
                FunctdsecuL_11_101Models.Add(reqCommand);
            }
            return FunctdsecuL_11_101Models;
        }
 
        //逻辑_交易证券_策略接口_查询母单
        public static List<FunctdsecuL_11_101Model> GetFunctdsecuL_11_101Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_11_101Models = new List<FunctdsecuL_11_101Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_11_101Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.algo_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_ORDER_ID_INT64);
                    reqCommand.seco_algo_order_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_SECO_ALGO_ORDER_ID_INT64);
                    reqCommand.algo_exec_broker = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_EXEC_BROKER_STR);
                    reqCommand.algo_exec_comm_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_EXEC_COMM_STR_STR);
                    reqCommand.algo_exec_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_EXEC_KIND_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.algo_busi_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_BUSI_TYPE_STR);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.cash_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ORDER_QTY_FLOAT);
                    reqCommand.order_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_PRICE_FLOAT);
                    reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    reqCommand.algo_valid_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_VALID_TYPE_INT);
                    reqCommand.algo_rule_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_RULE_WAY_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.algo_order_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALGO_ORDER_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.busi_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_OPOR_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.margin_trade_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_TRADE_TYPE_INT);
                    reqCommand.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                    reqCommand.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                    reqCommand.external_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.order_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_OPER_WAY_STR);
                    FunctdsecuL_11_101Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_11_101Models;
        }
 
    }
}
