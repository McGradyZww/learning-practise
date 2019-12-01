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

    public static class RiskSecuRisk
    {
        //逻辑_风控证券_风控_增加客户风险规则记录
        public static List<FuncrksecuL_4_1Model> GetFuncrksecuL_4_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_1Models = new List<FuncrksecuL_4_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_no_str = packer.GetStrbyName("exch_no_str", i);
                reqCommand.order_dir_str = packer.GetStrbyName("order_dir_str", i);
                reqCommand.dime_id = packer.GetInt64byName("dime_id", i);
                reqCommand.trig_stage_type_str = packer.GetStrbyName("trig_stage_type_str", i);
                reqCommand.compli_calc_level = packer.GetIntbyName("compli_calc_level", i);
                reqCommand.unit_nav_flag = packer.GetIntbyName("unit_nav_flag", i);
                reqCommand.trig_type = packer.GetIntbyName("trig_type", i);
                reqCommand.compli_rules_remark = packer.GetStrbyName("compli_rules_remark", i);
                reqCommand.risk_rule_id = packer.GetIntbyName("risk_rule_id", i);
                reqCommand.risk_rule_type = packer.GetIntbyName("risk_rule_type", i);
                reqCommand.risk_rule_name = packer.GetStrbyName("risk_rule_name", i);
                reqCommand.risk_rule_code = packer.GetStrbyName("risk_rule_code", i);
                reqCommand.risk_param_str = packer.GetStrbyName("risk_param_str", i);
                reqCommand.risk_rule_value_str1 = packer.GetStrbyName("risk_rule_value_str1", i);
                reqCommand.risk_rule_action1 = packer.GetStrbyName("risk_rule_action1", i);
                reqCommand.risk_rule_value_str2 = packer.GetStrbyName("risk_rule_value_str2", i);
                reqCommand.risk_rule_action2 = packer.GetStrbyName("risk_rule_action2", i);
                reqCommand.risk_rule_value_str3 = packer.GetStrbyName("risk_rule_value_str3", i);
                reqCommand.risk_rule_action3 = packer.GetStrbyName("risk_rule_action3", i);
                reqCommand.risk_rule_value_str4 = packer.GetStrbyName("risk_rule_value_str4", i);
                reqCommand.risk_rule_action4 = packer.GetStrbyName("risk_rule_action4", i);
                reqCommand.corrsp_plug = packer.GetStrbyName("corrsp_plug", i);
                reqCommand.begin_time = packer.GetIntbyName("begin_time", i);
                reqCommand.end_time = packer.GetIntbyName("end_time", i);
                reqCommand.rule_flag = packer.GetIntbyName("rule_flag", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FuncrksecuL_4_1Models.Add(reqCommand);
            }
            return FuncrksecuL_4_1Models;
        }
 
        //逻辑_风控证券_风控_增加客户风险规则记录
        public static List<FuncrksecuL_4_1Model> GetFuncrksecuL_4_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_1Models = new List<FuncrksecuL_4_1Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrksecuL_4_1Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.exch_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR);
                reqCommand.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                reqCommand.dime_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64);
                reqCommand.trig_stage_type_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_STR_STR);
                reqCommand.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                reqCommand.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                reqCommand.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                reqCommand.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                reqCommand.risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT);
                reqCommand.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                reqCommand.risk_rule_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR);
                reqCommand.risk_rule_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR);
                reqCommand.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                reqCommand.risk_rule_value_str1 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR1_STR);
                reqCommand.risk_rule_action1 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION1_STR);
                reqCommand.risk_rule_value_str2 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR2_STR);
                reqCommand.risk_rule_action2 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION2_STR);
                reqCommand.risk_rule_value_str3 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR3_STR);
                reqCommand.risk_rule_action3 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION3_STR);
                reqCommand.risk_rule_value_str4 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR4_STR);
                reqCommand.risk_rule_action4 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION4_STR);
                reqCommand.corrsp_plug = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR);
                reqCommand.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                reqCommand.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                reqCommand.rule_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT);
                reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                FuncrksecuL_4_1Models.Add(reqCommand);
            }
            return FuncrksecuL_4_1Models;
        }
 
        //逻辑_风控证券_风控_查询客户风险规则记录
        public static List<FuncrksecuL_4_3Model> GetFuncrksecuL_4_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_3Models = new List<FuncrksecuL_4_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_3Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no_str = packer.GetStrbyName("pd_no_str", i);
                reqCommand.exch_group_no_str = packer.GetStrbyName("exch_group_no_str", i);
                reqCommand.exch_no_str = packer.GetStrbyName("exch_no_str", i);
                reqCommand.order_dir_str = packer.GetStrbyName("order_dir_str", i);
                reqCommand.dime_id = packer.GetInt64byName("dime_id", i);
                reqCommand.trig_stage_type_str = packer.GetStrbyName("trig_stage_type_str", i);
                reqCommand.compli_calc_level = packer.GetIntbyName("compli_calc_level", i);
                reqCommand.unit_nav_flag = packer.GetIntbyName("unit_nav_flag", i);
                reqCommand.trig_type = packer.GetIntbyName("trig_type", i);
                reqCommand.model_id = packer.GetInt64byName("model_id", i);
                reqCommand.risk_item_id = packer.GetIntbyName("risk_item_id", i);
                reqCommand.compli_rules_remark = packer.GetStrbyName("compli_rules_remark", i);
                reqCommand.risk_rule_id = packer.GetIntbyName("risk_rule_id", i);
                reqCommand.risk_rule_type = packer.GetIntbyName("risk_rule_type", i);
                reqCommand.risk_rule_name = packer.GetStrbyName("risk_rule_name", i);
                reqCommand.risk_rule_code = packer.GetStrbyName("risk_rule_code", i);
                reqCommand.risk_param_str = packer.GetStrbyName("risk_param_str", i);
                reqCommand.risk_rule_value_str1 = packer.GetStrbyName("risk_rule_value_str1", i);
                reqCommand.risk_rule_action1 = packer.GetStrbyName("risk_rule_action1", i);
                reqCommand.risk_rule_value_str2 = packer.GetStrbyName("risk_rule_value_str2", i);
                reqCommand.risk_rule_action2 = packer.GetStrbyName("risk_rule_action2", i);
                reqCommand.risk_rule_value_str3 = packer.GetStrbyName("risk_rule_value_str3", i);
                reqCommand.risk_rule_action3 = packer.GetStrbyName("risk_rule_action3", i);
                reqCommand.risk_rule_value_str4 = packer.GetStrbyName("risk_rule_value_str4", i);
                reqCommand.risk_rule_action4 = packer.GetStrbyName("risk_rule_action4", i);
                reqCommand.templ_flag = packer.GetIntbyName("templ_flag", i);
                reqCommand.corrsp_plug = packer.GetStrbyName("corrsp_plug", i);
                reqCommand.begin_time = packer.GetIntbyName("begin_time", i);
                reqCommand.end_time = packer.GetIntbyName("end_time", i);
                reqCommand.rule_flag = packer.GetIntbyName("rule_flag", i);
                reqCommand.union_flag = packer.GetIntbyName("union_flag", i);
 
                FuncrksecuL_4_3Models.Add(reqCommand);
            }
            return FuncrksecuL_4_3Models;
        }
 
        //逻辑_风控证券_风控_查询客户风险规则记录
        public static List<FuncrksecuL_4_3Model> GetFuncrksecuL_4_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_3Models = new List<FuncrksecuL_4_3Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_3Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    reqCommand.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                    reqCommand.exch_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR);
                    reqCommand.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                    reqCommand.dime_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64);
                    reqCommand.trig_stage_type_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_STR_STR);
                    reqCommand.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    reqCommand.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                    reqCommand.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    reqCommand.model_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64);
                    reqCommand.risk_item_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT);
                    reqCommand.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    reqCommand.risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT);
                    reqCommand.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    reqCommand.risk_rule_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR);
                    reqCommand.risk_rule_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR);
                    reqCommand.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                    reqCommand.risk_rule_value_str1 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR1_STR);
                    reqCommand.risk_rule_action1 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION1_STR);
                    reqCommand.risk_rule_value_str2 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR2_STR);
                    reqCommand.risk_rule_action2 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION2_STR);
                    reqCommand.risk_rule_value_str3 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR3_STR);
                    reqCommand.risk_rule_action3 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION3_STR);
                    reqCommand.risk_rule_value_str4 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR4_STR);
                    reqCommand.risk_rule_action4 = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION4_STR);
                    reqCommand.templ_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TEMPL_FLAG_INT);
                    reqCommand.corrsp_plug = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR);
                    reqCommand.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    reqCommand.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    reqCommand.rule_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT);
                    reqCommand.union_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNION_FLAG_INT);
                    FuncrksecuL_4_3Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_3Models;
        }
 
        //逻辑_风控证券_风控_静态风险合规判断
        public static List<FuncrksecuL_4_4Model> GetFuncrksecuL_4_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_4Models = new List<FuncrksecuL_4_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.client_risk_rule_id = packer.GetIntbyName("client_risk_rule_id", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.compli_rules_remark = packer.GetStrbyName("compli_rules_remark", i);
                reqCommand.risk_rule_action = packer.GetStrbyName("risk_rule_action", i);
                reqCommand.risk_rule_value_str = packer.GetStrbyName("risk_rule_value_str", i);
                reqCommand.risk_rule_calc_str = packer.GetStrbyName("risk_rule_calc_str", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.pd_no_str = packer.GetStrbyName("pd_no_str", i);
                reqCommand.dime_id = packer.GetInt64byName("dime_id", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.risk_rule_type = packer.GetIntbyName("risk_rule_type", i);
 
                FuncrksecuL_4_4Models.Add(reqCommand);
            }
            return FuncrksecuL_4_4Models;
        }
 
        //逻辑_风控证券_风控_静态风险合规判断
        public static List<FuncrksecuL_4_4Model> GetFuncrksecuL_4_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_4Models = new List<FuncrksecuL_4_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.client_risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_RISK_RULE_ID_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    reqCommand.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    reqCommand.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    reqCommand.risk_rule_calc_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CALC_STR_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    reqCommand.dime_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    FuncrksecuL_4_4Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_4Models;
        }
 
        //逻辑_风控证券_风控_客户风险触警流水查询
        public static List<FuncrksecuL_4_5Model> GetFuncrksecuL_4_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_5Models = new List<FuncrksecuL_4_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.risk_item_id = packer.GetIntbyName("risk_item_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.dime_id = packer.GetInt64byName("dime_id", i);
                reqCommand.trig_stage_type = packer.GetIntbyName("trig_stage_type", i);
                reqCommand.compli_calc_level = packer.GetIntbyName("compli_calc_level", i);
                reqCommand.unit_nav_flag = packer.GetIntbyName("unit_nav_flag", i);
                reqCommand.trig_type = packer.GetIntbyName("trig_type", i);
                reqCommand.compli_rules_remark = packer.GetStrbyName("compli_rules_remark", i);
                reqCommand.risk_rule_action = packer.GetStrbyName("risk_rule_action", i);
                reqCommand.risk_rule_type = packer.GetIntbyName("risk_rule_type", i);
                reqCommand.risk_rule_value_str = packer.GetStrbyName("risk_rule_value_str", i);
                reqCommand.risk_rule_calc_str = packer.GetStrbyName("risk_rule_calc_str", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.pd_no_str = packer.GetStrbyName("pd_no_str", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
 
                FuncrksecuL_4_5Models.Add(reqCommand);
            }
            return FuncrksecuL_4_5Models;
        }
 
        //逻辑_风控证券_风控_客户风险触警流水查询
        public static List<FuncrksecuL_4_5Model> GetFuncrksecuL_4_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_5Models = new List<FuncrksecuL_4_5Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_5Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.risk_item_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.dime_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64);
                    reqCommand.trig_stage_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT);
                    reqCommand.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    reqCommand.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                    reqCommand.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    reqCommand.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    reqCommand.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    reqCommand.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    reqCommand.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    reqCommand.risk_rule_calc_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CALC_STR_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    FuncrksecuL_4_5Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_5Models;
        }
 
        //逻辑_风控证券_风控_模板查询客户产品交易组
        public static List<FuncrksecuL_4_6Model> GetFuncrksecuL_4_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_6Models = new List<FuncrksecuL_4_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_6Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no_str = packer.GetStrbyName("pd_no_str", i);
                reqCommand.exch_group_no_str = packer.GetStrbyName("exch_group_no_str", i);
 
                FuncrksecuL_4_6Models.Add(reqCommand);
            }
            return FuncrksecuL_4_6Models;
        }
 
        //逻辑_风控证券_风控_模板查询客户产品交易组
        public static List<FuncrksecuL_4_6Model> GetFuncrksecuL_4_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_6Models = new List<FuncrksecuL_4_6Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_6Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    reqCommand.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                    FuncrksecuL_4_6Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_6Models;
        }
 
        //逻辑_风控证券_风控_试算检查客户风险
        public static List<FuncrksecuL_4_7Model> GetFuncrksecuL_4_7Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_7Models = new List<FuncrksecuL_4_7Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_7Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.client_risk_rule_id = packer.GetIntbyName("client_risk_rule_id", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.compli_rules_remark = packer.GetStrbyName("compli_rules_remark", i);
                reqCommand.risk_rule_action = packer.GetStrbyName("risk_rule_action", i);
                reqCommand.risk_rule_value_str = packer.GetStrbyName("risk_rule_value_str", i);
                reqCommand.risk_rule_calc_str = packer.GetStrbyName("risk_rule_calc_str", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrksecuL_4_7Models.Add(reqCommand);
            }
            return FuncrksecuL_4_7Models;
        }
 
        //逻辑_风控证券_风控_试算检查客户风险
        public static List<FuncrksecuL_4_7Model> GetFuncrksecuL_4_7Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_7Models = new List<FuncrksecuL_4_7Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_7Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.client_risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_RISK_RULE_ID_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    reqCommand.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    reqCommand.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    reqCommand.risk_rule_calc_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CALC_STR_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrksecuL_4_7Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_7Models;
        }
 
        //逻辑_风控证券_风控_查询账户风险监控设置
        public static List<FuncrksecuL_4_11Model> GetFuncrksecuL_4_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_11Models = new List<FuncrksecuL_4_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_11Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no_str = packer.GetStrbyName("pd_no_str", i);
                reqCommand.exch_group_no_str = packer.GetStrbyName("exch_group_no_str", i);
                reqCommand.moni_role_type = packer.GetIntbyName("moni_role_type", i);
                reqCommand.moni_value_flag = packer.GetIntbyName("moni_value_flag", i);
                reqCommand.moni_value_type = packer.GetIntbyName("moni_value_type", i);
                reqCommand.warn_posi_value = packer.GetDoublebyName("warn_posi_value", i);
                reqCommand.warn_trig_oper_type = packer.GetIntbyName("warn_trig_oper_type", i);
                reqCommand.close_posi_value = packer.GetDoublebyName("close_posi_value", i);
                reqCommand.close_trig_oper_type = packer.GetIntbyName("close_trig_oper_type", i);
                reqCommand.appd_value = packer.GetDoublebyName("appd_value", i);
                reqCommand.appd_trig_oper_type = packer.GetIntbyName("appd_trig_oper_type", i);
                reqCommand.begin_moni_date = packer.GetIntbyName("begin_moni_date", i);
                reqCommand.begin_moni_value = packer.GetDoublebyName("begin_moni_value", i);
                reqCommand.max_moni_value = packer.GetDoublebyName("max_moni_value", i);
                reqCommand.curr_moni_value = packer.GetDoublebyName("curr_moni_value", i);
                reqCommand.curr_result_moni_value = packer.GetDoublebyName("curr_result_moni_value", i);
                reqCommand.contrs_stock_code = packer.GetStrbyName("contrs_stock_code", i);
                reqCommand.contrs_exch_no = packer.GetIntbyName("contrs_exch_no", i);
                reqCommand.contrs_max_moni_value = packer.GetDoublebyName("contrs_max_moni_value", i);
                reqCommand.contrs_curr_moni_value = packer.GetDoublebyName("contrs_curr_moni_value", i);
                reqCommand.contrs_result_moni_value = packer.GetDoublebyName("contrs_result_moni_value", i);
                reqCommand.moni_result_value = packer.GetDoublebyName("moni_result_value", i);
                reqCommand.moni_result_status = packer.GetStrbyName("moni_result_status", i);
                reqCommand.moni_set_status = packer.GetStrbyName("moni_set_status", i);
                reqCommand.cash_asset = packer.GetDoublebyName("cash_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.stock_asset_ratio = packer.GetDoublebyName("stock_asset_ratio", i);
                reqCommand.close_posi_flag = packer.GetIntbyName("close_posi_flag", i);
                reqCommand.close_ratio_level_one = packer.GetDoublebyName("close_ratio_level_one", i);
                reqCommand.close_ratio_level_two = packer.GetDoublebyName("close_ratio_level_two", i);
                reqCommand.close_ratio_level_three = packer.GetDoublebyName("close_ratio_level_three", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.pd_share = packer.GetDoublebyName("pd_share", i);
                reqCommand.begin_asset_value = packer.GetDoublebyName("begin_asset_value", i);
                reqCommand.hk_thrgh_stock_asset = packer.GetDoublebyName("hk_thrgh_stock_asset", i);
 
                FuncrksecuL_4_11Models.Add(reqCommand);
            }
            return FuncrksecuL_4_11Models;
        }
 
        //逻辑_风控证券_风控_查询账户风险监控设置
        public static List<FuncrksecuL_4_11Model> GetFuncrksecuL_4_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_11Models = new List<FuncrksecuL_4_11Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_11Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    reqCommand.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                    reqCommand.moni_role_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_ROLE_TYPE_INT);
                    reqCommand.moni_value_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT);
                    reqCommand.moni_value_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT);
                    reqCommand.warn_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT);
                    reqCommand.warn_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRIG_OPER_TYPE_INT);
                    reqCommand.close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.close_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
                    reqCommand.appd_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPD_VALUE_FLOAT);
                    reqCommand.appd_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPD_TRIG_OPER_TYPE_INT);
                    reqCommand.begin_moni_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_DATE_INT);
                    reqCommand.begin_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_VALUE_FLOAT);
                    reqCommand.max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_MONI_VALUE_FLOAT);
                    reqCommand.curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT);
                    reqCommand.curr_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
                    reqCommand.contrs_stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_STOCK_CODE_STR);
                    reqCommand.contrs_exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_EXCH_NO_INT);
                    reqCommand.contrs_max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
                    reqCommand.contrs_curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
                    reqCommand.contrs_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
                    reqCommand.moni_result_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_VALUE_FLOAT);
                    reqCommand.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    reqCommand.moni_set_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_STATUS_STR);
                    reqCommand.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.stock_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_RATIO_FLOAT);
                    reqCommand.close_posi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FLAG_INT);
                    reqCommand.close_ratio_level_one = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
                    reqCommand.close_ratio_level_two = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
                    reqCommand.close_ratio_level_three = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.pd_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_SHARE_FLOAT);
                    reqCommand.begin_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_ASSET_VALUE_FLOAT);
                    reqCommand.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    FuncrksecuL_4_11Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_11Models;
        }
 
        //逻辑_风控证券_风控_新增证券风险监控设置
        public static List<FuncrksecuL_4_18Model> GetFuncrksecuL_4_18Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_18Models = new List<FuncrksecuL_4_18Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_18Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.moni_set_id = packer.GetInt64byName("moni_set_id", i);
 
                FuncrksecuL_4_18Models.Add(reqCommand);
            }
            return FuncrksecuL_4_18Models;
        }
 
        //逻辑_风控证券_风控_新增证券风险监控设置
        public static List<FuncrksecuL_4_18Model> GetFuncrksecuL_4_18Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_18Models = new List<FuncrksecuL_4_18Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrksecuL_4_18Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.moni_set_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_ID_INT64);
                FuncrksecuL_4_18Models.Add(reqCommand);
            }
            return FuncrksecuL_4_18Models;
        }
 
        //逻辑_风控证券_风控_查询证券风险监控设置
        public static List<FuncrksecuL_4_21Model> GetFuncrksecuL_4_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_21Models = new List<FuncrksecuL_4_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_21Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.pd_no_str = packer.GetStrbyName("pd_no_str", i);
                reqCommand.exch_group_no_str = packer.GetStrbyName("exch_group_no_str", i);
                reqCommand.monitor_ctrl_type = packer.GetIntbyName("monitor_ctrl_type", i);
                reqCommand.moni_value_type = packer.GetIntbyName("moni_value_type", i);
                reqCommand.monitor_param_value = packer.GetIntbyName("monitor_param_value", i);
                reqCommand.moni_value_flag = packer.GetIntbyName("moni_value_flag", i);
                reqCommand.warn_posi_value = packer.GetDoublebyName("warn_posi_value", i);
                reqCommand.appd_value = packer.GetDoublebyName("appd_value", i);
                reqCommand.close_posi_value = packer.GetDoublebyName("close_posi_value", i);
                reqCommand.max_moni_value = packer.GetDoublebyName("max_moni_value", i);
                reqCommand.curr_moni_value = packer.GetDoublebyName("curr_moni_value", i);
                reqCommand.curr_result_moni_value = packer.GetDoublebyName("curr_result_moni_value", i);
                reqCommand.contrs_stock_code = packer.GetStrbyName("contrs_stock_code", i);
                reqCommand.contrs_exch_no = packer.GetIntbyName("contrs_exch_no", i);
                reqCommand.contrs_max_moni_value = packer.GetDoublebyName("contrs_max_moni_value", i);
                reqCommand.contrs_curr_moni_value = packer.GetDoublebyName("contrs_curr_moni_value", i);
                reqCommand.contrs_result_moni_value = packer.GetDoublebyName("contrs_result_moni_value", i);
                reqCommand.moni_result_value = packer.GetDoublebyName("moni_result_value", i);
                reqCommand.moni_result_status = packer.GetStrbyName("moni_result_status", i);
                reqCommand.moni_set_status = packer.GetStrbyName("moni_set_status", i);
                reqCommand.close_posi_flag = packer.GetIntbyName("close_posi_flag", i);
                reqCommand.close_ratio_level_one = packer.GetDoublebyName("close_ratio_level_one", i);
                reqCommand.close_ratio_level_two = packer.GetDoublebyName("close_ratio_level_two", i);
                reqCommand.close_ratio_level_three = packer.GetDoublebyName("close_ratio_level_three", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrksecuL_4_21Models.Add(reqCommand);
            }
            return FuncrksecuL_4_21Models;
        }
 
        //逻辑_风控证券_风控_查询证券风险监控设置
        public static List<FuncrksecuL_4_21Model> GetFuncrksecuL_4_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_21Models = new List<FuncrksecuL_4_21Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_21Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    reqCommand.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                    reqCommand.monitor_ctrl_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONITOR_CTRL_TYPE_INT);
                    reqCommand.moni_value_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT);
                    reqCommand.monitor_param_value = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONITOR_PARAM_VALUE_INT);
                    reqCommand.moni_value_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT);
                    reqCommand.warn_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT);
                    reqCommand.appd_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPD_VALUE_FLOAT);
                    reqCommand.close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_MONI_VALUE_FLOAT);
                    reqCommand.curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT);
                    reqCommand.curr_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
                    reqCommand.contrs_stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_STOCK_CODE_STR);
                    reqCommand.contrs_exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_EXCH_NO_INT);
                    reqCommand.contrs_max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
                    reqCommand.contrs_curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
                    reqCommand.contrs_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
                    reqCommand.moni_result_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_VALUE_FLOAT);
                    reqCommand.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    reqCommand.moni_set_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_STATUS_STR);
                    reqCommand.close_posi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FLAG_INT);
                    reqCommand.close_ratio_level_one = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
                    reqCommand.close_ratio_level_two = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
                    reqCommand.close_ratio_level_three = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrksecuL_4_21Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_21Models;
        }
 
        //逻辑_风控证券_风控_计算账户风险监控设置数据
        public static List<FuncrksecuL_4_28Model> GetFuncrksecuL_4_28Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_28Models = new List<FuncrksecuL_4_28Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_28Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FuncrksecuL_4_28Models.Add(reqCommand);
            }
            return FuncrksecuL_4_28Models;
        }
 
        //逻辑_风控证券_风控_计算账户风险监控设置数据
        public static List<FuncrksecuL_4_28Model> GetFuncrksecuL_4_28Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_28Models = new List<FuncrksecuL_4_28Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrksecuL_4_28Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FuncrksecuL_4_28Models.Add(reqCommand);
            }
            return FuncrksecuL_4_28Models;
        }
 
        //逻辑_风控证券_风控_客户风险触警历史流水查询
        public static List<FuncrksecuL_4_29Model> GetFuncrksecuL_4_29Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_29Models = new List<FuncrksecuL_4_29Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_29Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.risk_item_id = packer.GetIntbyName("risk_item_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.order_dir = packer.GetIntbyName("order_dir", i);
                reqCommand.dime_id = packer.GetInt64byName("dime_id", i);
                reqCommand.trig_stage_type = packer.GetIntbyName("trig_stage_type", i);
                reqCommand.compli_calc_level = packer.GetIntbyName("compli_calc_level", i);
                reqCommand.unit_nav_flag = packer.GetIntbyName("unit_nav_flag", i);
                reqCommand.trig_type = packer.GetIntbyName("trig_type", i);
                reqCommand.compli_rules_remark = packer.GetStrbyName("compli_rules_remark", i);
                reqCommand.risk_rule_action = packer.GetStrbyName("risk_rule_action", i);
                reqCommand.risk_rule_type = packer.GetIntbyName("risk_rule_type", i);
                reqCommand.risk_rule_value_str = packer.GetStrbyName("risk_rule_value_str", i);
                reqCommand.risk_rule_calc_str = packer.GetStrbyName("risk_rule_calc_str", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.pd_no_str = packer.GetStrbyName("pd_no_str", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
 
                FuncrksecuL_4_29Models.Add(reqCommand);
            }
            return FuncrksecuL_4_29Models;
        }
 
        //逻辑_风控证券_风控_客户风险触警历史流水查询
        public static List<FuncrksecuL_4_29Model> GetFuncrksecuL_4_29Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_29Models = new List<FuncrksecuL_4_29Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_29Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.risk_item_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.order_dir = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_INT);
                    reqCommand.dime_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64);
                    reqCommand.trig_stage_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT);
                    reqCommand.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    reqCommand.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                    reqCommand.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    reqCommand.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    reqCommand.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    reqCommand.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    reqCommand.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    reqCommand.risk_rule_calc_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CALC_STR_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    FuncrksecuL_4_29Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_29Models;
        }
 
        //逻辑_风控证券_风控_条目查询客户产品交易组
        public static List<FuncrksecuL_4_30Model> GetFuncrksecuL_4_30Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_30Models = new List<FuncrksecuL_4_30Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_30Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no_str = packer.GetStrbyName("pd_no_str", i);
                reqCommand.exch_group_no_str = packer.GetStrbyName("exch_group_no_str", i);
                reqCommand.union_flag = packer.GetIntbyName("union_flag", i);
 
                FuncrksecuL_4_30Models.Add(reqCommand);
            }
            return FuncrksecuL_4_30Models;
        }
 
        //逻辑_风控证券_风控_条目查询客户产品交易组
        public static List<FuncrksecuL_4_30Model> GetFuncrksecuL_4_30Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_30Models = new List<FuncrksecuL_4_30Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_30Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    reqCommand.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                    reqCommand.union_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNION_FLAG_INT);
                    FuncrksecuL_4_30Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_30Models;
        }
 
        //逻辑_风控证券_风控_批量试算检查客户风险
        public static List<FuncrksecuL_4_32Model> GetFuncrksecuL_4_32Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_32Models = new List<FuncrksecuL_4_32Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_32Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.client_risk_rule_id = packer.GetIntbyName("client_risk_rule_id", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.compli_rules_remark = packer.GetStrbyName("compli_rules_remark", i);
                reqCommand.risk_rule_action = packer.GetStrbyName("risk_rule_action", i);
                reqCommand.risk_rule_value_str = packer.GetStrbyName("risk_rule_value_str", i);
                reqCommand.risk_rule_calc_str = packer.GetStrbyName("risk_rule_calc_str", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrksecuL_4_32Models.Add(reqCommand);
            }
            return FuncrksecuL_4_32Models;
        }
 
        //逻辑_风控证券_风控_批量试算检查客户风险
        public static List<FuncrksecuL_4_32Model> GetFuncrksecuL_4_32Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_32Models = new List<FuncrksecuL_4_32Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_32Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.client_risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_RISK_RULE_ID_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.compli_rules_remark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_RULES_REMARK_STR);
                    reqCommand.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    reqCommand.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    reqCommand.risk_rule_calc_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CALC_STR_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrksecuL_4_32Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_32Models;
        }
 
        //逻辑_风控证券_风控_T0操作员阈值信息查询
        public static List<FuncrksecuL_4_33Model> GetFuncrksecuL_4_33Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_33Models = new List<FuncrksecuL_4_33Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_33Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.detail_posi_id = packer.GetInt64byName("detail_posi_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.open_posi_time = packer.GetIntbyName("open_posi_time", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.close_posi_fee = packer.GetDoublebyName("close_posi_fee", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.pandl_ratio = packer.GetDoublebyName("pandl_ratio", i);
                reqCommand.un_close_posi_qty = packer.GetDoublebyName("un_close_posi_qty", i);
                reqCommand.un_close_marke_value = packer.GetDoublebyName("un_close_marke_value", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.up_limit_price = packer.GetDoublebyName("up_limit_price", i);
                reqCommand.down_limit_price = packer.GetDoublebyName("down_limit_price", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.last_tshold_value = packer.GetDoublebyName("last_tshold_value", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.posi_status = packer.GetStrbyName("posi_status", i);
                reqCommand.moni_result_status = packer.GetStrbyName("moni_result_status", i);
                reqCommand.posi_limit_status = packer.GetStrbyName("posi_limit_status", i);
                reqCommand.opor_warn_tshold = packer.GetDoublebyName("opor_warn_tshold", i);
                reqCommand.opor_stop_tshold = packer.GetDoublebyName("opor_stop_tshold", i);
                reqCommand.stock_warn_ratio = packer.GetDoublebyName("stock_warn_ratio", i);
                reqCommand.stock_stop_ratio = packer.GetDoublebyName("stock_stop_ratio", i);
                reqCommand.stock_warn_amt = packer.GetDoublebyName("stock_warn_amt", i);
                reqCommand.stock_stop_amt = packer.GetDoublebyName("stock_stop_amt", i);
                reqCommand.open_close_permission = packer.GetIntbyName("open_close_permission", i);
                reqCommand.posi_limit_time = packer.GetIntbyName("posi_limit_time", i);
 
                FuncrksecuL_4_33Models.Add(reqCommand);
            }
            return FuncrksecuL_4_33Models;
        }
 
        //逻辑_风控证券_风控_T0操作员阈值信息查询
        public static List<FuncrksecuL_4_33Model> GetFuncrksecuL_4_33Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_33Models = new List<FuncrksecuL_4_33Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_33Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.detail_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DETAIL_POSI_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    reqCommand.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    reqCommand.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.last_tshold_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.posi_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_STATUS_STR);
                    reqCommand.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    reqCommand.posi_limit_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_STATUS_STR);
                    reqCommand.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    reqCommand.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    reqCommand.stock_warn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT);
                    reqCommand.stock_stop_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT);
                    reqCommand.stock_warn_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT);
                    reqCommand.stock_stop_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT);
                    reqCommand.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    reqCommand.posi_limit_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_TIME_INT);
                    FuncrksecuL_4_33Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_33Models;
        }
 
        //逻辑_风控证券_风控_T0操作员阈值信息汇总查询
        public static List<FuncrksecuL_4_34Model> GetFuncrksecuL_4_34Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_34Models = new List<FuncrksecuL_4_34Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_34Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.detail_posi_id = packer.GetInt64byName("detail_posi_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_date = packer.GetIntbyName("open_posi_date", i);
                reqCommand.open_posi_time = packer.GetIntbyName("open_posi_time", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.close_posi_fee = packer.GetDoublebyName("close_posi_fee", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.pandl_ratio = packer.GetDoublebyName("pandl_ratio", i);
                reqCommand.un_close_posi_qty = packer.GetDoublebyName("un_close_posi_qty", i);
                reqCommand.un_close_marke_value = packer.GetDoublebyName("un_close_marke_value", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.up_limit_price = packer.GetDoublebyName("up_limit_price", i);
                reqCommand.down_limit_price = packer.GetDoublebyName("down_limit_price", i);
                reqCommand.last_tshold_value = packer.GetDoublebyName("last_tshold_value", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.posi_status = packer.GetStrbyName("posi_status", i);
                reqCommand.moni_result_status = packer.GetStrbyName("moni_result_status", i);
                reqCommand.posi_limit_status = packer.GetStrbyName("posi_limit_status", i);
                reqCommand.opor_warn_tshold = packer.GetDoublebyName("opor_warn_tshold", i);
                reqCommand.opor_stop_tshold = packer.GetDoublebyName("opor_stop_tshold", i);
                reqCommand.stock_warn_ratio = packer.GetDoublebyName("stock_warn_ratio", i);
                reqCommand.stock_stop_ratio = packer.GetDoublebyName("stock_stop_ratio", i);
                reqCommand.stock_warn_amt = packer.GetDoublebyName("stock_warn_amt", i);
                reqCommand.stock_stop_amt = packer.GetDoublebyName("stock_stop_amt", i);
                reqCommand.open_close_permission = packer.GetIntbyName("open_close_permission", i);
                reqCommand.posi_limit_time = packer.GetIntbyName("posi_limit_time", i);
 
                FuncrksecuL_4_34Models.Add(reqCommand);
            }
            return FuncrksecuL_4_34Models;
        }
 
        //逻辑_风控证券_风控_T0操作员阈值信息汇总查询
        public static List<FuncrksecuL_4_34Model> GetFuncrksecuL_4_34Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_34Models = new List<FuncrksecuL_4_34Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_34Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.detail_posi_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DETAIL_POSI_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_DATE_INT);
                    reqCommand.open_posi_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_TIME_INT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    reqCommand.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.up_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_LIMIT_PRICE_FLOAT);
                    reqCommand.down_limit_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_LIMIT_PRICE_FLOAT);
                    reqCommand.last_tshold_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.posi_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_STATUS_STR);
                    reqCommand.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    reqCommand.posi_limit_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_STATUS_STR);
                    reqCommand.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    reqCommand.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    reqCommand.stock_warn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT);
                    reqCommand.stock_stop_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT);
                    reqCommand.stock_warn_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT);
                    reqCommand.stock_stop_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT);
                    reqCommand.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    reqCommand.posi_limit_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_POSI_LIMIT_TIME_INT);
                    FuncrksecuL_4_34Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_34Models;
        }
 
        //逻辑_风控证券_风控_查询操作员风险监控设置
        public static List<FuncrksecuL_4_38Model> GetFuncrksecuL_4_38Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_38Models = new List<FuncrksecuL_4_38Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_38Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.moni_role_type = packer.GetIntbyName("moni_role_type", i);
                reqCommand.moni_value_flag = packer.GetIntbyName("moni_value_flag", i);
                reqCommand.moni_value_type = packer.GetIntbyName("moni_value_type", i);
                reqCommand.warn_posi_value = packer.GetDoublebyName("warn_posi_value", i);
                reqCommand.warn_trig_oper_type = packer.GetIntbyName("warn_trig_oper_type", i);
                reqCommand.close_posi_value = packer.GetDoublebyName("close_posi_value", i);
                reqCommand.close_trig_oper_type = packer.GetIntbyName("close_trig_oper_type", i);
                reqCommand.appd_value = packer.GetDoublebyName("appd_value", i);
                reqCommand.appd_trig_oper_type = packer.GetIntbyName("appd_trig_oper_type", i);
                reqCommand.begin_moni_date = packer.GetIntbyName("begin_moni_date", i);
                reqCommand.begin_moni_value = packer.GetDoublebyName("begin_moni_value", i);
                reqCommand.max_moni_value = packer.GetDoublebyName("max_moni_value", i);
                reqCommand.curr_moni_value = packer.GetDoublebyName("curr_moni_value", i);
                reqCommand.curr_result_moni_value = packer.GetDoublebyName("curr_result_moni_value", i);
                reqCommand.contrs_stock_code = packer.GetStrbyName("contrs_stock_code", i);
                reqCommand.contrs_exch_no = packer.GetIntbyName("contrs_exch_no", i);
                reqCommand.contrs_max_moni_value = packer.GetDoublebyName("contrs_max_moni_value", i);
                reqCommand.contrs_curr_moni_value = packer.GetDoublebyName("contrs_curr_moni_value", i);
                reqCommand.contrs_result_moni_value = packer.GetDoublebyName("contrs_result_moni_value", i);
                reqCommand.moni_result_value = packer.GetDoublebyName("moni_result_value", i);
                reqCommand.moni_result_status = packer.GetStrbyName("moni_result_status", i);
                reqCommand.moni_set_status = packer.GetStrbyName("moni_set_status", i);
                reqCommand.cash_asset = packer.GetDoublebyName("cash_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.stock_asset_ratio = packer.GetDoublebyName("stock_asset_ratio", i);
                reqCommand.close_posi_flag = packer.GetIntbyName("close_posi_flag", i);
                reqCommand.close_ratio_level_one = packer.GetDoublebyName("close_ratio_level_one", i);
                reqCommand.close_ratio_level_two = packer.GetDoublebyName("close_ratio_level_two", i);
                reqCommand.close_ratio_level_three = packer.GetDoublebyName("close_ratio_level_three", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrksecuL_4_38Models.Add(reqCommand);
            }
            return FuncrksecuL_4_38Models;
        }
 
        //逻辑_风控证券_风控_查询操作员风险监控设置
        public static List<FuncrksecuL_4_38Model> GetFuncrksecuL_4_38Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_38Models = new List<FuncrksecuL_4_38Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_38Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.moni_role_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_ROLE_TYPE_INT);
                    reqCommand.moni_value_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT);
                    reqCommand.moni_value_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT);
                    reqCommand.warn_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT);
                    reqCommand.warn_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRIG_OPER_TYPE_INT);
                    reqCommand.close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.close_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
                    reqCommand.appd_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPD_VALUE_FLOAT);
                    reqCommand.appd_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPD_TRIG_OPER_TYPE_INT);
                    reqCommand.begin_moni_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_DATE_INT);
                    reqCommand.begin_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_VALUE_FLOAT);
                    reqCommand.max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_MONI_VALUE_FLOAT);
                    reqCommand.curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT);
                    reqCommand.curr_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
                    reqCommand.contrs_stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_STOCK_CODE_STR);
                    reqCommand.contrs_exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_EXCH_NO_INT);
                    reqCommand.contrs_max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
                    reqCommand.contrs_curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
                    reqCommand.contrs_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
                    reqCommand.moni_result_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_VALUE_FLOAT);
                    reqCommand.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    reqCommand.moni_set_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_STATUS_STR);
                    reqCommand.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.stock_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_RATIO_FLOAT);
                    reqCommand.close_posi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FLAG_INT);
                    reqCommand.close_ratio_level_one = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
                    reqCommand.close_ratio_level_two = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
                    reqCommand.close_ratio_level_three = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrksecuL_4_38Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_38Models;
        }
 
        //逻辑_风控证券_风控_查询T0操作员触警流水信息
        public static List<FuncrksecuL_4_41Model> GetFuncrksecuL_4_41Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_41Models = new List<FuncrksecuL_4_41Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_41Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.close_posi_fee = packer.GetDoublebyName("close_posi_fee", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.pandl_ratio = packer.GetDoublebyName("pandl_ratio", i);
                reqCommand.un_close_posi_qty = packer.GetDoublebyName("un_close_posi_qty", i);
                reqCommand.un_close_marke_value = packer.GetDoublebyName("un_close_marke_value", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.last_tshold_value = packer.GetDoublebyName("last_tshold_value", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.moni_result_status = packer.GetStrbyName("moni_result_status", i);
                reqCommand.opor_warn_tshold = packer.GetDoublebyName("opor_warn_tshold", i);
                reqCommand.opor_stop_tshold = packer.GetDoublebyName("opor_stop_tshold", i);
                reqCommand.stock_warn_ratio = packer.GetDoublebyName("stock_warn_ratio", i);
                reqCommand.stock_stop_ratio = packer.GetDoublebyName("stock_stop_ratio", i);
                reqCommand.stock_warn_amt = packer.GetDoublebyName("stock_warn_amt", i);
                reqCommand.stock_stop_amt = packer.GetDoublebyName("stock_stop_amt", i);
                reqCommand.open_close_permission = packer.GetIntbyName("open_close_permission", i);
 
                FuncrksecuL_4_41Models.Add(reqCommand);
            }
            return FuncrksecuL_4_41Models;
        }
 
        //逻辑_风控证券_风控_查询T0操作员触警流水信息
        public static List<FuncrksecuL_4_41Model> GetFuncrksecuL_4_41Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_41Models = new List<FuncrksecuL_4_41Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_41Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    reqCommand.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.last_tshold_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    reqCommand.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    reqCommand.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    reqCommand.stock_warn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT);
                    reqCommand.stock_stop_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT);
                    reqCommand.stock_warn_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT);
                    reqCommand.stock_stop_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT);
                    reqCommand.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    FuncrksecuL_4_41Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_41Models;
        }
 
        //逻辑_风控证券_风控_查询T0操作员汇总触警流水信息
        public static List<FuncrksecuL_4_42Model> GetFuncrksecuL_4_42Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_42Models = new List<FuncrksecuL_4_42Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_42Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.close_posi_fee = packer.GetDoublebyName("close_posi_fee", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.pandl_ratio = packer.GetDoublebyName("pandl_ratio", i);
                reqCommand.un_close_posi_qty = packer.GetDoublebyName("un_close_posi_qty", i);
                reqCommand.un_close_marke_value = packer.GetDoublebyName("un_close_marke_value", i);
                reqCommand.last_tshold_value = packer.GetDoublebyName("last_tshold_value", i);
                reqCommand.moni_result_status = packer.GetStrbyName("moni_result_status", i);
                reqCommand.opor_warn_tshold = packer.GetDoublebyName("opor_warn_tshold", i);
                reqCommand.opor_stop_tshold = packer.GetDoublebyName("opor_stop_tshold", i);
                reqCommand.open_close_permission = packer.GetIntbyName("open_close_permission", i);
 
                FuncrksecuL_4_42Models.Add(reqCommand);
            }
            return FuncrksecuL_4_42Models;
        }
 
        //逻辑_风控证券_风控_查询T0操作员汇总触警流水信息
        public static List<FuncrksecuL_4_42Model> GetFuncrksecuL_4_42Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_42Models = new List<FuncrksecuL_4_42Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_42Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    reqCommand.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    reqCommand.last_tshold_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
                    reqCommand.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    reqCommand.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    reqCommand.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    reqCommand.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    FuncrksecuL_4_42Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_42Models;
        }
 
        //逻辑_风控证券_风控_查询T0操作员历史触警流水信息
        public static List<FuncrksecuL_4_43Model> GetFuncrksecuL_4_43Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_43Models = new List<FuncrksecuL_4_43Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_43Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_acco_no = packer.GetIntbyName("stock_acco_no", i);
                reqCommand.lngsht_type = packer.GetIntbyName("lngsht_type", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_price = packer.GetDoublebyName("open_posi_price", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.close_posi_fee = packer.GetDoublebyName("close_posi_fee", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.pandl_ratio = packer.GetDoublebyName("pandl_ratio", i);
                reqCommand.un_close_posi_qty = packer.GetDoublebyName("un_close_posi_qty", i);
                reqCommand.un_close_marke_value = packer.GetDoublebyName("un_close_marke_value", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
                reqCommand.cost_price = packer.GetDoublebyName("cost_price", i);
                reqCommand.last_tshold_value = packer.GetDoublebyName("last_tshold_value", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.moni_result_status = packer.GetStrbyName("moni_result_status", i);
                reqCommand.opor_warn_tshold = packer.GetDoublebyName("opor_warn_tshold", i);
                reqCommand.opor_stop_tshold = packer.GetDoublebyName("opor_stop_tshold", i);
                reqCommand.stock_warn_ratio = packer.GetDoublebyName("stock_warn_ratio", i);
                reqCommand.stock_stop_ratio = packer.GetDoublebyName("stock_stop_ratio", i);
                reqCommand.stock_warn_amt = packer.GetDoublebyName("stock_warn_amt", i);
                reqCommand.stock_stop_amt = packer.GetDoublebyName("stock_stop_amt", i);
                reqCommand.open_close_permission = packer.GetIntbyName("open_close_permission", i);
 
                FuncrksecuL_4_43Models.Add(reqCommand);
            }
            return FuncrksecuL_4_43Models;
        }
 
        //逻辑_风控证券_风控_查询T0操作员历史触警流水信息
        public static List<FuncrksecuL_4_43Model> GetFuncrksecuL_4_43Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_43Models = new List<FuncrksecuL_4_43Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_43Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ACCO_NO_INT);
                    reqCommand.lngsht_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LNGSHT_TYPE_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_PRICE_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    reqCommand.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    reqCommand.cost_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COST_PRICE_FLOAT);
                    reqCommand.last_tshold_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    reqCommand.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    reqCommand.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    reqCommand.stock_warn_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_RATIO_FLOAT);
                    reqCommand.stock_stop_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_RATIO_FLOAT);
                    reqCommand.stock_warn_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_WARN_AMT_FLOAT);
                    reqCommand.stock_stop_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_STOP_AMT_FLOAT);
                    reqCommand.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    FuncrksecuL_4_43Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_43Models;
        }
 
        //逻辑_风控证券_风控_查询T0操作员历史汇总触警流水信息
        public static List<FuncrksecuL_4_44Model> GetFuncrksecuL_4_44Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_44Models = new List<FuncrksecuL_4_44Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_44Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.curr_qty = packer.GetDoublebyName("curr_qty", i);
                reqCommand.open_posi_value = packer.GetDoublebyName("open_posi_value", i);
                reqCommand.open_posi_fee = packer.GetDoublebyName("open_posi_fee", i);
                reqCommand.close_posi_qty = packer.GetDoublebyName("close_posi_qty", i);
                reqCommand.close_posi_market_value = packer.GetDoublebyName("close_posi_market_value", i);
                reqCommand.close_posi_fee = packer.GetDoublebyName("close_posi_fee", i);
                reqCommand.realize_pandl = packer.GetDoublebyName("realize_pandl", i);
                reqCommand.float_pandl = packer.GetDoublebyName("float_pandl", i);
                reqCommand.pandl_ratio = packer.GetDoublebyName("pandl_ratio", i);
                reqCommand.un_close_posi_qty = packer.GetDoublebyName("un_close_posi_qty", i);
                reqCommand.un_close_marke_value = packer.GetDoublebyName("un_close_marke_value", i);
                reqCommand.last_tshold_value = packer.GetDoublebyName("last_tshold_value", i);
                reqCommand.moni_result_status = packer.GetStrbyName("moni_result_status", i);
                reqCommand.opor_warn_tshold = packer.GetDoublebyName("opor_warn_tshold", i);
                reqCommand.opor_stop_tshold = packer.GetDoublebyName("opor_stop_tshold", i);
                reqCommand.open_close_permission = packer.GetIntbyName("open_close_permission", i);
 
                FuncrksecuL_4_44Models.Add(reqCommand);
            }
            return FuncrksecuL_4_44Models;
        }
 
        //逻辑_风控证券_风控_查询T0操作员历史汇总触警流水信息
        public static List<FuncrksecuL_4_44Model> GetFuncrksecuL_4_44Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_44Models = new List<FuncrksecuL_4_44Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_44Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.curr_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_QTY_FLOAT);
                    reqCommand.open_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_VALUE_FLOAT);
                    reqCommand.open_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_POSI_FEE_FLOAT);
                    reqCommand.close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.close_posi_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_MARKET_VALUE_FLOAT);
                    reqCommand.close_posi_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FEE_FLOAT);
                    reqCommand.realize_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REALIZE_PANDL_FLOAT);
                    reqCommand.float_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FLOAT_PANDL_FLOAT);
                    reqCommand.pandl_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PANDL_RATIO_FLOAT);
                    reqCommand.un_close_posi_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_POSI_QTY_FLOAT);
                    reqCommand.un_close_marke_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UN_CLOSE_MARKE_VALUE_FLOAT);
                    reqCommand.last_tshold_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_TSHOLD_VALUE_FLOAT);
                    reqCommand.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    reqCommand.opor_warn_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_WARN_TSHOLD_FLOAT);
                    reqCommand.opor_stop_tshold = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STOP_TSHOLD_FLOAT);
                    reqCommand.open_close_permission = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_CLOSE_PERMISSION_INT);
                    FuncrksecuL_4_44Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_44Models;
        }
 
        //逻辑_风控证券_风控_查询资产账户融资融券保证金计算结果集
        public static List<FuncrksecuL_4_54Model> GetFuncrksecuL_4_54Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_54Models = new List<FuncrksecuL_4_54Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_54Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.curr_converted_margin = packer.GetDoublebyName("curr_converted_margin", i);
                reqCommand.cmmd_converted_margin = packer.GetDoublebyName("cmmd_converted_margin", i);
                reqCommand.order_converted_margin = packer.GetDoublebyName("order_converted_margin", i);
                reqCommand.fina_market_value = packer.GetDoublebyName("fina_market_value", i);
                reqCommand.fina_profit = packer.GetDoublebyName("fina_profit", i);
                reqCommand.fina_converted_pandl = packer.GetDoublebyName("fina_converted_pandl", i);
                reqCommand.loan_market_value = packer.GetDoublebyName("loan_market_value", i);
                reqCommand.loan_profit = packer.GetDoublebyName("loan_profit", i);
                reqCommand.loan_converted_pandl = packer.GetDoublebyName("loan_converted_pandl", i);
                reqCommand.fina_capt_margin = packer.GetDoublebyName("fina_capt_margin", i);
                reqCommand.loan_capt_margin = packer.GetDoublebyName("loan_capt_margin", i);
                reqCommand.keep_guarantee_ratio = packer.GetDoublebyName("keep_guarantee_ratio", i);
                reqCommand.loan_sell_amt = packer.GetDoublebyName("loan_sell_amt", i);
                reqCommand.margin_ratio_market_value = packer.GetDoublebyName("margin_ratio_market_value", i);
                reqCommand.fina_interest = packer.GetDoublebyName("fina_interest", i);
                reqCommand.loan_interest = packer.GetDoublebyName("loan_interest", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FuncrksecuL_4_54Models.Add(reqCommand);
            }
            return FuncrksecuL_4_54Models;
        }
 
        //逻辑_风控证券_风控_查询资产账户融资融券保证金计算结果集
        public static List<FuncrksecuL_4_54Model> GetFuncrksecuL_4_54Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_54Models = new List<FuncrksecuL_4_54Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_54Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.curr_converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_CONVERTED_MARGIN_FLOAT);
                    reqCommand.cmmd_converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMMD_CONVERTED_MARGIN_FLOAT);
                    reqCommand.order_converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CONVERTED_MARGIN_FLOAT);
                    reqCommand.fina_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_MARKET_VALUE_FLOAT);
                    reqCommand.fina_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_PROFIT_FLOAT);
                    reqCommand.fina_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CONVERTED_PANDL_FLOAT);
                    reqCommand.loan_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_MARKET_VALUE_FLOAT);
                    reqCommand.loan_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_PROFIT_FLOAT);
                    reqCommand.loan_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CONVERTED_PANDL_FLOAT);
                    reqCommand.fina_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CAPT_MARGIN_FLOAT);
                    reqCommand.loan_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CAPT_MARGIN_FLOAT);
                    reqCommand.keep_guarantee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_KEEP_GUARANTEE_RATIO_FLOAT);
                    reqCommand.loan_sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_SELL_AMT_FLOAT);
                    reqCommand.margin_ratio_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_MARKET_VALUE_FLOAT);
                    reqCommand.fina_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_INTEREST_FLOAT);
                    reqCommand.loan_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_INTEREST_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FuncrksecuL_4_54Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_54Models;
        }
 
        //逻辑_风控证券_风控_查询交易组融资融券保证金计算结果集
        public static List<FuncrksecuL_4_64Model> GetFuncrksecuL_4_64Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_64Models = new List<FuncrksecuL_4_64Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_64Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.curr_converted_margin = packer.GetDoublebyName("curr_converted_margin", i);
                reqCommand.cmmd_converted_margin = packer.GetDoublebyName("cmmd_converted_margin", i);
                reqCommand.order_converted_margin = packer.GetDoublebyName("order_converted_margin", i);
                reqCommand.fina_market_value = packer.GetDoublebyName("fina_market_value", i);
                reqCommand.fina_profit = packer.GetDoublebyName("fina_profit", i);
                reqCommand.fina_converted_pandl = packer.GetDoublebyName("fina_converted_pandl", i);
                reqCommand.loan_market_value = packer.GetDoublebyName("loan_market_value", i);
                reqCommand.loan_profit = packer.GetDoublebyName("loan_profit", i);
                reqCommand.loan_converted_pandl = packer.GetDoublebyName("loan_converted_pandl", i);
                reqCommand.fina_capt_margin = packer.GetDoublebyName("fina_capt_margin", i);
                reqCommand.loan_capt_margin = packer.GetDoublebyName("loan_capt_margin", i);
                reqCommand.keep_guarantee_ratio = packer.GetDoublebyName("keep_guarantee_ratio", i);
                reqCommand.loan_sell_amt = packer.GetDoublebyName("loan_sell_amt", i);
                reqCommand.margin_ratio_market_value = packer.GetDoublebyName("margin_ratio_market_value", i);
                reqCommand.fina_interest = packer.GetDoublebyName("fina_interest", i);
                reqCommand.loan_interest = packer.GetDoublebyName("loan_interest", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FuncrksecuL_4_64Models.Add(reqCommand);
            }
            return FuncrksecuL_4_64Models;
        }
 
        //逻辑_风控证券_风控_查询交易组融资融券保证金计算结果集
        public static List<FuncrksecuL_4_64Model> GetFuncrksecuL_4_64Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_64Models = new List<FuncrksecuL_4_64Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_64Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.curr_converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_CONVERTED_MARGIN_FLOAT);
                    reqCommand.cmmd_converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CMMD_CONVERTED_MARGIN_FLOAT);
                    reqCommand.order_converted_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_CONVERTED_MARGIN_FLOAT);
                    reqCommand.fina_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_MARKET_VALUE_FLOAT);
                    reqCommand.fina_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_PROFIT_FLOAT);
                    reqCommand.fina_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CONVERTED_PANDL_FLOAT);
                    reqCommand.loan_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_MARKET_VALUE_FLOAT);
                    reqCommand.loan_profit = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_PROFIT_FLOAT);
                    reqCommand.loan_converted_pandl = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CONVERTED_PANDL_FLOAT);
                    reqCommand.fina_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_CAPT_MARGIN_FLOAT);
                    reqCommand.loan_capt_margin = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_CAPT_MARGIN_FLOAT);
                    reqCommand.keep_guarantee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_KEEP_GUARANTEE_RATIO_FLOAT);
                    reqCommand.loan_sell_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_SELL_AMT_FLOAT);
                    reqCommand.margin_ratio_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_MARKET_VALUE_FLOAT);
                    reqCommand.fina_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_INTEREST_FLOAT);
                    reqCommand.loan_interest = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_INTEREST_FLOAT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FuncrksecuL_4_64Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_64Models;
        }
 
        //逻辑_风控证券_风控_查询所有账户风险监控设置
        public static List<FuncrksecuL_4_65Model> GetFuncrksecuL_4_65Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_65Models = new List<FuncrksecuL_4_65Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_65Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no_str = packer.GetStrbyName("pd_no_str", i);
                reqCommand.exch_group_no_str = packer.GetStrbyName("exch_group_no_str", i);
                reqCommand.moni_role_type = packer.GetIntbyName("moni_role_type", i);
                reqCommand.moni_value_flag = packer.GetIntbyName("moni_value_flag", i);
                reqCommand.moni_value_type = packer.GetIntbyName("moni_value_type", i);
                reqCommand.warn_posi_value = packer.GetDoublebyName("warn_posi_value", i);
                reqCommand.warn_trig_oper_type = packer.GetIntbyName("warn_trig_oper_type", i);
                reqCommand.close_posi_value = packer.GetDoublebyName("close_posi_value", i);
                reqCommand.close_trig_oper_type = packer.GetIntbyName("close_trig_oper_type", i);
                reqCommand.appd_value = packer.GetDoublebyName("appd_value", i);
                reqCommand.appd_trig_oper_type = packer.GetIntbyName("appd_trig_oper_type", i);
                reqCommand.begin_moni_date = packer.GetIntbyName("begin_moni_date", i);
                reqCommand.begin_moni_value = packer.GetDoublebyName("begin_moni_value", i);
                reqCommand.max_moni_value = packer.GetDoublebyName("max_moni_value", i);
                reqCommand.curr_moni_value = packer.GetDoublebyName("curr_moni_value", i);
                reqCommand.curr_result_moni_value = packer.GetDoublebyName("curr_result_moni_value", i);
                reqCommand.contrs_stock_code = packer.GetStrbyName("contrs_stock_code", i);
                reqCommand.contrs_exch_no = packer.GetIntbyName("contrs_exch_no", i);
                reqCommand.contrs_max_moni_value = packer.GetDoublebyName("contrs_max_moni_value", i);
                reqCommand.contrs_curr_moni_value = packer.GetDoublebyName("contrs_curr_moni_value", i);
                reqCommand.contrs_result_moni_value = packer.GetDoublebyName("contrs_result_moni_value", i);
                reqCommand.moni_result_value = packer.GetDoublebyName("moni_result_value", i);
                reqCommand.moni_result_status = packer.GetStrbyName("moni_result_status", i);
                reqCommand.moni_set_status = packer.GetStrbyName("moni_set_status", i);
                reqCommand.cash_asset = packer.GetDoublebyName("cash_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.stock_asset_ratio = packer.GetDoublebyName("stock_asset_ratio", i);
                reqCommand.close_posi_flag = packer.GetIntbyName("close_posi_flag", i);
                reqCommand.close_ratio_level_one = packer.GetDoublebyName("close_ratio_level_one", i);
                reqCommand.close_ratio_level_two = packer.GetDoublebyName("close_ratio_level_two", i);
                reqCommand.close_ratio_level_three = packer.GetDoublebyName("close_ratio_level_three", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.pd_share = packer.GetDoublebyName("pd_share", i);
                reqCommand.begin_asset_value = packer.GetDoublebyName("begin_asset_value", i);
                reqCommand.hk_thrgh_stock_asset = packer.GetDoublebyName("hk_thrgh_stock_asset", i);
 
                FuncrksecuL_4_65Models.Add(reqCommand);
            }
            return FuncrksecuL_4_65Models;
        }
 
        //逻辑_风控证券_风控_查询所有账户风险监控设置
        public static List<FuncrksecuL_4_65Model> GetFuncrksecuL_4_65Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_65Models = new List<FuncrksecuL_4_65Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_4_65Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_STR_STR);
                    reqCommand.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                    reqCommand.moni_role_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_ROLE_TYPE_INT);
                    reqCommand.moni_value_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_FLAG_INT);
                    reqCommand.moni_value_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_VALUE_TYPE_INT);
                    reqCommand.warn_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT);
                    reqCommand.warn_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WARN_TRIG_OPER_TYPE_INT);
                    reqCommand.close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.close_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_TRIG_OPER_TYPE_INT);
                    reqCommand.appd_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_APPD_VALUE_FLOAT);
                    reqCommand.appd_trig_oper_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_APPD_TRIG_OPER_TYPE_INT);
                    reqCommand.begin_moni_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_DATE_INT);
                    reqCommand.begin_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_MONI_VALUE_FLOAT);
                    reqCommand.max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MAX_MONI_VALUE_FLOAT);
                    reqCommand.curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_MONI_VALUE_FLOAT);
                    reqCommand.curr_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_RESULT_MONI_VALUE_FLOAT);
                    reqCommand.contrs_stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_STOCK_CODE_STR);
                    reqCommand.contrs_exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_EXCH_NO_INT);
                    reqCommand.contrs_max_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_MAX_MONI_VALUE_FLOAT);
                    reqCommand.contrs_curr_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_CURR_MONI_VALUE_FLOAT);
                    reqCommand.contrs_result_moni_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CONTRS_RESULT_MONI_VALUE_FLOAT);
                    reqCommand.moni_result_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_VALUE_FLOAT);
                    reqCommand.moni_result_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_RESULT_STATUS_STR);
                    reqCommand.moni_set_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SET_STATUS_STR);
                    reqCommand.cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.stock_asset_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_RATIO_FLOAT);
                    reqCommand.close_posi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_FLAG_INT);
                    reqCommand.close_ratio_level_one = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_ONE_FLOAT);
                    reqCommand.close_ratio_level_two = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_TWO_FLOAT);
                    reqCommand.close_ratio_level_three = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_RATIO_LEVEL_THREE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.pd_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_SHARE_FLOAT);
                    reqCommand.begin_asset_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_ASSET_VALUE_FLOAT);
                    reqCommand.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    FuncrksecuL_4_65Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_4_65Models;
        }
 
        //逻辑_风控证券_风控_联合汇总检查客户风险
        public static List<FuncrksecuL_4_68Model> GetFuncrksecuL_4_68Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_4_68Models = new List<FuncrksecuL_4_68Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_4_68Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.compli_trig_id = packer.GetInt64byName("compli_trig_id", i);
 
                FuncrksecuL_4_68Models.Add(reqCommand);
            }
            return FuncrksecuL_4_68Models;
        }
 
        //逻辑_风控证券_风控_联合汇总检查客户风险
        public static List<FuncrksecuL_4_68Model> GetFuncrksecuL_4_68Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_4_68Models = new List<FuncrksecuL_4_68Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrksecuL_4_68Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.compli_trig_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_TRIG_ID_INT64);
                FuncrksecuL_4_68Models.Add(reqCommand);
            }
            return FuncrksecuL_4_68Models;
        }
 
    }
}
