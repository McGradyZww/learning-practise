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

    public static class Base
    {
        //逻辑_公共_基础_获取系统信息
        public static List<FuncpubL_3_4Model> GetFuncpubL_3_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_4Models = new List<FuncpubL_3_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.sys_name = packer.GetStrbyName("sys_name", i);
                reqCommand.sys_status = packer.GetStrbyName("sys_status", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.no_exch_date_str = packer.GetStrbyName("no_exch_date_str", i);
                reqCommand.allow_next_init_time = packer.GetIntbyName("allow_next_init_time", i);
                reqCommand.sys_config_str = packer.GetStrbyName("sys_config_str", i);
                reqCommand.client_version = packer.GetStrbyName("client_version", i);
                reqCommand.manage_ver = packer.GetStrbyName("manage_ver", i);
                reqCommand.admin_ver = packer.GetStrbyName("admin_ver", i);
                reqCommand.update_addr = packer.GetStrbyName("update_addr", i);
                reqCommand.dnload_addr = packer.GetStrbyName("dnload_addr", i);
 
                FuncpubL_3_4Models.Add(reqCommand);
            }
            return FuncpubL_3_4Models;
        }
 
        //逻辑_公共_基础_获取系统信息
        public static List<FuncpubL_3_4Model> GetFuncpubL_3_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_4Models = new List<FuncpubL_3_4Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_3_4Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                reqCommand.sys_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SYS_NAME_STR);
                reqCommand.sys_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SYS_STATUS_STR);
                reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                reqCommand.no_exch_date_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NO_EXCH_DATE_STR_STR);
                reqCommand.allow_next_init_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_NEXT_INIT_TIME_INT);
                reqCommand.sys_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SYS_CONFIG_STR_STR);
                reqCommand.client_version = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CLIENT_VERSION_STR);
                reqCommand.manage_ver = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MANAGE_VER_STR);
                reqCommand.admin_ver = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ADMIN_VER_STR);
                reqCommand.update_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_ADDR_STR);
                reqCommand.dnload_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DNLOAD_ADDR_STR);
                FuncpubL_3_4Models.Add(reqCommand);
            }
            return FuncpubL_3_4Models;
        }
 
        //逻辑_公共_基础_查询系统信息流水
        public static List<FuncpubL_3_5Model> GetFuncpubL_3_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_5Models = new List<FuncpubL_3_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_occur_info = packer.GetStrbyName("jour_occur_info", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_3_5Models.Add(reqCommand);
            }
            return FuncpubL_3_5Models;
        }
 
        //逻辑_公共_基础_查询系统信息流水
        public static List<FuncpubL_3_5Model> GetFuncpubL_3_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_5Models = new List<FuncpubL_3_5Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_5Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_INFO_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_3_5Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_5Models;
        }
 
        //逻辑_公共_基础_查询历史系统信息流水
        public static List<FuncpubL_3_6Model> GetFuncpubL_3_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_6Models = new List<FuncpubL_3_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_6Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_occur_info = packer.GetStrbyName("jour_occur_info", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_3_6Models.Add(reqCommand);
            }
            return FuncpubL_3_6Models;
        }
 
        //逻辑_公共_基础_查询历史系统信息流水
        public static List<FuncpubL_3_6Model> GetFuncpubL_3_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_6Models = new List<FuncpubL_3_6Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_6Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_INFO_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_3_6Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_6Models;
        }
 
        //逻辑_公共_基础_获取机器日期时间
        public static List<FuncpubL_3_8Model> GetFuncpubL_3_8Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_8Models = new List<FuncpubL_3_8Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_8Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.mach_date = packer.GetIntbyName("mach_date", i);
                reqCommand.mach_time = packer.GetIntbyName("mach_time", i);
 
                FuncpubL_3_8Models.Add(reqCommand);
            }
            return FuncpubL_3_8Models;
        }
 
        //逻辑_公共_基础_获取机器日期时间
        public static List<FuncpubL_3_8Model> GetFuncpubL_3_8Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_8Models = new List<FuncpubL_3_8Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_3_8Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.mach_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MACH_DATE_INT);
                reqCommand.mach_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MACH_TIME_INT);
                FuncpubL_3_8Models.Add(reqCommand);
            }
            return FuncpubL_3_8Models;
        }
 
        //逻辑_公共_基础_查询机构信息
        public static List<FuncpubL_3_18Model> GetFuncpubL_3_18Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_18Models = new List<FuncpubL_3_18Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_18Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.co_name = packer.GetStrbyName("co_name", i);
                reqCommand.co_flname = packer.GetStrbyName("co_flname", i);
                reqCommand.reg_code = packer.GetStrbyName("reg_code", i);
                reqCommand.reg_addr = packer.GetStrbyName("reg_addr", i);
                reqCommand.found_date = packer.GetIntbyName("found_date", i);
                reqCommand.reg_date = packer.GetIntbyName("reg_date", i);
                reqCommand.conta_addr = packer.GetStrbyName("conta_addr", i);
                reqCommand.conta_name = packer.GetStrbyName("conta_name", i);
                reqCommand.phone_number = packer.GetStrbyName("phone_number", i);
                reqCommand.email = packer.GetStrbyName("email", i);
                reqCommand.pd_qty_max = packer.GetIntbyName("pd_qty_max", i);
                reqCommand.max_acco_count = packer.GetIntbyName("max_acco_count", i);
                reqCommand.opor_qty_max = packer.GetIntbyName("opor_qty_max", i);
                reqCommand.co_status = packer.GetStrbyName("co_status", i);
                reqCommand.allow_exch = packer.GetStrbyName("allow_exch", i);
                reqCommand.allow_stock_type = packer.GetStrbyName("allow_stock_type", i);
                reqCommand.busi_config_str = packer.GetStrbyName("busi_config_str", i);
                reqCommand.comm_appr_oper = packer.GetIntbyName("comm_appr_oper", i);
                reqCommand.market_price_ratio = packer.GetDoublebyName("market_price_ratio", i);
                reqCommand.mul_acco_trd_assign_set = packer.GetStrbyName("mul_acco_trd_assign_set", i);
                reqCommand.mul_acco_trd_choice = packer.GetIntbyName("mul_acco_trd_choice", i);
                reqCommand.mul_acco_trd_qty_set = packer.GetStrbyName("mul_acco_trd_qty_set", i);
                reqCommand.genus_algo_strategy_set = packer.GetStrbyName("genus_algo_strategy_set", i);
                reqCommand.base_crncy_type = packer.GetStrbyName("base_crncy_type", i);
 
                FuncpubL_3_18Models.Add(reqCommand);
            }
            return FuncpubL_3_18Models;
        }
 
        //逻辑_公共_基础_查询机构信息
        public static List<FuncpubL_3_18Model> GetFuncpubL_3_18Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_18Models = new List<FuncpubL_3_18Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_18Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.co_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_NAME_STR);
                    reqCommand.co_flname = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_FLNAME_STR);
                    reqCommand.reg_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REG_CODE_STR);
                    reqCommand.reg_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REG_ADDR_STR);
                    reqCommand.found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT);
                    reqCommand.reg_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_REG_DATE_INT);
                    reqCommand.conta_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_ADDR_STR);
                    reqCommand.conta_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONTA_NAME_STR);
                    reqCommand.phone_number = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PHONE_NUMBER_STR);
                    reqCommand.email = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EMAIL_STR);
                    reqCommand.pd_qty_max = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_QTY_MAX_INT);
                    reqCommand.max_acco_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MAX_ACCO_COUNT_INT);
                    reqCommand.opor_qty_max = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_QTY_MAX_INT);
                    reqCommand.co_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_STATUS_STR);
                    reqCommand.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    reqCommand.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    reqCommand.busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR);
                    reqCommand.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    reqCommand.market_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT);
                    reqCommand.mul_acco_trd_assign_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MUL_ACCO_TRD_ASSIGN_SET_STR);
                    reqCommand.mul_acco_trd_choice = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MUL_ACCO_TRD_CHOICE_INT);
                    reqCommand.mul_acco_trd_qty_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_MUL_ACCO_TRD_QTY_SET_STR);
                    reqCommand.genus_algo_strategy_set = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_GENUS_ALGO_STRATEGY_SET_STR);
                    reqCommand.base_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BASE_CRNCY_TYPE_STR);
                    FuncpubL_3_18Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_18Models;
        }
 
        //逻辑_公共_基础_查询机构信息流水
        public static List<FuncpubL_3_19Model> GetFuncpubL_3_19Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_19Models = new List<FuncpubL_3_19Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_19Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
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
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_3_19Models.Add(reqCommand);
            }
            return FuncpubL_3_19Models;
        }
 
        //逻辑_公共_基础_查询机构信息流水
        public static List<FuncpubL_3_19Model> GetFuncpubL_3_19Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_19Models = new List<FuncpubL_3_19Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_19Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
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
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_3_19Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_19Models;
        }
 
        //逻辑_公共_基础_查询历史机构信息流水
        public static List<FuncpubL_3_20Model> GetFuncpubL_3_20Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_20Models = new List<FuncpubL_3_20Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_20Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
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
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_3_20Models.Add(reqCommand);
            }
            return FuncpubL_3_20Models;
        }
 
        //逻辑_公共_基础_查询历史机构信息流水
        public static List<FuncpubL_3_20Model> GetFuncpubL_3_20Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_20Models = new List<FuncpubL_3_20Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_20Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
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
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_3_20Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_20Models;
        }
 
        //逻辑_公共_基础_检查机构编号存在
        public static List<FuncpubL_3_21Model> GetFuncpubL_3_21Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_21Models = new List<FuncpubL_3_21Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_21Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.record_count = packer.GetIntbyName("record_count", i);
 
                FuncpubL_3_21Models.Add(reqCommand);
            }
            return FuncpubL_3_21Models;
        }
 
        //逻辑_公共_基础_检查机构编号存在
        public static List<FuncpubL_3_21Model> GetFuncpubL_3_21Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_21Models = new List<FuncpubL_3_21Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_3_21Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.record_count = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_RECORD_COUNT_INT);
                FuncpubL_3_21Models.Add(reqCommand);
            }
            return FuncpubL_3_21Models;
        }
 
        //逻辑_公共_基础_获取机构编号
        public static List<FuncpubL_3_22Model> GetFuncpubL_3_22Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_22Models = new List<FuncpubL_3_22Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_22Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
 
                FuncpubL_3_22Models.Add(reqCommand);
            }
            return FuncpubL_3_22Models;
        }
 
        //逻辑_公共_基础_获取机构编号
        public static List<FuncpubL_3_22Model> GetFuncpubL_3_22Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_22Models = new List<FuncpubL_3_22Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_3_22Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                FuncpubL_3_22Models.Add(reqCommand);
            }
            return FuncpubL_3_22Models;
        }
 
        //逻辑_公共_基础_查询机构列表
        public static List<FuncpubL_3_24Model> GetFuncpubL_3_24Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_24Models = new List<FuncpubL_3_24Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_24Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.co_name = packer.GetStrbyName("co_name", i);
                reqCommand.co_type = packer.GetIntbyName("co_type", i);
                reqCommand.co_status = packer.GetStrbyName("co_status", i);
 
                FuncpubL_3_24Models.Add(reqCommand);
            }
            return FuncpubL_3_24Models;
        }
 
        //逻辑_公共_基础_查询机构列表
        public static List<FuncpubL_3_24Model> GetFuncpubL_3_24Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_24Models = new List<FuncpubL_3_24Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_24Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.co_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_NAME_STR);
                    reqCommand.co_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_TYPE_INT);
                    reqCommand.co_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CO_STATUS_STR);
                    FuncpubL_3_24Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_24Models;
        }
 
        //逻辑_公共_基础_查询系统配置
        public static List<FuncpubL_3_32Model> GetFuncpubL_3_32Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_32Models = new List<FuncpubL_3_32Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_32Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.config_no = packer.GetInt64byName("config_no", i);
                reqCommand.config_name = packer.GetStrbyName("config_name", i);
                reqCommand.config_choice_type = packer.GetIntbyName("config_choice_type", i);
                reqCommand.config_value = packer.GetStrbyName("config_value", i);
                reqCommand.dict_field_name = packer.GetStrbyName("dict_field_name", i);
                reqCommand.config_memo = packer.GetStrbyName("config_memo", i);
 
                FuncpubL_3_32Models.Add(reqCommand);
            }
            return FuncpubL_3_32Models;
        }
 
        //逻辑_公共_基础_查询系统配置
        public static List<FuncpubL_3_32Model> GetFuncpubL_3_32Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_32Models = new List<FuncpubL_3_32Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_32Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.config_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64);
                    reqCommand.config_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR);
                    reqCommand.config_choice_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_CHOICE_TYPE_INT);
                    reqCommand.config_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR);
                    reqCommand.dict_field_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_FIELD_NAME_STR);
                    reqCommand.config_memo = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_MEMO_STR);
                    FuncpubL_3_32Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_32Models;
        }
 
        //逻辑_公共_基础_查询系统配置流水
        public static List<FuncpubL_3_33Model> GetFuncpubL_3_33Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_33Models = new List<FuncpubL_3_33Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_33Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
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
                reqCommand.config_no = packer.GetInt64byName("config_no", i);
                reqCommand.config_name = packer.GetStrbyName("config_name", i);
                reqCommand.config_choice_type = packer.GetIntbyName("config_choice_type", i);
                reqCommand.config_value = packer.GetStrbyName("config_value", i);
                reqCommand.dict_field_name = packer.GetStrbyName("dict_field_name", i);
                reqCommand.config_memo = packer.GetStrbyName("config_memo", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_3_33Models.Add(reqCommand);
            }
            return FuncpubL_3_33Models;
        }
 
        //逻辑_公共_基础_查询系统配置流水
        public static List<FuncpubL_3_33Model> GetFuncpubL_3_33Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_33Models = new List<FuncpubL_3_33Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_33Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
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
                    reqCommand.config_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64);
                    reqCommand.config_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR);
                    reqCommand.config_choice_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_CHOICE_TYPE_INT);
                    reqCommand.config_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR);
                    reqCommand.dict_field_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_FIELD_NAME_STR);
                    reqCommand.config_memo = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_MEMO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_3_33Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_33Models;
        }
 
        //逻辑_公共_基础_查询历史系统配置流水
        public static List<FuncpubL_3_34Model> GetFuncpubL_3_34Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_34Models = new List<FuncpubL_3_34Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_34Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
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
                reqCommand.config_no = packer.GetInt64byName("config_no", i);
                reqCommand.config_name = packer.GetStrbyName("config_name", i);
                reqCommand.config_choice_type = packer.GetIntbyName("config_choice_type", i);
                reqCommand.config_value = packer.GetStrbyName("config_value", i);
                reqCommand.dict_field_name = packer.GetStrbyName("dict_field_name", i);
                reqCommand.config_memo = packer.GetStrbyName("config_memo", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_3_34Models.Add(reqCommand);
            }
            return FuncpubL_3_34Models;
        }
 
        //逻辑_公共_基础_查询历史系统配置流水
        public static List<FuncpubL_3_34Model> GetFuncpubL_3_34Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_34Models = new List<FuncpubL_3_34Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_34Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
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
                    reqCommand.config_no = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NO_INT64);
                    reqCommand.config_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_NAME_STR);
                    reqCommand.config_choice_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_CHOICE_TYPE_INT);
                    reqCommand.config_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_VALUE_STR);
                    reqCommand.dict_field_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_FIELD_NAME_STR);
                    reqCommand.config_memo = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_MEMO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_3_34Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_34Models;
        }
 
        //逻辑_公共_基础_查询机构汇率
        public static List<FuncpubL_3_38Model> GetFuncpubL_3_38Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_38Models = new List<FuncpubL_3_38Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_38Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.for_crncy_type = packer.GetStrbyName("for_crncy_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.buy_exch_rate = packer.GetDoublebyName("buy_exch_rate", i);
                reqCommand.sale_exch_rate = packer.GetDoublebyName("sale_exch_rate", i);
 
                FuncpubL_3_38Models.Add(reqCommand);
            }
            return FuncpubL_3_38Models;
        }
 
        //逻辑_公共_基础_查询机构汇率
        public static List<FuncpubL_3_38Model> GetFuncpubL_3_38Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_38Models = new List<FuncpubL_3_38Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_38Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.for_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOR_CRNCY_TYPE_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.buy_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_EXCH_RATE_FLOAT);
                    reqCommand.sale_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SALE_EXCH_RATE_FLOAT);
                    FuncpubL_3_38Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_38Models;
        }
 
        //逻辑_公共_基础_查询机构汇率流水
        public static List<FuncpubL_3_39Model> GetFuncpubL_3_39Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_39Models = new List<FuncpubL_3_39Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_39Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
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
                reqCommand.for_crncy_type = packer.GetStrbyName("for_crncy_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.buy_exch_rate = packer.GetDoublebyName("buy_exch_rate", i);
                reqCommand.sale_exch_rate = packer.GetDoublebyName("sale_exch_rate", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_3_39Models.Add(reqCommand);
            }
            return FuncpubL_3_39Models;
        }
 
        //逻辑_公共_基础_查询机构汇率流水
        public static List<FuncpubL_3_39Model> GetFuncpubL_3_39Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_39Models = new List<FuncpubL_3_39Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_39Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
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
                    reqCommand.for_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOR_CRNCY_TYPE_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.buy_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_EXCH_RATE_FLOAT);
                    reqCommand.sale_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SALE_EXCH_RATE_FLOAT);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_3_39Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_39Models;
        }
 
        //逻辑_公共_基础_查询历史机构汇率流水
        public static List<FuncpubL_3_40Model> GetFuncpubL_3_40Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_40Models = new List<FuncpubL_3_40Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_40Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.for_crncy_type = packer.GetStrbyName("for_crncy_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.buy_exch_rate = packer.GetDoublebyName("buy_exch_rate", i);
                reqCommand.sale_exch_rate = packer.GetDoublebyName("sale_exch_rate", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_3_40Models.Add(reqCommand);
            }
            return FuncpubL_3_40Models;
        }
 
        //逻辑_公共_基础_查询历史机构汇率流水
        public static List<FuncpubL_3_40Model> GetFuncpubL_3_40Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_40Models = new List<FuncpubL_3_40Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_40Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.for_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOR_CRNCY_TYPE_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.buy_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_EXCH_RATE_FLOAT);
                    reqCommand.sale_exch_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SALE_EXCH_RATE_FLOAT);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_3_40Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_40Models;
        }
 
        //逻辑_公共_基础_查询港股通汇率信息
        public static List<FuncpubL_3_41Model> GetFuncpubL_3_41Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_41Models = new List<FuncpubL_3_41Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_41Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.for_crncy_type = packer.GetStrbyName("for_crncy_type", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.buy_ref_rate = packer.GetDoublebyName("buy_ref_rate", i);
                reqCommand.sell_ref_rate = packer.GetDoublebyName("sell_ref_rate", i);
                reqCommand.settle_buy_rate = packer.GetDoublebyName("settle_buy_rate", i);
                reqCommand.settle_sell_rate = packer.GetDoublebyName("settle_sell_rate", i);
                reqCommand.pboc_rate = packer.GetDoublebyName("pboc_rate", i);
 
                FuncpubL_3_41Models.Add(reqCommand);
            }
            return FuncpubL_3_41Models;
        }
 
        //逻辑_公共_基础_查询港股通汇率信息
        public static List<FuncpubL_3_41Model> GetFuncpubL_3_41Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_41Models = new List<FuncpubL_3_41Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_41Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.for_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FOR_CRNCY_TYPE_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BUY_REF_RATE_FLOAT);
                    reqCommand.sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SELL_REF_RATE_FLOAT);
                    reqCommand.settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETTLE_BUY_RATE_FLOAT);
                    reqCommand.settle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SETTLE_SELL_RATE_FLOAT);
                    reqCommand.pboc_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PBOC_RATE_FLOAT);
                    FuncpubL_3_41Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_41Models;
        }
 
        //逻辑_公共_基础_查询市场信息
        public static List<FuncpubL_3_104Model> GetFuncpubL_3_104Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_104Models = new List<FuncpubL_3_104Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_104Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.exch_name = packer.GetStrbyName("exch_name", i);
                reqCommand.exch_code = packer.GetStrbyName("exch_code", i);
                reqCommand.exch_type = packer.GetIntbyName("exch_type", i);
                reqCommand.distric = packer.GetStrbyName("distric", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.exch_crncy_type = packer.GetStrbyName("exch_crncy_type", i);
                reqCommand.exch_status = packer.GetIntbyName("exch_status", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.time_lag = packer.GetIntbyName("time_lag", i);
                reqCommand.no_exch_date_str = packer.GetStrbyName("no_exch_date_str", i);
                reqCommand.allow_next_init_time = packer.GetIntbyName("allow_next_init_time", i);
                reqCommand.no_settle_date_str = packer.GetStrbyName("no_settle_date_str", i);
 
                FuncpubL_3_104Models.Add(reqCommand);
            }
            return FuncpubL_3_104Models;
        }
 
        //逻辑_公共_基础_查询市场信息
        public static List<FuncpubL_3_104Model> GetFuncpubL_3_104Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_104Models = new List<FuncpubL_3_104Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_104Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.exch_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NAME_STR);
                    reqCommand.exch_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CODE_STR);
                    reqCommand.exch_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_TYPE_INT);
                    reqCommand.distric = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DISTRIC_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.exch_crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_CRNCY_TYPE_STR);
                    reqCommand.exch_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_STATUS_INT);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.time_lag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_LAG_INT);
                    reqCommand.no_exch_date_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NO_EXCH_DATE_STR_STR);
                    reqCommand.allow_next_init_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_NEXT_INIT_TIME_INT);
                    reqCommand.no_settle_date_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_NO_SETTLE_DATE_STR_STR);
                    FuncpubL_3_104Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_104Models;
        }
 
        //逻辑_公共_基础_查询市场信息流水
        public static List<FuncpubL_3_105Model> GetFuncpubL_3_105Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_105Models = new List<FuncpubL_3_105Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_105Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_occur_info = packer.GetStrbyName("jour_occur_info", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_3_105Models.Add(reqCommand);
            }
            return FuncpubL_3_105Models;
        }
 
        //逻辑_公共_基础_查询市场信息流水
        public static List<FuncpubL_3_105Model> GetFuncpubL_3_105Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_105Models = new List<FuncpubL_3_105Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_105Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_INFO_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_3_105Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_105Models;
        }
 
        //逻辑_公共_基础_查询历史市场信息流水
        public static List<FuncpubL_3_106Model> GetFuncpubL_3_106Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_106Models = new List<FuncpubL_3_106Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_106Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_occur_info = packer.GetStrbyName("jour_occur_info", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_3_106Models.Add(reqCommand);
            }
            return FuncpubL_3_106Models;
        }
 
        //逻辑_公共_基础_查询历史市场信息流水
        public static List<FuncpubL_3_106Model> GetFuncpubL_3_106Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_106Models = new List<FuncpubL_3_106Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_106Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_INFO_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_3_106Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_106Models;
        }
 
        //逻辑_公共_基础_查询交易时间
        public static List<FuncpubL_3_114Model> GetFuncpubL_3_114Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_114Models = new List<FuncpubL_3_114Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_114Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.begin_time = packer.GetIntbyName("begin_time", i);
                reqCommand.end_time = packer.GetIntbyName("end_time", i);
                reqCommand.allow_wtdraw_flag = packer.GetIntbyName("allow_wtdraw_flag", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_3_114Models.Add(reqCommand);
            }
            return FuncpubL_3_114Models;
        }
 
        //逻辑_公共_基础_查询交易时间
        public static List<FuncpubL_3_114Model> GetFuncpubL_3_114Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_114Models = new List<FuncpubL_3_114Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_114Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    reqCommand.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    reqCommand.allow_wtdraw_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_WTDRAW_FLAG_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_3_114Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_114Models;
        }
 
        //逻辑_公共_基础_查询交易时间流水
        public static List<FuncpubL_3_115Model> GetFuncpubL_3_115Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_115Models = new List<FuncpubL_3_115Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_115Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.begin_time = packer.GetIntbyName("begin_time", i);
                reqCommand.end_time = packer.GetIntbyName("end_time", i);
                reqCommand.allow_wtdraw_flag = packer.GetIntbyName("allow_wtdraw_flag", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_3_115Models.Add(reqCommand);
            }
            return FuncpubL_3_115Models;
        }
 
        //逻辑_公共_基础_查询交易时间流水
        public static List<FuncpubL_3_115Model> GetFuncpubL_3_115Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_115Models = new List<FuncpubL_3_115Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_115Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    reqCommand.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    reqCommand.allow_wtdraw_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_WTDRAW_FLAG_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_3_115Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_115Models;
        }
 
        //逻辑_公共_基础_查询历史交易时间流水
        public static List<FuncpubL_3_116Model> GetFuncpubL_3_116Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_116Models = new List<FuncpubL_3_116Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_116Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.opor_co_no = packer.GetIntbyName("opor_co_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.oper_mac = packer.GetStrbyName("oper_mac", i);
                reqCommand.oper_ip_addr = packer.GetStrbyName("oper_ip_addr", i);
                reqCommand.oper_info = packer.GetStrbyName("oper_info", i);
                reqCommand.oper_way = packer.GetStrbyName("oper_way", i);
                reqCommand.oper_menu_no = packer.GetIntbyName("oper_menu_no", i);
                reqCommand.oper_func_code = packer.GetStrbyName("oper_func_code", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.exch_no = packer.GetIntbyName("exch_no", i);
                reqCommand.begin_time = packer.GetIntbyName("begin_time", i);
                reqCommand.end_time = packer.GetIntbyName("end_time", i);
                reqCommand.allow_wtdraw_flag = packer.GetIntbyName("allow_wtdraw_flag", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncpubL_3_116Models.Add(reqCommand);
            }
            return FuncpubL_3_116Models;
        }
 
        //逻辑_公共_基础_查询历史交易时间流水
        public static List<FuncpubL_3_116Model> GetFuncpubL_3_116Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_116Models = new List<FuncpubL_3_116Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_116Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.opor_co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_CO_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.oper_mac = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MAC_STR);
                    reqCommand.oper_ip_addr = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_IP_ADDR_STR);
                    reqCommand.oper_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_INFO_STR);
                    reqCommand.oper_way = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_WAY_STR);
                    reqCommand.oper_menu_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPER_MENU_NO_INT);
                    reqCommand.oper_func_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_FUNC_CODE_STR);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.exch_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_NO_INT);
                    reqCommand.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    reqCommand.end_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_END_TIME_INT);
                    reqCommand.allow_wtdraw_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_WTDRAW_FLAG_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncpubL_3_116Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_116Models;
        }
 
        //逻辑_公共_基础_获取港股通汇率信息
        public static List<FuncpubL_3_117Model> GetFuncpubL_3_117Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_117Models = new List<FuncpubL_3_117Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_117Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.sh_hk_buy_ref_rate = packer.GetDoublebyName("sh_hk_buy_ref_rate", i);
                reqCommand.sh_hk_sell_ref_rate = packer.GetDoublebyName("sh_hk_sell_ref_rate", i);
                reqCommand.sh_hk_settle_buy_rate = packer.GetDoublebyName("sh_hk_settle_buy_rate", i);
                reqCommand.sh_hk_settle_sell_rate = packer.GetDoublebyName("sh_hk_settle_sell_rate", i);
                reqCommand.sz_hk_buy_ref_rate = packer.GetDoublebyName("sz_hk_buy_ref_rate", i);
                reqCommand.sz_hk_sell_ref_rate = packer.GetDoublebyName("sz_hk_sell_ref_rate", i);
                reqCommand.sz_hk_settle_buy_rate = packer.GetDoublebyName("sz_hk_settle_buy_rate", i);
                reqCommand.sz_hksettle_sell_rate = packer.GetDoublebyName("sz_hksettle_sell_rate", i);
 
                FuncpubL_3_117Models.Add(reqCommand);
            }
            return FuncpubL_3_117Models;
        }
 
        //逻辑_公共_基础_获取港股通汇率信息
        public static List<FuncpubL_3_117Model> GetFuncpubL_3_117Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_117Models = new List<FuncpubL_3_117Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_3_117Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.sh_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_BUY_REF_RATE_FLOAT);
                reqCommand.sh_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SELL_REF_RATE_FLOAT);
                reqCommand.sh_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_BUY_RATE_FLOAT);
                reqCommand.sh_hk_settle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_SELL_RATE_FLOAT);
                reqCommand.sz_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_BUY_REF_RATE_FLOAT);
                reqCommand.sz_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SELL_REF_RATE_FLOAT);
                reqCommand.sz_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SETTLE_BUY_RATE_FLOAT);
                reqCommand.sz_hksettle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HKSETTLE_SELL_RATE_FLOAT);
                FuncpubL_3_117Models.Add(reqCommand);
            }
            return FuncpubL_3_117Models;
        }
 
        //逻辑_公共_基础_获取所需港股通汇率信息
        public static List<FuncpubL_3_118Model> GetFuncpubL_3_118Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_118Models = new List<FuncpubL_3_118Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_118Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.sh_hk_buy_ref_rate = packer.GetDoublebyName("sh_hk_buy_ref_rate", i);
                reqCommand.sh_hk_sell_ref_rate = packer.GetDoublebyName("sh_hk_sell_ref_rate", i);
                reqCommand.sh_hk_settle_buy_rate = packer.GetDoublebyName("sh_hk_settle_buy_rate", i);
                reqCommand.sh_hk_settle_sell_rate = packer.GetDoublebyName("sh_hk_settle_sell_rate", i);
                reqCommand.sz_hk_buy_ref_rate = packer.GetDoublebyName("sz_hk_buy_ref_rate", i);
                reqCommand.sz_hk_sell_ref_rate = packer.GetDoublebyName("sz_hk_sell_ref_rate", i);
                reqCommand.sz_hk_settle_buy_rate = packer.GetDoublebyName("sz_hk_settle_buy_rate", i);
                reqCommand.sz_hksettle_sell_rate = packer.GetDoublebyName("sz_hksettle_sell_rate", i);
                reqCommand.busin_date = packer.GetIntbyName("busin_date", i);
 
                FuncpubL_3_118Models.Add(reqCommand);
            }
            return FuncpubL_3_118Models;
        }
 
        //逻辑_公共_基础_获取所需港股通汇率信息
        public static List<FuncpubL_3_118Model> GetFuncpubL_3_118Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_118Models = new List<FuncpubL_3_118Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_3_118Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.sh_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_BUY_REF_RATE_FLOAT);
                reqCommand.sh_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SELL_REF_RATE_FLOAT);
                reqCommand.sh_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_BUY_RATE_FLOAT);
                reqCommand.sh_hk_settle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SH_HK_SETTLE_SELL_RATE_FLOAT);
                reqCommand.sz_hk_buy_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_BUY_REF_RATE_FLOAT);
                reqCommand.sz_hk_sell_ref_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SELL_REF_RATE_FLOAT);
                reqCommand.sz_hk_settle_buy_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HK_SETTLE_BUY_RATE_FLOAT);
                reqCommand.sz_hksettle_sell_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SZ_HKSETTLE_SELL_RATE_FLOAT);
                reqCommand.busin_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSIN_DATE_INT);
                FuncpubL_3_118Models.Add(reqCommand);
            }
            return FuncpubL_3_118Models;
        }
 
        //逻辑_公共_基础_查询通道信息
        public static List<FuncpubL_3_153Model> GetFuncpubL_3_153Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_153Models = new List<FuncpubL_3_153Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_153Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.pass_name = packer.GetStrbyName("pass_name", i);
                reqCommand.config_file = packer.GetStrbyName("config_file", i);
                reqCommand.pass_status = packer.GetStrbyName("pass_status", i);
                reqCommand.pass_type = packer.GetIntbyName("pass_type", i);
                reqCommand.bond_qty_unit_set = packer.GetIntbyName("bond_qty_unit_set", i);
                reqCommand.hk_cash_avail_date_type = packer.GetIntbyName("hk_cash_avail_date_type", i);
                reqCommand.online_status = packer.GetIntbyName("online_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_3_153Models.Add(reqCommand);
            }
            return FuncpubL_3_153Models;
        }
 
        //逻辑_公共_基础_查询通道信息
        public static List<FuncpubL_3_153Model> GetFuncpubL_3_153Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_153Models = new List<FuncpubL_3_153Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_153Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.pass_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NAME_STR);
                    reqCommand.config_file = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_FILE_STR);
                    reqCommand.pass_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PASS_STATUS_STR);
                    reqCommand.pass_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_TYPE_INT);
                    reqCommand.bond_qty_unit_set = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BOND_QTY_UNIT_SET_INT);
                    reqCommand.hk_cash_avail_date_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_HK_CASH_AVAIL_DATE_TYPE_INT);
                    reqCommand.online_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_3_153Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_153Models;
        }
 
        //逻辑_公共_基础_查询数据字典
        public static List<FuncpubL_3_180Model> GetFuncpubL_3_180Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_180Models = new List<FuncpubL_3_180Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_180Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.dict_no = packer.GetIntbyName("dict_no", i);
                reqCommand.dict_name = packer.GetStrbyName("dict_name", i);
                reqCommand.dict_field_name = packer.GetStrbyName("dict_field_name", i);
                reqCommand.dict_item_name = packer.GetStrbyName("dict_item_name", i);
                reqCommand.dict_item_value = packer.GetStrbyName("dict_item_value", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_3_180Models.Add(reqCommand);
            }
            return FuncpubL_3_180Models;
        }
 
        //逻辑_公共_基础_查询数据字典
        public static List<FuncpubL_3_180Model> GetFuncpubL_3_180Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_180Models = new List<FuncpubL_3_180Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_180Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.dict_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_DICT_NO_INT);
                    reqCommand.dict_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_NAME_STR);
                    reqCommand.dict_field_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_FIELD_NAME_STR);
                    reqCommand.dict_item_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_ITEM_NAME_STR);
                    reqCommand.dict_item_value = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_DICT_ITEM_VALUE_STR);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_3_180Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_180Models;
        }
 
        //逻辑_公共_基础_查询业务标志
        public static List<FuncpubL_3_181Model> GetFuncpubL_3_181Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_181Models = new List<FuncpubL_3_181Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_181Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.busi_type = packer.GetIntbyName("busi_type", i);
                reqCommand.busi_sub_type = packer.GetIntbyName("busi_sub_type", i);
                reqCommand.busi_flag = packer.GetIntbyName("busi_flag", i);
                reqCommand.busi_name = packer.GetStrbyName("busi_name", i);
                reqCommand.time_stamp = packer.GetIntbyName("time_stamp", i);
 
                FuncpubL_3_181Models.Add(reqCommand);
            }
            return FuncpubL_3_181Models;
        }
 
        //逻辑_公共_基础_查询业务标志
        public static List<FuncpubL_3_181Model> GetFuncpubL_3_181Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_181Models = new List<FuncpubL_3_181Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_181Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.busi_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_TYPE_INT);
                    reqCommand.busi_sub_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_SUB_TYPE_INT);
                    reqCommand.busi_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_FLAG_INT);
                    reqCommand.busi_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_NAME_STR);
                    reqCommand.time_stamp = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TIME_STAMP_INT);
                    FuncpubL_3_181Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_181Models;
        }
 
        //逻辑_公共_基础_公共数据归档
        public static List<FuncpubL_3_201Model> GetFuncpubL_3_201Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_201Models = new List<FuncpubL_3_201Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_201Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.task_strike_status = packer.GetStrbyName("task_strike_status", i);
 
                FuncpubL_3_201Models.Add(reqCommand);
            }
            return FuncpubL_3_201Models;
        }
 
        //逻辑_公共_基础_公共数据归档
        public static List<FuncpubL_3_201Model> GetFuncpubL_3_201Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_201Models = new List<FuncpubL_3_201Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncpubL_3_201Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.task_strike_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TASK_STRIKE_STATUS_STR);
                FuncpubL_3_201Models.Add(reqCommand);
            }
            return FuncpubL_3_201Models;
        }
 
        //逻辑_公共_基础_查询通道报盘信息
        public static List<FuncpubL_3_204Model> GetFuncpubL_3_204Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncpubL_3_204Models = new List<FuncpubL_3_204Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncpubL_3_204Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.pass_name = packer.GetStrbyName("pass_name", i);
                reqCommand.pass_type = packer.GetIntbyName("pass_type", i);
                reqCommand.pass_status = packer.GetStrbyName("pass_status", i);
                reqCommand.trans_name = packer.GetStrbyName("trans_name", i);
                reqCommand.trans_node_name = packer.GetStrbyName("trans_node_name", i);
                reqCommand.trans_create_date = packer.GetIntbyName("trans_create_date", i);
                reqCommand.trans_server_name = packer.GetStrbyName("trans_server_name", i);
                reqCommand.trans_server_ip = packer.GetStrbyName("trans_server_ip", i);
                reqCommand.trans_server_port = packer.GetIntbyName("trans_server_port", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncpubL_3_204Models.Add(reqCommand);
            }
            return FuncpubL_3_204Models;
        }
 
        //逻辑_公共_基础_查询通道报盘信息
        public static List<FuncpubL_3_204Model> GetFuncpubL_3_204Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncpubL_3_204Models = new List<FuncpubL_3_204Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncpubL_3_204Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.pass_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NAME_STR);
                    reqCommand.pass_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_TYPE_INT);
                    reqCommand.pass_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PASS_STATUS_STR);
                    reqCommand.trans_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_NAME_STR);
                    reqCommand.trans_node_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_NODE_NAME_STR);
                    reqCommand.trans_create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_CREATE_DATE_INT);
                    reqCommand.trans_server_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_SERVER_NAME_STR);
                    reqCommand.trans_server_ip = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_SERVER_IP_STR);
                    reqCommand.trans_server_port = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_SERVER_PORT_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncpubL_3_204Models.Add(reqCommand);
                }
            }
            return FuncpubL_3_204Models;
        }
 
    }
}
