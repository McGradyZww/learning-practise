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

    public static class TrdSecuStrategy
    {
        //逻辑_交易证券_策略_策略插件上线
        public static List<FunctdsecuL_11_1Model> GetFunctdsecuL_11_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_11_1Models = new List<FunctdsecuL_11_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_11_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.strategy_plugin_status = packer.GetStrbyName("strategy_plugin_status", i);
 
                FunctdsecuL_11_1Models.Add(reqCommand);
            }
            return FunctdsecuL_11_1Models;
        }
 
        //逻辑_交易证券_策略_策略插件上线
        public static List<FunctdsecuL_11_1Model> GetFunctdsecuL_11_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_11_1Models = new List<FunctdsecuL_11_1Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_11_1Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.strategy_plugin_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PLUGIN_STATUS_STR);
                FunctdsecuL_11_1Models.Add(reqCommand);
            }
            return FunctdsecuL_11_1Models;
        }
 
        //逻辑_交易证券_策略_策略插件下线
        public static List<FunctdsecuL_11_2Model> GetFunctdsecuL_11_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_11_2Models = new List<FunctdsecuL_11_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_11_2Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.strategy_plugin_status = packer.GetStrbyName("strategy_plugin_status", i);
 
                FunctdsecuL_11_2Models.Add(reqCommand);
            }
            return FunctdsecuL_11_2Models;
        }
 
        //逻辑_交易证券_策略_策略插件下线
        public static List<FunctdsecuL_11_2Model> GetFunctdsecuL_11_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_11_2Models = new List<FunctdsecuL_11_2Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_11_2Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.strategy_plugin_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PLUGIN_STATUS_STR);
                FunctdsecuL_11_2Models.Add(reqCommand);
            }
            return FunctdsecuL_11_2Models;
        }
 
        //逻辑_交易证券_策略_新增策略
        public static List<FunctdsecuL_11_11Model> GetFunctdsecuL_11_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_11_11Models = new List<FunctdsecuL_11_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_11_11Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.strategy_id = packer.GetInt64byName("strategy_id", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.strategy_dir = packer.GetIntbyName("strategy_dir", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.strategy_time = packer.GetIntbyName("strategy_time", i);
                reqCommand.target_strategy_type = packer.GetStrbyName("target_strategy_type", i);
                reqCommand.target_strategy_param = packer.GetStrbyName("target_strategy_param", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.strategy_oper_way = packer.GetStrbyName("strategy_oper_way", i);
 
                FunctdsecuL_11_11Models.Add(reqCommand);
            }
            return FunctdsecuL_11_11Models;
        }
 
        //逻辑_交易证券_策略_新增策略
        public static List<FunctdsecuL_11_11Model> GetFunctdsecuL_11_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_11_11Models = new List<FunctdsecuL_11_11Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_11_11Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.strategy_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT);
                reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                reqCommand.strategy_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TIME_INT);
                reqCommand.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                reqCommand.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                reqCommand.strategy_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR);
                FunctdsecuL_11_11Models.Add(reqCommand);
            }
            return FunctdsecuL_11_11Models;
        }
 
        //逻辑_交易证券_策略_暂停策略
        public static List<FunctdsecuL_11_12Model> GetFunctdsecuL_11_12Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_11_12Models = new List<FunctdsecuL_11_12Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_11_12Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.strategy_id = packer.GetInt64byName("strategy_id", i);
                reqCommand.orig_strategy_id = packer.GetInt64byName("orig_strategy_id", i);
                reqCommand.strategy_time = packer.GetIntbyName("strategy_time", i);
                reqCommand.target_strategy_type = packer.GetStrbyName("target_strategy_type", i);
                reqCommand.target_strategy_param = packer.GetStrbyName("target_strategy_param", i);
                reqCommand.strategy_contr_comm = packer.GetStrbyName("strategy_contr_comm", i);
 
                FunctdsecuL_11_12Models.Add(reqCommand);
            }
            return FunctdsecuL_11_12Models;
        }
 
        //逻辑_交易证券_策略_暂停策略
        public static List<FunctdsecuL_11_12Model> GetFunctdsecuL_11_12Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_11_12Models = new List<FunctdsecuL_11_12Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_11_12Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                reqCommand.orig_strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_STRATEGY_ID_INT64);
                reqCommand.strategy_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TIME_INT);
                reqCommand.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                reqCommand.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                reqCommand.strategy_contr_comm = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CONTR_COMM_STR);
                FunctdsecuL_11_12Models.Add(reqCommand);
            }
            return FunctdsecuL_11_12Models;
        }
 
        //逻辑_交易证券_策略_重启策略
        public static List<FunctdsecuL_11_13Model> GetFunctdsecuL_11_13Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_11_13Models = new List<FunctdsecuL_11_13Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_11_13Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.strategy_id = packer.GetInt64byName("strategy_id", i);
                reqCommand.orig_strategy_id = packer.GetInt64byName("orig_strategy_id", i);
                reqCommand.strategy_time = packer.GetIntbyName("strategy_time", i);
                reqCommand.target_strategy_type = packer.GetStrbyName("target_strategy_type", i);
                reqCommand.target_strategy_param = packer.GetStrbyName("target_strategy_param", i);
                reqCommand.strategy_contr_comm = packer.GetStrbyName("strategy_contr_comm", i);
 
                FunctdsecuL_11_13Models.Add(reqCommand);
            }
            return FunctdsecuL_11_13Models;
        }
 
        //逻辑_交易证券_策略_重启策略
        public static List<FunctdsecuL_11_13Model> GetFunctdsecuL_11_13Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_11_13Models = new List<FunctdsecuL_11_13Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_11_13Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                reqCommand.orig_strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_STRATEGY_ID_INT64);
                reqCommand.strategy_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TIME_INT);
                reqCommand.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                reqCommand.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                reqCommand.strategy_contr_comm = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CONTR_COMM_STR);
                FunctdsecuL_11_13Models.Add(reqCommand);
            }
            return FunctdsecuL_11_13Models;
        }
 
        //逻辑_交易证券_策略_撤销策略
        public static List<FunctdsecuL_11_14Model> GetFunctdsecuL_11_14Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_11_14Models = new List<FunctdsecuL_11_14Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_11_14Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.strategy_id = packer.GetInt64byName("strategy_id", i);
                reqCommand.orig_strategy_id = packer.GetInt64byName("orig_strategy_id", i);
                reqCommand.strategy_time = packer.GetIntbyName("strategy_time", i);
                reqCommand.target_strategy_type = packer.GetStrbyName("target_strategy_type", i);
                reqCommand.target_strategy_param = packer.GetStrbyName("target_strategy_param", i);
 
                FunctdsecuL_11_14Models.Add(reqCommand);
            }
            return FunctdsecuL_11_14Models;
        }
 
        //逻辑_交易证券_策略_撤销策略
        public static List<FunctdsecuL_11_14Model> GetFunctdsecuL_11_14Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_11_14Models = new List<FunctdsecuL_11_14Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_11_14Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                reqCommand.orig_strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_STRATEGY_ID_INT64);
                reqCommand.strategy_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TIME_INT);
                reqCommand.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                reqCommand.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                FunctdsecuL_11_14Models.Add(reqCommand);
            }
            return FunctdsecuL_11_14Models;
        }
 
        //逻辑_交易证券_策略_更新策略执行情况
        public static List<FunctdsecuL_11_15Model> GetFunctdsecuL_11_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_11_15Models = new List<FunctdsecuL_11_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_11_15Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.strategy_id = packer.GetInt64byName("strategy_id", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.strategy_dir = packer.GetIntbyName("strategy_dir", i);
                reqCommand.strategy_oper_way = packer.GetStrbyName("strategy_oper_way", i);
 
                FunctdsecuL_11_15Models.Add(reqCommand);
            }
            return FunctdsecuL_11_15Models;
        }
 
        //逻辑_交易证券_策略_更新策略执行情况
        public static List<FunctdsecuL_11_15Model> GetFunctdsecuL_11_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_11_15Models = new List<FunctdsecuL_11_15Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_11_15Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.strategy_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT);
                reqCommand.strategy_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR);
                FunctdsecuL_11_15Models.Add(reqCommand);
            }
            return FunctdsecuL_11_15Models;
        }
 
        //逻辑_交易证券_策略_更新策略状态
        public static List<FunctdsecuL_11_16Model> GetFunctdsecuL_11_16Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_11_16Models = new List<FunctdsecuL_11_16Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_11_16Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.orig_strategy_id = packer.GetInt64byName("orig_strategy_id", i);
                reqCommand.strategy_id = packer.GetInt64byName("strategy_id", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.strategy_dir = packer.GetIntbyName("strategy_dir", i);
                reqCommand.strategy_status = packer.GetStrbyName("strategy_status", i);
                reqCommand.strategy_oper_way = packer.GetStrbyName("strategy_oper_way", i);
 
                FunctdsecuL_11_16Models.Add(reqCommand);
            }
            return FunctdsecuL_11_16Models;
        }
 
        //逻辑_交易证券_策略_更新策略状态
        public static List<FunctdsecuL_11_16Model> GetFunctdsecuL_11_16Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_11_16Models = new List<FunctdsecuL_11_16Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FunctdsecuL_11_16Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.orig_strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_STRATEGY_ID_INT64);
                reqCommand.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                reqCommand.strategy_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT);
                reqCommand.strategy_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_STATUS_STR);
                reqCommand.strategy_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR);
                FunctdsecuL_11_16Models.Add(reqCommand);
            }
            return FunctdsecuL_11_16Models;
        }
 
        //逻辑_交易证券_策略_查询策略
        public static List<FunctdsecuL_11_101Model> GetFunctdsecuL_11_101Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_11_101Models = new List<FunctdsecuL_11_101Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_11_101Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.strategy_id = packer.GetInt64byName("strategy_id", i);
                reqCommand.orig_strategy_id = packer.GetInt64byName("orig_strategy_id", i);
                reqCommand.strategy_exec_broker = packer.GetStrbyName("strategy_exec_broker", i);
                reqCommand.strategy_exec_kind = packer.GetIntbyName("strategy_exec_kind", i);
                reqCommand.strategy_exec_comm_str = packer.GetStrbyName("strategy_exec_comm_str", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.strategy_dir = packer.GetIntbyName("strategy_dir", i);
                reqCommand.strategy_qty = packer.GetDoublebyName("strategy_qty", i);
                reqCommand.cash_strategy_qty = packer.GetDoublebyName("cash_strategy_qty", i);
                reqCommand.strategy_price = packer.GetDoublebyName("strategy_price", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.strategy_valid_type = packer.GetIntbyName("strategy_valid_type", i);
                reqCommand.strategy_rule_way = packer.GetStrbyName("strategy_rule_way", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.strategy_time = packer.GetIntbyName("strategy_time", i);
                reqCommand.margin_trade_type = packer.GetIntbyName("margin_trade_type", i);
                reqCommand.target_strategy_type = packer.GetStrbyName("target_strategy_type", i);
                reqCommand.target_strategy_param = packer.GetStrbyName("target_strategy_param", i);
                reqCommand.strategy_contr_comm = packer.GetStrbyName("strategy_contr_comm", i);
                reqCommand.strategy_status = packer.GetStrbyName("strategy_status", i);
                reqCommand.strategy_deal_status = packer.GetStrbyName("strategy_deal_status", i);
                reqCommand.strategy_deal_kind = packer.GetIntbyName("strategy_deal_kind", i);
                reqCommand.strategy_amt = packer.GetDoublebyName("strategy_amt", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_amt = packer.GetDoublebyName("order_amt", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.strategy_oper_way = packer.GetStrbyName("strategy_oper_way", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
                reqCommand.strategy_batch_no = packer.GetIntbyName("strategy_batch_no", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
 
                FunctdsecuL_11_101Models.Add(reqCommand);
            }
            return FunctdsecuL_11_101Models;
        }
 
        //逻辑_交易证券_策略_查询策略
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
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                    reqCommand.orig_strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_STRATEGY_ID_INT64);
                    reqCommand.strategy_exec_broker = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_BROKER_STR);
                    reqCommand.strategy_exec_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_KIND_INT);
                    reqCommand.strategy_exec_comm_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_COMM_STR_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.strategy_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT);
                    reqCommand.strategy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_QTY_FLOAT);
                    reqCommand.cash_strategy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_STRATEGY_QTY_FLOAT);
                    reqCommand.strategy_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PRICE_FLOAT);
                    reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    reqCommand.strategy_valid_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_VALID_TYPE_INT);
                    reqCommand.strategy_rule_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_RULE_WAY_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.strategy_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TIME_INT);
                    reqCommand.margin_trade_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_TRADE_TYPE_INT);
                    reqCommand.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                    reqCommand.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                    reqCommand.strategy_contr_comm = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CONTR_COMM_STR);
                    reqCommand.strategy_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_STATUS_STR);
                    reqCommand.strategy_deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_STATUS_STR);
                    reqCommand.strategy_deal_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_KIND_INT);
                    reqCommand.strategy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_AMT_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_AMT_FLOAT);
                    reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.strategy_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    reqCommand.strategy_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_BATCH_NO_INT);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    FunctdsecuL_11_101Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_11_101Models;
        }
 
        //逻辑_交易证券_策略_插件查询策略
        public static List<FunctdsecuL_11_102Model> GetFunctdsecuL_11_102Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_11_102Models = new List<FunctdsecuL_11_102Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_11_102Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.strategy_id = packer.GetInt64byName("strategy_id", i);
                reqCommand.orig_strategy_id = packer.GetInt64byName("orig_strategy_id", i);
                reqCommand.strategy_exec_broker = packer.GetStrbyName("strategy_exec_broker", i);
                reqCommand.strategy_exec_kind = packer.GetIntbyName("strategy_exec_kind", i);
                reqCommand.strategy_exec_comm_str = packer.GetStrbyName("strategy_exec_comm_str", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_acco = packer.GetStrbyName("stock_acco", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.strategy_dir = packer.GetIntbyName("strategy_dir", i);
                reqCommand.strategy_qty = packer.GetDoublebyName("strategy_qty", i);
                reqCommand.cash_strategy_qty = packer.GetDoublebyName("cash_strategy_qty", i);
                reqCommand.strategy_price = packer.GetDoublebyName("strategy_price", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.strategy_valid_type = packer.GetIntbyName("strategy_valid_type", i);
                reqCommand.strategy_rule_way = packer.GetStrbyName("strategy_rule_way", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.strategy_time = packer.GetIntbyName("strategy_time", i);
                reqCommand.margin_trade_type = packer.GetIntbyName("margin_trade_type", i);
                reqCommand.target_strategy_type = packer.GetStrbyName("target_strategy_type", i);
                reqCommand.target_strategy_param = packer.GetStrbyName("target_strategy_param", i);
                reqCommand.strategy_contr_comm = packer.GetStrbyName("strategy_contr_comm", i);
                reqCommand.strategy_status = packer.GetStrbyName("strategy_status", i);
                reqCommand.strategy_deal_status = packer.GetStrbyName("strategy_deal_status", i);
                reqCommand.strategy_deal_kind = packer.GetIntbyName("strategy_deal_kind", i);
                reqCommand.strategy_amt = packer.GetDoublebyName("strategy_amt", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.order_amt = packer.GetDoublebyName("order_amt", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.strategy_oper_way = packer.GetStrbyName("strategy_oper_way", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.comm_id = packer.GetInt64byName("comm_id", i);
                reqCommand.strategy_batch_no = packer.GetIntbyName("strategy_batch_no", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FunctdsecuL_11_102Models.Add(reqCommand);
            }
            return FunctdsecuL_11_102Models;
        }
 
        //逻辑_交易证券_策略_插件查询策略
        public static List<FunctdsecuL_11_102Model> GetFunctdsecuL_11_102Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_11_102Models = new List<FunctdsecuL_11_102Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_11_102Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_ID_INT64);
                    reqCommand.orig_strategy_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ORIG_STRATEGY_ID_INT64);
                    reqCommand.strategy_exec_broker = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_BROKER_STR);
                    reqCommand.strategy_exec_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_KIND_INT);
                    reqCommand.strategy_exec_comm_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_COMM_STR_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_STR);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.strategy_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT);
                    reqCommand.strategy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_QTY_FLOAT);
                    reqCommand.cash_strategy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_STRATEGY_QTY_FLOAT);
                    reqCommand.strategy_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PRICE_FLOAT);
                    reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    reqCommand.strategy_valid_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_VALID_TYPE_INT);
                    reqCommand.strategy_rule_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_RULE_WAY_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.strategy_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_TIME_INT);
                    reqCommand.margin_trade_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_TRADE_TYPE_INT);
                    reqCommand.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                    reqCommand.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                    reqCommand.strategy_contr_comm = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CONTR_COMM_STR);
                    reqCommand.strategy_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_STATUS_STR);
                    reqCommand.strategy_deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_STATUS_STR);
                    reqCommand.strategy_deal_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_KIND_INT);
                    reqCommand.strategy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_AMT_FLOAT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_AMT_FLOAT);
                    reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.strategy_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.comm_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMM_ID_INT64);
                    reqCommand.strategy_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_BATCH_NO_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FunctdsecuL_11_102Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_11_102Models;
        }
 
        //逻辑_交易证券_策略_查询策略汇总
        public static List<FunctdsecuL_11_103Model> GetFunctdsecuL_11_103Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FunctdsecuL_11_103Models = new List<FunctdsecuL_11_103Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FunctdsecuL_11_103Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.comm_opor = packer.GetIntbyName("comm_opor", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.strategy_batch_no = packer.GetIntbyName("strategy_batch_no", i);
                reqCommand.strategy_exec_broker = packer.GetStrbyName("strategy_exec_broker", i);
                reqCommand.strategy_exec_kind = packer.GetIntbyName("strategy_exec_kind", i);
                reqCommand.strategy_exec_comm_str = packer.GetStrbyName("strategy_exec_comm_str", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_type = packer.GetIntbyName("stock_type", i);
                reqCommand.asset_type = packer.GetIntbyName("asset_type", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.strategy_dir = packer.GetIntbyName("strategy_dir", i);
                reqCommand.strategy_qty = packer.GetDoublebyName("strategy_qty", i);
                reqCommand.cash_strategy_qty = packer.GetDoublebyName("cash_strategy_qty", i);
                reqCommand.strategy_price = packer.GetDoublebyName("strategy_price", i);
                reqCommand.price_type = packer.GetIntbyName("price_type", i);
                reqCommand.strategy_amt = packer.GetDoublebyName("strategy_amt", i);
                reqCommand.strategy_valid_type = packer.GetIntbyName("strategy_valid_type", i);
                reqCommand.strategy_rule_way = packer.GetStrbyName("strategy_rule_way", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.strategy_date = packer.GetIntbyName("strategy_date", i);
                reqCommand.margin_trade_type = packer.GetIntbyName("margin_trade_type", i);
                reqCommand.target_strategy_type = packer.GetStrbyName("target_strategy_type", i);
                reqCommand.target_strategy_param = packer.GetStrbyName("target_strategy_param", i);
                reqCommand.strategy_contr_comm = packer.GetStrbyName("strategy_contr_comm", i);
                reqCommand.strategy_sum_status = packer.GetStrbyName("strategy_sum_status", i);
                reqCommand.strategy_deal_status = packer.GetStrbyName("strategy_deal_status", i);
                reqCommand.strategy_deal_kind = packer.GetIntbyName("strategy_deal_kind", i);
                reqCommand.order_qty = packer.GetDoublebyName("order_qty", i);
                reqCommand.valid_order_qty = packer.GetDoublebyName("valid_order_qty", i);
                reqCommand.order_amt = packer.GetDoublebyName("order_amt", i);
                reqCommand.wtdraw_qty = packer.GetDoublebyName("wtdraw_qty", i);
                reqCommand.valid_wtdraw_qty = packer.GetDoublebyName("valid_wtdraw_qty", i);
                reqCommand.strike_qty = packer.GetDoublebyName("strike_qty", i);
                reqCommand.strike_amt = packer.GetDoublebyName("strike_amt", i);
                reqCommand.cancel_qty = packer.GetDoublebyName("cancel_qty", i);
                reqCommand.faild_qty = packer.GetDoublebyName("faild_qty", i);
                reqCommand.external_no = packer.GetInt64byName("external_no", i);
                reqCommand.order_batch_no = packer.GetIntbyName("order_batch_no", i);
                reqCommand.comm_batch_no = packer.GetIntbyName("comm_batch_no", i);
                reqCommand.strategy_oper_way = packer.GetStrbyName("strategy_oper_way", i);
 
                FunctdsecuL_11_103Models.Add(reqCommand);
            }
            return FunctdsecuL_11_103Models;
        }
 
        //逻辑_交易证券_策略_查询策略汇总
        public static List<FunctdsecuL_11_103Model> GetFunctdsecuL_11_103Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FunctdsecuL_11_103Models = new List<FunctdsecuL_11_103Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FunctdsecuL_11_103Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.comm_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_OPOR_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.strategy_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_BATCH_NO_INT);
                    reqCommand.strategy_exec_broker = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_BROKER_STR);
                    reqCommand.strategy_exec_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_KIND_INT);
                    reqCommand.strategy_exec_comm_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_EXEC_COMM_STR_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_TYPE_INT);
                    reqCommand.asset_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_TYPE_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.strategy_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DIR_INT);
                    reqCommand.strategy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_QTY_FLOAT);
                    reqCommand.cash_strategy_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_STRATEGY_QTY_FLOAT);
                    reqCommand.strategy_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_PRICE_FLOAT);
                    reqCommand.price_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_TYPE_INT);
                    reqCommand.strategy_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_AMT_FLOAT);
                    reqCommand.strategy_valid_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_VALID_TYPE_INT);
                    reqCommand.strategy_rule_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_RULE_WAY_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.strategy_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DATE_INT);
                    reqCommand.margin_trade_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_TRADE_TYPE_INT);
                    reqCommand.target_strategy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_TYPE_STR);
                    reqCommand.target_strategy_param = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_STRATEGY_PARAM_STR);
                    reqCommand.strategy_contr_comm = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_CONTR_COMM_STR);
                    reqCommand.strategy_sum_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_SUM_STATUS_STR);
                    reqCommand.strategy_deal_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_STATUS_STR);
                    reqCommand.strategy_deal_kind = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_DEAL_KIND_INT);
                    reqCommand.order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_QTY_FLOAT);
                    reqCommand.valid_order_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_ORDER_QTY_FLOAT);
                    reqCommand.order_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_AMT_FLOAT);
                    reqCommand.wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WTDRAW_QTY_FLOAT);
                    reqCommand.valid_wtdraw_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_VALID_WTDRAW_QTY_FLOAT);
                    reqCommand.strike_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_QTY_FLOAT);
                    reqCommand.strike_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STRIKE_AMT_FLOAT);
                    reqCommand.cancel_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CANCEL_QTY_FLOAT);
                    reqCommand.faild_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FAILD_QTY_FLOAT);
                    reqCommand.external_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_EXTERNAL_NO_INT64);
                    reqCommand.order_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_BATCH_NO_INT);
                    reqCommand.comm_batch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_BATCH_NO_INT);
                    reqCommand.strategy_oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STRATEGY_OPER_WAY_STR);
                    FunctdsecuL_11_103Models.Add(reqCommand);
                }
            }
            return FunctdsecuL_11_103Models;
        }
 
    }
}
