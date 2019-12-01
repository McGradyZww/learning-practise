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

    public static class RiskFutuPublic
    {
        //逻辑_风控期货_公用_查询风险规则记录
        public static List<FuncrkfutuL_1_4Model> GetFuncrkfutuL_1_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrkfutuL_1_4Models = new List<FuncrkfutuL_1_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrkfutuL_1_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.risk_rule_type = packer.GetIntbyName("risk_rule_type", i);
                reqCommand.risk_rule_name = packer.GetStrbyName("risk_rule_name", i);
                reqCommand.risk_rule_code = packer.GetStrbyName("risk_rule_code", i);
                reqCommand.risk_param_str = packer.GetStrbyName("risk_param_str", i);
                reqCommand.corrsp_plug = packer.GetStrbyName("corrsp_plug", i);
 
                FuncrkfutuL_1_4Models.Add(reqCommand);
            }
            return FuncrkfutuL_1_4Models;
        }
 
        //逻辑_风控期货_公用_查询风险规则记录
        public static List<FuncrkfutuL_1_4Model> GetFuncrkfutuL_1_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrkfutuL_1_4Models = new List<FuncrkfutuL_1_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrkfutuL_1_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    reqCommand.risk_rule_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_NAME_STR);
                    reqCommand.risk_rule_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_CODE_STR);
                    reqCommand.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                    reqCommand.corrsp_plug = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_PLUG_STR);
                    FuncrkfutuL_1_4Models.Add(reqCommand);
                }
            }
            return FuncrkfutuL_1_4Models;
        }
 
        //逻辑_风控期货_公用_增加风险条目记录
        public static List<FuncrkfutuL_1_5Model> GetFuncrkfutuL_1_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrkfutuL_1_5Models = new List<FuncrkfutuL_1_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrkfutuL_1_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncrkfutuL_1_5Models.Add(reqCommand);
            }
            return FuncrkfutuL_1_5Models;
        }
 
        //逻辑_风控期货_公用_增加风险条目记录
        public static List<FuncrkfutuL_1_5Model> GetFuncrkfutuL_1_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrkfutuL_1_5Models = new List<FuncrkfutuL_1_5Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrkfutuL_1_5Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FuncrkfutuL_1_5Models.Add(reqCommand);
            }
            return FuncrkfutuL_1_5Models;
        }
 
        //逻辑_风控期货_公用_查询风险条目记录
        public static List<FuncrkfutuL_1_9Model> GetFuncrkfutuL_1_9Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrkfutuL_1_9Models = new List<FuncrkfutuL_1_9Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrkfutuL_1_9Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.risk_item_name = packer.GetStrbyName("risk_item_name", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.order_dir_str = packer.GetStrbyName("order_dir_str", i);
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
 
                FuncrkfutuL_1_9Models.Add(reqCommand);
            }
            return FuncrkfutuL_1_9Models;
        }
 
        //逻辑_风控期货_公用_查询风险条目记录
        public static List<FuncrkfutuL_1_9Model> GetFuncrkfutuL_1_9Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrkfutuL_1_9Models = new List<FuncrkfutuL_1_9Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrkfutuL_1_9Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.risk_item_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_NAME_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
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
                    FuncrkfutuL_1_9Models.Add(reqCommand);
                }
            }
            return FuncrkfutuL_1_9Models;
        }
 
        //逻辑_风控期货_公用_查询风险模板记录
        public static List<FuncrkfutuL_1_13Model> GetFuncrkfutuL_1_13Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrkfutuL_1_13Models = new List<FuncrkfutuL_1_13Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrkfutuL_1_13Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.model_name = packer.GetStrbyName("model_name", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncrkfutuL_1_13Models.Add(reqCommand);
            }
            return FuncrkfutuL_1_13Models;
        }
 
        //逻辑_风控期货_公用_查询风险模板记录
        public static List<FuncrkfutuL_1_13Model> GetFuncrkfutuL_1_13Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrkfutuL_1_13Models = new List<FuncrkfutuL_1_13Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrkfutuL_1_13Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.model_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_NAME_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncrkfutuL_1_13Models.Add(reqCommand);
                }
            }
            return FuncrkfutuL_1_13Models;
        }
 
        //逻辑_风控期货_公用_查询风险模板条目记录
        public static List<FuncrkfutuL_1_16Model> GetFuncrkfutuL_1_16Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrkfutuL_1_16Models = new List<FuncrkfutuL_1_16Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrkfutuL_1_16Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.model_id = packer.GetInt64byName("model_id", i);
                reqCommand.risk_item_id = packer.GetIntbyName("risk_item_id", i);
                reqCommand.risk_rule_type = packer.GetIntbyName("risk_rule_type", i);
                reqCommand.risk_item_name = packer.GetStrbyName("risk_item_name", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.contrc_type = packer.GetIntbyName("contrc_type", i);
                reqCommand.order_dir_str = packer.GetStrbyName("order_dir_str", i);
                reqCommand.trig_stage_type = packer.GetIntbyName("trig_stage_type", i);
                reqCommand.compli_calc_level = packer.GetIntbyName("compli_calc_level", i);
                reqCommand.unit_nav_flag = packer.GetIntbyName("unit_nav_flag", i);
                reqCommand.trig_type = packer.GetIntbyName("trig_type", i);
                reqCommand.risk_rule_value_str = packer.GetStrbyName("risk_rule_value_str", i);
                reqCommand.risk_param_str = packer.GetStrbyName("risk_param_str", i);
                reqCommand.risk_rule_action = packer.GetStrbyName("risk_rule_action", i);
                reqCommand.begin_time = packer.GetIntbyName("begin_time", i);
                reqCommand.end_time = packer.GetIntbyName("end_time", i);
                reqCommand.rule_flag = packer.GetIntbyName("rule_flag", i);
 
                FuncrkfutuL_1_16Models.Add(reqCommand);
            }
            return FuncrkfutuL_1_16Models;
        }
 
        //逻辑_风控期货_公用_查询风险模板条目记录
        public static List<FuncrkfutuL_1_16Model> GetFuncrkfutuL_1_16Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrkfutuL_1_16Models = new List<FuncrkfutuL_1_16Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncrkfutuL_1_16Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.model_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_MODEL_ID_INT64);
                    reqCommand.risk_item_id = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_ID_INT);
                    reqCommand.risk_rule_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_TYPE_INT);
                    reqCommand.risk_item_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_ITEM_NAME_STR);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.contrc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_TYPE_INT);
                    reqCommand.order_dir_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_DIR_STR_STR);
                    reqCommand.trig_stage_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_STAGE_TYPE_INT);
                    reqCommand.compli_calc_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLI_CALC_LEVEL_INT);
                    reqCommand.unit_nav_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLAG_INT);
                    reqCommand.trig_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRIG_TYPE_INT);
                    reqCommand.risk_rule_value_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_VALUE_STR_STR);
                    reqCommand.risk_param_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_PARAM_STR_STR);
                    reqCommand.risk_rule_action = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_RISK_RULE_ACTION_STR);
                    reqCommand.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    reqCommand.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    reqCommand.rule_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RULE_FLAG_INT);
                    FuncrkfutuL_1_16Models.Add(reqCommand);
                }
            }
            return FuncrkfutuL_1_16Models;
        }
 
        //逻辑_风控期货_公用_期货数据归历史
        public static List<FuncrkfutuL_1_17Model> GetFuncrkfutuL_1_17Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncrkfutuL_1_17Models = new List<FuncrkfutuL_1_17Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncrkfutuL_1_17Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FuncrkfutuL_1_17Models.Add(reqCommand);
            }
            return FuncrkfutuL_1_17Models;
        }
 
        //逻辑_风控期货_公用_期货数据归历史
        public static List<FuncrkfutuL_1_17Model> GetFuncrkfutuL_1_17Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncrkfutuL_1_17Models = new List<FuncrkfutuL_1_17Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncrkfutuL_1_17Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FuncrkfutuL_1_17Models.Add(reqCommand);
            }
            return FuncrkfutuL_1_17Models;
        }
 
    }
}
