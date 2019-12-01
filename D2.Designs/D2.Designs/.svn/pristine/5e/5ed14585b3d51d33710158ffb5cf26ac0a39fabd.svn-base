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

    public static class ProductAcco
    {
        //逻辑_产品_账户_新增产品信息
        public static List<FuncprodL_1_1Model> GetFuncprodL_1_1Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_1Models = new List<FuncprodL_1_1Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_1Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
 
                FuncprodL_1_1Models.Add(reqCommand);
            }
            return FuncprodL_1_1Models;
        }
 
        //逻辑_产品_账户_新增产品信息
        public static List<FuncprodL_1_1Model> GetFuncprodL_1_1Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_1Models = new List<FuncprodL_1_1Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_1_1Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                FuncprodL_1_1Models.Add(reqCommand);
            }
            return FuncprodL_1_1Models;
        }
 
        //逻辑_产品_账户_查询产品信息
        public static List<FuncprodL_1_4Model> GetFuncprodL_1_4Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_4Models = new List<FuncprodL_1_4Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_4Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_flname = packer.GetStrbyName("pd_flname", i);
                reqCommand.fund_reg_code = packer.GetStrbyName("fund_reg_code", i);
                reqCommand.pd_manager = packer.GetStrbyName("pd_manager", i);
                reqCommand.found_date = packer.GetIntbyName("found_date", i);
                reqCommand.pd_type = packer.GetIntbyName("pd_type", i);
                reqCommand.apply_currency = packer.GetStrbyName("apply_currency", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.first_asset = packer.GetDoublebyName("first_asset", i);
                reqCommand.first_amt = packer.GetDoublebyName("first_amt", i);
                reqCommand.pd_all_share = packer.GetDoublebyName("pd_all_share", i);
                reqCommand.curr_share = packer.GetDoublebyName("curr_share", i);
                reqCommand.pre_share = packer.GetDoublebyName("pre_share", i);
                reqCommand.his_max_per_nav = packer.GetDoublebyName("his_max_per_nav", i);
                reqCommand.pre_nav = packer.GetDoublebyName("pre_nav", i);
                reqCommand.coust_full_name = packer.GetStrbyName("coust_full_name", i);
                reqCommand.coust_acco = packer.GetStrbyName("coust_acco", i);
                reqCommand.coust_acco_name = packer.GetStrbyName("coust_acco_name", i);
                reqCommand.warn_posi_value = packer.GetDoublebyName("warn_posi_value", i);
                reqCommand.close_posi_value = packer.GetDoublebyName("close_posi_value", i);
                reqCommand.target_posi_ratio = packer.GetDoublebyName("target_posi_ratio", i);
                reqCommand.beta_coeffi = packer.GetDoublebyName("beta_coeffi", i);
                reqCommand.custom_pd_class = packer.GetStrbyName("custom_pd_class", i);
                reqCommand.pd_status = packer.GetStrbyName("pd_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.index_value = packer.GetIntbyName("index_value", i);
 
                FuncprodL_1_4Models.Add(reqCommand);
            }
            return FuncprodL_1_4Models;
        }
 
        //逻辑_产品_账户_查询产品信息
        public static List<FuncprodL_1_4Model> GetFuncprodL_1_4Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_4Models = new List<FuncprodL_1_4Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_4Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_flname = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FLNAME_STR);
                    reqCommand.fund_reg_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_REG_CODE_STR);
                    reqCommand.pd_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR);
                    reqCommand.found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT);
                    reqCommand.pd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT);
                    reqCommand.apply_currency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CURRENCY_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.first_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT);
                    reqCommand.first_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT);
                    reqCommand.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    reqCommand.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    reqCommand.pre_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT);
                    reqCommand.his_max_per_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HIS_MAX_PER_NAV_FLOAT);
                    reqCommand.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    reqCommand.coust_full_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_FULL_NAME_STR);
                    reqCommand.coust_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_STR);
                    reqCommand.coust_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_NAME_STR);
                    reqCommand.warn_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT);
                    reqCommand.close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.target_posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_POSI_RATIO_FLOAT);
                    reqCommand.beta_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BETA_COEFFI_FLOAT);
                    reqCommand.custom_pd_class = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CUSTOM_PD_CLASS_STR);
                    reqCommand.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.index_value = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_VALUE_INT);
                    FuncprodL_1_4Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_4Models;
        }
 
        //逻辑_产品_账户_查询历史产品信息
        public static List<FuncprodL_1_5Model> GetFuncprodL_1_5Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_5Models = new List<FuncprodL_1_5Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_5Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_flname = packer.GetStrbyName("pd_flname", i);
                reqCommand.fund_reg_code = packer.GetStrbyName("fund_reg_code", i);
                reqCommand.pd_manager = packer.GetStrbyName("pd_manager", i);
                reqCommand.found_date = packer.GetIntbyName("found_date", i);
                reqCommand.pd_type = packer.GetIntbyName("pd_type", i);
                reqCommand.apply_currency = packer.GetStrbyName("apply_currency", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
                reqCommand.first_asset = packer.GetDoublebyName("first_asset", i);
                reqCommand.first_amt = packer.GetDoublebyName("first_amt", i);
                reqCommand.pd_all_share = packer.GetDoublebyName("pd_all_share", i);
                reqCommand.curr_share = packer.GetDoublebyName("curr_share", i);
                reqCommand.pre_share = packer.GetDoublebyName("pre_share", i);
                reqCommand.his_max_per_nav = packer.GetDoublebyName("his_max_per_nav", i);
                reqCommand.pre_nav = packer.GetDoublebyName("pre_nav", i);
                reqCommand.coust_full_name = packer.GetStrbyName("coust_full_name", i);
                reqCommand.coust_acco = packer.GetStrbyName("coust_acco", i);
                reqCommand.coust_acco_name = packer.GetStrbyName("coust_acco_name", i);
                reqCommand.warn_posi_value = packer.GetDoublebyName("warn_posi_value", i);
                reqCommand.close_posi_value = packer.GetDoublebyName("close_posi_value", i);
                reqCommand.target_posi_ratio = packer.GetDoublebyName("target_posi_ratio", i);
                reqCommand.beta_coeffi = packer.GetDoublebyName("beta_coeffi", i);
                reqCommand.custom_pd_class = packer.GetStrbyName("custom_pd_class", i);
                reqCommand.pd_status = packer.GetStrbyName("pd_status", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.index_value = packer.GetIntbyName("index_value", i);
 
                FuncprodL_1_5Models.Add(reqCommand);
            }
            return FuncprodL_1_5Models;
        }
 
        //逻辑_产品_账户_查询历史产品信息
        public static List<FuncprodL_1_5Model> GetFuncprodL_1_5Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_5Models = new List<FuncprodL_1_5Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_5Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_flname = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_FLNAME_STR);
                    reqCommand.fund_reg_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FUND_REG_CODE_STR);
                    reqCommand.pd_manager = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_MANAGER_STR);
                    reqCommand.found_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FOUND_DATE_INT);
                    reqCommand.pd_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_TYPE_INT);
                    reqCommand.apply_currency = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_APPLY_CURRENCY_STR);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    reqCommand.first_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_ASSET_FLOAT);
                    reqCommand.first_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FIRST_AMT_FLOAT);
                    reqCommand.pd_all_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_ALL_SHARE_FLOAT);
                    reqCommand.curr_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CURR_SHARE_FLOAT);
                    reqCommand.pre_share = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_SHARE_FLOAT);
                    reqCommand.his_max_per_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HIS_MAX_PER_NAV_FLOAT);
                    reqCommand.pre_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PRE_NAV_FLOAT);
                    reqCommand.coust_full_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_FULL_NAME_STR);
                    reqCommand.coust_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_STR);
                    reqCommand.coust_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_COUST_ACCO_NAME_STR);
                    reqCommand.warn_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_WARN_POSI_VALUE_FLOAT);
                    reqCommand.close_posi_value = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_VALUE_FLOAT);
                    reqCommand.target_posi_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TARGET_POSI_RATIO_FLOAT);
                    reqCommand.beta_coeffi = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BETA_COEFFI_FLOAT);
                    reqCommand.custom_pd_class = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CUSTOM_PD_CLASS_STR);
                    reqCommand.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.index_value = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INDEX_VALUE_INT);
                    FuncprodL_1_5Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_5Models;
        }
 
        //逻辑_产品_账户_查询产品信息流水
        public static List<FuncprodL_1_6Model> GetFuncprodL_1_6Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_6Models = new List<FuncprodL_1_6Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_6Model();
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
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncprodL_1_6Models.Add(reqCommand);
            }
            return FuncprodL_1_6Models;
        }
 
        //逻辑_产品_账户_查询产品信息流水
        public static List<FuncprodL_1_6Model> GetFuncprodL_1_6Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_6Models = new List<FuncprodL_1_6Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_6Model();
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
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncprodL_1_6Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_6Models;
        }
 
        //逻辑_产品_账户_查询历史产品信息流水
        public static List<FuncprodL_1_7Model> GetFuncprodL_1_7Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_7Models = new List<FuncprodL_1_7Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_7Model();
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
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncprodL_1_7Models.Add(reqCommand);
            }
            return FuncprodL_1_7Models;
        }
 
        //逻辑_产品_账户_查询历史产品信息流水
        public static List<FuncprodL_1_7Model> GetFuncprodL_1_7Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_7Models = new List<FuncprodL_1_7Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_7Model();
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
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncprodL_1_7Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_7Models;
        }
 
        //逻辑_产品_账户_查询全部产品列表
        public static List<FuncprodL_1_12Model> GetFuncprodL_1_12Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_12Models = new List<FuncprodL_1_12Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_12Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_status = packer.GetStrbyName("pd_status", i);
 
                FuncprodL_1_12Models.Add(reqCommand);
            }
            return FuncprodL_1_12Models;
        }
 
        //逻辑_产品_账户_查询全部产品列表
        public static List<FuncprodL_1_12Model> GetFuncprodL_1_12Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_12Models = new List<FuncprodL_1_12Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_12Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    FuncprodL_1_12Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_12Models;
        }
 
        //逻辑_产品_账户_查询可见产品列表
        public static List<FuncprodL_1_13Model> GetFuncprodL_1_13Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_13Models = new List<FuncprodL_1_13Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_13Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.pd_status = packer.GetStrbyName("pd_status", i);
                reqCommand.pd_busi_config_str = packer.GetStrbyName("pd_busi_config_str", i);
                reqCommand.comm_no_limit_price_ratio = packer.GetDoublebyName("comm_no_limit_price_ratio", i);
 
                FuncprodL_1_13Models.Add(reqCommand);
            }
            return FuncprodL_1_13Models;
        }
 
        //逻辑_产品_账户_查询可见产品列表
        public static List<FuncprodL_1_13Model> GetFuncprodL_1_13Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_13Models = new List<FuncprodL_1_13Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_13Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    reqCommand.pd_busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_BUSI_CONFIG_STR_STR);
                    reqCommand.comm_no_limit_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_NO_LIMIT_PRICE_RATIO_FLOAT);
                    FuncprodL_1_13Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_13Models;
        }
 
        //逻辑_产品_账户_查询产品历史最高单位净值
        public static List<FuncprodL_1_17Model> GetFuncprodL_1_17Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_17Models = new List<FuncprodL_1_17Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_17Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.pd_name = packer.GetStrbyName("pd_name", i);
                reqCommand.his_max_per_nav = packer.GetDoublebyName("his_max_per_nav", i);
                reqCommand.crncy_type = packer.GetStrbyName("crncy_type", i);
 
                FuncprodL_1_17Models.Add(reqCommand);
            }
            return FuncprodL_1_17Models;
        }
 
        //逻辑_产品_账户_查询产品历史最高单位净值
        public static List<FuncprodL_1_17Model> GetFuncprodL_1_17Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_17Models = new List<FuncprodL_1_17Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_17Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.pd_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_NAME_STR);
                    reqCommand.his_max_per_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_HIS_MAX_PER_NAV_FLOAT);
                    reqCommand.crncy_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CRNCY_TYPE_STR);
                    FuncprodL_1_17Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_17Models;
        }
 
        //逻辑_产品_账户_查询产品限制信息
        public static List<FuncprodL_1_24Model> GetFuncprodL_1_24Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_24Models = new List<FuncprodL_1_24Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_24Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.cost_calc_type = packer.GetIntbyName("cost_calc_type", i);
                reqCommand.allow_exch = packer.GetStrbyName("allow_exch", i);
                reqCommand.allow_stock_type = packer.GetStrbyName("allow_stock_type", i);
                reqCommand.busi_config_str = packer.GetStrbyName("busi_config_str", i);
                reqCommand.comm_appr_oper = packer.GetIntbyName("comm_appr_oper", i);
                reqCommand.market_price_ratio = packer.GetDoublebyName("market_price_ratio", i);
                reqCommand.forbid_order_dir = packer.GetStrbyName("forbid_order_dir", i);
                reqCommand.pd_status = packer.GetStrbyName("pd_status", i);
                reqCommand.comm_no_limit_price_ratio = packer.GetDoublebyName("comm_no_limit_price_ratio", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncprodL_1_24Models.Add(reqCommand);
            }
            return FuncprodL_1_24Models;
        }
 
        //逻辑_产品_账户_查询产品限制信息
        public static List<FuncprodL_1_24Model> GetFuncprodL_1_24Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_24Models = new List<FuncprodL_1_24Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_24Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.cost_calc_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COST_CALC_TYPE_INT);
                    reqCommand.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    reqCommand.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    reqCommand.busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR);
                    reqCommand.comm_appr_oper = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_COMM_APPR_OPER_INT);
                    reqCommand.market_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT);
                    reqCommand.forbid_order_dir = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_FORBID_ORDER_DIR_STR);
                    reqCommand.pd_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_STATUS_STR);
                    reqCommand.comm_no_limit_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_COMM_NO_LIMIT_PRICE_RATIO_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncprodL_1_24Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_24Models;
        }
 
        //逻辑_产品_账户_查询产品限制信息流水
        public static List<FuncprodL_1_25Model> GetFuncprodL_1_25Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_25Models = new List<FuncprodL_1_25Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_25Model();
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
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncprodL_1_25Models.Add(reqCommand);
            }
            return FuncprodL_1_25Models;
        }
 
        //逻辑_产品_账户_查询产品限制信息流水
        public static List<FuncprodL_1_25Model> GetFuncprodL_1_25Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_25Models = new List<FuncprodL_1_25Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_25Model();
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
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncprodL_1_25Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_25Models;
        }
 
        //逻辑_产品_账户_查询历史产品限制信息流水
        public static List<FuncprodL_1_26Model> GetFuncprodL_1_26Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_26Models = new List<FuncprodL_1_26Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_26Model();
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
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncprodL_1_26Models.Add(reqCommand);
            }
            return FuncprodL_1_26Models;
        }
 
        //逻辑_产品_账户_查询历史产品限制信息流水
        public static List<FuncprodL_1_26Model> GetFuncprodL_1_26Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_26Models = new List<FuncprodL_1_26Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_26Model();
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
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncprodL_1_26Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_26Models;
        }
 
        //逻辑_产品_账户_新增银行账户信息
        public static List<FuncprodL_1_31Model> GetFuncprodL_1_31Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_31Models = new List<FuncprodL_1_31Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_31Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.bank_acco_no = packer.GetIntbyName("bank_acco_no", i);
 
                FuncprodL_1_31Models.Add(reqCommand);
            }
            return FuncprodL_1_31Models;
        }
 
        //逻辑_产品_账户_新增银行账户信息
        public static List<FuncprodL_1_31Model> GetFuncprodL_1_31Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_31Models = new List<FuncprodL_1_31Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_1_31Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.bank_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_NO_INT);
                FuncprodL_1_31Models.Add(reqCommand);
            }
            return FuncprodL_1_31Models;
        }
 
        //逻辑_产品_账户_查询银行账户信息
        public static List<FuncprodL_1_34Model> GetFuncprodL_1_34Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_34Models = new List<FuncprodL_1_34Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_34Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.bank_acco_no = packer.GetIntbyName("bank_acco_no", i);
                reqCommand.bank_code = packer.GetStrbyName("bank_code", i);
                reqCommand.bank_name = packer.GetStrbyName("bank_name", i);
                reqCommand.bank_acco = packer.GetStrbyName("bank_acco", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncprodL_1_34Models.Add(reqCommand);
            }
            return FuncprodL_1_34Models;
        }
 
        //逻辑_产品_账户_查询银行账户信息
        public static List<FuncprodL_1_34Model> GetFuncprodL_1_34Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_34Models = new List<FuncprodL_1_34Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_34Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.bank_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_NO_INT);
                    reqCommand.bank_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_CODE_STR);
                    reqCommand.bank_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_NAME_STR);
                    reqCommand.bank_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncprodL_1_34Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_34Models;
        }
 
        //逻辑_产品_账户_查询银行账户信息流水
        public static List<FuncprodL_1_35Model> GetFuncprodL_1_35Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_35Models = new List<FuncprodL_1_35Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_35Model();
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
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.bank_acco_no = packer.GetIntbyName("bank_acco_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncprodL_1_35Models.Add(reqCommand);
            }
            return FuncprodL_1_35Models;
        }
 
        //逻辑_产品_账户_查询银行账户信息流水
        public static List<FuncprodL_1_35Model> GetFuncprodL_1_35Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_35Models = new List<FuncprodL_1_35Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_35Model();
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
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.bank_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncprodL_1_35Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_35Models;
        }
 
        //逻辑_产品_账户_查询历史银行账户信息流水
        public static List<FuncprodL_1_36Model> GetFuncprodL_1_36Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_36Models = new List<FuncprodL_1_36Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_36Model();
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
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.bank_acco_no = packer.GetIntbyName("bank_acco_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncprodL_1_36Models.Add(reqCommand);
            }
            return FuncprodL_1_36Models;
        }
 
        //逻辑_产品_账户_查询历史银行账户信息流水
        public static List<FuncprodL_1_36Model> GetFuncprodL_1_36Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_36Models = new List<FuncprodL_1_36Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_36Model();
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
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.bank_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BANK_ACCO_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncprodL_1_36Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_36Models;
        }
 
        //逻辑_产品_账户_新增资产账户信息
        public static List<FuncprodL_1_41Model> GetFuncprodL_1_41Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_41Models = new List<FuncprodL_1_41Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_41Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
 
                FuncprodL_1_41Models.Add(reqCommand);
            }
            return FuncprodL_1_41Models;
        }
 
        //逻辑_产品_账户_新增资产账户信息
        public static List<FuncprodL_1_41Model> GetFuncprodL_1_41Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_41Models = new List<FuncprodL_1_41Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_1_41Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                FuncprodL_1_41Models.Add(reqCommand);
            }
            return FuncprodL_1_41Models;
        }
 
        //逻辑_产品_账户_查询资产账户信息
        public static List<FuncprodL_1_44Model> GetFuncprodL_1_44Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_44Models = new List<FuncprodL_1_44Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_44Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.asset_acco_name = packer.GetStrbyName("asset_acco_name", i);
                reqCommand.asset_acco_type = packer.GetIntbyName("asset_acco_type", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.trade_pwd = packer.GetStrbyName("trade_pwd", i);
                reqCommand.asset_acco_status = packer.GetStrbyName("asset_acco_status", i);
                reqCommand.busi_config_str = packer.GetStrbyName("busi_config_str", i);
                reqCommand.market_price_ratio = packer.GetDoublebyName("market_price_ratio", i);
                reqCommand.allow_exch = packer.GetStrbyName("allow_exch", i);
                reqCommand.allow_stock_type = packer.GetStrbyName("allow_stock_type", i);
                reqCommand.split_fee_typr_str = packer.GetStrbyName("split_fee_typr_str", i);
                reqCommand.busi_limit_str = packer.GetStrbyName("busi_limit_str", i);
                reqCommand.exter_comm_flag = packer.GetIntbyName("exter_comm_flag", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
                reqCommand.busi_depart = packer.GetStrbyName("busi_depart", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
 
                FuncprodL_1_44Models.Add(reqCommand);
            }
            return FuncprodL_1_44Models;
        }
 
        //逻辑_产品_账户_查询资产账户信息
        public static List<FuncprodL_1_44Model> GetFuncprodL_1_44Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_44Models = new List<FuncprodL_1_44Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_44Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.asset_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NAME_STR);
                    reqCommand.asset_acco_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_TYPE_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.trade_pwd = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_PWD_STR);
                    reqCommand.asset_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STATUS_STR);
                    reqCommand.busi_config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_CONFIG_STR_STR);
                    reqCommand.market_price_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARKET_PRICE_RATIO_FLOAT);
                    reqCommand.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    reqCommand.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    reqCommand.split_fee_typr_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_SPLIT_FEE_TYPR_STR_STR);
                    reqCommand.busi_limit_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_LIMIT_STR_STR);
                    reqCommand.exter_comm_flag = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXTER_COMM_FLAG_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    reqCommand.busi_depart = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_BUSI_DEPART_STR);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    FuncprodL_1_44Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_44Models;
        }
 
        //逻辑_产品_账户_查询资产账户信息流水
        public static List<FuncprodL_1_45Model> GetFuncprodL_1_45Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_45Models = new List<FuncprodL_1_45Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_45Model();
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
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncprodL_1_45Models.Add(reqCommand);
            }
            return FuncprodL_1_45Models;
        }
 
        //逻辑_产品_账户_查询资产账户信息流水
        public static List<FuncprodL_1_45Model> GetFuncprodL_1_45Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_45Models = new List<FuncprodL_1_45Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_45Model();
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
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncprodL_1_45Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_45Models;
        }
 
        //逻辑_产品_账户_查询历史资产账户信息流水
        public static List<FuncprodL_1_46Model> GetFuncprodL_1_46Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_46Models = new List<FuncprodL_1_46Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_46Model();
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
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
                reqCommand.oper_remark_info = packer.GetStrbyName("oper_remark_info", i);
 
                FuncprodL_1_46Models.Add(reqCommand);
            }
            return FuncprodL_1_46Models;
        }
 
        //逻辑_产品_账户_查询历史资产账户信息流水
        public static List<FuncprodL_1_46Model> GetFuncprodL_1_46Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_46Models = new List<FuncprodL_1_46Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_46Model();
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
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    reqCommand.oper_remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPER_REMARK_INFO_STR);
                    FuncprodL_1_46Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_46Models;
        }
 
        //逻辑_产品_账户_查询资产账户列表
        public static List<FuncprodL_1_51Model> GetFuncprodL_1_51Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_51Models = new List<FuncprodL_1_51Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_51Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
                reqCommand.asset_acco_name = packer.GetStrbyName("asset_acco_name", i);
                reqCommand.asset_acco_status = packer.GetStrbyName("asset_acco_status", i);
 
                FuncprodL_1_51Models.Add(reqCommand);
            }
            return FuncprodL_1_51Models;
        }
 
        //逻辑_产品_账户_查询资产账户列表
        public static List<FuncprodL_1_51Model> GetFuncprodL_1_51Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_51Models = new List<FuncprodL_1_51Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_51Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                    reqCommand.asset_acco_name = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NAME_STR);
                    reqCommand.asset_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STATUS_STR);
                    FuncprodL_1_51Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_51Models;
        }
 
        //逻辑_产品_账户_更新资产账户在线状态
        public static List<FuncprodL_1_52Model> GetFuncprodL_1_52Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_52Models = new List<FuncprodL_1_52Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_52Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.online_status = packer.GetIntbyName("online_status", i);
 
                FuncprodL_1_52Models.Add(reqCommand);
            }
            return FuncprodL_1_52Models;
        }
 
        //逻辑_产品_账户_更新资产账户在线状态
        public static List<FuncprodL_1_52Model> GetFuncprodL_1_52Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_52Models = new List<FuncprodL_1_52Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_1_52Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                reqCommand.online_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT);
                FuncprodL_1_52Models.Add(reqCommand);
            }
            return FuncprodL_1_52Models;
        }
 
        //逻辑_产品_账户_查询资产账户通道信息
        public static List<FuncprodL_1_74Model> GetFuncprodL_1_74Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_74Models = new List<FuncprodL_1_74Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_74Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_code = packer.GetStrbyName("pd_code", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pass_type = packer.GetIntbyName("pass_type", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.online_status = packer.GetIntbyName("online_status", i);
                reqCommand.config_str = packer.GetStrbyName("config_str", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncprodL_1_74Models.Add(reqCommand);
            }
            return FuncprodL_1_74Models;
        }
 
        //逻辑_产品_账户_查询资产账户通道信息
        public static List<FuncprodL_1_74Model> GetFuncprodL_1_74Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_74Models = new List<FuncprodL_1_74Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_74Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_code = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_PD_CODE_STR);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pass_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_TYPE_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.online_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT);
                    reqCommand.config_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_CONFIG_STR_STR);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncprodL_1_74Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_74Models;
        }
 
        //逻辑_产品_账户_获取产品最大单位净值
        public static List<FuncprodL_1_75Model> GetFuncprodL_1_75Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_75Models = new List<FuncprodL_1_75Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_75Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_part_nav = packer.GetDoublebyName("pd_part_nav", i);
 
                FuncprodL_1_75Models.Add(reqCommand);
            }
            return FuncprodL_1_75Models;
        }
 
        //逻辑_产品_账户_获取产品最大单位净值
        public static List<FuncprodL_1_75Model> GetFuncprodL_1_75Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_75Models = new List<FuncprodL_1_75Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_1_75Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pd_part_nav = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_PD_PART_NAV_FLOAT);
                FuncprodL_1_75Models.Add(reqCommand);
            }
            return FuncprodL_1_75Models;
        }
 
        //逻辑_产品_账户_获取产品最大净值
        public static List<FuncprodL_1_76Model> GetFuncprodL_1_76Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_76Models = new List<FuncprodL_1_76Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_76Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.nav_asset = packer.GetDoublebyName("nav_asset", i);
 
                FuncprodL_1_76Models.Add(reqCommand);
            }
            return FuncprodL_1_76Models;
        }
 
        //逻辑_产品_账户_获取产品最大净值
        public static List<FuncprodL_1_76Model> GetFuncprodL_1_76Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_76Models = new List<FuncprodL_1_76Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_1_76Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.nav_asset = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_NAV_ASSET_FLOAT);
                FuncprodL_1_76Models.Add(reqCommand);
            }
            return FuncprodL_1_76Models;
        }
 
        //逻辑_产品_账户_资产账户编号获取资产账户
        public static List<FuncprodL_1_77Model> GetFuncprodL_1_77Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_77Models = new List<FuncprodL_1_77Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_77Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.asset_acco = packer.GetStrbyName("asset_acco", i);
 
                FuncprodL_1_77Models.Add(reqCommand);
            }
            return FuncprodL_1_77Models;
        }
 
        //逻辑_产品_账户_资产账户编号获取资产账户
        public static List<FuncprodL_1_77Model> GetFuncprodL_1_77Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_77Models = new List<FuncprodL_1_77Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_1_77Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.asset_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STR);
                FuncprodL_1_77Models.Add(reqCommand);
            }
            return FuncprodL_1_77Models;
        }
 
        //逻辑_产品_账户_查询产品份额变动流水
        public static List<FuncprodL_1_78Model> GetFuncprodL_1_78Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_78Models = new List<FuncprodL_1_78Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_78Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
 
                FuncprodL_1_78Models.Add(reqCommand);
            }
            return FuncprodL_1_78Models;
        }
 
        //逻辑_产品_账户_查询产品份额变动流水
        public static List<FuncprodL_1_78Model> GetFuncprodL_1_78Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_78Models = new List<FuncprodL_1_78Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_78Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    FuncprodL_1_78Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_78Models;
        }
 
        //逻辑_产品_账户_查询产品份额变动流水历史
        public static List<FuncprodL_1_79Model> GetFuncprodL_1_79Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_79Models = new List<FuncprodL_1_79Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_79Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.init_date = packer.GetIntbyName("init_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.jour_occur_field = packer.GetStrbyName("jour_occur_field", i);
                reqCommand.jour_after_occur_info = packer.GetStrbyName("jour_after_occur_info", i);
 
                FuncprodL_1_79Models.Add(reqCommand);
            }
            return FuncprodL_1_79Models;
        }
 
        //逻辑_产品_账户_查询产品份额变动流水历史
        public static List<FuncprodL_1_79Model> GetFuncprodL_1_79Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_79Models = new List<FuncprodL_1_79Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_79Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.init_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.jour_occur_field = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_OCCUR_FIELD_STR);
                    reqCommand.jour_after_occur_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_JOUR_AFTER_OCCUR_INFO_STR);
                    FuncprodL_1_79Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_79Models;
        }
 
        //逻辑_产品_账户_查询产品工作流信息
        public static List<FuncprodL_1_82Model> GetFuncprodL_1_82Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_82Models = new List<FuncprodL_1_82Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_82Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.workflow_type = packer.GetIntbyName("workflow_type", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.workflow_num = packer.GetIntbyName("workflow_num", i);
                reqCommand.opor_no_str = packer.GetStrbyName("opor_no_str", i);
 
                FuncprodL_1_82Models.Add(reqCommand);
            }
            return FuncprodL_1_82Models;
        }
 
        //逻辑_产品_账户_查询产品工作流信息
        public static List<FuncprodL_1_82Model> GetFuncprodL_1_82Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_82Models = new List<FuncprodL_1_82Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_82Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.workflow_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WORKFLOW_TYPE_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.workflow_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WORKFLOW_NUM_INT);
                    reqCommand.opor_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_STR_STR);
                    FuncprodL_1_82Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_82Models;
        }
 
        //逻辑_产品_账户_查询账户同步信息
        public static List<FuncprodL_1_83Model> GetFuncprodL_1_83Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_83Models = new List<FuncprodL_1_83Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_83Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.asset_acco_type = packer.GetIntbyName("asset_acco_type", i);
                reqCommand.asset_acco_status = packer.GetStrbyName("asset_acco_status", i);
                reqCommand.pwd_check_status = packer.GetIntbyName("pwd_check_status", i);
                reqCommand.online_status = packer.GetIntbyName("online_status", i);
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.allow_exch = packer.GetStrbyName("allow_exch", i);
                reqCommand.allow_stock_type = packer.GetStrbyName("allow_stock_type", i);
 
                FuncprodL_1_83Models.Add(reqCommand);
            }
            return FuncprodL_1_83Models;
        }
 
        //逻辑_产品_账户_查询账户同步信息
        public static List<FuncprodL_1_83Model> GetFuncprodL_1_83Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_83Models = new List<FuncprodL_1_83Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_83Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.asset_acco_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_TYPE_INT);
                    reqCommand.asset_acco_status = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_STATUS_STR);
                    reqCommand.pwd_check_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PWD_CHECK_STATUS_INT);
                    reqCommand.online_status = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ONLINE_STATUS_INT);
                    reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                    reqCommand.allow_exch = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_EXCH_STR);
                    reqCommand.allow_stock_type = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ALLOW_STOCK_TYPE_STR);
                    FuncprodL_1_83Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_83Models;
        }
 
        //逻辑_产品_账户_获取产品工作流信息
        public static List<FuncprodL_1_85Model> GetFuncprodL_1_85Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_85Models = new List<FuncprodL_1_85Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_85Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.workflow_type = packer.GetIntbyName("workflow_type", i);
                reqCommand.workflow_num = packer.GetIntbyName("workflow_num", i);
                reqCommand.opor_no_str = packer.GetStrbyName("opor_no_str", i);
 
                FuncprodL_1_85Models.Add(reqCommand);
            }
            return FuncprodL_1_85Models;
        }
 
        //逻辑_产品_账户_获取产品工作流信息
        public static List<FuncprodL_1_85Model> GetFuncprodL_1_85Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_85Models = new List<FuncprodL_1_85Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_85Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.workflow_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WORKFLOW_TYPE_INT);
                    reqCommand.workflow_num = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_WORKFLOW_NUM_INT);
                    reqCommand.opor_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_STR_STR);
                    FuncprodL_1_85Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_85Models;
        }
 
        //逻辑_产品_账户_账户登录回报
        public static List<FuncprodL_1_86Model> GetFuncprodL_1_86Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_86Models = new List<FuncprodL_1_86Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_86Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pass_no = packer.GetIntbyName("pass_no", i);
                reqCommand.out_acco = packer.GetStrbyName("out_acco", i);
 
                FuncprodL_1_86Models.Add(reqCommand);
            }
            return FuncprodL_1_86Models;
        }
 
        //逻辑_产品_账户_账户登录回报
        public static List<FuncprodL_1_86Model> GetFuncprodL_1_86Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_86Models = new List<FuncprodL_1_86Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_1_86Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pass_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PASS_NO_INT);
                reqCommand.out_acco = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_OUT_ACCO_STR);
                FuncprodL_1_86Models.Add(reqCommand);
            }
            return FuncprodL_1_86Models;
        }
 
        //逻辑_产品_账户_查询开盘检查流程
        public static List<FuncprodL_1_89Model> GetFuncprodL_1_89Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_89Models = new List<FuncprodL_1_89Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_89Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.execute_type = packer.GetIntbyName("execute_type", i);
                reqCommand.init_step = packer.GetIntbyName("init_step", i);
                reqCommand.begin_time = packer.GetIntbyName("begin_time", i);
                reqCommand.exec_time = packer.GetIntbyName("exec_time", i);
                reqCommand.exec_date = packer.GetIntbyName("exec_date", i);
                reqCommand.open_execute_type = packer.GetIntbyName("open_execute_type", i);
                reqCommand.open_execute_result = packer.GetIntbyName("open_execute_result", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncprodL_1_89Models.Add(reqCommand);
            }
            return FuncprodL_1_89Models;
        }
 
        //逻辑_产品_账户_查询开盘检查流程
        public static List<FuncprodL_1_89Model> GetFuncprodL_1_89Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_89Models = new List<FuncprodL_1_89Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_89Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.execute_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXECUTE_TYPE_INT);
                    reqCommand.init_step = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_STEP_INT);
                    reqCommand.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    reqCommand.exec_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT);
                    reqCommand.exec_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT);
                    reqCommand.open_execute_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_EXECUTE_TYPE_INT);
                    reqCommand.open_execute_result = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_EXECUTE_RESULT_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncprodL_1_89Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_89Models;
        }
 
        //逻辑_产品_账户_获取开盘检查流程
        public static List<FuncprodL_1_90Model> GetFuncprodL_1_90Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_90Models = new List<FuncprodL_1_90Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_90Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.execute_type = packer.GetIntbyName("execute_type", i);
                reqCommand.init_step = packer.GetIntbyName("init_step", i);
                reqCommand.begin_time = packer.GetIntbyName("begin_time", i);
                reqCommand.exec_time = packer.GetIntbyName("exec_time", i);
                reqCommand.exec_date = packer.GetIntbyName("exec_date", i);
                reqCommand.open_execute_type = packer.GetIntbyName("open_execute_type", i);
                reqCommand.open_execute_result = packer.GetIntbyName("open_execute_result", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncprodL_1_90Models.Add(reqCommand);
            }
            return FuncprodL_1_90Models;
        }
 
        //逻辑_产品_账户_获取开盘检查流程
        public static List<FuncprodL_1_90Model> GetFuncprodL_1_90Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_90Models = new List<FuncprodL_1_90Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_90Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.execute_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXECUTE_TYPE_INT);
                    reqCommand.init_step = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_INIT_STEP_INT);
                    reqCommand.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    reqCommand.exec_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT);
                    reqCommand.exec_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT);
                    reqCommand.open_execute_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_EXECUTE_TYPE_INT);
                    reqCommand.open_execute_result = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPEN_EXECUTE_RESULT_INT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncprodL_1_90Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_90Models;
        }
 
        //逻辑_产品_账户_查询收盘作业流程
        public static List<FuncprodL_1_91Model> GetFuncprodL_1_91Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_91Models = new List<FuncprodL_1_91Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_91Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.opor_no = packer.GetIntbyName("opor_no", i);
                reqCommand.flow_business = packer.GetIntbyName("flow_business", i);
                reqCommand.execute_type = packer.GetIntbyName("execute_type", i);
                reqCommand.begin_time = packer.GetIntbyName("begin_time", i);
                reqCommand.exec_date = packer.GetIntbyName("exec_date", i);
                reqCommand.exec_time = packer.GetIntbyName("exec_time", i);
                reqCommand.close_execute_type = packer.GetIntbyName("close_execute_type", i);
                reqCommand.error_deal_type = packer.GetIntbyName("error_deal_type", i);
 
                FuncprodL_1_91Models.Add(reqCommand);
            }
            return FuncprodL_1_91Models;
        }
 
        //逻辑_产品_账户_查询收盘作业流程
        public static List<FuncprodL_1_91Model> GetFuncprodL_1_91Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_91Models = new List<FuncprodL_1_91Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_91Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.opor_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_OPOR_NO_INT);
                    reqCommand.flow_business = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FLOW_BUSINESS_INT);
                    reqCommand.execute_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXECUTE_TYPE_INT);
                    reqCommand.begin_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_BEGIN_TIME_INT);
                    reqCommand.exec_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_DATE_INT);
                    reqCommand.exec_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXEC_TIME_INT);
                    reqCommand.close_execute_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_EXECUTE_TYPE_INT);
                    reqCommand.error_deal_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ERROR_DEAL_TYPE_INT);
                    FuncprodL_1_91Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_91Models;
        }
 
        //逻辑_产品_账户_查询产品关系
        public static List<FuncprodL_1_103Model> GetFuncprodL_1_103Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_103Models = new List<FuncprodL_1_103Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_103Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.create_date = packer.GetIntbyName("create_date", i);
                reqCommand.create_time = packer.GetIntbyName("create_time", i);
                reqCommand.update_date = packer.GetIntbyName("update_date", i);
                reqCommand.update_time = packer.GetIntbyName("update_time", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.mum_pd_no = packer.GetIntbyName("mum_pd_no", i);
 
                FuncprodL_1_103Models.Add(reqCommand);
            }
            return FuncprodL_1_103Models;
        }
 
        //逻辑_产品_账户_查询产品关系
        public static List<FuncprodL_1_103Model> GetFuncprodL_1_103Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_103Models = new List<FuncprodL_1_103Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_103Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.create_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_DATE_INT);
                    reqCommand.create_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CREATE_TIME_INT);
                    reqCommand.update_date = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_DATE_INT);
                    reqCommand.update_time = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_UPDATE_TIME_INT);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.mum_pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_MUM_PD_NO_INT);
                    FuncprodL_1_103Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_103Models;
        }
 
        //逻辑_产品_账户_获取注销资产账户串
        public static List<FuncprodL_1_104Model> GetFuncprodL_1_104Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_104Models = new List<FuncprodL_1_104Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_104Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.asset_acco_no_str = packer.GetStrbyName("asset_acco_no_str", i);
 
                FuncprodL_1_104Models.Add(reqCommand);
            }
            return FuncprodL_1_104Models;
        }
 
        //逻辑_产品_账户_获取注销资产账户串
        public static List<FuncprodL_1_104Model> GetFuncprodL_1_104Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_104Models = new List<FuncprodL_1_104Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_1_104Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.asset_acco_no_str = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_STR_STR);
                FuncprodL_1_104Models.Add(reqCommand);
            }
            return FuncprodL_1_104Models;
        }
 
        //逻辑_产品_账户_新增融资融券配置表
        public static List<FuncprodL_1_105Model> GetFuncprodL_1_105Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_105Models = new List<FuncprodL_1_105Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_105Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
 
                FuncprodL_1_105Models.Add(reqCommand);
            }
            return FuncprodL_1_105Models;
        }
 
        //逻辑_产品_账户_新增融资融券配置表
        public static List<FuncprodL_1_105Model> GetFuncprodL_1_105Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_105Models = new List<FuncprodL_1_105Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_1_105Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                FuncprodL_1_105Models.Add(reqCommand);
            }
            return FuncprodL_1_105Models;
        }
 
        //逻辑_产品_账户_查询融资融券配置表
        public static List<FuncprodL_1_108Model> GetFuncprodL_1_108Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_108Models = new List<FuncprodL_1_108Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_108Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.fina_return_type = packer.GetIntbyName("fina_return_type", i);
                reqCommand.sell_auto_back_debt = packer.GetIntbyName("sell_auto_back_debt", i);
                reqCommand.fina_limit_max = packer.GetDoublebyName("fina_limit_max", i);
                reqCommand.loan_limit_max = packer.GetDoublebyName("loan_limit_max", i);
                reqCommand.fina_year_intrst_rate = packer.GetDoublebyName("fina_year_intrst_rate", i);
                reqCommand.secu_loan_year_intrst_rate = packer.GetDoublebyName("secu_loan_year_intrst_rate", i);
                reqCommand.close_posi_keep_guarantee_ratio = packer.GetDoublebyName("close_posi_keep_guarantee_ratio", i);
                reqCommand.fill_posi_keep_guarantee_ratio = packer.GetDoublebyName("fill_posi_keep_guarantee_ratio", i);
                reqCommand.extract_guarantee_ratio = packer.GetDoublebyName("extract_guarantee_ratio", i);
                reqCommand.remark_info = packer.GetStrbyName("remark_info", i);
 
                FuncprodL_1_108Models.Add(reqCommand);
            }
            return FuncprodL_1_108Models;
        }
 
        //逻辑_产品_账户_查询融资融券配置表
        public static List<FuncprodL_1_108Model> GetFuncprodL_1_108Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_108Models = new List<FuncprodL_1_108Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_108Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.fina_return_type = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_FINA_RETURN_TYPE_INT);
                    reqCommand.sell_auto_back_debt = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_SELL_AUTO_BACK_DEBT_INT);
                    reqCommand.fina_limit_max = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_LIMIT_MAX_FLOAT);
                    reqCommand.loan_limit_max = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_LOAN_LIMIT_MAX_FLOAT);
                    reqCommand.fina_year_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FINA_YEAR_INTRST_RATE_FLOAT);
                    reqCommand.secu_loan_year_intrst_rate = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SECU_LOAN_YEAR_INTRST_RATE_FLOAT);
                    reqCommand.close_posi_keep_guarantee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_CLOSE_POSI_KEEP_GUARANTEE_RATIO_FLOAT);
                    reqCommand.fill_posi_keep_guarantee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_FILL_POSI_KEEP_GUARANTEE_RATIO_FLOAT);
                    reqCommand.extract_guarantee_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_EXTRACT_GUARANTEE_RATIO_FLOAT);
                    reqCommand.remark_info = lpRecord.GetString(LDBizTagDefine.LDBizTag.LDBIZ_REMARK_INFO_STR);
                    FuncprodL_1_108Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_108Models;
        }
 
        //逻辑_产品_账户_查询资产账户默认交易组信息
        public static List<FuncprodL_1_109Model> GetFuncprodL_1_109Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_109Models = new List<FuncprodL_1_109Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_109Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.row_id = packer.GetInt64byName("row_id", i);
                reqCommand.co_no = packer.GetIntbyName("co_no", i);
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
                reqCommand.asset_acco_no = packer.GetIntbyName("asset_acco_no", i);
                reqCommand.exch_group_no = packer.GetIntbyName("exch_group_no", i);
 
                FuncprodL_1_109Models.Add(reqCommand);
            }
            return FuncprodL_1_109Models;
        }
 
        //逻辑_产品_账户_查询资产账户默认交易组信息
        public static List<FuncprodL_1_109Model> GetFuncprodL_1_109Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_109Models = new List<FuncprodL_1_109Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_109Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.row_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_ROW_ID_INT64);
                    reqCommand.co_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_CO_NO_INT);
                    reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                    reqCommand.asset_acco_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_ASSET_ACCO_NO_INT);
                    reqCommand.exch_group_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_EXCH_GROUP_NO_INT);
                    FuncprodL_1_109Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_109Models;
        }
 
        //逻辑_产品_账户_导入产品信息
        public static List<FuncprodL_1_112Model> GetFuncprodL_1_112Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_112Models = new List<FuncprodL_1_112Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_112Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.pd_no = packer.GetIntbyName("pd_no", i);
 
                FuncprodL_1_112Models.Add(reqCommand);
            }
            return FuncprodL_1_112Models;
        }
 
        //逻辑_产品_账户_导入产品信息
        public static List<FuncprodL_1_112Model> GetFuncprodL_1_112Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_112Models = new List<FuncprodL_1_112Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_1_112Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.pd_no = lpRecord.GetInt32(LDBizTagDefine.LDBizTag.LDBIZ_PD_NO_INT);
                FuncprodL_1_112Models.Add(reqCommand);
            }
            return FuncprodL_1_112Models;
        }
 
        //逻辑_产品_账户_获取保证金比例
        public static List<FuncprodL_1_116Model> GetFuncprodL_1_116Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_116Models = new List<FuncprodL_1_116Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_116Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.margin_ratio = packer.GetDoublebyName("margin_ratio", i);
 
                FuncprodL_1_116Models.Add(reqCommand);
            }
            return FuncprodL_1_116Models;
        }
 
        //逻辑_产品_账户_获取保证金比例
        public static List<FuncprodL_1_116Model> GetFuncprodL_1_116Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_116Models = new List<FuncprodL_1_116Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_1_116Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.margin_ratio = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_MARGIN_RATIO_FLOAT);
                FuncprodL_1_116Models.Add(reqCommand);
            }
            return FuncprodL_1_116Models;
        }
 
        //逻辑_产品_账户_计算证券订单费用
        public static List<FuncprodL_1_117Model> GetFuncprodL_1_117Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_117Models = new List<FuncprodL_1_117Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_117Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.trade_tax = packer.GetDoublebyName("trade_tax", i);
                reqCommand.trade_cost_fee = packer.GetDoublebyName("trade_cost_fee", i);
                reqCommand.trade_system_use_fee = packer.GetDoublebyName("trade_system_use_fee", i);
                reqCommand.stock_settle_fee = packer.GetDoublebyName("stock_settle_fee", i);
                reqCommand.order_frozen_amt = packer.GetDoublebyName("order_frozen_amt", i);
 
                FuncprodL_1_117Models.Add(reqCommand);
            }
            return FuncprodL_1_117Models;
        }
 
        //逻辑_产品_账户_计算证券订单费用
        public static List<FuncprodL_1_117Model> GetFuncprodL_1_117Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_117Models = new List<FuncprodL_1_117Model>();
            var lpRecord = fastMsg.GetBizBodyRecord();
            if (lpRecord != null)
            {
                var reqCommand = new FuncprodL_1_117Model();
                reqCommand.OperatorID = req.OperatorID;//固定行
                reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                reqCommand.trade_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_TAX_FLOAT);
                reqCommand.trade_cost_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COST_FEE_FLOAT);
                reqCommand.trade_system_use_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
                reqCommand.stock_settle_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_SETTLE_FEE_FLOAT);
                reqCommand.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                FuncprodL_1_117Models.Add(reqCommand);
            }
            return FuncprodL_1_117Models;
        }
 
        //逻辑_产品_账户_批量计算证券订单费用
        public static List<FuncprodL_1_118Model> GetFuncprodL_1_118Models(ReqBaseDTO req, LDsdkDefine.LDPackerAdapter packer)
        {
            var FuncprodL_1_118Models = new List<FuncprodL_1_118Model>();
            var rowCount = packer.GetRowCount();
            for (int i = 0; i < rowCount; i++)
            {
                var reqCommand = new FuncprodL_1_118Model();
                reqCommand.OperatorID = req.OperatorID;
                reqCommand.corrsp_id = packer.GetInt64byName("corrsp_id", i);
                reqCommand.trade_commis = packer.GetDoublebyName("trade_commis", i);
                reqCommand.all_fee = packer.GetDoublebyName("all_fee", i);
                reqCommand.stamp_tax = packer.GetDoublebyName("stamp_tax", i);
                reqCommand.trans_fee = packer.GetDoublebyName("trans_fee", i);
                reqCommand.brkage_fee = packer.GetDoublebyName("brkage_fee", i);
                reqCommand.SEC_charges = packer.GetDoublebyName("SEC_charges", i);
                reqCommand.other_fee = packer.GetDoublebyName("other_fee", i);
                reqCommand.other_commis = packer.GetDoublebyName("other_commis", i);
                reqCommand.trade_tax = packer.GetDoublebyName("trade_tax", i);
                reqCommand.trade_cost_fee = packer.GetDoublebyName("trade_cost_fee", i);
                reqCommand.trade_system_use_fee = packer.GetDoublebyName("trade_system_use_fee", i);
                reqCommand.stock_settle_fee = packer.GetDoublebyName("stock_settle_fee", i);
                reqCommand.order_frozen_amt = packer.GetDoublebyName("order_frozen_amt", i);
 
                FuncprodL_1_118Models.Add(reqCommand);
            }
            return FuncprodL_1_118Models;
        }
 
        //逻辑_产品_账户_批量计算证券订单费用
        public static List<FuncprodL_1_118Model> GetFuncprodL_1_118Models(ReqBaseDTO req, LDsdkDefineEx.LDFastMessageAdapter fastMsg)
        {
            var FuncprodL_1_118Models = new List<FuncprodL_1_118Model>();
            LDsdkDefineEx.LDGroupAdapter lpGroup = fastMsg.GetGroup(LDBizTagDefine.LDSdkTag.LDTAG_NO_RESULTSET);
            if (lpGroup != null)
            {
                var rowCount = lpGroup.GetRecordCount();
                for (int i = 0; i < rowCount; i++)
                {
                    var reqCommand = new FuncprodL_1_118Model();
                    var lpRecord =lpGroup.GetRecord(i);
                    reqCommand.OperatorID = req.OperatorID;
                    reqCommand.corrsp_id = lpRecord.GetInt64(LDBizTagDefine.LDBizTag.LDBIZ_CORRSP_ID_INT64);
                    reqCommand.trade_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COMMIS_FLOAT);
                    reqCommand.all_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ALL_FEE_FLOAT);
                    reqCommand.stamp_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STAMP_TAX_FLOAT);
                    reqCommand.trans_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRANS_FEE_FLOAT);
                    reqCommand.brkage_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_BRKAGE_FEE_FLOAT);
                    reqCommand.SEC_charges = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_SEC_CHARGES_FLOAT);
                    reqCommand.other_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_FEE_FLOAT);
                    reqCommand.other_commis = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_OTHER_COMMIS_FLOAT);
                    reqCommand.trade_tax = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_TAX_FLOAT);
                    reqCommand.trade_cost_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_COST_FEE_FLOAT);
                    reqCommand.trade_system_use_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_TRADE_SYSTEM_USE_FEE_FLOAT);
                    reqCommand.stock_settle_fee = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_STOCK_SETTLE_FEE_FLOAT);
                    reqCommand.order_frozen_amt = lpRecord.GetDouble(LDBizTagDefine.LDBizTag.LDBIZ_ORDER_FROZEN_AMT_FLOAT);
                    FuncprodL_1_118Models.Add(reqCommand);
                }
            }
            return FuncprodL_1_118Models;
        }
 
    }
}
