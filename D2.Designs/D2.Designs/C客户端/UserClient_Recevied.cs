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

    public static class UserClient
    {
        //逻辑_公共_用户客户端_查询操作员信息
        public static List<FuncpubL_19_4Model> GetFuncpubL_19_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_4Models = new List<FuncpubL_19_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_4Model();
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
                reqCommand.index_value = packer.GetIntbyName("index_value", i);
                reqCommand.manage_nolgn_opor_orders = packer.GetIntbyName("manage_nolgn_opor_orders", i);
 
                FuncpubL_19_4Models.Add(reqCommand);
            }
            return FuncpubL_19_4Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员信息
        public static List<FuncpubL_19_4Model> GetFuncpubL_19_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_4Models = new List<FuncpubL_19_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_4Model();
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
                    reqCommand.index_value = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_VALUE_INT);
                    reqCommand.manage_nolgn_opor_orders = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MANAGE_NOLGN_OPOR_ORDERS_INT);
                    FuncpubL_19_4Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_4Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员信息流水
        public static List<FuncpubL_19_11Model> GetFuncpubL_19_11Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_11Models = new List<FuncpubL_19_11Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_11Model();
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
 
                FuncpubL_19_11Models.Add(reqCommand);
            }
            return FuncpubL_19_11Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员信息流水
        public static List<FuncpubL_19_11Model> GetFuncpubL_19_11Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_11Models = new List<FuncpubL_19_11Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_11Model();
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
                    FuncpubL_19_11Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_11Models;
        }
 
        //逻辑_公共_用户客户端_查询历史操作员信息流水
        public static List<FuncpubL_19_12Model> GetFuncpubL_19_12Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_12Models = new List<FuncpubL_19_12Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_12Model();
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
 
                FuncpubL_19_12Models.Add(reqCommand);
            }
            return FuncpubL_19_12Models;
        }
 
        //逻辑_公共_用户客户端_查询历史操作员信息流水
        public static List<FuncpubL_19_12Model> GetFuncpubL_19_12Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_12Models = new List<FuncpubL_19_12Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_12Model();
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
                    FuncpubL_19_12Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_12Models;
        }
 
        //逻辑_公共_用户客户端_获取操作员编号
        public static List<FuncpubL_19_14Model> GetFuncpubL_19_14Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_14Models = new List<FuncpubL_19_14Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_14Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.target_opor_no = packer.GetIntbyName("target_opor_no", i);
 
                FuncpubL_19_14Models.Add(reqCommand);
            }
            return FuncpubL_19_14Models;
        }
 
        //逻辑_公共_用户客户端_获取操作员编号
        public static List<FuncpubL_19_14Model> GetFuncpubL_19_14Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_14Models = new List<FuncpubL_19_14Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_19_14Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.target_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_OPOR_NO_INT);
                FuncpubL_19_14Models.Add(reqCommand);
            }
            return FuncpubL_19_14Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员列表
        public static List<FuncpubL_19_15Model> GetFuncpubL_19_15Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_15Models = new List<FuncpubL_19_15Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_15Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.opor_name = packer.GetStrbyName("opor_name", i);
                reqCommand.opor_status = packer.GetStrbyName("opor_status", i);
                reqCommand.is_trader = packer.GetIntbyName("is_trader", i);
 
                FuncpubL_19_15Models.Add(reqCommand);
            }
            return FuncpubL_19_15Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员列表
        public static List<FuncpubL_19_15Model> GetFuncpubL_19_15Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_15Models = new List<FuncpubL_19_15Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_15Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR);
                    reqCommand.opor_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_STATUS_STR);
                    reqCommand.is_trader = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_IS_TRADER_INT);
                    FuncpubL_19_15Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_15Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员权限信息
        public static List<FuncpubL_19_18Model> GetFuncpubL_19_18Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_18Models = new List<FuncpubL_19_18Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_18Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.allow_oper_mac = packer.GetStrbyName("allow_oper_mac", i);
                reqCommand.opor_rights_str = packer.GetStrbyName("opor_rights_str", i);
 
                FuncpubL_19_18Models.Add(reqCommand);
            }
            return FuncpubL_19_18Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员权限信息
        public static List<FuncpubL_19_18Model> GetFuncpubL_19_18Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_18Models = new List<FuncpubL_19_18Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_19_18Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.allow_oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPER_MAC_STR);
                reqCommand.opor_rights_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_RIGHTS_STR_STR);
                FuncpubL_19_18Models.Add(reqCommand);
            }
            return FuncpubL_19_18Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员登录地址信息
        public static List<FuncpubL_19_19Model> GetFuncpubL_19_19Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_19Models = new List<FuncpubL_19_19Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_19Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
 
                FuncpubL_19_19Models.Add(reqCommand);
            }
            return FuncpubL_19_19Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员登录地址信息
        public static List<FuncpubL_19_19Model> GetFuncpubL_19_19Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_19Models = new List<FuncpubL_19_19Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_19Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    FuncpubL_19_19Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_19Models;
        }
 
        //逻辑_公共_用户客户端_操作员登录
        public static List<FuncpubL_19_21Model> GetFuncpubL_19_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_21Models = new List<FuncpubL_19_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_21Model();
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
                reqCommand.last_oper_info = packer.GetStrbyName("last_oper_info", i);
                reqCommand.co_type = packer.GetIntbyName("co_type", i);
                reqCommand.co_busi_config_str = packer.GetStrbyName("co_busi_config_str", i);
                reqCommand.change_pwd_flag = packer.GetIntbyName("change_pwd_flag", i);
                reqCommand.sys_type = packer.GetIntbyName("sys_type", i);
 
                FuncpubL_19_21Models.Add(reqCommand);
            }
            return FuncpubL_19_21Models;
        }
 
        //逻辑_公共_用户客户端_操作员登录
        public static List<FuncpubL_19_21Model> GetFuncpubL_19_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_21Models = new List<FuncpubL_19_21Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_19_21Model();
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
                reqCommand.last_oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_LAST_OPER_INFO_STR);
                reqCommand.co_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_TYPE_INT);
                reqCommand.co_busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_BUSI_CONFIG_STR_STR);
                reqCommand.change_pwd_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CHANGE_PWD_FLAG_INT);
                reqCommand.sys_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SYS_TYPE_INT);
                FuncpubL_19_21Models.Add(reqCommand);
            }
            return FuncpubL_19_21Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员配置
        public static List<FuncpubL_19_32Model> GetFuncpubL_19_32Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_32Models = new List<FuncpubL_19_32Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_32Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.config_no = packer.GetInt64byName("config_no", i);
                reqCommand.config_name = packer.GetStrbyName("config_name", i);
                reqCommand.config_value = packer.GetStrbyName("config_value", i);
 
                FuncpubL_19_32Models.Add(reqCommand);
            }
            return FuncpubL_19_32Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员配置
        public static List<FuncpubL_19_32Model> GetFuncpubL_19_32Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_32Models = new List<FuncpubL_19_32Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_32Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.config_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64);
                    reqCommand.config_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR);
                    reqCommand.config_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR);
                    FuncpubL_19_32Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_32Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员表格显示
        public static List<FuncpubL_19_34Model> GetFuncpubL_19_34Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_34Models = new List<FuncpubL_19_34Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_34Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.parent_panel = packer.GetStrbyName("parent_panel", i);
                reqCommand.dbgrid_name = packer.GetStrbyName("dbgrid_name", i);
                reqCommand.dbgrid_key = packer.GetStrbyName("dbgrid_key", i);
                reqCommand.dbgrid_field = packer.GetStrbyName("dbgrid_field", i);
                reqCommand.field_width = packer.GetIntbyName("field_width", i);
                reqCommand.field_order = packer.GetIntbyName("field_order", i);
                reqCommand.client_type = packer.GetIntbyName("client_type", i);
 
                FuncpubL_19_34Models.Add(reqCommand);
            }
            return FuncpubL_19_34Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员表格显示
        public static List<FuncpubL_19_34Model> GetFuncpubL_19_34Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_34Models = new List<FuncpubL_19_34Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_34Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.parent_panel = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PARENT_PANEL_STR);
                    reqCommand.dbgrid_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DBGRID_NAME_STR);
                    reqCommand.dbgrid_key = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DBGRID_KEY_STR);
                    reqCommand.dbgrid_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DBGRID_FIELD_STR);
                    reqCommand.field_width = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FIELD_WIDTH_INT);
                    reqCommand.field_order = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FIELD_ORDER_INT);
                    reqCommand.client_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_TYPE_INT);
                    FuncpubL_19_34Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_34Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员可操作产品
        public static List<FuncpubL_19_48Model> GetFuncpubL_19_48Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_48Models = new List<FuncpubL_19_48Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_48Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.oper_rights = packer.GetIntbyName("oper_rights", i);
 
                FuncpubL_19_48Models.Add(reqCommand);
            }
            return FuncpubL_19_48Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员可操作产品
        public static List<FuncpubL_19_48Model> GetFuncpubL_19_48Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_48Models = new List<FuncpubL_19_48Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_48Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.oper_rights = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_RIGHTS_INT);
                    FuncpubL_19_48Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_48Models;
        }
 
        //逻辑_公共_用户客户端_新增交易组信息
        public static List<FuncpubL_19_51Model> GetFuncpubL_19_51Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_51Models = new List<FuncpubL_19_51Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_51Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
 
                FuncpubL_19_51Models.Add(reqCommand);
            }
            return FuncpubL_19_51Models;
        }
 
        //逻辑_公共_用户客户端_新增交易组信息
        public static List<FuncpubL_19_51Model> GetFuncpubL_19_51Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_51Models = new List<FuncpubL_19_51Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_19_51Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                FuncpubL_19_51Models.Add(reqCommand);
            }
            return FuncpubL_19_51Models;
        }
 
        //逻辑_公共_用户客户端_查询交易组信息
        public static List<FuncpubL_19_54Model> GetFuncpubL_19_54Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_54Models = new List<FuncpubL_19_54Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_54Model();
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
 
                FuncpubL_19_54Models.Add(reqCommand);
            }
            return FuncpubL_19_54Models;
        }
 
        //逻辑_公共_用户客户端_查询交易组信息
        public static List<FuncpubL_19_54Model> GetFuncpubL_19_54Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_54Models = new List<FuncpubL_19_54Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_54Model();
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
                    FuncpubL_19_54Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_54Models;
        }
 
        //逻辑_公共_用户客户端_查询交易组信息流水
        public static List<FuncpubL_19_58Model> GetFuncpubL_19_58Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_58Models = new List<FuncpubL_19_58Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_58Model();
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
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_19_58Models.Add(reqCommand);
            }
            return FuncpubL_19_58Models;
        }
 
        //逻辑_公共_用户客户端_查询交易组信息流水
        public static List<FuncpubL_19_58Model> GetFuncpubL_19_58Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_58Models = new List<FuncpubL_19_58Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_58Model();
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
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_19_58Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_58Models;
        }
 
        //逻辑_公共_用户客户端_查询历史交易组信息流水
        public static List<FuncpubL_19_59Model> GetFuncpubL_19_59Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_59Models = new List<FuncpubL_19_59Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_59Model();
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
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_19_59Models.Add(reqCommand);
            }
            return FuncpubL_19_59Models;
        }
 
        //逻辑_公共_用户客户端_查询历史交易组信息流水
        public static List<FuncpubL_19_59Model> GetFuncpubL_19_59Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_59Models = new List<FuncpubL_19_59Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_59Model();
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
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_19_59Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_59Models;
        }
 
        //逻辑_公共_用户客户端_查询可见交易组
        public static List<FuncpubL_19_73Model> GetFuncpubL_19_73Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_73Models = new List<FuncpubL_19_73Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_73Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.exch_group_code = packer.GetStrbyName("exch_group_code", i);
                reqCommand.exch_group_name = packer.GetStrbyName("exch_group_name", i);
                reqCommand.exch_group_status = packer.GetStrbyName("exch_group_status", i);
                reqCommand.default_group_flag = packer.GetIntbyName("default_group_flag", i);
 
                FuncpubL_19_73Models.Add(reqCommand);
            }
            return FuncpubL_19_73Models;
        }
 
        //逻辑_公共_用户客户端_查询可见交易组
        public static List<FuncpubL_19_73Model> GetFuncpubL_19_73Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_73Models = new List<FuncpubL_19_73Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_73Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.exch_group_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_CODE_STR);
                    reqCommand.exch_group_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NAME_STR);
                    reqCommand.exch_group_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_STATUS_STR);
                    reqCommand.default_group_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DEFAULT_GROUP_FLAG_INT);
                    FuncpubL_19_73Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_73Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员所属交易组
        public static List<FuncpubL_19_64Model> GetFuncpubL_19_64Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_64Models = new List<FuncpubL_19_64Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_64Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.oper_rights = packer.GetIntbyName("oper_rights", i);
 
                FuncpubL_19_64Models.Add(reqCommand);
            }
            return FuncpubL_19_64Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员所属交易组
        public static List<FuncpubL_19_64Model> GetFuncpubL_19_64Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_64Models = new List<FuncpubL_19_64Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_64Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.oper_rights = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_RIGHTS_INT);
                    FuncpubL_19_64Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_64Models;
        }
 
        //逻辑_公共_用户客户端_新增产品账户交易组组别
        public static List<FuncpubL_19_65Model> GetFuncpubL_19_65Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_65Models = new List<FuncpubL_19_65Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_65Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.group_no = packer.GetIntbyName("group_no", i);
 
                FuncpubL_19_65Models.Add(reqCommand);
            }
            return FuncpubL_19_65Models;
        }
 
        //逻辑_公共_用户客户端_新增产品账户交易组组别
        public static List<FuncpubL_19_65Model> GetFuncpubL_19_65Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_65Models = new List<FuncpubL_19_65Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_19_65Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NO_INT);
                FuncpubL_19_65Models.Add(reqCommand);
            }
            return FuncpubL_19_65Models;
        }
 
        //逻辑_公共_用户客户端_查询产品账户交易组组别
        public static List<FuncpubL_19_68Model> GetFuncpubL_19_68Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_68Models = new List<FuncpubL_19_68Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_68Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.group_no = packer.GetIntbyName("group_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.group_name = packer.GetStrbyName("group_name", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.pd_account_group_type = packer.GetIntbyName("pd_account_group_type", i);
 
                FuncpubL_19_68Models.Add(reqCommand);
            }
            return FuncpubL_19_68Models;
        }
 
        //逻辑_公共_用户客户端_查询产品账户交易组组别
        public static List<FuncpubL_19_68Model> GetFuncpubL_19_68Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_68Models = new List<FuncpubL_19_68Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_68Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.group_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NAME_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.pd_account_group_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_ACCOUNT_GROUP_TYPE_INT);
                    FuncpubL_19_68Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_68Models;
        }
 
        //逻辑_公共_用户客户端_查询产品账户交易组组别明细
        public static List<FuncpubL_19_72Model> GetFuncpubL_19_72Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_72Models = new List<FuncpubL_19_72Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_72Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.group_no = packer.GetIntbyName("group_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.weight_ratio = packer.GetDoublebyName("weight_ratio", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_19_72Models.Add(reqCommand);
            }
            return FuncpubL_19_72Models;
        }
 
        //逻辑_公共_用户客户端_查询产品账户交易组组别明细
        public static List<FuncpubL_19_72Model> GetFuncpubL_19_72Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_72Models = new List<FuncpubL_19_72Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_72Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_GROUP_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.weight_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WEIGHT_RATIO_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_19_72Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_72Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员可操作操作员
        public static List<FuncpubL_19_76Model> GetFuncpubL_19_76Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_76Models = new List<FuncpubL_19_76Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_76Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.allow_opor_no = packer.GetIntbyName("allow_opor_no", i);
                reqCommand.oper_rights = packer.GetIntbyName("oper_rights", i);
 
                FuncpubL_19_76Models.Add(reqCommand);
            }
            return FuncpubL_19_76Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员可操作操作员
        public static List<FuncpubL_19_76Model> GetFuncpubL_19_76Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_76Models = new List<FuncpubL_19_76Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_76Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.allow_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_INT);
                    reqCommand.oper_rights = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_RIGHTS_INT);
                    FuncpubL_19_76Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_76Models;
        }
 
        //逻辑_公共_用户客户端_查询交易组历史资产
        public static List<FuncpubL_19_89Model> GetFuncpubL_19_89Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_89Models = new List<FuncpubL_19_89Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_89Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_NAV = packer.GetDoublebyName("begin_NAV", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.total_cash_asset = packer.GetDoublebyName("total_cash_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.money_fund_asset = packer.GetDoublebyName("money_fund_asset", i);
                reqCommand.not_money_fund_asset = packer.GetDoublebyName("not_money_fund_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.futu_asset = packer.GetDoublebyName("futu_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.hk_thrgh_stock_asset = packer.GetDoublebyName("hk_thrgh_stock_asset", i);
                reqCommand.stock_cash_asset = packer.GetDoublebyName("stock_cash_asset", i);
                reqCommand.futu_cash_asset = packer.GetDoublebyName("futu_cash_asset", i);
 
                FuncpubL_19_89Models.Add(reqCommand);
            }
            return FuncpubL_19_89Models;
        }
 
        //逻辑_公共_用户客户端_查询交易组历史资产
        public static List<FuncpubL_19_89Model> GetFuncpubL_19_89Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_89Models = new List<FuncpubL_19_89Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_89Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    reqCommand.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    reqCommand.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    FuncpubL_19_89Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_89Models;
        }
 
        //逻辑_公共_用户客户端_查询交易组资产
        public static List<FuncpubL_19_91Model> GetFuncpubL_19_91Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_91Models = new List<FuncpubL_19_91Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_91Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_NAV = packer.GetDoublebyName("begin_NAV", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.total_cash_asset = packer.GetDoublebyName("total_cash_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.money_fund_asset = packer.GetDoublebyName("money_fund_asset", i);
                reqCommand.not_money_fund_asset = packer.GetDoublebyName("not_money_fund_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.futu_asset = packer.GetDoublebyName("futu_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.hk_thrgh_stock_asset = packer.GetDoublebyName("hk_thrgh_stock_asset", i);
                reqCommand.begin_evalu_nav_asset = packer.GetDoublebyName("begin_evalu_nav_asset", i);
                reqCommand.evalu_nav_asset = packer.GetDoublebyName("evalu_nav_asset", i);
                reqCommand.futu_long_market_value = packer.GetDoublebyName("futu_long_market_value", i);
                reqCommand.futu_short_market_value = packer.GetDoublebyName("futu_short_market_value", i);
                reqCommand.stock_cash_asset = packer.GetDoublebyName("stock_cash_asset", i);
                reqCommand.futu_cash_asset = packer.GetDoublebyName("futu_cash_asset", i);
 
                FuncpubL_19_91Models.Add(reqCommand);
            }
            return FuncpubL_19_91Models;
        }
 
        //逻辑_公共_用户客户端_查询交易组资产
        public static List<FuncpubL_19_91Model> GetFuncpubL_19_91Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_91Models = new List<FuncpubL_19_91Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_91Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    reqCommand.begin_evalu_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_EVALU_NAV_ASSET_FLOAT);
                    reqCommand.evalu_nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EVALU_NAV_ASSET_FLOAT);
                    reqCommand.futu_long_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_LONG_MARKET_VALUE_FLOAT);
                    reqCommand.futu_short_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_SHORT_MARKET_VALUE_FLOAT);
                    reqCommand.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    reqCommand.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    FuncpubL_19_91Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_91Models;
        }
 
        //逻辑_公共_用户客户端_查询交易组资产历史
        public static List<FuncpubL_19_90Model> GetFuncpubL_19_90Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_90Models = new List<FuncpubL_19_90Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_90Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.begin_NAV = packer.GetDoublebyName("begin_NAV", i);
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
                reqCommand.total_cash_asset = packer.GetDoublebyName("total_cash_asset", i);
                reqCommand.money_fund_asset = packer.GetDoublebyName("money_fund_asset", i);
                reqCommand.not_money_fund_asset = packer.GetDoublebyName("not_money_fund_asset", i);
                reqCommand.stock_asset = packer.GetDoublebyName("stock_asset", i);
                reqCommand.fund_asset = packer.GetDoublebyName("fund_asset", i);
                reqCommand.bond_asset = packer.GetDoublebyName("bond_asset", i);
                reqCommand.futu_asset = packer.GetDoublebyName("futu_asset", i);
                reqCommand.repo_asset = packer.GetDoublebyName("repo_asset", i);
                reqCommand.other_asset = packer.GetDoublebyName("other_asset", i);
                reqCommand.hk_thrgh_stock_asset = packer.GetDoublebyName("hk_thrgh_stock_asset", i);
                reqCommand.futu_long_market_value = packer.GetDoublebyName("futu_long_market_value", i);
                reqCommand.futu_short_market_value = packer.GetDoublebyName("futu_short_market_value", i);
                reqCommand.stock_cash_asset = packer.GetDoublebyName("stock_cash_asset", i);
                reqCommand.futu_cash_asset = packer.GetDoublebyName("futu_cash_asset", i);
 
                FuncpubL_19_90Models.Add(reqCommand);
            }
            return FuncpubL_19_90Models;
        }
 
        //逻辑_公共_用户客户端_查询交易组资产历史
        public static List<FuncpubL_19_90Model> GetFuncpubL_19_90Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_90Models = new List<FuncpubL_19_90Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_90Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.begin_NAV = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_NAV_FLOAT);
                    reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                    reqCommand.total_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TOTAL_CASH_ASSET_FLOAT);
                    reqCommand.money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.not_money_fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NOT_MONEY_FUND_ASSET_FLOAT);
                    reqCommand.stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_ASSET_FLOAT);
                    reqCommand.fund_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUND_ASSET_FLOAT);
                    reqCommand.bond_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BOND_ASSET_FLOAT);
                    reqCommand.futu_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_FLOAT);
                    reqCommand.repo_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_REPO_ASSET_FLOAT);
                    reqCommand.other_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_ASSET_FLOAT);
                    reqCommand.hk_thrgh_stock_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HK_THRGH_STOCK_ASSET_FLOAT);
                    reqCommand.futu_long_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_LONG_MARKET_VALUE_FLOAT);
                    reqCommand.futu_short_market_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_SHORT_MARKET_VALUE_FLOAT);
                    reqCommand.stock_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CASH_ASSET_FLOAT);
                    reqCommand.futu_cash_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_CASH_ASSET_FLOAT);
                    FuncpubL_19_90Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_90Models;
        }
 
        //逻辑_公共_用户客户端_获取交易组最大净值
        public static List<FuncpubL_19_92Model> GetFuncpubL_19_92Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_92Models = new List<FuncpubL_19_92Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_92Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
 
                FuncpubL_19_92Models.Add(reqCommand);
            }
            return FuncpubL_19_92Models;
        }
 
        //逻辑_公共_用户客户端_获取交易组最大净值
        public static List<FuncpubL_19_92Model> GetFuncpubL_19_92Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_92Models = new List<FuncpubL_19_92Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_19_92Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                FuncpubL_19_92Models.Add(reqCommand);
            }
            return FuncpubL_19_92Models;
        }
 
        //逻辑_公共_用户客户端_获取交易组最大单位净值
        public static List<FuncpubL_19_93Model> GetFuncpubL_19_93Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_93Models = new List<FuncpubL_19_93Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_93Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.unit_nav = packer.GetDoublebyName("unit_nav", i);
 
                FuncpubL_19_93Models.Add(reqCommand);
            }
            return FuncpubL_19_93Models;
        }
 
        //逻辑_公共_用户客户端_获取交易组最大单位净值
        public static List<FuncpubL_19_93Model> GetFuncpubL_19_93Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_93Models = new List<FuncpubL_19_93Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_19_93Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.unit_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UNIT_NAV_FLOAT);
                FuncpubL_19_93Models.Add(reqCommand);
            }
            return FuncpubL_19_93Models;
        }
 
        //逻辑_公共_用户客户端_查询交易组份额变动流水
        public static List<FuncpubL_19_94Model> GetFuncpubL_19_94Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_94Models = new List<FuncpubL_19_94Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_94Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
 
                FuncpubL_19_94Models.Add(reqCommand);
            }
            return FuncpubL_19_94Models;
        }
 
        //逻辑_公共_用户客户端_查询交易组份额变动流水
        public static List<FuncpubL_19_94Model> GetFuncpubL_19_94Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_94Models = new List<FuncpubL_19_94Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_94Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    FuncpubL_19_94Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_94Models;
        }
 
        //逻辑_公共_用户客户端_查询交易组份额变动流水历史
        public static List<FuncpubL_19_95Model> GetFuncpubL_19_95Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_95Models = new List<FuncpubL_19_95Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_95Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
 
                FuncpubL_19_95Models.Add(reqCommand);
            }
            return FuncpubL_19_95Models;
        }
 
        //逻辑_公共_用户客户端_查询交易组份额变动流水历史
        public static List<FuncpubL_19_95Model> GetFuncpubL_19_95Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_95Models = new List<FuncpubL_19_95Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_95Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    FuncpubL_19_95Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_95Models;
        }
 
        //逻辑_公共_用户客户端_查询可见交易员列表
        public static List<FuncpubL_19_202Model> GetFuncpubL_19_202Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_202Models = new List<FuncpubL_19_202Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_202Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.opor_name = packer.GetStrbyName("opor_name", i);
 
                FuncpubL_19_202Models.Add(reqCommand);
            }
            return FuncpubL_19_202Models;
        }
 
        //逻辑_公共_用户客户端_查询可见交易员列表
        public static List<FuncpubL_19_202Model> GetFuncpubL_19_202Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_202Models = new List<FuncpubL_19_202Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_202Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.opor_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NAME_STR);
                    FuncpubL_19_202Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_202Models;
        }
 
        //逻辑_公共_用户客户端_查询自动打新交易组列表
        public static List<FuncpubL_19_203Model> GetFuncpubL_19_203Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_203Models = new List<FuncpubL_19_203Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_203Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
                reqCommand.exch_group_code = packer.GetStrbyName("exch_group_code", i);
                reqCommand.exch_group_name = packer.GetStrbyName("exch_group_name", i);
 
                FuncpubL_19_203Models.Add(reqCommand);
            }
            return FuncpubL_19_203Models;
        }
 
        //逻辑_公共_用户客户端_查询自动打新交易组列表
        public static List<FuncpubL_19_203Model> GetFuncpubL_19_203Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_203Models = new List<FuncpubL_19_203Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_203Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    reqCommand.exch_group_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_CODE_STR);
                    reqCommand.exch_group_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NAME_STR);
                    FuncpubL_19_203Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_203Models;
        }
 
        //逻辑_公共_用户客户端_获取可操作该产品操作员编号串
        public static List<FuncpubL_19_902Model> GetFuncpubL_19_902Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_902Models = new List<FuncpubL_19_902Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_902Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.allow_opor_no_str = packer.GetStrbyName("allow_opor_no_str", i);
 
                FuncpubL_19_902Models.Add(reqCommand);
            }
            return FuncpubL_19_902Models;
        }
 
        //逻辑_公共_用户客户端_获取可操作该产品操作员编号串
        public static List<FuncpubL_19_902Model> GetFuncpubL_19_902Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_902Models = new List<FuncpubL_19_902Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_19_902Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.allow_opor_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_STR_STR);
                FuncpubL_19_902Models.Add(reqCommand);
            }
            return FuncpubL_19_902Models;
        }
 
        //逻辑_公共_用户客户端_查询期现对冲组合
        public static List<FuncpubL_19_304Model> GetFuncpubL_19_304Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_304Models = new List<FuncpubL_19_304Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_304Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.comm_trd_type = packer.GetIntbyName("comm_trd_type", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.hedg_name = packer.GetStrbyName("hedg_name", i);
                reqCommand.futu_exch_group_no = packer.GetIntbyName("futu_exch_group_no", i);
                reqCommand.futu_asset_acco_no = packer.GetIntbyName("futu_asset_acco_no", i);
                reqCommand.futu_order_pd_no = packer.GetIntbyName("futu_order_pd_no", i);
                reqCommand.secu_exch_group_no = packer.GetIntbyName("secu_exch_group_no", i);
                reqCommand.secu_asset_acco_no = packer.GetIntbyName("secu_asset_acco_no", i);
                reqCommand.secu_order_pd_no = packer.GetIntbyName("secu_order_pd_no", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_19_304Models.Add(reqCommand);
            }
            return FuncpubL_19_304Models;
        }
 
        //逻辑_公共_用户客户端_查询期现对冲组合
        public static List<FuncpubL_19_304Model> GetFuncpubL_19_304Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_304Models = new List<FuncpubL_19_304Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_304Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.comm_trd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TRD_TYPE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.hedg_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_HEDG_NAME_STR);
                    reqCommand.futu_exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_EXCH_GROUP_NO_INT);
                    reqCommand.futu_asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ASSET_ACCO_NO_INT);
                    reqCommand.futu_order_pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_ORDER_PD_NO_INT);
                    reqCommand.secu_exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_EXCH_GROUP_NO_INT);
                    reqCommand.secu_asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_ASSET_ACCO_NO_INT);
                    reqCommand.secu_order_pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SECU_ORDER_PD_NO_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_19_304Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_304Models;
        }
 
        //逻辑_公共_用户客户端_查询期现对冲方案信息
        public static List<FuncpubL_19_404Model> GetFuncpubL_19_404Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_404Models = new List<FuncpubL_19_404Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_404Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.comm_trd_type = packer.GetIntbyName("comm_trd_type", i);
                reqCommand.hedg_plan_name = packer.GetStrbyName("hedg_plan_name", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.contrc_code_no = packer.GetIntbyName("contrc_code_no", i);
                reqCommand.futu_qty = packer.GetDoublebyName("futu_qty", i);
                reqCommand.basket_qty = packer.GetDoublebyName("basket_qty", i);
                reqCommand.basket_id = packer.GetInt64byName("basket_id", i);
                reqCommand.plan_type = packer.GetIntbyName("plan_type", i);
                reqCommand.hedg_no = packer.GetInt64byName("hedg_no", i);
                reqCommand.hedging_pankou = packer.GetDoublebyName("hedging_pankou", i);
                reqCommand.futu_price_offset = packer.GetDoublebyName("futu_price_offset", i);
                reqCommand.price_offset = packer.GetDoublebyName("price_offset", i);
                reqCommand.target_base_diff = packer.GetDoublebyName("target_base_diff", i);
                reqCommand.template_base_diff = packer.GetDoublebyName("template_base_diff", i);
                reqCommand.up_value_ratio = packer.GetDoublebyName("up_value_ratio", i);
                reqCommand.down_value_ratio = packer.GetDoublebyName("down_value_ratio", i);
                reqCommand.stop_value_ratio = packer.GetDoublebyName("stop_value_ratio", i);
                reqCommand.cash_replace_amt = packer.GetDoublebyName("cash_replace_amt", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_19_404Models.Add(reqCommand);
            }
            return FuncpubL_19_404Models;
        }
 
        //逻辑_公共_用户客户端_查询期现对冲方案信息
        public static List<FuncpubL_19_404Model> GetFuncpubL_19_404Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_404Models = new List<FuncpubL_19_404Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_404Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.comm_trd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_TRD_TYPE_INT);
                    reqCommand.hedg_plan_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_HEDG_PLAN_NAME_STR);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.contrc_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONTRC_CODE_NO_INT);
                    reqCommand.futu_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_QTY_FLOAT);
                    reqCommand.basket_qty = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_QTY_FLOAT);
                    reqCommand.basket_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_BASKET_ID_INT64);
                    reqCommand.plan_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PLAN_TYPE_INT);
                    reqCommand.hedg_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_HEDG_NO_INT64);
                    reqCommand.hedging_pankou = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HEDGING_PANKOU_FLOAT);
                    reqCommand.futu_price_offset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FUTU_PRICE_OFFSET_FLOAT);
                    reqCommand.price_offset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRICE_OFFSET_FLOAT);
                    reqCommand.target_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_BASE_DIFF_FLOAT);
                    reqCommand.template_base_diff = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TEMPLATE_BASE_DIFF_FLOAT);
                    reqCommand.up_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_UP_VALUE_RATIO_FLOAT);
                    reqCommand.down_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_DOWN_VALUE_RATIO_FLOAT);
                    reqCommand.stop_value_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOP_VALUE_RATIO_FLOAT);
                    reqCommand.cash_replace_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CASH_REPLACE_AMT_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_19_404Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_404Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员可设置操作员
        public static List<FuncpubL_19_503Model> GetFuncpubL_19_503Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_503Models = new List<FuncpubL_19_503Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_503Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.allow_opor_no = packer.GetIntbyName("allow_opor_no", i);
 
                FuncpubL_19_503Models.Add(reqCommand);
            }
            return FuncpubL_19_503Models;
        }
 
        //逻辑_公共_用户客户端_查询操作员可设置操作员
        public static List<FuncpubL_19_503Model> GetFuncpubL_19_503Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_503Models = new List<FuncpubL_19_503Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_503Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.allow_opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_OPOR_NO_INT);
                    FuncpubL_19_503Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_503Models;
        }
 
        //逻辑_公共_用户客户端_获取注销交易组串
        public static List<FuncpubL_19_504Model> GetFuncpubL_19_504Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_504Models = new List<FuncpubL_19_504Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_504Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.exch_group_no_str = packer.GetStrbyName("exch_group_no_str", i);
 
                FuncpubL_19_504Models.Add(reqCommand);
            }
            return FuncpubL_19_504Models;
        }
 
        //逻辑_公共_用户客户端_获取注销交易组串
        public static List<FuncpubL_19_504Model> GetFuncpubL_19_504Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_504Models = new List<FuncpubL_19_504Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_19_504Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.exch_group_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_STR_STR);
                FuncpubL_19_504Models.Add(reqCommand);
            }
            return FuncpubL_19_504Models;
        }
 
        //逻辑_公共_用户客户端_查询基金产品行情
        public static List<FuncpubL_19_506Model> GetFuncpubL_19_506Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_506Models = new List<FuncpubL_19_506Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_506Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.stock_code = packer.GetStrbyName("stock_code", i);
                reqCommand.stock_code_no = packer.GetIntbyName("stock_code_no", i);
                reqCommand.stock_name = packer.GetStrbyName("stock_name", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.last_price = packer.GetDoublebyName("last_price", i);
 
                FuncpubL_19_506Models.Add(reqCommand);
            }
            return FuncpubL_19_506Models;
        }
 
        //逻辑_公共_用户客户端_查询基金产品行情
        public static List<FuncpubL_19_506Model> GetFuncpubL_19_506Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_506Models = new List<FuncpubL_19_506Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_506Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.stock_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_STR);
                    reqCommand.stock_code_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_CODE_NO_INT);
                    reqCommand.stock_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_NAME_STR);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.last_price = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LAST_PRICE_FLOAT);
                    FuncpubL_19_506Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_506Models;
        }
 
        //逻辑_公共_用户客户端_运维端查询交易组信息
        public static List<FuncpubL_19_96Model> GetFuncpubL_19_96Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_19_96Models = new List<FuncpubL_19_96Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_19_96Model();
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
 
                FuncpubL_19_96Models.Add(reqCommand);
            }
            return FuncpubL_19_96Models;
        }
 
        //逻辑_公共_用户客户端_运维端查询交易组信息
        public static List<FuncpubL_19_96Model> GetFuncpubL_19_96Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_19_96Models = new List<FuncpubL_19_96Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_19_96Model();
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
                    FuncpubL_19_96Models.Add(reqCommand);
                }
            }
            return FuncpubL_19_96Models;
        }
 
    }
}
