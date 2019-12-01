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

    public static class User
    {
        //逻辑_公共_用户_查询操作员信息
        public static List<FuncpubL_5_4Model> GetFuncpubL_5_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_5_4Models = new List<FuncpubL_5_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_5_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.opor_name = packer.GetStrbyName("opor_name", i);
                reqCommand.opor_type = packer.GetIntbyName("opor_type", i);
                reqCommand.opor_pwd = packer.GetStrbyName("opor_pwd", i);
                reqCommand.opor_status = packer.GetStrbyName("opor_status", i);
                reqCommand.create_opor = packer.GetIntbyName("create_opor", i);
                reqCommand.conta_addr = packer.GetStrbyName("conta_addr", i);
                reqCommand.oper_rights = packer.GetIntbyName("oper_rights", i);
                reqCommand.phone_number = packer.GetStrbyName("phone_number", i);
                reqCommand.email = packer.GetStrbyName("email", i);
                reqCommand.is_trader = packer.GetIntbyName("is_trader", i);
                reqCommand.trader_no = packer.GetIntbyName("trader_no", i);
                reqCommand.allow_login_type = packer.GetStrbyName("allow_login_type", i);
                reqCommand.allow_oper_ip_addr = packer.GetStrbyName("allow_oper_ip_addr", i);
                reqCommand.allow_login_mac = packer.GetStrbyName("allow_login_mac", i);
                reqCommand.allow_oper_mac = packer.GetStrbyName("allow_oper_mac", i);
                reqCommand.opor_rights_str = packer.GetStrbyName("opor_rights_str", i);
 
                FuncpubL_5_4Models.Add(reqCommand);
            }
            return FuncpubL_5_4Models;
        }
 
        //逻辑_公共_用户_查询操作员信息
        public static List<FuncpubL_5_4Model> GetFuncpubL_5_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_5_4Models = new List<FuncpubL_5_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_5_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR);
                    reqCommand.opor_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_TYPE_INT);
                    reqCommand.opor_pwd = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR);
                    reqCommand.opor_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STATUS_STR);
                    reqCommand.create_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_OPOR_INT);
                    reqCommand.conta_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_ADDR_STR);
                    reqCommand.oper_rights = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_RIGHTS_INT);
                    reqCommand.phone_number = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PHONE_NUMBER_STR);
                    reqCommand.email = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EMAIL_STR);
                    reqCommand.is_trader = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRADER_INT);
                    reqCommand.trader_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NO_INT);
                    reqCommand.allow_login_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_LOGIN_TYPE_STR);
                    reqCommand.allow_oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPER_IP_ADDR_STR);
                    reqCommand.allow_login_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_LOGIN_MAC_STR);
                    reqCommand.allow_oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPER_MAC_STR);
                    reqCommand.opor_rights_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_RIGHTS_STR_STR);
                    FuncpubL_5_4Models.Add(reqCommand);
                }
            }
            return FuncpubL_5_4Models;
        }
 
        //逻辑_公共_用户_查询操作员信息流水
        public static List<FuncpubL_5_11Model> GetFuncpubL_5_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_5_11Models = new List<FuncpubL_5_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_5_11Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.target_opor_no = packer.GetIntbyName("target_opor_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_5_11Models.Add(reqCommand);
            }
            return FuncpubL_5_11Models;
        }
 
        //逻辑_公共_用户_查询操作员信息流水
        public static List<FuncpubL_5_11Model> GetFuncpubL_5_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_5_11Models = new List<FuncpubL_5_11Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_5_11Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.target_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_5_11Models.Add(reqCommand);
                }
            }
            return FuncpubL_5_11Models;
        }
 
        //逻辑_公共_用户_查询历史操作员信息流水
        public static List<FuncpubL_5_12Model> GetFuncpubL_5_12Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_5_12Models = new List<FuncpubL_5_12Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_5_12Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.target_opor_no = packer.GetIntbyName("target_opor_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_5_12Models.Add(reqCommand);
            }
            return FuncpubL_5_12Models;
        }
 
        //逻辑_公共_用户_查询历史操作员信息流水
        public static List<FuncpubL_5_12Model> GetFuncpubL_5_12Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_5_12Models = new List<FuncpubL_5_12Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_5_12Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.target_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_5_12Models.Add(reqCommand);
                }
            }
            return FuncpubL_5_12Models;
        }
 
        //逻辑_公共_用户_检查操作员存在
        public static List<FuncpubL_5_13Model> GetFuncpubL_5_13Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_5_13Models = new List<FuncpubL_5_13Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_5_13Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
 
                FuncpubL_5_13Models.Add(reqCommand);
            }
            return FuncpubL_5_13Models;
        }
 
        //逻辑_公共_用户_检查操作员存在
        public static List<FuncpubL_5_13Model> GetFuncpubL_5_13Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_5_13Models = new List<FuncpubL_5_13Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_5_13Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                FuncpubL_5_13Models.Add(reqCommand);
            }
            return FuncpubL_5_13Models;
        }
 
        //逻辑_公共_用户_获取操作员编号
        public static List<FuncpubL_5_14Model> GetFuncpubL_5_14Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_5_14Models = new List<FuncpubL_5_14Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_5_14Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.target_opor_no = packer.GetIntbyName("target_opor_no", i);
 
                FuncpubL_5_14Models.Add(reqCommand);
            }
            return FuncpubL_5_14Models;
        }
 
        //逻辑_公共_用户_获取操作员编号
        public static List<FuncpubL_5_14Model> GetFuncpubL_5_14Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_5_14Models = new List<FuncpubL_5_14Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_5_14Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.target_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT);
                FuncpubL_5_14Models.Add(reqCommand);
            }
            return FuncpubL_5_14Models;
        }
 
        //逻辑_公共_用户_操作员登录
        public static List<FuncpubL_5_21Model> GetFuncpubL_5_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_5_21Models = new List<FuncpubL_5_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_5_21Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_name = packer.GetStrbyName("opor_name", i);
                reqCommand.opor_type = packer.GetIntbyName("opor_type", i);
                reqCommand.oper_rights = packer.GetIntbyName("oper_rights", i);
                reqCommand.is_trader = packer.GetIntbyName("is_trader", i);
                reqCommand.trader_no = packer.GetIntbyName("trader_no", i);
                reqCommand.online_status = packer.GetIntbyName("online_status", i);
                reqCommand.login_count = packer.GetIntbyName("login_count", i);
                reqCommand.login_error_count = packer.GetIntbyName("login_error_count", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.last_login_ip = packer.GetStrbyName("last_login_ip", i);
                reqCommand.last_login_mac = packer.GetStrbyName("last_login_mac", i);
                reqCommand.last_login_date = packer.GetIntbyName("last_login_date", i);
                reqCommand.last_login_time = packer.GetIntbyName("last_login_time", i);
                reqCommand.co_type = packer.GetIntbyName("co_type", i);
 
                FuncpubL_5_21Models.Add(reqCommand);
            }
            return FuncpubL_5_21Models;
        }
 
        //逻辑_公共_用户_操作员登录
        public static List<FuncpubL_5_21Model> GetFuncpubL_5_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_5_21Models = new List<FuncpubL_5_21Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_5_21Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                reqCommand.opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR);
                reqCommand.opor_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_TYPE_INT);
                reqCommand.oper_rights = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_RIGHTS_INT);
                reqCommand.is_trader = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRADER_INT);
                reqCommand.trader_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NO_INT);
                reqCommand.online_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT);
                reqCommand.login_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOGIN_COUNT_INT);
                reqCommand.login_error_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LOGIN_ERROR_COUNT_INT);
                reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                reqCommand.last_login_ip = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_LAST_LOGIN_IP_STR);
                reqCommand.last_login_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_LAST_LOGIN_MAC_STR);
                reqCommand.last_login_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_LOGIN_DATE_INT);
                reqCommand.last_login_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_LAST_LOGIN_TIME_INT);
                reqCommand.co_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_TYPE_INT);
                FuncpubL_5_21Models.Add(reqCommand);
            }
            return FuncpubL_5_21Models;
        }
 
        //逻辑_公共_用户_查询操作员可操作机构
        public static List<FuncpubL_5_44Model> GetFuncpubL_5_44Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_5_44Models = new List<FuncpubL_5_44Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_5_44Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.oper_rights = packer.GetIntbyName("oper_rights", i);
 
                FuncpubL_5_44Models.Add(reqCommand);
            }
            return FuncpubL_5_44Models;
        }
 
        //逻辑_公共_用户_查询操作员可操作机构
        public static List<FuncpubL_5_44Model> GetFuncpubL_5_44Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_5_44Models = new List<FuncpubL_5_44Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_5_44Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.oper_rights = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_RIGHTS_INT);
                    FuncpubL_5_44Models.Add(reqCommand);
                }
            }
            return FuncpubL_5_44Models;
        }
 
        //逻辑_公共_用户_查询全部交易组
        public static List<FuncpubL_5_65Model> GetFuncpubL_5_65Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_5_65Models = new List<FuncpubL_5_65Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_5_65Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_group_code = packer.GetStrbyName("exch_group_code", i);
                reqCommand.exch_group_name = packer.GetStrbyName("exch_group_name", i);
                reqCommand.exch_group_status = packer.GetStrbyName("exch_group_status", i);
                reqCommand.default_group_flag = packer.GetIntbyName("default_group_flag", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
 
                FuncpubL_5_65Models.Add(reqCommand);
            }
            return FuncpubL_5_65Models;
        }
 
        //逻辑_公共_用户_查询全部交易组
        public static List<FuncpubL_5_65Model> GetFuncpubL_5_65Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_5_65Models = new List<FuncpubL_5_65Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_5_65Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_group_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_CODE_STR);
                    reqCommand.exch_group_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NAME_STR);
                    reqCommand.exch_group_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_STATUS_STR);
                    reqCommand.default_group_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_GROUP_FLAG_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    FuncpubL_5_65Models.Add(reqCommand);
                }
            }
            return FuncpubL_5_65Models;
        }
 
        //逻辑_公共_用户_查询全部操作员信息
        public static List<FuncpubL_5_201Model> GetFuncpubL_5_201Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_5_201Models = new List<FuncpubL_5_201Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_5_201Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.opor_name = packer.GetStrbyName("opor_name", i);
                reqCommand.opor_type = packer.GetIntbyName("opor_type", i);
                reqCommand.opor_pwd = packer.GetStrbyName("opor_pwd", i);
                reqCommand.opor_status = packer.GetStrbyName("opor_status", i);
                reqCommand.create_opor = packer.GetIntbyName("create_opor", i);
                reqCommand.conta_addr = packer.GetStrbyName("conta_addr", i);
                reqCommand.oper_rights = packer.GetIntbyName("oper_rights", i);
                reqCommand.phone_number = packer.GetStrbyName("phone_number", i);
                reqCommand.email = packer.GetStrbyName("email", i);
                reqCommand.is_trader = packer.GetIntbyName("is_trader", i);
                reqCommand.trader_no = packer.GetIntbyName("trader_no", i);
                reqCommand.allow_login_type = packer.GetStrbyName("allow_login_type", i);
                reqCommand.allow_oper_ip_addr = packer.GetStrbyName("allow_oper_ip_addr", i);
                reqCommand.allow_oper_mac = packer.GetStrbyName("allow_oper_mac", i);
 
                FuncpubL_5_201Models.Add(reqCommand);
            }
            return FuncpubL_5_201Models;
        }
 
        //逻辑_公共_用户_查询全部操作员信息
        public static List<FuncpubL_5_201Model> GetFuncpubL_5_201Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_5_201Models = new List<FuncpubL_5_201Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_5_201Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR);
                    reqCommand.opor_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_TYPE_INT);
                    reqCommand.opor_pwd = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_PWD_STR);
                    reqCommand.opor_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STATUS_STR);
                    reqCommand.create_opor = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_OPOR_INT);
                    reqCommand.conta_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_ADDR_STR);
                    reqCommand.oper_rights = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_RIGHTS_INT);
                    reqCommand.phone_number = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PHONE_NUMBER_STR);
                    reqCommand.email = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EMAIL_STR);
                    reqCommand.is_trader = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRADER_INT);
                    reqCommand.trader_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRADER_NO_INT);
                    reqCommand.allow_login_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_LOGIN_TYPE_STR);
                    reqCommand.allow_oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPER_IP_ADDR_STR);
                    reqCommand.allow_oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPER_MAC_STR);
                    FuncpubL_5_201Models.Add(reqCommand);
                }
            }
            return FuncpubL_5_201Models;
        }
 
        //逻辑_公共_用户_获取操作员交易组权限串
        public static List<FuncpubL_5_202Model> GetFuncpubL_5_202Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_5_202Models = new List<FuncpubL_5_202Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_5_202Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.exch_group_no_rights_str = packer.GetStrbyName("exch_group_no_rights_str", i);
 
                FuncpubL_5_202Models.Add(reqCommand);
            }
            return FuncpubL_5_202Models;
        }
 
        //逻辑_公共_用户_获取操作员交易组权限串
        public static List<FuncpubL_5_202Model> GetFuncpubL_5_202Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_5_202Models = new List<FuncpubL_5_202Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_5_202Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.exch_group_no_rights_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_RIGHTS_STR_STR);
                    FuncpubL_5_202Models.Add(reqCommand);
                }
            }
            return FuncpubL_5_202Models;
        }
 
        //逻辑_公共_用户_获取操作员交易组权限
        public static List<FuncpubL_5_203Model> GetFuncpubL_5_203Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_5_203Models = new List<FuncpubL_5_203Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_5_203Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.abolish_status = packer.GetStrbyName("abolish_status", i);
 
                FuncpubL_5_203Models.Add(reqCommand);
            }
            return FuncpubL_5_203Models;
        }
 
        //逻辑_公共_用户_获取操作员交易组权限
        public static List<FuncpubL_5_203Model> GetFuncpubL_5_203Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_5_203Models = new List<FuncpubL_5_203Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_5_203Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.abolish_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ABOLISH_STATUS_STR);
                    FuncpubL_5_203Models.Add(reqCommand);
                }
            }
            return FuncpubL_5_203Models;
        }
 
        //逻辑_公共_用户_查询操作员可设置操作员
        public static List<FuncpubL_5_204Model> GetFuncpubL_5_204Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_5_204Models = new List<FuncpubL_5_204Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_5_204Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.allow_opor_no = packer.GetIntbyName("allow_opor_no", i);
 
                FuncpubL_5_204Models.Add(reqCommand);
            }
            return FuncpubL_5_204Models;
        }
 
        //逻辑_公共_用户_查询操作员可设置操作员
        public static List<FuncpubL_5_204Model> GetFuncpubL_5_204Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_5_204Models = new List<FuncpubL_5_204Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_5_204Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.allow_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_INT);
                    FuncpubL_5_204Models.Add(reqCommand);
                }
            }
            return FuncpubL_5_204Models;
        }
 
        //逻辑_公共_用户_新增交易组信息
        public static List<FuncpubL_5_208Model> GetFuncpubL_5_208Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_5_208Models = new List<FuncpubL_5_208Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_5_208Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
 
                FuncpubL_5_208Models.Add(reqCommand);
            }
            return FuncpubL_5_208Models;
        }
 
        //逻辑_公共_用户_新增交易组信息
        public static List<FuncpubL_5_208Model> GetFuncpubL_5_208Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_5_208Models = new List<FuncpubL_5_208Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_5_208Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                FuncpubL_5_208Models.Add(reqCommand);
            }
            return FuncpubL_5_208Models;
        }
 
        //逻辑_公共_用户_查询交易组信息
        public static List<FuncpubL_5_209Model> GetFuncpubL_5_209Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_5_209Models = new List<FuncpubL_5_209Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_5_209Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.exch_group_code = packer.GetStrbyName("exch_group_code", i);
                reqCommand.exch_group_name = packer.GetStrbyName("exch_group_name", i);
                reqCommand.exch_group_status = packer.GetStrbyName("exch_group_status", i);
                reqCommand.default_group_flag = packer.GetIntbyName("default_group_flag", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.first_asset = packer.GetDoublebyName("first_asset", i);
                reqCommand.pre_nav = packer.GetDoublebyName("pre_nav", i);
                reqCommand.exch_group_dist_pd_amt = packer.GetDoublebyName("exch_group_dist_pd_amt", i);
                reqCommand.exch_group_pd_share = packer.GetDoublebyName("exch_group_pd_share", i);
                reqCommand.allow_exch = packer.GetStrbyName("allow_exch", i);
                reqCommand.allow_stock_type = packer.GetStrbyName("allow_stock_type", i);
                reqCommand.busi_config_str = packer.GetStrbyName("busi_config_str", i);
                reqCommand.market_price_ratio = packer.GetDoublebyName("market_price_ratio", i);
                reqCommand.forbid_order_dir = packer.GetStrbyName("forbid_order_dir", i);
                reqCommand.trade_acco = packer.GetStrbyName("trade_acco", i);
                reqCommand.weight_value = packer.GetDoublebyName("weight_value", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.futu_default_group_flag = packer.GetIntbyName("futu_default_group_flag", i);
                reqCommand.fina_loan_default_group_flag = packer.GetIntbyName("fina_loan_default_group_flag", i);
 
                FuncpubL_5_209Models.Add(reqCommand);
            }
            return FuncpubL_5_209Models;
        }
 
        //逻辑_公共_用户_查询交易组信息
        public static List<FuncpubL_5_209Model> GetFuncpubL_5_209Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_5_209Models = new List<FuncpubL_5_209Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_5_209Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.exch_group_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_CODE_STR);
                    reqCommand.exch_group_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NAME_STR);
                    reqCommand.exch_group_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_STATUS_STR);
                    reqCommand.default_group_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_GROUP_FLAG_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.first_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT);
                    reqCommand.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    reqCommand.exch_group_dist_pd_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_DIST_PD_AMT_FLOAT);
                    reqCommand.exch_group_pd_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_PD_SHARE_FLOAT);
                    reqCommand.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    reqCommand.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    reqCommand.busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR);
                    reqCommand.market_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT);
                    reqCommand.forbid_order_dir = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FORBID_ORDER_DIR_STR);
                    reqCommand.trade_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_ACCO_STR);
                    reqCommand.weight_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_VALUE_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.futu_default_group_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_DEFAULT_GROUP_FLAG_INT);
                    reqCommand.fina_loan_default_group_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FINA_LOAN_DEFAULT_GROUP_FLAG_INT);
                    FuncpubL_5_209Models.Add(reqCommand);
                }
            }
            return FuncpubL_5_209Models;
        }
 
    }
}
