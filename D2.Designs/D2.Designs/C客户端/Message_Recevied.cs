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

    public static class Message
    {
        //逻辑_公共_消息_查询对象版本信息流水
        public static List<FuncpubL_11_2Model> GetFuncpubL_11_2Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_11_2Models = new List<FuncpubL_11_2Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_11_2Model();
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
                reqCommand.object_zh_name = packer.GetStrbyName("object_zh_name", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_occur_info = packer.GetStrbyName("jour_occur_info", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_11_2Models.Add(reqCommand);
            }
            return FuncpubL_11_2Models;
        }
 
        //逻辑_公共_消息_查询对象版本信息流水
        public static List<FuncpubL_11_2Model> GetFuncpubL_11_2Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_11_2Models = new List<FuncpubL_11_2Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_11_2Model();
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
                    reqCommand.object_zh_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OBJECT_ZH_NAME_STR);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_INFO_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_11_2Models.Add(reqCommand);
                }
            }
            return FuncpubL_11_2Models;
        }
 
        //逻辑_公共_消息_查询历史对象版本信息流水
        public static List<FuncpubL_11_3Model> GetFuncpubL_11_3Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_11_3Models = new List<FuncpubL_11_3Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_11_3Model();
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
                reqCommand.object_zh_name = packer.GetStrbyName("object_zh_name", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_occur_info = packer.GetStrbyName("jour_occur_info", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_11_3Models.Add(reqCommand);
            }
            return FuncpubL_11_3Models;
        }
 
        //逻辑_公共_消息_查询历史对象版本信息流水
        public static List<FuncpubL_11_3Model> GetFuncpubL_11_3Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_11_3Models = new List<FuncpubL_11_3Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_11_3Model();
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
                    reqCommand.object_zh_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OBJECT_ZH_NAME_STR);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_INFO_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_11_3Models.Add(reqCommand);
                }
            }
            return FuncpubL_11_3Models;
        }
 
        //逻辑_公共_消息_查询计划任务信息
        public static List<FuncpubL_11_7Model> GetFuncpubL_11_7Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_11_7Models = new List<FuncpubL_11_7Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_11_7Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.task_no = packer.GetIntbyName("task_no", i);
                reqCommand.task_name = packer.GetStrbyName("task_name", i);
                reqCommand.depend_task_no = packer.GetIntbyName("depend_task_no", i);
                reqCommand.task_order = packer.GetStrbyName("task_order", i);
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
                reqCommand.task_strike_rule = packer.GetStrbyName("task_strike_rule", i);
                reqCommand.exec_pro = packer.GetStrbyName("exec_pro", i);
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
                reqCommand.busi_func_code = packer.GetStrbyName("busi_func_code", i);
                reqCommand.exec_date = packer.GetIntbyName("exec_date", i);
                reqCommand.exec_time = packer.GetIntbyName("exec_time", i);
                reqCommand.comple_date = packer.GetIntbyName("comple_date", i);
                reqCommand.comple_time = packer.GetIntbyName("comple_time", i);
                reqCommand.exec_count = packer.GetIntbyName("exec_count", i);
                reqCommand.task_status = packer.GetStrbyName("task_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_11_7Models.Add(reqCommand);
            }
            return FuncpubL_11_7Models;
        }
 
        //逻辑_公共_消息_查询计划任务信息
        public static List<FuncpubL_11_7Model> GetFuncpubL_11_7Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_11_7Models = new List<FuncpubL_11_7Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_11_7Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.task_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NO_INT);
                    reqCommand.task_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NAME_STR);
                    reqCommand.depend_task_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEPEND_TASK_NO_INT);
                    reqCommand.task_order = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_ORDER_STR);
                    reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                    reqCommand.task_strike_rule = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_RULE_STR);
                    reqCommand.exec_pro = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRO_STR);
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    reqCommand.busi_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR);
                    reqCommand.exec_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT);
                    reqCommand.exec_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT);
                    reqCommand.comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_DATE_INT);
                    reqCommand.comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_TIME_INT);
                    reqCommand.exec_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_COUNT_INT);
                    reqCommand.task_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STATUS_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_11_7Models.Add(reqCommand);
                }
            }
            return FuncpubL_11_7Models;
        }
 
        //逻辑_公共_消息_查询计划任务扩展信息
        public static List<FuncpubL_11_12Model> GetFuncpubL_11_12Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_11_12Models = new List<FuncpubL_11_12Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_11_12Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.task_no = packer.GetIntbyName("task_no", i);
                reqCommand.task_name = packer.GetStrbyName("task_name", i);
                reqCommand.depend_task_no = packer.GetIntbyName("depend_task_no", i);
                reqCommand.task_order = packer.GetStrbyName("task_order", i);
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
                reqCommand.task_strike_rule = packer.GetStrbyName("task_strike_rule", i);
                reqCommand.exec_pro = packer.GetStrbyName("exec_pro", i);
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
                reqCommand.busi_func_code = packer.GetStrbyName("busi_func_code", i);
                reqCommand.exec_date = packer.GetIntbyName("exec_date", i);
                reqCommand.exec_time = packer.GetIntbyName("exec_time", i);
                reqCommand.comple_date = packer.GetIntbyName("comple_date", i);
                reqCommand.comple_time = packer.GetIntbyName("comple_time", i);
                reqCommand.exec_count = packer.GetIntbyName("exec_count", i);
                reqCommand.task_status = packer.GetStrbyName("task_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_11_12Models.Add(reqCommand);
            }
            return FuncpubL_11_12Models;
        }
 
        //逻辑_公共_消息_查询计划任务扩展信息
        public static List<FuncpubL_11_12Model> GetFuncpubL_11_12Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_11_12Models = new List<FuncpubL_11_12Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_11_12Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.task_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NO_INT);
                    reqCommand.task_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_NAME_STR);
                    reqCommand.depend_task_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEPEND_TASK_NO_INT);
                    reqCommand.task_order = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_ORDER_STR);
                    reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                    reqCommand.task_strike_rule = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_RULE_STR);
                    reqCommand.exec_pro = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_PRO_STR);
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    reqCommand.busi_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FUNC_CODE_STR);
                    reqCommand.exec_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT);
                    reqCommand.exec_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT);
                    reqCommand.comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_DATE_INT);
                    reqCommand.comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_TIME_INT);
                    reqCommand.exec_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_COUNT_INT);
                    reqCommand.task_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STATUS_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_11_12Models.Add(reqCommand);
                }
            }
            return FuncpubL_11_12Models;
        }
 
        //逻辑_公共_消息_查询操作日志
        public static List<FuncpubL_11_21Model> GetFuncpubL_11_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_11_21Models = new List<FuncpubL_11_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_11_21Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.log_level = packer.GetIntbyName("log_level", i);
                reqCommand.target_menu_no = packer.GetIntbyName("target_menu_no", i);
                reqCommand.target_func_code = packer.GetStrbyName("target_func_code", i);
                reqCommand.oper_mark = packer.GetStrbyName("oper_mark", i);
                reqCommand.error_code = packer.GetStrbyName("error_code", i);
                reqCommand.error_info = packer.GetStrbyName("error_info", i);
 
                FuncpubL_11_21Models.Add(reqCommand);
            }
            return FuncpubL_11_21Models;
        }
 
        //逻辑_公共_消息_查询操作日志
        public static List<FuncpubL_11_21Model> GetFuncpubL_11_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_11_21Models = new List<FuncpubL_11_21Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_11_21Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.log_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOG_LEVEL_INT);
                    reqCommand.target_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_MENU_NO_INT);
                    reqCommand.target_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_FUNC_CODE_STR);
                    reqCommand.oper_mark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MARK_STR);
                    reqCommand.error_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ERROR_CODE_STR);
                    reqCommand.error_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ERROR_INFO_STR);
                    FuncpubL_11_21Models.Add(reqCommand);
                }
            }
            return FuncpubL_11_21Models;
        }
 
        //逻辑_公共_消息_查询历史操作日志
        public static List<FuncpubL_11_22Model> GetFuncpubL_11_22Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_11_22Models = new List<FuncpubL_11_22Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_11_22Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.log_level = packer.GetIntbyName("log_level", i);
                reqCommand.target_menu_no = packer.GetIntbyName("target_menu_no", i);
                reqCommand.target_func_code = packer.GetStrbyName("target_func_code", i);
                reqCommand.oper_mark = packer.GetStrbyName("oper_mark", i);
                reqCommand.error_code = packer.GetStrbyName("error_code", i);
                reqCommand.error_info = packer.GetStrbyName("error_info", i);
 
                FuncpubL_11_22Models.Add(reqCommand);
            }
            return FuncpubL_11_22Models;
        }
 
        //逻辑_公共_消息_查询历史操作日志
        public static List<FuncpubL_11_22Model> GetFuncpubL_11_22Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_11_22Models = new List<FuncpubL_11_22Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_11_22Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.log_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOG_LEVEL_INT);
                    reqCommand.target_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_MENU_NO_INT);
                    reqCommand.target_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_FUNC_CODE_STR);
                    reqCommand.oper_mark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MARK_STR);
                    reqCommand.error_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ERROR_CODE_STR);
                    reqCommand.error_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ERROR_INFO_STR);
                    FuncpubL_11_22Models.Add(reqCommand);
                }
            }
            return FuncpubL_11_22Models;
        }
 
        //逻辑_公共_消息_查询操作员任务提示信息
        public static List<FuncpubL_11_30Model> GetFuncpubL_11_30Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_11_30Models = new List<FuncpubL_11_30Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_11_30Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.log_level = packer.GetIntbyName("log_level", i);
                reqCommand.exec_date = packer.GetIntbyName("exec_date", i);
                reqCommand.exec_time = packer.GetIntbyName("exec_time", i);
                reqCommand.comple_date = packer.GetIntbyName("comple_date", i);
                reqCommand.comple_time = packer.GetIntbyName("comple_time", i);
                reqCommand.mark_info = packer.GetStrbyName("mark_info", i);
                reqCommand.busi_menu_no = packer.GetIntbyName("busi_menu_no", i);
                reqCommand.update_times = packer.GetIntbyName("update_times", i);
 
                FuncpubL_11_30Models.Add(reqCommand);
            }
            return FuncpubL_11_30Models;
        }
 
        //逻辑_公共_消息_查询操作员任务提示信息
        public static List<FuncpubL_11_30Model> GetFuncpubL_11_30Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_11_30Models = new List<FuncpubL_11_30Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_11_30Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.log_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOG_LEVEL_INT);
                    reqCommand.exec_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT);
                    reqCommand.exec_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT);
                    reqCommand.comple_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_DATE_INT);
                    reqCommand.comple_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMPLE_TIME_INT);
                    reqCommand.mark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MARK_INFO_STR);
                    reqCommand.busi_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_MENU_NO_INT);
                    reqCommand.update_times = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIMES_INT);
                    FuncpubL_11_30Models.Add(reqCommand);
                }
            }
            return FuncpubL_11_30Models;
        }
 
        //逻辑_公共_消息_删除操作员任务提示信息
        public static List<FuncpubL_11_33Model> GetFuncpubL_11_33Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_11_33Models = new List<FuncpubL_11_33Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_11_33Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.rsp_id = packer.GetInt64byName("rsp_id", i);
 
                FuncpubL_11_33Models.Add(reqCommand);
            }
            return FuncpubL_11_33Models;
        }
 
        //逻辑_公共_消息_删除操作员任务提示信息
        public static List<FuncpubL_11_33Model> GetFuncpubL_11_33Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_11_33Models = new List<FuncpubL_11_33Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_11_33Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.rsp_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_RSP_ID_INT64);
                FuncpubL_11_33Models.Add(reqCommand);
            }
            return FuncpubL_11_33Models;
        }
 
        //逻辑_公共_消息_查询监控服务信息
        public static List<FuncpubL_11_40Model> GetFuncpubL_11_40Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_11_40Models = new List<FuncpubL_11_40Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_11_40Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.exception_level = packer.GetIntbyName("exception_level", i);
                reqCommand.moni_server_type = packer.GetIntbyName("moni_server_type", i);
                reqCommand.computer_name = packer.GetStrbyName("computer_name", i);
                reqCommand.proc_no = packer.GetIntbyName("proc_no", i);
                reqCommand.proc_path = packer.GetStrbyName("proc_path", i);
                reqCommand.deal_flag = packer.GetIntbyName("deal_flag", i);
                reqCommand.deal_info = packer.GetStrbyName("deal_info", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_11_40Models.Add(reqCommand);
            }
            return FuncpubL_11_40Models;
        }
 
        //逻辑_公共_消息_查询监控服务信息
        public static List<FuncpubL_11_40Model> GetFuncpubL_11_40Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_11_40Models = new List<FuncpubL_11_40Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_11_40Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.exception_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCEPTION_LEVEL_INT);
                    reqCommand.moni_server_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MONI_SERVER_TYPE_INT);
                    reqCommand.computer_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COMPUTER_NAME_STR);
                    reqCommand.proc_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PROC_NO_INT);
                    reqCommand.proc_path = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PROC_PATH_STR);
                    reqCommand.deal_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_FLAG_INT);
                    reqCommand.deal_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DEAL_INFO_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_11_40Models.Add(reqCommand);
                }
            }
            return FuncpubL_11_40Models;
        }
 
        //逻辑_公共_消息_查询操作日志历史
        public static List<FuncpubL_11_43Model> GetFuncpubL_11_43Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_11_43Models = new List<FuncpubL_11_43Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_11_43Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.log_level = packer.GetIntbyName("log_level", i);
                reqCommand.target_menu_no = packer.GetIntbyName("target_menu_no", i);
                reqCommand.target_func_code = packer.GetStrbyName("target_func_code", i);
                reqCommand.oper_mark = packer.GetStrbyName("oper_mark", i);
                reqCommand.error_code = packer.GetStrbyName("error_code", i);
                reqCommand.error_info = packer.GetStrbyName("error_info", i);
 
                FuncpubL_11_43Models.Add(reqCommand);
            }
            return FuncpubL_11_43Models;
        }
 
        //逻辑_公共_消息_查询操作日志历史
        public static List<FuncpubL_11_43Model> GetFuncpubL_11_43Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_11_43Models = new List<FuncpubL_11_43Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_11_43Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.log_level = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOG_LEVEL_INT);
                    reqCommand.target_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_MENU_NO_INT);
                    reqCommand.target_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_FUNC_CODE_STR);
                    reqCommand.oper_mark = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MARK_STR);
                    reqCommand.error_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ERROR_CODE_STR);
                    reqCommand.error_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ERROR_INFO_STR);
                    FuncpubL_11_43Models.Add(reqCommand);
                }
            }
            return FuncpubL_11_43Models;
        }
 
    }
}
