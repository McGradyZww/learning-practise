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

    public static class RiskFutuRisk
    {
        //逻辑_风控期货_风控_查询客户风险规则记录
        public static List<FuncrkfutuL_3_3Model> GetFuncrkfutuL_3_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrkfutuL_3_3Models = new List<FuncrkfutuL_3_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrkfutuL_3_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.model_id = packer.GetInt64byName("model_id", i);
                reqCommand.model_name = packer.GetStrbyName("model_name", i);
                reqCommand.risk_item_id = packer.GetIntbyName("risk_item_id", i);
                reqCommand.risk_item_name = packer.GetStrbyName("risk_item_name", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.order_dir_str = packer.GetStrbyName("order_dir_str", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.trig_stage_type = packer.GetIntbyName("trig_stage_type", i);
                reqCommand.compli_calc_level = packer.GetIntbyName("compli_calc_level", i);
                reqCommand.unit_nav_flag = packer.GetIntbyName("unit_nav_flag", i);
                reqCommand.trig_type = packer.GetIntbyName("trig_type", i);
                reqCommand.risk_rule_id = packer.GetIntbyName("risk_rule_id", i);
                reqCommand.risk_rule_type = packer.GetIntbyName("risk_rule_type", i);
                reqCommand.risk_rule_name = packer.GetStrbyName("risk_rule_name", i);
                reqCommand.risk_rule_code = packer.GetStrbyName("risk_rule_code", i);
                reqCommand.risk_param_str = packer.GetStrbyName("risk_param_str", i);
                reqCommand.risk_rule_value_str = packer.GetStrbyName("risk_rule_value_str", i);
                reqCommand.corrsp_plug = packer.GetStrbyName("corrsp_plug", i);
                reqCommand.risk_rule_action = packer.GetStrbyName("risk_rule_action", i);
                reqCommand.begin_time = packer.GetIntbyName("begin_time", i);
                reqCommand.end_time = packer.GetIntbyName("end_time", i);
                reqCommand.rule_flag = packer.GetIntbyName("rule_flag", i);
 
                FuncrkfutuL_3_3Models.Add(reqCommand);
            }
            return FuncrkfutuL_3_3Models;
        }
 
        //逻辑_风控期货_风控_查询客户风险规则记录
        public static List<FuncrkfutuL_3_3Model> GetFuncrkfutuL_3_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrkfutuL_3_3Models = new List<FuncrkfutuL_3_3Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrkfutuL_3_3Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.model_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64);
                    reqCommand.model_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_NAME_STR);
                    reqCommand.risk_item_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT);
                    reqCommand.risk_item_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_NAME_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.trig_stage_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT);
                    reqCommand.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    reqCommand.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                    reqCommand.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    reqCommand.risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT);
                    reqCommand.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    reqCommand.risk_rule_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR);
                    reqCommand.risk_rule_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR);
                    reqCommand.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                    reqCommand.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    reqCommand.corrsp_plug = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR);
                    reqCommand.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    reqCommand.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    reqCommand.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    reqCommand.rule_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT);
                    FuncrkfutuL_3_3Models.Add(reqCommand);
                }
            }
            return FuncrkfutuL_3_3Models;
        }
 
        //逻辑_风控期货_风控_获取客户风险要素
        public static List<FuncrkfutuL_3_4Model> GetFuncrkfutuL_3_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrkfutuL_3_4Models = new List<FuncrkfutuL_3_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrkfutuL_3_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.risk_param_str = packer.GetStrbyName("risk_param_str", i);
 
                FuncrkfutuL_3_4Models.Add(reqCommand);
            }
            return FuncrkfutuL_3_4Models;
        }
 
        //逻辑_风控期货_风控_获取客户风险要素
        public static List<FuncrkfutuL_3_4Model> GetFuncrkfutuL_3_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrkfutuL_3_4Models = new List<FuncrkfutuL_3_4Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrkfutuL_3_4Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                FuncrkfutuL_3_4Models.Add(reqCommand);
            }
            return FuncrkfutuL_3_4Models;
        }
 
        //逻辑_风控期货_风控_客户风险触警流水查询
        public static List<FuncrkfutuL_3_6Model> GetFuncrkfutuL_3_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrkfutuL_3_6Models = new List<FuncrkfutuL_3_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrkfutuL_3_6Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.client_risk_rule_id = packer.GetIntbyName("client_risk_rule_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.order_dir_str = packer.GetStrbyName("order_dir_str", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.trig_stage_type = packer.GetIntbyName("trig_stage_type", i);
                reqCommand.compli_calc_level = packer.GetIntbyName("compli_calc_level", i);
                reqCommand.unit_nav_flag = packer.GetIntbyName("unit_nav_flag", i);
                reqCommand.trig_type = packer.GetIntbyName("trig_type", i);
                reqCommand.compli_rules_remark = packer.GetStrbyName("compli_rules_remark", i);
                reqCommand.risk_rule_action = packer.GetStrbyName("risk_rule_action", i);
                reqCommand.risk_rule_type = packer.GetIntbyName("risk_rule_type", i);
                reqCommand.risk_rule_value_str = packer.GetStrbyName("risk_rule_value_str", i);
                reqCommand.risk_trig_value = packer.GetDoublebyName("risk_trig_value", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrkfutuL_3_6Models.Add(reqCommand);
            }
            return FuncrkfutuL_3_6Models;
        }
 
        //逻辑_风控期货_风控_客户风险触警流水查询
        public static List<FuncrkfutuL_3_6Model> GetFuncrkfutuL_3_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrkfutuL_3_6Models = new List<FuncrkfutuL_3_6Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrkfutuL_3_6Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.client_risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_RISK_RULE_ID_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.trig_stage_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT);
                    reqCommand.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    reqCommand.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                    reqCommand.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    reqCommand.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    reqCommand.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    reqCommand.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    reqCommand.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    reqCommand.risk_trig_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RISK_TRIG_VALUE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrkfutuL_3_6Models.Add(reqCommand);
                }
            }
            return FuncrkfutuL_3_6Models;
        }
 
        //逻辑_风控期货_风控_模板查询客户产品交易组
        public static List<FuncrkfutuL_3_7Model> GetFuncrkfutuL_3_7Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrkfutuL_3_7Models = new List<FuncrkfutuL_3_7Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrkfutuL_3_7Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
 
                FuncrkfutuL_3_7Models.Add(reqCommand);
            }
            return FuncrkfutuL_3_7Models;
        }
 
        //逻辑_风控期货_风控_模板查询客户产品交易组
        public static List<FuncrkfutuL_3_7Model> GetFuncrkfutuL_3_7Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrkfutuL_3_7Models = new List<FuncrkfutuL_3_7Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrkfutuL_3_7Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    FuncrkfutuL_3_7Models.Add(reqCommand);
                }
            }
            return FuncrkfutuL_3_7Models;
        }
 
        //逻辑_风控期货_风控_客户风险触警历史流水查询
        public static List<FuncrkfutuL_3_8Model> GetFuncrkfutuL_3_8Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrkfutuL_3_8Models = new List<FuncrkfutuL_3_8Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrkfutuL_3_8Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.client_risk_rule_id = packer.GetIntbyName("client_risk_rule_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.order_dir_str = packer.GetStrbyName("order_dir_str", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.trig_stage_type = packer.GetIntbyName("trig_stage_type", i);
                reqCommand.compli_calc_level = packer.GetIntbyName("compli_calc_level", i);
                reqCommand.unit_nav_flag = packer.GetIntbyName("unit_nav_flag", i);
                reqCommand.trig_type = packer.GetIntbyName("trig_type", i);
                reqCommand.compli_rules_remark = packer.GetStrbyName("compli_rules_remark", i);
                reqCommand.risk_rule_action = packer.GetStrbyName("risk_rule_action", i);
                reqCommand.risk_rule_type = packer.GetIntbyName("risk_rule_type", i);
                reqCommand.risk_rule_value_str = packer.GetStrbyName("risk_rule_value_str", i);
                reqCommand.risk_trig_value = packer.GetDoublebyName("risk_trig_value", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrkfutuL_3_8Models.Add(reqCommand);
            }
            return FuncrkfutuL_3_8Models;
        }
 
        //逻辑_风控期货_风控_客户风险触警历史流水查询
        public static List<FuncrkfutuL_3_8Model> GetFuncrkfutuL_3_8Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrkfutuL_3_8Models = new List<FuncrkfutuL_3_8Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrkfutuL_3_8Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.client_risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_RISK_RULE_ID_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.trig_stage_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT);
                    reqCommand.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    reqCommand.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                    reqCommand.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    reqCommand.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    reqCommand.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    reqCommand.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    reqCommand.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    reqCommand.risk_trig_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_RISK_TRIG_VALUE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrkfutuL_3_8Models.Add(reqCommand);
                }
            }
            return FuncrkfutuL_3_8Models;
        }
 
        //逻辑_风控期货_风控_批量试算检查客户风险
        public static List<FuncrkfutuL_3_9Model> GetFuncrkfutuL_3_9Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrkfutuL_3_9Models = new List<FuncrkfutuL_3_9Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrkfutuL_3_9Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.client_risk_rule_id = packer.GetIntbyName("client_risk_rule_id", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.compli_rules_remark = packer.GetStrbyName("compli_rules_remark", i);
                reqCommand.risk_rule_action = packer.GetStrbyName("risk_rule_action", i);
                reqCommand.risk_rule_value_str = packer.GetStrbyName("risk_rule_value_str", i);
                reqCommand.risk_rule_calc_str = packer.GetStrbyName("risk_rule_calc_str", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrkfutuL_3_9Models.Add(reqCommand);
            }
            return FuncrkfutuL_3_9Models;
        }
 
        //逻辑_风控期货_风控_批量试算检查客户风险
        public static List<FuncrkfutuL_3_9Model> GetFuncrkfutuL_3_9Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrkfutuL_3_9Models = new List<FuncrkfutuL_3_9Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrkfutuL_3_9Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.client_risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_RISK_RULE_ID_INT);
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                reqCommand.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                reqCommand.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                reqCommand.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                reqCommand.risk_rule_calc_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CALC_STR_STR);
                reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                FuncrkfutuL_3_9Models.Add(reqCommand);
            }
            return FuncrkfutuL_3_9Models;
        }
 
    }
}
