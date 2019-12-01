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

    public static class RiskSecuPublic
    {
        //逻辑_风控证券_公用_查询风险规则记录
        public static List<FuncrksecuL_1_1Model> GetFuncrksecuL_1_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_1_1Models = new List<FuncrksecuL_1_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_1_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.risk_rule_type = packer.GetIntbyName("risk_rule_type", i);
                reqCommand.risk_rule_name = packer.GetStrbyName("risk_rule_name", i);
                reqCommand.risk_rule_code = packer.GetStrbyName("risk_rule_code", i);
                reqCommand.risk_param_str = packer.GetStrbyName("risk_param_str", i);
                reqCommand.tim_deal_flag = packer.GetIntbyName("tim_deal_flag", i);
                reqCommand.corrsp_plug = packer.GetStrbyName("corrsp_plug", i);
 
                FuncrksecuL_1_1Models.Add(reqCommand);
            }
            return FuncrksecuL_1_1Models;
        }
 
        //逻辑_风控证券_公用_查询风险规则记录
        public static List<FuncrksecuL_1_1Model> GetFuncrksecuL_1_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_1_1Models = new List<FuncrksecuL_1_1Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_1_1Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    reqCommand.risk_rule_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR);
                    reqCommand.risk_rule_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR);
                    reqCommand.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                    reqCommand.tim_deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIM_DEAL_FLAG_INT);
                    reqCommand.corrsp_plug = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR);
                    FuncrksecuL_1_1Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_1_1Models;
        }
 
        //逻辑_风控证券_公用_增加风险条目记录
        public static List<FuncrksecuL_1_2Model> GetFuncrksecuL_1_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_1_2Models = new List<FuncrksecuL_1_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_1_2Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncrksecuL_1_2Models.Add(reqCommand);
            }
            return FuncrksecuL_1_2Models;
        }
 
        //逻辑_风控证券_公用_增加风险条目记录
        public static List<FuncrksecuL_1_2Model> GetFuncrksecuL_1_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_1_2Models = new List<FuncrksecuL_1_2Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrksecuL_1_2Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FuncrksecuL_1_2Models.Add(reqCommand);
            }
            return FuncrksecuL_1_2Models;
        }
 
        //逻辑_风控证券_公用_查询风险条目记录
        public static List<FuncrksecuL_1_5Model> GetFuncrksecuL_1_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_1_5Models = new List<FuncrksecuL_1_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_1_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
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
                reqCommand.risk_item_tmplat_id = packer.GetInt64byName("risk_item_tmplat_id", i);
                reqCommand.rule_flag = packer.GetIntbyName("rule_flag", i);
 
                FuncrksecuL_1_5Models.Add(reqCommand);
            }
            return FuncrksecuL_1_5Models;
        }
 
        //逻辑_风控证券_公用_查询风险条目记录
        public static List<FuncrksecuL_1_5Model> GetFuncrksecuL_1_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_1_5Models = new List<FuncrksecuL_1_5Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_1_5Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
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
                    reqCommand.risk_item_tmplat_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_TMPLAT_ID_INT64);
                    reqCommand.rule_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT);
                    FuncrksecuL_1_5Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_1_5Models;
        }
 
        //逻辑_风控证券_公用_查询风险模板记录
        public static List<FuncrksecuL_1_9Model> GetFuncrksecuL_1_9Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_1_9Models = new List<FuncrksecuL_1_9Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_1_9Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.model_name = packer.GetStrbyName("model_name", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrksecuL_1_9Models.Add(reqCommand);
            }
            return FuncrksecuL_1_9Models;
        }
 
        //逻辑_风控证券_公用_查询风险模板记录
        public static List<FuncrksecuL_1_9Model> GetFuncrksecuL_1_9Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_1_9Models = new List<FuncrksecuL_1_9Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_1_9Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.model_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_NAME_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrksecuL_1_9Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_1_9Models;
        }
 
        //逻辑_风控证券_公用_查询风险模板条目记录
        public static List<FuncrksecuL_1_12Model> GetFuncrksecuL_1_12Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_1_12Models = new List<FuncrksecuL_1_12Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_1_12Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no_str = packer.GetStrbyName("exch_no_str", i);
                reqCommand.order_dir_str = packer.GetStrbyName("order_dir_str", i);
                reqCommand.dime_id = packer.GetInt64byName("dime_id", i);
                reqCommand.risk_item_id = packer.GetIntbyName("risk_item_id", i);
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
 
                FuncrksecuL_1_12Models.Add(reqCommand);
            }
            return FuncrksecuL_1_12Models;
        }
 
        //逻辑_风控证券_公用_查询风险模板条目记录
        public static List<FuncrksecuL_1_12Model> GetFuncrksecuL_1_12Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_1_12Models = new List<FuncrksecuL_1_12Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_1_12Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR);
                    reqCommand.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                    reqCommand.dime_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_DIME_ID_INT64);
                    reqCommand.risk_item_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT);
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
                    FuncrksecuL_1_12Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_1_12Models;
        }
 
        //逻辑_风控证券_公用_查询风险条目模板记录
        public static List<FuncrksecuL_1_15Model> GetFuncrksecuL_1_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrksecuL_1_15Models = new List<FuncrksecuL_1_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrksecuL_1_15Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_no_str = packer.GetStrbyName("exch_no_str", i);
                reqCommand.order_dir_str = packer.GetStrbyName("order_dir_str", i);
                reqCommand.dime_type = packer.GetIntbyName("dime_type", i);
                reqCommand.ctrl_cond_dim_code_str = packer.GetStrbyName("ctrl_cond_dim_code_str", i);
                reqCommand.trig_stage_type_str = packer.GetStrbyName("trig_stage_type_str", i);
                reqCommand.compli_calc_level = packer.GetIntbyName("compli_calc_level", i);
                reqCommand.trig_type = packer.GetIntbyName("trig_type", i);
                reqCommand.risk_item_tmplat_name = packer.GetStrbyName("risk_item_tmplat_name", i);
                reqCommand.risk_rule_id = packer.GetIntbyName("risk_rule_id", i);
                reqCommand.risk_rule_type = packer.GetIntbyName("risk_rule_type", i);
                reqCommand.risk_rule_name = packer.GetStrbyName("risk_rule_name", i);
                reqCommand.risk_rule_code = packer.GetStrbyName("risk_rule_code", i);
                reqCommand.risk_param_str = packer.GetStrbyName("risk_param_str", i);
 
                FuncrksecuL_1_15Models.Add(reqCommand);
            }
            return FuncrksecuL_1_15Models;
        }
 
        //逻辑_风控证券_公用_查询风险条目模板记录
        public static List<FuncrksecuL_1_15Model> GetFuncrksecuL_1_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrksecuL_1_15Models = new List<FuncrksecuL_1_15Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrksecuL_1_15Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_STR_STR);
                    reqCommand.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                    reqCommand.dime_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DIME_TYPE_INT);
                    reqCommand.ctrl_cond_dim_code_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CTRL_COND_DIM_CODE_STR_STR);
                    reqCommand.trig_stage_type_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_STR_STR);
                    reqCommand.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    reqCommand.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    reqCommand.risk_item_tmplat_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_TMPLAT_NAME_STR);
                    reqCommand.risk_rule_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ID_INT);
                    reqCommand.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    reqCommand.risk_rule_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR);
                    reqCommand.risk_rule_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR);
                    reqCommand.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                    FuncrksecuL_1_15Models.Add(reqCommand);
                }
            }
            return FuncrksecuL_1_15Models;
        }
 
    }
}
